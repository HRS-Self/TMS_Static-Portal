import { NextRequest, NextResponse } from 'next/server';

import { getEnv } from '@/src/config/env.server';
import {
  buildIdpLoginUrl,
  resolveIdpToken,
  verifyCallbackSignature,
} from '@/src/server/auth/idp';
import {
  applyPortalSessionCookie,
  readPortalSession,
} from '@/src/server/auth/session';
import type { AuthSession, IdpCallbackPayload } from '@/src/server/auth/types';
import { ensureBackendUserIds } from '@/src/server/backend/backend-user-ids';
import { logger } from '@/src/server/logger';
import { warmBackendPermissionCache } from '@/src/server/permissions/backend-permissions';
import { hydrateSurfaceCapabilities } from '@/src/server/permissions/surface-capabilities';

export const dynamic = 'force-dynamic';

export async function POST(request: NextRequest) {
  const returnUrl = request.nextUrl.searchParams.get('returnUrl') ?? '/entity';

  logger.debug('IDP callback received', { returnUrl });

  try {
    const body = await request.text();
    logger.debug('IDP callback body read', { hasBody: Boolean(body) });
    const params = parseFormBody(body);

    if (!params) {
      logger.error('IDP callback received empty or unparseable body');
      return NextResponse.redirect(new URL(buildIdpLoginUrl(returnUrl)), 302);
    }

    const { clientId, token, timestamp, sign, expiry } = params;

    const verification = verifyCallbackSignature(
      clientId,
      token,
      timestamp,
      sign,
    );

    logger.debug('IDP callback signature verification', {
      valid: verification.valid,
      reason: verification.reason ?? null,
    });

    if (!verification.valid) {
      logger.warn('IDP callback signature verification failed', {
        reason: verification.reason,
      });
      return NextResponse.redirect(new URL(buildIdpLoginUrl(returnUrl)), 302);
    }

    const resolved = await resolveIdpToken(token);

    if (!resolved) {
      logger.warn('IDP token resolution failed; redirecting back to IDP');
      return NextResponse.redirect(new URL(buildIdpLoginUrl(returnUrl)), 302);
    }

    logger.info('IDP token resolved successfully', {
      userRecordKey: resolved.user.RecordKey,
    });

    const session: AuthSession = {
      userRecordKey: resolved.user.RecordKey,
      userId: 0,
      firstName: resolved.user.Firstname,
      lastName: resolved.user.Lastname,
      idpToken: resolved.token,
      expiry,
    };

    const previousSession = await readPortalSession();
    const hasBackendEntityIds =
      previousSession?.backendEntityIds &&
      Object.keys(previousSession.backendEntityIds).length > 0;
    const canCarryEntity =
      previousSession?.userRecordKey === session.userRecordKey &&
      hasBackendEntityIds &&
      typeof previousSession.entityTitle === 'string';

    const sessionWithEntity: AuthSession = canCarryEntity
      ? {
          ...session,
          backendUserIds: previousSession.backendUserIds,
          backendEntityIds: previousSession.backendEntityIds,
          entityBackends: previousSession.entityBackends,
          entityTitle: previousSession.entityTitle,
        }
      : session;

    logger.debug('IDP callback entity carryover', {
      canCarryEntity,
      carriedBackendEntityIds: sessionWithEntity.backendEntityIds ?? null,
    });

    const sessionWithBackendUserIds =
      await ensureBackendUserIds(sessionWithEntity);

    const backendPermissionIds = canCarryEntity
      ? await warmBackendPermissionCache(
          sessionWithBackendUserIds,
          sessionWithBackendUserIds.entityBackends,
        )
      : previousSession?.backendPermissionIds;

    const sessionWithPermissions: AuthSession = {
      ...sessionWithBackendUserIds,
      backendPermissionIds,
    };

    const sessionWithUserSettings = sessionWithPermissions;

    const surfaceCapabilities = canCarryEntity
      ? await hydrateSurfaceCapabilities(sessionWithUserSettings)
      : undefined;

    const nextSession: AuthSession = {
      ...sessionWithUserSettings,
      surfaceCapabilities,
    };

    const { appBaseUrl } = getEnv();
    const safePath =
      returnUrl.startsWith('/') && !returnUrl.startsWith('//')
        ? returnUrl
        : '/entity';
    logger.debug('After-login return URL sanitize', {
      input: returnUrl,
      safePath,
    });
    const afterLogin = new URL(safePath, appBaseUrl);
    afterLogin.searchParams.set('signedIn', '1');

    const response = NextResponse.redirect(afterLogin, 302);
    applyPortalSessionCookie(response, nextSession, 60 * 60 * 12);
    return response;
  } catch (error) {
    logger.error('IDP callback processing failed', {
      reason: error instanceof Error ? error.message : String(error),
    });
    return NextResponse.redirect(new URL(buildIdpLoginUrl(returnUrl)), 302);
  }
}

function parseFormBody(raw: string): IdpCallbackPayload | null {
  logger.debug('Parse IDP callback form body', { hasRaw: Boolean(raw) });
  if (!raw) return null;

  const params = new URLSearchParams(raw);
  const clientId = params.get('clientId') ?? '';
  const token = params.get('token') ?? '';
  const timestamp = params.get('timestamp') ?? '';
  const sign = params.get('sign') ?? '';
  const expiry = params.get('expiry') ?? '';
  const hasAll = Boolean(clientId && token && timestamp && sign && expiry);
  logger.debug('IDP callback form fields presence', { hasAll });
  if (!hasAll) return null;

  return { clientId, token, timestamp, sign, expiry };
}

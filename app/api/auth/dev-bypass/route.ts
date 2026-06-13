import { randomUUID } from 'node:crypto';

import { NextRequest, NextResponse } from 'next/server';

import { getEnv } from '@/src/config/env.server';
import {
  applyPortalSessionCookie,
  readPortalSession,
} from '@/src/server/auth/session';
import { ensureBackendUserIds } from '@/src/server/backend/backend-user-ids';
import type { AuthSession } from '@/src/server/auth/types';
import { logger } from '@/src/server/logger';
import { warmBackendPermissionCache } from '@/src/server/permissions/backend-permissions';
import { hydrateSurfaceCapabilities } from '@/src/server/permissions/surface-capabilities';
import { hydratePortalUserSettings } from '@/src/server/user-settings/backend';

export const dynamic = 'force-dynamic';

export async function GET(request: NextRequest) {
  const { devBypassIdp } = getEnv();

  logger.debug('Dev bypass requested', { devBypassIdp });

  if (!devBypassIdp) {
    return NextResponse.json({ error: 'Not found' }, { status: 404 });
  }

  const returnPath = request.nextUrl.searchParams.get('returnUrl') ?? '/entity';
  const safePath =
    returnPath.startsWith('/') && !returnPath.startsWith('//')
      ? returnPath
      : '/entity';
  logger.debug('Dev bypass returnUrl sanitize', { returnPath, safePath });
  const devRecordKey = 'SUPER_ADMIN';
  const devToken = randomUUID();
  const devExpiry = new Date(Date.now() + 30 * 24 * 60 * 60 * 1000).toISOString();

  const session: AuthSession = {
    userRecordKey: devRecordKey,
    userId: 0,
    firstName: 'SUPER',
    lastName: 'ADMIN',
    idpToken: devToken,
    expiry: devExpiry,
  };

  const previousSession = await readPortalSession();
  const hasBackendEntityIds =
    previousSession?.backendEntityIds &&
    Object.keys(previousSession.backendEntityIds).length > 0;
  const canCarryEntity =
    previousSession?.userRecordKey === devRecordKey &&
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

  logger.debug('Dev bypass entity carryover', {
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

  const sessionWithUserSettings = await hydratePortalUserSettings(
    sessionWithPermissions,
  );

  const surfaceCapabilities = canCarryEntity
    ? await hydrateSurfaceCapabilities(sessionWithUserSettings)
    : undefined;

  const nextSession: AuthSession = {
    ...sessionWithUserSettings,
    surfaceCapabilities,
  };

  const { appBaseUrl } = getEnv();
  const afterLogin = new URL(safePath, appBaseUrl);
  afterLogin.searchParams.set('signedIn', '1');

  const response = NextResponse.redirect(afterLogin, 302);
  const maxAge = 30 * 24 * 60 * 60;
  applyPortalSessionCookie(response, nextSession, maxAge);

  return response;
}

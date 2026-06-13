import { NextRequest, NextResponse } from 'next/server';

import { getEnv } from '@/src/config/env.server';
import { buildIdpLoginUrl } from '@/src/server/auth/idp';
import {
  applyPortalSessionCookie,
  getOptionalSession,
} from '@/src/server/auth/session';
import type { BackendEntityIds } from '@/src/server/auth/types';
import { ensureBackendUserIds } from '@/src/server/backend/backend-user-ids';
import { logger } from '@/src/server/logger';
import { warmBackendPermissionCache } from '@/src/server/permissions/backend-permissions';
import { hydrateSurfaceCapabilities } from '@/src/server/permissions/surface-capabilities';
import { hydratePortalUserSettings } from '@/src/server/user-settings/backend';

export const dynamic = 'force-dynamic';

function parseSources(raw: string | null): Array<'core' | 'gd' | 'notification'> {
  const hasRaw = Boolean(raw);
  logger.debug('Parse entity sources', { hasRaw });
  if (!raw) return [];
  try {
    const parsed = JSON.parse(raw);
    return Array.isArray(parsed)
      ? parsed.filter(
          (x): x is 'core' | 'gd' | 'notification' =>
            x === 'core' || x === 'gd' || x === 'notification',
        )
      : [];
  } catch (error) {
    logger.error('Parse entity sources failed', {
      reason: error instanceof Error ? error.message : String(error),
    });
    return [];
  }
}

function parseBackendEntityIds(raw: string | null): BackendEntityIds | undefined {
  const hasRaw = Boolean(raw);
  logger.debug('Parse backend entity ids', { hasRaw });
  if (!raw) return undefined;
  try {
    const parsed = JSON.parse(raw);
    if (typeof parsed !== 'object' || parsed === null) return undefined;
    const result: BackendEntityIds = {};
    for (const key of ['core', 'gd', 'notification'] as const) {
      if (typeof parsed[key] === 'number') {
        result[key] = parsed[key];
      }
    }
    return result;
  } catch (error) {
    logger.error('Parse backend entity ids failed', {
      reason: error instanceof Error ? error.message : String(error),
    });
    return undefined;
  }
}

export async function GET(request: NextRequest) {
  const session = await getOptionalSession();
  logger.debug('Entity select GET', { hasSession: Boolean(session) });
  if (!session) {
    return NextResponse.redirect(new URL(buildIdpLoginUrl('/entity')), 302);
  }

  const entityIdRaw = request.nextUrl.searchParams.get('entityId');
  const entityTitleRaw = request.nextUrl.searchParams.get('entityTitle') ?? '';
  const sourcesRaw = request.nextUrl.searchParams.get('sources');
  const backendEntityIdsRaw = request.nextUrl.searchParams.get('backendEntityIds');
  const returnUrl = request.nextUrl.searchParams.get('returnUrl') ?? '/entity';

  const entityId = entityIdRaw ? Number.parseInt(entityIdRaw, 10) : NaN;
  const sources = parseSources(sourcesRaw);
  const backendEntityIds = parseBackendEntityIds(backendEntityIdsRaw);

  const safeReturnUrl =
    returnUrl.startsWith('/') && !returnUrl.startsWith('//')
      ? returnUrl
      : '/entity';

  logger.debug('Entity select GET inputs', {
    hasEntityId: Boolean(entityIdRaw),
    hasEntityTitle: Boolean(entityTitleRaw),
    sourcesCount: sources.length,
    hasBackendEntityIds: Boolean(backendEntityIds),
    safeReturnUrl,
  });

  if (Number.isNaN(entityId) || !entityTitleRaw) {
    logger.debug('Decision: invalid entity selection => redirect', {
      safeReturnUrl,
    });
    const { appBaseUrl } = getEnv();
    return NextResponse.redirect(new URL(safeReturnUrl, appBaseUrl), 302);
  }

  const sessionWithEntity = {
    ...session,
    backendEntityIds,
    entityTitle: entityTitleRaw,
    entityBackends: sources,
  };

  const sessionWithBackendUserIds = await ensureBackendUserIds(
    sessionWithEntity,
    sources,
  );

  const backendPermissionIds = await warmBackendPermissionCache(
    sessionWithBackendUserIds,
    sources,
  );

  const sessionWithPermissions = {
    ...sessionWithBackendUserIds,
    backendPermissionIds,
  };

  const sessionWithUserSettings = await hydratePortalUserSettings(
    sessionWithPermissions,
  );

  const surfaceCapabilities = await hydrateSurfaceCapabilities(sessionWithUserSettings);

  const nextSession = {
    ...sessionWithUserSettings,
    surfaceCapabilities,
  };

  const { appBaseUrl } = getEnv();

  const response = NextResponse.redirect(new URL(safeReturnUrl, appBaseUrl), 302);
  applyPortalSessionCookie(response, nextSession, 60 * 60 * 12);
  return response;
}

export async function POST(request: NextRequest) {
  const session = await getOptionalSession();
  logger.debug('Entity select POST', { hasSession: Boolean(session) });

  const form = await request.formData();
  const entityIdRaw = form.get('entityId');
  const entityTitleRaw = form.get('entityTitle');
  const sourcesRaw = form.get('sources');
  const backendEntityIdsRaw = form.get('backendEntityIds');
  const returnUrlRaw = form.get('returnUrl');

  if (!session) {
    return NextResponse.redirect(new URL(buildIdpLoginUrl('/entity')), 302);
  }

  const entityId =
    typeof entityIdRaw === 'string' ? Number.parseInt(entityIdRaw, 10) : NaN;
  const entityTitle = typeof entityTitleRaw === 'string' ? entityTitleRaw : '';

  const sources = typeof sourcesRaw === 'string' ? parseSources(sourcesRaw) : [];
  const backendEntityIds =
    typeof backendEntityIdsRaw === 'string'
      ? parseBackendEntityIds(backendEntityIdsRaw)
      : undefined;
  const returnUrl = typeof returnUrlRaw === 'string' ? returnUrlRaw : '';
  const safeReturnUrl =
    returnUrl.startsWith('/') && !returnUrl.startsWith('//')
      ? returnUrl
      : '/entity';

  if (Number.isNaN(entityId) || !entityTitle) {
    logger.debug('Decision: invalid entity selection => redirect', {
      destination: safeReturnUrl,
    });
    const { appBaseUrl } = getEnv();
    return NextResponse.redirect(new URL(safeReturnUrl, appBaseUrl), 302);
  }

  const sessionWithEntity = {
    ...session,
    backendEntityIds,
    entityTitle,
    entityBackends: sources,
  };

  const sessionWithBackendUserIds = await ensureBackendUserIds(
    sessionWithEntity,
    sources,
  );

  const backendPermissionIds = await warmBackendPermissionCache(
    sessionWithBackendUserIds,
    sources,
  );

  const sessionWithPermissions = {
    ...sessionWithBackendUserIds,
    backendPermissionIds,
  };

  const sessionWithUserSettings = await hydratePortalUserSettings(
    sessionWithPermissions,
  );

  const surfaceCapabilities = await hydrateSurfaceCapabilities(sessionWithUserSettings);

  const nextSession = {
    ...sessionWithUserSettings,
    surfaceCapabilities,
  };

  const { appBaseUrl } = getEnv();

  const response = NextResponse.redirect(new URL(safeReturnUrl, appBaseUrl), 302);
  applyPortalSessionCookie(response, nextSession, 60 * 60 * 12);
  return response;
}

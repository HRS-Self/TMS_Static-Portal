import { NextRequest, NextResponse } from 'next/server';

import { getEnv } from '@/src/config/env.server';
import { buildIdpLoginUrl } from '@/src/server/auth/idp';
import {
  applyPortalSessionCookie,
  getOptionalSession,
} from '@/src/server/auth/session';
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

export async function GET(request: NextRequest) {
  const session = await getOptionalSession();
  logger.debug('Entity select GET', { hasSession: Boolean(session) });
  if (!session) {
    return NextResponse.redirect(new URL(buildIdpLoginUrl('/entity')), 302);
  }

  const entityIdRaw = request.nextUrl.searchParams.get('entityId');
  const entityTitleRaw = request.nextUrl.searchParams.get('entityTitle') ?? '';
  const sourcesRaw = request.nextUrl.searchParams.get('sources');
  const returnUrl = request.nextUrl.searchParams.get('returnUrl') ?? '/entity';

  const entityId = entityIdRaw ? Number.parseInt(entityIdRaw, 10) : NaN;
  const sources = parseSources(sourcesRaw);

  const safeReturnUrl =
    returnUrl.startsWith('/') && !returnUrl.startsWith('//')
      ? returnUrl
      : '/entity';

  logger.debug('Entity select GET inputs', {
    hasEntityId: Boolean(entityIdRaw),
    hasEntityTitle: Boolean(entityTitleRaw),
    sourcesCount: sources.length,
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
    entityId,
    entityTitle: entityTitleRaw,
    entityBackends: sources,
  };

  const backendPermissionIds = await warmBackendPermissionCache(
    sessionWithEntity,
    sources,
  );

  const sessionWithPermissions = {
    ...sessionWithEntity,
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
  const returnUrlRaw = form.get('returnUrl');

  if (!session) {
    return NextResponse.redirect(new URL(buildIdpLoginUrl('/entity')), 302);
  }

  const entityId =
    typeof entityIdRaw === 'string' ? Number.parseInt(entityIdRaw, 10) : NaN;
  const entityTitle = typeof entityTitleRaw === 'string' ? entityTitleRaw : '';

  const sources = typeof sourcesRaw === 'string' ? parseSources(sourcesRaw) : [];
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
    entityId,
    entityTitle,
    entityBackends: sources,
  };

  const backendPermissionIds = await warmBackendPermissionCache(
    sessionWithEntity,
    sources,
  );

  const sessionWithPermissions = {
    ...sessionWithEntity,
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

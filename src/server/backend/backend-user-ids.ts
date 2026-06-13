import 'server-only';

import { getEnv } from '@/src/config/env.server';
import type {
      AuthSession,
      BackendName,
      BackendUserIds,
} from '@/src/server/auth/types';
import { serverRequest } from '@/src/server/backend/http';
import { buildBasicAuthorizationHeaders } from '@/src/server/backend/request-headers';
import { logger } from '@/src/server/logger';

type ResolveKeyResponse = {
      status?: string;
      data?: {
            id?: number;
            recordKey?: string;
      };
};

const SYNCED_USER_INFO_ENTITY = 'H_AAA_Synced_UserInfo';

function getBackendGatewayBaseUrl(backend: BackendName): string {
      const env = getEnv();
      logger.debug('Get backend gateway base URL', { backend });

      switch (backend) {
            case 'gd':
                  return env.gdGatewayBaseUrl;
            case 'core':
                  return env.coreGatewayBaseUrl;
            case 'notification':
                  return env.notificationGatewayBaseUrl;
      }
}

function buildResolveKeyUrl(baseUrl: string, recordKey: string): string {
      const url = new URL(
            `${baseUrl.replace(/\/$/, '')}/api/v5-m1/dynamic-pages/ResolveKey`,
      );
      url.searchParams.set('entityName', SYNCED_USER_INFO_ENTITY);
      url.searchParams.set('recordKey', recordKey);
      return url.toString();
}

async function resolveUserIdFromBackend(
      session: AuthSession,
      backend: BackendName,
): Promise<number | undefined> {
      const gatewayBaseUrl = getBackendGatewayBaseUrl(backend);
      const url = buildResolveKeyUrl(gatewayBaseUrl, session.userRecordKey);

      const response = await serverRequest<ResolveKeyResponse>({
            backendName: `${backend}Gateway`,
            headers: buildBasicAuthorizationHeaders(),
            url,
      });

      const resolvedUserId = response.data?.id;

      logger.debug('Resolve backend user id from gateway', {
            backend,
            resolvedUserId: resolvedUserId ?? null,
      });

      return resolvedUserId;
}

async function resolveBackendUserId(
      session: AuthSession,
      backend: BackendName,
): Promise<number | undefined> {
      return resolveUserIdFromBackend(session, backend);
}

export async function resolveBackendUserIds(
      session: AuthSession,
      backends: BackendName[] = ['core', 'gd', 'notification'],
): Promise<BackendUserIds> {
      const existing = session.backendUserIds ?? {};
      const missing = backends.filter(
            (backend) => typeof existing[backend] !== 'number',
      );

      logger.debug('Resolve backend user ids', {
            existingBackends: Object.keys(existing),
            missingBackends: missing,
      });

      if (missing.length === 0) {
            return existing;
      }

      const settled = await Promise.allSettled(
            missing.map(
                  async (backend) =>
                        [
                              backend,
                              await resolveBackendUserId(session, backend),
                        ] as const,
            ),
      );

      const next: BackendUserIds = { ...existing };

      for (const result of settled) {
            if (result.status !== 'fulfilled') {
                  logger.warn('Backend user id resolution failed', {
                        reason:
                              result.reason instanceof Error
                                    ? result.reason.message
                                    : String(result.reason),
                  });
                  continue;
            }

            const [backend, resolvedUserId] = result.value;
            if (typeof resolvedUserId === 'number' && resolvedUserId > 0) {
                  next[backend] = resolvedUserId;
                  continue;
            }

            logger.warn('Backend user id was not resolved', { backend });
      }

      return next;
}

export async function ensureBackendUserIds(
      session: AuthSession,
      backends: BackendName[] = ['core', 'gd', 'notification'],
): Promise<AuthSession> {
      const backendUserIds = await resolveBackendUserIds(session, backends);

      const changed = backends.some(
            (backend) =>
                  session.backendUserIds?.[backend] !== backendUserIds[backend],
      );

      logger.debug('Ensure backend user ids', {
            backends,
            changed,
      });

      return changed ? { ...session, backendUserIds } : session;
}

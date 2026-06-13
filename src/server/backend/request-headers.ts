import 'server-only';

import { getEnv } from '@/src/config/env.server';
import type { AuthSession, BackendName } from '@/src/server/auth/types';
import { logger } from '@/src/server/logger';

function basicAuthorization(): string {
      const env = getEnv();
      return `Basic ${Buffer.from(
            `${env.myClientId}:${env.myClientSecret}`,
            'utf8',
      ).toString('base64')}`;
}

export function buildBasicAuthorizationHeaders(): Record<string, string> {
      return {
            Authorization: basicAuthorization(),
      };
}

function backendUsesXAccessKey(backend: BackendName): boolean {
      const env = getEnv();
      logger.debug('Resolve backend access-key mode', { backend });

      switch (backend) {
            case 'gd':
                  return env.gdUseXAccessKey;
            case 'core':
                  return env.coreUseXAccessKey;
            case 'notification':
                  return env.notificationUseXAccessKey;
      }
}

export function getBackendUserId(
      session: AuthSession,
      backend: BackendName,
): number | undefined {
      const backendUserId = session.backendUserIds?.[backend];
      logger.debug('Resolve backend user id from session', {
            backend,
            backendUserId: backendUserId ?? null,
            fallbackUserId: session.userId ?? null,
      });
      if (typeof backendUserId === 'number' && backendUserId > 0) {
            return backendUserId;
      }

      return typeof session.userId === 'number' && session.userId > 0
            ? session.userId
            : undefined;
}

export function getBackendEntityId(
      session: AuthSession,
      backend: BackendName,
): number | undefined {
      const backendEntityId = session.backendEntityIds?.[backend];
      logger.debug('Resolve backend entity id from session', {
            backend,
            backendEntityId: backendEntityId ?? null,
      });
      if (typeof backendEntityId === 'number' && backendEntityId > 0) {
            return backendEntityId;
      }

      // Fallback: try legacy entityId for backward compatibility during transition
      const legacyEntityId = (session as AuthSession & { entityId?: number }).entityId;
      if (typeof legacyEntityId === 'number' && legacyEntityId > 0) {
            return legacyEntityId;
      }

      return undefined;
}

export function buildBackendRequestHeaders({
      backend,
      session,
      includeAccessKey,
      includeEntityId,
      forceUserGuid = false,
}: {
      backend: BackendName;
      session: AuthSession;
      includeAccessKey?: boolean;
      includeEntityId?: boolean;
      forceUserGuid?: boolean;
}): Record<string, string> {
      const resolvedIncludeAccessKey =
            includeAccessKey ?? backendUsesXAccessKey(backend);
      const resolvedIncludeEntityId = includeEntityId ?? true;
      const backendUserId = getBackendUserId(session, backend);
      const backendEntityId = getBackendEntityId(session, backend);

      logger.debug('Build backend request headers', {
            backend,
            backendUserId: backendUserId ?? null,
            backendEntityId: backendEntityId ?? null,
            forceUserGuid,
            includeAccessKey: resolvedIncludeAccessKey,
            includeEntityId: resolvedIncludeEntityId,
      });

      const headers: Record<string, string> = {
            ...buildBasicAuthorizationHeaders(),
      };

      if (resolvedIncludeAccessKey && session.idpToken) {
            headers['x-access-key'] = session.idpToken;
      }

      if (!resolvedIncludeAccessKey) {
            if (!forceUserGuid && typeof backendUserId === 'number') {
                  headers['x-user-id'] = String(backendUserId);
            } else {
                  headers['x-user-guid'] = session.userRecordKey;
            }
      }

      if (resolvedIncludeEntityId && typeof backendEntityId === 'number') {
            headers['x-entity-id'] = String(backendEntityId);
      }

      return headers;
}

export function backendSupportsAccessKey(backend: BackendName): boolean {
      return backendUsesXAccessKey(backend);
}

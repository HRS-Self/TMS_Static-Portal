import 'server-only';

import { getEnv } from '@/src/config/env.server';
import type {
      AuthSession,
      BackendName,
      BackendPermissionIds,
} from '@/src/server/auth/types';
import { serverRequest } from '@/src/server/backend/http';
import {
      buildBackendRequestHeaders,
      getBackendEntityId,
      getBackendUserId,
} from '@/src/server/backend/request-headers';
import { logger } from '@/src/server/logger';
import {
      readCachedBackendPermissionRegistry,
      writeCachedBackendPermissionRegistry,
} from '@/src/server/permissions/backend-permission-cache';

type UserPermissionCheckDto = {
      permittedAct?: number;
      permissionId?: number;
      codeUri?: string;
};

type UserPermissionCheckResponse = {
      hasNextPage?: boolean;
      list?: UserPermissionCheckDto[];
      offset?: number;
      page?: number;
      size?: number;
      total?: number;
};

type BackendPermissionGrant = {
      permissionIds: Set<number>;
      registry: Map<number, string>;
};

const USER_PERMISSION_CHECK_PAGE_SIZE = 50;
const USER_PERMISSION_CHECK_SELECT = JSON.stringify([
      'permittedAct',
      'permissionId',
      'codeUri',
]);
const USER_PERMISSION_CHECK_SORT = JSON.stringify([['id', 'desc']]);

function getPermissionGatewayBaseUrl(backend: BackendName): string {
      const env = getEnv();
      logger.debug('Resolve permission gateway base URL', { backend });

      switch (backend) {
            case 'core':
                  return env.coreGatewayBaseUrl;
            case 'gd':
                  return env.gdGatewayBaseUrl;
            case 'notification':
                  return env.notificationGatewayBaseUrl;
      }
}

function buildUserPermissionCheckUrl(
      baseUrl: string,
      page: number,
      offset: number,
): string {
      const url = new URL(
            `${baseUrl.replace(/\/$/, '')}/api/v5-m1/aaa.user-permission-check/Get`,
      );
      url.searchParams.set('page', String(page));
      url.searchParams.set('size', String(USER_PERMISSION_CHECK_PAGE_SIZE));
      url.searchParams.set('offset', String(offset));
      url.searchParams.set('select', USER_PERMISSION_CHECK_SELECT);
      url.searchParams.set('sort', USER_PERMISSION_CHECK_SORT);
      return url.toString();
}

async function fetchBackendPermissionGrantFromGateway(
      session: AuthSession,
      backend: BackendName,
): Promise<BackendPermissionGrant> {
      const backendUserId = getBackendUserId(session, backend);
      const backendEntityId = getBackendEntityId(session, backend);

      if (typeof backendEntityId !== 'number') {
            throw new Error(
                  `Cannot fetch ${backend} permissions without entity id`,
            );
      }

      if (typeof backendUserId !== 'number') {
            throw new Error(
                  `Cannot fetch ${backend} permissions without backend user id`,
            );
      }

      const permissionIds = new Set<number>();
      const registry = new Map<number, string>();
      let page = 1;
      let offset = 0;
      let pageCount = 0;

      while (true) {
            const url = buildUserPermissionCheckUrl(
                  getPermissionGatewayBaseUrl(backend),
                  page,
                  offset,
            );
            const data = await serverRequest<UserPermissionCheckResponse>({
                  backendName: `${backend}Gateway`,
                  url,
                  headers: buildBackendRequestHeaders({
                        backend,
                        includeAccessKey: false,
                        session,
                  }),
            });

            for (const entry of data.list ?? []) {
                  if (typeof entry.permissionId === 'number') {
                        permissionIds.add(entry.permissionId);
                        if (
                              typeof entry.codeUri === 'string' &&
                              entry.codeUri.length > 0
                        ) {
                              registry.set(entry.permissionId, entry.codeUri);
                        }
                  }
            }

            logger.debug('Fetched user-permission-check page', {
                  backend,
                  page,
                  offset,
                  listCount: data.list?.length ?? 0,
                  hasNextPage: Boolean(data.hasNextPage),
                  total: data.total ?? null,
            });

            pageCount += 1;
            if (!data.hasNextPage) {
                  break;
            }

            if (pageCount >= 100) {
                  throw new Error(
                        `Permission pagination exceeded limit for ${backend}`,
                  );
            }

            page += 1;
            offset += USER_PERMISSION_CHECK_PAGE_SIZE;
      }

      return {
            permissionIds,
            registry,
      };
}

function resolvePermissionIdsToCodeUris(
      registry: Map<number, string>,
      permissionIds: Iterable<number>,
): Set<string> | undefined {
      const resolved = new Set<string>();
      logger.debug('Resolve permission ids to code URIs', {
            registrySize: registry.size,
      });

      for (const permissionId of permissionIds) {
            const codeUri = registry.get(permissionId);
            if (!codeUri) {
                  return undefined;
            }
            resolved.add(codeUri);
      }

      return resolved;
}

function normalizePermissionIds(input: unknown): number[] | undefined {
      logger.debug('Normalize permission ids input', {
            isArray: Array.isArray(input),
      });
      if (!Array.isArray(input)) {
            return undefined;
      }

      const ids = input.filter((value): value is number => typeof value === 'number');
      return ids.length ? ids : [];
}

export async function getOrRefreshBackendPermissionCodeUris(
      session: AuthSession,
      backend: BackendName,
): Promise<Set<string>> {
      const backendUserId = getBackendUserId(session, backend);
      const backendEntityId = getBackendEntityId(session, backend);

      if (
            typeof backendEntityId !== 'number' ||
            typeof backendUserId !== 'number'
      ) {
            logger.debug('Skip backend permission cache lookup', {
                  backend,
                  hasEntityId: typeof backendEntityId === 'number',
                  hasBackendUserId: typeof backendUserId === 'number',
            });
            return new Set<string>();
      }

      const sessionPermissionIds = normalizePermissionIds(
            session.backendPermissionIds?.[backend],
      );
      const cachedRegistry = readCachedBackendPermissionRegistry(backend);

      if (sessionPermissionIds && cachedRegistry) {
            const resolved = resolvePermissionIdsToCodeUris(
                  cachedRegistry,
                  sessionPermissionIds,
            );

            if (resolved) {
                  logger.debug('Resolved backend permission code URIs from session ids', {
                        backend,
                        backendUserId,
                        backendEntityIds: session.backendEntityIds ?? null,
                        permissionIdsCount: sessionPermissionIds.length,
                  });
                  return resolved;
            }

            logger.debug('Backend permission registry missing session permission ids', {
                  backend,
                  backendUserId,
                  backendEntityIds: session.backendEntityIds ?? null,
                  permissionIdsCount: sessionPermissionIds.length,
            });
      }

      const grant = await fetchBackendPermissionGrantFromGateway(
            session,
            backend,
      );
      writeCachedBackendPermissionRegistry(backend, grant.registry);
      return resolvePermissionIdsToCodeUris(
            grant.registry,
            grant.permissionIds,
      ) ?? new Set<string>();
}

export async function warmBackendPermissionCache(
      session: AuthSession,
      backends: BackendName[] = session.entityBackends ?? [],
): Promise<BackendPermissionIds> {
      const uniqueBackends = Array.from(new Set(backends));
      const nextPermissionIds: BackendPermissionIds = {};

      if (!uniqueBackends.length) {
            logger.debug('Skip backend permission cache warm', {
                  reason: 'no_backends',
                  backendEntityIds: session.backendEntityIds ?? null,
            });
            return nextPermissionIds;
      }

      logger.debug('Warm backend permission cache', {
            backends: uniqueBackends,
            backendEntityIds: session.backendEntityIds ?? null,
      });

      const settled = await Promise.allSettled(
            uniqueBackends.map(async (backend) => {
                  const grant = await fetchBackendPermissionGrantFromGateway(
                        session,
                        backend,
                  );
                  writeCachedBackendPermissionRegistry(backend, grant.registry);
                  return {
                        backend,
                        count: grant.permissionIds.size,
                        permissionIds: Array.from(grant.permissionIds).sort(
                              (left, right) => left - right,
                        ),
                  };
            }),
      );

      for (const result of settled) {
            if (result.status === 'fulfilled') {
                  nextPermissionIds[result.value.backend] =
                        result.value.permissionIds;
                  logger.debug(
                        'Backend permission cache warm completed',
                        result.value,
                  );
                  continue;
            }

            logger.warn('Backend permission cache warm failed', {
                  reason:
                        result.reason instanceof Error
                              ? result.reason.message
                              : String(result.reason),
            });
      }

      return nextPermissionIds;
}

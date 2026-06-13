import 'server-only';

import type { BackendName } from '@/src/server/auth/types';
import { logger } from '@/src/server/logger';

type BackendPermissionRegistryEntry = {
      codeUriByPermissionId: Record<string, string>;
      expiresAt: number;
      refreshedAt: number;
};

const CACHE_TTL_MS = 5 * 60 * 1000;

const backendPermissionRegistryCache = new Map<
      BackendName,
      BackendPermissionRegistryEntry
>();

export function readCachedBackendPermissionRegistry(
      backend: BackendName,
): Map<number, string> | undefined {
      const entry = backendPermissionRegistryCache.get(backend);

      if (!entry) {
            logger.debug('Backend permission registry miss', { backend });
            return undefined;
      }

      if (entry.expiresAt <= Date.now()) {
            backendPermissionRegistryCache.delete(backend);
            logger.debug('Backend permission registry expired', { backend });
            return undefined;
      }

      const registry = new Map<number, string>(
            Object.entries(entry.codeUriByPermissionId).map(([id, codeUri]) => [
                  Number.parseInt(id, 10),
                  codeUri,
            ]),
      );

      logger.debug('Backend permission registry hit', {
            backend,
            count: registry.size,
      });
      return registry;
}

export function writeCachedBackendPermissionRegistry(
      backend: BackendName,
      registry: Map<number, string>,
): void {
      const now = Date.now();

      backendPermissionRegistryCache.set(backend, {
            codeUriByPermissionId: Object.fromEntries(
                  Array.from(registry.entries()).map(([permissionId, codeUri]) => [
                        String(permissionId),
                        codeUri,
                  ]),
            ),
            expiresAt: now + CACHE_TTL_MS,
            refreshedAt: now,
      });

      logger.debug('Backend permission registry write', {
            backend,
            count: registry.size,
      });
}

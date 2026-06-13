import 'server-only';

import {
  getPortalSurface,
  type PortalSurfaceId,
} from '@/src/portal/chrome/portal-chrom-surface-registry.config';
import type {
  SurfaceListConfig,
  SurfaceListRequest,
  SurfaceListResponse,
  SurfaceListSortDirection,
} from '@/src/portal/surfaces/types';
import type { AuthSession, BackendName } from '@/src/server/auth/types';
import {
  DATA_GATEWAY_MAX_PAGE_SIZE,
  fetchBackendGatewayList,
} from '@/src/server/backend/data-gateway';
import { logger } from '@/src/server/logger';

type LoadSurfaceListInput<TRow, TColumnKey extends string> =
  SurfaceListRequest & {
    session: AuthSession;
    config: SurfaceListConfig<TColumnKey>;
    normalizeRow: (record: Record<string, unknown>) => TRow;
  };

function toPositiveInt(value: unknown, fallback: number): number {
  logger.debug('Resolve positive integer', {
    valueType: typeof value,
    fallback,
  });
  if (typeof value !== 'number' || !Number.isFinite(value)) return fallback;
  const floored = Math.floor(value);
  return floored > 0 ? floored : fallback;
}

function normalizeFilter(value: unknown): Record<string, unknown> {
  logger.debug('Normalize surface list filter', {
    isObject: typeof value === 'object' && value !== null,
    isArray: Array.isArray(value),
  });
  if (!value || typeof value !== 'object' || Array.isArray(value)) return {};
  return value as Record<string, unknown>;
}

function resolveSurfaceBackend(surfaceId: PortalSurfaceId): BackendName {
  const surface = getPortalSurface(surfaceId);
  logger.debug('Resolve surface backend for list loader', {
    surfaceId,
    hasSurface: Boolean(surface),
    backendOwner: surface?.backendOwner ?? null,
  });

  if (!surface) {
    throw new Error(`Unknown portal surface: ${surfaceId}`);
  }

  if (
    surface.backendOwner === 'none' ||
    surface.backendOwner === undefined ||
    surface.backendOwner === null
  ) {
    throw new Error(`Surface ${surfaceId} has no backend owner for list loading`);
  }

  return surface.backendOwner;
}

function resolveSortKey<TColumnKey extends string>(
  requestedSortKey: string | null | undefined,
  config: SurfaceListConfig<TColumnKey>,
): TColumnKey {
  logger.debug('Resolve surface list sort key', {
    surfaceId: config.surfaceId,
    requestedSortKey: requestedSortKey ?? null,
    defaultSortKey: config.defaultSortKey,
  });

  if (!requestedSortKey) {
    return config.defaultSortKey;
  }

  const allowedSortKeys = new Set<string>(config.sortableKeys);
  return allowedSortKeys.has(requestedSortKey)
    ? (requestedSortKey as TColumnKey)
    : config.defaultSortKey;
}

export async function loadSurfaceList<TRow, TColumnKey extends string>(
  input: LoadSurfaceListInput<TRow, TColumnKey>,
): Promise<SurfaceListResponse<TRow, TColumnKey>> {
  const backend = resolveSurfaceBackend(input.config.surfaceId);
  const page = Math.max(1, toPositiveInt(input.page, 1));
  const requestedSize = toPositiveInt(
    input.size,
    input.config.defaultPageSize,
  );
  const size = Math.min(requestedSize, DATA_GATEWAY_MAX_PAGE_SIZE);
  const sortDirection: SurfaceListSortDirection =
    input.sortDirection === 'desc' ? 'desc' : 'asc';
  const sortKey = resolveSortKey(input.sortKey, input.config);
  const filter = normalizeFilter(input.filter);
  const includeDeletedRecords =
    input.includeDeletedRecords ?? input.config.includeDeletedRecords ?? false;

  logger.debug('Load surface list', {
    surfaceId: input.config.surfaceId,
    backend,
    dataSourceType: input.config.dataSourceType,
    dataSourceValue: input.config.dataSourceValue,
    page,
    size,
    sortKey,
    sortDirection,
    filterKeys: Object.keys(filter),
    includeDeletedRecords,
  });

  const result = await fetchBackendGatewayList<Record<string, unknown>>(
    input.session,
    backend,
    {
      dataSourceType: input.config.dataSourceType,
      dataSourceValue: input.config.dataSourceValue,
      page,
      size,
      sort: [[sortKey, sortDirection]],
      select: [...input.config.select],
      filter,
      includeDeletedRecords,
    },
  );

  const rows = Array.isArray(result.list)
    ? result.list.map(input.normalizeRow)
    : [];

  return {
    rows,
    total: result.total,
    page,
    size,
    sortKey,
    sortDirection,
    filter,
  };
}

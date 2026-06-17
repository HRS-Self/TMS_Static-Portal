import 'server-only';

import { getEnv } from '@/src/config/env.server';
import type { AuthSession, BackendName } from '@/src/server/auth/types';
import { serverRequest } from '@/src/server/backend/http';
import {
  buildBackendRequestHeaders,
  getBackendUserId,
} from '@/src/server/backend/request-headers';
import { logger } from '@/src/server/logger';

export type DataGatewayDataSourceType = 'table' | 'view';

/**
 * Backend hard cap per `docs/policies/2026-04-18-server-side-pagination-policy.md`.
 * DataGateway will not return more than this many rows in a single page.
 */
export const DATA_GATEWAY_MAX_PAGE_SIZE = 50;

export const DATA_GATEWAY_DEFAULT_PAGE = 1;
export const DATA_GATEWAY_DEFAULT_SIZE = DATA_GATEWAY_MAX_PAGE_SIZE;

export type DataGatewayFetchQuery = {
  dataSourceType: DataGatewayDataSourceType;
  dataSourceValue: string;
  filter?: Record<string, unknown>;
  includeDeletedRecords?: boolean;
  offset?: number;
  page?: number;
  select?: string[];
  size?: number;
  sort?: Array<[string, 'asc' | 'desc']>;
};

export type DataGatewayFetchResponse<T> = {
  list: T[];
  total: number;
};

function gatewayBaseUrl(backend: BackendName): string {
  const env = getEnv();
  logger.debug('Resolve gateway base URL', { backend });

  switch (backend) {
    case 'gd':
      return env.gdGatewayBaseUrl;
    case 'core':
      return env.coreGatewayBaseUrl;
    case 'notification':
      return env.notificationGatewayBaseUrl;
  }
}

type ResolvedGatewayQuery = {
  dataSourceType: DataGatewayDataSourceType;
  dataSourceValue: string;
  page: number;
  size: number;
  offset: number;
  sort: Array<[string, 'asc' | 'desc']>;
  select: string[];
  filter?: Record<string, unknown>;
  includeDeletedRecords: boolean;
};

function resolveGatewayQuery(query: DataGatewayFetchQuery): ResolvedGatewayQuery {
  const page = Math.max(1, Math.floor(query.page ?? DATA_GATEWAY_DEFAULT_PAGE));
  const requestedSize = Math.floor(query.size ?? DATA_GATEWAY_DEFAULT_SIZE);
  const size = Math.min(Math.max(1, requestedSize), DATA_GATEWAY_MAX_PAGE_SIZE);
  const offset = Math.max(0, Math.floor(query.offset ?? 0));
  const sort = query.sort && query.sort.length > 0 ? query.sort : [];
  const select = query.select && query.select.length > 0 ? query.select : [];
  logger.debug('Resolve gateway query defaults', {
    requestedPage: query.page ?? null,
    resolvedPage: page,
    requestedSize: query.size ?? null,
    resolvedSize: size,
    sizeCap: DATA_GATEWAY_MAX_PAGE_SIZE,
    sortLength: sort.length,
    selectLength: select.length,
    hasFilter: Boolean(query.filter && Object.keys(query.filter).length > 0),
    offset,
  });
  if (sort.length === 0) {
    logger.warn('DataGateway call without explicit sort; backend ordering is undefined', {
      dataSourceValue: query.dataSourceValue,
    });
  }
  if (select.length === 0) {
    logger.warn('DataGateway call without explicit select; backend will project all columns', {
      dataSourceValue: query.dataSourceValue,
    });
  }
  return {
    dataSourceType: query.dataSourceType,
    dataSourceValue: query.dataSourceValue,
    page,
    size,
    offset,
    sort,
    select,
    filter: query.filter,
    includeDeletedRecords: Boolean(query.includeDeletedRecords),
  };
}

function buildGatewayUrl(
  backend: BackendName,
  resolved: ResolvedGatewayQuery,
): string {
  const baseUrl = gatewayBaseUrl(backend).replace(/\/$/, '');
  logger.debug('Build gateway URL', {
    backend,
    dataSourceType: resolved.dataSourceType,
    dataSourceValue: resolved.dataSourceValue,
    page: resolved.page,
    size: resolved.size,
    offset: resolved.offset,
    sortLength: resolved.sort.length,
    selectLength: resolved.select.length,
    hasFilter: Boolean(resolved.filter && Object.keys(resolved.filter).length > 0),
    includeDeletedRecords: resolved.includeDeletedRecords,
  });
  const url = new URL(`${baseUrl}/api/v5-m1/dynamic-pages/FetchData`);

  url.searchParams.set(
    'dataSourceType',
    resolved.dataSourceType === 'view' ? 'View' : 'Table',
  );
  url.searchParams.set('dataSourceValue', resolved.dataSourceValue);
  url.searchParams.set('page', String(resolved.page));
  url.searchParams.set('size', String(resolved.size));

  if (resolved.offset > 0) {
    url.searchParams.set('offset', String(resolved.offset));
  }

  if (resolved.select.length > 0) {
    url.searchParams.set('select', JSON.stringify(resolved.select));
  }

  if (resolved.filter && Object.keys(resolved.filter).length > 0) {
    url.searchParams.set('filter', JSON.stringify(resolved.filter));
  }

  if (resolved.sort.length > 0) {
    url.searchParams.set('sort', JSON.stringify(resolved.sort));
  }

  if (resolved.includeDeletedRecords) {
    url.searchParams.set('includeDeletedRecords', 'true');
  }

  return url.toString();
}

/**
 * Iterates DataGateway pages until the full dataset is retrieved (or a safety cap is hit).
 *
 * Use this ONLY when the caller genuinely needs the full dataset on the server (for
 * example, building dashboard aggregations from a summary view). For user-facing
 * lists, prefer `fetchBackendGatewayList` with explicit page/size driven by the UI.
 *
 * The safety cap exists to avoid runaway loops if `total` is missing or wrong.
 */
export async function fetchAllBackendGatewayPages<T extends Record<string, unknown>>(
  session: AuthSession,
  backend: BackendName,
  query: DataGatewayFetchQuery,
  options?: { maxPages?: number },
): Promise<DataGatewayFetchResponse<T>> {
  const maxPages = Math.max(1, options?.maxPages ?? 200);
  const size = Math.min(
    Math.max(1, Math.floor(query.size ?? DATA_GATEWAY_DEFAULT_SIZE)),
    DATA_GATEWAY_MAX_PAGE_SIZE,
  );

  logger.debug('Backend gateway fetch-all start', {
    backend,
    dataSourceValue: query.dataSourceValue,
    size,
    maxPages,
  });

  const firstPage = await fetchBackendGatewayList<T>(session, backend, {
    ...query,
    page: 1,
    size,
  });

  const total = firstPage.total;
  const collected: T[] = [...firstPage.list];

  const totalPages = size > 0 ? Math.ceil(total / size) : 1;
  const effectiveMaxPages = Math.min(totalPages, maxPages);

  logger.debug('Backend gateway fetch-all first page', {
    backend,
    dataSourceValue: query.dataSourceValue,
    firstPageLength: firstPage.list.length,
    total,
    totalPages,
    effectiveMaxPages,
  });

  if (totalPages > maxPages) {
    logger.warn('Backend gateway fetch-all hit page safety cap; dataset truncated', {
      backend,
      dataSourceValue: query.dataSourceValue,
      totalPages,
      maxPages,
    });
  }

  for (let page = 2; page <= effectiveMaxPages; page += 1) {
    // Sequential on purpose: parallel fetches can easily saturate the backend
    // connection pool and the backend is the source of truth for ordering/paging.
    const next = await fetchBackendGatewayList<T>(session, backend, {
      ...query,
      page,
      size,
    });
    collected.push(...next.list);
    if (next.list.length < size) {
      logger.debug('Backend gateway fetch-all short page; stopping early', {
        backend,
        dataSourceValue: query.dataSourceValue,
        page,
        listLength: next.list.length,
        size,
      });
      break;
    }
  }

  logger.debug('Backend gateway fetch-all complete', {
    backend,
    dataSourceValue: query.dataSourceValue,
    collectedLength: collected.length,
    total,
  });

  return { list: collected, total };
}

export async function fetchBackendGatewayList<T extends Record<string, unknown>>(
  session: AuthSession,
  backend: BackendName,
  query: DataGatewayFetchQuery,
): Promise<DataGatewayFetchResponse<T>> {
  const resolved = resolveGatewayQuery(query);
  logger.debug('Backend gateway fetch', {
    backend,
    dataSourceType: resolved.dataSourceType,
    dataSourceValue: resolved.dataSourceValue,
    page: resolved.page,
    size: resolved.size,
    backendEntityIds: session.backendEntityIds ?? null,
    backendUserId: getBackendUserId(session, backend) ?? null,
  });

  type RawEnvelope = {
    list?: T[];
    total?: number | string;
    data?: { list?: T[]; total?: number | string };
  };

  const raw = await serverRequest<RawEnvelope | T[]>({
    backendName: `${backend}Gateway`,
    headers: buildBackendRequestHeaders({
      backend,
      session,
    }),
    url: buildGatewayUrl(backend, resolved),
  });

  if (Array.isArray(raw)) {
    logger.warn('DataGateway returned an array instead of { list, total }; total will be inferred from list length', {
      dataSourceValue: resolved.dataSourceValue,
      inferredTotal: raw.length,
    });
    return { list: raw, total: raw.length };
  }

  // Accept both `{ list, total }` at the top level and the enveloped `{ data: { list, total } }` shape.
  const source = Array.isArray(raw?.list)
    ? raw
    : raw?.data && (Array.isArray(raw.data.list) || 'total' in raw.data)
      ? raw.data
      : raw;

  const list = Array.isArray(source?.list) ? (source.list as T[]) : [];

  // `total` can arrive as a number, a numeric string (MySQL BIGINT), or be missing.
  // Falling back to `list.length` is the current-page size which is NEVER the true total,
  // so we log loudly when that happens to make the bug obvious.
  const rawTotal = source?.total;
  let total: number;
  if (typeof rawTotal === 'number' && Number.isFinite(rawTotal)) {
    total = rawTotal;
  } else if (typeof rawTotal === 'string' && rawTotal.trim().length > 0) {
    const parsed = Number(rawTotal);
    if (Number.isFinite(parsed)) {
      total = parsed;
    } else {
      logger.error('DataGateway returned non-numeric total string; falling back to list length', {
        dataSourceValue: resolved.dataSourceValue,
        rawTotal,
      });
      total = list.length;
    }
  } else {
    logger.error('DataGateway returned no total field; falling back to list length (this breaks pagination)', {
      dataSourceValue: resolved.dataSourceValue,
      rawTotalType: typeof rawTotal,
      hasEnvelope: Boolean(raw && typeof raw === 'object' && 'data' in (raw as Record<string, unknown>)),
      topLevelKeys: raw && typeof raw === 'object' ? Object.keys(raw as Record<string, unknown>) : [],
    });
    total = list.length;
  }

  logger.debug('Backend gateway fetch result', {
    backend,
    dataSourceValue: resolved.dataSourceValue,
    page: resolved.page,
    size: resolved.size,
    listLength: list.length,
    total,
    rawTotalType: typeof rawTotal,
  });

  return { list, total };
}

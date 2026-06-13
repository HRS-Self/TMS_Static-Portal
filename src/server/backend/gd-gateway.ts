import "server-only";

import type { AuthSession } from "@/src/server/auth/types";
import {
  fetchAllBackendGatewayPages,
  fetchBackendGatewayList,
  type DataGatewayFetchQuery,
  type DataGatewayFetchResponse,
} from "@/src/server/backend/data-gateway";
import { logger } from "@/src/server/logger";

/**
 * GD gateway wrapper.
 *
 * This file previously duplicated the DataGateway URL + response handling. It
 * is now a thin delegate over the unified `fetchBackendGatewayList` adapter so
 * the server-side pagination policy (docs/policies/2026-04-18-server-side-pagination-policy.md)
 * is enforced in exactly one place.
 *
 * Prefer calling `fetchBackendGatewayList(session, 'gd', query)` directly in
 * new code; these wrappers remain for backward compatibility with existing
 * GD-specific callers.
 */

type GdGatewayFetchQuery = Omit<DataGatewayFetchQuery, never>;

export type GdGatewayFetchResponse<T> = DataGatewayFetchResponse<T>;

export async function fetchGdGatewayList<T extends Record<string, unknown>>(
  session: AuthSession,
  query: GdGatewayFetchQuery,
): Promise<GdGatewayFetchResponse<T>> {
  logger.debug("GD gateway fetch (single page delegate)", {
    dataSourceType: query.dataSourceType,
    dataSourceValue: query.dataSourceValue,
    page: query.page ?? null,
    size: query.size ?? null,
  });
  return fetchBackendGatewayList<T>(session, "gd", query);
}

/**
 * Iterates all pages for a GD DataGateway request. Use for dashboards that
 * need the full dataset server-side (e.g., filter counts across the whole
 * fleet). Do NOT use for user-facing paged lists.
 */
export async function fetchGdGatewayListAll<T extends Record<string, unknown>>(
  session: AuthSession,
  query: GdGatewayFetchQuery,
  options?: { maxPages?: number },
): Promise<GdGatewayFetchResponse<T>> {
  logger.debug("GD gateway fetch-all delegate", {
    dataSourceType: query.dataSourceType,
    dataSourceValue: query.dataSourceValue,
    maxPages: options?.maxPages ?? null,
  });
  return fetchAllBackendGatewayPages<T>(session, "gd", query, options);
}

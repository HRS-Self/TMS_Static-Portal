import 'server-only';

import type { AuthSession, BackendName } from '@/src/server/auth/types';
import { fetchAllBackendGatewayPages } from '@/src/server/backend/data-gateway';
import { logger } from '@/src/server/logger';

/** UI-Kit StatusMappingType — what TMSDataGrid's `status` cell consumes for int→label. */
export type EnumMappingEntry = { key: string; color: string; value: string };

// Per-process cache keyed by `${backend}:${table}`. ENUM reference tables (ENUM, Title) are tiny
// and rarely change, so caching avoids a gateway round-trip on every grid render.
const cache = new Map<string, EnumMappingEntry[]>();

/**
 * Resolve int→label mappings for the given H_ENUM_* tables on a backend. The column→table binding
 * is generated deterministically (S6 enum-column-bindings); the LABELS are read live here from the
 * (ENUM, Title) reference table via DataGateway — never hand-written. A table that fails to read is
 * simply omitted, so the column falls back to the raw int (safe).
 *
 * Returns a map of table name → mapping entries.
 */
export async function resolveEnumMappings(
  session: AuthSession,
  backend: BackendName,
  tables: string[],
): Promise<Record<string, EnumMappingEntry[]>> {
  const out: Record<string, EnumMappingEntry[]> = {};
  const unique = [...new Set(tables.filter(Boolean))];

  await Promise.all(
    unique.map(async (table) => {
      const cacheKey = `${backend}:${table}`;
      const hit = cache.get(cacheKey);
      if (hit) {
        out[table] = hit;
        return;
      }
      try {
        const res = await fetchAllBackendGatewayPages<{ ENUM?: number | string; Title?: string }>(
          session,
          backend,
          { dataSourceType: 'table', dataSourceValue: table, select: ['ENUM', 'Title'], sort: [['ENUM', 'asc']] },
        );
        const mapping = res.list
          .filter((row) => row.ENUM !== undefined && row.ENUM !== null)
          .map((row) => ({ key: String(row.ENUM), color: '', value: String(row.Title ?? row.ENUM) }));
        cache.set(cacheKey, mapping);
        out[table] = mapping;
      } catch (error) {
        logger.warn('ENUM mapping resolve failed; column stays raw', {
          backend,
          table,
          reason: error instanceof Error ? error.message : String(error),
        });
      }
    }),
  );

  return out;
}

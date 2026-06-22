import { NextRequest, NextResponse } from 'next/server';

import type { PortalSurfaceId } from '@/src/portal/chrome/portal-chrom-surface-registry.config';
import { surfaceFormContracts } from '@/src/portal/derivation/surface-form-contracts';
import { getOptionalSession } from '@/src/server/auth/session';
import { fetchBackendGatewayList } from '@/src/server/backend/data-gateway';
import { resolveSurfaceBackend } from '@/src/server/portal/surface-list-loader';

export const dynamic = 'force-dynamic';

const LOOKUP_PAGE_SIZE = 20;

/**
 * BFF resolver for the wizard FK picker (TMSLookup `onResolve`). Given a surface + field + search
 * term, the host (never the kit) owns the gateway call: it reads the field's `picker` metadata
 * (source / valueKey / labelKey) from the generated form contract, reads the matching rows through
 * the DataGateway, and returns `{ value, label }[]`. The kit then classifies by count
 * (0/1/>1 → not-found / single / multi). The client never names the source — the contract does.
 */
export async function POST(request: NextRequest) {
  const session = await getOptionalSession();
  if (!session) {
    return NextResponse.json({ message: 'Unauthorized' }, { status: 401 });
  }

  const body = (await request.json().catch(() => ({}))) as {
    surfaceId?: string;
    field?: string;
    search?: string;
  };

  const surfaceId = String(body.surfaceId ?? '') as PortalSurfaceId;
  const contract = surfaceFormContracts[surfaceId];
  const field = contract?.fields.find((f) => f.name === body.field);
  const picker = field?.picker;
  if (!picker) {
    return NextResponse.json(
      { message: `No FK picker for ${surfaceId}.${body.field}` },
      { status: 404 },
    );
  }

  const search = String(body.search ?? '').trim();
  // Search the human label when present, else the value key. `*` wildcards → SQL `%`.
  const searchKey = picker.labelKey ?? picker.valueKey;
  const filter =
    search.length > 0
      ? { [searchKey]: { like: `%${search.replace(/\*/g, '%')}%` } }
      : {};
  const select = picker.labelKey
    ? [picker.valueKey, picker.labelKey]
    : [picker.valueKey];

  try {
    const result = await fetchBackendGatewayList<Record<string, unknown>>(
      session,
      resolveSurfaceBackend(surfaceId),
      {
        // datasource kind is build-time config on the picker (§8 override may repoint it); default table.
        dataSourceType: picker.dataSourceType ?? 'table',
        dataSourceValue: picker.source,
        page: 1,
        size: LOOKUP_PAGE_SIZE,
        sort: [[searchKey, 'asc']],
        select,
        filter,
      },
    );
    const rows = (Array.isArray(result.list) ? result.list : []).map((row) => ({
      value: String(row[picker.valueKey] ?? ''),
      label: picker.labelKey
        ? String(row[picker.labelKey] ?? row[picker.valueKey] ?? '')
        : String(row[picker.valueKey] ?? ''),
    }));
    return NextResponse.json({ rows });
  } catch (error) {
    return NextResponse.json(
      { message: error instanceof Error ? error.message : 'Lookup query failed' },
      { status: 502 },
    );
  }
}

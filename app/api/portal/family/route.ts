import { NextRequest, NextResponse } from 'next/server';

import type { PortalSurfaceId } from '@/src/portal/chrome/portal-chrom-surface-registry.config';
import familyKeys from '@/src/portal/derivation/spc-family-keys.json';
import surfaceDescriptions from '@/src/portal/derivation/surface-descriptions.json';
import { surfaceContracts } from '@/src/portal/derivation/surface-contracts';
import spcViewColumns from '@/src/portal/derivation/spc-view-columns.json';
import { getOptionalSession } from '@/src/server/auth/session';
import { fetchBackendGatewayList } from '@/src/server/backend/data-gateway';
import { resolveSurfaceBackend } from '@/src/server/portal/surface-list-loader';

export const dynamic = 'force-dynamic';

const FAMILY_PAGE_SIZE = 25;

// System / audit columns the family grid never shows (it reads a child Vi_SPC_ view; the same
// columns the main grids omit). The parent-scope key is filtered server-side, not displayed.
const SYSTEM_COLUMNS = new Set([
  'RecordDeleted', 'RecordKey', 'LinkRecordKey', 'EntityId',
  'CreatedBy', 'ModifiedBy', 'CreatedAt_UTC', 'ModifiedAt_UTC',
]);

const humanize = (name: string) =>
  name
    .replace(/_fsx$/, '')
    .replace(/_UTC$/, '')
    .replace(/Id$/, '')
    .replace(/([a-z0-9])([A-Z])/g, '$1 $2')
    .replace(/_/g, ' ')
    .trim();

/**
 * BFF for a wizard related-family tab. Given a surface + family area + parent record Id, resolve the
 * family view from the contract's `familyTabs` and the parent-scope column from the generated
 * `spc-family-keys.json` (the child's FK back to the parent — real evidence), then read the view
 * through the DataGateway filtered to `<key> = parentId`. Read-only: a child grid scoped to its
 * parent. The client never names the view or the key — the generated artifacts do.
 */
export async function POST(request: NextRequest) {
  const session = await getOptionalSession();
  if (!session) {
    return NextResponse.json({ message: 'Unauthorized' }, { status: 401 });
  }

  const body = (await request.json().catch(() => ({}))) as {
    surfaceId?: string;
    area?: string;
    parentId?: string | number;
    page?: number;
    size?: number;
  };

  const surfaceId = String(body.surfaceId ?? '') as PortalSurfaceId;
  const contract = surfaceContracts[surfaceId];
  // Most tabs are families; Permits is a distinct binding but reads the same way (a child view with
  // a parent-scope key), so serve it here too — keeps the wizard's render.tabs fully covered.
  const tab = contract?.read.familyTabs.find((t) => t.area === body.area);
  const view = tab?.view ?? (body.area === 'Permits' ? contract?.read.permits?.view ?? undefined : undefined);
  if (!view) {
    return NextResponse.json(
      { message: `No family tab "${body.area}" on ${surfaceId}` },
      { status: 404 },
    );
  }
  const key = (familyKeys as Record<string, string>)[view];
  if (!key) {
    return NextResponse.json(
      { message: `No scope key for family view ${view}` },
      { status: 404 },
    );
  }
  if (body.parentId === undefined || body.parentId === null || body.parentId === '') {
    return NextResponse.json({ rows: [], total: 0, columns: [] });
  }

  const allColumns = (spcViewColumns as Record<string, string[]>)[view] ?? [];
  const displayColumns = allColumns.filter((c) => !SYSTEM_COLUMNS.has(c) && c !== key);

  try {
    const result = await fetchBackendGatewayList<Record<string, unknown>>(
      session,
      resolveSurfaceBackend(surfaceId),
      {
        dataSourceType: 'view',
        dataSourceValue: view,
        page: typeof body.page === 'number' ? body.page : 1,
        size: typeof body.size === 'number' ? body.size : FAMILY_PAGE_SIZE,
        sort: [[displayColumns[0] ?? key, 'asc']],
        select: displayColumns.length > 0 ? displayColumns : allColumns,
        filter: { [key]: { eq: body.parentId } },
      },
    );
    const columns = displayColumns.map((c) => ({ accessorKey: c, title: humanize(c) }));
    // Per-grid description keyed by "surfaceKey::Area" in the descriptions overlay; PLACEHOLDER when unset.
    const descKey = `${surfaceId}::${body.area}`;
    const descRaw = (surfaceDescriptions as Record<string, unknown>)[descKey];
    const description = typeof descRaw === 'string' && descRaw.trim()
      ? descRaw
      : `PLACEHOLDER — description for the "${body.area}" tab. Set it in src/portal/derivation/surface-descriptions.json (key "${descKey}") and re-run the builder.`;
    return NextResponse.json({
      rows: Array.isArray(result.list) ? result.list : [],
      total: result.total,
      columns,
      description,
    });
  } catch (error) {
    return NextResponse.json(
      { message: error instanceof Error ? error.message : 'Family query failed' },
      { status: 502 },
    );
  }
}

import { NextRequest, NextResponse } from 'next/server';

import type { PortalSurfaceId } from '@/src/portal/chrome/portal-chrom-surface-registry.config';
import { surfaceRenderModels } from '@/src/portal/derivation/surface-render-models';
import { getOptionalSession } from '@/src/server/auth/session';
import { loadSurfaceList } from '@/src/server/portal/surface-list-loader';

export const dynamic = 'force-dynamic';

/**
 * BFF re-query for an interactive managed-list grid. The grid runs in `backend` processing mode,
 * so page/sort/filter/include-deleted changes post here and we re-read through the DataGateway.
 * The kit's FiltersModelType ({ field: { like|eq|between|gte|... } }) maps 1:1 to the gateway's
 * Sequelize Op where-format, so the composed filter passes straight through.
 */
export async function POST(request: NextRequest) {
  const session = await getOptionalSession();
  if (!session) {
    return NextResponse.json({ message: 'Unauthorized' }, { status: 401 });
  }

  const body = (await request.json().catch(() => ({}))) as {
    surfaceId?: string;
    page?: number;
    size?: number;
    sortKey?: string;
    sortDirection?: 'asc' | 'desc';
    filter?: Record<string, unknown>;
    includeDeletedRecords?: boolean;
  };

  const surfaceId = String(body.surfaceId ?? '') as PortalSurfaceId;
  const model = surfaceRenderModels[surfaceId];
  if (!model) {
    return NextResponse.json({ message: `Unknown surface: ${surfaceId}` }, { status: 404 });
  }

  const rm = model.readModel;
  try {
    const result = await loadSurfaceList({
      session,
      config: {
        surfaceId,
        dataSourceType: rm.dataSourceType,
        dataSourceValue: rm.dataSourceValue,
        defaultPageSize: rm.defaultPageSize,
        pageSizeOptions: rm.pageSizeOptions,
        select: rm.select,
        sortableKeys: rm.select,
        defaultSortKey: rm.defaultSortKey,
      },
      normalizeRow: (record) => record,
      page: typeof body.page === 'number' ? body.page : 1,
      size: typeof body.size === 'number' ? body.size : rm.defaultPageSize,
      sortKey: body.sortKey,
      sortDirection: body.sortDirection === 'desc' ? 'desc' : 'asc',
      filter: body.filter ?? {},
      includeDeletedRecords: Boolean(body.includeDeletedRecords),
    });
    return NextResponse.json({ rows: result.rows, total: result.total });
  } catch (error) {
    return NextResponse.json(
      { message: error instanceof Error ? error.message : 'List query failed' },
      { status: 502 },
    );
  }
}

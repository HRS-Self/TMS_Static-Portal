import type { ReactNode } from "react";

import type {
  PortalSurface,
  PortalSurfaceId,
} from "@/src/portal/chrome/portal-chrom-surface-registry.config";
import { getPortalSurface } from "@/src/portal/chrome/portal-chrom-surface-registry.config";
import type { SurfaceRenderModel } from "@/src/portal/derivation/surface-render-models";
import { surfaceRenderModels } from "@/src/portal/derivation/surface-render-models";
import type { SurfaceListConfig } from "@/src/portal/surfaces/types";
import { getOptionalSession } from "@/src/server/auth/session";
import { loadSurfaceList } from "@/src/server/portal/surface-list-loader";

import { SurfaceListGrid } from "./surface-list-grid";

type SurfacePageProps = {
  surfaceId: PortalSurfaceId;
};

function toConfig(surfaceId: PortalSurfaceId, model: SurfaceRenderModel): SurfaceListConfig {
  return {
    surfaceId,
    dataSourceType: model.readModel.dataSourceType,
    dataSourceValue: model.readModel.dataSourceValue,
    defaultPageSize: model.readModel.defaultPageSize,
    pageSizeOptions: model.readModel.pageSizeOptions,
    select: model.readModel.select,
    sortableKeys: model.readModel.select,
    defaultSortKey: model.readModel.defaultSortKey,
  };
}

function StubBody({ surface }: { surface: PortalSurface }) {
  return (
    <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
      <dl className="grid gap-4 md:grid-cols-2">
        <div>
          <dt className="text-sm font-medium text-slate-500">Route</dt>
          <dd className="mt-1 font-mono text-sm">{surface.route}</dd>
        </div>
        <div>
          <dt className="text-sm font-medium text-slate-500">Archetype</dt>
          <dd className="mt-1 text-sm">{surface.surfaceKind}</dd>
        </div>
        <div>
          <dt className="text-sm font-medium text-slate-500">Backend</dt>
          <dd className="mt-1 text-sm">{surface.backendOwner}</dd>
        </div>
        <div>
          <dt className="text-sm font-medium text-slate-500">Read model</dt>
          <dd className="mt-1 font-mono text-sm">{surface.readModel ?? "no list contract"}</dd>
        </div>
      </dl>
    </div>
  );
}

export async function SurfacePage({ surfaceId }: SurfacePageProps) {
  const surface = getPortalSurface(surfaceId);
  if (!surface) {
    return null;
  }

  const model = surfaceRenderModels[surfaceId];
  let body: ReactNode;

  if (!model) {
    body = <StubBody surface={surface} />;
  } else {
    const session = await getOptionalSession();
    if (!session) {
      body = <p className="text-sm text-slate-500">Sign in to view this surface.</p>;
    } else {
      let rows: object[] = [];
      let total = 0;
      let error: string | null = null;
      try {
        const result = await loadSurfaceList({
          session,
          config: toConfig(surfaceId, model),
          normalizeRow: (record) => record,
        });
        rows = result.rows;
        total = result.total;
      } catch (caught) {
        error = caught instanceof Error ? caught.message : String(caught);
      }
      body = (
        <div className="space-y-3">
          {model.readModel.pendingViewOrder ? (
            <p className="rounded-md bg-amber-50 px-3 py-2 text-xs text-amber-700">
              Stopgap: reading base table — pending view order {model.readModel.pendingViewOrder}.
            </p>
          ) : null}
          {error ? (
            <p className="rounded-md bg-rose-50 px-3 py-2 text-xs text-rose-700">
              Data unavailable (DataGateway): {error}
            </p>
          ) : null}
          <SurfaceListGrid model={model} rows={rows} totalItems={total} />
        </div>
      );
    }
  }

  return (
    <section className="space-y-4">
      <header className="space-y-1">
        <p className="text-sm font-medium uppercase tracking-wide text-slate-500">
          {surface.section}
        </p>
        <h1 className="text-3xl font-semibold">{surface.title}</h1>
      </header>
      {body}
    </section>
  );
}

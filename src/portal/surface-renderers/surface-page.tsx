import { logger } from "@/src/logger";
import type { PortalSurfaceId } from "@/src/portal/chrome/portal-chrom-surface-registry.config";
import { getPortalSurface } from "@/src/portal/chrome/portal-chrom-surface-registry.config";

type SurfacePageProps = {
  surfaceId: PortalSurfaceId;
};

export function SurfacePage({ surfaceId }: SurfacePageProps) {
  logger.debug("Resolve surface page metadata", { surfaceId });
  const surface = getPortalSurface(surfaceId);

  if (!surface) {
    return null;
  }

  return (
    <section className="space-y-4">
      <header className="space-y-1">
        <p className="text-sm font-medium uppercase tracking-wide text-slate-500">
          {surface.section}
        </p>
        <h1 className="text-3xl font-semibold">{surface.title}</h1>
      </header>
      <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <dl className="grid gap-4 md:grid-cols-2">
          <div>
            <dt className="text-sm font-medium text-slate-500">Route</dt>
            <dd className="mt-1 font-mono text-sm">{surface.route}</dd>
          </div>
          <div>
            <dt className="text-sm font-medium text-slate-500">Status</dt>
            <dd className="mt-1 text-sm">{surface.implementationStatus}</dd>
          </div>
          <div>
            <dt className="text-sm font-medium text-slate-500">Backend</dt>
            <dd className="mt-1 text-sm">{surface.backendOwner}</dd>
          </div>
          <div>
            <dt className="text-sm font-medium text-slate-500">Read model</dt>
            <dd className="mt-1 font-mono text-sm">{surface.readModel ?? "contract pending"}</dd>
          </div>
        </dl>
      </div>
    </section>
  );
}

"use client";

import { TMSDataGrid } from "@conitdev/tms-ui-kit";
import { useEffect, useState } from "react";

type FamilyColumn = { accessorKey: string; title: string };

type SurfaceFamilyTabProps = {
  surfaceId: string;
  area: string;
  parentId: string | number;
};

// Read-only related-family grid inside the wizard. Fetches a child Vi_SPC_ view scoped to the parent
// record via the /api/portal/family BFF (which resolves the view + parent-scope key from generated
// artifacts). Columns come from the BFF; the kit binds each cell via accessorKey.
export function SurfaceFamilyTab({ surfaceId, area, parentId }: SurfaceFamilyTabProps) {
  const [state, setState] = useState<{
    loading: boolean;
    rows: object[];
    total: number;
    columns: FamilyColumn[];
    error: string | null;
  }>({ loading: true, rows: [], total: 0, columns: [], error: null });

  useEffect(() => {
    let cancelled = false;
    setState((s) => ({ ...s, loading: true, error: null }));
    void fetch("/api/portal/family", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ surfaceId, area, parentId }),
    })
      .then(async (res) => {
        const json = (await res.json().catch(() => ({}))) as {
          rows?: object[];
          total?: number;
          columns?: FamilyColumn[];
          message?: string;
        };
        if (cancelled) return;
        if (!res.ok) {
          setState({ loading: false, rows: [], total: 0, columns: [], error: json.message ?? "Failed to load." });
          return;
        }
        setState({
          loading: false,
          rows: json.rows ?? [],
          total: json.total ?? 0,
          columns: json.columns ?? [],
          error: null,
        });
      })
      .catch((e) => {
        if (!cancelled) {
          setState({ loading: false, rows: [], total: 0, columns: [], error: e instanceof Error ? e.message : "Failed to load." });
        }
      });
    return () => {
      cancelled = true;
    };
  }, [surfaceId, area, parentId]);

  if (state.error) {
    return <p className="tms-governed-type-caption tms-governed-text-danger">{state.error}</p>;
  }

  const columns = state.columns.map((c) => ({ name: c.accessorKey, accessorKey: c.accessorKey, title: c.title, type: "text" as const }));

  return (
    <TMSDataGrid
      pageSize={25}
      columns={columns}
      rows={state.rows}
      totalItems={state.total}
      loading={state.loading}
      actions={{ rowAction: [], headerAction: [] }}
      onClickActions={() => {}}
      hasBorder={false}
      showPagination
    />
  );
}

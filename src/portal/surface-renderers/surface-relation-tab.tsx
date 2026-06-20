"use client";

import { TMSDataGrid } from "@conitdev/tms-ui-kit";
import { useCallback, useEffect, useState } from "react";

import { SurfaceAssignPicker } from "./surface-assign-picker";

// A wizard relation tab. For a BRIDGE family: the grid of already-related records with an Unassign
// row action and an Assign header action (opens the layer-2 picker). Unassign soft-deletes the
// junction via /api/portal/relation. For a CHILD family (Permits, owned records): read-only.
type RelationContract = {
  kind: "bridge" | "child";
  relatedHasRootSurface?: boolean;
  assignableSurfaceKey?: string | null;
  sensitiveLinkage?: boolean;
};

type FamilyColumn = { accessorKey: string; title: string };

type SurfaceRelationTabProps = {
  surfaceId: string;
  area: string;
  parentId: string | number;
  contract: RelationContract | undefined;
  canMutate: boolean; // capability projection (C3): hide Assign/Unassign when no create/update
};

export function SurfaceRelationTab({ surfaceId, area, parentId, contract, canMutate }: SurfaceRelationTabProps) {
  const isBridge = contract?.kind === "bridge";
  const [state, setState] = useState<{
    loading: boolean; rows: object[]; total: number; columns: FamilyColumn[]; junctionKey: string | null; description: string; error: string | null;
  }>({ loading: true, rows: [], total: 0, columns: [], junctionKey: null, description: "", error: null });
  const [picking, setPicking] = useState(false);
  const [busy, setBusy] = useState(false);

  const load = useCallback(async () => {
    setState((s) => ({ ...s, loading: true, error: null }));
    try {
      const res = await fetch("/api/portal/family", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ surfaceId, area, parentId }),
      });
      const json = (await res.json().catch(() => ({}))) as {
        rows?: object[]; total?: number; columns?: FamilyColumn[]; junctionKey?: string | null; description?: string; message?: string;
      };
      if (!res.ok) {
        setState({ loading: false, rows: [], total: 0, columns: [], junctionKey: null, description: "", error: json.message ?? "Failed to load." });
        return;
      }
      setState({
        loading: false, rows: json.rows ?? [], total: json.total ?? 0, columns: json.columns ?? [],
        junctionKey: json.junctionKey ?? null, description: json.description ?? "", error: null,
      });
    } catch (e) {
      setState({ loading: false, rows: [], total: 0, columns: [], junctionKey: null, description: "", error: e instanceof Error ? e.message : "Failed to load." });
    }
  }, [surfaceId, area, parentId]);
  useEffect(() => { void load(); }, [load]);

  async function unassign(row: Record<string, unknown>) {
    const junctionRowId = state.junctionKey ? row[state.junctionKey] : undefined;
    if (junctionRowId == null || busy) return;
    if (!window.confirm(`Unassign this ${area} record?`)) return;
    setBusy(true);
    try {
      const res = await fetch("/api/portal/relation", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ surfaceId, area, op: "unassign", parentId, junctionRowId }),
      });
      if (res.ok) void load();
      else {
        const j = (await res.json().catch(() => ({}))) as { message?: string };
        window.alert(j.message ?? "Unassign failed.");
      }
    } finally {
      setBusy(false);
    }
  }

  if (state.error) {
    return <p className="tms-governed-type-caption tms-governed-text-danger">{state.error}</p>;
  }

  const showActions = isBridge && canMutate && !contract?.sensitiveLinkage;
  const columns = state.columns.map((c) => ({ name: c.accessorKey, accessorKey: c.accessorKey, title: c.title, type: "text" as const }));

  return (
    <div className="tms-governed-stack-sm">
      {contract?.sensitiveLinkage ? (
        <p className="tms-governed-type-caption tms-governed-text-muted">
          Linking here is request/approval-governed — assignment happens through a request, not a direct change.
        </p>
      ) : null}
      <TMSDataGrid
        title={area}
        description={state.description}
        pageSize={10}
        columns={columns}
        rows={state.rows}
        totalItems={state.total}
        loading={state.loading || busy}
        actions={{
          rowAction: showActions ? [{ id: "unassign", title: "Unassign", iconImage: "lucide:unlink", treatment: "delete" }] : [],
          headerAction: showActions ? [{ id: "assign", title: "Assign", iconImage: "lucide:link" }] : [],
        }}
        onClickActions={(action, row) => {
          const id = (action as { id?: string }).id;
          if (id === "unassign") void unassign(row as Record<string, unknown>);
          else if (id === "assign") setPicking(true);
        }}
        hasBorder={false}
        showPagination
      />
      {picking && isBridge ? (
        <SurfaceAssignPicker
          surfaceId={surfaceId}
          area={area}
          parentId={parentId}
          assignableSurfaceKey={contract?.assignableSurfaceKey ?? null}
          relatedHasRootSurface={Boolean(contract?.relatedHasRootSurface)}
          onAssigned={() => { setPicking(false); void load(); }}
          onClose={() => setPicking(false)}
        />
      ) : null}
    </div>
  );
}

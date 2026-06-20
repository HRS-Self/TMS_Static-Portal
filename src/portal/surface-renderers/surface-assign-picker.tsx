"use client";

import { TMSButton, TMSDataGrid, TMSModal } from "@conitdev/tms-ui-kit";
import { useCallback, useEffect, useState } from "react";

import { surfaceRenderModels } from "@/src/portal/derivation/surface-render-models";

// Layer-2 assign picker (nested modal): a grid of the related entity's assignable base records. Each
// row's Assign creates the junction via /api/portal/relation; on success the parent relation grid
// refreshes. When the related entity has no root surface of its own, an Add New header opens layer-3.
const CARD =
  "flex max-h-[80vh] w-[min(50rem,94vw)] flex-col tms-governed-surface-panel tms-governed-surface-muted tms-governed-radius-surface shadow-modal overflow-hidden";

type AssignPickerProps = {
  surfaceId: string;
  area: string;
  parentId: string | number;
  assignableSurfaceKey: string | null;
  relatedHasRootSurface: boolean;
  onAssigned: () => void;
  onClose: () => void;
  onAddNew?: () => void;
};

export function SurfaceAssignPicker({
  surfaceId, area, parentId, assignableSurfaceKey, relatedHasRootSurface, onAssigned, onClose, onAddNew,
}: AssignPickerProps) {
  const model = assignableSurfaceKey ? surfaceRenderModels[assignableSurfaceKey] : null;
  const [rows, setRows] = useState<object[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(true);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    if (!assignableSurfaceKey) { setLoading(false); return; }
    setLoading(true);
    try {
      const res = await fetch("/api/portal/list", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ surfaceId: assignableSurfaceKey, page: 1, size: 25 }),
      });
      const json = (await res.json().catch(() => ({}))) as { rows?: object[]; total?: number };
      setRows(json.rows ?? []);
      setTotal(json.total ?? 0);
    } finally {
      setLoading(false);
    }
  }, [assignableSurfaceKey]);
  useEffect(() => { void load(); }, [load]);

  const columns = (model?.columns ?? []).map((c) => ({
    name: c.field, accessorKey: c.field, title: c.title, type: "text" as const,
  }));

  async function assign(row: Record<string, unknown>) {
    const relatedId = (row as { Id?: string | number }).Id;
    if (relatedId == null || busy) return;
    setBusy(true);
    setError(null);
    try {
      const res = await fetch("/api/portal/relation", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ surfaceId, area, op: "assign", parentId, relatedId }),
      });
      if (res.ok) { onAssigned(); }
      else {
        const j = (await res.json().catch(() => ({}))) as { message?: string; error?: string };
        setError(j.message ?? j.error ?? "Assign failed.");
      }
    } finally {
      setBusy(false);
    }
  }

  return (
    <TMSModal isOpen closeModal={onClose} className={CARD}>
      <header className="shrink-0 border-b tms-governed-border-strong tms-governed-padding-inline-lg tms-governed-padding-block-md flex items-center justify-between">
        <h3 className="tms-governed-type-body tms-governed-font-title tms-governed-text-primary">Assign {area}</h3>
        <TMSButton variant="outlined" label="Close" onClick={onClose} />
      </header>
      <div className="flex min-h-0 flex-col tms-governed-gap-md tms-governed-padding-lg overflow-auto">
        {error ? <p className="tms-governed-type-caption tms-governed-text-danger">{error}</p> : null}
        {assignableSurfaceKey ? (
          <TMSDataGrid
            pageSize={10}
            columns={columns}
            rows={rows}
            totalItems={total}
            loading={loading}
            actions={{
              rowAction: [{ id: "assign", title: "Assign", iconImage: "lucide:link" }],
              headerAction: !relatedHasRootSurface && onAddNew ? [{ id: "add-new", title: "Add New", iconImage: "lucide:plus" }] : [],
            }}
            onClickActions={(action, row) => {
              const id = (action as { id?: string }).id;
              if (id === "assign") void assign(row as Record<string, unknown>);
              else if (id === "add-new") onAddNew?.();
            }}
            hasBorder={false}
            showPagination
          />
        ) : (
          <div className="tms-governed-stack-sm">
            <p className="tms-governed-type-caption tms-governed-text-muted">
              This related record type has no list of its own.
            </p>
            {onAddNew ? <TMSButton variant="containedPrimary" label="Add New" onClick={onAddNew} /> : null}
          </div>
        )}
      </div>
    </TMSModal>
  );
}

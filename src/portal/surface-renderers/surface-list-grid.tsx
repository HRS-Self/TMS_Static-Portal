"use client";

import { TMSDataGrid } from "@conitdev/tms-ui-kit";
import { useRouter } from "next/navigation";
import { useState } from "react";

import type {
  RenderAction,
  SurfaceRenderModel,
} from "@/src/portal/derivation/surface-render-models";
import type { SurfaceCapabilitySnapshot } from "@/src/portal/surfaces/types";

// The ONE generic managed-list host. Maps the kit-agnostic render model (S6) onto the
// kit's TMSDataGrid props — zero surface-specific UI code.
const ACTION_ICON: Record<string, `lucide:${string}`> = {
  manage: "lucide:pencil",
  delete: "lucide:trash-2",
  view: "lucide:eye",
  new: "lucide:plus",
};

const COLUMN_TYPE: Record<string, "text" | "number" | "date" | "status" | "amount"> = {
  text: "text",
  number: "number",
  date: "date",
  status: "status",
  amount: "amount",
};

// action id → capability flag (visibility projection; the backend is the real gate).
const CAP: Record<string, "canCreate" | "canUpdate" | "canDelete"> = {
  new: "canCreate",
  manage: "canUpdate",
  delete: "canDelete",
};

type SurfaceListGridProps = {
  model: SurfaceRenderModel;
  rows: object[];
  totalItems: number;
  capability?: SurfaceCapabilitySnapshot | null;
};

export function SurfaceListGrid({ model, rows, totalItems, capability }: SurfaceListGridProps) {
  const router = useRouter();
  const [busy, setBusy] = useState(false);

  // hide an action the capability snapshot forbids (when a snapshot is present)
  const allowed = (action: RenderAction) => {
    const flag = CAP[action.id];
    return !flag || !capability || capability[flag] !== false;
  };

  const columns = model.columns.map((column) => ({
    name: column.field,
    title: column.title,
    type: COLUMN_TYPE[column.type] ?? "text",
    clmAllowSort: column.sortable,
  }));

  const actions = {
    rowAction: model.rowActions.filter(allowed).map((action) => ({
      id: action.id,
      title: action.title,
      iconImage: ACTION_ICON[action.id] ?? "lucide:more-horizontal",
      ...(action.treatment ? { treatment: action.treatment } : {}),
    })),
    headerAction: model.headerActions.filter(allowed).map((action) => ({
      id: action.id,
      title: action.title,
      iconImage: ACTION_ICON[action.id] ?? "lucide:plus",
    })),
  };

  async function handleAction(action: { id?: string }, row?: object) {
    const id = action?.id;
    // delete is the first wired action — no form needed (New/Manage await the wizard host).
    if (id === "delete" && row) {
      const recordId = (row as { Id?: number }).Id;
      if (recordId == null || busy) return;
      if (!window.confirm("Delete this record?")) return;
      setBusy(true);
      try {
        const res = await fetch("/api/portal/write", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            surfaceId: model.surfaceKey,
            buttonId: "delete",
            // soft-delete via /Set; backend may refine the delete contract.
            payload: { Id: recordId, RecordDeleted: true },
          }),
        });
        if (res.ok) router.refresh();
        else window.alert("Delete failed.");
      } finally {
        setBusy(false);
      }
    }
  }

  return (
    <TMSDataGrid
      pageSize={25}
      columns={columns}
      rows={rows}
      totalItems={totalItems}
      actions={actions}
      onClickActions={(action, row) => {
        void handleAction(action as { id?: string }, row);
      }}
      processingMode={{ pagination: "backend", sorting: "backend", filtering: "backend" }}
      showColumns
      showPagination
      hasBorder
    />
  );
}

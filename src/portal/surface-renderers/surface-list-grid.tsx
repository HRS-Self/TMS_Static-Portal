"use client";

import { TMSDataGrid } from "@conitdev/tms-ui-kit";
import { useRouter } from "next/navigation";
import { useState } from "react";

import type { SurfaceFormContract } from "@/src/portal/derivation/surface-form-contracts";
import type {
  RenderAction,
  SurfaceRenderModel,
} from "@/src/portal/derivation/surface-render-models";
import type { SurfaceCapabilitySnapshot } from "@/src/portal/surfaces/types";

import { SurfaceWizard } from "./surface-wizard";

// The ONE generic managed-list host. Maps the kit-agnostic render model (S6) onto the
// kit's TMSDataGrid props — zero surface-specific UI code.
const ACTION_ICON: Record<string, `lucide:${string}`> = {
  manage: "lucide:pencil",
  delete: "lucide:trash-2",
  view: "lucide:eye",
  new: "lucide:plus",
};

// render-model column type → kit ColumnsObject type (the kit supports the full union; we map the
// semantic types S6 emits and default unknowns to text).
type KitColumnType =
  | "text" | "string" | "number" | "phone" | "date" | "status" | "score"
  | "currency" | "amount" | "recordDeleted" | "attachedFile" | "button" | "time";
const COLUMN_TYPE: Record<string, KitColumnType> = {
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

type EnumMappingEntry = { key: string; color: string; value: string };

type SurfaceListGridProps = {
  model: SurfaceRenderModel;
  rows: object[];
  totalItems: number;
  /** field → int→label mapping (resolved live from the ENUM table; see enum-mappings). */
  enumMappings?: Record<string, EnumMappingEntry[]>;
  capability?: SurfaceCapabilitySnapshot | null;
  form?: SurfaceFormContract | null;
  title?: string;
};

export function SurfaceListGrid({ model, rows, totalItems, enumMappings, capability, form, title }: SurfaceListGridProps) {
  const router = useRouter();
  const [busy, setBusy] = useState(false);
  const [wizard, setWizard] = useState<{ mode: "new" | "manage"; row?: Record<string, unknown> } | null>(null);

  // hide an action the capability snapshot forbids (when a snapshot is present)
  const allowed = (action: RenderAction) => {
    const flag = CAP[action.id];
    return !flag || !capability || capability[flag] !== false;
  };

  // TMSDataGrid reads each cell ONLY via `accessorKey` (RowsDataView: getRowValue(row, accessorKey));
  // `name` is just the column identity. Without accessorKey every cell is undefined → blank grid.
  // A column with an ENUM mapping renders via the kit's `status` cell (the only one that maps
  // int→label); empty `color` makes it a plain label, not a badge.
  const columns = model.columns.map((column) => {
    const mapping = enumMappings?.[column.field];
    return {
      name: column.field,
      accessorKey: column.field,
      title: column.title,
      type: (mapping ? "status" : COLUMN_TYPE[column.type] ?? "text") as KitColumnType,
      clmAllowSort: column.sortable,
      ...(mapping ? { mapping } : {}),
    };
  });

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
    // New/Manage open the modal wizard (needs a form contract).
    if ((id === "new" || id === "manage") && form) {
      setWizard({
        mode: id === "new" ? "new" : "manage",
        row: id === "manage" ? (row as Record<string, unknown>) : undefined,
      });
      return;
    }
    // Delete needs no form: confirm → write route → refresh.
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
    <>
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
      {wizard && form ? (
        <SurfaceWizard
          open
          mode={wizard.mode}
          surfaceId={model.surfaceKey}
          title={title ?? "Record"}
          form={form}
          initial={wizard.row ?? null}
          onClose={() => setWizard(null)}
        />
      ) : null}
    </>
  );
}

"use client";

import { TMSDataGrid } from "@conitdev/tms-ui-kit";

import type { SurfaceRenderModel } from "@/src/portal/derivation/surface-render-models";

// The ONE generic managed-list host. Maps the kit-agnostic render model
// (S6) onto the kit's TMSDataGrid props — zero surface-specific UI code.
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

type SurfaceListGridProps = {
  model: SurfaceRenderModel;
  rows: object[];
  totalItems: number;
};

export function SurfaceListGrid({ model, rows, totalItems }: SurfaceListGridProps) {
  const columns = model.columns.map((column) => ({
    name: column.field,
    title: column.title,
    type: COLUMN_TYPE[column.type] ?? "text",
    clmAllowSort: column.sortable,
  }));

  const actions = {
    rowAction: model.rowActions.map((action) => ({
      id: action.id,
      title: action.title,
      iconImage: ACTION_ICON[action.id] ?? "lucide:more-horizontal",
      ...(action.treatment ? { treatment: action.treatment } : {}),
    })),
    headerAction: model.headerActions.map((action) => ({
      id: action.id,
      title: action.title,
      iconImage: ACTION_ICON[action.id] ?? "lucide:plus",
    })),
  };

  return (
    <TMSDataGrid
      pageSize={25}
      columns={columns}
      rows={rows}
      totalItems={totalItems}
      actions={actions}
      onClickActions={() => {
        // S6 v2: route action click → Write Channel Envelope (model.headerActions/rowActions endpoints).
      }}
      processingMode={{ pagination: "backend", sorting: "backend", filtering: "backend" }}
      showColumns
      showPagination
      hasBorder
    />
  );
}

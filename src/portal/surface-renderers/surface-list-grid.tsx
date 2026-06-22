"use client";

import { TMSDataGrid } from "@conitdev/tms-ui-kit";
import { useSearchParams } from "next/navigation";
import { useCallback, useEffect, useRef, useState } from "react";

import type { SurfaceFormContract } from "@/src/portal/derivation/surface-form-contracts";
import type {
  RenderAction,
  SurfaceRenderModel,
} from "@/src/portal/derivation/surface-render-models";
import type { SurfaceCapabilitySnapshot } from "@/src/portal/surfaces/types";

import surfaceEntranceModes from "@/src/portal/derivation/surface-entrance-modes.json";

import { SurfaceInviteModal } from "./surface-invite-modal";
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
  /** wizard ENUM select options: field → {value,label}[] (resolved live). */
  formFieldOptions?: Record<string, { value: string; label: string }[]>;
  capability?: SurfaceCapabilitySnapshot | null;
  form?: SurfaceFormContract | null;
  title?: string;
};

export function SurfaceListGrid({ model, rows, totalItems, enumMappings, formFieldOptions, capability, form, title }: SurfaceListGridProps) {
  const [busy, setBusy] = useState(false);
  const [wizard, setWizard] = useState<{ mode: "new" | "manage"; row?: Record<string, unknown> } | null>(null);
  const [inviting, setInviting] = useState(false);
  // invite-mode surfaces (Layer-1 identities, e.g. Driver) are entered by invitation, not the create wizard.
  const entranceMode = (surfaceEntranceModes as Record<string, string>)[model.surfaceKey] ?? "create";

  // The grid runs in `backend` processing mode: rows are seeded server-side (page 1) and re-queried
  // here via the BFF list route on page / sort / filter / include-deleted changes. queryRef holds
  // the live query so each change composes with the others.
  const [data, setData] = useState<{ rows: object[]; total: number }>({ rows, total: totalItems });
  const [loading, setLoading] = useState(false);
  const queryRef = useRef({
    page: 1,
    size: model.readModel.defaultPageSize ?? 10,
    sortKey: model.readModel.defaultSortKey,
    sortDirection: "asc" as "asc" | "desc",
    filter: {} as Record<string, unknown>,
    includeDeleted: false,
  });
  const refetch = useCallback(
    async (patch: Partial<typeof queryRef.current>) => {
      const q = { ...queryRef.current, ...patch };
      queryRef.current = q;
      setLoading(true);
      try {
        const res = await fetch("/api/portal/list", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            surfaceId: model.surfaceKey,
            page: q.page,
            size: q.size,
            sortKey: q.sortKey,
            sortDirection: q.sortDirection,
            filter: q.filter,
            includeDeletedRecords: q.includeDeleted,
          }),
        });
        if (res.ok) {
          const json = (await res.json()) as { rows?: object[]; total?: number };
          setData({ rows: json.rows ?? [], total: json.total ?? 0 });
        }
      } finally {
        setLoading(false);
      }
    },
    [model.surfaceKey],
  );

  // Header global-search landing: ?sf=<accessorKey>&sq=<wildcard term> → pre-filter the grid to the
  // matches (wildcard * → SQL %; the gateway routes _fsx fields to its encrypted search). Row
  // actions then take over. Re-applies whenever the search params change.
  const searchParams = useSearchParams();
  const sf = searchParams.get("sf");
  const sq = searchParams.get("sq");
  useEffect(() => {
    if (!sf || !sq) return;
    // Wildcard semantics: a bare term (no *) is EXACT (eq); a leading/trailing * is ends/starts/
    // contains (like with % substituted). Per the global-search contract.
    const hasWildcard = sq.includes("*");
    const clause = hasWildcard ? { like: sq.replace(/\*/g, "%") } : { eq: sq };
    queryRef.current = { ...queryRef.current, page: 1, filter: { [sf]: clause } };
    void refetch({});
  }, [sf, sq, refetch]);

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
    // invite-mode New → invitation modal, not the create wizard (governed entrance policy)
    if (id === "new" && entranceMode === "invite") {
      setInviting(true);
      return;
    }
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
        if (res.ok) void refetch({});
        else window.alert("Delete failed.");
      } finally {
        setBusy(false);
      }
      return;
    }
    // Custom action (declared via component-action-overrides): a generic write through the write
    // route. Row actions post the row's Id; header actions post an empty payload. The writer config
    // (backend/method/path) is resolved server-side by surfaceId+buttonId — no endpoint in the client.
    if (id && !["new", "manage", "delete", "view"].includes(id)) {
      if (busy) return;
      const recordId = (row as { Id?: number } | undefined)?.Id;
      setBusy(true);
      try {
        const res = await fetch("/api/portal/write", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            surfaceId: model.surfaceKey,
            buttonId: id,
            payload: recordId != null ? { Id: recordId } : {},
          }),
        });
        if (res.ok) void refetch({});
        else window.alert("Action failed.");
      } finally {
        setBusy(false);
      }
    }
  }

  // Datasource kinds the gateway fully serves (table/view) are processed backend-side; URL-proxy
  // kinds (internalUrlPath/externalUrlPath) don't enforce filter/sort/page, so the build marks them
  // `frontend` and the kit slices the already-fetched bounded set client-side. Default backend.
  const processing = model.readModel.processing === "frontend" ? "frontend" : "backend";
  const processingMode = { pagination: processing, sorting: processing, filtering: processing } as const;

  return (
    <>
      <TMSDataGrid
        title={title}
        description={model.description}
        pageSize={(model.readModel.defaultPageSize ?? 10) as 5 | 10 | 25 | 50}
        columns={columns}
        rows={data.rows}
        totalItems={data.total}
        loading={loading}
        actions={actions}
        onClickActions={(action, row) => {
          void handleAction(action as { id?: string }, row);
        }}
        processingMode={processingMode}
        onPageChange={(page) => void refetch({ page })}
        onRowsPerPage={(size) => void refetch({ size, page: 1 })}
        onSortChange={(sort) =>
          void refetch({
            sortKey: sort?.accessorKey ?? model.readModel.defaultSortKey,
            sortDirection: sort?.direction ?? "asc",
            page: 1,
          })
        }
        onComposedFilterChange={(payload) =>
          void refetch({ filter: payload?.composedFilter ?? {}, page: payload?.page ?? 1 })
        }
        onIncludeDeleted={(includeDeleted) => void refetch({ includeDeleted, page: 1 })}
        resizableColumns
        showColumns
        showFilters
        showPagination
        stickyHeader
        hasBorder={false}
      />
      {inviting ? (
        <SurfaceInviteModal surfaceId={model.surfaceKey} title={title ?? "User"} onClose={() => setInviting(false)} />
      ) : null}
      {wizard && form ? (
        <SurfaceWizard
          open
          mode={wizard.mode}
          surfaceId={model.surfaceKey}
          title={title ?? "Record"}
          form={form}
          fieldOptions={formFieldOptions}
          initial={wizard.row ?? null}
          capability={capability ?? null}
          onClose={() => {
            setWizard(null);
            void refetch({});
          }}
        />
      ) : null}
    </>
  );
}

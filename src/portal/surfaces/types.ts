import type {
  PortalBackendOwner,
  PortalSurfaceId,
} from "@/src/portal/chrome/portal-chrom-surface-registry.config";

export type SurfaceColumnContract = {
  key: string;
  title: string;
  visibility: "default" | "optional" | "hidden";
};

// The 4 DataGateway datasource kinds; URL kinds are proxied by the gateway (see data-gateway.ts).
export type SurfaceListDataSourceType = "table" | "view" | "internalUrlPath" | "externalUrlPath";

export type SurfaceListSortDirection = "asc" | "desc";

export type SurfaceListConfig<TColumnKey extends string = string> = {
  surfaceId: PortalSurfaceId;
  dataSourceType: SurfaceListDataSourceType;
  dataSourceValue: string;
  defaultPageSize: number;
  pageSizeOptions: readonly number[];
  select: readonly TColumnKey[];
  sortableKeys: readonly TColumnKey[];
  defaultSortKey: TColumnKey;
  includeDeletedRecords?: boolean;
};

export type SurfaceListRequest = {
  page?: number;
  size?: number;
  sortKey?: string | null;
  sortDirection?: SurfaceListSortDirection;
  filter?: Record<string, unknown>;
  includeDeletedRecords?: boolean;
};

export type SurfaceListResponse<
  TRow,
  TColumnKey extends string = string,
> = {
  rows: TRow[];
  total: number;
  page: number;
  size: number;
  sortKey: TColumnKey | null;
  sortDirection: SurfaceListSortDirection;
  filter: Record<string, unknown>;
};

export type SurfaceReaderComponentKind = "grid" | "form";

export type SurfaceGridReaderConfig<TColumnKey extends string = string> =
  SurfaceListConfig<TColumnKey> & {
    componentId: string;
    componentKind: "grid";
  };

export type SurfaceFormReaderConfig<TFieldKey extends string = string> = {
  surfaceId: PortalSurfaceId;
  componentId: string;
  componentKind: "form";
  dataSourceType: SurfaceListDataSourceType;
  dataSourceValue: string;
  select?: readonly TFieldKey[];
  includeDeletedRecords?: boolean;
};

export type SurfaceReaderConfig<TFieldKey extends string = string> =
  | SurfaceGridReaderConfig<TFieldKey>
  | SurfaceFormReaderConfig<TFieldKey>;

export type SurfaceReaderButtonTriggerKind = "headerAction" | "rowAction";

export type SurfaceReaderButtonUiActionConfig = {
  type: "open-wizard-modal";
  wizardId: string;
  navigationMode: "restricted" | "unrestricted";
  initialTabId?: string;
};

export type SurfaceReaderButtonConfig = {
  surfaceId: PortalSurfaceId;
  componentId: string;
  componentKind: SurfaceReaderComponentKind;
  buttonId: string;
  triggerKind: SurfaceReaderButtonTriggerKind;
  uiAction: SurfaceReaderButtonUiActionConfig;
};

export type SurfaceWriterHttpMethod = "POST" | "PUT" | "PATCH" | "DELETE";

export type SurfaceWriterConfig = {
  surfaceId: PortalSurfaceId;
  buttonId: string;
  backend: Exclude<PortalBackendOwner, "none">;
  method: SurfaceWriterHttpMethod;
  path: string;
  includeEntityId?: boolean;
};

export type SurfaceCapabilitySnapshot = {
  pageVisible: boolean;
  canRead: boolean;
  canCreate: boolean;
  canUpdate: boolean;
  canDelete: boolean;
  sections: Record<string, boolean>;
  tabs: Record<string, boolean>;
  actions: Record<string, boolean>;
};

export type SurfaceCapabilities = Partial<
  Record<PortalSurfaceId, SurfaceCapabilitySnapshot>
>;

export type SurfaceWizardTabContract = {
  id: string;
  title: string;
  requiredPermission?: string;
};

export type SurfaceContract = {
  surfaceId: PortalSurfaceId;
  columns: readonly SurfaceColumnContract[];
  wizardTabs: readonly SurfaceWizardTabContract[];
};

export function defineSurfaceListConfig<TColumnKey extends string>(
  config: SurfaceListConfig<TColumnKey>,
) {
  return config;
}

export function defineSurfaceGridReaderConfig<TColumnKey extends string>(
  config: SurfaceGridReaderConfig<TColumnKey>,
) {
  return config;
}

export function defineSurfaceFormReaderConfig<TFieldKey extends string>(
  config: SurfaceFormReaderConfig<TFieldKey>,
) {
  return config;
}

export function defineSurfaceReaderButtonConfig(
  config: SurfaceReaderButtonConfig,
) {
  return config;
}

export function defineSurfaceWriterConfig(config: SurfaceWriterConfig) {
  return config;
}

export function defineSurfaceContract(contract: SurfaceContract) {
  return contract;
}

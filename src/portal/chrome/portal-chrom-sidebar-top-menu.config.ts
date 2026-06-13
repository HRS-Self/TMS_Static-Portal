import type { TMSNameIconsType } from "@conitdev/tms-ui-kit";

export type PortalSidebarTopItem = {
  id: string;
  title: string;
  href: string;
  icon: TMSNameIconsType;
};

// Agnostic baseline: no top-menu entries. A built portal instance populates
// this from its derived surface catalog (S3).
export const portalSidebarTopMenu: readonly PortalSidebarTopItem[] = [];

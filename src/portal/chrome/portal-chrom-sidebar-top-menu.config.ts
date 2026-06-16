import type { TMSNameIconsType } from "@conitdev/tms-ui-kit";

export type PortalSidebarTopItem = {
  id: string;
  title: string;
  href: string;
  icon: TMSNameIconsType;
};

// Populated by S5 from the derived surface catalog (generated projection).
import { generatedSidebarTopMenu } from "./portal-chrom-sidebar-top-menu.generated";
export const portalSidebarTopMenu: readonly PortalSidebarTopItem[] = generatedSidebarTopMenu;

export type PortalSidebarMenuNode = {
  title: string;
  href?: string;
  items?: readonly PortalSidebarMenuNode[];
};

// Populated by S5 from the derived surface catalog (generated projection).
import { generatedSidebarSettingsMenu } from "./portal-chrom-sidebar-settings-menu.generated";
export const portalSidebarSettingsMenu: readonly PortalSidebarMenuNode[] = generatedSidebarSettingsMenu;

// Minimal placeholder so the shell has a single navigable node.
export const portalSidebarAboutMenu = {
  title: "Home",
  href: "/",
} as const satisfies PortalSidebarMenuNode;

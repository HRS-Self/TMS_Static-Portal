export type PortalSidebarMenuNode = {
  title: string;
  href?: string;
  items?: readonly PortalSidebarMenuNode[];
};

// Agnostic baseline: no settings tree. A built portal instance populates this
// from its derived surface catalog (S3).
export const portalSidebarSettingsMenu: readonly PortalSidebarMenuNode[] = [];

// Minimal placeholder so the shell has a single navigable node.
export const portalSidebarAboutMenu = {
  title: "Home",
  href: "/",
} as const satisfies PortalSidebarMenuNode;

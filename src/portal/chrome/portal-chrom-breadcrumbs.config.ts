import {
  portalSidebarAboutMenu,
  portalSidebarSettingsMenu,
  type PortalSidebarMenuNode,
} from "@/src/portal/chrome/portal-chrom-sidebar-bottom-menu.config";
import { logger } from "@/src/logger";
import { portalSidebarTopMenu } from "@/src/portal/chrome/portal-chrom-sidebar-top-menu.config";
import { portalSurfaces } from "@/src/portal/chrome/portal-chrom-surface-registry.config";

export type PortalBreadcrumbNode = {
  title: string;
  href: string;
};

function findMenuTrail(
  route: string,
  nodes: readonly PortalSidebarMenuNode[],
  trail: readonly PortalBreadcrumbNode[] = [],
): PortalBreadcrumbNode[] | undefined {
  logger.debug("Find portal breadcrumb menu trail", {
    route,
    nodeCount: nodes.length,
    trailDepth: trail.length,
  });

  for (const node of nodes) {
    const nextTrail = [...trail, { title: node.title, href: node.href ?? "" }];

    if (node.href === route) {
      return nextTrail;
    }

    if (node.items) {
      const nestedTrail = findMenuTrail(route, node.items, nextTrail);

      if (nestedTrail) {
        return nestedTrail;
      }
    }
  }

  return undefined;
}

export function getPortalBreadcrumbNodes(route: string): PortalBreadcrumbNode[] {
  logger.debug("Resolve portal breadcrumb nodes", { route });

  const homeNode = { title: "Home", href: "/dashboard" };
  const topItem = portalSidebarTopMenu.find((item) => item.href === route);

  if (topItem) {
    return [homeNode, { title: topItem.title, href: topItem.href }];
  }

  const bottomTrail = findMenuTrail(route, [...portalSidebarSettingsMenu, portalSidebarAboutMenu]);

  if (bottomTrail) {
    return [homeNode, ...bottomTrail];
  }

  const fallbackSurface = portalSurfaces.find((surface) => surface.route === route);

  if (fallbackSurface) {
    return [homeNode, { title: fallbackSurface.title, href: fallbackSurface.route }];
  }

  return [homeNode, { title: route, href: route }];
}

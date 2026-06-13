import { TMSSidebar } from "@conitdev/tms-ui-kit";
import type { ComponentProps } from "react";

import {
  portalSidebarAboutMenu,
  portalSidebarSettingsMenu,
  type PortalSidebarMenuNode,
} from "@/src/portal/chrome/portal-chrom-sidebar-bottom-menu.config";
import { portalSidebarTopMenu } from "@/src/portal/chrome/portal-chrom-sidebar-top-menu.config";
import { logger } from "@/src/logger";

type PortalChromSidebarProps = ComponentProps<typeof TMSSidebar>;
type SidebarTopItem = NonNullable<PortalChromSidebarProps["topItems"]>[number];
type SidebarBottomItem = NonNullable<PortalChromSidebarProps["bottomItems"]>[number];
type SidebarBottomChildItem = NonNullable<SidebarBottomItem["items"]>[number];
type SidebarIcon = Exclude<SidebarTopItem["icon"], undefined>;

export type PortalChromSidebarRuntimeState = {
  pathname: string;
  viewportTier: "mobile" | "tablet" | "desktop-sm" | "desktop-md" | "desktop-lg";
  onClickMenuItem: NonNullable<PortalChromSidebarProps["onClickMenuItem"]>;
};

const sidebarNodeIconsByTitle: Record<string, SidebarIcon> = {
  Definitions: "setting",
  HUBs: "lucide:warehouse",
  Distributors: "lucide:building-2",
  CVOs: "lucide:shield-check",
  Drivers: "user",
  Customers: "lucide:users",
  Vehicles: "lucide:truck",
  "Requests & Approvals": "transportRequest",
  Notifications: "notification",
  Access: "lucide:key-round",
  "Legal Entities": "lucide:briefcase-business",
  "Roles & Permissions": "lucide:shield-check",
  Catalog: "lucide:book-open-text",
  "Vehicle Features": "lucide:badge-plus",
  "Service Bases": "lucide:map-pinned",
  Configurations: "setting",
  "Client Configurations": "setting",
  System: "statistics",
  Governance: "lucide:scale",
  "Action Config Bases": "lucide:workflow",
  "Global Configs": "setting",
  "Notification Definitions": "notification",
  "SaaS Clients & Engagement Scenarios": "lucide:network",
  "Master Services": "lucide:boxes",
  "Permit Management": "lucide:file-badge",
  "Permit Types": "lucide:file-text",
  "Permit Issuers": "lucide:stamp",
  Info: "about",
  Help: "about",
  Support: "call",
  Knowledge: "lucide:book-open",
};

function normalizeSidebarNodeName(value: string): string {
  return value.replace(/\s+/g, "-").toLowerCase();
}

function resolveSidebarNodeIcon(node: PortalSidebarMenuNode, fallback: SidebarIcon): SidebarIcon {
  return sidebarNodeIconsByTitle[node.title] ?? fallback;
}

function isSidebarNodeActive(pathname: string, node: PortalSidebarMenuNode): boolean {
  logger.debug("Resolve sidebar active state", {
    pathname,
    nodeTitle: node.title,
    hasHref: Boolean(node.href),
    hasItems: Boolean(node.items?.length),
  });

  if (node.href && pathname === node.href) {
    return true;
  }

  return node.items?.some((child) => isSidebarNodeActive(pathname, child)) ?? false;
}

function toSidebarTopItems(pathname: string): SidebarTopItem[] {
  return portalSidebarTopMenu.map((item) => ({
    id: item.id,
    title: item.title,
    name: item.id,
    componentType: "menu",
    href: item.href,
    icon: item.icon,
    active: pathname === item.href,
  }));
}

function toSidebarBottomChildItems(
  nodes: readonly PortalSidebarMenuNode[],
  inheritedIcon: SidebarIcon,
): SidebarBottomChildItem[] {
  return nodes.map((node) => ({
    title: node.title,
    icon: resolveSidebarNodeIcon(node, inheritedIcon),
    href: node.href ?? "",
    ...(node.items
      ? {
          items: toSidebarBottomChildItems(node.items, resolveSidebarNodeIcon(node, inheritedIcon)),
        }
      : {}),
  }));
}

function toSidebarBottomItems(pathname: string): SidebarBottomItem[] {
  const rootNodes: readonly PortalSidebarMenuNode[] = [
    ...portalSidebarSettingsMenu,
    portalSidebarAboutMenu,
  ];

  return rootNodes.map((node) => {
    const icon = resolveSidebarNodeIcon(node, "setting");

    return {
      id: normalizeSidebarNodeName(node.title),
      title: node.title,
      name: normalizeSidebarNodeName(node.title),
      componentType: "menu",
      icon,
      active: isSidebarNodeActive(pathname, node),
      ...(node.href ? { href: node.href } : {}),
      ...(node.items ? { items: toSidebarBottomChildItems(node.items, icon) } : {}),
    };
  });
}

function resolveSidebarCollapsed(viewportTier: PortalChromSidebarRuntimeState["viewportTier"]): boolean {
  logger.debug("Resolve sidebar collapsed state", { viewportTier });

  switch (viewportTier) {
    case "desktop-md":
    case "desktop-lg":
      return false;
    case "mobile":
      return false;
    case "tablet":
    case "desktop-sm":
    default:
      return true;
  }
}

export function buildPortalChromSidebarProps({
  pathname,
  viewportTier,
  onClickMenuItem,
}: PortalChromSidebarRuntimeState): PortalChromSidebarProps {
  return {
    title: "Operations",
    topItems: toSidebarTopItems(pathname),
    bottomItems: toSidebarBottomItems(pathname),
    onSubMenuClick: () => undefined,
    onToggleClick: () => undefined,
    collapsed: resolveSidebarCollapsed(viewportTier),
    onClickMenuItem,
    // items: undefined,
    // settingMenu: undefined,
    // about: undefined,
    // bgColorSidebar: undefined,
    // bgColorArrowButton: undefined,
    // borderColorArrowButton: undefined,
    // fillColorArrowButton: undefined,
    // borderColorSetting: undefined,
    // borderColorHoverSetting: undefined,
    // fillColorIcons: undefined,
    // bgColorActiveMenuButton: undefined,
    // bgColorMenuButton: undefined,
    // textColorMenu: undefined,
    // menuItemRounded: undefined,
    // bgColorActiveSubMenu: undefined,
    // bgColorSubMenu: undefined,
    // fillColorIconMenu: undefined,
    // collapseFix: undefined,
    // collapse: undefined,
  } satisfies PortalChromSidebarProps;
}

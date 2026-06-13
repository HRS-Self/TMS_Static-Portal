import { TMSBreadcrumb } from "@conitdev/tms-ui-kit";
import type { ComponentProps } from "react";

import { getPortalBreadcrumbNodes } from "@/src/portal/chrome/portal-chrom-breadcrumbs.config";

type PortalChromBreadcrumbProps = ComponentProps<typeof TMSBreadcrumb>;

export type PortalChromBreadcrumbRuntimeState = {
  currentHref: string;
  title?: string;
  onClickItem: NonNullable<PortalChromBreadcrumbProps["onClickItem"]>;
};

export function buildPortalChromBreadcrumbProps({
  currentHref,
  title,
  onClickItem,
}: PortalChromBreadcrumbRuntimeState): PortalChromBreadcrumbProps {
  return {
    id: "portal-breadcrumb",
    title,
    name: "portal-breadcrumb",
    items: getPortalBreadcrumbNodes(currentHref).map((node) => ({
      id: node.href || node.title,
      title: node.title,
      name: node.title,
      href: node.href,
    })),
    showBorder: true,
    onClickItem,
    // textLinkColor: undefined,
    // textColor: undefined,
  } satisfies PortalChromBreadcrumbProps;
}

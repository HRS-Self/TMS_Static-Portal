import { TMSFooter } from "@conitdev/tms-ui-kit";
import type { ComponentProps } from "react";

type PortalChromFooterProps = ComponentProps<typeof TMSFooter>;

export function buildPortalChromFooterProps(): PortalChromFooterProps {
  return {
    id: "portal-page-footer",
    name: "portal-page-footer",
    requiredPermission: "",
    label: {
      id: "portal-footer-label",
      title: `Portal © ${new Date().getFullYear()}`,
      name: "portal-footer-label",
      componentType: "label",
    },
    // leftButtons: undefined,
    // rightButtons: undefined,
    // bgColorContainedPrimary: undefined,
    // leftClass: undefined,
    // rightClass: undefined,
    // children: undefined,
  } satisfies PortalChromFooterProps;
}

"use client";

import { TMSBreadcrumb, TMSFooter } from "@conitdev/tms-ui-kit";
import { useRouter } from "next/navigation";
import type { ReactNode } from "react";

import { logger } from "@/src/logger";
import { buildPortalChromBreadcrumbProps } from "@/src/portal/chrome/portal-chrom-breadcrumb.kit-props";
import { buildPortalChromFooterProps } from "@/src/portal/chrome/portal-chrom-footer.kit-props";
import { portalChromLocalUIOverrides } from "@/src/portal/chrome/portal-chrom.local-ui-overrides";

type PortalPageProps = {
  children: ReactNode;
  currentHref: string;
  title?: string;
};

export function PortalPage({ children, currentHref, title }: PortalPageProps) {
  const router = useRouter();
  const breadcrumbProps = buildPortalChromBreadcrumbProps({
    currentHref,
    title,
    onClickItem: (item) => {
      logger.debug("Portal breadcrumb navigate", {
        currentHref,
        href: item.href,
      });

      if (item.href) {
        router.push(item.href);
      }
    },
  });
  const footerProps = buildPortalChromFooterProps();

  return (
    <section className={portalChromLocalUIOverrides.pageClassName}>
      <div id="pageContent" className="flex min-h-0 min-w-0 flex-1 flex-col overflow-hidden">
        <div className={portalChromLocalUIOverrides.breadcrumbHostClassName}>
          <TMSBreadcrumb {...breadcrumbProps} />
        </div>
        <div id="portal-route-content-cell" className={portalChromLocalUIOverrides.pageContentViewportClassName}>{children}</div>
      </div>
      <div className={portalChromLocalUIOverrides.footerHostClassName}>
        <TMSFooter {...footerProps} />
      </div>
    </section>
  );
}

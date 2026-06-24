"use client";

import { TMSHeader, TMSSidebar, useTMSUIViewportTier } from "@conitdev/tms-ui-kit";
import { usePathname, useRouter } from "next/navigation";
import { useEffect, useMemo, useRef, useState, type ComponentProps, type ReactNode } from "react";

import { getPortalSurfaceByRoute } from "@/src/portal/chrome/portal-chrom-surface-registry.config";
import { logger } from "@/src/logger";
import { portalChromLocalUIOverrides } from "@/src/portal/chrome/portal-chrom.local-ui-overrides";
import { CompanySelectorModal, type CompanyChoice } from "@/src/portal/chrome/company-selector-modal";
import { searchRegistry } from "@/src/portal/derivation/search-registry";
import { buildPortalChromHeaderProps } from "@/src/portal/chrome/portal-chrom-header.kit-props";
import { buildPortalChromSidebarProps } from "@/src/portal/chrome/portal-chrom-sidebar.kit-props";
import { PortalPage } from "@/src/portal/chrome/portal-page";
import { PortalSearchbar } from "@/src/portal/chrome/portal-searchbar";

type PortalShellProps = {
  children: ReactNode;
  currentEntityId?: number;
  currentEntityTitle?: string;
  currentUserName?: string;
  currentUserInitials?: string;
  /** true when signed in without an active entity → the selector is blocking (first-login). */
  needsEntity?: boolean;
  /** company choices (cached at login) — feed the modal + header switcher. */
  entityChoices?: CompanyChoice[];
};

export function PortalShell({
  children,
  currentEntityId,
  currentEntityTitle,
  currentUserName,
  currentUserInitials,
  needsEntity = false,
  entityChoices = [],
}: PortalShellProps) {
  const pathname = usePathname();
  const router = useRouter();
  const viewportTier = useTMSUIViewportTier();
  const shellRef = useRef<HTMLDivElement>(null);
  const [isMobileSidebarOpen, setIsMobileSidebarOpen] = useState(false);
  const [switchCompanyOpen, setSwitchCompanyOpen] = useState(false);

  // In-app notification tray: the header's notification dropdown is fed from this list. Fetched from
  // the BFF (DataGateway → Vi_SPC_NotificationTray, scoped to the current user) on mount and whenever
  // the active company changes. Kit-agnostic items here; mapped to the header shape below. The tray
  // is non-critical chrome — failures are swallowed (empty tray).
  type TrayItem = { id: string; title: string; body: string; isRead: boolean; timestamp: string };
  const [trayItems, setTrayItems] = useState<TrayItem[]>([]);
  useEffect(() => {
    let cancelled = false;
    void (async () => {
      try {
        const res = await fetch("/api/portal/notifications");
        if (!res.ok) return;
        const json = (await res.json()) as { notifications?: TrayItem[] };
        if (!cancelled) setTrayItems(json.notifications ?? []);
      } catch {
        /* tray is non-critical; leave it empty on failure */
      }
    })();
    return () => {
      cancelled = true;
    };
  }, [currentEntityId]);

  // Map to the header's notification shape ({ id, text, date, reeded }); body has no slot in the
  // header dropdown (kept in trayItems for a future full inbox page).
  const headerNotifications: NonNullable<ComponentProps<typeof TMSHeader>["notifications"]> = trayItems.map(
    (n) => ({ id: n.id, text: n.title, date: n.timestamp, reeded: n.isRead }),
  );

  // Selecting a company (header switcher OR modal) runs the SAME flow as first login: GET
  // /api/entity/select → sets session.entityId → server redirect → full reload re-renders the app.
  const selectEntity = (entityId: number) => {
    const choice = entityChoices.find((c) => c.entityId === entityId);
    if (!choice) return;
    const params = new URLSearchParams({
      entityId: String(choice.entityId),
      entityTitle: choice.entityTitle,
      sources: JSON.stringify(choice.sources),
      returnUrl: pathname || "/dashboard",
    });
    window.location.assign(`/api/entity/select?${params.toString()}`);
  };

  // Global search: subject + (subject-scoped) field + wildcard term → navigate to that subject's
  // grid pre-filtered to the matches (sf=accessorKey, sq=term). The field comes from PortalSearchbar
  // already scoped to the subject (its accessorKey), so there's no cross-subject resolution to do.
  const runSearch = (term: string, subjectKey: string, fieldAccessorKey: string) => {
    const subject = searchRegistry[subjectKey];
    if (!subject || !term.trim()) return;
    const params = new URLSearchParams({ sf: fieldAccessorKey, sq: term.trim() });
    router.push(`${subject.route}?${params.toString()}`);
  };
  const currentSurface = getPortalSurfaceByRoute(pathname);
  const currentHref = currentSurface?.route ?? pathname;
  const isMobile = viewportTier === "mobile";

  const closeMobileSidebar = () => {
    const sidebarElement = shellRef.current?.querySelector<HTMLElement>("#sidebar-navbar-s");

    if (!sidebarElement) {
      logger.debug("Skip close mobile sidebar", { reason: "missing_sidebar_element" });
      return;
    }

    logger.debug("Close mobile sidebar", { pathname, isMobile });
    sidebarElement.classList.add("-translate-x-96");
    setIsMobileSidebarOpen(false);
  };

  const headerProps = useMemo(
    () =>
      buildPortalChromHeaderProps({
        isMobile,
        currentEntityId,
        currentEntityTitle,
        currentUserName,
        currentUserInitials,
        entityChoices,
      }),
    [currentEntityId, currentEntityTitle, currentUserInitials, currentUserName, entityChoices, isMobile],
  );

  const sidebarProps = useMemo(
    () =>
      buildPortalChromSidebarProps({
        pathname,
        viewportTier,
        onClickMenuItem: (menuItem) => {
          if ("href" in menuItem && menuItem.href) {
            logger.debug("Portal sidebar navigate", {
              href: menuItem.href,
              pathname,
            });
            router.push(menuItem.href);
          }
        },
      }),
    [pathname, router, viewportTier],
  );

  useEffect(() => {
    const sidebarElement = shellRef.current?.querySelector<HTMLElement>("#sidebar-navbar-s");

    if (!sidebarElement) {
      logger.debug("Skip mobile sidebar sync", { reason: "missing_sidebar_element" });
      return undefined;
    }

    const syncMobileSidebarState = () => {
      setIsMobileSidebarOpen(!sidebarElement.classList.contains("-translate-x-96"));
    };

    if (!isMobile) {
      logger.debug("Portal sidebar desktop mode sync", { viewportTier });
      sidebarElement.classList.remove("-translate-x-96");
      return undefined;
    }

    logger.debug("Portal sidebar mobile mode sync", { pathname, viewportTier });
    sidebarElement.classList.add("-translate-x-96");
    queueMicrotask(() => {
      setIsMobileSidebarOpen(false);
    });

    const observer = new MutationObserver(() => {
      syncMobileSidebarState();
    });

    observer.observe(sidebarElement, {
      attributes: true,
      attributeFilter: ["class"],
    });

    return () => {
      observer.disconnect();
    };
  }, [isMobile, pathname, viewportTier]);

  const sidebarModeKey = `${viewportTier}-${sidebarProps.collapsed ? "collapsed" : "expanded"}`;
  const sidebar = <TMSSidebar key={sidebarModeKey} {...sidebarProps} />;

  return (
    <div ref={shellRef} className={portalChromLocalUIOverrides.shellClassName}>
      <style>{`
        @media (min-width: 768px) {
          [data-tsid="header-container"] > div:last-child {
            height: 100% !important;
            justify-content: center !important;
          }

          [data-tsid="portal-chrome-sidebar-host"] [data-tsid="sidebar-navbar-s"] {
            position: static !important;
            inset: auto !important;
            left: auto !important;
            top: auto !important;
            translate: 0 !important;
            transform: none !important;
            height: 100% !important;
            display: flex !important;
            flex: 0 0 auto !important;
            z-index: auto !important;
          }
        }
      `}</style>
      <div className={portalChromLocalUIOverrides.headerHostClassName}>
        <TMSHeader
          {...headerProps}
          notifications={headerNotifications}
          onClickNotif={(notification) => {
            // optimistic local mark-read, then persist Status=Read (5) on the NTF queue row.
            const current = trayItems.find((n) => n.id === notification.id);
            if (!current || current.isRead) return;
            setTrayItems((prev) =>
              prev.map((n) => (n.id === notification.id ? { ...n, isRead: true } : n)),
            );
            void fetch("/api/portal/notifications", {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify({ id: notification.id }),
            }).catch(() => {
              /* non-critical; the optimistic state stands until next refetch */
            });
          }}
          signOutOnClick={() => {
            // full navigation so the /api/auth/logout route's redirect() to the IDP signout fires
            window.location.assign("/api/auth/logout");
          }}
          onClickHelp={() => {
            router.push("/info/help");
          }}
          onClickMenuItem={(menuItem) => {
            if (menuItem.href === "#switch-company") {
              setSwitchCompanyOpen(true);
              closeMobileSidebar();
              return;
            }
            if (menuItem.href) {
              logger.debug("Portal header navigate", {
                href: menuItem.href,
                pathname,
              });
              router.push(menuItem.href);
              closeMobileSidebar();
            }
          }}
          onCompanySelectorChange={(value) => selectEntity(Number(value))}
          onClickSeeAllNotif={() => {
            router.push("/inbox/notifications");
          }}
        >
          <PortalSearchbar onSearch={runSearch} />
        </TMSHeader>
      </div>
      <div data-tsid="portal-shell-body" className={portalChromLocalUIOverrides.bodyClassName}>
        <aside data-tsid="portal-chrome-sidebar-host" className={portalChromLocalUIOverrides.sidebarHostClassName}>{sidebar}</aside>
        {isMobile && isMobileSidebarOpen ? (
          <button
            type="button"
            aria-label="Close navigation menu"
            className={portalChromLocalUIOverrides.mobileSidebarBackdropClassName}
            onClick={closeMobileSidebar}
          />
        ) : null}
        <main className={portalChromLocalUIOverrides.mainColumnClassName}>
          <PortalPage currentHref={currentHref} title={currentSurface?.title}>
            {children}
          </PortalPage>
        </main>
      </div>
      {needsEntity || switchCompanyOpen ? (
        <CompanySelectorModal
          choices={entityChoices}
          returnUrl={pathname || "/dashboard"}
          onClose={needsEntity ? undefined : () => setSwitchCompanyOpen(false)}
        />
      ) : null}
    </div>
  );
}

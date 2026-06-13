export const portalChromLocalUIOverrides = {
  shellClassName: "flex h-dvh min-h-0 w-full flex-col overflow-hidden tms-governed-surface-page",
  headerHostClassName: "w-full overflow-visible border-b tms-governed-border-default tms-governed-surface-panel shadow-sm",
  bodyClassName: "relative flex min-h-0 flex-1 items-stretch overflow-hidden",
  sidebarHostClassName: "shrink-0",
  mobileSidebarBackdropClassName: "absolute inset-0 z-[5] bg-slate-950/20 backdrop-blur-[1px] md:hidden",
  mainColumnClassName: "flex min-h-0 min-w-0 flex-1 flex-col overflow-hidden",
  pageClassName: "flex min-h-0 flex-1 flex-col overflow-hidden",
  breadcrumbHostClassName: "shrink-0",
  pageContentViewportClassName: "flex min-h-0 min-w-0 flex-1 flex-col overflow-auto",
  footerHostClassName: "w-full border-t tms-governed-border-default tms-governed-surface-panel p-0",
} as const;


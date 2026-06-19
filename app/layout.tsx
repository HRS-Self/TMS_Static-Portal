import type { Metadata } from "next";
import type { ReactNode } from "react";

import { getEnv } from "@/src/config/env.server";
import { PortalShell } from "@/src/portal/chrome/portal-shell";
import { SessionRefreshGuard } from "@/src/portal/chrome/session-refresh-guard";
import { GovernanceProvider } from "@/src/portal/TMS_UI-Kit/governance-provider";
import { getOptionalSession } from "@/src/server/auth/session";
import { listEntityChoices } from "@/src/server/entity/entity-choices";
import { hasActiveEntity } from "@/src/server/portal/entity-scope";

import "./globals.css";

export const metadata: Metadata = {
  title: "Portal",
  description: "Static portal",
};

type RootLayoutProps = {
  children: ReactNode;
};

export default async function RootLayout({ children }: RootLayoutProps) {
  const { inactivityTimeoutMinutes, idpRecheckTimeoutMinutes } = getEnv();
  const session = await getOptionalSession();
  // Company choices for the chrome (cached in the session at login → no per-render backend call;
  // fall back to a live resolve for older sessions). Drives the first-login selector modal AND the
  // header switcher / "Switch company". needsEntity makes the modal blocking.
  const needsEntity = session ? !hasActiveEntity(session) : false;
  const entityChoices = session ? session.entityChoices ?? (await listEntityChoices(session)) : [];
  const currentUserName = [session?.firstName, session?.lastName].filter(Boolean).join(" ").trim() || undefined;
  const currentUserInitials = [session?.firstName, session?.lastName]
    .filter(Boolean)
    .map((value) => value?.charAt(0).toUpperCase())
    .join("") || undefined;

  return (
    <html lang="en">
      <body>
        <GovernanceProvider>
          {session ? (
            <SessionRefreshGuard
              expiry={session.expiry}
              inactivityTimeoutMinutes={inactivityTimeoutMinutes}
              recheckTimeoutMinutes={idpRecheckTimeoutMinutes}
            />
          ) : null}
          <PortalShell
            currentEntityId={session?.entityId}
            currentEntityTitle={session?.entityTitle}
            currentUserName={currentUserName}
            currentUserInitials={currentUserInitials}
            needsEntity={needsEntity}
            entityChoices={entityChoices}
          >
            {children}
          </PortalShell>
        </GovernanceProvider>
      </body>
    </html>
  );
}

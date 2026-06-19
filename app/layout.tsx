import type { Metadata } from "next";
import type { ReactNode } from "react";

import { getEnv } from "@/src/config/env.server";
import { CompanySelectorModal } from "@/src/portal/chrome/company-selector-modal";
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
  // Company-context gate as a MODAL (not a page): when signed in without an active entity, resolve
  // the choices and overlay the blocking selector on top of whatever route rendered.
  const entityChoices = session && !hasActiveEntity(session) ? await listEntityChoices(session) : null;
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
            currentEntityTitle={session?.entityTitle}
            currentUserName={currentUserName}
            currentUserInitials={currentUserInitials}
          >
            {children}
          </PortalShell>
          {entityChoices ? (
            <CompanySelectorModal choices={entityChoices} returnUrl="/dashboard" />
          ) : null}
        </GovernanceProvider>
      </body>
    </html>
  );
}

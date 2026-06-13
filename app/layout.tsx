import type { Metadata } from "next";
import type { ReactNode } from "react";

import { getEnv } from "@/src/config/env.server";
import { PortalShell } from "@/src/portal/chrome/portal-shell";
import { SessionRefreshGuard } from "@/src/portal/chrome/session-refresh-guard";
import { GovernanceProvider } from "@/src/portal/TMS_UI-Kit/governance-provider";
import { getOptionalSession } from "@/src/server/auth/session";

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
        </GovernanceProvider>
      </body>
    </html>
  );
}

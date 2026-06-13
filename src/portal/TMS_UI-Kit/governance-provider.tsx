"use client";

import { TMSUIProvider } from "@conitdev/tms-ui-kit";
import type { ReactNode } from "react";

import { portalUIGovernance } from "@/src/config/ui-governance";

type GovernanceProviderProps = {
  children: ReactNode;
};

export function GovernanceProvider({ children }: GovernanceProviderProps) {
  return (
    <TMSUIProvider
      palette={portalUIGovernance.palette}
      density={portalUIGovernance.density}
      shape={portalUIGovernance.shape}
      themeMode={portalUIGovernance.themeMode}
      driftVisibility={portalUIGovernance.driftVisibility}
    >
      {children}
    </TMSUIProvider>
  );
}

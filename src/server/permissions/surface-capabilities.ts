import 'server-only';

import type { PortalSurfaceId } from '@/src/portal/chrome/portal-chrom-surface-registry.config';
import relationContracts from '@/src/portal/derivation/spc-relation-contracts.json';
import { surfaceContracts } from '@/src/portal/derivation/surface-contracts';
import type { SurfaceCapabilities, SurfaceCapabilitySnapshot } from '@/src/portal/surfaces/types';
import type { AuthSession, BackendName } from '@/src/server/auth/types';
import { getOrRefreshBackendPermissionCodeUris } from '@/src/server/permissions/backend-permissions';
import { logger } from '@/src/server/logger';

// Project each surface's generated capability codes (contract.capability =
// { view, create, manage, delete } as `User.<Resource>.<Action>` URIs) onto the
// session's resolved permission set, producing the per-surface snapshot the grid
// / wizard use to hide / read-only / remove-CTA. Instance-agnostic: it reads the
// generated contracts, so it works for any built portal without edits here.
//
// Safety: when a backend's resolved code-URI set is EMPTY we cannot tell "user
// has nothing" from "permissions not resolved", so we stay PERMISSIVE for that
// backend (snapshot all-true ≡ the old undefined baseline). Only a non-empty set
// gates — the backend remains the real authorization gate either way.
function toBackend(owner: string | null | undefined): BackendName | null {
  if (owner === 'ntf' || owner === 'notification') return 'notification';
  if (owner === 'gd' || owner === 'core') return owner;
  return null;
}

export async function hydrateSurfaceCapabilities(
  session: AuthSession,
): Promise<SurfaceCapabilities | undefined> {
  const surfaceCapabilities: SurfaceCapabilities = {};
  const codeUrisByBackend = new Map<BackendName, Set<string>>();
  const codeUrisFor = async (backend: BackendName): Promise<Set<string>> => {
    let set = codeUrisByBackend.get(backend);
    if (!set) {
      set = await getOrRefreshBackendPermissionCodeUris(session, backend);
      codeUrisByBackend.set(backend, set);
    }
    return set;
  };

  for (const [surfaceId, contract] of Object.entries(surfaceContracts)) {
    const backend = toBackend(contract.backendOwner);
    if (!backend) continue;
    const codeUris = await codeUrisFor(backend);
    const cap = contract.capability ?? {};
    const gate = codeUris.size > 0; // false → permissive (unresolved permissions)
    const granted = (code?: string): boolean =>
      !gate ? true : typeof code === 'string' && codeUris.has(code);
    const canRead = !gate ? true : typeof cap.view === 'string' ? codeUris.has(cap.view) : true;

    // C4 — per-tab projection: hide a relation tab when the user lacks its read code (User.<Junction>.Get).
    const tabs: Record<string, boolean> = {};
    for (const [rcKey, rc] of Object.entries(relationContracts as Record<string, { viewCode?: string }>)) {
      if (!rcKey.startsWith(`${surfaceId}::`)) continue;
      const area = rcKey.slice(surfaceId.length + 2);
      const code = rc.viewCode;
      tabs[area] = !gate || typeof code !== 'string' ? true : codeUris.has(code);
    }

    const snapshot: SurfaceCapabilitySnapshot = {
      pageVisible: canRead,
      canRead,
      canCreate: granted(cap.create),
      canUpdate: granted(cap.manage),
      canDelete: granted(cap.delete),
      sections: {},
      tabs,
      actions: {},
    };
    surfaceCapabilities[surfaceId as PortalSurfaceId] = snapshot;
  }

  logger.debug('Hydrate surface capabilities', {
    surfaceCount: Object.keys(surfaceCapabilities).length,
  });

  return Object.keys(surfaceCapabilities).length > 0
    ? surfaceCapabilities
    : undefined;
}

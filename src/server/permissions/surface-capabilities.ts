import 'server-only';

import type { SurfaceCapabilities } from '@/src/portal/surfaces/types';
import type { AuthSession } from '@/src/server/auth/types';
import { logger } from '@/src/server/logger';

// Agnostic baseline: no surface capabilities are hydrated. A built portal
// instance wires per-surface capability snapshots here as its surfaces are
// derived (S4) and rendered (S6).
export async function hydrateSurfaceCapabilities(
  _session: AuthSession,
): Promise<SurfaceCapabilities | undefined> {
  const surfaceCapabilities: SurfaceCapabilities = {};

  logger.debug('Hydrate surface capabilities', {
    surfaceCount: Object.keys(surfaceCapabilities).length,
  });

  return Object.keys(surfaceCapabilities).length > 0
    ? surfaceCapabilities
    : undefined;
}

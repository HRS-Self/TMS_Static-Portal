import 'server-only';

import { getEnv } from '@/src/config/env.server';
import type { AuthSession, BackendName } from '@/src/server/auth/types';
import { logger } from '@/src/server/logger';

function basicAuthorization(): string {
  const env = getEnv();
  return `Basic ${Buffer.from(`${env.myClientId}:${env.myClientSecret}`, 'utf8').toString('base64')}`;
}

export function buildBasicAuthorizationHeaders(): Record<string, string> {
  return { Authorization: basicAuthorization() };
}

/**
 * The single session entity id. Entities are GD-master, replicated to Core/NTF with the
 * SAME id, so one id is valid for every backend (no per-backend map). During the Rail-B
 * transition we fall back to the legacy per-backend map until entity-selection sets
 * `session.entityId` directly.
 */
export function getEntityId(session: AuthSession): number | undefined {
  if (typeof session.entityId === 'number' && session.entityId > 0) return session.entityId;
  const legacy = session.backendEntityIds
    ? Object.values(session.backendEntityIds).find((v) => typeof v === 'number' && v > 0)
    : undefined;
  return typeof legacy === 'number' && legacy > 0 ? legacy : undefined;
}

/**
 * Headers for a backend/gateway call. Auth model (2026-06-17, see
 * docs memory auth-entity-resolution-flow): always Basic client auth + `x-access-key`
 * (the user's IDP token — the ONLY identity mode; legacy `x-user-id`/`x-user-guid` are
 * retired). `x-entity-id` carries the single session entity id on every call unless the
 * endpoint opts out (entity-agnostic APIs; IDP never needs it).
 */
export function buildBackendRequestHeaders({
  session,
  includeEntityId = true,
}: {
  backend?: BackendName;
  session: AuthSession;
  includeEntityId?: boolean;
}): Record<string, string> {
  const headers: Record<string, string> = { ...buildBasicAuthorizationHeaders() };
  if (session.idpToken) headers['x-access-key'] = session.idpToken;

  const entityId = includeEntityId ? getEntityId(session) : undefined;
  if (typeof entityId === 'number') headers['x-entity-id'] = String(entityId);

  logger.debug('Build backend request headers', {
    hasAccessKey: Boolean(session.idpToken),
    includeEntityId,
    entityId: entityId ?? null,
  });
  return headers;
}

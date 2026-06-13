import 'server-only';

import { redirect } from 'next/navigation';

import type { AuthSession } from '@/src/server/auth/types';
import { listEntityChoices } from '@/src/server/entity/entity-choices';
import { logger } from '@/src/server/logger';

export function hasActiveEntity(
  session: Pick<AuthSession, 'backendEntityIds' | 'entityTitle' | 'entityBackends'>,
): boolean {
  const hasBackendEntityIds =
    session.backendEntityIds &&
    Object.values(session.backendEntityIds).some(
      (id) => typeof id === 'number' && id > 0,
    );

  return Boolean(
    hasBackendEntityIds && session.entityTitle && session.entityBackends?.length,
  );
}

export async function ensureEntityScope(
  session: AuthSession,
  returnUrl: string,
): Promise<void> {
  const needsEntity = !hasActiveEntity(session);

  logger.debug('Ensure entity scope', {
    returnUrl,
    needsEntity,
    hasBackendEntityIds: Boolean(
      session.backendEntityIds && Object.keys(session.backendEntityIds).length > 0,
    ),
    hasEntityTitle: Boolean(session.entityTitle),
    hasEntityBackends: Boolean(session.entityBackends?.length),
  });

  if (!needsEntity) {
    return;
  }

  const choices = await listEntityChoices(session);

  logger.debug('Entity choices loaded', {
    returnUrl,
    choicesCount: choices.length,
  });

  if (choices.length === 1) {
    const only = choices[0];
    const params = new URLSearchParams();
    params.set('entityId', String(only.entityId));
    params.set('entityTitle', only.entityTitle);
    params.set('sources', JSON.stringify(only.sources));
    params.set('backendEntityIds', JSON.stringify(only.backendEntityIds));
    params.set('returnUrl', returnUrl);
    redirect(`/api/entity/select?${params.toString()}`);
  }

  const params = new URLSearchParams();
  params.set('returnUrl', returnUrl);
  redirect(`/entity?${params.toString()}`);
}

import 'server-only';

import type { AuthSession } from '@/src/server/auth/types';
import { getBackends } from '@/src/server/backend';
import { logger } from '@/src/server/logger';

export type EntityChoice = {
      /** Entity ID — GD-master, replicated to Core/NTF with the SAME id. */
      entityId: number;
      /** Display title for the entity. */
      entityTitle: string;
      /** Which backends report this entity for the user. */
      sources: Array<'core' | 'gd' | 'notification'>;
};

function normalizeEntities(
      input: unknown,
): Array<{ entityId?: number; entityTitle?: string }> {
      const isArray = Array.isArray(input);
      logger.debug('Normalize backend entities', { isArray });
      if (!isArray) return [];
      return input
            .filter(
                  (item): item is Record<string, unknown> =>
                        typeof item === 'object' && item !== null,
            )
            .map((item) => {
                  const entityId = item['entityId'];
                  const entityTitle = item['entityTitle'];
                  return {
                        entityId:
                              typeof entityId === 'number'
                                    ? entityId
                                    : undefined,
                        entityTitle:
                              typeof entityTitle === 'string'
                                    ? entityTitle
                                    : undefined,
                  };
            });
}

type BackendName = 'core' | 'gd' | 'notification';

type BackendEntitySet = {
      backendName: BackendName;
      entities: Array<{ entityId?: number; entityTitle?: string }>;
};

/**
 * Group the per-backend entity lists into selectable choices by `entityId`. Entities are
 * GD-master, replicated to Core/NTF under the SAME id, so the id is the cross-backend identity
 * key — no ResolveKey round-trip (the legacy resolvekey path is retired). A choice's `sources`
 * records which backends reported it; the GD title wins for display when present.
 */
function groupByEntityId(sets: BackendEntitySet[]): EntityChoice[] {
      const byId = new Map<number, EntityChoice>();

      for (const set of sets) {
            for (const entity of set.entities) {
                  if (typeof entity.entityId !== 'number' || entity.entityId <= 0) {
                        continue;
                  }
                  const title = (entity.entityTitle ?? '').trim();
                  const existing = byId.get(entity.entityId);
                  if (existing) {
                        if (!existing.sources.includes(set.backendName)) {
                              existing.sources.push(set.backendName);
                        }
                        if (title && (set.backendName === 'gd' || !existing.entityTitle)) {
                              existing.entityTitle = title;
                        }
                  } else {
                        byId.set(entity.entityId, {
                              entityId: entity.entityId,
                              entityTitle: title,
                              sources: [set.backendName],
                        });
                  }
            }
      }

      return Array.from(byId.values()).sort((a, b) =>
            a.entityTitle.localeCompare(b.entityTitle),
      );
}

export async function listEntityChoices(
      session: AuthSession,
): Promise<EntityChoice[]> {
      logger.debug('List entity choices across backends', {
            userRecordKey: session.userRecordKey,
            hasEntityId: Boolean(session.entityId),
      });
      const backends = getBackends();

      const results = await Promise.allSettled([
            backends.core.getUserEntities({ session }),
            backends.gd.getUserEntities({ session }),
            backends.notification.getUserEntities({ session }),
      ]);

      logger.debug('Entity choices backend results settled', {
            statuses: results.map((r) => r.status),
      });

      const order: BackendName[] = ['core', 'gd', 'notification'];
      results.forEach((result, index) => {
            const backendName = order[index];
            if (result.status === 'fulfilled') {
                  logger.info('Entity choices backend fulfilled', {
                        backendName,
                        count: Array.isArray(result.value) ? result.value.length : 0,
                  });
                  return;
            }
            logger.warn('Entity choices backend failed', {
                  backendName,
                  reason:
                        result.reason instanceof Error
                              ? result.reason.message
                              : String(result.reason),
            });
      });

      const sets: BackendEntitySet[] = order.map((backendName, index) => ({
            backendName,
            entities: normalizeEntities(
                  results[index].status === 'fulfilled'
                        ? (results[index] as PromiseFulfilledResult<unknown>).value
                        : [],
            ),
      }));

      const choices = groupByEntityId(sets);

      logger.info('Entity choices grouped', {
            choices: choices.map((choice) => ({
                  entityId: choice.entityId,
                  entityTitle: choice.entityTitle,
                  sources: choice.sources,
            })),
      });

      return choices;
}

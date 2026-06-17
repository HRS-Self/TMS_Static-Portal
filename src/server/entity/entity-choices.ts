import 'server-only';

import type { AuthSession, BackendEntityIds } from '@/src/server/auth/types';
import { getBackends } from '@/src/server/backend';
import { resolveRecordKeyFromBackendId } from '@/src/server/backend/key-resolver';
import { logger } from '@/src/server/logger';

export type EntityChoice = {
      /** Display entity ID (from primary backend). */
      entityId: number;
      /** Display title for the entity. */
      entityTitle: string;
      /** Cross-backend entity identity key. */
      entityRecordKey: string;
      /** Which backends have this entity available. */
      sources: Array<'core' | 'gd' | 'notification'>;
      /** Per-backend entity IDs. Each backend may have different IDs for the same logical entity. */
      backendEntityIds: BackendEntityIds;
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

const ENTITY_PROFILE_ENTITY_NAME = 'H_AAA_EntityProfile';

type BackendEntitySet = {
      backendName: 'core' | 'gd' | 'notification';
      entities: Array<{ entityId?: number; entityTitle?: string }>;
};

type EntityCandidate = {
      backendName: 'core' | 'gd' | 'notification';
      entityId: number;
      entityTitle: string;
      recordKey: string;
};

async function resolveEntityRecordKeys(
      sets: BackendEntitySet[],
): Promise<EntityCandidate[]> {
      const candidates = sets.flatMap((set) =>
            set.entities
                  .filter(
                        (
                              entity,
                        ): entity is { entityId: number; entityTitle: string } =>
                              typeof entity.entityId === 'number' &&
                              entity.entityId > 0 &&
                              typeof entity.entityTitle === 'string' &&
                              Boolean(entity.entityTitle.trim()),
                  )
                  .map((entity) => ({
                        backendName: set.backendName,
                        entityId: entity.entityId,
                        entityTitle: entity.entityTitle,
                  })),
      );

      const settled = await Promise.allSettled(
            candidates.map(async (candidate) => ({
                  ...candidate,
                  recordKey: await resolveRecordKeyFromBackendId({
                        backend: candidate.backendName,
                        entityName: ENTITY_PROFILE_ENTITY_NAME,
                        id: candidate.entityId,
                  }),
            })),
      );

      const resolved: EntityCandidate[] = [];

      settled.forEach((result, index) => {
            const candidate = candidates[index];
            if (result.status === 'rejected') {
                  logger.warn('Entity record key resolution failed', {
                        backendName: candidate.backendName,
                        entityId: candidate.entityId,
                        reason:
                              result.reason instanceof Error
                                    ? result.reason.message
                                    : String(result.reason),
                  });
                  return;
            }

            if (!result.value.recordKey) {
                  logger.warn('Entity record key was not resolved', {
                        backendName: candidate.backendName,
                        entityId: candidate.entityId,
                  });
                  return;
            }

            resolved.push({
                  backendName: result.value.backendName,
                  entityId: result.value.entityId,
                  entityTitle: result.value.entityTitle,
                  recordKey: result.value.recordKey,
            });
      });

      logger.info('Entity record keys resolved', {
            requestedCount: candidates.length,
            resolvedCount: resolved.length,
      });

      return resolved;
}

function chooseDisplayEntity(candidates: EntityCandidate[]): EntityCandidate {
      return (
            candidates.find((candidate) => candidate.backendName === 'gd') ??
            candidates[0]
      );
}

export async function listEntityChoices(
      session: AuthSession,
): Promise<EntityChoice[]> {
      logger.debug('List entity choices across backends', {
            userRecordKey: session.userRecordKey,
            hasEntityId: Boolean(session.backendEntityIds),
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
      results.forEach((result, index) => {
            const backendName = (['core', 'gd', 'notification'] as const)[index];
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

      const sets: BackendEntitySet[] = [
            {
                  backendName: 'core',
                  entities: normalizeEntities(
                        results[0].status === 'fulfilled'
                              ? results[0].value
                              : [],
                  ),
            },
            {
                  backendName: 'gd',
                  entities: normalizeEntities(
                        results[1].status === 'fulfilled'
                              ? results[1].value
                              : [],
                  ),
            },
            {
                  backendName: 'notification',
                  entities: normalizeEntities(
                        results[2].status === 'fulfilled'
                              ? results[2].value
                              : [],
                  ),
            },
      ];

      const byRecordKey = new Map<string, EntityCandidate[]>();
      const candidates = await resolveEntityRecordKeys(sets);

      for (const candidate of candidates) {
            const existing = byRecordKey.get(candidate.recordKey) ?? [];
            existing.push(candidate);
            byRecordKey.set(candidate.recordKey, existing);
      }

      const choices = Array.from(byRecordKey.values()).map((group) => {
            const display = chooseDisplayEntity(group);
            const sources: EntityChoice['sources'] = [];
            const backendEntityIds: BackendEntityIds = {};

            for (const candidate of group) {
                  if (!sources.includes(candidate.backendName)) {
                        sources.push(candidate.backendName);
                  }
                  backendEntityIds[candidate.backendName] = candidate.entityId;
            }

            return {
                  entityId: display.entityId,
                  entityTitle: display.entityTitle,
                  entityRecordKey: display.recordKey,
                  sources,
                  backendEntityIds,
            };
      }).sort((a, b) => a.entityTitle.localeCompare(b.entityTitle));

      logger.info('Entity choices grouped', {
            choices: choices.map((choice) => ({
                  entityTitle: choice.entityTitle,
                  hasEntityRecordKey: Boolean(choice.entityRecordKey),
                  sources: choice.sources,
                  backendEntityIdBackends: Object.keys(choice.backendEntityIds),
            })),
      });

      return choices;
}

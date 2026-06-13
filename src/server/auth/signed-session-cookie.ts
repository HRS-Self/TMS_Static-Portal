import 'server-only';

import { createHmac, timingSafeEqual } from 'node:crypto';

import type {
      SurfaceCapabilities,
      SurfaceCapabilitySnapshot,
} from '@/src/portal/surfaces/types';
import { getEnv } from '@/src/config/env.server';
import type { AuthSession } from '@/src/server/auth/types';
import { logger } from '@/src/server/logger';
import { normalizePortalUserSettings } from '@/src/user-settings/contracts';

const FORMAT_VERSION = 1;

function signingSecret(): string {
      const trimmed = process.env.SESSION_SIGNING_SECRET?.trim();
      const hasOverride = Boolean(trimmed);
      logger.debug('Resolve session signing secret', { hasOverride });
      if (trimmed) return trimmed;
      return getEnv().myClientSecret;
}

function isBooleanRecord(value: unknown): value is Record<string, boolean> {
      logger.debug('Check boolean record shape', {
            isObject: typeof value === 'object' && value !== null,
            isArray: Array.isArray(value),
      });
      if (typeof value !== 'object' || value === null || Array.isArray(value)) {
            return false;
      }

      return Object.values(value as Record<string, unknown>).every(
            (entry) => typeof entry === 'boolean',
      );
}

function isSurfaceCapabilitySnapshot(
      value: unknown,
): value is SurfaceCapabilitySnapshot {
      logger.debug('Check surface capability snapshot shape', {
            isObject: typeof value === 'object' && value !== null,
      });
      if (typeof value !== 'object' || value === null) return false;
      const o = value as Record<string, unknown>;
      return (
            typeof o.pageVisible === 'boolean' &&
            typeof o.canRead === 'boolean' &&
            typeof o.canCreate === 'boolean' &&
            typeof o.canUpdate === 'boolean' &&
            typeof o.canDelete === 'boolean' &&
            isBooleanRecord(o.sections) &&
            isBooleanRecord(o.tabs) &&
            isBooleanRecord(o.actions)
      );
}

function isSurfaceCapabilities(
      value: unknown,
): value is SurfaceCapabilities {
      logger.debug('Check surface capabilities shape', {
            isObject: typeof value === 'object' && value !== null,
      });
      if (typeof value !== 'object' || value === null || Array.isArray(value)) {
            return false;
      }

      return Object.values(value as Record<string, unknown>).every(
            isSurfaceCapabilitySnapshot,
      );
}

function isBackendUserIds(
      value: unknown,
): value is AuthSession['backendUserIds'] {
      logger.debug('Check backend user ids shape', {
            isObject: typeof value === 'object' && value !== null,
      });
      if (typeof value !== 'object' || value === null) return false;
      const o = value as Record<string, unknown>;
      const keys = ['core', 'gd', 'notification'] as const;
      return keys.every((key) => {
            const candidate = o[key];
            return candidate === undefined || typeof candidate === 'number';
      });
}

function isBackendPermissionIds(
      value: unknown,
): value is AuthSession['backendPermissionIds'] {
      logger.debug('Check backend permission ids shape', {
            isObject: typeof value === 'object' && value !== null,
      });
      if (typeof value !== 'object' || value === null) return false;
      const o = value as Record<string, unknown>;
      const keys = ['core', 'gd', 'notification'] as const;
      return keys.every((key) => {
            const candidate = o[key];
            return (
                  candidate === undefined ||
                  (Array.isArray(candidate) &&
                        candidate.every((item) => typeof item === 'number'))
            );
      });
}

function isAuthSession(value: unknown): value is AuthSession {
      const isObject = typeof value === 'object' && value !== null;
      logger.debug('AuthSession type guard: is object', { isObject });
      if (!isObject) return false;
      const o = value as Record<string, unknown>;
      const hasKeys =
            typeof o.userRecordKey === 'string' &&
            typeof o.idpToken === 'string' &&
            typeof o.expiry === 'string';
      logger.debug('AuthSession type guard: required keys', { hasKeys });
      return (
            typeof o.userRecordKey === 'string' &&
            typeof o.idpToken === 'string' &&
            typeof o.expiry === 'string'
      );
}

/** Tamper-evident session blob for httpOnly cookie storage (survives multi-worker / cold start). */
export function sealSession(session: AuthSession): string {
      logger.debug('Seal session', {
            backendUserIdsCount: Object.keys(session.backendUserIds ?? {})
                  .length,
            backendPermissionIdsCount: Object.values(
                  session.backendPermissionIds ?? {},
            ).reduce(
                  (sum, ids) => sum + (Array.isArray(ids) ? ids.length : 0),
                  0,
            ),
            hasBackendEntityIds: Boolean(session.backendEntityIds && Object.keys(session.backendEntityIds).length > 0),
            hasEntityBackends: Boolean(session.entityBackends?.length),
            hasUserSettings: Boolean(session.userSettings),
            hasSurfaceCapabilities: Boolean(session.surfaceCapabilities),
      });
      const body = JSON.stringify({ v: FORMAT_VERSION, ...session });
      const payloadB64 = Buffer.from(body, 'utf8').toString('base64url');
      const sig = createHmac('sha256', signingSecret())
            .update(payloadB64)
            .digest();
      const sigB64 = sig.toString('base64url');
      return `${FORMAT_VERSION}.${payloadB64}.${sigB64}`;
}

export function unsealSession(sealed: string | undefined): AuthSession | null {
      logger.debug('Unseal session', { hasSealed: Boolean(sealed) });
      if (!sealed) return null;
      const parts = sealed.split('.');
      const partsOk = parts.length === 3;
      logger.debug('Unseal session: parts length', {
            partsOk,
            partsLength: parts.length,
      });
      if (!partsOk) return null;
      const ver = Number.parseInt(parts[0], 10);
      const versionOk = ver === FORMAT_VERSION;
      logger.debug('Unseal session: version', { versionOk, ver });
      if (!versionOk) return null;
      const payloadB64 = parts[1];
      const sigB64 = parts[2];
      const expectedSig = createHmac('sha256', signingSecret())
            .update(payloadB64)
            .digest();
      let receivedSig: Buffer;
      try {
            receivedSig = Buffer.from(sigB64, 'base64url');
      } catch (error) {
            logger.error('Unseal session: signature base64 decode failed', {
                  reason:
                        error instanceof Error ? error.message : String(error),
            });
            return null;
      }
      if (
            expectedSig.length !== receivedSig.length ||
            !timingSafeEqual(expectedSig, receivedSig)
      ) {
            logger.debug('Unseal session: signature mismatch', {
                  expectedLength: expectedSig.length,
                  receivedLength: receivedSig.length,
            });
            return null;
      }
      let parsed: unknown;
      try {
            parsed = JSON.parse(
                  Buffer.from(payloadB64, 'base64url').toString('utf8'),
            ) as unknown;
      } catch (error) {
            logger.error('Unseal session: JSON parse failed', {
                  reason:
                        error instanceof Error ? error.message : String(error),
            });
            return null;
      }
      if (
            typeof parsed !== 'object' ||
            parsed === null ||
            (parsed as { v?: unknown }).v !== FORMAT_VERSION
      ) {
            logger.debug('Unseal session: invalid payload shape/version', {
                  isObject: typeof parsed === 'object' && parsed !== null,
            });
            return null;
      }
      const rest = parsed as { v: number } & Record<string, unknown>;
      if (!isAuthSession(rest)) return null;
      return {
            userRecordKey: rest.userRecordKey,
            userId: typeof rest.userId === 'number' ? rest.userId : 0,
            backendUserIds: (() => {
                  const backendUserIds = (rest as Record<string, unknown>)[
                        'backendUserIds'
                  ];
                  logger.debug('Normalize backendUserIds from sealed session', {
                        hasBackendUserIds: backendUserIds !== undefined,
                  });
                  if (isBackendUserIds(backendUserIds)) return backendUserIds;
                  return undefined;
            })(),
            backendPermissionIds: (() => {
                  const backendPermissionIds = (rest as Record<string, unknown>)[
                        'backendPermissionIds'
                  ];
                  logger.debug('Normalize backendPermissionIds from sealed session', {
                        hasBackendPermissionIds: backendPermissionIds !== undefined,
                  });
                  if (isBackendPermissionIds(backendPermissionIds)) {
                        return backendPermissionIds;
                  }
                  return undefined;
            })(),
            firstName: typeof rest.firstName === 'string' ? rest.firstName : '',
            lastName: typeof rest.lastName === 'string' ? rest.lastName : '',
            idpToken: rest.idpToken,
            expiry: rest.expiry,
            backendEntityIds: (() => {
                  const backendEntityIds = (rest as Record<string, unknown>)['backendEntityIds'];
                  logger.debug('Normalize backendEntityIds from sealed session', {
                        hasBackendEntityIds: backendEntityIds !== undefined,
                  });
                  if (
                        typeof backendEntityIds === 'object' &&
                        backendEntityIds !== null &&
                        !Array.isArray(backendEntityIds)
                  ) {
                        const result: Record<string, number> = {};
                        for (const key of ['core', 'gd', 'notification']) {
                              const val = (backendEntityIds as Record<string, unknown>)[key];
                              if (typeof val === 'number') {
                                    result[key] = val;
                              }
                        }
                        return Object.keys(result).length > 0 ? result : undefined;
                  }
                  return undefined;
            })(),
            entityTitle:
                  typeof rest.entityTitle === 'string'
                        ? rest.entityTitle
                        : undefined,
            entityRecordKey:
                  typeof (rest as Record<string, unknown>)['entityRecordKey'] ===
                  'string'
                        ? ((rest as Record<string, unknown>)[
                                'entityRecordKey'
                          ] as string)
                        : undefined,
            entityBackends: (() => {
                  const entityBackends = (rest as Record<string, unknown>)[
                        'entityBackends'
                  ];
                  logger.debug('Normalize entityBackends', {
                        isArray: Array.isArray(entityBackends),
                  });
                  if (!Array.isArray(entityBackends)) return undefined;
                  return entityBackends.filter(
                        (x): x is 'core' | 'gd' | 'notification' =>
                              x === 'core' ||
                              x === 'gd' ||
                              x === 'notification',
                  );
            })(),
            userSettings: (() => {
                  const userSettings = (rest as Record<string, unknown>)['userSettings'];
                  logger.debug('Normalize userSettings from sealed session', {
                        hasUserSettings: userSettings !== undefined,
                  });
                  return normalizePortalUserSettings(userSettings);
            })(),
            surfaceCapabilities: (() => {
                  const surfaceCapabilities = (rest as Record<string, unknown>)[
                        'surfaceCapabilities'
                  ];
                  logger.debug('Normalize surfaceCapabilities from sealed session', {
                        hasSurfaceCapabilities: surfaceCapabilities !== undefined,
                  });
                  if (isSurfaceCapabilities(surfaceCapabilities)) {
                        return surfaceCapabilities;
                  }

                  return undefined;
            })(),
      };
}

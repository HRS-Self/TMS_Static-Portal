 import type { SurfaceCapabilities } from '@/src/portal/surfaces/types';
 import type { PortalUserSettings } from '@/src/user-settings/contracts';

/** Shape returned by `{IDP}/api/idprequest/resolvetoken`. */
export type IdpResolveTokenResponse = {
      token: string;
      user: {
            RecordKey: string;
            Firstname: string;
            Lastname: string;
      };
};

/** Fields the IDP POSTs back to /api/auth/callback. */
export type IdpCallbackPayload = {
      clientId: string;
      token: string;
      timestamp: string;
      sign: string;
      expiry: string;
};

export type BackendName = 'core' | 'gd' | 'notification';

export type BackendPermissionIds = Partial<Record<BackendName, number[]>>;

/** One entry in the in-memory session store. */
export type AuthSession = {
      userRecordKey: string;
      userId: number;
      backendPermissionIds?: BackendPermissionIds;
      firstName: string;
      lastName: string;
      idpToken: string;
      expiry: string;
      /** Single session entity id — GD-master, replicated to Core/NTF with the SAME id; sent as x-entity-id to all backends. */
      entityId?: number;
      /** Display title for the active entity (from the primary backend). */
      entityTitle?: string;
      /** Cross-backend entity identity key. */
      entityRecordKey?: string;
      /** Which backends have this entity active. */
      entityBackends?: BackendName[];
      userSettings?: PortalUserSettings;
      surfaceCapabilities?: SurfaceCapabilities;
};

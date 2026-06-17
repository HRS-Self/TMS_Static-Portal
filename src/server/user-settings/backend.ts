import 'server-only';

import { getEnv } from '@/src/config/env.server';
import type { AuthSession, BackendName } from '@/src/server/auth/types';
import { ensureBackendUserIds } from '@/src/server/backend/backend-user-ids';
import { serverRequest } from '@/src/server/backend/http';
import { buildBackendRequestHeaders } from '@/src/server/backend/request-headers';
import { logger } from '@/src/server/logger';
import {
  DEFAULT_PORTAL_USER_SETTINGS,
  normalizePortalUserSettings,
  type PortalUserSettings,
} from '@/src/user-settings/contracts';

const USER_APP_SETTINGS_GET_PATH = '/api/v5-m1/aaa.user-app-settings/Get';
const USER_APP_SETTINGS_SET_PATH = '/api/v5-m1/aaa.user-app-settings/Set';

type UserAppSettingsResponse = {
  settingFsx?: string | null;
  data?: {
    settingFsx?: string | null;
  };
};

function getBackendBaseUrl(backend: BackendName): string {
  logger.debug('Resolve backend base URL for user settings', { backend });

  const env = getEnv();

  switch (backend) {
    case 'core':
      return env.coreBackendBaseUrl;
    case 'gd':
      return env.gdBackendBaseUrl;
    case 'notification':
      return env.notificationBackendBaseUrl;
  }
}

function extractSettingFsx(response: UserAppSettingsResponse): string | null {
  logger.debug('Extract user settings payload', {
    hasTopLevelSettingFsx: response.settingFsx !== undefined,
    hasNestedSettingFsx: response.data?.settingFsx !== undefined,
  });

  if (typeof response.settingFsx === 'string' || response.settingFsx === null) {
    return response.settingFsx ?? null;
  }

  if (
    response.data &&
    (typeof response.data.settingFsx === 'string' ||
      response.data.settingFsx === null)
  ) {
    return response.data.settingFsx ?? null;
  }

  return null;
}

function parseStoredSettings(settingFsx: string | null | undefined): PortalUserSettings {
  logger.debug('Parse stored portal user settings', {
    hasSettingFsx: typeof settingFsx === 'string' && settingFsx.trim().length > 0,
  });

  if (typeof settingFsx !== 'string' || settingFsx.trim().length === 0) {
    return DEFAULT_PORTAL_USER_SETTINGS;
  }

  try {
    return normalizePortalUserSettings(JSON.parse(settingFsx));
  } catch (error) {
    logger.error('User settings JSON parse failed', {
      reason: error instanceof Error ? error.message : String(error),
    });
    logger.warn('User settings JSON parse failed; using defaults', {
      reason: error instanceof Error ? error.message : String(error),
    });
    return DEFAULT_PORTAL_USER_SETTINGS;
  }
}

async function resolveSettingsBackendContext(session: AuthSession): Promise<{
  backend: BackendName | null;
  session: AuthSession;
}> {
  const sessionWithBackendUserIds = await ensureBackendUserIds(session);
  const backendPreference: BackendName[] = ['core', 'gd', 'notification'];
  const backend =
    backendPreference.find(
      (candidate) =>
        typeof sessionWithBackendUserIds.backendUserIds?.[candidate] === 'number',
    ) ?? null;

  logger.debug('Resolve user settings backend context', {
    backend,
    backendUserIds: sessionWithBackendUserIds.backendUserIds ?? null,
  });

  return {
    backend,
    session: sessionWithBackendUserIds,
  };
}

export async function fetchPortalUserSettings(
  session: AuthSession,
): Promise<PortalUserSettings> {
  const resolved = await resolveSettingsBackendContext(session);

  if (!resolved.backend) {
    logger.warn('No backend user id available for user settings; using session/default settings');
    return normalizePortalUserSettings(session.userSettings);
  }

  const baseUrl = getBackendBaseUrl(resolved.backend).replace(/\/$/, '');
  const url = `${baseUrl}${USER_APP_SETTINGS_GET_PATH}`;

  logger.debug('Fetch portal user settings', {
    backend: resolved.backend,
    url,
  });

  try {
    const response = await serverRequest<UserAppSettingsResponse>({
      backendName: resolved.backend,
      url,
      headers: buildBackendRequestHeaders({
        backend: resolved.backend,
        session: resolved.session,
        includeEntityId: false,
      }),
    });

    return parseStoredSettings(extractSettingFsx(response));
  } catch (error) {
    logger.error('Portal user settings fetch failed', {
      backend: resolved.backend,
      reason: error instanceof Error ? error.message : String(error),
    });
    logger.warn('Portal user settings fetch failed; using session/default settings', {
      backend: resolved.backend,
      reason: error instanceof Error ? error.message : String(error),
    });
    return normalizePortalUserSettings(session.userSettings);
  }
}

export async function hydratePortalUserSettings(
  session: AuthSession,
): Promise<AuthSession> {
  const resolved = await resolveSettingsBackendContext(session);
  const userSettings = await fetchPortalUserSettings(resolved.session);

  return {
    ...resolved.session,
    userSettings,
  };
}

export async function setPortalUserSettings(
  session: AuthSession,
  settings: PortalUserSettings,
): Promise<{ session: AuthSession; settings: PortalUserSettings }> {
  const normalizedSettings = normalizePortalUserSettings(settings);
  const resolved = await resolveSettingsBackendContext(session);

  if (!resolved.backend) {
    throw new Error('User settings backend is not available for the current session.');
  }

  const baseUrl = getBackendBaseUrl(resolved.backend).replace(/\/$/, '');
  const url = `${baseUrl}${USER_APP_SETTINGS_SET_PATH}`;

  logger.debug('Persist portal user settings', {
    backend: resolved.backend,
    url,
  });

  const response = await serverRequest<UserAppSettingsResponse>({
    backendName: resolved.backend,
    url,
    method: 'POST',
    headers: {
      ...buildBackendRequestHeaders({
        backend: resolved.backend,
        session: resolved.session,
        includeEntityId: false,
      }),
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      setting: normalizedSettings,
    }),
  });

  const storedSettings = (() => {
    logger.debug('Normalize persisted portal user settings response', {
      backend: resolved.backend,
    });

    const settingFsx = extractSettingFsx(response);
    if (typeof settingFsx === 'string' || settingFsx === null) {
      return parseStoredSettings(settingFsx);
    }
    return normalizedSettings;
  })();

  return {
    session: {
      ...resolved.session,
      userSettings: storedSettings,
    },
    settings: storedSettings,
  };
}

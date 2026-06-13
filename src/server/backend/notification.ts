import 'server-only';

import { getEnv } from '@/src/config/env.server';
import { BackendHttpAdapter } from '@/src/server/backend/backend-http-adapter';
import type { BackendAdapter } from '@/src/server/backend/types';

export function createNotificationBackendAdapter(): BackendAdapter {
      const { notificationBackendBaseUrl, notificationBackendProfilePath } =
            getEnv();
      return new BackendHttpAdapter({
            backendName: 'notification',
            baseUrl: notificationBackendBaseUrl,
            profilePath: `${notificationBackendProfilePath}/aaa.user-profile/Get`,
            userEntitiesPath: '/api/v5-m1/aaa.user-entity-profile-check/Get',
      });
}

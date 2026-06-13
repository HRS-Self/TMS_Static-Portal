import 'server-only';

import { getEnv } from '@/src/config/env.server';
import { BackendHttpAdapter } from '@/src/server/backend/backend-http-adapter';
import type { BackendAdapter } from '@/src/server/backend/types';

export function createGdBackendAdapter(): BackendAdapter {
      const { gdBackendBaseUrl, gdBackendProfilePath } = getEnv();
      return new BackendHttpAdapter({
            backendName: 'gd',
            baseUrl: gdBackendBaseUrl,
            profilePath: `${gdBackendProfilePath}/aaa.user-profile/Get`,
            userEntitiesPath: '/api/v5-m1/aaa.user-entity-profile-check/Get',
      });
}

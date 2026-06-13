import 'server-only';

import { getEnv } from '@/src/config/env.server';
import type { BackendName } from '@/src/server/auth/types';
import { serverRequest } from '@/src/server/backend/http';
import { buildBasicAuthorizationHeaders } from '@/src/server/backend/request-headers';
import { logger } from '@/src/server/logger';

type ResolveKeyResponse = {
      status?: string;
      data?: {
            id?: number;
            recordKey?: string;
      };
};

function getBackendGatewayBaseUrl(backend: BackendName): string {
      const env = getEnv();

      switch (backend) {
            case 'gd':
                  return env.gdGatewayBaseUrl;
            case 'core':
                  return env.coreGatewayBaseUrl;
            case 'notification':
                  return env.notificationGatewayBaseUrl;
      }
}

function buildResolveKeyUrl({
      backend,
      entityName,
      id,
      recordKey,
}: {
      backend: BackendName;
      entityName: string;
      id?: number;
      recordKey?: string;
}): string {
      const baseUrl = getBackendGatewayBaseUrl(backend);
      const url = new URL(
            `${baseUrl.replace(/\/$/, '')}/api/v5-m1/dynamic-pages/ResolveKey`,
      );
      url.searchParams.set('entityName', entityName);
      if (typeof id === 'number') {
            url.searchParams.set('id', String(id));
      }
      if (recordKey) {
            url.searchParams.set('recordKey', recordKey);
      }
      return url.toString();
}

export async function resolveRecordKeyFromBackendId({
      backend,
      entityName,
      id,
}: {
      backend: BackendName;
      entityName: string;
      id: number;
}): Promise<string | undefined> {
      const url = buildResolveKeyUrl({ backend, entityName, id });
      const response = await serverRequest<ResolveKeyResponse>({
            backendName: `${backend}Gateway`,
            headers: buildBasicAuthorizationHeaders(),
            url,
      });
      const recordKey = response.data?.recordKey;

      logger.debug('Resolve backend id to record key', {
            backend,
            entityName,
            hasRecordKey: Boolean(recordKey),
      });

      return typeof recordKey === 'string' && recordKey.trim()
            ? recordKey.trim()
            : undefined;
}

import 'server-only';

import { getEnv } from '@/src/config/env.server';
import type { SurfaceWriterConfig } from '@/src/portal/surfaces/types';
import type { AuthSession, BackendName } from '@/src/server/auth/types';
import { serverRequest } from '@/src/server/backend/http';
import { buildBackendRequestHeaders } from '@/src/server/backend/request-headers';
import { logger } from '@/src/server/logger';

function backendBaseUrl(backend: BackendName): string {
  const env = getEnv();
  logger.debug('Resolve backend base URL for writer', { backend });

  switch (backend) {
    case 'gd':
      return env.gdBackendBaseUrl;
    case 'core':
      return env.coreBackendBaseUrl;
    case 'notification':
      return env.notificationBackendBaseUrl;
  }
}

function buildWriterUrl(backend: BackendName, path: string): string {
  const baseUrl = backendBaseUrl(backend).replace(/\/$/, '');
  const normalizedPath = path.startsWith('/') ? path : `/${path}`;
  const url = `${baseUrl}${normalizedPath}`;
  logger.debug('Build writer URL', {
    backend,
    path,
    url,
  });
  return url;
}

export async function executeSurfaceWriter<TResponse>(input: {
  session: AuthSession;
  writer: SurfaceWriterConfig;
  body?: BodyInit;
  contentType?: string;
}): Promise<TResponse> {
  logger.debug('Execute surface writer', {
    surfaceId: input.writer.surfaceId,
    buttonId: input.writer.buttonId,
    backend: input.writer.backend,
    method: input.writer.method,
    path: input.writer.path,
    hasBody: Boolean(input.body),
  });

  const headers = {
    ...buildBackendRequestHeaders({
      backend: input.writer.backend,
      session: input.session,
      includeEntityId: input.writer.includeEntityId,
    }),
    ...(input.contentType ? { 'Content-Type': input.contentType } : {}),
  };

  return serverRequest<TResponse>({
    backendName: input.writer.backend,
    url: buildWriterUrl(input.writer.backend, input.writer.path),
    method: input.writer.method,
    headers,
    body: input.body,
  });
}

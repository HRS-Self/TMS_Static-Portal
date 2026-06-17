import 'server-only';

import { serverRequest } from '@/src/server/backend/http';
import { buildBackendRequestHeaders } from '@/src/server/backend/request-headers';
import { logger } from '@/src/server/logger';
import type {
      BackendAdapter,
      BackendContext,
      BackendProfileDto,
      BackendUserEntityDto,
} from '@/src/server/backend/types';

type BackendHttpAdapterOptions = {
      backendName: 'core' | 'gd' | 'notification';
      baseUrl: string;
      profilePath: string;
      userEntitiesPath: string;
};

export class BackendHttpAdapter implements BackendAdapter {
      public constructor(private readonly options: BackendHttpAdapterOptions) {}

      private buildHeaders(
            context: BackendContext,
            options?: { includeEntityId?: boolean },
      ): Record<string, string> {
            const includeEntityId = options?.includeEntityId ?? true;
            logger.debug('Build backend headers', {
                  backendName: this.options.backendName,
                  includeEntityId,
            });
            return buildBackendRequestHeaders({
                  backend: this.options.backendName,
                  includeEntityId,
                  session: context.session,
            });
      }

      public async getProfile(
            context: BackendContext,
      ): Promise<BackendProfileDto> {
            const url = `${this.options.baseUrl.replace(/\/$/, '')}${this.options.profilePath}`;
            return serverRequest<BackendProfileDto>({
                  backendName: this.options.backendName,
                  url,
                  headers: this.buildHeaders(context),
            });
      }

      public async getUserEntities(
            context: BackendContext,
      ): Promise<BackendUserEntityDto[]> {
            const url = `${this.options.baseUrl.replace(/\/$/, '')}${this.options.userEntitiesPath}`;
            const data = await serverRequest<{ list?: BackendUserEntityDto[] }>(
                  {
                        backendName: this.options.backendName,
                        url,
                        headers: this.buildHeaders(
                              {
                                    session: {
                                          ...context.session,
                                          backendEntityIds: undefined,
                                          entityTitle: undefined,
                                    },
                              },
                              { includeEntityId: false },
                        ),
                  },
            );
            return Array.isArray(data?.list) ? data.list : [];
      }
}

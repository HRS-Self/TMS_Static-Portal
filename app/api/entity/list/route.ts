import { NextResponse } from 'next/server';

import { buildIdpLoginUrl } from '@/src/server/auth/idp';
import {
  clearPortalSessionCookiesOnResponse,
  getOptionalSession,
} from '@/src/server/auth/session';
import { listEntityChoices } from '@/src/server/entity/entity-choices';
import { logger } from '@/src/server/logger';

export const dynamic = 'force-dynamic';

export async function GET(request: Request) {
  const session = await getOptionalSession();
  logger.debug('Entity list request', { hasSession: Boolean(session) });
  if (!session) {
    const url = new URL(request.url);
    const returnUrl = url.searchParams.get('returnUrl') ?? '/entity';
    logger.debug('Decision: no session => 401 with loginUrl', {
      returnUrl,
    });
    const response = NextResponse.json(
      {
        error: 'unauthorized',
        loginUrl: buildIdpLoginUrl(returnUrl),
      },
      { status: 401 },
    );
    clearPortalSessionCookiesOnResponse(response);
    return response;
  }

  const entities = await listEntityChoices(session);

  return NextResponse.json({ entities });
}

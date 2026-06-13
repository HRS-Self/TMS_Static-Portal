import { redirect } from 'next/navigation';
import type { NextRequest } from 'next/server';

import { getEnv } from '@/src/config/env.server';
import { buildIdpSignoutUrl } from '@/src/server/auth/idp';
import { clearPortalSession } from '@/src/server/auth/session';
import { logger } from '@/src/server/logger';

export async function GET(request: NextRequest) {
  const from = request.nextUrl.searchParams.get('from') ?? '/';

  logger.debug('Logout requested', { from });

  await clearPortalSession();

  const { devBypassIdp } = getEnv();
  if (devBypassIdp) {
    logger.debug('Logout decision: dev bypass => local redirect', {
      devBypassIdp,
    });
    redirect('/');
  }

  redirect(buildIdpSignoutUrl(from));
}

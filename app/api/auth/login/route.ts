import { redirect } from 'next/navigation';
import type { NextRequest } from 'next/server';

import { buildIdpLoginUrl } from '@/src/server/auth/idp';
import { clearPortalSession } from '@/src/server/auth/session';
import { logger } from '@/src/server/logger';

export async function GET(request: NextRequest) {
  const returnUrl = request.nextUrl.searchParams.get('returnUrl') ?? '/entity';

  logger.debug('Login redirect requested', { returnUrl });

  await clearPortalSession();
  const url = buildIdpLoginUrl(returnUrl);
  redirect(url);
}

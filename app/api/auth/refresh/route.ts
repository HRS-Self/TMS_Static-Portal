import { redirect } from "next/navigation";
import { type NextRequest } from "next/server";

import { getEnv } from "@/src/config/env.server";
import { buildIdpLoginUrl } from "@/src/server/auth/idp";
import { logger } from "@/src/server/logger";

export const dynamic = "force-dynamic";

export async function GET(request: NextRequest) {
  const returnUrl =
    request.nextUrl.searchParams.get("returnUrl") ?? "/entity";

  logger.debug("Session refresh redirect requested", { returnUrl });

  if (getEnv().devBypassIdp) {
    redirect(`/api/auth/dev-bypass?returnUrl=${encodeURIComponent(returnUrl)}`);
  }

  redirect(buildIdpLoginUrl(returnUrl));
}

import "server-only";

import type { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";

import { getEnv } from "@/src/config/env.server";
import {
  sealSession,
  unsealSession,
} from "@/src/server/auth/signed-session-cookie";
import type { AuthSession } from "@/src/server/auth/types";
import { logger } from "@/src/server/logger";

/** Legacy cookie from the pre-signed-session implementation; cleared on login/logout. */
const LEGACY_IDP_TOKEN_COOKIE = "tms_idp_token";

function shouldSessionCookieBeSecure(): boolean {
  logger.debug("Determine if session cookie should be secure", {
    nodeEnv: process.env.NODE_ENV,
    insecureFlag: process.env.SESSION_COOKIE_INSECURE,
  });
  if (
    process.env.NODE_ENV === "development" ||
    process.env.SESSION_COOKIE_INSECURE === "1" ||
    process.env.SESSION_COOKIE_INSECURE === "true"
  ) {
    logger.debug("Session cookie secure decision", { secure: false });
    return false;
  }
  try {
    const secure = new URL(getEnv().appBaseUrl.trim()).protocol === "https:";
    logger.debug("Session cookie secure decision", { secure });
    return secure;
  } catch (error) {
    logger.error("Failed to parse APP_BASE_URL for secure cookie decision", {
      reason: error instanceof Error ? error.message : String(error),
    });
    return false;
  }
}

function sessionCookieBase(maxAgeSeconds: number) {
  return {
    httpOnly: true,
    secure: shouldSessionCookieBeSecure(),
    sameSite: "lax" as const,
    path: "/",
    maxAge: maxAgeSeconds,
  };
}

function isSessionPastExpiry(session: AuthSession): boolean {
  const expiryMs = parseExpiry(session.expiry);
  const now = Date.now();
  const unparseable = expiryMs === null;
  const expired = expiryMs !== null ? expiryMs < now : true;
  logger.debug("Session expiry check", { unparseable, expired });
  return expired;
}

function parseExpiry(expiry: string): number | null {
  try {
    const fixed = expiry.trim();
    const hasFixed = Boolean(fixed);
    logger.debug("Parse expiry input", { hasFixed });
    if (!fixed) return null;
    if (/^\d+$/.test(fixed)) {
      const n = Number(fixed);
      const finite = Number.isFinite(n);
      logger.debug("Parse numeric expiry", { finite });
      if (!finite) return null;
      return n < 1_000_000_000_000 ? n * 1000 : n;
    }

    const direct = new Date(fixed);
    const directOk = !Number.isNaN(direct.getTime());
    logger.debug("Parse expiry date direct", { directOk });
    if (directOk) return direct.getTime();

    const plusAsSpace = new Date(fixed.replace(/\+/g, " "));
    return Number.isNaN(plusAsSpace.getTime()) ? null : plusAsSpace.getTime();
  } catch (error) {
    logger.error("Parse expiry threw", {
      reason: error instanceof Error ? error.message : String(error),
    });
    return null;
  }
}

/** Persist session for Route Handlers that build a `NextResponse`. */
export function applyPortalSessionCookie(
  response: NextResponse,
  session: AuthSession,
  maxAgeSeconds: number,
): void {
  logger.debug("Apply portal session cookie", {
    maxAgeSeconds,
    hasEntityId: Boolean(session.entityId),
  });
  const { sessionCookieName } = getEnv();
  const resolvedMaxAgeSeconds = (() => {
    const expiryMs = parseExpiry(session.expiry);
    logger.debug("Resolve session cookie maxAge", {
      hasExpiryMs: expiryMs !== null,
      fallbackMaxAgeSeconds: maxAgeSeconds,
    });
    if (expiryMs === null) return maxAgeSeconds;
    const remainingSeconds = Math.floor((expiryMs - Date.now()) / 1000);
    if (!Number.isFinite(remainingSeconds)) return maxAgeSeconds;
    return Math.max(1, remainingSeconds);
  })();
  response.cookies.set(
    sessionCookieName,
    sealSession(session),
    sessionCookieBase(resolvedMaxAgeSeconds),
  );
  response.cookies.delete(LEGACY_IDP_TOKEN_COOKIE);
}

/** Clear portal session cookies (current + legacy). */
export function clearPortalSessionCookiesOnResponse(
  response: NextResponse,
): void {
  const { sessionCookieName } = getEnv();
  response.cookies.delete(sessionCookieName);
  response.cookies.delete(LEGACY_IDP_TOKEN_COOKIE);
}

export async function setPortalSession(session: AuthSession): Promise<void> {
  const cookieStore = await cookies();
  logger.debug("Set portal session", { hasEntityId: Boolean(session.entityId) });
  const { sessionCookieName } = getEnv();
  const resolvedMaxAgeSeconds = (() => {
    const expiryMs = parseExpiry(session.expiry);
    logger.debug("Resolve portal session maxAge", {
      hasExpiryMs: expiryMs !== null,
    });
    if (expiryMs === null) return 60 * 60 * 12;
    const remainingSeconds = Math.floor((expiryMs - Date.now()) / 1000);
    if (!Number.isFinite(remainingSeconds)) return 60 * 60 * 12;
    return Math.max(1, remainingSeconds);
  })();
  cookieStore.set(
    sessionCookieName,
    sealSession(session),
    sessionCookieBase(resolvedMaxAgeSeconds),
  );
  cookieStore.delete(LEGACY_IDP_TOKEN_COOKIE);
}

export async function clearPortalSession(): Promise<void> {
  const cookieStore = await cookies();
  const { sessionCookieName } = getEnv();
  cookieStore.delete(sessionCookieName);
  cookieStore.delete(LEGACY_IDP_TOKEN_COOKIE);
}

export async function readPortalSession(): Promise<AuthSession | null> {
  const cookieStore = await cookies();
  const { sessionCookieName } = getEnv();
  const raw = cookieStore.get(sessionCookieName)?.value;
  return unsealSession(raw);
}

/**
 * Returns the current session when the signed cookie verifies and expiry is OK.
 * Does not redirect (for public pages such as the landing screen).
 */
export async function getOptionalSession(): Promise<AuthSession | null> {
  const session = await readPortalSession();
  logger.debug("Optional session read", { hasSession: Boolean(session) });
  if (!session) return null;
  const expired = isSessionPastExpiry(session);
  logger.debug("Optional session expiry decision", { expired });
  if (expired) return null;
  return session;
}

/**
 * The main auth guard. Call from any server component or server action to
 * ensure the user is authenticated. Redirects to IDP login if not.
 */
export async function detectLogin(
  currentPath?: string,
): Promise<AuthSession> {
  const env = getEnv();
  const returnUrl = currentPath ?? env.landingPage;

  logger.debug("Detect login", {
    hasCurrentPath: Boolean(currentPath),
    devBypassIdp: env.devBypassIdp,
  });

  if (env.devBypassIdp) {
    return handleDevBypass(returnUrl);
  }

  const session = await readPortalSession();
  logger.debug("Portal session read", { hasSession: Boolean(session) });
  if (!session) {
    logger.info("No valid portal session cookie; redirecting to IDP", {
      returnUrl,
    });
    redirect(`/api/auth/login?returnUrl=${encodeURIComponent(returnUrl)}`);
  }

  if (isSessionPastExpiry(session)) {
    logger.info("Portal session expired; redirecting to IDP", { returnUrl });
    redirect(`/api/auth/login?returnUrl=${encodeURIComponent(returnUrl)}`);
  }

  const expiryMs = parseExpiry(session.expiry);
  const now = Date.now();
  const recheckMs = env.idpRecheckTimeoutMinutes * 60 * 1000;
  if (expiryMs !== null && expiryMs - now < recheckMs) {
    logger.info("Session nearing expiry; still valid for now", {
      userRecordKey: session.userRecordKey,
    });
  }

  return session;
}

async function handleDevBypass(returnUrl: string): Promise<AuthSession> {
  const session = await readPortalSession();
  logger.debug("Handle dev bypass", { hasSession: Boolean(session), returnUrl });
  if (session && !isSessionPastExpiry(session)) {
    return session;
  }

  redirect(`/api/auth/dev-bypass?returnUrl=${encodeURIComponent(returnUrl)}`);
}

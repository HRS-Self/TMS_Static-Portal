import "server-only";

import { createHash } from "node:crypto";

import { getEnv } from "@/src/config/env.server";
import type { IdpResolveTokenResponse } from "@/src/server/auth/types";
import { logger } from "@/src/server/logger";

export class IdpResolveTokenServiceError extends Error {
  public readonly status?: number;

  public constructor(message: string, status?: number) {
    super(message);
    this.name = "IdpResolveTokenServiceError";
    this.status = status;
  }
}

function sha256(input: string): string {
  logger.debug("sha256", { inputLen: input.length });
  return createHash("sha256").update(input, "utf8").digest("hex");
}

function normalizeTrailingSlash(url: string): string {
  const hasSlash = url.endsWith("/");
  logger.debug("Normalize trailing slash", { hasSlash });
  return hasSlash ? url : `${url}/`;
}

function normalizePortalPath(pathname: string): string {
  logger.debug("Normalize portal path", { pathname });
  const withSlash = pathname.startsWith("/") ? pathname : `/${pathname}`;
  return withSlash.replace(/\/{2,}/g, "/");
}

function removePortalPublicPrefix(pathname: string): string {
  logger.debug("Remove portal public prefix", { pathname });
  if (pathname === "/app") {
    return "/";
  }
  if (pathname.startsWith("/app/")) {
    return pathname.slice("/app".length);
  }
  return pathname;
}

export function buildAppUrl(
  returnPath?: string,
  fallbackPath?: string,
): URL {
  const { appBaseUrl, landingPage } = getEnv();
  const base = new URL(appBaseUrl);
  const fallback = fallbackPath ?? landingPage;
  const safePath =
    returnPath && returnPath.startsWith("/") && !returnPath.startsWith("//")
      ? returnPath
      : fallback;
  const target = new URL(safePath, "http://portal.local");
  const targetPath = normalizePortalPath(
    removePortalPublicPrefix(target.pathname),
  );

  base.pathname = targetPath;
  base.search = target.search;
  base.hash = target.hash;
  return base;
}

/**
 * Build the signed URL that redirects the browser to the Conit IDP login page.
 * Protocol: `{idpClientRedirectUrl}idprequest?clientId=...&callback=...&timestamp=...&sign=SHA256(...)`
 */
export function buildIdpLoginUrl(returnPath = "/"): string {
  const { appBaseUrl, idpClientRedirectUrl, myClientId, myClientSecret } =
    getEnv();

  const safePath = returnPath.startsWith("/") ? returnPath : `/${returnPath}`;
  const callback = `${normalizeTrailingSlash(appBaseUrl)}api/auth/callback?returnUrl=${safePath}`;

  const timestamp = Date.now();
  const query = `clientId=${myClientId}&callback=${callback}&timestamp=${timestamp}`;
  const sign = sha256(`${query}&clientSecret=${myClientSecret}`);

  const base = normalizeTrailingSlash(idpClientRedirectUrl);
  return `${base}idprequest?${query}&sign=${sign}`;
}

/**
 * Build the signed URL that redirects the browser to the Conit IDP sign-out page.
 */
export function buildIdpSignoutUrl(returnPath = "/"): string {
  const { appBaseUrl, idpClientRedirectUrl, myClientId, myClientSecret } =
    getEnv();

  const safePath = returnPath.startsWith("/") ? returnPath : `/${returnPath}`;
  const callback = `${normalizeTrailingSlash(appBaseUrl)}api/auth/signout-callback?from=${safePath}`;

  const timestamp = Date.now();
  const query = `clientId=${myClientId}&callback=${callback}&timestamp=${timestamp}`;
  const sign = sha256(`${query}&clientSecret=${myClientSecret}`);

  const base = normalizeTrailingSlash(idpClientRedirectUrl);
  return `${base}idprequest/signout?${query}&sign=${sign}`;
}

/**
 * Verify the HMAC-style signature that the IDP sends back in the callback POST body.
 * Returns `true` when the sign matches and the timestamp is fresh (< 10 min).
 */
export function verifyCallbackSignature(
  clientId: string,
  token: string,
  timestamp: string,
  sign: string,
): { valid: boolean; reason?: string } {
  const { myClientId, myClientSecret } = getEnv();

  logger.debug("Verify IDP callback signature", {
    clientIdMatches: clientId === myClientId,
    hasToken: Boolean(token),
    hasTimestamp: Boolean(timestamp),
    hasSign: Boolean(sign),
  });

  if (clientId !== myClientId) {
    logger.debug("Decision: clientId mismatch", { reason: "client_id_mismatch" });
    return { valid: false, reason: "client_id_mismatch" };
  }

  const query = `clientId=${clientId}&token=${token}&timestamp=${timestamp}`;
  const expected = sha256(`${query}&clientSecret=${myClientSecret}`);
  if (sign !== expected) {
    logger.debug("Decision: invalid signature", { reason: "invalid_signature" });
    return { valid: false, reason: "invalid_signature" };
  }

  const age = Date.now() - Number(timestamp);
  const isFresh = age <= 10 * 60 * 1000;
  logger.debug("IDP callback timestamp freshness", { isFresh });
  if (!isFresh) {
    logger.debug("Decision: expired timestamp", { reason: "expired_timestamp" });
    return { valid: false, reason: "expired_timestamp" };
  }

  return { valid: true };
}

/**
 * Exchange the IDP callback token for full user info via the resolvetoken API.
 * Uses HTTP Basic auth (`APP_CLIENT_ID:APP_CLIENT_SECRET`).
 */
export async function resolveIdpToken(
  token: string,
): Promise<IdpResolveTokenResponse | null> {
  const { idpBaseUrl, myClientId, myClientSecret } = getEnv();
  logger.debug("Resolve IDP token", { hasToken: Boolean(token) });
  const credentials = Buffer.from(
    `${myClientId}:${myClientSecret}`,
    "utf8",
  ).toString("base64");

  const url = `${normalizeTrailingSlash(idpBaseUrl)}api/idprequest/resolvetoken`;

  logger.debug("IDP resolvetoken request", { url, method: "POST" });

  try {
    const response = await fetch(url, {
      method: "POST",
      cache: "no-store",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: `Basic ${credentials}`,
      },
      body: JSON.stringify({ token }),
    });

    if (!response.ok) {
      logger.error("IDP resolvetoken responded with non-OK status", {
        status: response.status,
      });
      if (
        response.status === 401 ||
        response.status === 403 ||
        response.status === 408 ||
        response.status === 429 ||
        response.status >= 500
      ) {
        throw new IdpResolveTokenServiceError(
          "IDP resolvetoken service rejected or failed the request",
          response.status,
        );
      }
      return null;
    }

    const data = (await response.json()) as Partial<IdpResolveTokenResponse>;

    if (!data?.user?.RecordKey) {
      logger.warn("IDP resolvetoken returned payload without RecordKey");
      return null;
    }

    return data as IdpResolveTokenResponse;
  } catch (error) {
    if (error instanceof IdpResolveTokenServiceError) {
      throw error;
    }

    logger.error("IDP resolvetoken request failed", {
      reason: error instanceof Error ? error.message : "unknown",
    });
    throw new IdpResolveTokenServiceError("IDP resolvetoken request failed");
  }
}

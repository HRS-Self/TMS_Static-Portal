import "server-only";

import { logger } from "@/src/server/logger";

type Env = {
  appBaseUrl: string;
  landingPage: string;

  idpBaseUrl: string;
  idpClientRedirectUrl: string;
  myClientId: string;
  myClientSecret: string;
  devBypassIdp: boolean;

  sessionCookieName: string;
  inactivityTimeoutMinutes: number;
  idpRecheckTimeoutMinutes: number;

  gdBackendBaseUrl: string;
  gdBackendProfilePath: string;
  coreBackendBaseUrl: string;
  coreBackendProfilePath: string;
  notificationBackendBaseUrl: string;
  notificationBackendProfilePath: string;
  gdGatewayBaseUrl: string;
  coreGatewayBaseUrl: string;
  notificationGatewayBaseUrl: string;
};

let cachedEnv: Env | null = null;

function mustGet(name: string): string {
  const value = process.env[name];
  if (!value) {
    logger.error("Missing required environment variable", { name });
    throw new Error(`Missing required environment variable: ${name}`);
  }
  logger.debug("Environment variable present", { name });
  return value;
}

function optional(name: string, fallback: string): string {
  const value = process.env[name] ?? fallback;
  logger.debug("Optional environment variable", {
    name,
    usedFallback: process.env[name] === undefined,
  });
  return value;
}

function optionalAny(names: string[], fallback: string): string {
  for (const name of names) {
    const value = process.env[name];
    if (value) {
      logger.debug("Optional environment variable", {
        name,
        usedFallback: false,
      });
      return value;
    }
  }
  logger.debug("Optional environment variable", {
    name: names.join("|"),
    usedFallback: true,
  });
  return fallback;
}

function optionalBool(name: string, fallback: boolean): boolean {
  const raw = process.env[name];
  const hasRaw = Boolean(raw);
  if (!raw) {
    logger.debug("Optional boolean env var missing; using fallback", { name, fallback });
    return fallback;
  }
  const parsed = ["1", "true", "yes", "on"].includes(raw.toLowerCase());
  logger.debug("Optional boolean env var parsed", { name, hasRaw, parsed });
  return parsed;
}

function optionalInt(name: string, fallback: number): number {
  const raw = process.env[name];
  if (!raw) {
    logger.debug("Optional int env var missing; using fallback", { name, fallback });
    return fallback;
  }
  const parsed = parseInt(raw, 10);
  const isValid = !Number.isNaN(parsed);
  logger.debug("Optional int env var parsed", { name, isValid });
  return isValid ? parsed : fallback;
}

export function getEnv(): Env {
  const isProduction = process.env.NODE_ENV === "production";
  logger.debug("Get env", { isProduction, hasCache: Boolean(cachedEnv) });
  if (cachedEnv && isProduction) {
    return cachedEnv;
  }

  const resolved: Env = {
    appBaseUrl: mustGet("APP_BASE_URL"),
    landingPage: optionalAny(["LANDING_PAGE", "LandingPage"], "/dashboard"),

    idpBaseUrl: mustGet("IDP_BASE_URL"),
    idpClientRedirectUrl: optional(
      "IDP_CLIENT_REDIRECT_URL",
      mustGet("IDP_BASE_URL"),
    ),
    myClientId: mustGet("MY_CLIENT_ID"),
    myClientSecret: mustGet("MY_CLIENT_SECRET"),
    devBypassIdp:
      process.env.NODE_ENV !== "production" &&
      optionalBool("DEV_BYPASS_IDP", false),

    sessionCookieName: optional("SESSION_COOKIE_NAME", "portal_sess"),
    inactivityTimeoutMinutes: optionalInt("INACTIVITY_TIMEOUT_MINUTES", 2),
    idpRecheckTimeoutMinutes: optionalInt("IDP_RECHECK_TIMEOUT_MINUTES", 5),

    gdBackendBaseUrl: mustGet("GD_BACKEND_BASE_URL"),
    gdBackendProfilePath: optional("GD_BACKEND_PROFILE_PATH", "/api/v1/me"),
    coreBackendBaseUrl: mustGet("CORE_BACKEND_BASE_URL"),
    coreBackendProfilePath: optional(
      "CORE_BACKEND_PROFILE_PATH",
      "/api/v1/me",
    ),
    notificationBackendBaseUrl: mustGet("NOTIFICATION_BACKEND_BASE_URL"),
    notificationBackendProfilePath: optional(
      "NOTIFICATION_BACKEND_PROFILE_PATH",
      "/api/v1/me",
    ),
    gdGatewayBaseUrl: mustGet("GD_GATEWAY_BASE_URL"),
    coreGatewayBaseUrl: mustGet("CORE_GATEWAY_BASE_URL"),
    notificationGatewayBaseUrl: mustGet("NOTIFICATION_GATEWAY_BASE_URL"),
  };

  if (isProduction) {
    cachedEnv = resolved;
  }

  return resolved;
}

"use client";

import { useEffect, useRef } from "react";

import { logger } from "@/src/logger";

type SessionRefreshGuardProps = {
  expiry: string;
  inactivityTimeoutMinutes: number;
  recheckTimeoutMinutes: number;
};

const LAST_ACTIVITY_STORAGE_KEY = "portal_last_activity_at";
const REFRESH_ATTEMPT_STORAGE_KEY = "portal_refresh_attempt_expiry";
const ACTIVITY_WRITE_THROTTLE_MS = 1_000;
const CHECK_INTERVAL_MS = 15_000;

function parseExpiry(expiry: string): number | null {
  const fixed = expiry.trim();
  logger.debug("Session refresh guard parseExpiry", {
    hasExpiry: Boolean(fixed),
  });
  if (!fixed) {
    return null;
  }

  if (/^\d+$/.test(fixed)) {
    const parsed = Number(fixed);
    if (!Number.isFinite(parsed)) {
      return null;
    }
    return parsed < 1_000_000_000_000 ? parsed * 1000 : parsed;
  }

  const direct = new Date(fixed);
  if (!Number.isNaN(direct.getTime())) {
    return direct.getTime();
  }

  const plusAsSpace = new Date(fixed.replace(/\+/g, " "));
  return Number.isNaN(plusAsSpace.getTime()) ? null : plusAsSpace.getTime();
}

function readStoredTimestamp(key: string): number | null {
  try {
    const raw = window.sessionStorage.getItem(key);
    logger.debug("Session refresh guard readStoredTimestamp", {
      hasRaw: Boolean(raw),
      key,
    });
    if (!raw) {
      return null;
    }

    const parsed = Number(raw);
    return Number.isFinite(parsed) ? parsed : null;
  } catch (error) {
    logger.error("Session refresh guard storage read failed", {
      key,
      reason: error instanceof Error ? error.message : String(error),
    });
    return null;
  }
}

function writeStoredTimestamp(key: string, value: number): void {
  try {
    window.sessionStorage.setItem(key, String(value));
  } catch (error) {
    logger.error("Session refresh guard storage write failed", {
      key,
      reason: error instanceof Error ? error.message : String(error),
    });
  }
}

export function SessionRefreshGuard({
  expiry,
  inactivityTimeoutMinutes,
  recheckTimeoutMinutes,
}: SessionRefreshGuardProps) {
  const lastActivityAtRef = useRef<number>(0);
  const refreshingRef = useRef(false);

  useEffect(() => {
    const parsedExpiry = parseExpiry(expiry);
    logger.debug("SessionRefreshGuard mount", {
      hasParsedExpiry: parsedExpiry !== null,
      inactivityTimeoutMinutes,
      recheckTimeoutMinutes,
    });

    if (parsedExpiry === null) {
      return undefined;
    }

    const refreshLeadMs = Math.max(0, recheckTimeoutMinutes) * 60 * 1000;
    const inactivityMs = Math.max(0, inactivityTimeoutMinutes) * 60 * 1000;

    const recordActivity = () => {
      const now = Date.now();
      logger.debug("Session refresh guard recordActivity", {
        key: LAST_ACTIVITY_STORAGE_KEY,
        lastActivityAt: lastActivityAtRef.current,
      });
      if (
        lastActivityAtRef.current > 0 &&
        now - lastActivityAtRef.current < ACTIVITY_WRITE_THROTTLE_MS
      ) {
        return;
      }
      lastActivityAtRef.current = now;
      writeStoredTimestamp(LAST_ACTIVITY_STORAGE_KEY, now);
    };

    const storedLastActivityAt = readStoredTimestamp(LAST_ACTIVITY_STORAGE_KEY);
    if (storedLastActivityAt !== null) {
      lastActivityAtRef.current = storedLastActivityAt;
    } else {
      recordActivity();
    }

    const redirectForRefresh = () => {
      logger.debug("Session refresh guard redirectForRefresh", {
        parsedExpiry,
        refreshing: refreshingRef.current,
      });
      if (refreshingRef.current) {
        return;
      }

      refreshingRef.current = true;
      writeStoredTimestamp(REFRESH_ATTEMPT_STORAGE_KEY, parsedExpiry);
      const returnUrl = `${window.location.pathname}${window.location.search}${window.location.hash}`;
      logger.info("SessionRefreshGuard redirecting for IDP refresh", {
        returnUrl,
      });
      window.location.assign(
        `/api/auth/refresh?returnUrl=${encodeURIComponent(returnUrl)}`,
      );
    };

    const checkForRefresh = () => {
      if (refreshingRef.current) {
        return;
      }

      const now = Date.now();
      const remainingMs = parsedExpiry - now;
      if (remainingMs > refreshLeadMs) {
        return;
      }

      const inactiveTooLong = now - lastActivityAtRef.current > inactivityMs;
      if (inactiveTooLong) {
        logger.debug("SessionRefreshGuard skip refresh because session is idle", {
          inactiveForMs: now - lastActivityAtRef.current,
          inactivityMs,
        });
        return;
      }

      const refreshAttemptedForExpiry = readStoredTimestamp(
        REFRESH_ATTEMPT_STORAGE_KEY,
      );
      if (refreshAttemptedForExpiry === parsedExpiry) {
        logger.debug("SessionRefreshGuard refresh already attempted for expiry", {
          parsedExpiry,
        });
        return;
      }

      redirectForRefresh();
    };

    const handleVisibilityChange = () => {
      logger.debug("Session refresh guard visibility change", {
        visibilityState: document.visibilityState,
      });
      if (document.visibilityState === "visible") {
        recordActivity();
        checkForRefresh();
      }
    };

    const handleFocus = () => {
      recordActivity();
      checkForRefresh();
    };

    if (document.visibilityState === "visible") {
      recordActivity();
    }

    const interval = window.setInterval(checkForRefresh, CHECK_INTERVAL_MS);
    window.addEventListener("pointerdown", recordActivity, { passive: true });
    window.addEventListener("keydown", recordActivity);
    window.addEventListener("scroll", recordActivity, { passive: true });
    window.addEventListener("focus", handleFocus);
    document.addEventListener("visibilitychange", handleVisibilityChange);
    checkForRefresh();

    return () => {
      window.clearInterval(interval);
      window.removeEventListener("pointerdown", recordActivity);
      window.removeEventListener("keydown", recordActivity);
      window.removeEventListener("scroll", recordActivity);
      window.removeEventListener("focus", handleFocus);
      document.removeEventListener("visibilitychange", handleVisibilityChange);
    };
  }, [expiry, inactivityTimeoutMinutes, recheckTimeoutMinutes]);

  return null;
}

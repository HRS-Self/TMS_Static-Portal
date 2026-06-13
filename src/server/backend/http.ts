import "server-only";

import { BackendApiError } from "@/src/server/errors";
import { logger } from "@/src/server/logger";

type ServerRequestOptions = {
  backendName: string;
  url: string;
  headers: Record<string, string>;
  method?: "GET" | "POST" | "PUT" | "PATCH" | "DELETE";
  body?: BodyInit;
};

function fetchTimeoutMs(): number {
  const raw = process.env.BACKEND_FETCH_TIMEOUT_MS;
  const hasRaw = Boolean(raw);
  logger.debug("Resolve backend fetch timeout", { hasRaw });
  if (!raw) return 8_000;
  const n = Number.parseInt(raw, 10);
  const isValid = !Number.isNaN(n) && n >= 1;
  logger.debug("Parse backend fetch timeout", { hasRaw, isValid });
  if (!isValid) return 8_000;
  return Math.min(n, 120_000);
}

export async function serverRequest<T>({
  backendName,
  url,
  headers,
  method = "GET",
  body,
}: ServerRequestOptions): Promise<T> {
  const ms = fetchTimeoutMs();
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), ms);

  logger.debug("Backend request start", { backendName, method, url, timeoutMs: ms });

  let response: Response;
  try {
    response = await fetch(url, {
      method,
      cache: "no-store",
      signal: controller.signal,
      headers: {
        Accept: "application/json",
        ...headers,
      },
      body,
    });
  } catch (error) {
    const aborted =
      (error instanceof Error || error instanceof DOMException) &&
      (error as { name?: string }).name === "AbortError";
    logger.error("Backend request threw", {
      backendName,
      url,
      aborted,
      reason: error instanceof Error ? error.message : String(error),
    });
    if (aborted) {
      logger.debug("Decision: abort => timeout http error", {
        backendName,
        timeoutMs: ms,
      });
      throw new BackendApiError(
        `${backendName} request timed out after ${ms}ms`,
        408,
        backendName,
      );
    }
    throw error;
  } finally {
    clearTimeout(timeoutId);
  }

  if (!response.ok) {
    logger.debug("Decision: non-OK backend response => throw", {
      backendName,
      url,
      status: response.status,
    });
    throw new BackendApiError(
      `${backendName} request failed`,
      response.status,
      backendName,
    );
  }

  return (await response.json()) as T;
}

export type LogLevel =
  | "verbosedebug"
  | "debug"
  | "info"
  | "warn"
  | "error"
  | "silent";

type LogContext = Record<string, unknown> | undefined;

type Logger = {
  debug(message: string, context?: LogContext): void;
  info(message: string, context?: LogContext): void;
  warn(message: string, context?: LogContext): void;
  error(message: string, context?: LogContext): void;
  child(bindings: Record<string, unknown>): Logger;
};

const LEVEL_ORDER: Record<LogLevel, number> = {
  verbosedebug: 0,
  debug: 10,
  info: 20,
  warn: 30,
  error: 40,
  silent: 100,
};

function normalizeLevel(raw: string | undefined): LogLevel {
  const v = (raw ?? "").trim().toLowerCase();
  if (v === "verbosedebug" || v === "verbose-debug" || v === "trace")
    return "verbosedebug";
  if (v === "debug") return "debug";
  if (v === "info") return "info";
  if (v === "warn" || v === "warning") return "warn";
  if (v === "error") return "error";
  if (v === "silent" || v === "none" || v === "off") return "silent";
  return "info";
}

function configuredLevel(): LogLevel {
  const raw =
    process.env.NEXT_PUBLIC_LOG_LEVEL ??
    process.env.LOG_LEVEL ??
    (process.env.NODE_ENV === "production" ? "error" : "info");
  return normalizeLevel(raw);
}

function shouldLog(level: LogLevel): boolean {
  return LEVEL_ORDER[level] >= LEVEL_ORDER[configuredLevel()];
}

function redactString(input: string): string {
  const trimmed = input.trim();
  if (!trimmed) return trimmed;
  if (trimmed.length <= 12) return "***";
  return `${trimmed.slice(0, 4)}…${trimmed.slice(-4)}`;
}

function isSensitiveKey(key: string): boolean {
  return /(token|secret|password|authorization|cookie|session|sign|key)/i.test(key);
}

function sanitizeValue(value: unknown, depth: number): unknown {
  if (depth <= 0) return "[max-depth]";
  if (value === null) return null;
  if (value === undefined) return undefined;
  if (typeof value === "string") {
    if (/^[A-Za-z0-9_\-]{24,}$/.test(value)) {
      return redactString(value);
    }
    return value;
  }
  if (typeof value === "number" || typeof value === "boolean") return value;
  if (Array.isArray(value)) {
    return value.slice(0, 50).map((v) => sanitizeValue(v, depth - 1));
  }
  if (typeof value === "object") {
    const input = value as Record<string, unknown>;
    const output: Record<string, unknown> = {};
    for (const [k, v] of Object.entries(input)) {
      if (isSensitiveKey(k)) {
        output[k] = typeof v === "string" ? redactString(v) : "***";
        continue;
      }
      output[k] = sanitizeValue(v, depth - 1);
    }
    return output;
  }
  return String(value);
}

function sanitizeContext(context: LogContext, bindings: Record<string, unknown>):
  | Record<string, unknown>
  | undefined {
  const merged = {
    ...bindings,
    ...(context ?? {}),
  };
  const keys = Object.keys(merged);
  if (keys.length === 0) return undefined;
  return sanitizeValue(merged, 4) as Record<string, unknown>;
}

function asJson(context: LogContext, bindings: Record<string, unknown>): string {
  const sanitized = sanitizeContext(context, bindings);
  if (!sanitized) return "";
  try {
    return ` ${JSON.stringify(sanitized)}`;
  } catch {
    return " [unserializable-context]";
  }
}

function createLogger(bindings: Record<string, unknown>): Logger {
  return {
    debug(message: string, context?: LogContext) {
      if (!shouldLog("debug")) return;
      console.info(`[portal][debug] ${message}${asJson(context, bindings)}`);
    },
    info(message: string, context?: LogContext) {
      if (!shouldLog("info")) return;
      console.info(`[portal] ${message}${asJson(context, bindings)}`);
    },
    warn(message: string, context?: LogContext) {
      if (!shouldLog("warn")) return;
      console.warn(`[portal] ${message}${asJson(context, bindings)}`);
    },
    error(message: string, context?: LogContext) {
      if (!shouldLog("error")) return;
      console.error(`[portal] ${message}${asJson(context, bindings)}`);
    },
    child(nextBindings: Record<string, unknown>) {
      return createLogger({ ...bindings, ...nextBindings });
    },
  };
}

export const logger: Logger = createLogger({});
export type { Logger };

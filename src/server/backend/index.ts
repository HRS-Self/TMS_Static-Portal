import "server-only";

import { createCoreBackendAdapter } from "@/src/server/backend/core";
import { createGdBackendAdapter } from "@/src/server/backend/gd";
import { createNotificationBackendAdapter } from "@/src/server/backend/notification";
import type { Backends } from "@/src/server/backend/types";
import { logger } from "@/src/server/logger";

let backendsCache: Backends | null = null;

export function getBackends(): Backends {
  if (backendsCache) {
    logger.debug("Backends cache hit", { hasCache: true });
    return backendsCache;
  }

  logger.debug("Backends cache miss; creating adapters", { hasCache: false });

  backendsCache = {
    gd: createGdBackendAdapter(),
    core: createCoreBackendAdapter(),
    notification: createNotificationBackendAdapter(),
  };

  return backendsCache;
}

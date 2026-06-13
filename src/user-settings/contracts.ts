 import { logger } from '@/src/logger';

export const RESERVATION_WINDOW_MIN_HOURS = -168;
export const RESERVATION_WINDOW_MAX_HOURS = 168;

export type ReservationTimelineSettings = {
  currentStartOffsetHours: number;
  currentEndOffsetHours: number;
};

export type PortalUserSettings = {
  reservationTimeline: ReservationTimelineSettings;
};

export const DEFAULT_PORTAL_USER_SETTINGS: PortalUserSettings = {
  reservationTimeline: {
    currentStartOffsetHours: -24,
    currentEndOffsetHours: 48,
  },
};

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

function toFiniteNumber(value: unknown): number | null {
  logger.debug('Coerce user settings value to finite number', {
    valueType: typeof value,
    hasStringValue: typeof value === 'string' ? value.trim().length > 0 : undefined,
  });

  if (typeof value === 'number' && Number.isFinite(value)) {
    return value;
  }

  if (typeof value === 'string' && value.trim().length > 0) {
    const parsed = Number(value);
    return Number.isFinite(parsed) ? parsed : null;
  }

  return null;
}

function clampHourOffset(value: number, fallback: number): number {
  logger.debug('Clamp reservation hour offset', {
    value,
    fallback,
  });

  const rounded = Math.round(value);
  if (!Number.isFinite(rounded)) {
    return fallback;
  }

  return Math.max(
    RESERVATION_WINDOW_MIN_HOURS,
    Math.min(RESERVATION_WINDOW_MAX_HOURS, rounded),
  );
}

export function normalizePortalUserSettings(value: unknown): PortalUserSettings {
  logger.debug('Normalize portal user settings', {
    isObject: typeof value === 'object' && value !== null,
  });

  const fallback = DEFAULT_PORTAL_USER_SETTINGS.reservationTimeline;

  if (!isRecord(value)) {
    return DEFAULT_PORTAL_USER_SETTINGS;
  }

  const reservationTimeline = isRecord(value.reservationTimeline)
    ? value.reservationTimeline
    : {};

  const startCandidate = toFiniteNumber(
    reservationTimeline.currentStartOffsetHours,
  );
  const endCandidate = toFiniteNumber(
    reservationTimeline.currentEndOffsetHours,
  );

  const currentStartOffsetHours = clampHourOffset(
    startCandidate ?? fallback.currentStartOffsetHours,
    fallback.currentStartOffsetHours,
  );
  const currentEndOffsetHours = clampHourOffset(
    endCandidate ?? fallback.currentEndOffsetHours,
    fallback.currentEndOffsetHours,
  );

  if (currentStartOffsetHours > currentEndOffsetHours) {
    return DEFAULT_PORTAL_USER_SETTINGS;
  }

  return {
    reservationTimeline: {
      currentStartOffsetHours,
      currentEndOffsetHours,
    },
  };
}

export function validatePortalUserSettingsInput(
  value: unknown,
): { ok: true; settings: PortalUserSettings } | { ok: false; error: string } {
  logger.debug('Validate portal user settings input', {
    isObject: typeof value === 'object' && value !== null,
  });

  if (!isRecord(value)) {
    return {
      ok: false,
      error: 'Settings payload must be a JSON object.',
    };
  }

  if (!isRecord(value.reservationTimeline)) {
    return {
      ok: false,
      error: 'Reservation timeline settings are required.',
    };
  }

  const reservationTimeline = value.reservationTimeline;
  const startCandidate = toFiniteNumber(
    reservationTimeline.currentStartOffsetHours,
  );
  const endCandidate = toFiniteNumber(
    reservationTimeline.currentEndOffsetHours,
  );

  if (startCandidate === null || endCandidate === null) {
    return {
      ok: false,
      error: 'Reservation timeline offsets must be numeric hour values.',
    };
  }

  const currentStartOffsetHours = clampHourOffset(
    startCandidate,
    DEFAULT_PORTAL_USER_SETTINGS.reservationTimeline.currentStartOffsetHours,
  );
  const currentEndOffsetHours = clampHourOffset(
    endCandidate,
    DEFAULT_PORTAL_USER_SETTINGS.reservationTimeline.currentEndOffsetHours,
  );

  if (currentStartOffsetHours > currentEndOffsetHours) {
    return {
      ok: false,
      error: 'Current window start must be less than or equal to current window end.',
    };
  }

  return {
    ok: true,
    settings: {
      reservationTimeline: {
        currentStartOffsetHours,
        currentEndOffsetHours,
      },
    },
  };
}

const SUPPORTED_UI_PALETTES = ["indigo", "yellow", "orange"] as const;
const SUPPORTED_UI_DENSITIES = ["compact", "default", "comfortable"] as const;
const SUPPORTED_UI_SHAPES = ["sharp", "soft", "round"] as const;
const SUPPORTED_UI_THEME_MODES = ["light", "dark"] as const;
const SUPPORTED_UI_DRIFT_VISIBILITIES = ["off", "warn", "collect", "warn-and-collect"] as const;

type PortalUIPalette = (typeof SUPPORTED_UI_PALETTES)[number];
type PortalUIDensity = (typeof SUPPORTED_UI_DENSITIES)[number];
type PortalUIShape = (typeof SUPPORTED_UI_SHAPES)[number];
type PortalUIThemeMode = (typeof SUPPORTED_UI_THEME_MODES)[number];
type PortalUIDriftVisibility = (typeof SUPPORTED_UI_DRIFT_VISIBILITIES)[number];

type PortalUIDensityInput = PortalUIDensity | "compressed" | "compreseed" | "cozy";

function normalizePalette(value: string | undefined): PortalUIPalette {
  const normalized = value?.trim().toLowerCase();
  if (normalized === "yello") return "yellow";
  if (SUPPORTED_UI_PALETTES.includes(normalized as PortalUIPalette)) {
    return normalized as PortalUIPalette;
  }
  return "indigo";
}

function normalizeDensity(value: string | undefined): PortalUIDensity {
  const normalized = (value?.trim().toLowerCase() || "compact") as PortalUIDensityInput;
  if (normalized === "compressed" || normalized === "compreseed") return "compact";
  if (normalized === "cozy") return "comfortable";
  if (SUPPORTED_UI_DENSITIES.includes(normalized as PortalUIDensity)) {
    return normalized as PortalUIDensity;
  }
  return "compact";
}

function normalizeShape(value: string | undefined): PortalUIShape {
  const normalized = value?.trim().toLowerCase();
  if (SUPPORTED_UI_SHAPES.includes(normalized as PortalUIShape)) {
    return normalized as PortalUIShape;
  }
  return "sharp";
}

function normalizeThemeMode(value: string | undefined): PortalUIThemeMode {
  const normalized = value?.trim().toLowerCase();
  if (SUPPORTED_UI_THEME_MODES.includes(normalized as PortalUIThemeMode)) {
    return normalized as PortalUIThemeMode;
  }
  return "light";
}

function normalizeDriftVisibility(value: string | undefined): PortalUIDriftVisibility {
  const normalized = value?.trim().toLowerCase();
  if (SUPPORTED_UI_DRIFT_VISIBILITIES.includes(normalized as PortalUIDriftVisibility)) {
    return normalized as PortalUIDriftVisibility;
  }
  return "off";
}

export const portalUIGovernance = {
  palette: normalizePalette(
    process.env.PORTAL_UI_PALETTE ?? process.env.PORTAL_PALETTE,
  ),
  density: normalizeDensity(process.env.PORTAL_UI_DENSITY),
  shape: normalizeShape(process.env.PORTAL_UI_SHAPE),
  themeMode: normalizeThemeMode(process.env.PORTAL_UI_THEME_MODE),
  driftVisibility: normalizeDriftVisibility(process.env.UI_KIT_DRIFT_VISIBILITY),
} as const;

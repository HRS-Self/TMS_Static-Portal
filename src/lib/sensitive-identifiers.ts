import { logger } from "@/src/logger";

export type MaskSensitiveIdentifierOptions = {
  visiblePrefix?: number;
  visibleSuffix?: number;
  maskCharacter?: string;
  minimumMaskLength?: number;
};

export function maskSensitiveIdentifier(
  value: string,
  options: MaskSensitiveIdentifierOptions = {},
): string {
  const trimmed = value.trim();
  if (!trimmed) {
    logger.debug("Mask sensitive identifier: empty value", { hasValue: false });
    return "";
  }

  const visiblePrefix = options.visiblePrefix ?? 2;
  const visibleSuffix = options.visibleSuffix ?? 4;
  const maskCharacter = options.maskCharacter ?? ".";
  const minimumMaskLength = options.minimumMaskLength ?? 9;

  if (trimmed.length <= visiblePrefix + visibleSuffix) {
    logger.debug("Mask sensitive identifier: value below mask threshold", {
      length: trimmed.length,
      visiblePrefix,
      visibleSuffix,
    });
    return trimmed;
  }

  const middleLength = Math.max(
    minimumMaskLength,
    trimmed.length - visiblePrefix - visibleSuffix,
  );

  return `${trimmed.slice(0, visiblePrefix)}${maskCharacter.repeat(middleLength)}${trimmed.slice(-visibleSuffix)}`;
}

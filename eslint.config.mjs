import { defineConfig, globalIgnores } from "eslint/config";
import nextVitals from "eslint-config-next/core-web-vitals";
import nextTs from "eslint-config-next/typescript";
import vpgluePlugin from "./eslint-plugin-vpglue/index.mjs";

const eslintConfig = defineConfig([
  ...nextVitals,
  ...nextTs,
  {
    files: ["app/**/*.{js,mjs,cjs,ts,tsx}", "src/**/*.{js,mjs,cjs,ts,tsx}"],
    plugins: {
      vpglue: vpgluePlugin,
    },
    rules: {
      "no-console": ["error", { allow: ["warn", "error", "info"] }],
      // Gradual adoption for frontend/server hybrid codebase.
      "vpglue/require-error-logging-in-catch": "warn",
      "vpglue/log-conditions-debug": "warn",
      "vpglue/require-decision-log-before-throw": "warn",
    },
  },
  {
    files: ["src/server/**/*.ts", "src/config/**/*.ts", "app/api/**/*.ts"],
    plugins: {
      vpglue: vpgluePlugin,
    },
    rules: {
      "vpglue/log-queries-debug": "warn",
      "vpglue/no-direct-db-access-for-cached-domains": "warn",
    },
  },
  {
    files: ["src/logger.ts", "src/server/logger.ts"],
    plugins: {
      vpglue: vpgluePlugin,
    },
    rules: {
      "vpglue/require-error-logging-in-catch": "off",
      "vpglue/log-conditions-debug": "off",
      "vpglue/require-decision-log-before-throw": "off",
      "vpglue/log-queries-debug": "off",
    },
  },
  // Override default ignores of eslint-config-next.
  globalIgnores([
    // Default ignores of eslint-config-next:
    ".next/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
    // Design reference bundle copied from Figma Make; not executable app code.
    "docs/references/sourcecode/**",
  ]),
]);

export default eslintConfig;

"use client";

import { TMSField, TMSFieldInput, TMSFieldSelect } from "@conitdev/tms-ui-kit";

import type { SurfaceFormContract, SurfaceFormField } from "@/src/portal/derivation/surface-form-contracts";

import { SurfaceFkPicker } from "./surface-fk-picker";

// Controlled base-record form presenter — the wizard's tab-1 (step 0) and the layer-3 add-new modal
// both render this. ENUM/small-FK fields are real selects when options are resolved; large FK fields
// (picker mode:'lookup') render the TMSLookup picker; everything else is a typed input. Read-only
// mode (capability projection, C2) disables every input.
const INPUT_TYPE: Record<Exclude<SurfaceFormField["type"], "select" | "boolean">, string> = {
  number: "number",
  date: "date",
  email: "email",
  mobile: "tel",
  text: "text",
};

type SurfaceRecordFormProps = {
  surfaceId: string;
  form: SurfaceFormContract;
  values: Record<string, unknown>;
  onChange: (name: string, value: unknown) => void;
  fieldOptions?: Record<string, { value: string; label: string }[]>;
  readOnly?: boolean;
};

export function SurfaceRecordForm({ surfaceId, form, values, onChange, fieldOptions, readOnly = false }: SurfaceRecordFormProps) {
  return (
    <div className="grid tms-governed-gap-md overflow-auto md:grid-cols-2">
      {form.fields.map((f) => {
        const options = fieldOptions?.[f.name];
        return (
          <TMSField key={f.name} label={f.label} required={f.required}>
            {f.type === "boolean" ? (
              <TMSFieldInput
                type="checkbox"
                checked={Boolean(values[f.name])}
                disabled={readOnly}
                onChange={(e) => onChange(f.name, e.target.checked)}
              />
            ) : f.type === "select" && options ? (
              <TMSFieldSelect
                value={String(values[f.name] ?? "")}
                onChange={(value) => onChange(f.name, value)}
                options={options}
                disabled={readOnly}
                placeholder={`Select ${f.label}`}
              />
            ) : f.type === "select" && f.picker && f.picker.mode === "lookup" && !readOnly ? (
              <SurfaceFkPicker
                surfaceId={surfaceId}
                fieldName={f.name}
                picker={f.picker}
                value={String(values[f.name] ?? "")}
                onChange={(value) => onChange(f.name, value)}
              />
            ) : (
              <TMSFieldInput
                type={INPUT_TYPE[f.type as keyof typeof INPUT_TYPE] ?? "text"}
                value={String(values[f.name] ?? "")}
                disabled={readOnly}
                onChange={(e) => onChange(f.name, e.target.value)}
              />
            )}
          </TMSField>
        );
      })}
    </div>
  );
}

"use client";

import { TMSButton, TMSField, TMSFieldInput, TMSFieldSelect, TMSModal } from "@conitdev/tms-ui-kit";

// Governed modal-card chrome — the recipe the kit's TMSWizardDialog applies to TMSModal.
const WIZARD_CARD_CLASS =
  "flex max-h-[85vh] w-[min(42rem,92vw)] flex-col tms-governed-surface-panel tms-governed-surface-muted tms-governed-radius-surface shadow-modal overflow-hidden";
import { useRouter } from "next/navigation";
import { useState } from "react";

import type {
  SurfaceFormContract,
  SurfaceFormField,
} from "@/src/portal/derivation/surface-form-contracts";

import { SurfaceFkPicker } from "./surface-fk-picker";

// Tab-1 main-record form composed from the kit primitives (TMSModal + TMSField +
// TMSFieldInput/TMSFieldSelect). ENUM and small FK fields render as real selects when options are
// resolved (live); large FK fields (mode:'lookup', no options) render a TMSLookup-driven picker.
// (Related-family tabs are the remaining follow-on.)
const INPUT_TYPE: Record<Exclude<SurfaceFormField["type"], "select" | "boolean">, string> = {
  number: "number",
  date: "date",
  email: "email",
  mobile: "tel",
  text: "text",
};

type SurfaceWizardProps = {
  open: boolean;
  mode: "new" | "manage";
  surfaceId: string;
  title: string;
  form: SurfaceFormContract;
  /** field → {value,label}[] for ENUM/FK selects (resolved live in surface-page). */
  fieldOptions?: Record<string, { value: string; label: string }[]>;
  initial?: Record<string, unknown> | null;
  onClose: () => void;
};

export function SurfaceWizard({ open, mode, surfaceId, title, form, fieldOptions, initial, onClose }: SurfaceWizardProps) {
  const router = useRouter();
  const [values, setValues] = useState<Record<string, unknown>>(() => {
    const v: Record<string, unknown> = {};
    for (const f of form.fields) v[f.name] = initial?.[f.name] ?? "";
    return v;
  });
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const set = (name: string, value: unknown) => setValues((prev) => ({ ...prev, [name]: value }));

  async function save() {
    if (busy) return;
    setBusy(true);
    setError(null);
    try {
      const payload: Record<string, unknown> = { ...values };
      if (mode === "manage" && initial?.Id !== undefined) payload.Id = initial.Id;
      const res = await fetch("/api/portal/write", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ surfaceId, buttonId: mode === "new" ? "new" : "manage", payload }),
      });
      if (res.ok) {
        onClose();
        router.refresh();
      } else {
        const j = (await res.json().catch(() => ({}))) as { message?: string };
        setError(j.message ?? "Save failed.");
      }
    } catch (e) {
      setError(e instanceof Error ? e.message : "Save failed.");
    } finally {
      setBusy(false);
    }
  }

  return (
    <TMSModal isOpen={open} closeModal={onClose} className={WIZARD_CARD_CLASS}>
      <header className="shrink-0 border-b tms-governed-border-strong tms-governed-padding-inline-lg tms-governed-padding-block-md">
        <h2 className="tms-governed-type-body tms-governed-font-title tms-governed-text-primary">
          {mode === "new" ? `New ${title}` : `Manage ${title}`}
        </h2>
      </header>

      <div className="flex min-h-0 flex-col tms-governed-gap-md tms-governed-padding-lg overflow-hidden">
        <div className="grid tms-governed-gap-md overflow-auto md:grid-cols-2">
          {form.fields.map((f) => {
            const options = fieldOptions?.[f.name];
            return (
              <TMSField
                key={f.name}
                label={f.label}
                required={f.required}
              >
                {f.type === "boolean" ? (
                  <TMSFieldInput
                    type="checkbox"
                    checked={Boolean(values[f.name])}
                    onChange={(e) => set(f.name, e.target.checked)}
                  />
                ) : f.type === "select" && options ? (
                  <TMSFieldSelect
                    value={String(values[f.name] ?? "")}
                    onChange={(value) => set(f.name, value)}
                    options={options}
                    placeholder={`Select ${f.label}`}
                  />
                ) : f.type === "select" && f.picker && f.picker.mode === "lookup" ? (
                  <SurfaceFkPicker
                    surfaceId={surfaceId}
                    fieldName={f.name}
                    picker={f.picker}
                    value={String(values[f.name] ?? "")}
                    onChange={(value) => set(f.name, value)}
                  />
                ) : (
                  <TMSFieldInput
                    type={INPUT_TYPE[f.type as keyof typeof INPUT_TYPE] ?? "text"}
                    value={String(values[f.name] ?? "")}
                    onChange={(e) => set(f.name, e.target.value)}
                  />
                )}
              </TMSField>
            );
          })}
        </div>

        {error ? (
          <p className="tms-governed-type-caption tms-governed-text-danger">{error}</p>
        ) : null}

        <div className="flex shrink-0 justify-end tms-governed-gap-sm">
          <TMSButton variant="outlined" label="Cancel" onClick={onClose} />
          <TMSButton
            variant="containedPrimary"
            label={busy ? "Saving…" : "Save"}
            onClick={() => void save()}
            disabled={busy}
            loading={busy}
          />
        </div>
      </div>
    </TMSModal>
  );
}

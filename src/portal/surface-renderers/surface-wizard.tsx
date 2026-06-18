"use client";

import { TMSField, TMSFieldInput, TMSFieldSelect, TMSModal } from "@conitdev/tms-ui-kit";
import { useRouter } from "next/navigation";
import { useState } from "react";

import type {
  SurfaceFormContract,
  SurfaceFormField,
} from "@/src/portal/derivation/surface-form-contracts";

// Tab-1 main-record form composed from the kit primitives (TMSModal + TMSField +
// TMSFieldInput/TMSFieldSelect). ENUM and small FK fields render as real selects when options are
// resolved (live); FK fields without options fall back to a hinted input (TMSLookup async + the
// related-family tabs are the remaining follow-on).
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
    <TMSModal isOpen={open} closeModal={onClose}>
      <div className="flex max-h-[85vh] w-[min(42rem,92vw)] flex-col gap-4 p-5">
        <h2 className="text-lg font-semibold tms-governed-text-title">
          {mode === "new" ? `New ${title}` : `Manage ${title}`}
        </h2>

        <div className="grid gap-3 overflow-auto md:grid-cols-2">
          {form.fields.map((f) => {
            const options = fieldOptions?.[f.name];
            return (
              <TMSField
                key={f.name}
                label={f.label}
                required={f.required}
                hint={f.type === "select" && !options && f.picker ? `lookup: ${f.picker.source}` : undefined}
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

        {error ? <p className="text-sm text-rose-600">{error}</p> : null}

        <div className="flex justify-end gap-2">
          <button type="button" onClick={onClose} className="rounded border tms-governed-border-default px-3 py-1.5 text-sm">
            Cancel
          </button>
          <button
            type="button"
            onClick={() => void save()}
            disabled={busy}
            className="rounded bg-indigo-600 px-3 py-1.5 text-sm font-medium text-white disabled:opacity-50"
          >
            {busy ? "Saving…" : "Save"}
          </button>
        </div>
      </div>
    </TMSModal>
  );
}

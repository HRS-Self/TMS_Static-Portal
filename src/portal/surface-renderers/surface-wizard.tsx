"use client";

import { TMSField, TMSFieldInput, TMSModal } from "@conitdev/tms-ui-kit";
import { useRouter } from "next/navigation";
import { useState } from "react";

import type {
  SurfaceFormContract,
  SurfaceFormField,
} from "@/src/portal/derivation/surface-form-contracts";

// First-cut wizard: tab-1 main record form composed from the kit primitives
// (TMSModal + TMSField + TMSFieldInput). Related-family tabs + FK/ENUM pickers are a
// follow-on; selects render as plain inputs for now (hint shows the picker source).
const INPUT_TYPE: Record<SurfaceFormField["type"], string> = {
  number: "number",
  date: "date",
  email: "email",
  mobile: "tel",
  boolean: "checkbox",
  text: "text",
  select: "text",
};

type SurfaceWizardProps = {
  open: boolean;
  mode: "new" | "manage";
  surfaceId: string;
  title: string;
  form: SurfaceFormContract;
  initial?: Record<string, unknown> | null;
  onClose: () => void;
};

export function SurfaceWizard({ open, mode, surfaceId, title, form, initial, onClose }: SurfaceWizardProps) {
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
          {form.fields.map((f) => (
            <TMSField
              key={f.name}
              label={f.label}
              required={f.required}
              hint={f.picker ? `picker: ${f.picker.source}` : undefined}
            >
              {f.type === "boolean" ? (
                <TMSFieldInput
                  type="checkbox"
                  checked={Boolean(values[f.name])}
                  onChange={(e) => set(f.name, e.target.checked)}
                />
              ) : (
                <TMSFieldInput
                  type={INPUT_TYPE[f.type]}
                  value={String(values[f.name] ?? "")}
                  onChange={(e) => set(f.name, e.target.value)}
                />
              )}
            </TMSField>
          ))}
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

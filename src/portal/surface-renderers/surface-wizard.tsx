"use client";

import { TMSWizardDialog } from "@conitdev/tms-ui-kit";
import { useRouter } from "next/navigation";
import { useMemo, useState } from "react";

import relationContracts from "@/src/portal/derivation/spc-relation-contracts.json";
import { surfaceContracts } from "@/src/portal/derivation/surface-contracts";
import type { SurfaceFormContract } from "@/src/portal/derivation/surface-form-contracts";
import type { SurfaceCapabilitySnapshot } from "@/src/portal/surfaces/types";

import { SurfaceRecordForm } from "./surface-record-form";
import { SurfaceRelationTab } from "./surface-relation-tab";

// The governed layered relation wizard (kit TMSWizardDialog). Tab 1 = the base-record form; later
// tabs = relation grids (Assign/Unassign). NEW is restricted — every later step is locked until the
// base record saves and returns an Id; MANAGE is unrestricted (free step navigation). Capability
// projection makes the form read-only / gates relation mutation.
type RelationContractRow = {
  kind: "bridge" | "child";
  relatedHasRootSurface?: boolean;
  assignableSurfaceKey?: string | null;
  sensitiveLinkage?: boolean;
};

type WriteResult = { Id?: string | number; id?: string | number; data?: { Id?: string | number } };

type SurfaceWizardProps = {
  open: boolean;
  mode: "new" | "manage";
  surfaceId: string;
  title: string;
  form: SurfaceFormContract;
  fieldOptions?: Record<string, { value: string; label: string }[]>;
  initial?: Record<string, unknown> | null;
  capability?: SurfaceCapabilitySnapshot | null;
  onClose: () => void;
};

export function SurfaceWizard({ open, mode, surfaceId, title, form, fieldOptions, initial, capability, onClose }: SurfaceWizardProps) {
  const router = useRouter();
  const contract = surfaceContracts[surfaceId];
  const isEdit = mode === "manage";
  // New shows ALL steps but locks the later ones until the base saves (restricted/guided flow).
  const tabs = contract?.render?.tabs && contract.render.tabs.length > 0 ? contract.render.tabs : ["Profile"];

  const [values, setValues] = useState<Record<string, unknown>>(() => {
    const v: Record<string, unknown> = {};
    for (const f of form.fields) v[f.name] = initial?.[f.name] ?? "";
    return v;
  });
  const set = (name: string, value: unknown) => setValues((prev) => ({ ...prev, [name]: value }));
  const [activeStep, setActiveStep] = useState(0);
  const [savedId, setSavedId] = useState<string | number | null>(
    isEdit ? ((initial?.Id as string | number | undefined) ?? null) : null,
  );
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const readOnly = isEdit ? capability?.canUpdate === false : capability?.canCreate === false;
  const furthestUnlocked = isEdit || savedId != null ? tabs.length - 1 : 0;

  async function saveBase(): Promise<boolean> {
    if (readOnly) return true;
    setSaving(true);
    setError(null);
    try {
      const payload: Record<string, unknown> = { ...values };
      if (isEdit && initial?.Id !== undefined) payload.Id = initial.Id;
      const res = await fetch("/api/portal/write", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ surfaceId, buttonId: isEdit ? "manage" : "new", payload }),
      });
      if (!res.ok) {
        const j = (await res.json().catch(() => ({}))) as { message?: string; error?: string };
        setError(j.message ?? j.error ?? "Save failed.");
        return false;
      }
      const json = (await res.json().catch(() => ({}))) as { result?: WriteResult };
      const newId = json.result?.Id ?? json.result?.id ?? json.result?.data?.Id ?? savedId;
      if (newId != null) setSavedId(newId);
      return true;
    } catch (e) {
      setError(e instanceof Error ? e.message : "Save failed.");
      return false;
    } finally {
      setSaving(false);
    }
  }

  function finish() {
    onClose();
    router.refresh();
  }

  function renderStep(step: number) {
    if (step === 0) {
      return (
        <div className="tms-governed-stack-sm">
          {error ? <p className="tms-governed-type-caption tms-governed-text-danger">{error}</p> : null}
          <SurfaceRecordForm surfaceId={surfaceId} form={form} values={values} onChange={set} fieldOptions={fieldOptions} readOnly={readOnly} />
        </div>
      );
    }
    const area = tabs[step];
    if (savedId == null) {
      return <p className="tms-governed-type-caption tms-governed-text-muted">Save the record first to manage its {area}.</p>;
    }
    const rc = (relationContracts as Record<string, RelationContractRow>)[`${surfaceId}::${area}`];
    return (
      <SurfaceRelationTab surfaceId={surfaceId} area={area} parentId={savedId} contract={rc} canMutate={capability?.canUpdate !== false} />
    );
  }

  const stepStatuses = useMemo(() => {
    const m: Record<number, "active" | "completed" | "pending"> = {};
    for (let i = 0; i < tabs.length; i += 1) m[i] = i < activeStep ? "completed" : i === activeStep ? "active" : "pending";
    return m;
  }, [tabs.length, activeStep]);

  return (
    <TMSWizardDialog
      isOpen={open}
      onOpenChange={(o) => { if (!o) finish(); }}
      mode={isEdit ? "edit" : "create"}
      entityLabel={title}
      recordId={savedId != null ? String(savedId) : undefined}
      steps={tabs}
      activeStep={activeStep}
      onStepChange={setActiveStep}
      canNavigateToStep={(step) => isEdit || step <= furthestUnlocked}
      onSaveStep={async (step) => (step === 0 ? saveBase() : true)}
      onSubmit={async () => {
        if (!isEdit && savedId == null) {
          const ok = await saveBase();
          if (!ok) return false;
        }
        finish();
        return true;
      }}
      onCancel={onClose}
      isSaving={saving}
      stepStatuses={stepStatuses}
      renderStep={renderStep}
    />
  );
}

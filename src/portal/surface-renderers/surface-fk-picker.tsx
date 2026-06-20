"use client";

import { TMSFieldSelect, TMSLookup } from "@conitdev/tms-ui-kit";
import { useState } from "react";

import type { SurfaceFormFieldPicker } from "@/src/portal/derivation/surface-form-contracts";

// The kit needs an `event` set; we classify by row count ourselves (in onResult), so these only
// carry the default messaging for each outcome.
const LOOKUP_EVENTS = [
  { type: "onRecordNotFound" as const, alertMsg: "No match found.", alertType: "warning" },
  { type: "onSingleRecordFound" as const, alertMsg: "Match found.", alertType: "success" },
  { type: "onMultiRecordFound" as const, alertMsg: "Multiple matches.", alertType: "info" },
];

type LookupRow = { value: string; label: string };

type SurfaceFkPickerProps = {
  surfaceId: string;
  fieldName: string;
  picker: SurfaceFormFieldPicker;
  value: string;
  /** label for the already-stored value (manage mode), so the field reads as the record, not the Id. */
  initialLabel?: string | null;
  onChange: (value: string) => void;
};

// FK field host: TMSLookup drives the search (the kit fetches via our `onResolve` BFF, owning
// gateway+auth), classifies by count, and hands the outcome back. We commit the chosen record's
// valueKey to the form and surface a multi-match picker / not-found note. Kit-first: no bespoke
// resolver, no surface-specific lookup logic.
export function SurfaceFkPicker({ surfaceId, fieldName, picker, value, initialLabel, onChange }: SurfaceFkPickerProps) {
  const [searchValue, setSearchValue] = useState(initialLabel ?? value ?? "");
  const [matches, setMatches] = useState<LookupRow[]>([]);
  const [status, setStatus] = useState<string | null>(initialLabel ? `Selected: ${initialLabel}` : null);

  const commit = (row: LookupRow) => {
    onChange(row.value);
    setSearchValue(row.label);
    setMatches([]);
    setStatus(`Selected: ${row.label}`);
  };

  const onResolve = async (term: string): Promise<object[]> => {
    const res = await fetch("/api/portal/lookup", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ surfaceId, field: fieldName, search: term }),
    });
    if (!res.ok) {
      setStatus("Lookup failed.");
      return [];
    }
    const json = (await res.json()) as { rows?: LookupRow[] };
    return json.rows ?? [];
  };

  const onResult = ({ rows }: { rows: object[] }) => {
    const found = rows as LookupRow[];
    if (found.length === 0) {
      setMatches([]);
      setStatus(`No match for “${searchValue}”.`);
    } else if (found.length === 1) {
      commit(found[0]);
    } else {
      setMatches(found);
      setStatus(`${found.length} matches — pick one below.`);
    }
  };

  return (
    <div className="tms-governed-stack-sm">
      <TMSLookup
        name={fieldName}
        value={searchValue}
        onChange={(e) => setSearchValue(e)}
        placeholder={`Search ${picker.source.replace(/^.*?_/, "")}…`}
        event={LOOKUP_EVENTS}
        onResolve={onResolve}
        onResult={onResult}
      />
      {matches.length > 1 ? (
        <TMSFieldSelect
          value={value ?? ""}
          onChange={(v) => {
            const row = matches.find((m) => m.value === v);
            if (row) commit(row);
          }}
          options={matches}
          placeholder="Select a match"
        />
      ) : null}
      {status ? (
        <p className="tms-governed-type-caption tms-governed-text-muted">{status}</p>
      ) : null}
    </div>
  );
}

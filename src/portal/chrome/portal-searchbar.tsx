"use client";

import { TMSLookup, TMSSearchbar, TMSSelect } from "@conitdev/tms-ui-kit";
import { useMemo, useState } from "react";

import { searchRegistry } from "@/src/portal/derivation/search-registry";

// The portal's global search, composed the kit-first way: a dumb TMSSearchbar with children = a
// subject TMSSelect + a field TMSSelect (scoped to the chosen subject) + a TMSLookup. The field
// list can ONLY ever show the selected subject's fields — so the old cross-subject "wrong column"
// bug (flat property union) cannot happen. DataSource + the field set live in the generated
// search-registry (portal config); the kit components stay dumb and surface-blind.
type PortalSearchbarProps = {
  onSearch: (term: string, subjectKey: string, fieldAccessorKey: string) => void;
};

export function PortalSearchbar({ onSearch }: PortalSearchbarProps) {
  const subjects = useMemo(() => Object.values(searchRegistry), []);
  const subjectOptions = useMemo(() => subjects.map((s) => ({ id: s.key, title: s.label })), [subjects]);

  const [subjectKey, setSubjectKey] = useState(subjects[0]?.key ?? "");
  const subject = searchRegistry[subjectKey];
  const fieldOptions = (subject?.fields ?? []).map((f) => ({ id: f.accessorKey, title: f.label }));
  const [fieldKey, setFieldKey] = useState(subject?.fields[0]?.accessorKey ?? "");
  const [term, setTerm] = useState("");

  // Cascade (consumer-owned): switching subject resets the field to the new subject's first field —
  // the field options re-scope, never leaking a field from another subject.
  const onSubjectChange = (key: string) => {
    setSubjectKey(key);
    setFieldKey(searchRegistry[key]?.fields[0]?.accessorKey ?? "");
  };

  const search = () => {
    if (!subjectKey || !fieldKey || !term.trim()) return;
    onSearch(term, subjectKey, fieldKey);
  };

  return (
    <TMSSearchbar id="portal-searchbar" name="portal-searchbar">
      <TMSSelect
        id="portal-search-subject"
        name="portal-search-subject"
        value={subjectKey}
        options={subjectOptions}
        hasBorder={false}
        hasBackground={false}
        onChange={onSubjectChange}
      />
      <TMSSelect
        id="portal-search-field"
        name="portal-search-field"
        value={fieldKey}
        options={fieldOptions}
        enabled={Boolean(subjectKey)}
        hasBorder={false}
        hasBackground={false}
        onChange={setFieldKey}
      />
      <TMSLookup
        id="portal-search-lookup"
        name="portal-search-lookup"
        value={term}
        placeholder="Search — abc, abc*, *abc, *abc*"
        event={[]}
        hasBorder={false}
        hasBackground={false}
        onChange={setTerm}
        onClick={search}
      />
    </TMSSearchbar>
  );
}

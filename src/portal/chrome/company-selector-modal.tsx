"use client";

import { TMSModal } from "@conitdev/tms-ui-kit";
import { useEffect, useRef } from "react";

export type CompanyChoice = {
  entityId: number;
  entityTitle: string;
  sources: string[];
};

type CompanySelectorModalProps = {
  choices: CompanyChoice[];
  returnUrl: string;
};

/**
 * Blocking company-context selector — a MODAL, not a page. Rendered by the root layout when the
 * session has no active entity. Exactly one choice auto-submits (no manual step); more than one
 * shows the picker; zero shows the "not assigned" message. Selecting posts to /api/entity/select,
 * which sets session.entityId and redirects back, after which the modal no longer renders.
 */
export function CompanySelectorModal({ choices, returnUrl }: CompanySelectorModalProps) {
  const autoFormRef = useRef<HTMLFormElement>(null);
  const single = choices.length === 1;

  useEffect(() => {
    if (single) autoFormRef.current?.submit();
  }, [single]);

  return (
    <TMSModal isOpen>
      <div className="flex w-[min(34rem,92vw)] flex-col gap-4 p-5">
        <div className="flex flex-col gap-1">
          <h2 className="text-lg font-semibold tms-governed-text-title">Select your company</h2>
          <p className="text-sm tms-governed-text-subtle">
            Choose the company context for this portal session.
          </p>
        </div>

        {choices.length === 0 ? (
          <p className="rounded-md border tms-governed-border-default tms-governed-surface-panel p-4 text-sm tms-governed-text-body">
            You have not been assigned to a company yet.
          </p>
        ) : (
          <div className="grid gap-2">
            {choices.map((choice) => (
              <form
                key={choice.entityId}
                ref={single ? autoFormRef : undefined}
                action="/api/entity/select"
                method="post"
              >
                <input type="hidden" name="entityId" value={String(choice.entityId)} />
                <input type="hidden" name="entityTitle" value={choice.entityTitle} />
                <input type="hidden" name="sources" value={JSON.stringify(choice.sources)} />
                <input type="hidden" name="returnUrl" value={returnUrl} />
                <button
                  type="submit"
                  className="flex w-full items-center justify-between rounded-md border tms-governed-border-default tms-governed-surface-panel px-4 py-3 text-left hover:border-indigo-400"
                >
                  <span className="min-w-0">
                    <span className="block truncate text-sm font-semibold tms-governed-text-title">
                      {choice.entityTitle}
                    </span>
                    <span className="mt-0.5 block text-xs tms-governed-text-subtle">
                      Entity ID: {choice.entityId}
                    </span>
                  </span>
                  <span className="flex flex-wrap gap-1">
                    {choice.sources.map((source) => (
                      <span
                        key={source}
                        className="rounded border tms-governed-border-default px-1.5 py-0.5 text-[10px] font-semibold uppercase tracking-wide tms-governed-surface-muted"
                      >
                        {source}
                      </span>
                    ))}
                  </span>
                </button>
              </form>
            ))}
          </div>
        )}
      </div>
    </TMSModal>
  );
}

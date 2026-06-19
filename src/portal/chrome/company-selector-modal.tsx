"use client";

import { TMSButton, TMSModal } from "@conitdev/tms-ui-kit";
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

// Governed modal-card chrome — the same recipe the kit's TMSWizardDialog applies to TMSModal
// (surface panel + radius + modal shadow). NOT bespoke styling: only governed tokens + layout.
const CARD_CLASS =
  "flex flex-col tms-governed-surface-panel tms-governed-surface-muted tms-governed-radius-surface shadow-modal overflow-hidden w-[min(34rem,92vw)]";

/**
 * Blocking company-context selector — a MODAL (not a page), composed from kit primitives only
 * (TMSModal + TMSButton + governed tokens). Rendered by the root layout when the session has no
 * active entity. Exactly one choice auto-submits; more than one shows the picker; zero shows the
 * "not assigned" message. Selecting posts to /api/entity/select, which sets session.entityId.
 */
export function CompanySelectorModal({ choices, returnUrl }: CompanySelectorModalProps) {
  const autoFormRef = useRef<HTMLFormElement>(null);
  const single = choices.length === 1;

  useEffect(() => {
    if (single) autoFormRef.current?.submit();
  }, [single]);

  return (
    <TMSModal isOpen className={CARD_CLASS}>
      <header className="border-b tms-governed-border-strong tms-governed-padding-inline-lg tms-governed-padding-block-md">
        <h2 className="tms-governed-type-body tms-governed-font-title tms-governed-text-primary">Select your company</h2>
        <p className="tms-governed-stack-sm tms-governed-type-caption tms-governed-font-label tms-governed-text-secondary">
          Choose the company context for this portal session.
        </p>
      </header>

      <div className="flex flex-col tms-governed-gap-sm tms-governed-padding-lg">
        {choices.length === 0 ? (
          <p className="tms-governed-surface-page tms-governed-radius-control tms-governed-padding-md tms-governed-type-body tms-governed-text-secondary">
            You have not been assigned to a company yet.
          </p>
        ) : (
          choices.map((choice) => (
            <form
              key={choice.entityId}
              ref={single ? autoFormRef : undefined}
              action="/api/entity/select"
              method="post"
              className="flex items-center justify-between tms-governed-gap-md tms-governed-surface-page tms-governed-radius-control tms-governed-padding-md"
            >
              <input type="hidden" name="entityId" value={String(choice.entityId)} />
              <input type="hidden" name="entityTitle" value={choice.entityTitle} />
              <input type="hidden" name="sources" value={JSON.stringify(choice.sources)} />
              <input type="hidden" name="returnUrl" value={returnUrl} />

              <div className="min-w-0">
                <div className="tms-governed-type-body tms-governed-font-title tms-governed-text-primary truncate">
                  {choice.entityTitle}
                </div>
                <div className="tms-governed-stack-sm tms-governed-type-caption tms-governed-text-secondary">
                  Entity ID: {choice.entityId}
                </div>
                <div className="flex flex-wrap tms-governed-gap-sm tms-governed-stack-sm">
                  {choice.sources.map((source) => (
                    <span
                      key={source}
                      className="tms-governed-surface-muted tms-governed-radius-control tms-governed-padding-sm tms-governed-type-caption tms-governed-font-label tms-governed-text-secondary uppercase"
                    >
                      {source}
                    </span>
                  ))}
                </div>
              </div>

              <TMSButton type="submit" variant="containedPrimary" label="Select" />
            </form>
          ))
        )}
      </div>
    </TMSModal>
  );
}

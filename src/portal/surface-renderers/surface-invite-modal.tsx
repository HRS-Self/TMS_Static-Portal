"use client";

import { TMSButton, TMSField, TMSFieldInput, TMSModal } from "@conitdev/tms-ui-kit";
import { useState } from "react";

// Invitation modal — the entrance path for invite-mode (Layer-1 identity) surfaces like Driver.
// A person isn't created directly; they're invited and complete their own profile. This submits a
// governed invitation request (/api/portal/invite → H_RequestBases), never a direct create.
const CARD =
  "flex w-[min(32rem,92vw)] flex-col tms-governed-surface-panel tms-governed-surface-muted tms-governed-radius-surface shadow-modal overflow-hidden";

type InviteModalProps = {
  surfaceId: string;
  title: string;
  onClose: () => void;
};

export function SurfaceInviteModal({ surfaceId, title, onClose }: InviteModalProps) {
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const [busy, setBusy] = useState(false);
  const [status, setStatus] = useState<{ kind: "idle" | "sent" | "error"; message?: string }>({ kind: "idle" });

  async function submit() {
    if (!email.trim() || busy) return;
    setBusy(true);
    setStatus({ kind: "idle" });
    try {
      const res = await fetch("/api/portal/invite", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ kind: "invite", surfaceId, invitee: { email: email.trim(), name: name.trim() || undefined } }),
      });
      const j = (await res.json().catch(() => ({}))) as { message?: string; error?: string };
      if (res.ok) setStatus({ kind: "sent", message: `Invitation request submitted for ${email.trim()}.` });
      else setStatus({ kind: "error", message: j.message ?? j.error ?? "Invite failed." });
    } catch (e) {
      setStatus({ kind: "error", message: e instanceof Error ? e.message : "Invite failed." });
    } finally {
      setBusy(false);
    }
  }

  return (
    <TMSModal isOpen closeModal={onClose} className={CARD}>
      <header className="shrink-0 border-b tms-governed-border-strong tms-governed-padding-inline-lg tms-governed-padding-block-md">
        <h2 className="tms-governed-type-body tms-governed-font-title tms-governed-text-primary">Invite {title}</h2>
      </header>
      <div className="flex flex-col tms-governed-gap-md tms-governed-padding-lg">
        <p className="tms-governed-type-caption tms-governed-text-muted">
          {title} accounts are created by invitation — the person accepts the invite and completes their own
          profile. This sends a governed invitation request.
        </p>
        {status.kind === "sent" ? (
          <p className="tms-governed-type-body tms-governed-text-success">{status.message}</p>
        ) : (
          <>
            <TMSField label="Email" required>
              <TMSFieldInput type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
            </TMSField>
            <TMSField label="Name">
              <TMSFieldInput type="text" value={name} onChange={(e) => setName(e.target.value)} />
            </TMSField>
            {status.kind === "error" ? (
              <p className="tms-governed-type-caption tms-governed-text-danger">{status.message}</p>
            ) : null}
          </>
        )}
        <div className="flex shrink-0 justify-end tms-governed-gap-sm">
          <TMSButton variant="outlined" label={status.kind === "sent" ? "Close" : "Cancel"} onClick={onClose} />
          {status.kind !== "sent" ? (
            <TMSButton
              variant="containedPrimary"
              label={busy ? "Sending…" : "Send invitation"}
              onClick={() => void submit()}
              disabled={busy || !email.trim()}
              loading={busy}
            />
          ) : null}
        </div>
      </div>
    </TMSModal>
  );
}

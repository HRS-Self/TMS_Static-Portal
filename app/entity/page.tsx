import { redirect } from "next/navigation";

import { detectLogin } from "@/src/server/auth/session";

export const dynamic = "force-dynamic";

/**
 * The company-context selector is now a MODAL rendered by the root layout (see
 * CompanySelectorModal), not a page. This route is kept only as a safe redirect for any old
 * link/bookmark/return-url pointing at /entity: land on the app and the modal takes over.
 */
export default async function EntitySelectionPage() {
  await detectLogin("/dashboard");
  redirect("/dashboard");
}

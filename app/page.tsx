import { redirect } from "next/navigation";

import { detectLogin } from "@/src/server/auth/session";

export const dynamic = "force-dynamic";

export default async function HomePage() {
  // Land on the app; the company-context selector is a modal in the root layout (not a page).
  await detectLogin("/dashboard");
  redirect("/dashboard");
}

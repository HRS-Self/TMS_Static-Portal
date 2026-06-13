import { redirect } from "next/navigation";

import { detectLogin } from "@/src/server/auth/session";

export const dynamic = "force-dynamic";

export default async function HomePage() {
  await detectLogin("/entity");
  redirect("/entity");
}

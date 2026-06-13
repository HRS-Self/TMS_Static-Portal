import { redirect } from 'next/navigation';
import type { NextRequest } from 'next/server';

export const dynamic = 'force-dynamic';

export async function POST(request: NextRequest) {
  const from = request.nextUrl.searchParams.get('from') ?? '/';
  redirect(from);
}

export async function GET(request: NextRequest) {
  const from = request.nextUrl.searchParams.get('from') ?? '/';
  redirect(from);
}

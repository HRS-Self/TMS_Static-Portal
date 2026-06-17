import { NextRequest, NextResponse } from 'next/server';

import { surfaceWriterConfigs } from '@/src/portal/derivation/surface-writer-configs';
import { getOptionalSession } from '@/src/server/auth/session';
import { logger } from '@/src/server/logger';
import { executeSurfaceWriter } from '@/src/server/portal/surface-data-writer';

export const dynamic = 'force-dynamic';

// button → capability flag (UX/defense-in-depth projection; the domain backend is the real gate).
const BUTTON_CAPABILITY: Record<string, 'canCreate' | 'canUpdate' | 'canDelete'> = {
  new: 'canCreate',
  manage: 'canUpdate',
  delete: 'canDelete',
};

/**
 * Generic Write Channel route. The browser posts { surfaceId, buttonId, payload };
 * the route resolves the per-surface SurfaceWriterConfig (generated from the S4 write
 * contracts), projects the surface capability, and forwards to the domain backend's
 * /Set via executeSurfaceWriter (x-access-key + x-entity-id). Reads go through
 * DataGateway; writes go through domain APIs.
 */
export async function POST(request: NextRequest) {
  const session = await getOptionalSession();
  if (!session) {
    return NextResponse.json({ error: 'unauthenticated' }, { status: 401 });
  }

  let body: { surfaceId?: string; buttonId?: string; payload?: unknown };
  try {
    body = await request.json();
  } catch {
    return NextResponse.json({ error: 'invalid_json' }, { status: 400 });
  }

  const { surfaceId, buttonId, payload } = body;
  logger.debug('Portal write request', {
    surfaceId,
    buttonId,
    hasPayload: payload !== undefined,
  });
  if (!surfaceId || !buttonId) {
    return NextResponse.json({ error: 'missing_surfaceId_or_buttonId' }, { status: 400 });
  }

  const writer = surfaceWriterConfigs[surfaceId]?.[buttonId];
  if (!writer) {
    return NextResponse.json({ error: 'no_writer', surfaceId, buttonId }, { status: 404 });
  }

  // capability projection: if a snapshot exists and forbids the action, refuse early.
  const snapshot = session.surfaceCapabilities?.[surfaceId];
  const capFlag = BUTTON_CAPABILITY[buttonId];
  if (snapshot && capFlag && snapshot[capFlag] === false) {
    return NextResponse.json({ error: 'forbidden', surfaceId, buttonId }, { status: 403 });
  }

  try {
    const result = await executeSurfaceWriter<unknown>({
      session,
      writer,
      body: JSON.stringify(payload ?? {}),
      contentType: 'application/json',
    });
    return NextResponse.json({ ok: true, result });
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    logger.error('Portal write failed', { surfaceId, buttonId, reason: message });
    return NextResponse.json({ error: 'write_failed', message }, { status: 502 });
  }
}

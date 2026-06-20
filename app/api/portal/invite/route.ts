import { NextRequest, NextResponse } from 'next/server';

import requestTypes from '@/src/portal/derivation/request-types.overlay.json';
import { getOptionalSession } from '@/src/server/auth/session';
import { executeSurfaceWriter } from '@/src/server/portal/surface-data-writer';
import { logger } from '@/src/server/logger';

export const dynamic = 'force-dynamic';

// Governed entrance & sensitive linkage go through a REQUEST (H_RequestBases/Set), never a direct
// create/link (invite policy Rules 1/2/5). `kind:'invite'` = invite a Layer-1 user (e.g. a Driver);
// `kind:'link'` = request to link a user to an entity/role/actor. The RequestType int is domain
// config (request-types.overlay.json); when unset we refuse honestly (Rule 7) rather than submit a
// mis-typed request.
const REQUEST_BASES_PATH = '/api/v5-m1/request-bases/Set';

export async function POST(request: NextRequest) {
  const session = await getOptionalSession();
  if (!session) return NextResponse.json({ error: 'unauthenticated' }, { status: 401 });

  const body = (await request.json().catch(() => ({}))) as {
    kind?: 'invite' | 'link';
    surfaceId?: string;
    area?: string;
    invitee?: Record<string, unknown>;
    parentId?: string | number;
    relatedId?: string | number;
  };
  const kind = body.kind === 'link' ? 'link' : 'invite';
  const cfgKey = kind === 'link' ? 'sensitiveLink' : 'inviteUser';
  const requestType = (requestTypes as unknown as Record<string, number | null>)[cfgKey];
  if (requestType == null) {
    return NextResponse.json(
      {
        error: 'not_configured',
        message: `RequestType for "${cfgKey}" is not configured. Set the H_RequestBases.RequestType int in src/portal/derivation/request-types.overlay.json (invite policy Rule 7 — we do not submit a mis-typed request).`,
      },
      { status: 501 },
    );
  }

  const payload = {
    RequesterUserId: session.userId,
    RequesterEntityId: session.entityId,
    RequestType: requestType,
    MetaData: JSON.stringify({
      kind,
      surfaceId: body.surfaceId,
      area: body.area,
      invitee: body.invitee,
      parentId: body.parentId,
      relatedId: body.relatedId,
    }),
  };

  try {
    const result = await executeSurfaceWriter<unknown>({
      session,
      writer: { surfaceId: body.surfaceId ?? 'request', buttonId: kind, backend: 'gd', method: 'POST', path: REQUEST_BASES_PATH, includeEntityId: true },
      body: JSON.stringify(payload),
      contentType: 'application/json',
    });
    return NextResponse.json({ ok: true, result });
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    logger.error('Invite/request failed', { kind, reason: message });
    return NextResponse.json({ error: 'request_failed', message }, { status: 502 });
  }
}

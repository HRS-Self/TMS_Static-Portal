import { NextRequest, NextResponse } from 'next/server';

import type { PortalSurfaceId } from '@/src/portal/chrome/portal-chrom-surface-registry.config';
import relationContracts from '@/src/portal/derivation/spc-relation-contracts.json';
import { getOptionalSession } from '@/src/server/auth/session';
import { executeSurfaceWriter } from '@/src/server/portal/surface-data-writer';
import { resolveSurfaceBackend } from '@/src/server/portal/surface-list-loader';
import { logger } from '@/src/server/logger';

export const dynamic = 'force-dynamic';

type RelationEndpoint = { action?: string; method?: string; path?: string; mode: string; note?: string };
type RelationContract = {
  kind: 'bridge' | 'child';
  junctionTable: string;
  parentFk: string | null;
  relatedEntity?: string;
  relatedFk?: string;
  relatedHasRootSurface?: boolean;
  assignableListSource?: string;
  assignableSurfaceKey?: string | null;
  sensitiveLinkage?: boolean;
  assignEndpoint?: RelationEndpoint;
  unassignEndpoint?: RelationEndpoint;
};

/**
 * Assign / Unassign a relation family record (the layer-2 picker + the relation grid's row action).
 * Resolves the per-family relation contract (junction + both FKs + assign/unassign endpoint) and
 * forwards to the domain backend: a dedicated /Assign-/Unassign recipe where the evidence has one,
 * else the junction /Set (assign = both FKs; unassign = soft-delete RecordDeleted:1). Sensitive
 * linkage (assigning an L1 user) is request-governed (invite policy Rule 5) — refused here until the
 * request flow (E4) lands, rather than faked as a direct write (Rule 7, honest gap).
 */
export async function POST(request: NextRequest) {
  const session = await getOptionalSession();
  if (!session) return NextResponse.json({ error: 'unauthenticated' }, { status: 401 });

  const body = (await request.json().catch(() => ({}))) as {
    surfaceId?: string;
    area?: string;
    op?: 'assign' | 'unassign';
    parentId?: string | number;
    relatedId?: string | number;
    junctionRowId?: string | number;
  };

  const surfaceId = String(body.surfaceId ?? '') as PortalSurfaceId;
  const contract = (relationContracts as Record<string, RelationContract>)[`${surfaceId}::${body.area}`];
  if (!contract || contract.kind !== 'bridge' || !contract.parentFk || !contract.relatedFk) {
    return NextResponse.json({ error: 'no_relation', surfaceId, area: body.area }, { status: 404 });
  }
  const op = body.op === 'unassign' ? 'unassign' : 'assign';

  if (contract.sensitiveLinkage) {
    return NextResponse.json(
      { error: 'request_governed', message: 'Linking this record is request/approval-governed and cannot be set directly.' },
      { status: 501 },
    );
  }

  const endpoint = op === 'assign' ? contract.assignEndpoint : contract.unassignEndpoint;
  if (!endpoint || endpoint.mode === 'PLACEHOLDER' || !endpoint.path) {
    return NextResponse.json({ error: 'no_endpoint', message: endpoint?.note ?? 'no endpoint for this relation' }, { status: 501 });
  }

  // capability projection (defense-in-depth; the backend is the real gate)
  const snapshot = session.surfaceCapabilities?.[surfaceId];
  const capFlag = op === 'assign' ? 'canCreate' : 'canUpdate';
  if (snapshot && snapshot[capFlag] === false) {
    return NextResponse.json({ error: 'forbidden' }, { status: 403 });
  }

  const pk = contract.parentFk;
  const rk = contract.relatedFk;
  let payload: Record<string, unknown>;
  if (op === 'assign') {
    payload = { [pk]: body.parentId, [rk]: body.relatedId };
  } else if (endpoint.mode === 'set-softdelete') {
    payload = body.junctionRowId != null
      ? { Id: body.junctionRowId, RecordDeleted: true }
      : { [pk]: body.parentId, [rk]: body.relatedId, RecordDeleted: true };
  } else {
    payload = { [pk]: body.parentId, [rk]: body.relatedId };
  }

  const backend = resolveSurfaceBackend(surfaceId);
  try {
    const result = await executeSurfaceWriter<unknown>({
      session,
      writer: { surfaceId, buttonId: op, backend, method: 'POST', path: endpoint.path, includeEntityId: true },
      body: JSON.stringify(payload),
      contentType: 'application/json',
    });
    return NextResponse.json({ ok: true, result });
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    logger.error('Relation write failed', { surfaceId, area: body.area, op, reason: message });
    return NextResponse.json({ error: 'relation_failed', message }, { status: 502 });
  }
}

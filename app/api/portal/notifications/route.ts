import { NextRequest, NextResponse } from 'next/server';

import type { PortalSurfaceId } from '@/src/portal/chrome/portal-chrom-surface-registry.config';
import { getOptionalSession } from '@/src/server/auth/session';
import { fetchBackendGatewayList } from '@/src/server/backend/data-gateway';
import { executeSurfaceWriter } from '@/src/server/portal/surface-data-writer';

export const dynamic = 'force-dynamic';

// In-app tray reads the portal-owned Vi_SPC_NotificationTray (NTF). The view already filters to
// ChannelType=InApp and Status IN (Sent, Read); we scope to the current user by RecordKey.
const TRAY_VIEW = 'Vi_SPC_NotificationTray';
const TRAY_SIZE = 30;
// H_ENUM_NotificationStatuses (NTF backend enum): 3=Sent, 5=Read. Read ⇒ the user has seen it.
const STATUS_READ = 5;

// Mark-read writes through the NTF notification-queue /Set. Its contract is filter-based + camelCase
// ({ filter: { id }, status }), distinct from the grid's PascalCase /Set — so we don't route it
// through surfaceWriterConfigs; an inline writer reuses executeSurfaceWriter's auth/header machinery.
const QUEUE_SET_WRITER = {
  surfaceId: 'header.notifications' as PortalSurfaceId,
  buttonId: 'mark-read',
  backend: 'notification',
  method: 'POST',
  path: '/api/v5-m1/notification-queue/Set',
  includeEntityId: true,
} as const;

type TrayRow = {
  Id?: number | string;
  Subject?: string | null;
  Text?: string | null;
  Status?: number | null;
  BroadcastedAt_UTC?: string | null;
  CreatedAt_UTC?: string | null;
  EntityRecordKey?: string | null;
};

/**
 * BFF for the header notification tray. Reads the current user's in-app notifications through the
 * DataGateway (Vi_SPC_NotificationTray on the NTF backend) and maps each row to the kit's
 * TMSNotificationTrayNotification shape. The view extracts the content from the request Body json
 * ($.subject → title, $.text → body); type/priority/action aren't carried by the notification
 * payload, so they take safe defaults. Read-only — marking read is a separate write.
 */
export async function GET() {
  const session = await getOptionalSession();
  if (!session) {
    return NextResponse.json({ message: 'Unauthorized' }, { status: 401 });
  }

  try {
    const result = await fetchBackendGatewayList<TrayRow>(session, 'notification', {
      dataSourceType: 'view',
      dataSourceValue: TRAY_VIEW,
      select: ['Id', 'Subject', 'Text', 'Status', 'BroadcastedAt_UTC', 'CreatedAt_UTC', 'EntityRecordKey'],
      // the user's own notifications (the queue fans out per recipient; scope by their RecordKey)
      filter: { UserRecordKey: { eq: session.userRecordKey } },
      sort: [['BroadcastedAt_UTC', 'desc']],
      page: 1,
      size: TRAY_SIZE,
    });

    // Kit-agnostic items; the chrome host (portal-shell) maps these to the header's notification
    // shape. Content comes from the request Body json ($.subject → title, $.text → body).
    const notifications = (Array.isArray(result.list) ? result.list : []).map((row) => ({
      id: String(row.Id ?? ''),
      title: (row.Subject ?? '').trim() || 'Notification',
      body: row.Text ?? '',
      isRead: row.Status === STATUS_READ,
      timestamp: row.BroadcastedAt_UTC ?? row.CreatedAt_UTC ?? '',
    }));

    return NextResponse.json({ notifications });
  } catch (error) {
    return NextResponse.json(
      { message: error instanceof Error ? error.message : 'Notification query failed' },
      { status: 502 },
    );
  }
}

/**
 * Mark a single in-app notification read: sets the queue row's Status to Read (5) via the NTF
 * notification-queue /Set. Body: { id }. The DataGateway/domain backend enforces ownership; we
 * don't re-scope here. Returns { ok: true } on success.
 */
export async function POST(request: NextRequest) {
  const session = await getOptionalSession();
  if (!session) {
    return NextResponse.json({ message: 'Unauthorized' }, { status: 401 });
  }

  const body = (await request.json().catch(() => ({}))) as { id?: number | string };
  const id = Number(body.id);
  if (!Number.isFinite(id)) {
    return NextResponse.json({ message: 'missing or invalid id' }, { status: 400 });
  }

  try {
    await executeSurfaceWriter({
      session,
      writer: QUEUE_SET_WRITER,
      body: JSON.stringify({ filter: { id }, status: STATUS_READ }),
      contentType: 'application/json',
    });
    return NextResponse.json({ ok: true });
  } catch (error) {
    return NextResponse.json(
      { message: error instanceof Error ? error.message : 'Mark-read failed' },
      { status: 502 },
    );
  }
}

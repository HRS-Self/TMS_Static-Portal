import { NextResponse } from 'next/server';

import { getOptionalSession } from '@/src/server/auth/session';
import { fetchBackendGatewayList } from '@/src/server/backend/data-gateway';

export const dynamic = 'force-dynamic';

// In-app tray reads the portal-owned Vi_SPC_NotificationTray (NTF). The view already filters to
// ChannelType=InApp and Status IN (Sent, Read); we scope to the current user by RecordKey.
const TRAY_VIEW = 'Vi_SPC_NotificationTray';
const TRAY_SIZE = 30;
// H_ENUM_NotificationStatuses (NTF backend enum): 3=Sent, 5=Read. Read ⇒ the user has seen it.
const STATUS_READ = 5;

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

    const notifications = (Array.isArray(result.list) ? result.list : []).map((row) => ({
      id: String(row.Id ?? ''),
      title: (row.Subject ?? '').trim() || 'Notification',
      body: row.Text ?? '',
      // The payload carries no kind/priority/action; default to a neutral system notification.
      type: 'system' as const,
      priority: 'medium' as const,
      backend: 'notification',
      isRead: row.Status === STATUS_READ,
      isActionable: false,
      timestamp: row.BroadcastedAt_UTC ?? row.CreatedAt_UTC ?? '',
      ...(row.EntityRecordKey ? { entityRef: row.EntityRecordKey } : {}),
    }));

    return NextResponse.json({ notifications });
  } catch (error) {
    return NextResponse.json(
      { message: error instanceof Error ? error.message : 'Notification query failed' },
      { status: 502 },
    );
  }
}

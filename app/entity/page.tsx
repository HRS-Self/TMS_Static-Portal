import { redirect } from 'next/navigation';

import { detectLogin } from '@/src/server/auth/session';
import { listEntityChoices } from '@/src/server/entity/entity-choices';
import { logger } from '@/src/server/logger';
import { hasActiveEntity } from '@/src/server/portal/entity-scope';

export const dynamic = 'force-dynamic';

function cn(...classes: Array<string | false | null | undefined>) {
  return classes.filter(Boolean).join(' ');
}

type EntitySelectionPageProps = {
  searchParams: Promise<{
    returnUrl?: string | string[];
  }>;
};

export default async function EntitySelectionPage({
  searchParams,
}: EntitySelectionPageProps) {
  const resolvedSearchParams = await searchParams;
  const session = await detectLogin('/entity');
  const requestedReturnUrl = resolvedSearchParams.returnUrl;
  const returnUrl =
    typeof requestedReturnUrl === 'string' &&
    requestedReturnUrl.startsWith('/') &&
    !requestedReturnUrl.startsWith('//')
      ? requestedReturnUrl
      : '/entity';
  const needsEntity = !hasActiveEntity(session);

  const choices = needsEntity ? await listEntityChoices(session) : [];

  logger.debug('Entity selection page state', {
    returnUrl,
    needsEntity,
    choicesCount: choices.length,
    hasEntityTitle: Boolean(session.entityTitle),
    hasEntityBackends: Boolean(session.entityBackends?.length),
  });

  if (needsEntity && choices.length === 1) {
    const only = choices[0];
    const params = new URLSearchParams();
    params.set('entityId', String(only.entityId));
    params.set('entityTitle', only.entityTitle);
    params.set('sources', JSON.stringify(only.sources));
    params.set('returnUrl', returnUrl);
    redirect(`/api/entity/select?${params.toString()}`);
  }

  if (!needsEntity && returnUrl !== '/entity') {
    redirect(returnUrl);
  }

  const noEntities = needsEntity && choices.length === 0;
  const needsEntitySelection = needsEntity && choices.length > 1;

  return (
    <div className="flex min-h-0 min-w-0 flex-1 flex-col gap-4 p-4 md:p-6">
      <div className="flex flex-col gap-1">
        <h1 className="text-xl font-semibold tms-governed-text-title">Company Context</h1>
        <p className="text-sm tms-governed-text-subtle">
          Select the company context for your current portal session.
        </p>
      </div>

      {!needsEntity ? (
        <div className="rounded-md border tms-governed-border-default tms-governed-surface-panel p-4">
          <div className="text-sm font-medium tms-governed-text-title">Active company</div>
          <div className="mt-1 text-sm tms-governed-text-body">{session.entityTitle ?? 'No active company'}</div>
          {session.entityBackends?.length ? (
            <div className="mt-3 flex flex-wrap gap-2">
              {session.entityBackends.map((backend) => (
                <span
                  key={backend}
                  className="rounded border tms-governed-border-default px-2 py-1 text-xs font-medium uppercase tracking-wide tms-governed-surface-muted"
                >
                  {backend}
                </span>
              ))}
            </div>
          ) : null}
        </div>
      ) : null}

      {noEntities ? (
        <div className="rounded-md border tms-governed-border-default tms-governed-surface-panel p-4 text-sm tms-governed-text-body">
          You have not been assigned to a company yet.
        </div>
      ) : null}

      {needsEntitySelection ? (
        <div className="grid gap-3">
          {choices.map((entity) => (
            <form
              key={entity.entityId}
              action="/api/entity/select"
              method="post"
              className="rounded-md border tms-governed-border-default tms-governed-surface-panel p-4"
            >
              <input type="hidden" name="entityId" value={String(entity.entityId)} />
              <input type="hidden" name="entityTitle" value={entity.entityTitle} />
              <input type="hidden" name="sources" value={JSON.stringify(entity.sources)} />
              <input type="hidden" name="returnUrl" value={returnUrl} />

              <div className="flex flex-col gap-3 md:flex-row md:items-center md:justify-between">
                <div className="min-w-0">
                  <div className="truncate text-sm font-semibold tms-governed-text-title">
                    {entity.entityTitle}
                  </div>
                  <div className="mt-1 text-xs tms-governed-text-subtle">
                    Entity ID: {entity.entityId}
                  </div>
                  <div className="mt-3 flex flex-wrap gap-2">
                    {entity.sources.map((source) => (
                      <span
                        className={cn(
                          'rounded border px-2 py-1 text-[10px] font-semibold uppercase tracking-wide',
                          source === 'gd' && 'border-emerald-200 bg-emerald-50 text-emerald-700',
                          source === 'core' && 'border-indigo-200 bg-indigo-50 text-indigo-700',
                          source === 'notification' && 'border-amber-200 bg-amber-50 text-amber-700',
                        )}
                        key={source}
                      >
                        {source}
                      </span>
                    ))}
                  </div>
                </div>

                <button
                  type="submit"
                  className="inline-flex items-center justify-center rounded-md bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-700"
                >
                  Select
                </button>
              </div>
            </form>
          ))}
        </div>
      ) : null}
    </div>
  );
}

import { TMSHeader } from "@conitdev/tms-ui-kit";
import type { ComponentProps } from "react";

import { searchRegistry } from "@/src/portal/derivation/search-registry";

// Global-search dropdowns derived from the generated registry (no hand-typed values).
// entity = the subject (value = surfaceKey); property = the searchable field label (a flat union
// across subjects per the kit's API — the shell resolves it per subject on submit).
const searchSubjects = Object.values(searchRegistry);
const searchEntityOptions = searchSubjects.map((subject) => ({ value: subject.key, title: subject.label }));
const searchPropertyOptions = [
  ...new Set(searchSubjects.flatMap((subject) => subject.fields.map((field) => field.label))),
].map((label) => ({ value: label, title: label }));

export type PortalChromHeaderRuntimeState = {
  isMobile: boolean;
  currentEntityId?: number;
  currentEntityTitle?: string;
  currentUserName?: string;
  currentUserInitials?: string;
  /** All company choices (cached at login) — feed the header switcher; id = entityId string. */
  entityChoices?: Array<{ entityId: number; entityTitle: string }>;
};

type PortalChromHeaderProps = ComponentProps<typeof TMSHeader>;

export function buildPortalChromHeaderProps({
  isMobile,
  currentEntityId,
  currentEntityTitle,
  currentUserName,
  currentUserInitials,
  entityChoices,
}: PortalChromHeaderRuntimeState): PortalChromHeaderProps {
  // selector options keyed by entityId so onCompanySelectorChange yields the id to select
  const companySelectorOptions = (entityChoices ?? []).map((choice) => ({
    id: String(choice.entityId),
    title: choice.entityTitle,
  }));

  return {
    id: "portal-header",
    title: "Portal",
    name: "portal-header",
    appName: "Portal",
    widgets: {
      menu: { position: "start", visibility: isMobile },
      logo: { position: "start", visibility: true },
      search: { position: "center", visibility: true },
      profile: { position: "end", visibility: true },
      notification: { position: "end", visibility: true },
    },
    notifications: [],
    profile: {
      name: currentUserName ?? "Portal User",
      category: currentEntityTitle ?? "Portal Workspace",
      initials: currentUserInitials ?? "PU",
      showAvatar: true,
      showText: false,
      menu: [
        // sentinel href → intercepted by onClickMenuItem in the shell (opens the selector modal)
        { title: "Switch company", href: "#switch-company", icon: "lucide:arrow-left-right" },
        { title: "Notification Inbox", href: "/inbox/notifications", icon: "notification" },
        {
          title: "Information",
          href: "/info/help",
          icon: "about",
          items: [
            { title: "Help", href: "/info/help", icon: "about" },
            { title: "Support", href: "/info/support", icon: "call" },
            { title: "Knowledge", href: "/info/knowledge", icon: "lucide:book-open" },
          ],
        },
      ],
      // iconImage: undefined,
      // bgColorProfile: undefined,
      // bgColorMenuProfile: undefined,
      // signOutOnClick: undefined,
      // onClickMenuItem: undefined,
    },
    profileInitials: currentUserInitials ?? "PU",
    searchPlaceholder: "Search — abc=exact, abc*=starts, *abc=ends, *abc*=contains",
    searchEntityOptions,
    searchPropertyOptions,
    defaultSearchEntity: searchEntityOptions[0]?.value,
    defaultSearchProperty: searchPropertyOptions[0]?.value,
    showSearchBar: searchEntityOptions.length > 0,
    showCompanySelector: companySelectorOptions.length > 1,
    showHelp: true,
    showNotification: true,
    companySelectorTitle: "Company",
    companySelectorPlaceholder: "Active company",
    companySelectorName: "portal-company-context",
    companySelectorValue: currentEntityId != null ? String(currentEntityId) : "",
    companySelectorOptions,
    helpButtonProps: { message: "Help" },
    notificationButtonProps: { message: "Notifications" },
    // children: undefined,
    // iconImage: undefined,
    // defaultSearchEntity: undefined,
    // defaultSearchProperty: undefined,
    // showHelpAction: undefined,
    // showHelpButton: undefined,
    // showNotificationButton: undefined,
    // companySelectorStartIcon: undefined,
    // disableNotificationTray: undefined,
    // onSearch: undefined,
    // onCompanySelectorChange: undefined,
    // onClickHelp: undefined,
    // bgColorHeader: undefined,
    // textColorHeader: undefined,
    // bgColorTools: undefined,
    // signOutOnClick: undefined,
    // onClickMenuItem: undefined,
    // onClickSeeAllNotif: undefined,
    // onClickNotif: undefined,
  } satisfies PortalChromHeaderProps;
}

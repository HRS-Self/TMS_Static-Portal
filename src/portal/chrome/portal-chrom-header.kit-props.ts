import { TMSHeader } from "@conitdev/tms-ui-kit";
import type { ComponentProps } from "react";

export type PortalChromHeaderRuntimeState = {
  isMobile: boolean;
  currentEntityTitle?: string;
  currentUserName?: string;
  currentUserInitials?: string;
};

type PortalChromHeaderProps = ComponentProps<typeof TMSHeader>;

function normalizeCompanySelectorValue(value: string): string {
  return value.trim().toLowerCase().replace(/\s+/g, "-");
}

export function buildPortalChromHeaderProps({
  isMobile,
  currentEntityTitle,
  currentUserName,
  currentUserInitials,
}: PortalChromHeaderRuntimeState): PortalChromHeaderProps {
  const companySelectorOptions = currentEntityTitle
    ? [
        {
          id: normalizeCompanySelectorValue(currentEntityTitle),
          title: currentEntityTitle,
        },
      ]
    : [];

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
    searchPlaceholder: "Search portal",
    searchEntityOptions: ["All", "Vehicles", "Drivers", "Distributors", "CVOs"],
    searchPropertyOptions: ["All fields", "Name", "Email", "Phone", "Plate"],
    showSearchBar: true,
    showCompanySelector: companySelectorOptions.length > 0,
    showHelp: true,
    showNotification: true,
    companySelectorTitle: "Company",
    companySelectorPlaceholder: "Active company",
    companySelectorName: "portal-company-context",
    companySelectorValue:
      companySelectorOptions.length > 0 ? String(companySelectorOptions[0]?.id ?? "") : "",
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

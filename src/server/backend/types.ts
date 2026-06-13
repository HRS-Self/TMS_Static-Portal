import type { AuthSession } from "@/src/server/auth/types";

export type BackendContext = {
  session: AuthSession;
};

export type BackendUserEntityDto = {
  userId?: number;
  entityId?: number;
  entityTitle: string;
};

export type BackendProfileDto = {
  id?: string;
  name?: string;
  email?: string;
  [key: string]: unknown;
};

export interface BackendAdapter {
  getProfile(context: BackendContext): Promise<BackendProfileDto>;
  getUserEntities(context: BackendContext): Promise<BackendUserEntityDto[]>;
}

export interface Backends {
  gd: BackendAdapter;
  core: BackendAdapter;
  notification: BackendAdapter;
}

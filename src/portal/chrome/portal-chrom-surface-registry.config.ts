export type PortalSurfaceSection="dashboard"|"operational"|"definitions"|"system"|"inbox"|"info";
export type PortalSurfaceStatus="implemented"|"contract-only"|"placeholder"|"blocked-by-backend"|"stopgap";
export type PortalBackendOwner="gd"|"core"|"notification"|"none";
export type PortalSurface={id:string;route:string;title:string;section:PortalSurfaceSection;surfaceKind:string;implementationStatus:PortalSurfaceStatus;backendOwner:PortalBackendOwner;readModel?:string};
// Populated by S5 from the S3 surface catalog (generated projection).
import { generatedPortalSurfaces } from "./portal-chrom-surface-registry.generated";
export const portalSurfaces: readonly PortalSurface[] = generatedPortalSurfaces;
export type PortalSurfaceId=string;
export function getPortalSurface(surfaceId:PortalSurfaceId):PortalSurface|undefined{return portalSurfaces.find((surface)=>surface.id===surfaceId)}
export function getPortalSurfaceByRoute(route:string):PortalSurface|undefined{return portalSurfaces.find((surface)=>surface.route===route)}

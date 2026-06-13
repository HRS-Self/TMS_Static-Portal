export type PortalSurfaceSection="dashboard"|"operational"|"definitions"|"system"|"inbox"|"info";
export type PortalSurfaceStatus="implemented"|"contract-only"|"placeholder"|"blocked-by-backend"|"stopgap";
export type PortalBackendOwner="gd"|"core"|"notification"|"none";
export type PortalSurface={id:string;route:string;title:string;section:PortalSurfaceSection;surfaceKind:string;implementationStatus:PortalSurfaceStatus;backendOwner:PortalBackendOwner;readModel?:string};
// Agnostic baseline: the surface registry is empty. A built portal instance
// populates it at S3 (Surface Catalog) from its own data model.
export const portalSurfaces: readonly PortalSurface[]=[];
export type PortalSurfaceId=string;
export function getPortalSurface(surfaceId:PortalSurfaceId):PortalSurface|undefined{return portalSurfaces.find((surface)=>surface.id===surfaceId)}
export function getPortalSurfaceByRoute(route:string):PortalSurface|undefined{return portalSurfaces.find((surface)=>surface.route===route)}

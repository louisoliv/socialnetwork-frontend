

export const index = 2;
let component_cache;
export const component = async () => component_cache ??= (await import('../entries/pages/_page.svelte.js')).default;
export const imports = ["_app/immutable/nodes/2.Cxkp0zJ2.js","_app/immutable/chunks/scheduler.BZ194UJb.js","_app/immutable/chunks/index.CwL_Cdf_.js","_app/immutable/chunks/entry.Bbxcva7f.js"];
export const stylesheets = [];
export const fonts = [];

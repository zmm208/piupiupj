// SillyTavern root module compatibility surface used by preset extensions.
export const displayVersion = 'SillyTavern 1.13.4 (PiuPiu compatibility)';

// SillyTavern replaces this object for an active streaming generation. PiuPiu
// exposes its stream through TavernHelper events, so no processor exists while
// idle; extensions already treat null as the upstream idle state.
export let streamingProcessor = null;

// Resolve in the caller's realm so iframe imports use its host context bridge.
export async function getCharacters() {
    const context = globalThis.SillyTavern?.getContext?.();
    if (typeof context?.getCharacters !== 'function') throw new Error('角色列表刷新服务尚未就绪');
    await context.getCharacters();
}

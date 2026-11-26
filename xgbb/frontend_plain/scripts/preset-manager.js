// Mirrors SillyTavern's public preset-manager entry point.
export function getPresetManager(apiId = '') {
  const context = globalThis.SillyTavern?.getContext?.() || {};
  return context.getPresetManager?.(apiId) || null;
}

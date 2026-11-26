// Live access to PiuPiu's preset regex admission state, not a simulated allowlist.
function runtime() {
  const state = globalThis.SillyTavern?.getContext?.().__piupiuRegex;
  if (!state) throw new Error('Preset regex runtime is not ready');
  return state;
}
export function getCurrentPresetAPI() { return runtime().getCurrentPresetAPI(); }
export function getCurrentPresetName() { return runtime().getCurrentPresetName(); }
export function isPresetScriptsAllowed(apiId, presetName) {
  return runtime().isPresetScriptsAllowed(apiId, presetName);
}

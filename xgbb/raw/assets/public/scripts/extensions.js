// Read-only extension discovery for PiuPiu's installed compatibility engines.
// Resolve per call: this module can survive navigating between chat views.
export function getContext() {
  const context = globalThis.SillyTavern?.getContext?.();
  if (!context) throw new Error('Chat context is not ready');
  return context;
}
function registry() {
  const value = getContext().__piupiuExtensions;
  if (!value) throw new Error('Extension registry is not ready');
  return value;
}
export const extensionNames = [];
export function refreshExtensionNames() {
  extensionNames.splice(0, extensionNames.length, ...registry().getNames());
  return extensionNames;
}
export function getExtensionManifest(name) { return registry().getManifest(name); }
export function findExtension(name) { return registry().findExtension(name); }
export const extension_settings = new Proxy({}, {
  get: (_target, key) => registry().getSettings()[key],
  has: (_target, key) => key in registry().getSettings(),
  set: (_target, key, value) => { registry().getSettings()[key] = value; return true; },
  deleteProperty: (_target, key) => Reflect.deleteProperty(registry().getSettings(), key),
  ownKeys: () => Reflect.ownKeys(registry().getSettings()),
  getOwnPropertyDescriptor: (_target, key) => {
    const descriptor = Object.getOwnPropertyDescriptor(registry().getSettings(), key);
    return descriptor ? { ...descriptor, configurable: true } : undefined;
  }
});
try { refreshExtensionNames(); } catch (_) { /* Imported before a chat is open. */ }
globalThis.addEventListener?.('piupiu-extension-registry-ready', refreshExtensionNames);

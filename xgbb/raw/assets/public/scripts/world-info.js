// Compatibility entry point for cards importing SillyTavern's native module.
// Resolve the current realm on every call; never retain another chat's helper.
function helper() {
  const value = globalThis.TavernHelper;
  if (!value || typeof value.loadWorldInfo !== 'function' || typeof value.saveWorldInfo !== 'function') {
    throw new Error('World info API is unavailable in this document');
  }
  return value;
}

export let world_names = [];
export const world_info_position = {
  before: 0, after: 1, ANTop: 2, ANBottom: 3, atDepth: 4, EMTop: 5, EMBottom: 6, outlet: 7,
};
export const newWorldInfoEntryTemplate = {
  key: [], keysecondary: [], comment: '', content: '', constant: false, vectorized: false,
  selective: true, selectiveLogic: 0, addMemo: false, order: 100, position: 0, disable: false,
  excludeRecursion: false, preventRecursion: false, delayUntilRecursion: 0,
  probability: 100, useProbability: true, depth: 4, role: 0, scanDepth: null,
  caseSensitive: null, matchWholeWords: null, useGroupScoring: null,
  group: '', groupOverride: false, groupWeight: 100, automationId: '',
  sticky: null, cooldown: null, delay: null, ignoreBudget: false, outletName: '', triggers: [],
  matchPersonaDescription: false, matchCharacterDescription: false, matchCharacterPersonality: false,
  matchCharacterDepthPrompt: false, matchScenario: false, matchCreatorNotes: false,
};

export async function updateWorldInfoList() {
  world_names = [...await helper().getWorldbookNames()];
}

export async function loadWorldInfo(name) {
  if (!name) return null;
  return await helper().loadWorldInfo(name);
}

export async function saveWorldInfo(name, data, _immediately = false) {
  if (!name || !data) return;
  // Persist before resolving, including callers that omit ST's debounce flag.
  const result = await helper().saveWorldInfo(name, data);
  if (result === false) throw new Error('World info could not be saved');
  await updateWorldInfoList();
}

export async function createNewWorldInfo(name, _options = {}) {
  if (!name) return false;
  // An import cannot show ST's overwrite dialog. Preserve existing books.
  const created = await helper().createWorldbook(name, []);
  await updateWorldInfoList();
  return created;
}

export function createWorldInfoEntry(_name, data) {
  if (!data || !data.entries || typeof data.entries !== 'object') return undefined;
  const used = new Set(Object.values(data.entries).map(entry => Number(entry.uid)));
  let uid = 0;
  while (used.has(uid) || Object.prototype.hasOwnProperty.call(data.entries, uid)) uid += 1;
  const entry = { uid, ...JSON.parse(JSON.stringify(newWorldInfoEntryTemplate)) };
  data.entries[uid] = entry;
  return entry;
}

export async function charUpdatePrimaryWorld(name) {
  await helper().rebindCharWorldbooks('current', { primary: name || null });
}

export async function deleteWorldInfo(name) {
  const result = await helper().deleteWorldbook(name);
  await updateWorldInfoList();
  return result;
}

// Match ST's immediately available list when the runtime has a synchronous snapshot.
try {
  const names = helper().getWorldbookNames();
  if (Array.isArray(names)) world_names = [...names];
} catch (_) { /* A later call may run after the chat bridge is installed. */ }

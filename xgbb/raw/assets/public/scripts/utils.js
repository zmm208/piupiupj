// SillyTavern utility exports used by preset extensions.
export function equalsIgnoreCaseAndAccents(a, b) {
  return String(a ?? '').localeCompare(String(b ?? ''), undefined, {
    sensitivity: 'base',
    usage: 'search',
  }) === 0;
}

export async function getSanitizedFilename(fileName) {
  return String(fileName ?? '')
    .replace(/[<>:"/\\|?*\u0000-\u001F]/g, '_')
    .replace(/[. ]+$/g, '')
    .trim();
}

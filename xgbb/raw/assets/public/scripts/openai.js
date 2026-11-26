// SillyTavern OpenAI module compatibility surface for TavernHelper preset extensions.
// The exported shapes mirror SillyTavern's public module; state is sourced from
// the live SillyTavern.getContext() object exposed by PiuPiu.

function getContext() {
  return globalThis.SillyTavern?.getContext?.() || {};
}

class PreparedPrompt {
  constructor(prompt = {}) {
    Object.assign(this, prompt || {});
    this.identifier ||= '';
    this.role ||= 'system';
    this.content ??= '';
  }
}

export class Message {
  static tokensPerImage = 85;

  constructor(role, content, identifier) {
    this.identifier = identifier || '';
    this.role = role || 'system';
    this.content = content ?? '';
    this.tokens = 0;
  }

  static async createAsync(role, content, identifier) {
    return new Message(role, content, identifier);
  }

  static fromPromptAsync(prompt) {
    return Message.createAsync(prompt?.role, prompt?.content, prompt?.identifier);
  }

  ensureContentIsArray() {
    if (!Array.isArray(this.content)) {
      const text = this.content;
      this.content = typeof text === 'string' ? [{ type: 'text', text }] : [];
    }
    return this.content;
  }

  async setName(name) {
    this.name = name;
  }

  getTokens() {
    return this.tokens;
  }
}

export class MessageCollection {
  constructor(identifier, ...items) {
    this.collection = [];
    this.identifier = identifier || '';
    this.collection.push(...items);
  }

  getChat() {
    return this.collection.flatMap(item => {
      if (item instanceof MessageCollection) return item.getChat();
      if (!(item?.content || item?.tool_calls)) return [];
      return [{
        role: item.role,
        content: item.content,
        ...(item.name ? { name: item.name } : {}),
        ...(item.tool_calls ? { tool_calls: item.tool_calls } : {}),
        ...(item.role === 'tool' ? { tool_call_id: item.identifier } : {}),
        ...(item.signature ? { signature: item.signature } : {}),
        ...(item.reasoning ? { reasoning: item.reasoning } : {}),
      }];
    });
  }

  getCollection() {
    return this.collection;
  }

  add(item) {
    this.collection.push(item);
  }

  getItemByIdentifier(identifier) {
    return this.collection.find(item => item?.identifier === identifier);
  }

  hasItemWithIdentifier(identifier) {
    return this.collection.some(item => item?.identifier === identifier);
  }
}

function buildCurrentMessages() {
  const chat = Array.isArray(getContext().chat) ? getContext().chat : [];
  return new MessageCollection('chat', ...chat.map((entry, index) => {
    const role = entry?.role || (entry?.is_user ? 'user' : 'assistant');
    const content = entry?.content ?? entry?.mes ?? entry?.message ?? '';
    return new Message(role, content, `chatHistory-${index}`);
  }));
}

let assignedMessages = null;

export const promptManager = {
  preparePrompt(prompt, original = null) {
    const prepared = new PreparedPrompt(prompt);
    if (typeof original === 'string' && typeof prepared.content === 'string') {
      prepared.content = prepared.content.replace(/{{\s*original\s*}}/gi, original);
    }
    const substitute = getContext().substituteParams;
    if (typeof substitute === 'function' && typeof prepared.content === 'string') {
      prepared.content = substitute(prepared.content);
    }
    return prepared;
  },
  getActiveGroupCharacters() {
    const context = getContext();
    if (!context.groupId || !Array.isArray(context.characters)) return [];
    return context.characters.map(character => character?.name).filter(Boolean);
  },
  setChatCompletion(chatCompletion) {
    const messages = chatCompletion?.getMessages?.() || chatCompletion?.messages;
    if (messages) assignedMessages = messages;
  },
  get messages() {
    return assignedMessages || buildCurrentMessages();
  },
  set messages(value) {
    assignedMessages = value;
  },
};

export async function sendOpenAIRequest(type, messages, signal, options = {}) {
  const context = getContext();
  if (typeof context.sendOpenAIRequest === 'function') {
    return context.sendOpenAIRequest(type, messages, signal, options);
  }
  throw new Error('No SillyTavern-compatible generation function is available');
}

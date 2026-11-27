# Local semantic memory model

Model: [BAAI/bge-small-zh-v1.5](https://huggingface.co/BAAI/bge-small-zh-v1.5).
ONNX conversion: [Xenova/bge-small-zh-v1.5](https://huggingface.co/Xenova/bge-small-zh-v1.5), revision `75c43b069aac4d136ba6bc1122f995fedcfd2781`.

The quantized model is bundled for offline Android inference. It has 512 output dimensions and uses normalized CLS pooling. Chinese is its primary language; it is not an English or multilingual specialist. Document and query encoding use no retrieval prefix, as validated against conversation-style queries. Long documents use overlapping token windows.

`source.json` records exact model file hashes. Run `node scripts/verify-rag-model.mjs` before packaging. Model identity and source-text fingerprints accompany stored vectors; old vectors are rebuilt in the background when a conversation opens. Model replacement never requires deleting chat history.

Historical rebuilding runs only in a ready, visible, idle conversation, after existing database/MVU migration. It pauses on navigation, backgrounding, or generation and resumes from per-message markers. Writes update only derived fields when the original message still exists with the same text. New-message embedding is asynchronous and retains its originating session.

The memory toggle controls retrieval/prompt injection only: startup warmup, new-message vectors and idle history repair remain enabled so recall can be switched on without starting over. Repair validates stored vectors in SQLite and transfers only text/status metadata. Both live saves and history repair share the same inference queue; identical text jobs are merged, and cancelling one consumer leaves other consumers running.

Inference runs in a single worker, with query priority between 448-token document windows (48-token overlap). Stored normalized components are rounded to six decimal places to reduce SQLite/bridge traffic; optional retrieval has a 600 ms budget and falls back to partial or literal matches without delaying chat for model startup. These limits favor responsiveness on slower devices, so very large histories can return partial recall. Old model vectors are never compared to the new model's vectors.

License: MIT; see LICENSE and the upstream model card.

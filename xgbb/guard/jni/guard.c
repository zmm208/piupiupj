/* guard.c — PiuPiu 破甲引擎（精简版）
 * 只保留：破甲 blob 解密/校验 + 激活词/预填/拒答判定/升温表 + 自检探针
 * 已移除：Key1/Key2 校验、设备封条、设备白名单（按需求去掉全部密钥与设备检测）
 */
#include <jni.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/ptrace.h>
#include <regex.h>
#include <android/log.h>

#include "crypto.h"
#include "secrets.h"

#define TAG "PiuPiuGuard"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,  TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, TAG, __VA_ARGS__)

#define BLOB_MAGIC 0x50554731u

static uint8_t  g_key[32];
static uint8_t *g_blob = NULL;
static uint32_t g_blob_len = 0;
static int      g_inited = 0;

static const char *T_ARMOR = NULL, *T_ACT = NULL, *T_ACTED = NULL,
                  *T_PA = NULL, *T_PAN = NULL, *T_ESC = NULL, *T_NUDGE = NULL;
static regex_t *g_rx = NULL; static int g_rx_n = 0;

static int check_tracer(void) {
  FILE *f = fopen("/proc/self/status", "r");
  if (!f) return 0;
  char line[256]; int bad = 0;
  while (fgets(line, sizeof line, f)) {
    if (strncmp(line, "TracerPid:", 10) == 0) {
      int pid = atoi(line + 10);
      if (pid != 0) bad = 1;
      break;
    }
  }
  fclose(f);
  return bad;
}

static int check_maps(void) {
  static const char *sig[] = {"frida", "gadget", "xposed", "LSPosed", "magisk", "zygisk", "riru"};
  FILE *f = fopen("/proc/self/maps", "r");
  if (!f) return 0;
  char line[512]; int found = 0;
  while (fgets(line, sizeof line, f)) {
    for (size_t i = 0; i < sizeof(sig)/sizeof(sig[0]); i++)
      if (strstr(line, sig[i])) { found = 1; break; }
    if (found) break;
  }
  fclose(f);
  return found;
}

static uint32_t rd_u32(const uint8_t *p) {
  return (uint32_t)p[0] | ((uint32_t)p[1]<<8) | ((uint32_t)p[2]<<16) | ((uint32_t)p[3]<<24);
}

static int blob_init(void) {
  if (g_inited) return 0;
  sha256_ctx c; sha256_init(&c);
  sha256_update(&c, BUILD_SALT, sizeof BUILD_SALT);
  sha256_final(&c, g_key);

  g_blob = (uint8_t*)malloc(ARMOR_CT_LEN);
  if (!g_blob) return -1;
  memcpy(g_blob, ARMOR_CT, ARMOR_CT_LEN);
  chacha20_xor(g_key, ARMOR_NONCE, 1, g_blob, ARMOR_CT_LEN);
  if (ARMOR_CT_LEN < 36) return -1;

  uint8_t tag[32], calc[32];
  memcpy(tag, g_blob, 32);
  g_blob_len = ARMOR_CT_LEN - 32;
  hmac_sha256(g_key, 32, g_blob + 32, g_blob_len, calc);
  if (!ct_equal(tag, calc, 32)) { wipe(g_blob, ARMOR_CT_LEN); return -2; }

  const uint8_t *p = g_blob + 32;
  uint32_t magic = rd_u32(p); p += 4;
  if (magic != BLOB_MAGIC) return -3;
  uint32_t cnt = rd_u32(p); p += 4;

  const uint8_t *q = p;
  for (uint32_t i = 0; i < cnt; i++) {
    uint8_t t = *q++;
    uint32_t l = rd_u32(q); q += 4;
    if (t == 6) g_rx_n++;
    q += l;
  }
  if (g_rx_n) g_rx = (regex_t*)calloc((size_t)g_rx_n, sizeof(regex_t));

  int ri = 0;
  q = p;
  for (uint32_t i = 0; i < cnt; i++) {
    uint8_t t = *q++;
    uint32_t l = rd_u32(q); q += 4;
    char *s = (char*)malloc(l + 1);
    if (!s) continue;
    memcpy(s, q, l); s[l] = 0;
    switch (t) {
      case 1: T_ARMOR = s; break;
      case 2: T_ACT   = s; break;
      case 3: T_ACTED = s; break;
      case 4: T_PA    = s; break;
      case 5: T_PAN   = s; break;
      case 6: if (ri < g_rx_n) { regcomp(&g_rx[ri], s, REG_EXTENDED|REG_ICASE|REG_NOSUB); ri++; } free(s); break;
      case 200: T_ESC  = s; break;
      case 201: T_NUDGE = s; break;
      default: free(s); break;
    }
    q += l;
  }
  g_inited = 1;
  LOGI("armor ready len=%u rx=%d", g_blob_len, g_rx_n);
  return 0;
}

static jstring jstr(JNIEnv *e, const char *s) { return s ? (*e)->NewStringUTF(e, s) : NULL; }

JNIEXPORT jint JNICALL
Java_io_piupiu_chat_guard_GuardNative_nativeInit(JNIEnv *e, jclass c) {
  (void)e; (void)c;
  int rc = blob_init();
  if (rc != 0) LOGE("init failed rc=%d", rc);
  return rc;
}

JNIEXPORT jint JNICALL
Java_io_piupiu_chat_guard_GuardNative_nativeSelfCheck(JNIEnv *e, jclass c) {
  (void)e; (void)c;
  int bits = 0;
  if (check_tracer()) bits |= 1;
  if (check_maps())   bits |= 2;
  return bits;
}

JNIEXPORT jstring JNICALL Java_io_piupiu_chat_guard_GuardNative_nativeArmorPrompt(JNIEnv *e, jclass c) {
  (void)c; if (blob_init() != 0) return NULL; return jstr(e, T_ARMOR); }
JNIEXPORT jstring JNICALL Java_io_piupiu_chat_guard_GuardNative_nativeActivation(JNIEnv *e, jclass c) {
  (void)c; if (blob_init() != 0) return NULL; return jstr(e, T_ACT); }
JNIEXPORT jstring JNICALL Java_io_piupiu_chat_guard_GuardNative_nativeActivated(JNIEnv *e, jclass c) {
  (void)c; if (blob_init() != 0) return NULL; return jstr(e, T_ACTED); }
JNIEXPORT jstring JNICALL Java_io_piupiu_chat_guard_GuardNative_nativePrefillActivate(JNIEnv *e, jclass c) {
  (void)c; if (blob_init() != 0) return NULL; return jstr(e, T_PA); }
JNIEXPORT jstring JNICALL Java_io_piupiu_chat_guard_GuardNative_nativePrefillAnswer(JNIEnv *e, jclass c) {
  (void)c; if (blob_init() != 0) return NULL; return jstr(e, T_PAN); }
JNIEXPORT jstring JNICALL Java_io_piupiu_chat_guard_GuardNative_nativeEscalation(JNIEnv *e, jclass c) {
  (void)c; if (blob_init() != 0) return NULL; return jstr(e, T_ESC); }
JNIEXPORT jstring JNICALL Java_io_piupiu_chat_guard_GuardNative_nativeNudge(JNIEnv *e, jclass c) {
  (void)c; if (blob_init() != 0) return NULL; return jstr(e, T_NUDGE); }

JNIEXPORT jboolean JNICALL
Java_io_piupiu_chat_guard_GuardNative_nativeIsRefusal(JNIEnv *e, jclass c, jstring js) {
  (void)c;
  if (blob_init() != 0 || !js) return JNI_FALSE;
  const char *s = (*e)->GetStringUTFChars(e, js, NULL);
  if (!s) return JNI_FALSE;
  int hit = 0;
  for (int i = 0; i < g_rx_n && !hit; i++)
    if (regexec(&g_rx[i], s, 0, NULL, 0) == 0) hit = 1;
  (*e)->ReleaseStringUTFChars(e, js, s);
  return hit ? JNI_TRUE : JNI_FALSE;
}

JNIEXPORT void JNICALL
Java_io_piupiu_chat_guard_GuardNative_nativeWipe(JNIEnv *e, jclass c) {
  (void)e; (void)c;
  if (g_blob) { wipe(g_blob, ARMOR_CT_LEN); free(g_blob); g_blob = NULL; }
  wipe(g_key, 32); g_inited = 0;
}

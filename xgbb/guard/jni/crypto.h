/* crypto.h — SHA-256 / HMAC-SHA256 / ChaCha20 / 常量时间比较
 * 自包含单头文件实现，避免链接 OpenSSL（NDK 默认不带）。
 */
#ifndef PIUPIU_CRYPTO_H
#define PIUPIU_CRYPTO_H

#include <stdint.h>
#include <string.h>
#include <stdlib.h>

/* ------------------------------- SHA-256 ------------------------------- */
typedef struct { uint32_t h[8]; uint64_t len; uint8_t buf[64]; size_t n; } sha256_ctx;

static const uint32_t K256[64] = {
 0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
 0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
 0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
 0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
 0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
 0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
 0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
 0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
};

#define ROR32(x,n) (((x)>>(n))|((x)<<(32-(n))))

static void sha256_block(sha256_ctx *c, const uint8_t *p) {
  uint32_t w[64], a,b,cc,d,e,f,g,h,t1,t2; int i;
  for (i = 0; i < 16; i++)
    w[i] = ((uint32_t)p[i*4]<<24)|((uint32_t)p[i*4+1]<<16)|((uint32_t)p[i*4+2]<<8)|p[i*4+3];
  for (i = 16; i < 64; i++) {
    uint32_t s0 = ROR32(w[i-15],7)^ROR32(w[i-15],18)^(w[i-15]>>3);
    uint32_t s1 = ROR32(w[i-2],17)^ROR32(w[i-2],19)^(w[i-2]>>10);
    w[i] = w[i-16]+s0+w[i-7]+s1;
  }
  a=c->h[0];b=c->h[1];cc=c->h[2];d=c->h[3];e=c->h[4];f=c->h[5];g=c->h[6];h=c->h[7];
  for (i = 0; i < 64; i++) {
    t1 = h + (ROR32(e,6)^ROR32(e,11)^ROR32(e,25)) + ((e&f)^((~e)&g)) + K256[i] + w[i];
    t2 = (ROR32(a,2)^ROR32(a,13)^ROR32(a,22)) + ((a&b)^(a&cc)^(b&cc));
    h=g;g=f;f=e;e=d+t1;d=cc;cc=b;b=a;a=t1+t2;
  }
  c->h[0]+=a;c->h[1]+=b;c->h[2]+=cc;c->h[3]+=d;c->h[4]+=e;c->h[5]+=f;c->h[6]+=g;c->h[7]+=h;
}

static void sha256_init(sha256_ctx *c) {
  c->h[0]=0x6a09e667;c->h[1]=0xbb67ae85;c->h[2]=0x3c6ef372;c->h[3]=0xa54ff53a;
  c->h[4]=0x510e527f;c->h[5]=0x9b05688c;c->h[6]=0x1f83d9ab;c->h[7]=0x5be0cd19;
  c->len=0; c->n=0;
}

static void sha256_update(sha256_ctx *c, const void *data, size_t len) {
  const uint8_t *p = (const uint8_t*)data;
  c->len += (uint64_t)len * 8;
  while (len) {
    size_t take = 64 - c->n;
    if (take > len) take = len;
    memcpy(c->buf + c->n, p, take);
    c->n += take; p += take; len -= take;
    if (c->n == 64) { sha256_block(c, c->buf); c->n = 0; }
  }
}

static void sha256_final(sha256_ctx *c, uint8_t out[32]) {
  uint64_t bits = c->len;
  uint8_t pad = 0x80;
  sha256_update(c, &pad, 1);
  uint8_t zero = 0;
  while (c->n != 56) sha256_update(c, &zero, 1);
  uint8_t lb[8]; int i;
  for (i = 0; i < 8; i++) lb[i] = (uint8_t)(bits >> (56 - 8*i));
  sha256_update(c, lb, 8);
  for (i = 0; i < 8; i++) {
    out[i*4]   = (uint8_t)(c->h[i] >> 24);
    out[i*4+1] = (uint8_t)(c->h[i] >> 16);
    out[i*4+2] = (uint8_t)(c->h[i] >> 8);
    out[i*4+3] = (uint8_t)(c->h[i]);
  }
}

static void sha256(const void *data, size_t len, uint8_t out[32]) {
  sha256_ctx c; sha256_init(&c); sha256_update(&c, data, len); sha256_final(&c, out);
}

/* ---------------------------- HMAC-SHA256 ------------------------------ */
static void hmac_sha256(const uint8_t *key, size_t klen, const uint8_t *msg, size_t mlen, uint8_t out[32]) {
  uint8_t k[64], ipad[64], opad[64], inner[32];
  sha256_ctx c; int i;
  memset(k, 0, 64);
  if (klen > 64) sha256(key, klen, k);
  else memcpy(k, key, klen);
  for (i = 0; i < 64; i++) { ipad[i] = k[i] ^ 0x36; opad[i] = k[i] ^ 0x5c; }
  sha256_init(&c); sha256_update(&c, ipad, 64); sha256_update(&c, msg, mlen); sha256_final(&c, inner);
  sha256_init(&c); sha256_update(&c, opad, 64); sha256_update(&c, inner, 32); sha256_final(&c, out);
  memset(k, 0, sizeof k); memset(ipad, 0, 64); memset(opad, 0, 64); memset(inner, 0, 32);
}

/* ------------------------------ ChaCha20 ------------------------------- */
static void chacha20_block(const uint8_t key[32], const uint8_t nonce[12], uint32_t counter, uint8_t out[64]) {
  uint32_t st[16], x[16]; int i, r;
  st[0]=0x61707865; st[1]=0x3320646e; st[2]=0x79622d32; st[3]=0x6b206574;
  for (i = 0; i < 8; i++)
    st[4+i] = (uint32_t)key[i*4] | ((uint32_t)key[i*4+1]<<8) | ((uint32_t)key[i*4+2]<<16) | ((uint32_t)key[i*4+3]<<24);
  st[12] = counter;
  for (i = 0; i < 3; i++)
    st[13+i] = (uint32_t)nonce[i*4] | ((uint32_t)nonce[i*4+1]<<8) | ((uint32_t)nonce[i*4+2]<<16) | ((uint32_t)nonce[i*4+3]<<24);
  memcpy(x, st, sizeof x);
  for (r = 0; r < 10; r++) {
    #define QR(a,b,c,d) \
      a+=b; d^=a; d=(d<<16)|(d>>16); \
      c+=d; b^=c; b=(b<<12)|(b>>20); \
      a+=b; d^=a; d=(d<<8)|(d>>24);  \
      c+=d; b^=c; b=(b<<7)|(b>>25);
    QR(x[0],x[4],x[8],x[12])  QR(x[1],x[5],x[9],x[13])
    QR(x[2],x[6],x[10],x[14]) QR(x[3],x[7],x[11],x[15])
    QR(x[0],x[5],x[10],x[15]) QR(x[1],x[6],x[11],x[12])
    QR(x[2],x[7],x[8],x[13])  QR(x[3],x[4],x[9],x[14])
    #undef QR
  }
  for (i = 0; i < 16; i++) {
    x[i] += st[i];
    out[i*4]   = (uint8_t)x[i];
    out[i*4+1] = (uint8_t)(x[i] >> 8);
    out[i*4+2] = (uint8_t)(x[i] >> 16);
    out[i*4+3] = (uint8_t)(x[i] >> 24);
  }
  memset(x, 0, sizeof x); memset(st, 0, sizeof st);
}

/* 原地异或（加/解密同一操作） */
static void chacha20_xor(const uint8_t key[32], const uint8_t nonce[12], uint32_t counter,
                         uint8_t *data, size_t len) {
  uint8_t ks[64]; size_t off = 0;
  while (off < len) {
    size_t take = len - off; if (take > 64) take = 64;
    chacha20_block(key, nonce, counter++, ks);
    for (size_t i = 0; i < take; i++) data[off + i] ^= ks[i];
    off += take;
  }
  memset(ks, 0, sizeof ks);
}

/* --------------------------- 工具函数 ---------------------------------- */
static int ct_equal(const uint8_t *a, const uint8_t *b, size_t n) {
  uint8_t d = 0;
  for (size_t i = 0; i < n; i++) d |= (uint8_t)(a[i] ^ b[i]);
  return d == 0;
}

static void wipe(void *p, size_t n) {
  volatile uint8_t *v = (volatile uint8_t*)p;
  while (n--) *v++ = 0;
}

#endif /* PIUPIU_CRYPTO_H */

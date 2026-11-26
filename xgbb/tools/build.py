#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
build.py —— PiuPiu 2.8.1 定制版一键构建（前端已明文，无需再解 pak）
=================================================================
1. 读 aipj/api.py → 破甲词/激活词/预填/拒答表/升温表 → ChaCha20 加密 blob
2. 生成 secrets.h（只含盐）
3. NDK 编译 libpiupiuguard.so（3 ABI）
4. javac + d8 → classes3.dex（GuardApp / GuardBridge / GuardVault / GuardNative）
5. 把 frontend/ 里的注入资源拷进 01_apktool/assets/public，并在 index.html 注入守卫脚本
6. apktool 重打包 → 塞 classes3.dex + so → 去 ActionBar → v1+v2+v3 签名
7. 输出 dist/app.apk；清理中间件（保留签名密钥）

用法： python tools/build.py [--out DIR] [--keep]
"""
import argparse
import hashlib
import hmac
import importlib.util
import json
import os
import shutil
import struct
import subprocess
import sys
import time
import zipfile

HERE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))   # xgbb/
WS = os.path.dirname(HERE)
TOOLS = os.path.join(HERE, "tools")
TC = os.path.join(HERE, "toolchain")
NDK = os.path.join(TC, "android-ndk-r27c")
PRE = os.path.join(NDK, "toolchains", "llvm", "prebuilt", "windows-x86_64")
CLANG = os.path.join(PRE, "bin", "clang.exe")
SYSROOT = os.path.join(PRE, "sysroot")
ANDROID_JAR = os.path.join(TC, "platform-36", "android-36", "android.jar")
APKSIG = os.path.join(TC, "apksig.jar")
R8 = os.path.join(TC, "r8.jar")
APKTOOL = "D:/mcp/Seep-Reverse-Lab/Tool/mcp/Tool/safe/apktool/apktool.jar"
JAVA_HOME = "D:/mcp/tools/jdk/jdk-17.0.20.1+1"
JAVAC = os.path.join(JAVA_HOME, "bin", "javac.exe")
JAVA = os.path.join(JAVA_HOME, "bin", "java.exe")
JAR = os.path.join(JAVA_HOME, "bin", "jar.exe")
KEYTOOL = os.path.join(JAVA_HOME, "bin", "keytool.exe")

APK_DIR = os.path.join(HERE, "apktool") if os.path.isdir(os.path.join(HERE, "apktool")) else os.path.join(HERE, "01_apktool")
WWW = os.path.join(APK_DIR, "assets", "public")
BUILD = os.path.join(HERE, "build")
TMP = os.path.join(BUILD, "tmp").replace("\\", "/")
os.makedirs(TMP, exist_ok=True)
ENV = dict(os.environ, TMPDIR=TMP, TMP=TMP, TEMP=TMP)

ABIS = [("arm64-v8a", "aarch64-linux-android24"),
        ("armeabi-v7a", "armv7a-linux-androideabi24"),
        ("x86_64", "x86_64-linux-android24")]

T_ARMOR, T_ACT, T_ACTED, T_PA, T_PAN, T_RX, T_ESC, T_NUDGE = 1, 2, 3, 4, 5, 6, 200, 201


def log(*a):
    print("[build]", *a, flush=True)


def run(cmd):
    p = subprocess.run(cmd, env=ENV, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if p.returncode != 0:
        raise SystemExit("命令失败(%d): %s\n%s" %
                         (p.returncode, " ".join(cmd)[:240],
                          p.stdout.decode("utf-8", "replace")[-2500:]))
    return p.stdout.decode("utf-8", "replace")


# -------------------------------------------------------------- 破甲源
def load_armor():
    spec = importlib.util.spec_from_file_location("aipj_api", os.path.join(WS, "aipj", "api.py"))
    m = importlib.util.module_from_spec(spec)
    sys.dont_write_bytecode = True
    spec.loader.exec_module(m)
    armor = m.embedded_armor()
    if not armor:
        raise SystemExit("aipj/api.py 取不到破甲词")
    refusal = []
    for r in getattr(m, "_REFUSAL", []):
        if not r:
            continue
        try:
            refusal.append(r.encode("latin-1", "backslashreplace").decode("unicode_escape"))
        except Exception:
            refusal.append(r)
    return {
        "armor": armor,
        "activation": getattr(m, "ACTIVATION", "失眠"),
        "activated": getattr(m, "ACTIVATED", "已激活"),
        "pa": getattr(m, "PREFILL_ACTIVATE", "已"),
        "pan": getattr(m, "PREFILL_ANSWER", "好的，"),
        "refusal": refusal,
        "escalation": {"tries": 4, "temps": [1.0, 1.15, 1.3, 1.4],
                       "nudges": list(getattr(m, "NUDGE", []))},
    }


def _rotl(v, c):
    return ((v << c) | (v >> (32 - c))) & 0xFFFFFFFF


def chacha20_xor(key, nonce, counter, data):
    out = bytearray(data)
    off = 0
    while off < len(out):
        st = [0x61707865, 0x3320646e, 0x79622d32, 0x6b206574]
        st += list(struct.unpack("<8I", key)) + [counter & 0xFFFFFFFF]
        st += list(struct.unpack("<3I", nonce[:12]))
        x = st[:]
        for _ in range(10):
            def qr(a, b, c, d):
                x[a] = (x[a] + x[b]) & 0xFFFFFFFF; x[d] = _rotl(x[d] ^ x[a], 16)
                x[c] = (x[c] + x[d]) & 0xFFFFFFFF; x[b] = _rotl(x[b] ^ x[c], 12)
                x[a] = (x[a] + x[b]) & 0xFFFFFFFF; x[d] = _rotl(x[d] ^ x[a], 8)
                x[c] = (x[c] + x[d]) & 0xFFFFFFFF; x[b] = _rotl(x[b] ^ x[c], 7)
            qr(0, 4, 8, 12); qr(1, 5, 9, 13); qr(2, 6, 10, 14); qr(3, 7, 11, 15)
            qr(0, 5, 10, 15); qr(1, 6, 11, 12); qr(2, 7, 8, 13); qr(3, 4, 9, 14)
        ks = struct.pack("<16I", *[(x[i] + st[i]) & 0xFFFFFFFF for i in range(16)])
        take = min(64, len(out) - off)
        for i in range(take):
            out[off + i] ^= ks[i]
        off += take
        counter += 1
    return bytes(out)


def pack_blob(a):
    items = [(T_ARMOR, a["armor"].encode()), (T_ACT, a["activation"].encode()),
             (T_ACTED, a["activated"].encode()), (T_PA, a["pa"].encode()),
             (T_PAN, a["pan"].encode())]
    for r in a["refusal"]:
        items.append((T_RX, r.encode("utf-8")))
    items.append((T_ESC, json.dumps(a["escalation"], ensure_ascii=False).encode()))
    items.append((T_NUDGE, json.dumps(a["escalation"]["nudges"], ensure_ascii=False).encode()))
    out = bytearray(struct.pack("<II", 0x50554731, len(items)))
    for t, payload in items:
        out += struct.pack("<BI", t, len(payload)) + payload
    return bytes(out)


def c_array(name, data):
    return "static const unsigned char %s[%d] = {%s};\n" % (
        name, len(data), ",".join(str(b) for b in data))


def gen_secrets(a):
    salt = os.urandom(32)
    payload = pack_blob(a)
    tag = hmac.new(salt, payload, hashlib.sha256).digest()
    nonce = os.urandom(12)
    ct = chacha20_xor(salt, nonce, 1, tag + payload)
    return ("#ifndef PP_SECRETS_H\n#define PP_SECRETS_H\n/* build.py 自动生成 */\n"
            "#define ARMOR_CT_LEN %d\n" % len(ct)
            + c_array("ARMOR_CT", ct) + c_array("ARMOR_NONCE", nonce)
            + c_array("BUILD_SALT", salt) + "#endif\n")


def build_so():
    src = os.path.join(HERE, "guard", "jni", "guard.c")
    out = {}
    for abi, target in ABIS:
        d = os.path.join(BUILD, "so", abi)
        os.makedirs(d, exist_ok=True)
        so = os.path.join(d, "libpiupiuguard.so")
        run([CLANG, "--target=" + target, "--sysroot=" + SYSROOT, "-O2", "-fPIC", "-shared",
             "-s", "-fvisibility=hidden", "-ffunction-sections", "-fdata-sections",
             "-Wl,--gc-sections", "-Wl,-z,relro", "-Wl,-z,now", "-Wl,-z,noexecstack",
             "-I", os.path.join(HERE, "guard", "jni"), src, "-o", so, "-llog"])
        out[abi] = so
        log("so", abi, os.path.getsize(so), "B")
    return out


def build_dex():
    cls = os.path.join(BUILD, "classes")
    dexdir = os.path.join(BUILD, "dex")
    for d in (cls, dexdir):
        shutil.rmtree(d, ignore_errors=True)
        os.makedirs(d, exist_ok=True)
    srcs = [os.path.join(HERE, "guard", "java", f) for f in
            ("GuardNative.java", "GuardVault.java", "GuardApp.java", "GuardBridge.java")]
    run([JAVAC, "-encoding", "UTF-8", "-source", "8", "-target", "8", "-nowarn",
         "-bootclasspath", ANDROID_JAR, "-classpath", ANDROID_JAR, "-d", cls] + srcs)
    jar = os.path.join(BUILD, "guard.jar")
    run([JAR, "cf", jar, "-C", cls, "."])
    run([JAVA, "-cp", R8, "com.android.tools.r8.D8", "--release", "--min-api", "24",
         "--lib", ANDROID_JAR, "--output", dexdir, jar])
    produced = [os.path.join(dexdir, f) for f in os.listdir(dexdir) if f.endswith(".dex")]
    dst = os.path.join(BUILD, "classes3.dex")
    shutil.copy(produced[0], dst)
    log("dex", os.path.getsize(dst), "B")
    return dst


# --------------------------------------------------------------- 前端注入
GUARD_TAG = "<!--piupiu-guard-->"
FRONT_FILES = ("piupiu-guard.js", "dns.json", "version.json", "donate.jpg")


def inject_frontend():
    fdir = os.path.join(HERE, "frontend")
    for f in FRONT_FILES:
        src = os.path.join(fdir, f)
        if not os.path.exists(src):
            raise SystemExit("缺少前端资源: " + f)
        shutil.copy(src, os.path.join(WWW, f))
    idx = os.path.join(WWW, "index.html")
    if not os.path.exists(idx + ".orig"):
        shutil.copy(idx, idx + ".orig")
    html = open(idx + ".orig", encoding="utf-8").read()
    if GUARD_TAG not in html:
        # 预取对话页分包（408 KB），点进对话能少等一截
        pre = ""
        try:
            import glob as _g
            for pat, rel in (("assets/c/ChatView-legacy-*.js", "chat"),):
                for f in _g.glob(os.path.join(WWW, pat)):
                    name = os.path.basename(f)
                    pre += '<link rel="prefetch" href="/assets/c/%s" as="script" fetchpriority="high">\n' % name
        except Exception:
            pass
        inject = GUARD_TAG + '\n' + pre + '<script src="/piupiu-guard.js"></script>\n'
        html = html.replace("<head>", "<head>\n" + inject, 1) if "<head>" in html else inject + html
    open(idx, "w", encoding="utf-8").write(html)
    log("前端注入完成（index.html + %d 个资源）" % len(FRONT_FILES))


def restore_index():
    idx = os.path.join(WWW, "index.html")
    if os.path.exists(idx + ".orig"):
        shutil.copy(idx + ".orig", idx)


# --------------------------------------------------------------- APK
CLEAN_MANIFEST = os.path.join(BUILD, "AndroidManifest.clean.xml")


def patch_manifest():
    p = os.path.join(APK_DIR, "AndroidManifest.xml")
    base = CLEAN_MANIFEST if os.path.exists(CLEAN_MANIFEST) else p
    s = open(base, encoding="utf-8").read()
    if "io.piupiu.chat.guard.GuardApp" not in s:
        s = s.replace("<application ",
                      '<application android:name="io.piupiu.chat.guard.GuardApp" ', 1)
    s = s.replace('android:extractNativeLibs="false"', 'android:extractNativeLibs="true"')
    s = s.replace('android:theme="@style/AppTheme.NoActionBarLaunch"',
                  'android:theme="@style/AppTheme.NoActionBar"')
    open(p, "w", encoding="utf-8").write(s)
    log("manifest patched（GuardApp / extractNativeLibs / 去 ActionBar）")


def restore_manifest():
    """构建后把工程里的 manifest 还原成干净版（干净副本存在 build/AndroidManifest.clean.xml）"""
    p = os.path.join(APK_DIR, "AndroidManifest.xml")
    if os.path.exists(CLEAN_MANIFEST):
        shutil.copy(CLEAN_MANIFEST, p)


def apktool_build():
    out = os.path.join(BUILD, "unsigned.apk")
    patch_manifest()
    try:
        run([JAVA, "-jar", APKTOOL, "b", APK_DIR, "-o", out])
    finally:
        restore_manifest()
    log("apktool ->", os.path.getsize(out), "B")
    return out


def graft(apk_in, dex, sos, apk_out):
    zin = zipfile.ZipFile(apk_in)
    zout = zipfile.ZipFile(apk_out, "w", allowZip64=True)
    for info in zin.infolist():
        zi = zipfile.ZipInfo(info.filename, date_time=info.date_time)
        zi.compress_type = info.compress_type
        zi.external_attr = info.external_attr
        zi.extra = info.extra
        zout.writestr(zi, zin.read(info.filename))
    zi = zipfile.ZipInfo("classes3.dex", date_time=(2026, 1, 1, 0, 0, 0))
    zi.compress_type = zipfile.ZIP_DEFLATED
    zout.writestr(zi, open(dex, "rb").read())
    for abi, so in sos.items():
        zi = zipfile.ZipInfo("lib/%s/libpiupiuguard.so" % abi, date_time=(2026, 1, 1, 0, 0, 0))
        zi.compress_type = zipfile.ZIP_STORED
        zout.writestr(zi, open(so, "rb").read())
    zout.close(); zin.close()
    log("graft ->", os.path.getsize(apk_out), "B")


def sign(src, dst, ks, alias, pw):
    signer = os.path.join(BUILD, "signer")
    os.makedirs(signer, exist_ok=True)
    run([JAVAC, "-encoding", "UTF-8", "-cp", APKSIG, "-d", signer,
         os.path.join(TOOLS, "SignApk.java"), os.path.join(TOOLS, "VerifyApk.java")])
    run([JAVA, "-cp", signer + os.pathsep + APKSIG, "SignApk", src, dst, ks, alias, pw])
    log("signed ->", os.path.getsize(dst), "B")


def make_keystore(path, pw):
    if os.path.exists(path):
        return
    os.makedirs(os.path.dirname(path), exist_ok=True)
    run([KEYTOOL, "-genkeypair", "-keystore", path, "-storetype", "PKCS12", "-alias", "piupiu",
         "-keyalg", "RSA", "-keysize", "3072", "-sigalg", "SHA256withRSA", "-validity", "12000",
         "-storepass", pw, "-keypass", pw,
         "-dname", "CN=PiuPiu Guard, O=PiuPiu, L=Liaoning, C=CN"])
    log("keystore created")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(HERE, "dist"))
    ap.add_argument("--keep", action="store_true")
    ap.add_argument("--noguard", action="store_true", help="不注入守卫脚本（排障用纯净包）")
    a = ap.parse_args()
    t0 = time.time()

    armor = load_armor()
    log("破甲词 %d 字 / 拒答规则 %d 条" % (len(armor["armor"]), len(armor["refusal"])))
    open(os.path.join(HERE, "guard", "jni", "secrets.h"), "w", encoding="utf-8").write(gen_secrets(armor))

    sos = build_so()
    dex = build_dex()
    if a.noguard:
        log('跳过守卫注入（纯净包）')
    else:
        inject_frontend()
    unsigned = apktool_build()
    grafted = os.path.join(BUILD, "grafted.apk")
    graft(unsigned, dex, sos, grafted)

    os.makedirs(a.out, exist_ok=True)
    ks = os.path.join(BUILD, "ks", "release.p12")
    make_keystore(ks, "piupiu2026")
    final = os.path.join(a.out, "app_noguard.apk" if a.noguard else "app.apk")
    sign(grafted, final, ks, "piupiu", "piupiu2026")
    restore_index()

    log("完成 %.1fs" % (time.time() - t0))
    log("输出：", final, os.path.getsize(final), "B")
    if not a.keep:
        for d in ("classes", "dex", "tmp", "so"):
            shutil.rmtree(os.path.join(BUILD, d), ignore_errors=True)
        for f in ("unsigned.apk", "grafted.apk", "classes3.dex", "guard.jar"):
            try:
                os.remove(os.path.join(BUILD, f))
            except OSError:
                pass
        log("已清理中间件（保留 build/ks/release.p12 签名密钥）")
    return 0


if __name__ == "__main__":
    sys.exit(main())

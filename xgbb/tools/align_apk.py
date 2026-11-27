#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""align_apk.py —— 等价于 zipalign -p -f 4 / 16384
原因：本 APP 的 AndroidManifest 是 extractNativeLibs=false，.so 必须页对齐（mmap 直接加载）。
apktool 重打包后 .so 是 STORED 但未对齐，直接用会 dlopen 失败。
本脚本对 STORED 条目（尤其是 lib/**/*.so）做 16384 对齐（同时满足 4096/16KB page 设备）。
"""
import sys, zipfile, struct, os

ALIGN_EXTRAS = (".so",)

def pad_extra(need: int) -> bytes:
    """生成 0xD935 对齐扩展字段，总长度恰为 need 字节"""
    if need == 0:
        return b""
    return struct.pack("<HH", 0xD935, need - 4) + b"\x00" * (need - 4)

def align(src: str, dst: str, align_to: int = 16384):
    zin = zipfile.ZipFile(src, "r")
    tmp = dst + ".tmp"
    zout = zipfile.ZipFile(tmp, "w", allowZip64=True)
    count = 0
    for info in zin.infolist():
        data = zin.read(info.filename)
        zi = zipfile.ZipInfo(info.filename, date_time=info.date_time)
        zi.compress_type = info.compress_type
        zi.external_attr = info.external_attr
        zi.internal_attr = info.internal_attr
        zi.create_system = info.create_system
        zi.comment = info.comment
        need_align = info.compress_type == zipfile.ZIP_STORED and info.filename.lower().endswith(ALIGN_EXTRAS)
        if need_align:
            # 当前输出偏移
            base = zout.fp.tell() if zout.fp else 0
            name_len = len(info.filename.encode("utf-8"))
            header = 30 + name_len
            pad = (-(base + header)) % align_to
            if pad and pad < 4:
                pad += align_to
            zi.extra = pad_extra(pad)
            count += 1
        else:
            zi.extra = info.extra
        zout.writestr(zi, data)
    zout.close(); zin.close()
    os.replace(tmp, dst)
    print("[align] aligned %d stored entries -> %s (%d bytes)" % (count, dst, os.path.getsize(dst)))

if __name__ == "__main__":
    src = sys.argv[1]
    dst = sys.argv[2] if len(sys.argv) > 2 else src.replace(".apk", "_aligned.apk")
    a = int(sys.argv[3]) if len(sys.argv) > 3 else 16384
    align(src, dst, a)

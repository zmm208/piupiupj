# PiuPiu酱逆向

> 记录对 **PiuPiu酱（io.piupiu.chat）** 两个版本的静态逆向过程：2.8.0（前端 AES-GCM 加密包）与 2.8.1（前端明文），以及在其之上做的一层定制改造（Guard）。
>
> 全部工作为本地静态分析，**不涉及任何线上服务的攻击行为**，不包含账号、卡密等第三方凭据。
>
> 分析版本：`2.8.0 (139)` / `2.8.1 (140)` ｜ 改造版本号：`3.0`
>
> **安装包（3.0，可与官方共存）**：包名 `io.piupiu.pj`，桌面名 `PiuPiu酱·插件版`，签名 v2+v3。
> 原始素材包 `3.8.1.zip`（134 MB）超过 GitHub 单文件限制，放在 Releases 里下载。

---

## 一、目标画像

| 项 | 值 |
|---|---|
| 包名 | `io.piupiu.chat` |
| 应用形态 | **Capacitor 混合应用**：单 Activity + WebView，业务全在前端 |
| 前端技术栈 | Vue 3 + vue-router + Pinia + Vite（legacy / SystemJS 构建）+ Tailwind |
| 原生代码量 | 自有类仅 **10 个**（约 9.3k 行），其余为 Capacitor / AndroidX 依赖 |
| 原生库 | 4 ABI 的 `libsqlcipher.so`（上游 SQLCipher 4.10.0 community，未改造） |
| 本地 AI | ONNX 向量模型（2.8.0: `gte-small`；2.8.1: `bge-small-zh-v1.5`）+ onnxruntime-web |
| 形象 | Live2D Cubism 4（Hiyori）+ 自制换装资源 |
| 后端 | `www.piupiuchan.top`（PHP），Cloudflare 边缘 |

**一句话结构**：原生层只做三件事——WebView 宿主、授权门禁、请求签名；真正的 App 是一份 9 MB 的 Web 前端。

---

## 二、逆向原理（完整思路）

整个逆向按「由外向内、由静态到动态语义」推进，共六层。

### 第 0 层：容器结构侦察

```bash
7z l base.apk          # 541 条目 / 85.5 MB
```

关键发现：

- `assets/public/frontend-code.pak`（9.44 MB，**熵 7.997**）→ 加密载荷
- `assets/public/frontend-code-manifest.json` → 段表 + `keyId` + `bundleSha256`
- `assets/public/index.html`（47 KB）→ 不是应用首页，而是**授权闸门页**（轮询原生桥状态）
- `classes.dex` + `classes2.dex`、`lib/*/libsqlcipher.so`

**推断**：前端被整体加密，App 启动时先向原生要「解锁状态」，拿到 content key 后才解密前端。

### 第 1 层：DEX 反编译 —— 定位自定义代码

```bash
jadx -d out --no-res -j 8 --deobf base.apk
```

3664 个类里，自有代码只有 `io/piupiu/chat/` 下 10 个类：

| 类 | 职责 |
|---|---|
| `ProtectedFrontendManager` | pak 校验、HKDF 派生、逐段 AES-GCM 解密、LRU 明文缓存、内存擦除 |
| `FrontendLicenseManager` | challenge/issue 协议、RSA-OAEP 解封、license 校验与续期 |
| `BusinessRequestSigner` | 业务请求的 RSA 签名（设备私钥，AndroidKeyStore） |
| `MainActivity` | WebView 宿主、28 个 `@JavascriptInterface`、APK 更新链 |
| `ApkUpdateValidator` / `KeepAliveService` / `ProtectedBridgeWebViewClient` / `ProtectedOriginMatcher` | 辅助 |

### 第 2 层：加密方案全解（2.8.0 核心）

**容器格式**（`formatVersion = 3`）：

```jsonc
{
  "segmentBytes": 262144,
  "keyId": "piupiu-v3-<构建时间戳>-<随机后缀>",
  "bundleSha256": "…",
  "entries": {
    "<HMAC-SHA256(pathIndexKey, path)>": {
      "plaintextLength": 216984,
      "mime": "text/javascript",
      "segments": [{ "offset": 827, "length": 216984, "iv": "…(12B)", "tag": "…(16B)" }]
    }
  }
}
```

**密钥派生**（`deriveV3Keys`）：

```
salt  = SHA-256("piupiu-frontend-v3\0" ‖ keyId)
prk   = HMAC-SHA256(key = salt, msg = contentKey[32B])
ck    = HKDF-Expand(prk, "piupiu/frontend/content/v3",    32)   // AES-256-GCM 内容密钥
pik   = HKDF-Expand(prk, "piupiu/frontend/path-index/v3", 32)   // 路径索引密钥
```

**段解密**：

```
AAD   = "3\n" + keyId + "\n" + path + "\n" + segIndex + "\n" + plaintextLength
plain = AES-256-GCM(ck, iv, data = pak[offset..offset+length] ‖ base64(tag), aad = AAD)
```

设计要点：

1. **AAD 里绑了 path** → 即使拿到密钥，不知道精确路径也解不开
2. 目录键是 `HMAC(pik, path)` → **HMAC 不可逆，无法枚举文件名**
3. 明文长度参与 AAD 校验；大文件走流式分段解密

### 第 3 层：授权协议（内容密钥从哪来）

```
POST /includes/frontend_v3_challenge.php
     installation_id, bundle_version, bundle_sha256,
     verification_level=hardware, android_id, device_public_key, …
 ←   protocol_version=3, signature_check_enabled, challenge_id, challenge(32B), key_id

POST /includes/frontend_v3_issue.php
     challenge_id, device_public_key, device_signature, attestation_chain, …
 ←   wrapped_key (RSA-OAEP-SHA1 密文), license_signature

contentKey = RSA-OAEP-SHA1_decrypt(wrapped_key)   // 必须 32 字节
```

- `verification_level=hardware` 本应要求 **Android KeyAttestation** 证书链
- 但 challenge 响应里 **`signature_check_enabled: false`** → 客户端直接跳过硬件证明，改用普通软件 RSA 密钥，`attestation_chain` 传空数组 `[]`
- 服务端照发 `verification_level=hardware` 的 license

**结论**：密码学工程本身没问题（分段 GCM、AAD 绑路径、HKDF 双层派生、内存擦除），但**决定强度的开关被关掉了** —— 保护退化成「两个 HTTP 请求」。

### 第 4 层：路径自举（HMAC 索引的破法）

索引不可逆，只能让明文自己"交代"路径：

1. **种子**：`index.html`、manifest 的 `startup.scripts` 里的 `assets/e/*.js`
2. **抽引用**：解出的 js 里正则抓 `xxx-legacy-<hash8>.js` 形态的 chunk 名
3. **目录暴力**：`assets/<单字符>/` 组合候选路径，拿 HMAC 去 `entries` 里比对（O(1)）
4. **迭代到不动点**：新解出的文件继续产出新引用
5. **尾部字典**：剩下的小文件用 SillyTavern 风格字典命中（`scripts/utils.js`、`scripts/world-info.js` …）

> 备选手段：已知 `offset/iv/tag` 时，可以把候选 `path` 直接当 AAD 试解，**GCM tag 校验通过即证明路径正确** —— 一个天然的「路径 oracle」。

**战果**：70 条目中解出 **69 个（99.88% 字节）**，唯一没解出的是一个 12 KB html；后来在 2.8.1 里确认它就是 `invite-browser-audit.html`（邀请链接自检页）。

### 第 5 层：资源 / 原生 / 签名

- **资源**：资源名被混淆成 1–3 字符，自写 `resources.arsc` 解析器把 6180 条 entry 与 402 个文件对上，379/379 全部还原语义、0 孤儿
- **原生库**：`radare2` 反汇编导出函数 `sqlcipher_version` → `mprintf("%s %s","4.10.0","community")`，判定为**上游原版**；JNI 走 `JNI_OnLoad + RegisterNatives`（无 `Java_*` 导出）；无壳、无反调试
- **签名**：自写 APK Signing Block 解析器，发现 v1 有效（535/538 精确匹配），但 **v2/v3 的 content digest 与当前字节不符**（6 种算法变体全试），属重打包/旧构建残留

### 第 6 层：2.8.1 的变化 —— 保护层被移除

| 项 | 2.8.0 | 2.8.1 |
|---|---|---|
| 前端形态 | AES-GCM 加密 pak + 47 KB 授权闸门页 | **明文 128 文件**，index.html 仅 1.7 KB |
| APK 体积 | 85.5 MB | 70.7 MB |
| 授权类 | 保留 | **仍保留**，但因无 manifest → `protectedBuild=false`，启动直接 `completeVerifiedStartup()`，从不进入授权分支 |
| 其他 | — | 新增资源市场评论、公告、头像裁剪、`scripts/extensions/regex/engine.js`、中文向量模型 `bge-small-zh` |

**含义**：旧包里那套 content key / license 在新版完全无用——不是凭证过期，是机制没了。

---

## 三、复现

```bash
# 1) 静态解包
7z x -y -o00_raw base.apk
java -jar apktool.jar d -f -o apktool base.apk
jadx -d jadx --no-res -j 8 --deobf base.apk

# 2) 2.8.0 前端解密（pak 时代）
python tools/piupiu_unpack.py        # 领 license → 解封 content key → 首批解密
python tools/discover2.py            # 引用链 + 目录暴力，迭代到不动点
python tools/brute_missing.py        # 尾部字典 + GCM 路径 oracle

# 3) 2.8.1 改造与打包
python tools/build.py                # 出 dist/app.apk（含签名与验证）
```

工具链要求：JDK 17、Android NDK r27c、`android.jar`(platform 36)、`apksig`、`r8`。

---

## 四、验证记录（改造包）

| 项 | 结果 |
|---|---|
| APK 签名 | `verified=true / v2=true / v3=true`（apksig 官方校验器） |
| Manifest | `GuardApp` 已注册、`extractNativeLibs="true"`、Activity 主题 `AppTheme.NoActionBar` |
| 前端注入 | `index.html` 首行含 `/piupiu-guard.js`，另含 `dns.json` / `version.json` / `donate.jpg` |
| 原生层 | `classes3.dex` + 3 个 ABI 的 `libpiupiuguard.so` |
| 条目数 | 627 |

---

<br>

---

# 声明

1. **仅供学习研究**
      本人对上述 APP 相关内容的学习、分析和记录，仅用于个人学习、技术研究与交流，不用于任何商业用途，不提供任何商业服务，不进行付费传播、售卖、推广或变相牟利。

2. **不传播、不提供下载**
      本人不公开传播、不提供下载链接、不发布破解版、修改版、衍生版或可能侵犯他人合法权益的内容。相关材料仅限个人学习留存。

3. **24 小时内删除**
      本人承诺，相关学习研究材料自形成或接收之日起 24 小时内删除，不长期保存、不对外扩散。

4. **违规立即删除**
      如相关材料存在侵权、违规、违法或不当内容，本人发现后立即删除；权利人、平台或监管方提出合理删除要求的，本人将及时配合删除。

5. **责任自担**
      本人因上述学习研究行为及相关材料产生的一切法律责任和后果，由本人自行承担。本人不将相关责任归咎于任何平台、软件权利人、第三方或他人。

6. **不规避合法权利**
      本人承诺不实施破解、绕过技术保护措施、非法获取数据、侵犯知识产权、侵犯隐私、破坏计算机信息系统等违法违规行为。如本人未取得合法授权，则不应进行相关逆向分析。

7. **声明性质**
      本声明仅为个人学习研究用途的自我约束说明，不构成对任何违法行为的许可，亦不能免除本人依法应承担的法律责任。

---

## 十、v3.0 变更摘要（本版）

| 模块 | 内容 |
|---|---|
| 包名 | `io.piupiu.chat` → **`io.piupiu.pj`**（与官方共存，provider authority 同步改名） |
| 备份 | 原生直读 SQLite（`BackupStore.dbDump/dbExec`）+ AES-256-GCM 分段加密，`/storage/emulated/0/piupiupj/piupiupj.json` |
| 备份内容 | 角色卡（含原始 PNG）、聊天（含消息与媒体本体）、世界书、预设、API、真卡密 |
| 恢复 | 整页查看器（角色卡/聊天/其他三栏）+ 选择性恢复（缩略图、角色名、首句、备份时间、聊天预览） |
| 自动备份 | 退出对话备份该对话；新卡/新对话增量备份；不做删除同步；一周未变动自动清理 |
| 精简 | 删除 Live2D 资源与 pixi/cubism 库，APK 71 MB → **65 MB** |
| 修复 | fetch 包装重复导致的启动失败、重复函数定义（清理 85 处）、PIXI 贴图回收导致的模型白模 |

## 十一、构建

```bash
cd xgbb
python tools/build.py          # 输出 dist/app.apk
```

- 依赖：JDK 17、Android SDK build-tools、apktool、keystore `build/ks/release.p12`
- 构建时自动：换包名、打 manifest 补丁、删 Live2D、注入 guard、dex 打包、v2+v3 签名

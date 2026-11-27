/* =============================================================================
 * piupiu-guard.js (v4)
 *  1. 启动免责声明（2s + 赞赏码）
 *  2. 登录/注册/忘记密码 → 卡片内左上角 ×
 *  3. 设置页「账号与资料」上方：扩展功能卡（破甲开关 + 模型入口）
 *  4. 独立「我的模型」页面：新增/编辑/删除/多模型/测试对话（含返回按钮）
 *  5. 聊天页模型选择器：注入「我的模型」+「DeepSeek 破甲」开关
 *  6. 聊天页右下角破甲悬浮开关
 *  7. 请求层：破甲注入 / 拒答升温重试 / 自定义渠道改写
 * ========================================================================== */
(function () {
  'use strict';
  if (window.__PP_GUARD_V4__) return;
  window.__PP_GUARD_V4__ = true;

  var DONATE = '/donate.jpg';
  var STORE_KEY = 'pp_models_v1';
  var STORE_META = 'pp_meta_v1';
  var S = { armorOn: false, armorId: 0, customOn: false, models: [], curId: 0, aiId: 0 };

  /* ============ VIP 解锁：无论登录与否，一律按最高档 SSVIP 判定 ---------- */
  var FREE_KEY = 'sk-rBi4UB53Gnz3AQRS9ropRyq4QjgkSqOmT9ovx8wReStiYdlp';   // 免费通道内置 key（也用作伪造卡密的哨兵值）
  try { window.__ppStage = 1; } catch (e) { }
  var _aiCache = { v: false, t: 0 };
  function aiCreateOpen() {
    // 只用一次 querySelector；结果缓存 600ms（原来用 body.innerText，等于每帧强制重排）
    var now = Date.now();
    if (now - _aiCache.t < 600) return _aiCache.v;
    var v = false;
    try { v = !!document.querySelector('.steps[aria-label="创作流程"]'); } catch (e) { }
    _aiCache = { v: v, t: now };
    return v;
  }

  var VIP_VALUES = {
    'piupiu_app_vip_status': 'active',
    'piupiu_vip_level': 'SSVIP',
    'piupiu_vip_expiry': '永不过期'
  };
  /* 读取原始值（绕过我们自己的覆盖） */
  var _origGet = Storage.prototype.getItem;
  function rawStored(k) {
    try { return _origGet.call(localStorage, k); } catch (e) { return null; }
  }
  function hasRealCard() {
    var v = rawStored('piupiu_app_vip_key');
    return !!(v && v !== FREE_KEY);
  }

  function applyLoginClass(logged) {
    try {
      var h = document.documentElement;
      h.classList.toggle('pp-logged-in', !!logged);
      h.classList.toggle('pp-logged-out', !logged);
    } catch (e) { }
  }

  /* 老版本把哨兵写进过 localStorage，这里一次性清掉，避免连接中心显示一条假卡密 */
  function cleanStaleSentinel() {
    try {
      if (rawStored('piupiu_app_vip_key') === FREE_KEY) {
        localStorage.removeItem('piupiu_app_vip_key');
        localStorage.removeItem('piupiu_vip_level');
        localStorage.removeItem('piupiu_vip_expiry');
      }
    } catch (e) { }
  }

  /* 大对象重复写入去重：预设一次序列化就是 1.2 MB，连点会连着写好几份 */
  var LAST_BIG_K = '', LAST_BIG_V = '';
  var BK_LAST_CHAT = '';
  (function installBigWriteDedup() {
    try {
      var _set = Storage.prototype.setItem;
      Storage.prototype.setItem = function (k, v) {
        try {
          try {
          if (typeof v === 'string' && v.length > 120000) {
            if (k === LAST_BIG_K && v === LAST_BIG_V) return;   // 内容没变，不重复落盘
            LAST_BIG_K = String(k); LAST_BIG_V = v;
          }
        } catch (e) { }
        try {
          if (typeof k === 'string' && /piupiu_(model_config|prompt_config|api|global_preset|presets|armor)/i.test(k)) {
            try { bkAutoApi(); } catch (e) { }
          }
        } catch (e) { }
          return _set.apply(this, arguments);
        } catch (e) {
          return _set.apply(this, arguments);
        }
      };
    } catch (e) { }
  })();

  (function installVipUnlock() {
    try {
      cleanStaleSentinel();
      // 脚本一加载就先定好登录/未登录的外观，进入设置页时不会先闪一下"退出登录"
      applyLoginClass(isLoggedIn());
      // 只覆盖读，不再强写 localStorage：
      // 这样 App 自己记录的真实状态（登出、解绑、换卡）完全按官方逻辑走
      Storage.prototype.getItem = function (key) {
        try {
        if (key === 'piupiu_vip_level') return 'SSVIP';
        if (key === 'piupiu_vip_expiry') return '永不过期';
        if (key === 'piupiu_app_vip_status') return 'active';
        if (key === 'piupiu_channel_tab') return 'exclusive';
        if (key === 'piupiu_app_vip_key') {
          var v = rawStored(key);
          // 连接中心：只认真卡，绝不把哨兵显示成"已绑定卡密"
          var st2 = '';
          try { st2 = (new Error()).stack || ''; } catch (e) { }
          if (/ConnectionView/i.test(st2)) return (v && v !== FREE_KEY) ? v : null;
          // 其它地方（chatService）：没真卡时给哨兵，保证不抛 "缺少卡密"
          return (v && v !== FREE_KEY) ? v : FREE_KEY;
        }
        if (key === 'piupiu_account_session') {
          // 只在 chatService 读取时给一个临时 token（让自定义模型能发请求），
          // 其它任何地方都返回真实值 —— 否则 App 会以为已登录，反复校验失败导致卡死
          var real = _origGet.call(this, key);
          if (real) return real;
          // 仅当 chatService 在读时才给临时 token（其它地方一律真实值，
          // 保证 App 启动判定、登录态判断都不受影响）
          var st = '';
          try { st = (new Error()).stack || ''; } catch (e) { }
          if (/chatService/i.test(st)) return JSON.stringify({ accessToken: 'pp-local' });
          return real;
        }
        } catch (e) { }
        return _origGet.call(this, key);
      };
    } catch (e) { }
  })();

  /* 真实登录态：会话里必须有 accessToken，且不是我们伪造的本地会话 */
  function isLoggedIn() {
    var raw = rawStored('piupiu_account_session');
    if (!raw) return false;
    try {
      var o = JSON.parse(raw);
      return !!(o && o.accessToken && o.__pp !== 'local');
    } catch (e) { return true; }
  }

  /* 未登录时：隐藏「退出登录」，在同一位置放一个官方同款的「登录」入口 */
  function ensureLoginItem() {
    var logout = document.querySelector('.logout-item');
    if (!logout || !logout.parentElement) return null;
    var host = logout.parentElement;
    var btn = document.getElementById('pp-login-item');
    if (btn && btn.isConnected) return btn;
    if (!logout.cloneNode) return null;
    // 直接克隆官方的退出登录项，继承全部类名 / scoped 属性 / 图标，外观天然一致
    btn = logout.cloneNode(true);
    btn.id = 'pp-login-item';
    btn.classList.remove('logout-item');
    btn.classList.add('pp-login-item');
    btn.removeAttribute('style');
    var lab = btn.querySelector('.setting-label');
    if (lab) lab.textContent = '登录';
    var hint = btn.querySelector('.setting-hint');
    if (hint) hint.textContent = '登录后可使用账号与云端会员功能';
    var iconBox = btn.querySelector('div');
    if (iconBox) iconBox.style.color = '#e97998';
    btn.onclick = function (e) {
      e.preventDefault(); e.stopPropagation();
      ppLoginSheet();
    };
    host.insertBefore(btn, logout.nextSibling);
    return btn;
  }


  /* ---------- 自己的登录面板：官方 account_auth.php + 滑块人机验证 ---------- */
  var PP_API = 'https://www.piupiuchan.top/account_auth.php';

  function ppPost(body) {
    return of.call(window, PP_API, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    }).then(function (r) { return r.json(); });
  }

  function ppDeviceId() {
    try {
      var cap = window.Capacitor;
      if (cap && cap.Plugins && cap.Plugins.Device && cap.Plugins.Device.getId) {
        return Promise.resolve(cap.Plugins.Device.getId()).then(function (d) {
          var id = d && (d.identifier || d.uuid);
          if (id) { try { localStorage.setItem('piupiu_device_id', id); } catch (e) { } return id; }
          return ppDeviceIdSync();
        }).catch(ppDeviceIdSync);
      }
    } catch (e) { }
    return Promise.resolve(ppDeviceIdSync());
  }

  function ppDeviceIdSync() {
    var keys = ['piupiu_device_id', 'piupiuDeviceId', 'pp_device_id'];
    for (var i = 0; i < keys.length; i++) {
      var v = rawStored(keys[i]);
      if (v) return String(v);
    }
    var id = 'pp-' + Date.now().toString(36) + Math.random().toString(36).slice(2, 10);
    try { localStorage.setItem('piupiu_device_id', id); } catch (e) { }
    return id;
  }

  function ppLoginSheet() {
    var p = document.getElementById('pp-loginsheet');
    if (!p) { p = el('div'); p.id = 'pp-loginsheet'; document.body.appendChild(p); }
    p.classList.add('on');
    p.innerHTML = '<div class="box"><div class="hd">登录 PiuPiu 账号<button class="x" id="pp-ls-x">&times;</button></div>' +
      '<div class="bd">' +
      '<label>邮箱</label><input id="pp-ls-email" type="email" inputmode="email" placeholder="请输入邮箱" autocomplete="username">' +
      '<label>密码</label><input id="pp-ls-pass" type="password" placeholder="请输入密码" autocomplete="current-password">' +
      '<div class="err" id="pp-ls-err"></div>' +
      '<button class="pp-btn main" id="pp-ls-go" style="width:100%;margin-top:12px">登录</button>' +
      '<div class="tip">使用与官方相同的账号，登录前需要拖动滑块完成验证。</div>' +
      '</div></div>';
    p.querySelector('#pp-ls-x').onclick = function () { p.classList.remove('on'); };
    p.onclick = function (e) { if (e.target === p) p.classList.remove('on'); };
    p.querySelector('#pp-ls-go').onclick = function () {
      var em = (p.querySelector('#pp-ls-email').value || '').trim();
      var pw = p.querySelector('#pp-ls-pass').value || '';
      var err = p.querySelector('#pp-ls-err');
      err.textContent = '';
      if (!em || !pw) { err.textContent = '请填写邮箱和密码'; return; }
      var go = p.querySelector('#pp-ls-go');
      go.disabled = true; go.textContent = '获取验证…';
      ppPost({ action: 'issue_login_captcha', email: em }).then(function (j) {
        var d = j && j.data;
        if (!(j && j.status === 'success' && d && d.challenge_id && d.track_image)) {
          throw new Error((j && (j.message || j.error)) || '验证挑战创建失败');
        }
        ppCaptchaStep(p, em, pw, d);
      }).catch(function (e) {
        go.disabled = false; go.textContent = '登录';
        err.textContent = (e && e.message) || '网络错误';
      });
    };
    setTimeout(function () { var i = p.querySelector('#pp-ls-email'); i && i.focus(); }, 80);
  }

  /* 第二步：滑块人机验证 —— 图片里能看到缺口，把竖线拖到缺口处松手即可 */
  function ppCaptchaStep(p, email, pass, ch) {
    var W = Number(ch.slider_width) || 280;
    var box = p.querySelector('.box');
    box.innerHTML = '<div class="hd">人机验证<button class="x" id="pp-cp-x">&times;</button></div>' +
      '<div class="bd">' +
      '<div class="cp-img"><img id="pp-cp-img" src="' + ch.track_image + '" alt=""><i id="pp-cp-line"></i></div>' +
      '<div class="cp-track" id="pp-cp-track"><div class="cp-fill" id="pp-cp-fill"></div>' +
      '<div class="cp-knob" id="pp-cp-knob"></div><span class="cp-hint" id="pp-cp-hint">拖动滑块，把竖线对到缺口</span></div>' +
      '<div class="err" id="pp-cp-err"></div>' +
      '</div>';
    var img = p.querySelector('#pp-cp-img');
    var line = p.querySelector('#pp-cp-line');
    var track = p.querySelector('#pp-cp-track');
    var knob = p.querySelector('#pp-cp-knob');
    var fill = p.querySelector('#pp-cp-fill');
    var hint = p.querySelector('#pp-cp-hint');
    var err = p.querySelector('#pp-cp-err');
    p.querySelector('#pp-cp-x').onclick = function () { p.classList.remove('on'); };

    var pos = 0, pos0 = 0, maxX = 0, dragging = false, startX = 0, startT = 0, trace = [];

    function paint() {
      knob.style.left = pos + 'px';
      fill.style.width = (pos + 14) + 'px';
      line.style.left = pos + 'px';
    }

    function ratio() {
      // 图片按宽度自适应显示，算出比例
      var iw = img.naturalWidth || img.width || 344;
      return (img.clientWidth || iw) / iw;
    }

    setTimeout(function () {
      maxX = Math.max(0, (track.clientWidth || W + 40) - 30);
      paint();
    }, 30);

    function down(e) {
      dragging = true; startX = (e.touches ? e.touches[0].clientX : e.clientX);
      startT = Date.now(); trace = [];
      e.preventDefault();
    }
    function move(e) {
      if (!dragging) return;
      var x = e.touches ? e.touches[0].clientX : e.clientX;
      pos = Math.max(0, Math.min(maxX, pos0 + (x - startX)));
      trace.push({ x: x - startX, y: 0, t: Date.now() - startT });
      paint();
      e.preventDefault();
    }
    function up() {
      if (!dragging) return;
      dragging = false;
      var value = Math.round(pos / (img.clientWidth || 1) * (img.naturalWidth || 344));
      hint.textContent = '正在校验…';
      ppPost({
        action: 'verify_login_captcha',
        challenge_id: ch.challenge_id,
        slider_position: Math.max(0, Math.min(img.naturalWidth || W, value)),
        drag_duration_ms: Date.now() - startT,
        drag_trace: trace.slice(-40)
      }).then(function (j) {
        var d = j && j.data;
        if (!(j && j.status === 'success' && d && d.verify_token)) {
          throw new Error((j && (j.message || j.error)) || '验证失败，请重试');
        }
        hint.textContent = '验证通过，正在登录…';
        return ppDeviceId().then(function (dev) {
          return ppPost({
            action: 'login', email: email, password: pass,
            device_id: dev, captcha_verify_token: d.verify_token
          });
        });
      }).then(function (j) {
        var d = j && j.data;
        if (!(j && j.status === 'success' && d && d.access_token)) {
          throw new Error((j && (j.message || j.error)) || '账号或密码不正确');
        }
        var sess = {
          accessToken: String(d.access_token),
          expiresAt: String(d.expires_at || ''),
          user: { id: (d.user && d.user.id) || 0, email: (d.user && d.user.email) || email },
          deviceId: String(d.device_id || '')
        };
        try { localStorage.setItem('piupiu_account_session', JSON.stringify(sess)); } catch (e) { }
        try {
          window.dispatchEvent(new CustomEvent('piupiu:account-session-changed',
            { detail: { accountUserId: sess.user.id } }));
        } catch (e) { }
        p.classList.remove('on');
        toast('登录成功，正在重新载入…');
        setTimeout(function () { try { location.reload(); } catch (e) { } }, 700);
      }).catch(function (e) {
        hint.textContent = '拖动滑块，把竖线对到缺口';
        err.textContent = (e && e.message) || '验证失败，请重试';
        pos = 0; paint();
      });
    }

    knobsBind();
    function knobsBind() {
      var k = knob;
      k.addEventListener('touchstart', function (e) { pos0 = pos; down(e); }, { passive: false });
      k.addEventListener('mousedown', function (e) { pos0 = pos; down(e); });
      document.addEventListener('touchmove', move, { passive: false });
      document.addEventListener('mousemove', move);
      document.addEventListener('touchend', up);
      document.addEventListener('mouseup', up);
    }
  }

  function syncLoginUi() {
    var items = document.querySelectorAll('.logout-item');
    if (!items.length) return;
    var logged = isLoggedIn();
    for (var i = 0; i < items.length; i++) {
      if (items[i].__ppLog === logged) continue;
      items[i].__ppLog = logged;
      items[i].style.display = logged ? '' : 'none';
    }
    applyLoginClass(logged);
    var btn = ensureLoginItem();
    if (btn) {
      var want = logged ? 'none' : '';
      if (btn.style.display !== want) btn.style.display = want;
      btn.classList.toggle('pp-hidden', logged);
    }
  }

  var CARD_VERIFY = { key: '', ok: null, at: 0 };   // 服务端校验结果（只缓存一份）

  function cardStateOf(key) {
    if (!key || key === FREE_KEY) return 'fake';
    if (CARD_VERIFY.key === key && CARD_VERIFY.ok === true) return 'real';
    if (CARD_VERIFY.key === key && CARD_VERIFY.ok === false) return 'fake';
    return 'pending';
  }

  /* 连接中心左上角：显示当前是真卡密还是本地解锁 */

  /* 进入连接中心时主动校验已保存的卡密，无效就清空（避免显示一条假卡密） */
  var CARD_CHK = { at: 0, busy: false, last: '' };

  /* 不把哨兵卡密露在界面上：清掉输入框里的假卡密，换成提示 */

  /* ============ 模型名全局同步：所有显示当前模型的地方都改成自定义模型 === */
  var PP_PATCHED = [];




  /* 点官方条目 → 关掉自定义路由 + 还原胶囊文字 + 明确提示 */



  function $(s) { return document.querySelector(s); }

  /* --------------------------------------------------- 持久化（双写） */

  /* ------------------------------------------------------------------ 样式 */
  css([
    '#pp-splash{position:fixed;inset:0;z-index:2147483200;background:linear-gradient(180deg,#fff5f7,#ffe9f0);color:#49353c;display:flex;align-items:center;justify-content:center;padding:24px;transition:opacity .25s;overflow-y:auto}',
    '#pp-splash .card{width:100%;max-width:392px;background:#fff;border-radius:22px;padding:22px 20px 18px;box-shadow:0 18px 50px rgba(233,121,152,.18);text-align:center;margin:auto}',
    '#pp-splash h1{font-size:17px;margin:0 0 12px;color:#c65378;font-weight:800}',
    '#pp-splash p{margin:0 0 9px;color:#7a6570;font-size:13px;text-align:left}',
    '#pp-splash .k{color:#e97998;font-weight:700}',
    '#pp-splash .bar{height:4px;background:#fde8ee;border-radius:99px;overflow:hidden;margin:14px 0 16px}',
    '#pp-splash .bar i{display:block;height:100%;width:0;background:linear-gradient(90deg,#ffb3c9,#e97998);animation:ppbar 2s linear forwards}',
    '@keyframes ppbar{to{width:100%}}',
    '#pp-splash .donate{margin-top:6px;padding-top:14px;border-top:1px dashed #f4dde4}',
    '#pp-splash .donate b{display:block;font-size:13px;color:#c65378;margin-bottom:8px}',
    '#pp-splash .donate img{width:150px;height:150px;border-radius:14px;object-fit:cover;box-shadow:0 6px 18px rgba(233,121,152,.22)}',
    '.pp-x-in{position:absolute;left:10px;top:9px;width:30px;height:30px;border:0;border-radius:50%;background:rgba(0,0,0,.06);color:#8c727b;font-size:19px;line-height:30px;text-align:center;padding:0;z-index:20}',
    '.pp-card{background:#fff;border-radius:16px;padding:16px;margin:12px 0;box-shadow:0 4px 16px rgba(233,121,152,.10);border:1px solid rgba(233,121,152,.10)}',
    '.pp-card h3{margin:0 0 12px;font-size:15px;font-weight:700;color:#49353c;display:flex;align-items:center;gap:8px}',
    '.pp-card h3 .dot{width:6px;height:14px;border-radius:3px;background:linear-gradient(180deg,#ffb3c9,#e97998)}',
    '.pp-row{display:flex;align-items:center;gap:10px;padding:9px 0}',
    '.pp-row .txt{flex:1;min-width:0}',
    '.pp-row .txt b{display:block;font-size:14px;color:#49353c;font-weight:600}',
    '.pp-row .txt span{display:block;font-size:12px;color:#8c727b;margin-top:2px;line-height:1.5}',
    '.pp-switch{width:46px;height:26px;border-radius:99px;background:#eadfe4;position:relative;transition:.2s;flex:0 0 auto}',
    '.pp-switch.on{background:#e97998}',
    '.pp-switch i{position:absolute;top:3px;left:3px;width:20px;height:20px;border-radius:50%;background:#fff;transition:.2s;box-shadow:0 1px 3px rgba(0,0,0,.15)}',
    '.pp-switch.on i{left:23px}',
    '.pp-div{height:1px;background:#f7ecf0;margin:10px 0}',
    '.pp-btn{border:0;border-radius:999px;padding:8px 15px;font-size:12.5px;font-weight:600;background:#fde8ee;color:#c65378}',
    '.pp-btn.main{background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;box-shadow:0 4px 12px rgba(233,121,152,.3)}',
    '.pp-btn.line{background:#fff;border:1px solid #f4d9e2}',
    '.pp-btn:active{transform:scale(.96)}',
    '.pp-tip{font-size:11.5px;color:#a58a94;line-height:1.6;margin-top:6px}',
    '.pp-donate{background:#fff;border-radius:16px;padding:18px 16px 20px;margin:12px 0 24px;text-align:center;box-shadow:0 4px 16px rgba(233,121,152,.10);border:1px solid rgba(233,121,152,.10)}',
    '.pp-donate .t{font-size:14px;font-weight:700;color:#c65378}',
    '.pp-donate .s{font-size:12px;color:#a58a94;margin:4px 0 12px}',
    '.pp-donate img{width:190px;height:190px;border-radius:16px;object-fit:cover;box-shadow:0 8px 22px rgba(233,121,152,.22)}',
    '#pp-toast{position:fixed;left:50%;bottom:96px;transform:translateX(-50%);z-index:2147483300;background:rgba(28,20,24,.92);color:#fff;padding:11px 18px;border-radius:12px;font-size:13.5px;max-width:80vw;display:none}',
    /* 模型管理整页 */
    '#pp-page{position:fixed;inset:0;z-index:2147483150;background:#fff5f7;display:none;flex-direction:column;color:#49353c}',
    '#pp-page.on{display:flex}',
    '#pp-page .hd{display:flex;align-items:center;gap:10px;padding:calc(12px + env(safe-area-inset-top,0px)) 14px 12px;background:#fff;border-bottom:1px solid #f7e6ec}',
    '#pp-page .hd .back{width:34px;height:34px;border-radius:50%;border:0;background:#fde8ee;color:#c65378;font-size:18px;line-height:34px;text-align:center;padding:0}',
    '#pp-page .hd .ttl{flex:1;font-size:16px;font-weight:700}',
    '#pp-page .hd .add{border:0;background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;border-radius:999px;padding:8px 16px;font-size:13px;font-weight:700;box-shadow:0 4px 12px rgba(233,121,152,.3)}',
    '#pp-page .body{flex:1;overflow-y:auto;padding:14px 14px 30px}',
    '.pp-mcard{background:#fff;border-radius:16px;padding:14px;margin-bottom:12px;box-shadow:0 4px 16px rgba(233,121,152,.10);border:1px solid rgba(233,121,152,.10)}',
    '.pp-mcard .top{display:flex;align-items:center;gap:8px}',
    '.pp-mcard .nm{flex:1;min-width:0;font-size:15px;font-weight:700;color:#49353c}',
    '.pp-mcard .nm small{display:block;font-size:11.5px;color:#a58a94;font-weight:400;margin-top:3px;word-break:break-all}',
    '.pp-mcard .tag{font-size:11px;color:#e97998;border:1px solid #ffd3e0;border-radius:999px;padding:2px 8px}',
    '.pp-mcard .ops{display:flex;gap:8px;margin-top:12px}',
    '.pp-mcard .ops button{flex:1}',
    '.pp-empty{text-align:center;color:#a58a94;font-size:13px;padding:40px 10px;line-height:1.9}',
    /* 表单 */
    '.pp-field{margin-bottom:12px}',
    '.pp-field label{display:block;font-size:12.5px;color:#8c727b;margin-bottom:6px;font-weight:600}',
    '.pp-field input{width:100%;box-sizing:border-box;border:1px solid #f4dde4;border-radius:12px;padding:12px 13px;font-size:14px;background:#fff;color:#49353c}',
    '.pp-field input:focus{outline:none;border-color:#f5a9c1;box-shadow:0 0 0 3px rgba(233,121,152,.12)}',
    '.pp-field .hint{font-size:11px;color:#b39aa4;margin-top:5px}',
    /* 测试对话 */
    '#pp-testp{position:fixed;inset:0;z-index:2147483170;background:rgba(28,20,24,.45);display:none;align-items:flex-end}',
    '#pp-testp.on{display:flex}',
    '#pp-testp .sheet{width:100%;max-height:82vh;background:#fff;border-radius:22px 22px 0 0;display:flex;flex-direction:column;overflow:hidden}',
    '#pp-testp .sh{display:flex;align-items:center;padding:16px 16px 10px}',
    '#pp-testp .sh b{flex:1;font-size:15px}',
    '#pp-testp .sh .x{border:0;background:#fde8ee;color:#c65378;border-radius:50%;width:30px;height:30px;font-size:17px;line-height:30px;padding:0}',
    '#pp-testp .msgs{flex:1;overflow-y:auto;padding:6px 16px 12px;min-height:120px}',
    '.pp-msg{max-width:86%;padding:10px 13px;border-radius:14px;font-size:13.5px;line-height:1.65;margin-bottom:10px;white-space:pre-wrap;word-break:break-word}',
    '.pp-msg.me{margin-left:auto;background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;border-bottom-right-radius:5px}',
    '.pp-msg.ai{background:#fff2f6;color:#49353c;border-bottom-left-radius:5px}',
    '.pp-msg.sys{background:#f6f0f2;color:#8c727b;font-size:12px;text-align:center;margin:0 auto 10px;border-radius:8px}',
    '#pp-testp .si{display:flex;gap:8px;padding:10px 14px calc(14px + env(safe-area-inset-bottom,0px));border-top:1px solid #f7e6ec;background:#fff}',
    '#pp-testp .si input{flex:1;border:1px solid #f4dde4;border-radius:999px;padding:11px 15px;font-size:14px;background:#fffafc}',
    '#pp-testp .si button{border:0;border-radius:999px;padding:0 18px;background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;font-weight:700;font-size:13.5px}',
    /* 聊天页破甲悬浮 */
    '.pp-ai-model{margin:12px 16px 0;display:flex;align-items:center;gap:10px;padding:11px 13px;border-radius:16px;background:linear-gradient(135deg,rgba(255,162,187,.13),rgba(233,121,152,.07));border:1px solid rgba(233,121,152,.22)}',
    '.pp-ai-model .ic{width:26px;height:26px;border-radius:50%;background:#fff;color:#e97998;display:flex;align-items:center;justify-content:center;font-size:14px;flex:0 0 auto;box-shadow:0 2px 6px rgba(233,121,152,.18)}',
    '.pp-ai-model .t{flex:1;min-width:0}',
    '.pp-ai-model .t b{display:block;font-size:13.5px;color:var(--text-color,#49353c);font-weight:700;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}',
    '.pp-ai-model .t small{display:block;font-size:11px;color:var(--text-secondary-color,#8c727b);margin-top:2px}',
    '.pp-ai-model .armor{font-size:10px;padding:3px 8px;border-radius:999px;background:#e97998;color:#fff;font-weight:700;flex:0 0 auto}',
    '.pp-ai-model .go{font-size:12px;color:#c65378;font-weight:700;flex:0 0 auto}',
    '#pp-aisheet{position:fixed;inset:0;z-index:2147483190;background:rgba(28,20,24,.45);display:none;align-items:flex-end}',
    '#pp-aisheet.on{display:flex}',
    '#pp-aisheet .sheet{width:100%;max-height:72vh;background:#fff;border-radius:22px 22px 0 0;overflow-y:auto;padding:6px 0 calc(16px + env(safe-area-inset-bottom,0px))}',
    '#pp-aisheet .h{display:flex;align-items:center;padding:14px 18px 8px;font-size:15px;font-weight:700;color:#49353c}',
    '#pp-aisheet .h .x{margin-left:auto;border:0;background:#fde8ee;color:#c65378;border-radius:50%;width:30px;height:30px;font-size:17px;line-height:30px;padding:0}',
    '#pp-aisheet .row{display:flex;align-items:center;gap:10px;padding:14px 18px;border-bottom:1px solid #f8eef2}',
    '#pp-aisheet .row .n{flex:1;min-width:0;font-size:14px;color:#49353c}',
    '#pp-aisheet .row .n small{display:block;font-size:11.5px;color:#a58a94;margin-top:3px;word-break:break-all}',
    '#pp-aisheet .row .ck{color:#e97998;font-weight:700;font-size:12px}',
    '#pp-aisheet .tip{padding:12px 18px;font-size:12px;color:#a58a94;line-height:1.7}',
    '#pp-dnsrow{display:flex;align-items:center;gap:8px;padding:9px 0}',
    '#pp-dnsrow .v{flex:1;min-width:0;font-size:12px;color:#8c727b}',
    '#pp-dnsrow .btn{border:0;border-radius:999px;padding:6px 13px;font-size:12px;font-weight:700;background:#fde8ee;color:#c65378}',
    '#pp-upd{position:fixed;inset:0;z-index:2147483250;background:rgba(28,20,24,.5);display:none;align-items:center;justify-content:center;padding:22px}',
    '#pp-upd.on{display:flex}',
    '#pp-upd .box{width:100%;max-width:360px;background:#fff;border-radius:22px;overflow:hidden;box-shadow:0 24px 60px rgba(0,0,0,.28)}',
    '#pp-upd .hd{padding:20px 20px 6px;font-size:17px;font-weight:800;color:#c65378}',
    '#pp-upd .ver{padding:0 20px;font-size:12.5px;color:#a58a94}',
    '#pp-upd .bd{padding:12px 20px 4px;font-size:13px;line-height:1.75;color:#49353c;max-height:34vh;overflow-y:auto;white-space:pre-wrap;word-break:break-word}',
    '#pp-upd .ft{display:flex;gap:10px;padding:16px 20px 20px}',
    '#pp-upd .ft button{flex:1;border:0;border-radius:999px;padding:12px;font-size:14px;font-weight:700}',
    '#pp-upd .ft .no{background:#fde8ee;color:#c65378}',
    '#pp-upd .ft .yes{background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;box-shadow:0 6px 16px rgba(233,121,152,.32)}',
    /* ===== 黑夜模式适配（.dark-mode 由 App 挂在 html/body 上）===== */
    '.dark-mode .pp-card,.dark-mode #pp-splash .card,.dark-mode .pp-donate,.dark-mode .pp-mcard,.dark-mode #pp-upd .box{background:#1a1b21;border-color:rgba(255,255,255,.08);box-shadow:0 4px 18px rgba(0,0,0,.35)}',
    '.dark-mode #pp-splash{background:linear-gradient(180deg,#15161a,#1b1c22)}',
    '.dark-mode #pp-splash h1,.dark-mode .pp-card h3,.dark-mode .pp-mcard .nm,.dark-mode #pp-upd .hd{color:#f78cab}',
    '.dark-mode #pp-splash p,.dark-mode .pp-row .txt b,.dark-mode .pp-field label,.dark-mode #pp-upd .bd{color:rgba(255,255,255,.86)}',
    '.dark-mode #pp-splash .k,.dark-mode .pp-tip,.dark-mode .pp-row .txt span,.dark-mode .pp-mcard .nm small,.dark-mode #pp-upd .ver,.dark-mode #pp-dnsrow .v{color:rgba(255,255,255,.55)}',
    '.dark-mode #pp-splash .bar,.dark-mode .pp-div{background:rgba(255,255,255,.08)}',
    '.dark-mode .pp-field input,.dark-mode .pp-row input,.dark-mode #pp-page input{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1);color:#fff}',
    '.dark-mode .pp-btn{background:rgba(255,143,171,.16);color:#f78cab}',
    '.dark-mode .pp-btn.line{background:transparent;border-color:rgba(255,255,255,.14);color:rgba(255,255,255,.82)}',
    '.dark-mode #pp-page,.dark-mode #pp-panel{background:#15161a}',
    '.dark-mode #pp-page .hd{background:#1a1b21;border-bottom-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-page .hd .ttl{color:#fff}',
    '.dark-mode #pp-aisheet .sheet,.dark-mode #pp-testp .sheet{background:#1a1b21}',
    '.dark-mode #pp-aisheet .h,.dark-mode #pp-testp .sh b{color:#fff}',
    '.dark-mode #pp-aisheet .row{border-bottom-color:rgba(255,255,255,.07)}',
    '.dark-mode #pp-aisheet .row .n{color:rgba(255,255,255,.88)}',
    '.dark-mode .pp-msg.ai{background:rgba(255,255,255,.06);color:rgba(255,255,255,.88)}',
    '.dark-mode .pp-msg.sys{background:rgba(255,255,255,.04);color:rgba(255,255,255,.5)}',
    '.dark-mode #pp-testp .si{background:#1a1b21;border-top-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-testp .si input{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1);color:#fff}',
    '.dark-mode .pp-empty{color:rgba(255,255,255,.45)}',
    '.dark-mode .pp-ai-model{background:linear-gradient(135deg,rgba(255,143,171,.14),rgba(255,143,171,.06));border-color:rgba(255,143,171,.28)}',
    '.dark-mode .pp-ai-model .t b{color:#fff}',
    '.dark-mode .pp-ai-model .ic{background:rgba(255,255,255,.1);color:#f78cab}',
    '.pp-login-item .setting-label{color:#e97998!important}',
    '#pp-card-badge{position:absolute;top:calc(10px + env(safe-area-inset-top,0px));left:12px;z-index:6;display:inline-flex;align-items:center;gap:6px;padding:5px 10px;border-radius:999px;font-size:11.5px;font-weight:700;line-height:1;white-space:nowrap;box-shadow:0 2px 8px rgba(0,0,0,.08)}',
    '#pp-card-badge i{width:6px;height:6px;border-radius:50%;flex:0 0 auto}',
    '#pp-card-badge.real{background:rgba(22,163,74,.12);color:#16a34a;border:1px solid rgba(22,163,74,.25)}',
    '#pp-card-badge.real i{background:#16a34a;box-shadow:0 0 0 3px rgba(22,163,74,.15)}',
    '#pp-card-badge.pending{background:rgba(120,120,128,.12);color:#6b7280;border:1px solid rgba(120,120,128,.28)}',
    '#pp-card-badge.pending i{background:#9ca3af;box-shadow:0 0 0 3px rgba(120,120,128,.16)}',
    '.dark-mode #pp-card-badge.pending{background:rgba(255,255,255,.08);color:rgba(255,255,255,.6);border-color:rgba(255,255,255,.16)}',
    '.dark-mode #pp-card-badge.pending i{background:rgba(255,255,255,.5)}',
    '#pp-card-badge.fake{background:rgba(233,121,152,.13);color:#c65378;border:1px solid rgba(233,121,152,.3)}',
    '#pp-card-badge.fake i{background:#e97998;box-shadow:0 0 0 3px rgba(233,121,152,.18)}',
    '.dark-mode #pp-card-badge.real{background:rgba(34,197,94,.14);color:#4ade80;border-color:rgba(34,197,94,.3)}',
    '.dark-mode #pp-card-badge.real i{background:#4ade80}',
    '.dark-mode #pp-card-badge.fake{background:rgba(255,143,171,.14);color:#f78cab;border-color:rgba(255,143,171,.32)}',
    '.dark-mode #pp-card-badge.fake i{background:#f78cab}',
    '#pp-backup-card h3 b{font-weight:800}',

    '#pp-bkdlg .bk-chk{display:flex;align-items:center;gap:9px;background:#fdf7f9;border:1px solid #f6e3ea;border-radius:12px;padding:8px 10px;margin-bottom:6px}',
    '#pp-bkdlg .bk-chk input{width:16px;height:16px;accent-color:#e97998;flex:0 0 auto}',
    '#pp-bkdlg .bk-chk .thumb{width:44px;height:44px;border-radius:10px;background:#f4eef1;color:#b08a99;font-size:11px;display:flex;align-items:center;justify-content:center;overflow:hidden;flex:0 0 auto}',
    '#pp-bkdlg .bk-chk .thumb img{width:100%;height:100%;object-fit:cover}',
    '#pp-bkdlg .bk-chk .t{flex:1;min-width:0}',
    '#pp-bkdlg .bk-chk .t b{display:block;font-size:13px;color:#49353c;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}',
    '#pp-bkdlg .bk-chk .t small{display:block;font-size:11px;color:#a58a94;line-height:1.55}',
    '#pp-bkdlg .bk-chk .t small.ts{color:#c65378}',
    '#pp-bkdlg .bk-chk .t small i{font-style:normal;color:#8c727b}',
    '#pp-bkdlg .bk-chk .pp-btn{padding:5px 10px;font-size:11.5px;flex:0 0 auto}',
    '#pp-bkpreview{position:fixed;inset:0;z-index:2147483310;background:#fdf8fa;display:none;flex-direction:column}',
    '#pp-bkpreview.on{display:flex}',
    '#pp-bkpreview .page{display:flex;flex-direction:column;height:100%}',
    '#pp-bkpreview .hd{display:flex;align-items:center;gap:8px;padding:calc(10px + env(safe-area-inset-top,0px)) 14px 8px;background:#fff;border-bottom:1px solid #f3e3ea}',
    '#pp-bkpreview .hd .nav{border:0;background:transparent;font-size:24px;color:#c65378;padding:0 6px}',
    '#pp-bkpreview .hd b{font-size:16px;color:#49353c}',
    '#pp-bkpreview .hd .cnt{margin-left:auto;font-size:11px;color:#a58a94}',
    '#pp-bkpreview .body{flex:1;overflow-y:auto;padding:12px 14px calc(20px + env(safe-area-inset-bottom,0px))}',
    '#pp-bkpreview .chat-meta{font-size:11.5px;color:#a58a94;margin:0 0 10px 4px}',
    '#pp-bkpreview .msgs{display:flex;flex-direction:column;gap:8px}',
    '#pp-bkpreview .m{border-radius:14px;padding:9px 12px;max-width:92%}',
    '#pp-bkpreview .m.me{align-self:flex-end;background:#fde8ee}',
    '#pp-bkpreview .m.ai{align-self:flex-start;background:#fff;border:1px solid #f6e3ea}',
    '#pp-bkpreview .m.sys{align-self:center;background:#f4eef1}',
    '#pp-bkpreview .m .who{font-size:10.5px;color:#b08a99;margin-bottom:3px}',
    '#pp-bkpreview .m .txt{font-size:13px;color:#49353c;line-height:1.7;white-space:pre-wrap;word-break:break-word}',
    '.dark-mode #pp-bkpreview{background:#15161a}',
    '.dark-mode #pp-bkpreview .hd{background:#1a1b21;border-bottom-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-bkpreview .hd b{color:#fff}',
    '.dark-mode #pp-bkpreview .m.ai{background:#1a1b21;border-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-bkpreview .m.me{background:rgba(255,143,171,.16)}',
    '.dark-mode #pp-bkpreview .m .txt{color:rgba(255,255,255,.88)}',
    '.dark-mode #pp-bkdlg .bk-chk{background:rgba(255,255,255,.04);border-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-bkdlg .bk-chk .t b{color:#fff}',
    '#pp-bkdlg .bd{max-height:70vh;overflow-y:auto}',
    '#pp-bkdlg .bk-sec{margin-top:10px}',
    '#pp-bkdlg .bk-sec h4{font-size:12.5px;color:#c65378;margin:8px 2px;font-weight:800}',
    '#pp-bkdlg .bk-chk{display:flex;align-items:center;gap:10px;background:#fdf7f9;border:1px solid #f6e3ea;border-radius:12px;padding:9px 12px;margin-bottom:6px}',
    '#pp-bkdlg .bk-chk input{width:16px;height:16px;accent-color:#e97998}',
    '#pp-bkdlg .bk-chk span{flex:1;min-width:0;font-size:13px;color:#49353c}',
    '#pp-bkdlg .bk-chk small{display:block;font-size:11px;color:#a58a94}',
    '.dark-mode #pp-bkdlg .bk-chk{background:rgba(255,255,255,.04);border-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-bkdlg .bk-chk span{color:#fff}',
    '#pp-bkdel{position:fixed;inset:0;z-index:2147483275;background:rgba(28,20,24,.5);display:none;align-items:center;justify-content:center;padding:22px}',
    '#pp-bkdel.on{display:flex}',
    '#pp-bkdel .box{width:100%;max-width:350px;background:#fff;border-radius:22px;overflow:hidden}',
    '#pp-bkdel .hd{display:flex;align-items:center;padding:18px 20px 6px;font-size:17px;font-weight:800;color:#c65378}',
    '#pp-bkdel .hd .x{margin-left:auto;border:0;background:#fde8ee;color:#c65378;border-radius:50%;width:28px;height:28px;font-size:16px;line-height:28px;padding:0}',
    '#pp-bkdel .bd{padding:6px 20px 20px}',
    '#pp-bkdel .tip{font-size:12.5px;color:#8c727b;line-height:1.8;margin-top:8px}',
    '#pp-bkdel .row2{display:flex;gap:10px;margin-top:16px}',
    '#pp-bkdel .row2 button{flex:1}',
    '.dark-mode #pp-bkview .sheet,.dark-mode #pp-bkdel .box{background:#1a1b21}',
    '.dark-mode #pp-bkview .hd,.dark-mode #pp-bkdel .hd{color:#f78cab}',
    '.dark-mode #pp-bkview .bk-item{background:rgba(255,255,255,.04);border-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-bkview .bk-item .t b{color:#fff}',
    '.dark-mode #pp-bkview .bk-item .t small,.dark-mode #pp-bkdel .tip{color:rgba(255,255,255,.55)}',
    '.dark-mode #pp-bkview .bk-lock{background:rgba(255,255,255,.08);color:rgba(255,255,255,.5)}',
    '#pp-bkview{position:fixed;inset:0;z-index:2147483300;background:#fdf8fa;display:none;flex-direction:column}',
    '#pp-bkview.on{display:flex}',
    '#pp-bkview .page{display:flex;flex-direction:column;height:100%}',
    '#pp-bkview .hd{display:flex;align-items:center;gap:8px;padding:calc(10px + env(safe-area-inset-top,0px)) 14px 8px;background:#fff;border-bottom:1px solid #f3e3ea}',
    '#pp-bkview .hd .nav{border:0;background:transparent;font-size:24px;line-height:1;color:#c65378;padding:0 6px}',
    '#pp-bkview .hd b{font-size:16px;color:#49353c}',
    '#pp-bkview .hd .cnt{margin-left:auto;font-size:11px;color:#a58a94}',
    '#pp-bkview .tabs{display:flex;gap:8px;padding:10px 14px;background:#fff}',
    '#pp-bkview .tabs button{flex:1;border:1px solid #f2dde5;background:#fdf5f8;color:#8c727b;border-radius:999px;padding:8px 0;font-size:13px;font-weight:700}',
    '#pp-bkview .tabs button.on{background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;border-color:transparent}',
    '#pp-bkview .body{flex:1;overflow-y:auto;padding:12px 14px calc(20px + env(safe-area-inset-bottom,0px))}',
    '#pp-bkview .bk-card{display:flex;gap:10px;background:#fff;border:1px solid #f6e3ea;border-radius:16px;padding:10px;margin-bottom:10px}',
    '#pp-bkview .bk-card img{width:64px;height:64px;border-radius:12px;object-fit:cover;flex:0 0 auto;background:#f4eef1}',
    '#pp-bkview .bk-card .noimg{width:64px;height:64px;border-radius:12px;background:#f4eef1;color:#b08a99;font-size:11px;display:flex;align-items:center;justify-content:center;flex:0 0 auto}',
    '#pp-bkview .bk-card .info{flex:1;min-width:0}',
    '#pp-bkview .bk-card .info b{display:block;font-size:14px;color:#49353c;margin-bottom:2px}',
    '#pp-bkview .bk-card .info small{display:block;font-size:11px;color:#a58a94;line-height:1.6}',
    '#pp-bkview .bk-card .info small.ts{color:#c65378}',
    '#pp-bkview .bk-card .info p{margin:6px 0 0;font-size:11.5px;color:#8c727b;line-height:1.6;max-height:34px;overflow:hidden}',
    '#pp-bkview .bk-card .pp-btn,#pp-bkview .bk-chat .pp-btn{padding:6px 10px;font-size:11.5px;flex:0 0 auto}',
    '#pp-bkview .bk-chat{display:flex;align-items:center;gap:8px;background:#fff;border:1px solid #f6e3ea;border-radius:16px;padding:12px;margin-bottom:10px}',
    '#pp-bkview .bk-chat .t{flex:1;min-width:0}',
    '#pp-bkview .bk-chat .t b{display:block;font-size:13.5px;color:#49353c}',
    '#pp-bkview .bk-chat .t small{display:block;font-size:11px;color:#a58a94;margin-top:2px}',
    '#pp-bkview .bk-chat .t small.ts{color:#c65378}',
    '#pp-bkview .bk-other{background:#fff;border:1px solid #f6e3ea;border-radius:16px;padding:12px;margin-bottom:10px}',
    '#pp-bkview .bk-other .oh{display:flex;align-items:center;gap:8px}',
    '#pp-bkview .bk-other .oh b{font-size:13.5px;color:#49353c;flex:1}',
    '#pp-bkview .bk-other .oh small{font-size:11px;color:#c65378}',
    '#pp-bkview .bk-other pre{margin:8px 0 0;font-size:11px;line-height:1.5;color:#6b5b62;white-space:pre-wrap;word-break:break-all;max-height:260px;overflow:auto}',
    '#pp-bkview .chat-head{display:flex;align-items:center;gap:6px;margin-bottom:4px}',
    '#pp-bkview .chat-head .nav2{border:0;background:transparent;font-size:22px;color:#c65378;padding:0 4px}',
    '#pp-bkview .chat-head b{font-size:15px;color:#49353c}',
    '#pp-bkview .chat-meta{font-size:11.5px;color:#a58a94;margin:0 0 10px 4px}',
    '#pp-bkview .msgs{display:flex;flex-direction:column;gap:8px}',
    '#pp-bkview .m{border-radius:14px;padding:9px 12px;max-width:92%}',
    '#pp-bkview .m.me{align-self:flex-end;background:#fde8ee}',
    '#pp-bkview .m.ai{align-self:flex-start;background:#fff;border:1px solid #f6e3ea}',
    '#pp-bkview .m.sys{align-self:center;background:#f4eef1}',
    '#pp-bkview .m .who{font-size:10.5px;color:#b08a99;margin-bottom:3px}',
    '#pp-bkview .m .txt{font-size:13px;color:#49353c;line-height:1.7;white-space:pre-wrap;word-break:break-word}',
    '.dark-mode #pp-bkview{background:#15161a}',
    '.dark-mode #pp-bkview .hd,.dark-mode #pp-bkview .tabs{background:#1a1b21;border-bottom-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-bkview .hd b,.dark-mode #pp-bkview .bk-card .info b,.dark-mode #pp-bkview .bk-chat .t b,.dark-mode #pp-bkview .bk-other .oh b,.dark-mode #pp-bkview .chat-head b{color:#fff}',
    '.dark-mode #pp-bkview .bk-card,.dark-mode #pp-bkview .bk-chat,.dark-mode #pp-bkview .bk-other,.dark-mode #pp-bkview .m.ai{background:#1a1b21;border-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-bkview .m.me{background:rgba(255,143,171,.16)}',
    '.dark-mode #pp-bkview .m .txt{color:rgba(255,255,255,.88)}',
    '.dark-mode #pp-bkview .bk-other pre{color:rgba(255,255,255,.6)}',
    '.dark-mode #pp-bkview .tabs button{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1);color:rgba(255,255,255,.7)}',
    '.dark-mode #pp-bkview .tabs button.on{background:linear-gradient(135deg,#ff8fab,#f78cab);color:#1a1b21}',
    '#pp-bkdlg{position:fixed;inset:0;z-index:2147483270;background:rgba(28,20,24,.5);display:none;align-items:center;justify-content:center;padding:22px}',
    '#pp-bkdlg.on{display:flex}',
    '#pp-bkdlg .box{width:100%;max-width:360px;background:#fff;border-radius:22px;overflow:hidden;box-shadow:0 24px 60px rgba(0,0,0,.28)}',
    '#pp-bkdlg .hd{display:flex;align-items:center;padding:18px 20px 6px;font-size:17px;font-weight:800;color:#c65378}',
    '#pp-bkdlg .hd .x{margin-left:auto;border:0;background:#fde8ee;color:#c65378;border-radius:50%;width:28px;height:28px;font-size:16px;line-height:28px;padding:0}',
    '#pp-bkdlg .bd{padding:6px 20px 20px}',
    '#pp-bkdlg .tip{font-size:12.5px;color:#8c727b;line-height:1.8;margin-top:8px}',
    '#pp-bkdlg .row2{display:flex;gap:10px;margin-top:16px}',
    '#pp-bkdlg .row2 button{flex:1}',
    '.dark-mode #pp-bkdlg .box{background:#1a1b21}',
    '.dark-mode #pp-bkdlg .hd{color:#f78cab}',
    '.dark-mode #pp-bkdlg .tip{color:rgba(255,255,255,.55)}',
    '.dark-mode #pp-backup-card{background:#1a1b21}',
    '#pp-loginsheet{position:fixed;inset:0;z-index:2147483260;background:rgba(28,20,24,.5);display:none;align-items:center;justify-content:center;padding:22px}',
    '#pp-loginsheet.on{display:flex}',
    '#pp-loginsheet .box{width:100%;max-width:360px;background:#fff;border-radius:22px;overflow:hidden;box-shadow:0 24px 60px rgba(0,0,0,.28)}',
    '#pp-loginsheet .hd{display:flex;align-items:center;padding:18px 20px 6px;font-size:17px;font-weight:800;color:#c65378}',
    '#pp-loginsheet .hd .x{margin-left:auto;border:0;background:#fde8ee;color:#c65378;border-radius:50%;width:28px;height:28px;font-size:16px;line-height:28px;padding:0}',
    '#pp-loginsheet .bd{padding:6px 20px 20px}',
    '#pp-loginsheet label{display:block;font-size:12.5px;color:#8c727b;margin:12px 0 6px}',
    '#pp-loginsheet input{width:100%;box-sizing:border-box;border:1px solid #f0dde4;background:#fdf7f9;border-radius:12px;padding:12px 13px;font-size:14px;color:#49353c;outline:none}',
    '#pp-loginsheet .err{min-height:16px;font-size:12px;color:#d9534f;margin-top:8px}',
    '#pp-loginsheet .tip{font-size:11.5px;color:#a58a94;line-height:1.7;margin-top:10px}',
    '.dark-mode #pp-loginsheet .box{background:#1a1b21}',
    '.dark-mode #pp-loginsheet .hd{color:#f78cab}',
    '.dark-mode #pp-loginsheet label{color:rgba(255,255,255,.55)}',
    '.dark-mode #pp-loginsheet input{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1);color:#fff}',
    '.dark-mode #pp-loginsheet .tip{color:rgba(255,255,255,.45)}',
    '#pp-loginsheet .cp-img{position:relative;margin-top:6px;border-radius:12px;overflow:hidden;background:#f6f7fb}',
    '#pp-loginsheet .cp-img img{display:block;width:100%;height:auto}',
    '#pp-loginsheet .cp-img i{position:absolute;top:0;bottom:0;width:2px;background:#e97998;box-shadow:0 0 6px rgba(233,121,152,.9);left:0}',
    '#pp-loginsheet .cp-track{position:relative;height:44px;margin-top:12px;border-radius:999px;background:#fdf2f6;border:1px solid #f0dde4}',
    '#pp-loginsheet .cp-fill{position:absolute;left:0;top:0;bottom:0;width:0;border-radius:999px;background:rgba(233,121,152,.22)}',
    '#pp-loginsheet .cp-knob{position:absolute;left:0;top:-3px;width:50px;height:48px;border-radius:14px;background:linear-gradient(135deg,#ffa2bb,#e97998);box-shadow:0 4px 12px rgba(233,121,152,.4);touch-action:none}',
    '#pp-loginsheet .cp-hint{position:absolute;left:0;right:0;top:13px;text-align:center;font-size:12px;color:#b08a99;pointer-events:none}',
    '.dark-mode #pp-loginsheet .cp-track{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1)}',
    '.dark-mode #pp-loginsheet .cp-hint{color:rgba(255,255,255,.45)}',


    '.dark-mode .pp-login-item{background:rgba(255,143,171,.10);border-color:rgba(255,143,171,.18)}',
    '.dark-mode .pp-login-item .setting-label{color:#f78cab!important}',
    '.dark-mode .pp-login-item .setting-hint{color:rgba(255,255,255,.55)}',
    '.pp-hidden{display:none!important}',
    '.logout-item{display:none!important}',
    'html.pp-logged-in .logout-item{display:flex!important}',
    '#pp-login-item{display:none!important}',
    'html.pp-logged-out #pp-login-item{display:flex!important}',


    '.pp-font,#pp-splash,#pp-page,#pp-testp,#pp-toast,.pp-card,.pp-mcard,.pp-field,.pp-btn,.pp-tip,#pp-page .body,#pp-testp .sheet{font-family:"ZCOOL KuaiLe",Inter,-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,sans-serif}',
  ].join('\n'));

  /* ------------------------------------------------------- 1. 免责声明 */

  /* --------------------------------------------- 2. 登录弹窗内 × */

  var UPD_KW = ['发现新版本', '有可用更新', '版本更新', '立即更新', '更新内容', '新版本已发布'];




  /* ============================ 3. 我的模型（独立整页） ==================== */




  /* ------------------------------- 测试对话（底部抽屉，真发请求） --------- */

  var testCtx = null;





  /* --------------------------- 4. 设置页：扩展功能卡 + 赞赏卡 --------------- */




  /** 从文本节点向上找到真正可点的「退出登录」按钮块（button / role=button / 含 btn 类名） */


  /* ----------- 5. 聊天页：模型选择器内嵌自定义模型 + 输入框破甲开关 -------- */

  /* 5.1 把自定义模型塞进官方「选择模型」弹层（克隆原生 .model-item，样式完全一致） */

  /* 5.2 输入框里的小破甲开关（贴着发送区域，不挡内容） */

  /* ------------- 5.3 AI 创建角色页：步骤条正下方的「创作模型」条 ---------- */




  /* ================= 5.4 更新检查（GitHub Releases） ================= */
  var APP_VER = '2.8.1';                   // 兜底值：真实版本来自 /version.json
  var UPD_API = 'https://api.github.com/repos/zmm208/piupiupj/releases/latest';
  var UPD_HINT = 'piupiupj.apk';
  var UPD_DELAY = 1800;
  var UPD_NOTES_MAX = 1200;
  var UPD_AUTO = true;
  var VER_LOADED = false;

  /* 版本号等配置全部来自 APK 内置的 /version.json，改文件即可，不用动逻辑 */






  /* ================= 5.5 多 DNS 竞速（DoH JSON） ================= */
  var DNS_LIST = [
    { id: 'ali', name: 'AliDNS', url: 'https://dns.alidns.com/resolve' },
    { id: 'dnspod', name: 'DNSPod', url: 'https://doh.pub/dns-query' },
    { id: 'cf', name: 'Cloudflare', url: 'https://cloudflare-dns.com/dns-query' },
    { id: 'google', name: 'Google', url: 'https://dns.google/resolve' },
    { id: 'adg', name: 'AdGuard', url: 'https://dns.adguard-dns.com/resolve' },
    { id: 'quad9', name: 'Quad9', url: 'https://dns.quad9.net:5053/dns-query' },
    { id: '360', name: '360', url: 'https://doh.360.cn/resolve' }
  ];
  var DNS = { winner: null, results: [], closed: {}, at: 0, busy: false, loaded: false };
  var DNS_PROBE_DEFAULT = 'www.piupiuchan.top';
  var DNS_TIMEOUT = 1600, DNS_CACHE_MS = 600000;

  /* 读取 APK 内置 dns.json（可在 assets/public/dns.json 里改，无需重新编译逻辑） */
  var DNS_PROBE_HOST = 'www.piupiuchan.top';





  /* ------------------------------- 6. 请求层：破甲 / 重试 / 自定义 --------- */





  try { window.__ppStage = 2; } catch (e) { }
  var of = window.fetch ? window.fetch.bind(window) : null;   // 原始 fetch（永不指向我们自己的包装）

  /* ---------- 自定义模型：只换"发给谁"，messages（上下文/记忆/预设）原样保留 ---------- */
  function ppJSONResponse(status, obj) {
    return new Response(JSON.stringify(obj), {
      status: status || 200,
      headers: { 'Content-Type': 'application/json' }
    });
  }

  function ppSSEResponse(text) {
    var enc = new TextEncoder();
    var parts = [];
    var step = 28;
    for (var i = 0; i < text.length; i += step) {
      parts.push('data: ' + JSON.stringify({ choices: [{ delta: { content: text.slice(i, i + step) } }] }) + '\n\n');
    }
    parts.push('data: [DONE]\n\n');
    var body = new ReadableStream({
      start: function (c) {
        for (var k = 0; k < parts.length; k++) c.enqueue(enc.encode(parts[k]));
        c.close();
      }
    });
    return new Response(body, { status: 200, headers: { 'Content-Type': 'text/event-stream' } });
  }

  function ppExtractText(res) {
    var d = res && res.data;
    if (typeof d === 'string') {
      // 兼容直接返回 SSE 文本的代理
      if (d.indexOf('data:') === 0) {
        var out = '';
        d.split('\n').forEach(function (line) {
          var t = line.trim();
          if (t.indexOf('data:') !== 0 || t.indexOf('[DONE]') >= 0) return;
          try {
            var j = JSON.parse(t.slice(5).trim());
            var c = j.choices && j.choices[0];
            if (c) out += (c.delta && c.delta.content) || (c.message && c.message.content) || '';
          } catch (e) { }
        });
        return out;
      }
      try {
        var j2 = JSON.parse(d);
        return (((j2.choices || [])[0] || {}).message || {}).content || '';
      } catch (e) { return d; }
    }
    if (d && d.choices) return ((d.choices[0] || {}).message || {}).content || '';
    return '';
  }

  /* 去掉模型自带的思考链（DeepSeek-R1 / reasoner 等） */
  function ppCleanContent(txt) {
    var t = String(txt || '');
    // <thinking>…</thinking> / <reasoning> / <analysis> / <scratchpad> / <thought>
    t = t.replace(/<think(?:ing)?>[\s\S]*?<\/think(?:ing)?>/gi, '');
    t = t.replace(/<reasoning>[\s\S]*?<\/reasoning>/gi, '');
    t = t.replace(/<analysis>[\s\S]*?<\/analysis>/gi, '');
    t = t.replace(/<scratchpad>[\s\S]*?<\/scratchpad>/gi, '');
    t = t.replace(/<thought>[\s\S]*?<\/thought>/gi, '');
    // 未闭合的开头标签：从标签处截到下一个空行
    t = t.replace(/^\s*<think(?:ing)?>[\s\S]*?\n\s*\n/i, '');
    // 常见的“思考中：”前缀块
    t = t.replace(/^\s*(?:思考(?:过程)?|推理过程|reasoning)\s*[:：][\s\S]*?\n\s*\n/i, '');
    return t.trim();
  }

  function ppSendCustom(cu, init) {
    var obj = {};
    try { obj = JSON.parse(cu.body); } catch (e) { }
    if (S.armorOn || cu.armor) {
      try { obj = JSON.parse(applyArmor(JSON.stringify(obj))); } catch (e) { }
    }
    var url = cu.url;
    if (!url) return Promise.reject(new Error('自定义模型 Base URL 为空'));
    // 调用方要流式就还它流式、要非流式就还它 JSON（否则 App 会拿 SSE 去 JSON.parse 报错）
    var wantStream = !!obj.stream;
    // 请求侧一律非流式：这样才能只取 content、把 reasoning_content 丢掉
    obj.stream = false;
    var headers = { 'Content-Type': 'application/json', Authorization: 'Bearer ' + cu.key };
    var body = JSON.stringify(obj);
    var signal = init && init.signal;

    function reply(text) {
      var t = ppCleanContent(text);
      if (wantStream) return ppSSEResponse(t);
      return ppJSONResponse(200, {
        id: 'pp-' + Date.now(),
        object: 'chat.completion',
        model: obj.model || '',
        choices: [{ index: 0, message: { role: 'assistant', content: t }, finish_reason: 'stop' }]
      });
    }

    function toText(j) {
      if (j && j.choices && j.choices[0]) {
        var m = j.choices[0].message || j.choices[0].delta || {};
        return m.content || '';       // 只取 content，reasoning_content 直接忽略
      }
      return '';
    }
    function fromRaw(t) {
      var out = '';
      String(t || '').split('\n').forEach(function (line) {
        var s = line.trim();
        if (s.indexOf('data:') !== 0 || s.indexOf('[DONE]') >= 0) return;
        try {
          var j = JSON.parse(s.slice(5).trim());
          if (j.choices && j.choices[0]) {
            var d = j.choices[0].delta || j.choices[0].message || {};
            out += d.content || '';   // 流式里也只要 content
          }
        } catch (e) { }
      });
      return out;
    }

    return of.call(window, url, { method: 'POST', headers: headers, body: body, signal: signal })
      .then(function (r) {
        if (!r.ok) {
          return r.text().then(function (t) {
            var err = new Error('自定义模型 HTTP ' + r.status + '：' + (t || '').slice(0, 180));
            err.__ppHttp = true;
            throw err;
          });
        }
        var ct = (r.headers && r.headers.get && r.headers.get('content-type')) || '';
        if (ct.indexOf('event-stream') >= 0) {
          return r.text().then(function (t) { return reply(fromRaw(t)); });
        }
        return r.text().then(function (t) {
          var txt = '';
          try { txt = toText(JSON.parse(t)); } catch (e) { txt = fromRaw(t) || t; }
          return reply(txt);
        });
      })
      .catch(function (e) {
        if (e && e.__ppHttp) throw e;
        var cap = window.Capacitor;
        var http = cap && cap.Plugins && cap.Plugins.CapacitorHttp;
        if (!http || !http.request) throw new Error(((e && e.message) || e) + '（' + url + '）');
        return Promise.resolve(http.request({
          url: url, method: 'POST', headers: headers,
          data: obj, responseType: 'json', connectTimeout: 20000, readTimeout: 180000
        })).then(function (res) {
          if (res && res.status >= 400) {
            throw new Error('自定义模型 HTTP ' + res.status + '：' + String(ppExtractText(res) || '').slice(0, 180));
          }
          return reply(ppExtractText(res));
        });
      });
  }

  function ppFetch(input, init) {
      try {
        var url = typeof input === 'string' ? input : (input && input.url) || '';
        var method = ((init && init.method) || (input && input.method) || 'GET').toUpperCase();
        // 测试对话的请求：原样放行，绝不能被"当前模型/破甲"改写
        var isTestReq = !!(init && init.headers && (init.headers['X-PP-Test'] || init.headers['x-pp-test']));
        if (isTestReq) return of.call(window, input, init);
        // 未登录 + 官方模型：直接给出明确提示并弹官方登录框，
        // 不再让 chatService 抛 AUTH_REQUIRED 被误报成「专属通道未激活」
        if (method === 'POST' && /chat-completions-proxy/.test(url) && !customOn() && !isLoggedIn()) {
          try { window.dispatchEvent(new CustomEvent('piupiu:account-session-invalid')); } catch (e) { }
          return Promise.reject(new Error('请先登录后使用官方模型｜设置 → 个人设置 → 登录'));
        }
        if (method === 'POST' && isChat(url) && init && typeof init.body === 'string') {
          // 剥掉哨兵卡密头：让服务端按免费通道处理
          if (init.headers) {
            Object.keys(init.headers).forEach(function (h) {
              if (h.toLowerCase() === 'x-piupiu-card-key' && String(init.headers[h]) === FREE_KEY) delete init.headers[h];
            });
          }
          var cu = applyCustom(init.body);
          if (cu) {
            // 只替换目标与鉴权；messages / 上下文 / 记忆 / 预设全部原样带过去
            return ppSendCustom(cu, init);
          }
          if (aiCreateOpen()) {
            var ac = aiSelected();
            if (ac) {
              var jj = {}; try { jj = JSON.parse(init.body); } catch (e) { }
              jj.model = ac.model;
              init = Object.assign({}, init, {
                body: JSON.stringify(jj),
                headers: Object.assign({}, init.headers, { Authorization: 'Bearer ' + ac.key })
              });
              input = cuEndpoint(ac.base);
            }
            init = Object.assign({}, init, { body: applyArmor(init.body) });
            return of.call(window, input, init);
          }
          if (armorOn()) {
            init = Object.assign({}, init, { body: applyArmor(init.body) });
            // 流式回复绝不能 clone()：clone().text() 会把整条 SSE 缓存到结束，
            // 等于每个流式请求都多占用一份内存且阻塞读取 —— 这是"收到回复卡一下"的元凶
            var _streaming = false;
            try { _streaming = !!JSON.parse(init.body).stream; } catch (e) { }
            if (_streaming) return of.call(window, input, init);
            return (function retry(n, bd) {
              return of.call(window, input, Object.assign({}, init, { body: bd })).then(function (r) {
                return r.clone().text().then(function (t) {
                  var o = textOf(t);
                  if (o && GN().isRefusal(o) && n < 3) return retry(n + 1, escalate(bd, n + 1));
                  return r;
                }).catch(function () { return r; });
              });
            })(0, init.body);
          }
        }
      } catch (e) { }
      return of.apply(window, arguments);
  }

  var OF = of;
  function ppFetchWrapped(input, init) {
    try {
      var u = typeof input === 'string' ? input : (input && input.url) || '';
      var stale = !DNS.at || (Date.now() - DNS.at > DNS_CACHE_MS);
      if (u && needsDns(u) && stale) {
        return dnsRace(hostOf(u)).then(function () { return ppFetch(input, init); },
          function () { return ppFetch(input, init); })
          .catch(function () { return of.call(window, input, init); });
      }
      return ppFetch(input, init);
    } catch (e) {
      // 兜底：我们的逻辑出错时，请求照常发出去
      return of.call(window, input, init);
    }
  }
  function installFetch() {
    if (!OF) return;
    if (window.fetch === ppFetchWrapped) return;
    try { ppFetchWrapped.__ppOrig = OF; } catch (e) { }
    window.fetch = ppFetchWrapped;      // Capacitor 若覆盖过 fetch，这里会重新装回来
  }
  try { window.__ppStage = 3; installFetch(); window.__ppStage = 4; } catch (e) { window.__ppStageErr = e.message; }

  if (window.XMLHttpRequest) {
    var oo = XMLHttpRequest.prototype.open, os = XMLHttpRequest.prototype.send, oh = XMLHttpRequest.prototype.setRequestHeader;
    XMLHttpRequest.prototype.open = function (m, u) { this.__pp = { m: (m || '').toUpperCase(), u: u }; return oo.apply(this, arguments); };
    XMLHttpRequest.prototype.setRequestHeader = function (k, v) {
      try { if (String(k).toLowerCase() === 'x-piupiu-card-key' && String(v) === FREE_KEY) return; } catch (e) { }
      if (this.__pp) this.__pp.h = this.__pp.h || {};
      return oh.apply(this, arguments);
    };
    XMLHttpRequest.prototype.send = function (b) {
      try {
        var s = this.__pp;
        if (s && s.m === 'POST' && isChat(s.u) && typeof b === 'string') {
          var cu = applyCustom(b);
          if (cu) { b = cu.body; this.setRequestHeader('Authorization', 'Bearer ' + cu.key); oo.call(this, s.m, cu.url); }
          if (armorOn()) b = applyArmor(b);
        }
      } catch (e) { }
      return os.call(this, b);
    };
  }

  /* ---------------------------------------------------------- 工具 */

  /* ---------------------------------------------------------- 调度器
   * 旧实现：每秒 + 每 250ms 各跑一次全页 querySelectorAll，流式输出时 CPU 直接打满。
   * 新实现：只在「可能改变 DOM 的事件」后跑，且各步骤都带廉价门禁；
   *        另外保留一个 5s 的兜底扫描（页面不可见时跳过）。
   */
  var SCAN_TIMER = 0, SCAN_LAST = 0;




  /* 诊断：把最近一次错误记到 localStorage，出问题可以直接读 pp_last_error */
  try {
    window.addEventListener('error', function (ev) {
      try {
        localStorage.setItem('pp_last_error',
          (ev.message || 'error') + ' @' + (ev.filename || '') + ':' + (ev.lineno || 0));
      } catch (e) { }
    });
    window.addEventListener('unhandledrejection', function (ev) {
      try {
        var r = ev.reason;
        localStorage.setItem('pp_last_reject', (r && r.message) ? r.message : String(r));
      } catch (e) { }
    });
  } catch (e) { }

  /* ---------------- 对话页内存释放（官方组件没有 onUnmounted，全靠这里兜底） ------ */
  var PP_BLOBS = [];
  var PP_ROUTE = '';
  var PATCHED_BLOB = false;


  function releaseChatMemory() {
    // 只清我们自己的缓存。blob URL 与 PIXI 贴图一律不动：
    // 主页 Live2D 与聊天页共用同一批资源，回收任何一个都会让模型变成白模。
    _aiCache = { v: false, t: 0 };
    return 0;
  }

  function watchRoute() {
    trackBlobs();
    var go = function () {
      var cur = (location.pathname || '') + (location.hash || '');
      var wasChat = /\/chat\b/.test(PP_ROUTE) || /\/chatroom\b/.test(PP_ROUTE);
      var isChat = /\/chat\b/.test(cur) || /\/chatroom\b/.test(cur);
      if (wasChat && !isChat) {
        if (bkEnabled() && BK_LAST_CHAT) { try { bkBackupChat(BK_LAST_CHAT); } catch (e) { } }
        var n = releaseChatMemory();
        if (window.__ppDebug) { try { console.log('[pp] released', n, 'blobs'); } catch (e) { } }
      }
      var mchat = /\/chat\/(\d+)/.exec(cur) || /[?&](?:id|session|sessionId)=(\d+)/.exec(cur);
      if (mchat) BK_LAST_CHAT = mchat[1];
      PP_ROUTE = cur;
    };
    ['pushState', 'replaceState'].forEach(function (k) {
      var orig = history[k];
      history[k] = function () {
        var r = orig.apply(this, arguments);
        setTimeout(go, 0);
        return r;
      };
    });
    window.addEventListener('popstate', function () { setTimeout(go, 0); });
    window.addEventListener('hashchange', function () { setTimeout(go, 0); });
    PP_ROUTE = (location.pathname || '') + (location.hash || '');
    setInterval(go, 1500);   // 兜底：路由变化一定捕捉到
  }

  /* ---------- 全局预设：防连点 / 防快速切换导致的闪退 ---------- */
  var PRESET_KEY = '', PRESET_T = 0, PRESET_HITS = 0;



  /* ==================== 备份：设备密钥 + 分片增量写 ==================== */
  var BK = { map: null, info: null, dirty: false, savedAt: 0, busy: false, db: '', on: false };
  function bkEnabled() {
    try { return rawStored('pp_backup_on') === '1'; } catch (e) { return false; }
  }

  /* 只重加密变化的那一段，再整体落盘（分块写由原生完成） */

  /* ---------- 数据采集 ---------- */

  /* 批量写入：按体积自适应分批，失败自动降级为逐行写 */
  function bkRowSql(table, r, cols) {
    return '(' + cols.map(function (c) {
      var v = r[c];
      if (v === undefined || v === null) return 'NULL';
      if (typeof v === 'number') return String(v);
      return "'" + String(v).replace(/'/g, "''") + "'";
    }).join(',') + ')';
  }

  function bkUpsertBatch(table, rows) {
    if (!rows || !rows.length) return Promise.resolve(0);
    var ok = 0, fail = 0;
    var cols = [];
    rows.forEach(function (r) {
      Object.keys(r).forEach(function (k) { if (cols.indexOf(k) < 0) cols.push(k); });
    });
    if (!cols.length) return Promise.resolve(0);

    // 按“估算字符数”分批，避免单条 SQL 过大被插件拒绝
    var batches = [], cur = [], curSize = 0;
    rows.forEach(function (r) {
      var size = JSON.stringify(r).length;
      if (cur.length && (curSize + size > 180000 || cur.length >= 40)) {
        batches.push(cur); cur = []; curSize = 0;
      }
      cur.push(r); curSize += size;
    });
    if (cur.length) batches.push(cur);

    var chain = Promise.resolve();
    batches.forEach(function (chunk) {
      chain = chain.then(function () {
        var sqlText = 'INSERT OR REPLACE INTO ' + table + ' (' + cols.join(',') + ') VALUES ' +
          chunk.map(function (r) { return bkRowSql(table, r, cols); }).join(',');
        return bkExec(sqlText).then(function (good) {
          if (good) { ok += chunk.length; return; }
          // 整批失败 → 逐行重试，定位到具体哪一行有问题
          var sub = Promise.resolve();
          chunk.forEach(function (r) {
            sub = sub.then(function () {
              return bkExec('INSERT OR REPLACE INTO ' + table + ' (' + cols.join(',') + ') VALUES ' +
                bkRowSql(table, r, cols)).then(function (g2) { if (g2) ok++; else fail++; });
            });
          });
          return sub;
        });
      });
    });
    return chain.then(function () {
      if (fail) { try { console.warn('[pp] 备份恢复失败行数', table, fail); } catch (e) { } }
      return ok;
    });
  }

  /* 连接中心左上角：显示当前是真卡密还是本地解锁 */
  function injectCardBadge() {
    var route = (location.pathname || '') + (location.hash || '');
    var old = document.getElementById('pp-card-badge');
    if (!/connection/i.test(route)) { if (old) old.remove(); return; }
    var root = document.querySelector('.connection-view');
    if (!root) return;
    var real = rawStored('piupiu_app_vip_key');
    var state = cardStateOf(real);      // real / pending / fake
    var b = old;
    if (!b) {
      b = el('div');
      b.id = 'pp-card-badge';
      if (getComputedStyle(root).position === 'static') root.style.position = 'relative';
      root.appendChild(b);
    }
    var label = state === 'real' ? '真卡密 · 已验证'
      : state === 'pending' ? '卡密待验证…'
        : '假卡密 · 本地解锁';
    var cls = 'pp-card-badge ' + state;
    if (b.className !== cls) {
      b.className = cls;
      b.innerHTML = '<i></i><span>' + label + '</span>';
    }
  }

  /* 进入连接中心时主动校验已保存的卡密，无效就清空（避免显示一条假卡密） */
  var CARD_CHK = { at: 0, busy: false, last: '' };
  function validateCardOnConnection() {
    var path = (location.pathname || '') + (location.hash || '');
    if (!/connection/i.test(path)) return;
    if (CARD_CHK.busy || Date.now() - CARD_CHK.at < 30000) return;
    var key = rawStored('piupiu_app_vip_key');
    if (!key || key === FREE_KEY) return;
    if (key === CARD_CHK.last) return;
    CARD_CHK.busy = true; CARD_CHK.at = Date.now();
    fetch('https://www.piupiuchan.top/check_token.php?key=' + encodeURIComponent(key),
      { cache: 'no-store' })
      .then(function (r) { return r.json(); })
      .then(function (j) {
        var ok = !!(j && (j.status === 'success' || j.valid === true ||
          (j.data && j.data.valid !== false && j.data.status === 'success')));
        CARD_CHK.last = key;
        if (ok) {
          CARD_VERIFY = { key: key, ok: true, at: Date.now() };
          injectCardBadge();
          return;
        }
        CARD_VERIFY = { key: key, ok: false, at: Date.now() };
        try {
          localStorage.removeItem('piupiu_app_vip_key');
          localStorage.removeItem('piupiu_vip_level');
          localStorage.removeItem('piupiu_vip_expiry');
        } catch (e) { }
        toast('卡密已失效，已自动清除');
        injectCardBadge();
        scheduleScan(200);
      })
      .catch(function () { /* 网络失败：保持"待验证"，下次进页面再试 */ })
      .finally(function () { CARD_CHK.busy = false; });
  }

  /* 不把哨兵卡密露在界面上：清掉输入框里的假卡密，换成提示 */
  function hideFakeCardKey() {
    var ins = document.querySelectorAll('input');
    for (var i = 0; i < ins.length; i++) {
      var el = ins[i];
      if (el.value && el.value.indexOf('sk-rBi4') === 0) {
        el.value = '';
        el.placeholder = '本地已解锁 · 需要网络会员请填真卡密';
        el.dispatchEvent(new Event('input', { bubbles: true }));
      }
    }
  }

  /* ============ 模型名全局同步：所有显示当前模型的地方都改成自定义模型 === */
  var PP_PATCHED = [];

  function ppSetText(el, txt) {
    for (var i = 0; i < PP_PATCHED.length; i++) {
      if (PP_PATCHED[i].el === el) { if (el.textContent !== txt) el.textContent = txt; return; }
    }
    PP_PATCHED.push({ el: el, orig: el.textContent });
    el.textContent = txt;
  }

  function restoreModelDisplay() {
    for (var i = 0; i < PP_PATCHED.length; i++) {
      var r = PP_PATCHED[i];
      try { if (r.el && r.el.isConnected) r.el.textContent = r.orig; } catch (e) { }
    }
    PP_PATCHED = [];
  }

  function patchModelDisplay() {
    // 没有自定义模型时直接走还原并返回，不做任何查询
    var m = curModel();
    var aiMode = aiCreateOpen();
    if (!(S.customOn || aiMode) || !m) {
      if (PP_PATCHED.length) restoreModelDisplay();
      return;
    }
    var name = m.name || m.model;
    var cap = document.querySelector('.piupiu-model-capsule');
    if (cap) {
      var sp = cap.querySelector('span');
      if (sp && sp.textContent !== name) ppSetText(sp, name);
    }
    var extra = document.querySelectorAll('.current-model-name');
    for (var i = 0; i < extra.length; i++) {
      var n = extra[i];
      if (n.closest('.model-list') || n.closest('.modal-overlay')) continue;
      if (n.textContent !== name) ppSetText(n, name);
    }
  }

  /* 点官方条目 → 关掉自定义路由 + 还原胶囊文字 + 明确提示 */
  function watchOfficialPick() {
    if (window.__ppWatchPick) return;
    window.__ppWatchPick = true;
    document.addEventListener('click', function (e) {
      var t = e.target;
      if (!t || !t.closest) return;
      var item = t.closest('.model-item');
      if (!item) return;
      if (item.classList.contains('pp-mi')) return;   // 自定义条目走自己的逻辑
      var nmEl = item.querySelector('span');
      var nm = nmEl ? (nmEl.textContent || '').trim() : '';
      var was = S.customOn;
      S.customOn = false;
      saveState();
      restoreModelDisplay();
      setTimeout(function () {
        restoreModelDisplay();
        toast(was ? ('已切换回官方模型' + (nm ? '：' + nm : '')) : ('当前模型：' + (nm || '官方模型')));
      }, 40);
    }, true);
  }



  function GN() { return window.PiuPiuGuard || null; }
  function el(t, c, h) { var d = document.createElement(t); if (c) d.className = c; if (h != null) d.innerHTML = h; return d; }
  function $(s) { return document.querySelector(s); }
  function css(x) { var s = el('style'); s.textContent = x; (document.head || document.documentElement).appendChild(s); }
  function uid() { return Date.now().toString(36) + Math.random().toString(36).slice(2, 6); }
  function toast(m, ms) {
    var t = $('#pp-toast');
    if (!t) { t = el('div'); t.id = 'pp-toast'; document.body.appendChild(t); }
    t.textContent = m; t.style.display = 'block';
    clearTimeout(t.__h); t.__h = setTimeout(function () { t.style.display = 'none'; }, ms || 2200);
  }

  /* --------------------------------------------------- 持久化（双写） */
  function loadState() {
    var raw = null, g = GN();
    try { if (g && g.load) raw = g.load(STORE_KEY); } catch (e) { }
    if (!raw) { try { raw = localStorage.getItem(STORE_KEY); } catch (e) { } }
    try {
      var d = raw ? JSON.parse(raw) : null;
      if (d && d.length) { S.models = d; }
    } catch (e) { }
    var m = null;
    try { m = JSON.parse(localStorage.getItem(STORE_META) || '{}'); } catch (e) { }
    if (typeof m.armor === 'boolean') S.armorOn = m.armor;
    if (typeof m.custom === 'boolean') S.customOn = m.custom;
    if (m.curId) S.curId = m.curId;
    if (m.aiId) S.aiId = m.aiId;
    if (!S.models.length) S.models = [];
  }
  function saveState() {
    var js = JSON.stringify(S.models);
    try { var g = GN(); if (g && g.save) g.save(STORE_KEY, js); } catch (e) { }
    try { localStorage.setItem(STORE_KEY, js); } catch (e) { }
    try {
      localStorage.setItem(STORE_META, JSON.stringify({ armor: S.armorOn, custom: S.customOn, curId: S.curId, aiId: S.aiId }));
    } catch (e) { }
  }
  function curModel() {
    for (var i = 0; i < S.models.length; i++) if (S.models[i].id === S.curId) return S.models[i];
    return null;
  }

  /* ------------------------------------------------------------------ 样式 */
  css([
    '#pp-splash{position:fixed;inset:0;z-index:2147483200;background:linear-gradient(180deg,#fff5f7,#ffe9f0);color:#49353c;display:flex;align-items:center;justify-content:center;padding:24px;transition:opacity .25s;overflow-y:auto}',
    '#pp-splash .card{width:100%;max-width:392px;background:#fff;border-radius:22px;padding:22px 20px 18px;box-shadow:0 18px 50px rgba(233,121,152,.18);text-align:center;margin:auto}',
    '#pp-splash h1{font-size:17px;margin:0 0 12px;color:#c65378;font-weight:800}',
    '#pp-splash p{margin:0 0 9px;color:#7a6570;font-size:13px;text-align:left}',
    '#pp-splash .k{color:#e97998;font-weight:700}',
    '#pp-splash .bar{height:4px;background:#fde8ee;border-radius:99px;overflow:hidden;margin:14px 0 16px}',
    '#pp-splash .bar i{display:block;height:100%;width:0;background:linear-gradient(90deg,#ffb3c9,#e97998);animation:ppbar 2s linear forwards}',
    '@keyframes ppbar{to{width:100%}}',
    '#pp-splash .donate{margin-top:6px;padding-top:14px;border-top:1px dashed #f4dde4}',
    '#pp-splash .donate b{display:block;font-size:13px;color:#c65378;margin-bottom:8px}',
    '#pp-splash .donate img{width:150px;height:150px;border-radius:14px;object-fit:cover;box-shadow:0 6px 18px rgba(233,121,152,.22)}',
    '.pp-x-in{position:absolute;left:10px;top:9px;width:30px;height:30px;border:0;border-radius:50%;background:rgba(0,0,0,.06);color:#8c727b;font-size:19px;line-height:30px;text-align:center;padding:0;z-index:20}',
    '.pp-card{background:#fff;border-radius:16px;padding:16px;margin:12px 0;box-shadow:0 4px 16px rgba(233,121,152,.10);border:1px solid rgba(233,121,152,.10)}',
    '.pp-card h3{margin:0 0 12px;font-size:15px;font-weight:700;color:#49353c;display:flex;align-items:center;gap:8px}',
    '.pp-card h3 .dot{width:6px;height:14px;border-radius:3px;background:linear-gradient(180deg,#ffb3c9,#e97998)}',
    '.pp-row{display:flex;align-items:center;gap:10px;padding:9px 0}',
    '.pp-row .txt{flex:1;min-width:0}',
    '.pp-row .txt b{display:block;font-size:14px;color:#49353c;font-weight:600}',
    '.pp-row .txt span{display:block;font-size:12px;color:#8c727b;margin-top:2px;line-height:1.5}',
    '.pp-switch{width:46px;height:26px;border-radius:99px;background:#eadfe4;position:relative;transition:.2s;flex:0 0 auto}',
    '.pp-switch.on{background:#e97998}',
    '.pp-switch i{position:absolute;top:3px;left:3px;width:20px;height:20px;border-radius:50%;background:#fff;transition:.2s;box-shadow:0 1px 3px rgba(0,0,0,.15)}',
    '.pp-switch.on i{left:23px}',
    '.pp-div{height:1px;background:#f7ecf0;margin:10px 0}',
    '.pp-btn{border:0;border-radius:999px;padding:8px 15px;font-size:12.5px;font-weight:600;background:#fde8ee;color:#c65378}',
    '.pp-btn.main{background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;box-shadow:0 4px 12px rgba(233,121,152,.3)}',
    '.pp-btn.line{background:#fff;border:1px solid #f4d9e2}',
    '.pp-btn:active{transform:scale(.96)}',
    '.pp-tip{font-size:11.5px;color:#a58a94;line-height:1.6;margin-top:6px}',
    '.pp-donate{background:#fff;border-radius:16px;padding:18px 16px 20px;margin:12px 0 24px;text-align:center;box-shadow:0 4px 16px rgba(233,121,152,.10);border:1px solid rgba(233,121,152,.10)}',
    '.pp-donate .t{font-size:14px;font-weight:700;color:#c65378}',
    '.pp-donate .s{font-size:12px;color:#a58a94;margin:4px 0 12px}',
    '.pp-donate img{width:190px;height:190px;border-radius:16px;object-fit:cover;box-shadow:0 8px 22px rgba(233,121,152,.22)}',
    '#pp-toast{position:fixed;left:50%;bottom:96px;transform:translateX(-50%);z-index:2147483300;background:rgba(28,20,24,.92);color:#fff;padding:11px 18px;border-radius:12px;font-size:13.5px;max-width:80vw;display:none}',
    /* 模型管理整页 */
    '#pp-page{position:fixed;inset:0;z-index:2147483150;background:#fff5f7;display:none;flex-direction:column;color:#49353c}',
    '#pp-page.on{display:flex}',
    '#pp-page .hd{display:flex;align-items:center;gap:10px;padding:calc(12px + env(safe-area-inset-top,0px)) 14px 12px;background:#fff;border-bottom:1px solid #f7e6ec}',
    '#pp-page .hd .back{width:34px;height:34px;border-radius:50%;border:0;background:#fde8ee;color:#c65378;font-size:18px;line-height:34px;text-align:center;padding:0}',
    '#pp-page .hd .ttl{flex:1;font-size:16px;font-weight:700}',
    '#pp-page .hd .add{border:0;background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;border-radius:999px;padding:8px 16px;font-size:13px;font-weight:700;box-shadow:0 4px 12px rgba(233,121,152,.3)}',
    '#pp-page .body{flex:1;overflow-y:auto;padding:14px 14px 30px}',
    '.pp-mcard{background:#fff;border-radius:16px;padding:14px;margin-bottom:12px;box-shadow:0 4px 16px rgba(233,121,152,.10);border:1px solid rgba(233,121,152,.10)}',
    '.pp-mcard .top{display:flex;align-items:center;gap:8px}',
    '.pp-mcard .nm{flex:1;min-width:0;font-size:15px;font-weight:700;color:#49353c}',
    '.pp-mcard .nm small{display:block;font-size:11.5px;color:#a58a94;font-weight:400;margin-top:3px;word-break:break-all}',
    '.pp-mcard .tag{font-size:11px;color:#e97998;border:1px solid #ffd3e0;border-radius:999px;padding:2px 8px}',
    '.pp-mcard .ops{display:flex;gap:8px;margin-top:12px}',
    '.pp-mcard .ops button{flex:1}',
    '.pp-empty{text-align:center;color:#a58a94;font-size:13px;padding:40px 10px;line-height:1.9}',
    /* 表单 */
    '.pp-field{margin-bottom:12px}',
    '.pp-field label{display:block;font-size:12.5px;color:#8c727b;margin-bottom:6px;font-weight:600}',
    '.pp-field input{width:100%;box-sizing:border-box;border:1px solid #f4dde4;border-radius:12px;padding:12px 13px;font-size:14px;background:#fff;color:#49353c}',
    '.pp-field input:focus{outline:none;border-color:#f5a9c1;box-shadow:0 0 0 3px rgba(233,121,152,.12)}',
    '.pp-field .hint{font-size:11px;color:#b39aa4;margin-top:5px}',
    /* 测试对话 */
    '#pp-testp{position:fixed;inset:0;z-index:2147483170;background:rgba(28,20,24,.45);display:none;align-items:flex-end}',
    '#pp-testp.on{display:flex}',
    '#pp-testp .sheet{width:100%;max-height:82vh;background:#fff;border-radius:22px 22px 0 0;display:flex;flex-direction:column;overflow:hidden}',
    '#pp-testp .sh{display:flex;align-items:center;padding:16px 16px 10px}',
    '#pp-testp .sh b{flex:1;font-size:15px}',
    '#pp-testp .sh .x{border:0;background:#fde8ee;color:#c65378;border-radius:50%;width:30px;height:30px;font-size:17px;line-height:30px;padding:0}',
    '#pp-testp .msgs{flex:1;overflow-y:auto;padding:6px 16px 12px;min-height:120px}',
    '.pp-msg{max-width:86%;padding:10px 13px;border-radius:14px;font-size:13.5px;line-height:1.65;margin-bottom:10px;white-space:pre-wrap;word-break:break-word}',
    '.pp-msg.me{margin-left:auto;background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;border-bottom-right-radius:5px}',
    '.pp-msg.ai{background:#fff2f6;color:#49353c;border-bottom-left-radius:5px}',
    '.pp-msg.sys{background:#f6f0f2;color:#8c727b;font-size:12px;text-align:center;margin:0 auto 10px;border-radius:8px}',
    '#pp-testp .si{display:flex;gap:8px;padding:10px 14px calc(14px + env(safe-area-inset-bottom,0px));border-top:1px solid #f7e6ec;background:#fff}',
    '#pp-testp .si input{flex:1;border:1px solid #f4dde4;border-radius:999px;padding:11px 15px;font-size:14px;background:#fffafc}',
    '#pp-testp .si button{border:0;border-radius:999px;padding:0 18px;background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;font-weight:700;font-size:13.5px}',
    /* 聊天页破甲悬浮 */
    '.pp-ai-model{margin:12px 16px 0;display:flex;align-items:center;gap:10px;padding:11px 13px;border-radius:16px;background:linear-gradient(135deg,rgba(255,162,187,.13),rgba(233,121,152,.07));border:1px solid rgba(233,121,152,.22)}',
    '.pp-ai-model .ic{width:26px;height:26px;border-radius:50%;background:#fff;color:#e97998;display:flex;align-items:center;justify-content:center;font-size:14px;flex:0 0 auto;box-shadow:0 2px 6px rgba(233,121,152,.18)}',
    '.pp-ai-model .t{flex:1;min-width:0}',
    '.pp-ai-model .t b{display:block;font-size:13.5px;color:var(--text-color,#49353c);font-weight:700;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}',
    '.pp-ai-model .t small{display:block;font-size:11px;color:var(--text-secondary-color,#8c727b);margin-top:2px}',
    '.pp-ai-model .armor{font-size:10px;padding:3px 8px;border-radius:999px;background:#e97998;color:#fff;font-weight:700;flex:0 0 auto}',
    '.pp-ai-model .go{font-size:12px;color:#c65378;font-weight:700;flex:0 0 auto}',
    '#pp-aisheet{position:fixed;inset:0;z-index:2147483190;background:rgba(28,20,24,.45);display:none;align-items:flex-end}',
    '#pp-aisheet.on{display:flex}',
    '#pp-aisheet .sheet{width:100%;max-height:72vh;background:#fff;border-radius:22px 22px 0 0;overflow-y:auto;padding:6px 0 calc(16px + env(safe-area-inset-bottom,0px))}',
    '#pp-aisheet .h{display:flex;align-items:center;padding:14px 18px 8px;font-size:15px;font-weight:700;color:#49353c}',
    '#pp-aisheet .h .x{margin-left:auto;border:0;background:#fde8ee;color:#c65378;border-radius:50%;width:30px;height:30px;font-size:17px;line-height:30px;padding:0}',
    '#pp-aisheet .row{display:flex;align-items:center;gap:10px;padding:14px 18px;border-bottom:1px solid #f8eef2}',
    '#pp-aisheet .row .n{flex:1;min-width:0;font-size:14px;color:#49353c}',
    '#pp-aisheet .row .n small{display:block;font-size:11.5px;color:#a58a94;margin-top:3px;word-break:break-all}',
    '#pp-aisheet .row .ck{color:#e97998;font-weight:700;font-size:12px}',
    '#pp-aisheet .tip{padding:12px 18px;font-size:12px;color:#a58a94;line-height:1.7}',
    '#pp-dnsrow{display:flex;align-items:center;gap:8px;padding:9px 0}',
    '#pp-dnsrow .v{flex:1;min-width:0;font-size:12px;color:#8c727b}',
    '#pp-dnsrow .btn{border:0;border-radius:999px;padding:6px 13px;font-size:12px;font-weight:700;background:#fde8ee;color:#c65378}',
    '#pp-upd{position:fixed;inset:0;z-index:2147483250;background:rgba(28,20,24,.5);display:none;align-items:center;justify-content:center;padding:22px}',
    '#pp-upd.on{display:flex}',
    '#pp-upd .box{width:100%;max-width:360px;background:#fff;border-radius:22px;overflow:hidden;box-shadow:0 24px 60px rgba(0,0,0,.28)}',
    '#pp-upd .hd{padding:20px 20px 6px;font-size:17px;font-weight:800;color:#c65378}',
    '#pp-upd .ver{padding:0 20px;font-size:12.5px;color:#a58a94}',
    '#pp-upd .bd{padding:12px 20px 4px;font-size:13px;line-height:1.75;color:#49353c;max-height:34vh;overflow-y:auto;white-space:pre-wrap;word-break:break-word}',
    '#pp-upd .ft{display:flex;gap:10px;padding:16px 20px 20px}',
    '#pp-upd .ft button{flex:1;border:0;border-radius:999px;padding:12px;font-size:14px;font-weight:700}',
    '#pp-upd .ft .no{background:#fde8ee;color:#c65378}',
    '#pp-upd .ft .yes{background:linear-gradient(135deg,#ffa2bb,#e97998);color:#fff;box-shadow:0 6px 16px rgba(233,121,152,.32)}',
    /* ===== 黑夜模式适配（.dark-mode 由 App 挂在 html/body 上）===== */
    '.dark-mode .pp-card,.dark-mode #pp-splash .card,.dark-mode .pp-donate,.dark-mode .pp-mcard,.dark-mode #pp-upd .box{background:#1a1b21;border-color:rgba(255,255,255,.08);box-shadow:0 4px 18px rgba(0,0,0,.35)}',
    '.dark-mode #pp-splash{background:linear-gradient(180deg,#15161a,#1b1c22)}',
    '.dark-mode #pp-splash h1,.dark-mode .pp-card h3,.dark-mode .pp-mcard .nm,.dark-mode #pp-upd .hd{color:#f78cab}',
    '.dark-mode #pp-splash p,.dark-mode .pp-row .txt b,.dark-mode .pp-field label,.dark-mode #pp-upd .bd{color:rgba(255,255,255,.86)}',
    '.dark-mode #pp-splash .k,.dark-mode .pp-tip,.dark-mode .pp-row .txt span,.dark-mode .pp-mcard .nm small,.dark-mode #pp-upd .ver,.dark-mode #pp-dnsrow .v{color:rgba(255,255,255,.55)}',
    '.dark-mode #pp-splash .bar,.dark-mode .pp-div{background:rgba(255,255,255,.08)}',
    '.dark-mode .pp-field input,.dark-mode .pp-row input,.dark-mode #pp-page input{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1);color:#fff}',
    '.dark-mode .pp-btn{background:rgba(255,143,171,.16);color:#f78cab}',
    '.dark-mode .pp-btn.line{background:transparent;border-color:rgba(255,255,255,.14);color:rgba(255,255,255,.82)}',
    '.dark-mode #pp-page,.dark-mode #pp-panel{background:#15161a}',
    '.dark-mode #pp-page .hd{background:#1a1b21;border-bottom-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-page .hd .ttl{color:#fff}',
    '.dark-mode #pp-aisheet .sheet,.dark-mode #pp-testp .sheet{background:#1a1b21}',
    '.dark-mode #pp-aisheet .h,.dark-mode #pp-testp .sh b{color:#fff}',
    '.dark-mode #pp-aisheet .row{border-bottom-color:rgba(255,255,255,.07)}',
    '.dark-mode #pp-aisheet .row .n{color:rgba(255,255,255,.88)}',
    '.dark-mode .pp-msg.ai{background:rgba(255,255,255,.06);color:rgba(255,255,255,.88)}',
    '.dark-mode .pp-msg.sys{background:rgba(255,255,255,.04);color:rgba(255,255,255,.5)}',
    '.dark-mode #pp-testp .si{background:#1a1b21;border-top-color:rgba(255,255,255,.08)}',
    '.dark-mode #pp-testp .si input{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1);color:#fff}',
    '.dark-mode .pp-empty{color:rgba(255,255,255,.45)}',
    '.dark-mode .pp-ai-model{background:linear-gradient(135deg,rgba(255,143,171,.14),rgba(255,143,171,.06));border-color:rgba(255,143,171,.28)}',
    '.dark-mode .pp-ai-model .t b{color:#fff}',
    '.dark-mode .pp-ai-model .ic{background:rgba(255,255,255,.1);color:#f78cab}',
    '.pp-login-item .setting-label{color:#e97998!important}',
    '#pp-card-badge{position:absolute;top:calc(10px + env(safe-area-inset-top,0px));left:12px;z-index:6;display:inline-flex;align-items:center;gap:6px;padding:5px 10px;border-radius:999px;font-size:11.5px;font-weight:700;line-height:1;white-space:nowrap;box-shadow:0 2px 8px rgba(0,0,0,.08)}',
    '#pp-card-badge i{width:6px;height:6px;border-radius:50%;flex:0 0 auto}',
    '#pp-card-badge.real{background:rgba(22,163,74,.12);color:#16a34a;border:1px solid rgba(22,163,74,.25)}',
    '#pp-card-badge.real i{background:#16a34a;box-shadow:0 0 0 3px rgba(22,163,74,.15)}',
    '#pp-card-badge.pending{background:rgba(120,120,128,.12);color:#6b7280;border:1px solid rgba(120,120,128,.28)}',
    '#pp-card-badge.pending i{background:#9ca3af;box-shadow:0 0 0 3px rgba(120,120,128,.16)}',
    '.dark-mode #pp-card-badge.pending{background:rgba(255,255,255,.08);color:rgba(255,255,255,.6);border-color:rgba(255,255,255,.16)}',
    '.dark-mode #pp-card-badge.pending i{background:rgba(255,255,255,.5)}',
    '#pp-card-badge.fake{background:rgba(233,121,152,.13);color:#c65378;border:1px solid rgba(233,121,152,.3)}',
    '#pp-card-badge.fake i{background:#e97998;box-shadow:0 0 0 3px rgba(233,121,152,.18)}',
    '.dark-mode #pp-card-badge.real{background:rgba(34,197,94,.14);color:#4ade80;border-color:rgba(34,197,94,.3)}',
    '.dark-mode #pp-card-badge.real i{background:#4ade80}',
    '.dark-mode #pp-card-badge.fake{background:rgba(255,143,171,.14);color:#f78cab;border-color:rgba(255,143,171,.32)}',
    '.dark-mode #pp-card-badge.fake i{background:#f78cab}',
    '#pp-backup-card h3 b{font-weight:800}',
    '#pp-bkdlg{position:fixed;inset:0;z-index:2147483270;background:rgba(28,20,24,.5);display:none;align-items:center;justify-content:center;padding:22px}',
    '#pp-bkdlg.on{display:flex}',
    '#pp-bkdlg .box{width:100%;max-width:360px;background:#fff;border-radius:22px;overflow:hidden;box-shadow:0 24px 60px rgba(0,0,0,.28)}',
    '#pp-bkdlg .hd{display:flex;align-items:center;padding:18px 20px 6px;font-size:17px;font-weight:800;color:#c65378}',
    '#pp-bkdlg .hd .x{margin-left:auto;border:0;background:#fde8ee;color:#c65378;border-radius:50%;width:28px;height:28px;font-size:16px;line-height:28px;padding:0}',
    '#pp-bkdlg .bd{padding:6px 20px 20px}',
    '#pp-bkdlg .tip{font-size:12.5px;color:#8c727b;line-height:1.8;margin-top:8px}',
    '#pp-bkdlg .row2{display:flex;gap:10px;margin-top:16px}',
    '#pp-bkdlg .row2 button{flex:1}',
    '.dark-mode #pp-bkdlg .box{background:#1a1b21}',
    '.dark-mode #pp-bkdlg .hd{color:#f78cab}',
    '.dark-mode #pp-bkdlg .tip{color:rgba(255,255,255,.55)}',
    '.dark-mode #pp-backup-card{background:#1a1b21}',
    '#pp-loginsheet{position:fixed;inset:0;z-index:2147483260;background:rgba(28,20,24,.5);display:none;align-items:center;justify-content:center;padding:22px}',
    '#pp-loginsheet.on{display:flex}',
    '#pp-loginsheet .box{width:100%;max-width:360px;background:#fff;border-radius:22px;overflow:hidden;box-shadow:0 24px 60px rgba(0,0,0,.28)}',
    '#pp-loginsheet .hd{display:flex;align-items:center;padding:18px 20px 6px;font-size:17px;font-weight:800;color:#c65378}',
    '#pp-loginsheet .hd .x{margin-left:auto;border:0;background:#fde8ee;color:#c65378;border-radius:50%;width:28px;height:28px;font-size:16px;line-height:28px;padding:0}',
    '#pp-loginsheet .bd{padding:6px 20px 20px}',
    '#pp-loginsheet label{display:block;font-size:12.5px;color:#8c727b;margin:12px 0 6px}',
    '#pp-loginsheet input{width:100%;box-sizing:border-box;border:1px solid #f0dde4;background:#fdf7f9;border-radius:12px;padding:12px 13px;font-size:14px;color:#49353c;outline:none}',
    '#pp-loginsheet .err{min-height:16px;font-size:12px;color:#d9534f;margin-top:8px}',
    '#pp-loginsheet .tip{font-size:11.5px;color:#a58a94;line-height:1.7;margin-top:10px}',
    '.dark-mode #pp-loginsheet .box{background:#1a1b21}',
    '.dark-mode #pp-loginsheet .hd{color:#f78cab}',
    '.dark-mode #pp-loginsheet label{color:rgba(255,255,255,.55)}',
    '.dark-mode #pp-loginsheet input{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1);color:#fff}',
    '.dark-mode #pp-loginsheet .tip{color:rgba(255,255,255,.45)}',
    '#pp-loginsheet .cp-img{position:relative;margin-top:6px;border-radius:12px;overflow:hidden;background:#f6f7fb}',
    '#pp-loginsheet .cp-img img{display:block;width:100%;height:auto}',
    '#pp-loginsheet .cp-img i{position:absolute;top:0;bottom:0;width:2px;background:#e97998;box-shadow:0 0 6px rgba(233,121,152,.9);left:0}',
    '#pp-loginsheet .cp-track{position:relative;height:44px;margin-top:12px;border-radius:999px;background:#fdf2f6;border:1px solid #f0dde4}',
    '#pp-loginsheet .cp-fill{position:absolute;left:0;top:0;bottom:0;width:0;border-radius:999px;background:rgba(233,121,152,.22)}',
    '#pp-loginsheet .cp-knob{position:absolute;left:0;top:-3px;width:50px;height:48px;border-radius:14px;background:linear-gradient(135deg,#ffa2bb,#e97998);box-shadow:0 4px 12px rgba(233,121,152,.4);touch-action:none}',
    '#pp-loginsheet .cp-hint{position:absolute;left:0;right:0;top:13px;text-align:center;font-size:12px;color:#b08a99;pointer-events:none}',
    '.dark-mode #pp-loginsheet .cp-track{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1)}',
    '.dark-mode #pp-loginsheet .cp-hint{color:rgba(255,255,255,.45)}',


    '.dark-mode .pp-login-item{background:rgba(255,143,171,.10);border-color:rgba(255,143,171,.18)}',
    '.dark-mode .pp-login-item .setting-label{color:#f78cab!important}',
    '.dark-mode .pp-login-item .setting-hint{color:rgba(255,255,255,.55)}',
    '.pp-hidden{display:none!important}',
    '.logout-item{display:none!important}',
    'html.pp-logged-in .logout-item{display:flex!important}',
    '#pp-login-item{display:none!important}',
    'html.pp-logged-out #pp-login-item{display:flex!important}',


    '.pp-font,#pp-splash,#pp-page,#pp-testp,#pp-toast,.pp-card,.pp-mcard,.pp-field,.pp-btn,.pp-tip,#pp-page .body,#pp-testp .sheet{font-family:"ZCOOL KuaiLe",Inter,-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,sans-serif}',
  ].join('\n'));

  /* ------------------------------------------------------- 1. 免责声明 */
  function splash() {
    var d = el('div');
    d.id = 'pp-splash';
    d.innerHTML = '<div class="card"><h1>免责声明</h1>' +
      '<p>本软件<span class="k">仅供学习交流与技术研究</span>使用，不提供任何形式的商业服务。</p>' +
      '<p>请在下载后 <span class="k">24 小时内自行删除</span>，禁止用于商业用途、二次分发或违法违规活动。</p>' +
      '<p>软件按「现状」提供，不附带任何担保；使用过程中产生的一切后果由使用者自行承担。</p>' +
      '<div class="bar"><i></i></div>' +
      '<div class="donate"><b>求求各位施舍一点</b><img src="' + DONATE + '" alt="赞赏码"></div></div>';
    (document.body || document.documentElement).appendChild(d);
    setTimeout(function () { d.style.opacity = '0'; setTimeout(function () { d.remove(); }, 260); }, 2000);
    // 兜底：无论后面发生什么，6 秒后一定把启动层收掉，绝不让它挡住界面
    setTimeout(function () { try { d.remove(); } catch (e) { } }, 6000);
  }

  /* --------------------------------------------- 2. 登录弹窗内 × */
  function hasModalish() {
    // 便宜的一次 querySelector：没有弹窗类节点就完全跳过扫描
    return !!(document.querySelector('.modal-overlay') ||
      document.querySelector('[class*="modal"]') ||
      document.querySelector('input[type="password"]'));
  }

  function findAuthCard() {
    if (!hasModalish()) return null;
    var nodes = document.querySelectorAll('input,div,section,form');
    var best = null, bestZ = -1;
    for (var i = 0; i < nodes.length; i++) {
      var n = nodes[i], strong = false;
      if (n.tagName === 'INPUT') strong = (n.type || '').toLowerCase() === 'password';
      else {
        var t = n.textContent || '';
        if (t.length > 3000) continue;
        strong = t.indexOf('忘记密码') >= 0 || t.indexOf('注册账号') >= 0 || t.indexOf('找回密码') >= 0;
      }
      if (!strong) continue;
      var p = n, layer = null, guard = 0;
      while (p && p !== document.body && guard++ < 14) {
        var st = getComputedStyle(p);
        if (st.position === 'fixed' || st.position === 'absolute') {
          var z = parseInt(st.zIndex, 10); if (isNaN(z)) z = 0;
          if (parseFloat(st.opacity || '1') > 0.1 && z > bestZ) { bestZ = z; layer = p; }
          break;
        }
        p = p.parentElement;
      }
      if (!layer) continue;
      var card = null;
      for (var c = 0; c < layer.children.length; c++) {
        var ch = layer.children[c];
        if (ch.offsetHeight > 80 && getComputedStyle(ch).display !== 'none') { card = ch; break; }
      }
      best = card || layer;
    }
    return best;
  }
  var UPD_KW = ['发现新版本', '有可用更新', '版本更新', '立即更新', '更新内容', '新版本已发布'];

  function findUpdateCard() {
    if (!hasModalish()) return null;
    var nodes = document.querySelectorAll('div,section');
    var best = null, bestZ = -1;
    for (var i = 0; i < nodes.length; i++) {
      var n = nodes[i];
      if (n.closest && n.closest('#pp-upd')) continue;   // 跳过我们自己的更新弹窗
      var t = n.textContent || '';
      if (t.length > 1600) continue;
      var hit = 0;
      for (var k = 0; k < UPD_KW.length; k++) if (t.indexOf(UPD_KW[k]) >= 0) hit++;
      if (hit < 1) continue;
      var p = n, layer = null, guard = 0;
      while (p && p !== document.body && guard++ < 14) {
        var st = getComputedStyle(p);
        if (st.position === 'fixed' || st.position === 'absolute') {
          var z = parseInt(st.zIndex, 10); if (isNaN(z)) z = 0;
          if (parseFloat(st.opacity || '1') > 0.1 && z > bestZ) { bestZ = z; layer = p; }
          break;
        }
        p = p.parentElement;
      }
      if (!layer) continue;
      var card = null;
      for (var c = 0; c < layer.children.length; c++) {
        var ch = layer.children[c];
        if (ch.offsetHeight > 80 && getComputedStyle(ch).display !== 'none') { card = ch; break; }
      }
      best = card || layer;
    }
    return best;
  }

  function attachCardClose(card) {
    if (!card || card.querySelector('.pp-x-in')) return;
    // 自己画的面板已经有 × 了，不要再挂一个
    if (card.closest && (card.closest('#pp-loginsheet') || card.closest('#pp-testp') ||
        card.closest('#pp-page') || card.closest('#pp-upd') || card.closest('#pp-aisheet'))) return;
    if (getComputedStyle(card).position === 'static') card.style.position = 'relative';
    var b = el('button', 'pp-x-in', '&times;');
    b.setAttribute('aria-label', '关闭');
    b.onclick = function (e) {
      e.preventDefault(); e.stopPropagation(); e.stopImmediatePropagation();
      var layer = card, p = card.parentElement, guard = 0;
      while (p && p !== document.body && guard++ < 6) {
        var st = getComputedStyle(p);
        if (st.position === 'fixed' || (st.position === 'absolute' && parseInt(st.zIndex || '0', 10) > 100)) { layer = p; break; }
        p = p.parentElement;
      }
      layer.style.setProperty('display', 'none', 'important');
      document.documentElement.style.overflow = '';
      document.body.style.overflow = '';
      toast('已关闭');
    };
    card.appendChild(b);
  }

  function attachAuthClose() {
    attachCardClose(findAuthCard());     // 登录 / 注册 / 忘记密码
    attachCardClose(findUpdateCard());   // 官方自动更新窗口
  }

  /* ============================ 3. 我的模型（独立整页） ==================== */
  function pageEl() {
    var p = $('#pp-page');
    if (p) return p;
    p = el('div');
    p.id = 'pp-page';
    p.innerHTML =
      '<div class="hd"><button class="back" id="pp-back">&lsaquo;</button>' +
      '<div class="ttl" id="pp-ttl">我的模型</div>' +
      '<button class="add" id="pp-new">新增</button></div>' +
      '<div class="body" id="pp-body"></div>';
    document.body.appendChild(p);
    p.querySelector('#pp-back').onclick = closePage;
    p.querySelector('#pp-new').onclick = function () { renderForm(null); };
    return p;
  }

  function openPage() {
    var p = pageEl();
    p.classList.add('on');
    renderList();
  }
  function closePage() {
    var p = $('#pp-page');
    if (p) p.classList.remove('on');
  }

  function renderList() {
    var body = $('#pp-body');
    if (!body) return;
    $('#pp-ttl').textContent = '我的模型';
    var h = '';
    if (!S.models.length) {
      h += '<div class="pp-empty">还没有自定义模型<br>点右上角「新增」添加一个<br><span style="font-size:11.5px">支持 OpenAI / DeepSeek / 通义 / Kimi / 任意 OpenAI 兼容接口</span></div>';
      body.innerHTML = h;
      return;
    }
    h += '<div class="pp-tip" style="margin:0 2px 10px">共 ' + S.models.length + ' 个模型，点「使用」切换聊天用的模型</div>';
    S.models.forEach(function (m) {
      var isCur = m.id === S.curId;
      h += '<div class="pp-mcard" data-id="' + m.id + '">' +
        '<div class="top"><div class="nm">' + esc(m.name || m.model) +
        (isCur && S.customOn ? '<span class="tag" style="margin-left:6px">使用中</span>' : '') +
        '<small>' + esc(m.model) + ' · ' + esc(shortUrl(m.base)) + '</small></div></div>' +
        '<div class="ops">' +
        '<button class="pp-btn main" data-act="use">使用</button>' +
        '<button class="pp-btn line" data-act="test">测试对话</button>' +
        '<button class="pp-btn line" data-act="edit">编辑</button>' +
        '<button class="pp-btn line" data-act="del">删除</button>' +
        '</div></div>';
    });
    h += '<div style="text-align:center;margin:18px 0 8px"><button class="pp-btn line" id="pp-add2">+ 新增模型</button></div>';
    body.innerHTML = h;
    body.querySelector('#pp-add2').onclick = function () { renderForm(null); };
    body.querySelectorAll('.pp-mcard').forEach(function (card) {
      var id = card.getAttribute('data-id');
      var m = S.models.filter(function (x) { return x.id === id; })[0];
      if (!m) return;
      card.querySelectorAll('[data-act]').forEach(function (b) {
        b.onclick = function () {
          var a = b.getAttribute('data-act');
          if (a === 'use') { S.curId = id; S.customOn = true; saveState(); renderList(); toast('已使用：' + (m.name || m.model)); }
          if (a === 'test') openTest(m);
          if (a === 'edit') renderForm(m);
          if (a === 'del') {
            S.models = S.models.filter(function (x) { return x.id !== id; });
            if (S.curId === id) S.curId = S.models.length ? S.models[0].id : 0;
            saveState(); renderList(); toast('已删除');
          }
        };
      });
    });
  }

  function renderForm(m) {
    var body = $('#pp-body');
    $('#pp-ttl').textContent = m ? '编辑模型' : '新增模型';
    body.innerHTML =
      '<div class="pp-card" style="margin-top:0">' +
      '<div class="pp-field"><label>显示名称</label><input id="f-name" placeholder="例如 我的 GPT-4o" value="' + esc(m ? m.name : '') + '"></div>' +
      '<div class="pp-field"><label>Base URL</label><input id="f-base" placeholder="https://api.openai.com/v1" value="' + esc(m ? m.base : '') + '">' +
      '<div class="hint">只填到 /v1 这一级，会自动补 /chat/completions</div></div>' +
      '<div class="pp-field"><label>API Key</label><input id="f-key" placeholder="sk-..." autocomplete="off" value="' + esc(m ? m.key : '') + '">' +
      '<div class="hint">用 AndroidKeyStore 加密保存，不上传任何服务器</div></div>' +
      '<div class="pp-field"><label>模型名</label><input id="f-model" placeholder="gpt-4o-mini / deepseek-chat / qwen-plus" value="' + esc(m ? m.model : '') + '"></div>' +
      '<div class="pp-field"><label>是否启用破甲</label>' +
      '<div class="pp-row" style="padding:0"><div class="txt"><b>该模型默认走破甲</b><span>仅对 DeepSeek 系模型有效</span></div>' +
      '<div class="pp-switch' + ((m ? m.armor : S.armorOn) ? ' on' : '') + '" id="f-armor"><i></i></div></div></div>' +
      '<div style="display:flex;gap:10px;margin-top:18px">' +
      '<button class="pp-btn line" id="f-cancel" style="flex:1;padding:12px">取消</button>' +
      '<button class="pp-btn main" id="f-save" style="flex:2;padding:12px">保存</button></div>' +
      '</div>' +
      '<div style="text-align:center"><button class="pp-btn line" id="f-testnow">先测试一下连通性</button></div>';
    var armor = !!(m ? m.armor : S.armorOn);
    body.querySelector('#f-armor').onclick = function () { armor = !armor; this.classList.toggle('on', armor); };
    body.querySelector('#f-cancel').onclick = renderList;
    body.querySelector('#f-testnow').onclick = function () {
      openTest({
        base: body.querySelector('#f-base').value.trim(),
        key: body.querySelector('#f-key').value.trim(),
        model: body.querySelector('#f-model').value.trim(),
        name: body.querySelector('#f-name').value.trim(),
        armor: armor
      });
    };
    body.querySelector('#f-save').onclick = function () {
      var n = body.querySelector('#f-name').value.trim(),
        b = body.querySelector('#f-base').value.trim(),
        k = body.querySelector('#f-key').value.trim(),
        mo = body.querySelector('#f-model').value.trim();
      if (!b || !k || !mo) return toast('Base URL / API Key / 模型名 都要填');
      if (!/^https?:\/\//i.test(b)) return toast('Base URL 要以 http(s):// 开头');
      if (m) {
        m.name = n || mo; m.base = b.replace(/\/+$/, ''); m.key = k; m.model = mo; m.armor = armor;
      } else {
        var obj = { id: uid(), name: n || mo, base: b.replace(/\/+$/, ''), key: k, model: mo, armor: armor };
        S.models.push(obj);
        if (!S.curId) { S.curId = obj.id; S.customOn = true; }
      }
      saveState();
      renderList();
      toast('已保存');
    };
  }

  /* ------------------------------- 测试对话（底部抽屉，真发请求） --------- */
  function testPanel() {
    var p = $('#pp-testp');
    if (p) return p;
    p = el('div');
    p.id = 'pp-testp';
    p.innerHTML = '<div class="sheet"><div class="sh"><b id="pp-test-ttl">测试对话</b>' +
      '<button class="x" id="pp-test-x">&times;</button></div>' +
      '<div class="msgs" id="pp-test-msgs"></div>' +
      '<div class="si"><input id="pp-test-in" placeholder="说点什么试试…"><button id="pp-test-send">发送</button></div></div>';
    document.body.appendChild(p);
    p.querySelector('#pp-test-x').onclick = function () { p.classList.remove('on'); };
    p.onclick = function (e) { if (e.target === p) p.classList.remove('on'); };
    return p;
  }

  var testCtx = null;

  function openTest(m) {
    if (!m.base || !m.key || !m.model) return toast('先把 Base URL / Key / 模型名填好');
    testCtx = { m: m, history: [] };
    var p = testPanel();
    p.classList.add('on');
    p.querySelector('#pp-test-ttl').textContent = '测试对话 · ' + (m.name || m.model);
    var msgs = p.querySelector('#pp-test-msgs');
    msgs.innerHTML = '';
    addMsg('sys', '正在连接 ' + shortUrl(m.base) + ' …');
    p.querySelector('#pp-test-in').value = '';
    p.querySelector('#pp-test-send').onclick = function () { sendTest(); };
    p.querySelector('#pp-test-in').onkeydown = function (e) { if (e.key === 'Enter') sendTest(); };
  }

  function addMsg(kind, text) {
    var box = $('#pp-test-msgs');
    if (!box) return null;
    var d = el('div', 'pp-msg ' + kind, esc(text));
    box.appendChild(d);
    box.scrollTop = box.scrollHeight;
    return d;
  }

  function sendTest() {
    if (!testCtx) return;
    var inp = $('#pp-test-in');
    var q = (inp.value || '').trim();
    if (!q) return;
    inp.value = '';
    addMsg('me', q);
    var tip = addMsg('sys', '思考中…');
    var m = testCtx.m;
    var msgs = [];
    if (m.armor) {
      var ap = (GN() && GN().armorPrompt && GN().armorPrompt()) || '';
      if (ap) msgs.push({ role: 'system', content: ap });
    }
    msgs = msgs.concat(testCtx.history).concat([{ role: 'user', content: q }]);
    var body = { model: m.model, messages: msgs, stream: false };
    send(m.base, m.key, body).then(function (txt) {
      if (tip) tip.remove();
      addMsg('ai', txt || '(空回复)');
      testCtx.history.push({ role: 'user', content: q }, { role: 'assistant', content: txt || '' });
    }).catch(function (e) {
      if (tip) tip.remove();
      addMsg('sys', '失败：' + (e && e.message ? e.message : e));
    });
  }

  function send(base, key, body) {
    return fetch(cuEndpoint(base), {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: 'Bearer ' + key, 'X-PP-Test': '1' },
      body: JSON.stringify(body)
    }).then(function (r) {
      return r.text().then(function (t) {
        if (!r.ok) throw new Error('HTTP ' + r.status + ' ' + t.slice(0, 180));
        try {
          var d = JSON.parse(t);
          var msg = ((d.choices || [])[0] || {}).message || {};
          return ppCleanContent(msg.content || '');
        } catch (e) { return t.slice(0, 400); }
      });
    });
  }

  /* --------------------------- 4. 设置页：扩展功能卡 + 赞赏卡 --------------- */
  function findByText(txt) {
    var all = document.querySelectorAll('div,span,h1,h2,h3,p');
    for (var i = 0; i < all.length; i++) {
      var n = all[i];
      if (n.children.length > 2) continue;
      var t = (n.textContent || '').trim();
      if (t === txt || (t.indexOf(txt) === 0 && t.length <= 60)) return n;
    }
    return null;
  }
  function cardOf(node) {
    var p = node, guard = 0;
    while (p && p !== document.body && guard++ < 6) {
      if (/card|item|row|group/i.test((p.className || '') + '') && p.offsetHeight > 50) return p;
      p = p.parentElement;
    }
    return node.parentElement;
  }

  function moduleCard() {
    var box = el('div', 'pp-card');
    box.id = 'pp-module-card';
    var cur = curModel();
    box.innerHTML =
      '<h3><i class="dot"></i>扩展功能</h3>' +
      '<div class="pp-row"><div class="txt"><b>破甲引擎</b><span>注入 DeepSeek 破甲提示词，遇拒答自动升温重试</span></div>' +
      '<div class="pp-switch' + (S.armorOn ? ' on' : '') + '" id="pp-armor"><i></i></div></div>' +
      '<div class="pp-div"></div>' +
      '<div class="pp-row"><div class="txt"><b>会员状态</b><span>已解锁 SSVIP · 永不过期（本地判定；仅联网类特权仍由服务器决定）</span></div></div>' +
      '<div class="pp-row"><div class="txt"><b>永久记忆</b><span>本地向量库（gte-small + FTS），不依赖账号与 VIP</span></div></div>' +
      '<div class="pp-div"></div>' +
      '<div class="pp-row"><div class="txt"><b>自定义模型</b><span>' +
      (S.customOn && cur ? ('当前：' + esc(cur.name || cur.model)) : (S.models.length ? '已添加 ' + S.models.length + ' 个模型，未启用' : '还没有添加模型')) +
      '</span></div><div class="pp-switch' + (S.customOn ? ' on' : '') + '" id="pp-custom"><i></i></div></div>' +
      '<div class="pp-row" style="justify-content:flex-end;padding-top:12px">' +
      '<button class="pp-btn main" id="pp-manage">管理我的模型（' + S.models.length + '）</button></div>' +
      '<div class="pp-div"></div>' +
      '<div id="pp-dnsrow"><div class="v">DNS 线路：<span id="pp-dns-val">' + dnsLabel() + '</span></div>' +
      '<button class="btn" id="pp-dnstest">测速</button></div>' +
      '<div class="pp-row" style="justify-content:flex-end;padding-top:4px">' +
      '<button class="pp-btn line" id="pp-checkupd">检查更新（v' + APP_VER + '）</button></div>';
    box.querySelector('#pp-armor').onclick = function () {
      S.armorOn = !S.armorOn; saveState(); this.classList.toggle('on', S.armorOn);
      toast(S.armorOn ? '破甲已开启' : '破甲已关闭');
    };
    box.querySelector('#pp-custom').onclick = function () {
      S.customOn = !S.customOn; saveState(); this.classList.toggle('on', S.customOn);
      toast(S.customOn ? '已启用自定义模型' : '已切回内置模型');
    };
    syncVerLabels();
    box.querySelector('#pp-manage').onclick = openPage;
    box.querySelector('#pp-dnstest').onclick = function () {
      DNS.closed = {}; DNS.at = 0;
      toast('正在测速所有 DNS…');
      dnsRace().then(function (w) {
        toast(w ? ('最快：' + w.name + ' ' + w.ms + 'ms，其余已关闭') : '全部 DNS 不可用');
      });
    };
    box.querySelector('#pp-checkupd').onclick = function () { loadVersionJson().then(function () { checkUpdate(true); }); };
    // 备份区块（放在扩展功能卡内部最下方）
    try { box.appendChild(backupCard()); } catch (e) { }
    return box;
  }

  function donateCard() {
    var d = el('div', 'pp-donate');
    d.id = 'pp-donate-card';
    d.innerHTML = '<div class="t">求求各位施舍一点</div><div class="s">如果这个版本帮到你，请我喝杯奶茶 🧋</div>' +
      '<img src="' + DONATE + '" alt="赞赏码"></div>';
    return d;
  }

  function placeCard(host, after) {
    // 绝不能把卡片塞进 <button> 里
    if (host && host.tagName === 'BUTTON') host = host.parentElement;
    var old = document.getElementById('pp-module-card');
    if (old) old.remove();
    var card = moduleCard();
    if (!host) return card;
    if (after && after.parentNode === host) {
      if (after.nextSibling) host.insertBefore(card, after.nextSibling);
      else host.appendChild(card);
    } else if (after && after.parentElement) {
      var p = after.parentElement;
      if (after.nextSibling) p.insertBefore(card, after.nextSibling);
      else p.appendChild(card);
    } else {
      host.appendChild(card);
    }
    return card;
  }

  /** 从文本节点向上找到真正可点的「退出登录」按钮块（button / role=button / 含 btn 类名） */
  function logoutButtonFrom(node) {
    var el0 = node, guard = 0;
    while (el0 && el0 !== document.body && guard++ < 6) {
      var tag = (el0.tagName || '').toUpperCase();
      var cls = (el0.className || '') + '';
      var role = el0.getAttribute ? (el0.getAttribute('role') || '') : '';
      if (tag === 'BUTTON' || role === 'button' || /btn|button|logout|danger/i.test(cls)) return el0;
      el0 = el0.parentElement;
    }
    return null;
  }

  function injectSettings() {
    // 已经放好就直接返回，不再做全页 DOM 扫描（聊天卡顿的主因）
    var existing = document.getElementById('pp-module-card');
    if (existing && existing.isConnected) {
      // 自愈：万一被塞进了 button 或别的怪位置，拆掉重放
      if (existing.closest && existing.closest('button')) {
        existing.remove();
      } else {
        if (!document.getElementById('pp-donate-card')) existing.parentNode.appendChild(donateCard());
        return;
      }
    }

    // ① 首选：个人设置面板内部 —— 退出登录按钮「下面」、赞赏码「上面」
    var logoutText = findByText('退出登录');
    if (logoutText) {
      var btn = logoutButtonFrom(logoutText) || logoutText;
      var host = btn.parentElement;
      // 往上再找一层容器，确保能把卡片和赞赏码都放在同一个滚动列里
      if (host && host !== document.body && host.children.length <= 1 && host.parentElement &&
          host.parentElement !== document.body) {
        host = host.parentElement;
      }
      if (host && host !== document.body && host.tagName !== 'BUTTON') {
        placeCard(host, btn);
        var dn = document.getElementById('pp-donate-card');
        if (dn) dn.remove();
        host.appendChild(donateCard());
        return;
      }
    }

    // ② 兜底：设置列表里插在「个人设置」卡片前面
    //    先做一次廉价判断，不在设置页就完全不扫
    var hash = (location.hash || '') + (location.pathname || '');
    if (!/setting|settings|我的|个人/i.test(hash) && !document.querySelector('[class*="settings"]')) return;
    var anchor = findByText('个人设置') || findByText('通用设置') || findByText('聊天体验');
    if (!anchor) return;
    var card = cardOf(anchor), holder = card && card.parentElement;
    if (!holder) return;
    placeCard(holder, null);
    if (!document.getElementById('pp-donate-card')) holder.appendChild(donateCard());
  }

  /* ----------- 5. 聊天页：模型选择器内嵌自定义模型 + 输入框破甲开关 -------- */

  /* 5.1 把自定义模型塞进官方「选择模型」弹层（克隆原生 .model-item，样式完全一致） */
  function injectPickerModels() {
    var list = document.querySelector('.model-list');
    if (!list) return;
    var sample = list.querySelector('.model-item.active') || list.querySelector('.model-item');
    if (!sample) return;
    var sig = S.models.map(function (m) { return m.id + ':' + (m.name || '') + ':' + m.model; }).join('|') + '#' + S.curId + '#' + S.customOn;
    if (list.__ppSig === sig && list.querySelectorAll('.pp-mi').length === S.models.length) return;
    list.__ppSig = sig;

    list.querySelectorAll('.pp-mi').forEach(function (n) { n.remove(); });
    if (!S.models.length) return;

    S.models.slice().reverse().forEach(function (m) {
      var it = sample.cloneNode(true);
      it.classList.add('pp-mi');
      it.classList.remove('active', 'vip-style', 'svip-style', 'ssvip-style');
      it.setAttribute('data-v-3bc3c349', '');
      // 名称 / 描述 / 徽标
      var badge = it.querySelector('.tier-badge');
      if (badge) {
        badge.className = 'tier-badge';
        badge.textContent = '自定义';
      }
      var spans = it.querySelectorAll('span');
      var host = String(m.base || '').replace(/^https?:\/\//, '').replace(/\/.*$/, '');
      if (spans.length >= 2) {
        spans[0].textContent = m.name || m.model;
        spans[spans.length - 1].textContent = m.model + ' · ' + host;
      } else {
        it.textContent = m.name || m.model;
      }
      // 选择器内部保持与官方完全一致：不带选中态、不带勾
      var chk = it.querySelector('.check-mark');
      if (chk) chk.remove();
      it.addEventListener('click', function (e) {
        e.preventDefault(); e.stopPropagation();
        S.curId = m.id; S.customOn = true; saveState();
        list.__ppSig = null;
        var ov = list.closest('.modal-overlay');
        if (ov) ov.dispatchEvent(new MouseEvent('click', { bubbles: true, cancelable: true }));
        restoreModelDisplay();
        patchModelDisplay();
        injectAiBar();
        setTimeout(patchModelDisplay, 60);
        setTimeout(patchModelDisplay, 300);
        toast('已切换模型：' + (m.name || m.model));
      }, true);
      list.insertBefore(it, list.firstChild);
    });
  }

  /* 5.2 输入框里的小破甲开关（贴着发送区域，不挡内容） */
  function injectComposerArmor() {
    if (!document.querySelector('.piupiu-chat-input-wrapper')) return;
    var wrap = document.querySelector('.piupiu-chat-input-wrapper');
    if (!wrap) return;
    var btn = wrap.querySelector('.pp-armor-chip');
    if (!btn) {
      btn = el('button', 'pp-armor-chip', '破甲');
      btn.type = 'button';
      btn.setAttribute('aria-label', '切换破甲');
      btn.onclick = function (e) {
        e.preventDefault(); e.stopPropagation();
        S.armorOn = !S.armorOn; saveState(); paintChip(btn);
        toast(S.armorOn ? '破甲已开启' : '破甲已关闭');
      };
      var ta = wrap.querySelector('textarea');
      if (ta && ta.parentNode === wrap) wrap.insertBefore(btn, ta);
      else wrap.insertBefore(btn, wrap.firstChild);
    }
    paintChip(btn);
  }
  function paintChip(b) {
    if (!b) return;
    // 状态没变就不碰 style，避免每次点击都触发一次样式重算
    if (b.__ppState === (S.armorOn ? 'on' : 'off')) return;
    b.__ppState = S.armorOn ? 'on' : 'off';
    b.style.cssText = [
      'flex:0 0 auto', 'align-self:flex-end', 'margin:0 8px 6px 0', 'height:28px', 'padding:0 11px',
      'border-radius:999px', 'font-size:12px', 'font-weight:700', 'line-height:26px',
      'border:1px solid ' + (S.armorOn ? 'transparent' : 'rgba(233,121,152,.45)'),
      'background:' + (S.armorOn ? 'var(--primary-color,#e97998)' : 'rgba(233,121,152,.08)'),
      'color:' + (S.armorOn ? '#fff' : '#c65378'),
      'box-shadow:' + (S.armorOn ? '0 3px 10px rgba(233,121,152,.35)' : 'none'),
      'transition:all .18s', 'white-space:nowrap', 'cursor:pointer', 'z-index:2'
    ].join(';');
    b.textContent = S.armorOn ? '破甲 ON' : '破甲';
  }

  /* ------------- 5.3 AI 创建角色页：步骤条正下方的「创作模型」条 ---------- */
  function aiSelected() {
    var id = S.aiId || S.curId;
    for (var i = 0; i < S.models.length; i++) if (S.models[i].id === id) return S.models[i];
    return S.models[0] || null;
  }

  function updateAiBar() {
    var bar = document.querySelector('.pp-ai-model');
    if (!bar) return;
    var m = aiSelected();
    var nm = bar.querySelector('.nm');
    if (nm) nm.textContent = m ? (m.name || m.model) : '未配置 · 请先在设置里添加模型';
  }

  function injectAiBar() {
    if (!document.querySelector('.steps[aria-label="创作流程"]')) return;
    var steps = document.querySelector('.steps[aria-label="创作流程"]');
    if (!steps || !steps.parentNode) return;
    if (steps.parentNode.querySelector('.pp-ai-model')) { updateAiBar(); return; }
    var bar = el('div', 'pp-ai-model');
    bar.innerHTML = '<div class="ic">&#10022;</div>' +
      '<div class="t"><b class="nm">—</b><small>固定走自定义模型 · 破甲已开启（本页不可关闭）</small></div>' +
      '<span class="armor">破甲 ON</span><span class="go">切换 ›</span>';
    bar.querySelector('.go').onclick = function (e) {
      e.preventDefault(); e.stopPropagation();
      openAiSheet();
    };
    steps.parentNode.insertBefore(bar, steps.nextSibling);
    updateAiBar();
  }

  function openAiSheet() {
    var p = document.getElementById('pp-aisheet');
    if (!p) { p = el('div'); p.id = 'pp-aisheet'; document.body.appendChild(p); }
    p.classList.add('on');
    var h = '<div class="sheet"><div class="h">创作模型<button class="x" id="pp-ai-x">&times;</button></div>';
    if (!S.models.length) {
      h += '<div class="tip">还没有自定义模型。<br>去「设置 → 账号与资料 → 管理我的模型」添加一个，这里就能选了。</div>';
    } else {
      S.models.forEach(function (m) {
        var cur = (aiSelected() && aiSelected().id === m.id);
        h += '<div class="row" data-id="' + m.id + '"><div class="n">' + esc(m.name || m.model) +
          '<small>' + esc(m.model) + ' · ' + esc(shortUrl(m.base)) + '</small></div>' +
          (cur ? '<span class="ck">使用中</span>' : '') + '</div>';
      });
      h += '<div class="tip">AI 创作固定走这里选的模型，且强制开启破甲。</div>';
    }
    h += '</div>';
    p.innerHTML = h;
    p.querySelector('#pp-ai-x').onclick = function () { p.classList.remove('on'); };
    p.onclick = function (e) { if (e.target === p) p.classList.remove('on'); };
    p.querySelectorAll('.row').forEach(function (r) {
      r.onclick = function () {
        S.aiId = r.getAttribute('data-id');
        saveState(); updateAiBar(); p.classList.remove('on');
        toast('创作模型已切换');
      };
    });
  }

  /* ================= 5.4 更新检查（GitHub Releases） ================= */
  var APP_VER = '2.8.1';                   // 兜底值：真实版本来自 /version.json
  var UPD_API = 'https://api.github.com/repos/zmm208/piupiupj/releases/latest';
  var UPD_HINT = 'piupiupj.apk';
  var UPD_DELAY = 1800;
  var UPD_NOTES_MAX = 1200;
  var UPD_AUTO = true;
  var VER_LOADED = false;

  /* 版本号等配置全部来自 APK 内置的 /version.json，改文件即可，不用动逻辑 */
  function loadVersionJson() {
    if (VER_LOADED) return Promise.resolve();
    VER_LOADED = true;
    return fetch('/version.json', { cache: 'no-store' })
      .then(function (r) { return r.json(); })
      .then(function (j) {
        if (!j) return;
        if (j.version) APP_VER = String(j.version);
        if (j.update_api) UPD_API = String(j.update_api);
        if (j.apk_hint) UPD_HINT = String(j.apk_hint);
        if (typeof j.check_delay_ms === 'number') UPD_DELAY = j.check_delay_ms;
        if (typeof j.notes_max_chars === 'number') UPD_NOTES_MAX = j.notes_max_chars;
        if (typeof j.auto_check === 'boolean') UPD_AUTO = j.auto_check;
        syncVerLabels();
      })
      .catch(function () { });
  }

  function syncVerLabels() {
    var b = document.getElementById('pp-checkupd');
    if (b) b.textContent = '检查更新（v' + APP_VER + '）';
  }

  function verNum(v) {
    var m = String(v || '').match(/\d+(?:\.\d+)*/);
    if (!m) return 0;
    return m[0].split('.').reduce(function (a, x, i) { return a + (parseInt(x, 10) || 0) / Math.pow(100, i); }, 0);
  }

  function showUpdate(info) {
    var p = document.getElementById('pp-upd');
    if (!p) { p = el('div'); p.id = 'pp-upd'; document.body.appendChild(p); }
    p.classList.add('on');
    p.innerHTML = '<div class="box"><div class="hd">发现新版本</div>' +
      '<div class="ver">当前 ' + esc(APP_VER) + ' → 最新 ' + esc(info.tag) + '</div>' +
      '<div class="bd">' + esc(info.notes || '（暂无更新说明）') + '</div>' +
      '<div class="ft"><button class="no" id="pp-upd-no">稍后</button>' +
      '<button class="no" id="pp-upd-bk" style="flex:1">先手动备份</button>' +
      '<button class="yes" id="pp-upd-yes">立即更新</button></div></div>';
    p.querySelector('#pp-upd-no').onclick = function () { p.classList.remove('on'); };
    var _bk = p.querySelector('#pp-upd-bk');
    if (_bk) _bk.onclick = function () {
      var info = bkInfo();
      if (!info.granted) { try { bkN().backupRequestAccess(); } catch (e) { } toast('请允许「所有文件访问」后回来再点'); return; }
      toast('正在备份…');
      bkBackupAll().then(function (ok) { if (ok) p.classList.remove('on'); });
    };
    p.querySelector('#pp-upd-yes').onclick = function () {
      var u = info.apk || info.page;
      if (u) { try { window.open(u, '_blank'); } catch (e) { location.href = u; } }
      p.classList.remove('on');
    };
  }

  function fetchJson(url, ms) {
    var c = new AbortController();
    var t = setTimeout(function () { try { c.abort(); } catch (e) { } }, ms || 8000);
    return fetch(url, { signal: c.signal, cache: 'no-store', headers: { Accept: 'application/json' } })
      .then(function (r) { return r.json(); })
      .finally(function () { clearTimeout(t); });
  }

  function checkUpdate(manual) {
    if (manual) toast('正在检查更新…');
    return fetchJson(UPD_API, 9000).then(function (j) {
      if (!j || !j.tag_name) throw new Error('bad response');
      var tag = j.tag_name;
      var apk = '';
      (j.assets || []).forEach(function (a) {
        var n = (a.name || '');
        if (!apk && n === UPD_HINT) apk = a.browser_download_url;
      });
      if (!apk) (j.assets || []).forEach(function (a) {
        if (!apk && /\.apk$/i.test(a.name || '')) apk = a.browser_download_url;
      });
      var info = { tag: tag, notes: (j.body || '').slice(0, UPD_NOTES_MAX), apk: apk, page: j.html_url };
      if (verNum(tag) > verNum(APP_VER)) {
        showUpdate(info);
        return true;
      }
      if (manual) toast('已是最新版本（' + APP_VER + '）', 2000);
      return false;
    }).catch(function (e) {
      if (manual) toast('检查更新失败：' + (e && e.message ? e.message : '网络错误'));
      return false;
    });
  }

  /* ================= 5.5 多 DNS 竞速（DoH JSON） ================= */
  var DNS_LIST = [
    { id: 'ali', name: 'AliDNS', url: 'https://dns.alidns.com/resolve' },
    { id: 'dnspod', name: 'DNSPod', url: 'https://doh.pub/dns-query' },
    { id: 'cf', name: 'Cloudflare', url: 'https://cloudflare-dns.com/dns-query' },
    { id: 'google', name: 'Google', url: 'https://dns.google/resolve' },
    { id: 'adg', name: 'AdGuard', url: 'https://dns.adguard-dns.com/resolve' },
    { id: 'quad9', name: 'Quad9', url: 'https://dns.quad9.net:5053/dns-query' },
    { id: '360', name: '360', url: 'https://doh.360.cn/resolve' }
  ];
  var DNS = { winner: null, results: [], closed: {}, at: 0, busy: false, loaded: false };
  var DNS_PROBE_DEFAULT = 'www.piupiuchan.top';
  var DNS_TIMEOUT = 1600, DNS_CACHE_MS = 600000;

  /* 读取 APK 内置 dns.json（可在 assets/public/dns.json 里改，无需重新编译逻辑） */
  function loadDnsJson() {
    if (DNS.loaded) return Promise.resolve();
    DNS.loaded = true;
    return fetch('/dns.json', { cache: 'no-store' })
      .then(function (r) { return r.json(); })
      .then(function (j) {
        if (j && Array.isArray(j.servers) && j.servers.length) {
          DNS_LIST = j.servers.filter(function (s) { return s && s.url; })
            .map(function (s) { return { id: s.id || s.name, name: s.name || s.id, url: s.url }; });
        }
        if (j && j.probe_host) DNS_PROBE_HOST = j.probe_host;
        if (j && j.timeout_ms) DNS_TIMEOUT = j.timeout_ms;
        if (j && j.cache_minutes) DNS_CACHE_MS = j.cache_minutes * 60000;
      })
      .catch(function () { });
  }
  var DNS_PROBE_HOST = 'www.piupiuchan.top';

  function dohQuery(d, host, ms) {
    var c = new AbortController();
    var t0 = (window.performance || Date).now();
    var timer = setTimeout(function () { try { c.abort(); } catch (e) { } }, ms || 1500);
    var u = d.url + (d.url.indexOf('?') >= 0 ? '&' : '?') + 'name=' + encodeURIComponent(host) + '&type=A';
    return fetch(u, { signal: c.signal, cache: 'no-store', headers: { Accept: 'application/dns-json' } })
      .then(function (r) { return r.json(); })
      .then(function (j) {
        var ip = ((j && j.Answer) || []).filter(function (a) { return a.type === 1; }).map(function (a) { return a.data; })[0] || null;
        return { id: d.id, name: d.name, ms: Math.round((window.performance || Date).now() - t0), ip: ip, ctrl: c };
      })
      .catch(function () { return { id: d.id, name: d.name, ms: -1, ip: null, ctrl: c }; })
      .finally(function () { clearTimeout(timer); });
  }

  function dnsRace(host) {
    if (!DNS.loaded) return loadDnsJson().then(function () { return dnsRace(host); });
    if (DNS.busy) return Promise.resolve(DNS.winner);
    DNS.busy = true;
    var h = host || DNS_PROBE_HOST;
    var jobs = DNS_LIST.filter(function (d) { return !DNS.closed[d.id]; })
      .map(function (d) { return dohQuery(d, h, DNS_TIMEOUT); });
    return Promise.all(jobs).then(function (list) {
      list.sort(function (a, b) {
        if (a.ms < 0) return 1;
        if (b.ms < 0) return -1;
        return a.ms - b.ms;
      });
      DNS.results = list;
      DNS.winner = list[0] && list[0].ms >= 0 ? list[0] : null;
      // 关掉其余 DNS 的连接并拉黑，本次会话不再使用
      list.forEach(function (r) {
        if (!DNS.winner || r.id !== DNS.winner.id) {
          try { r.ctrl && r.ctrl.abort(); } catch (e) { }
          DNS.closed[r.id] = true;
        }
      });
      DNS.at = Date.now();
      DNS.busy = false;
      updateDnsRow();
      try {
        var g = GN();
        g && g.save && g.save('pp_dns', JSON.stringify({
          winner: DNS.winner ? DNS.winner.id : '', at: DNS.at
        }));
      } catch (e) { }
      return DNS.winner;
    });
  }

  function dnsLabel() {
    if (!DNS.winner) return '未测速';
    return DNS.winner.name + ' · ' + DNS.winner.ms + 'ms' + (DNS.winner.ip ? ' · ' + DNS.winner.ip : '');
  }

  function updateDnsRow() {
    var v = document.getElementById('pp-dns-val');
    if (v) v.textContent = dnsLabel();
  }

  /* ------------------------------- 6. 请求层：破甲 / 重试 / 自定义 --------- */
  function isChat(u) { return /chat\/completions|completions|v1\/chat/i.test(u || ''); }
  function armorOn() { var g = GN(); return S.armorOn && g && g.armorPrompt; }

  function applyArmor(body, srcModel) {
    try {
      var p = GN().armorPrompt(); if (!p) return body;
      var j = JSON.parse(body); if (!j.messages) return body;
      // 关键：保留 App 自己拼好的 system（记忆 / 预设 / 世界书 / 角色卡 / 用户人设）
      // 只把破甲词并进去，绝不整段替换 —— 否则 VIP 本地功能对 AI 就失效了
      var idx = -1;
      for (var i = 0; i < j.messages.length; i++) {
        if (j.messages[i] && j.messages[i].role === 'system') { idx = i; break; }
      }
      if (idx >= 0) {
        var old = j.messages[idx].content || '';
        j.messages[idx] = {
          role: 'system',
          content: p + (old ? ('.\n\n' + old) : '')
        };
      } else {
        j.messages.unshift({ role: 'system', content: p });
      }
      return JSON.stringify(j);
    } catch (e) { return body; }
  }
  function customOn() {
    return !!(S.customOn && S.models && S.models.length && curModel());
  }

  function cuEndpoint(base) {
    var b = String(base || '').trim();
    if (!b) return '';
    // 已经是完整端点（含查询串也行）
    if (/\/chat\/completions(\?|$)/i.test(b)) return b;
    // 去掉尾部斜杠
    b = b.replace(/\/+$/, '');
    // 有些中转把端点写在 /v1/chat/completions 之外的路径，这里只补最后一段
    return b + '/chat/completions';
  }

  function applyCustom(body) {
    if (!S.customOn) return null;
    var m = curModel();
    if (!m || !m.base) return null;
    var j = {};
    try { j = JSON.parse(body); } catch (e) { }
    j.model = m.model;
    return {
      url: cuEndpoint(m.base),
      body: JSON.stringify(j),
      key: m.key,
      armor: m.armor
    };
  }
  function escalate(body, n) {
    try {
      var j = JSON.parse(body), esc = JSON.parse(GN().escalation() || '{}');
      j.temperature = (esc.temps && esc.temps[n]) || 1.0;
      var ng = (esc.nudges && esc.nudges[(n - 1) % esc.nudges.length]) || '继续，只输出正文。';
      if (n > 0 && j.messages) j.messages.push({ role: 'user', content: ng });
      return JSON.stringify(j);
    } catch (e) { return body; }
  }
  function textOf(t) { try { var d = JSON.parse(t); return (((d.choices || [])[0] || {}).message || {}).content || ''; } catch (e) { return ''; } }

  function hostOf(u) {
    try { return new URL(u, location.href).hostname; } catch (e) { return ''; }
  }
  function needsDns(u) {
    var h = hostOf(u);
    if (!h) return false;
    if (h === 'localhost' || h === '127.0.0.1' || /\.local$/.test(h)) return false;
    if (/^\d+\.\d+\.\d+\.\d+$/.test(h)) return false;
    // 只对真正需要联网的业务域做竞速，避免拖慢 DoH 自身请求
    return /piupiuchan\.top|deepseek\.com|openai\.com|moonshot\.cn|bigmodel\.cn|aliyuncs\.com|dashscope|googleapis\.com|anthropic\.com|jsdelivr|githubusercontent/.test(h);
  }

  
  if (window.XMLHttpRequest) {
    var oo = XMLHttpRequest.prototype.open, os = XMLHttpRequest.prototype.send, oh = XMLHttpRequest.prototype.setRequestHeader;
    XMLHttpRequest.prototype.open = function (m, u) { this.__pp = { m: (m || '').toUpperCase(), u: u }; return oo.apply(this, arguments); };
    XMLHttpRequest.prototype.setRequestHeader = function (k, v) {
      try { if (String(k).toLowerCase() === 'x-piupiu-card-key' && String(v) === FREE_KEY) return; } catch (e) { }
      if (this.__pp) this.__pp.h = this.__pp.h || {};
      return oh.apply(this, arguments);
    };
    XMLHttpRequest.prototype.send = function (b) {
      try {
        var s = this.__pp;
        if (s && s.m === 'POST' && isChat(s.u) && typeof b === 'string') {
          var cu = applyCustom(b);
          if (cu) { b = cu.body; this.setRequestHeader('Authorization', 'Bearer ' + cu.key); oo.call(this, s.m, cu.url); }
          if (armorOn()) b = applyArmor(b);
        }
      } catch (e) { }
      return os.call(this, b);
    };
  }

  /* ---------------------------------------------------------- 工具 */
  function esc(s) {
    return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }
  function shortUrl(u) {
    return String(u || '').replace(/^https?:\/\//, '').replace(/\/+$/, '');
  }

  /* ---------------------------------------------------------- 调度器
   * 旧实现：每秒 + 每 250ms 各跑一次全页 querySelectorAll，流式输出时 CPU 直接打满。
   * 新实现：只在「可能改变 DOM 的事件」后跑，且各步骤都带廉价门禁；
   *        另外保留一个 5s 的兜底扫描（页面不可见时跳过）。
   */
  var SCAN_TIMER = 0, SCAN_LAST = 0;

  function scanOnce() {
    try {
      if (document.hidden) return;
      attachAuthClose();
      injectSettings();
      injectPickerModels();
      injectComposerArmor();
      patchModelDisplay();
      injectAiBar();
      // 这两项只在相关页面做，避免在对话页每点一下都遍历 DOM
      var route = (location.pathname || '') + (location.hash || '');
      if (/setting/i.test(route) || document.querySelector('.logout-item')) syncLoginUi();
      if (/connection/i.test(route)) { hideFakeCardKey(); injectCardBadge(); validateCardOnConnection(); }
      else { var _b = document.getElementById('pp-card-badge'); if (_b) _b.remove(); }
      if (window.fetch !== ppFetchWrapped) installFetch();
      SCAN_LAST = Date.now();
    } catch (e) { }
  }

  function scheduleScan(delay) {
    if (SCAN_TIMER) clearTimeout(SCAN_TIMER);
    SCAN_TIMER = setTimeout(function () { SCAN_TIMER = 0; scanOnce(); }, delay == null ? 120 : delay);
  }

  function bindScanTriggers() {
    // 只保留真正会改变页面结构的交互；打字/滚动不再触发扫描
    var evs = ['click', 'touchstart', 'touchend'];
    for (var i = 0; i < evs.length; i++) {
      // passive + capture：不打断业务事件，只做"稍后扫一次"
      document.addEventListener(evs[i], function () { scheduleScan(120); },
        { capture: true, passive: true });
    }
    window.addEventListener('hashchange', function () { scheduleScan(60); scheduleScan(320); });
    window.addEventListener('popstate', function () { scheduleScan(60); scheduleScan(320); });
    document.addEventListener('visibilitychange', function () {
      if (!document.hidden) scheduleScan(200);
    });
  }

  /* 诊断：把最近一次错误记到 localStorage，出问题可以直接读 pp_last_error */
  try {
    window.addEventListener('error', function (ev) {
      try {
        localStorage.setItem('pp_last_error',
          (ev.message || 'error') + ' @' + (ev.filename || '') + ':' + (ev.lineno || 0));
      } catch (e) { }
    });
    window.addEventListener('unhandledrejection', function (ev) {
      try {
        var r = ev.reason;
        localStorage.setItem('pp_last_reject', (r && r.message) ? r.message : String(r));
      } catch (e) { }
    });
  } catch (e) { }

  /* ---------------- 对话页内存释放（官方组件没有 onUnmounted，全靠这里兜底） ------ */
  var PP_BLOBS = [];
  var PP_ROUTE = '';
  var PATCHED_BLOB = false;

  function trackBlobs() {
    if (PATCHED_BLOB || !window.URL) return;
    PATCHED_BLOB = true;
    var c = URL.createObjectURL, r = URL.revokeObjectURL;
    URL.createObjectURL = function (o) {
      var u = c.apply(URL, arguments);
      try { PP_BLOBS.push(u); if (PP_BLOBS.length > 60) { r.call(URL, PP_BLOBS.shift()); } } catch (e) { }
      return u;
    };
    URL.revokeObjectURL = function (u) {
      try { PP_BLOBS = PP_BLOBS.filter(function (x) { return x !== u; }); } catch (e) { }
      return r.apply(URL, arguments);
    };
  }


  /* 内存压力保护：对话里堆得太多就主动释放一次，避免快速开关对话把 WebView 撑爆 */
  var PP_MEM_TIMER = 0;
  function watchMemory() {
    if (PP_MEM_TIMER) return;
    PP_MEM_TIMER = setInterval(function () {
      try {
        var m = performance && performance.memory;
        if (!m) return;
        var used = m.usedJSHeapSize / 1048576;
        var route = (location.pathname || '') + (location.hash || '');
        if (/\/chat\b/.test(route) && used > 260) releaseChatMemory();
      } catch (e) { }
    }, 8000);
  }


  /* ---------- 全局预设：防连点 / 防快速切换导致的闪退 ---------- */
  var PRESET_KEY = '', PRESET_T = 0, PRESET_HITS = 0;

  function presetHitTarget(el) {
    if (!el || !el.closest) return null;
    var box = el.closest('[class*="preset"],[class*="Preset"]');
    if (box) return box;
    var btn = el.closest('button,[role="button"],.setting-item,.menu-item');
    if (btn) {
      var txt = (btn.textContent || '').trim();
      if (txt && txt.length <= 40 && /预设/.test(txt)) return btn;
    }
    return null;
  }

  function installPresetGuard() {
    document.addEventListener('click', function (e) {
      var box = presetHitTarget(e.target);
      if (!box) return;
      var now = Date.now();
      var key = box.getAttribute('data-id') || (box.textContent || '').trim().slice(0, 40);
      // 1) 同一个预设 700ms 内重复点：直接吞掉（官方每次点击都会整份重算 1.2MB 预设）
      if (key && key === PRESET_KEY && now - PRESET_T < 700) {
        PRESET_HITS++;
        e.preventDefault(); e.stopPropagation(); e.stopImmediatePropagation();
        return false;
      }
      // 2) 300ms 内连续切换不同预设：也不受理，避免上一份还没落盘就又压一份
      if (now - PRESET_T < 300) {
        e.preventDefault(); e.stopPropagation(); e.stopImmediatePropagation();
        return false;
      }
      PRESET_KEY = key; PRESET_T = now;
    }, true);
  }

  /* ==================== 备份：设备密钥 + 分片增量写 ==================== */
  var BK = { map: null, info: null, dirty: false, savedAt: 0, busy: false, db: '' };

  function bkN() { return GN(); }
  function bkInfo() {
    try { return JSON.parse((bkN() && bkN().backupInfo()) || '{}'); } catch (e) { return {}; }
  }
  function bkKid() {
    try { return (bkN() && bkN().backupKeyId()) || ''; } catch (e) { return ''; }
  }
  function bkEnsure() {
    try { return !!(bkN() && bkN().backupEnsure()); } catch (e) { return false; }
  }
  function bkParse(text) {
    var map = {};
    if (!text) return map;
    var lines = String(text).split('\n');
    for (var i = 1; i < lines.length; i++) {
      var m = /^"([^"]{1,80})":("(?:[^"\\]|\\.)*")\s*,?$/.exec(lines[i].trim());
      if (!m) continue;
      try { map[m[1]] = JSON.parse(m[2]); } catch (e) { }
      try { BK.ver = (JSON.parse(lines[0]) || {}).ver || BK.ver; } catch (e) { }
    }
    return map;
  }
  function bkSerialize(map) {
    var keys = Object.keys(map);
    var out = ['{"v":2,"ver":"' + (APP_VER || '') + '","updatedAt":' + Date.now() + ',"sections":{'];
    for (var i = 0; i < keys.length; i++) {
      out.push('"' + keys[i] + '":' + JSON.stringify(map[keys[i]]) + (i === keys.length - 1 ? '' : ','));
    }
    out.push('}}');
    return out.join('\n');
  }
  function bkLoadTs() {
    if (BK.ts) return BK.ts;
    BK.ts = {};
    try {
      var packed = (BK.map || {})['meta'];
      if (!packed) { var t = ''; try { t = (bkN() && bkN().backupRead()) || ''; } catch (e) { } ; BK.map = bkParse(t); packed = BK.map['meta']; }
      if (packed) {
        var plain = (bkN() && bkN().backupDecrypt(packed)) || '';
        var obj = plain ? JSON.parse(plain) : null;
        if (obj && obj.ts) BK.ts = obj.ts;
      }
    } catch (e) { }
    return BK.ts;
  }

  /* 角色卡 / 聊天：一周没动过就自动从备份里清掉（配置类永不清理） */
  function bkPurgeOld() {
    try {
      var ts = bkLoadTs() || {};
      var map = bkMap();
      var now = Date.now(), week = 7 * 24 * 3600 * 1000, n = 0;
      Object.keys(map).forEach(function (name) {
        if (name.indexOf('card:') !== 0 && name.indexOf('chat:') !== 0) return;
        var t = Number(ts[name] || 0);
        if (t && now - t > week) { delete map[name]; delete ts[name]; n++; }
      });
      if (n) { BK.dirty = true; bkFlush(); toast('已清理 ' + n + ' 个超过一周未变动的备份'); }
      return n;
    } catch (e) { return 0; }
  }

  function bkMap() {
    if (BK.map) return BK.map;
    var text = '';
    try { text = (bkN() && bkN().backupRead()) || ''; } catch (e) { }
    BK.map = bkParse(text);
    return BK.map;
  }
  function bkFlush() {
    if (!bkEnsure()) return false;
    var text = bkSerialize(bkMap());
    if (text.length > 160 * 1048576) { toast('备份超过 160MB，已跳过本次写入'); return false; }
    var ok = false;
    try { ok = !!(bkN() && bkN().backupWrite(text)); } catch (e) { }
    if (ok) { BK.dirty = false; BK.savedAt = Date.now(); }
    return ok;
  }
  /* 只重加密变化的那一段，再整体落盘（分块写由原生完成） */
  function bkTouch(name) {
    try {
      BK.ts = BK.ts || {};
      BK.ts[name] = Date.now();
    } catch (e) { }
  }

  function bkPut(name, plainOrObj, isPlain) {
    var raw = isPlain ? String(plainOrObj) : JSON.stringify(plainOrObj);
    if (raw.length > 8 * 1048576) { /* 单段过大也照样处理，原生分块写 */ }
    var packed = '';
    try { packed = (bkN() && bkN().backupEncrypt(raw)) || ''; } catch (e) { }
    if (!packed) { toast('备份加密失败'); return false; }
    bkMap()[name] = packed;
    bkTouch(name);
    try { bkMap()['meta'] = (bkN() && bkN().backupEncrypt(JSON.stringify({ ts: BK.ts || {} }))) || ''; } catch (e) { }
    BK.dirty = true;
    if (BK.batch) return true;      // 批量模式：先攒着，最后一次写盘
    return bkFlush();
  }

  /* ---------- 数据采集 ---------- */
  /* ---------- 原生直读数据库（绕开插件连接问题） ---------- */
  function bkNativeDump() {
    var g = bkN();
    if (!g || !g.dbDump) return null;
    var raw = '';
    try { raw = g.dbDump() || ''; } catch (e) { return null; }
    if (!raw || raw.indexOf('ERR:') === 0) return null;
    var out = { tables: {}, path: '', cur: '' };
    var segs = raw.split('\u0003');
    for (var i = 0; i < segs.length; i++) {
      var seg = segs[i];
      if (!seg) continue;
      if (seg.indexOf('PATH\u0002') === 0) { out.path = seg.slice(5); continue; }
      if (seg.charAt(0) === '#') {
        var head = seg.slice(1).split('\u0002');
        out.tables[head[0]] = { cols: head[1] ? head[1].split('\u0001') : [], rows: [] };
        out.cur = head[0];
      } else if (out.cur && out.tables[out.cur]) {
        var vals = seg.split('\u0001');
        var t = out.tables[out.cur];
        var obj = {};
        for (var c = 0; c < t.cols.length; c++) obj[t.cols[c]] = vals[c] === undefined ? null : vals[c];
        t.rows.push(obj);
      }
    }
    delete out.cur;
    return out;
  }

  function bkNativeExec(stmts) {
    var g = bkN();
    if (!g || !g.dbExec || !stmts || !stmts.length) return Promise.resolve(false);
    var ok = true;
    var step = 200;
    for (var i = 0; i < stmts.length; i += step) {
      var chunk = stmts.slice(i, i + step).join('\u0000');
      try { if (!g.dbExec(chunk)) ok = false; } catch (e) { ok = false; }
    }
    return Promise.resolve(ok);
  }

  function bkSql() {
    var c = window.Capacitor;
    return (c && c.Plugins && (c.Plugins.CapacitorSQLite || c.Plugins.CapacitorSQLitePlugin)) || null;
  }
  function bkDbCandidates() { return ['piupiu', 'piupiu_db', 'piupiu.sqlite', 'piupiu_chat', 'main', 'default']; }
  function bkDb() {
    if (BK.db) return Promise.resolve(BK.db);
    var sql = bkSql();
    if (!sql) return Promise.reject(new Error('SQLite 插件不可用'));
    var names = bkDbCandidates();
    var i = 0;
    function tryNext() {
      if (i >= names.length) throw new Error('找不到数据库');
      var n = names[i++];
      return Promise.resolve(sql.query({ database: n, statement: 'SELECT count(*) AS c FROM roles', values: [] }))
        .then(function (r) { BK.db = n; return n; })
        .catch(tryNext);
    }
    return Promise.resolve().then(tryNext);
  }
  function bkQuery(stmt) {
    var sql = bkSql();
    if (!sql) return Promise.resolve([]);
    return bkDb().then(function (db) {
      var run = function () {
        return Promise.resolve(sql.query({ database: db, statement: stmt, values: [] }))
          .then(function (r) { return (r && (r.values || r.rows)) || []; });
      };
      return run().catch(function () {
        // 连接可能被 App 关掉了，尝试重新 open 再查一次
        var openFn = sql.open || sql.openDatabase;
        if (!openFn) return [];
        return Promise.resolve(openFn.call(sql, { database: db, readonly: false }))
          .then(run).catch(function () { return []; });
      });
    }).catch(function () { return []; });
  }
  function bkExec(stmt) {
    var sql = bkSql();
    if (!sql) return Promise.resolve(false);
    return bkDb().then(function (db) {
      try {
        if (sql.execute) {
          return Promise.resolve(sql.execute({ database: db, statements: stmt, transaction: false }))
            .then(function () { return true; });
        }
        return Promise.resolve(sql.run({ database: db, statement: stmt, values: [] }))
          .then(function () { return true; });
      } catch (e) { return false; }
    }).catch(function () { return false; });
  }

  /* 批量写入：拼成一条多值 INSERT，减少往返 */

  /* ---------- 文件本体（卡片图 / 聊天媒体）---------- */
  function bkFS() {
    var c = window.Capacitor;
    return (c && c.Plugins && c.Plugins.Filesystem) || null;
  }
  var BK_MAX_FILE = 12 * 1048576;     // 单文件上限，超过就跳过（避免一次性爆内存）
  function bkReadB64(path) {
    if (!path) return Promise.resolve('');
    // 原生读文件：绝对路径 / file:// 都能处理，避免 Filesystem 插件在绝对路径上失败
    try {
      var g = bkN();
      if (g && g.fileReadB64) {
        var d = g.fileReadB64(path) || '';
        if (d.length > BK_MAX_FILE * 1.4) return Promise.resolve('');   // 超大跳过
        return Promise.resolve(d);
      }
    } catch (e) { }
    var fs = bkFS();
    if (!fs) return Promise.resolve('');
    return Promise.resolve(fs.readFile({ path: path }))
      .then(function (r) { return (r && r.data) || ''; })
      .catch(function () { return ''; });
  }
  function bkWriteB64(path, data) {
    if (!path || !data) return Promise.resolve(false);
    try {
      var g = bkN();
      if (g && g.fileWriteB64) return Promise.resolve(!!g.fileWriteB64(path, data));
    } catch (e) { }
    var fs = bkFS();
    if (!fs) return Promise.resolve(false);
    return Promise.resolve(fs.writeFile({ path: path, data: data, recursive: true }))
      .then(function () { return true; }).catch(function () { return false; });
  }

  var BK_LS_SKIP = /session|vip_key|device_id|last_error|boot_error/i;
  function bkCollectLS() {
    var out = {};
    try {
      for (var i = 0; i < localStorage.length; i++) {
        var k = localStorage.key(i);
        if (!k || k.indexOf('piupiu_') !== 0) continue;
        if (BK_LS_SKIP.test(k)) continue;
        out[k] = localStorage.getItem(k);
      }
    } catch (e) { }
    return out;
  }
  function bkCollectVip() {
    var key = rawStored('piupiu_app_vip_key');
    if (!key || key === FREE_KEY) return null;            // 假卡密不备份
    return {
      key: key,
      level: rawStored('piupiu_vip_level') || '',
      expiry: rawStored('piupiu_vip_expiry') || '',
      status: rawStored('piupiu_app_vip_status') || '',
      channel: rawStored('piupiu_channel_tab') || ''
    };
  }
  function bkSessionIds() {
    return bkQuery('SELECT id FROM chat_sessions').then(function (rows) {
      return rows.map(function (r) { return r.id; });
    });
  }
  function bkCollectChat(id) {
    return Promise.all([
      bkQuery('SELECT * FROM chat_sessions WHERE id=' + Number(id)),
      bkQuery('SELECT * FROM chat_messages WHERE session_id=' + Number(id) + ' ORDER BY message_index'),
      bkQuery('SELECT * FROM chat_media_refs WHERE owner_id=' + Number(id)).catch(function () { return []; })
    ]).then(function (a) {
      if (!a[0] || !a[0].length) return null;
      var media = a[2] || [];
      return Promise.all(media.map(function (m) {
        return bkReadB64(m.path).then(function (b64) {
          return { path: m.path, kind: m.owner_type, index: m.message_index, data: b64 };
        });
      })).then(function (files) {
        return { session: a[0][0], messages: a[1] || [], media: files };
      });
    });
  }

  function bkStats() {
    return Promise.all([
      bkQuery('SELECT count(*) c FROM roles'),
      bkQuery('SELECT count(*) c FROM chat_sessions'),
      bkQuery('SELECT count(*) c FROM chat_messages')
    ]).then(function (r) {
      var g = function (a) { return (a && a[0] && (a[0].c || a[0]['count(*)'])) || 0; };
      return { roles: g(r[0]), sessions: g(r[1]), messages: g(r[2]) };
    }).catch(function () { return { roles: 0, sessions: 0, messages: 0 }; });
  }

  /* ---------- 一键修复：把 session_json 里的消息补进 chat_messages ---------- */
  function bkRepairMessages() {
    var dump = null;
    try { dump = bkNativeDump(); } catch (e) { dump = null; }
    if (!dump || !dump.tables || !dump.tables.chat_sessions) { toast('读不到数据库'); return Promise.resolve(0); }
    var sessions = dump.tables.chat_sessions.rows || [];
    var msgs = (dump.tables.chat_messages && dump.tables.chat_messages.rows) || [];
    var stmts = [], fixed = 0;
    sessions.forEach(function (sess) {
      var sid = String(sess.id);
      var have = 0;
      for (var i = 0; i < msgs.length; i++) if (String(msgs[i].session_id) === sid) have++;
      var want = Number(sess.message_count || 0);
      if (have > 0 && (!want || have >= want)) return;
      var gen = bkMessagesFromSession(sess, []);
      if (!gen.length) return;
      fixed++;
      if (have > 0) stmts.push("DELETE FROM chat_messages WHERE session_id = " + Number(sid));
      gen.forEach(function (m) {
        var cols = Object.keys(m);
        stmts.push('INSERT OR REPLACE INTO chat_messages (' + cols.join(',') + ') VALUES (' +
          cols.map(function (c) {
            var v = m[c];
            if (v === null || v === undefined) return 'NULL';
            if (typeof v === 'number') return String(v);
            return "'" + String(v).replace(/'/g, "''") + "'";
          }).join(',') + ')');
      });
    });
    if (!stmts.length) { toast('所有对话的消息都完整'); return Promise.resolve(0); }
    return bkNativeExec(stmts).then(function (ok) {
      toast(ok ? ('已修复 ' + fixed + ' 个对话的消息') : '修复失败（数据库被占用？）');
      return fixed;
    });
  }

  /* ---------- 备份动作 ---------- */
  function bkBackupAll(fresh) {
    if (BK.busy) return Promise.resolve(false);
    BK.busy = true;
    BK.batch = true;
    if (fresh) { BK.map = {}; }        // 手动备份：先清空，整份重来
    return Promise.resolve().then(function () {
      if (!bkEnsure()) { toast('备份目录不可用，请在系统设置里允许「所有文件访问」'); return false; }
      // 优先：直接读数据库文件，绕开插件连接问题
      var dump = null;
      try { dump = bkNativeDump(); } catch (e) { dump = null; }
      if (dump && dump.tables && dump.tables.roles && dump.tables.roles.rows.length) {
        return bkBackupFromDump(dump).then(function () { return true; });
      }
      return Promise.all([
        bkQuery('SELECT * FROM roles'),
        bkQuery('SELECT * FROM world_books').catch(function () { return []; }),
        bkQuery('SELECT * FROM role_tags').catch(function () { return []; })
      ]).then(function (c) {
        var seen = {};
        var roles = (c[0] || []).filter(function (r) {
          if (seen[r.id]) return false; seen[r.id] = 1; return true;
        }).filter(function (r) {
          if (r.is_official) return false;
          var n = String(r.role_name || '');
          return n.indexOf('PiuPiu') < 0 && n.indexOf('piupiu') < 0;   // 官方默认卡不导出
        });
        bkPut('cards', { world_books: c[1] || [], role_tags: c[2] || [], ids: roles.map(function (r) { return r.id; }) });
        var chain0 = Promise.resolve();
        roles.forEach(function (r) {
          chain0 = chain0.then(function () {
            var img = r.image_path || '';
            return bkReadB64(img).then(function (b64) {
              bkPut('card:' + r.id, { kind: 'card', row: r, image: b64 });
            });
          });
        });
        return chain0;
        var ls = bkCollectLS();
        bkPut('settings', ls);
        if (S.models && S.models.length) {
          bkPut('api', { models: S.models, curId: S.curId, customOn: S.customOn, aiId: S.aiId });
        }
        bkQuery('SELECT * FROM settings').catch(function () { return []; }).then(function (rows) {
          if (rows && rows.length) bkPut('dbsettings', rows);
        });
        var vip = bkCollectVip();
        if (vip) bkPut('vip', vip); else bkMap()['vip'] && bkPut('vip', { cleared: true });
        var roleIds = {};
        roles.forEach(function (r) { roleIds[String(r.id)] = 1; });
        return bkSessionIds().then(function (ids) {
          var seenS = {}, uniq = [];
          (ids || []).forEach(function (id) { if (!seenS[id]) { seenS[id] = 1; uniq.push(id); } });
          var chain = Promise.resolve();
          uniq.forEach(function (id) {
            chain = chain.then(function () {
              return bkCollectChat(id).then(function (d) {
                if (!d || !d.session) return;
                // 只备份「角色卡还在备份里」的聊天，避免恢复出孤儿会话（看不到、以为丢了）
                if (!roleIds[String(d.session.role_id)]) return;
                bkPut('chat:' + id, { kind: 'chat', session: d.session, messages: d.messages, media: d.media });
              });
            });
          });
          return chain;
        }).then(function () { return true; });
      });
    }).then(function (ok) {
      BK.batch = false;
      if (ok) ok = bkFlush();       // 统一落盘一次
      BK.busy = false;
      if (ok) {
        try { bkSyncSeen(); bkPurgeOld(); } catch (e) { }
        renderBackupCard();
        bkStats().then(function (st) {
          toast('备份完成：' + st.roles + ' 卡 / ' + st.sessions + ' 对话 / ' + st.messages + ' 消息');
        });
      }
      return ok;
    }).catch(function (e) {
      BK.batch = false;
      BK.busy = false;
      toast('备份失败：' + ((e && e.message) || e));
      return false;
    });
  }

  /* session_json 里通常也存着 messages；chat_messages 为空时用它补齐 */
  function bkMessagesFromSession(session, msgs) {
    if (msgs && msgs.length) return msgs;
    var arr = [];
    try {
      var j = JSON.parse(session.session_json || '{}');
      arr = j.messages || j.history || j.chatHistory || [];
    } catch (e) { arr = []; }
    if (!Array.isArray(arr)) return [];
    return arr.map(function (m, i) {
      var role = m.role || m.sender || 'user';
      if (role !== 'user' && role !== 'assistant' && role !== 'system') role = 'user';
      return {
        session_id: session.id,
        message_index: i,
        message_id: String(m.id || m.message_id || ('m' + i)),
        role: role,
        content: String(m.content == null ? (m.text || '') : m.content),
        timestamp: Number(m.timestamp || m.createdAt || Date.now()),
        message_json: JSON.stringify(m)
      };
    });
  }

  function bkBackupFromDump(dump) {
    var T = dump.tables || {};
    function rows(name) { return (T[name] && T[name].rows) || []; }

    var roles = rows('roles').filter(function (r) {
      if (r.is_official && String(r.is_official) !== '0') return false;
      var n = String(r.role_name || '');
      return n.indexOf('PiuPiu') < 0 && n.indexOf('piupiu') < 0;
    });
    var roleIds = {};
    roles.forEach(function (r) { roleIds[String(r.id)] = 1; });

    bkPut('cards', {
      world_books: rows('world_books'),
      world_book_entries: rows('world_book_entries'),
      role_tags: rows('role_tags').filter(function (t) { return roleIds[String(t.role_id)]; }),
      ids: roles.map(function (r) { return r.id; })
    });

    var chain = Promise.resolve();
    roles.forEach(function (r) {
      chain = chain.then(function () {
        return bkReadB64(r.image_path).then(function (b64) {
          bkPut('card:' + r.id, { kind: 'card', row: r, image: b64 });
        });
      });
    });

    bkPut('settings', bkCollectLS());
    if (S.models && S.models.length) {
      bkPut('api', { models: S.models, curId: S.curId, customOn: S.customOn, aiId: S.aiId });
    } else if (bkMap()['api']) {
      // 之前备份过 api 的不要因为这次没读到就丢掉
    }
    if (rows('settings').length) bkPut('dbsettings', rows('settings'));
    var vip = bkCollectVip();
    if (vip) bkPut('vip', vip);

    var sessions = rows('chat_sessions').filter(function (s) { return roleIds[String(s.role_id)]; });
    var msgs = rows('chat_messages');
    var refs = rows('chat_media_refs');

    sessions.forEach(function (s) {
      chain = chain.then(function () {
        var sid = String(s.id);
        var mine = msgs.filter(function (m) { return String(m.session_id) === sid; });
        mine = bkMessagesFromSession(s, mine);
        var media = refs.filter(function (m) {
          return String(m.owner_id) === sid && (m.owner_type === 'message' || !m.owner_type);
        });
        return Promise.all(media.map(function (m) {
          return bkReadB64(m.path).then(function (b64) {
            return { path: m.path, kind: m.owner_type, index: m.message_index, data: b64 };
          });
        })).then(function (files) {
          bkPut('chat:' + sid, { kind: 'chat', session: s, messages: mine, media: files });
        });
      });
    });
    return chain;
  }

  function bkBackupChat(id) {
    if (!id) return Promise.resolve(false);
    return bkCollectChat(id).then(function (d) {
      if (!d) return false;
      return bkPut('chat:' + id, { kind: 'chat', session: d.session, messages: d.messages, media: d.media });
    }).catch(function () { return false; });
  }

  /* ---------- 恢复 ---------- */
  function bkRestore(mode, only) {
    var map = bkMap();
    var names = Object.keys(map);
    if (!names.length) { toast('没有找到备份'); return Promise.resolve(false); }

    // 1) 全部解密并归类
    var roles = [], books = [], tags = [], sessions = [], messages = [], media = [];
    var settings = null, api = null, vip = null, dbSettings = null, bad = 0;
    names.forEach(function (n) {
      // 只恢复用户勾选的角色卡 / 聊天；其它段自动全恢复
      if (only && (n.indexOf('card:') === 0 || n.indexOf('chat:') === 0) && !only[n]) return;
      var plain = '';
      try { plain = (bkN() && bkN().backupDecrypt(map[n])) || ''; } catch (e) { }
      if (!plain) { bad++; return; }
      var d = null;
      try { d = JSON.parse(plain); } catch (e) { bad++; return; }
      var kind = d && d.kind;
      if (n === 'cards') {
        books = books.concat(d.world_books || []);
        tags = tags.concat(d.role_tags || []);
        roles = roles.concat(d.roles || []);            // 兼容旧格式
      } else if (kind === 'chat' || (!kind && n.indexOf('chat:') === 0)) {
        if (d.session) sessions.push(d.session);
        (d.messages || []).forEach(function (m) { messages.push(m); });
        (d.media || []).forEach(function (m) { media.push(m); });
      } else if (kind === 'card' || (!kind && n.indexOf('card:') === 0)) {
        if (d.row) roles.push(d.row);
        if (d.image && d.row && d.row.image_path) media.push({ path: d.row.image_path, data: d.image });
      } else if (n.indexOf('chat:') === 0) {
        if (d.session) sessions.push(d.session);
        (d.messages || []).forEach(function (m) { messages.push(m); });
        (d.media || []).forEach(function (m) { media.push(m); });
      } else if (n === 'settings') { settings = d; }
      else if (n === 'dbsettings') { dbSettings = d; }
      else if (n === 'api') { api = d; }
      else if (n === 'vip') { vip = d; }
    });
    sessions.forEach(function (sess) {
      var has = messages.filter(function (m) { return String(m.session_id) === String(sess.id); });
      if (!has.length) {
        bkMessagesFromSession(sess, []).forEach(function (m) { messages.push(m); });
      }
    });
    var roleIdSet = {};
    roles.forEach(function (r) { roleIdSet[String(r.id)] = 1; });
    sessions = sessions.filter(function (sess) {
      return sess && roleIdSet[String(sess.role_id)];
    });
    if (!roles.length && !sessions.length && !settings) {
      toast('备份解密失败（密钥不匹配或文件损坏）');
      return Promise.resolve(false);
    }
    toast('恢复中…');

    // 2) 关外键 → 按依赖顺序写 → 开外键
    var written = { roles: 0, tags: 0, sessions: 0, messages: 0, files: 0 };

    function sqlFor(table, arr) {
      var out = [];
      (arr || []).forEach(function (r) {
        if (!r) return;
        var cols = Object.keys(r).filter(function (k) { return r[k] !== undefined; });
        if (!cols.length) return;
        out.push('INSERT OR REPLACE INTO ' + table + ' (' + cols.join(',') + ') VALUES (' +
          cols.map(function (c) {
            var v = r[c];
            if (v === null || v === undefined) return 'NULL';
            if (typeof v === 'number') return String(v);
            return "'" + String(v).replace(/'/g, "''") + "'";
          }).join(',') + ')');
      });
      return out;
    }
    var nativeDb = !!(bkN() && bkN().dbExec);
    if (nativeDb) {
      var stmts = []
        .concat(sqlFor('roles', roles))
        .concat(sqlFor('world_books', books))
        .concat(sqlFor('role_tags', tags))
        .concat(sqlFor('chat_sessions', sessions))
        .concat(sqlFor('chat_messages', messages));
      written.roles = roles.length; written.tags = tags.length;
      written.sessions = sessions.length; written.messages = messages.length;
      return bkNativeExec(stmts).then(function (ok) {
        if (!ok) {
          // 原生写入失败（数据库被 App 占用等）→ 回退插件逐表写入
          return bkExec('PRAGMA foreign_keys=OFF')
            .then(function () { return bkUpsertBatch('roles', roles); })
            .then(function () { return bkUpsertBatch('world_books', books); })
            .then(function () { return bkUpsertBatch('role_tags', tags); })
            .then(function () { return bkUpsertBatch('chat_sessions', sessions); })
            .then(function () { return bkUpsertBatch('chat_messages', messages); })
            .then(function () { return true; });
        }
        return true;
      }).then(function (written2) {
        var chain = Promise.resolve();
        media.forEach(function (m) {
          if (!m || !m.path || !m.data) return;
          chain = chain.then(function () {
            return bkWriteB64(m.path, m.data).then(function (r) { if (r) written.files++; });
          });
        });
        return chain.then(function () {
          if (settings) Object.keys(settings).forEach(function (k) { try { localStorage.setItem(k, settings[k]); } catch (e) { } });
          if (dbSettings && dbSettings.length) {
            var st2 = sqlFor('settings', dbSettings);
            try { bkN().dbExec(st2.join('\u0000')); } catch (e) { }
          }
          if (api && api.models && api.models.length) {
            try { S.models = api.models; S.curId = api.curId || api.models[0].id; S.customOn = !!api.customOn; S.aiId = api.aiId || S.curId; saveState(); } catch (e) { }
          }
          if (vip && vip.key && vip.key !== FREE_KEY) {
            try {
              localStorage.setItem('piupiu_app_vip_key', vip.key);
              localStorage.setItem('piupiu_vip_level', vip.level || '');
              localStorage.setItem('piupiu_vip_expiry', vip.expiry || '');
              localStorage.setItem('piupiu_app_vip_status', vip.status || '');
            } catch (e) { }
          }
          BK.map = null; BK.dirty = false;
          var check = null;
          try { check = bkNativeDump(); } catch (e) { }
          var gotMsg = 0, gotSess = 0;
          if (check && check.tables) {
            if (check.tables.chat_messages) gotMsg = check.tables.chat_messages.rows.length;
            if (check.tables.chat_sessions) gotSess = check.tables.chat_sessions.rows.length;
          }
          toast('恢复完成：' + written.roles + ' 卡 / ' + written.sessions + ' 对话 / ' +
            written.messages + ' 消息 → 库里现有 ' + gotSess + ' 对话 / ' + gotMsg + ' 消息');
          // 再跑一次消息自检：会话存在但消息缺失时用 session_json 补上
          var repair = function () {
            try {
              var d2 = bkNativeDump();
              var ms = (d2 && d2.tables.chat_messages) ? d2.tables.chat_messages.rows.length : 0;
              var ss = (d2 && d2.tables.chat_sessions) ? d2.tables.chat_sessions.rows.length : 0;
              if (ss > 0 && ms === 0) return bkRepairMessages();
            } catch (e) { }
            return Promise.resolve(0);
          };
          return repair().then(function (n) {
            if (n) toast('已补回 ' + n + ' 个对话的消息');
            setTimeout(function () { try { location.reload(); } catch (e) { } }, n ? 1200 : 1000);
            return true;
          });
          return true;
        });
      });
    }

    return bkExec('PRAGMA foreign_keys=OFF')
      .then(function () { return bkUpsertBatch('roles', roles); }).then(function (n) { written.roles = n; })
      .then(function () { return bkUpsertBatch('world_books', books); })
      .then(function () { return bkUpsertBatch('role_tags', tags); }).then(function (n) { written.tags = n; })
      .then(function () { return bkUpsertBatch('chat_sessions', sessions); }).then(function (n) { written.sessions = n; })
      .then(function () { return bkUpsertBatch('chat_messages', messages); }).then(function (n) { written.messages = n; })
      .then(function () {
        var chain = Promise.resolve();
        media.forEach(function (m) {
          if (!m || !m.path || !m.data) return;
          chain = chain.then(function () {
            return bkWriteB64(m.path, m.data).then(function (ok) { if (ok) written.files++; });
          });
        });
        return chain;
      })
      .then(function () {
        if (dbSettings && dbSettings.length) return bkUpsertBatch('settings', dbSettings);
      })
      .then(function () {
        if (settings) {
          Object.keys(settings).forEach(function (k) {
            try { localStorage.setItem(k, settings[k]); } catch (e) { }
          });
        }
        return true;
      })
      .then(function () {
        if (api) {
          try {
            if (api.models && api.models.length) {
              S.models = api.models;
              S.curId = api.curId || (api.models[0] && api.models[0].id) || 0;
              S.customOn = !!api.customOn;
              S.aiId = api.aiId || S.curId;
              saveState();
            }
          } catch (e) { }
        }
        if (vip && vip.key && vip.key !== FREE_KEY) {
          try {
            localStorage.setItem('piupiu_app_vip_key', vip.key);
            localStorage.setItem('piupiu_vip_level', vip.level || '');
            localStorage.setItem('piupiu_vip_expiry', vip.expiry || '');
            localStorage.setItem('piupiu_app_vip_status', vip.status || '');
          } catch (e) { }
        }
        // 清掉回忆页/聊天页的本地视图缓存，强制重新从数据库读
        try {
          var drop = [];
          for (var i = 0; i < localStorage.length; i++) {
            var k = localStorage.key(i);
            if (/memory_view_state|chat_state|session_state|memoryPage/i.test(k)) drop.push(k);
          }
          drop.forEach(function (k) { try { localStorage.removeItem(k); } catch (e) { } });
        } catch (e) { }
        return bkExec('PRAGMA foreign_keys=ON');
      })
      .then(function () {
        BK.map = null; BK.dirty = false;
        toast('恢复完成：' + written.roles + ' 卡 / ' + written.tags + ' 标签 / ' +
          written.sessions + ' 对话 / ' + written.messages + ' 消息 / ' + written.files + ' 文件');
        setTimeout(function () { try { location.reload(); } catch (e) { } }, 1000);
        return true;
      })
      .catch(function (e) {
        toast('恢复失败：' + ((e && e.message) || e));
        return false;
      });
  }

  function bkUpsert(table, rows, pk) {
    if (!rows || !rows.length) return Promise.resolve(true);
    var chain = Promise.resolve();
    rows.forEach(function (row) {
      var cols = Object.keys(row).filter(function (k) { return row[k] !== undefined; });
      if (!cols.length) return;
      var sql = 'INSERT OR REPLACE INTO ' + table + ' (' + cols.join(',') + ') VALUES (' +
        cols.map(function (c) {
          var v = row[c];
          if (v === null) return 'NULL';
          if (typeof v === 'number') return String(v);
          return "'" + String(v).replace(/'/g, "''") + "'";
        }).join(',') + ')';
      chain = chain.then(function () { return bkExec(sql); });
    });
    return chain;
  }

  /* ---------- 恢复确认弹窗（只在版本变化或手动恢复时出现） ---------- */
  /* ================= 备份查看器（整页 · 三栏：角色卡 / 聊天 / 其他） ================= */
  var BK_PROTECTED = { cards: 1, settings: 1, dbsettings: 1, api: 1, vip: 1 };
  var BK_TAB = 'cards', BK_OPEN_CHAT = '';

  function bkFmtTime(t) {
    if (!t) return '—';
    try {
      var d = new Date(Number(t)), p2 = function (n) { return (n < 10 ? '0' : '') + n; };
      return d.getFullYear() + '-' + p2(d.getMonth() + 1) + '-' + p2(d.getDate()) + ' ' + p2(d.getHours()) + ':' + p2(d.getMinutes());
    } catch (e) { return '—'; }
  }

  function bkDeleteSection(name) {
    var map = bkMap();
    if (!map[name] || BK_PROTECTED[name]) return false;
    delete map[name];
    var ts = bkLoadTs(); if (ts) delete ts[name];
    BK.dirty = true;
    try { map['meta'] = (bkN() && bkN().backupEncrypt(JSON.stringify({ ts: ts || {} }))) || ''; } catch (e) { }
    if (bkFlush()) { toast('已从备份中删除'); return true; }
    return false;
  }

  var BK_DEC = {};
  function bkDec(sec) {
    if (Object.prototype.hasOwnProperty.call(BK_DEC, sec)) return BK_DEC[sec];
    var v = null;
    try {
      var packed = bkMap()[sec];
      if (packed) {
        var plain = (bkN() && bkN().backupDecrypt(packed)) || '';
        if (plain) v = JSON.parse(plain);
      }
    } catch (e) { v = null; }
    BK_DEC[sec] = v;
    return v;
  }

  function bkViewer() {
    var p = document.getElementById('pp-bkview');
    if (!p) { p = el('div'); p.id = 'pp-bkview'; document.body.appendChild(p); }
    p.classList.add('on');
    BK_DEC = {};

    var map = bkMap(), ts = bkLoadTs() || {};
    var cards = [], chats = [], others = [];
    Object.keys(map).forEach(function (n) {
      if (n === 'meta') return;
      if (n.indexOf('card:') === 0) cards.push(n);
      else if (n.indexOf('chat:') === 0) chats.push(n);
      else others.push(n);
    });

    var h = '<div class="page"><div class="hd"><button class="nav" id="pp-bkv-x">&lsaquo;</button>' +
      '<b>备份内容</b><span class="cnt">' + bkFmtTime(Date.now()) + '</span></div>' +
      '<div class="tabs">' +
      '<button data-tab="cards" class="' + (BK_TAB === 'cards' ? 'on' : '') + '">角色卡 ' + cards.length + '</button>' +
      '<button data-tab="chats" class="' + (BK_TAB === 'chats' ? 'on' : '') + '">聊天 ' + chats.length + '</button>' +
      '<button data-tab="others" class="' + (BK_TAB === 'others' ? 'on' : '') + '">其他 ' + others.length + '</button>' +
      '</div><div class="body" id="pp-bkv-body">';

    if (BK_TAB === 'cards') {
      if (!cards.length) h += '<div class="pp-empty">没有角色卡备份</div>';
      cards.forEach(function (n) {
        h += '<div class="bk-card" data-sec="' + esc(n) + '"><div class="noimg">…</div>' +
          '<div class="info"><b>角色卡 #' + esc(n.slice(5)) + '</b>' +
          '<small class="ts">备份于 ' + bkFmtTime(ts[n]) + '</small></div>' +
          '<button class="pp-btn line bk-del" data-sec="' + esc(n) + '">删除</button></div>';
      });
    } else if (BK_TAB === 'chats') {
      if (BK_OPEN_CHAT) {
        h += '<div class="chat-head"><button class="nav2" id="pp-bkv-back">&lsaquo;</button><b>聊天详情</b></div>' +
          '<div id="pp-bkv-chat"></div>';
      } else {
        if (!chats.length) h += '<div class="pp-empty">没有聊天备份</div>';
        chats.forEach(function (n) {
          h += '<div class="bk-chat" data-sec="' + esc(n) + '"><div class="t">' +
            '<b>聊天 #' + esc(n.slice(5)) + '</b><small>加载中…</small>' +
            '<small class="ts">备份于 ' + bkFmtTime(ts[n]) + '</small></div>' +
            '<button class="pp-btn main bk-open" data-sec="' + esc(n) + '">查看</button>' +
            '<button class="pp-btn line bk-del" data-sec="' + esc(n) + '">删除</button></div>';
        });
      }
    } else {
      if (!others.length) h += '<div class="pp-empty">没有其它备份</div>';
      others.forEach(function (n) {
        h += '<div class="bk-other" data-sec="' + esc(n) + '"><div class="oh"><b>' + esc(bkLabel(n)) + '</b>' +
          '<small class="ts">备份于 ' + bkFmtTime(ts[n]) + '</small></div><pre>加载中…</pre></div>';
      });
    }
    h += '</div></div>';
    p.innerHTML = h;

    // 逐个解密填充，避免一次性解密把所有图片/消息塞进主线程导致卡死
    var queue = [];
    if (BK_TAB === 'cards') queue = cards.slice();
    else if (BK_TAB === 'chats' && !BK_OPEN_CHAT) queue = chats.slice();
    else if (BK_TAB === 'others') queue = others.slice();
    var qi = 0;
    function pump() {
      if (qi >= queue.length) return;
      var sec = queue[qi++];
      try {
        if (BK_TAB === 'chats' && !BK_OPEN_CHAT) bkFillChatRow(p, sec);
        else if (BK_TAB === 'cards') bkFillCardRow(p, sec);
        else if (BK_TAB === 'others') bkFillOtherRow(p, sec);
      } catch (e) { }
      setTimeout(pump, 16);
    }
    if (BK_TAB === 'chats' && BK_OPEN_CHAT) { bkFillChatDetail(p, BK_OPEN_CHAT); }
    else setTimeout(pump, 16);

    p.querySelector('#pp-bkv-x').onclick = function () { p.classList.remove('on'); BK_OPEN_CHAT = ''; };
    p.querySelectorAll('.tabs button').forEach(function (b) {
      b.onclick = function () { BK_TAB = b.getAttribute('data-tab'); BK_OPEN_CHAT = ''; bkViewer(); };
    });
    var back = p.querySelector('#pp-bkv-back');
    if (back) back.onclick = function () { BK_OPEN_CHAT = ''; bkViewer(); };
    p.querySelectorAll('.bk-open').forEach(function (b) {
      b.onclick = function () { BK_OPEN_CHAT = b.getAttribute('data-sec'); bkViewer(); };
    });
    p.querySelectorAll('.bk-del').forEach(function (b) {
      b.onclick = function (e) {
        e.stopPropagation();
        var sec = b.getAttribute('data-sec');
        if (!sec || BK_PROTECTED[sec]) return;
        bkDeleteSection(sec);
        bkViewer();
      };
    });
  }

  function bkLabel(n) {
    return { cards: '世界书 / 角色标签', settings: '预设与本地配置', dbsettings: '数据库设置',
      api: '自定义模型 / API', vip: '卡密' }[n] || n;
  }

  function bkFillCardRow(p, sec) {
    var node = p.querySelector('.bk-card[data-sec="' + sec + '"]');
    if (!node) return;
    var d = bkDec(sec);
    if (!d) { node.querySelector('.noimg').textContent = '失败'; node.querySelector('.info small.ts').innerHTML += ' · <b>无法解密</b>'; return; }
    var row = d.row || {};
    node.innerHTML = (d.image ? '<img src="data:image/png;base64,' + d.image + '">' : '<div class="noimg">无图</div>') +
      '<div class="info"><b>' + esc(row.role_name || row.name || sec) + '</b>' +
      '<small>ID ' + esc(String(row.id || sec.slice(5))) + ' · ' + esc(row.role_type || 'single') + ' · ' +
      (String(row.is_official) === '1' ? '官方' : '自定义') + '</small>' +
      '<small>更新 ' + bkFmtTime(row.updated_at) + '</small>' +
      '<small class="ts">备份于 ' + bkFmtTime((bkLoadTs() || {})[sec]) + '</small>' +
      (row.description_text ? '<p>' + esc(String(row.description_text).slice(0, 90)) + '</p>' : '') +
      '</div><button class="pp-btn line bk-del" data-sec="' + esc(sec) + '">删除</button>';
    node.querySelector('.bk-del').onclick = function (e) {
      e.stopPropagation(); bkDeleteSection(sec); bkViewer();
    };
  }

  function bkFillChatRow(p, sec) {
    var node = p.querySelector('.bk-chat[data-sec="' + sec + '"]');
    if (!node) return;
    var d = bkDec(sec);
    var ts = (bkLoadTs() || {})[sec];
    if (!d) {
      node.querySelector('.t small').innerHTML = '<b>无法解密</b>';
      return;
    }
    var sess = d.session || {};
    var msgs = d.messages || [];
    // 找角色名
    var roleName = '';
    if (sess.role_id != null) {
      var cd = bkDec('card:' + sess.role_id);
      roleName = (cd && cd.row && (cd.row.role_name || cd.row.name)) || ('角色 #' + sess.role_id);
    }
    node.innerHTML = '<div class="t"><b>' + esc(sess.title || ('聊天 #' + sec.slice(5))) + '</b>' +
      '<small>' + esc(roleName) + ' · ' + msgs.length + ' 条消息 · ' + (d.media || []).length + ' 个媒体</small>' +
      '<small class="ts">备份于 ' + bkFmtTime(ts) + '</small></div>' +
      '<button class="pp-btn main bk-open" data-sec="' + esc(sec) + '">查看</button>' +
      '<button class="pp-btn line bk-del" data-sec="' + esc(sec) + '">删除</button>';
    node.querySelector('.bk-open').onclick = function () { BK_OPEN_CHAT = sec; bkViewer(); };
    node.querySelector('.bk-del').onclick = function (e) { e.stopPropagation(); bkDeleteSection(sec); bkViewer(); };
  }

  function bkFillOtherRow(p, sec) {
    var node = p.querySelector('.bk-other[data-sec="' + sec + '"]');
    if (!node) return;
    var d = bkDec(sec);
    var pre = node.querySelector('pre');
    if (!d) { pre.textContent = '无法解密'; return; }
    try { pre.textContent = JSON.stringify(d, null, 1).slice(0, 8000); }
    catch (e) { pre.textContent = String(d).slice(0, 8000); }
  }

  function bkFillChatDetail(p, sec) {
    var box = p.querySelector('#pp-bkv-chat');
    if (!box) return;
    var d = bkDec(sec);
    if (!d) { box.innerHTML = '<div class="pp-empty">这条备份无法解密</div>'; return; }
    var sess = d.session || {};
    var roleName = '';
    if (sess.role_id != null) {
      var cd = bkDec('card:' + sess.role_id);
      roleName = (cd && cd.row && (cd.row.role_name || cd.row.name)) || ('角色 #' + sess.role_id);
    }
    var head = p.querySelector('.chat-head b');
    if (head) head.textContent = sess.title || ('聊天 #' + sec.slice(5));
    var msgs = d.messages || [];
    var h = '<div class="chat-meta">' + esc(roleName) + ' · ' + msgs.length + ' 条消息 · 备份于 ' +
      bkFmtTime((bkLoadTs() || {})[sec]) + '</div><div class="msgs">';
    if (!msgs.length) h += '<div class="pp-empty">这条备份里没有消息</div>';
    msgs.forEach(function (m) {
      var role = m.role === 'user' ? 'me' : (m.role === 'system' ? 'sys' : 'ai');
      h += '<div class="m ' + role + '"><div class="who">' +
        (role === 'me' ? '我' : role === 'ai' ? (roleName || '角色') : '系统') + '</div>' +
        '<div class="txt">' + esc(String(m.content || '').slice(0, 3000)) + '</div></div>';
    });
    h += '</div>';
    box.innerHTML = h;
  }

  function bkFirstUser(messages) {
    for (var i = 0; i < (messages || []).length; i++) {
      var m = messages[i];
      if (m && m.role === 'user' && m.content) return String(m.content).replace(/\s+/g, ' ').slice(0, 60);
    }
    return '';
  }

  function bkRoleNameOf(roleId) {
    if (roleId == null) return '';
    var cd = bkDec('card:' + roleId);
    return (cd && cd.row && (cd.row.role_name || cd.row.name)) || ('角色 #' + roleId);
  }

  /* 聊天预览（恢复前确认是不是这条） */
  function bkPreviewChat(sec) {
    var p = document.getElementById('pp-bkpreview');
    if (!p) { p = el('div'); p.id = 'pp-bkpreview'; document.body.appendChild(p); }
    p.classList.add('on');
    var d = bkDec(sec);
    var h = '<div class="page"><div class="hd"><button class="nav" id="pp-bv-x">&lsaquo;</button><b>聊天预览</b>' +
      '<span class="cnt">' + bkFmtTime((bkLoadTs() || {})[sec]) + '</span></div><div class="body">';
    if (!d) {
      h += '<div class="pp-empty">这条备份无法解密</div>';
    } else {
      var sess = d.session || {};
      var msgs = d.messages || [];
      h += '<div class="chat-meta">' + esc(bkRoleNameOf(sess.role_id)) + ' · ' + msgs.length + ' 条消息</div><div class="msgs">';
      if (!msgs.length) h += '<div class="pp-empty">这条备份里没有消息</div>';
      msgs.forEach(function (m) {
        var role = m.role === 'user' ? 'me' : (m.role === 'system' ? 'sys' : 'ai');
        h += '<div class="m ' + role + '"><div class="who">' +
          (role === 'me' ? '我' : role === 'ai' ? esc(bkRoleNameOf(sess.role_id)) : '系统') + '</div>' +
          '<div class="txt">' + esc(String(m.content || '').slice(0, 3000)) + '</div></div>';
      });
      h += '</div>';
    }
    h += '</div></div>';
    p.innerHTML = h;
    p.querySelector('#pp-bv-x').onclick = function () { p.classList.remove('on'); };
  }

  function bkRestoreDialog() {
    var p = document.getElementById('pp-bkdlg');
    if (!p) { p = el('div'); p.id = 'pp-bkdlg'; document.body.appendChild(p); }
    p.classList.add('on');
    BK_DEC = {};

    var map = bkMap(), ts = bkLoadTs() || {};
    var cards = [], chats = [];
    Object.keys(map).forEach(function (n) {
      if (n.indexOf('card:') === 0) cards.push(n);
      else if (n.indexOf('chat:') === 0) chats.push(n);
    });

    function rows(arr, kind, empty) {
      if (!arr.length) return '<div class="pp-empty">' + empty + '</div>';
      return arr.map(function (n) {
        var id = n.slice(5);
        return '<div class="bk-chk" data-sec="' + esc(n) + '">' +
          '<input type="checkbox" data-sec="' + esc(n) + '" checked>' +
          '<div class="thumb">' + (kind === 'card' ? '…' : '聊') + '</div>' +
          '<div class="t"><b>' + (kind === 'card' ? '角色卡 #' + esc(id) : '聊天 #' + esc(id)) + '</b>' +
          '<small class="sub">加载中…</small>' +
          '<small class="ts">备份于 ' + bkFmtTime(ts[n]) + '</small></div>' +
          (kind === 'chat' ? '<button class="pp-btn line bk-peek" data-sec="' + esc(n) + '">预览</button>' : '') +
          '</div>';
      }).join('');
    }

    var info = bkInfo();
    p.innerHTML = '<div class="box"><div class="hd">恢复备份<button class="x" id="pp-bk-x">&times;</button></div>' +
      '<div class="bd">' +
      '<div class="tip">备份文件 · ' + (info.exists ? (info.size / 1048576).toFixed(1) + ' MB' : '不存在') +
      ' · 角色卡 ' + cards.length + ' / 聊天 ' + chats.length + '</div>' +
      '<div class="bk-sec"><h4>角色卡 · 勾选要恢复的</h4>' + rows(cards, 'card', '没有角色卡') + '</div>' +
      '<div class="bk-sec"><h4>聊天 · 勾选要恢复的</h4>' + rows(chats, 'chat', '没有聊天') + '</div>' +
      '<div class="tip">其余内容（世界书 / 预设 / 配置 / API / 卡密）会自动一起恢复。</div>' +
      '<div class="row2"><button class="pp-btn line" id="pp-bk-merge">合并恢复</button>' +
      '<button class="pp-btn main" id="pp-bk-over">覆盖恢复</button></div>' +
      '</div></div>';

    // 逐条解密填充（缩略图 / 角色名 / 首句），不阻塞 UI
    var queue = cards.map(function (n) { return { sec: n, kind: 'card' }; })
      .concat(chats.map(function (n) { return { sec: n, kind: 'chat' }; }));
    var qi = 0;
    function fillOne(item) {
      var row = p.querySelector('.bk-chk[data-sec="' + item.sec + '"]');
      if (!row) return;
      var d = bkDec(item.sec);
      if (!d) { row.querySelector('.sub').innerHTML = '<b>无法解密</b>'; return; }
      if (item.kind === 'card') {
        var r = d.row || {};
        var thumb = row.querySelector('.thumb');
        thumb.innerHTML = d.image ? '<img src="data:image/png;base64,' + d.image + '">' : '无图';
        row.querySelector('b').textContent = r.role_name || r.name || ('角色卡 #' + item.sec.slice(5));
        row.querySelector('.sub').textContent = (String(r.is_official) === '1' ? '官方 · ' : '自定义 · ') +
          esc(String(r.role_type || 'single'));
      } else {
        var sess = d.session || {};
        var msgs = d.messages || [];
        var thumb2 = row.querySelector('.thumb');
        var rid = sess.role_id;
        var cd = rid != null ? bkDec('card:' + rid) : null;
        if (cd && cd.image) thumb2.innerHTML = '<img src="data:image/png;base64,' + cd.image + '">';
        else thumb2.textContent = '聊';
        row.querySelector('b').textContent = sess.title || ('聊天 #' + item.sec.slice(5));
        var rn = (cd && cd.row && (cd.row.role_name || cd.row.name)) || (rid != null ? '角色 #' + rid : '未知角色');
        var first = bkFirstUser(msgs);
        row.querySelector('.sub').innerHTML = esc(rn) + ' · ' + msgs.length + ' 条' +
          (first ? '<br><i>「' + esc(first) + (first.length >= 60 ? '…' : '') + '」</i>' : '');
      }
    }
    function pump() {
      if (qi >= queue.length) return;
      try { fillOne(queue[qi++]); } catch (e) { qi++; }
      setTimeout(pump, 16);
    }
    setTimeout(pump, 16);

    function picked() {
      var set = {};
      p.querySelectorAll('input[type=checkbox]').forEach(function (c) { if (c.checked) set[c.getAttribute('data-sec')] = 1; });
      return set;
    }
    p.querySelector('#pp-bk-x').onclick = function () { p.classList.remove('on'); };
    p.querySelectorAll('.bk-peek').forEach(function (b) {
      b.onclick = function (e) { e.stopPropagation(); bkPreviewChat(b.getAttribute('data-sec')); };
    });
    p.querySelector('#pp-bk-merge').onclick = function () { p.classList.remove('on'); bkRestore('merge', picked()); };
    p.querySelector('#pp-bk-over').onclick = function () { p.classList.remove('on'); bkRestore('over', picked()); };
  }

  /* ---------- 设置卡里的备份区块 ---------- */
  function backupCard() {
    var info = bkInfo();
    var size = info.exists ? (info.size / 1048576).toFixed(2) + ' MB' : '未备份';
    var when = BK.savedAt ? new Date(BK.savedAt).toTimeString().slice(0, 5) : '—';
    var d = el('div', 'pp-card');
    d.id = 'pp-backup-card';
    d.innerHTML = '<h3>备份（<b style="color:#c65378">已加密</b>）</h3>' +
      '<div class="pp-row" style="padding:8px 0"><div class="txt"><b>启用备份</b><span>关闭时不读写任何备份文件，不影响启动</span></div>' +
      '<div class="pp-switch' + (bkEnabled() ? ' on' : '') + '" id="pp-bk-sw"><i></i></div></div>' +
      '<div class="pp-tip" id="pp-bk-state">' + (info.exists ? ('已有备份 · ' + size + ' · 本次 ' + when) : '还没有备份') +
      (info.granted ? '' : ' · <b style="color:#c65378">缺少存储权限</b>') + '</div>' +
      '<div class="pp-tip" id="pp-bk-db" style="color:#a58a94">正在读取数据库…</div>' +
      '<div class="pp-row" style="gap:8px;padding-top:10px">' +
      '<button class="pp-btn main" id="pp-bk-now" style="flex:1">立即备份</button>' +
      '<button class="pp-btn line" id="pp-bk-restore" style="flex:1">恢复备份</button>' +
      '</div>' +
      '<div class="pp-row" style="gap:8px;padding-top:8px">' +
      '<button class="pp-btn line" id="pp-bk-repair" style="flex:1">修复聊天消息</button>' +
      '<button class="pp-btn line" id="pp-bk-view" style="flex:1">查看备份内容</button></div>';
    var sw = d.querySelector('#pp-bk-sw');
    if (sw) sw.onclick = function () {
      var on = !bkEnabled();
      try { localStorage.setItem('pp_backup_on', on ? '1' : '0'); } catch (e) { }
      sw.classList.toggle('on', on);
      toast(on ? '备份已启用' : '备份已关闭');
      if (on) {
        try { bkWatchChanges(); bkSyncSeen(); setTimeout(bkPurgeOld, 800); } catch (e) { }
      }
    };
    d.querySelector('#pp-bk-now').onclick = function () {
      if (!bkEnabled()) { toast('请先打开上面的「启用备份」'); return; }
      var info2 = bkInfo();
      if (!info2.granted) { try { bkN().backupRequestAccess(); } catch (e) { } toast('请在弹出的系统设置里允许「所有文件访问」，然后回来再点一次'); return; }
      toast('正在备份…');
      bkBackupAll(true);
    };
    d.querySelector('#pp-bk-restore').onclick = function () { bkRestoreDialog(); };
    // 数据库自检：能看到数字说明 SQLite 通道正常
    try {
      bkStats().then(function (st) {
        var tip = document.getElementById('pp-bk-db');
        if (tip) tip.textContent = '数据库 ' + (BK.db || 'piupiu') + '：' + st.roles + ' 个角色 / ' + st.sessions + ' 个对话 / ' + st.messages + ' 条消息';
      });
    } catch (e) { }
    d.querySelector('#pp-bk-repair').onclick = function () { bkRepairMessages(); };
    d.querySelector('#pp-bk-view').onclick = function () { bkViewer(); };
    return d;
  }
  function renderBackupCard() {
    var old = document.getElementById('pp-backup-card');
    if (!old || !old.parentNode) return;
    old.parentNode.replaceChild(backupCard(), old);
  }

  /* ---------- 数据变动检测：签名变了就备份 ---------- */
  /* ---------- 变动检测：只备份新增/更新的卡与对话（不做删除同步） ---------- */
  var BK_SIG = '', BK_SIG_T = 0, BK_SIG_BUSY = false;
  var BK_CARD_SEEN = {}, BK_CHAT_SEEN = {};

  function bkWatchChanges() {
    setInterval(function () {
      if (!bkEnabled()) return;
      if (document.hidden || BK_SIG_BUSY || BK.busy) return;
      var now = Date.now();
      if (now - BK_SIG_T < 12000) return;
      BK_SIG_T = now;

      var dump = null;
      try { dump = bkNativeDump(); } catch (e) { dump = null; }
      if (!dump || !dump.tables) return;

      var roles = ((dump.tables.roles || {}).rows) || [];
      var sessions = ((dump.tables.chat_sessions || {}).rows) || [];
      var msgs = ((dump.tables.chat_messages || {}).rows) || [];

      var newCards = [], newChats = [];
      roles.forEach(function (r) {
        if (r.is_official && String(r.is_official) !== '0') return;
        var n = String(r.role_name || '');
        if (n.indexOf('PiuPiu') >= 0 || n.indexOf('piupiu') >= 0) return;
        var key = String(r.id), sig = String(r.updated_at || 0);
        if (BK_CARD_SEEN[key] !== sig) newCards.push(r);
      });
      sessions.forEach(function (c) {
        var key = String(c.id), sig = String(c.updated_at || 0);
        if (BK_CHAT_SEEN[key] !== sig) newChats.push(c);
      });

      // 首次运行只记基线，不做批量写入
      var first = !Object.keys(BK_CARD_SEEN).length && !Object.keys(BK_CHAT_SEEN).length;
      roles.forEach(function (r) { BK_CARD_SEEN[String(r.id)] = String(r.updated_at || 0); });
      sessions.forEach(function (c) { BK_CHAT_SEEN[String(c.id)] = String(c.updated_at || 0); });
      if (first) return;
      if (!newCards.length && !newChats.length) return;

      BK_SIG_BUSY = true;
      var chain = Promise.resolve();
      newCards.forEach(function (r) {
        chain = chain.then(function () {
          return bkReadB64(r.image_path).then(function (b64) {
            bkPut('card:' + r.id, { kind: 'card', row: r, image: b64 });
          });
        });
      });
      newChats.forEach(function (c) {
        chain = chain.then(function () {
          var sid = String(c.id);
          var mine = msgs.filter(function (m) { return String(m.session_id) === sid; });
          mine = bkMessagesFromSession(c, mine);
          var refs = ((dump.tables.chat_media_refs || {}).rows) || [];
          var mm = refs.filter(function (m) { return String(m.owner_id) === sid; });
          return Promise.all(mm.map(function (m) {
            return bkReadB64(m.path).then(function (b64) { return { path: m.path, kind: m.owner_type, index: m.message_index, data: b64 }; });
          })).then(function (files) {
            bkPut('chat:' + sid, { kind: 'chat', session: c, messages: mine, media: files });
          });
        });
      });
      chain.then(function () {
        BK_SIG_BUSY = false;
        try { bkFlush(); } catch (e) { }
      });
    }, 15000);
  }

  /* ---------- 自动备份 ---------- */
  var BK_API_T = 0;
  function bkAutoApi() {
    if (!bkEnabled()) return;
    var now = Date.now();
    if (now - BK_API_T < 1500) return;
    BK_API_T = now;
    setTimeout(function () {
      var ls = bkCollectLS();
      bkPut('settings', ls);
      if (!S.models || !S.models.length) return;
      bkPut('api', { models: S.models, curId: S.curId, customOn: S.customOn, aiId: S.aiId });
    }, 1200);
  }

  /* ---------------------------------------------------------- 启动 */
  function boot() {
    loadState();
    splash();
    scanOnce();
    bindScanTriggers();
    installPresetGuard();
    watchRoute();
    watchMemory();
    setTimeout(function () { try { bkWatchChanges(); } catch (e) { } }, 15000);
    watchOfficialPick();
    // 空闲时再做网络活：DNS 竞速和更新检查都不跟首屏抢带宽/CPU
    function idle(fn, delay) {
      var run = function () { try { fn(); } catch (e) { } };
      if (window.requestIdleCallback) {
        setTimeout(function () { window.requestIdleCallback(run, { timeout: 4000 }); }, delay);
      } else {
        setTimeout(run, delay);
      }
    }
    idle(function () { dnsRace(); }, 2500);
    loadVersionJson().then(function () {
      // 版本变了且存在备份 → 提示恢复（每次启动最多一次）
      try {
        if (bkEnabled()) {
          bkMap();
          if (BK.ver && APP_VER && BK.ver !== APP_VER) bkRestoreDialog();
        }
      } catch (e) { }
      if (!UPD_AUTO) return;
      idle(function () { checkUpdate(false); }, Math.max(UPD_DELAY, 4000));
    });
    // 兜底：5 秒一次，页面不可见时 scanOnce 内部直接返回
    setInterval(scanOnce, 5000);
  }

  function safeBoot() {
    try { boot(); } catch (e) {
      try { localStorage.setItem('pp_boot_error', e && e.message ? e.message : String(e)); } catch (x) { }
    }
  }
  try { window.__ppStage = 5; } catch (e) { }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', safeBoot);
  else safeBoot();
})();

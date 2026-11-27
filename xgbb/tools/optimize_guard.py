#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""optimize_guard.py —— 把注入层从「每秒全页扫描」改成「事件驱动 + 轻量门禁」"""
import io, re, sys, os

P = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "frontend", "piupiu-guard.js")
src = open(P, encoding="utf-8").read()

def sub(old, new, why=""):
    global src
    if old not in src:
        raise SystemExit("找不到片段: " + (why or old[:60]))
    src = src.replace(old, new, 1)

# ---------------------------------------------------------------- 1) aiCreateOpen
sub("""  function aiCreateOpen() {
    try {
      var t = document.body ? (document.body.innerText || '') : '';
      return t.indexOf('写下灵感') >= 0 && t.indexOf('总览编辑') >= 0;
    } catch (e) { return false; }
  }""",
"""  var _aiCache = { v: false, t: 0 };
  function aiCreateOpen() {
    // 只用一次 querySelector；结果缓存 600ms（原来用 body.innerText，等于每帧强制重排）
    var now = Date.now();
    if (now - _aiCache.t < 600) return _aiCache.v;
    var v = false;
    try { v = !!document.querySelector('.steps[aria-label="创作流程"]'); } catch (e) { }
    _aiCache = { v: v, t: now };
    return v;
  }""", "aiCreateOpen")

# ---------------------------------------------------------------- 2) patchModelDisplay 门禁
sub("""  function patchModelDisplay() {
    var m = curModel();
    var aiMode = aiCreateOpen();
    if (!(S.customOn || aiMode) || !m) { restoreModelDisplay(); return; }
    var name = m.name || m.model;
    var cap = document.querySelector('.piupiu-model-capsule');
    if (cap) {
      var sp = cap.querySelector('span');
      if (sp) ppSetText(sp, name);
    }
    document.querySelectorAll('.current-model-name, .piupiu-model-name').forEach(function (n) {
      if (n.closest('.model-list') || n.closest('.modal-overlay')) return;
      ppSetText(n, name);
    });
  }""",
"""  function patchModelDisplay() {
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
  }""", "patchModelDisplay")

# ---------------------------------------------------------------- 3) 弹窗扫描加门禁
sub("""  function findAuthCard() {
    var nodes = document.querySelectorAll('input,div,section,form');""",
"""  function hasModalish() {
    // 便宜的一次 querySelector：没有弹窗类节点就完全跳过扫描
    return !!(document.querySelector('.modal-overlay') ||
      document.querySelector('[class*="modal"]') ||
      document.querySelector('input[type="password"]'));
  }

  function findAuthCard() {
    if (!hasModalish()) return null;
    var nodes = document.querySelectorAll('input,div,section,form');""", "findAuthCard 门禁")

sub("""  function findUpdateCard() {
    var nodes = document.querySelectorAll('div,section');""",
"""  function findUpdateCard() {
    if (!hasModalish()) return null;
    var nodes = document.querySelectorAll('div,section');""", "findUpdateCard 门禁")

# ---------------------------------------------------------------- 4) 输入框破甲胶囊 / AI 条 门禁
sub("""  function injectComposerArmor() {
    var wrap = document.querySelector('.piupiu-chat-input-wrapper');
    if (!wrap) return;""",
"""  function injectComposerArmor() {
    if (!document.querySelector('.piupiu-chat-input-wrapper')) return;
    var wrap = document.querySelector('.piupiu-chat-input-wrapper');
    if (!wrap) return;""", "injectComposerArmor 门禁")

sub("""  function injectAiBar() {
    var steps = document.querySelector('.steps[aria-label="创作流程"]');
    if (!steps || !steps.parentNode) return;""",
"""  function injectAiBar() {
    if (!document.querySelector('.steps[aria-label="创作流程"]')) return;
    var steps = document.querySelector('.steps[aria-label="创作流程"]');
    if (!steps || !steps.parentNode) return;""", "injectAiBar 门禁")

# ---------------------------------------------------------------- 5) 设置页扫描门禁
sub("""    // ② 兜底：设置列表里插在「个人设置」卡片前面
    var anchor = findByText('个人设置') || findByText('通用设置') || findByText('聊天体验');""",
"""    // ② 兜底：设置列表里插在「个人设置」卡片前面
    //    先做一次廉价判断，不在设置页就完全不扫
    var hash = (location.hash || '') + (location.pathname || '');
    if (!/setting|settings|我的|个人/i.test(hash) && !document.querySelector('[class*="settings"]')) return;
    var anchor = findByText('个人设置') || findByText('通用设置') || findByText('聊天体验');""", "injectSettings 门禁")

# ---------------------------------------------------------------- 6) 调度器替换 tick
sub("""  /* ---------------------------------------------------------- 启动 */
  function boot() {
    loadState();
    splash();
    var tick = function () {
      try {
        attachAuthClose();
        injectSettings();
        injectPickerModels();
        injectComposerArmor();
        patchModelDisplay();
        injectAiBar();
      } catch (e) { }
    };
    tick();
    watchOfficialPick();
    // 启动即测速一次 + 静默检查更新（有更新才弹窗）
    setTimeout(function () { try { dnsRace(); } catch (e) { } }, 600);
    loadVersionJson().then(function () {
      if (!UPD_AUTO) return;
      setTimeout(function () { try { checkUpdate(false); } catch (e) { } }, UPD_DELAY);
    });
    setInterval(tick, 1000);
    // 选择模型弹层是瞬开瞬关的，单独用 250ms 轮询抢在用户看到之前注入
    setInterval(function () { try { injectPickerModels(); } catch (e) { } }, 250);
  }""",
"""  /* ---------------------------------------------------------- 调度器
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
      SCAN_LAST = Date.now();
    } catch (e) { }
  }

  function scheduleScan(delay) {
    if (SCAN_TIMER) clearTimeout(SCAN_TIMER);
    SCAN_TIMER = setTimeout(function () { SCAN_TIMER = 0; scanOnce(); }, delay == null ? 120 : delay);
  }

  function bindScanTriggers() {
    var evs = ['click', 'touchstart', 'touchend', 'keydown', 'input', 'scroll'];
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

  /* ---------------------------------------------------------- 启动 */
  function boot() {
    loadState();
    splash();
    scanOnce();
    bindScanTriggers();
    watchOfficialPick();
    // 启动即测速一次 + 静默检查更新（有更新才弹窗）
    setTimeout(function () { try { dnsRace(); } catch (e) { } }, 800);
    loadVersionJson().then(function () {
      if (!UPD_AUTO) return;
      setTimeout(function () { try { checkUpdate(false); } catch (e) { } }, UPD_DELAY);
    });
    // 兜底：5 秒一次，页面不可见时 scanOnce 内部直接返回
    setInterval(scanOnce, 5000);
  }""", "调度器")

open(P, "w", encoding="utf-8").write(src)
print("注入层已改为事件驱动，字节数:", len(src.encode("utf-8")))

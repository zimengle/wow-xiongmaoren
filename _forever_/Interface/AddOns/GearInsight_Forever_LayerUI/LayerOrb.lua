-- 位面悬浮小球（11-24 用户「位面工具设计一个外面的悬浮小球…可以不同颜色展示不同状态」「切换中是Loading状态，设计好的动画」，HOLD 待实测）
--   设计稿 layer_orb_design.md（用户 4 个问题「都按推荐」）：
--   ① 屏幕上一个 34px 圆球：平时球心 = 第几层（外圈 / 数字 = 位面页同一套层颜色，空心）；事件态整球填色（实心）+ 球心符号 / 秒数 + 动画
--   ② 左键 = 情景主动作：平时「我想换一层」（走 _LayerUI 包过额度的 LH.Request）；有人求我 = 邀请他；刚失败 = 再试；
--      求助中 / 确认中不重复发、只说进度并打开位面页；第一次左键问一次「以后点球就直接求助吗」（LY.AskOnce，存档 layer.orbClick）
--      Shift+左键 = 开关位面页；Ctrl+左键 = 开关「自动帮别人」；右键 = 小菜单（ns.PopMenu）；按住左键拖 = 挪位置（位置按账号存 layer.orb.pos）
--   ③ Loading 两段式：A 求助中（等人拉）= 旋转亮弧（Rotation 动画，1.2 秒一圈）+ 球心剩余秒数 + 右上「第几位」，进入时快呼吸 2 次；
--      B 进队确认中 = 白色进度环倒走 LH.CONFIRM 秒（11-24 起 30；Cooldown 扇形，引擎画）+ 球心剩余秒数；成功 = 绿色放大回弹 + 外圈扩散一次；失败 = 红色左右抖两下
--   ④ 位面识别开着就默认显示；副本里隐藏；战斗中 35% 透明、动画暂停；隐藏后三处找回：「窗口与提醒」（主插件 Layer.lua 登记）/ 位面页设置一个勾 / /gi layer orb
--   ⛔ 不新建 OnUpdate：判状态 / 改秒数挂主插件现成的 LY.OnTick（每秒一次）；动画全是 AnimationGroup / Cooldown（引擎驱动），只在需要时播、换状态先全停
--   ⛔ 不注册 COMBAT_LOG_EVENT_UNFILTERED；不给暴雪全局赋值（只包我们自己的 LH.SetResult / ns.LayerSlash / LayerPub.Refresh）；
--      邀请只在鼠标点击里发（LH.HelpInvite）；球不发言、不带插件名；「自动帮别人」不因为有球就默认打开
--   ⛔ 这个文件晚于主插件加载：文件头 ns = _G.GearInsightForever or ns；排在 LayerPub.lua 前（LayerPub 最后置就绪标记、FlushInits 跑下面的 AddInit）
--   需要真机验：Rotation 动画作用于贴图、Cooldown:SetSwipeTexture 圆形 —— 都包了 pcall，不支持时转圈退回呼吸、扇形退回方形（被球体盖住只露外圈）
local _, ns = ...; ns = _G.GearInsightForever or ns
local LY, LH = ns.Layer, ns.LayerHop
if not (LY and LH) then return end
local O = {}
ns.LayerOrb = O
local function L(cn, en) return ns.L(cn, en) end
local function now() return (GetTime and GetTime()) or 0 end

O.SIZE, O.BODY = 34, 26     -- 球直径（同胡萝卜图标）/ 球体直径（外圈宽 4）
O.X, O.Y = 220, -80          -- 默认位置：胡萝卜（220, -120）正上方，两个小图标排成一列
O.RESULT = 6                 -- 成功 / 失败的实心球留几秒
O.RECENT = 120               -- 最近失败：外圈右下留红点（同位面页「最近结果保留 120 秒」）
O.ARC, O.PULL_ARC = 1.2, 2.4 -- 转一圈几秒（求助中 / 我在拉人）
O.BREATH_ASK, O.BREATH_ASKED = 1.5, 10   -- 进入求助快呼吸几秒；有人求我紫色呼吸几秒后转常亮
O.DRAG_GUARD = 0.3           -- 拖完这么久内的点击不算（防拖动误触发求助）
local MASK = "Interface\\CHARACTERFRAME\\TempPortraitAlphaMask"   -- 游戏自带圆形
O.BRAND = "|cff33ff99Gear|r|cffffd200Insight|r"   -- 和主界面标题同一套品牌色
local TEX_OK, TEX_NO ="Interface\\RaidFrame\\ReadyCheck-Ready", "Interface\\RaidFrame\\ReadyCheck-NotReady"
local LAYER_RGB = {
    { 0.30, 0.95, 0.45 }, { 0.35, 0.65, 1.00 }, { 0.75, 0.50, 1.00 },
    { 1.00, 0.62, 0.22 }, { 1.00, 0.45, 0.72 }, { 0.30, 0.90, 0.90 },
}   -- 和 PageLayer.lua / LayerPub.lua 同一套：球和位面页卡片一眼对得上
local C = {
    busy = { 1.00, 0.80, 0.10 }, ok = { 0.20, 1.00, 0.40 }, fail = { 1.00, 0.40, 0.33 },
    ask = { 0.72, 0.45, 1.00 }, grey = { 0.55, 0.55, 0.58 }, body = { 0.06, 0.07, 0.10 }, group = { 0.14, 0.18, 0.26 },
}
O.C = C
local function layerRGB(no) return no and LAYER_RGB[(no - 1) % #LAYER_RGB + 1] or C.grey end
O.LayerRGB = layerRGB
-- 实心（事件态）：整球填色；空心（常态）：深色球体 + 彩色外圈。色弱靠「形」也分得开
local A = {}   -- 动画组（arc 转弧 / arcA 转弧那一段 / breath 呼吸 / pop 回弹 / burst 扩散 / shake 抖）：放在普通表里，不挂框体上
O.A = A
local SOLID = { ask = C.busy, confirm = C.busy, ok = C.ok, fail = C.fail, asked = C.ask, pull = C.ask }
O.SOLID = SOLID

-- 存档 layer.orb（按账号，同胡萝卜 ns.db.mtBtn）：{ show, hide, pos = { pt, rp, x, y } }；第一次左键问过的答案在 layer.orbClick（LY.AskOnce 的键）
function O.DB()
    local d = LY.DB()
    if type(d.orb) ~= "table" then d.orb = {} end
    return d.orb
end
-- 11-24 用户拍板（1.5.0）：小球默认不显示：show 为真，或拖过位置（pos）且没隐藏（老存档）→ 显示；其余（没打开过 / 隐藏过）= 不显示。主插件 Layer.lua orbLoad 同一判定
function O.Shown()
    local o = O.DB()
    return o.show == true or (o.pos ~= nil and not o.hide)
end

-- ---------- 判状态（只读现成字段，球不新增任何换层状态）----------
-- 有人求我拉他：还没过期的弹框 / 待弹项 → 几个, 请求号, 那一项（优先正弹着的那个框）
local function live(p, t) local at = type(p) == "table" and p.t or nil; return at ~= nil and at <= t and t - at < LH.POP_LIVE end
function O.Asks()
    local t, n, k1, p1 = now(), 0, nil, nil
    local pops = LH.popups or {}
    for k, p in pairs(pops) do
        if live(p, t) then
            n = n + 1
            if not p1 or p.t < p1.t then k1, p1 = k, p end
        end
    end
    local pop = LH._pop and LH._pop()
    local k = pop and pop:IsShown() and pop.n
    if k and live(pops[k], t) then k1, p1 = k, pops[k] end
    return n, k1, p1
end
-- 我正在拉的人（帮手侧，对方还没回执「到了」）：myInvites 没有时间 → 这里记第一次看到的时间，POP_LIVE 内才算
local invAt = {}
function O.Pulling()
    local t, who = now(), nil
    local mi = LH.myInvites or {}
    for k in pairs(invAt) do if mi[k] == nil then invAt[k] = nil end end
    for k, w in pairs(mi) do
        invAt[k] = invAt[k] or t
        if t - invAt[k] < LH.POP_LIVE then who = w end
    end
    return who
end
-- → 状态, 球心秒数（进行中）。按优先级判，命中即停（设计稿 §2；和设计稿的出入：自己求助中 / 确认中排在「有人求我」前面 —— 那时 LH.HelpInvite 本来就不许去拉别人）
function O.State()
    local d, t = LY.DB(), now()
    if not d.on then return "off" end
    if LY.InInstance() then return "inst" end
    local p, c = LH.pending, LH.ctx
    local j = p and p.joinedAt or (c and not c.res and c.joinedAt)
    if j and t - j < LH.CONFIRM then return "confirm", LH.CONFIRM - (t - j) end
    if p and not p.joinedAt and t - (p.t or 0) < LH.ACCEPT_WIN then return "ask", LH.ACCEPT_WIN - (t - p.t) end
    local why = LH.Blocked()
    if why == "confirming" then return "confirm", 0 end   -- 进过队、过了 CONFIRM 秒还在等认层（JOIN_WIN 内）
    if O.Asks() > 0 then return "asked" end
    if O.Pulling() then return "pull" end
    local l = LH.last
    if l and t - (l.t or -1e9) < O.RESULT then return l.ok and "ok" or "fail" end
    if LY.InCombat() then return "combat" end
    if why == "afterinst" or why == "ingroup" or why == "nolayer" or why == "cooldown" then return why end
    if d.pub and ns.LayerCredit and ns.LayerCredit.Blocked() then return "nocredit" end
    return "ready"
end
-- 我这层：第几层（认出了才有）, 地图, 层码
function O.MyLayer()
    local m, z = LY.Mine()
    if not (m and z and LY.Confirmed()) then return nil, m, nil end
    return LY.LayerNo(m, z), m, z
end
function O.AutoOn() local d = LY.DB(); return (d.autoHelp == true and d.helper) or LH.autoAll end
-- 11-24 用户「还剩多少次也展示，然后鼓励互助，打开自动帮人」：
--   公会外额度还剩几次（球右下角标）→ 次数；不限（Gearinsight 公会）/ 公共频道关着（不用额度）/ 没有额度模块 → nil
function O.Credits()
    local LC = ns.LayerCredit
    if not (LC and LY.DB().pub) or LC.Unlimited() then return nil end
    return (LC.Left())
end
-- 开着自动帮别人：下一次 +1 还差几分钟（攒满 = 0）；关着 = nil（计时在主插件 LayerHop.lua 的 cr.s，规则在 LayerCredit.lua）
function O.AhMinutes()
    local LC = ns.LayerCredit
    if not (LC and LC.AhOn and LC.AhOn()) then return nil end
    local c = LC.State()
    if c.b >= LC.MAX then return 0 end
    return math.max(1, math.ceil(((LC.AH_SEC or 600) - (tonumber(c.s) or 0)) / 60))
end
O.AH_TEXT = function() return L("打开自动帮别人：在线每 10 分钟额度 +1，帮拉成一次再 +1 · Ctrl+左键 一键打开",
    "Turn on auto-help: +1 credit every 10 min online, +1 per pull - Ctrl-click to turn on") end

-- ---------- 框体（单个 Button，一次建好，只改颜色 / 显隐）----------
local function disc(parent, layer, sub, size)
    local t = parent:CreateTexture(nil, layer, nil, sub)
    t:SetTexture(MASK)
    t:SetSize(size, size)
    t:SetPoint("CENTER")
    return t
end
local function newAG(region)
    if not (region and region.CreateAnimationGroup) then return nil end
    local ok, g = pcall(region.CreateAnimationGroup, region)
    return ok and g or nil
end
local function anim(g, kind, dur, order)
    local ok, a = pcall(g.CreateAnimation, g, kind)
    if not ok or not a then return nil end
    a:SetDuration(dur)
    if order then a:SetOrder(order) end
    return a
end
local function alphaFT(a, from, to)
    if a.SetFromAlpha then a:SetFromAlpha(from); a:SetToAlpha(to) elseif a.SetChange then a:SetChange(to - from) end
end
local function scaleTo(a, s)
    if a.SetScaleTo then a:SetScaleFrom(1, 1); a:SetScaleTo(s, s) elseif a.SetScale then a:SetScale(s, s) end
end
-- 动画：建不出来（老客户端 / 某种动画不支持）就是 nil，用的地方都先判
function O.BuildAnims(b)
    -- A 求助中：亮弧（球的左上四分之一圆，绕球心转 → 被球体盖住，只露外圈上的一段弧）
    local ok = pcall(function()
        local g = newAG(b.arc)
        local a = g and anim(g, "Rotation", O.ARC)
        if not a then return end
        a:SetDegrees(-360)
        a:SetOrigin("BOTTOMRIGHT", 0, 0)
        g:SetLooping("REPEAT")
        A.arc, A.arcA = g, a
    end)
    if not ok then A.arc, A.arcA = nil, nil end
    pcall(function()   -- 呼吸光圈（进入求助快呼吸 / 有人求我紫色呼吸 / 不能转圈时代替转圈）
        local g = newAG(b.glow)
        local a = g and anim(g, "Alpha", 0.6)
        if not a then return end
        alphaFT(a, 0.15, 0.85)
        g:SetLooping("BOUNCE")
        A.breath = g
    end)
    pcall(function()   -- 成功：整球放大回弹
        local g = newAG(b)
        local a1, a2 = g and anim(g, "Scale", 0.15, 1), g and anim(g, "Scale", 0.2, 2)
        if not (a1 and a2) then return end
        scaleTo(a1, 1.25); scaleTo(a2, 0.8)
        A.pop = g
    end)
    pcall(function()   -- 成功：外圈扩散淡出一次
        local g = newAG(b.burst)
        local s, a = g and anim(g, "Scale", 0.5), g and anim(g, "Alpha", 0.5)
        if not (s and a) then return end
        scaleTo(s, 1.8); alphaFT(a, 0.9, 0)
        g:SetScript("OnFinished", function() b.burst:Hide() end)
        A.burst = g
    end)
    pcall(function()   -- 11-24 自动帮别人关着：左上灰点闪一下（一次性，两个来回）
        local g = newAG(b.dot)
        if not g then return end
        for i = 1, 4 do
            local a = anim(g, "Alpha", 0.35, i)
            if not a then return end
            if i % 2 == 1 then alphaFT(a, 1, 0.1) else alphaFT(a, 0.1, 1) end
        end
        A.dot = g
    end)
    pcall(function()   -- 失败：左右抖两下（±3px）
        local g = newAG(b)
        if not g then return end
        for i, x in ipairs({ 3, -6, 6, -3 }) do
            local a = anim(g, "Translation", (i == 1 or i == 4) and 0.05 or 0.1, i)
            if not a then return end
            a:SetOffset(x, 0)
        end
        A.shake = g
    end)
end
function O.Build()
    if O.btn then return O.btn end
    local S = O.SIZE
    local b = CreateFrame("Button", "GearInsightForeverLayerOrb", UIParent)
    b:SetSize(S, S)
    -- 照胡萝卜 11-23 的修法：HIGH 层 + 置顶 + 不出屏（默认层级会压在头像框下面，点到的是头像框、拖不动）
    b:SetFrameStrata("HIGH")
    if b.SetToplevel then b:SetToplevel(true) end
    if b.SetClampedToScreen then b:SetClampedToScreen(true) end
    b:SetMovable(true)
    b:RegisterForDrag("LeftButton")
    b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    O.Place(b)
    -- 底层：光圈（呼吸 / 扩散）→ 外圈（整圆，被球体盖住只露 4px）→ 亮弧（四分之一圆，绕球心转）
    b.glow = disc(b, "BACKGROUND", -1, S + 12); b.glow:SetBlendMode("ADD"); b.glow:Hide()
    b.burst = disc(b, "BACKGROUND", 0, S + 4); b.burst:SetBlendMode("ADD"); b.burst:Hide()
    b.ring = disc(b, "BORDER", 0, S)
    b.arc = b:CreateTexture(nil, "ARTWORK", nil, 0)
    b.arc:SetTexture(MASK); b.arc:SetTexCoord(0, 0.5, 0, 0.5)
    b.arc:SetSize(S / 2, S / 2); b.arc:SetPoint("TOPLEFT", b, "TOPLEFT", 0, 0); b.arc:Hide()
    -- 进度环 / 冷却扇形（引擎画）：在外圈之上、球体之下 → 只露外圈那一圈；冷却时提到球体之上整球遮一层
    local okCd, cd = pcall(CreateFrame, "Cooldown", nil, b, "CooldownFrameTemplate")
    if okCd and cd then
        cd:SetAllPoints()
        if cd.SetHideCountdownNumbers then pcall(cd.SetHideCountdownNumbers, cd, true) end
        if cd.SetDrawBling then pcall(cd.SetDrawBling, cd, false) end
        if cd.SetDrawEdge then pcall(cd.SetDrawEdge, cd, true) end
        if cd.SetSwipeTexture then pcall(cd.SetSwipeTexture, cd, MASK) end   -- 圆形扇形（不支持就是方形，外圈遮得住）
        cd.noCooldownCount = true   -- OmniCC 别在上面叠数字
        b.cd = cd
    else
        b.cd = false
    end
    -- 上层：球体 + 球心字 / 符号 + 角标（单独一层框，盖住进度环中间）
    local top = CreateFrame("Frame", nil, b)
    top:SetAllPoints()
    b.top = top
    O.Levels(b, false)
    b.body = disc(top, "ARTWORK", 0, O.BODY)
    b.center = top:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge"); b.center:SetPoint("CENTER", 0, 0)
    b.icon = top:CreateTexture(nil, "OVERLAY"); b.icon:SetSize(18, 18); b.icon:SetPoint("CENTER"); b.icon:Hide()
    b.dot = disc(top, "OVERLAY", 1, 7); b.dot:ClearAllPoints(); b.dot:SetPoint("TOPLEFT", b, "TOPLEFT", 1, -1)
    b.dot:SetVertexColor(C.ok[1], C.ok[2], C.ok[3]); b.dot:Hide()
    -- 11-25 用户「这里不需要GI图标，这里直接显示层码，没有的话，兜底换层数」：左下角原 GI logo → 层码（4 位）；没层码 → 第几层（和右下额度角标对称）
    b.code = top:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall"); b.code:SetPoint("TOPRIGHT", b, "BOTTOMLEFT", 8, 8)
    b.notch = disc(top, "OVERLAY", 1, 7); b.notch:ClearAllPoints(); b.notch:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", -1, 1)
    b.notch:SetVertexColor(C.fail[1], C.fail[2], C.fail[3]); b.notch:Hide()
    b.tr = top:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall"); b.tr:SetPoint("BOTTOMLEFT", b, "TOPRIGHT", -8, -8)
    b.br = top:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall"); b.br:SetPoint("TOPLEFT", b, "BOTTOMRIGHT", -8, 8)
    O.BuildAnims(b)
    b:SetScript("OnDragStart", function(self) self:StartMoving() end)
    b:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        O.dragAt = now()
        local pt, _, rp, x, y = self:GetPoint()
        if pt then O.DB().pos = { pt, rp, x, y } end
    end)
    b:SetScript("OnClick", function(self, btn) O.Click(self, btn) end)
    b:SetScript("OnEnter", function(self) O.Tip(self) end)
    b:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
    b:SetScript("OnHide", function() O.StopAll(); O.st, O.key = nil, nil end)   -- 隐藏 / 进副本：动画全停，再显示时按当时状态重来
    O.btn = b
    return b
end
-- 进度环在球体下面（只露外圈）/ 冷却时在球体上面（整球遮一层）
function O.Levels(b, cdOnTop)
    local lv = b:GetFrameLevel() or 1
    if b.cd then b.cd:SetFrameLevel(cdOnTop and lv + 3 or lv + 1) end
    b.top:SetFrameLevel(lv + 2)
end
function O.Place(b)
    b = b or O.btn
    if not b then return end
    b:ClearAllPoints()
    local p = O.DB().pos
    if type(p) == "table" and p[1] then b:SetPoint(p[1], UIParent, p[2] or p[1], tonumber(p[3]) or 0, tonumber(p[4]) or 0)
    else b:SetPoint("CENTER", UIParent, "CENTER", O.X, O.Y) end
end

-- ---------- 动画：只在需要时播，换状态先全停 ----------
O.tok = 0
function O.StopAll()
    local b = O.btn
    O.tok = O.tok + 1   -- 作废还没到点的「几秒后停呼吸」
    O.arcOn, O.breathOn = nil, nil
    if not b then return end
    for _, g in ipairs({ A.arc or false, A.breath or false, A.pop or false, A.shake or false, A.burst or false }) do   -- ⛔ 别放 nil：ipairs 遇到 nil 就停
        if g then pcall(g.Stop, g) end
    end
    if b.cd then
        if b.cd.Clear then pcall(b.cd.Clear, b.cd) else pcall(b.cd.SetCooldown, b.cd, 0, 0) end
    end
    b.arc:Hide(); b.glow:Hide(); b.burst:Hide()
end
local function breath(b, col, sec, steady)
    b.glow:SetVertexColor(col[1], col[2], col[3]); b.glow:SetAlpha(0.6); b.glow:Show()
    if not A.breath then return end
    A.breath:Play(); O.breathOn = true
    if not sec then return end
    local my = O.tok
    if C_Timer and C_Timer.After then
        C_Timer.After(sec, function()
            if O.tok ~= my or not O.btn then return end
            pcall(A.breath.Stop, A.breath); O.breathOn = nil
            if steady then b.glow:SetAlpha(0.6) else b.glow:Hide() end   -- 有人求我：呼吸 10 秒后转常亮；进入求助：快呼吸完就收
        end)
    end
end
-- → true = 在转圈；false = 不能转圈，退回一直呼吸（形状改由球心秒数区分）
local function spin(b, col, dur, glowCol)
    if not A.arc then breath(b, glowCol or col); return false end
    b.arc:SetVertexColor(col[1], col[2], col[3]); b.arc:Show()
    if A.arcA then A.arcA:SetDuration(dur) end
    A.arc:Play(); O.arcOn = true
    return true
end
local function ring(b, start, dur, col, a, onTop)
    if not (b.cd and start and dur and dur > 0) then return end
    O.Levels(b, onTop)
    if b.cd.SetSwipeColor then pcall(b.cd.SetSwipeColor, b.cd, col[1], col[2], col[3], a) end
    pcall(b.cd.SetCooldown, b.cd, start, dur)
end
-- 进入新状态：停掉旧动画，按新状态播需要的那一个
function O.Enter(st, sec)
    local b = O.btn
    O.StopAll()
    O.Levels(b, false)
    local t = now()
    if st == "ask" then
        if spin(b, { 1, 1, 0.85 }, O.ARC, C.busy) then breath(b, C.busy, O.BREATH_ASK) end   -- 头 1.5 秒快呼吸 2 次：「已经发出去了」
    elseif st == "confirm" then
        local p, c = LH.pending, LH.ctx
        local j = (p and p.joinedAt) or (c and c.joinedAt)
        if (sec or 0) > 0 then ring(b, j, LH.CONFIRM, { 1, 1, 1 }, 0.9, false) end
    elseif st == "ok" then
        if A.pop then A.pop:Play() end
        if A.burst then b.burst:SetVertexColor(C.ok[1], C.ok[2], C.ok[3]); b.burst:SetAlpha(0.9); b.burst:Show(); A.burst:Play() end
    elseif st == "fail" then
        if A.shake then A.shake:Play() end
    elseif st == "asked" then
        breath(b, C.ask, O.BREATH_ASKED, true)
    elseif st == "pull" then
        spin(b, { 0.95, 0.85, 1 }, O.PULL_ARC, C.ask)
    elseif st == "cooldown" then
        ring(b, LH.lastReq, LH.COOLDOWN, { 0, 0, 0 }, 0.55, true)
    end
    O.st, O.enterAt, O.inC = st, t, nil   -- 新状态的动画刚播：下面 O.Combat 按现在战斗与否重新判一次（战斗中进来 = 马上暂停）
end
-- 战斗中：整球 35% 透明，转圈 / 呼吸暂停（不是停：脱战接着转）；Cooldown 按真实时间走不用管
function O.Combat(inC)
    local b = O.btn
    if not b then return end
    b:SetAlpha(inC and 0.35 or 1)
    local was = O.inC
    O.inC = inC
    if inC == was or (not inC and was == nil) then return end   -- 没变 / 刚进新状态又不在战斗（本来就在播）
    for _, k in ipairs({ "arc", "breath" }) do
        local g = A[k]
        local on = (k == "arc" and O.arcOn) or (k == "breath" and O.breathOn)
        if g and on then
            if inC then pcall(g.Pause, g) else pcall(g.Play, g) end
        end
    end
end

-- ---------- 每秒画一次（只在状态 / 层号 / 秒数 / 角标变了时才动控件）----------
local BR = { ingroup = { "队", "G" }, afterinst = { "等", "W" } }
function O.Paint(st, sec)
    local b = O.btn
    -- 11-24 用户「不切位面的时候，层数为啥老自己变动」：球心改层码后两位（不换层永不变、会员之间一致），颜色也按层码取（不再跟名次跳）
    local _, _, z = O.MyLayer()
    local no = z and (z % 100 + 1)
    local solid = SOLID[st]
    local tr, br, brCol = "", "", nil
    if st == "ask" then
        local ch = LH.pending and LH.pending.chain
        if ch and ch.n then tr = ch.n .. "/" .. LH.CHAIN_MAX end
    elseif st == "asked" then
        tr = tostring(O.Asks())
    elseif BR[st] then
        br = L(BR[st][1], BR[st][2])
    elseif st == "nocredit" then
        br = "0"; brCol = (IsInGuild and IsInGuild()) and { 1, 0.6, 0.2 } or C.fail
    else
        -- 11-24 右下角标 = 公会外额度还剩几次（金色；只剩 1 次橙色；0 次红 / 橙见上）；不限 / 不用额度不显示
        local n = O.Credits()
        if n then br = tostring(n); brCol = n <= 1 and { 1, 0.6, 0.2 } or { 1, 0.82, 0 } end
    end
    local l = LH.last
    local notch = not solid and l and not l.ok and now() - (l.t or -1e9) < O.RECENT
    local ctext, icon = nil, nil
    if st == "ask" or st == "confirm" then ctext = (sec or 0) > 0 and tostring(math.ceil(sec)) or "…"
    elseif st == "ok" then icon = TEX_OK
    elseif st == "fail" then icon = TEX_NO
    elseif st == "asked" then ctext = "!"
    elseif st == "pull" then ctext = L("→", ">")
    elseif st == "nolayer" or not no then ctext = "?"
    else ctext = string.format("%02d", z % 100) end
    -- 左下角标：层码（认出了才有）→ 没有就兜底第几层（层码还没确认时按名次）→ 都没有不显示
    local code, codeC = "", C.grey
    if z then code, codeC = LY.Tail(z), layerRGB(no)
    else
        local m0, z0 = LY.Mine()
        local n = z0 and LY.LayerNo(m0, z0)
        if n then code = string.format(L("%d层", "L%d"), n) end
    end
    local auto = O.AutoOn() and true or false
    local key = table.concat({ st, tostring(no), ctext or icon or "", tr, br, code, notch and 1 or 0, auto and 1 or 0 }, "|")
    if key == O.key then return false end
    O.key = key
    local ringC, bodyC, bodyA, textC
    if solid then
        ringC, bodyC, bodyA, textC = { solid[1] * 0.45, solid[2] * 0.45, solid[3] * 0.45 }, solid, 1, (st == "ask" or st == "confirm") and { 0.12, 0.10, 0.02 } or { 1, 1, 1 }
    else
        local lc = (st == "nolayer" or st == "afterinst") and C.grey or layerRGB(no)
        ringC, bodyC, bodyA, textC = lc, (st == "ingroup") and C.group or C.body, 0.92, lc
    end
    b.ring:SetVertexColor(ringC[1], ringC[2], ringC[3]); b.ring:SetAlpha(st == "nolayer" and 0.55 or 1)   -- 没认出层：灰、淡（不打扰）
    b.body:SetVertexColor(bodyC[1], bodyC[2], bodyC[3]); b.body:SetAlpha(bodyA)
    if icon then
        b.icon:SetTexture(icon); b.icon:Show(); b.center:SetText("")
    else
        b.icon:Hide(); b.center:SetText(ctext or ""); b.center:SetTextColor(textC[1], textC[2], textC[3])
    end
    b.tr:SetText(tr); b.tr:SetTextColor(1, 1, 1)
    b.code:SetText(code); b.code:SetTextColor(codeC[1], codeC[2], codeC[3])
    b.br:SetText(br)
    if brCol then b.br:SetTextColor(brCol[1], brCol[2], brCol[3]) else b.br:SetTextColor(0.85, 0.85, 0.85) end
    b.notch:SetShown(notch and true or false)
    -- 左上小点：绿实心 = 自动帮别人开着；灰淡 = 关着（提示可以打开攒额度；只在这次登录第一次看到时闪一下，不常驻闪）
    if auto then b.dot:SetVertexColor(C.ok[1], C.ok[2], C.ok[3]); b.dot:SetAlpha(1)
    else
        b.dot:SetVertexColor(C.grey[1], C.grey[2], C.grey[3]); b.dot:SetAlpha(0.7)
        if not O.dotFlashed and A.dot then O.dotFlashed = true; pcall(A.dot.Play, A.dot) end
    end
    b.dot:Show()
    return true
end

-- 主入口：每秒（LY.OnTick）/ 层变了 / 出结果 / 点了以后调。force = 按现在的状态重来（动画重播）
local BUSY = { ask = true, confirm = true }
local DROP_OK = { ask = true, confirm = true, ok = true, fail = true, off = true, inst = true }
function O.Update(force)
    if not LY.DB().on or not O.Shown() then
        if O.btn then O.btn:Hide() end
        return "hidden"
    end
    local st, sec = O.State()
    if st == "off" or st == "inst" then
        if O.btn then O.btn:Hide() end
        return st
    end
    -- 降级防抖：从求助中 / 确认中掉回常态要连续 2 次都判出不在进行中（自动换人那一下别闪一下常态）
    if BUSY[O.st] and not DROP_OK[st] and not force then
        if not O.drop then O.drop = true; return O.st end
    end
    O.drop = nil
    local b = O.Build()
    if not b:IsShown() then b:Show() end
    if force or st ~= O.st then O.Enter(st, sec) end
    O.Paint(st, sec)
    O.Combat(LY.InCombat() and true or false)
    if GameTooltip and GameTooltip.IsOwned then
        local ok, own = pcall(GameTooltip.IsOwned, GameTooltip, b)
        if ok and own then O.Tip(b) end   -- 悬停中每秒重画，倒计时会动
    end
    return st
end

-- ---------- 悬停提示（设计稿 §6）----------
local function short(n) return (tostring(n or "?"):gsub("%-.*$", "")) end
local function left(sec) return ns.LayerPub and ns.LayerPub.LeftText(sec) or (math.ceil(sec) .. L(" 秒", "s")) end
local function why(k) return (ns.LayerPub and ns.LayerPub.WHY[k]) or k end
-- 当前状态一句（和位面页 hopSt 那一行同样的意思）, r, g, b
function O.StatusText(st, sec)
    local t, p = now(), LH.pending
    if st == "ask" then
        local who = p and p.helper and short(p.helper) or L("公会会员或同图插件用户", "a guildmate or nearby GI user")
        local ch = p and p.chain
        return string.format(L("等 %s 邀请你（还剩 %d 秒）", "Waiting for %s to invite you (%ds)"), who, math.ceil(sec or 0))
            .. ((ch and ch.n) and string.format(L(" · 正在请第 %d/%d 位", " - asking %d/%d"), ch.n, LH.CHAIN_MAX) or ""), C.busy
    elseif st == "confirm" then
        local c = LH.ctx
        local who = short((p and (p.leader or p.helper)) or (c and c.leader) or "?")
        return string.format(L("已进 %s 的队，先别退队：确认中（最多 %d 秒）· 指一下附近 NPC / 怪更快", "Joined %s - stay; confirming (up to %ds)"), who, math.ceil(sec or 0)), C.busy
    elseif st == "ok" or st == "fail" then
        return (LH.LastText and LH.LastText()) or (LH.last and LH.last.text) or "", st == "ok" and C.ok or C.fail
    elseif st == "asked" then
        local _, _, q = O.Asks()
        return string.format(L("%s 想换到你这层 · 左键 = 邀请", "%s wants your layer - left-click to invite"), short(q and q.from)), C.ask
    elseif st == "pull" then
        return string.format(L("正在把 %s 拉到你这层…", "Pulling %s to your layer..."), short(O.Pulling())), C.ask
    elseif st == "combat" then return why("combat"), C.grey
    elseif st == "afterinst" then
        return string.format(L("刚出副本，%s内先别换", "Just left an instance - wait %s"), left(LH.AFTER_INST - (t - (LY.leftInstanceAt or -1e9)))), C.grey
    elseif st == "ingroup" then return why("ingroup"), C.grey
    elseif st == "nolayer" then return why("nolayer"), C.grey
    elseif st == "cooldown" then return string.format(L("刚求助过，%s后可再求", "Just asked - again in %s"), left(LH.CooldownLeft())), C.grey
    elseif st == "nocredit" then
        return L("公会外换层额度 0：只能找公会会员 / 帮别人拉一次 +1", "No out-of-guild credits: guildmates only / help someone (+1)")
            .. (O.AutoOn() and "" or L(" · 打开自动帮别人就能攒（Ctrl+左键）", " - turn on auto-help to earn (Ctrl-click)")), { 1, 0.6, 0.2 }
    end
    local _, _, z = O.MyLayer()
    return string.format(L("层码 %s · 可以求助", "Code %s - ready"), LY.Tail(z)), C.ok
end
-- 左键现在会做什么（提示最后一段用）
function O.LeftText(st)
    if st == "asked" then local _, _, q = O.Asks(); return string.format(L("左键：邀请 %s", "Left: invite %s"), short(q and q.from)) end
    if st == "ask" or st == "confirm" or st == "pull" then return L("左键：看进度（不重复求助）", "Left: show progress (no re-ask)") end
    if st == "ready" or st == "fail" or st == "nocredit" then
        if LY.DB().orbClick == false then return L("左键：打开位面页", "Left: open the Layers tab") end
        return L("左键：我想换一层", "Left: switch layer")
    end
    return L("左键：说明现在为什么不能换", "Left: why you can't switch now")
end
function O.Tip(self)
    local tt = GameTooltip
    if not tt then return end
    tt:SetOwner(self, "ANCHOR_RIGHT")
    local st, sec = O.State()
    local no, m, z = O.MyLayer()
    tt:AddLine(O.BRAND .. L(" · 位面", " - Layers"), 1, 1, 1)   -- 11-24「展示清楚是GI插件」：第一行 = 插件标题
    if no then
        local c = layerRGB(z % 100 + 1)
        tt:AddLine(LY.MapName(m) .. " · " .. string.format(L("层码 %s（第 %d 层，按在用层码排的名次，会随别人变）", "code %s (layer %d - a rank, may shift)"), LY.Tail(z), no), c[1], c[2], c[3], true)
    else
        tt:AddLine(LY.MapName(m) .. L(" · 还没认出在哪层", " - layer unknown"), 0.6, 0.6, 0.6)
    end
    local s, c = O.StatusText(st, sec)
    tt:AddLine(s, c[1], c[2], c[3], true)
    local cr, auto = O.Credits(), O.AutoOn()
    local low = cr ~= nil and cr <= 1
    if low and not auto then   -- 11-24 额度用完 / 快用完：最先说「打开自动帮别人就能攒」
        tt:AddLine(string.format(L("公会外额度只剩 %d 次 —— 打开自动帮别人就能攒（Ctrl+左键）", "Only %d credit(s) left - turn on auto-help to earn more (Ctrl-click)"), cr), 1, 0.82, 0, true)
    end
    tt:AddLine(" ")
    -- 同图公会会员分层（_LayerUI 的 LH.GuildByLayer，最多列 4 层）
    local okG, _, _, groups = pcall(LH.GuildByLayer or function() return nil, nil, {} end)
    local n, parts, more = 0, {}, 0
    for _, g in ipairs(okG and groups or {}) do
        local k = #(g.members or {})
        if k > 0 then
            n = n + k
            if #parts < 4 then parts[#parts + 1] = (g.name or "?") .. " " .. k else more = more + 1 end
        end
    end
    tt:AddLine(string.format(L("同图公会会员：%d 人", "Guildmates on this map: %d"), n)
        .. (#parts > 0 and ("（" .. table.concat(parts, " · ") .. (more > 0 and string.format(L(" 等 %d 层", " +%d"), more) or "") .. "）") or ""), 1, 1, 1, true)
    if LY.DB().pub then
        local okP, _, total = pcall(ns.LayerPub and ns.LayerPub.Collect or function() return {}, 0 end, m)
        tt:AddLine(string.format(L("同图插件用户（公共频道）：%d 人", "Other GI users here (public channel): %d"), okP and tonumber(total) or 0), 1, 1, 1)
    else
        tt:AddLine(L("公共频道关着：只和公会会员互通", "Public channel off: guild only"), 0.6, 0.6, 0.6)
    end
    local LC = ns.LayerCredit
    if LC then
        if LC.Unlimited() then
            tt:AddLine(L("公会外换层额度：不限（Gearinsight 公会）", "Out-of-guild credits: unlimited (Gearinsight guild)"), 0.2, 1, 0.4)
        else
            local lf, _, bank = LC.Left()
            tt:AddLine(string.format(L("公会外换层额度：还剩 %d 次（每天送 %d · 攒下 %d）", "Out-of-guild credits: %d left (%d free daily - %d saved)"), lf, LC.FREE, bank),
                1, lf > 0 and 0.82 or 0.4, lf > 0 and 0 or 0.35)
        end
    end
    if auto then
        tt:AddLine(L("自动帮别人：开（没组队时直接拉）", "Auto-help: ON (invite when solo)") .. (LH.autoAll and L(" · 这次登录全自动", " - all this session") or ""), 0.2, 1, 0.4)
        local mins = O.AhMinutes()
        if mins and mins > 0 then
            tt:AddLine(string.format(L("正在攒额度：再在线 %d 分钟 +1（帮拉成一次另外 +1）", "Earning: +1 in %d min online (+1 more per pull)"), mins), 0.2, 1, 0.4, true)
        elseif mins == 0 then
            tt:AddLine(L("攒满了（用掉一次再接着攒）", "At max - resumes after you spend one"), 0.2, 1, 0.4, true)
        end
    else
        tt:AddLine(L("自动帮别人：关", "Auto-help: OFF"), 0.6, 0.6, 0.6)
        if not low then tt:AddLine(O.AH_TEXT(), 1, 0.82, 0, true) end   -- 11-24 鼓励互助：醒目金色一行（额度快用完时上面已经先说了）
    end
    local l, h, t = LH.last, LH.lastHop, now()
    if l and t - (l.t or -1e9) < O.RECENT then
        tt:AddLine(L("最近：", "Recent: ") .. ((LH.LastText and LH.LastText()) or l.text or ""), l.ok and 0.2 or 1, l.ok and 1 or 0.45, l.ok and 0.4 or 0.35, true)
    elseif h and h.ok and h.t then
        tt:AddLine(string.format(L("最近：%d 分钟前 换层成功（%s 拉的）", "Recent: moved %dm ago (pulled by %s)"), math.max(1, math.floor((t - h.t) / 60)), short(h.who or h.leader)), 0.6, 0.6, 0.6, true)
    end
    tt:AddLine(" ")
    tt:AddLine(O.LeftText(st), 0.7, 0.7, 0.7)
    tt:AddLine(L("Shift+左键：开关位面页 · Ctrl+左键：开关自动帮别人", "Shift-click: Layers tab - Ctrl-click: auto-help on/off"), 0.7, 0.7, 0.7, true)
    tt:AddLine(L("右键：菜单 · 按住左键拖：挪位置", "Right-click: menu - Drag: move"), 0.7, 0.7, 0.7, true)
    tt:Show()
end

-- ---------- 交互 ----------
-- 打开位面页（已经停在位面页就不动，别把面板关了 —— 同 PageLayer.lua ensureSideTab）
function O.OpenPage()
    local h = _G.GearInsightForeverMain
    if h and h:IsShown() and ns.db and ns.db.ui and ns.db.ui.page == "layer" then return end
    if ns.ToggleMain then ns.ToggleMain("layer") end
end
local function refreshPage()
    local LG = ns.LayerGuild
    local p = LG and LG.page
    if p and p.refreshNow and p:IsShown() then pcall(p.refreshNow) end
end
local function say(ok, w, sent, detail)
    local LP = ns.LayerPub
    if LP and LP.Msg then return LP.Msg(ok, w, sent, detail) end
    ns.Print(tostring(detail or sent or w))
end
O.SENT = function() return L("已向公会和同图的插件用户求助：别的层的人一邀请你就自动进队，换过去后自动退队", "Asked guildmates and nearby GI users - you'll auto-join, then leave once moved") end
-- 「我想换一层」：走 LH.Request（_LayerUI 的 LayerCredit.lua 包过：公会外额度在这里扣 / 只找公会）
function O.Request()
    local ok, w, detail = LH.Request(nil)
    say(ok, w, O.SENT(), detail)
    refreshPage()
    O.Update(true)
    return ok, w
end
-- 有人求我：等于弹框里的「邀请」（⛔ 只在鼠标点击里调）
function O.Invite()
    local _, k = O.Asks()
    if not k then return false end
    local ok = LH.HelpInvite(k)
    if ok then LY.Stat("c") end
    O.Update(true)
    return ok
end
-- 第一次左键：问一次「以后点球就直接求助吗」（存档 layer.orbClick；× = 这次先不定，下次再问）
function O.AskFirst()
    return LY.AskOnce("orbClick", {
        text = L("点位面小球 = 直接「我想换一层」（向公会会员和同图插件用户求助，有人一邀请你就自动进队换过去）。以后点球都直接求助吗？",
            "Clicking the layer orb = \"Switch layer\" (asks guildmates and nearby GI users). Always do that on click?"),
        yes = L("以后点球直接求助", "Always ask on click"), no = L("点球只打开位面页", "Just open the Layers tab"),
        onYes = function() O.Request() end,
        onNo = function() O.OpenPage() end,
    })
end
function O.Click(self, btn)
    if O.dragAt and now() - O.dragAt < O.DRAG_GUARD then return end   -- 刚拖完：不算点击
    if btn == "RightButton" then return O.Menu(self) end
    if IsShiftKeyDown and IsShiftKeyDown() then
        if ns.ToggleMain then ns.ToggleMain("layer") end
        return "page"
    end
    if IsControlKeyDown and IsControlKeyDown() then return O.ToggleAuto() end
    local st, sec = O.State()
    if st == "asked" then return O.Invite() and "invite" or "invite-fail" end
    if st == "pull" then
        say(true, nil, string.format(L("正在把 %s 拉到你这层，等他进队", "Pulling %s to your layer - waiting for them to join"), short(O.Pulling())))
        return "progress"
    end
    if st == "ask" or st == "confirm" then
        local _, txt = LH.AlreadyMoved(nil, false)
        say(true, nil, txt or (O.StatusText(st, sec) .. L("，别重复点", " - no need to click again")))
        O.OpenPage()
        return "progress"
    end
    if st == "ready" or st == "fail" or st == "nocredit" then
        local a = LY.DB().orbClick
        if a == false then O.OpenPage(); return "page" end
        if a == nil then O.AskFirst(); return "ask-first" end
    end
    O.Request()   -- 没认出层 / 在队伍里 / 冷却 / 刚出副本 / 战斗：LH.Request 不会发，只返回原因（屏幕 + 聊天框一句，5 秒内同句只出一次）
    return "request"
end
-- 「自动帮别人」快捷开关：同位面页右上那个按钮（开 = 顺带打开「我愿意帮」）；聊天框回一句当前状态（LY.SetAuto 说）
function O.ToggleAuto()
    local d = LY.DB()
    local on = not (d.autoHelp == true and d.helper)
    if on then d.helper = true end
    LY.SetAuto("autoHelp", on)
    if LY.Beat then pcall(LY.Beat, true) end
    refreshPage()
    O.Update(true)
    return on and "auto-on" or "auto-off"
end
-- 隐藏 / 显示（隐藏 = 只收球，不关位面功能）
function O.SetHide(hide)
    local o = O.DB()
    o.hide = hide and true or nil
    o.show = (not hide) or nil   -- 打开过 = 记住，下次登录 3 秒后照常加载显示
    if hide then
        if O.btn then O.btn:Hide() end
        ns.Print(L("位面小球已隐藏。找回：GI 菜单 → 设置 → 窗口与提醒「位面小球」点「显示」；或位面页设置里勾「屏幕上显示位面小球」；或 /gi layer orb",
            "Layer orb hidden. Bring it back: GI menu > Settings > Windows & alerts > Layer orb, the Layers tab settings, or /gi layer orb"))
    else
        O.Update(true)
    end
    refreshPage()
end
function O.Reset()
    local o, on = O.DB(), O.Shown()
    o.pos, o.hide = nil, nil
    if on then o.show = true end   -- 复位只回默认位置，显示着的照样显示（默认不显示后没了 pos 就不算显示）
    if O.btn then O.Place(O.btn) end
    O.Update(true)
end
-- 右键菜单（ns.PopMenu，⛔ 不用 EasyMenu / UIDropDownMenu）
local GREY = "|cff888888"
function O.MenuItems()
    local st = O.State()
    local no = O.MyLayer()
    local can = st == "ready" or st == "fail" or st == "nocredit"
    local items = {
        -- 11-24 鼓励互助：「自动帮别人」放第一项；关着时写清楚好处
        { text = O.AutoOn() and ("|cff33ff66√|r " .. L("自动帮别人（没组队时）· 点了关掉", "Auto-help (when solo) - click to turn off"))
            or ("|cffffd100" .. L("打开自动帮别人（每 10 分钟额度 +1）", "Turn on auto-help (+1 credit / 10 min)") .. "|r"), fn = function() O.ToggleAuto() end },
        { text = can and L("我想换一层", "Switch layer") or (GREY .. L("我想换一层（现在不能，点了看原因）", "Switch layer (not now - click for why)") .. "|r"),
            fn = function() O.Request() end },
        { text = L("打开位面页", "Open the Layers tab"), fn = function() O.OpenPage() end },
        { text = (LH.autoAll and "|cff33ff66√|r " or "    ") .. L("这次登录全自动帮人", "Auto-invite everyone this session"), fn = function()
            LH.autoAll = not LH.autoAll or nil
            ns.Print(LH.autoAll and L("这次登录没组队时自动拉人（重登恢复）", "Auto-invite while solo this session") or L("这次登录全自动帮人：关", "Session auto-invite: off"))
            if LY.Beat then pcall(LY.Beat, true) end
            O.Update(true)
        end },
        { text = L("复位位置", "Reset position"), fn = function() O.Reset() end },
        { text = L("隐藏小球（窗口与提醒里找回）", "Hide the orb (Windows & alerts to restore)"), fn = function() O.SetHide(true) end },
    }
    return items, O.BRAND .. string.format(L(" · 位面 · %s", " - Layers - %s"), no and LY.LayerName(LY.Mine()) or L("层未知", "layer unknown"))
end
function O.Menu(anchor)
    if not ns.PopMenu then return end
    local items, title = O.MenuItems()
    ns.PopMenu(anchor or O.btn, title, items)
    if GameTooltip then GameTooltip:Hide() end
    return "menu"
end
-- /gi layer orb [show|hide|reset|on|off]（不带 = 显示 / 隐藏切换）：主插件 Layer.lua 的「窗口与提醒」三个按钮也转到这里
function O.Slash(arg)
    local a = tostring(arg or ""):lower():gsub("%s", "")
    local d = LY.DB()
    if a == "reset" or a:find("复位", 1, true) then
        O.Reset()
        return ns.Print(L("位面小球：已回到默认位置（屏幕中间偏右），按住左键可以拖", "Layer orb reset - drag it with the left button"))
    elseif a == "off" or a == "关" then
        d.on = false; LY.SyncPub(); O.Update()
        return ns.Print(L("位面识别已关闭（小球跟着收起）", "Layer detection off (orb hidden)"))
    elseif a == "on" or a == "开" then
        d.on = true; LY.SyncPub(); LY.Beat(true); O.Update(true)
        return ns.Print(L("位面识别已打开", "Layer detection on"))
    end
    local hide
    if a == "hide" or a:find("隐藏", 1, true) then hide = true
    elseif a == "show" or a:find("显示", 1, true) then hide = false
    else hide = O.Shown() end
    O.SetHide(hide)
    if not hide then
        ns.Print(d.on and L("位面小球：已显示（右键菜单里能隐藏）", "Layer orb shown (hide it from its right-click menu)")
            or L("位面小球：已设为显示，位面识别关着所以看不到 —— /gi layer orb on 打开", "Layer orb enabled, but layer detection is off - /gi layer orb on"))
    end
end

-- 「窗口与提醒」那一行（主插件 Layer.lua 登记了占位，名字 / 状态 / 按钮第一次被读时加载本子插件来这里取）
O.Win = {
    title = function() return L("位面小球", "Layer orb") end,
    state = function()
        if not LY.DB().on then return L("位面识别关着", "Layer detection off") end
        if not O.Shown() then return L("没显示（默认不显示）", "Not shown (off by default)") end
        return L("显示中（左键换层、右键菜单、按住拖动）", "Shown (left-click to switch, right-click menu, drag to move)")
    end,
    actions = function()
        local hid, on = not O.Shown(), LY.DB().on
        return {
            { text = hid and L("显示", "Show") or L("隐藏", "Hide"), fn = function() O.Slash(hid and "show" or "hide") end },
            { text = L("复位位置", "Reset position"), fn = function() O.Slash("reset") end },
            { text = on and L("关掉位面功能", "Turn off layers") or L("打开位面功能", "Turn on layers"), fn = function() O.Slash(on and "off" or "on") end },
        }
    end,
}

-- 引导一句（位面页勾的悬停 + 额度卡片悬停里，球没显示时才写）
function O.GUIDE() return L("位面页勾上「屏幕上显示位面小球」可在屏幕上随时看层号和剩余次数", "Tick \"Show the layer orb on screen\" in the Layers tab to see your layer and credits anytime") end
-- 位面页设置区多一个勾「屏幕上显示位面小球」（页面的勾在 PageLayer.lua 的 p.checks 里排版；不加内核代码）
function O.MountCheck(p)
    if not p or rawget(p, "orbCk") or type(rawget(p, "checks")) ~= "table" or not rawget(p, "body") then return end
    local c = CreateFrame("CheckButton", nil, p.body, "UICheckButtonTemplate")
    c:SetSize(22, 22)
    c.t = p.body:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall"); c.t:SetPoint("LEFT", c, "RIGHT", 2, 0)
    c.t:SetText(L("屏幕上显示位面小球（左键换层 · 右键菜单）", "Show the layer orb on screen"))
    c.get = O.Shown
    c:SetScript("OnClick", function(self) O.SetHide(not self:GetChecked()) end)
    -- 默认不显示：悬停写清楚打开后有什么用
    c:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(O.GUIDE(), 1, 1, 1, true)
        GameTooltip:Show()
    end)
    c:SetScript("OnLeave", function() GameTooltip:Hide() end)
    c:SetChecked(c.get())
    p.checks[#p.checks + 1] = c
    p.orbCk = c
end

-- ---------- 挂上（存档已读好才跑：按需加载时 LayerPub.lua 末尾的 FlushInits；网易DD 包并进主文件夹时跟 ns.modules 一起）----------
ns.AddInit(function()
    -- 出结果（成功 / 失败）马上落地动画，不等下一秒
    local res0 = LH.SetResult
    LH.SetResult = function(...)
        res0(...)
        pcall(O.Update)
    end
    local slash0 = ns.LayerSlash
    ns.LayerSlash = function(sub, arg, low)
        if sub == "orb" then return O.Slash(arg) end
        if slash0 then return slash0(sub, arg, low) end
    end
    local LP = ns.LayerPub
    if LP and LP.Refresh then
        local r0 = LP.Refresh
        LP.Refresh = function(p, ...)
            pcall(O.MountCheck, p)
            return r0(p, ...)
        end
    end
    local LG = ns.LayerGuild
    if LG and LG.page then pcall(O.MountCheck, LG.page) end
    LY.OnTick(function() O.Update() end)
    LY.OnChange(function() O.Update() end)
    pcall(O.Update)
end)

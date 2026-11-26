-- 猎人强击光环随时提醒（2026-11-25 用户：「设计猎人这个随时提醒功能做」，截图强击光环 等级 5 · 持续 30 分钟）
-- 《无限》里强击光环是 30 分钟的增益，到点自己掉；掉了没人说，一打就少一截远程攻强。
--   · 点了强击光环天赋才启用（没点 = 完全静默）；活着、没坐飞行 / 载具、没上马、不在城里休息时才看
--   · 身上没有 → 浮标出来（技能图标 + 「强击光环没开」，闪）；剩不到 2 分钟 → 浮标显示「剩 1:30」；有且够 → 浮标收起
--   · 没开就进战斗 → 屏幕上方说一句 + 响一声（60 秒内不重复）
--   · 脱战时左键点浮标 = 开强击光环；Shift + 拖动挪位置（位置记住）；右键关掉提醒
-- 浮标是普通框（战斗中照常显示 / 隐藏，不会被拦）；施法靠另一个盖在它上面的安全按钮：
--   只在脱战时摆位置 / 设属性 / 显示，进战斗由状态驱动自己藏起来 → 战斗中点浮标不施法，也不报「插件动作被阻止」。
-- 法术 ID 核对开服客户端 DB2 技能表（spellbook.json / TrainNowData.lua）：1299348 等级 2 · 20905 等级 4 · 20906 等级 5；
--   19506 = 天赋点出的等级 1（经典旧世 ID）；等级 3 的 ID 表里没有 → 按 ID 找不到再按名字找一遍。
-- 只有猎人加载（GearInsight_Forever_ClassHunter，主插件 ClassStub.lua 只给猎人 LoadAddOn）；文件头再挡一次。
-- ⛔ 不注册战斗记录事件；不建每帧脚本（倒计时只在浮标显示剩余时间时用 C_Timer 一秒一跳）；每个 API 都 pcall / 判空；不给暴雪全局赋值；不自动发言。
local _, ns = ...; ns = _G.GearInsightForever or ns
if not ns or select(2, UnitClass("player")) ~= "HUNTER" then return end

local T = { LOW = 120, GAP = 60 }
ns.TrueshotRemind = T
T.IDS = { 20906, 20905, 1299348, 19506 }
T.NAMES = { ["强击光环"] = true, ["Trueshot Aura"] = true }
T.ICON = "Interface\\Icons\\Ability_TrueShot"
T.KEYS = "强击光环 强击 光环 提醒 trueshot aura 猎人 hunter"   -- 设置搜索词
local HAS = {}
for _, id in ipairs(T.IDS) do HAS[id] = true end
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function none() end
local function clean(v) if v == nil or (ns.Secret and ns.Secret(v)) then return nil end return v end
local function num(v) v = clean(v); return v ~= nil and tonumber(v) or nil end
local function now() return (GetTime and GetTime()) or 0 end
local function call(f, ...)
    if not f then return nil end
    local ok, a = pcall(f, ...)
    if ok then return clean(a) end
    return nil
end
local function yes(f, ...) return call(f, ...) and true or false end
local function inCombat() return yes(InCombatLockdown) end

-- ---------- 设置（存档 ns.db.tsRemind）----------
function T.DB()
    if type(ns.db) ~= "table" then return {} end
    if type(ns.db.tsRemind) ~= "table" then ns.db.tsRemind = {} end
    return ns.db.tsRemind
end
function T.On() return ns.db ~= nil and T.DB().on ~= false end
function T.Sound() return T.DB().snd ~= false end
function T.Msg() return T.DB().msg ~= false end

-- ---------- 会不会 / 身上有没有 ----------
-- 会强击光环 → 返回本地化技能名（安全按钮按名字施放 = 自动用会的最高一级）；不会 → false。结果记着，技能变了（SPELLS_CHANGED）再查
function T.Known(force)
    if T.kn ~= nil and not force then return T.kn end
    local name = false
    for _, id in ipairs(T.IDS) do
        if yes(IsPlayerSpell, id) or yes(IsSpellKnown, id) then
            name = call(GetSpellInfo, id) or L("强击光环", "Trueshot Aura")
            break
        end
    end
    if not name then   -- 等级 3 的 ID 不在表里：按名字查技能书（没学的技能按名字查不到）
        for n in pairs(T.NAMES) do
            local got = call(GetSpellInfo, n)
            if type(got) == "string" then name = got; break end
        end
    end
    T.kn = name
    return name
end
-- 身上有没有强击光环 → 有没有, 到期时刻（没有期限 / 读不到 = nil）。别的猎人给的也算（光环效果一样）
local function expire(v) v = num(v); if v and v > 0 then return v end return nil end
function T.Aura()
    local get = C_UnitAuras and C_UnitAuras.GetPlayerAuraBySpellID
    if get then
        for _, id in ipairs(T.IDS) do
            local ok, a = pcall(get, id)
            if ok and type(a) == "table" and not (ns.Secret and ns.Secret(a)) then return true, expire(a.expirationTime) end
            if ok and a ~= nil and type(a) ~= "table" then return nil end
        end
    end
    -- 11-26 用户截图（奥山里身上明明有 30 分钟的强击光环还报没开）：别的等级 / 别的猎人给的那个 ID 不在表里时要逐个增益比名字，
    --   这一步原来只会用 UnitBuff（新客户端可能没有这个接口 → 直接当「没有」）；先用 C_UnitAuras.GetAuraDataByIndex
    local at = C_UnitAuras and C_UnitAuras.GetAuraDataByIndex
    if at then
        T.via = "idx"
        for i = 1, 40 do
            local ok, a = pcall(at, "player", i, "HELPFUL")
            if not ok then return nil end
            if a == nil then return false end
            if type(a) ~= "table" or (ns.Secret and ns.Secret(a)) then return nil end
            local name, sid = clean(a.name), clean(a.spellId)
            if not name and not sid then return nil end
            if (name and T.NAMES[name]) or (sid and HAS[sid]) then return true, expire(a.expirationTime) end
        end
        return false
    end
    T.via = UnitBuff and "ub" or "none"
    if not UnitBuff then return nil end
    -- 11-26 用户截图「战斗中错误判断」：战斗里增益读出来是保密值 → 原来当成「没有」报「强击光环没开」。
    --   读不到 = 不知道（返回 nil），T.State 沿用战斗前最后一次读到的结果
    for i = 1, 40 do
        local r = { pcall(UnitBuff, "player", i) }
        if not r[1] then return nil end
        if type(r[2]) == "nil" then break end
        local name = clean(r[2])
        if not name then return nil end
        local sid = clean(r[11])
        if T.NAMES[name] or (sid and HAS[sid]) then return true, expire(r[7]) end
    end
    return false
end
-- 这些时候不提醒：死了 / 坐飞行 / 载具 / 骑着马 / 城里休息
function T.Quiet()
    return yes(UnitIsDeadOrGhost, "player") or yes(UnitOnTaxi, "player") or yes(UnitInVehicle, "player")
        or yes(IsMounted) or yes(IsResting)
end
-- → "off"（不管）/ "miss"（没开）/ "low"（剩不到 2 分钟）/ "ok", 到期时刻
function T.State()
    if not T.On() or not T.Known() or T.Quiet() then return "off" end
    local has, exp = T.Aura()
    if has == nil then has, exp = T.lastHas ~= false, T.lastExp else T.lastHas, T.lastExp = has, exp end
    if not has then return "miss" end
    if exp and exp - now() < T.LOW then return "low", exp end
    return "ok", exp
end

-- ---------- 浮标 ----------
local ui = {}
local win, sec
T.ui = ui
local function fmt(s)
    s = math.max(0, math.floor(s + 0.5))
    return string.format("%d:%02d", math.floor(s / 60), s % 60)
end
local function savePos()
    if not win then return end
    local p, _, _, x, y = win:GetPoint()
    T.DB().pos = { p or "CENTER", x or 0, y or 0 }
end
local function place(f)
    local pos = T.DB().pos
    f:ClearAllPoints()
    if type(pos) == "table" and pos[1] then f:SetPoint(pos[1], UIParent, pos[1], tonumber(pos[2]) or 0, tonumber(pos[3]) or 0)
    else f:SetPoint("CENTER", UIParent, "CENTER", -120, -210) end
end
local function tip(self)
    if not (GameTooltip and GameTooltip.SetOwner) then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:AddLine("|cff33ff99GI|r " .. L("强击光环提醒", "Trueshot Aura reminder"))
    GameTooltip:AddLine(inCombat() and L("战斗中点浮标不施法，请按自己的技能键", "In combat the icon can't cast - use your own keybind")
        or L("左键：开强击光环", "Left-click: cast Trueshot Aura"), 1, 1, 1)
    GameTooltip:AddLine(L("按住拖动：挪位置    右键：关掉提醒", "Drag: move    Right-click: turn off"), 0.6, 0.6, 0.6)
    GameTooltip:Show()
end
local function untip() if GameTooltip then GameTooltip:Hide() end end
local function dragOn() if win then win:StartMoving() end end
local function dragOff()
    if not win then return end
    win:StopMovingOrSizing()
    savePos()
    T.Sync()
end
local function click(_, mb)
    if mb ~= "RightButton" then return end
    untip()
    T.SetOn(false)
    ns.Print(L("强击光环提醒已关。找回：设置里搜「强击」，或 /gi 强击 on", "Trueshot Aura reminder turned off. Bring it back: search \"trueshot\" in Settings, or /gi trueshot on"))
end
local function wire(f)
    if f.RegisterForDrag then f:RegisterForDrag("LeftButton") end
    f:SetScript("OnEnter", tip)
    f:SetScript("OnLeave", untip)
    f:SetScript("OnDragStart", dragOn)
    f:SetScript("OnDragStop", dragOff)
end
local function circle(owner, tex)
    if not (tex.AddMaskTexture and owner.CreateMaskTexture) then return end
    local m = owner:CreateMaskTexture()
    if not m then return end
    m:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    m:SetAllPoints(tex)
    tex:AddMaskTexture(m)
end
local function buildWin()
    local f = CreateFrame("Button", "GearInsightForeverTrueshotOrb", UIParent)
    f:SetSize(40, 40); f:SetFrameStrata("MEDIUM"); f:SetClampedToScreen(true); f:SetMovable(true)
    place(f)
    if f.RegisterForClicks then f:RegisterForClicks("LeftButtonUp", "RightButtonUp") end
    ui.tag = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ui.tag:SetPoint("BOTTOM", f, "TOP", 0, 0)
    ui.tag:SetText("|cff33ff99GI|r " .. L("强击", "Trueshot"))
    ui.disc = f:CreateTexture(nil, "BACKGROUND", nil, 1)
    ui.disc:SetSize(36, 36); ui.disc:SetPoint("CENTER", f, "CENTER", 0, 0); ui.disc:SetColorTexture(0.06, 0.05, 0.04, 0.95)
    circle(f, ui.disc)
    ui.ic = f:CreateTexture(nil, "ARTWORK")
    ui.ic:SetSize(30, 30); ui.ic:SetPoint("CENTER", ui.disc, "CENTER", 0, 0); ui.ic:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    ui.ic:SetTexture(T.ICON)
    circle(f, ui.ic)
    ui.ring = f:CreateTexture(nil, "OVERLAY", nil, 1)
    ui.ring:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    ui.ring:SetSize(68, 68); ui.ring:SetPoint("TOPLEFT", ui.disc, "TOPLEFT", -5, 5)
    ui.txt = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    ui.txt:SetPoint("TOP", ui.disc, "BOTTOM", 0, -1)
    local font, sz = ui.txt:GetFont()
    if font then pcall(ui.txt.SetFont, ui.txt, font, math.max(11, tonumber(sz) or 11), "OUTLINE") end
    -- 「没开」时闪：动画组自己跑，不建每帧脚本
    if f.CreateAnimationGroup then
        local ok, g = pcall(f.CreateAnimationGroup, f)
        local a = ok and g and g.CreateAnimation and g:CreateAnimation("Alpha")
        if a and a.SetFromAlpha then
            a:SetFromAlpha(1); a:SetToAlpha(0.35); a:SetDuration(0.6)
            if g.SetLooping then g:SetLooping("BOUNCE") end
            ui.blink = g
        end
    end
    wire(f)
    f:SetScript("OnClick", click)
    f:SetScript("OnHide", function(self) pcall(self.StopMovingOrSizing, self) end)   -- 拖到一半浮标收起：别粘在鼠标上
    f:Hide()
    return f
end
-- 安全按钮：左键 = 施放强击光环。挂在 UIParent 上、不锚浮标（锚上去浮标就跟着受保护，战斗中不能显示 / 隐藏）
local function buildSec()
    local ok, b = pcall(CreateFrame, "Button", "GearInsightForeverTrueshotCast", UIParent, "SecureActionButtonTemplate")
    if not ok or not b or not b.SetAttribute then return nil end
    b:SetSize(40, 40); b:SetFrameStrata("MEDIUM")
    if b.SetFrameLevel and win.GetFrameLevel then b:SetFrameLevel((tonumber(win:GetFrameLevel()) or 1) + 5) end
    -- 11-26 用户「位置应该可以移动」：改成松开鼠标才施法 → 直接按住拖就能挪（不用 Shift）；useOnKeyDown = false 让它不跟「按下即施法」的系统设置走
    if b.RegisterForClicks then b:RegisterForClicks("AnyUp", "AnyDown") end
    b:SetAttribute("useOnKeyDown", false)
    b:SetAttribute("type1", "spell")
    b:SetAttribute("shift-type1", "gimove")   -- Shift + 左键不施法（留给拖动）
    if RegisterStateDriver then
        b:SetAttribute("_onstate-gits", [[ if newstate == "1" then self:Hide() end ]])   -- 进战斗自己藏起来
        RegisterStateDriver(b, "gits", "[combat] 1; 0")
    end
    wire(b)
    b:SetScript("PostClick", click)
    b:Hide()
    return b
end
-- 把安全按钮对到浮标上（只在脱战时动它；战斗中记一笔，脱战补）
function T.Sync()
    if inCombat() then T.dirty = true; return false end
    T.dirty = nil
    local want = win ~= nil and win:IsShown() and T.Known() or false
    if not sec then
        if not want then T.secOn = false; return true end
        sec = buildSec()
        T.sec = sec
        if not sec then T.secOn = false; return true end
    end
    if want then
        local p, _, _, x, y = win:GetPoint()
        sec:ClearAllPoints()
        sec:SetPoint(p or "CENTER", UIParent, p or "CENTER", x or 0, y or 0)
        if T.secSpell ~= want then sec:SetAttribute("spell1", want); T.secSpell = want end
        sec:Show()
    else
        sec:Hide()
    end
    T.secOn = want and true or false
    return true
end
function T.Draw(st, exp)
    local show = st == "miss" or st == "low"
    if not win then
        if not show then return end
        win = buildWin()
        ui.win = win
    end
    if show then
        local miss = st == "miss"
        ui.txt:SetText(miss and ("|cffff4433" .. L("强击光环没开", "Trueshot Aura off") .. "|r")
            or ("|cffffd919" .. L("剩 ", "") .. fmt((exp or 0) - now()) .. "|r"))
        if ui.ic.SetDesaturated then ui.ic:SetDesaturated(miss) end
        if ui.blink then
            if miss then pcall(ui.blink.Play, ui.blink) else pcall(ui.blink.Stop, ui.blink); win:SetAlpha(1) end
        end
    end
    if win:IsShown() ~= show then win:SetShown(show) end
    T.shown = show
    if (T.secOn or false) ~= show or T.dirty then T.Sync() end
end
-- 定时器：显示剩余时间时一秒一跳；光环还够时只定一个「到剩 2 分钟那一刻」的闹钟（光环快到期不会有事件）。同一件事不重复定
function T.Tick(st, exp)
    local d
    if st == "low" then d = 1 elseif st == "ok" and exp then d = exp - now() - T.LOW + 0.2 end
    local key = d and (st .. exp) or nil
    if key == T.pend then return end
    T.pend = key
    if not d or not (C_Timer and C_Timer.After) then return end
    C_Timer.After(math.max(0.2, d), function()
        if T.pend ~= key then return end
        T.pend = nil
        pcall(T.Check, "tick")
    end)
end
function T.Check(why)
    local st, exp = T.State()
    T.st, T.exp = st, exp
    T.Draw(st, exp)
    T.Tick(st, exp)
    return st
end
-- 没开就进战斗：屏幕上方说一句 + 响一声（60 秒内不重复）
function T.Warn()
    if T.st ~= "miss" then return false end
    local t = now()
    if T.warned and t - T.warned < T.GAP then return false end
    T.warned = t
    if T.Msg() and UIErrorsFrame and UIErrorsFrame.AddMessage then
        pcall(UIErrorsFrame.AddMessage, UIErrorsFrame, L("强击光环没开！", "Trueshot Aura is not active!"), 1, 0.25, 0.1)
    end
    if T.Sound() and PlaySound then pcall(PlaySound, 8959) end
    return true
end
function T.SetOn(v) T.DB().on = v and true or false; T.Check("set") end
function T.ResetPos()
    T.DB().pos = nil
    if win then place(win); T.Sync() end
end

local ev = CreateFrame("Frame")
T.ev = ev
if ev.RegisterUnitEvent then pcall(ev.RegisterUnitEvent, ev, "UNIT_AURA", "player"); pcall(ev.RegisterUnitEvent, ev, "UNIT_SPELLCAST_SUCCEEDED", "player") else ev:RegisterEvent("UNIT_AURA") end
for _, e in ipairs({ "PLAYER_ENTERING_WORLD", "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED", "PLAYER_UPDATE_RESTING", "PLAYER_MOUNT_DISPLAY_CHANGED",
    "PLAYER_DEAD", "PLAYER_ALIVE", "PLAYER_UNGHOST", "PLAYER_CONTROL_GAINED", "PLAYER_CONTROL_LOST", "SPELLS_CHANGED" }) do
    pcall(ev.RegisterEvent, ev, e)
end
function T.OnEvent(e, unit, _, spell)
    if e == "UNIT_AURA" and unit ~= nil and unit ~= "player" then return end
    if e == "SPELLS_CHANGED" or e == "PLAYER_ENTERING_WORLD" then T.kn = nil end
    -- 增益读不到（保密）的地方靠这两件事跟：自己放成功 = 有了；死了 = 没了
    if e == "UNIT_SPELLCAST_SUCCEEDED" then
        if unit ~= "player" then return end
        local sid = clean(spell)
        if not (sid and (HAS[sid] or T.NAMES[call(GetSpellInfo, sid) or ""])) then return end
        T.lastHas, T.lastExp = true, now() + 1800
    elseif e == "PLAYER_DEAD" then T.lastHas, T.lastExp = false, nil end
    T.Check(e)
    if e == "PLAYER_REGEN_DISABLED" then
        if sec and not RegisterStateDriver then pcall(sec.Hide, sec) end   -- 没有状态驱动的客户端：这一刻还没锁，手动藏
        T.Warn()
    elseif e == "PLAYER_REGEN_ENABLED" then T.Sync() end   -- 战斗里安全按钮被藏了：脱战重新对上
end
ev:SetScript("OnEvent", function(_, e, unit, a2, a3) pcall(T.OnEvent, e, unit, a2, a3) end)

-- ---------- /gi 强击 ----------
ns.ExtraSlash = ns.ExtraSlash or {}
local function slash(rest)
    rest = tostring(rest or ""):lower()
    if rest:find("off") or rest:find("关") then T.SetOn(false)
    elseif rest:find("on") or rest:find("开") then T.SetOn(true)
    elseif rest:find("reset") or rest:find("重置") then T.ResetPos() end
    local st = T.Check("slash")
    if rest:find("diag") or rest:find("诊断") then
        local h, x = T.Aura()
        ns.Print("强击诊断 读到=" .. tostring(h) .. " 途径=" .. tostring(T.via) .. " 到期=" .. tostring(x and math.floor(x - now())) .. " 沿用=" .. tostring(T.lastHas) .. " 会=" .. tostring(T.Known()) .. " 状态=" .. tostring(st))
    end
    local say = not T.On() and L("已关", "off") or not T.Known() and L("没点强击光环天赋，不提醒", "Trueshot Aura not learned - silent")
        or st == "miss" and L("强击光环没开", "Trueshot Aura is off") or st == "low" and L("强击光环快到期", "Trueshot Aura expiring")
        or st == "ok" and L("强击光环开着", "Trueshot Aura is up") or L("开着（现在骑马 / 休息 / 飞行中，不提醒）", "on (quiet while mounted / resting / on a flight)")
    ns.Print(L("强击光环提醒：", "Trueshot Aura reminder: ") .. say .. L("  |cff9a9a9a/gi 强击 on|off|重置|r", "  |cff9a9a9a/gi trueshot on|off|reset|r"))
end
ns.ExtraSlash.trueshot = slash
ns.ExtraSlash["强击"] = slash

-- ---------- 开关（设置可搜「强击」；功能中心「职业」；窗口与提醒）----------
if ns.RegisterSettings then
    ns.RegisterSettings({ key = "tsremind", order = 58.26, data = "general", avail = function() return ns.TrueshotRemind ~= nil end,
        title = function() return L("猎人强击光环提醒", "Hunter Trueshot Aura reminder") end, short = function() return L("强击光环", "Trueshot Aura") end,
        items = {
            { type = "check", id = "tsremind.on", keys = T.KEYS,
              text = function() return L("强击光环没开 / 剩不到 2 分钟时出浮标提醒，脱战点浮标直接开（点了这个天赋才有；骑马、城里休息、飞行时不提醒）",
                  "Show an icon when Trueshot Aura is missing or under 2 minutes; click it out of combat to cast (talent required; quiet while mounted, resting or on a flight)") end,
              get = function() return T.On() end, set = function(v) T.SetOn(v) end },
            { type = "check", id = "tsremind.msg", keys = T.KEYS,
              text = function() return L("没开强击光环就进战斗：屏幕上方提示一句", "Entering combat without Trueshot Aura: show a message") end,
              get = function() return T.Msg() end, set = function(v) T.DB().msg = v and true or false end },
            { type = "check", id = "tsremind.snd", keys = T.KEYS,
              text = function() return L("没开强击光环就进战斗：响一声", "Entering combat without Trueshot Aura: play a sound") end,
              get = function() return T.Sound() end, set = function(v) T.DB().snd = v and true or false end },
        } })
end
if ns.Feature then
    ns.Feature({ key = "trueshotremind", cat = "class", zh = "猎人强击光环提醒", en = "Hunter Trueshot Aura reminder", class = "Hunter", sw = "tsremind.on", def = true,
        files = { "TrueshotRemind.lua" },
        dzh = "强击光环没开 / 快到期时出浮标，脱战点一下就开；没开就进战斗会提示", den = "Shows an icon when Trueshot Aura is missing or about to expire; click it out of combat to cast" })
end
if ns.RegisterWindow then
    ns.RegisterWindow({ key = "trueshotOrb", order = 55.6, title = function() return L("强击光环浮标（猎人）", "Trueshot Aura icon (Hunter)") end,
        avail = function() return ns.TrueshotRemind ~= nil end,
        state = function()
            if not T.On() then return L("已关闭", "Closed") end
            return T.Known() and L("开着（没开 / 快到期时出来）", "On (shows when missing / expiring)") or L("开着（没点强击光环天赋，不出来）", "On (talent not learned)")
        end,
        actions = function()
            local on = T.On()
            return {
                { text = on and L("关闭", "Hide") or L("打开", "Show"), fn = function() T.SetOn(not on) end },
                { text = L("重置位置", "Reset position"), fn = function() T.ResetPos() end },
            }
        end })
end

-- 子插件在 PLAYER_LOGIN 才加载，进世界事件会再跑；已经在世界里（/reload 后补加载）就补一次
if IsLoggedIn and IsLoggedIn() then pcall(T.Check, "load") end

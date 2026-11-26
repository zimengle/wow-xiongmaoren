-- 猎人守护提醒（2026-11-25 用户做完强击光环提醒后：「光环也要提醒」→ 选了「猎人守护」）
--   ① 没开守护：会雄鹰守护、身上一个守护都没有 → 浮标出来（雄鹰守护图标 + 「没开守护」，闪）；脱战左键点浮标 = 开雄鹰守护
--      活着、没坐飞行 / 载具、没上马、不在城里休息时才看（和强击光环提醒同一套）
--   ② 打怪还开着猎豹守护 / 豹群守护：进战斗那一刻身上是这两个 → 屏幕上方说一句 + 响一声（60 秒内不重复）；
--      战斗中浮标换成那个守护的图标、红字「还开着猎豹」；守护换掉 / 脱战就收起
-- 只读光环，不碰装备：开守护换邮政扣环是 HunterAspect.lua 的事，这里和它互不相干。
-- 浮标 / 安全按钮的做法照 TrueshotRemind.lua：浮标是普通框（战斗中照常显示 / 隐藏）；施法靠另一个盖在上面的安全按钮，
--   只在脱战时摆位置 / 设属性 / 显示，进战斗由状态驱动自己藏 → 战斗中点浮标不施法，也不报「插件动作被阻止」。
-- 法术 ID 核对 TrainNowData.lua 猎人训练表：雄鹰 13165 / 14318 / 14319 / 14320 / 14321 / 14322（+ 25296 书学的 7 级）· 灵猴 13163 ·
--   猎豹 5118 · 豹群 13159 · 野兽 13161 / 1299445 / 1299446 / 1299447 · 野性 20043 / 20190；《无限》新增的（猎鹰 / 蝰蛇…）按名字认。
-- 只有猎人加载（GearInsight_Forever_ClassHunter）；文件头再挡一次。
-- ⛔ 不注册战斗记录事件；不建每帧脚本、不建定时器；每个 API 都 pcall / 判空；不给暴雪全局赋值；不自动发言。
local _, ns = ...; ns = _G.GearInsightForever or ns
if not ns or select(2, UnitClass("player")) ~= "HUNTER" then return end

local A = { GAP = 60 }
ns.AspectRemind = A
A.HAWK = { 25296, 14322, 14321, 14320, 14319, 14318, 13165 }
A.RUN = { [5118] = 1, [13159] = 2 }                                -- 猎豹 / 豹群：挨打会眩晕
A.IDS = { 13163, 5118, 13159, 13161, 1299445, 1299446, 1299447, 20043, 20190 }
A.NAMES = { ["雄鹰守护"] = 0, ["灵猴守护"] = 0, ["野兽守护"] = 0, ["野性守护"] = 0, ["猎鹰守护"] = 0, ["蝰蛇守护"] = 0, ["猎豹守护"] = 1, ["豹群守护"] = 2,
    ["Aspect of the Hawk"] = 0, ["Aspect of the Monkey"] = 0, ["Aspect of the Beast"] = 0, ["Aspect of the Wild"] = 0,
    ["Aspect of the Cheetah"] = 1, ["Aspect of the Pack"] = 2 }
A.ICON = "Interface\\Icons\\Spell_Nature_RavenForm"
A.RUNICON = { "Interface\\Icons\\Ability_Mount_JungleTiger", "Interface\\Icons\\Ability_Mount_WhiteTiger" }
A.KEYS = "守护 雄鹰 猎豹 豹群 眩晕 提醒 aspect hawk cheetah pack daze 猎人 hunter"   -- 设置搜索词
local KIND = {}
for _, id in ipairs(A.HAWK) do KIND[id] = 0 end
for _, id in ipairs(A.IDS) do KIND[id] = A.RUN[id] or 0 end
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function clean(v) if v == nil or (ns.Secret and ns.Secret(v)) then return nil end return v end
local function now() return (GetTime and GetTime()) or 0 end
local function call(f, ...)
    if not f then return nil end
    local ok, a = pcall(f, ...)
    if ok then return clean(a) end
    return nil
end
local function yes(f, ...) return call(f, ...) and true or false end
-- 进战斗事件那一刻 InCombatLockdown 还是 false：自己记一笔（A.fight），安全按钮也按它躲
local function inCombat() return A.fight or yes(InCombatLockdown) end
local function runName(k) return k == 2 and L("豹群守护", "Aspect of the Pack") or L("猎豹守护", "Aspect of the Cheetah") end

-- ---------- 设置（存档 ns.db.aspRemind）----------
function A.DB()
    if type(ns.db) ~= "table" then return {} end
    if type(ns.db.aspRemind) ~= "table" then ns.db.aspRemind = {} end
    return ns.db.aspRemind
end
function A.On() return ns.db ~= nil and A.DB().on ~= false end
function A.RunOn() return A.DB().run ~= false end
function A.Sound() return A.DB().snd ~= false end

-- ---------- 会不会雄鹰守护 / 身上是哪个守护 ----------
-- 会 → 本地化技能名（安全按钮按名字施放 = 会的最高一级）；不会（10 级前）→ false = 整个提醒静默
function A.Known(force)
    if A.kn ~= nil and not force then return A.kn end
    local name = false
    for _, id in ipairs(A.HAWK) do
        if yes(IsPlayerSpell, id) or yes(IsSpellKnown, id) then name = call(GetSpellInfo, id) or L("雄鹰守护", "Aspect of the Hawk"); break end
    end
    if not name then
        local got = call(GetSpellInfo, L("雄鹰守护", "Aspect of the Hawk"))
        if type(got) == "string" then name = got end
    end
    A.kn = name
    return name
end
-- → 守护种类（nil 没有 / 0 普通 / 1 猎豹 / 2 豹群）, 图标。读不到（保密）的光环当「有」，不乱报没开
function A.Aura()
    local best, icon
    local at = C_UnitAuras and C_UnitAuras.GetAuraDataByIndex   -- 11-26：新客户端优先用这个（UnitBuff 可能没有）
    if at then
        for i = 1, 40 do
            local ok, a = pcall(at, "player", i, "HELPFUL")
            if not ok then return 0 end
            if a == nil then break end
            if type(a) ~= "table" or (ns.Secret and ns.Secret(a)) then return 0 end
            local name, sid = clean(a.name), clean(a.spellId)
            if not name and not sid then return 0 end
            local k = (sid and KIND[sid]) or (name and A.NAMES[name])
            if k and (not best or k > best) then best, icon = k, clean(a.icon) end
        end
        return best, icon
    end
    if not UnitBuff then return 0 end
    for i = 1, 40 do
        local r = { pcall(UnitBuff, "player", i) }
        if not r[1] then return 0 end
        if r[2] == nil then break end
        local name, sid = clean(r[2]), clean(r[11])
        if name == nil then return 0 end
        local k = (sid and KIND[sid]) or A.NAMES[name]
        if k and (not best or k > best) then best, icon = k, clean(r[3]) end
    end
    return best, icon
end
function A.Quiet()
    return yes(UnitIsDeadOrGhost, "player") or yes(UnitOnTaxi, "player") or yes(UnitInVehicle, "player") or yes(IsMounted) or yes(IsResting)
end
-- → "off" / "none"（没开守护）/ "run"（战斗中还开着猎豹 / 豹群）/ "ok", 种类, 图标
function A.State()
    if not A.On() or not A.Known() or A.Quiet() then return "off" end
    local k, icon = A.Aura()
    if not k then return "none" end
    if k > 0 and inCombat() and A.RunOn() then return "run", k, icon end
    return "ok", k
end

-- ---------- 浮标 ----------
local ui = {}
local win, sec
A.ui = ui
local function savePos()
    if not win then return end
    local p, _, _, x, y = win:GetPoint()
    A.DB().pos = { p or "CENTER", x or 0, y or 0 }
end
local function place(f)
    local pos = A.DB().pos
    f:ClearAllPoints()
    if type(pos) == "table" and pos[1] then f:SetPoint(pos[1], UIParent, pos[1], tonumber(pos[2]) or 0, tonumber(pos[3]) or 0)
    else f:SetPoint("CENTER", UIParent, "CENTER", -210, -210) end   -- 强击光环浮标默认在 -120：并排不叠
end
local function untip() if GameTooltip then GameTooltip:Hide() end end
local function tip(self)
    if not (GameTooltip and GameTooltip.SetOwner) then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:AddLine("|cff33ff99GI|r " .. L("守护提醒", "Aspect reminder"))
    GameTooltip:AddLine(inCombat() and L("战斗中点浮标不施法，请按自己的技能键", "In combat the icon can't cast - use your own keybind")
        or L("左键：开雄鹰守护", "Left-click: cast Aspect of the Hawk"), 1, 1, 1)
    GameTooltip:AddLine(L("按住拖动：挪位置    右键：关掉提醒", "Drag: move    Right-click: turn off"), 0.6, 0.6, 0.6)
    GameTooltip:Show()
end
local function click(_, mb)
    if mb ~= "RightButton" then return end
    untip()
    A.SetOn(false)
    ns.Print(L("守护提醒已关。找回：设置里搜「守护」，或 /gi 守护 on", "Aspect reminder turned off. Bring it back: search \"aspect\" in Settings, or /gi aspect on"))
end
local function wire(f)
    if f.RegisterForDrag then f:RegisterForDrag("LeftButton") end
    f:SetScript("OnEnter", tip)
    f:SetScript("OnLeave", untip)
    f:SetScript("OnDragStart", function() if win then win:StartMoving() end end)
    f:SetScript("OnDragStop", function()
        if not win then return end
        win:StopMovingOrSizing()
        savePos()
        A.Sync()
    end)
end
local function buildWin()
    local f = CreateFrame("Button", "GearInsightForeverAspectOrb", UIParent)
    f:SetSize(40, 40); f:SetFrameStrata("MEDIUM"); f:SetClampedToScreen(true); f:SetMovable(true)
    place(f)
    if f.RegisterForClicks then f:RegisterForClicks("LeftButtonUp", "RightButtonUp") end
    ui.tag = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ui.tag:SetPoint("BOTTOM", f, "TOP", 0, 0)
    ui.tag:SetText("|cff33ff99GI|r " .. L("守护", "Aspect"))
    ui.ic = f:CreateTexture(nil, "ARTWORK")
    ui.ic:SetSize(32, 32); ui.ic:SetPoint("CENTER", f, "CENTER", 0, 0); ui.ic:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    ui.txt = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    ui.txt:SetPoint("TOP", f, "BOTTOM", 0, 1)
    local font, sz = ui.txt:GetFont()
    if font then pcall(ui.txt.SetFont, ui.txt, font, math.max(11, tonumber(sz) or 11), "OUTLINE") end
    if f.CreateAnimationGroup then
        local ok, g = pcall(f.CreateAnimationGroup, f)
        local a = ok and g and g.CreateAnimation and g:CreateAnimation("Alpha")
        if a and a.SetFromAlpha then
            a:SetFromAlpha(1); a:SetToAlpha(0.35); a:SetDuration(0.6)
            if g.SetLooping then g:SetLooping("BOUNCE") end
            pcall(g.Play, g)   -- 两种状态都是「该处理了」，一直闪
        end
    end
    wire(f)
    f:SetScript("OnClick", click)
    f:SetScript("OnHide", function(self) pcall(self.StopMovingOrSizing, self) end)
    f:Hide()
    return f
end
-- 安全按钮：左键 = 雄鹰守护。挂 UIParent、不锚浮标（锚上去浮标就跟着受保护）
local function buildSec()
    local ok, b = pcall(CreateFrame, "Button", "GearInsightForeverAspectCast", UIParent, "SecureActionButtonTemplate")
    if not ok or not b or not b.SetAttribute then return nil end
    b:SetSize(40, 40); b:SetFrameStrata("MEDIUM")
    if b.SetFrameLevel and win.GetFrameLevel then b:SetFrameLevel((tonumber(win:GetFrameLevel()) or 1) + 5) end
    -- 11-26 用户「位置应该可以移动」：改成松开鼠标才施法 → 直接按住拖就能挪（不用 Shift）；useOnKeyDown = false 让它不跟「按下即施法」的系统设置走
    if b.RegisterForClicks then b:RegisterForClicks("AnyUp", "AnyDown") end
    b:SetAttribute("useOnKeyDown", false)
    b:SetAttribute("type1", "spell")
    b:SetAttribute("shift-type1", "gimove")   -- Shift + 左键不施法（留给拖动）
    if RegisterStateDriver then
        b:SetAttribute("_onstate-gias", [[ if newstate == "1" then self:Hide() end ]])
        RegisterStateDriver(b, "gias", "[combat] 1; 0")
    end
    wire(b)
    b:SetScript("PostClick", click)
    b:Hide()
    return b
end
function A.Sync()
    if inCombat() then A.dirty = true; return false end
    A.dirty = nil
    local want = win ~= nil and win:IsShown() and A.Known() or false
    if not sec then
        if not want then A.secOn = false; return true end
        sec = buildSec()
        A.sec = sec
        if not sec then A.secOn = false; return true end
    end
    if want then
        local p, _, _, x, y = win:GetPoint()
        sec:ClearAllPoints()
        sec:SetPoint(p or "CENTER", UIParent, p or "CENTER", x or 0, y or 0)
        if A.secSpell ~= want then sec:SetAttribute("spell1", want); A.secSpell = want end
        sec:Show()
    else
        sec:Hide()
    end
    A.secOn = want and true or false
    return true
end
function A.Draw(st, k, icon)
    local show = st == "none" or st == "run"
    if not win then
        if not show then return end
        win = buildWin()
        ui.win = win
    end
    if show then
        local run = st == "run"
        ui.ic:SetTexture(run and (icon or A.RUNICON[k] or A.RUNICON[1]) or A.ICON)
        if ui.ic.SetVertexColor then ui.ic:SetVertexColor(1, run and 0.35 or 1, run and 0.35 or 1) end
        if ui.ic.SetDesaturated then ui.ic:SetDesaturated(not run) end
        ui.txt:SetText("|cffff4433" .. (run and (L("还开着", "Still on ") .. (k == 2 and L("豹群", "Pack") or L("猎豹", "Cheetah"))) or L("没开守护", "No aspect")) .. "|r")
    end
    if win:IsShown() ~= show then win:SetShown(show) end
    A.shown = show
    if (A.secOn or false) ~= show or A.dirty then A.Sync() end
end
function A.Check()
    local st, k, icon = A.State()
    A.st, A.kind = st, k
    A.Draw(st, k, icon)
    return st
end
-- 进战斗那一刻还开着猎豹 / 豹群：屏幕上方说一句 + 响一声（60 秒内不重复）
function A.Warn()
    if A.st ~= "run" then return false end
    local t = now()
    if A.warned and t - A.warned < A.GAP then return false end
    A.warned = t
    if UIErrorsFrame and UIErrorsFrame.AddMessage then
        pcall(UIErrorsFrame.AddMessage, UIErrorsFrame, string.format(L("还开着%s，挨打会眩晕！", "%s is still on - you'll get dazed!"), runName(A.kind)), 1, 0.25, 0.1)
    end
    if A.Sound() and PlaySound then pcall(PlaySound, 8959) end
    return true
end
function A.SetOn(v) A.DB().on = v and true or false; A.Check() end
function A.ResetPos()
    A.DB().pos = nil
    if win then place(win); A.Sync() end
end

local ev = CreateFrame("Frame")
A.ev = ev
if ev.RegisterUnitEvent then pcall(ev.RegisterUnitEvent, ev, "UNIT_AURA", "player") else ev:RegisterEvent("UNIT_AURA") end
for _, e in ipairs({ "PLAYER_ENTERING_WORLD", "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED", "PLAYER_UPDATE_RESTING", "PLAYER_MOUNT_DISPLAY_CHANGED",
    "PLAYER_DEAD", "PLAYER_ALIVE", "PLAYER_UNGHOST", "PLAYER_CONTROL_GAINED", "PLAYER_CONTROL_LOST", "SPELLS_CHANGED" }) do
    pcall(ev.RegisterEvent, ev, e)
end
function A.OnEvent(e, unit)
    if e == "UNIT_AURA" and unit ~= nil and unit ~= "player" then return end
    if e == "SPELLS_CHANGED" or e == "PLAYER_ENTERING_WORLD" then A.kn = nil end
    if e == "PLAYER_REGEN_DISABLED" then A.fight = true elseif e == "PLAYER_REGEN_ENABLED" then A.fight = false end
    if e == "PLAYER_REGEN_DISABLED" and sec and not RegisterStateDriver then pcall(sec.Hide, sec) end   -- 没有状态驱动的客户端：这一刻还没锁，手动藏
    A.Check()
    if e == "PLAYER_REGEN_DISABLED" then
        A.Warn()
    elseif e == "PLAYER_REGEN_ENABLED" then A.Sync() end
end
ev:SetScript("OnEvent", function(_, e, unit) pcall(A.OnEvent, e, unit) end)

-- ---------- /gi 守护 ----------
ns.ExtraSlash = ns.ExtraSlash or {}
local function slash(rest)
    rest = tostring(rest or ""):lower()
    if rest:find("off") or rest:find("关") then A.SetOn(false)
    elseif rest:find("on") or rest:find("开") then A.SetOn(true)
    elseif rest:find("reset") or rest:find("重置") then A.ResetPos() end
    local st = A.Check()
    local say = not A.On() and L("已关", "off") or not A.Known() and L("还没学雄鹰守护，不提醒", "Aspect of the Hawk not learned - silent")
        or st == "none" and L("没开守护", "no aspect active") or st == "run" and L("战斗中还开着猎豹 / 豹群守护", "Cheetah / Pack still on in combat")
        or st == "ok" and L("守护开着", "an aspect is active") or L("开着（现在骑马 / 休息 / 飞行中，不提醒）", "on (quiet while mounted / resting / on a flight)")
    ns.Print(L("守护提醒：", "Aspect reminder: ") .. say .. L("  |cff9a9a9a/gi 守护 on|off|重置|r", "  |cff9a9a9a/gi aspect on|off|reset|r"))
end
ns.ExtraSlash.aspect = slash
ns.ExtraSlash["守护"] = slash

-- ---------- 开关（设置可搜「守护」；功能中心「职业」；窗口与提醒）----------
if ns.RegisterSettings then
    ns.RegisterSettings({ key = "aspremind", order = 58.27, data = "general", avail = function() return ns.AspectRemind ~= nil end,
        title = function() return L("猎人守护提醒", "Hunter aspect reminder") end, short = function() return L("守护提醒", "Aspect reminder") end,
        items = {
            { type = "check", id = "aspremind.on", keys = A.KEYS,
              text = function() return L("没开守护时出浮标提醒，脱战点浮标直接开雄鹰守护（骑马、城里休息、飞行时不提醒）",
                  "Show an icon when no aspect is active; click it out of combat to cast Aspect of the Hawk (quiet while mounted, resting or on a flight)") end,
              get = function() return A.On() end, set = function(v) A.SetOn(v) end },
            { type = "check", id = "aspremind.run", keys = A.KEYS,
              text = function() return L("打怪时还开着猎豹守护 / 豹群守护：浮标标红 + 屏幕上方提示（挨打会眩晕）", "In combat with Cheetah / Pack still on: red icon + message (you get dazed when hit)") end,
              get = function() return A.RunOn() end, set = function(v) A.DB().run = v and true or false; A.Check() end },
            { type = "check", id = "aspremind.snd", keys = A.KEYS,
              text = function() return L("进战斗还开着猎豹 / 豹群守护：响一声", "Entering combat with Cheetah / Pack on: play a sound") end,
              get = function() return A.Sound() end, set = function(v) A.DB().snd = v and true or false end },
        } })
end
if ns.Feature then
    ns.Feature({ key = "aspectremind", cat = "class", zh = "猎人守护提醒", en = "Hunter aspect reminder", class = "Hunter", sw = "aspremind.on", def = true,
        files = { "AspectRemind.lua" },
        dzh = "没开守护时出浮标，脱战点一下开雄鹰守护；打怪还开着猎豹 / 豹群守护会提示", den = "Shows an icon when no aspect is active; warns when Cheetah / Pack is still on in combat" })
end
if ns.RegisterWindow then
    ns.RegisterWindow({ key = "aspectOrb", order = 55.7, title = function() return L("守护浮标（猎人）", "Aspect icon (Hunter)") end,
        avail = function() return ns.AspectRemind ~= nil end,
        state = function()
            if not A.On() then return L("已关闭", "Closed") end
            return A.Known() and L("开着（没开守护 / 打怪开着猎豹时出来）", "On (shows when no aspect / Cheetah in combat)") or L("开着（还没学雄鹰守护，不出来）", "On (Hawk not learned)")
        end,
        actions = function()
            local on = A.On()
            return {
                { text = on and L("关闭", "Hide") or L("打开", "Show"), fn = function() A.SetOn(not on) end },
                { text = L("重置位置", "Reset position"), fn = function() A.ResetPos() end },
            }
        end })
end

if IsLoggedIn and IsLoggedIn() then A.fight = yes(UnitAffectingCombat, "player"); pcall(A.Check) end

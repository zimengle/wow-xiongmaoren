-- HOLD：灵魂石没了弹框（11-25 用户「灵魂石没了弹窗问是否提醒」）
--   单独一个按需加载的小子插件 GearInsight_Forever_SSPop：法师吃喝 _GroupMage（队长视图）297/300 KB、术士专属 _ClassWarlock 108/115 KB 都放不下，
--   所以这里第一次要弹时才由它们 ns.SSPopLoad() LoadAddOn（没装 / HOLD 没进包 = 加载不上 = 只有原来的屏幕一行字 + 聊天框一句）
--   借组队信标「要 BUFF」那个小框（ns.BuffAsk.Build，GearInsight 风格），4 个按钮换成自己的：
--     队长视图（ns.SSGone("party", …)）：「XX 的灵魂石没了（已使用 / 到期）」→ [密术士补石头]（默认密给他上石头的那个术士，不在队里就第一个术士）
--       [队伍里说] [不用了] [本次不再问]
--     术士自己（ns.SSGone("me", …)）：「你给 XX 的灵魂石没了」→ [选中他补石头]（盖在第一个按钮上的安全按钮 /target，⛔ 不替玩家施法）
--       [密他马上补] [不用了] [本次不再问]
--   ⛔ 只在点按钮时发言（BA.Send：战斗中 / 聊天受限发不了）；发的话不带插件名、走 ns.ChatL 对外语言；
--     战斗中不弹（记着，脱战后还没补再弹）；同一个人同一块石头只问一次；60 秒没人理自己收起（BA.FIELD_TTL）
--     开关 ns.db.ssGonePop（nil = 开，false = 关；设置里搜「灵魂石」）；「本次不再问」= 这次登录静音
--   安全按钮：父框是 UIParent（不挂在要 BUFF 框下面，免得那个框战斗中收起被拦），RegisterStateDriver「[combat] hide; show」，属性只在脱战时设；
--     框收起（BA.HideField）→ 脱战时一起收；要 BUFF 框被别的提示借走 → 点了转给原按钮
-- ⛔ 不建 OnUpdate（60 秒收起用的是要 BUFF 框自己的）；不注册 COMBAT_LOG_EVENT_UNFILTERED；不给暴雪全局重新赋值
local _, ns = ...; ns = _G.GearInsightForever or ns
if not ns or ns.SSGone then return end

local G = { asked = {} }
ns.SSGonePop = G
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function CL(zh, en) return (ns.ChatL and ns.ChatL(zh, en)) or zh end
local function none() end
local function inCombat() local ok, v = pcall(InCombatLockdown or none); return ok and v and not (ns.Secret and ns.Secret(v)) and true or false end
local KEYS = { "ask", "no", "mute", "never" }

function G.On() return ns.db ~= nil and ns.db.ssGonePop ~= false and not G.mute end
function G.Ours() local c = ns.BuffAsk and ns.BuffAsk.cur; return c and c.ssg or nil end
-- o = { key, title, text, btn = { { 字, 悬停说明, fn }, ×4 }, still = 还没补吗, shown = 弹出后 }；fn 返回 false = 不收框
function G.Show(o)
    local BA = ns.BuffAsk
    if not (BA and BA.Build and G.On()) or G.asked[o.key] then return false end
    if inCombat() then G.pend = o; return "pend" end
    if o.still and not o.still() then return false end
    G.asked[o.key], G.pend = true, nil
    local f = BA.Build()
    if not rawget(f, "_ssg") then
        rawset(f, "_ssg", true)
        for i, k in ipairs(KEYS) do
            local b = f[k]
            local oc, oe = b:GetScript("OnClick"), b:GetScript("OnEnter")
            b:SetScript("OnClick", function(...)
                local s = G.Ours()
                if not s then if oc then return oc(...) end return end
                if s.btn[i][3]() ~= false then BA.HideField() end
            end)
            b:SetScript("OnEnter", function(self, ...)
                local s = G.Ours()
                if not s then if oe then return oe(self, ...) end return end
                GameTooltip:SetOwner(self, "ANCHOR_BOTTOM"); GameTooltip:AddLine(s.btn[i][2], 1, 1, 1, true); GameTooltip:Show()
            end)
            rawset(f, "_ssgOrig" .. i, oc)
        end
    end
    BA.cur = { ssg = o }
    f.title:SetText("|cff33ff99GI|r " .. o.title)
    for i, k in ipairs(KEYS) do f[k]:SetText(o.btn[i][1]); f[k].label = o.btn[i][1]; f[k]:Show() end
    for _, b in ipairs(f.picks or {}) do b:Hide() end
    if f.pickLbl then f.pickLbl:Hide() end
    if BA.PaintExtras then BA.PaintExtras(f, false) end
    f.text:SetText(o.text); f:SetHeight(112); f.age = 0; f:Show()
    if o.shown then pcall(o.shown, f) end
    return true
end
function G.Flush() local o = G.pend; G.pend = nil; if o then return G.Show(o) end end

local function send(text, ch, to)
    local BA = ns.BuffAsk
    if BA and BA.Send and BA.Send(text, ch, to) then return true end
    ns.Print(L("现在发不了（战斗中 / 聊天受限），过一会儿再点", "Can't send right now (combat / chat locked) - try again in a moment"))
    return false
end
-- 密语对象带服务器（跨服队友光名字密不到）；同服 / 找不到 = 原样
local function full(n)
    for i = 1, 44 do
        local u = i > 40 and ("party" .. (i - 40)) or ("raid" .. i)
        if UnitName(u) == n then return GetUnitName and GetUnitName(u, true) or n end
    end
    return n
end
-- 11-25 用户「灵魂石快到了，点击可以提醒」「M 施法人，提醒他给谁加啥」：队长视图点那一行 = 私聊上石头的术士（读不到是谁 = 第一个术士）
--   info = { who, src, left（剩几秒；nil = 已经没了）, locks }
local function soon(info)   -- 走 ns.SSGone("soon", info)：不往 G 表加键（加键会让表翻倍占内存）；点一下发一句
    local who, lock = info.who, nil
    for _, x in ipairs(info.locks) do if x == info.src then lock = x end end
    lock = lock or info.locks[1]
    local left = info.left or 0   -- 发出去聊天框自己会显示「发送给 XX」，不再另外打印
    -- 11-26 用户「灵魂石快到了也能通报」：按住 Shift 点那一行 → 同一句话说在队伍 / 团队里（点了才发）
    if not info.say and (not lock or lock == UnitName("player")) then return false end
    return send(left > 0 and string.format(CL("%s 的灵魂石还剩 %d 分钟，到时间麻烦再补一个~", "%s's soulstone: %d min left, renew please~"), who, math.ceil(left / 60))
        or string.format(CL("%s 的灵魂石没了，麻烦补一个~", "%s's soulstone is gone - could you put a new one up? Thanks~"), who), info.say and (IsInRaid() and "RAID" or "PARTY") or "WHISPER", not info.say and full(lock) or nil)
end
local WHY = { used = { "已使用", "used" }, expired = { "到期", "expired" }, gone = { "已失效", "gone" } }
local function why(k) local w = WHY[k] or WHY.gone; return L(w[1], w[2]) end
local MUTE = function() return { L("本次不再问", "Not this session"), L("这次登录不再弹「灵魂石没了」（永久关：设置里搜「灵魂石」）", "Mute until /reload (turn off for good: search \"soulstone\" in Settings)"),
    function() G.mute = true end } end

-- ---------- 术士：[选中他补石头] = 盖在第一个按钮上的安全按钮 ----------
G.sec = nil
function G.SecOff()
    local b = G.sec
    if not b or inCombat() then return false end
    if UnregisterStateDriver then pcall(UnregisterStateDriver, b, "visibility") end
    b:Hide()
    return true
end
function G.SecOn(f, who)
    if inCombat() or not (f and f.ask) then return false end
    local b = G.sec
    if not b then
        b = CreateFrame("Button", "GearInsightForeverSSPopTarget", UIParent, "SecureActionButtonTemplate")
        if b.RegisterForClicks then b:RegisterForClicks("AnyDown") end
        b:SetFrameStrata("DIALOG")
        b:SetScript("PreClick", function(self)   -- 要 BUFF 框被别的提示借走了：这一下不 /target（脱战才能改属性）
            if not G.Ours() and not inCombat() then self:SetAttribute("type1", nil) end
        end)
        b:SetScript("PostClick", function()
            local s = G.Ours()
            if s then s.btn[1][3](); ns.BuffAsk.HideField(); return end
            local oc = ns.BuffAsk and ns.BuffAsk.frame and rawget(ns.BuffAsk.frame, "_ssgOrig1")
            G.SecOff()
            if oc then pcall(oc, ns.BuffAsk.frame.ask, "LeftButton") end
        end)
        G.sec = b
    end
    b:ClearAllPoints(); b:SetAllPoints(f.ask)
    if b.SetFrameLevel and f.ask.GetFrameLevel then pcall(b.SetFrameLevel, b, (tonumber(f.ask:GetFrameLevel()) or 1) + 5) end
    b:SetAttribute("type1", "macro"); b:SetAttribute("macrotext1", "/target " .. (who:match("^([^%-]+)") or who))
    if RegisterStateDriver then pcall(RegisterStateDriver, b, "visibility", "[combat] hide; show") end
    b:Show()
    return true
end
-- 要 BUFF 框收起（点按钮 / 60 秒 / ×）→ 安全按钮一起收（战斗中收不了：状态驱动已经藏着，脱战再收）
local BA0 = ns.BuffAsk
if BA0 and BA0.HideField and not BA0._ssgHide then
    local h = BA0.HideField
    BA0._ssgHide = h
    BA0.HideField = function(...)
        local r = h(...)
        G.SecOff()
        return r
    end
end

-- ---------- 入口：kind = "party"（队长视图）/ "me"（术士自己）----------
-- info = { who, kind = used / expired / gone, key, still, src（队长视图：给他上石头的术士）, locks（队里术士名单）, target（术士：选中后说一句）}
function ns.SSGone(kind, info)
    if kind == "soon" then return soon(info) end
    if not (info and info.who) then return false end
    local who = info.who
    if kind == "me" then
        local w = CL("你的灵魂石没了，我马上给你补一个~", "Your soulstone is gone - I'll put a new one on you right away~")
        return G.Show({ key = info.key, still = info.still, title = L("灵魂石没了", "Soulstone gone"),
            text = string.format(L("你给 %s 的灵魂石没了（%s），要马上补一个吗？", "Your soulstone on %s is gone (%s) - put up a new one?"), who, why(info.kind))
                .. "\n|cff999999" .. L("「密他」点了才发：", "\"Whisper\" sends only when you click: ") .. w .. "|r",
            shown = function(f) G.SecOn(f, who) end,
            btn = {
                { L("选中他补石头", "Target him"), string.format(L("选中 %s，然后用背包里的灵魂石给他补上（插件不替你施法）", "Targets %s - then use a soulstone on them yourself"), who),
                  function() if info.target then pcall(info.target) end end },
                { L("密他马上补", "Whisper"), L("点了才发，私聊他：\n", "Whispers them (only when you click):\n") .. w, function() return send(w, "WHISPER", who) end },
                { L("不用了", "No thanks"), L("关掉这个框", "Close"), none },
                MUTE(),
            } })
    end
    local lock
    for _, x in ipairs(info.locks or {}) do if x == info.src then lock = x end end
    lock = lock or (info.locks or {})[1]
    local w = string.format(CL("%s 的灵魂石没了，麻烦补一个~", "%s's soulstone is gone - could you put a new one up? Thanks~"), who)
    local pt = string.format(CL("%s 的灵魂石没了，术士方便的话补一个~", "%s's soulstone is gone - a new one when you can, warlocks~"), who)
    local raid = IsInRaid and select(2, pcall(IsInRaid))
    return G.Show({ key = info.key, still = info.still, title = L("灵魂石没了", "Soulstone gone"),
        text = string.format(L("%s 的灵魂石没了（%s），要提醒术士补一个吗？", "%s's soulstone is gone (%s) - remind a warlock?"), who, why(info.kind))
            .. "\n|cff999999" .. L("点了才发：", "Sends only when you click: ") .. (lock and w or pt) .. "|r",
        btn = {
            { lock and L("密术士补石头", "Whisper warlock") or L("队里没术士", "No warlock"),
              lock and (string.format(L("点了才发，私聊 %s：\n", "Whispers %s (only when you click):\n"), lock) .. w) or L("队里没有术士", "No warlock in the group"),
              function() if not lock then return end return send(w, "WHISPER", full(lock)) end },
            { L("队伍里说", "Tell party"), L("点了才发，在队伍 / 团队频道说：\n", "Says it in party / raid chat (only when you click):\n") .. pt,
              function() return send(pt, (raid == true) and "RAID" or "PARTY") end },
            { L("不用了", "No thanks"), L("关掉这个框", "Close"), none },
            MUTE(),
        } })
end

-- 脱战：没弹的补弹（still 再查一次：已经补上就不弹）；框不是我们的了 → 安全按钮收起
local ev = CreateFrame("Frame")
G.ev = ev
pcall(ev.RegisterEvent, ev, "PLAYER_REGEN_ENABLED")
ev:SetScript("OnEvent", function()
    if not G.Ours() then G.SecOff() end
    pcall(G.Flush)
end)

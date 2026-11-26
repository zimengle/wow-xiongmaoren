-- HOLD：猎人开守护换邮政扣环（11-25 用户截图「海加尔邮政扣环」+「把这个可以设置成猎人专属，打开猎豹守护或者豹群守护就换上，关闭换下」）
--   海加尔邮政扣环（物品 260308，饰品，装备：奔跑和游泳速度提高 5%）：
--     ① 身上出现猎豹守护（5118）/ 豹群守护（13159）光环 → 背包里有扣环就换上（换下面那格饰品 14；设置里可改成上面那格 13；有空饰品格先用空格）
--     ② 守护没了 → 换回原来那件（按完整链接找回；原来空着 = 摘回背包）
--     ③ 战斗中 / 读条 / 死亡 / 手上拿着东西不能换 → 排队，脱战（PLAYER_REGEN_ENABLED）再按「现在守护还在不在」重新判（守护已经关了就不换上）
--     ④ 换装记录按角色存 ns.db.aspSwaps[角色-服务器] = { slot, 原装（完整链接 / false = 原来空着）, 260308 }：换到一半 /reload 也换得回
--   和上马换装（_Mount 的 MountTrinket.lua，记录 ns.db.mtSwaps）不打架：
--     · 骑着马时这里什么都不做（上马换胡萝卜管饰品），下马后（PLAYER_MOUNT_DISPLAY_CHANGED）再按守护状态补做
--     · 上马换装记录占着的饰品格这里不碰（那边发现格子被换掉会当「玩家自己换了」把记录清掉，胡萝卜就换不回了）
--     · 上马把扣环换成胡萝卜时，那边把扣环记成「原装」，下马换回扣环；这里的记录只在「没骑马、那格没被上马记录占着、那格已经不是扣环」时才当玩家自己换过清掉
--   守护识别：C_UnitAuras.GetPlayerAuraBySpellID（法术 ID 核对 Data.lua 键位表：5118 猎豹守护 / 13159 豹群守护）；没有这个接口就逐个 UnitBuff 比法术 ID / 名字
-- 只有猎人加载（猎人专属子插件 GearInsight_Forever_ClassHunter，主插件 ClassStub.lua 登录时只给猎人 LoadAddOn）；文件头再挡一次。
-- ⛔ 每个 API 都 pcall / 判空、保密值不碰；不注册 COMBAT_LOG_EVENT_UNFILTERED；不建 OnUpdate；不给暴雪全局赋值。
local _, ns = ...; ns = _G.GearInsightForever or ns
if not ns or select(2, UnitClass("player")) ~= "HUNTER" then return end

local A = { TRIES = 3, CHECK = 0.6, LATER = 2 }
ns.HunterAspect = A
A.ITEM = 260308
A.ASPECTS = { 5118, 13159 }                                                  -- 猎豹守护 / 豹群守护
A.NAMES = { ["猎豹守护"] = true, ["豹群守护"] = true, ["Aspect of the Cheetah"] = true, ["Aspect of the Pack"] = true }
A.KEYS = "守护 猎豹 豹群 扣环 邮政 饰品 换装 aspect cheetah pack trinket 猎人 hunter"   -- 设置搜索词
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function none() end
local function clean(v) if v == nil or (ns.Secret and ns.Secret(v)) then return nil end return v end
local function call(f, ...)
    if type(f) ~= "function" then return nil end
    local r = { pcall(f, ...) }
    if not r[1] then return nil end
    return unpack(r, 2, table.maxn(r))
end
local function after(sec, fn) if C_Timer and C_Timer.After then C_Timer.After(sec, function() pcall(fn) end) end end
local function cfn(k) return (C_Container and C_Container[k]) or _G[k] end
local function me() return (call(UnitName, "player") or "?") .. "-" .. (call(GetRealmName) or "?") end
local function inv(slot) return clean(call(GetInventoryItemID, "player", slot)) end
local function invLink(slot) return clean(call(GetInventoryItemLink, "player", slot)) end
local function idOf(x) if type(x) == "number" then return x end if type(x) == "string" then return tonumber(x:match("item:(%d+)") or "") end end
local function mounted() return clean(call(IsMounted)) and true or false end

-- ---------- 设置（存档 ns.db.aspTr：on = false 关；top = true 换上面那格）----------
function A.DB()
    if type(ns.db) ~= "table" then return {} end
    if type(ns.db.aspTr) ~= "table" then ns.db.aspTr = {} end
    return ns.db.aspTr
end
function A.On() return ns.db ~= nil and A.DB().on ~= false end

-- ---------- 换装记录（按角色）----------
function A.Rec()
    local t = ns.db and ns.db.aspSwaps
    local r = type(t) == "table" and t[me()] or nil
    return type(r) == "table" and r or nil
end
function A.SetRec(r)
    if not ns.db then return end
    local t = type(ns.db.aspSwaps) == "table" and ns.db.aspSwaps or {}
    t[me()] = r
    ns.db.aspSwaps = next(t) and t or nil
end
-- 上马换装占着的格（那边的记录：ns.db.mtSwaps[角色] = { v = 2, [装备栏] = {…} }）
function A.MountHolds(slot)
    local t = ns.db and ns.db.mtSwaps
    local r = type(t) == "table" and t[me()] or nil
    return type(r) == "table" and r[slot] ~= nil
end

-- ---------- 守护在不在 ----------
function A.Aspect()
    local get = C_UnitAuras and C_UnitAuras.GetPlayerAuraBySpellID
    if get then
        for _, id in ipairs(A.ASPECTS) do if clean(call(get, id)) then return true end end
        return false
    end
    if not UnitBuff then return false end
    for i = 1, 40 do
        local r = { pcall(UnitBuff, "player", i) }
        if not r[1] then return false end
        local name = clean(r[2])
        if not name then break end
        local sid = clean(r[11])
        for _, id in ipairs(A.ASPECTS) do if sid == id then return true end end
        if A.NAMES[name] then return true end
    end
    return false
end

-- ---------- 背包 ----------
function A.FindBag(o)   -- 物品号 / 完整链接 → bag, slot（链接完全一样优先）
    local num, gid, glk = cfn("GetContainerNumSlots"), cfn("GetContainerItemID"), cfn("GetContainerItemLink")
    if not (num and gid) then return nil end
    local id, bb, bs = idOf(o), nil, nil
    for bag = 0, tonumber(NUM_BAG_SLOTS) or 4 do
        for s = 1, tonumber(call(num, bag)) or 0 do
            if clean(call(gid, bag, s)) == id then
                if type(o) ~= "string" or (glk and clean(call(glk, bag, s)) == o) then return bag, s end
                bb, bs = bb or bag, bs or s
            end
        end
    end
    return bb, bs
end
function A.FreeSlot()
    local num, gid, free = cfn("GetContainerNumSlots"), cfn("GetContainerItemID"), cfn("GetContainerNumFreeSlots")
    if not (num and gid) then return nil end
    for bag = 0, tonumber(NUM_BAG_SLOTS) or 4 do
        local fam = free and select(2, call(free, bag)) or 0
        if (tonumber(fam) or 0) == 0 then
            for s = 1, tonumber(call(num, bag)) or 0 do if call(gid, bag, s) == nil then return bag, s end end
        end
    end
end
function A.Busy()
    if clean(call(InCombatLockdown or none)) then return true end
    if clean(call(UnitIsDeadOrGhost or none, "player")) then return true end
    if CursorHasItem and clean(call(CursorHasItem)) then return true end
    for _, f in ipairs({ UnitCastingInfo or false, UnitChannelInfo or false }) do
        if f then
            local ok, v = pcall(function() return f("player") ~= nil end)
            if ok and v then return true end
        end
    end
    return false
end
local function put(b, s, slot)   -- 背包那格 → 装备栏（原来那件落回这格）
    local pick = cfn("PickupContainerItem")
    if not (pick and PickupInventoryItem) then return false end
    pcall(pick, b, s)
    if CursorHasItem and not CursorHasItem() then return false end
    pcall(PickupInventoryItem, slot)
    if CursorHasItem and CursorHasItem() then pcall(pick, b, s) end
    if CursorHasItem and CursorHasItem() and ClearCursor then ClearCursor() end
    return true
end
function A.Say(msg)
    if UIErrorsFrame and UIErrorsFrame.AddMessage then pcall(UIErrorsFrame.AddMessage, UIErrorsFrame, "|cff33ff99" .. msg .. "|r") end
end
local function nameOf(x)
    local n = GetItemInfo and clean(call(GetItemInfo, idOf(x) or 0))
    return n or (type(x) == "string" and x:match("%[(.-)%]")) or L("原饰品", "your trinket")
end

-- 换哪一格：有空饰品格先用空格；否则按设置（默认下面那格 14）；上马换装占着的格不碰
function A.PickSlot()
    local pref = A.DB().top and { 13, 14 } or { 14, 13 }
    for _, sl in ipairs(pref) do if inv(sl) == nil and not A.MountHolds(sl) then return sl end end
    for _, sl in ipairs(pref) do if not A.MountHolds(sl) then return sl end end
end

-- ---------- 一步 ----------
-- 想要的状态：开关开着 + 守护在 + 没骑马 → 扣环戴上；否则 → 我们换上的换回
function A.Step()
    A.stepping = nil
    if not ns.db then return false end
    if mounted() then A.wait = true; return false end   -- 骑着马：上马换装管饰品，下马再来
    if A.Busy() then A.wait = true; A.Later(); return false end
    A.wait = nil
    local r = A.Rec()
    if r then
        local sl = r[1]
        if A.MountHolds(sl) then A.wait = true; A.Later(); return false end   -- 那格被上马换装占着（扣环换成了胡萝卜）：等它换回再来
        if inv(sl) ~= A.ITEM then A.SetRec(nil); r = nil end   -- 那格已经不是扣环 = 玩家自己换过：不归我们管
    end
    local want = A.On() and A.Aspect()
    if want and not r then
        if inv(13) == A.ITEM or inv(14) == A.ITEM then return false end   -- 自己戴着：不记、不换回
        local b, s = A.FindBag(A.ITEM)
        local sl = b and A.PickSlot()
        if not sl then return false end
        A.tries = (A.tries or 0) + 1
        if A.tries > A.TRIES then return false end
        A.SetRec({ sl, invLink(sl) or inv(sl) or false, A.ITEM })   -- 先记再换
        put(b, s, sl)
        A.pend = { sl, A.ITEM }
        A.stepping = true
        after(A.CHECK, A.Confirm)
        return true
    elseif not want and r then
        local sl, o = r[1], r[2]
        A.tries = (A.tries or 0) + 1
        if A.tries > A.TRIES then
            A.SetRec(nil)
            A.Say(L("没换回 ", "Could not swap back ") .. nameOf(o or A.ITEM) .. L("，请手动换", " - please swap it manually"))
            return false
        end
        if o then
            local b, s = A.FindBag(o)
            if not b then A.SetRec(nil); A.Say(nameOf(o) .. L(" 不在背包里，邮政扣环没换回", " is not in your bags - buckle left on")); return false end
            put(b, s, sl)
            A.pend = { sl, idOf(o), back = true, n = nameOf(o) }
        else
            local b, s = A.FreeSlot()
            local pick = cfn("PickupContainerItem")
            if not (b and pick and PickupInventoryItem) then A.SetRec(nil); return false end   -- 背包满：不摘
            pcall(PickupInventoryItem, sl)
            pcall(pick, b, s)
            if CursorHasItem and CursorHasItem() and ClearCursor then ClearCursor() end
            A.pend = { sl, nil, back = true, n = nameOf(A.ITEM), off = true }
        end
        A.stepping = true
        after(A.CHECK, A.Confirm)
        return true
    end
    A.tries = nil
    return false
end
function A.Confirm()
    local p = A.pend
    A.pend = nil
    if p and inv(p[1]) == p[2] then
        A.tries = nil
        if p.back then
            A.SetRec(nil)
            A.Say((p.off and L("守护关了，已摘下 ", "Aspect off - unequipped ") or L("守护关了，已换回 ", "Aspect off - swapped back ")) .. p.n)
        else
            A.Say(L("开了守护，已换上 ", "Aspect on - equipped ") .. nameOf(A.ITEM))
        end
    end
    A.Step()   -- 没换成：按次数重试；换成了：再看一眼（换的过程中守护又变了）
end
function A.Later()
    if A.later then return end
    A.later = true
    after(A.LATER, function() A.later = nil; if A.wait then A.Sync(true) end end)
end
-- 守护变了 / 有排队 / 下马 / 脱战才干活（UNIT_AURA 很频繁：状态没变就不扫背包）
function A.Sync(force)
    local now = A.On() and A.Aspect()
    if now == A.was and not A.wait and not force then return false end
    if now ~= A.was then A.tries = nil end
    A.was = now
    if A.stepping then return false end
    return A.Step()
end
function A.SetOn(v)
    if v then A.DB().on = nil else A.DB().on = false end
    A.Sync(true)
end

local ev = CreateFrame("Frame")
A.ev = ev
if ev.RegisterUnitEvent then pcall(ev.RegisterUnitEvent, ev, "UNIT_AURA", "player") else ev:RegisterEvent("UNIT_AURA") end
for _, e in ipairs({ "PLAYER_REGEN_ENABLED", "PLAYER_ENTERING_WORLD", "PLAYER_MOUNT_DISPLAY_CHANGED" }) do pcall(ev.RegisterEvent, ev, e) end
ev:SetScript("OnEvent", function(_, e, unit)
    if e == "UNIT_AURA" and unit ~= nil and unit ~= "player" then return end
    pcall(A.Sync, e ~= "UNIT_AURA")
end)
after(1, function() A.Sync(true) end)   -- 子插件在 PLAYER_LOGIN 之后才加载：自己补看一眼（含 /reload 前没换回的记录）

-- ---------- 开关（设置可搜「守护」「扣环」；功能中心「职业」）----------
if ns.RegisterSettings then
    ns.RegisterSettings({ key = "aspecttr", order = 58.25, data = "general", avail = function() return ns.HunterAspect ~= nil end,
        title = function() return L("猎人守护换饰品", "Hunter aspect trinket") end, short = function() return L("守护饰品", "Aspect trinket") end,
        items = {
            { type = "check", id = "aspecttr.on", keys = A.KEYS,
              text = function() return L("开猎豹守护 / 豹群守护时自动换上海加尔邮政扣环，守护关了换回原饰品（背包里有扣环才换；战斗中排到脱战）",
                  "Equip the Hyjal Postal Buckle while Aspect of the Cheetah / Pack is on, swap your trinket back when it ends (only if you own it; waits until out of combat)") end,
              get = function() return A.On() end, set = function(v) A.SetOn(v) end },
            { type = "check", id = "aspecttr.top", keys = A.KEYS,
              text = function() return L("换上面那格饰品（默认换下面那格）", "Replace the top trinket slot (default: bottom)") end,
              get = function() return A.DB().top == true end, set = function(v) A.DB().top = v and true or nil end },
        } })
end
if ns.Feature then
    ns.Feature({ key = "aspecttrinket", cat = "class", zh = "猎人守护换邮政扣环", en = "Hunter aspect: postal buckle swap", class = "Hunter", sw = "aspecttr.on", def = true,
        files = { "HunterAspect.lua" },
        dzh = "开猎豹 / 豹群守护时换上海加尔邮政扣环（跑速 +5%），守护关了换回原饰品", den = "Wears the Hyjal Postal Buckle (+5% run speed) while Cheetah / Pack aspect is on, then swaps back" })
end

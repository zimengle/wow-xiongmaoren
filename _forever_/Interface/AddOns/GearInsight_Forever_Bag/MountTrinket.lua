-- 上马自动换饰品（11-20 用户「上马自动换上，下马自动换下，屏幕弹出文字，快速消失」，截图 = 棍子上的胡萝卜 11122「装备：坐骑速度提高3%」）
--   ① 上马（IsMounted 变真）且开关开着（设置 → 功能 → 背包「上马换饰品」/ /gi 上马饰品）：背包里有 ns.MOUNT_TRINKETS 里的饰品
--        （天空破碎者之鞭只在能飞的地方；马鞭 > 胡萝卜）→ 换进饰品栏：有空的饰品栏先用空的，没有就换下栏（14）；记下槽位和原饰品
--        已经戴着任何一件坐骑饰品 = 不动（玩家自己戴的不归我们管）
--   ② 下马：那一格还是我们换上的那件 → 换回原饰品（原来是空的 = 摘回背包）；
--        玩家自己换过那一格 / 原饰品已经不在背包（卖了 / 进银行）→ 放弃换回，只清掉记录
--   ③ 战斗中 / 读条中 / 死亡时一律不动：排队，等脱战（PLAYER_REGEN_ENABLED）/ 读条结束 / 复活时再按当时骑没骑着补做（被打下马 = 脱战后换回）
--   ④ 每次换装屏幕中上方弹一行字（「已换上 …」「已换回 …」），0.7 秒后 0.8 秒淡出；不发聊天、不出声
--   上下马检测：PLAYER_MOUNT_DISPLAY_CHANGED + UNIT_AURA(player) 兜底（⛔ 不注册 COMBAT_LOG_EVENT_UNFILTERED：无限 12.0 引擎会禁用整个插件）
--   主插件 MountStub.lua 是触发桩：第一次上马、背包里有坐骑饰品才加载本子插件，之后这里自己接事件
--   ⛔ 这个文件晚于主插件加载：文件头 ns = _G.GearInsightForever or ns；状态都放在 MT 表上（不放在框体上）
local _, ns = ...; ns = _G.GearInsightForever or ns
local L = function(cn, en) return ns.L(cn, en) end

local MT = { HOLD = 0.7, FADE = 0.8, t = 0 }   -- slot / orig / id：我们换上的那一格、原来那件（nil = 原来是空的）、换上的坐骑饰品
ns.MountTrinket = MT
-- 天空破碎者之鞭（只在能飞的地方）> 马鞭 > 棍子上的胡萝卜。11-20 查无限客户端 DB2（1.60.1.70532 Item.csv）只有 11122，另两件留着不碍事
--   （主插件触发桩 MountStub.lua 只认 11122）
local IDS = { 32863, 25653, 11122 }
MT.IDS = IDS
local FLY = { [32863] = true }
local NAMES = { [11122] = { "棍子上的胡萝卜", "Carrot on a Stick" }, [25653] = { "马鞭", "Riding Crop" }, [32863] = { "天空破碎者之鞭", "Skybreaker Whip" } }

local function inv(slot) return GetInventoryItemID("player", slot) end
local function cfn(k)
    local C = rawget(_G, "C_Container")
    return (type(C) == "table" and C[k]) or rawget(_G, k)
end
-- 那一格是什么物品：新接口 GetContainerItemID，没有就读 GetContainerItemInfo（新客户端返回表 .itemID）
local function slotID(bag, s)
    local f = cfn("GetContainerItemID")
    if f then return f(bag, s) end
    f = cfn("GetContainerItemInfo")
    local a = f and f(bag, s)
    if type(a) == "table" then return a.itemID end
    return nil
end
local function cont()
    return cfn("GetContainerNumSlots"), slotID, cfn("GetContainerNumFreeSlots"), cfn("PickupContainerItem")
end
local function equip(id, slot)
    local C = rawget(_G, "C_Item")
    local f = (type(C) == "table" and C.EquipItemByName) or rawget(_G, "EquipItemByName")
    if f then pcall(f, id, slot) end
end

function MT.Name(id)
    local C = rawget(_G, "C_Item")
    local ok, n = pcall((type(C) == "table" and C.GetItemNameByID) or GetItemInfo, id)
    if ok and type(n) == "string" and n ~= "" then return n end
    local t = NAMES[id]
    return t and L(t[1], t[2]) or ("#" .. tostring(id))
end

-- 背包里找这件 → bag, slot
function MT.Find(id)
    local num, get = cont()
    if not (num and get) then return nil end
    for bag = 0, tonumber(NUM_BAG_SLOTS) or 4 do
        for s = 1, tonumber(num(bag)) or 0 do
            if get(bag, s) == id then return bag, s end
        end
    end
end

-- 普通背包里的一个空格（特殊背包放不进饰品）→ bag, slot
function MT.FreeSlot()
    local num, get, free = cont()
    if not (num and get) then return nil end
    for bag = 0, tonumber(NUM_BAG_SLOTS) or 4 do
        local fam = 0
        if free then fam = select(2, free(bag)) or 0 end
        if fam == 0 then
            for s = 1, tonumber(num(bag)) or 0 do
                if get(bag, s) == nil then return bag, s end
            end
        end
    end
end

function MT.Busy()
    if InCombatLockdown and InCombatLockdown() then return true end
    if UnitIsDeadOrGhost and UnitIsDeadOrGhost("player") then return true end
    for _, f in ipairs({ UnitCastingInfo or false, UnitChannelInfo or false }) do   -- ⛔ 别放 nil：ipairs 遇到 nil 就停
        if f then
            local ok, v = pcall(function() return f("player") ~= nil end)   -- 12.0 引擎的秘密值只许判空，出错当没在读条
            if ok and v then return true end
        end
    end
    return false
end

-- 背包里该换上哪件（已经戴着任意一件坐骑饰品 = nil）
function MT.Pick()
    for _, id in ipairs(IDS) do
        if inv(13) == id or inv(14) == id then return nil end
    end
    local fly = IsFlyableArea and IsFlyableArea()
    for _, id in ipairs(IDS) do
        if (fly or not FLY[id]) and MT.Find(id) then return id end
    end
end

-- ---------- 屏幕中上方一行字，快速淡出 ----------
function MT.Fade(self, el)
    MT.t = MT.t + (tonumber(el) or 0)
    if MT.t >= MT.HOLD + MT.FADE then
        self:Hide()
    elseif MT.t > MT.HOLD then
        self:SetAlpha(1 - (MT.t - MT.HOLD) / MT.FADE)
    end
end
function MT.Say(msg)
    MT.msg = msg
    if not MT.tip then
        local t = CreateFrame("Frame", nil, UIParent)
        t:SetSize(640, 40)
        t:SetPoint("TOP", UIParent, "TOP", 0, -160)
        t:SetFrameStrata("HIGH")
        local fs = t:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        fs:SetPoint("CENTER")
        t:SetScript("OnUpdate", MT.Fade)
        MT.tip, MT.fs = t, fs
    end
    MT.fs:SetText("|cff33ff99" .. msg .. "|r")
    MT.t = 0
    MT.tip:SetAlpha(1)
    MT.tip:Show()
end

-- ---------- 换上 / 换回 ----------
function MT.Equip()
    local id = MT.Pick()
    if not id then return false end
    local slot = (inv(13) == nil and 13) or (inv(14) == nil and 14) or 14
    MT.slot, MT.orig, MT.id = slot, inv(slot), id
    equip(id, slot)
    MT.Say(L("已换上 ", "Equipped ") .. MT.Name(id))
    return true
end

function MT.Restore()
    local slot, orig, id = MT.slot, MT.orig, MT.id
    MT.slot, MT.orig, MT.id = nil, nil, nil
    if not slot or inv(slot) ~= id then return false end   -- 玩家自己换过这一格（或还没换上）：不覆盖
    if orig then
        if not MT.Find(orig) then return false end         -- 原饰品已经不在背包：放弃
        equip(orig, slot)
        MT.Say(L("已换回 ", "Swapped back ") .. MT.Name(orig))
        return true
    end
    -- 原来这一格是空的：摘回背包（背包满就不动）
    local _, _, _, pick = cont()
    local bag, s = MT.FreeSlot()
    if not (bag and pick and PickupInventoryItem) then return false end
    PickupInventoryItem(slot)
    pick(bag, s)
    if ClearCursor then ClearCursor() end
    MT.Say(L("已摘下 ", "Unequipped ") .. MT.Name(id))
    return true
end

-- 按现在骑没骑着补做；战斗中 / 读条 / 死亡 = 先不动（MT.wait 记着），等下面那几个事件再来
--   只在上下马状态变了 / 有排队时才干活（UNIT_AURA 很频繁，骑着马时别每次都扫背包）
function MT.Sync()
    local m = (IsMounted and IsMounted()) and true or false
    if m == MT.was and not MT.wait then return false end
    if MT.Busy() then MT.wait = true; return false end
    MT.was, MT.wait = m, nil
    if m then
        if not MT.slot and not ns.FeatureOff("mounttrinket") then return MT.Equip() end
    elseif MT.slot then
        return MT.Restore()
    end
    return false
end

local ev = CreateFrame("Frame")
for _, e in ipairs({ "PLAYER_MOUNT_DISPLAY_CHANGED", "PLAYER_REGEN_ENABLED", "PLAYER_ALIVE", "PLAYER_UNGHOST" }) do
    pcall(ev.RegisterEvent, ev, e)   -- ⛔ 容错注册：客户端没有的事件名会报错
end
for _, e in ipairs({ "UNIT_AURA", "UNIT_SPELLCAST_STOP", "UNIT_SPELLCAST_CHANNEL_STOP", "UNIT_SPELLCAST_INTERRUPTED" }) do
    pcall(ev.RegisterUnitEvent, ev, e, "player")
end
pcall(ev.RegisterEvent, ev, "COMPANION_UPDATE")
ev:SetScript("OnEvent", function() pcall(MT.Sync) end)
MT.ev = ev   -- 测试用

-- /gi 上马饰品 [开|关] · /gi mounttrinket [on|off]：不带参数 = 切换（主插件 MountStub.lua 放的是占位：先加载本子插件再转过来）
ns.ExtraSlash = ns.ExtraSlash or {}
ns.ExtraSlash["上马饰品"] = function(rest, raw)
    local r, c = (rest or ""):gsub("%s", ""), (raw or ""):gsub("%s", "")   -- rest 已转小写；中文按原样（raw）认
    local on = not ns.FeatureOff("mounttrinket")
    ns.SetFeature("mounttrinket", r == "on" or c == "开" or (r ~= "off" and c ~= "关" and not on))
    on = not ns.FeatureOff("mounttrinket")
    ns.Print(L("上马自动换饰品：", "Mount trinket swap: ") .. (on and L("开", "on") or L("关", "off"))
        .. L("（上马换上棍子上的胡萝卜，下马换回原饰品；设置 → 功能 → 背包）", " (Carrot on a Stick while mounted, original trinket back on dismount; Settings > Features > Bags)"))
    if on then MT.wait = true; pcall(MT.Sync) end   -- 骑着马时打开 = 当场换上
end
ns.ExtraSlash.mounttrinket = ns.ExtraSlash["上马饰品"]

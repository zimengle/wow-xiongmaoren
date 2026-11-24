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
-- 11-23 用户「胡萝卜饰品，下马没换回来，搞个UI，可以随时开启关闭」「让用户直观控制」：
--   ⑤ 换装记录存进存档 ns.db.mtSwap = { 槽位, 原饰品, 换上的 }：骑着马 /reload、掉线、下线再上来，下马照样换回（原来只记在内存里，一重载就丢）
--   ⑥ 屏幕上一个胡萝卜图标（有胡萝卜才出）：左键开 / 关（亮 + 绿字「上马换」/ 灰 + 红字「已关」）、拖动挪位置、右键隐藏（/gi 上马饰品 图标 找回）；
--      骑着马时关掉 = 当场换回原饰品
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
    if ns.db then ns.db.mtSwap = { slot, MT.orig or false, id } end   -- 11-23 ⑤ 存档里也记一份
    equip(id, slot)
    MT.Say(L("已换上 ", "Equipped ") .. MT.Name(id))
    return true
end

function MT.Restore()
    local slot, orig, id = MT.slot, MT.orig, MT.id
    MT.slot, MT.orig, MT.id = nil, nil, nil
    if ns.db then ns.db.mtSwap = nil end
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

-- ---------- 11-23 ⑥ 开关图标 ----------
local CARROT = 11122
function MT.Owned() return MT.Find(CARROT) ~= nil or inv(13) == CARROT or inv(14) == CARROT end
function MT.BtnDB() ns.db.mtBtn = ns.db.mtBtn or {}; return ns.db.mtBtn end
function MT.BtnUpdate()
    local b = MT.btn
    if not b or not ns.db then return end
    if MT.BtnDB().hide or not MT.Owned() then b:Hide(); return end
    local on = not ns.FeatureOff("mounttrinket")
    if b.icon.SetDesaturated then b.icon:SetDesaturated(not on) end
    b.icon:SetAlpha(on and 1 or 0.55)
    b.txt:SetText(on and ("|cff33ff99" .. L("上马换", "Auto") .. "|r") or ("|cffff5555" .. L("已关", "Off") .. "|r"))
    b:Show()
end
-- 开 / 关（v = nil 切换）：开着骑着马 = 当场换上；关掉时戴着我们换上的 = 当场换回
function MT.Toggle(v)
    if v == nil then v = ns.FeatureOff("mounttrinket") end
    ns.SetFeature("mounttrinket", v and true or false)
    if v then MT.wait = true; pcall(MT.Sync)
    elseif MT.slot and not MT.Busy() then pcall(MT.Restore) end
    MT.BtnUpdate()
    MT.Say(v and L("上马自动换胡萝卜：开", "Mount trinket swap: on") or L("上马自动换胡萝卜：关", "Mount trinket swap: off"))
    return v
end
function MT.BtnTip(self)
    if not GameTooltip then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:AddLine(L("上马自动换胡萝卜", "Mount trinket swap"), 1, 0.82, 0)
    if ns.FeatureOff("mounttrinket") then
        GameTooltip:AddLine(L("已关：上马不换", "Off: no swap when mounting"), 1, 0.4, 0.4, true)
    else
        GameTooltip:AddLine(L("开着：上马换上胡萝卜，下马换回原饰品", "On: Carrot on a Stick while mounted, original trinket back on dismount"), 0.4, 1, 0.6, true)
    end
    if MT.slot then
        GameTooltip:AddLine(L("下马会换回：", "Will swap back to: ") .. (MT.orig and MT.Name(MT.orig) or L("（摘回背包）", "(unequip)")), 1, 1, 1, true)
    end
    GameTooltip:AddLine(L("左键：开 / 关　按住左键拖：挪位置　右键点两下：隐藏图标（设置 → 窗口与提醒 找回）", "Left: on/off · Drag: move · Right-click twice: hide (Settings > Windows & alerts)"), 0.7, 0.7, 0.7, true)
    GameTooltip:Show()
end
function MT.BtnHide(hide)
    MT.BtnDB().hide = hide and true or nil
    if not hide then MT.Btn() end
    MT.BtnUpdate()
    if hide then
        ns.Print(L("胡萝卜开关图标已隐藏。找回：GI 菜单 → 设置 → 窗口与提醒「胡萝卜开关图标」点「显示」，或 /gi 上马饰品 图标",
            "Carrot icon hidden. Bring it back: GI menu > Settings > Windows & alerts > Carrot icon, or /gi mounttrinket icon"))
    end
end
-- 11-23 GI-340「上马自动切换饰品图标误关之后无法打开，没有打开的选项」：右键要 3 秒内点两下才隐藏（防手滑），「窗口与提醒」里能找回
MT.HIDE_CONFIRM = 3
function MT.BtnRight()
    local t = (GetTime and GetTime()) or 0
    if MT.hideAsk and t - MT.hideAsk <= MT.HIDE_CONFIRM then
        MT.hideAsk = nil
        return MT.BtnHide(true)
    end
    MT.hideAsk = t
    MT.Say(L("再点一次右键 = 隐藏图标（误点不用管）", "Right-click again to hide the icon"))
end
if ns.RegisterWindow then
    ns.RegisterWindow({ key = "mtBtn", order = 33, title = function() return L("胡萝卜开关图标（上马换饰品）", "Carrot icon (mount trinket)") end,
        state = function()
            if not ns.db then return "" end
            if MT.BtnDB().hide then return L("已隐藏", "Hidden") end
            if not MT.Owned() then return L("背包里没有胡萝卜（有了才显示）", "No Carrot on a Stick in bags") end
            return L("显示中（左键开关、按住拖动）", "Shown (left-click on/off, drag to move)")
        end,
        actions = function()
            local hidden = ns.db and MT.BtnDB().hide
            return {
                { text = hidden and L("显示", "Show") or L("隐藏", "Hide"), fn = function() MT.BtnHide(not hidden) end },
                { text = L("复位位置", "Reset position"), fn = function() MT.BtnReset() end },
            }
        end })
end
MT.BTN_X, MT.BTN_Y = 220, -120   -- 默认位置（屏幕中间偏右下，避开头像框 / 目标框）
-- 位置复原（/gi 上马饰品 图标 复位）
function MT.BtnReset()
    MT.BtnDB().pos, MT.BtnDB().hide = nil, nil
    MT.Btn()
    local b = MT.btn
    if b then b:ClearAllPoints(); b:SetPoint("CENTER", UIParent, "CENTER", MT.BTN_X, MT.BTN_Y) end
    MT.BtnUpdate()
end
function MT.Btn()
    if MT.btn then return MT.BtnUpdate() end
    local b = CreateFrame("Button", "GearInsightForeverCarrotBtn", UIParent)
    b:SetSize(34, 34)
    -- 11-23 用户截图「这个移动不了吗」：默认位置压在头像框底下（MEDIUM 层比头像框低，鼠标点到的是头像框）→ 提到 HIGH、换到屏幕中间偏右下
    b:SetFrameStrata("HIGH")
    if b.SetToplevel then b:SetToplevel(true) end
    if b.SetClampedToScreen then b:SetClampedToScreen(true) end
    b:SetMovable(true)
    b:RegisterForDrag("LeftButton")
    b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    local p = MT.BtnDB().pos
    if type(p) == "table" and p[1] then b:SetPoint(p[1], UIParent, p[2] or p[1], tonumber(p[3]) or 0, tonumber(p[4]) or 0)
    else b:SetPoint("CENTER", UIParent, "CENTER", MT.BTN_X, MT.BTN_Y) end
    local ic = b:CreateTexture(nil, "ARTWORK")
    ic:SetAllPoints()
    local C = rawget(_G, "C_Item")
    local okI, tex = pcall((type(C) == "table" and C.GetItemIconByID) or GetItemIcon or function() end, CARROT)
    ic:SetTexture(okI and tex or "Interface\\Icons\\INV_Misc_Food_54")
    local txt = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    txt:SetPoint("TOP", b, "BOTTOM", 0, -1)
    b.icon, b.txt = ic, txt
    b:SetScript("OnDragStart", function(self) self:StartMoving() end)
    b:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local pt, _, rp, x, y = self:GetPoint()
        MT.BtnDB().pos = { pt, rp, x, y }
    end)
    b:SetScript("OnClick", function(_, btn) if btn == "RightButton" then MT.BtnRight() else MT.Toggle() end end)
    b:SetScript("OnEnter", MT.BtnTip)
    b:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
    MT.btn = b
    MT.BtnUpdate()
end

-- 读回存档里没换回的那一格（骑着马 /reload / 下线过）
do
    local r = ns.db and ns.db.mtSwap
    if type(r) == "table" and r[1] then MT.slot, MT.orig, MT.id = r[1], r[2] or nil, r[3] end
end
if ns.db then pcall(MT.Btn) end

local ev = CreateFrame("Frame")
for _, e in ipairs({ "PLAYER_MOUNT_DISPLAY_CHANGED", "PLAYER_REGEN_ENABLED", "PLAYER_ALIVE", "PLAYER_UNGHOST", "BAG_UPDATE_DELAYED", "PLAYER_EQUIPMENT_CHANGED" }) do
    pcall(ev.RegisterEvent, ev, e)   -- ⛔ 容错注册：客户端没有的事件名会报错
end
for _, e in ipairs({ "UNIT_AURA", "UNIT_SPELLCAST_STOP", "UNIT_SPELLCAST_CHANNEL_STOP", "UNIT_SPELLCAST_INTERRUPTED" }) do
    pcall(ev.RegisterUnitEvent, ev, e, "player")
end
pcall(ev.RegisterEvent, ev, "COMPANION_UPDATE")
ev:SetScript("OnEvent", function(_, e)
    if e == "BAG_UPDATE_DELAYED" or e == "PLAYER_EQUIPMENT_CHANGED" then if MT.btn then pcall(MT.BtnUpdate) else pcall(MT.Btn) end return end   -- 11-23 有没有胡萝卜变了：图标出 / 收
    pcall(MT.Sync)
end)
MT.ev = ev   -- 测试用

-- /gi 上马饰品 [开|关] · /gi mounttrinket [on|off]：不带参数 = 切换（主插件 MountStub.lua 放的是占位：先加载本子插件再转过来）
ns.ExtraSlash = ns.ExtraSlash or {}
ns.ExtraSlash["上马饰品"] = function(rest, raw)
    local r, c = (rest or ""):gsub("%s", ""), (raw or ""):gsub("%s", "")   -- rest 已转小写；中文按原样（raw）认
    if r:find("reset", 1, true) or (raw or ""):find("复位", 1, true) then   -- 11-23 图标拖丢了 / 被挡住：回到默认位置
        MT.BtnReset()
        ns.Print(L("胡萝卜开关图标：已回到默认位置（屏幕中间偏右下），按住左键可以拖", "Carrot icon reset to the default position - drag with the left button"))
        return
    end
    if r == "icon" or (raw or ""):find("图标", 1, true) then   -- 11-23 开关图标隐藏 / 找回（中文按字面找：%s 在某些区域设置下会吃掉中文字节）
        MT.BtnHide(not MT.BtnDB().hide)
        if not MT.BtnDB().hide then ns.Print(L("胡萝卜开关图标：已显示（右键隐藏）", "Carrot icon shown (right-click to hide)")) end
        return
    end
    local on = not ns.FeatureOff("mounttrinket")
    local v = r == "on" or c == "开" or (r ~= "off" and c ~= "关" and not on)
    ns.SetFeature("mounttrinket", v)
    if not v and MT.slot and not MT.Busy() then pcall(MT.Restore) end   -- 11-23 关掉时戴着我们换上的：当场换回
    pcall(MT.BtnUpdate)
    on = not ns.FeatureOff("mounttrinket")
    ns.Print(L("上马自动换饰品：", "Mount trinket swap: ") .. (on and L("开", "on") or L("关", "off"))
        .. L("（上马换上棍子上的胡萝卜，下马换回原饰品；屏幕上的胡萝卜图标左键也能开关；设置 → 功能 → 背包）", " (Carrot on a Stick while mounted, original trinket back on dismount; also the carrot icon on screen; Settings > Features > Bags)"))
    if on then MT.wait = true; pcall(MT.Sync) end   -- 骑着马时打开 = 当场换上
end
ns.ExtraSlash.mounttrinket = ns.ExtraSlash["上马饰品"]

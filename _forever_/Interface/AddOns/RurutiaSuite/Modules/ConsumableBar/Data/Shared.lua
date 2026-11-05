-- 文件职责：提供消耗品动作条版本数据共享构造器。
-- 负责：版本识别、点击动作构造、条目默认值；不保存任何具体版本物品清单。

local _, ns = ...

local H = ns.ConsumableBarDataHelpers or {}
ns.ConsumableBarDataHelpers = H
ns.ConsumableBarDataSets = ns.ConsumableBarDataSets or {}
ns.ConsumableBarDataLoaders = ns.ConsumableBarDataLoaders or {}

H.EXP_ERA = 1
H.EXP_TBC = 2
H.EXP_WLK = 3
H.EXP_CATA = 4
H.EXP_MOP = 5
H.EXP_TITAN = 6
H.EXP_FOREVER = 7

function H.ItemClick(itemID)
    return { type = "item", id = itemID }
end

function H.SlotClick(slot)
    return { type = "slot", slot = slot }
end

function H.MacroClick(text)
    return { type = "macro", macro = text }
end

-- The common item action is needed only when binding a visible secure button
-- or inspecting its options. One shared metatable avoids two eager tables for
-- every unowned item; the first read materializes an ordinary stable value.
local itemEntryMeta = { __index = function(data, key)
    if key ~= "clicks" then return nil end
    local action = H.ItemClick(data.itemID)
    local clicks = { left = action, right = action }
    rawset(data, "clicks", clicks)
    return clicks
end }

function H.Entry(data)
    if data.kind == "potion" and not data.cooldownGroup and not data.useOwnCooldown then
        data.cooldownGroup = "potion"
    end
    if data.itemID and data.clicks == nil and getmetatable(data) == nil then
        return setmetatable(data, itemEntryMeta)
    end
    data.clicks = data.clicks or {}
    local defaultClick
    if data.itemID and not data.clicks.left then
        defaultClick = H.ItemClick(data.itemID)
        data.clicks.left = defaultClick
    end
    if data.itemID and not data.clicks.right then
        -- Immutable default actions may share one descriptor. Explicit left
        -- actions remain independent: they can have different target semantics.
        data.clicks.right = defaultClick or H.ItemClick(data.itemID)
    end
    return data
end

function H.ClassicPotionGroup(items)
    return {
        key = "potions",
        title = "药水组",
        frameName = "RSConsumableBar_Potions",
        label = "消耗品-药水组",
        anchorFrame = "oUF_Player",
        anchorPoint = "BOTTOMLEFT",
        selfPoint = "TOPLEFT",
        xOffset = -0.5,
        yOffset = -2,
        growDirection = "RIGHT",
        wrapDirection = "DOWN",
        itemsPerGroup = 7,
        buttonWidth = 31,
        buttonHeight = 28,
        columnSpace = 0.8,
        rowSpace = 0.8,
        zoom = 0.3,
        frameStrata = "LOW",
        frameLevel = 100,
        items = items,
    }
end

function H.PreMopOtherGroup(items)
    return {
        key = "other",
        title = "其他组",
        frameName = "RSConsumableBar_Other",
        label = "消耗品-其他组",
        anchorPoint = "TOPRIGHT",
        selfPoint = "TOPRIGHT",
        xOffset = -65,
        yOffset = -206,
        growDirection = "DOWN",
        wrapDirection = "LEFT",
        itemsPerGroup = 10,
        buttonWidth = 30,
        buttonHeight = 28,
        columnSpace = 0,
        rowSpace = 0,
        screenAnchorConfigurable = true,
        zoom = 0.3,
        frameStrata = "MEDIUM",
        frameLevel = 300,
        items = items,
    }
end

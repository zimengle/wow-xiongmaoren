local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local Data = {}

Data.constants = {
    hearthstoneId = 6948,
    timeWidth = 63,
    timePadding = 10,
    frameHeightTrim = 6,
    hoverScale = 1.05,
    timeFontSize = 20,
    timeFontFlags = "OUTLINE",
    timeFontFallback = "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf",
    hearthstoneTexture = "Interface\\AddOns\\RurutiaSuite\\Media\\Textures\\hearthstone.tga",
    roleMarkerTexture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2",
}

Data.hearthstoneIds = {
    6948, 253629, 257736, 263933, 263489, 265100,
    54452, 64488, 93672, 142542, 162973, 163045, 165669, 165670,
    165802, 166746, 166747, 168907, 172179, 180290, 182773, 183716,
    184353, 188952, 190196, 190237, 193588, 200630, 206195, 208704,
    209035, 212337, 228940, 235016, 236687, 245970, 246565, 110560,
    140192, 210455,
}

Data.randomExcluded = { [253629] = true, [110560] = true, [140192] = true }
Data.clickKeys = {
    { key = "left", attribute = "1", defaultId = 6948, label = "左键" },
    { key = "right", attribute = "2", defaultId = 140192, label = "右键" },
    { key = "middle", attribute = "3", defaultId = 253629, label = "中键" },
}

local RETAIL_DEFAULTS = {
    profile = {
        enabled = true,
        disableWhenSimilarAddon = false,
        hideInPetBattle = true,
        buttonLayoutVersion = 1,
        addonprofile = {
            position = { point = "TOP", relativePoint = "TOP", x = -460, y = -2 },
        },
        meetingstone = {
            enabled = true, width = 90, height = 20, fontSize = 18, alpha = 1,
            position = { point = "TOP", relativePoint = "TOP", x = -365, y = -2 },
        },
        hearthstone = {
            enabled = true, width = 20, height = 20, alpha = 1,
            position = { point = "TOP", relativePoint = "TOP", x = -275, y = -3 },
            click = {
                left = { random = true, itemId = 6948 },
                right = { random = false, itemId = 140192 },
                middle = { random = false, itemId = 253629 },
            },
        },
        rolemarker = {
            enabled = true,
        },
        micromenu = {
            enabled = true, layoutVersion = 1, useClassColor = true,
            disableWhenNDuiMenu = true, disableWhenWindToolsGameBar = true,
            showGroupFinder = false,
            size = 30, spacing = -2, alpha = 1,
            position = { point = "TOP", relativePoint = "TOP", x = 0, y = -2 },
        },
    },
}

local CLASSIC_DEFAULTS = {
    profile = {
        rolemarker = { enabled = true },
        enabled = true,
        hideInPetBattle = true,
        buttonLayoutVersion = 9,
        meetingstone = {
            enabled = true, width = 90, height = 20, fontSize = 18, alpha = 1,
            iconWidth = 33, iconHeight = 34,
            textPoint = "CENTER", textRelativePoint = "CENTER", textOffsetX = 6,
            textOffsetY = 0, textJustify = "CENTER",
            position = { point = "TOP", relativePoint = "TOP", x = -456.48, y = -1.67 },
        },
        handbook = {
            enabled = true, width = 90, height = 20, iconWidth = 31, iconHeight = 32,
            fontSize = 18, alpha = 1, textPoint = "LEFT", textRelativePoint = "LEFT",
            textOffsetX = 27, textOffsetY = 0, textWidth = 64, textJustify = "LEFT",
            position = { point = "TOP", relativePoint = "TOP", x = -375, y = -1.67 },
        },
        hearthstone = {
            enabled = true, width = 19, height = 19, alpha = 1,
            position = { point = "TOP", relativePoint = "TOP", x = -275, y = -4.5 },
        },
        automark = {
            enabled = true, width = 23, height = 23, alpha = 1,
            position = { point = "CENTER", relativePoint = "TOP", x = -246, y = -14.5 },
        },
        micromenu = {
            enabled = true, layoutVersion = 4, useClassColor = true, showStore = false,
            disableWhenNDuiMenu = true, size = 30, spacing = -2, alpha = 1,
            position = { point = "TOP", relativePoint = "TOP", x = 0, y = -2 },
        },
    },
}

local RETAIL_MENU = {
    { key = "character", texture = "player", tooltip = "character", nativeButton = "CharacterMicroButton" },
    { key = "spellbook", texture = "spellbook", tooltip = "专业技能", nativeMacroButton = "ProfessionMicroButton", combatLocked = true },
    { key = "talents", texture = "talents", tooltip = "天赋与法术书", nativeMacroButton = "PlayerSpellsMicroButton", combatLocked = true },
    { key = "achievements", texture = "achievements", tooltip = "成就", nativeButton = "AchievementMicroButton", combatLocked = true },
    { key = "quest", texture = "quests", tooltip = "任务日志", nativeButton = "QuestLogMicroButton" },
    { key = "guild", texture = "guild", tooltip = "公会", nativeButton = "GuildMicroButton" },
    { key = "time", isTime = true },
    { key = "lfg", texture = "LFG", tooltip = "队伍查找器", nativeButton = "LFDMicroButton" },
    { key = "collections", texture = "collections", tooltip = "坐骑与藏品", nativeButton = "CollectionsMicroButton" },
    { key = "journal", texture = "encounter", tooltip = "地下城手册", action = "journal" },
    { key = "pvp", texture = "pvp", tooltip = "pvp", action = "pvp" },
    { key = "housing", texture = "home", tooltip = "housing", nativeButton = "HousingMicroButton" },
    { key = "bags", texture = "bags", tooltip = "背包", action = "bags" },
    { key = "main", texture = "help", tooltip = "main", action = "main" },
}

local CLASSIC_MENU = {
    { key = "character", texture = "player", tooltip = "character", action = "character" },
    { key = "spellbook", texture = "spellbook", tooltip = "法术书和技能", secureClick = "/click SpellbookMicroButton" },
    { key = "talents", texture = "talents", tooltip = "天赋和模拟器", action = "talents" },
    { key = "achievements", texture = "achievements", tooltip = "成就", secureClick = "/click AchievementMicroButton", hideOnEra = true },
    { key = "quest", texture = "quests", tooltip = "任务日志", action = "quest" },
    { key = "guild", texture = "guild", tooltip = "公会", action = "guild" },
    { key = "time", isTime = true },
    { key = "lfg", texture = "LFG", tooltip = "队伍查找器", action = "lfg" },
    { key = "collections", texture = "collections", tooltip = "坐骑与藏品", action = "collections", hideOnEra = true },
    { key = "journal", texture = "pvp", tooltip = "journal", action = "journal" },
    { key = "pvp", texture = "encounter", tooltip = "PVP、排战场", action = "classic-pvp" },
    { key = "store", texture = "store", tooltip = "商城", secureClick = "/click StoreMicroButton", hideOnEra = true },
    { key = "bags", texture = "bags", tooltip = "背包", action = "bags" },
    { key = "main", texture = "help", tooltip = "main", action = "main" },
}

local function InfiniteNativeItem(key, texture, tooltip, target, tooltipNote)
    return {
        key = key, texture = texture, tooltip = tooltip,
        secureClick = "/stopmacro [combat]\n/click " .. target,
        nativeTarget = target, tooltipButton = target,
        nativeSecureMenu = true, combatLocked = true,
        tooltipNote = tooltipNote,
    }
end

-- Forever uses Mainline micro buttons with its own spellbook/talent targets.
-- Keep this table independent of Classic: ordinary panel toggles must never be
-- inherited here. Combat is blocked by the macro, without a combatlock snippet.
local INFINITE_MENU = {
    InfiniteNativeItem("character", "player", "character", "CharacterMicroButton"),
    InfiniteNativeItem("spellbook", "spellbook", "法术书和技能", "SpellbookMicroButton"),
    InfiniteNativeItem("talents", "talents", "天赋", "TalentMicroButton"),
    InfiniteNativeItem("legacy", "achievements", "传统", "LegacyMicroButton"),
    InfiniteNativeItem("quest", "quests", "任务日志", "QuestLogMicroButton"),
    InfiniteNativeItem("guild", "guild", "公会", "GuildMicroButton"),
    { key = "time", isTime = true },
    InfiniteNativeItem("professions", "professions", "专业", "ProfessionMicroButton"),
    InfiniteNativeItem("collections", "collections", "坐骑与藏品", "CollectionsMicroButton"),
    { key = "journal", texture = "pvp", tooltip = "journal", action = "journal", combatLocked = true },
    InfiniteNativeItem("pvp", "encounter", "荣誉（人物面板内选择荣誉页）", "CharacterMicroButton", "在人物面板内选择荣誉页。"),
    { key = "bags", texture = "bags", tooltip = "背包", action = "bags" },
    { key = "main", texture = "help", tooltip = "main", action = "main", combatLocked = true },
}

local function Copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    local key
    local child
    for key, child in pairs(value) do result[key] = Copy(child) end
    return result
end

function Data:GetDefaults(family)
    return Copy(family == "retail" and RETAIL_DEFAULTS or CLASSIC_DEFAULTS)
end

function Data:GetMenuItems(family, buildId)
    local source = family == "retail" and RETAIL_MENU or CLASSIC_MENU
    if buildId == "classic-infinite" then source = INFINITE_MENU end
    local result = {}
    local index
    for index = 1, #source do
        local item = source[index]
        if item and not (buildId == "classic-era" and item.hideOnEra) then
            result[#result + 1] = Copy(item)
        end
    end
    return result
end

function Data:CopyPosition(position, fallback)
    position = type(position) == "table" and position or fallback or {}
    fallback = fallback or position
    return {
        point = position.point or fallback.point or "CENTER",
        relativePoint = position.relativePoint or fallback.relativePoint or "CENTER",
        x = tonumber(position.x) or tonumber(fallback.x) or 0,
        y = tonumber(position.y) or tonumber(fallback.y) or 0,
    }
end

function Data:ChooseRandom(available, lastId, random)
    local pool = {}
    local id
    for id, info in pairs(available or {}) do
        if not self.randomExcluded[id] and info.usable ~= false then pool[#pool + 1] = id end
    end
    if #pool == 0 then return self.constants.hearthstoneId end
    if #pool == 1 then return pool[1] end
    local candidates = {}
    local index
    for index = 1, #pool do
        if pool[index] ~= lastId then candidates[#candidates + 1] = pool[index] end
    end
    local source = #candidates > 0 and candidates or pool
    local choose = random or math.random
    return source[choose(#source)]
end

function Data:BuildDropdown(available)
    local list = {}
    local order = {}
    local index
    for index = 1, #self.hearthstoneIds do
        local id = self.hearthstoneIds[index]
        local info = available and available[id]
        if info then
            list[tostring(id)] = info.name .. (info.usable == false and "（不可用）" or "")
            order[#order + 1] = tostring(id)
        end
    end
    return list, order
end

function Data:BuildMenuLayout(items, iconSize, spacing)
    iconSize = tonumber(iconSize) or 30
    spacing = tonumber(spacing) or -2
    local timeIndex
    local index
    for index = 1, #items do if items[index].isTime then timeIndex = index break end end
    local function width(item) return item and item.isTime and self.constants.timeWidth or iconSize end
    local function gap(left, right)
        if (left and left.isTime) or (right and right.isTime) then
            return spacing + self.constants.timePadding
        end
        return spacing
    end
    local positions = {}
    if not timeIndex then
        local cursor = 0
        for index = 1, #items do
            positions[items[index].key] = cursor
            cursor = cursor + width(items[index]) + (items[index + 1] and gap(items[index], items[index + 1]) or 0)
        end
        return { width = cursor, positions = positions, items = items }
    end
    local leftWidth = 0
    local rightWidth = 0
    for index = 1, timeIndex - 1 do
        leftWidth = leftWidth + width(items[index]) + gap(items[index], items[index + 1])
    end
    for index = timeIndex + 1, #items do
        rightWidth = rightWidth + gap(items[index - 1], items[index]) + width(items[index])
    end
    local timeWidth = width(items[timeIndex])
    local total = math.max(leftWidth, rightWidth) * 2 + timeWidth
    positions[items[timeIndex].key] = total / 2 - timeWidth / 2
    local cursor = positions[items[timeIndex].key]
    for index = timeIndex - 1, 1, -1 do
        cursor = cursor - gap(items[index], items[index + 1]) - width(items[index])
        positions[items[index].key] = cursor
    end
    cursor = positions[items[timeIndex].key] + timeWidth
    for index = timeIndex + 1, #items do
        cursor = cursor + gap(items[index - 1], items[index])
        positions[items[index].key] = cursor
        cursor = cursor + width(items[index])
    end
    return { width = total, positions = positions, items = items, timeCenterX = total / 2 }
end

Data.settingsLayout = {
    pageId = "topBar", title = "快捷按钮", navigationOrder = 30,
    columns = 2, controlHeight = 30,
}

ns.TopBarData = Data

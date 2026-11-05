local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end

-- FastFocus 的纯数据合同：默认值、标记和频道元数据，以及旧配置规范化。
-- 本文件不得依赖客户端 API，运行时能力统一留给 Core 和构建适配层。
local Data = {}

local LEGACY_CHAT_TEMPLATES_CN = {
    ["我打断：{mark} {focus}"] = true,
    ["我打断 {mark} {focus}"] = true,
}

local VALID_MODIFIERS = { SHIFT = true, CTRL = true, ALT = true }
local VALID_MOUSE_BUTTONS = { ["1"] = true, ["2"] = true, ["3"] = true, ["4"] = true, ["5"] = true }

Data.defaults = {
    profile = {
        enabled = true,
        modifier = "SHIFT",
        mouseButton = "1",
        allowClearFocus = true,
        markEnabled = false,
        marker = 3,
        overwriteExistingMark = false,
        chatMarkerMode = "none",
        showFocusName = true,
        disableCenterReminder = false,
        disableHealerReminder = true,
        reminderPosition = { x = 0, y = 190 },
        disableMarkInRaid = true,
        excludedMarkers = {
            [1] = true,
            [2] = true,
            [3] = false,
            [4] = false,
            [5] = false,
            [6] = false,
            [7] = false,
            [8] = false,
        },
        chatEnabled = ns.Build.IsFamily("retail"),
        disableChatInRaid = true,
        chatCommand = "p",
        useEnglishChat = false,
        chatTemplateCN = "我打断{mark} {focus}",
        chatTemplateEN = "I kick {mark} {focus}",
    },
    global = {
        lastMythicReminderDay = nil,
    },
}

-- 默认菜单先显示这六枚标记；星星和大饼取消排除后排在末尾。
Data.preferredMarkerOrder = { 3, 4, 6, 7, 5, 8 }
Data.markerOrder = { 3, 4, 6, 7, 5, 8, 1, 2 }
Data.markerInfo = {
    [1] = { id = 1, name = "星星", englishName = "Star", color = "#FFE400" },
    [2] = { id = 2, name = "大饼", englishName = "Circle", color = "#FF7D0A" },
    [3] = { id = 3, name = "菱形", englishName = "Diamond", color = "#BE20F2" },
    [4] = { id = 4, name = "三角", englishName = "Triangle", color = "#00FF00" },
    [5] = { id = 5, name = "月亮", englishName = "Moon", color = "#DFEDF4" },
    [6] = { id = 6, name = "方块", englishName = "Square", color = "#4C99FF" },
    [7] = { id = 7, name = "叉叉", englishName = "Cross", color = "#E53F38" },
    [8] = { id = 8, name = "骷髅", englishName = "Skull", color = "#FFFFFF" },
}

Data.chatCommandOrder = { "say", "yell", "p", "i", "raid" }
Data.chatCommands = {
    say = { command = "say", label = "说", description = "说 (/say)", chatType = "SAY" },
    yell = { command = "yell", label = "喊", description = "喊 (/yell)", chatType = "YELL" },
    p = { command = "p", label = "队伍", description = "小队 (/p)", chatType = "PARTY" },
    i = { command = "i", label = "副本", description = "副本 (/i)", chatType = "INSTANCE_CHAT" },
    raid = { command = "raid", label = "团队", description = "团队 (/raid)", chatType = "RAID" },
}

local function Copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    local key
    local child
    for key, child in pairs(value) do result[key] = Copy(child) end
    return result
end

local function IsValidMarker(marker)
    marker = tonumber(marker)
    return marker ~= nil and marker >= 1 and marker <= 8 and marker % 1 == 0
end

local function FillMissing(target, defaults)
    local key
    local value
    for key, value in pairs(defaults) do
        if target[key] == nil then
            target[key] = Copy(value)
        elseif type(value) == "table" and type(target[key]) == "table" then
            FillMissing(target[key], value)
        end
    end
end

function Data.Copy(value)
    return Copy(value)
end

function Data.IsValidMarker(marker)
    return IsValidMarker(marker)
end

-- A missing binding preserves legacy settings; an empty binding explicitly clears it.
function Data.NormalizeBinding(binding)
    if type(binding) ~= "string" then return nil end
    binding = binding:upper()
    if binding == "" then return "" end
    local mods = {}
    while true do
        local modifier, rest = binding:match("^(%u+)%-(.+)$")
        if modifier ~= "ALT" and modifier ~= "CTRL" and modifier ~= "SHIFT" then break end
        if mods[modifier] then return nil end
        mods[modifier], binding = true, rest
    end
    local mouse = tonumber(binding:match("^BUTTON(%d+)$"))
    local fn = tonumber(binding:match("^F(%d+)$"))
    local named = { SPACE=true, TAB=true, ENTER=true, BACKSPACE=true, DELETE=true,
        INSERT=true, HOME=true, END=true, PAGEUP=true, PAGEDOWN=true, UP=true, DOWN=true,
        LEFT=true, RIGHT=true, MOUSEWHEELUP=true, MOUSEWHEELDOWN=true,
        NUMPADPLUS=true, NUMPADMINUS=true, NUMPADMULTIPLY=true, NUMPADDIVIDE=true,
        NUMPADDECIMAL=true, NUMPADENTER=true }
    if not (binding:match("^[A-Z0-9%p]$") or binding:match("^NUMPAD[0-9]$")
        or named[binding] or mouse and mouse >= 1 and mouse <= 31
        or fn and fn >= 1 and fn <= 24) then return nil end
    if (binding == "BUTTON1" or binding == "BUTTON2") and not next(mods) then return nil end
    local prefix = ""
    for _, modifier in ipairs({"ALT", "CTRL", "SHIFT"}) do
        if mods[modifier] then prefix = prefix .. modifier .. "-" end
    end
    return prefix .. binding
end

function Data.GetBinding(profile)
    if profile.binding ~= nil then return Data.NormalizeBinding(profile.binding) or "" end
    return tostring(profile.modifier or "SHIFT") .. "-BUTTON" .. tostring(profile.mouseButton or "1")
end

function Data.GetMouseBinding(profile)
    local binding = Data.GetBinding(profile)
    local prefix, button = binding:match("^(.-)BUTTON(%d+)$")
    if not button then return nil end
    return prefix:lower(), button
end

function Data.BindingLabel(binding)
    if not binding or binding == "" then return "未设置" end
    return (binding:gsub("BUTTON1$", "鼠标左键"):gsub("BUTTON2$", "鼠标右键")
        :gsub("BUTTON3$", "鼠标中键"):gsub("BUTTON(%d+)$", "鼠标侧键%1")
        :gsub("MOUSEWHEELUP", "滚轮向上"):gsub("MOUSEWHEELDOWN", "滚轮向下")
        :gsub("ALT%-", "Alt + "):gsub("CTRL%-", "Ctrl + "):gsub("SHIFT%-", "Shift + "))
end

function Data.NormalizeProfile(profile)
    if type(profile) ~= "table" then profile = {} end
    FillMissing(profile, Data.defaults.profile)

    profile.enabled = profile.enabled ~= false
    profile.modifier = tostring(profile.modifier or "SHIFT"):upper()
    if not VALID_MODIFIERS[profile.modifier] then profile.modifier = "SHIFT" end
    profile.mouseButton = tostring(profile.mouseButton or "1")
    if not VALID_MOUSE_BUTTONS[profile.mouseButton] then profile.mouseButton = "1" end
    profile.allowClearFocus = profile.allowClearFocus ~= false

    profile.markEnabled = profile.markEnabled == true
    profile.marker = tonumber(profile.marker)
    if not IsValidMarker(profile.marker) then profile.marker = Data.defaults.profile.marker end
    profile.overwriteExistingMark = profile.overwriteExistingMark == true
    if profile.chatMarkerMode ~= "text" and profile.chatMarkerMode ~= "icon"
        and profile.chatMarkerMode ~= "none" then
        profile.chatMarkerMode = "text"
    end
    profile.showFocusName = profile.showFocusName ~= false
    profile.disableCenterReminder = profile.disableCenterReminder == true
    profile.disableHealerReminder = profile.disableHealerReminder ~= false
    if type(profile.reminderPosition) ~= "table" then
        profile.reminderPosition = Copy(Data.defaults.profile.reminderPosition)
    end
    profile.fixedChatMarker = nil
    profile.hideFocusName = nil
    profile.disableMarkInRaid = profile.disableMarkInRaid ~= false
    if type(profile.excludedMarkers) ~= "table" then
        profile.excludedMarkers = Copy(Data.defaults.profile.excludedMarkers)
    end

    profile.chatEnabled = profile.chatEnabled ~= false
    profile.disableChatInRaid = profile.disableChatInRaid ~= false
    profile.chatCommand = tostring(profile.chatCommand or Data.defaults.profile.chatCommand):lower()
    if Data.chatCommands[profile.chatCommand] == nil then
        profile.chatCommand = Data.defaults.profile.chatCommand
    end
    profile.useEnglishChat = profile.useEnglishChat == true
    if LEGACY_CHAT_TEMPLATES_CN[profile.chatTemplateCN] then
        profile.chatTemplateCN = Data.defaults.profile.chatTemplateCN
    elseif type(profile.chatTemplateCN) ~= "string" then
        profile.chatTemplateCN = Data.defaults.profile.chatTemplateCN
    end
    if type(profile.chatTemplateEN) ~= "string" then
        profile.chatTemplateEN = Data.defaults.profile.chatTemplateEN
    end
    return profile
end

function Data.CloneProfile(profile)
    return Data.NormalizeProfile(Copy(profile))
end

function Data.GetMarkerInfo(marker)
    marker = tonumber(marker)
    local source = Data.markerInfo[marker]
    if source == nil then return nil end
    local info = Copy(source)
    info.icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_" .. marker
    return info
end

function Data.GetAvailableMarkers(profile)
    profile = Data.CloneProfile(profile)
    local result = {}
    local index
    for index = 1, #Data.markerOrder do
        local marker = Data.markerOrder[index]
        if profile.excludedMarkers[marker] ~= true then
            result[#result + 1] = Data.GetMarkerInfo(marker)
        end
    end
    return result
end

function Data.GetChatCommand(command)
    command = tostring(command or Data.defaults.profile.chatCommand):lower()
    return Data.chatCommands[command] or Data.chatCommands[Data.defaults.profile.chatCommand]
end

ns.FastFocusData = Data

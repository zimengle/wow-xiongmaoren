local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end

-- FastFocus 的纯宏编译层：只把已规范化的配置转换为安全宏文本。
-- 不读取实例、战斗或单位状态；调用方通过 options 显式提供环境。
local Data = ns.FastFocusData
if type(Data) ~= "table" then
    error("FastFocus Data.lua must load before Macro.lua", 2)
end

local Macro = {
    maxBytes = 255,
}

local function TrimMessage(value)
    value = tostring(value or "")
    value = value:gsub("[\r\n]+", " ")
    value = value:gsub("^%s+", "")
    value = value:gsub("%s+$", "")
    value = value:gsub("%s+", " ")
    return value
end

local function AddFocusLines(lines, profile)
    if profile.allowClearFocus then
        lines[#lines + 1] = "/clearfocus [@mouseover,noexists]"
        lines[#lines + 1] = "/stopmacro [@mouseover,noexists]"
    end
    lines[#lines + 1] = "/focus [@mouseover,exists]"
end

local function GetMarkerAnnouncement(profile)
    local info = Data.GetMarkerInfo(profile.marker)
    if not info then return tostring(profile.marker) end
    if profile.chatMarkerMode == "icon" then
        return "{rt" .. profile.marker .. "}"
    end
    return profile.useEnglishChat and info.englishName or info.name
end

local function Compile(profile, options, focusOnly)
    profile = Data.CloneProfile(profile)
    options = options or {}
    local lines = {}
    AddFocusLines(lines, profile)

    if not focusOnly then
        local inRaid = options.inRaid == true
        local markEnabled = profile.markEnabled
            and not (inRaid and profile.disableMarkInRaid)
        if markEnabled then
            lines[#lines + 1] = "/click RSFastFocusMarkerButton LeftButton true"
        end

        local chatEnabled = profile.chatEnabled
            and not (inRaid and profile.disableChatInRaid)
        if chatEnabled then
            local template = profile.useEnglishChat
                and profile.chatTemplateEN or profile.chatTemplateCN
            local message = TrimMessage(template)
            if profile.showFocusName then
                message = message:gsub("{focus}", "%%f")
            else
                message = message:gsub("{focus}", "")
            end
            if profile.chatMarkerMode ~= "none" then
                message = message:gsub("{mark}", GetMarkerAnnouncement(profile))
            else
                message = message:gsub("{mark}", "")
            end
            message = TrimMessage(message)
            if message ~= "" then
                lines[#lines + 1] = "/" .. profile.chatCommand .. " " .. message
            end
        end
    end

    local text = table.concat(lines, "\n")
    local byteCount = #text
    if byteCount > Macro.maxBytes then
        return nil, string.format(
            "快速焦点宏长度为 %d 字节，超过 %d 字节限制。",
            byteCount,
            Macro.maxBytes
        )
    end
    return text
end

function Macro.Build(profile, options)
    return Compile(profile, options, false)
end

function Macro.BuildFocusOnly(profile)
    return Compile(profile, nil, true)
end

function Macro.CloneCandidate(profile, changes)
    local candidate = Data.CloneProfile(profile)
    if type(changes) == "table" then
        local key
        local value
        for key, value in pairs(changes) do candidate[key] = Data.Copy(value) end
    end
    return Data.NormalizeProfile(candidate)
end

function Macro.BuildCandidate(profile, changes, options)
    local candidate = Macro.CloneCandidate(profile, changes)
    local text, reason = Macro.Build(candidate, options)
    if text == nil then return nil, nil, reason end
    return candidate, text
end

ns.FastFocusMacro = Macro

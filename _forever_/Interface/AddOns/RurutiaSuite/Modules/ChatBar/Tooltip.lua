local _, ns = ...

local Definition = ns.ChatBarDefinition
if type(Definition) ~= "table" then return end
local Adapter = ns.ChatBarAdapter

local ACTION = "|cff00ff00"
local WHITE = "|cffffffff"
local RESET = "|r"

local function Action(text) return ACTION .. text .. RESET end
local function Prefix(text) return WHITE .. text .. RESET end
local function Text(text) return WHITE .. text .. RESET end

local classicLinesByKey = {
    guild = { Prefix("左：") .. Action("公会"), Prefix("右：") .. Action("官员") },
    party = { Text("队伍发言") },
    instance = { Text("副本发言") },
    battleground = { Text("战场发言") },
    raid = { Text("团队发言") },
    meeting = { Text("集结号") },
    roll = { Text("ROLL点") },
    macro = { Text("宏面板") },
    loot = { Prefix("左：") .. Action(Adapter.lootLabel or "掉落插件"), Prefix("右：") .. Action("拾取面板") },
    combat = { Text("打开/关闭战斗日志") },
    goldLedger = { Text("金团表格") },
}

local function Colorize(color, text)
    local r = math.floor((color[1] or 1) * 255 + 0.5)
    local g = math.floor((color[2] or 1) * 255 + 0.5)
    local b = math.floor((color[3] or 1) * 255 + 0.5)
    return string.format("|cff%02x%02x%02x%s|r", r, g, b, text)
end

local retailLinesByKey = {
    world = {
        "左：" .. Colorize(ns.ChatBarData.colors.world, "世界频道发言"),
        "右：" .. Colorize(ns.ChatBarData.colors.world, "加入/退出频道"),
    },
    roll = { "ROLL点" },
    macro = { "打开宏面板" },
    loot = { "打开掉落拾取面板" },
    combat = { "打开/关闭战斗日志" },
    mdt = { "打开MDT" },
    keystone = {
        Prefix("左：") .. Action("BW钥匙面板"),
        Prefix("右：") .. Action("EUI钥匙面板"),
    },
}

local linesByKey = Adapter and Adapter:GetTooltipVariant() == "retail"
    and retailLinesByKey or classicLinesByKey

function Definition:HasButtonTooltip(key)
    return type(key) == "string" and type(linesByKey[key]) == "table"
end

function Definition:GetButtonTooltipText(key)
    local lines = linesByKey[key]
    if type(lines) ~= "table" or #lines == 0 then return nil end
    return table.concat(lines, "\n")
end

function Definition:ShowButtonTooltip(owner, key)
    local text = self:GetButtonTooltipText(key)
    return text and self.adapter:ShowTooltip(owner, text) or false
end

function Definition:HideButtonTooltip()
    return self.adapter:HideTooltip()
end

ns.ChatBarTooltip = {
    linesByKey = linesByKey,
    classicLinesByKey = classicLinesByKey,
    retailLinesByKey = retailLinesByKey,
}

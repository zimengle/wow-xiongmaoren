local _, ns = ...

local Adapter = ns.AutoMarkAdapter
if type(Adapter) ~= "table" then
    error("RurutiaSuite AutoMark build adapter must load before Core.lua", 2)
end

local AVAILABLE = Adapter.available == true
local DEFAULT_ENABLED = AVAILABLE and Adapter.defaultEnabled == true
local UNIT_IDS = { "player", "party1", "party2", "party3", "party4" }
local DEFAULT_TANK_MARKS = { 2, 6, 3 }
local DEFAULT_HEAL_MARKS = { 1, 5, 4 }
local MARK_NAMES = {
    "星星",
    "大饼",
    "菱形",
    "三角",
    "月亮",
    "方块",
    "叉叉",
    "骷髅",
}
local RAID_ICON_BASE = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_"
local PREFIX = "|cff00ff00[RAM]|r "

local Definition = {
    databaseName = "AutoMark",
    defaultEnabled = DEFAULT_ENABLED,
    defaults = {
        profile = {
            enabled = DEFAULT_ENABLED,
            leaderOnly = false,
            logLevel = 1,
            updateDelay = 0.2,
            tankMarks = { 2, 6, 3 },
            healMarks = { 1, 5, 4 },
        },
    },
}

local function Wipe(values)
    local key = next(values)
    while key ~= nil do
        values[key] = nil
        key = next(values)
    end
end

local function IsValidMark(value)
    value = tonumber(value)
    return value ~= nil and value >= 1 and value <= 8
end

local function NormalizeMarkList(values, defaults)
    if type(values) ~= "table" then
        values = {}
    end
    local index
    for index = 1, #defaults do
        if not IsValidMark(values[index]) then
            values[index] = defaults[index]
        else
            values[index] = tonumber(values[index])
        end
    end
    return values
end

local function NormalizeProfile(profile)
    if not AVAILABLE then
        profile.enabled = false
    elseif profile.enabled == nil then
        profile.enabled = DEFAULT_ENABLED
    else
        profile.enabled = profile.enabled and true or false
    end
    profile.leaderOnly = profile.leaderOnly and true or false
    profile.logLevel = tonumber(profile.logLevel) == 2 and 2 or 1
    profile.updateDelay = tonumber(profile.updateDelay) or 0.2
    if profile.updateDelay < 0 then
        profile.updateDelay = 0.2
    end
    profile.tankMarks = NormalizeMarkList(profile.tankMarks, DEFAULT_TANK_MARKS)
    profile.healMarks = NormalizeMarkList(profile.healMarks, DEFAULT_HEAL_MARKS)
end

local function SyncRootModuleSetting(module)
    if not ns.Assembly then return end
    if not AVAILABLE and type(ns.Assembly.SetModuleConfigured) == "function" then
        ns.Assembly:SetModuleConfigured("AutoMark", false)
    elseif type(ns.Assembly.SyncModuleConfigured) == "function" then
        ns.Assembly:SyncModuleConfigured("AutoMark", module.db.profile.enabled and true or false)
    end
end

local function Print(message)
    if type(_G.print) == "function" then
        _G.print(PREFIX .. tostring(message))
    end
end

local function PrintUnsupported()
    Print("当前客户端不支持自动标记。")
end

local function GetMarkIconTexture(index)
    return "|T" .. RAID_ICON_BASE .. index .. ":0|t"
end

local function GetColoredName(unit)
    local name = type(_G.UnitName) == "function" and _G.UnitName(unit) or nil
    if not name then return "Unknown" end
    local class
    if type(_G.UnitClass) == "function" then
        _, class = _G.UnitClass(unit)
    end
    local color = class and _G.RAID_CLASS_COLORS and _G.RAID_CLASS_COLORS[class]
    if color then
        return string.format(
            "|cff%02x%02x%02x%s|r",
            color.r * 255,
            color.g * 255,
            color.b * 255,
            name
        )
    end
    return name
end

local function ApplyRoleMarks(units, marks, logs, shouldLog)
    local changes = 0
    local index
    for index = 1, #units do
        local unit = units[index]
        local mark = marks[index]
        if mark and Adapter.GetRaidTargetIndex(unit) ~= mark then
            local success = Adapter.SetRaidTarget(unit, mark)
            if success then
                if shouldLog then
                    logs[#logs + 1] = GetColoredName(unit) .. "为" .. GetMarkIconTexture(mark)
                end
                changes = changes + 1
            end
        end
    end
    return changes
end

local function IsInFivePlayerGroup()
    if type(_G.IsInGroup) ~= "function" or not _G.IsInGroup() then
        return false
    end
    return type(_G.IsInRaid) ~= "function" or not _G.IsInRaid()
end

local function HasPermission(ignorePermission, leaderOnly)
    if ignorePermission or not leaderOnly then
        return true
    end
    local leader = type(_G.UnitIsGroupLeader) == "function"
        and _G.UnitIsGroupLeader("player")
    local assistant = type(_G.UnitIsGroupAssistant) == "function"
        and _G.UnitIsGroupAssistant("player")
    return leader or assistant or false
end

local function RegisterSlashCommands(module)
    if type(_G.SlashCmdList) ~= "table" then return end
    _G.SlashCmdList.RURUTIASUITE_AUTOMARK = function(message)
        module:OnChatCommand(message)
    end
    _G.SlashCmdList.RURUTIASUITE_AUTOMARK_CLEAR = function(message)
        module:OnChatCommandClear(message)
    end
    _G.SLASH_RURUTIASUITE_AUTOMARK1 = "/ram"
    _G.SLASH_RURUTIASUITE_AUTOMARK_CLEAR1 = "/ramc"
end

local function NextDifferentMark(startValue, blockedValue)
    local offset
    for offset = 0, 7 do
        local value = ((startValue + offset - 1) % 8) + 1
        if value ~= blockedValue then
            return value
        end
    end
    return startValue
end

local function OnRosterEvent(module)
    module:RequestUpdate()
end

local function RefreshMarkRoles(module)
    module.updateTimer = nil
    module:MarkRoles(false, false)
end

local function RegisterPage(module)
    local system = ns.UISystem
    if not AVAILABLE or type(system) ~= "table" or type(system.RegisterPage) ~= "function" then
        return false
    end

    local function RefreshPage(context)
        local controls = context.controls
        local profile = module.db.profile
        if not controls then return false end
        controls.leaderOnly:SetValue(profile.leaderOnly, true)
        controls.log:SetValue(profile.logLevel == 2, true)
        controls.tank:SetValue(profile.tankMarks[1], true)
        controls.heal:SetValue(profile.healMarks[1], true)
        return true
    end

    return system:RegisterPage("autoMark", {
        title = "自动标记",
        description = "自动识别团队职责并按规则分配目标标记。",
        group = "qol",
        navigationOrder = 40,
        searchKeywords = { "顶部组件", "怀旧服", "自动标记", "队长", "助理" },
        navigationSwitch = {
            GetState = function(out)
                local available = module:IsAvailable()
                out.available = available
                out.enabled = module.db.profile.enabled == true
                out.mutable = available
                out.active = module:IsEnabled()
                out.pending = false
                out.reason = available and nil or "当前客户端不支持自动标记。"
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                module:SetEnabled(desired)
                return module.db.profile.enabled == desired
            end,
        },
        build = function(context)
            local profile = module.db.profile
            local page, reason = ns.UI:CreateSettingsPage(context, { id = "autoMark" })
            if not page then
                error("Unable to create AutoMark settings page: " .. tostring(reason), 2)
            end
            local general = assert(page:Section("基本设置"))
            local generalRow = assert(general:QuadRow())
            generalRow:Checkbox("leaderOnly", {
                text = "仅队长或助理",
                tooltip = "只有你是队长或团队助理时才执行自动标记。",
                value = profile.leaderOnly,
                onChange = function(_, value)
                    module:SetLeaderOnly(value)
                end,
            })
            generalRow:Checkbox("log", {
                text = "提示信息",
                tooltip = "在聊天框输出自动标记的状态与操作提示。",
                value = profile.logLevel == 2,
                onChange = function(_, value)
                    module:SetLogLevel(value and 2 or 1)
                end,
            })

            local marks = assert(page:Section("标记顺序"))
            local markOptions = module:GetMarkOptions()
            local markOrder = {}
            local markIndex
            for markIndex = 1, #MARK_NAMES do
                markOrder[#markOrder + 1] = markIndex
            end
            local markRow = assert(marks:FieldRow())
            markRow:Dropdown("tank", {
                text = "坦克首选",
                tooltip = "选择坦克职责优先使用的团队标记；不能与治疗首选相同。",
                value = profile.tankMarks[1],
                options = markOptions,
                order = markOrder,
                onChange = function(control, value)
                    value = tonumber(value)
                    if value == profile.healMarks[1] or not module:SetTankMark(1, value) then
                        control:SetValue(profile.tankMarks[1], true)
                        return
                    end
                    module:SetTankMark(2, NextDifferentMark(value + 1, profile.healMarks[1]))
                end,
            })
            markRow:Dropdown("heal", {
                text = "治疗首选",
                tooltip = "选择治疗职责优先使用的团队标记；不能与坦克首选相同。",
                value = profile.healMarks[1],
                options = markOptions,
                order = markOrder,
                onChange = function(control, value)
                    value = tonumber(value)
                    if value == profile.tankMarks[1] or not module:SetHealMark(1, value) then
                        control:SetValue(profile.healMarks[1], true)
                        return
                    end
                    module:SetHealMark(2, NextDifferentMark(value + 1, profile.tankMarks[1]))
                end,
            })

            local actions = assert(page:Section("操作"))
            actions:ActionRow({
                columns = 4,
                buttons = {
                    {
                        key = "markNow",
                        text = "立刻标记",
                        onAction = function() module:MarkRoles(true, true) end,
                    },
                    {
                        key = "clear",
                        text = "清除标记",
                        onAction = function() module:ClearAllMarks(true) end,
                    },
                },
            })
            page:Finish()
            context.settingsPage = page
            context.controls = page.controls
            return page:GetRoot()
        end,
        onShow = RefreshPage,
        onRefresh = RefreshPage,
    })
end

function Definition:Initialize()
    NormalizeProfile(self.db.profile)
    self.data.tanks = self.data.tanks or {}
    self.data.heals = self.data.heals or {}
    self.data.logs = self.data.logs or {}
    self.data.managed = self.data.managed or {}
    SyncRootModuleSetting(self)
    RegisterSlashCommands(self)
    RegisterPage(self)
end

function Definition:ProfileChanged()
    NormalizeProfile(self.db.profile)
    SyncRootModuleSetting(self)
end

function Definition:Enable()
    if not AVAILABLE or not self.db.profile.enabled then
        return
    end
    self:RegisterEvent("GROUP_ROSTER_UPDATE", OnRosterEvent)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", OnRosterEvent)
end

function Definition:Disable()
    self.updateTimer = nil
end

function Definition:IsAvailable()
    return AVAILABLE
end

function Definition:GetRole(unit)
    if not AVAILABLE or type(_G.UnitGroupRolesAssigned) ~= "function" then
        return "NONE"
    end
    return _G.UnitGroupRolesAssigned(unit)
end

function Definition:OnChatCommand()
    if not AVAILABLE then
        PrintUnsupported()
        return false
    end
    self:MarkRoles(true, true)
    return true
end

function Definition:OnChatCommandClear()
    if not AVAILABLE then
        PrintUnsupported()
        return false
    end
    self:ClearAllMarks(true)
    return true
end

function Definition:MarkRoles(forceLog, ignorePermission)
    self.updateTimer = nil
    if not AVAILABLE then return 0 end
    local profile = self.db.profile
    if not profile.enabled or not IsInFivePlayerGroup()
        or not HasPermission(ignorePermission, profile.leaderOnly) then
        return 0
    end

    local tanks = self.data.tanks
    local heals = self.data.heals
    local logs = self.data.logs
    local managed = self.data.managed
    Wipe(tanks)
    Wipe(heals)
    Wipe(logs)

    local index
    local unit
    for index = 1, #UNIT_IDS do
        unit = UNIT_IDS[index]
        if type(_G.UnitExists) == "function" and _G.UnitExists(unit) then
            local role = self:GetRole(unit)
            if role == "TANK" then
                tanks[#tanks + 1] = unit
            elseif role == "HEALER" then
                heals[#heals + 1] = unit
            end
        end
    end
    self:RecordScan()

    local shouldLog = profile.logLevel >= 2
    local changes = ApplyRoleMarks(tanks, profile.tankMarks, logs, shouldLog)
        + ApplyRoleMarks(heals, profile.healMarks, logs, shouldLog)

    Wipe(managed)
    for index = 1, #profile.tankMarks do
        managed[profile.tankMarks[index]] = "TANK"
    end
    for index = 1, #profile.healMarks do
        managed[profile.healMarks[index]] = "HEALER"
    end

    for index = 1, #UNIT_IDS do
        unit = UNIT_IDS[index]
        if type(_G.UnitExists) == "function" and _G.UnitExists(unit) then
            local currentMark = Adapter.GetRaidTargetIndex(unit)
            if currentMark and managed[currentMark] then
                local role = self:GetRole(unit)
                local marks = role == "TANK" and profile.tankMarks
                    or role == "HEALER" and profile.healMarks or nil
                local keep = false
                if marks then
                    local markIndex
                    for markIndex = 1, #marks do
                        if currentMark == marks[markIndex] then
                            keep = true
                            break
                        end
                    end
                end
                if not keep then
                    local success = Adapter.SetRaidTarget(unit, 0)
                    if success then
                        if shouldLog then
                            logs[#logs + 1] = GetColoredName(unit) .. "清除标记"
                        end
                        changes = changes + 1
                    end
                end
            end
        end
    end

    if shouldLog then
        if changes > 0 and #logs > 0 then
            Print("标记：" .. table.concat(logs, "，"))
        elseif forceLog then
            Print("无可用变更")
        end
    end
    return changes
end

function Definition:ClearAllMarks(ignorePermission)
    if not AVAILABLE or not IsInFivePlayerGroup()
        or not HasPermission(ignorePermission, self.db.profile.leaderOnly) then
        return 0
    end
    local cleared = 0
    local index
    for index = 1, #UNIT_IDS do
        local unit = UNIT_IDS[index]
        if type(_G.UnitExists) == "function" and _G.UnitExists(unit) then
            local success = Adapter.SetRaidTarget(unit, 0)
            if success then
                cleared = cleared + 1
            end
        end
    end
    return cleared
end

function Definition:RequestUpdate()
    if not AVAILABLE or not self:IsEnabled() or not self.db.profile.enabled then
        return nil
    end
    local delay = tonumber(self.db.profile.updateDelay) or 0.2
    local handle = self:RequestRefresh("mark-roles", RefreshMarkRoles, delay)
    self.updateTimer = handle
    return handle
end

function Definition:SetEnabled(value)
    value = AVAILABLE and value and true or false
    self.db.profile.enabled = value
    if ns.Assembly and type(ns.Assembly.SetModuleEnabled) == "function" then
        ns.Assembly:SetModuleEnabled("AutoMark", value)
    end
    return value
end

Definition.Toggle = Definition.SetEnabled

function Definition:SetLeaderOnly(value)
    if not AVAILABLE then return false end
    self.db.profile.leaderOnly = value and true or false
    self:RequestUpdate()
    return true
end

function Definition:SetUpdateDelay(value)
    if not AVAILABLE then return false end
    value = tonumber(value)
    if not value or value < 0 then return false end
    self.db.profile.updateDelay = value
    return true
end

function Definition:SetLogLevel(value)
    if not AVAILABLE then return false end
    self.db.profile.logLevel = tonumber(value) == 2 and 2 or 1
    return true
end

function Definition:SetTankMark(index, value)
    if not AVAILABLE or not IsValidMark(value) then return false end
    self.db.profile.tankMarks[index] = tonumber(value)
    self:RequestUpdate()
    return true
end

function Definition:SetHealMark(index, value)
    if not AVAILABLE or not IsValidMark(value) then return false end
    self.db.profile.healMarks[index] = tonumber(value)
    self:RequestUpdate()
    return true
end

function Definition:GetMarkOptions()
    local options = {}
    local index
    for index = 1, #MARK_NAMES do
        options[index] = "|T" .. RAID_ICON_BASE .. index .. ":16|t " .. MARK_NAMES[index]
    end
    return options
end

ns.RegisterModule("AutoMark", Definition)

local _, ns = ...

if ns.Build and ns.Build.HasModule and not ns.Build.HasModule("RoleMarker") then return end

local Definition = {
    defaults = {
        profile = {
            enabled = true,
            tankMark = 2,
            healerMark = 1,
        },
    },
}

local Settings = { pageId = "role-marker", registered = false }

local RAID_ICON_BASE = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_"
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

local function GetSafeNumber(value, fallback)
    value = tonumber(value)
    if value == nil then return fallback end
    return value
end

local function IsValidMark(value)
    value = tonumber(value)
    return value ~= nil and value >= 1 and value <= 8
end

local function IsSupportedFivePlayerInstance()
    if type(_G.IsInInstance) ~= "function" then return false end
    local inInstance, instanceType = _G.IsInInstance()
    return inInstance and instanceType == "party"
end

local function NormalizeMarks(profile)
    if profile.enabled == nil then profile.enabled = true end
    profile.leaderOnly = nil
    if not IsValidMark(profile.tankMark) then profile.tankMark = 2 end
    if not IsValidMark(profile.healerMark) then profile.healerMark = 1 end
    if tonumber(profile.tankMark) == tonumber(profile.healerMark) then
        profile.tankMark = 2
        profile.healerMark = 1
    end
end

function Definition:IsFeatureActive()
    local profile = self.db and self.db.profile
    if not (profile and profile.enabled) then return false end
    return IsSupportedFivePlayerInstance()
end

function Definition:GetTankMark()
    local profile = self.db and self.db.profile
    return GetSafeNumber(profile and profile.tankMark, 2)
end

function Definition:GetHealerMark()
    local profile = self.db and self.db.profile
    return GetSafeNumber(profile and profile.healerMark, 1)
end

function Definition:GetMarkOptions(excludeMark)
    excludeMark = tonumber(excludeMark)
    local list = {}
    local order = {}
    local mark
    local name
    for mark, name in ipairs(MARK_NAMES) do
        if mark ~= excludeMark then
            list[mark] = "|T" .. RAID_ICON_BASE .. mark .. ":12:12:0:0|t  " .. name
            order[#order + 1] = mark
        end
    end
    return list, order
end

function Definition:UpdateConsumers()
    local topBar = ns.Runtime:GetModule("TopBar")
    if topBar then
        if type(topBar.RequestRoleMarkerButtonUpdate) == "function" then
            topBar:RequestRoleMarkerButtonUpdate()
        elseif type(topBar.UpdateRoleMarkerButton) == "function" then
            topBar:UpdateRoleMarkerButton()
        end
    end
end

function Definition:SetEnabled(value)
    self.db.profile.enabled = value and true or false
    self:UpdateConsumers()
end

function Definition:SetTankMark(value)
    value = GetSafeNumber(value, 2)
    if not IsValidMark(value) or value == self:GetHealerMark() then
        return false
    end
    self.db.profile.tankMark = value
    self:UpdateConsumers()
    return true
end

function Definition:SetHealerMark(value)
    value = GetSafeNumber(value, 1)
    if not IsValidMark(value) or value == self:GetTankMark() then
        return false
    end
    self.db.profile.healerMark = value
    self:UpdateConsumers()
    return true
end

local function RefreshSettingsPage(context, module)
    local page = context and context.roleMarkerSettingsPage
    local profile = module.db and module.db.profile
    if not (page and profile) then return false end

    local tankMark = page:GetControl("tankMark")
    local healerMark = page:GetControl("healerMark")
    if tankMark then tankMark:SetValue(module:GetTankMark(), true) end
    if healerMark then healerMark:SetValue(module:GetHealerMark(), true) end
    return true
end

local function BuildSettingsContents(tab, context, module)
    local markOptions, markOrder = module:GetMarkOptions()
    local marks = tab:Section("标记设置")
    local markRow = marks:FieldRow()
    markRow:Dropdown("tankMark", {
        text = "坦克标记",
        tooltip = "选择左键标记坦克职责时使用的团队标记；不能与治疗标记相同。",
        value = module:GetTankMark(),
        options = markOptions,
        order = markOrder,
        onChange = function(control, value)
            if not module:SetTankMark(value) then
                control:SetValue(module:GetTankMark(), true)
            end
        end,
    })
    markRow:Dropdown("healerMark", {
        text = "治疗标记",
        tooltip = "选择右键标记治疗职责时使用的团队标记；不能与坦克标记相同。",
        value = module:GetHealerMark(),
        options = markOptions,
        order = markOrder,
        onChange = function(control, value)
            if not module:SetHealerMark(value) then
                control:SetValue(module:GetHealerMark(), true)
            end
        end,
    })
    marks:Description("顶部标记中枢会保持显示；单人时按当前专精职责生成标记动作。")
    return true
end

function Settings:BuildPage(context)
    local page, reason = ns.UI:CreateSettingsPage(context, { id = self.pageId })
    if not page then error("Unable to create RoleMarker settings page: " .. tostring(reason), 2) end
    context.roleMarkerSettingsPage = page
    if page:GetControl("tankMark") then
        self:RefreshControls(context)
        page:Refresh("reuse")
        return page
    end
    BuildSettingsContents(page, context, self.module)
    page:Finish()
    return page
end

function Settings:Register(module)
    if self.registered then return true end
    self.module = module
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, {
        title = "职责标记",
        description = "配置顶部标记中枢的坦克与治疗职责标记。",
        group = "top",
        navigationOrder = 50,
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                out.available = module.db ~= nil and module.db.profile ~= nil
                out.enabled = out.available and module.db.profile.enabled == true
                out.mutable = out.available
                out.active = out.enabled
                out.pending = false
                out.reason = nil
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                module:SetEnabled(desired)
                return module.db.profile.enabled == desired
            end,
        },
        searchKeywords = { "职责标记", "快捷标记", "坦克标记", "治疗标记" },
        build = function(context) return Settings:BuildPage(context) end,
        onShow = function(context) Settings:RefreshControls(context) end,
        onRefresh = function(context) Settings:RefreshControls(context) end,
    }) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("rolemarker", self.pageId)
        system:RegisterPageAlias("roleMarker", self.pageId)
    end
    return self.registered
end

function Settings:RefreshControls(context)
    if not self.module then return false end
    return RefreshSettingsPage(context, self.module)
end

function Definition:Initialize()
    NormalizeMarks(self.db.profile)
    Settings:Register(self)
end

ns.RoleMarkerSettings = Settings
ns.RegisterModule("RoleMarker", Definition)

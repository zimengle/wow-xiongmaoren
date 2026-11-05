local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("CombatReminder")) then return end

local Settings = { pageId = "combat", registered = false }
local SettingsBuilder = ns.UI and ns.UI.SettingsBuilder

local function BuildPage(context, module)
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then
        error("Unable to create CombatReminder settings page: " .. tostring(reason), 2)
    end
    context.combatReminderSettingsPage = page
    if page:GetControl("alertEnabled") then
        Settings:Refresh(context, module)
        page:Refresh("reuse")
        return page
    end

    local profile = module:GetProfile()
    local alert = page:Section("进出战斗提醒")
    local alertToggles = alert:QuadRow()
    alertToggles:Checkbox("alertEnabled", {
        text = "启用提醒", value = profile.alert.enabled,
        tooltip = "进出战斗时显示状态提醒。",
        onChange = function(_, value) module:SetAlertEnabled(value) end,
    })
    alertToggles:Popover("alertDetails", {
        attachTo = "alertEnabled",
        title = "提醒显示",
        tooltip = "调整提醒层级、时长、字号与坐标。",
        rows = {
            {
                kind = "dropdown", key = "alertFrameStrata", text = "显示层级",
                options = { LOW = "低", MEDIUM = "中", HIGH = "高（默认）", DIALOG = "对话框", FULLSCREEN = "全屏", FULLSCREEN_DIALOG = "全屏对话框" },
                order = { "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG" },
                getValue = function() return module:GetProfile().alert.frameStrata end,
                onChange = function(_, value) module:SetAlertFrameStrata(value) end,
            },
            {
                kind = "slider", key = "alertDuration", text = "提醒时长",
                min = 0.5, max = 10, step = 0.1,
                getValue = function() return module:GetProfile().alert.duration end,
                onChange = function(_, value) module:SetAlertDuration(value) end,
            },
            {
                kind = "slider", key = "alertFontSize", text = "提醒字号",
                min = 10, max = 60, step = 1,
                getValue = function() return module:GetProfile().alert.fontSize end,
                onChange = function(_, value) module:SetAlertFontSize(value) end,
            },
            {
                kind = "slider", key = "alertX", text = "提醒 X 坐标",
                min = -1000, max = 1000, step = 1,
                getValue = function() return module:GetProfile().alert.x end,
                onChange = function(_, value) module:SetAlertX(value) end,
            },
            {
                kind = "slider", key = "alertY", text = "提醒 Y 坐标",
                min = -1000, max = 1000, step = 1,
                getValue = function() return module:GetProfile().alert.y end,
                onChange = function(_, value) module:SetAlertY(value) end,
            },
        },
    })

    local timer = page:Section("战斗时间显示")
    local timerToggles = timer:QuadRow()
    timerToggles:Checkbox("timerEnabled", {
        text = "启用计时", value = profile.timer.enabled,
        tooltip = "显示本次战斗的持续时间。",
        onChange = function(_, value) module:SetTimerEnabled(value) end,
    })
    timerToggles:Checkbox("onlyInCombat", {
        text = "仅战斗中显示", value = profile.timer.onlyInCombat,
        tooltip = "只在战斗中显示计时，脱战后自动隐藏。",
        onChange = function(_, value) module:SetOnlyInCombat(value) end,
    })
    timerToggles:Popover("timerDetails", {
        attachTo = "timerEnabled",
        title = "计时显示",
        tooltip = "调整战斗计时的层级、字号与坐标。",
        rows = {
            {
                kind = "dropdown", key = "timerFrameStrata", text = "显示层级",
                options = { LOW = "低", MEDIUM = "中", HIGH = "高（默认）", DIALOG = "对话框", FULLSCREEN = "全屏", FULLSCREEN_DIALOG = "全屏对话框" },
                order = { "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG" },
                getValue = function() return module:GetProfile().timer.frameStrata end,
                onChange = function(_, value) module:SetTimerFrameStrata(value) end,
            },
            {
                kind = "slider", key = "timerFontSize", text = "计时字号",
                min = 10, max = 60, step = 1,
                getValue = function() return module:GetProfile().timer.fontSize end,
                onChange = function(_, value) module:SetTimerFontSize(value) end,
            },
            {
                kind = "slider", key = "timerX", text = "计时 X 坐标",
                min = -1000, max = 1000, step = 1,
                getValue = function() return module:GetProfile().timer.x end,
                onChange = function(_, value) module:SetTimerX(value) end,
            },
            {
                kind = "slider", key = "timerY", text = "计时 Y 坐标",
                min = -1000, max = 1000, step = 1,
                getValue = function() return module:GetProfile().timer.y end,
                onChange = function(_, value) module:SetTimerY(value) end,
            },
        },
    })

    local actions = page:FooterActions({ columns = 3 })
    actions:Button("preview", { action = "preview",
        text = "预览模式",
        getText = function() return module.previewMode and "取消预览" or "预览模式" end,
        onAction = function(control)
            module:SetPreview(not module.previewMode)
            control:SetText(module.previewMode and "取消预览" or "预览模式")
        end,
        onDeactivate = function() module:SetPreview(false) end,
    })
    actions:Button("reset", { action = "resetPosition",
        text = "重置位置", onAction = function() module:ResetPositions() end,
    })
    actions:Button("defaults", { action = "restoreDefaults",
        text = "恢复默认",
        tooltip = "恢复战斗提醒与计时的全部默认设置，不影响其他模块。",
        onAction = function()
            page:ShowTextDialog({
                title = "恢复战斗提醒与计时默认设置",
                confirmLabel = "恢复默认",
                description = "将恢复整个战斗提醒与计时模块的默认设置，不影响其他模块。",
                value = "显示开关、外观和位置等设置均会重置。",
                onConfirm = function()
                    if module:ResetDefaults() == false then
                        return false, "当前无法恢复默认，请脱离战斗后重试。"
                    end
                    Settings:Refresh(context, module)
                    return true
                end,
            })
            if page.textDialog then page.textDialog.close:SetText("取消") end
        end,
    })
    page:Finish()
    return page
end

function Settings:Refresh(context, module)
    local page = context and context.combatReminderSettingsPage
    if not page then return false end
    local profile = module:GetProfile()
    page:GetControl("alertEnabled"):SetValue(profile.alert.enabled, true)
    page:GetControl("timerEnabled"):SetValue(profile.timer.enabled, true)
    page:GetControl("onlyInCombat"):SetValue(profile.timer.onlyInCombat, true)
    local alertPopover = page:GetPopover("alertDetails")
    local timerPopover = page:GetPopover("timerDetails")
    if alertPopover then alertPopover:Refresh() end
    if timerPopover then timerPopover:Refresh() end
    return true
end

function Settings:Register(module)
    if self.registered then return true end
    local definition = {
        title = "战斗提醒",
        description = "配置进出战斗提醒、战斗计时与显示位置。",
        group = "qol",
        navigationOrder = 20,
        searchKeywords = { "体验优化", "进战", "脱战", "计时", "战斗时间", "提醒" },
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                out.available = true
                out.enabled = ns.Assembly:IsModuleEnabled("CombatReminder")
                out.mutable = true
                out.active = module:IsEnabled()
                out.pending = false
                out.reason = nil
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                local ok, reason = ns.Assembly:SetModuleEnabled("CombatReminder", desired)
                if ok == false then return false, reason end
                return ns.Assembly:IsModuleEnabled("CombatReminder") == desired
            end,
        },
        build = function(context) return BuildPage(context, module) end,
        onShow = function(context) return Settings:Refresh(context, module) end,
        onRefresh = function(context) return Settings:Refresh(context, module) end,
        onHide = function() module:SetPreview(false) end,
    }
    ns.CombatReminderPageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("combatReminder", self.pageId)
        system:RegisterPageAlias("combatreminder", self.pageId)
    end
    return self.registered
end

ns.CombatReminderSettings = Settings

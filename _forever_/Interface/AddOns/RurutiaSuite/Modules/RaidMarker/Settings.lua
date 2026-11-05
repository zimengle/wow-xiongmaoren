local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("RaidMarker")) then return end

local Settings = { registered = false }

local function ApplySetting(module, control, key, value)
    local profile = module:GetProfile()
    local previous = profile and profile[key]
    local changed = module:SetSetting(key, value)
    if not changed and control and previous ~= nil then control:SetValue(previous, true) end
    return changed
end

local function BuildPage(context, module)
    local profile = module:GetProfile()
    local policy = module.adapter:GetPolicy()
    local layout = module.raidMarkerData.settingsLayout
    local page, reason = ns.UI:CreateSettingsPage(context, {
        id = layout.pageId,
    })
    if not page then
        error("Unable to create RaidMarker settings page: " .. tostring(reason), 2)
    end
    context.raidMarkerSettingsPage = page
    context.raidMarkerControls = page.controls
    if page:GetPopover("layoutDetails") then
        page:Refresh("reuse")
        return page
    end

    local appearance = page:Section("外观样式"):ActionRow()
    appearance:Popover("layoutDetails", {
        title = "布局与透明度",
        tooltip = "调整标记尺寸、文字字号、按钮间距与目标透明度。",
        button = {
            text = "样式调整",
        },
        rows = {
            {
                kind = "slider", key = "sideButtonFontSize", text = "文字字号",
                min = 10, max = 32, step = 1,
                getValue = function() return module:GetProfile().sideButtonFontSize end,
                onChange = function(control, value)
                    ApplySetting(module, control, "sideButtonFontSize", value)
                end,
            },
            {
                kind = "slider", key = "markerSize", text = "图标尺寸",
                min = 16, max = 48, step = 1,
                getValue = function() return module:GetProfile().markerSize end,
                onChange = function(control, value)
                    ApplySetting(module, control, "markerSize", value)
                end,
            },
            {
                kind = "slider", key = "spacing", text = "图标间距",
                min = 0, max = 10, step = 1,
                getValue = function() return module:GetProfile().spacing end,
                onChange = function(control, value)
                    ApplySetting(module, control, "spacing", value)
                end,
            },
            {
                kind = "slider", key = "sideButtonXOffset", text = "侧边按钮间距",
                min = 0, max = 80, step = 1,
                getValue = function() return module:GetProfile().sideButtonXOffset end,
                onChange = function(control, value)
                    ApplySetting(module, control, "sideButtonXOffset", value)
                end,
            },
            {
                kind = "slider", key = "sideButtonGap", text = "文字按钮间距",
                min = 0, max = 30, step = 1,
                getValue = function() return module:GetProfile().sideButtonGap end,
                onChange = function(control, value)
                    ApplySetting(module, control, "sideButtonGap", value)
                end,
            },
            {
                kind = "slider", key = "alphaWithTarget", text = "有目标时透明度",
                min = 0, max = 1, step = 0.05,
                getValue = function() return module:GetProfile().alphaWithTarget end,
                onChange = function(control, value)
                    ApplySetting(module, control, "alphaWithTarget", value)
                end,
            },
            {
                kind = "slider", key = "alphaNoTarget", text = "无目标时透明度",
                min = 0, max = 1, step = 0.05,
                getValue = function() return module:GetProfile().alphaNoTarget end,
                onChange = function(control, value)
                    ApplySetting(module, control, "alphaNoTarget", value)
                end,
            },
        },
    })
    local behavior = page:Section("行为设置")
    local behaviorRow = behavior:ToggleRow({ columns = 3 })
    behaviorRow:Checkbox("hideWhenSolo", {
        text = "未组队时隐藏", value = profile.hideWhenSolo,
        tooltip = "未加入小队或团队时自动隐藏标记栏；战斗中的队伍变化会在脱战后生效。",
        getValue = function() return module:GetProfile().hideWhenSolo end,
        onChange = function(control, value)
            ApplySetting(module, control, "hideWhenSolo", value)
        end,
    })
    behaviorRow:Checkbox("sideButtonsEnabled", {
        text = "侧边文字按钮", value = profile.sideButtonsEnabled,
        tooltip = "显示清除标记、准备确认等侧边文字按钮。",
        getValue = function() return module:GetProfile().sideButtonsEnabled end,
        onChange = function(control, value)
            ApplySetting(module, control, "sideButtonsEnabled", value)
        end,
    })
    behaviorRow:Checkbox("disableWhenSimilarAddon", {
        text = policy.conflictLabel,
        tooltip = policy.conflictTooltip,
        value = profile.disableWhenSimilarAddon,
        getValue = function() return module:GetProfile().disableWhenSimilarAddon end,
        onChange = function(control, value)
            ApplySetting(module, control, "disableWhenSimilarAddon", value)
        end,
    })
    behaviorRow:Checkbox("hideInPetBattle", {
        text = "宠物对战中隐藏", value = profile.hideInPetBattle,
        tooltip = "进入宠物对战时隐藏团队标记界面。",
        getValue = function() return module:GetProfile().hideInPetBattle end,
        onChange = function(control, value)
            ApplySetting(module, control, "hideInPetBattle", value)
        end,
    })
    if policy.supportsReverseOrder then
        behaviorRow:Checkbox("reverseOrder", {
            text = "反向排序",
            tooltip = "勾选后标记按钮从骷髅开始排列",
            value = profile.reverseOrder,
            getValue = function() return module:GetProfile().reverseOrder end,
            onChange = function(control, value)
                ApplySetting(module, control, "reverseOrder", value)
            end,
        })
    end


    local functions = page:Section("按钮功能")
    functions:Row():Slider("pullCountdown", {
        text = "倒数时间（秒）",
        min = policy.pullMinimum, max = policy.pullMaximum, step = 1,
        value = profile.pullCountdown,
        getValue = function() return module:GetProfile().pullCountdown end,
        onChange = function(control, value)
            ApplySetting(module, control, "pullCountdown", value)
        end,
    })

    page:FooterActions({ columns = 3 })
        :Button("resetPosition", { action = "resetPosition",
            text = "重置位置",
            onAction = function() module:ResetPosition() end,
        })
        :Button("resetDefaults", { action = "restoreDefaults",
            text = "恢复默认",
            tooltip = "恢复团队标记栏的全部默认设置，不影响其他模块。",
            onAction = function()
                page:ShowTextDialog({
                    title = "恢复团队标记栏默认设置",
                    confirmLabel = "恢复默认",
                    description = "将恢复整个团队标记栏模块的默认设置，不影响其他模块。",
                    value = "显示开关、外观和位置等设置均会重置。",
                    onConfirm = function()
                        if module:ResetDefaults() == false then
                            return false, "当前无法恢复默认，请脱离战斗后重试。"
                        end
                        page:Refresh("reset-defaults")
                        return true
                    end,
                })
                if page.textDialog then page.textDialog.close:SetText("取消") end
            end,
        })

    page:Finish()
    return page
end

function Settings:Refresh(context)
    local page = context and context.raidMarkerSettingsPage
    if not page then return false end
    return page:Refresh("module-refresh")
end

function Settings:Register(module)
    if self.registered then return true end
    local data = module.raidMarkerData and module.raidMarkerData.settingsLayout
    if type(data) ~= "table" then return false end
    local definition = {
        title = data.title,
        description = "配置目标标记、世界光柱及团队检查按钮。",
        group = "top",
        navigationOrder = data.navigationOrder,
        searchKeywords = { "顶部组件", "标记栏", "目标标记", "世界光柱", "倒数", "就位", "职责确认" },
        showInNavigation = true,
        visible = function() return module.available end,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                local available = module.available == true
                local inCombat = module.adapter and module.adapter:IsInCombat()
                out.available = available
                out.enabled = profile ~= nil and profile.enabled == true
                out.mutable = available and not inCombat
                out.active = module.runtimeActive == true
                out.pending = module.combatDeferred == true
                out.reason = inCombat and "战斗中不能切换团队标记栏。"
                    or (out.pending and "等待脱战后启用团队标记栏。" or nil)
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                local ok, reason = module:SetFeatureEnabled(desired)
                if ok == false then return false, reason end
                local profile = module:GetProfile()
                return profile ~= nil and profile.enabled == desired
            end,
        },
        themeKeys = {
            "font.*", "color.accent", "color.text.*", "color.control.*", "color.border",
        },
        build = function(context) return BuildPage(context, module) end,
        onShow = function(context) return Settings:Refresh(context) end,
        onRefresh = function(context) return Settings:Refresh(context) end,
        onThemeChanged = function()
            return module.view and module.view:RefreshTheme() or false
        end,
    }
    ns.RaidMarkerPageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(data.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("raidmarker", data.pageId)
    end
    return self.registered
end

ns.RaidMarkerSettings = Settings

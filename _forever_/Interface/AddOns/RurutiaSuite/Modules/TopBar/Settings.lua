local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local Settings = { registered = false }

local BUTTON_LABELS = {
    meetingstone = "集结号按钮",
    handbook = "手册按钮",
    hearthstone = "炉石按钮",
    automark = "标T奶按钮",
}

local function BuildPage(context, module, microOnly)
    local layout = module.topBarData.settingsLayout
    local page, reason = ns.UI:CreateSettingsPage(context, {
        id = microOnly and "micro-menu" or layout.pageId,
    })
    if not page then
        error("Unable to create TopBar settings page: " .. tostring(reason), 2)
    end
    context.topBarSettingsPage = page
    context.topBarControls = page.controls
    if page:GetControl(microOnly and "micromenu.layoutDetails" or "hideInPetBattle") then
        page:Refresh("reuse")
        return page
    end

    local profile = module:GetProfile()
    if not microOnly then
        local general = page:Section("基础设置")
        local generalRow = general:QuadRow()
        generalRow:Checkbox("hideInPetBattle", {
            text = "宠物对战中隐藏",
            tooltip = "进入宠物对战时隐藏 TopBar。",
            value = profile.hideInPetBattle,
            getValue = function() return module:GetProfile().hideInPetBattle end,
            onChange = function(control, value)
                local previous = module:GetProfile().hideInPetBattle
                if not module:SetSetting("hideInPetBattle", value) then
                    control:SetValue(previous, true)
                end
            end,
        })

    end
    if microOnly then
        local micro = page:Section("微型菜单")
        micro:ActionRow():Popover("micromenu.layoutDetails", {
            button = { text = "样式调整" },
            title = "尺寸与间距",
            tooltip = "调整微型菜单图标尺寸与横向间距。",
            rows = {
                {
                    kind = "slider", key = "size", text = "图标尺寸",
                    min = 24, max = 56, step = 1,
                    getValue = function() return module:GetProfile().micromenu.size end,
                    onChange = function(control, value)
                        local previous = module:GetProfile().micromenu.size
                        if not module:SetComponentSetting("micromenu", "size", value) then
                            control:SetValue(previous, true)
                        end
                    end,
                },
                {
                    kind = "slider", key = "spacing", text = "横向间距",
                    min = -20, max = 20, step = 1,
                    getValue = function() return module:GetProfile().micromenu.spacing end,
                    onChange = function(control, value)
                        local previous = module:GetProfile().micromenu.spacing
                        if not module:SetComponentSetting("micromenu", "spacing", value) then
                            control:SetValue(previous, true)
                        end
                    end,
                },
            },
        })
        local movement = micro:QuadRow()
        movement:Checkbox("allowOffscreenDrag", {
            text = "允许拖出屏幕",
            tooltip = "与解锁移动页共用全局设置，影响受移动管理控制的组件。移出屏幕后可用底栏重置位置找回；战斗中修改于脱战后生效。",
            getValue = function() return type(ns.IsOffscreenDragEnabled) == "function" and ns:IsOffscreenDragEnabled() or false end,
            onChange = function(control, value)
                if type(ns.SetAllowOffscreenDrag) == "function" then ns:SetAllowOffscreenDrag(value) end
                control:SetValue(type(ns.IsOffscreenDragEnabled) == "function" and ns:IsOffscreenDragEnabled() or false, true)
            end,
        })
        local microToggles = micro:QuadRow()
        microToggles:Checkbox("micromenu.useClassColor", {
            text = "使用职业色",
            tooltip = "微型菜单按钮文字使用当前角色职业颜色。",
            value = profile.micromenu.useClassColor ~= false,
            getValue = function() return module:GetProfile().micromenu.useClassColor ~= false end,
            onChange = function(control, value)
                local previous = module:GetProfile().micromenu.useClassColor ~= false
                if not module:SetComponentSetting("micromenu", "useClassColor", value) then
                    control:SetValue(previous, true)
                end
            end,
        })
        microToggles:Checkbox("micromenu.disableWhenNDuiMenu", {
            text = "与 NDui 互斥",
            tooltip = "检测到 NDui 微型菜单启用时，隐藏 TopBar 的重复菜单按钮。",
            value = profile.micromenu.disableWhenNDuiMenu ~= false,
            getValue = function() return module:GetProfile().micromenu.disableWhenNDuiMenu ~= false end,
            onChange = function(control, value)
                local previous = module:GetProfile().micromenu.disableWhenNDuiMenu ~= false
                if not module:SetComponentSetting("micromenu", "disableWhenNDuiMenu", value) then
                    control:SetValue(previous, true)
                end
            end,
        })
        if module.adapter.family == "retail" then
            microToggles:Checkbox("micromenu.disableWhenWindToolsGameBar", {
                text = "与 WindTools 互斥",
                tooltip = "检测到 WindTools 游戏条启用时，隐藏 TopBar 的重复菜单按钮。",
                value = profile.micromenu.disableWhenWindToolsGameBar ~= false,
                getValue = function()
                    return module:GetProfile().micromenu.disableWhenWindToolsGameBar ~= false
                end,
                onChange = function(control, value)
                    local previous = module:GetProfile().micromenu.disableWhenWindToolsGameBar ~= false
                    if not module:SetComponentSetting(
                        "micromenu", "disableWhenWindToolsGameBar", value
                    ) then
                        control:SetValue(previous, true)
                    end
                end,
            })
            local microVisibility = micro:QuadRow()
            microVisibility:Checkbox("micromenu.showGroupFinder", {
                text = "显示队伍查找器",
                tooltip = "集合石按钮右键已可打开队伍查找器，因此默认隐藏此图标。",
                value = profile.micromenu.showGroupFinder == true,
                getValue = function() return module:GetProfile().micromenu.showGroupFinder == true end,
                onChange = function(control, value)
                    local previous = module:GetProfile().micromenu.showGroupFinder == true
                    if not module:SetComponentSetting("micromenu", "showGroupFinder", value) then
                        control:SetValue(previous, true)
                    end
                end,
            })
        end
        if module.adapter.SupportsStoreVisibility and module.adapter:SupportsStoreVisibility() then
            micro:QuadRow():Checkbox("micromenu.showStore", {
                text = "显示商城",
                tooltip = "默认隐藏商城，保持左右各六个按钮。开启后右侧增加商城入口。",
                value = profile.micromenu.showStore == true,
                getValue = function() return module:GetProfile().micromenu.showStore == true end,
                onChange = function(control, value)
                    local previous = module:GetProfile().micromenu.showStore == true
                    if not module:SetComponentSetting("micromenu", "showStore", value) then
                        control:SetValue(previous, true)
                    end
                end,
            })
        end
        local owner = ns.BlizzardEnhancements
        if module.adapter.buildId == "classic-infinite" and owner then
            micro:QuadRow():Checkbox("hideMicroMenu", {
                text = "启用时隐藏暴雪菜单",
                tooltip = "关闭微型菜单栏时恢复暴雪菜单；其他插件接管时跟随其设置。",
                getValue = function() return owner:GetBlizzardUIDB().hideMicroMenu end,
                getEnabled = function()
                    return owner:IsEnabled() and module:GetProfile().micromenu.enabled and not module.adapter:IsInCombat()
                end,
                onChange = function(control, value)
                    if not owner:SetBoolean("blizzardUI", "hideMicroMenu", value) then
                        control:SetValue(owner:GetBlizzardUIDB().hideMicroMenu, true)
                    end
                end,
            })
        end
    end
    if not microOnly then
        local keys = module.adapter.family == "retail"
            and { "meetingstone", "hearthstone" }
            or { "meetingstone", "handbook", "hearthstone", "automark" }
        local quickButtons = page:Section("快捷按钮")
        local visibility = quickButtons:ToggleRow({ columns = 3, preserveColumns = true, responsive = false })
        local index
        for index = 1, #keys do
            local componentKey = keys[index]
            local componentProfile = module:GetProfile()[componentKey]
            if componentProfile
                and (componentKey ~= "automark" or module.adapter:SupportsAutoMark()) then
                visibility:Checkbox(componentKey .. ".enabled", {
                    text = BUTTON_LABELS[componentKey],
                    tooltip = "在 TopBar 上显示“" .. BUTTON_LABELS[componentKey] .. "”。",
                    value = componentProfile.enabled,
                    getValue = function()
                        return module:GetProfile()[componentKey].enabled
                    end,
                    onChange = function(control, value)
                        local previous = module:GetProfile()[componentKey].enabled
                        if not module:SetComponentEnabled(componentKey, value) then
                            control:SetValue(previous, true)
                        end
                    end,
                })
                local layoutRows = {
                    {
                        kind = "slider", key = "width", text = "宽度",
                        min = 19, max = 150, step = 1,
                        getValue = function()
                            return module:GetProfile()[componentKey].width
                        end,
                        onChange = function(control, value)
                            local previous = module:GetProfile()[componentKey].width
                            if not module:SetComponentSetting(componentKey, "width", value) then
                                control:SetValue(previous, true)
                            end
                        end,
                    },
                    {
                        kind = "slider", key = "height", text = "高度",
                        min = 19, max = 60, step = 1,
                        getValue = function()
                            return module:GetProfile()[componentKey].height
                        end,
                        onChange = function(control, value)
                            local previous = module:GetProfile()[componentKey].height
                            if not module:SetComponentSetting(componentKey, "height", value) then
                                control:SetValue(previous, true)
                            end
                        end,
                    },
                }
                if componentKey ~= "hearthstone" and componentProfile.fontSize then
                    layoutRows[#layoutRows + 1] = {
                        kind = "slider", key = "fontSize", text = "字号",
                        min = 10, max = 30, step = 1,
                        getValue = function()
                            return module:GetProfile()[componentKey].fontSize
                        end,
                        onChange = function(control, value)
                            local previous = module:GetProfile()[componentKey].fontSize
                            if not module:SetComponentSetting(componentKey, "fontSize", value) then
                                control:SetValue(previous, true)
                            end
                        end,
                    }
                end
                visibility:Popover(componentKey .. ".layoutDetails", {
                    attachTo = componentKey .. ".enabled",
                    title = BUTTON_LABELS[componentKey] .. "尺寸",
                    tooltip = #layoutRows >= 3
                        and ("调整“" .. BUTTON_LABELS[componentKey] .. "”的尺寸与字号。")
                        or ("调整“" .. BUTTON_LABELS[componentKey] .. "”的宽度与高度。"),
                    rows = layoutRows,
                })
            end
        end
        if ns.Build.HasModule("FastFocus") or ns.Build.HasModule("RoleMarker") then
            local roleMarkerVisibility = visibility
            roleMarkerVisibility:Checkbox("rolemarker.enabled", {
                text = "焦点标记按钮",
                tooltip = "独立控制炉石右侧的焦点标记按钮。",
                value = profile.rolemarker.enabled ~= false,
                getValue = function()
                    return module:GetProfile().rolemarker.enabled ~= false
                end,
                onChange = function(control, value)
                    local previous = module:GetProfile().rolemarker.enabled ~= false
                    if not module:SetComponentEnabled("rolemarker", value) then
                        control:SetValue(previous, true)
                    end
                end,
            })
        end

    end
    if not microOnly and module.adapter.family == "retail" then
        local hearth = page:Section("随机炉石")
        local fields = hearth:FieldRow()
        local options, order = module:GetHearthstoneClickOptions()
        for _, row in ipairs(module.topBarData.clickKeys) do
            local key = row.key
            fields:Dropdown("hearthstone.click." .. key, {
                text = row.label,
                tooltip = "选择此按键使用的炉石。随机炉石从已拥有且可用的普通炉石中选择，排除达拉然、要塞炉石和私人钥匙。请脱离战斗后修改。",
                options = options, order = order,
                getValue = function() return module:GetHearthstoneClickValue(key) end,
                onChange = function(control, value)
                    if not module:SetHearthstoneClick(key, value) then
                        control:SetValue(module:GetHearthstoneClickValue(key), true)
                    end
                end,
            })
        end
    end
    local scope = microOnly and "micromenu" or "quick"
    local scopeTitle = microOnly and "微型菜单栏" or "顶部组件"
    page:FooterActions({ columns = 3 })
        :Button("resetPositions", { action = "resetPosition",
            text = "重置位置",
            onAction = function() module:ResetPositions(scope) end,
        })
        :Button("resetDefaults", { action = "restoreDefaults",
            text = "恢复默认",
            tooltip = "仅恢复" .. scopeTitle .. "的默认设置。",
            onAction = function()
                page:ShowTextDialog({
                    title = "恢复" .. scopeTitle .. "默认设置",
                    confirmLabel = "恢复默认",
                    description = "仅恢复" .. scopeTitle .. "，不影响另一个页面及其他模块。",
                    value = "显示开关、外观和位置等设置均会重置。",
                    onConfirm = function()
                        if module:ResetDefaults(scope) == false then
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
    local page = context and context.topBarSettingsPage
    if not page then return false end
    local module = ns.TopBar
    if module and module.adapter.family == "retail" then
        local options, order = module:GetHearthstoneClickOptions()
        for _, row in ipairs(module.topBarData.clickKeys) do
            local control = page:GetControl("hearthstone.click." .. row.key)
            if control then control.options.options, control.options.order = options, order end
        end
    end
    page:Refresh("module-refresh")
    return true
end

function Settings:Register(module)
    if self.registered then return true end
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    local layout = module.topBarData.settingsLayout
    local definition = {
        title = layout.title,
        description = "配置顶部快捷按钮的显示、顺序与交互行为。",
        group = "top",
        navigationOrder = layout.navigationOrder,
        searchKeywords = { "顶部组件", "顶部快捷按钮", "快捷按钮", "TopBar", "微型菜单", "炉石", "随机炉石" },
        showInNavigation = true,
        visible = function() return module.available end,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                local available = module.available == true
                out.available = available
                out.enabled = profile ~= nil and profile.enabled == true
                out.mutable = available
                out.active = module.runtimeActive == true and out.enabled
                out.pending = module.combatDeferred == true
                out.reason = out.pending and "等待脱战后应用 TopBar 状态。" or nil
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                local ok, reason = module:SetEnabled(desired)
                if ok == false then return false, reason end
                if module.combatDeferred then return true, "queued" end
                local profile = module:GetProfile()
                return profile ~= nil and profile.enabled == desired
            end,
        },
        themeKeys = { "font.*", "color.accent", "color.text.*", "color.control.*", "color.border" },
        build = function(context) return BuildPage(context, module) end,
        onShow = function(context) return Settings:Refresh(context) end,
        onRefresh = function(context) return Settings:Refresh(context) end,
        onThemeChanged = function() return module.view and module.view:RefreshTheme() or false end,
    }
    ns.TopBarPageDefinition = definition
    self.registered = system:RegisterPage(layout.pageId, definition) and true or false
    if self.registered then
        self.microRegistered = system:RegisterPage("micro-menu", {
            title = "微型菜单栏",
            description = "",
            group = "top", navigationOrder = 60,
            searchKeywords = { "顶部组件", "微型菜单", "微型菜单栏", "菜单栏", "暴雪菜单", "隐藏暴雪菜单", "原生菜单", "MicroMenu" },
            showInNavigation = true,
            visible = function() return module.available end,
            navigationSwitch = {
                GetState = function(out)
                    local profile = module:GetProfile()
                    out.available, out.mutable = module.available == true, module.available == true
                    out.enabled = profile ~= nil and profile.micromenu.enabled == true
                    out.active = module.runtimeActive == true and module:IsComponentVisible("micromenu") == true
                    out.pending = false
                    out.reason = nil
                    return out
                end,
                SetEnabled = function(value) return module:SetComponentEnabled("micromenu", value == true) end,
            },
            build = function(context) return BuildPage(context, module, true) end,
            onShow = function(context) return Settings:Refresh(context) end,
            onRefresh = function(context) return Settings:Refresh(context) end,
            onThemeChanged = definition.onThemeChanged,
            themeKeys = definition.themeKeys,
        }) and true or false
    end
    if self.registered and module.adapter.family == "retail"
        and type(system.RegisterPageAlias) == "function" then
        self.retailAliasRegistered = system:RegisterPageAlias("topbar", layout.pageId) and true or false
    end
    return self.registered
end

ns.TopBarSettings = Settings

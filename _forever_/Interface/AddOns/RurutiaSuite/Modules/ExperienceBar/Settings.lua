local _, ns = ...

local Settings = {
    pageId = "experience-bar",
    registered = false,
}

local function SetBoolean(module, key, value)
    module:GetProfile()[key] = value and true or false
    if key == "showLevelTime" then
        module:RequestPlayedTimeIfNeeded()
    end
    module:UpdateDisplay()
end

local function SetNumber(module, key, value, appearanceOnly)
    module:GetProfile()[key] = tonumber(value) or module:GetProfile()[key]
    module:SanitizeProfile()
    module:ApplyAppearance()
    if not appearanceOnly then
        module:UpdateDisplay()
    end
end

local function SetColor(module, key, value)
    if type(value) ~= "table" then
        return
    end
    local profile = module:GetProfile()
    profile.colors[key] = {
        tonumber(value[1]) or 1,
        tonumber(value[2]) or 1,
        tonumber(value[3]) or 1,
        tonumber(value[4]) or 1,
    }
    module:SanitizeProfile()
    module:ApplyAppearance()
    module:UpdateDisplay()
end

local function BuildPage(context, module, data, features)
    local profile = module:GetProfile()
    local layout = data.layout
    local page, reason = ns.UI:CreateSettingsPage(context, {
        id = Settings.pageId,
    })
    if not page then
        error("Unable to create ExperienceBar settings page: " .. tostring(reason), 2)
    end
    context.experienceBarSettingsPage = page
    context.experienceBarControls = page.controls
    if page:GetPopover("appearanceDetails") then
        page:Refresh("reuse")
        return page
    end

    local general = page:Section("基础设置")
    general:QuadRow():Checkbox("hideNativeExperienceBar", {
        text = "隐藏原生经验条",
        tooltip = "经验条模块启用时隐藏暴雪经验条；关闭模块会恢复。",
        value = profile.hideNativeExperienceBar,
        getValue = function() return module:GetProfile().hideNativeExperienceBar end,
        onChange = function(_, value) SetBoolean(module, "hideNativeExperienceBar", value) end,
    })
    local generalRow = general:ActionRow({ allowMixed = true })
    generalRow:Popover("appearanceDetails", {
        title = "尺寸与外观",
        tooltip = "调整经验条尺寸、文字缩放与透明度。",
        button = { text = "样式调整" },
        rows = {
            {
                kind = "slider", key = "width", text = "宽度",
                min = layout.minWidth, max = layout.maxWidth, step = 1,
                getValue = function() return module:GetProfile().width end,
                onChange = function(_, value) SetNumber(module, "width", value, false) end,
            },
            {
                kind = "slider", key = "height", text = "高度",
                min = layout.minHeight, max = layout.maxHeight, step = 1,
                getValue = function() return module:GetProfile().height end,
                onChange = function(_, value) SetNumber(module, "height", value, false) end,
            },
            {
                kind = "slider", key = "textScale", text = "文字缩放",
                min = layout.minTextScale, max = layout.maxTextScale, step = 0.05,
                getValue = function() return module:GetProfile().textScale end,
                onChange = function(_, value) SetNumber(module, "textScale", value, true) end,
            },
            {
                kind = "slider", key = "alpha", text = "透明度",
                min = 0.2, max = 1, step = 0.05,
                getValue = function() return module:GetProfile().alpha end,
                onChange = function(_, value) SetNumber(module, "alpha", value, true) end,
            },
        },
    })


    local display = page:Section("显示内容")
    local displayRow = display:QuadRow()
    displayRow:Checkbox("showXPPerHour", {
        text = "经验效率",
        tooltip = "显示每小时经验获取速度和预计升级所需时间；经验条可见时每 60 秒刷新。",
        value = profile.showXPPerHour,
        getValue = function() return module:GetProfile().showXPPerHour end,
        onChange = function(_, value) SetBoolean(module, "showXPPerHour", value) end,
    })
    displayRow:Checkbox("showQuestRestedText", {
        text = "经验文字",
        tooltip = features.questXP
            and "显示任务经验与双倍经验的文字统计。"
            or "显示双倍经验的文字统计。",
        value = profile.showQuestRestedText,
        getValue = function() return module:GetProfile().showQuestRestedText end,
        onChange = function(_, value) SetBoolean(module, "showQuestRestedText", value) end,
    })
    if features.questXP and features.incompleteQuestXP ~= false then
        displayRow:Checkbox("showIncompleteQuestOverlay", {
            text = "未完成任务经验",
            tooltip = "在经验条上显示当前未完成任务可提供的经验覆盖层。",
            value = profile.showIncompleteQuestOverlay,
            getValue = function()
                return module:GetProfile().showIncompleteQuestOverlay
            end,
            onChange = function(_, value)
                SetBoolean(module, "showIncompleteQuestOverlay", value)
            end,
        })
    end
    displayRow:Checkbox("showLevelTime", {
        text = "等级用时",
        tooltip = "显示角色在当前等级已经停留的时间；经验条可见时每 60 秒刷新。",
        value = profile.showLevelTime,
        getValue = function() return module:GetProfile().showLevelTime end,
        onChange = function(_, value) SetBoolean(module, "showLevelTime", value) end,
    })
    displayRow:Checkbox("showSessionTime", {
        text = "会话用时",
        tooltip = "显示本次登录会话累计的游戏时间；经验条可见时每 60 秒刷新。",
        value = profile.showSessionTime,
        getValue = function() return module:GetProfile().showSessionTime end,
        onChange = function(_, value) SetBoolean(module, "showSessionTime", value) end,
    })
    displayRow:Checkbox("resetSessionOnReload", {
        text = "重载时重置",
        tooltip = "执行 /reload 后重新开始计算本次会话统计。",
        value = profile.resetSessionOnReload,
        getValue = function() return module:GetProfile().resetSessionOnReload end,
        onChange = function(_, value)
            module:GetProfile().resetSessionOnReload = value and true or false
        end,
    })

    if features.questXP then
        displayRow:Checkbox("trackCompletedQuestXP", {
            text = "任务经验统计",
            tooltip = "统计任务经验并显示覆盖层，关闭后停止任务扫描。",
            value = profile.trackCompletedQuestXP,
            getValue = function() return module:GetProfile().trackCompletedQuestXP end,
            onChange = function(_, value) module:SetQuestTracking(value) end,
        })
    end

    local colors = page:Section("颜色")
    local colorRow = colors:QuadRow()
    colorRow:Color("gradientStart", {
        text = "渐变起始色",
        value = profile.colors.gradientStart,
        getValue = function() return module:GetProfile().colors.gradientStart end,
        onChange = function(_, value) SetColor(module, "gradientStart", value) end,
    })
    colorRow:Color("gradientEnd", {
        text = "渐变结束色",
        value = profile.colors.gradientEnd,
        getValue = function() return module:GetProfile().colors.gradientEnd end,
        onChange = function(_, value) SetColor(module, "gradientEnd", value) end,
    })
    if features.questXP then
        colorRow:Color("completeQuest", {
            text = "已完成任务",
            value = profile.colors.completeQuest,
            getValue = function() return module:GetProfile().colors.completeQuest end,
            onChange = function(_, value) SetColor(module, "completeQuest", value) end,
        })
    end
    if features.questXP and features.incompleteQuestXP ~= false then
        colorRow:Color("incompleteQuest", {
            text = "未完成任务",
            value = profile.colors.incompleteQuest,
            getValue = function() return module:GetProfile().colors.incompleteQuest end,
            onChange = function(_, value) SetColor(module, "incompleteQuest", value) end,
        })
    end
    colorRow:Color("rested", {
        text = "双倍经验",
        value = profile.colors.rested,
        getValue = function() return module:GetProfile().colors.rested end,
        onChange = function(_, value) SetColor(module, "rested", value) end,
    })

    page:FooterActions({ columns = 3 })
        :Button("preview", { action = "preview", onDeactivate = function() if module.previewMode then module:SetPreview(false) end end,
            text = module.previewMode and "取消预览" or "预览模式",
            getText = function()
                return module.previewMode and "取消预览" or "预览模式"
            end,
            onAction = function(control)
                module:SetPreview(not module.previewMode)
                control:SetText(module.previewMode and "取消预览" or "预览模式")
            end,
        })
        :Button("resetPosition", { action = "resetPosition",
            text = "重置位置",
            onAction = function() module:ResetPosition() end,
        })
        :Button("resetDefaults", { action = "restoreDefaults",
            text = "恢复默认",
            tooltip = "恢复经验条的全部默认设置，不影响其他模块。",
            onAction = function()
                page:ShowTextDialog({
                    title = "恢复经验条默认设置",
                    confirmLabel = "恢复默认",
                    description = "将恢复整个经验条模块的默认设置，不影响其他模块。",
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

function Settings:RefreshControls(context)
    local page = context and context.experienceBarSettingsPage
    if not page then return false end
    return page:Refresh("module-refresh")
end

function Settings:Register(module, data, features)
    if self.registered then
        return true
    end

    local definition = {
        title = "经验条",
        description = "配置顶部经验条的显示内容、尺寸与升级信息。",
        group = "top",
        navigationOrder = 20,
        searchKeywords = { "顶部组件", "顶部经验条", "经验条", "经验", "等级", "任务经验", "升级时间" },
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                local available = module.supported == true
                out.available = available
                out.enabled = profile ~= nil and profile.enabled == true
                out.mutable = available
                out.active = module.runtimeActive == true
                out.pending = false
                if not available then
                    out.reason = "当前客户端不支持经验条。"
                elseif module.runtimeState == "max_level" then
                    out.reason = "角色已满级；配置保持启用，经验条暂不运行。"
                elseif module.runtimeState == "xp_disabled" then
                    out.reason = "角色已锁定经验；配置保持启用，经验条暂不运行。"
                else
                    out.reason = nil
                end
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                module:SetEnabled(desired)
                local profile = module:GetProfile()
                return profile ~= nil and profile.enabled == desired
            end,
        },
        build = function(context)
            return BuildPage(context, module, data, features)
        end,
        onShow = function(context)
            Settings:RefreshControls(context)
        end,
        onRefresh = function(context)
            Settings:RefreshControls(context)
        end,
    }
    ns.ExperienceBarPageDefinition = definition

    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then
        return false
    end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("experienceBar", self.pageId)
        system:RegisterPageAlias("experiencebar", self.pageId)
    end
    return self.registered
end

ns.ExperienceBarSettings = Settings

local _, ns = ...

-- FastFocus settings, including the central reminder and unified movement entry.
if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end

local Settings = {
    pageId = "fast-focus",
    registered = false,
}
local SettingsBuilder = ns.UI and ns.UI.SettingsBuilder
local Data = ns.FastFocusData

local function CenterTextActive()
    return ns.CenterTextGroup == nil or ns.CenterTextGroup.active == true
end

local SUPPORT_TEXT = "• |cffFFFFFFNDui|r\n"
    .. "• |cffFFFFFFElvUI|r\n"
    .. "• |cffFFFFFFEllesmereUI|r\n"
    .. "• |cffFFFFFF暴雪原生框架|r\n"
    .. "• |cffFFFFFF首领、竞技场、小队和原生团队框体|r\n"
    .. "• |cffFFFFFF姓名板和模型|r\n"
    .. "• |cffFFFFFFUUF插件|r (Ultimate Unit Frames)\n"
    .. "• |cffFFFFFFSUF插件|r (Shadowed Unit Frames)\n"
    .. "• |cffFFFFFFDF插件|r (DandersFrames)\n"
    .. "• |cffFFFFFFNephUI插件|r"

local function BuildPage(context, module)
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then
        error("Unable to create FastFocus settings page: " .. tostring(reason), 2)
    end
    context.fastFocusSettingsPage = page
    if page:GetControl("allowClearFocus") then
        Settings:RefreshControls(context, module)
        page:Refresh("reuse")
        return page
    end

    -- Shared centre-text handle; the page only claims movement it started.
    local build
    -- Tab switch is a page-leave for the shared movement entry as well.
    local function OnTabChanged(_, key)
        page:ClosePopovers()
        if key ~= "reminder" and build and build.ReleaseMove then build.ReleaseMove() end
    end
    local tabs = page:Tabs("fastFocusTabs", {
        default = "focus", onChange = OnTabChanged,
    })
    local focusTab = tabs:Tab("focus", { title = "焦点设置" })
    local speechTab = tabs:Tab("speech", { title = "焦点发言" })
    local reminderTab = tabs:Tab("reminder", { title = "文字提醒" })
    local helpTab = tabs:Tab("help", { title = "使用说明" })
    local profile = module:GetProfile()
    local general = focusTab:Section("基础设置")
    local toggles = general:QuadRow()
    toggles:Checkbox("allowClearFocus", {
        text = "空白清焦点",
        tooltip = "鼠标未指向单位时，按焦点快捷键清除当前焦点。",
        value = profile.allowClearFocus,
        onChange = function(_, value) module:SetAllowClearFocus(value) end,
    })
    local bindings = focusTab:Section("焦点按键"):ActionRow({ columns = 2 })
    bindings:Button("focusBinding", { text = Data.BindingLabel(Data.GetBinding(profile)),
        getText = function() return Data.BindingLabel(Data.GetBinding(module:GetProfile())) end })
    bindings:Button("setFocusBinding", { text = "设置按键",
        getEnabled = function() return not module.adapter:IsInCombat() end,
        onAction = function()
            page:ShowKeyBindingDialog({ value = Data.GetBinding(module:GetProfile()),
                normalize = Data.NormalizeBinding, format = Data.BindingLabel,
                onConfirm = function(value)
                    local ok, reason = module:SetBinding(value)
                    if ok then page:Refresh("binding") end
                    return ok, reason
                end })
        end })

    local markers = focusTab:Section("焦点标记")
    local markerToggles = markers:QuadRow()
    markerToggles:Checkbox("markEnabled", {
        text = "自动标记焦点",
        tooltip = "设置焦点后应用所选团队标记。默认关闭。",
        value = profile.markEnabled,
        onChange = function(_, value) module:SetMarkerEnabled(value) end,
    })
    markerToggles:Checkbox("overwriteExistingMark", {
        text = "覆盖已有标记",
        tooltip = "开启后会把焦点现有标记替换成所选标记；关闭时保留已有标记。",
        value = profile.overwriteExistingMark,
        onChange = function(_, value) module:SetOverwriteExistingMarkEnabled(value) end,
    })
    markerToggles:Checkbox("disableMarkInRaid", {
        text = "团本中禁用标记",
        tooltip = "默认开启。团本中仍会设置焦点，但不会执行自动标记。",
        value = profile.disableMarkInRaid,
        onChange = function(_, value) module:SetDisableMarkInRaid(value) end,
    })
    local markerFields = markers:FieldRow()
    local markerOptions, markerOrder = {}, {}
    local markerIndex
    for markerIndex = 1, #Data.markerOrder do
        local marker = Data.markerOrder[markerIndex]
        local info = Data.GetMarkerInfo(marker)
        markerOptions[marker] = "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_" .. marker .. ":12:12:0:0|t  " .. info.name
        markerOrder[#markerOrder + 1] = marker
    end
    markerFields:Dropdown("marker", {
        text = "默认标记",
        value = profile.marker,
        options = markerOptions,
        order = markerOrder,
        onChange = function(_, value) module:SetSelectedMarker(value, false) end,
    })

    local speech = speechTab:Section("焦点发言")
    local speechToggles = speech:QuadRow()
    speechToggles:Checkbox("chatEnabled", {
        text = "焦点发言",
        tooltip = "设置焦点后在所选频道发言。正式服默认开启，其他客户端默认关闭。",
        value = profile.chatEnabled,
        onChange = function(_, value) module:SetChatEnabled(value) end,
    })
    speechToggles:Checkbox("useEnglishChat", {
        text = "英文发言",
        tooltip = "使用英文发言内容。默认关闭。",
        value = profile.useEnglishChat,
        onChange = function(_, value) module:SetUseEnglishChat(value) end,
    })
    speechToggles:Checkbox("showFocusName", {
        text = "播报单位名称",
        tooltip = "选中时发言加入焦点名字；关闭时不生成 {focus}，并切换为播报图标。默认开启。",
        value = profile.showFocusName,
        onChange = function(_, value) module:SetFocusNameEnabled(value) end,
    })
    speechToggles:Checkbox("disableChatInRaid", {
        text = "团本中禁用发言",
        tooltip = "默认开启。团本中仍会设置焦点，但不会发送焦点发言。",
        value = profile.disableChatInRaid,
        onChange = function(_, value) module:SetDisableChatInRaid(value) end,
    })
    local speechFields = speech:FieldRow()
    local channelOptions, channelOrder = {}, {}
    for markerIndex = 1, #Data.chatCommandOrder do
        local command = Data.chatCommandOrder[markerIndex]
        channelOptions[command] = Data.chatCommands[command].description
        channelOrder[#channelOrder + 1] = command
    end
    speechFields:Dropdown("chatCommand", {
        text = "发言频道",
        value = profile.chatCommand,
        options = channelOptions,
        order = channelOrder,
        onChange = function(_, value) module:SetChatCommand(value) end,
    })
    speechFields:Dropdown("chatMarkerMode", {
        text = "播报焦点标记",
        value = profile.chatMarkerMode,
        options = { text = "播报文字", icon = "播报图标", none = "不播标记" },
        order = { "text", "icon", "none" },
        onChange = function(_, value) module:SetChatMarkerMode(value) end,
    })
    local templates = speech:DualRow()
    templates:EditBox("chatTemplateCN", {
        text = "中文发言内容",
        value = profile.chatTemplateCN,
        tooltip = "可使用 {mark} 和 {focus}。默认：我打断{mark} {focus}",
        onChange = function(_, value) module:SetChatTemplate("chatTemplateCN", value) end,
    })
    templates:EditBox("chatTemplateEN", {
        text = "英文发言内容",
        value = profile.chatTemplateEN,
        tooltip = "可使用 {mark} 和 {focus}。默认：I kick {mark} {focus}",
        onChange = function(_, value) module:SetChatTemplate("chatTemplateEN", value) end,
    })
    speech:Description("{mark}：所选标记的文字或图标，由“播报焦点标记”决定；选择“不播标记”时留空。\n{focus}：焦点名称，关闭“播报单位名称”时留空。在发言内容中填入这些占位符即可使用。", { fontKey = "pageDescription" })
    speech:ActionRow():Button("restoreSpeech", {
        text = "恢复发言",
        tooltip = "仅恢复中英文默认发言内容，不改变发言开关、频道和标记设置。战斗中不可恢复。",
        getEnabled = function() return not module.adapter:IsInCombat() end,
        onClick = function()
            if module:RestoreChatTemplates() then
                Settings:RefreshControls(context, module)
                page:Refresh("restore-speech")
            end
        end,
    })

    local exclusions = focusTab:Section("排除焦点标记")
    exclusions:Description("勾选后不会在顶部标记中枢提供该标记；至少保留一个可用标记。")
    local excludeRow = exclusions:QuadRow({ columns = 4 })
    for markerIndex = 1, #Data.markerOrder do
        local markerID = Data.markerOrder[markerIndex]
        excludeRow:Checkbox("excludeMarker" .. markerID, {
            text = markerOptions[markerID],
            value = profile.excludedMarkers[markerID] == true,
            onChange = function(_, value) module:SetMarkerExcluded(markerID, value) end,
        })
    end
    helpTab:Section("使用说明"):Description(
        "鼠标指向单位框体、姓名板或模型，按设置的快捷键设为焦点。战斗中不能修改按键。"
    )
    helpTab:Section("支持框体"):Description(SUPPORT_TEXT, { nonSpaceWrap = true })
    local reminders = reminderTab:Section("焦点标记提醒")
    local reminderToggles = reminders:QuadRow()
    reminderToggles:Checkbox("disableCenterReminder", {
        text = "关闭中心文字提醒",
        tooltip = "默认显示。进入普通史诗五人本且未开启焦点标记时，每天提醒一次。",
        value = profile.disableCenterReminder,
        getEnabled = function() return not module.adapter:IsInCombat() end,
        onChange = function(_, value) module:SetDisableCenterReminder(value) end,
    })
    reminderToggles:Checkbox("disableHealerReminder", {
        text = "治疗不提示",
        tooltip = "默认开启。治疗职责不显示自动提醒，恢复萨满除外；不影响手动预览。",
        value = profile.disableHealerReminder,
        getEnabled = function() return not module.adapter:IsInCombat() end,
        onChange = function(_, value) module:SetDisableHealerReminder(value) end,
    })
    local reminderActions = reminders:ActionRow()
    reminderActions:Button("moveReminder", {
        text = "移动提醒",
        tooltip = "解锁后可拖动共享中心文字提醒；修改影响职业提醒、通用文字提醒和本页文字提醒。",
        getEnabled = function() return CenterTextActive() and not module.adapter:IsInCombat() end,
        onClick = function()
            if build and build.moveClaimed and build.ReleaseMove then
                build.ReleaseMove()
                module.isUnlocked = ns.CenterTextGroup.isUnlocked == true
                return false
            end
            if build and build.ClaimMove and build.ClaimMove() then
                module.isUnlocked = ns.CenterTextGroup.isUnlocked == true
                return true
            end
            return module:SetUnlocked(not module.isUnlocked)
        end,
    })
    if ns.CenterTextSettings and type(ns.CenterTextSettings.Build) == "function" then
        build = ns.CenterTextSettings.Build(reminderTab, module.adapter, {
            includeMove = false,
            includeReset = false,
        })
    end
    local footer = page:FooterActions({ columns = 3,
        description = "预览与重置仅针对文字提醒；恢复默认针对本页全部设置（保留启用状态）。",
    })
    footer:Button("previewReminder", { action = "preview", onDeactivate = function() module:HideReminderCallout("page-hidden") end,
        text = "预览提醒",
        tooltip = "显示3秒，不占每日提醒次数；也可输入 /rsfp。",
        onClick = function() return module:PreviewCenterReminder() end,
    })
    footer:Button("resetReminderPosition", { action = "resetPosition",
        text = "重置位置",
        tooltip = "重置所有使用中心文字组的提醒位置，影响职业提醒、通用文字提醒和本页文字提醒。",
        getEnabled = function() return CenterTextActive() and not module.adapter:IsInCombat() end,
        onClick = function() return module:ResetPosition() end,
    })
    footer:Button("restorePage", { action = "restoreDefaults",
        text = "恢复默认",
        tooltip = "恢复快速焦点的按键、标记、发言及提醒设置，不影响职责标记和模块启用状态。战斗中不可恢复。",
        getEnabled = function() return not module.adapter:IsInCombat() end,
        onClick = function()
            page:ClosePopovers()
            page:ShowTextDialog({
                title = "恢复快速焦点设置", confirmLabel = "恢复默认",
                description = "恢复本页的按键、标记、发言和提醒设置。",
                value = "包括提醒位置和提醒开关；不影响模块启用状态与职责标记。",
                onConfirm = function()
                    if not module:RestorePageSettings() then return false end
                    Settings:RefreshControls(context, module)
                    page:Refresh("restore-page")
                    return true
                end,
            })
        end,
    })
    page:Finish()
    return page
end

function Settings:RefreshControls(context, module)
    local page = context and context.fastFocusSettingsPage
    if not page then return false end
    local profile = module:GetProfile()
    local keys = {
        "allowClearFocus", "modifier", "mouseButton", "chatEnabled", "markEnabled",
        "overwriteExistingMark", "chatMarkerMode", "showFocusName",
        "useEnglishChat", "disableChatInRaid", "disableMarkInRaid", "marker", "chatCommand",
        "chatTemplateCN", "chatTemplateEN",
        "disableCenterReminder", "disableHealerReminder",
    }
    local index
    for index = 1, #keys do
        local control = page:GetControl(keys[index])
        if control and type(control.SetValue) == "function" then
            control:SetValue(profile[keys[index]], true)
        end
    end
    local marker
    for marker = 1, 8 do
        local control = page:GetControl("excludeMarker" .. marker)
        if control and type(control.SetValue) == "function" then
            control:SetValue(profile.excludedMarkers[marker] == true, true)
        end
    end
    return true
end

function Settings:Register(module)
    if self.registered then return true end
    local definition = {
        title = "快速焦点",
        description = "配置焦点快捷键、标记与提醒。",
        group = "top",
        navigationOrder = 40,
        searchKeywords = {
            "焦点", "快捷键", "鼠标按键", "Shift", "Ctrl", "Alt",
            "焦点标记", "焦点发言", "发言模板", "恢复发言",
        },
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                local inCombat = module.adapter and module.adapter:IsInCombat()
                local pending = module.pendingDisable == true
                    or (inCombat and (module.pendingSettingsUpdate or module.pendingConflictCleanup))
                out.available = true
                out.enabled = profile ~= nil and profile.enabled == true
                out.mutable = true
                out.active = module.runtimeActive == true
                out.pending = pending and true or false
                out.reason = out.pending and "等待脱战后应用快速焦点状态。" or nil
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                local ok, reason = module:SetEnabled(desired)
                if ok == false then return false, reason end
                local inCombat = module.adapter and module.adapter:IsInCombat()
                if module.pendingDisable
                    or (inCombat and (module.pendingSettingsUpdate or module.pendingConflictCleanup)) then
                    return true, "queued"
                end
                local profile = module:GetProfile()
                return profile ~= nil and profile.enabled == desired
            end,
        },
        build = function(context) return BuildPage(context, module) end,
        onShow = function(context, data)
            Settings:RefreshControls(context, module)
            local page = context and context.fastFocusSettingsPage
            if page then page:Refresh("show", data) end
        end,
        onRefresh = function(context, reason)
            Settings:RefreshControls(context, module)
            local page = context and context.fastFocusSettingsPage
            if page then page:Refresh("refresh", context.data) end
        end,
    }
    ns.FastFocusPageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("fastfocus", self.pageId)
    end
    return self.registered
end

ns.FastFocusSettings = Settings
ns.FastFocusSupportText = SUPPORT_TEXT

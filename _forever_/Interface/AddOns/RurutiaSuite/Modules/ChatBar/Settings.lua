local _, ns = ...

local Settings = { pageId = "chat-bar", registered = false }
local SettingsBuilder = ns.UI and ns.UI.SettingsBuilder

local BUTTON_TOOLTIPS = {
    say = "打开说话频道输入。",
    yell = "打开喊话频道输入。",
    guild = "左键打开公会聊天，右键打开官员聊天。",
    party = "打开队伍聊天。",
    instance = "打开副本聊天。",
    battleground = "打开战场聊天。",
    raid = "打开团队聊天。",
    zong = "打开综合频道。",
    jiao = "打开交易频道。",
    xun = "打开寻求组队频道。",
    world = "左键打开世界频道，右键加入或退出世界频道。",
    meeting = "打开集结号。",
    emoji = "打开表情菜单。",
    roll = "执行 /roll。",
    macro = "打开宏面板。",
    loot = "打开掉落与拾取面板。",
    goldLedger = "打开金团表格：依次尝试 BGLite、BGNext、旧版 BiaoGe、诗逸版、BiaoGeX。",
    mdt = "打开 Mythic Dungeon Tools。",
    keystone = "打开 BigWigs 钥石面板。",
    combat = "开启或关闭战斗日志记录。",
    preset = "打开 RS 快捷菜单。",
}

local function BuildPage(context, module, data)
    module:SanitizeProfile()
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then
        error("Unable to create ChatBar settings page: " .. tostring(reason), 2)
    end
    context.chatBarSettingsPage = page
    if page:GetPopover("appearanceDetails") then
        Settings:RefreshControls(context, module, data)
        page:Refresh("reuse")
        return page
    end

    local profile = module:GetProfile()
    local general = page:Section("基础设置")
    local toggles = general:ActionRow()
    toggles:Popover("appearanceDetails", {
        title = "外观与间距",
        tooltip = "调整聊天条字号与按钮间距。",
        button = { text = "样式调整" },
        rows = {
            {
                kind = "slider", key = "fontSize", text = "字号",
                min = data.layout.fontMin, max = data.layout.fontMax, step = 1,
                getValue = function()
                    return module.GetSafeNumber(module:GetProfile().fontSize, 18)
                end,
                onChange = function(_, value)
                    module:GetProfile().fontSize = module.GetSafeNumber(value, 18)
                    module:UpdateLayout()
                end,
            },
            {
                kind = "slider", key = "spacing", text = "间距",
                min = data.layout.spacingMin, max = data.layout.spacingMax, step = 1,
                getValue = function()
                    return module.GetSafeNumber(module:GetProfile().spacing, -2)
                end,
                onChange = function(_, value)
                    module:GetProfile().spacing = module.GetSafeNumber(value, -2)
                    module:UpdateLayout()
                end,
            },
        },
    })

    general:ToggleRow({ columns = 1 }):Checkbox("copyChat", {
        text = "复制聊天",
        tooltip = "在聊天框右下角显示白色复制图标，平时30%不透明度，悬停100%。\n点击打开当前聊天标签的已有记录，选中内容后按Ctrl+C复制。",
        value = profile.copyChatEnabled == true,
        onChange = function(_, value) module:SetChatCopyEnabled(value) end,
    })

    local buttons = page:Section("显示按钮")
    local order = module:GetSettingsButtonOrder()
    local row = buttons:ToggleRow({ toggleColumns = 8 })
    local index
    for index = 1, #order do
        local info = module:GetButtonInfo(order[index])
        local key = "button_" .. info.key
        local buttonKey = info.key
        row:Checkbox(key, {
            text = info.text,
            tooltip = BUTTON_TOOLTIPS[buttonKey] or "控制该聊天条按钮是否显示。",
            value = module:IsButtonEnabled(buttonKey),
            onChange = function(_, value)
                local current = module:GetProfile()
                if type(current.buttonsEnabled) ~= "table" then current.buttonsEnabled = {} end
                current.buttonsEnabled[buttonKey] = value == true
                module:UpdateLayout()
            end,
        })
    end

    local actions = page:FooterActions({ columns = 3 })
    actions:Button("resetPosition", { action = "resetPosition",
        text = "重置位置", onAction = function() module:ResetPosition() end,
    })
    actions:Button("resetDefaults", { action = "restoreDefaults",
        text = "恢复默认",
        tooltip = "恢复聊天条的全部默认设置，不影响其他模块。",
        onAction = function()
            page:ShowTextDialog({
                title = "恢复聊天条默认设置",
                confirmLabel = "恢复默认",
                description = "将恢复整个聊天条模块的默认设置，不影响其他模块。",
                value = "显示开关、外观和位置等设置均会重置。",
                onConfirm = function()
                    if module:ResetDefaults() == false then
                        return false, "当前无法恢复默认，请脱离战斗后重试。"
                    end
                    Settings:RefreshControls(context, module, data)
                    return true
                end,
            })
            if page.textDialog then page.textDialog.close:SetText("取消") end
        end,
    })

    if module:SupportsTabChannelSwitch() then
        local input = page:Section("输入设置"):ToggleRow({ columns = 1 })
        input:Checkbox("tabChannelSwitch", {
            text = "Tab切换频道",
            tooltip = "聊天输入时按Tab在当前可用频道间切换，Shift+Tab反向切换。\n密语、社区频道和斜杠命令保留暴雪原生Tab功能。",
            value = profile.tabChannelSwitchEnabled == true,
            onChange = function(control, value)
                local ok = module:SetTabChannelSwitchEnabled(value)
                if not ok then
                    control:SetValue(module:GetProfile().tabChannelSwitchEnabled == true, true)
                end
            end,
        })
    end
    page:Finish()
    return page
end

function Settings:RefreshControls(context, module, data)
    local page = context and context.chatBarSettingsPage
    if not page then return false end
    local profile = module:GetProfile()
    local appearancePopover = page:GetPopover("appearanceDetails")
    local copy = page:GetControl("copyChat")
    if copy then copy:SetValue(profile.copyChatEnabled == true, true) end
    if appearancePopover then appearancePopover:Refresh() end
    local order = module:GetSettingsButtonOrder()
    local index
    for index = 1, #order do
        local info = module:GetButtonInfo(order[index])
        page:GetControl("button_" .. info.key):SetValue(module:IsButtonEnabled(info.key), true)
    end
    if module:SupportsTabChannelSwitch() then
        local control = page:GetControl("tabChannelSwitch")
        if control then control:SetValue(profile.tabChannelSwitchEnabled == true, true) end
    end
    return true
end

function Settings:Register(module, data)
    if self.registered then return true end
    local definition = {
        title = "聊天条",
        description = "配置聊天快捷条的按钮、聊天复制、输入、字号、间距与位置。",
        group = "interface",
        navigationOrder = 10,
        searchKeywords = { "界面增强", "聊天", "复制聊天", "频道", "Tab", "切换频道", "字号", "间距", "聊天快捷条" },
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
                out.reason = available and nil or "当前客户端不支持聊天条。"
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                local ok, reason = module:SetEnabled(desired)
                if ok == false then return false, reason end
                local profile = module:GetProfile()
                return profile ~= nil and profile.enabled == desired
            end,
        },
        build = function(context) return BuildPage(context, module, data) end,
        onShow = function(context) Settings:RefreshControls(context, module, data) end,
        onRefresh = function(context) Settings:RefreshControls(context, module, data) end,
    }
    ns.ChatBarPageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("chatbar", self.pageId)
        system:RegisterPageAlias("chatBar", self.pageId)
    end
    return self.registered
end

ns.ChatBarSettings = Settings

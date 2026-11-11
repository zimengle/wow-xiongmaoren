local _, ns = ...
if not (ns.Build and ns.Build.HasModule("NativeTooltip")) then return end
local Settings = { pageId = "native-tooltip" }
ns.NativeTooltipSettings = Settings

local function BuildPage(context, module)
    local page = assert(ns.UI:CreateSettingsPage(context, { id = Settings.pageId }))
    module.settingsPage = page
    if page:GetControl("follow") then page:Refresh("reuse"); return page end
    local function Set(key, value) module:SetOption(key, value); page:Refresh("option") end
    local function Available() return module.runtimeActive == true and not module.colorOnly end
    local function CanColor() return module.runtimeActive == true end
    local function Option(key, text, tooltip, enabled)
        return { text = text, tooltip = tooltip, getEnabled = enabled or Available,
            getValue = function() return module:GetProfile()[key] end,
            onChange = function(_, value) Set(key, value) end }
    end
    local visibility = page:Section("显示规则")
    local combat = Option("combatVisibility", "战斗单位", function()
        if module.blocker then return "此设置已由 " .. module.blocker .. " 接管，请前往对应插件的提示框设置修改。" end
        if module.colorOnly then return "此设置已由 EllesmereUI 接管。请点击下方「跳转Elles鼠标设置页」按钮，在 Elles 设置中修改。" end
        return "仅控制战斗中的人物与NPC信息提示。增益、减益、技能、物品及装备比较保持原生显示，脱战后单位提示始终显示。"
    end)
    combat.options = { ctrl = "按Ctrl", shift = "按Shift", show = "显示", hide = "隐藏" }
    combat.order = { "ctrl", "shift", "show", "hide" }
    visibility:FieldRow():Dropdown("combatVisibility", combat)
    local combatFrame = page:GetControl("combatVisibility").frame
    if combatFrame.SetMotionScriptsWhileDisabled then combatFrame:SetMotionScriptsWhileDisabled(true) end
    local appearance = page:Section("提示设置")
    local row = appearance:QuadRow()
    row:Checkbox("follow", Option("follow", "跟随鼠标", "关闭后使用原生 HUD 提示框位置。"))
    local function Following() return Available() and module:GetProfile().follow end
    local direction = Option("direction", "跟随方向", nil, Following)
    direction.kind, direction.key = "dropdown", "direction"
    direction.options, direction.order = { top = "鼠标上方", right = "鼠标右侧" }, { "top", "right" }
    local positionRows = { direction }
    for _, spec in ipairs({ { "x", "横向偏移" }, { "y", "纵向偏移" } }) do
        local item = Option(spec[1], spec[2], nil, Following)
        item.kind, item.key, item.min, item.max, item.step = "slider", spec[1], -200, 200, 1
        positionRows[#positionRows + 1] = item
    end
    row:Popover("followDetails", { attachTo = "follow", title = "跟随位置",
        button = { getEnabled = Following }, tooltip = "调整跟随方向和偏移。", rows = positionRows })
    row:Checkbox("color", Option("color", "信息着色", "为提示中的信息添加颜色。EllesmereUI 启用时仍可使用。", CanColor))
    row:Checkbox("health", Option("health", "顶部血条"))
    row:Checkbox("showAuraSource", Option("showAuraSource", "显示光环来源", "在增益和减益提示中显示施放者名称。"))
    local font = Option("fontSize", "正文字号")
    font.kind, font.key, font.min, font.max, font.step = "slider", "fontSize", 12, 24, 1
    local opacity = Option("opacity", "背景不透明度", "数值越大，背景越不透明。")
    opacity.kind, opacity.key, opacity.min, opacity.max, opacity.step = "slider", "opacity", 0.4, 1, 0.01
    appearance:Row():Popover("appearanceDetails", { title = "提示外观", button = { text = "样式调整", getEnabled = Available }, rows = { font, opacity } })
    local idRows = {}
    for _, spec in ipairs({ { "showSpellID", "法术编号" }, { "showItemID", "物品编号" },
        { "showIconID", "图标编号" }, { "showNPCID", "NPC编号" } }) do
        local item = Option(spec[1], spec[2])
        item.kind, item.key = "checkbox", spec[1]
        idRows[#idRows + 1] = item
    end
    if ns.NativeTooltipAdapter.supportsItemLevel then
        local item = Option("showItemLevel", "物品等级", "在装备名称下方补充物品等级。", CanColor)
        item.kind, item.key = "checkbox", "showItemLevel"
        idRows[#idRows + 1] = item
    end
    appearance:Row():Popover("idDetails", { title = "显示编号", button = { text = "显示编号", getEnabled = ns.NativeTooltipAdapter.supportsItemLevel and CanColor or Available }, rows = idRows })
    page:Description(function()
        if module.blocker then return "检测到 " .. module.blocker .. "，鼠标提示增强已暂停。" end
        if module.colorOnly and ns.NativeTooltipAdapter.supportsItemLevel then return "|cff00ff00EllesmereUI 管理提示框，RS 可补充信息着色与物品等级。|r" end
        if module.colorOnly then return "|cff00ff00EllesmereUI 正在接管提示框，RS 仅提供信息着色。|r" end
        return module.runtimeActive and "" or "鼠标提示增强已关闭。"
    end, { hideWhenEmpty = true })
    page:Row():Button("ellesTooltipSettings", {
        text = "跳转Elles鼠标设置页",
        matchToggleColumn = true,
        getVisible = function() return module.colorOnly == true and not module.blocker end,
        tooltip = "打开 EllesmereUI 的鼠标提示设置，调整显示规则、跟随与外观。",
        onAction = function()
            local ok, reason = ns.NativeTooltipAdapter:OpenEllesTooltipSettings()
            if ok then ns.UI:CloseMain()
            else page:ShowTextDialog({ title = "无法打开设置", value = reason, readOnly = true }) end
        end,
    })
    page:FooterActions({ columns = 3 })
        :Button("resetPosition", { action = "resetPosition", text = "重置位置",
            onAction = function() module:ResetPosition(); page:Refresh("reset") end })
        :Button("restoreDefaults", { action = "restoreDefaults", text = "恢复默认",
            onAction = function()
                page:ShowTextDialog({ title = "恢复鼠标提示增强默认设置", confirmLabel = "恢复默认",
                    description = "仅恢复鼠标提示增强的跟随、外观、着色、光环与 ID 设置，不影响其他模块。",
                    value = "战斗中按Ctrl查看人物与NPC、显示光环来源；鼠标上方跟随，偏移为零，字号17，开启信息着色、顶部血条与四类 ID。",
                    onConfirm = function() module:RestoreDefaults(); page:Refresh("defaults"); return true end,
                })
                if page.textDialog then page.textDialog.close:SetText("取消") end
            end })
    page:Finish()
    return page
end

function Settings:Register(module)
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system then return false end
    return system:RegisterPage(self.pageId, {
        title = "鼠标提示", description = "鼠标跟随、提示外观、信息着色与 ID。",
        group = "interface", navigationOrder = 30, showInNavigation = true,
        searchKeywords = { "鼠标提示增强", "鼠标提示", "鼠标", "提示", "着色", "跟随", "HUD" },
        navigationSwitch = {
            GetState = function(out)
                out.available, out.mutable = true, true
                out.enabled = ns.Assembly:IsModuleEnabled("NativeTooltip")
                out.active, out.pending, out.reason = module.runtimeActive == true, false, module:GetStatusText()
                return out
            end,
            SetEnabled = function(value) return ns.Assembly:SetModuleEnabled("NativeTooltip", value == true) end,
        },
        build = function(context) return BuildPage(context, module) end,
        onRefresh = function() if module.settingsPage then module.settingsPage:Refresh("module") end end,
    })
end

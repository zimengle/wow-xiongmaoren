local _, ns = ...

local Settings = {
    pageId = "cvar",
    registered = false,
}

local function SettingOrder(data, category)
    local result = {}
    local cvar
    local metadata
    for cvar, metadata in pairs(data.metadata) do
        if metadata.category == category then result[#result + 1] = cvar end
    end
    table.sort(result)
    return result
end

local function EffectiveValue(module, cvar, metadata)
    local value = module:GetEffectiveCVar(cvar)
    if value == nil then value = metadata.default end
    return value
end

local function ToggleValue(module, cvar, metadata)
    local value = EffectiveValue(module, cvar, metadata)
    if metadata.invert then return tostring(value) == "0" end
    return tostring(value) == "1"
end

local function BuildSelectOptions(metadata)
    local options = {}
    local order = {}
    local optionIndex
    for optionIndex = 1, #(metadata.options or {}) do
        local option = metadata.options[optionIndex]
        local optionKey = tostring(option)
        order[optionIndex] = optionKey
        options[optionKey] = metadata.optionNames
            and metadata.optionNames[optionIndex] or tostring(option)
    end
    return options, order
end

local function BuildDirectSettings(owner, module, data, categoryKeys, appendToggles)
    local typeOrder = { "toggle", "select" }
    local typeIndex
    for typeIndex = 1, #typeOrder do
        local controlType = typeOrder[typeIndex]
        local controlsPerRow = 4
        local controlCount = 0
        local cvarRow
        local categoryIndex
        for categoryIndex = 1, #categoryKeys do
            local cvars = SettingOrder(data, categoryKeys[categoryIndex])
            local cvarIndex
            for cvarIndex = 1, #cvars do
                local cvarKey = cvars[cvarIndex]
                local metadata = data.metadata[cvarKey]
                if metadata.type == controlType then
                    if controlCount % controlsPerRow == 0 then
                        cvarRow = controlType == "toggle"
                            and owner:QuadRow() or owner:FieldRow()
                    end
                    controlCount = controlCount + 1
                    if controlType == "toggle" then
                        cvarRow:Checkbox(cvarKey, {
                            text = metadata.name,
                            tooltip = metadata.description,
                            value = ToggleValue(module, cvarKey, metadata),
                            getValue = function()
                                return ToggleValue(module, cvarKey, metadata)
                            end,
                            onChange = function(_, enabled)
                                local selected
                                if metadata.invert then
                                    selected = enabled and "0" or "1"
                                else
                                    selected = enabled and "1" or "0"
                                end
                                module:SetCustomSetting(cvarKey, selected)
                            end,
                        })
                    else
                        local options, order = BuildSelectOptions(metadata)
                        cvarRow:Dropdown(cvarKey, {
                            text = metadata.name,
                            tooltip = metadata.description,
                            value = tostring(EffectiveValue(module, cvarKey, metadata)),
                            getValue = function()
                                return tostring(EffectiveValue(module, cvarKey, metadata))
                            end,
                            options = options,
                            order = order,
                            onChange = function(_, selected)
                                module:SetCustomSetting(cvarKey, tostring(selected))
                            end,
                        })
                    end
                end
            end
        end
        if controlType == "toggle" and appendToggles then
            appendToggles(controlCount % controlsPerRow == 0 and owner:QuadRow() or cvarRow)
        end
    end
end

local function AppendAdvancedRange(rows, module, data, cvarKey, asDropdown)
    local metadata = data.metadata[cvarKey]
    if not metadata then return false end
    local row = {
        kind = asDropdown and "dropdown" or "slider",
        key = cvarKey,
        text = metadata.name,
        tooltip = metadata.description,
        onChange = function(_, selected)
            module:SetCustomSetting(cvarKey, tostring(selected))
        end,
    }
    if asDropdown then
        row.getValue = function()
            return tostring(EffectiveValue(module, cvarKey, metadata))
        end
        row.options = {}
        row.order = {}
        local optionIndex
        for optionIndex = 1, #(metadata.optionNames or {}) do
            local value = tostring(metadata.min + (optionIndex - 1) * metadata.step)
            row.order[optionIndex] = value
            row.options[value] = metadata.optionNames[optionIndex]
        end
    else
        row.getValue = function()
            return tonumber(EffectiveValue(module, cvarKey, metadata)) or metadata.default
        end
        row.min = metadata.min
        row.max = metadata.max
        row.step = metadata.step
    end
    rows[#rows + 1] = row
    return true
end

local function RuntimeToggleValue(module, cvar, metadata)
    local runtime = module:GetCVarValue(cvar)
    if runtime == nil then runtime = metadata.default end
    return tostring(runtime) == "1"
end

local function RuntimeSelectValue(module, cvar, metadata)
    local runtime = module:GetCVarValue(cvar)
    if runtime == nil then runtime = metadata.default end
    return tostring(runtime)
end

local function AddNameplateSwitch(row, module, data, cvarKey)
    local metadata = data.metadata[cvarKey]
    if not metadata then return false end
    row:Checkbox(cvarKey, {
        text = metadata.name,
        tooltip = metadata.description,
        value = RuntimeToggleValue(module, cvarKey, metadata),
        getValue = function()
            return RuntimeToggleValue(module, cvarKey, metadata)
        end,
        onChange = function(control, enabled)
            module:SetNameplateSwitch(cvarKey, enabled)
            if control then control:SetValue(RuntimeToggleValue(module, cvarKey, metadata), true) end
        end,
    })
    return true
end

local function AddNameplateSelect(row, module, data, cvarKey)
    local metadata = data.metadata[cvarKey]
    if not metadata then return false end
    local options, order = BuildSelectOptions(metadata)
    row:Dropdown(cvarKey, {
        text = metadata.name,
        tooltip = metadata.description,
        value = RuntimeSelectValue(module, cvarKey, metadata),
        getValue = function()
            return RuntimeSelectValue(module, cvarKey, metadata)
        end,
        options = options,
        order = order,
        onChange = function(control, selected)
            module:SetNameplateValue(cvarKey, tostring(selected))
            if control then control:SetValue(RuntimeSelectValue(module, cvarKey, metadata), true) end
        end,
    })
    return true
end

-- 仅名字字号不是 CVar，直接保存到模块配置；登录时由模块重新应用。
local NAMEONLY_FONT_SIZE_MIN = 15
local NAMEONLY_FONT_SIZE_MAX = 28
local NAMEONLY_FONT_SIZE_STEP = 1

local function NameOnlyFontSizeOption(module)
    if type(module.GetNameOnlyNameFontSize) ~= "function" then return false end
    return { kind = "slider", key = "nameOnlyNameFontSize",
        text = "仅名字字号",
        tooltip = "友方姓名板只显示名字时的字号，范围 15-28，登录时自动应用。",
        value = module:GetNameOnlyNameFontSize(),
        getValue = function()
            return module:GetNameOnlyNameFontSize()
        end,
        min = NAMEONLY_FONT_SIZE_MIN,
        max = NAMEONLY_FONT_SIZE_MAX,
        step = NAMEONLY_FONT_SIZE_STEP,
        valueSuffix = "号",
        onChange = function(control, selected)
            module:SetNameOnlyNameFontSize(tonumber(selected))
            if control then
                control:SetValue(module:GetNameOnlyNameFontSize(), true)
            end
        end,
    }
end
local function NameplateSliderOption(module, data, cvarKey)
    local metadata = data.metadata[cvarKey]
    if not metadata then return false end
    return { kind = "slider", key = cvarKey,
        text = metadata.name,
        tooltip = metadata.description,
        value = tonumber(EffectiveValue(module, cvarKey, metadata)) or metadata.default,
        min = metadata.min,
        max = metadata.max,
        step = metadata.step,
        onChange = function(_, selected)
            module:SetNameplateValue(cvarKey, tostring(selected))
        end,
    }
end


local function NameplateBitRow(module, cvarKey, index, text, tooltip)
    return {
        kind = "checkbox",
        key = cvarKey .. index,
        text = text,
        tooltip = tooltip,
        value = module:GetBitfieldBit(cvarKey, index) == true,
        getValue = function()
            return module:GetBitfieldBit(cvarKey, index) == true
        end,
        onChange = function(control, enabled)
            module:SetBitfieldBit(cvarKey, index, enabled)
            if control then control:SetValue(module:GetBitfieldBit(cvarKey, index) == true, true) end
        end,
    }
end

-- 姓名板分组只对无限出现：四项是当前状态开关（只写运行值），样式/尺寸与组合位字段
-- 同样只表达玩家当前选择，不进入工具箱预设。
local function BuildNameplateSection(owner, module, data, adapter)
    local section = owner:Section("姓名板")
    local switches = section:QuadRow()
    AddNameplateSwitch(switches, module, data, "nameplateShowEnemies")
    AddNameplateSwitch(switches, module, data, "nameplateShowFriendlyPlayers")
    AddNameplateSwitch(switches, module, data, "nameplateShowOnlyNameForFriendlyPlayerUnits")
    AddNameplateSwitch(switches, module, data, "nameplateUseClassColorForFriendlyPlayerUnitNames")

    local appearance = section:FieldRow()
    AddNameplateSelect(appearance, module, data, "nameplateStyle")
    local sizeRows = {}
    local size = NameplateSliderOption(module, data, "nameplateSize")
    local font = NameOnlyFontSizeOption(module)
    if size then sizeRows[#sizeRows + 1] = size end
    if font then sizeRows[#sizeRows + 1] = font end
    if #sizeRows > 0 then
        section:Row():Popover("nameplateAppearance", { title = "姓名板外观",
            button = { text = "尺寸字号" }, rows = sizeRows })
    end

    if type(adapter.SupportsNameplateBitfields) == "function" and adapter:SupportsNameplateBitfields() then
        local combos = section:ActionRow()
        combos:Popover("nameplateInfo", {
            title = "姓名板信息组合",
            tooltip = "选择姓名板显示的血量信息、仇恨提示与堆叠方式。",
            button = { text = "信息组合" },
            rows = {
                NameplateBitRow(module, "nameplateStackingTypes", 1,
                    "敌方姓名板堆叠", "敌方姓名板之间互相堆叠显示。"),
                NameplateBitRow(module, "nameplateStackingTypes", 2,
                    "友方姓名板堆叠", "友方姓名板之间互相堆叠显示。"),
                NameplateBitRow(module, "nameplateInfoDisplay", 1,
                    "血量百分比", "在姓名板上显示当前血量百分比。"),
                NameplateBitRow(module, "nameplateInfoDisplay", 2,
                    "血量数值", "在姓名板上显示当前血量数值。"),
                NameplateBitRow(module, "nameplateThreatDisplay", 1,
                    "仇恨渐进", "按仇恨高低渐进改变姓名板显示。"),
                NameplateBitRow(module, "nameplateThreatDisplay", 2,
                    "仇恨闪烁", "仇恨变化时闪烁提示。"),
                NameplateBitRow(module, "nameplateThreatDisplay", 3,
                    "仇恨血条染色", "按仇恨状态给血条染色。"),
            },
        })
        combos:Popover("nameplateCastBar", {
            title = "施法条显示组合",
            tooltip = "选择姓名板施法条显示的内容与高亮提示。",
            button = { text = "施法条" },
            rows = {
                NameplateBitRow(module, "nameplateCastBarDisplay", 1,
                    "法术名称", "显示正在施放的法术名称。"),
                NameplateBitRow(module, "nameplateCastBarDisplay", 2,
                    "法术图标", "显示正在施放的法术图标。"),
                NameplateBitRow(module, "nameplateCastBarDisplay", 3,
                    "施法目标", "显示法术的目标。"),
                NameplateBitRow(module, "nameplateCastBarDisplay", 4,
                    "高亮重要施法", "高亮需要打断的重要施法。"),
                NameplateBitRow(module, "nameplateCastBarDisplay", 5,
                    "高亮指向自己", "施法目标是自己时高亮。"),
            },
        })
    end
    return section
end

local function BuildPage(context, module, data, adapter)
    local profile = module:GetProfile()
    local page, reason = ns.UI:CreateSettingsPage(context, {
        id = Settings.pageId,
    })
    if not page then
        error("Unable to create CVar settings page: " .. tostring(reason), 2)
    end
    context.cvarSettingsPage = page
    context.cvarSettingsControls = page.controls
    if page:GetPopover("advancedValues") then
        page:Refresh("reuse")
        return page
    end

    -- 当前页面只有一组内容，直接使用页面分区；Tabs 封装继续保留给真正需要分页的页面。
    local commonTab = page

    local general = commonTab:Section("自动应用")
    local generalRow = general:ActionRow()
    local advancedRows = {}
    AppendAdvancedRange(advancedRows, module, data, "cameraDistanceMaxZoomFactor", false)
    AppendAdvancedRange(advancedRows, module, data, "violenceLevel", true)
    AppendAdvancedRange(advancedRows, module, data, "weatherdensity", true)
    AppendAdvancedRange(advancedRows, module, data, "spellActivationOverlayOpacity", false)
    generalRow:Popover("advancedValues", {
        title = "高级数值微调",
        tooltip = "调整视距、暴力等级、天气密度与法术警报透明度。",
        button = { text = "高级设置" },
        rows = advancedRows,
    })
    local applyRow = general:QuadRow()
    applyRow:Checkbox("autoApply", {
        text = "登录时自动应用",
        tooltip = "每次登录角色后自动应用本页保存的 CVar 设置。",
        value = profile.autoApply,
        getValue = function() return module:GetProfile().autoApply end,
        onChange = function(_, value)
            module:GetProfile().autoApply = value and true or false
        end,
    })
    applyRow:Checkbox("smartApply", {
        text = "仅应用变化",
        tooltip = "只写入与当前游戏值不同的项目，减少重复设置。",
        value = profile.smartApply,
        getValue = function() return module:GetProfile().smartApply end,
        onChange = function(_, value)
            module:GetProfile().smartApply = value and true or false
        end,
    })
    applyRow:Checkbox("notifyOnApply", {
        text = "应用后提示",
        tooltip = "应用完成后在聊天框显示结果提示。",
        value = profile.notifyOnApply,
        getValue = function() return module:GetProfile().notifyOnApply end,
        onChange = function(_, value)
            module:GetProfile().notifyOnApply = value and true or false
        end,
    })
    if adapter.supportsAddonProfiler then
        local profilerRow = general:QuadRow()
        profilerRow:Checkbox("disableAddonProfiler", {
            text = "关闭插件性能分析",
            tooltip = "登录时关闭暴雪插件性能分析，避免持续采样带来的额外开销。",
            value = profile.disableAddonProfiler,
            getValue = function() return module:GetProfile().disableAddonProfiler end,
            onChange = function(_, value)
                module:GetProfile().disableAddonProfiler = value and true or false
            end,
        })
        profilerRow:Checkbox("notifyAddonProfiler", {
            text = "关闭时提示",
            tooltip = "成功关闭暴雪插件性能分析后在聊天框显示提示。",
            value = profile.notifyAddonProfiler,
            getValue = function() return module:GetProfile().notifyAddonProfiler end,
            onChange = function(_, value)
                module:GetProfile().notifyAddonProfiler = value and true or false
            end,
        })
    end

    local interface = commonTab:Section("界面与交互")
    local appendInterfaceToggles
    if adapter.supportsSimplifiedNameplates
        and type(adapter.IsSimplifiedNameplatesSupported) == "function"
        and adapter:IsSimplifiedNameplatesSupported() then
        appendInterfaceToggles = function(row)
            row:Checkbox("simplifiedNameplatesDisabled", {
                text = "禁用简化姓名板",
                tooltip = "关闭仆从、次要单位、友方玩家和友方 NPC 的简化姓名板；取消后恢复暴雪默认设置。",
                value = module:GetSpecialSettingIntent("simplifiedNameplatesDisabled") == true,
                getValue = function()
                    return module:GetSpecialSettingIntent("simplifiedNameplatesDisabled") == true
                end,
                onChange = function(_, enabled)
                    module:SetSpecialSettingIntent("simplifiedNameplatesDisabled", enabled)
                end,
            })
        end
    end
    BuildDirectSettings(interface, module, data, { "interface" }, appendInterfaceToggles)

    if adapter.supportsNameplateControls then
        BuildNameplateSection(commonTab, module, data, adapter)
    end

    local effects = commonTab:Section("效果与战斗")
    BuildDirectSettings(effects, module, data, { "effects", "combat" }, function(row)
        row:Checkbox("deathRecapLoginRepair", {
            text = "修复死亡摘要",
            tooltip = "重新开启时立即修复为300秒，战斗中延至脱战。默认开启，登录时补足300秒并保留更长设置，受登录时自动应用控制。关闭只取消后续修复，不还原当前值。",
            getValue = function() return module:GetProfile().repairDeathRecap end,
            onChange = function(_, value) module:SetDeathRecapRepairEnabled(value) end,
        })
    end)

    local debug = commonTab:Section("调试")
    BuildDirectSettings(debug, module, data, { "debug" })

    page:FooterActions({ columns = 2 })
        :Button("apply", {
            text = "立即应用",
            onAction = function() module:ApplyCurrentSettings() end,
        })
        :Button("reset", { action = "restoreDefaults",
            text = "恢复预设",
            onAction = function()
                page:ClosePopovers()
                page:ShowTextDialog({
                    title = "恢复 CVAR 预设", confirmLabel = "恢复预设",
                    description = "恢复本页支持的推荐 CVAR 设置。",
                    value = "本页的自定义 CVAR 数值将恢复为推荐值；不影响其他模块。",
                    onConfirm = function()
                        module:ResetToRecommended()
                        page:Refresh("reset-recommended")
                        return true
                    end,
                })
            end,
        })

    page:Finish()
    return page
end

function Settings:RefreshControls(context)
    local page = context and context.cvarSettingsPage
    if not page then return false end
    return page:Refresh("module-refresh")
end

function Settings:Register(module, data, adapter)
    if self.registered then return true end
    -- Index the Build's metadata without creating the page or its lazy popovers.
    local searchKeywords = { "游戏设置", "CVAR", "伤害数字", "血条距离", "装备比较", "镜头",
        "死亡摘要", "死亡记录", "死亡回顾", "日经02", "combatLogRetentionTime" }
    for cvar, metadata in pairs(data.metadata) do
        searchKeywords[#searchKeywords + 1] = cvar
        searchKeywords[#searchKeywords + 1] = metadata.name
        searchKeywords[#searchKeywords + 1] = metadata.description
    end
    local definition = {
        title = "游戏设置",
        description = "集中管理常用 CVAR；高级数值通过齿轮调整并按当前 Build 能力应用。",
        group = "pinned",
        navigationOrder = 40,
        searchKeywords = searchKeywords,
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                out.available = true
                out.enabled = profile.enabled == true
                out.mutable = true
                out.active = module:IsEnabled()
                out.pending = false
                out.reason = nil
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                local ok, reason = module:Toggle(desired)
                if ok == false then return false, reason end
                return module:GetProfile().enabled == desired
            end,
        },
        build = function(context) return BuildPage(context, module, data, adapter) end,
        onShow = function(context)
            module:SetSettingsVisible(true)
            return Settings:RefreshControls(context)
        end,
        onHide = function() module:SetSettingsVisible(false) end,
        onRefresh = function(context) return Settings:RefreshControls(context) end,
    }
    ns.CVarSettingsPageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("cvarSettings", self.pageId)
        system:RegisterPageAlias("cvarsettings", self.pageId)
    end
    return self.registered
end

ns.CVarSettingsSettings = Settings

local _, ns = ...
local Settings = {}
ns.MinimapCollectorSettings = Settings

-- Labels are presentation only; exclusions keep the original provider key.
local iconLabels = {
    ["frame:ExpansionLandingPageMinimapButton"] = "资料片概要",
    DungeonsForever = "无限副本手册（DungeonsForever）",
    ["frame:LibDBIcon10_DungeonsForever"] = "无限副本手册（DungeonsForever）",
}

local function BuildPage(context, module)
    local page = assert(ns.UI:CreateSettingsPage(context, { id = "minimap-collector" }))
    module.settingsPage = page
    module:Refresh()
    if not page.collectorSection then
        page:Description("左键 RS 图标展开或收起，右键打开设置；默认不定时收起。点击内部图标、左键点击面板外、按 Esc 或面板右键可收起。勾选的图标不进行收纳。")
        local function Changed(key, value)
            module:SetOption(key, value)
            page:Refresh("appearance")
        end
        local function Slider(key, text, min, max, step)
            return {kind = "slider", key = key, text = text, min = min, max = max, step = step or 1,
                getValue = function() return module:GetOption(key) end,
                onChange = function(_, value) Changed(key, value) end}
        end
        local appearance = page:Section("展开设置"):ActionRow()
        appearance:Popover("layoutDetails", {title = "详细设置", button = {text = "详细设置"},
            tooltip = "调整展开方向、位置、每行数量、按钮尺寸、间距和自动隐藏时间。隐藏时间为 0 时不定时收起，仍可左键点击面板外收起；大于 0 时按设定秒数收起，预览不计时。每行数量为 0 时动态计算：默认每行 4 个，超过 16 个改为每行 8 个。自动按 RS 按钮所在屏幕半侧选择左右方向。",
            rows = {
                {kind = "dropdown", key = "direction", text = "展开方向",
                    options = {left = "左侧", right = "右侧", up = "上方", down = "下方", leftUp = "左上", rightUp = "右上", leftDown = "左下", rightDown = "右下", auto = "自动"},
                    order = {"left", "right", "up", "down", "leftUp", "rightUp", "leftDown", "rightDown", "auto"},
                    getValue = function() return module:GetOption("direction") end,
                    onChange = function(_, value) Changed("direction", value) end},
                Slider("offsetX", "横向偏移", -500, 500), Slider("offsetY", "纵向偏移", -500, 500),
                Slider("columns", "每行数量", 0, 12), Slider("buttonSize", "按钮尺寸", 16, 64),
                Slider("spacing", "按钮间距", 0, 32),
                Slider("hideDelay", "隐藏时间（秒，0不计时）", 0, 30),
            }})
        appearance:Popover("backgroundDetails", {title = "背景样式", button = {text = "背景样式"},
            tooltip = "纯色背景。最小宽高为 0 时自动适配；尺寸不会小于图标内容。",
            rows = {
                {kind = "color", key = "backgroundColor", text = "背景颜色",
                    getValue = function()
                        local c = module:GetOption("backgroundColor")
                        return {c[1], c[2], c[3], module:GetOption("opacity")}
                    end,
                    onChange = function(_, value)
                        module:SetOption("backgroundColor", {value[1], value[2], value[3]})
                        if type(value[4]) == "number" then module:SetOption("opacity", value[4]) end
                        page:Refresh("color")
                    end},
                Slider("opacity", "背景不透明度", 0, 1, 0.01), Slider("padding", "背景留白", 0, 64),
                Slider("minWidth", "最小宽度", 0, 1000), Slider("minHeight", "最小高度", 0, 1000),
            }})
        local compatibility = page:Section("兼容避让")
        page:Description(function() return module:GetStatusText() end)
        page:Description(function() return "互斥检测：" .. (module:GetConflict() or "未检测到其他收纳器工作。") end)
        local function ForceEnable()
            local reason = module:GetConflict()
            if not reason then module:SetAutoAvoid(false); page:Refresh("avoid"); return end
            page:ShowTextDialog({title = "确认强制开启", confirmLabel = "仍然开启",
                description = "你已使用其他小地图收纳。如果强行开启 RS 工具箱的小地图收纳可能会有冲突，是否开启？",
                value = reason .. "\n\n仅本次登录、当前冲突有效。RS 不修改第三方设置，也不抢占已被其他收纳器接管的按钮。",
                onConfirm = function()
                    if not module:SetAutoAvoid(false, reason) then
                        if ns.Print then ns.Print("互斥状态已变化，请重新点击强制开启并确认。") end
                        page:Refresh("conflict-changed")
                        return true
                    end
                    ns.Assembly:SetModuleEnabled("MinimapCollector", true)
                    page:Refresh("forced")
                    return true
                end,
                onCancel = function() page:Refresh("cancel-force") end})
        end
        compatibility:Row():Checkbox("autoAvoid", {text = "自动避让",
            tooltip = "检测到其他收纳器时暂停 RS。关闭避让需要确认当前冲突，重新登录或冲突变化后需再次确认。",
            getValue = function() return module:GetOption("autoAvoid") end,
            onChange = function(_, value)
                if value then module:SetAutoAvoid(true) else ForceEnable() end
                page:Refresh("avoid")
            end})
        compatibility:ActionRow():Button("forceEnable", {text = "强制开启",
            getEnabled = function() return module:GetConflict() ~= nil end, onAction = ForceEnable})
        page:Description("第三方收纳关闭后若仍占用按钮，请 /reload。RS 不修改第三方设置；归属不明的按钮不接管。")
        compatibility:Row():Checkbox("collectExpansion", {
            text = "收纳资料片概要",
            tooltip = "默认不收纳。仅接管仍属于小地图的原生概要按钮；受保护或已被第三方接管时保持原样。",
            getValue = function() return module:GetOption("collectExpansion") end,
            onChange = function(_, value)
                module:SetOption("collectExpansion", value)
                BuildPage(context, module)
                page:Refresh("expansion")
            end,
        })
        page.collectorSection = page:Section("不进行收纳")
        local actions = page:FooterActions({columns = 3})
        actions:Button("preview", {action = "preview", text = "预览",
            getText = function() return module.previewMode and "取消预览" or "预览" end,
            onAction = function() module:SetPreview(not module.previewMode); page:Refresh("preview") end,
            onDeactivate = function() module:SetPreview(false) end})
        actions:Button("resetPosition", {action = "resetPosition", text = "重置位置",
            onAction = function() module:ResetPosition(); page:Refresh("position") end})
        actions:Button("restoreDefaults", {action = "restoreDefaults", text = "恢复默认",
            onAction = function()
                page:ShowTextDialog({title = "恢复小地图收纳默认设置", confirmLabel = "恢复默认",
                    description = "恢复本页布局、背景、自动避让和图标名单，并开启 RS 小地图收纳。",
                    value = "默认在 RS 按钮左侧展开。其他插件设置保持原样。",
                    onConfirm = function()
                        module:ResetOptions()
                        ns.Assembly:SetModuleEnabled("MinimapCollector", true)
                        module:Refresh()
                        page:Refresh("defaults")
                        return true
                    end})
            end})
    end
    -- Rebind the current set of selection rows; late icons never duplicate controls.
    local names = module:GetNames()
    page.collectorNames = {}
    for _, name in ipairs(names) do
        if name ~= "RurutiaSuite" then
            page.collectorNames[#page.collectorNames + 1] = name
        end
    end
    for i = (page.collectorSlots or 0) + 1, #page.collectorNames do
        local slot = i
        page.collectorSection:Row():Checkbox("exclude" .. i, {
            variant = "square",
            text = function()
                local name = page.collectorNames[slot]
                return iconLabels[name] or name or ""
            end,
            getVisible = function() return page.collectorNames[slot] ~= nil end,
            getValue = function() return module.db.profile.excluded[page.collectorNames[slot]] == true end,
            onChange = function(_, value)
                local name = page.collectorNames[slot]
                if name then module:SetExcluded(name, value); page:Refresh("exclude") end
            end,
        })
        page.collectorSlots = i
    end
    page:Finish()
    return page
end

function Settings:Register(module)
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system then return end
    return system:RegisterPage("minimap-collector", {
        title = "小地图收纳", description = "将插件图标收进 RS 小地图入口。默认开启。",
        group = "interface", navigationOrder = 65, showInNavigation = true,
        searchKeywords = { "小地图", "收纳", "图标", "排除" },
        navigationSwitch = {
            GetState = function(out)
                out.available, out.mutable = true, true
                out.enabled = ns.Assembly:IsModuleEnabled("MinimapCollector")
                out.active = module.active and not module.blocker
                out.pending, out.reason = module.pending == true, module:GetStatusText()
                return out
            end,
            SetEnabled = function(value) return ns.Assembly:SetModuleEnabled("MinimapCollector", value == true) end,
        },
        build = function(context) return BuildPage(context, module) end,
        onRefresh = function(context) BuildPage(context, module) end,
    })
end

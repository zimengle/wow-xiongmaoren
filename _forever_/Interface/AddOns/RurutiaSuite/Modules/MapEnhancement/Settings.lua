local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("MapEnhancement")) then return end

local Settings = { pageId = "mapenhancement", registered = false }

-- Slider ranges for the window coordinates follow the live screen and window
-- size; the popover refreshes ranges and values through the shared getters.
local function SyncSliderRange(popover, key, maximum)
    if not popover or type(popover.GetControl) ~= "function" then return end
    local control = popover:GetControl(key)
    if not control or control.kind ~= "slider" then return end
    if control.options then control.options.min, control.options.max = 0, maximum end
    if control.frame and type(control.frame.SetMinMaxValues) == "function" then
        control.frame:SetMinMaxValues(0, maximum)
    end
end

local function PercentText(value)
    return string.format("%d%%", math.floor((tonumber(value) or 0) * 100 + 0.5))
end

local function BuildPage(context, module)
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then error("Unable to create MapEnhancement settings page: " .. tostring(reason), 2) end
    context.mapEnhancementSettingsPage = page
    module.settingsPage = page
    if context.mapEnhancementSettingsBuilt then page:Refresh("reuse") return page end

    local general = page:Section("地图操作")
    local operationRow = general:QuadRow()
    operationRow
        :Checkbox("allowMove", {
            text = "允许移动",
            tooltip = "启用地图增强后，拖动窗口化地图的标题区域移动。",
            getValue = function() return module:GetProfile().allowMove ~= false end,
            onChange = function(_, value) module:SetOption("allowMove", value) page:Refresh("option") end,
        })
        :Checkbox("allowScale", {
            text = "允许缩放",
            tooltip = "启用地图增强后，拖动右下角手柄或调整比例缩放整个地图窗口。",
            getValue = function() return module:GetProfile().allowScale ~= false end,
            onChange = function(_, value) module:SetOption("allowScale", value) page:Refresh("option") end,
        })
    general:Row():Checkbox("centerHorizontal", {
        text = "水平居中",
        tooltip = "任务地图保持水平居中；拖动标题栏后自动关闭，可随时重新开启。",
        getValue = function() return module:GetProfile().centerHorizontal ~= false end,
        onChange = function(_, value) module:SetOption("centerHorizontal", value) page:Refresh("center") end,
    })
    general:Row():Checkbox("showZoneLevels", {
        text = "区域等级",
        tooltip = "默认开启。大陆地图悬停区域时补充客户端组队推荐等级，按角色等级着色；已有等级或缺少已核实数据时保留原生显示。检测到地图冲突插件时暂停。",
        getValue = function() return module:GetProfile().showZoneLevels ~= false end,
        onChange = function(_, value) module:SetOption("showZoneLevels", value) page:Refresh("option") end,
    })
    local revealRow = general:Row()
    revealRow:Checkbox("showUnexplored", {
        text = "显示未探索",
        tooltip = "默认开启，使用原生地图素材显示未探索地形，缺少素材时保留迷雾。仅改变显示，不影响探索进度。",
        getValue = function() return module:GetProfile().showUnexplored ~= false end,
        onChange = function(_, value) module:SetOption("showUnexplored", value) page:Refresh("option") end,
    })
    revealRow:Popover("revealDetails", {
        attachTo = "showUnexplored",
        title = "未探索遮罩",
        tooltip = "调整未探索区域遮罩的颜色与不透明度。",
        rows = {
            {
                kind = "color", key = "unexploredColor", text = "遮罩颜色",
                tooltip = "未探索区域按这个颜色压暗，默认黑色；颜色越浅压暗越不明显，白色等于不改变地形。颜色选择器里的不透明度与下方滑条同步。",
                getValue = function()
                    local profile = module:GetProfile()
                    local color = profile.unexploredColor or {}
                    return { color.r or 0, color.g or 0, color.b or 0, profile.unexploredOpacity or 0.35 }
                end,
                onChange = function(_, value)
                    local chosen = type(value) == "table" and value or {}
                    module:SetOption("unexploredColor", { r = chosen[1], g = chosen[2], b = chosen[3] })
                    if type(chosen[4]) == "number" then
                        module:SetOption("unexploredOpacity", chosen[4])
                    end
                    page:Refresh("reveal")
                end,
            },
            {
                kind = "slider", key = "unexploredOpacity", text = "遮罩不透明度",
                min = 0, max = 1, step = 0.01, formatValue = PercentText,
                tooltip = "0% 完全不压暗，100% 拉到遮罩颜色；默认黑色 35%。",
                getValue = function() return module:GetProfile().unexploredOpacity or 0.35 end,
                onChange = function(_, value)
                    module:SetOption("unexploredOpacity", value)
                    page:Refresh("reveal")
                end,
            },
        },
    })
    operationRow:Popover("scaleDetails", {
        attachTo = "allowScale", title = "地图缩放",
        rows = { { kind = "slider", key = "scale", text = "任务地图比例",
            min = 0.5, max = 2, step = 0.01,
            tooltip = "50%–200%，实际大小受屏幕可用空间限制。",
            getValue = function() return module:GetProfile().scale or 1.3 end,
            getEnabled = function() return module:GetProfile().allowScale ~= false end,
            onChange = function(_, value) module:SetOption("scale", value); page:Refresh("scale") end,
        } },
    })
    general:Row():Popover("positionDetails", {
        title = "任务地图位置",
        tooltip = "窗口化任务地图左上角相对屏幕左/上边缘的坐标，步长1像素；超出可用范围时自动贴边。",
        button = { text = "地图位置" },
        rows = {
            {
                kind = "slider", key = "positionX", text = "横向坐标",
                min = 0, max = 2000, step = 1,
                tooltip = "窗口左上角距屏幕左边缘的像素；水平居中时该项不可拖动，显示实际居中值。",
                getValue = function()
                    local maxX = module:GetPositionLimits()
                    SyncSliderRange(page:GetPopover("positionDetails"), "positionX",
                        math.max(1, math.floor(maxX or 0)))
                    return module:GetPosition("x")
                end,
                getEnabled = function() return module:GetProfile().centerHorizontal == false end,
                onChange = function(_, value) module:SetPosition("x", value) page:Refresh("position") end,
            },
            {
                kind = "slider", key = "positionY", text = "纵向坐标",
                min = 0, max = 2000, step = 1,
                tooltip = "窗口左上角距屏幕上边缘的像素。",
                getValue = function()
                    local _, maxY = module:GetPositionLimits()
                    SyncSliderRange(page:GetPopover("positionDetails"), "positionY",
                        math.max(1, math.floor(maxY or 0)))
                    return module:GetPosition("y")
                end,
                onChange = function(_, value) module:SetPosition("y", value) page:Refresh("position") end,
            },
        },
    })
    general:Description("先开启导航中的总开关，移动与缩放设置才会生效。关闭单项操作会保留已保存的布局；停用模块恢复接管前的原生布局。")
    page:Section("使用说明"):Description("仅调整窗口化世界地图（含任务面板）。地图内容区域保留原生平移、缩放与点击；最大化使用原生布局，返回窗口化后恢复保存的位置与比例。「显示未探索」补画未探索区域并叠加遮罩，已探索区域与探索进度保持原生。")
    page:Section("当前状态"):Description(function() return module:GetStatusText() or "" end)

    page:FooterActions({ columns = 3 })
        :Button("preview", { action = "preview",
            getText = function() return module.previewEnabled and "结束预览" or "预览地图" end,
            tooltip = "打开真实地图；结束预览时，仅关闭由本次预览打开的地图。",
            onAction = function() module:TogglePreview(not module.previewEnabled) end,
            onDeactivate = function() if module.previewEnabled then module:TogglePreview(false) end end,
        })
        :Button("resetPosition", { action = "resetPosition",
            text = "重置位置", tooltip = "只重置地图位置，保留当前比例。",
            onAction = function() return module:ResetPosition() end,
        })
        :Button("restoreDefaults", { action = "restoreDefaults",
            text = "恢复默认", tooltip = "只恢复地图增强的设置与位置。",
            onAction = function()
                page:ShowTextDialog({
                    title = "恢复地图增强默认设置", confirmLabel = "恢复默认",
                    description = "仅恢复地图增强，不影响其他模块或第三方插件配置。",
                    value = "开启地图增强，允许移动与缩放，任务地图水平居中、比例130%，默认位置下移10px；开启区域等级；开启显示未探索并使用黑色35%遮罩；最大化大地图保持原生比例。",
                    onConfirm = function()
                        local ok, reason = module:RestoreDefaults()
                        if ok == false then return false, reason end
                        page:Refresh("restore-defaults")
                        return true
                    end,
                })
                if page.textDialog then page.textDialog.close:SetText("取消") end
            end,
        })
    page:Finish()
    context.mapEnhancementSettingsBuilt = true
    return page
end

function Settings:Register(module)
    if self.registered then return true end
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    local function Refresh(context)
        local page = context and context.mapEnhancementSettingsPage
        if page then page:Refresh("module") end
    end
    local definition = {
        title = "地图增强", description = "移动与缩放窗口化世界地图。",
        group = "interface", navigationOrder = 50, showInNavigation = true,
        searchKeywords = { "界面增强", "地图", "移动", "缩放", "未探索", "遮罩", "坐标", "MapEnhancement" },
        navigationSwitch = {
            GetState = function(out)
                out.available, out.enabled = true, module:GetProfile().enabled == true
                out.mutable = not (_G.InCombatLockdown and _G.InCombatLockdown())
                if module.controller then
                    out.active = module.controller.attached == true
                else
                    out.active = module.runtimeActive == true
                end
                out.pending, out.reason = false, module:GetStatusText()
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                local ok, reason = module:SetEnabled(desired)
                if module.settingsPage then module.settingsPage:Refresh("enabled") end
                if ok == false then return false, reason end
                return (module:GetProfile().enabled == true) == desired
            end,
        },
        build = function(context) return BuildPage(context, module) end,
        onShow = Refresh, onRefresh = Refresh,
    }
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    return self.registered
end

ns.MapEnhancementSettings = Settings

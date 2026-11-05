local _, ns = ...
if not ns.Build.HasModule("HunterAspects") then return end
local Settings = {}
local function BuildPage(context, module)
    local page = ns.UI:CreateSettingsPage(context, {id = "hunter-aspects"})
    context.hunterAspectsPage = page
    if page.hunterBuilt then page:Refresh("reuse"); return page end
    page.hunterBuilt = true
    page:Section("使用说明"):Description("只显示已学会的守护，左键切换；当前守护亮边，其余图标变淡。预览显示守护图标与鼠标提示，不施放技能；默认高亮雄鹰守护。关闭设置不结束预览或解锁，预览可再次点击关闭。右键定位框打开设置；位置与开关请在脱战后调整。")
    local layout = page:Section("布局设置")
    local function Editable() return not ns.HunterAspectsAdapter:InCombat() end
    for _, spec in ipairs({{"iconWidth", "图标宽度", 16, 80}, {"iconHeight", "图标高度", 16, 80}, {"spacing", "图标间距", 0, 20}}) do
        local key = spec[1]
        layout:Row():Slider(key, {text = spec[2], min = spec[3], max = spec[4], step = 1,
            getValue = function() return module.db.profile[key] end, getEnabled = Editable,
            onChange = function(control, value)
                if not module:SetLayout(key, value) then control:SetValue(module.db.profile[key], true) end
            end})
    end
    layout:FieldRow():Dropdown("alignment", {text = "对齐方式",
        options = {LEFT = "左对齐", CENTER = "居中", RIGHT = "右对齐", TOP = "顶部对齐", BOTTOM = "底部对齐"},
        order = {"LEFT", "CENTER", "RIGHT", "TOP", "BOTTOM"},
        tooltip = "选择守护条哪一边固定在保存的位置；增加守护时，该对齐点保持不动。",
        getValue = function() return module.db.profile.alignment end, getEnabled = Editable,
        onChange = function(control, value)
            if not module:SetLayout("alignment", value) then control:SetValue(module.db.profile.alignment, true) end
        end})
    layout:FieldRow():Dropdown("direction", {text = "生长方向",
        options = {LEFT = "向左", RIGHT = "向右", UP = "向上", DOWN = "向下"},
        order = {"RIGHT", "LEFT", "UP", "DOWN"},
        getValue = function() return module.db.profile.direction end, getEnabled = Editable,
        onChange = function(control, value)
            if not module:SetLayout("direction", value) then control:SetValue(module.db.profile.direction, true) end
        end})
    page:FooterActions()
        :Button("preview", {action = "preview", text = "预览模式",
            getEnabled = function() return module:IsEnabled() and not ns.HunterAspectsAdapter:InCombat() end,
            onAction = function() return module:SetPreview(not module.preview) end,
        })
        :Button("resetPosition", {action = "resetPosition", text = "重置位置",
            getEnabled = Editable,
            onAction = function() return module:ResetPosition() end,
        })
        :Button("restoreDefaults", {action = "restoreDefaults", text = "恢复默认", getEnabled = Editable,
            onAction = function()
                page:ShowTextDialog({title = "恢复猎人守护条默认设置", confirmLabel = "恢复默认",
                    description = "恢复图标尺寸、间距、对齐、生长方向和位置，保留功能开关。",
                    value = "图标30×30，间距1，居中对齐、向右生长，位于屏幕中心下方300。",
                    onConfirm = function()
                        if not module:RestoreDefaults() then return false end
                        page:Refresh("defaults"); return true
                    end})
            end})
    page:Finish()
    return page
end
function Settings:Register(module)
    local definition = {
        title = "猎人守护条", group = "class", navigationOrder = 20,
        showInNavigation = true,
        visible = function() return ns.HunterAspectsAdapter:IsHunter() end,
        searchKeywords = {"猎人", "守护条", "雄鹰", "灵猴", "猎豹"},
        navigationSwitch = {
            GetState = function(out)
                out.available = ns.HunterAspectsAdapter:IsHunter()
                out.enabled = ns.Assembly:IsModuleEnabled("HunterAspects")
                out.mutable = out.available and not ns.HunterAspectsAdapter:InCombat()
                out.active = out.enabled and module.rows ~= nil
                out.pending = false
                return out
            end,
            SetEnabled = function(value) return module:SetEnabled(value) end,
        },
        build = function(context) return BuildPage(context, module) end,
    }
    ns.HunterAspectsPageDefinition = definition
    return ns.UI:GetSystem():RegisterPage("hunter-aspects", definition)
end
ns.HunterAspectsSettings = Settings

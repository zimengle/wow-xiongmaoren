local _, ns = ...
if not ns.Build.HasModule("RangeMonitor") then return end
local Settings = {}
local function BuildPage(context, module)
    local page = assert(ns.UI:CreateSettingsPage(context, { id = "range-monitor" }))
    module.settingsPage = page
    if page:GetPopover("appearance") then page:Refresh("reuse") return page end
    local section = page:Section("显示设置")

    section:ActionRow():Popover("appearance", {
        title = "样式调整", button = { text = "样式调整" },
        rows = {
            { kind = "slider", key = "fontSize", text = "字号", min = 10, max = 32, step = 1,
                getValue = function() return module:GetProfile().fontSize end,
                onChange = function(_, value) module:GetProfile().fontSize = value module:ProfileChanged() end },
            { kind = "slider", key = "x", text = "横向位置", min = -1000, max = 1000, step = 1,
                getValue = function() return module:GetProfile().x end,
                onChange = function(_, value) module:GetProfile().x = value module:ProfileChanged() end },
            { kind = "slider", key = "y", text = "纵向位置", min = -1000, max = 1000, step = 1,
                getValue = function() return module:GetProfile().y end,
                onChange = function(_, value) module:GetProfile().y = value module:ProfileChanged() end },
        },
    })
    local actions = page:FooterActions({ columns = 3 })
    actions:Button("preview", { action = "preview", text = "预览模式",
        getText = function() return module.previewMode and "取消预览" or "预览模式" end,
        onAction = function() module:SetPreview(not module.previewMode) end,
        onDeactivate = function() module:SetPreview(false) end })
    actions:Button("reset", { action = "resetPosition", text = "重置位置",
        onAction = function() module:ResetPosition() page:Refresh("reset") end })
    actions:Button("defaults", { action = "restoreDefaults", text = "恢复默认",
        onAction = function()
            page:ShowTextDialog({ title = "恢复距离监控默认设置", confirmLabel = "恢复默认",
                description = "仅恢复距离监控的外观和位置，不影响其他模块。",
                value = "此模块的显示选项将恢复默认。",
                onConfirm = function()
                    if module:ResetDefaults() == false then return false, "请脱离战斗后重试。" end
                    page:Refresh("defaults") return true
                end })
        end })
    page:Finish()
    return page
end
function Settings:Register(module)
    local system = ns.UI:GetSystem()
    local definition = {
        title = "距离监控", description = "独立显示当前目标距离区间，按距离分段着色。可用 /rsm 移动。", group = "qol", navigationOrder = 21,
        searchKeywords = { "距离监控", "目标", "无限" }, showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                out.available, out.mutable = true, true
                out.enabled = ns.Assembly:IsModuleEnabled("RangeMonitor")
                out.active, out.pending, out.reason = module:IsEnabled(), false, nil
                return out
            end,
            SetEnabled = function(value) return ns.Assembly:SetModuleEnabled("RangeMonitor", value == true) end,
        },
        build = function(context) return BuildPage(context, module) end,
        onHide = function() module:SetPreview(false) end,
    }
    ns.RangeMonitorPageDefinition = definition
    system:RegisterPage("range-monitor", definition)
end
ns.RangeMonitorSettings = Settings

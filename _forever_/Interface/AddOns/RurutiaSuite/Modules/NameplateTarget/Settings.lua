local _, ns = ...
if not ns.Build.HasModule("NameplateTarget") then return end
local Settings = {}
local function BuildPage(context, module)
    local page = assert(ns.UI:CreateSettingsPage(context, { id = "nameplate-target" }))
    module.settingsPage = page
    if page:GetPopover("appearance") then page:Refresh("reuse") return page end
    local section = page:Section("显示设置")
    section:QuadRow():Checkbox("classColor", { text = "职业颜色",
        tooltip = "目标是玩家时使用其职业颜色，其他目标显示白色。",
        getValue = function() return module:GetProfile().classColor end,
        onChange = function(_, value) module:GetProfile().classColor = value == true module:ProfileChanged() end })
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

    actions:Button("reset", { action = "resetPosition", text = "重置位置",
        onAction = function() module:ResetPosition() page:Refresh("reset") end })
    actions:Button("defaults", { action = "restoreDefaults", text = "恢复默认",
        onAction = function()
            page:ShowTextDialog({ title = "恢复姓名板目标默认设置", confirmLabel = "恢复默认",
                description = "仅恢复姓名板目标的外观和位置，不影响其他模块。",
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
        title = "姓名板目标", description = "在敌方姓名板右上方显示其当前目标名字，无目标时隐藏。", group = "qol", navigationOrder = 22,
        searchKeywords = { "姓名板目标", "目标", "无限" }, showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                out.available, out.mutable = true, true
                out.enabled = ns.Assembly:IsModuleEnabled("NameplateTarget")
                out.active, out.pending, out.reason = module:IsEnabled(), false, nil
                return out
            end,
            SetEnabled = function(value) return ns.Assembly:SetModuleEnabled("NameplateTarget", value == true) end,
        },
        build = function(context) return BuildPage(context, module) end,

    }
    ns.NameplateTargetPageDefinition = definition
    system:RegisterPage("nameplate-target", definition)
end
ns.NameplateTargetSettings = Settings

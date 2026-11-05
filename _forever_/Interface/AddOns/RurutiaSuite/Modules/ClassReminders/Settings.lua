-- 文件职责：职业提醒与通用文字提醒两个设置页；共享中心文字样式/位置入口。
-- 边界：按客户端能力装配；配置沿用旧namespace，运行资源由新版Runtime管理。
local _, ns = ...
if not ns.Build.HasModule("ClassReminders") then return end
local Settings = {}

local function CanEdit(module)
    return not module.adapter:IsInCombat()
end

local function PageSwitch(module, key)
    return {
        GetState = function(out)
            out.available, out.mutable = true, not module.adapter:IsInCombat()
            out.enabled = module.db.profile[key] ~= false
            out.active = module:IsEnabled() and out.enabled
            out.pending = false
            out.reason = not out.mutable and "战斗结束后可更改。" or nil
            return out
        end,
        SetEnabled = function(value) return module:SetPageEnabled(key, value) end,
    }
end

local function ShareSupportsFeast(adapter)
    return type(adapter.SupportsFeast) == "function" and adapter:SupportsFeast() == true
end

local function RegisterRestoreDefaults(page, module, key, title)
    local footer = page.footer or page:FooterActions()
    footer:Button("restoreDefaults", {
        action = "restoreDefaults", text = "恢复默认",
        getEnabled = function() return CanEdit(module) end,
        onAction = function()
            page:ShowTextDialog({
                title = "恢复" .. title .. "默认设置", confirmLabel = "恢复默认",
                description = "恢复本页提醒选项及页面开关。共享文字样式、位置和其他页面设置保持不变。",
                value = "确认后恢复本页默认提醒开关。", onConfirm = function()
                    if not module:RestorePageDefaults(key) then return false end
                    page:Refresh("defaults")
                    return true
                end,
            })
        end,
    })
end

local function BuildClassPage(context, module)
    if context.classReminderPage then
        context.classReminderPage:Refresh("show")
        return context.classReminderPage
    end
    local page = assert(ns.UI:CreateSettingsPage(context, { id = "classreminders" }))
    context.classReminderPage = page
    local shared = ns.CenterTextSettings.Build(page, module.adapter, { includeMove = true })
    if shared then shared.RegisterResetPosition({ columns = 1 }) end
    RegisterRestoreDefaults(page, module, "classEnabled", "职业提醒")
    local section = page:Section("职业提醒")
    local row = section:QuadRow()
    local options = module.adapter.settingOptions or {
        { "weapon", "主手附魔" },
        { "beacon", "道标提醒" },
    }
    for _, spec in ipairs(options) do
        local key = spec[1]
        if key ~= "feast" then
            row:Checkbox(key, {
                text = spec[2],
                value = module.db.profile[key],
                getValue = function() return module.db.profile[key] end,
                getEnabled = function() return CanEdit(module) end,
                onChange = function(control, value)
                    local ok = module:SetSetting(key, value)
                    if not ok then control:SetValue(module.db.profile[key], true) end
                    return ok
                end,
            })
        end
    end
    page:Finish()
    return page
end

local function BuildGeneralTextPage(context, module)
    if context.generalTextPage then
        context.generalTextPage:Refresh("show")
        return context.generalTextPage
    end
    local page = assert(ns.UI:CreateSettingsPage(context, { id = "general-text" }))
    context.generalTextPage = page
    local shared = ns.CenterTextSettings.Build(page, module.adapter, { includeMove = true })
    if shared then shared.RegisterResetPosition({ columns = 1 }) end
    RegisterRestoreDefaults(page, module, "generalEnabled", "通用文字提醒")
    local section = page:Section("通用文字提醒")
    section:QuadRow():Checkbox("feast", {
        text = "大餐提醒",
        tooltip = "检测并显示队伍中的大餐通告；仅在支持该能力的客户端可用。",
        value = module.db.profile.feast,
        getValue = function() return module.db.profile.feast end,
        getEnabled = function()
            return CanEdit(module) and ShareSupportsFeast(module.adapter)
        end,
        onChange = function(control, value)
            local ok = module:SetSetting("feast", value)
            if not ok then control:SetValue(module.db.profile.feast, true) end
            return ok
        end,
    })
    page:Finish()
    return page
end

function Settings:Refresh(context, module)
    if context and context.classReminderPage then
        context.classReminderPage:Refresh("show")
    end
    if context and context.generalTextPage then
        context.generalTextPage:Refresh("show")
    end
    return true
end

function Settings:Register(module)
    local classDefinition = {
        title = "职业提醒",
        group = "class",
        navigationOrder = 10,
        description = module.adapter.description or "骑士主手附魔与道标提醒。",
        searchKeywords = {
            "职业工具箱", "职业提醒", "Class", "奥术智慧", "霜甲术", "冰甲术", "魔甲术", "熔岩护甲", "护甲提醒",
            "主手附魔", "道标", "中心文字",
        },
        showInNavigation = true,
        navigationSwitch = PageSwitch(module, "classEnabled"),
        build = function(context) return BuildClassPage(context, module) end,
        onShow = function(context) Settings:Refresh(context, module) end,
        onRefresh = function(context) Settings:Refresh(context, module) end,
    }
    ns.ClassReminderPageDefinition = classDefinition

    local generalDefinition = {
        title = "通用文字提醒",
        group = "qol",
        navigationOrder = 90,
        description = "露露大餐等通用文字提醒，显示在共享中心文字组。",
        searchKeywords = { "通用文字提醒", "大餐", "大餐提醒", "中心文字", "体验优化" },
        showInNavigation = true,
        navigationSwitch = PageSwitch(module, "generalEnabled"),
        visible = function() return ShareSupportsFeast(module.adapter) end,
        build = function(context) return BuildGeneralTextPage(context, module) end,
        onShow = function(context) Settings:Refresh(context, module) end,
        onRefresh = function(context) Settings:Refresh(context, module) end,
    }
    ns.GeneralTextPageDefinition = generalDefinition

    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system then return false end
    self.classRegistered = system:RegisterPage("classreminders", classDefinition) and true or false
    self.generalRegistered = system:RegisterPage("general-text", generalDefinition) and true or false
    return self.classRegistered
end

ns.ClassReminderSettings = Settings

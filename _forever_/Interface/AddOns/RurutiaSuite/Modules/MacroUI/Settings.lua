-- 文件职责：注册 MacroUI 懒构建设置页；所有开关只保存下次 /reload 的意图。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("MacroUI")) then return end

local Settings = { pageId = "macroUI", registered = false }

local function BuildPage(context, module)
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then error("Unable to create MacroUI settings page: " .. tostring(reason), 2) end
    context.macroUISettingsPage = page
    if page:GetControl("macroUIEnabled") then
        Settings:Refresh(context, module)
        page:Refresh("reuse")
        return page
    end

    local profile = module:GetProfile()
    local conflicts = page:Section("第三方界面互斥")
    local policies = conflicts:TripleRow()
    policies:Checkbox("avoidNDui", {
        text = "与 NDui 互斥", value = profile.avoidNDui,
        tooltip = "加载 NDui 时不修改宏窗口；修改后需要 /reload。",
        onChange = function(_, value) module:SetConflictPolicy("avoidNDui", value) end,
    })
    policies:Checkbox("avoidElvUI", {
        text = "与 ElvUI 互斥", value = profile.avoidElvUI,
        tooltip = "加载 ElvUI 时不修改宏窗口；修改后需要 /reload。",
        onChange = function(_, value) module:SetConflictPolicy("avoidElvUI", value) end,
    })
    policies:Checkbox("avoidPig", {
        text = "与 Pig 互斥", value = profile.avoidPig,
        tooltip = "加载 Pig 工具箱时不修改宏窗口；修改后需要 /reload。",
        onChange = function(_, value) module:SetConflictPolicy("avoidPig", value) end,
    })

    page:Finish()
    return page
end

function Settings:Refresh(context, module)
    local page = context and context.macroUISettingsPage
    if not page then return false end
    local profile = module:GetProfile()
    local keys = { "avoidNDui", "avoidElvUI", "avoidPig" }
    local fields = { "avoidNDui", "avoidElvUI", "avoidPig" }
    local index
    for index = 1, #keys do
        local control = page:GetControl(keys[index])
        if control then control:SetValue(profile[fields[index]], true) end
    end
    return true
end

function Settings:Register(module)
    if self.registered then return true end
    local definition = {
        title = "宏界面增强",
        description = "配置暴雪原生宏窗口尺寸与第三方界面互斥。",
        group = "interface",
        navigationOrder = 60,
        searchKeywords = { "宏界面增强", "宏界面扩展", "宏界面拓展", "宏", "Macro", "NDui", "ElvUI", "PIG", "reload" },
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                out.available = true
                out.enabled = module:GetProfile().enabled == true
                out.mutable = true
                out.active = module:IsEnabled() and module.runtimeActive == true
                out.pending = module:IsReloadPending()
                out.reason = out.pending and "reload_required" or module.lastStatus
                return out
            end,
            SetEnabled = function(value)
                module:SetEnabled(value == true)
                return module:GetProfile().enabled == (value == true)
            end,
        },
        build = function(context) return BuildPage(context, module) end,
        onShow = function(context) return Settings:Refresh(context, module) end,
        onRefresh = function(context) return Settings:Refresh(context, module) end,
    }
    ns.MacroUIPageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("macroui", self.pageId)
        system:RegisterPageAlias("macro", self.pageId)
    end
    return self.registered
end

ns.MacroUISettings = Settings

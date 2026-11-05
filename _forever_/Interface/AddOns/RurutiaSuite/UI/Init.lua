local _, RS = ...
local UI = RS.UI

local System = {}
System.__index = System

UI.pendingSkinProviders = UI.pendingSkinProviders or {}
UI.pendingSkinProviderOrder = UI.pendingSkinProviderOrder or {}

local function CloseChangelog()
    local changelog = RS.Changelog
    if type(changelog) == "table" and type(changelog.Close) == "function" then
        changelog:Close()
    end
end

local function RequirePart(name)
    local value = UI[name]
    if type(value) ~= "table" then
        error("RurutiaSuite UI load order is missing " .. name)
    end
    return value
end

function System:RegisterPage(id, definition)
    return self.pages:Register(id, definition)
end

function System:UnregisterPage(id)
    local canonicalId = self.pages:ResolveId(id)
    if self.mainWindow and self.mainWindow.currentPage == canonicalId
        and self.mainWindow:IsOpen() then
        self.mainWindow:Close()
    end
    local removed = self.pages:Unregister(id)
    if removed and self.mainWindow and self.mainWindow:IsOpen() then
        self.mainWindow:RefreshNavigation()
    end
    return removed
end

function System:RegisterPageAlias(aliasId, pageId)
    return self.pages:RegisterAlias(aliasId, pageId)
end

function System:CreateSettingsPage(context, options)
    local allowed, combatReason = self:CheckSettingsCombat()
    if not allowed then return nil, combatReason end
    local ready, reason = self:EnsureSettings()
    if not ready then return nil, reason end
    self:RefreshSkinProvider("runtime", { reason = "create-settings-page" })
    return self.settingsBuilder:CreatePage(context, options)
end

function System:SettingsFailure(reason, message)
    self.lastSettingsError = tostring(reason)
    if type(RS.Print) == "function" then RS.Print(message) end
    return nil, self.lastSettingsError
end

function System:CheckSettingsCombat()
    local opened = self.mainWindow and self.mainWindow:GetFrame()
        or self.pages:GetDiagnostics().built > 0
    if not opened and type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return self:SettingsFailure("settings-combat-lockdown", "战斗中暂时无法首次打开设置，请脱离战斗后重试。")
    end
    return true
end

function System:EnsureSettings()
    if self.settingsBuilder and self.mainWindow and self.mainWindow:GetFrame() then
        self.lastSettingsError = nil
        return true
    end
    if self.settingsInitializing then
        return nil, "settings-initialize-in-progress"
    end
    -- These are lightweight service objects. New() allocates no frames/pages.
    -- Keep both available for existing module/RSS callers without another addon.
    self.settingsInitializing = true
    local ok, builder, window = pcall(function()
        local settings = self.settingsBuilder or assert(RequirePart("SettingsBuilder"):New(self))
        local main = self.mainWindow or assert(RequirePart("MainWindow"):New(self, self.settingsWindowOptions))
        local appearance = RS.Presentation and RS.Presentation.appearance
        if appearance and appearance.ui == self then
            local profile = RS.DB and RS.DB.profile
            local values = profile and profile.appearance
            main:SetBackgroundOpacity(tonumber(values and values.mainWindowOpacity) or 95)
            main:SetContainerOpacity(tonumber(values and values.containerOpacity) or 0)
        end
        return settings, main
    end)
    self.settingsInitializing = false
    if not ok then
        return self:SettingsFailure("settings-initialize-failed: " .. tostring(builder),
            "设置界面初始化失败，请再次打开重试；若仍失败，请输入 /reload 后重试并反馈问题。")
    end
    self.settingsBuilder, self.mainWindow = builder, window
    self.lastSettingsError = nil
    return true
end

function System:CreateCallout(owner, options)
    if not self.transientSurface then return nil, "TransientSurface is unavailable" end
    return self.transientSurface:CreateCallout(owner, options)
end

function System:CreateHoverMenu(owner, options)
    if not self.transientSurface then return nil, "TransientSurface is unavailable" end
    return self.transientSurface:CreateHoverMenu(owner, options)
end

function System:GetSettingsPage(context)
    return self.settingsBuilder and self.settingsBuilder:GetPage(context) or nil
end

function System:ResolvePageId(id)
    return self.pages:ResolveId(id)
end

function System:IsPageRegistered(id)
    return self.pages:IsRegistered(id)
end

function System:OpenMain(pageId, data)
    local allowed, combatReason = self:CheckSettingsCombat()
    if not allowed then return nil, combatReason end
    local ready, reason = self:EnsureSettings()
    if not ready then return nil, reason end
    CloseChangelog()
    self:RefreshSkinProvider("runtime", { reason = "open-main" })
    local window, selected = self.mainWindow:Open(pageId, data)
    if not window then
        return self:SettingsFailure("settings-open-failed: " .. tostring(selected),
            "设置窗口创建失败，请再次打开重试；若仍失败，请输入 /reload 后重试并反馈问题。")
    end
    self.lastSettingsError = nil
    return window, selected
end

function System:ToggleMain(pageId, data)
    if self.mainWindow and self.mainWindow:IsOpen() then
        self.mainWindow:Close()
        return false
    end
    local window, reason = self:OpenMain(pageId, data)
    if not window then return nil, reason end
    return true
end

function System:CloseMain()
    return self.mainWindow and self.mainWindow:Close() or false
end

function System:RefreshNavigationSwitch(id)
    if not self.mainWindow or not self.mainWindow:IsOpen() then return false end
    id = self.pages:ResolveId(id)
    if not id or not self.mainWindow.visiblePageSet[id] then return false end
    return self.mainWindow:RefreshNavigationSwitch(id) ~= nil
end

function System:RefreshNavigationSwitches()
    if not self.mainWindow or not self.mainWindow:IsOpen() then return false end
    return self.mainWindow:RefreshNavigationSwitches()
end

function System:OpenPage(id, parent, data)
    local allowed, combatReason = self:CheckSettingsCombat()
    if not allowed then return nil, combatReason end
    local ready, reason = self:EnsureSettings()
    if not ready then return nil, reason end
    self:RefreshSkinProvider("runtime", { reason = "open-page" })
    return self.pages:Open(id, parent, data)
end

function System:ClosePage(id)
    return self.pages:Close(id)
end

function System:Close()
    return self.pages:CloseActive()
end

function System:SelectSkinProvider(name)
    return self.providers:Select(name)
end

function System:SelectSkinProviderFor(contextKey, context)
    return self.providers:SelectFor(contextKey, context)
end

function System:RefreshSkinProvider(contextKey, context)
    contextKey = contextKey or "runtime"
    self.providers:Invalidate(contextKey)
    return self.providers:SelectFor(contextKey, context)
end

function UI:RegisterSkinProvider(name, provider, priority)
    if type(name) ~= "string" or name == "" or type(provider) ~= "table"
        or type(provider.Apply) ~= "function" then
        return false
    end
    if self.system then
        return self.system.providers:Register(name, provider, priority)
    end
    if self.pendingSkinProviders[name] == nil then
        self.pendingSkinProviderOrder[#self.pendingSkinProviderOrder + 1] = name
    end
    self.pendingSkinProviders[name] = {
        provider = provider,
        priority = tonumber(priority) or 0,
    }
    return true
end

function System:UpdateTheme(changes)
    return self.theme:UpdateTokens(changes)
end

function System:GetDiagnostics()
    return {
        components = self.components:GetDiagnostics(),
        layout = self.layout:GetDiagnostics(),
        pages = self.pages:GetDiagnostics(),
        providers = self.providers:GetDiagnostics(),
        theme = self.theme:GetDiagnostics(),
        mainWindow = self.mainWindow and self.mainWindow:GetDiagnostics() or { loaded = false },
        settingsBuilder = self.settingsBuilder and self.settingsBuilder:GetDiagnostics() or { loaded = false },
    }
end

function UI:CreateSystem(options)
    options = options or {}
    local Theme = RequirePart("Theme")
    local SkinProvider = RequirePart("SkinProvider")
    local Layout = RequirePart("Layout")
    local Components = RequirePart("Components")
    local PageRegistry = RequirePart("PageRegistry")
    local TransientSurface = UI.TransientSurface

    local system = setmetatable({}, System)
    system.theme = Theme:New({
        defaults = options.tokens,
        fontResolver = options.fontResolver,
    })
    system.providers = SkinProvider:New(system.theme)
    local index = 1
    while index <= #self.pendingSkinProviderOrder do
        local name = self.pendingSkinProviderOrder[index]
        local entry = self.pendingSkinProviders[name]
        if entry then system.providers:Register(name, entry.provider, entry.priority) end
        index = index + 1
    end
    system.providers:SelectFor("startup", options.skinContext or {})
    system.layout = Layout:New(system.theme)
    system.components = Components:New(system.theme, system.providers, {
        createFrame = options.createFrame,
    })
    if type(TransientSurface) == "table" and type(TransientSurface.New) == "function" then
        system.transientSurface = TransientSurface:New(system)
    end
    system.pages = PageRegistry:New(
        system.components,
        system.layout,
        system.theme,
        system.providers,
        system
    )
    system.settingsWindowOptions = {
        parent = options.mainParent,
        title = options.title,
        layout = options.mainWindowLayout,
    }
    -- Preserve the established service API; frames remain lazily created.
    -- A constructor failure does not break runtime activation and can be retried.
    system:EnsureSettings()
    return system
end

function UI:Initialize(options)
    if not self.system then
        self.system = self:CreateSystem(options)
    end
    return self.system
end

function UI:GetSystem()
    return self.system
end

function UI:CreateSettingsPage(context, options)
    local registry = type(context) == "table" and context.registry or nil
    local system = registry and registry.system or self:GetSystem()
    if not system or type(system.CreateSettingsPage) ~= "function" then
        return nil, "RurutiaSuite UI system is not initialized"
    end
    return system:CreateSettingsPage(context, options)
end

function UI:CreateCallout(owner, options)
    return self:Initialize():CreateCallout(owner, options)
end

function UI:CreateHoverMenu(owner, options)
    return self:Initialize():CreateHoverMenu(owner, options)
end


function UI:OpenMain(pageId, data)
    return self:Initialize():OpenMain(pageId, data)
end

function UI:ToggleMain(pageId, data)
    return self:Initialize():ToggleMain(pageId, data)
end

function UI:CloseMain()
    local system = self:GetSystem()
    return system and system:CloseMain() or false
end

function UI:RefreshNavigationSwitch(id)
    local system = self:GetSystem()
    return system and system:RefreshNavigationSwitch(id) or false
end

function UI:RefreshNavigationSwitches()
    local system = self:GetSystem()
    return system and system:RefreshNavigationSwitches() or false
end

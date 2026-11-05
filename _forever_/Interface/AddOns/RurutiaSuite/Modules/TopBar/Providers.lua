local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local Registry = { providers = {}, byID = {} }

local function CallBoolean(provider, method, ...)
    local callback = provider and provider[method]
    if type(callback) ~= "function" then return false end
    local ok, result = pcall(callback, provider, ...)
    return ok and result == true
end

function Registry:Register(provider)
    if type(provider) ~= "table" or type(provider.id) ~= "string" or provider.id == "" then
        error("TopBar provider requires a non-empty id", 2)
    end
    if ns.Integrations and not ns.Integrations:IsProviderAllowed(provider.id) then return nil end
    if self.byID[provider.id] ~= nil then error("Duplicate TopBar provider: " .. provider.id, 2) end
    provider.addonNames = provider.addonNames or {}
    self.providers[#self.providers + 1] = provider
    self.byID[provider.id] = provider
    return provider
end

function Registry:HasRuntimeConflict(module)
    local index
    for index = 1, #self.providers do
        if CallBoolean(self.providers[index], "HasRuntimeConflict", module) then return true end
    end
    return false
end

function Registry:ShouldHideMicroMenu(profile, module)
    local index
    for index = 1, #self.providers do
        if CallBoolean(self.providers[index], "ShouldHideMicroMenu", profile, module) then return true end
    end
    return false
end

function Registry:InstallRuntimeHooks(module)
    local installed = false
    local index
    for index = 1, #self.providers do
        if CallBoolean(self.providers[index], "InstallRuntimeHooks", module) then installed = true end
    end
    return installed
end

function Registry:ShouldRefreshForAddon(addonName)
    local index
    for index = 1, #self.providers do
        if self.providers[index].addonNames[addonName] == true then return true end
    end
    return false
end

ns.TopBarProviderRegistry = Registry

-- 文件职责：登记当前 Build 允许的 ExtraTools provider，并分发功能窄接口。
local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Registry = { providers = {}, byID = {} }

local function SafeCall(provider, method, ...)
    local callback = provider and provider[method]
    if type(callback) ~= "function" then return false, nil end
    local ok, result = pcall(callback, provider, ...)
    return ok, result
end

local function SortProviders(left, right)
    return (tonumber(left.priority) or 100) < (tonumber(right.priority) or 100)
end

function Registry:Register(provider)
    if type(provider) ~= "table" or type(provider.id) ~= "string" or provider.id == "" then
        error("ExtraTools provider requires a non-empty id", 2)
    end
    if ns.Integrations and not ns.Integrations:IsProviderAllowed(provider.id) then return nil end
    if self.byID[provider.id] ~= nil then error("Duplicate ExtraTools provider: " .. provider.id, 2) end
    provider.addonNames = provider.addonNames or {}
    self.providers[#self.providers + 1] = provider
    table.sort(self.providers, SortProviders)
    self.byID[provider.id] = provider
    return provider
end

-- Ownership is separate from an external menu's hide preference.
function Registry:IsMicroMenuOwned()
    for index = 1, #self.providers do
        local ok, owned = SafeCall(self.providers[index], "IsMicroMenuOwned")
        if ok and owned == true then return true end
    end
    return false
end

function Registry:IsMicroMenuConfiguredHidden()
    local index
    for index = 1, #self.providers do
        local ok, hidden = SafeCall(self.providers[index], "IsMicroMenuConfiguredHidden")
        if ok and hidden == true then return true end
    end
    return false
end

-- Bounded provider lookup, used only by Classic's automatic menu default.
function Registry:IsActionBarEnabled()
    for index = 1, #self.providers do
        local ok, enabled = SafeCall(self.providers[index], "IsActionBarEnabled")
        if ok and enabled == true then return true end
    end
    return false
end

function Registry:GetPreferredLFGProvider(profile)
    local index
    for index = 1, #self.providers do
        local provider = self.providers[index]
        local ok, preferred = SafeCall(provider, "IsPreferredLFGProvider", profile)
        if ok and preferred == true then return provider end
    end
    return nil
end

function Registry:HasAltPowerOwner()
    local index
    for index = 1, #self.providers do
        local ok, owned = SafeCall(self.providers[index], "HasAltPowerOwner")
        if ok and owned == true then return true end
    end
    return false
end

-- 快速拾取占用只由 Integrations 判定：Adapter 和业务模块都不认识第三方插件名。
-- 返回占用者描述（含面向玩家的处理建议），没有占用时返回 nil。
function Registry:GetFastLootOwner()
    local index
    for index = 1, #self.providers do
        local provider = self.providers[index]
        local ok, owned = SafeCall(provider, "IsFastLootOwner")
        if ok and owned == true then
            return {
                id = provider.id,
                addon = provider.fastLootAddon or provider.id,
                label = provider.fastLootLabel or provider.fastLootAddon or provider.id,
                action = provider.fastLootAction,
            }
        end
    end
    return nil
end

-- 迟加载的第三方快速拾取插件需要重新判定占用；插件名只由 Integrations 声明。
function Registry:HandlesFastLootAddon(addonName)
    local index
    for index = 1, #self.providers do
        local provider = self.providers[index]
        if provider.fastLootAddon ~= nil and provider.addonNames[addonName] == true then
            return true
        end
    end
    return false
end

function Registry:ApplyUpdateBlockers(module)
    local applied = false
    local index
    for index = 1, #self.providers do
        local ok, result = SafeCall(self.providers[index], "ApplyUpdateBlocker", module)
        if ok and result == true then applied = true end
    end
    return applied
end

function Registry:RestoreUpdateBlockers(module)
    local restored = false
    local index
    for index = 1, #self.providers do
        local ok, result = SafeCall(self.providers[index], "RestoreUpdateBlocker", module)
        if ok and result == true then restored = true end
    end
    return restored
end

function Registry:MatchesUpdateNotice(text)
    local index
    for index = 1, #self.providers do
        local ok, matched = SafeCall(self.providers[index], "MatchesUpdateNotice", text)
        if ok and matched == true then return true end
    end
    return false
end

function Registry:ShouldBlockUpdatePopup(which, text)
    local index
    for index = 1, #self.providers do
        local ok, blocked = SafeCall(self.providers[index], "ShouldBlockUpdatePopup", which, text)
        if ok and blocked == true then return true end
    end
    return false
end

function Registry:OwnsMerchantLayout()
    local index
    for index = 1, #self.providers do
        local ok, owned = SafeCall(self.providers[index], "OwnsMerchantLayout")
        if ok and owned == true then return true end
    end
    return false
end

-- Third-party merchant skins: a provider that skins the stock tiles can also
-- paint the extra tiles added by the merchant expansion.
function Registry:RegisterMerchantSkin(callback)
    local registered = false
    local index
    for index = 1, #self.providers do
        local ok, result = SafeCall(self.providers[index], "RegisterMerchantSkin", callback)
        if ok and result == true then registered = true end
    end
    return registered
end

function Registry:IsMerchantSkinActive()
    local index
    for index = 1, #self.providers do
        local ok, active = SafeCall(self.providers[index], "IsMerchantSkinActive")
        if ok and active == true then return true end
    end
    return false
end

-- 已有同类插件在给已学配方染色时，RS 让位，避免重复处理同一批格子。
function Registry:OwnsKnownRecipeTint()
    local index
    for index = 1, #self.providers do
        local ok, owned = SafeCall(self.providers[index], "OwnsKnownRecipeTint")
        if ok and owned == true then return true end
    end
    return false
end

function Registry:ShouldRefreshForAddon(addonName)
    local index
    for index = 1, #self.providers do
        if self.providers[index].addonNames[addonName] == true then return true end
    end
    return false
end

function Registry:HandleAddonLoaded(module, addonName)
    local handled = false
    local index
    for index = 1, #self.providers do
        local provider = self.providers[index]
        if provider.addonNames[addonName] == true then
            local ok, result = SafeCall(provider, "OnAddonLoaded", module, addonName)
            if ok and result ~= false then handled = true end
        end
    end
    return handled
end

ns.ExtraToolsProviderRegistry = Registry

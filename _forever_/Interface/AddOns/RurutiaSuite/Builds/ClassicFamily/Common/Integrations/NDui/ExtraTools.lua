local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("ndui") then return end

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Registry = ns.ExtraToolsProviderRegistry
if type(Registry) ~= "table" then error("ExtraTools Providers.lua must load before NDui integration", 2) end

local function IsLoaded()
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback("NDui") and true or false
end

local function GetActiveProfile()
    if not IsLoaded() then return nil end
    local index = 1
    local account = _G.NDuiADB
    local player = type(_G.UnitName) == "function" and _G.UnitName("player") or nil
    local realm = type(_G.GetRealmName) == "function" and _G.GetRealmName() or nil
    local fullName = player and realm and (player .. "-" .. realm) or nil
    if fullName and type(account) == "table" and type(account.ProfileIndex) == "table" then
        index = tonumber(account.ProfileIndex[fullName]) or 1
    end
    if index == 1 then return _G.NDuiDB end
    return type(_G.NDuiPDB) == "table" and _G.NDuiPDB[index - 1] or nil
end

Registry:Register({
    id = "ndui",
    priority = 10,
    addonNames = { NDui = true },
    fastLootAddon = "NDui",
    fastLootLabel = "NDui",
    fastLootAction = "关闭它的自动拾取加速选项，重载界面后再核对",
    -- NDui 自身带有自动拾取加速；只按插件加载保守暂停，不读它的配置。
    IsFastLootOwner = function() return IsLoaded() end,
    IsActionBarEnabled = function()
        if not IsLoaded() then return false end
        local config = type(_G.NDui) == "table" and _G.NDui[2] or nil
        local profile = config and config.db or GetActiveProfile()
        local actionbar = profile and profile.Actionbar
        return actionbar ~= nil and actionbar.Enable == true
    end,
    IsMicroMenuOwned = function()
        if not IsLoaded() then return false end
        local config = type(_G.NDui) == "table" and _G.NDui[2] or nil
        local profile = config and config.db or GetActiveProfile()
        local actionbar = profile and profile.Actionbar
        return actionbar ~= nil and actionbar.Enable == true and actionbar.MicroMenu == true
    end,
    IsMicroMenuConfiguredHidden = function()
        local profile = GetActiveProfile()
        local actionbar = profile and profile.Actionbar
        return actionbar ~= nil and actionbar.Enable == true and actionbar.MicroMenu == false
    end,
    IsPreferredLFGProvider = function(_, profile)
        return profile and profile.useNDuiPosition == true and IsLoaded()
    end,
    GetLFGPosition = function(_, profile) return profile.nduiX, profile.nduiY end,
    SetLFGPosition = function(_, profile, x, y) profile.nduiX, profile.nduiY = x, y end,
    ResetLFGPosition = function(_, profile, defaults)
        profile.nduiX, profile.nduiY = defaults.nduiX, defaults.nduiY
    end,
    OnAddonLoaded = function(_, module)
        module:ApplyBlizzardMicroMenuVisibility()
        module:QueueUpdateLFGTools()
        return true
    end,
})

local _, ns = ...
if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.GetID
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

if ns.Build.GetID() == "classic-infinite" then
    -- Seed the native option once per RS profile; later choices belong to Elles.
    local integration = {}
    ns.EllesmereKeyringOption = integration

    function integration:GetProfile()
        local eui = _G.EllesmereUI
        local db = eui and eui._bagsDB
        return db and db.profile
    end

    function integration:IsAvailable()
        local profile = self:GetProfile()
        return profile ~= nil and profile.bagShowKeyringIcon ~= nil
    end

    function integration:Set(module, enabled)
        if not module.runtimeActive or module.adapter:IsInCombat() or not self:IsAvailable() then return false end
        self:GetProfile().bagShowKeyringIcon = enabled == true
        module:GetProfile().ellesmereKeyringInitialized = true
        local bags = _G.EUI_Bags
        if bags and bags.SyncHeaderIcons then bags:SyncHeaderIcons() end
        return true
    end

    function integration:Sync(module)
        if not module.runtimeActive or (type(_G.IsLoggedIn) == "function" and not _G.IsLoggedIn()) then return end
        if module:GetProfile().ellesmereKeyringInitialized then return end
        self:Set(module, true)
    end

    table.insert(ns.ExtraToolsProviderRegistry.junkSaleOwners, function()
        local merchant = _G.EUI_MerchantHandler
        local db = _G.EllesmereUIDB
        return merchant and merchant.IsEventRegistered and merchant:IsEventRegistered("MERCHANT_SHOW")
            and type(db) == "table" and db.autoSellJunk ~= false
    end)
    return
end

local Registry = ns.ExtraToolsProviderRegistry
if type(Registry) ~= "table" then error("ExtraTools Providers.lua must load before EllesmereUI integration", 2) end

local function IsLoaded(name)
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback(name) and true or false
end

Registry:Register({
    id = "ellesmereui-actionbars",
    priority = 30,
    addonNames = { EllesmereUI = true, EllesmereUIActionBars = true },
    IsActionBarEnabled = function()
        if not IsLoaded("EllesmereUI") or not IsLoaded("EllesmereUIActionBars") then return false end
        -- The suite's action-bar switch enables/disables this separate addon.
        -- A disabled addon may remain loaded until reload; respect that choice.
        local addons = _G.C_AddOns
        local getState = addons and addons.GetAddOnEnableState
        if type(getState) == "function" and getState("EllesmereUIActionBars") == 0 then return false end
        local core = _G.EllesmereUI
        local lite = type(core) == "table" and core.Lite or nil
        if type(lite) == "table" and type(lite.GetAddon) == "function" then
            local actionbars = lite.GetAddon("EllesmereUIActionBars", true)
            if actionbars then return actionbars.enabledState == true end
        end
        return true
    end,
})

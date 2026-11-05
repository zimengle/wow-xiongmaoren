local _, ns = ...
if not (ns.Build and ns.Build.GetID and ns.Build.GetID() == "classic-infinite"
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Registry = ns.ExtraToolsProviderRegistry
if type(Registry) ~= "table" then error("ExtraTools Providers.lua must load before AlreadyKnown integration", 2) end

local function IsLoaded()
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback("AlreadyKnown") and true or false
end

-- 玩家自己装了 Already Known? 时由它负责染色；它没有可读的运行开关，按已加载让位。
Registry:Register({
    id = "alreadyknown",
    priority = 40,
    addonNames = { AlreadyKnown = true },
    OwnsKnownRecipeTint = function() return IsLoaded() end,
})

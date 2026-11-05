local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("elvui") then return end

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")
    and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local Registry = ns.TopBarProviderRegistry
if type(Registry) ~= "table" then error("TopBar Providers.lua must load before ElvUI integration", 2) end

local function IsLoaded(name)
    local compat = ns.Compat
    if compat and type(compat.IsAddOnLoaded) == "function" then return compat.IsAddOnLoaded(name) end
    local addons = _G.C_AddOns
    return addons and type(addons.IsAddOnLoaded) == "function" and addons.IsAddOnLoaded(name) and true or false
end

local function GetEngine()
    return type(_G.ElvUI) == "table" and _G.ElvUI[1] or nil
end

local function IsGameBarEnabled()
    if not IsLoaded("ElvUI_WindTools") then return false end
    local engine = GetEngine()
    local db = engine and engine.db
    local windTools = db and db.WT
    local gameBar = windTools and (windTools.gameBar or windTools.gamebar)
    return gameBar and gameBar.enable ~= false or false
end

local function GetGameBar()
    local engine = GetEngine()
    local windTools = engine and type(engine.GetModule) == "function" and engine:GetModule("WindTools", true)
    return windTools and type(windTools.GetModule) == "function" and windTools:GetModule("Game Bar", true) or nil
end

Registry:Register({
    id = "elvui",
    addonNames = { ElvUI = true, ElvUI_WindTools = true },
    HasRuntimeConflict = function() return false end,
    ShouldHideMicroMenu = function(_, profile)
        local menu = profile and profile.micromenu
        return menu and menu.disableWhenWindToolsGameBar ~= false and IsGameBarEnabled() or false
    end,
    InstallRuntimeHooks = function(_, module)
        local gameBar = GetGameBar()
        if not (gameBar and type(gameBar.UpdateModule) == "function") then return false end
        module:HookSecureFunction(gameBar, "UpdateModule", module.OnExternalBarRefresh,
            "TopBar external game bar")
        return true
    end,
})

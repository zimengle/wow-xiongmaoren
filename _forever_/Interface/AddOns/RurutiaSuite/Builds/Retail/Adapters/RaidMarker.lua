local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and (ns.Build.IsFamily("retail")
        or ns.Build.GetCapability("raidMarkerStyle") == "retail")
    and ns.Build.HasModule and ns.Build.HasModule("RaidMarker")) then return end

local ATTRIBUTE_KEYS = {
    "type1", "type2", "type3",
    "macrotext1", "macrotext2", "macrotext3",
    "action1", "action2", "action3",
    "unit1", "unit2", "unit3",
    "marker1", "marker2", "marker3",
    "shift-type1", "shift-macrotext1", "shift-action1",
    "shift-unit1", "shift-marker1",
}

local CONFLICT_ADDONS = { "ElvUI_WindTools" }

local POLICY = {
    pullMinimum = 3,
    pullMaximum = 30,
    supportsReverseOrder = false,
    supportsMiddleSettings = false,
    reserveSideSpaceWhenDisabled = false,
    conflictLabel = "与 WindTools 互斥",
    conflictTooltip = "检测到 ElvUI_WindTools 加载时，自动禁用顶部组件",
}

local Adapter = {
    family = ns.Build.GetFamily(),
    buildId = ns.Build.GetID(),
}

local function SafeMethod(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return false end
    return pcall(callback, target, ...)
end

local function ResetAttributes(button)
    local index
    for index = 1, #ATTRIBUTE_KEYS do
        if not SafeMethod(button, "SetAttribute", ATTRIBUTE_KEYS[index], nil) then return false end
    end
    return true
end

local function SetAttribute(button, key, value)
    return SafeMethod(button, "SetAttribute", key, value)
end

function Adapter:GetPolicy()
    return POLICY
end

function Adapter:IsAvailable()
    return true
end

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Adapter:GetRootFrame()
    return _G.UIParent
end

function Adapter:GetTooltip()
    return _G.GameTooltip
end

function Adapter:HasTarget()
    return type(_G.UnitExists) == "function" and _G.UnitExists("target") and true or false
end

function Adapter:IsInGroup()
    return type(_G.IsInGroup) == "function" and _G.IsInGroup() and true or false
end

function Adapter:IsPetBattleActive()
    local petBattles = _G.C_PetBattles
    return petBattles and type(petBattles.IsInBattle) == "function"
        and petBattles.IsInBattle() and true or false
end

function Adapter:IsConflictAddon(addonName)
    return addonName == CONFLICT_ADDONS[1]
end

function Adapter:HasSimilarAddon()
    local compat = ns.Compat
    local isLoaded = compat and compat.IsAddOnLoaded
    if type(isLoaded) ~= "function" then return false end
    return isLoaded(CONFLICT_ADDONS[1]) and true or false
end

function Adapter:GetMarker(markers, index)
    return markers[index]
end

function Adapter:HasWorldMarkers()
    return true
end

function Adapter:IsTargetOnlyClear()
    return false
end

function Adapter:RegisterSecureClicks(button)
    if self:IsInCombat() or not button or type(button.RegisterForClicks) ~= "function" then
        return false
    end
    -- Keep one hardware phase, matching the secure handler's CVar policy.
    -- Fixed AnyDown silently drops actions for players using key-up casting.
    local compat = ns.Compat
    if not compat or type(compat.GetActionButtonUseKeyDown) ~= "function" then return false end
    local useOnKeyDown = compat.GetActionButtonUseKeyDown()
    if not SetAttribute(button, "useOnKeyDown", useOnKeyDown) then return false end
    local ok = pcall(button.RegisterForClicks, button, useOnKeyDown and "AnyDown" or "AnyUp")
    return ok and true or false
end

function Adapter:SyncSecureClick(button)
    return self:RegisterSecureClicks(button)
end

function Adapter:ShouldSyncSecureClicks()
    return true
end

function Adapter:IsSecureClickCVar(cvarName)
    return type(cvarName) == "string" and cvarName:lower() == "actionbuttonusekeydown"
end

function Adapter:ApplyMarkerAttributes(button, marker)
    if self:IsInCombat() or not ResetAttributes(button) then return false end
    return SetAttribute(button, "type1", "raidtarget")
        and SetAttribute(button, "action1", "toggle")
        and SetAttribute(button, "marker1", marker.id)
        and SetAttribute(button, "unit1", "target")
        and SetAttribute(button, "type2", "worldmarker")
        and SetAttribute(button, "action2", "toggle")
        and SetAttribute(button, "marker2", marker.worldId)
        and SetAttribute(button, "type3", "worldmarker")
        and SetAttribute(button, "action3", "clear")
        and SetAttribute(button, "marker3", marker.worldId)
        and SetAttribute(button, "shift-type1", "raidtarget")
        and SetAttribute(button, "shift-action1", "clear-all")
        and SetAttribute(button, "shift-unit1", "target")
end

function Adapter:ApplySideButtonAttributes(button, info, profile)
    if self:IsInCombat() or not ResetAttributes(button) then return false end
    if info.key == "pull" then
        -- Avoid /cd: third-party cooldown settings can register that alias.
        return SetAttribute(button, "type1", "macro")
            and SetAttribute(button, "macrotext1", "/countdown " .. (profile.pullCountdown or 10))
            and SetAttribute(button, "type2", "macro")
            and SetAttribute(button, "macrotext2", "/countdown 0")
    end
    if info.key == "clear" then
        return SetAttribute(button, "type1", "raidtarget")
            and SetAttribute(button, "action1", "clear-all")
            and SetAttribute(button, "type2", "worldmarker")
            and SetAttribute(button, "action2", "clear")
    end
    return SetAttribute(button, "type1", "macro")
        and SetAttribute(button, "macrotext1", info.macro1)
        and (not info.macro2
            or (SetAttribute(button, "type2", "macro")
                and SetAttribute(button, "macrotext2", info.macro2)))
end

function Adapter:ShouldClampToScreen()
    return true
end

function Adapter:GetTopSnapPosition()
    return nil
end

function Adapter:SupportsNudge()
    return true
end

function Adapter:ShouldShowBarOnUnlock()
    return true
end

function Adapter:GetFontPath()
    if ns.Font and type(ns.Font.GetInterfaceFontPath) == "function" then
        return ns.Font:GetInterfaceFontPath()
    end
    return "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
end

function Adapter:MigrateProfile(profile, defaults)
    -- Database defaults are merged before module Initialize.  A legacy `alpha`
    -- value therefore has to win even when the merge already materialized the
    -- new alphaWithTarget default.
    if profile.alpha ~= nil then
        profile.alphaWithTarget = profile.alpha
    elseif profile.alphaWithTarget == nil then
        profile.alphaWithTarget = defaults.alphaWithTarget
    end
    if profile.alphaNoTarget == nil then profile.alphaNoTarget = defaults.alphaNoTarget end
    if profile.sideButtonGap == nil then profile.sideButtonGap = defaults.sideButtonGap end
    if profile.sideButtonsEnabled == nil then profile.sideButtonsEnabled = defaults.sideButtonsEnabled end
    if profile.sideButtonXOffset == nil or profile.sideButtonXOffset == 20 then
        profile.sideButtonXOffset = defaults.sideButtonXOffset
    end
    if profile.pullCountdown == nil then profile.pullCountdown = defaults.pullCountdown end
    if profile.disableWhenWindTools ~= nil then
        profile.disableWhenSimilarAddon = profile.disableWhenWindTools and true or false
        profile.disableWhenWindTools = nil
    elseif profile.disableOnWindTools ~= nil then
        profile.disableWhenSimilarAddon = profile.disableOnWindTools and true or false
        profile.disableOnWindTools = nil
    elseif profile.disableWhenSimilarAddon == nil then
        profile.disableWhenSimilarAddon = defaults.disableWhenSimilarAddon
    end
    return true
end

ns.RaidMarkerAdapter = Adapter
ns.RaidMarkerRetailAdapter = Adapter

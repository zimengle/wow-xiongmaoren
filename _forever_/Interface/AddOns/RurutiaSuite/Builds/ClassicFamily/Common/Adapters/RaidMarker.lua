local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.GetCapability("raidMarkerStyle") ~= "retail"
    and ns.Build.HasModule and ns.Build.HasModule("RaidMarker")) then return end

local ATTRIBUTE_KEYS = {
    "type1", "type2", "type3",
    "macrotext1", "macrotext2", "macrotext3",
    "action1", "action2", "action3",
    "unit1", "unit2", "unit3",
    "marker1", "marker2", "marker3",
    "shift-type1", "shift-macrotext1",
}

local CONFLICT_ADDONS = { "ElvUI", "NDui" }
local BUILD_ID = ns.Build.GetID()
-- Use the full command on every client to avoid third-party /cd aliases.
local PULL_COMMAND = "/countdown"
local HAS_WORLD_MARKERS = ns.Build.GetCapability("worldMarkers", false) == true
local USE_MACRO_CLEAR = ns.Build.GetCapability("macroTargetMarkerClear", false) == true

local POLICY = {
    pullMinimum = 1,
    pullMaximum = 180,
    supportsReverseOrder = true,
    supportsMiddleSettings = true,
    reserveSideSpaceWhenDisabled = true,
    conflictLabel = "与 ElvUI/NDui 互斥",
    conflictTooltip = "检测到同类插件（ElvUI/NDui）加载时，自动禁用标记栏",
}

local Adapter = {
    family = "classic",
    buildId = BUILD_ID,
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
    local compat = ns.Compat
    return compat and type(compat.RegisterThreeButtonSecureClicks) == "function"
        and type(compat.SyncSecureClickUseOnKeyDown) == "function" or false
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
    return addonName == CONFLICT_ADDONS[1] or addonName == CONFLICT_ADDONS[2]
end

function Adapter:HasSimilarAddon()
    local compat = ns.Compat
    local isLoaded = compat and compat.IsAddOnLoaded
    if type(isLoaded) ~= "function" then return false end
    local index
    for index = 1, #CONFLICT_ADDONS do
        if isLoaded(CONFLICT_ADDONS[index]) then return true end
    end
    return false
end

function Adapter:GetMarker(markers, index, profile)
    if profile and profile.reverseOrder then
        return markers[#markers - index + 1]
    end
    return markers[index]
end

function Adapter:HasWorldMarkers()
    return HAS_WORLD_MARKERS
end

function Adapter:IsTargetOnlyClear()
    return USE_MACRO_CLEAR
end

function Adapter:RegisterSecureClicks(button)
    if self:IsInCombat() then return false end
    local compat = ns.Compat
    local register = compat and compat.RegisterThreeButtonSecureClicks
    if type(register) ~= "function" then return false end
    local ok, result = pcall(register, button)
    return ok and result ~= false
end

function Adapter:SyncSecureClick(button)
    if self:IsInCombat() then return false end
    local compat = ns.Compat
    local sync = compat and compat.SyncSecureClickUseOnKeyDown
    if type(sync) ~= "function" then return false end
    local ok, result = pcall(sync, button)
    return ok and result ~= false
end

function Adapter:ShouldSyncSecureClicks()
    return true
end

function Adapter:IsSecureClickCVar(cvarName)
    return cvarName == "ActionButtonUseKeyDown"
end

function Adapter:ApplyMarkerAttributes(button, marker)
    if self:IsInCombat() or not ResetAttributes(button) then return false end
    local configured = SetAttribute(button, "type1", "macro")
        and SetAttribute(button, "macrotext1", "/tm " .. marker.id)
        and SetAttribute(button, "shift-type1", "macro")
        and SetAttribute(button, "shift-macrotext1", "/tm 0")
    if configured and HAS_WORLD_MARKERS then
        configured = SetAttribute(button, "type2", "macro")
            and SetAttribute(button, "macrotext2", "/wm " .. marker.worldId)
            and SetAttribute(button, "type3", "macro")
            and SetAttribute(button, "macrotext3", "/cwm " .. marker.worldId)
    end
    return configured
end

function Adapter:ApplySideButtonAttributes(button, info, profile)
    if self:IsInCombat() or not ResetAttributes(button) then return false end
    if info.key == "pull" then
        return SetAttribute(button, "type1", "macro")
            and SetAttribute(button, "macrotext1", PULL_COMMAND .. " " .. (profile.pullCountdown or 10))
            and SetAttribute(button, "type2", "macro")
            and SetAttribute(button, "macrotext2", PULL_COMMAND .. " 0")
            and SetAttribute(button, "type3", "macro")
            and SetAttribute(button, "macrotext3", "/run RurutiaSuite:ShowMainFrame('raidMarker')")
    end
    if info.key == "clear" then
        local configured
        if USE_MACRO_CLEAR then
            configured = SetAttribute(button, "type1", "macro")
                and SetAttribute(button, "macrotext1", "/tm 0")
        else
            configured = SetAttribute(button, "type1", "raidtarget")
                and SetAttribute(button, "action1", "clear-all")
                and SetAttribute(button, "unit1", "target")
                and SetAttribute(button, "marker1", 1)
        end
        if configured and HAS_WORLD_MARKERS then
            configured = SetAttribute(button, "type2", "worldmarker")
                and SetAttribute(button, "action2", "clear")
        end
        return configured
    end
    return SetAttribute(button, "type1", "macro")
        and SetAttribute(button, "macrotext1", info.macro1)
        and (not info.macro2
            or (SetAttribute(button, "type2", "macro")
                and SetAttribute(button, "macrotext2", info.macro2)))
end

function Adapter:ShouldClampToScreen()
    if type(ns.IsOffscreenDragEnabled) == "function" then
        return not ns:IsOffscreenDragEnabled()
    end
    return true
end

function Adapter:GetTopSnapPosition(frame, threshold)
    local root = self:GetRootFrame()
    if not frame or not root then return nil end
    threshold = tonumber(threshold) or 24
    local frameTop = type(frame.GetTop) == "function" and frame:GetTop() or nil
    local frameCenterX = type(frame.GetCenter) == "function" and frame:GetCenter() or nil
    local rootTop = type(root.GetTop) == "function" and root:GetTop() or nil
    local rootCenterX = type(root.GetCenter) == "function" and root:GetCenter() or nil
    if not frameTop or not frameCenterX or not rootTop or not rootCenterX then return nil end
    if math.abs(rootTop - frameTop) > threshold then return nil end
    return {
        point = "TOP",
        relativePoint = "TOP",
        x = frameCenterX - rootCenterX,
        y = frameTop - rootTop,
    }
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

function Adapter:MigrateProfile()
    return false
end

ns.RaidMarkerAdapter = Adapter
ns.RaidMarkerClassicAdapter = Adapter

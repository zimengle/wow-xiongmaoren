local _, ns = ...

if not (ns.Build and ns.Build.Is and ns.Build.Is("classic-infinite")) then return end

local Adapter = { family = "classic" }

Adapter.timerDefaults = { x = 0, y = 30, anchorToPlayer = true }

local PLAYER_FRAMES = { "EllesmereUIUnitFrames_Player", "oUF_Player", "ElvUF_Player" }

function Adapter:GetPlayerFrame()
    for index = 1, #PLAYER_FRAMES do
        local frame = _G[PLAYER_FRAMES[index]]
        if frame and type(frame.IsShown) == "function" and frame:IsShown() then return frame end
    end
    return _G.PlayerFrame or self:GetRootFrame()
end

function Adapter:GetTimerAnchorTarget(profile)
    if profile.anchorToPlayer then
        return self:GetPlayerFrame()
    end
    return self:GetRootFrame()
end

function Adapter:MigrateTimerPosition(profile)
    if profile.positionVersion == 1 then return end
    local x, y = rawget(profile, "x"), rawget(profile, "y")
    -- Preserve saved custom screen positions; omitted/default coordinates adopt
    -- the new player-frame anchor without writing the user's SavedVariables file.
    if (x == nil or x == -190) and (y == nil or y == -110) then
        profile.x, profile.y = 0, 30
        profile.anchorToPlayer = true
    elseif x ~= nil or y ~= nil then
        profile.x, profile.y = x or -190, y or -110
        profile.anchorToPlayer = false
    end
    profile.positionVersion = 1
end

local function NativeOffsetX(target)
    return target == _G.PlayerFrame and -20 or 0
end

function Adapter:ApplyTimerAnchor(frame, profile)
    if profile.anchorToPlayer then
        local target = self:GetPlayerFrame()
        frame:SetPoint("BOTTOMRIGHT", target, "TOPRIGHT", profile.x + NativeOffsetX(target) + 3, profile.y - 25)
    else
        frame:SetPoint("CENTER", self:GetRootFrame(), "CENTER", profile.x, profile.y)
    end
end

function Adapter:GetTimerPositionOffset(frame, profile)
    if not profile.anchorToPlayer then return nil end
    local target = self:GetPlayerFrame()
    local right, bottom = frame:GetRight(), frame:GetBottom()
    local targetRight, targetTop = target:GetRight(), target:GetTop()
    if not right or not bottom or not targetRight or not targetTop then return profile.x, profile.y end
    local scale = target:GetEffectiveScale() / frame:GetEffectiveScale()
    return right - targetRight * scale - NativeOffsetX(target) - 3, bottom - targetTop * scale + 25
end

function Adapter:GetRootFrame()
    return _G.UIParent
end

function Adapter:GetTime()
    return type(_G.GetTime) == "function" and _G.GetTime() or 0
end

function Adapter:IsInCombatLockdown()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Adapter:IsPlayerInCombat()
    return type(_G.UnitAffectingCombat) == "function" and _G.UnitAffectingCombat("player") and true or false
end

function Adapter:GetAlertFontPath()
    if ns.Font and type(ns.Font.GetFontPath) == "function" then return ns.Font:GetFontPath() end
    return "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
end

function Adapter:GetTimerFontPath()
    if ns.Font and type(ns.Font.GetCombatTimerFontPath) == "function" then
        return ns.Font:GetCombatTimerFontPath()
    end
    return self:GetAlertFontPath()
end

function Adapter:ApplyFont(fontString, path, size, flags)
    if ns.Font and type(ns.Font.ApplyFontString) == "function" then
        return ns.Font:ApplyFontString(fontString, path, size, flags)
    end
    if fontString and type(fontString.SetFont) == "function" then
        return fontString:SetFont(path, size, flags) ~= false
    end
    return false
end

ns.CombatReminderAdapter = Adapter

-- Register with the existing global move controls; the shared view owns overlays.
ns:RegisterMoveProvider({
    name = "CombatReminder",
    reset = "ResetPositions",
    isMovable = function(module)
        if not module or not module:IsEnabled() then return false end
        local profile = module:GetProfile()
        return profile and ((profile.alert and profile.alert.enabled == true)
            or (profile.timer and profile.timer.enabled == true)) or false
    end,
})

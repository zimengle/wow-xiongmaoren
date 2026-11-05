local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")) then return end

local Adapter = { family = "retail", timerDefaults = { x = -186, y = -104 } }

function Adapter:GetRootFrame()
    return _G.UIParent
end

function Adapter:GetTimerAnchorTarget(profile)
    return self:GetRootFrame()
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

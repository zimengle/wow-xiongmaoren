local _, ns = ...
if not (ns.Build and ns.Build.HasModule("SwingTimerPolicy")) then return end

local Adapter = { cvarName = "showSwingTimer", events = { ADDON_LOADED = true } }
local DEFAULTS = { WARRIOR = true, ROGUE = true, HUNTER = true,
    MAGE = false, WARLOCK = false, PRIEST = false }

function Adapter:GetValue()
    local api = _G.C_CVar
    local getter = api and api.GetCVar or _G.GetCVar
    if type(getter) ~= "function" then return nil end
    local ok, value = pcall(getter, self.cvarName)
    if ok and (value == "0" or value == "1") then return value end
    return nil
end

function Adapter:IsSupported()
    local api = _G.C_CVar
    return self:GetValue() ~= nil and type(api and api.SetCVar or _G.SetCVar) == "function"
end

function Adapter:SetValue(value)
    if value ~= "0" and value ~= "1" then return false end
    if not self:IsSupported() or self:IsInCombat() then return false end
    local api = _G.C_CVar
    local setter = api and api.SetCVar or _G.SetCVar
    local ok, result = pcall(setter, self.cvarName, value)
    return ok and result ~= false and self:GetValue() == value
end

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() == true
end

function Adapter:IsEllesSwingTimerEnabled()
    if _G.EUI_CLIENT_BLOCKED then return false end
    local api = _G.C_AddOns
    local loaded = api and api.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(loaded) ~= "function" then return false end
    local ok, active = pcall(loaded, "EllesmereUIResourceBars")
    if not ok or not active then return false end
    local eui = _G.EllesmereUI
    local registry = eui and eui._ModuleNS
    local resources = registry and registry.EllesmereUIResourceBars
    if not resources or type(resources.ST_Apply) ~= "function" then return false end
    local owner = resources.ERB
    local profile = owner and owner.db and owner.db.profile
    return profile ~= nil and profile.swingTimer ~= nil and profile.swingTimer.enabled == true
end

function Adapter:ResolveAutomatic()
    if self:IsEllesSwingTimerEnabled() then return false, "Elles 挥砍计时已开启" end
    if type(_G.UnitClass) ~= "function" then return nil, "待识别" end
    local ok, label, class = pcall(_G.UnitClass, "player")
    if not ok then return nil, "待识别" end
    local value = DEFAULTS[class]
    if value ~= nil then return value, label or class end
    -- Forever shares generated specialization APIs with other products. Until
    -- live Forever evidence validates their IDs/points, do not infer mixed-class
    -- talent direction from retail IDs, role, equipment or shapeshift form.
    return nil, "待识别"
end

ns.SwingTimerPolicyAdapter = Adapter

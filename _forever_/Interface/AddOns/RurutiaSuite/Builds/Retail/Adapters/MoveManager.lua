local _, RS = ...

if not RS.Build.IsFamily("retail") then return end

local function RuntimeEnabled(module)
    if not module or type(module.IsEnabled) ~= "function" then return true end
    local ok, enabled = pcall(module.IsEnabled, module)
    return ok and enabled and true or false
end

local function ProfileEnabled(module)
    return RuntimeEnabled(module)
        and module and module.db and module.db.profile and module.db.profile.enabled == true
end

local function RaidMarkerMovable(module)
    return ProfileEnabled(module) and module.available ~= false and module.runtimeActive == true
        and module._similarAddonConflict ~= true
end

local function CombatReminderEnabled(module)
    local profile = module and module.db and module.db.profile
    return RuntimeEnabled(module) and profile and ((profile.alert and profile.alert.enabled == true)
        or (profile.timer and profile.timer.enabled == true)) or false
end

local function HasMoveTargets(module)
    return ProfileEnabled(module) and type(module.GetMoveTargetCount) == "function"
        and (tonumber(module:GetMoveTargetCount()) or 0) > 0
end

local providers = {
    { name = "ChatBar", refreshClamp = "RefreshClamp", reset = "ResetPosition", isMovable = ProfileEnabled },
    { name = "RaidMarker", refreshClamp = "RefreshClamp", reset = "ResetPosition", isMovable = RaidMarkerMovable },
    { name = "TopBar", refreshClamp = "RefreshClamp", reset = "ResetPositions", isMovable = function(module) return module.runtimeActive == true end },
    { name = "CombatReminder", reset = "ResetPositions", isMovable = CombatReminderEnabled },
    { name = "ExperienceBar", refreshClamp = "RefreshClamp", reset = "ResetPosition", isMovable = ProfileEnabled },
    { name = "CursedTide", reset = "ResetPosition", isMovable = ProfileEnabled },
    { name = "CurrencyBar", reset = "ResetPosition", isMovable = ProfileEnabled },
    { name = "LFGTools", isMovable = function(module) return module.runtimeActive end },
    { name = "CelestialBar", isMovable = function(module) return module.runtimeActive end },
}

local index = 1
while index <= #providers do
    RS:RegisterMoveProvider(providers[index])
    index = index + 1
end

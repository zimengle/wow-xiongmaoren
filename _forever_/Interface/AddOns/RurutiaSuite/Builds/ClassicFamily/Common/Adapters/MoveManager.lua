local _, RS = ...

if not RS.Build.IsFamily("classic") then return end

local function ProfileEnabled(module)
    return module and module.db and module.db.profile and module.db.profile.enabled == true
end

local function MagePortalMovable(module)
    if not module then return false end
    local _, class
    if type(_G.UnitClass) == "function" then _, class = _G.UnitClass("player") end
    return class == "MAGE" or module.previewEnabled == true
end

local function ResetRaidMarker(module)
    if not (module.db and module.db.profile and module.DEFAULT_POSITION
        and type(module.CopyPosition) == "function") then
        return false
    end
    module.db.profile.position = module:CopyPosition(module.DEFAULT_POSITION)
    if type(module.ApplyPosition) == "function" then module:ApplyPosition() end
    return true
end

local providers = {
    { name = "RangeMonitor", reset = "ResetPosition", isMovable = function(module) return module:IsEnabled() end },
    { name = "ChatBar", refreshClamp = "RefreshClamp", reset = "ResetPosition", isMovable = ProfileEnabled },
    { name = "MagePortal", isMovable = MagePortalMovable },
    { name = "ConsumableBar", refreshClamp = "RefreshClamp", reset = "ResetPositions", isMovable = ProfileEnabled },
    { name = "RaidMarker", refreshClamp = "RefreshClamp", resetFunc = ResetRaidMarker, isMovable = ProfileEnabled },
    { name = "TopBar", refreshClamp = "RefreshClamp", reset = "ResetAllPositions", isMovable = function(module) return module.runtimeActive == true end },
    { name = "ExperienceBar", refreshClamp = "RefreshClamp", reset = "ResetPosition", isMovable = ProfileEnabled },
    { name = "LFGTools", isMovable = function(module) return module.runtimeActive end },
    { name = "CelestialBar", isMovable = function(module) return module.runtimeActive end },
}

local index = 1
while index <= #providers do
    RS:RegisterMoveProvider(providers[index])
    index = index + 1
end

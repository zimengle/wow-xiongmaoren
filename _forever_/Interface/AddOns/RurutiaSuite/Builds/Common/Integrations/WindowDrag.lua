local _, ns = ...

-- Shared ownership boundary for Blizzard window dragging. Called only by the
-- existing drag lifecycle; no frames, subscriptions, timers or persistent state.
local Integration = {}
ns.ExtraToolsWindowDragIntegration = Integration

local function AddonLoaded(name)
    local addons = _G.C_AddOns
    local probe = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(probe) ~= "function" then return false end
    local ok, loaded = pcall(probe, name)
    return ok and loaded and true or false
end

function Integration:GamepadBlocks()
    local elles = _G.EllesmereUI
    if type(elles) ~= "table" or type(elles.PadGamepadUI) ~= "function" then return false end
    local ok, active = pcall(elles.PadGamepadUI)
    return ok and active == true
end

function Integration:BlizzMoveOwns(name)
    if not AddonLoaded("BlizzMove") then return false end
    local api = _G.BlizzMoveAPI
    if type(api) ~= "table" or type(api.GetRegisteredFrames) ~= "function"
        or type(api.IsFrameDisabled) ~= "function" then
        return true
    end
    local ok, frames = pcall(api.GetRegisteredFrames, api, "BlizzMove")
    if not ok or type(frames) ~= "table" or frames[name] == nil then return false end
    local disabledOk, disabled = pcall(api.IsFrameDisabled, api, "BlizzMove", name)
    if not disabledOk then return true end
    return disabled ~= true
end

function Integration:ShifterOwns(name)
    if name ~= "FriendsFrame" or not AddonLoaded("EllesmereUIQoL") then return false end
    local saved = _G.EllesmereUIDB
    return type(saved) == "table" and saved.shifterEnabled == true
end

function Integration:IncludeFriendsFrames(adapter)
    return adapter and adapter.buildId == "classic-infinite"
end

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")) then return end

local Resolver = {}
local ELLES_OTHER_DEFAULTS = {
    selfPoint = "BOTTOMLEFT", anchorPoint = "BOTTOM", xOffset = 227, yOffset = 72,
    growDirection = "RIGHT", wrapDirection = "UP",
}

function Resolver:GetGroupDefaults(groupKey)
    local loaded = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    if groupKey == "other" and type(loaded) == "function" and loaded("EllesmereUI") then
        return ELLES_OTHER_DEFAULTS
    end
end

local PLAYER_FRAME_CANDIDATES = {
    "ElvUF_Player",
    "EllesmereUIUnitFrames_Player",
    "SUFUnitplayer",
    "UUF_Player",
    "MSUF_player",
    "EQOLUFPlayerFrame",
    "oUF_Player",
    "PlayerFrame",
}

local function IsVisible(frame)
    if frame and type(frame.IsVisible) == "function" then return frame:IsVisible() end
    return frame and (type(frame.IsShown) ~= "function" or frame:IsShown())
end

function Resolver:Resolve(preferredName)
    -- A group without an explicit anchorFrame belongs to the screen, not to
    -- whichever player frame happens to be loaded first.
    if not preferredName then return _G.UIParent end
    if IsVisible(_G[preferredName]) then return _G[preferredName] end
    local index
    for index = 1, #PLAYER_FRAME_CANDIDATES do
        local frame = _G[PLAYER_FRAME_CANDIDATES[index]]
        if IsVisible(frame) then
            return frame
        end
    end
    return _G.UIParent
end

function Resolver:GetCandidateCount()
    return #PLAYER_FRAME_CANDIDATES
end

ns.ConsumableBarAnchorResolver = Resolver

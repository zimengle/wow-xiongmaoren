local _, ns = ...

-- Explicit import only: four existing RXP frames, no events/timers/hooks.
-- Keep guide progress, profile mappings and unrelated options untouched.
local Importer = {}
ns.RXPStyleImporter = Importer

local OPTIONS = {
    frameHeight = 150, guideFontSize = 12, arrowText = 14,
    arrowScale = 1, windowScale = 1, activeTheme = "RXP Blue",
    enableTracker = false, enableLevelUpAnnounceSolo = true,
    enableLevelUpAnnounceGroup = true, enableGossipAutomation = false,
    enableBindAutomation = false, enableQuestAutomation = false,
}
local FRAMES = {
    { name="RXPFrame", point="TOPLEFT", x=0, y=-25, width=280, height=150 },
    { name="arrowFrame", point="CENTER", x=-280, y=36, width=32, height=32 },
    { name="activeItemFrame", point="LEFT", x=350, y=-17 },
    { name="activeTargetFrame", point="LEFT", x=350, y=35 },
}

local function Resolve()
    local integration = ns.Integrations and ns.Integrations.RXP
    if not _G.UIParent or not integration then return nil end
    local addon = integration:GetAddon()
    if type(addon) ~= "table" or type(addon.settings) ~= "table"
        or type(addon.settings.profile) ~= "table" or type(addon.enabledFrames) ~= "table" then return nil end
    for _, spec in ipairs(FRAMES) do
        local frame = addon.enabledFrames[spec.name]
        if not frame or frame.savePosition == false then return nil end
        for _, method in ipairs({"GetNumPoints", "GetPoint", "ClearAllPoints", "SetPoint", "GetWidth", "GetHeight", "SetSize", "GetScale", "SetScale"}) do
            if type(frame[method]) ~= "function" then return nil end
        end
    end
    return addon
end

function Importer:IsAvailable()
    return Resolve() ~= nil
end

local function Near(a, b)
    return type(a) == "number" and math.abs(a - b) < 0.05
end

function Importer:Import()
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then return false, "IN_COMBAT" end
    local addon = Resolve()
    if not addon then return false, "API_UNAVAILABLE" end
    local profile = addon.settings.profile
    local oldOptions, oldPositions, oldSizes, snapshots = {}, {}, {}, {}
    local originalPositions, originalSizes = rawget(profile, "framePositions"), rawget(profile, "frameSizes")
    for key in pairs(OPTIONS) do oldOptions[key] = rawget(profile, key) end
    for _, spec in ipairs(FRAMES) do
        local frame = addon.enabledFrames[spec.name]
        local snapshot = {frame=frame, points={}, width=frame:GetWidth(), height=frame:GetHeight(), scale=frame:GetScale()}
        for index = 1, frame:GetNumPoints() do snapshot.points[index] = {frame:GetPoint(index)} end
        snapshots[spec.name] = snapshot
        oldPositions[spec.name] = originalPositions and rawget(originalPositions, spec.name)
        oldSizes[spec.name] = originalSizes and rawget(originalSizes, spec.name)
    end
    local ok = pcall(function()
        for key, value in pairs(OPTIONS) do profile[key] = value end
        profile.framePositions = originalPositions or {}
        profile.frameSizes = originalSizes or {}
        for _, spec in ipairs(FRAMES) do
            local frame = snapshots[spec.name].frame
            profile.framePositions[spec.name] = {{spec.point, "UIParent", spec.point, spec.x, spec.y}}
            frame:ClearAllPoints()
            frame:SetPoint(spec.point, _G.UIParent, spec.point, spec.x, spec.y)
            if spec.width then
                profile.frameSizes[spec.name] = {spec.width, spec.height}
                frame:SetSize(spec.width, spec.height)
            end
            if spec.name == "RXPFrame" then frame:SetScale(1) end
        end
        -- Match live frames before /reload: RXP saves their positions on logout.
        for _, spec in ipairs(FRAMES) do
            local frame = snapshots[spec.name].frame
            local point, relative, relativePoint, x, y = frame:GetPoint(1)
            if frame:GetNumPoints() ~= 1 or point ~= spec.point or relative ~= _G.UIParent
                or relativePoint ~= spec.point or not Near(x, spec.x) or not Near(y, spec.y)
                or (spec.width and (not Near(frame:GetWidth(), spec.width) or not Near(frame:GetHeight(), spec.height))) then
                error("frame-readback-failed")
            end
        end
        if not Near(snapshots.RXPFrame.frame:GetScale(), 1) then error("scale-readback-failed") end
        for key, value in pairs(OPTIONS) do if profile[key] ~= value then error("option-readback-failed") end end
    end)
    if not ok then
        -- Restore live geometry first, then fields (frame callbacks may save).
        for _, spec in ipairs(FRAMES) do
            local saved = snapshots[spec.name]
            pcall(function()
                saved.frame:ClearAllPoints()
                for _, point in ipairs(saved.points) do saved.frame:SetPoint(unpack(point)) end
                saved.frame:SetSize(saved.width, saved.height)
                saved.frame:SetScale(saved.scale)
            end)
        end
        for key in pairs(OPTIONS) do profile[key] = oldOptions[key] end
        for _, spec in ipairs(FRAMES) do
            if originalPositions then originalPositions[spec.name] = oldPositions[spec.name] end
            if originalSizes then originalSizes[spec.name] = oldSizes[spec.name] end
        end
        profile.framePositions, profile.frameSizes = originalPositions, originalSizes
        return false, "rxp-style-readback-failed"
    end
    return true, {changed=true, reloadRequired=true, provider="RXPGuides"}
end

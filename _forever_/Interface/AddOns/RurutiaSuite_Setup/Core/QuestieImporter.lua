local _, ns = ...
local Importer = {}
ns.QuestieImporter = Importer

-- Explicit import only: 17 allowlisted profile fields, no frames, callbacks,
-- events or timers. RSS requests a reload instead of invoking Questie's refresh
-- pipeline (which can also change settings beyond this preset).
local OPTIONS = {
    trackerFontSizeHeader=16, trackerFontSizeZone=16,
    trackerFontSizeQuest=16, trackerFontSizeObjective=16,
    trackerFontOutline="OUTLINE", collapseCompletedQuests=true,
    hideCompletedQuestObjectives=true, minimizeTrackerInInstances=false,
    trackerFadeMinMaxButtons=true, showPartyQuestObjectives=false,
    nameplateX=-4, nameplateY=16, nameplateScale=1.1,
    nameplateTargetFrameEnabled=false,
}
local GEOMETRY = {
    elles={x=1558, y=-198, width=294, height=474},
    native={x=1667, y=-253, width=312, height=483},
}

local function Resolve()
    local integration = ns.Integrations and ns.Integrations.Questie
    if not integration then return nil end
    return integration:Resolve()
end

function Importer:IsAvailable()
    return Resolve() ~= nil
end

function Importer:Import()
    if not ns.ProductManifest:CheckPreset("questie") then return false, "unsupported-on-current-build" end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then return false, "IN_COMBAT" end
    local profile, mode = Resolve()
    if not profile or not GEOMETRY[mode] then return false, "API_UNAVAILABLE" end
    local geometry = GEOMETRY[mode]
    local values, before = {}, {}
    for key, value in pairs(OPTIONS) do values[key] = value end
    values.TrackerLocation = {"TOPLEFT", "UIParent", "TOPLEFT", geometry.x, geometry.y}
    values.TrackerWidth, values.TrackerHeight = geometry.width, geometry.height
    for key in pairs(values) do before[key] = rawget(profile, key) end
    local ok = pcall(function()
        for key, value in pairs(values) do profile[key] = value end
        for key, value in pairs(values) do
            local actual = profile[key]
            if key == "TrackerLocation" then
                if type(actual) ~= "table" then error("location-readback-failed") end
                for index=1,5 do if actual[index] ~= value[index] then error("location-readback-failed") end end
            elseif actual ~= value then error("option-readback-failed") end
        end
    end)
    if not ok then
        for key in pairs(values) do rawset(profile, key, before[key]) end
        return false, "questie-readback-failed"
    end
    return true, {changed=true, reloadRequired=true, provider="Questie", mode=mode}
end

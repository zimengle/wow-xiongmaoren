local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("ellesmereui") then return end

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end
local Adapter = ns.FastFocusAdapter
if type(Adapter) ~= "table" then error("FastFocus adapter Core.lua must load first", 2) end

local staticNames = {
    "EllesmereUIUnitFrames_Player", "EllesmereUIUnitFrames_Target",
    "EllesmereUIUnitFrames_Focus", "EllesmereUIUnitFrames_Pet",
    "EllesmereUIUnitFrames_TargetTarget", "EllesmereUIUnitFrames_FocusTarget",
}
local index
for index = 1, 5 do staticNames[#staticNames + 1] = "EllesmereUIUnitFrames_Boss" .. index end

local function ApplyDynamic(_, adapter, owner, profile, macroText)
    local applied = 0
    local group
    for group = 1, 8 do
        local header = adapter:GetFrame("ERFGroupHeader" .. group)
        if header then
            local unitIndex
            for unitIndex = 1, 5 do
                if adapter:ApplyFrame(owner, header[unitIndex], profile, macroText) then applied = applied + 1 end
            end
        end
    end

    local flatHeader = adapter:GetFrame("ERFFlatHeader")
    if flatHeader then
        for index = 1, 40 do
            if adapter:ApplyFrame(owner, flatHeader[index], profile, macroText) then applied = applied + 1 end
        end
    end
    local partyHeader = adapter:GetFrame("ERFPartyHeader")
    if partyHeader then
        for index = 1, 5 do
            if adapter:ApplyFrame(owner, partyHeader[index], profile, macroText) then applied = applied + 1 end
        end
    end

    if adapter:ApplyFrame(owner, adapter:GetFrame("ERFPartySelfButton"), profile, macroText) then
        applied = applied + 1
    end
    for index = 1, 5 do
        if adapter:ApplyFrame(owner, adapter:GetFrame("ERFFriendlyBoss" .. index), profile, macroText) then
            applied = applied + 1
        end
    end
    for index = 1, 20 do
        if adapter:ApplyFrame(owner, adapter:GetFrame("ERFExtraFrame" .. index), profile, macroText) then
            applied = applied + 1
        end
    end
    return applied
end

Adapter:RegisterProvider({
    id = "ellesmereui",
    addonNames = { EllesmereUIUnitFrames = true, EllesmereUIRaidFrames = true },
    staticNames = staticNames,
    refreshOnGroup = true,
    ApplyDynamic = ApplyDynamic,
})

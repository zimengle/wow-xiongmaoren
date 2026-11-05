local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end
local Adapter = ns.FastFocusAdapter
if type(Adapter) ~= "table" then error("FastFocus adapter Core.lua must load first", 2) end

local generated = {}
local index
for index = 1, 5 do
    generated[#generated + 1] = "DandersPartyHeaderUnitButton" .. index
    generated[#generated + 1] = "DandersArenaHeaderUnitButton" .. index
end
local setIndex
for setIndex = 1, 2 do
    for index = 1, 8 do
        generated[#generated + 1] = "DandersPinnedBoss" .. setIndex .. "Party_" .. index
        generated[#generated + 1] = "DandersPinnedBoss" .. setIndex .. "Raid_" .. index
    end
end

Adapter:RegisterProvider({
    id = "danders-frames",
    addonNames = { DandersFrames = true },
    generatedNames = generated,
    refreshOnGroup = true,
})

local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("elvui") then return end

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end
local Adapter = ns.FastFocusAdapter
if type(Adapter) ~= "table" then error("FastFocus adapter Core.lua must load first", 2) end

local generated = {}
local index
for index = 1, 5 do
    generated[#generated + 1] = "ElvUF_Boss" .. index
    generated[#generated + 1] = "ElvUF_Arena" .. index
    generated[#generated + 1] = "ElvUF_PartyGroup1UnitButton" .. index
    generated[#generated + 1] = "ElvUF_PartyGroup1UnitButton" .. index .. "Pet"
    generated[#generated + 1] = "ElvUF_PartyGroup1UnitButton" .. index .. "Target"
end

Adapter:RegisterProvider({
    id = "elvui",
    addonNames = { ElvUI = true },
    conflictButtons = { "ElvUI_FocusButton" },
    staticNames = {
        "ElvUF_Player", "ElvUF_Target", "ElvUF_TargetTarget",
        "ElvUF_TargetTargetTarget", "ElvUF_Pet", "ElvUF_PetTarget",
        "ElvUF_FocusTarget", "ElvUF_Party",
    },
    generatedNames = generated,
    refreshOnGroup = true,
})

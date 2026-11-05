local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("ndui") then return end

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end
local Adapter = ns.FastFocusAdapter
if type(Adapter) ~= "table" then error("FastFocus adapter Core.lua must load first", 2) end

local generated = {}
local index
for index = 1, 10 do generated[#generated + 1] = "oUF_Boss" .. index end
for index = 1, 5 do
    generated[#generated + 1] = "oUF_Arena" .. index
    generated[#generated + 1] = "oUF_PartyUnitButton" .. index
    generated[#generated + 1] = "oUF_PartyPetUnitButton" .. index
end

Adapter:RegisterProvider({
    id = "ndui",
    addonNames = { NDui = true },
    conflictButtons = { "FocuserButton", "NDuiFocusButton" },
    staticNames = {
        "oUF_Player", "oUF_Target", "oUF_ToT", "oUF_Pet", "oUF_FocusTarget",
        "oUF_PlayerPlate", "oUF_TargetPlate", "oUF_Party", "oUF_PartyPet",
    },
    generatedNames = generated,
    refreshOnGroup = true,
})

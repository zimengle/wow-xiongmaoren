local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end
local Adapter = ns.FastFocusAdapter
if type(Adapter) ~= "table" then error("FastFocus adapter Core.lua must load first", 2) end

local generated = {}
local index
for index = 1, 4 do generated[index] = "NephUI_Party" .. index end

Adapter:RegisterProvider({
    id = "nephui",
    addonNames = { NephUI = true },
    staticNames = { "NephUI_Player", "NephUI_Target", "NephUI_TargetTarget", "NephUI_Pet" },
    generatedNames = generated,
    refreshOnGroup = true,
})

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end
local Adapter = ns.FastFocusAdapter
if type(Adapter) ~= "table" then error("FastFocus adapter Core.lua must load first", 2) end

Adapter:RegisterProvider({
    id = "uuf",
    addonNames = { UUF = true, UltimateUnitFrames = true, UnhaltedUnitFrames = true },
    staticNames = { "UUF_Player", "UUF_Target" },
})

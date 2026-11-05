local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end
local Adapter = ns.FastFocusAdapter
if type(Adapter) ~= "table" then error("FastFocus adapter Core.lua must load first", 2) end

local generated = {}
local patterns = {
    "SUFHeaderpartyUnitButton%d", "SUFHeaderpartypetUnitButton%d",
    "SUFHeaderpartytargetUnitButton%d", "SUFHeaderpartytargettargetUnitButton%d",
    "SUFHeaderbossUnitButton%d", "SUFHeaderbosstargetUnitButton%d",
    "SUFHeaderbosstargettargetUnitButton%d", "SUFHeaderarenaUnitButton%d",
    "SUFHeaderarenapetUnitButton%d", "SUFHeaderarenatargetUnitButton%d",
    "SUFHeaderarenatargettargetUnitButton%d",
}
local patternIndex
for patternIndex = 1, #patterns do
    local index
    for index = 1, 5 do generated[#generated + 1] = patterns[patternIndex]:format(index) end
end

Adapter:RegisterProvider({
    id = "shadowed-unit-frames",
    addonNames = { ShadowedUnitFrames = true },
    staticNames = {
        "SUFUnitplayer", "SUFUnitpet", "SUFUnitpettarget", "SUFUnittarget",
        "SUFUnittargettarget", "SUFUnittargettargettarget", "SUFUnitfocustarget",
    },
    generatedNames = generated,
    refreshOnGroup = true,
})

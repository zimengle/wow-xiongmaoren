local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then return end
local Adapter = ns.FastFocusAdapter
if type(Adapter) ~= "table" then error("FastFocus adapter Core.lua must load first", 2) end

local names = {
    "PlayerFrame", "PetFrame", "TargetFrame", "TargetFrameToT", "FocusFrameToT",
}
local index
for index = 1, 5 do
    names[#names + 1] = "PartyMemberFrame" .. index
    names[#names + 1] = "Boss" .. index .. "TargetFrame"
end

Adapter:RegisterProvider({
    id = "blizzard",
    staticNames = names,
    refreshOnGroup = true,
})

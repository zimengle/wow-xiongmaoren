local _, ns = ...
if not (ns.Build and ns.Build.GetID and ns.Build.GetID() == "classic-infinite"
    and ns.Build.HasModule("ExtraTools")) then return end

local Width = { minOffset = -300, maxOffset = 100 }
ns.EllesmerePartyPetWidth = Width

local function GetPartyOptions()
    local elles = _G.EllesmereUI
    local raid = elles and elles._ModuleNS and elles._ModuleNS.EllesmereUIRaidFrames
    local profile = raid and raid.db and raid.db.profile
    if not (profile and type(profile.petFrames) == "table" and type(raid.PF_View) == "function"
        and raid._PF and type(raid._PF.PartyMode) == "function" and type(raid.PF_Apply) == "function"
        and type(raid.PF_PlaceMover) == "function" and type(raid.partyPvActive) == "function"
        and type(raid.ShowPartyPreview) == "function") then return end
    return raid.PF_View("party"), raid
end

function Width:GetValue()
    local options = GetPartyOptions()
    return options and tonumber(options.extraWidth) or 0
end

function Width:IsAvailable()
    return not InCombatLockdown() and GetPartyOptions() ~= nil
end

function Width:SetValue(value)
    if InCombatLockdown() then return false end
    local options, raid = GetPartyOptions()
    if not options then return false end
    value = ns.ExtraToolsData.ClampNumber(value, self.minOffset, self.maxOffset, 0)
    if value == (options.extraWidth or 0) then return true end

    -- Elles' party view writes party_extraWidth and keeps the shared fallback intact.
    options.extraWidth = value
    if raid._PF.PartyMode() then raid.PF_Apply() end
    raid.PF_PlaceMover("party")
    if raid.partyPvActive() then raid.ShowPartyPreview() end
    return true
end

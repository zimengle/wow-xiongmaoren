local _, ns = ...
if not ns.Build.Is("classic-infinite") then return end
ns.NameplateTargetIntegration = {
    GetAnchor = function(_, unit)
        -- EUI exposes its active plate map. Use the visible custom health bar,
        -- never the hidden Blizzard bar; no hooks or config writes to EUI.
        local provider = _G.EllesmereNameplates_NS
        local plate = provider and provider.plates and provider.plates[unit]
        return plate and plate.health
    end,
}

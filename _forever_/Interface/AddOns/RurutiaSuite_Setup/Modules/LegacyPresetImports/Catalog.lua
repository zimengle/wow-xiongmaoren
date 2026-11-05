local _, ns = ...

local data = ns.LegacyPresetImports and ns.LegacyPresetImports.Data or {}

-- Catalog describes the only fields the adapters may ask public providers to
-- import. It never describes third-party SavedVariables paths.
local Catalog = {
    at = {
        addon = "AbilityTimeline",
        provider = "AbilityTimeline",
        acceptedPrefixes = { "!ATS:1:", "!ATS:2:" },
        defaultPayload = data.at and data.at.ImportString,
    },
    exboss = {
        addon = "EXBoss",
        providerAddon = data.exboss and data.exboss.ProviderAddon or "EXBOSS-RURUTIA",
        requiredAPIVersion = data.exboss and data.exboss.RequiredAPIVersion or 2,
        presetID = data.exboss and data.exboss.PresetID,
        defaultVariant = data.exboss and data.exboss.DefaultVariant or "silent",
        available = data.exboss and data.exboss.Available == true,
        status = data.exboss and data.exboss.Status or "provider-unavailable",
    },
    exwind = {
        addon = "ExwindTools",
        dataReady = type(data.exwind) == "table" and type(data.exwind.LuaSource) == "string",
    },
    bigwigs = {
        addon = "BigWigs",
        auraAddon = "BigWigs_Plugins",
        dataReady = type(data.bigwigs) == "table" and data.bigwigs.Ready == true,
    },
}

ns.LegacyPresetImports = ns.LegacyPresetImports or {}
ns.LegacyPresetImports.Catalog = Catalog

return Catalog

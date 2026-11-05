local _, ns = ...
if not (ns.ProductManifest and ns.ProductManifest:Check("presetData")) then return end

ns.LegacyPresetImports = ns.LegacyPresetImports or {}
ns.LegacyPresetImports.Data = ns.LegacyPresetImports.Data or {}

-- EXBOSS-RURUTIA owns the current preset payload and exposes a transactional
-- installer. RSS keeps only the provider contract instead of duplicating the
-- third-party configuration schema or writing its SavedVariables directly.
ns.LegacyPresetImports.Data.exboss = {
    Available = true,
    Status = "provider-owned",
    ProviderAddon = "EXBOSS-RURUTIA",
    RequiredAPIVersion = 3,
    PresetID = "rurutia-exboss-retail",
    DefaultVariant = "silent",
}

return ns.LegacyPresetImports.Data.exboss

local _, ns = ...

local TransferService = {}
ns.TransferService = TransferService

local function HostTransfer()
    local host = _G.RurutiaSuite
    return host and host.ConfigTransfer
end

-- Ownership stays here: old RS profile.setup is now RSS global user preferences.
-- Prepare without writes; ConfigTransfer commits after RS validation and readback.
local LEGACY_SETUP_TARGETS = {
    autoSwitchLayout={"automation", "editModeLayout"},
    autoSwitchSenseiBrewmaster={"automation", "senseiBrewmaster"},
    senseiSwitchNotify={"automation", "senseiNotify"},
    autoSwitchExBossVoice={"automation", "exbossVoice"},
    autoSwitchDFProfile={"automation", "dandersProfile"},
    autoSwitchDFProfileMythicOnly={"automation", "dandersMythicOnly"},
    showImportPresetButton={"gameMenu", "enabled"},
}
local function PrepareLegacySetup(settings)
    local global = ns.DB and ns.DB.global
    if type(global) ~= "table" then return nil, "RSS 配置数据库尚未就绪" end
    local targets, changes = {}, {}
    for key, target in pairs(LEGACY_SETUP_TARGETS) do
        if type(settings[key]) ~= "boolean" then return nil, "旧 RSS 开关类型错误" end
        local group = target[1]
        local current = rawget(global, group)
        if current ~= nil and type(current) ~= "table" then return nil, "RSS 配置字段类型错误" end
        targets[group] = current or targets[group] or {}
        changes[#changes + 1] = {target=targets[group], key=target[2], value=settings[key]}
    end
    return function()
        -- Raw writes to verified tables cannot dispatch foreign metatable callbacks.
        for group, target in pairs(targets) do rawset(global, group, target) end
        for _, change in ipairs(changes) do rawset(change.target, change.key, change.value) end
        return true
    end
end

function TransferService:ExportRS()
    local ready, reason = ns.ProductManifest:Check("transfer")
    if not ready then return nil, reason end
    local service = HostTransfer()
    if type(service) ~= "table" or type(service.Export) ~= "function" then
        return nil, "RS 配置迁移服务不可用"
    end
    return service:Export()
end

function TransferService:ImportRS(payload)
    local ready, reason = ns.ProductManifest:Check("transfer")
    if not ready then return false, reason end
    local service = HostTransfer()
    if type(service) ~= "table" or type(service.Import) ~= "function" then
        return false, "RS 配置迁移服务不可用"
    end
    return service:Import(payload, PrepareLegacySetup)
end

function TransferService:ExportAT()
    local ready, reason = ns.ProductManifest:CheckPreset("at")
    if not ready then return nil, reason end
    local service = ns.LegacyPresetImports and ns.LegacyPresetImports.at
    if type(service) ~= "table" or type(service.Export) ~= "function" then
        return nil, "AT时间轴配置迁移服务不可用"
    end
    return service:Export()
end

function TransferService:ImportAT(payload)
    local ready, reason = ns.ProductManifest:CheckPreset("at")
    if not ready then return false, reason end
    local service = ns.LegacyPresetImports and ns.LegacyPresetImports.at
    if type(service) ~= "table" or type(service.Import) ~= "function" then
        return false, "AT时间轴配置迁移服务不可用"
    end
    return service:Import({ payload = payload })
end

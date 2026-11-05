local _, ns = ...

local Runtime = {}
ns.Runtime = Runtime

-- 事件服务先启用、命令最后启用；失败时按相反顺序清理。
local Services = {
    "EventHub", "HealthCheckService", "EditModeActivator", "AutomationCoordinator",
    "GameMenuService", "LayoutIntegration", "Commands",
}

function Runtime.Initialize(handle)
    ns.Host = handle
    local supported, buildReason = ns.ProductManifest:CheckBuild()
    if not supported then return false, buildReason end
    local db, reason = ns.Database:Open(handle)
    if not db then return false, reason end
    if ns.ProductManifest:Check("settingsMigration") then
        local migrated, migrationReason = ns.SettingsMigration:Run()
        if not migrated then return false, migrationReason end
    end
    return true
end

function Runtime.Enable(handle)
    if Runtime.enabledServices and #Runtime.enabledServices > 0 then return true end
    local supported, buildReason = ns.ProductManifest:CheckBuild()
    if not supported then return false, buildReason end
    Runtime.enabledServices = {}
    local index
    for index = 1, #Services do
        if ns.ProductManifest:IsServiceEnabled(Services[index]) then
            local service = ns[Services[index]]
            local enabled, reason = service:Enable(handle)
            if not enabled then
                local rollbackIndex
                for rollbackIndex = #Runtime.enabledServices, 1, -1 do
                    Runtime.enabledServices[rollbackIndex]:Disable()
                end
                Runtime.enabledServices = {}
                return false, reason
            end
            Runtime.enabledServices[#Runtime.enabledServices + 1] = service
        end
    end
    return true
end

function Runtime.Disable()
    local failure
    local services = Runtime.enabledServices or {}
    local index
    for index = #services, 1, -1 do
        local disabled, reason = services[index]:Disable()
        if not disabled and not failure then failure = reason or "unable to disable RSS service" end
    end
    Runtime.enabledServices = {}
    local saved, saveReason = ns.Database:PrepareForSave()
    if not saved and not failure then failure = saveReason or "unable to save RSS database" end
    if failure then return false, failure end
    return true
end

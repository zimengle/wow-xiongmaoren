local _, ns = ...

-- 外部 AddOn 扩展宿主。外部扩展只依赖本文件公开的 v1 facade，
-- 不直接持有 Assembly、Runtime、PageRegistry 等内部实现。
local Extensions = {
    API_VERSION = 1,
    API_REVISION = 2,
    active = false,
}
ns.Extensions = Extensions

function Extensions:Supports(version, revision)
    return version == self.API_VERSION and type(revision) == "number"
        and revision >= 1 and revision <= self.API_REVISION
        and revision == math.floor(revision)
end
function Extensions:IsReady() return self.active == true end

local Handle = {}
Handle.__index = Handle
local Unpack = unpack or table.unpack

local entries = {}
local entryByKey = {}

local function NormalizeToken(value)
    if type(value) ~= "string" then return nil end
    value = string.lower(string.match(value, "^%s*(.-)%s*$") or "")
    value = string.gsub(value, "[^%w]+", "-")
    value = string.gsub(value, "^-+", "")
    value = string.gsub(value, "-+$", "")
    return value ~= "" and value or nil
end

local function CopyTable(source)
    local copy = {}
    for key, value in pairs(source) do copy[key] = value end
    return copy
end

local function SetError(entry, phase, reason)
    entry.lastError = {
        phase = phase,
        reason = tostring(reason or "unknown error"),
    }
    entry.errorCount = entry.errorCount + 1
    return entry.lastError.reason
end

local function SafeCall(entry, phase, callback, ...)
    if callback == nil then return true end
    if type(callback) ~= "function" then
        return false, SetError(entry, phase, phase .. " must be a function")
    end
    local ok, result, reason = pcall(callback, ...)
    if not ok then return false, SetError(entry, phase, result) end
    if result == false then
        return false, SetError(entry, phase, reason or (phase .. " returned false"))
    end
    return true, result, reason
end

local function RuntimeCallback(entry, phase, callback, after)
    if callback == nil and after == nil then return nil end
    return function()
        local ok, result, reason = SafeCall(entry, phase, callback, entry.handle)
        if after then after(ok) end
        if not ok then error(result, 0) end
        return result, reason
    end
end

local function PageCallback(entry, phase, callback, returnsFailure)
    if callback == nil then return nil end
    return function(...)
        local count = select("#", ...)
        local arguments = { ... }
        arguments[count + 1] = entry.handle
        local ok, result, reason = SafeCall(entry, phase, callback,
            Unpack(arguments, 1, count + 1))
        if ok then return result, reason end
        if returnsFailure then return false, result end
        return false
    end
end

local function RemoveEntry(entry)
    entryByKey[entry.key] = nil
    local index
    for index = #entries, 1, -1 do
        if entries[index] == entry then
            table.remove(entries, index)
            break
        end
    end
    entry.registered = false
end

function Extensions:_CloseAndReleasePages(entry)
    local system = ns.UISystem
    local failures = {}
    if system and type(system.UnregisterPage) == "function" then
        local pageIds = {}
        for pageId in pairs(entry.pageRoutes) do pageIds[#pageIds + 1] = pageId end
        local index
        for index = 1, #pageIds do
            local pageId = pageIds[index]
            local route = entry.pageRoutes[pageId]
            local ok, removed = pcall(system.UnregisterPage, system, route)
            if not ok or removed ~= true then
                failures[pageId] = SetError(entry, "UnregisterPage:" .. pageId, removed)
            else
                entry.pageRoutes[pageId] = nil
            end
        end
    elseif next(entry.pageRoutes) ~= nil then
        failures.pages = SetError(entry, "UnregisterPages",
            "RurutiaSuite UI does not support extension page cleanup")
    end
    entry.pagesPrepared = next(entry.pageRoutes) ~= nil
    return next(failures) == nil, failures
end

function Extensions:_PreparePages(entry)
    if entry.pagesPrepared then return true end
    local system = ns.UISystem
    if type(system) ~= "table" or type(system.RegisterPage) ~= "function"
        or type(system.UnregisterPage) ~= "function" then
        return false, "RurutiaSuite UI extension page service is not initialized"
    end

    local pages = entry.definition.pages or {}
    local prepared = {}
    local seen = {}
    local index
    for index = 1, #pages do
        local source = pages[index]
        local pageId = type(source) == "table" and NormalizeToken(source.id) or nil
        if pageId == nil or type(source.build) ~= "function" then
            return false, "invalid extension page at index " .. index
        end
        local route = entry.routePrefix .. "-" .. pageId
        if ns.OptionalAddons then ns.OptionalAddons:RemovePlaceholder(route) end
        if seen[route] or (system.IsPageRegistered and system:IsPageRegistered(route)) then
            return false, "extension page route conflict: " .. route
        end
        seen[route] = true
        prepared[index] = { id = pageId, route = route, source = source }
    end

    local registered = {}
    for index = 1, #prepared do
        local page = prepared[index]
        local definition = CopyTable(page.source)
        if ns.OptionalAddons then ns.OptionalAddons:Decorate(entry.owner, page.route, definition) end
        local sourceVisible = page.source.visible
        definition.visible = function()
            if not entry.enabled then return false end
            if sourceVisible == nil then return true end
            if type(sourceVisible) ~= "function" then return sourceVisible and true or false end
            local ok, visible = SafeCall(entry, "page.visible:" .. page.id,
                sourceVisible, entry.handle)
            return ok and visible and true or false
        end
        definition.build = PageCallback(entry, "page.build:" .. page.id,
            page.source.build, true)
        definition.onShow = PageCallback(entry, "page.onShow:" .. page.id,
            page.source.onShow, false)
        definition.onHide = PageCallback(entry, "page.onHide:" .. page.id,
            page.source.onHide, false)
        definition.onRefresh = PageCallback(entry, "page.onRefresh:" .. page.id,
            page.source.onRefresh, false)
        definition.onThemeChanged = PageCallback(entry, "page.onThemeChanged:" .. page.id,
            page.source.onThemeChanged, false)
        if not system:RegisterPage(page.route, definition) then
            local rollbackIndex
            for rollbackIndex = #registered, 1, -1 do
                local rollbackRoute = registered[rollbackIndex]
                local rollbackId
                for candidateId, candidateRoute in pairs(entry.pageRoutes) do
                    if candidateRoute == rollbackRoute then rollbackId = candidateId break end
                end
                local rollbackOk, removed = pcall(system.UnregisterPage, system, rollbackRoute)
                if rollbackOk and removed == true and rollbackId then
                    entry.pageRoutes[rollbackId] = nil
                elseif not rollbackOk or removed ~= true then
                    SetError(entry, "RollbackPage:" .. tostring(rollbackId or rollbackRoute), removed)
                end
            end
            return false, "unable to register extension page: " .. page.route
        end
        registered[#registered + 1] = page.route
        entry.pageRoutes[page.id] = page.route
    end
    entry.pagesPrepared = true
    return true
end

function Extensions:_PrepareRuntime(entry)
    if entry.module then return true end
    local Runtime = ns.Runtime
    if type(Runtime) ~= "table" or type(Runtime.RegisterModule) ~= "function"
        or type(Runtime.UnregisterModule) ~= "function" then
        return false, "RurutiaSuite Runtime extension service is not initialized"
    end
    if Runtime:GetModule(entry.runtimeName) then
        return false, "extension runtime module conflict: " .. entry.runtimeName
    end
    local callbacks = entry.definition.module or {}
    local runtimeDefinition = {
        Initialize = RuntimeCallback(entry, "Initialize", callbacks.Initialize),
        Enable = RuntimeCallback(entry, "Enable", callbacks.Enable, function(ok)
            entry.enabled = ok and true or false
        end),
        Disable = RuntimeCallback(entry, "Disable", callbacks.Disable, function()
            entry.enabled = false
        end),
    }
    local ok, module = pcall(Runtime.RegisterModule, Runtime,
        entry.runtimeName, runtimeDefinition)
    if not ok then return false, tostring(module) end
    entry.module = module
    return true
end

function Extensions:_SubscribeTheme(entry)
    local callback = entry.definition.module and entry.definition.module.ThemeChanged
    if callback == nil or entry.themeSubscribed then return true end
    local theme = ns.UISystem and ns.UISystem.theme
    if not theme or type(theme.Subscribe) ~= "function" then
        return false, "RurutiaSuite theme service is not initialized"
    end
    local subscribed = theme:Subscribe(entry, function(_, _, changed)
        SafeCall(entry, "ThemeChanged", callback, entry.handle, changed)
    end)
    if not subscribed then return false, "unable to subscribe extension theme callback" end
    entry.themeSubscribed = true
    return true
end

function Extensions:_UnsubscribeTheme(entry)
    if not entry.themeSubscribed then return true end
    local theme = ns.UISystem and ns.UISystem.theme
    if theme and type(theme.Unsubscribe) == "function" then
        theme:Unsubscribe(entry)
    end
    entry.themeSubscribed = false
    return true
end

function Extensions:_PrepareDatabasesForSave(entry)
    local failures = {}
    local index
    for index = #entry.databases, 1, -1 do
        local database = entry.databases[index]
        if database and type(database.PrepareForSave) == "function" then
            local ok, saved, reason = pcall(database.PrepareForSave, database)
            if not ok or saved == false then
                failures[index] = SetError(entry, "DatabaseSave",
                    ok and reason or saved)
            end
        end
        entry.databases[index] = nil
    end
    return next(failures) == nil, failures
end

function Extensions:_ReleaseEntry(entry)
    local failures = {}
    if entry.definition.movement then
        local ok, reason = pcall(entry.definition.movement.SetUnlocked, entry.definition.movement, false)
        if not ok or reason == false then failures.Movement = reason or "movement cleanup failed" end
    end
    if entry.movementRegistered then
        local ok, removed = pcall(ns.UnregisterMoveProvider, ns, entry.runtimeName)
        if ok and removed then entry.movementRegistered = false
        else failures.MovementRegistration = "unable to unregister movement" end
    end
    local Runtime = ns.Runtime
    local pagesReleased, pageFailures = self:_CloseAndReleasePages(entry)
    if not pagesReleased then failures.Pages = pageFailures end
    self:_UnsubscribeTheme(entry)
    if entry.module then
        local disabled, disableReason = Runtime:DisableModule(entry.module)
        if not disabled then failures.Disable = disableReason end
        local removed, removeReason = Runtime:UnregisterModule(entry.module)
        if removed then
            entry.module = nil
        else
            failures.UnregisterRuntime = removeReason
        end
    end
    local databasesSaved, databaseFailures = self:_PrepareDatabasesForSave(entry)
    if not databasesSaved then failures.Databases = databaseFailures end
    entry.enabled = false
    entry.cleanRelease = next(failures) == nil
        and not entry.movementRegistered
        and entry.module == nil
        and next(entry.pageRoutes) == nil
        and not entry.themeSubscribed
    entry.state = entry.cleanRelease and "disabled" or "failed"
    return entry.cleanRelease, failures
end

function Extensions:_ActivateEntry(entry)
    if entry.enabled then return true end
    entry.state = "activating"
    local pagesReady, pageReason = self:_PreparePages(entry)
    if not pagesReady then
        entry.state = "failed"
        self:_ReleaseEntry(entry)
        return false, SetError(entry, "RegisterPages", pageReason)
    end
    local runtimeReady, runtimeReason = self:_PrepareRuntime(entry)
    if not runtimeReady then
        entry.state = "failed"
        self:_ReleaseEntry(entry)
        return false, SetError(entry, "RegisterRuntime", runtimeReason)
    end
    local themeReady, themeReason = self:_SubscribeTheme(entry)
    if not themeReady then
        entry.state = "failed"
        self:_ReleaseEntry(entry)
        return false, SetError(entry, "SubscribeTheme", themeReason)
    end
    local enabled, enableReason = ns.Runtime:EnableModule(entry.module)
    if not enabled then
        entry.state = "failed"
        self:_ReleaseEntry(entry)
        return false, enableReason
    end
    entry.enabled = true
    entry.state = "enabled"
    if entry.definition.movement and not entry.movementRegistered then
        local called, registered = pcall(ns.RegisterMoveProvider, ns, {
            name = entry.runtimeName,
            getModule = function()
                local movement = entry.definition.movement
                if entry.enabled and (not movement.IsAvailable or movement:IsAvailable()) then return movement end
            end,
            reset = "ResetPosition",
        })
        if not called or not registered then
            self:_ReleaseEntry(entry)
            return false, "unable to register extension movement"
        end
        entry.movementRegistered = true
    end
    return true
end

function Extensions:RegisterAddon(owner, definition)
    local ownerId = NormalizeToken(owner)
    local extensionId = type(definition) == "table" and NormalizeToken(definition.id) or nil
    if ownerId == nil or extensionId == nil then
        return nil, "owner and extension id must be non-empty strings"
    end
    if definition.apiVersion ~= self.API_VERSION then
        return nil, "unsupported extension API version"
    end
    if definition.module ~= nil and type(definition.module) ~= "table" then
        return nil, "extension module must be a table"
    end
    if definition.pages ~= nil and type(definition.pages) ~= "table" then
        return nil, "extension pages must be a table"
    end
    if definition.movement ~= nil and (type(definition.movement) ~= "table"
        or type(definition.movement.SetUnlocked) ~= "function"
        or type(definition.movement.ResetPosition) ~= "function") then
        return nil, "invalid extension movement"
    end

    local key = ownerId .. ":" .. extensionId
    local existing = entryByKey[key]
    if existing then
        if existing.definition ~= definition then return nil, "extension-conflict" end
        if self.active and not existing.enabled then
            local ok, reason = self:_ActivateEntry(existing)
            if not ok then
                RemoveEntry(existing)
                return nil, reason
            end
        end
        return existing.handle
    end

    local routePrefix = NormalizeToken(definition.routePrefix) or ownerId
    local entry = {
        key = key,
        owner = owner,
        id = extensionId,
        routePrefix = routePrefix,
        definition = definition,
        runtimeName = "External:" .. ownerId .. ":" .. extensionId,
        pageRoutes = {},
        databases = {},
        enabled = false,
        registered = true,
        state = "pending",
        errorCount = 0,
    }
    entry.handle = setmetatable({ _entry = entry, _host = self }, Handle)
    entries[#entries + 1] = entry
    entryByKey[key] = entry

    if self.active then
        local ok, reason = self:_ActivateEntry(entry)
        if not ok then
            if entry.cleanRelease then RemoveEntry(entry) end
            if ns.OptionalAddons then ns.OptionalAddons:Refresh() end
            return nil, reason
        end
    end
    return entry.handle
end

function Extensions:GetAddon(owner, extensionId)
    local ownerId = NormalizeToken(owner)
    extensionId = NormalizeToken(extensionId)
    local entry = ownerId and extensionId and entryByKey[ownerId .. ":" .. extensionId] or nil
    return entry and entry.handle or nil
end

function Extensions:Activate()
    if self.active then return true, {} end
    self.active = true
    local failures = {}
    local failedEntries = {}
    local index
    for index = 1, #entries do
        local entry = entries[index]
        local ok, reason = self:_ActivateEntry(entry)
        if not ok then
            failures[entry.key] = reason
            failedEntries[#failedEntries + 1] = entry
        end
    end
    for index = 1, #failedEntries do
        if failedEntries[index].cleanRelease then RemoveEntry(failedEntries[index]) end
    end
    if ns.OptionalAddons then ns.OptionalAddons:Refresh() end
    return next(failures) == nil, failures
end

function Extensions:RefreshProfile(profileName)
    local failures = {}
    local index
    for index = 1, #entries do
        local entry = entries[index]
        if entry.enabled then
            local callbacks = entry.definition.module or {}
            local ok, reason = SafeCall(entry, "ProfileChanged",
                callbacks.ProfileChanged, entry.handle, profileName)
            if not ok then failures[entry.key] = reason end
        end
    end
    return next(failures) == nil, failures
end

function Extensions:Deactivate()
    local failures = {}
    local index
    for index = #entries, 1, -1 do
        local entry = entries[index]
        local ok, reason = self:_ReleaseEntry(entry)
        if not ok then failures[entry.key] = reason end
    end
    self.active = false
    if ns.OptionalAddons then ns.OptionalAddons:Stop() end
    return next(failures) == nil, failures
end

function Extensions:GetDiagnostics()
    local result = { apiVersion = self.API_VERSION, active = self.active, addons = {} }
    local index
    for index = 1, #entries do
        local entry = entries[index]
        result.addons[entry.key] = entry.handle:GetDiagnostics()
    end
    return result
end

function Handle:Enable()
    local entry = self._entry
    if not entry.registered then return false, "extension-registration-released" end
    if not self._host.active then return false, "extension-host-inactive" end
    return self._host:_ActivateEntry(entry)
end

function Handle:Disable()
    local entry = self._entry
    if not entry.registered then return true end
    local ok, failures = self._host:_ReleaseEntry(entry)
    if self._host.active and ns.OptionalAddons then ns.OptionalAddons:Refresh() end
    return ok, failures
end

function Handle:IsEnabled()
    return self._entry.registered and self._entry.enabled or false
end

function Handle:OpenPage(pageId, data)
    local entry = self._entry
    local route = entry.pageRoutes[NormalizeToken(pageId)]
    if not route or not self:IsEnabled() then
        return nil, "extension page is not available"
    end
    local system = ns.UISystem
    if not system or type(system.OpenMain) ~= "function" then
        return nil, "RurutiaSuite UI system is not initialized"
    end
    return system:OpenMain(route, data)
end

-- Scalar snapshot only: extensions cannot mutate the host Build descriptor.
function Extensions:GetBuildContext()
    local build = ns.Build
    if type(build) ~= "table" or type(build.GetActive) ~= "function" then
        return nil, "host-build-unavailable"
    end
    local ok, descriptor = pcall(build.GetActive)
    if not ok or type(descriptor) ~= "table" then return nil, "host-build-unavailable" end
    return { id = descriptor.id, family = descriptor.family }
end

function Handle:GetBuildContext()
    if not self._entry.registered then return nil, "extension-registration-released" end
    return self._host:GetBuildContext()
end

function Handle:ApplySkin(kind, component, context)
    local entry = self._entry
    if not entry.registered then return false, "extension-registration-released" end
    if type(kind) ~= "string" or kind == "" or component == nil then
        return false, "skin kind and component are required"
    end
    local system = ns.UISystem
    local providers = system and system.providers
    if not system or not providers or type(system.RefreshSkinProvider) ~= "function"
        or type(providers.Apply) ~= "function" then
        return false, "RurutiaSuite skin service is not initialized"
    end
    local contextKey = "extension:" .. entry.key .. ":" .. kind
    local providerName = system:RefreshSkinProvider(contextKey, context or {})
    return providers:Apply(kind, component) and true or false, providerName
end

function Handle:OpenDatabase(name, defaults, options)
    local entry = self._entry
    if not entry.registered then return nil, "extension-registration-released" end
    if type(ns.Database) ~= "table" or type(ns.Database.Open) ~= "function" then
        return nil, "RurutiaSuite database service is not initialized"
    end
    local database, reason = ns.Database.Open(name, defaults, options)
    if database then entry.databases[#entry.databases + 1] = database end
    return database, reason
end

local function CanOwnResources(entry)
    if not entry.module or type(entry.module.GetState) ~= "function" then return false end
    local state = entry.module:GetState()
    return state == "enabling" or state == "enabled"
end

function Handle:RegisterEvent(event, callback)
    local entry = self._entry
    if not CanOwnResources(entry) then
        return nil, "extension cannot own resources in its current state"
    end
    if type(callback) ~= "function" then return nil, "event callback must be a function" end
    local ok, token = pcall(entry.module.RegisterEvent, entry.module, event,
        function(_, firedEvent, ...)
            local called, reason = SafeCall(entry, "Event:" .. tostring(firedEvent),
                callback, self, firedEvent, ...)
            if not called then error(reason, 0) end
        end)
    if not ok then return nil, SetError(entry, "RegisterEvent", token) end
    return token
end

function Handle:UnregisterEvent(event)
    local entry = self._entry
    if not entry.module then return false end
    local ok, result = pcall(entry.module.UnregisterEvent, entry.module, event)
    if not ok then SetError(entry, "UnregisterEvent", result) return false end
    return result
end

local function Schedule(entry, handle, method, delay, callback, label)
    if not CanOwnResources(entry) then
        return nil, "extension cannot own resources in its current state"
    end
    if type(callback) ~= "function" then return nil, "schedule callback must be a function" end
    local phase = method .. ":" .. tostring(label or "anonymous")
    local ok, token = pcall(entry.module[method], entry.module, delay, function()
        local called, reason = SafeCall(entry, phase, callback, handle)
        if not called then error(reason, 0) end
    end, label)
    if not ok then return nil, SetError(entry, method, token) end
    return token
end

function Handle:Schedule(delay, callback, label)
    return Schedule(self._entry, self, "Schedule", delay, callback, label)
end

function Handle:ScheduleRepeating(interval, callback, label)
    return Schedule(self._entry, self, "ScheduleRepeating", interval, callback, label)
end

function Handle:CancelSchedule(token)
    local entry = self._entry
    if not entry.module then return false end
    local ok, result = pcall(entry.module.CancelSchedule, entry.module, token)
    if not ok then SetError(entry, "CancelSchedule", result) return false end
    return result
end

function Handle:GetLastError()
    return self._entry.lastError
end

function Handle:GetDiagnostics()
    local entry = self._entry
    return {
        owner = entry.owner,
        id = entry.id,
        state = entry.state,
        registered = entry.registered,
        enabled = entry.enabled,
        pagesPrepared = entry.pagesPrepared and true or false,
        errorCount = entry.errorCount,
        lastError = entry.lastError,
        runtimeState = entry.module and entry.module:GetState() or "inactive",
        databases = #entry.databases,
    }
end

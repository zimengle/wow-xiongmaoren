local _, ns = ...

if type(ns) ~= "table" then
    error("RurutiaSuite Runtime requires the shared addon namespace", 2)
end

if ns.Runtime ~= nil then
    error("RurutiaSuite Runtime was loaded more than once", 2)
end

local Runtime = {}
local Module = {}

local RESOURCE_KINDS = {
    "onUpdates",
    "events",
    "hooks",
    "timers",
    "tickers",
    "refreshes",
    "drivers",
    "queues",
    "frames",
}

local function countEntries(values)
    local count = 0
    for _ in pairs(values) do
        count = count + 1
    end
    return count
end

local function createResourceBags()
    local resources = {}
    local index
    for index = 1, #RESOURCE_KINDS do
        resources[RESOURCE_KINDS[index]] = {}
    end
    return resources
end

local function defaultCreateTimer(delay, callback)
    if _G and _G.C_Timer and type(_G.C_Timer.NewTimer) == "function" then
        return _G.C_Timer.NewTimer(delay, callback)
    end
    error("C_Timer.NewTimer is unavailable", 2)
end

local function defaultCreateTicker(interval, callback)
    if _G and _G.C_Timer and type(_G.C_Timer.NewTicker) == "function" then
        return _G.C_Timer.NewTicker(interval, callback)
    end
    error("C_Timer.NewTicker is unavailable", 2)
end

local function defaultCreateFrame(...)
    if _G and type(_G.CreateFrame) == "function" then
        return _G.CreateFrame(...)
    end
    error("CreateFrame is unavailable", 2)
end

local function defaultHookSecureFunc(...)
    if _G and type(_G.hooksecurefunc) == "function" then
        return _G.hooksecurefunc(...)
    end
    error("hooksecurefunc is unavailable", 2)
end

Runtime._modules = {}
Runtime._moduleOrder = {}
Runtime._resourceCleaners = {}
Runtime._diagnosticProviders = {}
Runtime._environment = {
    CreateFrame = defaultCreateFrame,
    NewTimer = defaultCreateTimer,
    NewTicker = defaultCreateTicker,
    HookSecureFunc = defaultHookSecureFunc,
}
Runtime._errorHandler = nil
Runtime._errorCount = 0

Module.__index = function(self, key)
    local method = Module[key]
    if method ~= nil then
        return method
    end
    return self._definition[key]
end

function Runtime:Configure(environment)
    if type(environment) ~= "table" then
        error("Runtime:Configure expects an environment table", 2)
    end

    local diagnostics = self:GetDiagnostics()
    if diagnostics.totals.activeResources ~= 0 then
        error("Runtime environment cannot change while resources are active", 2)
    end

    local key
    local value
    for key, value in pairs(environment) do
        if key ~= "CreateFrame" and key ~= "NewTimer" and key ~= "NewTicker"
            and key ~= "HookSecureFunc" then
            error("Unknown Runtime environment key: " .. tostring(key), 2)
        end
        if type(value) ~= "function" then
            error("Runtime environment value must be a function: " .. key, 2)
        end
        self._environment[key] = value
    end
end

function Runtime:SetErrorHandler(callback)
    if callback ~= nil and type(callback) ~= "function" then
        error("Runtime:SetErrorHandler expects a function or nil", 2)
    end
    self._errorHandler = callback
end

function Runtime:_ReportError(module, phase, value)
    local message = tostring(value)
    self._errorCount = self._errorCount + 1

    if module ~= nil then
        module._lastError = {
            phase = phase,
            message = message,
        }
        module._errorCount = module._errorCount + 1
    end

    if self._errorHandler ~= nil then
        pcall(self._errorHandler, module and module._name or nil, phase, message)
    end

    return message
end

function Runtime:_CallModule(module, phase, callback, ...)
    local ok, result = pcall(callback, module, ...)
    if not ok then
        return false, self:_ReportError(module, phase, result)
    end
    return true, result
end

function Runtime:_ResolveModule(moduleOrName)
    if type(moduleOrName) == "string" then
        return self._modules[moduleOrName]
    end
    if type(moduleOrName) == "table" and moduleOrName._runtime == self then
        return moduleOrName
    end
    return nil
end

function Runtime:RegisterResourceKind(kind, cleaner)
    if type(kind) ~= "string" or kind == "" then
        error("Resource kind must be a non-empty string", 2)
    end
    if type(cleaner) ~= "function" then
        error("Resource cleaner must be a function", 2)
    end
    if self._resourceCleaners[kind] ~= nil then
        error("Resource kind already registered: " .. kind, 2)
    end
    self._resourceCleaners[kind] = cleaner
end

function Runtime:_AssertModuleCanOwnResources(module)
    if module._state ~= "enabling" and module._state ~= "enabled" then
        error("Module " .. module._name .. " cannot acquire resources while " .. module._state, 3)
    end
end

function Runtime:_TrackResource(module, kind, key, record)
    self:_AssertModuleCanOwnResources(module)

    local bag = module._resources[kind]
    if bag == nil then
        error("Unknown resource kind: " .. tostring(kind), 3)
    end
    if key == nil then
        error("Resource key cannot be nil", 3)
    end

    local existing = bag[key]
    if existing ~= nil then
        return existing, false
    end

    bag[key] = record
    return record, true
end

function Runtime:_ReleaseResource(module, kind, key)
    local bag = module._resources[kind]
    if bag == nil then
        error("Unknown resource kind: " .. tostring(kind), 3)
    end

    local record = bag[key]
    if record == nil then
        return false
    end

    -- Remove ownership before cleanup so a cleanup callback can safely re-enter.
    bag[key] = nil

    local cleaner = self._resourceCleaners[kind]
    if cleaner ~= nil then
        local ok, err = pcall(cleaner, self, module, key, record)
        if not ok then
            self:_ReportError(module, "cleanup:" .. kind, err)
        end
    end

    return true
end

function Runtime:_ReleaseResourceKind(module, kind)
    local bag = module._resources[kind]
    if bag == nil then
        return
    end

    local key = next(bag)
    while key ~= nil do
        self:_ReleaseResource(module, kind, key)
        key = next(bag)
    end
end

function Runtime:_ReleaseAllResources(module)
    local index
    for index = 1, #RESOURCE_KINDS do
        self:_ReleaseResourceKind(module, RESOURCE_KINDS[index])
    end
end

function Runtime:RegisterModule(name, definition)
    if type(name) ~= "string" or name == "" then
        error("Runtime:RegisterModule expects a non-empty module name", 2)
    end
    if type(definition) ~= "table" then
        error("Runtime:RegisterModule expects a definition table", 2)
    end
    if self._modules[name] ~= nil then
        error("Module already registered: " .. name, 2)
    end

    local module = setmetatable({
        _runtime = self,
        _name = name,
        _definition = definition,
        _state = "registered",
        _initialized = false,
        _resources = createResourceBags(),
        _lastError = nil,
        _errorCount = 0,
        _eventFrame = nil,
        _eventFrameActive = false,
        _counters = {
            refreshes = 0,
            scans = 0,
            lastDuration = 0,
        },
        data = {},
    }, Module)

    self._modules[name] = module
    self._moduleOrder[#self._moduleOrder + 1] = module
    return module
end

function Runtime:GetModule(name)
    return self._modules[name]
end

function Runtime:GetModules(result)
    if result == nil then
        result = {}
    elseif type(result) ~= "table" then
        error("Runtime:GetModules result must be a table or nil", 2)
    end

    local index
    for index = #result, 1, -1 do
        result[index] = nil
    end
    for index = 1, #self._moduleOrder do
        result[index] = self._moduleOrder[index]
    end
    return result
end

function Runtime:UnregisterModule(moduleOrName)
    local module = self:_ResolveModule(moduleOrName)
    if module == nil then
        return false, "Unknown module: " .. tostring(moduleOrName)
    end
    if module._state == "enabling" or module._state == "enabled"
        or module._state == "disabling" or module._state == "initializing" then
        return false, "Module must be inactive before unregistering: " .. module._name
    end

    self:_ReleaseAllResources(module)
    self._modules[module._name] = nil
    local index
    for index = #self._moduleOrder, 1, -1 do
        if self._moduleOrder[index] == module then
            table.remove(self._moduleOrder, index)
            break
        end
    end
    module._runtime = nil
    module._state = "unregistered"
    return true
end

function Runtime:InitializeModule(moduleOrName)
    local module = self:_ResolveModule(moduleOrName)
    if module == nil then
        return false, "Unknown module: " .. tostring(moduleOrName)
    end
    if module._initialized then
        return true
    end
    if module._state == "initializing" then
        return false, "Module initialization is already in progress: " .. module._name
    end

    module._state = "initializing"
    local callback = module._definition.Initialize
    if callback ~= nil then
        if type(callback) ~= "function" then
            module._state = "registered"
            return false, self:_ReportError(module, "Initialize", "Initialize must be a function")
        end
        local ok, err = self:_CallModule(module, "Initialize", callback)
        if not ok then
            module._state = "registered"
            return false, err
        end
    end

    module._initialized = true
    module._state = "initialized"
    return true
end

function Runtime:EnableModule(moduleOrName)
    local module = self:_ResolveModule(moduleOrName)
    if module == nil then
        return false, "Unknown module: " .. tostring(moduleOrName)
    end
    if module._state == "enabled" then
        return true
    end
    if module._state == "enabling" or module._state == "disabling" then
        return false, "Module lifecycle transition is already in progress: " .. module._name
    end

    local initialized, initializeError = self:InitializeModule(module)
    if not initialized then
        return false, initializeError
    end

    module._state = "enabling"
    local callback = module._definition.Enable
    if callback ~= nil then
        if type(callback) ~= "function" then
            module._state = "initialized"
            return false, self:_ReportError(module, "Enable", "Enable must be a function")
        end
        local ok, err = self:_CallModule(module, "Enable", callback)
        if not ok then
            self:_ReleaseAllResources(module)
            module._state = "initialized"
            return false, err
        end
    end

    module._state = "enabled"
    return true
end

function Runtime:DisableModule(moduleOrName)
    local module = self:_ResolveModule(moduleOrName)
    if module == nil then
        return false, "Unknown module: " .. tostring(moduleOrName)
    end
    if module._state ~= "enabled" then
        return true
    end

    module._state = "disabling"
    local callback = module._definition.Disable
    local ok = true
    local err = nil

    if callback ~= nil then
        if type(callback) ~= "function" then
            ok = false
            err = self:_ReportError(module, "Disable", "Disable must be a function")
        else
            ok, err = self:_CallModule(module, "Disable", callback)
        end
    end

    -- Cleanup is unconditional, including when the module's Disable callback fails.
    self:_ReleaseAllResources(module)
    module._state = "initialized"
    return ok, err
end

function Runtime:InitializeAll()
    local failures = {}
    local index
    for index = 1, #self._moduleOrder do
        local module = self._moduleOrder[index]
        local ok, err = self:InitializeModule(module)
        if not ok then
            failures[module._name] = err
        end
    end
    return next(failures) == nil, failures
end

function Runtime:EnableAll(predicate)
    if predicate ~= nil and type(predicate) ~= "function" then
        error("Runtime:EnableAll predicate must be a function or nil", 2)
    end

    local failures = {}
    local index
    for index = 1, #self._moduleOrder do
        local module = self._moduleOrder[index]
        if predicate == nil or predicate(module) then
            local ok, err = self:EnableModule(module)
            if not ok then
                failures[module._name] = err
            end
        end
    end
    return next(failures) == nil, failures
end

function Runtime:DisableAll()
    local failures = {}
    local index
    for index = #self._moduleOrder, 1, -1 do
        local module = self._moduleOrder[index]
        local ok, err = self:DisableModule(module)
        if not ok then
            failures[module._name] = err
        end
    end
    return next(failures) == nil, failures
end

function Module:GetName()
    return self._name
end

function Module:Initialize()
    return self._runtime:InitializeModule(self)
end

function Module:Enable()
    return self._runtime:EnableModule(self)
end

function Module:Disable()
    return self._runtime:DisableModule(self)
end

function Module:GetState()
    return self._state
end

function Module:IsInitialized()
    return self._initialized
end

function Module:IsEnabled()
    return self._state == "enabled"
end

function Module:CreateFrame(frameType, name, parent, template, cleanup, label)
    self._runtime:_AssertModuleCanOwnResources(self)
    if type(frameType) ~= "string" or frameType == "" then
        error("Module:CreateFrame expects a non-empty frame type", 2)
    end
    if cleanup ~= nil and type(cleanup) ~= "function" then
        error("Module:CreateFrame cleanup must be a function or nil", 2)
    end

    local frame = self._runtime._environment.CreateFrame(frameType, name, parent, template)
    if type(frame) ~= "table" and type(frame) ~= "userdata" then
        error("CreateFrame did not return a Frame-like object", 2)
    end
    self:OwnFrame(frame, cleanup, label or name or frameType)
    return frame
end

function Module:OwnFrame(frame, cleanup, label)
    if type(frame) ~= "table" and type(frame) ~= "userdata" then
        error("Module:OwnFrame expects a Frame-like table", 2)
    end
    if cleanup ~= nil and type(cleanup) ~= "function" then
        error("Module:OwnFrame cleanup must be a function or nil", 2)
    end

    local record = {
        frame = frame,
        cleanup = cleanup,
        label = label,
    }
    local tracked = self._runtime:_TrackResource(self, "frames", frame, record)
    return tracked.frame
end

function Module:ReleaseFrame(frame)
    self:ClearOnUpdate(frame)
    return self._runtime:_ReleaseResource(self, "frames", frame)
end

function Module:SetOnUpdate(frame, callback, label)
    if self._resources.frames[frame] == nil then
        error("Module:SetOnUpdate only accepts a Frame owned by this module", 2)
    end
    if type(callback) ~= "function" then
        error("Module:SetOnUpdate expects a callback", 2)
    end
    if type(frame.SetScript) ~= "function" then
        error("Module:SetOnUpdate expects Frame:SetScript", 2)
    end

    local existing = self._resources.onUpdates[frame]
    if existing ~= nil then
        existing.callback = callback
        existing.label = label
        return frame
    end

    local record = {
        frame = frame,
        callback = callback,
        label = label,
    }
    self._runtime:_TrackResource(self, "onUpdates", frame, record)
    frame:SetScript("OnUpdate", function(_, elapsed)
        if self._state == "enabled" then
            self._runtime:_CallModule(self, "OnUpdate", record.callback, elapsed)
        end
    end)
    return frame
end

function Module:ClearOnUpdate(frame)
    return self._runtime:_ReleaseResource(self, "onUpdates", frame)
end

function Module:OwnQueue(key, cancel, length, label)
    if key == nil then
        error("Module:OwnQueue expects a non-nil key", 2)
    end
    if type(cancel) ~= "function" then
        error("Module:OwnQueue expects a cancellation callback", 2)
    end
    if length ~= nil and type(length) ~= "function" then
        error("Module:OwnQueue length must be a function or nil", 2)
    end

    local record = {
        cancel = cancel,
        length = length,
        label = label,
    }
    self._runtime:_TrackResource(self, "queues", key, record)
    return key
end

function Module:ReleaseQueue(key)
    return self._runtime:_ReleaseResource(self, "queues", key)
end

function Module:RecordRefresh(duration)
    self._counters.refreshes = self._counters.refreshes + 1
    if duration ~= nil then
        self._counters.lastDuration = duration
    end
end

function Module:RecordScan(duration)
    self._counters.scans = self._counters.scans + 1
    if duration ~= nil then
        self._counters.lastDuration = duration
    end
end

Runtime:RegisterResourceKind("onUpdates", function(_, _, _, record)
    if record.frame and type(record.frame.SetScript) == "function" then
        record.frame:SetScript("OnUpdate", nil)
    end
end)

Runtime:RegisterResourceKind("queues", function(_, _, _, record)
    record.cancel()
end)

Runtime:RegisterResourceKind("frames", function(_, _, _, record)
    if record.cleanup ~= nil then
        record.cleanup(record.frame)
        return
    end
    if record.frame and type(record.frame.SetScript) == "function" then
        record.frame:SetScript("OnUpdate", nil)
    end
    if record.frame and type(record.frame.Hide) == "function" then
        record.frame:Hide()
    end
end)

function Runtime:RegisterDiagnosticProvider(name, provider)
    if type(name) ~= "string" or name == "" then
        error("Diagnostic provider name must be a non-empty string", 2)
    end
    if type(provider) ~= "function" then
        error("Diagnostic provider must be a function", 2)
    end
    if self._diagnosticProviders[name] ~= nil then
        error("Diagnostic provider already registered: " .. name, 2)
    end
    self._diagnosticProviders[name] = provider
end

function Runtime:_SnapshotModule(module)
    local queueLength = 0
    local _, queue
    for _, queue in pairs(module._resources.queues) do
        if queue.length ~= nil then
            local ok, value = pcall(queue.length)
            if ok and type(value) == "number" and value > 0 then
                queueLength = queueLength + value
            end
        end
    end

    local eventCount = countEntries(module._resources.events)
    local hookCount = countEntries(module._resources.hooks)
    local timerCount = countEntries(module._resources.timers)
    local tickerCount = countEntries(module._resources.tickers)
    local refreshPendingCount = countEntries(module._resources.refreshes)
    local driverConsumerCount = countEntries(module._resources.drivers)
    local onUpdateCount = countEntries(module._resources.onUpdates)
    local frameCount = countEntries(module._resources.frames)
    local queueOwnerCount = countEntries(module._resources.queues)

    return {
        name = module._name,
        state = module._state,
        initialized = module._initialized,
        enabled = module._state == "enabled",
        eventCount = eventCount,
        eventFrameAllocated = module._eventFrame ~= nil,
        eventFrameActive = module._eventFrameActive,
        hookCount = hookCount,
        timerCount = timerCount + refreshPendingCount,
        tickerCount = tickerCount,
        refreshPendingCount = refreshPendingCount,
        driverConsumerCount = driverConsumerCount,
        onUpdateCount = onUpdateCount,
        frameCount = frameCount,
        queueOwnerCount = queueOwnerCount,
        queueLength = queueLength,
        refreshCount = module._counters.refreshes,
        scanCount = module._counters.scans,
        lastDuration = module._counters.lastDuration,
        errorCount = module._errorCount,
        lastError = module._lastError and {
            phase = module._lastError.phase,
            message = module._lastError.message,
        } or nil,
        activeResources = eventCount + hookCount + timerCount + tickerCount + refreshPendingCount
            + driverConsumerCount + onUpdateCount + frameCount + queueOwnerCount,
    }
end

function Runtime:GetDiagnostics(moduleName)
    if moduleName ~= nil then
        local module = self:_ResolveModule(moduleName)
        if module == nil then
            return nil
        end
        return self:_SnapshotModule(module)
    end

    local snapshot = {
        modules = {},
        totals = {
            registeredModules = #self._moduleOrder,
            enabledModules = 0,
            events = 0,
            hooks = 0,
            timers = 0,
            tickers = 0,
            driverConsumers = 0,
            onUpdates = 0,
            frames = 0,
            queueOwners = 0,
            queueLength = 0,
            activeResources = 0,
            errors = self._errorCount,
        },
    }

    local index
    for index = 1, #self._moduleOrder do
        local moduleSnapshot = self:_SnapshotModule(self._moduleOrder[index])
        snapshot.modules[moduleSnapshot.name] = moduleSnapshot
        if moduleSnapshot.enabled then
            snapshot.totals.enabledModules = snapshot.totals.enabledModules + 1
        end
        snapshot.totals.events = snapshot.totals.events + moduleSnapshot.eventCount
        snapshot.totals.hooks = snapshot.totals.hooks + moduleSnapshot.hookCount
        snapshot.totals.timers = snapshot.totals.timers + moduleSnapshot.timerCount
        snapshot.totals.tickers = snapshot.totals.tickers + moduleSnapshot.tickerCount
        snapshot.totals.driverConsumers = snapshot.totals.driverConsumers + moduleSnapshot.driverConsumerCount
        snapshot.totals.onUpdates = snapshot.totals.onUpdates + moduleSnapshot.onUpdateCount
        snapshot.totals.frames = snapshot.totals.frames + moduleSnapshot.frameCount
        snapshot.totals.queueOwners = snapshot.totals.queueOwners + moduleSnapshot.queueOwnerCount
        snapshot.totals.queueLength = snapshot.totals.queueLength + moduleSnapshot.queueLength
        snapshot.totals.activeResources = snapshot.totals.activeResources + moduleSnapshot.activeResources
    end

    local name
    local provider
    for name, provider in pairs(self._diagnosticProviders) do
        local ok, value = pcall(provider)
        if ok then
            snapshot[name] = value
        else
            snapshot[name] = {
                error = tostring(value),
            }
        end
    end

    return snapshot
end

function Runtime:CheckResourceLeaks(moduleOrName)
    local snapshot = self:GetDiagnostics(moduleOrName)
    if snapshot == nil then
        return false, {
            unknownModule = true,
        }
    end

    local leaks = {}
    local fields = {
        "eventCount",
        "hookCount",
        "timerCount",
        "tickerCount",
        "driverConsumerCount",
        "onUpdateCount",
        "frameCount",
        "queueOwnerCount",
    }
    local index
    for index = 1, #fields do
        local field = fields[index]
        if snapshot[field] ~= 0 then
            leaks[field] = snapshot[field]
        end
    end
    return next(leaks) == nil, leaks
end

Runtime._ModulePrototype = Module
ns.Runtime = Runtime

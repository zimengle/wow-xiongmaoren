local _, ns = ...

local Runtime = ns and ns.Runtime
if type(Runtime) ~= "table" or type(Runtime._ModulePrototype) ~= "table" then
    error("RurutiaSuite Runtime.lua must load before Scheduler.lua", 2)
end

local Module = Runtime._ModulePrototype
local ScheduleHandle = {}
ScheduleHandle.__index = ScheduleHandle

local drivers = {}

local function cancelNativeHandle(handle)
    if handle ~= nil and type(handle.Cancel) == "function" then
        handle:Cancel()
    end
end

local function cleanSchedule(_, _, _, record)
    record.cancelled = true
    cancelNativeHandle(record.native)
end

Runtime:RegisterResourceKind("timers", cleanSchedule)
Runtime:RegisterResourceKind("tickers", cleanSchedule)
Runtime:RegisterResourceKind("refreshes", cleanSchedule)

function ScheduleHandle:Cancel()
    return self.module:CancelSchedule(self)
end

local function createSchedule(module, kind, interval, callback, label)
    module._runtime:_AssertModuleCanOwnResources(module)
    if type(interval) ~= "number" or interval < 0 then
        error("Schedule interval must be a non-negative number", 3)
    end
    if type(callback) ~= "function" then
        error("Schedule callback must be a function", 3)
    end

    local handle = setmetatable({
        module = module,
        kind = kind,
    }, ScheduleHandle)
    local record = {
        handle = handle,
        callback = callback,
        cancelled = false,
        label = label,
        native = nil,
    }
    module._runtime:_TrackResource(module, kind, handle, record)

    local function invoke()
        if record.cancelled then
            return
        end

        if kind == "timers" or kind == "refreshes" then
            module._runtime:_ReleaseResource(module, kind, handle)
        end

        if module._state == "enabled" then
            if kind == "refreshes" then
                module:RecordRefresh()
            end
            module._runtime:_CallModule(module, kind == "tickers" and "Ticker" or "Timer", record.callback, handle)
        end
    end

    local ok
    local nativeOrError
    if kind == "tickers" then
        if interval <= 0 then
            module._runtime:_ReleaseResource(module, kind, handle)
            error("Repeating ticker interval must be greater than zero", 3)
        end
        ok, nativeOrError = pcall(module._runtime._environment.NewTicker, interval, invoke)
    else
        ok, nativeOrError = pcall(module._runtime._environment.NewTimer, interval, invoke)
    end

    if not ok or nativeOrError == nil then
        module._runtime:_ReleaseResource(module, kind, handle)
        error("Unable to create schedule: " .. tostring(nativeOrError), 3)
    end
    record.native = nativeOrError
    return handle
end

function Module:Schedule(delay, callback, label)
    return createSchedule(self, "timers", delay, callback, label)
end

function Module:ScheduleRepeating(interval, callback, label)
    return createSchedule(self, "tickers", interval, callback, label)
end

function Module:CancelSchedule(handle)
    if type(handle) ~= "table" or handle.module ~= self then
        return false
    end
    local key = handle.kind == "refreshes" and handle.refreshKey or handle
    return self._runtime:_ReleaseResource(self, handle.kind, key)
end

function Module:RequestRefresh(key, callback, delay)
    if key == nil then
        error("Module:RequestRefresh expects a non-nil key", 2)
    end
    if type(callback) ~= "function" then
        error("Module:RequestRefresh expects a callback", 2)
    end
    if delay == nil then
        delay = 0
    end

    local existing = self._resources.refreshes[key]
    if existing ~= nil then
        existing.callback = callback
        return existing.handle
    end

    self._runtime:_AssertModuleCanOwnResources(self)
    if type(delay) ~= "number" or delay < 0 then
        error("Refresh delay must be a non-negative number", 2)
    end

    local handle = setmetatable({
        module = self,
        kind = "refreshes",
        refreshKey = key,
    }, ScheduleHandle)
    local record = {
        handle = handle,
        callback = callback,
        cancelled = false,
        label = tostring(key),
        phase = "Refresh:" .. tostring(key),
        native = nil,
    }
    self._runtime:_TrackResource(self, "refreshes", key, record)

    local function invoke()
        if record.cancelled then
            return
        end
        self._runtime:_ReleaseResource(self, "refreshes", key)
        if self._state == "enabled" then
            self:RecordRefresh()
            self._runtime:_CallModule(self, record.phase, record.callback, handle)
        end
    end

    local ok, nativeOrError = pcall(self._runtime._environment.NewTimer, delay, invoke)
    if not ok or nativeOrError == nil then
        self._runtime:_ReleaseResource(self, "refreshes", key)
        error("Unable to create refresh schedule: " .. tostring(nativeOrError), 2)
    end
    record.native = nativeOrError
    return handle
end

function Module:CancelRefresh(key)
    return self._runtime:_ReleaseResource(self, "refreshes", key)
end

local Driver = {}
Driver.__index = Driver

function Driver:_Start()
    if self.running then
        return
    end

    if self.frame == nil then
        local frame = self.runtime._environment.CreateFrame("Frame")
        if (type(frame) ~= "table" and type(frame) ~= "userdata") or type(frame.SetScript) ~= "function" then
            error("CreateFrame did not return a Frame-like table for driver " .. self.name, 3)
        end
        self.frame = frame
        self.onUpdate = function(_, elapsed)
            self:_Tick(elapsed)
        end
    end

    self.frame:SetScript("OnUpdate", self.onUpdate)
    if type(self.frame.Show) == "function" then
        self.frame:Show()
    end
    self.running = true
    self.startCount = self.startCount + 1
end

function Driver:_Stop()
    if not self.running then
        return
    end
    self.frame:SetScript("OnUpdate", nil)
    if type(self.frame.Hide) == "function" then
        self.frame:Hide()
    end
    self.running = false
    self.stopCount = self.stopCount + 1
end

function Driver:Add(module, key, callback)
    local ownerEntries = self.byOwner[module]
    if ownerEntries == nil then
        ownerEntries = {}
        self.byOwner[module] = ownerEntries
    end

    local existing = ownerEntries[key]
    if existing ~= nil then
        existing.callback = callback
        return existing, false
    end

    local entry = {
        owner = module,
        key = key,
        callback = callback,
        index = #self.entries + 1,
        bornTick = self.tickCount,
        lastTick = 0,
        active = true,
    }
    self.entries[entry.index] = entry
    ownerEntries[key] = entry

    if #self.entries == 1 then
        self:_Start()
    end
    return entry, true
end

function Driver:Remove(module, key)
    local ownerEntries = self.byOwner[module]
    if ownerEntries == nil then
        return false
    end

    local entry = ownerEntries[key]
    if entry == nil then
        return false
    end

    ownerEntries[key] = nil
    if next(ownerEntries) == nil then
        self.byOwner[module] = nil
    end

    local index = entry.index
    local lastIndex = #self.entries
    local lastEntry = self.entries[lastIndex]
    self.entries[lastIndex] = nil
    if index ~= lastIndex then
        self.entries[index] = lastEntry
        lastEntry.index = index
    end
    entry.active = false
    entry.index = 0

    if #self.entries == 0 then
        self:_Stop()
    end
    return true
end

function Driver:_Tick(elapsed)
    if not self.running or #self.entries == 0 then
        return
    end

    self.tickCount = self.tickCount + 1
    local tick = self.tickCount
    local index = #self.entries

    while index >= 1 do
        if index > #self.entries then
            index = #self.entries
        else
            local entry = self.entries[index]
            if entry ~= nil and entry.active and entry.bornTick < tick and entry.lastTick ~= tick then
                entry.lastTick = tick
                if entry.owner._state == "enabled" then
                    self.runtime:_CallModule(entry.owner, self.phase, entry.callback, elapsed, entry.key)
                end
            end
            index = index - 1
        end
    end
end

local function getDriver(name)
    local driver = drivers[name]
    if driver == nil then
        driver = setmetatable({
            runtime = Runtime,
            name = name,
            phase = "Driver:" .. name,
            entries = {},
            byOwner = {},
            frame = nil,
            running = false,
            tickCount = 0,
            startCount = 0,
            stopCount = 0,
        }, Driver)
        drivers[name] = driver
    end
    return driver
end

Runtime:RegisterResourceKind("drivers", function(_, module, _, record)
    record.driver:Remove(module, record.key)
    local ownership = module._driverOwnership
    local byDriver = ownership and ownership[record.driver.name]
    if byDriver ~= nil then
        byDriver[record.key] = nil
        if next(byDriver) == nil then
            ownership[record.driver.name] = nil
        end
    end
end)

function Module:AddDriverConsumer(driverName, key, callback)
    if type(driverName) ~= "string" or driverName == "" then
        error("Module:AddDriverConsumer expects a non-empty driver name", 2)
    end
    if key == nil then
        error("Module:AddDriverConsumer expects a non-nil key", 2)
    end
    if type(callback) ~= "function" then
        error("Module:AddDriverConsumer expects a callback", 2)
    end

    self._runtime:_AssertModuleCanOwnResources(self)
    local ownership = self._driverOwnership
    if ownership == nil then
        ownership = {}
        self._driverOwnership = ownership
    end
    local byDriver = ownership[driverName]
    if byDriver == nil then
        byDriver = {}
        ownership[driverName] = byDriver
    end

    local ownerKey = byDriver[key]
    local existing = ownerKey and self._resources.drivers[ownerKey] or nil
    local driver = getDriver(driverName)
    if existing ~= nil then
        existing.callback = callback
        driver:Add(self, key, callback)
        return ownerKey
    end

    driver:Add(self, key, callback)
    ownerKey = {}
    byDriver[key] = ownerKey
    local record = {
        driver = driver,
        key = key,
        callback = callback,
    }
    self._runtime:_TrackResource(self, "drivers", ownerKey, record)
    return ownerKey
end

function Module:RemoveDriverConsumer(driverName, key)
    local ownership = self._driverOwnership
    local byDriver = ownership and ownership[driverName]
    local ownerKey = byDriver and byDriver[key]
    if ownerKey == nil then
        return false
    end
    return self._runtime:_ReleaseResource(self, "drivers", ownerKey)
end

Runtime:RegisterDiagnosticProvider("drivers", function()
    local snapshot = {}
    local name
    local driver
    for name, driver in pairs(drivers) do
        snapshot[name] = {
            consumerCount = #driver.entries,
            running = driver.running,
            frameAllocated = driver.frame ~= nil,
            tickCount = driver.tickCount,
            startCount = driver.startCount,
            stopCount = driver.stopCount,
        }
    end
    return snapshot
end)

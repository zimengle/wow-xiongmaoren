local _, ns = ...

local Runtime = ns and ns.Runtime
if type(Runtime) ~= "table" or type(Runtime._ModulePrototype) ~= "table" then
    error("RurutiaSuite Runtime.lua must load before Hooks.lua", 2)
end

local Module = Runtime._ModulePrototype
local Broker = {}
Broker.__index = Broker

-- Frame and method targets stay in external weak-key maps. RS never writes
-- ownership markers or callbacks onto Blizzard/third-party objects.
local globalFunctionBrokers = {}
local methodBrokers = setmetatable({}, { __mode = "k" })
local frameScriptBrokers = setmetatable({}, { __mode = "k" })
local nextBrokerId = 0

function Broker:Add(module, callback)
    local existing = self.byOwner[module]
    if existing ~= nil then
        existing.callback = callback
        return existing, false
    end

    local entry = {
        owner = module,
        callback = callback,
        index = #self.entries + 1,
        bornDispatch = self.dispatchCount,
        lastDispatch = 0,
        active = true,
    }
    self.entries[entry.index] = entry
    self.byOwner[module] = entry
    return entry, true
end

function Broker:Remove(module)
    local entry = self.byOwner[module]
    if entry == nil then
        return false
    end

    self.byOwner[module] = nil
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
    return true
end

function Broker:_Dispatch(...)
    self.dispatchCount = self.dispatchCount + 1
    local dispatch = self.dispatchCount
    local index = #self.entries

    while index >= 1 do
        if index > #self.entries then
            index = #self.entries
        else
            local entry = self.entries[index]
            if entry ~= nil and entry.active and entry.bornDispatch < dispatch
                and entry.lastDispatch ~= dispatch then
                entry.lastDispatch = dispatch
                if entry.owner._state == "enabled" then
                    self.runtime:_CallModule(entry.owner, self.phase, entry.callback, ...)
                end
            end
            index = index - 1
        end
    end
end

local function createBroker(kind, label)
    nextBrokerId = nextBrokerId + 1
    label = tostring(label)
    local broker = setmetatable({
        runtime = Runtime,
        id = nextBrokerId,
        kind = kind,
        label = label,
        phase = "Hook:" .. kind .. ":" .. label,
        entries = {},
        byOwner = {},
        dispatchCount = 0,
        physicallyInstalled = false,
    }, Broker)

    -- Physical secure hooks cannot be detached. This guard is the required
    -- disabled fast path: inert brokers never enter the dispatch loop.
    broker.wrapper = function(...)
        if #broker.entries == 0 then
            return
        end
        broker:_Dispatch(...)
    end
    return broker
end

local function installGlobalFunctionBroker(functionName)
    local existing = globalFunctionBrokers[functionName]
    if existing ~= nil then
        return existing
    end

    local broker = createBroker("global-function", functionName)
    local ok, err = pcall(Runtime._environment.HookSecureFunc, functionName, broker.wrapper)
    if not ok then
        error("Unable to secure-hook global function " .. functionName .. ": " .. tostring(err), 3)
    end
    broker.physicallyInstalled = true
    globalFunctionBrokers[functionName] = broker
    return broker
end

local function installMethodBroker(target, methodName, label)
    local byMethod = methodBrokers[target]
    if byMethod == nil then
        byMethod = {}
        methodBrokers[target] = byMethod
    end
    local existing = byMethod[methodName]
    if existing ~= nil then
        return existing
    end

    local broker = createBroker("table-method", label or methodName)
    local ok, err = pcall(Runtime._environment.HookSecureFunc, target, methodName, broker.wrapper)
    if not ok then
        error("Unable to secure-hook table method " .. methodName .. ": " .. tostring(err), 3)
    end
    broker.physicallyInstalled = true
    byMethod[methodName] = broker
    return broker
end

local function installFrameScriptBroker(frame, scriptName, label)
    local byScript = frameScriptBrokers[frame]
    if byScript == nil then
        byScript = {}
        frameScriptBrokers[frame] = byScript
    end
    local existing = byScript[scriptName]
    if existing ~= nil then
        return existing
    end

    local hookScript = frame.HookScript
    if type(hookScript) ~= "function" then
        error("Module:HookFrameScript expects Frame:HookScript", 3)
    end

    local broker = createBroker("frame-script", label or scriptName)
    local ok, err = pcall(hookScript, frame, scriptName, broker.wrapper)
    if not ok then
        error("Unable to hook Frame script " .. scriptName .. ": " .. tostring(err), 3)
    end
    broker.physicallyInstalled = true
    byScript[scriptName] = broker
    return broker
end

local function ownBroker(module, broker, callback)
    module._runtime:_AssertModuleCanOwnResources(module)
    local ownership = module._hookOwnership
    if ownership == nil then
        ownership = {}
        module._hookOwnership = ownership
    end

    local token = ownership[broker]
    local existing = token and module._resources.hooks[token] or nil
    if existing ~= nil then
        existing.callback = callback
        broker:Add(module, callback)
        return token
    end

    broker:Add(module, callback)
    token = {}
    ownership[broker] = token
    module._runtime:_TrackResource(module, "hooks", token, {
        broker = broker,
        callback = callback,
    })
    return token
end

Runtime:RegisterResourceKind("hooks", function(_, module, _, record)
    record.broker:Remove(module)
    if module._hookOwnership ~= nil then
        module._hookOwnership[record.broker] = nil
    end
end)

function Module:HookSecureFunction(target, methodOrCallback, callbackOrLabel, label)
    self._runtime:_AssertModuleCanOwnResources(self)

    local broker
    local callback
    if type(target) == "string" then
        if target == "" then
            error("Module:HookSecureFunction expects a non-empty function name", 2)
        end
        callback = methodOrCallback
        label = callbackOrLabel
        if type(callback) ~= "function" then
            error("Module:HookSecureFunction expects a callback", 2)
        end
        broker = installGlobalFunctionBroker(target)
    else
        if type(target) ~= "table" and type(target) ~= "userdata" then
            error("Module:HookSecureFunction expects a function name or table target", 2)
        end
        local methodName = methodOrCallback
        callback = callbackOrLabel
        if type(methodName) ~= "string" or methodName == "" then
            error("Module:HookSecureFunction expects a non-empty method name", 2)
        end
        if type(callback) ~= "function" then
            error("Module:HookSecureFunction expects a callback", 2)
        end
        broker = installMethodBroker(target, methodName, label)
    end

    return ownBroker(self, broker, callback)
end

function Module:HookFrameScript(frame, scriptName, callback, label)
    self._runtime:_AssertModuleCanOwnResources(self)
    if type(frame) ~= "table" and type(frame) ~= "userdata" then
        error("Module:HookFrameScript expects a Frame-like target", 2)
    end
    if type(scriptName) ~= "string" or scriptName == "" then
        error("Module:HookFrameScript expects a non-empty script name", 2)
    end
    if type(callback) ~= "function" then
        error("Module:HookFrameScript expects a callback", 2)
    end

    local broker = installFrameScriptBroker(frame, scriptName, label)
    return ownBroker(self, broker, callback)
end

function Module:RemoveHook(token)
    if type(token) ~= "table" then
        return false
    end
    return self._runtime:_ReleaseResource(self, "hooks", token)
end

local function accumulateBrokers(snapshot, brokers)
    local _, broker
    for _, broker in pairs(brokers) do
        if broker.physicallyInstalled then
            snapshot.physicalHooks = snapshot.physicalHooks + 1
            snapshot.dispatchCount = snapshot.dispatchCount + broker.dispatchCount
            snapshot.activeSubscriptions = snapshot.activeSubscriptions + #broker.entries
            if #broker.entries == 0 then
                snapshot.inertHooks = snapshot.inertHooks + 1
            else
                snapshot.activeHooks = snapshot.activeHooks + 1
            end
            snapshot.byKind[broker.kind] = snapshot.byKind[broker.kind] + 1
        end
    end
end

Runtime:RegisterDiagnosticProvider("hooks", function()
    local snapshot = {
        physicalHooks = 0,
        activeHooks = 0,
        inertHooks = 0,
        activeSubscriptions = 0,
        dispatchCount = 0,
        byKind = {
            ["global-function"] = 0,
            ["table-method"] = 0,
            ["frame-script"] = 0,
        },
    }

    accumulateBrokers(snapshot, globalFunctionBrokers)
    local _, brokers
    for _, brokers in pairs(methodBrokers) do
        accumulateBrokers(snapshot, brokers)
    end
    for _, brokers in pairs(frameScriptBrokers) do
        accumulateBrokers(snapshot, brokers)
    end
    return snapshot
end)

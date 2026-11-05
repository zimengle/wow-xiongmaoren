local _, ns = ...

local Runtime = ns and ns.Runtime
if type(Runtime) ~= "table" or type(Runtime._ModulePrototype) ~= "table" then
    error("RurutiaSuite Runtime.lua must load before Events.lua", 2)
end

local Module = Runtime._ModulePrototype

Runtime:RegisterResourceKind("events", function(_, module, event, record)
    if record.frame and type(record.frame.UnregisterEvent) == "function" then
        record.frame:UnregisterEvent(event)
    end
    if next(module._resources.events) == nil and record.frame and type(record.frame.SetScript) == "function" then
        record.frame:SetScript("OnEvent", nil)
        module._eventFrameActive = false
    end
end)

local function ensureEventFrame(module)
    local frame = module._eventFrame
    if frame == nil then
        frame = module._runtime._environment.CreateFrame("Frame")
        if (type(frame) ~= "table" and type(frame) ~= "userdata") or type(frame.SetScript) ~= "function" then
            error("CreateFrame did not return a Frame-like table", 3)
        end
        module._eventFrame = frame
    end

    if not module._eventFrameActive then
        frame:SetScript("OnEvent", function(_, event, ...)
            if module._state ~= "enabled" then
                return
            end

            local record = module._resources.events[event]
            if record ~= nil then
                module._runtime:_CallModule(module, record.phase, record.callback, event, ...)
            end
        end)
        module._eventFrameActive = true
    end
    return frame
end

function Module:RegisterEvent(event, callback)
    if type(event) ~= "string" or event == "" then
        error("Module:RegisterEvent expects a non-empty event name", 2)
    end
    if type(callback) ~= "function" then
        error("Module:RegisterEvent expects a callback", 2)
    end

    self._runtime:_AssertModuleCanOwnResources(self)
    local existing = self._resources.events[event]
    if existing ~= nil then
        existing.callback = callback
        return event
    end

    local frame = ensureEventFrame(self)
    if type(frame.RegisterEvent) ~= "function" then
        error("Event Frame does not provide RegisterEvent", 2)
    end

    local record = {
        frame = frame,
        callback = callback,
        phase = "Event:" .. event,
    }
    self._runtime:_TrackResource(self, "events", event, record)

    local ok, result = pcall(frame.RegisterEvent, frame, event)
    if not ok or result == false then
        self._runtime:_ReleaseResource(self, "events", event)
        error("Unable to register event " .. event .. ": " .. tostring(result), 2)
    end

    return event
end

function Module:UnregisterEvent(event)
    return self._runtime:_ReleaseResource(self, "events", event)
end

function Module:UnregisterAllEvents()
    self._runtime:_ReleaseResourceKind(self, "events")
end

local _, ns = ...

-- Extensions v1 的底层 Runtime 每个 WoW 事件只有一个回调槽。
-- EventHub 统一注册后再向 RSS 子服务分发，避免后注册者覆盖前者。
local EventHub = {
    subscribers = {},
    registered = {},
    nextToken = 0,
}
ns.EventHub = EventHub

local function Dispatch(self, event, ...)
    local bucket = self.subscribers[event]
    if type(bucket) ~= "table" then return end
    local snapshot = {}
    local token, callback
    for token, callback in pairs(bucket) do snapshot[token] = callback end
    local firstFailure
    for _, callback in pairs(snapshot) do
        local ok, reason = pcall(callback, event, ...)
        if not ok and not firstFailure then firstFailure = reason end
    end
    if firstFailure then error(firstFailure, 0) end
end

function EventHub:Enable(handle)
    if self.enabled then return true end
    self.handle = handle
    self.enabled = true
    return true
end

function EventHub:Subscribe(event, callback)
    if not self.enabled or type(self.handle) ~= "table" then
        return nil, "RSS event hub is disabled"
    end
    if type(event) ~= "string" or event == "" or type(callback) ~= "function" then
        return nil, "invalid RSS event subscription"
    end
    local bucket = self.subscribers[event]
    if not bucket then
        bucket = {}
        self.subscribers[event] = bucket
    end
    if not self.registered[event] then
        local registered, reason = self.handle:RegisterEvent(event, function(_, firedEvent, ...)
            Dispatch(self, firedEvent, ...)
        end)
        if not registered then
            self.subscribers[event] = nil
            return nil, reason
        end
        self.registered[event] = true
    end
    self.nextToken = self.nextToken + 1
    local token = { event = event, id = self.nextToken }
    bucket[token] = callback
    return token
end

function EventHub:Unsubscribe(token)
    if type(token) ~= "table" then return false end
    local event = token.event
    local bucket = self.subscribers[event]
    if type(bucket) ~= "table" or bucket[token] == nil then return false end
    bucket[token] = nil
    if next(bucket) == nil then
        self.subscribers[event] = nil
        if self.handle and self.registered[event] then self.handle:UnregisterEvent(event) end
        self.registered[event] = nil
    end
    return true
end

function EventHub:Disable()
    if self.handle then
        for event in pairs(self.registered) do self.handle:UnregisterEvent(event) end
    end
    self.subscribers = {}
    self.registered = {}
    self.handle = nil
    self.enabled = false
    return true
end

function EventHub:GetSubscriberCount(event)
    local count = 0
    for _ in pairs(self.subscribers[event] or {}) do count = count + 1 end
    return count
end

return EventHub

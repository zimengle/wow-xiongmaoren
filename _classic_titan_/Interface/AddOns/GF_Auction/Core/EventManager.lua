--[[
    GF_Auction EventManager Module
    Unified event registration, throttling, and distribution
]]

local L = GF_Auction_L

-- Create EventManager module
local EventManager = {}

-- Register module
if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("EventManager", EventManager)
end

-- Event frame
local eventFrame = nil

-- Event subscribers (module -> events mapping)
local subscribers = {}

-- Event throttling
local throttleData = {}
local DEFAULT_THROTTLE = 1.0 -- seconds

-- Initialize event manager
function EventManager:Initialize()
    if eventFrame then
        return true
    end
    
    eventFrame = CreateFrame("Frame", "GF_Auction_EventFrame")
    
    -- Register auction house events
    self:RegisterEvent("AUCTION_HOUSE_SHOW")
    self:RegisterEvent("AUCTION_HOUSE_CLOSED")
    self:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
    self:RegisterEvent("AUCTION_MULTISELL_START")
    self:RegisterEvent("AUCTION_MULTISELL_UPDATE")
    self:RegisterEvent("AUCTION_MULTISELL_FAILURE")
    
    -- Set event handler
    eventFrame:SetScript("OnEvent", function(self, event, ...)
        EventManager:OnEvent(event, ...)
    end)
    
    return true
end

-- Register event
function EventManager:RegisterEvent(event)
    if not eventFrame then
        return false
    end
    
    local success, err = pcall(function()
        eventFrame:RegisterEvent(event)
    end)
    
    if not success then
        return false
    end
    
    return true
end

-- Unregister event
function EventManager:UnregisterEvent(event)
    if not eventFrame then
        return false
    end
    
    eventFrame:UnregisterEvent(event)
    return true
end

-- Subscribe module to events
function EventManager:Subscribe(module, events, callback, throttle)
    if not module or not events or not callback then
        return false
    end
    
    -- Normalize events to table
    if type(events) == "string" then
        events = {events}
    end
    
    -- Initialize module subscription
    if not subscribers[module] then
        subscribers[module] = {}
    end
    
    -- Add subscription for each event
    for _, event in ipairs(events) do
        if not subscribers[module][event] then
            subscribers[module][event] = {}
        end
        
        table.insert(subscribers[module][event], {
            callback = callback,
            throttle = throttle or DEFAULT_THROTTLE
        })
        
        -- Register event if not already registered
        self:RegisterEvent(event)
    end
    
    return true
end

-- Unsubscribe module from events
function EventManager:Unsubscribe(module, events)
    if not module or not subscribers[module] then
        return false
    end
    
    -- Normalize events to table
    if type(events) == "string" then
        events = {events}
    end
    
    -- Remove subscriptions
    for _, event in ipairs(events) do
        if subscribers[module][event] then
            subscribers[module][event] = nil
            local hasSubscribers = false
            for mod, modEvents in pairs(subscribers) do
                if modEvents[event] then
                    hasSubscribers = true
                    break
                end
            end
            if not hasSubscribers then
                self:UnregisterEvent(event)
            end
        end
    end
    
    -- Clean up empty module entry
    if next(subscribers[module]) == nil then
        subscribers[module] = nil
    end
    
    return true
end

-- Unsubscribe module from all events
function EventManager:UnsubscribeAll(module)
    if not module then
        return false
    end
    
    subscribers[module] = nil
    return true
end

-- Main event handler
function EventManager:OnEvent(event, ...)
    if not event then
        return
    end
    
    -- Distribute event to all subscribers
    for module, moduleEvents in pairs(subscribers) do
        if moduleEvents[event] then
            for _, subscription in ipairs(moduleEvents[event]) do
                self:CallCallback(subscription, event, ...)
            end
        end
    end
end

-- Call callback with throttling
function EventManager:CallCallback(subscription, event, ...)
    if not subscription or not subscription.callback then
        return
    end
    
    local throttle = subscription.throttle or DEFAULT_THROTTLE
    local throttleKey = tostring(subscription.callback) .. event
    
    -- Check throttle
    local currentTime = GetTime()
    local lastCall = throttleData[throttleKey]
    
    if lastCall and (currentTime - lastCall) < throttle then
        return -- Throttled
    end
    
    -- Update throttle time
    throttleData[throttleKey] = currentTime
    
    -- Call callback with error handling
    local success, err = pcall(subscription.callback, event, ...)
    
    -- Errors are silently handled to avoid spam
    if not success then
        -- Error logged but not displayed
    end
end

-- Check if event is registered
function EventManager:IsEventRegistered(event)
    if not eventFrame then
        return false
    end
    
    return eventFrame:IsEventRegistered(event)
end

-- Get event frame (for advanced usage)
function EventManager:GetEventFrame()
    return eventFrame
end

-- Clear throttle data
function EventManager:ClearThrottle()
    throttleData = {}
end

-- Clear throttle for specific event
function EventManager:ClearThrottleForEvent(event)
    if not event then
        return
    end
    
    for key, _ in pairs(throttleData) do
        if string.find(key, event) then
            throttleData[key] = nil
        end
    end
end

-- Fire custom event (for internal use)
function EventManager:FireEvent(event, ...)
    if not event then
        return false
    end
    
    self:OnEvent(event, ...)
    return true
end


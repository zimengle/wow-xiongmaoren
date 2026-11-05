-- 文件职责：独占 Retail C_EventScheduler、大地图状态、时钟与航点能力的窄边界。
-- 不负责：差异 DB、Runtime 资源、Frame 创建、固定 eventID 或猜测时刻表。

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")
    and ns.Build.HasModule and ns.Build.HasModule("CursedTide")) then return end

local Map = ns.WorldMapAttachment
if type(Map) ~= "table" then error("CursedTide Adapter requires WorldMapAttachment", 2) end

local Adapter = { family = "retail", buildId = "retail", targetAddon = "Blizzard_WorldMap" }

-- Scheduler values must be public before conversion, indexing, comparison or formatting.
-- Keep unreadable timestamps out of the shared model; a later refresh can restore them.
local function ReadPublicNumber(value)
    if type(_G.issecretvalue) == "function" and _G.issecretvalue(value) then return nil end
    if type(value) ~= "number" and type(value) ~= "string" then return nil end
    value = tonumber(value)
    if not value or value ~= value or value == math.huge or value == -math.huge then return nil end
    return value
end

local function Clamp(value, low, high, fallback)
    value = tonumber(value)
    if not value or value ~= value or value == math.huge or value == -math.huge then value = fallback end
    if value < low then return low end
    if value > high then return high end
    return value
end

local function Visit(values, callback)
    if type(values) ~= "table" then return end
    local seen = {}
    local _, value
    for _, value in ipairs(values) do
        if type(value) == "table" then seen[value] = true callback(value) end
    end
    for _, value in pairs(values) do
        if type(value) == "table" and not seen[value] then callback(value) end
    end
end

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() or false
end

function Adapter:IsWorldMapAvailable() return Map:IsAvailable() end
function Adapter:IsWorldMapVisible() return Map:IsVisible() end
function Adapter:ResolveAttachment() return Map:Resolve() end
function Adapter:SubscribeMapState(owner, callback) return Map:SubscribeState(owner, callback) end

function Adapter:GetCurrentMapID()
    local frame = Map:Resolve()
    if not frame or type(frame.GetMapID) ~= "function" then return nil end
    return tonumber(frame:GetMapID())
end

function Adapter:IsTargetMap(mapID)
    return self:IsWorldMapVisible() and self:GetCurrentMapID() == tonumber(mapID)
end

function Adapter:GetNow()
    return type(_G.time) == "function" and tonumber(_G.time()) or 0
end

function Adapter:FormatClock(timestamp)
    if type(_G.date) ~= "function" or type(timestamp) ~= "number" then return "--:--" end
    local info = _G.date("*t", timestamp)
    if type(info) ~= "table" then return "--:--" end
    return string.format("%02d:%02d", tonumber(info.hour) or 0, tonumber(info.min) or 0)
end

function Adapter:GetSchedulerStatus()
    local api = _G.C_EventScheduler
    if type(api) ~= "table" or type(api.GetScheduledEvents) ~= "function"
        or type(api.GetOngoingEvents) ~= "function" or type(api.RequestEvents) ~= "function" then
        return "unsupported"
    end
    if type(api.HasData) == "function" then
        local ok, ready = pcall(api.HasData)
        if not ok then return "unavailable" end
        if not ready then return "waiting" end
    end
    return "ready"
end

function Adapter:RequestEvents()
    local api = _G.C_EventScheduler
    if type(api) ~= "table" or type(api.RequestEvents) ~= "function" then return false, "unsupported" end
    local ok = pcall(api.RequestEvents)
    return ok, ok and nil or "request_failed"
end

function Adapter:ReadEvents(data)
    local status = self:GetSchedulerStatus()
    if status ~= "ready" then return nil, status end
    local api = _G.C_EventScheduler
    local now = self:GetNow()
    local activeByPoi, active, upcoming, seen = {}, {}, {}, {}

    local ongoingOK, ongoing = pcall(api.GetOngoingEvents)
    local scheduledOK, scheduled = pcall(api.GetScheduledEvents)
    if not ongoingOK or not scheduledOK then return nil, "unavailable" end

    Visit(ongoing, function(info)
        local poi = ReadPublicNumber(info.areaPoiID)
        local definition = poi and data.activitiesByPoi[poi]
        if definition and not activeByPoi[poi] then
            local entry = { definition = definition, areaPoiID = poi, active = true }
            activeByPoi[poi] = entry
            active[#active + 1] = entry
        end
    end)

    Visit(scheduled, function(info)
        local poi = ReadPublicNumber(info.areaPoiID)
        local definition = poi and data.activitiesByPoi[poi]
        local startTime, endTime = ReadPublicNumber(info.startTime), ReadPublicNumber(info.endTime)
        if not (definition and startTime and endTime and endTime > startTime) then return end
        local key = tostring(poi) .. ":" .. tostring(startTime) .. ":" .. tostring(endTime)
        if seen[key] then return end
        seen[key] = true
        if startTime <= now and endTime > now then
            local entry = activeByPoi[poi]
            if entry then
                entry.startTime, entry.endTime = startTime, endTime
            else
                entry = { definition = definition, areaPoiID = poi, active = true,
                    startTime = startTime, endTime = endTime }
                activeByPoi[poi] = entry
                active[#active + 1] = entry
            end
        elseif startTime > now then
            upcoming[#upcoming + 1] = { definition = definition, areaPoiID = poi,
                active = false, startTime = startTime, endTime = endTime }
        end
    end)

    table.sort(active, function(a, b) return (a.endTime or math.huge) < (b.endTime or math.huge) end)
    table.sort(upcoming, function(a, b) return a.startTime < b.startTime end)
    return { active = active, upcoming = upcoming, now = now }, "ready"
end

function Adapter:ClampScale(value, data)
    return Clamp(value, data.layout.minScale, data.layout.maxScale, data.defaults.scale)
end

function Adapter:ApplyAttachment(frame, profile, data)
    local parent, anchor = self:ResolveAttachment()
    if not (frame and parent and anchor) then return false end
    local defaults = data.layout.defaultPosition
    local custom = profile.customPosition == true
    local x = custom and tonumber(profile.positionX) or defaults.x
    local y = custom and tonumber(profile.positionY) or defaults.y
    frame:SetParent(parent)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", anchor, "TOPLEFT", x, y)
    frame:SetClampedToScreen(false)
    return true
end

function Adapter:CaptureOffset(frame)
    local parent, anchor = self:ResolveAttachment()
    if not (frame and parent and anchor and type(frame.GetLeft) == "function"
        and type(frame.GetTop) == "function" and type(anchor.GetLeft) == "function"
        and type(anchor.GetTop) == "function" and type(frame.GetEffectiveScale) == "function"
        and type(anchor.GetEffectiveScale) == "function" and type(parent.GetEffectiveScale) == "function") then
        return nil, nil
    end
    local left, top, anchorLeft, anchorTop = frame:GetLeft(), frame:GetTop(), anchor:GetLeft(), anchor:GetTop()
    local frameScale, anchorScale = frame:GetEffectiveScale(), anchor:GetEffectiveScale()
    local targetScale = parent:GetEffectiveScale() * (type(frame.GetScale) == "function" and frame:GetScale() or 1)
    if not (left and top and anchorLeft and anchorTop and frameScale and anchorScale
        and targetScale and targetScale > 0) then return nil, nil end
    return (left * frameScale - anchorLeft * anchorScale) / targetScale,
        (top * frameScale - anchorTop * anchorScale) / targetScale
end

-- 恢复旧版 11a66cd83ae782359facdda91581d165c4dadc07 的五个活动航点。
-- 来源：RurutiaSuite/Modules/CursedTide/Core.lua:64-69；仅按 POI 匹配，不沿用固定 eventID。
-- 坐标为旧版行为证据，当前客户端的实际落点仍需游戏内验收。
local WAYPOINT_MAP_ID = 2512
local WAYPOINTS = {
    [8936] = { x = 0.2640, y = 0.6480 },
    [8940] = { x = 0.4699, y = 0.6223 },
    [8939] = { x = 0.7130, y = 0.3138 },
    [8938] = { x = 0.4470, y = 0.2593 },
    [8937] = { x = 0.6716, y = 0.7752 },
}

function Adapter:IsWaypointSupported()
    local map, point = _G.C_Map, _G.UiMapPoint
    return type(map) == "table" and type(map.GetUserWaypoint) == "function"
        and type(map.SetUserWaypoint) == "function" and type(map.ClearUserWaypoint) == "function"
        and type(point) == "table" and type(point.CreateFromCoordinates) == "function"
end

function Adapter:ToggleWaypoint(definition)
    local target = type(definition) == "table" and WAYPOINTS[definition.areaPoiID]
    if not target then return false, "waypoint_unknown_poi" end
    if not self:IsWaypointSupported() then return false, "waypoint_unavailable" end
    local map = _G.C_Map
    local ok, current = pcall(map.GetUserWaypoint)
    if not ok then return false, "waypoint_read_failed" end
    local position = current and current.position
    if position and current.uiMapID == WAYPOINT_MAP_ID
        and type(position.x) == "number" and type(position.y) == "number"
        and math.abs(position.x - target.x) < 0.001 and math.abs(position.y - target.y) < 0.001 then
        local cleared, result = pcall(map.ClearUserWaypoint)
        if not cleared or result == false then return false, "waypoint_clear_failed" end
        return true, "cleared"
    end
    local created, point = pcall(_G.UiMapPoint.CreateFromCoordinates, WAYPOINT_MAP_ID, target.x, target.y)
    if not created or not point then return false, "waypoint_create_failed" end
    local applied, result = pcall(map.SetUserWaypoint, point)
    if not applied or result == false then return false, "waypoint_set_failed" end
    return true, "set"
end

ns.CursedTideAdapter = Adapter
ns.CursedTideRetailAdapter = Adapter

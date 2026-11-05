local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ConsumableBar")) then return end

local Definition = ns.ConsumableBarDefinition
if type(Definition) ~= "table" then
    error("ConsumableBar Definition.lua must load before Buff.lua", 2)
end

local Adapter = Definition.ADAPTER

local function FormatAuraTime(expirationTime)
    if not expirationTime or expirationTime == 0 then return "" end
    local remaining = expirationTime - Adapter:GetTime()
    if remaining <= 0 then return "" end
    if remaining >= 3600 then
        return string.format("%dh", math.floor(remaining / 3600 + 0.5))
    elseif remaining >= 60 then
        return string.format("%dm", math.floor(remaining / 60 + 0.5))
    end
    return tostring(math.floor(remaining + 0.5))
end

function Definition:GetBuffTimeText(info)
    local expirations = self.foodBuffExpirations
    if info and info.buffID then
        return FormatAuraTime(expirations and expirations[info.buffID])
    end
    local index
    for index = 1, #(info and info.buffIDs or {}) do
        local text = FormatAuraTime(expirations and expirations[info.buffIDs[index]])
        if text ~= "" then return text end
    end
    return ""
end

function Definition:RefreshFoodBuffState()
    local expirations = self.foodBuffExpirations
    local spellID
    for spellID in pairs(self.foodBuffIDs or {}) do expirations[spellID] = nil end
    local index
    for index = 1, 40 do
        local expirationTime, auraSpellID = Adapter:GetHelpfulAura(index)
        if not auraSpellID then break end
        if self.foodBuffIDs[auraSpellID] then
            expirations[auraSpellID] = expirationTime
        end
    end
    self:RecordScan()
    self:QueueVisualRefresh()
    self:ScheduleNextFoodBuffTextRefresh()
end

function Definition:HasActiveFoodBuff()
    local now = Adapter:GetTime()
    local _, expirationTime
    for _, expirationTime in pairs(self.foodBuffExpirations or {}) do
        if expirationTime and expirationTime > now then return true end
    end
    return false
end

function Definition:GetNextFoodBuffTextDelay()
    local now = Adapter:GetTime()
    local bestDelay
    local _, expirationTime
    for _, expirationTime in pairs(self.foodBuffExpirations or {}) do
        if expirationTime and expirationTime > now then
            local remaining = expirationTime - now
            local delay
            if remaining > 60 then
                local currentText = math.floor(remaining / 60 + 0.5)
                local nextBoundary = (currentText - 0.5) * 60
                delay = math.min(remaining - nextBoundary, remaining - 60)
            else
                delay = remaining - (math.floor(remaining + 0.5) - 0.5)
            end
            delay = math.max(0.05, delay or 1)
            bestDelay = bestDelay and math.min(bestDelay, delay) or delay
        end
    end
    return bestDelay
end

function Definition:CancelFoodBuffTextRefresh()
    self.nextBuffTextRefresh = nil
    if not self.nextCooldownRefresh then self:StopVisualDriver() end
end

function Definition:ScheduleNextFoodBuffTextRefresh()
    local delay = self:GetNextFoodBuffTextDelay()
    if not delay then
        self.nextBuffTextRefresh = nil
        return false
    end
    self.nextBuffTextRefresh = Adapter:GetTime() + delay
    self:ArmVisualDriver(delay)
    return true
end

ns.ConsumableBarBuff = true

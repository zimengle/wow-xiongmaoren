local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ConsumableBar")) then return end

local Definition = ns.ConsumableBarDefinition
if type(Definition) ~= "table" then
    error("ConsumableBar Definition.lua must load before Cooldown.lua", 2)
end

local Adapter = Definition.ADAPTER

local function HasActiveCooldown(start, duration, enabled)
    return start and duration and duration > 1.5 and enabled ~= 0
end

local function OnSharedVisualDriver(module, elapsed)
    module.visualDriverRemaining = (module.visualDriverRemaining or 0) - (tonumber(elapsed) or 0)
    if module.visualDriverRemaining > 0 then return end
    module.visualDriverRemaining = nil
    module:RefreshVisuals()
end

function Definition:HasUsableInventorySlot(info)
    if not info or not info.slot then return false end
    local itemID = Adapter:GetInventoryItemID(info.slot)
    if not itemID then return false end
    local _, spellID = Adapter:GetItemSpell(itemID)
    if spellID then return true end
    local start, duration, enabled = Adapter:GetInventoryCooldown(info.slot)
    return enabled ~= 0 or HasActiveCooldown(start, duration, enabled)
end

function Definition:ClearCooldown(cooldown)
    if cooldown and type(cooldown.SetCooldown) == "function" then
        cooldown:SetCooldown(0, 0)
    end
end

function Definition:GetOwnCooldown(info)
    if info.slot then
        local start, duration, enabled = Adapter:GetInventoryCooldown(info.slot)
        return start, duration, enabled, HasActiveCooldown(start, duration, enabled)
    end
    local itemID = self:GetPrimaryItemID(info)
    if itemID then
        local start, duration, enabled = Adapter:GetItemCooldown(itemID)
        return start, duration, enabled, HasActiveCooldown(start, duration, enabled)
    end
    return nil, nil, nil, false
end

function Definition:GetSharedCooldown(info, cache, generation)
    if not info or not info.cooldownGroup then return self:GetOwnCooldown(info) end
    local groupName = info.cooldownGroup
    local cached = cache and cache[groupName]
    if cached and cached.generation == generation then
        if cached.active then
            return cached.start, cached.duration, cached.enabled, true
        end
        return self:GetOwnCooldown(info)
    end
    local bestStart, bestDuration, bestEnabled
    local candidates = self.cooldownGroups and self.cooldownGroups[groupName] or {}
    local index
    for index = 1, #candidates do
        local candidate = candidates[index]
        if self:HasOwnedItem(candidate) then
            local start, duration, enabled, active = self:GetOwnCooldown(candidate)
            if active and (not bestDuration or duration > bestDuration) then
                bestStart, bestDuration, bestEnabled = start, duration, enabled
            end
        end
    end
    if bestDuration then
        if cache then
            cached = cached or {}
            cache[groupName] = cached
            cached.start = bestStart
            cached.duration = bestDuration
            cached.enabled = bestEnabled
            cached.active = true
            cached.generation = generation
        end
        return bestStart, bestDuration, bestEnabled, true
    end
    if cache then
        cached = cached or {}
        cache[groupName] = cached
        cached.start = nil
        cached.duration = nil
        cached.enabled = nil
        cached.active = false
        cached.generation = generation
    end
    return self:GetOwnCooldown(info)
end

function Definition:EnsureVisualDriver()
    if self.visualDriverOwned then return false end
    self:AddDriverConsumer("consumable-bar-visuals", "active-visuals", OnSharedVisualDriver)
    self.visualDriverOwned = true
    return true
end

function Definition:ArmVisualDriver(delay)
    delay = math.max(tonumber(delay) or 0.05, 0.05)
    if not self.visualDriverRemaining or delay < self.visualDriverRemaining then
        self.visualDriverRemaining = delay
    end
    self:EnsureVisualDriver()
end

function Definition:StopVisualDriver()
    if not self.visualDriverOwned then return false end
    self:RemoveDriverConsumer("consumable-bar-visuals", "active-visuals")
    self.visualDriverOwned = false
    self.visualDriverRemaining = nil
    return true
end

function Definition:ScheduleCooldownRefresh(start, duration)
    if not start or not duration then return false end
    local expiration = start + duration
    if expiration <= Adapter:GetTime() then return false end
    if not self.nextCooldownRefresh or expiration < self.nextCooldownRefresh then
        self.nextCooldownRefresh = expiration
    end
    self:ArmVisualDriver(expiration - Adapter:GetTime())
    return true
end

ns.ConsumableBarCooldown = true

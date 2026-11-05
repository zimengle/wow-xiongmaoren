local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("RaidMarker")) then return end

local Movement = {}
Movement.__index = Movement

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return nil end
    local ok, a, b, c, d, e = pcall(callback, target, ...)
    if not ok then return nil end
    return a, b, c, d, e
end

function Movement:New(module, view, adapter, data)
    return setmetatable({
        module = module,
        view = view,
        adapter = adapter,
        data = data,
        nudgeConfig = nil,
    }, self)
end

function Movement:GetProfile()
    return self.module:GetProfile()
end

function Movement:SetUnlocked(unlocked)
    unlocked = unlocked and true or false
    local profile = self:GetProfile()
    if not profile or not profile.enabled or self.module._similarAddonConflict then return false end
    if self.adapter:IsInCombat() then
        self.module:WarnCombatLocked()
        return false
    end
    if not self.module.runtimeActive and not self.module:ActivateRuntime() then return false end
    self.module.isUnlocked = unlocked
    if not self.view:SetUnlocked(unlocked, profile) then return false end
    if not unlocked then self.module:RefreshVisibility() end
    self.module:RefreshSettingsPage("lock")
    return true
end

function Movement:ToggleAnchor()
    return self:SetUnlocked(not self.module.isUnlocked)
end

function Movement:SavePosition()
    if self.adapter:IsInCombat() or not self.view.bar then return false end
    local snapped = self.adapter:GetTopSnapPosition(self.view.bar)
    if snapped then
        self:GetProfile().position = snapped
    else
        local point, _, relativePoint, x, y = Call(self.view.bar, "GetPoint", 1)
        if not point then return false end
        self:GetProfile().position = {
            point = point,
            relativePoint = relativePoint or point,
            x = tonumber(x) or 0,
            y = tonumber(y) or 0,
        }
    end
    return self.view:ApplyPosition(self:GetProfile())
end

function Movement:SetPosition(x, y)
    if self.adapter:IsInCombat() then return false end
    local profile = self:GetProfile()
    local position = profile and profile.position
    if not position then return false end
    position.x = tonumber(x) or 0
    position.y = tonumber(y) or 0
    return self.view:ApplyPosition(profile)
end

function Movement:ResetPosition()
    if self.adapter:IsInCombat() then
        self.module:WarnCombatLocked()
        return false
    end
    rawset(self:GetProfile(), "position", nil)
    local applied = not self.view.bar or self.view:ApplyPosition(self:GetProfile())
    if self.module.db and type(self.module.db.PrepareForSave) == "function" then
        self.module.db:PrepareForSave()
    end
    return applied
end

function Movement:RefreshClamp()
    return self.view:RefreshClamp()
end

function Movement:GetNudgeConfig()
    if self.nudgeConfig then return self.nudgeConfig end
    local owner = self
    self.nudgeConfig = {
        label = "标记栏",
        getPosition = function()
            local position = owner:GetProfile().position
            return position and position.x or 0, position and position.y or 0
        end,
        setPosition = function(x, y) return owner:SetPosition(x, y) end,
        savePosition = function() return owner:SavePosition() end,
        applyPosition = function() return owner.view:ApplyPosition(owner:GetProfile()) end,
        onSettings = function() return owner.module:OpenSettings() end,
        onLock = function()
            if type(ns.SetRsMoveMode) == "function" then return ns:SetRsMoveMode(false) end
            return owner:SetUnlocked(false)
        end,
    }
    return self.nudgeConfig
end

function Movement:OpenNudge()
    if not self.adapter:SupportsNudge() or not self.view.bar
        or type(ns.ShowMoveNudgeFrame) ~= "function" then return false end
    return ns:ShowMoveNudgeFrame(self.view.bar, self:GetNudgeConfig()) ~= nil
end

ns.RaidMarkerMovementClass = Movement

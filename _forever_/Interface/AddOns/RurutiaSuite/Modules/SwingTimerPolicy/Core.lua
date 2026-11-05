-- 原生平砍计时策略；仅保存当前角色的管理开关与模式。
local _, ns = ...
if not ns.Build.HasModule("SwingTimerPolicy") then return end

local Adapter = ns.SwingTimerPolicyAdapter
local MODES = { auto = true, on = true, off = true }
local REFRESH_KEY = "SwingTimerPolicy"
local Definition = {
    activationGate = "BlizzardEnhancements",
    databaseName = "SwingTimerPolicy",
    defaultEnabled = true,
    defaults = { char = { managed = true, mode = "auto" } },
}

local function Value(value)
    if value == "0" or value == "1" then return value end
end

function Definition:GetSettings()
    local settings = self.db.char
    if type(settings.managed) ~= "boolean" then settings.managed = true end
    if not MODES[settings.mode] then settings.mode = "auto" end
    return settings
end

function Definition:IsSupported()
    return type(Adapter) == "table" and Adapter:IsSupported() == true
end

function Definition:RefreshSettings()
    if ns.SwingTimerPolicySettings then
        ns.SwingTimerPolicySettings:Refresh(nil, self)
    end
end

function Definition:SetSettingsVisible(visible)
    self._settingsVisible = visible == true
    if self._active and self._settingsVisible and self:IsSupported() then
        self:RegisterEvent("CVAR_UPDATE", self.CVAR_UPDATE)
    elseif not self._managing then
        self:UnregisterEvent("CVAR_UPDATE")
    end
    self:RefreshSettings()
end

function Definition:StopManaging()
    self._managing = false
    self:UnregisterAllEvents()
    self:CancelRefresh(REFRESH_KEY)
    self._pendingValue = nil
    self._lastObserved = nil
    self._writing = nil
    self._failed = false
    if self._active and self._settingsVisible and self:IsSupported() then
        self:RegisterEvent("CVAR_UPDATE", self.CVAR_UPDATE)
    end
end

function Definition:QueueRefresh()
    if not self._active or not self._managing then return end
    self:RequestRefresh(REFRESH_KEY, function(module) module:ApplyPolicy() end)
end

function Definition:StartManaging()
    if not self._active or not self:GetSettings().managed or not self:IsSupported() then
        self:StopManaging()
        return
    end
    if not self._managing then
        self._managing = true
        self._lastObserved = Value(Adapter:GetValue())
        self:RegisterEvent("PLAYER_ENTERING_WORLD", self.PLAYER_ENTERING_WORLD)
        self:RegisterEvent("CVAR_UPDATE", self.CVAR_UPDATE)
        self:RegisterEvent("PLAYER_REGEN_ENABLED", self.QueueRefresh)
        -- Only the adapter's verified talent events are eligible. Invalid events
        -- are safely rejected by Runtime without leaving resource ownership.
        for key, entry in pairs(Adapter.events or {}) do
            local event = type(key) == "number" and entry or (entry and key)
            if type(event) == "string" and event ~= "PLAYER_ENTERING_WORLD"
                and event ~= "CVAR_UPDATE" and event ~= "PLAYER_REGEN_ENABLED" then
                pcall(self.RegisterEvent, self, event, self.QueueRefresh)
            end
        end
    end
    if type(IsLoggedIn) == "function" and IsLoggedIn() then self._worldReady = true end
    self:QueueRefresh()
end

function Definition:SetManaged(managed)
    self:GetSettings().managed = managed == true
    self:StartManaging()
    self:RefreshSettings()
    return true
end

function Definition:SetMode(mode)
    if not MODES[mode] then return false end
    self:GetSettings().mode = mode
    self._external = false
    self._failed = false
    self._pendingValue = nil
    self:QueueRefresh()
    self:RefreshSettings()
    return true
end

function Definition:ResolveDesired()
    local mode = self:GetSettings().mode
    if mode == "on" then return "1", self._external and "外部设置" or "固定开启" end
    if mode == "off" then return "0", self._external and "外部设置" or "固定关闭" end
    local enabled, reason = Adapter:ResolveAutomatic()
    if type(enabled) ~= "boolean" then return nil, reason end
    return enabled and "1" or "0", reason
end

function Definition:ApplyPolicy()
    self._pendingValue = nil
    if not self._active or not self._managing or not self:GetSettings().managed
        or not self._worldReady or not self:IsSupported() then
        self:RefreshSettings()
        return
    end
    local desired = self:ResolveDesired()
    local actual = Value(Adapter:GetValue())
    self._failed = false
    if desired == nil or actual == desired then
        self:RefreshSettings()
        return
    end
    if actual == nil then
        self._failed = true
    elseif Adapter:IsInCombat() then
        self._pendingValue = desired
    else
        -- CVAR_UPDATE dispatch is synchronous. Readback also establishes the
        -- baseline that makes delayed/duplicate notifications harmless.
        self._writing = desired
        self._writeSawOpposite = false
        local ok, changed = pcall(Adapter.SetValue, Adapter, desired)
        self._writing = nil
        actual = Value(Adapter:GetValue())
        self._lastObserved = actual
        self._failed = not ok or changed ~= true or actual ~= desired
        if actual and actual ~= desired and self._writeSawOpposite then
            self:AdoptExternal(actual)
        end
        self._writeSawOpposite = nil
    end
    self:RefreshSettings()
end

function Definition:AdoptExternal(actual)
    self._lastObserved = actual
    self:GetSettings().mode = actual == "1" and "on" or "off"
    self._external = true
    self._pendingValue = nil
    self._failed = false
    self:CancelRefresh(REFRESH_KEY)
end

function Definition:CVAR_UPDATE(_, name, value)
    if type(name) ~= "string" or string.lower(name) ~= string.lower(Adapter.cvarName or "showSwingTimer")
        then return end
    if not self._managing then
        if self._settingsVisible then self:RefreshSettings() end
        return
    end
    if not self._worldReady then return end
    if self._writing then
        if Value(value) and value ~= self._writing then self._writeSawOpposite = true end
        return
    end
    -- A later event may already have superseded this notification; use the
    -- actual current CVar for the fixed override, never replay a stale value.
    local actual = Value(Adapter:GetValue())
    if not actual or actual == self._lastObserved then return end
    self:AdoptExternal(actual)
    self:RefreshSettings()
end

function Definition:PLAYER_ENTERING_WORLD()
    if not self._worldReady then self._lastObserved = Value(Adapter:GetValue()) end
    self._worldReady = true
    self:QueueRefresh()
end

function Definition:GetStatusText()
    if not self:IsSupported() then return "当前版本不支持" end
    local settings = self:GetSettings()
    local actual = Value(Adapter:GetValue())
    local actualText = actual == "1" and "开启" or (actual == "0" and "关闭" or "未知")
    if not settings.managed or not self._active then return "未接管 · 游戏设置" .. actualText end
    if not self._worldReady then return "等待进入世界 · 游戏设置" .. actualText end
    local desired, reason = self:ResolveDesired()
    if not desired then
        return "待识别 · 保留游戏设置（" .. actualText .. "）"
            .. (reason and reason ~= "" and reason ~= "待识别" and " · " .. reason or "")
    end
    if actual ~= desired then
        if Adapter:IsInCombat() then
            return "等待脱战 · 将" .. (desired == "1" and "开启" or "关闭")
                .. " · 游戏设置" .. actualText
        end
        return (self._failed and "未生效 · 请重试" or "等待应用") .. " · 游戏设置" .. actualText
    end
    if self._failed then return "未生效 · 请重试 · 游戏设置" .. actualText end
    return actualText .. (reason and reason ~= "" and " · " .. reason or "")
end

function Definition:Initialize()
    self:GetSettings()
    self._lastObserved = nil
    self._worldReady = false
end

function Definition:Enable()
    -- IsEnabled() is still false during Runtime's Enable callback.
    self._active = true
    self:StartManaging()
    self:RefreshSettings()
end

function Definition:Disable()
    self._active = false
    self:StopManaging()
    self._worldReady = false
    self._external = false
    self:RefreshSettings()
end

function Definition:ProfileChanged()
    self:GetSettings()
    self:StartManaging()
    self:RefreshSettings()
end

ns.SwingTimerPolicyDefinition = Definition
local module, reason = ns.RegisterModule("SwingTimerPolicy", Definition)
if module then ns.SwingTimerPolicy = module
else ns.SwingTimerPolicyRegistrationError = reason end

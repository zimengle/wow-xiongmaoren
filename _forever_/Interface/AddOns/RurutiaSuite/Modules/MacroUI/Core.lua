-- 文件职责：管理 MacroUI 的差异 DB、一次性 Runtime 事件与诊断状态。
-- 不负责：读写 Blizzard 全局、布局几何、宏内容或通用 UI 创建。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("MacroUI")) then return end

local Data = ns.MacroUIData
local Adapter = ns.MacroUIAdapter
local Settings = ns.MacroUISettings
if type(Data) ~= "table" or type(Adapter) ~= "table" or type(Settings) ~= "table" then
    error("MacroUI requires Data, Retail Adapter, and Settings before Core.lua", 2)
end

local DEFAULTS = Data.defaults
local PROFILE_KEYS = { "enabled", "avoidNDui", "avoidElvUI", "avoidPig" }
local CONFLICT_KEYS = { avoidNDui = true, avoidElvUI = true, avoidPig = true }

local Definition = {
    databaseName = "MacroUI",
    defaultEnabled = true,
    defaults = {
        profile = {
            enabled = DEFAULTS.enabled,
            avoidNDui = DEFAULTS.avoidNDui,
            avoidElvUI = DEFAULTS.avoidElvUI,
            avoidPig = DEFAULTS.avoidPig,
        },
    },
}

local function StoreDifference(profile, key, value)
    value = value and true or false
    if value == DEFAULTS[key] then rawset(profile, key, nil)
    else rawset(profile, key, value) end
end

local function NormalizeProfile(profile)
    local index
    for index = 1, #PROFILE_KEYS do
        local key = PROFILE_KEYS[index]
        local value = rawget(profile, key)
        if type(value) ~= "boolean" or value == DEFAULTS[key] then rawset(profile, key, nil) end
    end
end

local function SnapshotProfile(profile)
    local snapshot = {}
    local index
    for index = 1, #PROFILE_KEYS do
        local key = PROFILE_KEYS[index]
        snapshot[key] = profile[key] and true or false
    end
    return snapshot
end

local function SyncRootSetting(module)
    if ns.Assembly and type(ns.Assembly.SetModuleConfigured) == "function" then
        ns.Assembly:SetModuleConfigured("MacroUI", module.db.profile.enabled == true)
    end
end

function Definition:GetProfile()
    return self.db and self.db.profile
end

function Definition:Initialize()
    NormalizeProfile(self.db.profile)
    self.adapter = Adapter
    self.runtimeActive = false
    self.applied = false
    self.lastStatus = self.db.profile.enabled == true and "initialized" or "disabled"
    self.startupProfile = SnapshotProfile(self.db.profile)
    SyncRootSetting(self)
    Settings:Register(self)
end

function Definition:ProfileChanged()
    NormalizeProfile(self.db.profile)
    self.startupProfile = SnapshotProfile(self.db.profile)
    SyncRootSetting(self)
end

function Definition:IsReloadPending()
    local profile = self:GetProfile()
    local index
    for index = 1, #PROFILE_KEYS do
        local key = PROFILE_KEYS[index]
        if (profile[key] and true or false) ~= self.startupProfile[key] then return true end
    end
    return false
end

function Definition:RequestReload()
    if type(ns.Print) == "function" then
        ns.Print("宏界面扩展设置已保存，请输入 /reload 后生效。")
    end
end

function Definition:SetEnabled(enabled)
    local profile = self:GetProfile()
    StoreDifference(profile, "enabled", enabled)
    SyncRootSetting(self)
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    self:RequestReload()
    return true, "reload_required"
end

function Definition:SetConflictPolicy(key, enabled)
    if not CONFLICT_KEYS[key] then return false, "unknown_policy" end
    StoreDifference(self:GetProfile(), key, enabled)
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    self:RequestReload()
    return true, "reload_required"
end

function Definition:TryApply()
    local applied, reason, terminal = Adapter:TryApply(self:GetProfile())
    self.applied = applied and true or false
    self.lastStatus = reason or (applied and "applied" or "unsupported")
    if terminal then self:UnregisterEvent("ADDON_LOADED") end
    return applied, self.lastStatus
end

function Definition:Enable()
    if self:GetProfile().enabled ~= true then
        self.runtimeActive = false
        self.lastStatus = "disabled"
        return true
    end
    self.runtimeActive = true
    if Adapter:IsTargetLoaded() then return self:TryApply() end
    self.lastStatus = "waiting_for_blizzard_macro_ui"
    self:RegisterEvent("ADDON_LOADED", self.ADDON_LOADED)
    return true
end

function Definition:Disable()
    self.runtimeActive = false
    self:UnregisterAllEvents()
    if not self.applied then self.lastStatus = "disabled" end
    return true
end

function Definition:ADDON_LOADED(_, addonName)
    if addonName ~= Data.targetAddon then return false end
    return self:TryApply()
end

function Definition:GetStatus()
    return self.lastStatus
end

function Definition:GetDiagnostics()
    local resources = ns.Runtime and ns.Runtime:GetDiagnostics("MacroUI") or {}
    return {
        runtimeActive = self.runtimeActive,
        applied = self.applied,
        status = self.lastStatus,
        reloadPending = self:IsReloadPending(),
        events = resources.eventCount or 0,
        timers = resources.timerCount or 0,
        tickers = resources.tickerCount or 0,
        onUpdates = resources.onUpdateCount or 0,
    }
end

local module, reason = ns.RegisterModule("MacroUI", Definition)
if module then
    ns.MacroUI = module
    ns.MacroUIDefinition = Definition
else
    ns.MacroUIRegistrationError = reason
end

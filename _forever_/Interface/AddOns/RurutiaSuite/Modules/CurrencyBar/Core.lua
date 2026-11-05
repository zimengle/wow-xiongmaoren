-- 文件职责：管理 CurrencyBar 差异 DB、Runtime 资源、同帧合并与可见性状态机。
-- 不负责：直接读取 WoW API、WorldMapFrame 全局、创建货币 Frame 或定义赛季数据。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("CurrencyBar")) then return end

local Data = ns.CurrencyBarData
local Adapter = ns.CurrencyBarAdapter
local ViewClass = ns.CurrencyBarViewClass
local Settings = ns.CurrencyBarSettings
if type(Data) ~= "table" or type(Adapter) ~= "table" or type(ViewClass) ~= "table"
    or type(Settings) ~= "table" then
    error("CurrencyBar requires Data, Retail Adapter, View, and Settings before Core.lua", 2)
end

local PROFILE_KEYS = {
    "enabled", "attachment", "alignment", "scale", "enabledCurrencies",
    "customPosition", "positionX", "positionY", "positionAnchor",
}

local Definition = {
    databaseName = "CurrencyBar",
    defaultEnabled = true,
    defaults = {
        profile = {
            enabled = Data.defaults.enabled,
            attachment = Data.defaults.attachment,
            alignment = Data.defaults.alignment,
            scale = Data.defaults.scale,
            enabledCurrencies = Data.defaultEnabledCurrencies,
        },
    },
}

local function StoreDifference(profile, key, value, default)
    if value == default then rawset(profile, key, nil) else rawset(profile, key, value) end
end

local ABSENT = {}

local function SnapshotProfile(profile)
    local snapshot = {}
    local index
    for index = 1, #PROFILE_KEYS do
        local key = PROFILE_KEYS[index]
        local value = rawget(profile, key)
        snapshot[key] = value == nil and ABSENT or value
    end
    return snapshot
end

local function RestoreProfile(profile, snapshot)
    local index
    for index = 1, #PROFILE_KEYS do
        local key = PROFILE_KEYS[index]
        local value = snapshot[key]
        if value == ABSENT then rawset(profile, key, nil)
        else rawset(profile, key, value) end
    end
end

local function SetRuntimeEnabled(enabled)
    local assembly = ns.Assembly
    if type(assembly) ~= "table" or type(assembly.SetModuleEnabled) ~= "function" then
        return false, "assembly_unavailable"
    end
    local called, ok, reason = pcall(assembly.SetModuleEnabled, assembly, "CurrencyBar", enabled)
    if not called then return false, "module_transition_error" end
    if ok ~= true then return false, reason or "module_transition_failed" end
    return true, reason
end

local function NormalizeEnabledCurrencies(profile)
    local current = rawget(profile, "enabledCurrencies")
    if current ~= nil and type(current) ~= "table" then
        rawset(profile, "enabledCurrencies", nil)
        return
    end
    if type(current) ~= "table" then return end
    local currencyID, value
    for currencyID, value in pairs(current) do
        local default = Data.defaultEnabledCurrencies[currencyID]
        if type(currencyID) ~= "number" or default == nil or type(value) ~= "boolean"
            or value == default then rawset(current, currencyID, nil) end
    end
    if next(current) == nil then rawset(profile, "enabledCurrencies", nil) end
end

local function NormalizeProfile(profile)
    local enabled = rawget(profile, "enabled")
    if type(enabled) ~= "boolean" or enabled == Data.defaults.enabled then rawset(profile, "enabled", nil) end
    local attachment = rawget(profile, "attachment")
    if attachment ~= nil then rawset(profile, "attachment", nil) end
    local alignment = rawget(profile, "alignment")
    if alignment ~= "LEFT" then rawset(profile, "alignment", nil) end
    local scale = rawget(profile, "scale")
    if type(scale) ~= "number" then rawset(profile, "scale", nil)
    else
        scale = Adapter:ClampScale(scale, Data)
        StoreDifference(profile, "scale", scale, Data.defaults.scale)
    end
    NormalizeEnabledCurrencies(profile)
    local custom = rawget(profile, "customPosition") == true
    local x, y = rawget(profile, "positionX"), rawget(profile, "positionY")
    if not custom or type(x) ~= "number" or type(y) ~= "number" then
        rawset(profile, "customPosition", nil)
        rawset(profile, "positionX", nil)
        rawset(profile, "positionY", nil)
        rawset(profile, "positionAnchor", nil)
    else
        rawset(profile, "customPosition", true)
        local side = profile.alignment == "LEFT" and "LEFT" or "RIGHT"
        rawset(profile, "positionAnchor", Data.layout.anchorKeys[side])
    end
end

local function SyncRootSetting(module)
    if ns.Assembly and type(ns.Assembly.SetModuleConfigured) == "function" then
        ns.Assembly:SetModuleConfigured("CurrencyBar", module:GetProfile().enabled ~= false)
    end
end

function Definition:GetProfile() return self.db and self.db.profile end

function Definition:Initialize()
    NormalizeProfile(self.db.profile)
    self.adapter = Adapter
    self.view = ViewClass:New(self, Adapter, Data)
    self.runtimeActive = false
    self.previewMode = false
    self.isUnlocked = false
    self.dataDirty = true
    self.mapSubscribed = false
    self.lastStatus = "initialized"
    SyncRootSetting(self)
    Settings:Register(self)
end

function Definition:ProfileChanged()
    NormalizeProfile(self.db.profile)
    self.dataDirty = true
    SyncRootSetting(self)
end

function Definition:IsCurrencyEnabled(currencyID)
    local profile = self:GetProfile()
    local differences = rawget(profile, "enabledCurrencies")
    local value
    if type(differences) == "table" then value = rawget(differences, currencyID) end
    if value ~= nil then return value == true end
    return Data.defaultEnabledCurrencies[currencyID] == true
end

function Definition:IsDisplayRequested()
    return self.previewMode or self.isUnlocked
        or (self.adapter:IsWorldMapVisible() and self.adapter:IsPlayerAtMaxLevel(Data.defaultMaxLevel))
end

function Definition:CollectItems()
    local items = {}
    local index
    for index = 1, #Data.currencies do
        local definition = Data.currencies[index]
        if self:IsCurrencyEnabled(definition.currencyID) then
            local snapshot = self.adapter:GetCurrencyInfo(definition.currencyID)
            if snapshot then
                snapshot.label = definition.label
                snapshot.displayTier = definition.displayTier
                items[#items + 1] = snapshot
            end
        end
    end
    return items
end

function Definition:RefreshNow(reason)
    local profile = self:GetProfile()
    if not (self.runtimeActive and profile and profile.enabled ~= false) then
        self.view:Hide()
        self.lastStatus = "disabled"
        return false
    end
    if not self:IsDisplayRequested() then
        self.view:Hide()
        self.lastStatus = "hidden"
        return false
    end
    local items = self:CollectItems()
    self.dataDirty = false
    if #items == 0 then
        self.view:Hide()
        self.lastStatus = "no_currency_data"
        return false
    end
    local rendered = self.view:Render(items, profile)
    if rendered and self.isUnlocked then self.view:SetUnlocked(true) end
    self.lastStatus = rendered and (reason or "visible") or "view_unavailable"
    return rendered
end

function Definition:QueueRefresh(reason)
    self.pendingReason = reason or self.pendingReason or "refresh"
    return self:RequestRefresh("currency-bar", function()
        local pending = self.pendingReason
        self.pendingReason = nil
        self:RefreshNow(pending)
    end, 0)
end

function Definition:AttachMap()
    if self.mapSubscribed or not self.adapter:IsWorldMapAvailable() then return false end
    local tokens = self.adapter:SubscribeMapVisibility(self, function(visible)
        self:OnMapVisibilityChanged(visible)
    end)
    if not tokens then return false end
    self.mapSubscribed = true
    self:UnregisterEvent("ADDON_LOADED")
    return true
end

function Definition:Enable()
    if self:GetProfile().enabled == false then
        self.runtimeActive = false
        self.lastStatus = "disabled"
        return true
    end
    self.runtimeActive = true
    self:RegisterEvent("CURRENCY_DISPLAY_UPDATE", self.CURRENCY_DISPLAY_UPDATE)
    self:RegisterEvent("PLAYER_LEVEL_UP", self.PLAYER_LEVEL_UP)
    if not self:AttachMap() then self:RegisterEvent("ADDON_LOADED", self.ADDON_LOADED) end
    self:RefreshNow("enabled")
    return true
end

function Definition:Disable()
    self.runtimeActive = false
    self.previewMode = false
    self.isUnlocked = false
    self.pendingReason = nil
    self.mapSubscribed = false
    self:CancelRefresh("currency-bar")
    self:UnregisterAllEvents()
    self.view:SetUnlocked(false)
    self.view:Hide()
    self.view:ReleaseOwnership()
    self.lastStatus = "disabled"
    return true
end

function Definition:CURRENCY_DISPLAY_UPDATE()
    self.dataDirty = true
    if self:IsDisplayRequested() then self:QueueRefresh("currency") end
end

function Definition:PLAYER_LEVEL_UP()
    self.dataDirty = true
    if self.adapter:IsWorldMapVisible() or self.previewMode or self.isUnlocked then
        self:QueueRefresh("level")
    end
end

function Definition:ADDON_LOADED(_, addonName)
    if addonName ~= self.adapter.targetAddon then return false end
    if self:AttachMap() then self:QueueRefresh("map-loaded") return true end
    return false
end

function Definition:OnMapVisibilityChanged(visible)
    if visible then self.dataDirty = true end
    self:QueueRefresh(visible and "map-shown" or "map-hidden")
end

function Definition:SetFeatureEnabled(enabled)
    local profile = self:GetProfile()
    enabled = enabled and true or false
    StoreDifference(profile, "enabled", enabled, Data.defaults.enabled)
    SyncRootSetting(self)
    local ok, reason = SetRuntimeEnabled(enabled)
    if not ok then
        StoreDifference(profile, "enabled", self:IsEnabled(), Data.defaults.enabled)
        SyncRootSetting(self)
        if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
        return false, reason
    end
    return true, reason
end

function Definition:SetCurrencyEnabled(currencyID, enabled)
    local default = Data.defaultEnabledCurrencies[currencyID]
    if default == nil then return false, "unknown_currency" end
    local profile = self:GetProfile()
    local differences = rawget(profile, "enabledCurrencies")
    enabled = enabled and true or false
    if enabled == default then
        if type(differences) == "table" then
            rawset(differences, currencyID, nil)
            if next(differences) == nil then rawset(profile, "enabledCurrencies", nil) end
        end
    else
        if type(differences) ~= "table" then differences = {} rawset(profile, "enabledCurrencies", differences) end
        rawset(differences, currencyID, enabled)
    end
    self.dataDirty = true
    if self:IsEnabled() and self:IsDisplayRequested() then self:QueueRefresh("currency-selection") end
    return true
end

function Definition:SetAlignment(alignment)
    if self.adapter:IsInCombat() then return false, "combat" end
    alignment = alignment == "LEFT" and "LEFT" or Data.defaults.alignment
    StoreDifference(self:GetProfile(), "alignment", alignment, Data.defaults.alignment)
    self:ResetPosition()
    if self:IsEnabled() and self:IsDisplayRequested() then self:QueueRefresh("alignment") end
    return true
end

function Definition:SetScale(value)
    if self.adapter:IsInCombat() then return false, "combat" end
    local scale = self.adapter:ClampScale(value, Data)
    StoreDifference(self:GetProfile(), "scale", scale, Data.defaults.scale)
    if self.view.bar then self.view:ApplyProfile(self:GetProfile()) end
    return true
end

function Definition:SetPosition(x, y)
    if self.adapter:IsInCombat() then return false, "combat" end
    local profile = self:GetProfile()
    x, y = tonumber(x), tonumber(y)
    if not (x and y) then return false, "invalid_position" end
    rawset(profile, "customPosition", true)
    rawset(profile, "positionX", x)
    rawset(profile, "positionY", y)
    local side = profile.alignment == "LEFT" and "LEFT" or "RIGHT"
    rawset(profile, "positionAnchor", Data.layout.anchorKeys[side])
    return not self.view.bar or self.view:ApplyProfile(profile)
end

function Definition:SavePosition()
    if self.adapter:IsInCombat() or not self.view.bar then return false, "combat_or_missing" end
    local x, y = self.adapter:CaptureOffset(self.view.bar, self:GetProfile())
    if not (x and y) then return false, "position_unavailable" end
    return self:SetPosition(x, y)
end

function Definition:ResetPosition()
    if self.adapter:IsInCombat() then return false, "combat" end
    local profile = self:GetProfile()
    rawset(profile, "customPosition", nil)
    rawset(profile, "positionX", nil)
    rawset(profile, "positionY", nil)
    rawset(profile, "positionAnchor", nil)
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return not self.view.bar or self.view:ApplyProfile(profile)
end

function Definition:ResetDefaults()
    if self.adapter:IsInCombat() then return false, "combat" end
    local profile = self:GetProfile()
    local snapshot = SnapshotProfile(profile)
    local previousPreview, previousUnlocked = self.previewMode, self.isUnlocked
    local index
    for index = 1, #PROFILE_KEYS do rawset(profile, PROFILE_KEYS[index], nil) end
    self.previewMode = false
    self.isUnlocked = false
    self.view:SetUnlocked(false)
    SyncRootSetting(self)
    if not self:IsEnabled() then
        local ok, reason = SetRuntimeEnabled(true)
        if not ok then
            RestoreProfile(profile, snapshot)
            StoreDifference(profile, "enabled", self:IsEnabled(), Data.defaults.enabled)
            self.previewMode, self.isUnlocked = previousPreview, previousUnlocked
            self.view:SetUnlocked(previousUnlocked)
            SyncRootSetting(self)
            if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
            return false, reason
        end
    end
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    if self:IsEnabled() then self:QueueRefresh("reset-defaults") end
    return true
end

function Definition:SetPreview(enabled)
    if self.adapter:IsInCombat() or self:GetProfile().enabled == false then return false end
    self.previewMode = enabled and true or false
    self:RefreshNow(self.previewMode and "preview" or "preview-ended")
    return true
end

function Definition:SetUnlocked(unlocked)
    if self.adapter:IsInCombat() or self:GetProfile().enabled == false then return false end
    self.isUnlocked = unlocked and true or false
    self:RefreshNow(self.isUnlocked and "unlocked" or "locked")
    if self.isUnlocked then return self.view:SetUnlocked(true) end
    self.view:SetUnlocked(false)
    if not self.previewMode then self:RefreshNow("locked") end
    return true
end

function Definition:OpenSettings()
    if ns.UI and type(ns.UI.OpenMain) == "function" then return ns.UI:OpenMain("currencyBar") end
    return false
end

function Definition:GetDiagnostics()
    local resources = ns.Runtime and ns.Runtime:GetDiagnostics("CurrencyBar") or {}
    return {
        runtimeActive = self.runtimeActive,
        preview = self.previewMode,
        unlocked = self.isUnlocked,
        dataDirty = self.dataDirty,
        status = self.lastStatus,
        mapSubscribed = self.mapSubscribed,
        events = resources.eventCount or 0,
        hooks = resources.hookCount or 0,
        timers = resources.timerCount or 0,
        tickers = resources.tickerCount or 0,
        refreshes = resources.refreshPendingCount or 0,
        onUpdates = resources.onUpdateCount or 0,
        view = self.view:GetDiagnostics(),
    }
end

local module, reason = ns.RegisterModule("CurrencyBar", Definition)
if module then
    ns.CurrencyBar = module
    ns.CurrencyBarDefinition = Definition
else
    ns.CurrencyBarRegistrationError = reason
end

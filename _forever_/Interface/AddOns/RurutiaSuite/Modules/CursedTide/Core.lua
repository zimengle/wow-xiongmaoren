-- 文件职责：管理 CursedTide 差异 DB、地图状态机、有界事件/单 ticker 与模型合并刷新。
-- 不负责：直读 WoW 全局 API、猜测活动时刻表/航点、创建视图 Frame 或处理皮肤。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("CursedTide")) then return end

local Data, Adapter = ns.CursedTideData, ns.CursedTideAdapter
local ViewClass, Settings = ns.CursedTideViewClass, ns.CursedTideSettings
if type(Data) ~= "table" or type(Adapter) ~= "table" or type(ViewClass) ~= "table"
    or type(Settings) ~= "table" then
    error("CursedTide requires Data, Retail Adapter, View, and Settings before Core.lua", 2)
end

local PROFILE_KEYS = {
    "enabled", "scale", "customPosition", "positionX", "positionY", "positionAnchor",
    "collapsed", "font", "fontSettingVersion",
}

local Definition = {
    databaseName = "CursedTide",
    defaultEnabled = true,
    defaults = { profile = {
        enabled = Data.defaults.enabled,
        scale = Data.defaults.scale,
        collapsed = Data.defaults.collapsed,
    } },
}

local function IsFinite(value)
    return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

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
    local called, ok, reason = pcall(assembly.SetModuleEnabled, assembly, "CursedTide", enabled)
    if not called then return false, "module_transition_error" end
    if ok ~= true then return false, reason or "module_transition_failed" end
    return true, reason
end

local function NormalizeProfile(profile)
    local enabled = rawget(profile, "enabled")
    if type(enabled) ~= "boolean" or enabled == Data.defaults.enabled then rawset(profile, "enabled", nil) end
    local collapsed = rawget(profile, "collapsed")
    if type(collapsed) ~= "boolean" or collapsed == Data.defaults.collapsed then
        rawset(profile, "collapsed", nil)
    end
    local scale = rawget(profile, "scale")
    if not IsFinite(scale) then rawset(profile, "scale", nil)
    else StoreDifference(profile, "scale", Adapter:ClampScale(scale, Data), Data.defaults.scale) end

    local custom = rawget(profile, "customPosition") == true
    local x, y = rawget(profile, "positionX"), rawget(profile, "positionY")
    local anchor = rawget(profile, "positionAnchor")
    if not (custom and IsFinite(x) and IsFinite(y)
        and (anchor == nil or anchor == Data.layout.positionAnchor)) then
        rawset(profile, "customPosition", nil)
        rawset(profile, "positionX", nil)
        rawset(profile, "positionY", nil)
        rawset(profile, "positionAnchor", nil)
    else
        rawset(profile, "customPosition", true)
        rawset(profile, "positionAnchor", Data.layout.positionAnchor)
    end

    -- 旧 font 是单模块选项；新版统一使用 Presentation/Font 的 interface role。
    rawset(profile, "font", nil)
    rawset(profile, "fontSettingVersion", nil)
    local key
    for key in pairs(profile) do
        local known = false
        local index
        for index = 1, #PROFILE_KEYS do if PROFILE_KEYS[index] == key then known = true break end end
        if not known then rawset(profile, key, nil) end
    end
end

local function SyncRootSetting(module)
    if ns.Assembly and type(ns.Assembly.SetModuleConfigured) == "function" then
        ns.Assembly:SetModuleConfigured("CursedTide", module:GetProfile().enabled ~= false)
    end
end

local function CopyEntry(entry, mode)
    return {
        definition = entry.definition,
        areaPoiID = entry.areaPoiID,
        startTime = entry.startTime,
        endTime = entry.endTime,
        active = entry.active,
        mode = mode,
    }
end

function Definition:GetProfile() return self.db and self.db.profile end
function Definition:IsCollapsed() return self:GetProfile().collapsed == true end

function Definition:Initialize()
    NormalizeProfile(self.db.profile)
    self.adapter = Adapter
    self.view = ViewClass:New(self, Adapter, Data)
    self.runtimeActive = false
    self.previewMode = false
    self.isUnlocked = false
    self.mapSubscribed = false
    self.liveActive = false
    self.requestIssued = false
    self.ticker = nil
    self.lastStatus = "initialized"
    self.scanCount = 0
    SyncRootSetting(self)
    Settings:Register(self)
end

function Definition:ProfileChanged()
    NormalizeProfile(self.db.profile)
    SyncRootSetting(self)
end

function Definition:IsLiveRequested()
    return self.adapter:IsTargetMap(Data.content.mapID)
end

function Definition:IsDisplayRequested()
    return self.previewMode or self.isUnlocked or self:IsLiveRequested()
end

function Definition:ToggleWaypoint(definition)
    if not self.runtimeActive or not self:IsEnabled() or self:GetProfile().enabled == false
        or not self:IsDisplayRequested() then return false, "inactive" end
    return self.adapter:ToggleWaypoint(definition)
end

function Definition:BuildPreviewSnapshot()
    local now, active, upcoming = self.adapter:GetNow(), {}, {}
    local first = Data.activitiesByPoi[Data.orderedPoiIDs[1]]
    if first then active[1] = { definition = first, areaPoiID = first.areaPoiID,
        startTime = now - 60, endTime = now + 240, active = true } end
    local index
    for index = 2, #Data.orderedPoiIDs do
        local definition = Data.activitiesByPoi[Data.orderedPoiIDs[index]]
        if definition then upcoming[#upcoming + 1] = { definition = definition,
            areaPoiID = definition.areaPoiID, startTime = now + (index - 1) * 900,
            endTime = now + index * 900, active = false } end
    end
    return { active = active, upcoming = upcoming, now = now, preview = true }
end

function Definition:BuildRows(snapshot)
    local rows, fresh, stale = {}, {}, {}
    local now = snapshot.now or self.adapter:GetNow()
    local index
    for index = 1, #(snapshot.active or {}) do
        local entry = snapshot.active[index]
        local elapsed = entry.startTime and (now - entry.startTime) or Data.activeFreshSeconds
        if elapsed >= 0 and elapsed < Data.activeFreshSeconds then fresh[#fresh + 1] = entry
        else stale[#stale + 1] = entry end
    end
    local upcoming = snapshot.upcoming or {}
    if self:IsCollapsed() then
        local entry, mode = upcoming[1], "next"
        if not entry then entry, mode = fresh[1], "fresh" end
        if not entry then entry, mode = stale[1], "active" end
        if entry then rows[1] = CopyEntry(entry, mode) end
        return rows
    end
    for index = 1, #fresh do rows[#rows + 1] = CopyEntry(fresh[index], "fresh") end
    if upcoming[1] then rows[#rows + 1] = CopyEntry(upcoming[1], "next") end
    local following = math.min(Data.maxFollowingRows, math.max(0, #upcoming - 1))
    for index = 1, following do rows[#rows + 1] = CopyEntry(upcoming[index + 1], "following") end
    for index = 1, #stale do rows[#rows + 1] = CopyEntry(stale[index], "active") end
    while #rows > Data.maxEntries do rows[#rows] = nil end
    return rows
end

function Definition:RefreshModel(reason)
    if not (self.runtimeActive and self:IsDisplayRequested()) then
        self.view:Hide()
        self.lastStatus = self.runtimeActive and "hidden" or "disabled"
        return false
    end
    local snapshot, status
    if self.previewMode or self.isUnlocked then
        snapshot, status = self:BuildPreviewSnapshot(), "preview"
    else
        snapshot, status = self.adapter:ReadEvents(Data)
        self.scanCount = self.scanCount + 1
        self:RecordScan()
    end
    if not snapshot then
        local rendered = self.view:RenderStatus(
            status == "waiting" and "等待活动数据…" or "当前客户端不支持活动日程",
            self:GetProfile()
        )
        self.lastStatus = rendered and (status or "unavailable") or "view_unavailable"
        return false
    end
    local rows = self:BuildRows(snapshot)
    if #rows == 0 then
        local rendered = self.view:RenderStatus("近期没有已验证的诅咒狂潮活动", self:GetProfile())
        self.lastStatus = rendered and "empty" or "view_unavailable"
        return rendered
    end
    local rendered = self.view:Render(rows, self:GetProfile(), snapshot.preview == true)
    if rendered then self.view:SetUnlocked(self.isUnlocked) end
    self.lastStatus = rendered and (reason or status or "visible") or "view_unavailable"
    return rendered
end

function Definition:QueueRefresh(reason)
    self.pendingReason = reason or self.pendingReason or "refresh"
    return self:RequestRefresh("cursed-tide", function()
        local pending = self.pendingReason
        self.pendingReason = nil
        self:UpdateActivity(pending)
    end, 0)
end

function Definition:StartLiveResources()
    if self.liveActive then return true end
    self.liveActive = true
    self:RegisterEvent("EVENT_SCHEDULER_UPDATE", self.EVENT_SCHEDULER_UPDATE)
    if not self.requestIssued then
        local requested = self.adapter:RequestEvents()
        self.requestIssued = requested == true
    end
    return true
end

function Definition:StopLiveResources()
    if not self.liveActive then return false end
    self.liveActive = false
    self.requestIssued = false
    self:UnregisterEvent("EVENT_SCHEDULER_UPDATE")
    return true
end

function Definition:StartTicker()
    if self.ticker then return self.ticker end
    self.ticker = self:ScheduleRepeating(Data.updateInterval, function()
        if self.view:Tick(self.adapter:GetNow()) then self:QueueRefresh("boundary") end
    end, "CursedTide countdown")
    return self.ticker
end

function Definition:StopTicker()
    if not self.ticker then return false end
    local ticker = self.ticker
    self.ticker = nil
    return self:CancelSchedule(ticker)
end

function Definition:UpdateActivity(reason)
    local visible = self:IsDisplayRequested()
    local live = visible and not (self.previewMode or self.isUnlocked) and self:IsLiveRequested()
    if live then self:StartLiveResources() else self:StopLiveResources() end
    if visible then self:StartTicker() else self:StopTicker() end
    if not visible then self.view:Hide() self.lastStatus = "hidden" return false end
    return self:RefreshModel(reason)
end

function Definition:AttachMap()
    if self.mapSubscribed or not self.adapter:IsWorldMapAvailable() then return false end
    local tokens = self.adapter:SubscribeMapState(self, function() self:QueueRefreshState("map-state") end)
    if not tokens then return false end
    self.mapSubscribed = true
    self:UnregisterEvent("ADDON_LOADED")
    return true
end

function Definition:QueueRefreshState(reason)
    return self:QueueRefresh(reason or "state")
end

function Definition:Enable()
    if self:GetProfile().enabled == false then self.lastStatus = "disabled" return true end
    self.runtimeActive = true
    if not self:AttachMap() then self:RegisterEvent("ADDON_LOADED", self.ADDON_LOADED) end
    self:UpdateActivity("enabled")
    return true
end

function Definition:Disable()
    self.runtimeActive = false
    self.previewMode = false
    self.isUnlocked = false
    self.mapSubscribed = false
    self.liveActive = false
    self.requestIssued = false
    self.pendingReason = nil
    self.ticker = nil
    self:CancelRefresh("cursed-tide")
    self:UnregisterAllEvents()
    self.view:SetUnlocked(false)
    self.view:Hide()
    self.view:ReleaseOwnership()
    self.lastStatus = "disabled"
    return true
end

function Definition:ADDON_LOADED(_, addonName)
    if addonName ~= self.adapter.targetAddon then return false end
    if self:AttachMap() then self:QueueRefreshState("map-loaded") return true end
    return false
end

function Definition:EVENT_SCHEDULER_UPDATE()
    if self.liveActive then self:QueueRefresh("scheduler") end
end

function Definition:SetFeatureEnabled(enabled)
    enabled = enabled and true or false
    local profile = self:GetProfile()
    StoreDifference(profile, "enabled", enabled, Data.defaults.enabled)
    SyncRootSetting(self)
    local ok, reason = SetRuntimeEnabled(enabled)
    if not ok then
        local runtimeEnabled = self:IsEnabled()
        StoreDifference(profile, "enabled", runtimeEnabled, Data.defaults.enabled)
        SyncRootSetting(self)
        return false, reason
    end
    return true
end

function Definition:SetCollapsed(collapsed)
    StoreDifference(self:GetProfile(), "collapsed", collapsed and true or false, Data.defaults.collapsed)
    if self:IsDisplayRequested() then self:RefreshModel("collapsed") end
    return true
end

function Definition:SetScale(value)
    if self.adapter:IsInCombat() then return false, "combat" end
    local scale = self.adapter:ClampScale(value, Data)
    StoreDifference(self:GetProfile(), "scale", scale, Data.defaults.scale)
    return self.view:ApplyProfile(self:GetProfile())
end

function Definition:SetPosition(x, y)
    if self.adapter:IsInCombat() then return false, "combat" end
    x, y = tonumber(x), tonumber(y)
    if not (IsFinite(x) and IsFinite(y)) then return false, "invalid_position" end
    local profile = self:GetProfile()
    rawset(profile, "customPosition", true)
    rawset(profile, "positionX", x)
    rawset(profile, "positionY", y)
    rawset(profile, "positionAnchor", Data.layout.positionAnchor)
    return self.view:ApplyProfile(profile)
end

function Definition:SavePosition()
    if self.adapter:IsInCombat() or not self.view.panel then return false, "combat_or_missing" end
    local x, y = self.adapter:CaptureOffset(self.view.panel)
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
    return self.view:ApplyProfile(profile)
end

function Definition:ResetDefaults()
    if self.adapter:IsInCombat() then return false, "combat" end
    local profile, index = self:GetProfile()
    local snapshot = SnapshotProfile(profile)
    local previousPreview, previousUnlocked = self.previewMode, self.isUnlocked
    for index = 1, #PROFILE_KEYS do rawset(profile, PROFILE_KEYS[index], nil) end
    self.previewMode, self.isUnlocked = false, false
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
    if self:IsEnabled() then self:UpdateActivity("reset-defaults") end
    return true
end

function Definition:SetPreview(enabled)
    if self.adapter:IsInCombat() or self:GetProfile().enabled == false then return false, "combat_or_disabled" end
    self.previewMode = enabled and true or false
    self:UpdateActivity(self.previewMode and "preview" or "preview-ended")
    return true
end

function Definition:SetUnlocked(unlocked)
    if self.adapter:IsInCombat() or self:GetProfile().enabled == false then return false, "combat_or_disabled" end
    self.isUnlocked = unlocked and true or false
    self:UpdateActivity(self.isUnlocked and "unlocked" or "locked")
    return self.view:SetUnlocked(self.isUnlocked)
end

function Definition:OpenSettings()
    if ns.UI and type(ns.UI.OpenMain) == "function" then return ns.UI:OpenMain("cursedTide") end
    return false
end

function Definition:GetDiagnostics()
    local resources = ns.Runtime and ns.Runtime:GetDiagnostics("CursedTide") or {}
    return {
        runtimeActive = self.runtimeActive, live = self.liveActive, preview = self.previewMode,
        unlocked = self.isUnlocked, requestIssued = self.requestIssued, status = self.lastStatus,
        mapSubscribed = self.mapSubscribed, scans = self.scanCount,
        events = resources.eventCount or 0, hooks = resources.hookCount or 0,
        timers = resources.timerCount or 0, tickers = resources.tickerCount or 0,
        refreshes = resources.refreshPendingCount or 0, onUpdates = resources.onUpdateCount or 0,
        view = self.view:GetDiagnostics(),
    }
end

local module, reason = ns.RegisterModule("CursedTide", Definition)
if module then ns.CursedTide, ns.CursedTideDefinition = module, Definition
else ns.CursedTideRegistrationError = reason end

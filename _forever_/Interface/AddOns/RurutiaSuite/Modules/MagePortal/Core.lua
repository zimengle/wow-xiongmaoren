local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("MagePortal")) then return end

local Adapter = ns.MagePortalAdapter
local View = ns.MagePortalViewClass
local Settings = ns.MagePortalSettings
if type(Adapter) ~= "table" or type(View) ~= "table" or type(Settings) ~= "table" then
    error("MagePortal requires its active Build adapter, View, and Settings before Core.lua", 2)
end

local DEFAULT_POSITION = {
    Adapter.layout.anchor,
    nil,
    Adapter.layout.anchor,
    Adapter.layout.x,
    Adapter.layout.y,
}
local VALID_DIRECTIONS = { DOWN = true, UP = true, RIGHT = true, LEFT = true }
local function OnFontChanged(owner, _, role)
    if role == "magePortal" and owner.runtimeActive and owner.view then owner.view:ApplyFonts() end
end
local Definition = {
    defaults = {
        profile = {
            spellBarEnabled = true,
            position = DEFAULT_POSITION,
            direction = Adapter.layout.direction,
            buttonSize = Adapter.layout.buttonSize,
            padding = Adapter.layout.padding,
            maxButtons = Adapter.layout.maxButtons,
        },
    },
    defaultEnabled = Adapter:IsAvailable(),
}

local function CopyPosition(position)
    return {
        position and position[1] or DEFAULT_POSITION[1],
        nil,
        position and position[3] or DEFAULT_POSITION[3],
        position and tonumber(position[4]) or DEFAULT_POSITION[4],
        position and tonumber(position[5]) or DEFAULT_POSITION[5],
    }
end

local function ClearArray(values)
    local index
    for index = #values, 1, -1 do values[index] = nil end
end

function Definition:GetProfile()
    return self.db and self.db.profile
end

function Definition:IsAvailable()
    return self.available == true
end

function Definition:IsFeatureEnabled()
    local profile = self:GetProfile()
    return profile and profile.spellBarEnabled == true
end

function Definition:SanitizeProfile()
    local profile = self:GetProfile()
    if not profile then return false end
    if type(Adapter.MigrateLegacyProfile) == "function" then Adapter:MigrateLegacyProfile(self.db) end

    local position = profile.position
    if type(position) ~= "table"
        or ((position[1] == nil or position[1] == "CENTER")
            and (tonumber(position[4]) or 0) == 0
            and (tonumber(position[5]) or 0) == 0) then
        profile.position = CopyPosition(DEFAULT_POSITION)
    else
        profile.position = CopyPosition(position)
    end

    local direction = profile.direction
    if direction == "VERTICAL" then
        direction = "DOWN"
    elseif direction == "HORIZONTAL" then
        direction = "RIGHT"
    end
    profile.direction = VALID_DIRECTIONS[direction] and direction or Adapter.layout.direction

    local size = tonumber(profile.buttonSize)
    profile.buttonSize = (not size or size == 30) and Adapter.layout.buttonSize or math.max(16, math.min(64, size))
    local padding = tonumber(profile.padding)
    profile.padding = (not padding or padding == 5) and Adapter.layout.padding or math.max(0, math.min(20, padding))
    local maximum = tonumber(profile.maxButtons)
    profile.maxButtons = (not maximum or maximum == 12)
        and Adapter.layout.maxButtons or math.max(1, math.min(Adapter.layout.maxButtons, math.floor(maximum)))
    if profile.spellBarEnabled == nil then profile.spellBarEnabled = true end
    return true
end

function Definition:SyncAssemblySwitch(enabled)
    if not ns.Assembly or type(ns.Assembly.SetModuleConfigured) ~= "function" then return false end
    return ns.Assembly:SetModuleConfigured("MagePortal", enabled and true or false)
end

function Definition:Initialize()
    self.adapter = Adapter
    self.available = Adapter:IsAvailable()
    self.previewEnabled = false
    self.isUnlocked = false
    self.runtimeActive = false
    self.secureDirty = false
    self.combatDeferred = false
    self.pendingFeatureEnabled = nil
    self.pendingPreviewEnabled = nil
    self.isReagentListenerEnabled = false
    self.validSpells = {}
    self.view = View:New(self, Adapter)
    self:SanitizeProfile()

    if not self.available or not self:IsFeatureEnabled() then
        self:SyncAssemblySwitch(false)
    end
    Settings:Register(self)
end

function Definition:ProfileChanged()
    self:SanitizeProfile()
end

function Definition:ShouldRun()
    if not self.available then return false end
    if not self.previewEnabled and not self:IsFeatureEnabled() then return false end
    return self.previewEnabled or Adapter:GetPlayerClass() == "MAGE"
end

function Definition:ActivateRuntime()
    if self.runtimeActive or not self:ShouldRun() then return false end
    if Adapter:IsInCombat() then
        self.combatDeferred = true
        self.secureDirty = true
        self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
        return true
    end
    self.runtimeActive = true
    if ns.Font and type(ns.Font.Subscribe) == "function" then
        self.fontSubscription = ns.Font
        ns.Font:Subscribe(self, OnFontChanged)
    end
    self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.PLAYER_ENTERING_WORLD)
    self:RegisterEvent("SPELLS_CHANGED", self.SPELLS_CHANGED)
    self.initialRefreshHandle = self:Schedule(1, self.OnInitialRefresh, "MagePortal initial refresh")
    return true
end

function Definition:Enable()
    if not self:ShouldRun() then return false end
    return self:ActivateRuntime()
end

function Definition:Disable()
    return self:SuspendRuntime()
end

function Definition:SuspendRuntime()
    self.runtimeActive = false
    if self.movePreviewEnabled then
        self.previewEnabled = false
        self.movePreviewEnabled = nil
    end
    if self.fontSubscription then
        self.fontSubscription:Unsubscribe(self)
        self.fontSubscription = nil
    end
    self.secureDirty = false
    self.combatDeferred = false
    self.isUnlocked = false
    self.isReagentListenerEnabled = false
    self:UnregisterAllEvents()
    if self.initialRefreshHandle then
        self:CancelSchedule(self.initialRefreshHandle)
        self.initialRefreshHandle = nil
    end
    self:CancelRefresh("mage-portal-secure")
    self:CancelRefresh("mage-portal-reagent")
    self:CancelRefresh("mage-portal-collapse")
    if self.view then
        self.view:SetUnlocked(false, self:GetProfile())
        self.view:Hide()
        self.view:ReleaseOwnership()
    end
    return true
end

function Definition:OnInitialRefresh()
    self.initialRefreshHandle = nil
    self:UpdateBar()
end

function Definition:SetReagentListenerEnabled(enabled)
    enabled = enabled and true or false
    if enabled == self.isReagentListenerEnabled then return false end
    self.isReagentListenerEnabled = enabled
    if enabled then
        self:RegisterEvent("BAG_UPDATE_DELAYED", self.BAG_UPDATE_DELAYED)
    else
        self:UnregisterEvent("BAG_UPDATE_DELAYED")
        self:CancelRefresh("mage-portal-reagent")
    end
    return true
end

function Definition:QueueSecureRefresh(delay)
    if not self.runtimeActive then return false end
    if Adapter:IsInCombat() then
        self.secureDirty = true
        return false
    end
    self.secureDirty = false
    self:RequestRefresh("mage-portal-secure", self.OnSecureRefresh, delay or 0.05)
    return true
end

function Definition:OnSecureRefresh()
    self:UpdateBar()
end

function Definition:RequestReagentCountRefresh()
    if not self.runtimeActive or not self.isReagentListenerEnabled then return false end
    self:RequestRefresh("mage-portal-reagent", self.UpdateReagentCountText, 0.05)
    return true
end

function Definition:UpdateReagentCountText()
    return self.view and self.view:UpdateReagentCount() or false
end

function Definition:UpdateBar()
    if not self.runtimeActive then return false end
    if Adapter:IsInCombat() then
        self.secureDirty = true
        return false
    end
    self.secureDirty = false

    if not self:ShouldRun() then
        self:SetReagentListenerEnabled(false)
        self.view:Hide()
        return false
    end

    local data = Adapter:GetData()
    if type(data) ~= "table" then
        self:SetReagentListenerEnabled(false)
        self.view:Hide()
        return false
    end

    local valid = self.validSpells
    ClearArray(valid)
    local faction = Adapter:GetFaction()
    local index
    for index = 1, #data do
        local info = data[index]
        if self.previewEnabled or not info.requiredFaction or info.requiredFaction == faction then
            info.isKnown = self.previewEnabled
                or Adapter:IsSpellKnown(info.teleportID)
                or Adapter:IsSpellKnown(info.portalID)
            if info.isKnown then
                valid[#valid + 1] = info
            end
        end
    end

    if #valid == 0 then
        self:SetReagentListenerEnabled(false)
        self.view:Hide()
        return false
    end

    if not self.view:Refresh(valid, self:GetProfile(), self.previewEnabled, self.isUnlocked) then
        self:SetReagentListenerEnabled(false)
        if self.view.unavailableReason then self:SuspendRuntime() end
        return false
    end
    self:SetReagentListenerEnabled(not Adapter:IsReagentFree())
    return true
end

function Definition:PLAYER_REGEN_ENABLED()
    self.combatDeferred = false
    self.pendingFeatureEnabled = nil
    self.pendingPreviewEnabled = nil
    local ok, reason
    if not self:IsFeatureEnabled() and not self.previewEnabled then
        self:SyncAssemblySwitch(false)
        ok, reason = ns.Assembly:SetModuleEnabled("MagePortal", false)
    else
        self:SyncAssemblySwitch(true)
        if not self:ShouldRun() then
            ok, reason = self:SuspendRuntime()
        else
            if not self.runtimeActive then self:ActivateRuntime() end
            ok, reason = self:QueueSecureRefresh(0)
        end
    end
    if ns.UI and type(ns.UI.RefreshNavigationSwitch) == "function" then
        ns.UI:RefreshNavigationSwitch("portal")
    end
    return ok, reason
end

function Definition:PLAYER_ENTERING_WORLD()
    return self:QueueSecureRefresh(0)
end

function Definition:SPELLS_CHANGED()
    return self:QueueSecureRefresh(0.05)
end

function Definition:BAG_UPDATE_DELAYED()
    return self:RequestReagentCountRefresh()
end

function Definition:ExpandFlyout()
    if Adapter:IsInCombat() then self.secureDirty = true return false end
    self:CancelRefresh("mage-portal-collapse")
    return self.view and self.view:Expand() or false
end

function Definition:CollapseFlyout()
    if not self.runtimeActive or self.isUnlocked then return false end
    if Adapter:IsInCombat() then self.secureDirty = true return false end
    self:RequestRefresh("mage-portal-collapse", self.OnCollapseDue, 0.2)
    return true
end

function Definition:OnCollapseDue()
    return self.view and self.view:Collapse() or false
end

function Definition:ToggleSpellBar(enabled)
    enabled = enabled and true or false
    local profile = self:GetProfile()
    if not profile then return false end
    profile.spellBarEnabled = enabled
    if not self.available then self:SyncAssemblySwitch(false) return false end
    if not ns.Assembly or type(ns.Assembly.SetModuleEnabled) ~= "function" then return false end
    if Adapter:IsInCombat() then
        self.pendingFeatureEnabled = enabled
        if enabled or self.previewEnabled then
            self:SyncAssemblySwitch(true)
            if not self:IsEnabled() then return ns.Assembly:SetModuleEnabled("MagePortal", true) end
            self.combatDeferred = true
            self.secureDirty = true
            self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
        elseif self:IsEnabled() then
            self.combatDeferred = true
            self.secureDirty = true
            self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
        else
            self:SyncAssemblySwitch(false)
        end
        return true
    end
    if enabled or self.previewEnabled then
        self:SyncAssemblySwitch(true)
        local ok, reason = ns.Assembly:SetModuleEnabled("MagePortal", true)
        if not ok then return ok, reason end
        if not self.runtimeActive and self:ShouldRun() then self:ActivateRuntime() end
        if self.runtimeActive then self:QueueSecureRefresh(0) end
        return true
    end
    self:SyncAssemblySwitch(false)
    return ns.Assembly:SetModuleEnabled("MagePortal", false)
end

function Definition:TogglePreview(enabled)
    enabled = enabled and true or false
    if enabled == self.previewEnabled then return true end
    if enabled and not self.available then return false end
    self.previewEnabled = enabled

    if Adapter:IsInCombat() then
        self.pendingPreviewEnabled = enabled
        if enabled then
            self:SyncAssemblySwitch(true)
            if not self:IsEnabled() then return ns.Assembly:SetModuleEnabled("MagePortal", true) end
            self.combatDeferred = true
            self.secureDirty = true
            self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
        elseif self:IsEnabled() then
            self.combatDeferred = true
            self.secureDirty = true
            self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
        end
        return true
    end

    if enabled then
        if not self:IsEnabled() then
            local ok = ns.Assembly:SetModuleEnabled("MagePortal", true)
            if not ok then self.previewEnabled = false return false end
        end
        if not self.runtimeActive then self:ActivateRuntime() end
        if self.runtimeActive then
            self:CancelRefresh("mage-portal-secure")
            self:UpdateBar()
        end
        return true
    end

    if not self:IsFeatureEnabled() then
        return ns.Assembly:SetModuleEnabled("MagePortal", false)
    end
    if not self:ShouldRun() then
        self:SuspendRuntime()
        return false
    end
    self:CancelRefresh("mage-portal-secure")
    self:CancelRefresh("mage-portal-collapse")
    self:UpdateBar()
    return true
end

function Definition:SetDirection(direction)
    if not VALID_DIRECTIONS[direction] then return false end
    self:GetProfile().direction = direction
    return self:QueueSecureRefresh(0)
end

function Definition:SetPosition(x, y)
    if Adapter:IsInCombat() then return false end
    local profile = self:GetProfile()
    local position = profile.position or DEFAULT_POSITION
    local anchor = position[1] or DEFAULT_POSITION[1]
    profile.position = { anchor, nil, anchor, tonumber(x) or 0, tonumber(y) or 0 }
    return self.view and self.view:ApplyPosition(profile) or false
end

function Definition:SaveCurrentPosition()
    if Adapter:IsInCombat() or not (self.view and self.view.bar) then return false end
    local desired = self:GetProfile().position
    local anchor, x, y = Adapter:ComputePosition(self.view.bar, desired and desired[1])
    if not anchor then return false end
    self:GetProfile().position = { anchor, nil, anchor, x, y }
    return self.view:ApplyPosition(self:GetProfile())
end

function Definition:ResetPosition()
    rawset(self:GetProfile(), "position", nil)
    local applied = self.view and self.view:ApplyPosition(self:GetProfile()) or true
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return applied
end

function Definition:RefreshClamp()
    local bar = self.view and self.view.bar
    if not bar then return false end
    if type(bar.SetClampedToScreen) == "function" then bar:SetClampedToScreen(true) end
    return true
end

function Definition:SetUnlocked(unlocked)
    unlocked = unlocked and true or false
    if not self.available or Adapter:IsInCombat() then return false end
    if unlocked and not (self:IsFeatureEnabled() or self.previewEnabled) then return false end
    if unlocked and not self.previewEnabled and #self.validSpells == 0 then
        self.movePreviewEnabled = true
        self.previewEnabled = true
    elseif not unlocked and self.movePreviewEnabled then
        self.movePreviewEnabled = nil
        self.previewEnabled = false
    end
    if unlocked and not self.runtimeActive then
        if not self:IsEnabled() then ns.Assembly:SetModuleEnabled("MagePortal", true) end
        self:ActivateRuntime()
    end
    self.isUnlocked = unlocked
    if self.view:SetUnlocked(unlocked, self:GetProfile()) == false then
        self.isUnlocked = false
        return false
    end
    self:CancelRefresh("mage-portal-secure")
    self:UpdateBar()
    return true
end

function Definition:ToggleAnchor()
    return self:SetUnlocked(not self.isUnlocked)
end

function Definition:OpenSettings()
    return ns.UI and type(ns.UI.OpenMain) == "function" and ns.UI:OpenMain("portal") or false
end

function Definition:GetMoveNudgeConfig()
    if self.moveNudgeConfig then return self.moveNudgeConfig end
    local owner = self
    self.moveNudgeConfig = {
        label = "法师动作条",
        getPosition = function()
            local position = owner:GetProfile().position
            return position and position[4] or 0, position and position[5] or 0
        end,
        setPosition = function(x, y) owner:SetPosition(x, y) end,
        savePosition = function() owner:SaveCurrentPosition() end,
        onSettings = function() owner:OpenSettings() end,
        onLock = function()
            if type(ns.SetRsMoveMode) == "function" then ns:SetRsMoveMode(false) end
        end,
    }
    return self.moveNudgeConfig
end

function Definition:OpenMoveNudge()
    local bar = self.view and self.view.bar
    if not bar or type(ns.ShowMoveNudgeFrame) ~= "function" then return false end
    return ns:ShowMoveNudgeFrame(bar, self:GetMoveNudgeConfig()) ~= nil
end

function Definition:GetDiagnostics()
    return {
        available = self.available,
        runtimeActive = self.runtimeActive,
        preview = self.previewEnabled,
        unlocked = self.isUnlocked,
        reagentListener = self.isReagentListenerEnabled,
        secureDirty = self.secureDirty,
        combatDeferred = self.combatDeferred,
        dataCount = #(Adapter:GetData() or {}),
        view = self.view and self.view:GetDiagnostics() or nil,
    }
end

local module, reason = ns.RegisterModule("MagePortal", Definition)
if module then
    ns.MagePortal = module
    ns.MagePortalDefinition = Definition
else
    ns.MagePortalRegistrationError = reason
end

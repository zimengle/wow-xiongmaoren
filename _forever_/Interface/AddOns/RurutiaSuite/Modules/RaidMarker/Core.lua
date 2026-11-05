local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("RaidMarker")) then return end

local Data = ns.RaidMarkerData
local Adapter = ns.RaidMarkerAdapter
local View = ns.RaidMarkerViewClass
local Movement = ns.RaidMarkerMovementClass
local Settings = ns.RaidMarkerSettings
if type(Data) ~= "table" or type(Adapter) ~= "table" or type(View) ~= "table"
    or type(Movement) ~= "table" or type(Settings) ~= "table" then
    error("RaidMarker requires Data, active Build adapter, View, Movement, and Settings before Core.lua", 2)
end

local SECURE_SETTINGS = {
    enabled = true,
    sideButtonsEnabled = true,
    disableWhenSimilarAddon = true,
    hideInPetBattle = true,
    hideWhenSolo = true,
    reverseOrder = true,
    pullCountdown = true,
    markerSize = true,
    sideButtonFontSize = true,
    spacing = true,
    sideButtonXOffset = true,
    sideButtonGap = true,
}

local LAYOUT_SETTINGS = {
    sideButtonFontSize = true,
    sideButtonsEnabled = true,
    reverseOrder = true,
    pullCountdown = true,
    markerSize = true,
    spacing = true,
    sideButtonXOffset = true,
    sideButtonGap = true,
}

local function Clamp(value, minimum, maximum, fallback)
    value = tonumber(value)
    if not value then return fallback end
    if value < minimum then return minimum end
    if value > maximum then return maximum end
    return value
end

local function CopyDefaults()
    local profile = {}
    local key, value
    for key, value in pairs(Data.defaults) do profile[key] = value end
    profile.position = {
        point = Data.position.point,
        relativePoint = Data.position.relativePoint,
        x = Data.position.x,
        y = Data.position.y,
    }
    return { profile = profile }
end

local Definition = {
    defaults = CopyDefaults(),
    defaultEnabled = true,
    -- Runtime owns module.data for mutable per-module runtime state.  Keep the
    -- immutable RaidMarker schema on a distinct field so settings registration
    -- cannot be shadowed by Runtime:RegisterModule's data bag.
    raidMarkerData = Data,
    adapter = Adapter,
    CONFIG = {
        MARKERS = Data.markers,
        SIDE_BUTTONS = Data.sideButtons,
        DEFAULT_POSITION = Data.position,
        DEFAULT_PROFILE = Data.defaults,
    },
    MARKERS = Data.markers,
    SIDE_BUTTONS = Data.sideButtons,
    DEFAULT_POSITION = Data.position,
    SIDE_BUTTON_WIDTH = Data.barLayout.sideButtonWidth,
    SIDE_BUTTON_HEIGHT = Data.barLayout.sideButtonHeight,
}

local function OnSharedFontChanged(module, _, role)
    if not module.runtimeActive or role ~= "interface" or not module.view then return end
    module.view.fontSignature = nil
    module.view:UpdateFont()
end

function Definition:GetProfile()
    return self.db and self.db.profile
end

function Definition:CopyPosition(position)
    position = type(position) == "table" and position or Data.position
    return {
        point = position.point or Data.position.point,
        relativePoint = rawget(position, "relativePoint") or position.point or Data.position.relativePoint,
        x = tonumber(position.x) or Data.position.x,
        y = tonumber(position.y) or Data.position.y,
    }
end

function Definition:GetMarkerOrder()
    local profile = self:GetProfile()
    if not (profile and profile.reverseOrder and Adapter:GetPolicy().supportsReverseOrder) then
        return Data.markers
    end
    if not self.reversedMarkers then
        self.reversedMarkers = {}
        local index
        for index = #Data.markers, 1, -1 do
            self.reversedMarkers[#self.reversedMarkers + 1] = Data.markers[index]
        end
    end
    return self.reversedMarkers
end

function Definition:HasWorldMarkers()
    return Adapter:HasWorldMarkers()
end

function Definition:SanitizeProfile()
    local profile = self:GetProfile()
    if not profile then return false end
    local policy = Adapter:GetPolicy()
    profile.enabled = profile.enabled ~= false
    profile.sideButtonsEnabled = profile.sideButtonsEnabled ~= false
    profile.disableWhenSimilarAddon = profile.disableWhenSimilarAddon and true or false
    profile.hideInPetBattle = profile.hideInPetBattle ~= false
    profile.reverseOrder = policy.supportsReverseOrder and profile.reverseOrder and true or false
    profile.alphaWithTarget = Clamp(profile.alphaWithTarget, 0, 1, Data.defaults.alphaWithTarget)
    profile.alphaNoTarget = Clamp(profile.alphaNoTarget, 0, 1, Data.defaults.alphaNoTarget)
    profile.markerSize = Clamp(profile.markerSize, 16, 48, Data.defaults.markerSize)
    profile.sideButtonFontSize = Clamp(profile.sideButtonFontSize, 10, 32, Data.defaults.sideButtonFontSize)
    profile.spacing = Clamp(profile.spacing, 0, 10, Data.defaults.spacing)
    profile.sideButtonXOffset = Clamp(profile.sideButtonXOffset, 0, 80,
        Data.defaults.sideButtonXOffset)
    profile.sideButtonGap = Clamp(profile.sideButtonGap, 0, 30, Data.defaults.sideButtonGap)
    profile.pullCountdown = Clamp(profile.pullCountdown, policy.pullMinimum,
        policy.pullMaximum, Data.defaults.pullCountdown)
    profile.position = self:CopyPosition(profile.position)
    return true
end

function Definition:Initialize()
    self.available = Adapter:IsAvailable() and true or false
    self.runtimeActive = false
    self.secureDirty = false
    self.secureClickDirty = false
    self.combatDeferred = false
    self.pendingVisibility = false
    self.pendingConflict = false
    self._similarAddonConflict = false
    self._petBattleActive = false
    self._combatWarned = false
    self._fontSubscribed = false
    self.isUnlocked = false
    self.view = View:New(self, Adapter, Data)
    self.movement = Movement:New(self, self.view, Adapter, Data)
    Adapter:MigrateProfile(self:GetProfile(), Data.defaults)
    self:SanitizeProfile()
    Settings:Register(self)
end

function Definition:SubscribeSharedFont()
    if self._fontSubscribed then return true end
    local font = ns.Font
    if not font or type(font.Subscribe) ~= "function" then return true end
    if font:Subscribe(self, OnSharedFontChanged) == false then return false end
    self._fontSubscribed = true
    return true
end

function Definition:UnsubscribeSharedFont()
    if not self._fontSubscribed then return true end
    local font = ns.Font
    local removed = true
    if font and type(font.Unsubscribe) == "function" then
        removed = font:Unsubscribe(self) ~= false
    end
    -- Font:Unsubscribe(false) means this owner is already absent. Clear the
    -- local mirror regardless so the next activation always re-subscribes.
    self._fontSubscribed = false
    return removed
end

function Definition:ProfileChanged()
    Adapter:MigrateProfile(self:GetProfile(), Data.defaults)
    self:SanitizeProfile()
    self._similarAddonConflict = false
end

function Definition:WarnCombatLocked()
    if self._combatWarned then return false end
    self._combatWarned = true
    if type(ns.Print) == "function" then ns.Print("战斗中不可修改标记栏，请脱战后再试。") end
    return true
end

function Definition:IsInCombat()
    return Adapter:IsInCombat()
end

function Definition:IsInPetBattle()
    return self._petBattleActive or Adapter:IsPetBattleActive()
end

function Definition:ShouldHideForPetBattle()
    local profile = self:GetProfile()
    return not self.isUnlocked and profile and profile.hideInPetBattle and self:IsInPetBattle() or false
end

function Definition:ShouldHideWhenSolo()
    local profile = self:GetProfile()
    return not self.isUnlocked and profile and profile.hideWhenSolo
        and not Adapter:IsInGroup() or false
end

function Definition:SafeRegisterEvent(event, callback)
    if not event or event == "" or type(callback) ~= "function" then return false end
    local ok = pcall(self.RegisterEvent, self, event, callback)
    return ok and true or false
end

function Definition:EnsureRegenEvent()
    return self:SafeRegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
end

function Definition:RegisterRuntimeEvents()
    self:SafeRegisterEvent("PLAYER_TARGET_CHANGED", self.PLAYER_TARGET_CHANGED)
    self:SafeRegisterEvent("PET_BATTLE_OPENING_START", self.PET_BATTLE_OPENING_START)
    self:SafeRegisterEvent("PET_BATTLE_CLOSE", self.PET_BATTLE_CLOSE)
    local profile = self:GetProfile()
    if profile and profile.hideWhenSolo then
        self:SafeRegisterEvent("GROUP_ROSTER_UPDATE", self.GROUP_ROSTER_UPDATE)
    end
    if profile and profile.disableWhenSimilarAddon then
        self:SafeRegisterEvent("ADDON_LOADED", self.ADDON_LOADED)
    end
    if Adapter:ShouldSyncSecureClicks() then
        self:SafeRegisterEvent("CVAR_UPDATE", self.CVAR_UPDATE)
    end
end

function Definition:CheckSimilarAddonConflict()
    local profile = self:GetProfile()
    return profile and profile.disableWhenSimilarAddon and Adapter:HasSimilarAddon() or false
end

function Definition:SuspendRuntime()
    self:UnsubscribeSharedFont()
    self.runtimeActive = false
    self.secureDirty = false
    self.secureClickDirty = false
    self.combatDeferred = false
    self.pendingVisibility = false
    self.pendingConflict = false
    self.isUnlocked = false
    self:CancelRefresh("raid-marker-layout")
    self:UnregisterAllEvents()
    if self.view then
        self.view:SetUnlocked(false, self:GetProfile())
        self.view:Hide()
        self.view:ReleaseOwnership()
    end
    if type(ns.HideMoveNudgeFrame) == "function" then ns:HideMoveNudgeFrame() end
    return true
end

function Definition:ApplySimilarAddonConflict()
    if not self:CheckSimilarAddonConflict() then
        local wasConflict = self._similarAddonConflict
        self._similarAddonConflict = false
        if wasConflict and self:GetProfile().enabled and self:IsEnabled() then
            self:ActivateRuntime()
        end
        return false
    end
    if Adapter:IsInCombat() then
        self.pendingConflict = true
        self:EnsureRegenEvent()
        return true
    end
    self._similarAddonConflict = true
    self:SuspendRuntime()
    self._similarAddonConflict = true
    return true
end

function Definition:CheckSimilarAddonStatus()
    return self:ApplySimilarAddonConflict()
end

function Definition:ApplyLayout()
    if not self.runtimeActive then return false end
    if Adapter:IsInCombat() then
        self.secureDirty = true
        self:EnsureRegenEvent()
        return false
    end
    self._combatWarned = false
    self.secureDirty = false
    local profile = self:GetProfile()
    if not self.view:UpdateLayout(profile) then
        self:SuspendRuntime()
        return false
    end
    self.view:RefreshClamp()
    self.view:ApplyPosition(profile)
    self:RefreshVisibility()
    return true
end

function Definition:ActivateRuntime()
    if self.runtimeActive then return true end
    local profile = self:GetProfile()
    if not self.available or not (profile and profile.enabled) then return false end
    if self:CheckSimilarAddonConflict() then
        self._similarAddonConflict = true
        return false
    end
    if Adapter:IsInCombat() then
        self.combatDeferred = true
        self.secureDirty = true
        self:EnsureRegenEvent()
        return true
    end
    self._similarAddonConflict = false
    self.runtimeActive = true
    if not self:ApplyLayout() then return false end
    -- Retained buttons may have missed CVar changes while the module was off.
    if Adapter:ShouldSyncSecureClicks() and not self:SyncSecureClickUseOnKeyDown() then
        self:SuspendRuntime()
        return false
    end
    self:RegisterRuntimeEvents()
    if not self:SubscribeSharedFont() then
        self:SuspendRuntime()
        return false
    end
    return true
end

function Definition:Enable()
    local profile = self:GetProfile()
    if not self.available or not (profile and profile.enabled) then return false end
    return self:ActivateRuntime()
end

function Definition:Disable()
    return self:SuspendRuntime()
end

function Definition:OnLayoutDue()
    return self:ApplyLayout()
end

function Definition:QueueLayout()
    if not self.runtimeActive then return false end
    if Adapter:IsInCombat() then
        self.secureDirty = true
        self:EnsureRegenEvent()
        return false
    end
    self:RequestRefresh("raid-marker-layout", self.OnLayoutDue, 0)
    return true
end

function Definition:RequestLayout()
    return self:ApplyLayout()
end

function Definition:RefreshVisibility()
    if not self.view or not self.view.bar then return false end
    if Adapter:IsInCombat() then
        self.pendingVisibility = true
        self:EnsureRegenEvent()
        return false
    end
    self.pendingVisibility = false
    local profile = self:GetProfile()
    local visible = self.runtimeActive and profile and profile.enabled
        and not self._similarAddonConflict and not self:ShouldHideForPetBattle()
        and not self:ShouldHideWhenSolo()
    self.view:SetVisible(visible)
    if visible then self:UpdateVisuals() end
    return visible
end

function Definition:RefreshPetBattleVisibility(event)
    if event == "PET_BATTLE_OPENING_START" then self._petBattleActive = true end
    if event == "PET_BATTLE_CLOSE" then self._petBattleActive = false end
    return self:RefreshVisibility()
end

function Definition:UpdateVisuals()
    if not self.runtimeActive then return false end
    return self.view:UpdateVisuals(self:GetProfile())
end

function Definition:SyncSecureClickUseOnKeyDown()
    if not self.runtimeActive or not Adapter:ShouldSyncSecureClicks() then return false end
    if Adapter:IsInCombat() then
        self.secureClickDirty = true
        self:EnsureRegenEvent()
        return false
    end
    self.secureClickDirty = false
    return self.view:SyncSecureClicks()
end

function Definition:PLAYER_TARGET_CHANGED()
    return self:UpdateVisuals()
end

function Definition:GROUP_ROSTER_UPDATE()
    return self:RefreshVisibility()
end

function Definition:PET_BATTLE_OPENING_START(event)
    return self:RefreshPetBattleVisibility(event)
end

function Definition:PET_BATTLE_CLOSE(event)
    return self:RefreshPetBattleVisibility(event)
end

function Definition:ADDON_LOADED(_, addonName)
    if self:GetProfile().disableWhenSimilarAddon and Adapter:IsConflictAddon(addonName) then
        return self:ApplySimilarAddonConflict()
    end
    return false
end

function Definition:CVAR_UPDATE(_, cvarName)
    if not Adapter:IsSecureClickCVar(cvarName) then return false end
    return self:SyncSecureClickUseOnKeyDown()
end

function Definition:PLAYER_REGEN_ENABLED()
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    self._combatWarned = false
    local ok, reason
    if self.pendingConflict then
        self.pendingConflict = false
        if self:ApplySimilarAddonConflict() then ok = true end
    end
    if ok == nil and self.combatDeferred then
        self.combatDeferred = false
        ok, reason = self:ActivateRuntime()
    elseif ok == nil then
        if self.secureClickDirty then self:SyncSecureClickUseOnKeyDown() end
        if self.secureDirty then ok, reason = self:ApplyLayout()
        elseif self.pendingVisibility then ok, reason = self:RefreshVisibility()
        else ok = true end
    end
    if ns.UI and type(ns.UI.RefreshNavigationSwitch) == "function" then
        ns.UI:RefreshNavigationSwitch("raidMarker")
    end
    return ok, reason
end

function Definition:SetFeatureEnabled(enabled)
    enabled = enabled and true or false
    local profile = self:GetProfile()
    if not profile or not self.available then return false end
    if Adapter:IsInCombat() then
        self:WarnCombatLocked()
        return false
    end
    profile.enabled = enabled
    if not enabled then return self:SuspendRuntime() end
    if not self:IsEnabled() and ns.Assembly and type(ns.Assembly.SetModuleEnabled) == "function" then
        return ns.Assembly:SetModuleEnabled("RaidMarker", true)
    end
    if not self:IsEnabled() then return self:Enable() end
    return self:ActivateRuntime()
end

function Definition:SetSetting(key, value)
    local profile = self:GetProfile()
    if not profile or Data.defaults[key] == nil then return false end
    if key == "enabled" then return self:SetFeatureEnabled(value) end
    if SECURE_SETTINGS[key] and Adapter:IsInCombat() then
        self:WarnCombatLocked()
        return false
    end

    if key == "sideButtonsEnabled" or key == "disableWhenSimilarAddon"
        or key == "hideInPetBattle" or key == "hideWhenSolo" or key == "reverseOrder" then
        profile[key] = value and true or false
    else
        profile[key] = value
    end
    self:SanitizeProfile()

    if key == "disableWhenSimilarAddon" then
        if profile.disableWhenSimilarAddon and self:ApplySimilarAddonConflict() then return true end
        if self._similarAddonConflict then self._similarAddonConflict = false end
        if profile.enabled and not self.runtimeActive then return self:ActivateRuntime() end
        if profile.disableWhenSimilarAddon then
            self:SafeRegisterEvent("ADDON_LOADED", self.ADDON_LOADED)
        else
            self:UnregisterEvent("ADDON_LOADED")
        end
        return true
    end
    if key == "hideInPetBattle" then return self:RefreshVisibility() or true end
    if key == "hideWhenSolo" then
        if profile.hideWhenSolo then
            self:SafeRegisterEvent("GROUP_ROSTER_UPDATE", self.GROUP_ROSTER_UPDATE)
        else
            self:UnregisterEvent("GROUP_ROSTER_UPDATE")
        end
        return self:RefreshVisibility() or true
    end
    if LAYOUT_SETTINGS[key] then return self:QueueLayout() or true end
    if key == "alphaWithTarget" or key == "alphaNoTarget" then
        self:UpdateVisuals()
        return true
    end
    return true
end

function Definition:ResetPosition()
    return self.movement:ResetPosition()
end

function Definition:ResetDefaults()
    if Adapter:IsInCombat() then
        self:WarnCombatLocked()
        return false
    end
    if self.db and type(self.db.ResetProfile) == "function" then self.db:ResetProfile() end
    local profile = self:GetProfile()
    self:SanitizeProfile()
    self:SuspendRuntime()
    self._similarAddonConflict = false
    if profile.enabled then self:ActivateRuntime() end
    self:RefreshSettingsPage("defaults")
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return true
end

function Definition:SetUnlocked(unlocked)
    return self.movement:SetUnlocked(unlocked)
end

function Definition:ToggleAnchor()
    return self.movement:ToggleAnchor()
end

function Definition:SavePosition()
    return self.movement:SavePosition()
end

function Definition:SetPosition(x, y)
    return self.movement:SetPosition(x, y)
end

function Definition:ApplyPosition()
    return self.view:ApplyPosition(self:GetProfile())
end

function Definition:RefreshClamp()
    return self.movement:RefreshClamp()
end

function Definition:GetMoveNudgeConfig()
    return self.movement:GetNudgeConfig()
end

function Definition:OpenMoveNudge()
    return self.movement:OpenNudge()
end

function Definition:OpenSettings()
    return ns.UI and type(ns.UI.OpenMain) == "function"
        and ns.UI:OpenMain(Data.settingsLayout.pageId) or false
end

function Definition:DrawSettings(container)
    local system = ns.UISystem or (ns.UI and ns.UI.GetSystem and ns.UI:GetSystem())
    return system and type(system.OpenPage) == "function"
        and system:OpenPage(Data.settingsLayout.pageId, container) or nil
end

function Definition:RefreshSettingsPage(reason)
    local system = ns.UISystem or (ns.UI and ns.UI.GetSystem and ns.UI:GetSystem())
    return system and system.pages and type(system.pages.Refresh) == "function"
        and system.pages:Refresh(Data.settingsLayout.pageId, reason) or false
end

function Definition:SyncLockOption()
    return self:RefreshSettingsPage("lock")
end

function Definition:GetDiagnostics()
    return {
        available = self.available,
        family = Adapter.family,
        buildId = Adapter.buildId,
        runtimeActive = self.runtimeActive,
        conflict = self._similarAddonConflict,
        petBattle = self:IsInPetBattle(),
        unlocked = self.isUnlocked,
        secureDirty = self.secureDirty,
        secureClickDirty = self.secureClickDirty,
        combatDeferred = self.combatDeferred,
        view = self.view and self.view:GetDiagnostics() or nil,
    }
end

local module, reason = ns.RegisterModule("RaidMarker", Definition)
if module then
    ns.RaidMarker = module
    ns.RaidMarkerDefinition = Definition
    if type(ns.ShowMainFrame) ~= "function" then
        function ns:ShowMainFrame(pageId)
            return self.UI and type(self.UI.OpenMain) == "function" and self.UI:OpenMain(pageId) or false
        end
    end
else
    ns.RaidMarkerRegistrationError = reason
end

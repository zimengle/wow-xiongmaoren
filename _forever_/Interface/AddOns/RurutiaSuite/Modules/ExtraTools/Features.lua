-- Independent Runtime/Assembly owners; ExtraTools only retains legacy storage.
local _, ns = ...
if not ns.EnhancementMethods then return end
local Methods, Adapter, View = ns.EnhancementMethods, ns.ExtraToolsAdapter, ns.ExtraToolsView
local Providers = ns.ExtraToolsProviderRegistry
local function Combat() return Adapter:IsInCombat() end
local common = {
    "GetProfile", "GetBlizzardUIDB", "GetLFGToolsDB", "GetCelestialBarDB",
    "GetUpdateBlockerDB", "GetFastLootDB", "Notify",
}
local function CopyMethods(definition, names)
    for _, name in ipairs(names) do definition[name] = assert(Methods[name], name) end
end
local function Register(name, names, definition, legacySection)
    definition.defaultEnabled = true
    CopyMethods(definition, common)
    CopyMethods(definition, names)
    function definition:MigrateSwitch()
        local profile = self:GetProfile()
        profile.featureOwnersV1 = profile.featureOwnersV1 or {}
        if profile.featureOwnersV1[name] then return end
        local legacy = profile.enabled ~= false
        if ns.Assembly.IsModuleEnabled then legacy = legacy and ns.Assembly:IsModuleEnabled("ExtraTools") end
        local section = legacySection and profile[legacySection]
        if section and section.enabled == false then legacy = false end
        if ns.Assembly.SyncModuleConfigured then ns.Assembly:SyncModuleConfigured(name, legacy) end
        if section then section.enabled = true end
        profile.featureOwnersV1[name] = true
    end
    function definition:Initialize()
        self.db, self.adapter = ns.ExtraTools.db, Adapter
        self.runtimeActive, self.isUnlocked = false, false
        self._visibility, self._hiddenBigWigsRegions = {}, {}
        self._celestialRetryAttempt, self._minimapVolumeRetryAttempt = 0, 0
        self:MigrateSwitch()
    end
    function definition:SetEnabled(value)
        if Combat() then return false, "combat" end
        return ns.Assembly:SetModuleEnabled(name, value == true)
    end
    function definition:SetBoolean(section, key, value)
        if Combat() then return false, "combat" end
        local profile = self:GetProfile()
        if not profile then return false end
        local target = profile
        if section then
            if type(profile[section]) ~= "table" then profile[section] = {} end
            target = profile[section]
        end
        if Adapter.family == "classic" and Adapter.buildId ~= "classic-infinite" and section == "blizzardUI" and key == "hideMicroMenu" then
            self:GetBlizzardUIDB()
            target.microMenuManualChoice = true
        end
        target[key] = value == true
        return self:Reconfigure()
    end
    function definition:Reconfigure()
        if Combat() then return false, "combat" end
        if not self:IsEnabled() then return true end
        local ok, reason = ns.Runtime:DisableModule(self)
        if not ok then return false, reason end
        return ns.Runtime:EnableModule(self)
    end
    function definition:ProfileChanged()
        self.db = ns.ExtraTools.db
        self:MigrateSwitch()
        if self.OnFastLootProfileChanged then self:OnFastLootProfileChanged() end
    end
    definition.GetDiagnostics = function(self) return ns.Runtime:GetDiagnostics(name) end
    local module = ns.RegisterModule(name, definition)
    ns[name] = module
    return module
end

Register("BlizzardEnhancements", {
    "IsExternalMicroMenuConfiguredHidden", "IsRSMicroMenuEnabled", "IsExternalMicroMenuAutoHidden",
    "ShouldHideBlizzardMicroMenu", "ShouldForceShowBlizzardMicroMenu",
    "ShouldHideBlizzardBackpackButton", "ShouldForceShowBlizzardBackpackButton",
    "GetBackpackTemporaryShown", "SetBackpackTemporaryShown", "IsBlizzardBackpackBarShown",
    "OpenBackpackOptionSettings", "_SetTrackedFrameShown", "_TryVisibilityRestore",
    "RetryVisibilityRestores", "_ReleaseVisibilityState", "_CreateVisibilityState",
    "_ApplyFrameVisibility", "ApplyBlizzardMicroMenuVisibility", "ApplyBlizzardEndCapsVisibility",
    "GetPTRFeedbackDB", "ShouldHidePTRFeedback", "HidePTRFeedbackButtons", "SetupPTRFeedbackButtonHook",
    "ApplyPTRFeedbackVisibility", "RefreshPTRFeedbackVisibility", "ApplyBlizzardBackpackButtonVisibility",
    "_RestoreVisibility", "ApplyAddonCompartmentVisibility", "ApplyMinimapEventButtonVisibility", "GetLayoutString",
    "OnImportDialogShown", "ApplyEditModeState",
    "ApplyLootSparkles", "RestoreLootSparkles", "OnLootSparkleCVar",
}, {
    Apply = function(self)
        if not self.runtimeActive then return false end
        self:ApplyBlizzardMicroMenuVisibility()
        self:ApplyBlizzardBackpackButtonVisibility()
        self:ApplyPTRFeedbackVisibility()
        self:ApplyAddonCompartmentVisibility()
        self:ApplyMinimapEventButtonVisibility()
        self:ApplyEditModeState()
        self:ApplyLootSparkles()
        if ns.ExtraToolsBagWindowOption then ns.ExtraToolsBagWindowOption:Ensure(self) end
        if ns.ExtraToolsWindowDrag then ns.ExtraToolsWindowDrag:Sync(self) end
        if ns.ExtraToolsMerchantExpansion then ns.ExtraToolsMerchantExpansion:Sync(self) end
        if ns.ExtraToolsKnownRecipe then ns.ExtraToolsKnownRecipe:Sync(self) end
    end,
    Enable = function(self)
        self.runtimeActive = true
        self:RegisterEvent("ADDON_LOADED", self.Apply)
        self:RegisterEvent("PLAYER_ENTERING_WORLD", self.Apply)
        self:RegisterEvent("PLAYER_REGEN_ENABLED", self.Apply)
        if Adapter.features.lootSparkles and self:GetBlizzardUIDB().lootSparkles then
            self:RegisterEvent("CVAR_UPDATE", self.OnLootSparkleCVar)
        end
        self:Apply()
        if ns.ExtraToolsBagWindowOption then ns.ExtraToolsBagWindowOption:Attach(self) end
    end,
    Disable = function(self)
        self._bagSortPending = nil
        self.runtimeActive = false
        if ns.ExtraToolsKnownRecipe then ns.ExtraToolsKnownRecipe:Shutdown() end
        if ns.ExtraToolsWindowDrag then ns.ExtraToolsWindowDrag:Shutdown() end
        if ns.ExtraToolsMerchantExpansion then ns.ExtraToolsMerchantExpansion:Shutdown() end
        self:RestoreLootSparkles()
        if ns.ExtraToolsBagWindowOption then ns.ExtraToolsBagWindowOption:Detach() end
        self:_RestoreVisibility()
        View:HideRetailUI(self)
        self._importHook, self._ptrButtonHook, self._ptrEventHook = nil, nil, nil
    end,
})

Register("PluginEnhancements", {
    "GetMeetingStoneShown", "ApplyMeetingStoneChoice", "SetMeetingStoneShown",
    "IsTinyInspectRiskyGroupState", "UpdateTinyInspectYellowSpamFix",
    "ApplyDetailsNumberFix", "RestoreDetailsNumberFix", "SetupDetailsNumberFixHook",
    "HideBWHideDungeonNames", "RestoreBWHideDungeonNames", "CancelMinimapVolumeRetry",
    "ApplyMinimapVolumeState", "IsExternalUpdateText", "ShouldBlockExternalUpdatePopup", "ApplyExternalUpdateBlockers",
}, {
    Apply = function(self)
        if not self.runtimeActive then return false end
        local p = self:GetProfile()
        if Adapter.family == "retail" then
            if p.tinyInspectYellowSpamFix then self:UpdateTinyInspectYellowSpamFix() end
            if p.detailsNumberFix then self:SetupDetailsNumberFixHook() else self:RestoreDetailsNumberFix() end
            if p.bwHideDungeonNames then self:HideBWHideDungeonNames() else self:RestoreBWHideDungeonNames() end
            if self._meetingStonePending then self:ApplyMeetingStoneChoice() end
        else self:ApplyExternalUpdateBlockers() end
        if Adapter.features.minimapVolume then self:ApplyMinimapVolumeState() end
        if ns.EllesmereTimerIntegration then ns.EllesmereTimerIntegration:Apply(self) end
    end,
    PLAYER_LOGOUT = function(self)
        if ns.EllesmereTimerIntegration then ns.EllesmereTimerIntegration:Detach(self, false) end
    end,
    PLAYER_REGEN_ENABLED = function(self) return self:ApplyMeetingStoneChoice() end,
    PLAYER_LOGIN = function(self)
        self:UnregisterEvent("PLAYER_LOGIN")
        self._loginApplied = true
        self:Schedule(2, function() Adapter:AllowOutOfDateAddons() end, "Plugin enhancements login preference")
    end,
    Enable = function(self)
        self.runtimeActive = true
        local p = self:GetProfile()
        if Adapter.family == "retail" and not self._loginApplied then self:RegisterEvent("PLAYER_LOGIN", self.PLAYER_LOGIN) end
        if ns.EllesmereTimerIntegration and p.ellesmereTimerCompact ~= false then self:RegisterEvent("PLAYER_LOGOUT", self.PLAYER_LOGOUT) end
        local wanted = Adapter.family == "retail" and
            (p.tinyInspectYellowSpamFix or p.detailsNumberFix or p.bwHideDungeonNames or p.ellesmereMinimapVolume or p.ellesmereTimerCompact)
            or Adapter.family ~= "retail" and self:GetUpdateBlockerDB().enabled
            or Adapter.features.minimapVolume and p.ellesmereMinimapVolume
        if wanted then
            self:RegisterEvent("ADDON_LOADED", self.Apply)
            self:RegisterEvent("PLAYER_ENTERING_WORLD", self.Apply)
        end
        if Adapter.features.tinyInspect and p.tinyInspectYellowSpamFix then
            self:RegisterEvent("GROUP_ROSTER_UPDATE", self.UpdateTinyInspectYellowSpamFix)
        end
        self:Apply()
    end,
    Disable = function(self)
        self.runtimeActive, self._meetingStonePending = false, nil
        self:CancelMinimapVolumeRetry()
        if ns.EllesmereTimerIntegration then ns.EllesmereTimerIntegration:Detach(self) end
        if Adapter.features.minimapVolume then Adapter:DeactivateMinimapVolume(self) end
        self:RestoreDetailsNumberFix()
        self:RestoreBWHideDungeonNames()
        Providers:RestoreUpdateBlockers(self)
        self._detailsHook, self._bigWigsHook = nil, nil
    end,
})

Register("LootTools", {
    "IsFastLootAvailable", "GetFastLootStatus", "OnFastLootProfileChanged", "ResetFastLootDefaults",
    "MERCHANT_SHOW", "LOOT_READY", "LOOT_OPENED", "LOOT_CLOSED",
}, {
    Apply = function(self)
        if not self.runtimeActive then return false end
        local service = ns.ExtraToolsFastLoot
        if service then service:Sync() end
        local active = service and service:ShouldHandleLoot()
        for _, event in ipairs({"LOOT_READY", "LOOT_OPENED", "LOOT_CLOSED"}) do
            if active then self:RegisterEvent(event, self[event]) else self:UnregisterEvent(event) end
        end
    end,
    SyncFastLoot = function(self) return self:Reconfigure() end,
    Enable = function(self)
        self.runtimeActive = true
        local p = self:GetProfile()
        if p.autoSellJunk and Adapter:CanSellJunk() then self:RegisterEvent("MERCHANT_SHOW", self.MERCHANT_SHOW) end
        local service = ns.ExtraToolsFastLoot
        if service then service:Bind(self) end
        if Adapter.features.fastLoot and p.fastLoot then self:RegisterEvent("ADDON_LOADED", self.Apply) end
        self:Apply()
    end,
    Disable = function(self)
        self.runtimeActive = false
        if ns.ExtraToolsFastLoot then ns.ExtraToolsFastLoot:Detach() end
    end,
})

Register("LFGTools", {
    "IsLFGToolsEnabled", "GetActiveLFGToolsPosition", "SetActiveLFGToolsPosition", "RunLFGAction",
    "UpdateLFGTools", "QueueUpdateLFGTools", "ResetLFGToolsDefaults", "ResetLFGToolsPosition", "SetLFGToolsPreview",
}, {
    Apply = function(self) return self:UpdateLFGTools() end,
    Enable = function(self)
        if not Adapter.features.lfgTools then return end
        self.runtimeActive = true
        for _, event in ipairs({"PLAYER_ENTERING_WORLD", "GROUP_ROSTER_UPDATE", "PLAYER_REGEN_ENABLED", "CVAR_UPDATE", "ADDON_LOADED"}) do
            self:RegisterEvent(event, self.QueueUpdateLFGTools)
        end
        self:UpdateLFGTools()
    end,
    Disable = function(self)
        self.runtimeActive, self.isUnlocked, self.lfgToolsPreviewMode = false, false, false
        View:ReleaseLFGOwnership(self)
    end,
    SetUnlocked = function(self, value)
        if Combat() or not self.runtimeActive then return false end
        self.isUnlocked = value == true
        -- UpdateLFGTools reports visibility, not whether the move state changed.
        self:UpdateLFGTools()
        return true
    end,
}, "lfgTools")

local function OnCelestialFontChanged(owner, _, role)
    if role == "celestialBar" and owner.runtimeActive then View:ApplyCelestialFont(owner) end
end

Register("CelestialBar", {
    "IsCelestialBarSupported", "IsCelestialBarEnabled", "ShouldOwnNativeAltPowerBar", "RefreshCelestialBar",
    "QueueApplyCelestialBarPosition", "CancelCelestialRetries", "ScheduleCelestialRetry",
    "ResetCelestialBarDefaults", "ResetCelestialBarPosition", "SetCelestialBarPreview",
}, {
    Apply = function(self) return self:RefreshCelestialBar() end,
    OnPower = function(self, event, unit, powerType)
        if unit ~= "player" then return end
        if (event == "UNIT_POWER_UPDATE" or event == "UNIT_MAXPOWER") and powerType ~= "ALTERNATE" then return end
        self:QueueApplyCelestialBarPosition()
    end,
    Enable = function(self)
        if not Adapter.features.celestialBar or not Adapter:IsCelestialSupported() then return end
        self.runtimeActive = true
        if ns.Font and type(ns.Font.Subscribe) == "function" then
            self.fontSubscription = ns.Font
            ns.Font:Subscribe(self, OnCelestialFontChanged)
        end
        for _, event in ipairs({"PLAYER_ENTERING_WORLD", "PLAYER_REGEN_ENABLED", "UNIT_POWER_BAR_SHOW", "UNIT_POWER_BAR_HIDE", "UNIT_POWER_UPDATE", "UNIT_MAXPOWER", "UPDATE_EXTRA_ACTIONBAR"}) do
            self:RegisterEvent(event, event:match("^UNIT_") and self.OnPower or self.QueueApplyCelestialBarPosition)
        end
        self:RefreshCelestialBar()
    end,
    Disable = function(self)
        self.runtimeActive, self.isUnlocked, self.celestialPreviewMode = false, false, false
        if self.fontSubscription then self.fontSubscription:Unsubscribe(self) end
        self.fontSubscription = nil
        self:CancelCelestialRetries()
        self._celestialApplyHandle = nil
        View:HideCelestial(self)
        View:RestoreNativeAltPower(self)
    end,
    SetUnlocked = function(self, value)
        if Combat() or not self.runtimeActive then return false end
        self.isUnlocked = value == true
        self:RefreshCelestialBar()
        if self.isUnlocked then View:EnsureCelestialMover(self, self:GetCelestialBarDB()):Show()
        elseif self.celestialMover then self.celestialMover:Hide() end
        return true
    end,
}, "celestialBar")

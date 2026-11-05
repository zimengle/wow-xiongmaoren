local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Data = ns.ExtraToolsData
local Adapter = ns.ExtraToolsAdapter
local View = ns.ExtraToolsView
local Providers = ns.ExtraToolsProviderRegistry
if type(Data) ~= "table" then error("ExtraTools Data.lua must load before Core.lua", 2) end
if type(Adapter) ~= "table" then return end
if type(View) ~= "table" then return end
if type(Providers) ~= "table" then return end

-- 快速拾取服务在 Core 之后加载，只能惰性取用，不能依赖偶然的加载顺序。
local function GetFastLoot()
    local service = ns.ExtraToolsFastLoot
    return type(service) == "table" and service or nil
end

-- Register effective per-build defaults so exact matches are stripped on save.
local defaults = Data.CreateDefaults(Adapter.family)
if Adapter.family == "classic" then
    local p, features = defaults.profile, Adapter.features
    if features.minimapVolume then p.ellesmereMinimapVolume = true end
    if features.backpack then p.blizzardUI.hideBackpackButton = Adapter.buildId == "classic-infinite" end
    if features.endCaps then p.blizzardUI.hideGryphons = true end
    if features.hidePTRFeedback then p.blizzardUI.hidePTRFeedback = true end
    if features.minimapEventButton then p.blizzardUI.hideMinimapEventButton = true end
    if features.lootSparkles then p.blizzardUI.lootSparkles = true end
    p.celestialBar.enabled = features.celestialBar == true
end
local Definition = {
    databaseName = "ExtraTools",
    defaultEnabled = true,
    defaults = defaults,
}

local function IsTrue(value)
    return value and true or false
end

local function OnLFGRefresh(module)
    module:UpdateLFGTools()
end

local function OnCelestialRefresh(module)
    module._celestialApplyHandle = nil
    local updated, retry = module:RefreshCelestialBar()
    if updated then module:CancelCelestialRetries()
    elseif retry then module:ScheduleCelestialRetry() end
end

local function OnCelestialRetry(module)
    module._celestialRetryHandle = nil
    local updated, retry = module:RefreshCelestialBar()
    if updated then module:CancelCelestialRetries()
    elseif retry then module:ScheduleCelestialRetry() end
end

local function OnMinimapVolumeRetry(module)
    module._minimapVolumeRetryHandle = nil
    module:ApplyMinimapVolumeState()
end

local function NormalizeBoolean(container, key, fallback)
    if container[key] == nil then container[key] = fallback and true or false
    else container[key] = container[key] and true or false end
end

function Definition:GetProfile()
    return self.db and self.db.profile
end

-- Only retire RS-owned fields; EXBoss keeps its current setting untouched.
function Definition:ClearRetiredCountdownSettings()
    if not self.db or Adapter.family ~= "retail" then return end
    local storage = self.db.storage
    if type(storage) == "table" then
        local profiles = rawget(storage, "profiles")
        if type(profiles) == "table" then
            for _, profile in pairs(profiles) do
                if type(profile) == "table" then profile.exbossRaidCountdownAutoDisable = nil end
            end
        end
        local global = rawget(storage, "global")
        if type(global) == "table" then global.exbossRaidCountdownOverride = nil end
    end
    local profile = self:GetProfile()
    if profile then profile.exbossRaidCountdownAutoDisable = nil end
    if type(self.db.global) == "table" then self.db.global.exbossRaidCountdownOverride = nil end
end

function Definition:GetMeetingStoneShown()
    return Adapter.GetMeetingStoneShown and Adapter:GetMeetingStoneShown() or false
end

function Definition:ApplyMeetingStoneChoice()
    if not self._meetingStonePending then return true end
    if Adapter:IsInCombat() then
        self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
        return false
    end
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    local ok, reason = Adapter:ApplyMeetingStoneChoice()
    self._meetingStonePending = not ok and reason == "addon_not_loaded" or nil
    return ok, reason
end

function Definition:SetMeetingStoneShown(value)
    if not Adapter.SetMeetingStoneShown then return false end
    if not Adapter:SetMeetingStoneShown(value == true) then return false end
    if not self.runtimeActive then return true end
    self._meetingStonePending = true
    self:RegisterEvent("ADDON_LOADED", self.Apply)
    return self:ApplyMeetingStoneChoice()
end

function Definition:GetBlizzardUIDB()
    local profile = self:GetProfile()
    if not profile then return nil end
    profile.blizzardUI = profile.blizzardUI or {}
    if Adapter.buildId == "classic-infinite" and not profile.blizzardUI.infiniteDefaultsV2 then
        profile.blizzardUI.hideBackpackButton = true
        profile.blizzardUI.infiniteDefaultsV2 = true
    end
    if Adapter.family == "classic" and Adapter.buildId ~= "classic-infinite" then
        local db = profile.blizzardUI
        if not db.classicMicroMenuDefaultsV1 then
            -- Old default and manual true cannot be distinguished. The approved
            -- migration resets all Classic choices once; future choices persist.
            db.microMenuManualChoice = nil
            db.classicMicroMenuDefaultsV1 = true
        end
        if not db.microMenuManualChoice then
            db.hideMicroMenu = Providers:IsActionBarEnabled()
        else
            NormalizeBoolean(db, "hideMicroMenu", false)
        end
    else
        NormalizeBoolean(profile.blizzardUI, "hideMicroMenu", true)
    end
    if Adapter.features.backpack then NormalizeBoolean(profile.blizzardUI, "hideBackpackButton", false) end
    if Adapter.features.endCaps then NormalizeBoolean(profile.blizzardUI, "hideGryphons", true) end
    if Adapter.features.hidePTRFeedback then NormalizeBoolean(profile.blizzardUI, "hidePTRFeedback", true) end
    if Adapter.features.minimapEventButton then NormalizeBoolean(profile.blizzardUI, "hideMinimapEventButton", true) end
    if Adapter.features.lootSparkles then NormalizeBoolean(profile.blizzardUI, "lootSparkles", true) end
    if Adapter.features.windowDrag then NormalizeBoolean(profile.blizzardUI, "unlockWindowDrag", true) end
    if Adapter.features.merchantExpansion then NormalizeBoolean(profile.blizzardUI, "merchantExpansion", true) end
    if Adapter.features.knownRecipeTint then NormalizeBoolean(profile.blizzardUI, "knownRecipeTint", true) end
    return profile.blizzardUI
end

-- Only own the loot effect. Old outline values are restoration-only: discard
-- each saved key after restoring it or observing a later external choice.
local LOOT_SPARKLE_VALUES = {
    { "outlineModeShowLootEffectWhenDisabled", "1" },
}
local LEGACY_LOOT_OUTLINE_VALUES = {
    { "graphicsOutlineMode", "0" }, { "OutlineEngineMode", "0" },
    { "raidGraphicsOutlineMode", "0" }, { "RAIDOutlineEngineMode", "0" },
}

local function RestoreLootValues(db, values)
    if not db or not db.lootSparklesOriginal then return end
    for _, entry in ipairs(values) do
        local name, desired = entry[1], entry[2]
        local original = db.lootSparklesOriginal[name]
        if original ~= nil then
            local current = Adapter:GetLootSparkleCVar(name)
            if current ~= nil and (current ~= desired or current == original
                or Adapter:SetLootSparkleCVar(name, original)) then
                db.lootSparklesOriginal[name] = nil
            end
        end
    end
    if not next(db.lootSparklesOriginal) then db.lootSparklesOriginal = nil end
end

function Definition:RestoreLootSparkles()
    if Adapter:IsInCombat() then return end
    self._lootSparklesApplying = true
    RestoreLootValues(self._lootSparkleDB, LEGACY_LOOT_OUTLINE_VALUES)
    RestoreLootValues(self._lootSparkleDB, LOOT_SPARKLE_VALUES)
    self._lootSparklesApplying = nil
end

function Definition:ApplyLootSparkles()
    if not self.runtimeActive or not Adapter.features.lootSparkles then return end
    local db = self:GetBlizzardUIDB()
    self._lootSparkleDB = db
    if Adapter:IsInCombat() then return end
    if not db.lootSparkles then self:RestoreLootSparkles(); return end
    self._lootSparklesApplying = true
    -- Run even when the loot CVar is unavailable. Failed/missing outline writes
    -- retain their baseline for the next existing world/addon/out-of-combat event.
    RestoreLootValues(db, LEGACY_LOOT_OUTLINE_VALUES)
    for _, entry in ipairs(LOOT_SPARKLE_VALUES) do
        local name, desired = entry[1], entry[2]
        local current = Adapter:GetLootSparkleCVar(name)
        if current ~= nil then
            db.lootSparklesOriginal = db.lootSparklesOriginal or {}
            if db.lootSparklesOriginal[name] == nil then db.lootSparklesOriginal[name] = current end
            if current ~= desired then Adapter:SetLootSparkleCVar(name, desired) end
        end
    end
    self._lootSparklesApplying = nil
end

function Definition:OnLootSparkleCVar(_, name)
    if not self.runtimeActive or self._lootSparklesApplying or type(name) ~= "string" then return end
    name = name:lower()
    if name == "graphicsquality" or name == "raidgraphicsquality" then
        self:RequestRefresh("loot-sparkles", self.ApplyLootSparkles, 0)
        return
    end
    for _, entry in ipairs(LOOT_SPARKLE_VALUES) do
        if name == entry[1]:lower() then
            self:RequestRefresh("loot-sparkles", self.ApplyLootSparkles, 0)
            return
        end
    end
end

function Definition:GetCelestialBarDB()
    local profile = self:GetProfile()
    if not profile then return nil end
    profile.celestialBar = profile.celestialBar or {}
    local value = profile.celestialBar
    if not Adapter:IsCelestialSupported() then value.enabled = false return value end
    NormalizeBoolean(value, "enabled", true)
    NormalizeBoolean(value, "simpleMode", true)
    value.x = tonumber(value.x) or Data.CELESTIAL.defaultX
    value.y = tonumber(value.y) or Data.CELESTIAL.defaultY
    value.width = Data.ClampNumber(value.width, Data.CELESTIAL.minWidth,
        Data.CELESTIAL.maxWidth, Data.CELESTIAL.defaultWidth)
    value.height = Data.ClampNumber(value.height, Data.CELESTIAL.minHeight,
        Data.CELESTIAL.maxHeight, Data.CELESTIAL.defaultHeight)
    value.fontSize = Data.ClampNumber(value.fontSize, Data.CELESTIAL.minFontSize,
        Data.CELESTIAL.maxFontSize, Data.CELESTIAL.defaultFontSize)
    return value
end

function Definition:GetLFGToolsDB()
    local profile = self:GetProfile()
    if not profile then return nil end
    profile.lfgTools = profile.lfgTools or {}
    local value = profile.lfgTools
    NormalizeBoolean(value, "enabled", true)
    NormalizeBoolean(value, "showLeaveButton", true)
    NormalizeBoolean(value, "showTeleportButton", true)
    NormalizeBoolean(value, "useNDuiPosition", true)
    NormalizeBoolean(value, "useElvUIPosition", true)
    value.x = Data.SafeRound(value.x, Data.LFG.defaultX)
    value.y = Data.SafeRound(value.y, Data.LFG.defaultY)
    value.nduiX = Data.SafeRound(value.nduiX, Data.LFG.nduiX)
    value.nduiY = Data.SafeRound(value.nduiY, Data.LFG.nduiY)
    value.elvuiX = Data.SafeRound(value.elvuiX, Data.LFG.elvuiX)
    value.elvuiY = Data.SafeRound(value.elvuiY, Data.LFG.elvuiY)
    value.scale = tonumber(value.scale) or Data.LFG.defaultScale
    if value.scale < 0.5 then value.scale = 0.5 elseif value.scale > 2 then value.scale = 2 end
    value.alpha = tonumber(value.alpha)
    if value.alpha == nil then value.alpha = Data.LFG.defaultAlpha end
    if value.alpha < 0.2 then value.alpha = 0.2 elseif value.alpha > 1 then value.alpha = 1 end
    return value
end

function Definition:GetUpdateBlockerDB()
    local profile = self:GetProfile()
    if not profile then return nil end
    profile.elvuiUpdateBlocker = profile.elvuiUpdateBlocker or {}
    local value = profile.elvuiUpdateBlocker
    NormalizeBoolean(value, "enabled", true)
    NormalizeBoolean(value, "blockPopup", true)
    NormalizeBoolean(value, "blockChat", true)
    return value
end

function Definition:GetFastLootDB()
    local profile = self:GetProfile()
    if not profile or not Adapter.features.fastLoot then return nil end
    NormalizeBoolean(profile, "fastLoot", true)
    return profile
end

function Definition:IsFastLootAvailable()
    return Adapter.features.fastLoot == true
end

function Definition:GetFastLootStatus()
    local service = GetFastLoot()
    if not service then
        return { supported = false, enabled = false, active = false, reason = "unsupported" }
    end
    return service:GetStatus()
end

function Definition:SyncFastLoot()
    local service = GetFastLoot()
    if service and service.module == self then return service:Sync() end
    return false
end

function Definition:OnFastLootProfileChanged()
    local service = GetFastLoot()
    if service and service.module == self then return service:OnProfileChanged() end
    return false
end

function Definition:ResetFastLootDefaults()
    local service = GetFastLoot()
    if service and service.module == self then return service:Reset() end
    local profile = self:GetFastLootDB()
    if profile then profile.fastLoot = true end
    return true
end

function Definition:SanitizeProfile()
    local profile = self:GetProfile()
    if not profile then return false end
    self:ClearRetiredCountdownSettings()
    NormalizeBoolean(profile, "enabled", true)
    NormalizeBoolean(profile, "autoSellJunk", true)
    self:GetBlizzardUIDB()
    self:GetFastLootDB()
    if Adapter.features.minimapVolume then
        NormalizeBoolean(profile, "ellesmereMinimapVolume", true)
    end
    if Adapter.family == "retail" then
        NormalizeBoolean(profile, "ellesmereTimerCompact", true)
        NormalizeBoolean(profile, "enableLeftHint", true)
        NormalizeBoolean(profile, "enableImportCopyButton", true)
        NormalizeBoolean(profile, "detailsNumberFix", false)
        NormalizeBoolean(profile, "bwHideDungeonNames", true)
        NormalizeBoolean(profile, "hideAddonCompartment", true)
        NormalizeBoolean(profile, "tinyInspectYellowSpamFix", true)
        NormalizeBoolean(profile, "tinyInspectPartyItemLevelWanted", true)
        NormalizeBoolean(profile, "tinyInspectRaidItemLevelWanted", false)
    else
        self:GetCelestialBarDB()
        self:GetLFGToolsDB()
        self:GetUpdateBlockerDB()
    end
    return true
end

function Definition:Initialize()
    self.adapter = Adapter
    self.runtimeActive = false
    self.isUnlocked = false
    self.celestialPreviewMode = false
    self.lfgToolsPreviewMode = false
    self._backpackTemporaryShown = nil
    self._visibility = {}
    self._hiddenBigWigsRegions = {}
    self._celestialRetryAttempt = 0
    self._minimapVolumeRetryAttempt = 0
    self:SanitizeProfile()
    if ns.ExtraToolsSettings and type(ns.ExtraToolsSettings.Register) == "function" then
        ns.ExtraToolsSettings:Register(self, Adapter.features)
    end
end

function Definition:ProfileChanged()
    self._meetingStonePending = nil
    self:SanitizeProfile()
    self:OnFastLootProfileChanged()
end

function Definition:IsExternalMicroMenuConfiguredHidden()
    return Providers:IsMicroMenuConfiguredHidden()
end

function Definition:IsRSMicroMenuEnabled()
    return Adapter:IsTopBarMicroMenuActive()
end

function Definition:IsExternalMicroMenuAutoHidden()
    return self:IsExternalMicroMenuConfiguredHidden() and self:IsRSMicroMenuEnabled()
end

function Definition:ShouldHideBlizzardMicroMenu()
    local db = self:GetBlizzardUIDB()
    return db and db.hideMicroMenu == true
end

function Definition:ShouldForceShowBlizzardMicroMenu()
    local db = self:GetBlizzardUIDB()
    if Adapter.family == "classic" and Adapter.buildId ~= "classic-infinite" then
        return db and db.hideMicroMenu ~= true
    end
    return not (db and db.hideMicroMenu == true)
        and self:IsExternalMicroMenuConfiguredHidden()
end

function Definition:ShouldHideBlizzardBackpackButton()
    if Adapter.features.backpack and self._backpackTemporaryShown ~= nil then
        return self._backpackTemporaryShown == false
    end
    local db = self:GetBlizzardUIDB()
    return Adapter.features.backpack
        and ((db and db.hideBackpackButton == true) or self:IsExternalMicroMenuAutoHidden())
end

function Definition:ShouldForceShowBlizzardBackpackButton()
    if Adapter.features.backpack and self._backpackTemporaryShown ~= nil then
        return self._backpackTemporaryShown == true
    end
    local db = self:GetBlizzardUIDB()
    return Adapter.features.backpack and not (db and db.hideBackpackButton == true)
        and self:IsExternalMicroMenuConfiguredHidden()
end

function Definition:GetBackpackTemporaryShown()
    return self._backpackTemporaryShown
end

-- Session-only override used by the combined bag window option. It never touches
-- the profile DB; the persistent switch stays in the RS settings page.
function Definition:SetBackpackTemporaryShown(shown)
    if not Adapter.features.backpack then return false end
    if shown == nil then
        self._backpackTemporaryShown = nil
    else
        self._backpackTemporaryShown = shown and true or false
    end
    if self.runtimeActive then self:ApplyBlizzardBackpackButtonVisibility() end
    if ns.ExtraToolsBagWindowOption then ns.ExtraToolsBagWindowOption:Refresh() end
    return true
end

function Definition:IsBlizzardBackpackBarShown()
    local frame = Adapter.features.backpack and Adapter:GetBackpackFrame() or nil
    if frame and type(frame.IsShown) == "function" then return frame:IsShown() and true or false end
    return not self:ShouldHideBlizzardBackpackButton()
end

function Definition:OpenBackpackOptionSettings()
    local ui = ns.UI
    if not (ui and type(ui.OpenMain) == "function") then return false end
    local pageId = Adapter.family == "classic" and "blizzard-ui" or "extratools"
    local window, reason = ui:OpenMain(pageId)
    if not window and pageId ~= "extratools" then
        window, reason = ui:OpenMain("extratools")
    end
    if not window then return false, reason end
    return true
end

function Definition:Notify(message)
    if type(Adapter.Print) == "function" then return Adapter:Print(message) end
    if type(ns.Print) == "function" then return ns.Print(message) end
    return false
end

function Definition:_SetTrackedFrameShown(state, shown)
    if not (state and state.frame) then return false end
    state.applying = true
    local result
    if shown then result = Adapter:Show(state.frame) else result = Adapter:Hide(state.frame) end
    state.applying = false
    local applied = result and Adapter:IsShown(state.frame) == shown
    if applied then state.appliedShown = shown and true or false end
    return applied and true or false
end

function Definition:_TryVisibilityRestore(state)
    local desired = state.desiredShown
    if desired == nil then desired = state.originalShown end
    return Adapter:IsShown(state.frame) == desired or self:_SetTrackedFrameShown(state, desired)
end

function Definition:RetryVisibilityRestores()
    local pending = self._visibilityRestorePending
    for frame, state in pairs(pending or {}) do
        if self:_TryVisibilityRestore(state) then pending[frame] = nil end
    end
    if pending and not next(pending) then self._visibilityRestorePending = nil end
    -- Retain only data on failure. Existing active events or an explicit
    -- refresh/enable may retry; disabled modules own no recovery resources.
    return self._visibilityRestorePending == nil
end

function Definition:_ReleaseVisibilityState(state)
    if not state then return false end
    state.mode = nil
    if state.showHook then self:RemoveHook(state.showHook) end
    if state.hideHook then self:RemoveHook(state.hideHook) end
    if state.setShownHook then self:RemoveHook(state.setShownHook) end
    state.showHook, state.hideHook, state.setShownHook = nil, nil, nil
    local restored = self:_TryVisibilityRestore(state)
    if not restored then
        self._visibilityRestorePending = self._visibilityRestorePending or {}
        self._visibilityRestorePending[state.frame] = state
    end
    return restored
end

function Definition:_CreateVisibilityState(key, frame)
    local original = Adapter:IsShown(frame)
    local state = {
        frame = frame,
        originalShown = original,
        desiredShown = original,
        appliedShown = original,
        applying = false,
        mode = nil,
    }
    self._visibility[key] = state

    local function RecordExternal(desired)
        if state.applying then return end
        state.desiredShown = desired and true or false
        if state.mode == "hide" and desired and Adapter:IsShown(state.frame) then
            self:_SetTrackedFrameShown(state, false)
        elseif state.mode == "force-show" and not desired
            and Adapter.family == "classic" and Adapter.buildId ~= "classic-infinite"
            and (key == "micro-menu" or key == "micro-menu-content")
            and not Adapter:IsInCombat()
            and not Adapter:IsShown(state.frame) then
            -- Classic's explicit show policy must survive later startup hides.
            -- Keep the external intent for release, as for hide ownership.
            self:_SetTrackedFrameShown(state, true)
        end
    end

    state.showHook = self:HookSecureFunction(frame, "Show", function(_, owner)
        if owner == state.frame then RecordExternal(true) end
    end, "ExtraTools " .. key .. " Show")
    if type(frame.Hide) == "function" then
        state.hideHook = self:HookSecureFunction(frame, "Hide", function(_, owner)
            if owner == state.frame then RecordExternal(false) end
        end, "ExtraTools " .. key .. " Hide")
    end
    if type(frame.SetShown) == "function" then
        state.setShownHook = self:HookSecureFunction(frame, "SetShown", function(_, owner, shown)
            if owner == state.frame then RecordExternal(shown) end
        end, "ExtraTools " .. key .. " SetShown")
    end
    return state
end

function Definition:_ApplyFrameVisibility(key, frame, shouldHide, shouldForceShow)
    local restored = true
    if self._visibilityRestorePending then
        restored = self:RetryVisibilityRestores()
    end
    if not frame then return false end
    if not self.runtimeActive then return restored end
    if self._visibilityRestorePending then
        -- Do not acquire a new baseline while this frame is still unrestored.
        if self._visibilityRestorePending[frame] then
            return false
        end
    end
    local state = self._visibility[key]
    if state and state.frame ~= frame then
        self:_ReleaseVisibilityState(state)
        self._visibility[key] = nil
        state = nil
    end

    if not shouldHide and not shouldForceShow then
        if state then
            local restored = self:_ReleaseVisibilityState(state)
            self._visibility[key] = nil
            return restored
        end
        return true
    end

    state = state or self:_CreateVisibilityState(key, frame)
    state.mode = shouldHide and "hide" or "force-show"
    local desired = not shouldHide
    if Adapter:IsShown(frame) ~= desired then return self:_SetTrackedFrameShown(state, desired) end
    return true
end

function Definition:ApplyBlizzardMicroMenuVisibility()
    self:ApplyBlizzardEndCapsVisibility()
    local frame = Adapter:GetMicroMenuFrame()
    local shouldHide, shouldShow = self:ShouldHideBlizzardMicroMenu(), self:ShouldForceShowBlizzardMicroMenu()
    -- Native-button owners need the original container intact during startup.
    -- Release existing visibility hooks as well as skipping new ownership.
    if Providers:IsMicroMenuOwned() then shouldHide, shouldShow = false, false end
    local result = self:_ApplyFrameVisibility("micro-menu", frame, shouldHide, shouldShow)
    if Adapter.family == "classic" and Adapter.buildId ~= "classic-infinite" then
        local content = Adapter:GetMicroMenuContentFrame()
        if content and content ~= frame then
            local contentResult = self:_ApplyFrameVisibility("micro-menu-content", content, shouldHide, shouldShow)
            result = result and contentResult
        end
    end
    -- Classic menu lifecycle also refreshes Forever's separate bag control.
    -- Its visibility still comes from the independent backpack option.
    if Adapter.family == "classic" and Adapter.features.backpack then
        local backpackResult = self:ApplyBlizzardBackpackButtonVisibility()
        return result and backpackResult
    end
    return result
end

function Definition:ApplyBlizzardEndCapsVisibility()
    if not Adapter.features.endCaps then return false end
    local left, right = Adapter:GetEndCapFrames()
    local hidden = self:GetBlizzardUIDB().hideGryphons == true
    local leftResult = self:_ApplyFrameVisibility("end-cap-left", left, hidden, false)
    local rightResult = self:_ApplyFrameVisibility("end-cap-right", right, hidden, false)
    return leftResult and rightResult
end

function Definition:GetPTRFeedbackDB()
    local profile = self:GetProfile()
    if not profile or not Adapter.features.hidePTRFeedback then return nil end
    return profile.blizzardUI
end

function Definition:ShouldHidePTRFeedback()
    if not Adapter.features.hidePTRFeedback then return false end
    local ui = self:GetPTRFeedbackDB()
    return ui ~= nil and ui.hidePTRFeedback == true
end

function Definition:HidePTRFeedbackButtons()
    if not Adapter.features.hidePTRFeedback then return true end
    local buttons = Adapter:GetPTRFeedbackButtons() or {}
    local index
    for index = 1, #buttons do Adapter:Hide(buttons[index]) end
    return true
end

-- 虫子按钮是按面板懒注册的：注册表和事件分发各占一个钩子，
-- 只要 PTR 反馈体系再冒出按钮就立刻重新隐藏，不做每帧轮询。
function Definition:SetupPTRFeedbackButtonHook()
    if not Adapter.features.hidePTRFeedback then return false end
    if self._ptrButtonHook then return true end
    local reporter = Adapter:GetPTRFeedbackFrame()
    if not reporter then return false end
    local function RegenerateButtons()
        if not self:ShouldHidePTRFeedback() then return end
        self:HidePTRFeedbackButtons()
    end
    self._ptrButtonHook = self:HookSecureFunction(
        reporter, "RegisterUIPanelTabEvent", RegenerateButtons, "ExtraTools PTR feedback buttons")
    self._ptrEventHook = self:HookSecureFunction(
        reporter, "TriggerEvent", RegenerateButtons, "ExtraTools PTR feedback events")
    return self._ptrButtonHook ~= nil
end

function Definition:ApplyPTRFeedbackVisibility()
    if not Adapter.features.hidePTRFeedback then return false end
    local hide = self:ShouldHidePTRFeedback()
    local reporter = self:_ApplyFrameVisibility("ptr-feedback", Adapter:GetPTRFeedbackFrame(), hide, false)
    local alert = self:_ApplyFrameVisibility(
        "ptr-feedback-alert", Adapter:GetPTRFeedbackAlertFrame(), hide, false)
    if hide then
        self:SetupPTRFeedbackButtonHook()
        self:HidePTRFeedbackButtons()
    end
    return reporter and alert
end

-- 帧可能比模块晚到（beta 客户端的内置插件加载时机不受 RS 控制），
-- 提供一个显式刷新入口，供 ADDON_LOADED 与测试使用。
function Definition:RefreshPTRFeedbackVisibility()
    if not self.runtimeActive then return false end
    return self:ApplyPTRFeedbackVisibility()
end

function Definition:ApplyBlizzardBackpackButtonVisibility()
    if not Adapter.features.backpack then return false end
    local applied = self:_ApplyFrameVisibility("backpack", Adapter:GetBackpackFrame(),
        self:ShouldHideBlizzardBackpackButton(), self:ShouldForceShowBlizzardBackpackButton())
    if ns.ExtraToolsBagWindowOption then ns.ExtraToolsBagWindowOption:Refresh() end
    return applied
end

function Definition:_RestoreVisibility()
    local _, state
    for _, state in pairs(self._visibility) do
        self:_ReleaseVisibilityState(state)
    end
    self._visibility = {}
end

function Definition:IsTinyInspectRiskyGroupState(state)
    if not state then return false end
    if state.inRaid then return true end
    if state.inInstanceGroup and not state.normalHomeParty then return true end
    local kind = state.instanceType
    if state.inInstance and (kind == "pvp" or kind == "arena" or kind == "raid" or kind == "scenario") then
        return true
    end
    return state.inInstance and kind == "party" and not state.hasPartyPlayer
end

function Definition:UpdateTinyInspectYellowSpamFix()
    if not Adapter.features.tinyInspect then return false end
    local profile = self:GetProfile()
    local state = Adapter:GetTinyInspectState()
    if not profile or not state then return false end
    if profile.tinyInspectYellowSpamFix and self:IsTinyInspectRiskyGroupState(state) then
        return Adapter:SetTinyInspectItemLevels(false, false)
    end
    return Adapter:SetTinyInspectItemLevels(profile.tinyInspectPartyItemLevelWanted,
        profile.tinyInspectRaidItemLevelWanted)
end

function Definition:ApplyMinimapEventButtonVisibility()
    if not Adapter.features.minimapEventButton then return false end
    local frame = Adapter:GetMinimapEventButton()
    -- Protected frames are left untouched; no deferred combat hook can taint them.
    if frame and type(frame.IsProtected) == "function" and frame:IsProtected() then return false end
    return self:_ApplyFrameVisibility("minimap-event-button", frame,
        self:GetBlizzardUIDB().hideMinimapEventButton == true, false)
end

function Definition:ApplyAddonCompartmentVisibility()
    if not Adapter.features.addonCompartment then return false end
    local frame = Adapter:GetAddonCompartmentFrame()
    if not frame then return false end
    local profile = self:GetProfile()
    return self:_ApplyFrameVisibility("addon-compartment", frame,
        profile and profile.hideAddonCompartment, false)
end

function Definition:ApplyDetailsNumberFix()
    if not Adapter.features.detailsNumberFix then return false end
    local details = Adapter:GetDetails()
    if not details then return false end
    if not self._detailsOriginal then self._detailsOriginal = Adapter:CaptureDetailsNumberState(details) end
    return Adapter:ApplyDetailsNumberFix(details)
end

function Definition:RestoreDetailsNumberFix()
    if not self._detailsOriginal then return false end
    local details = Adapter:GetDetails()
    local restored = Adapter:RestoreDetailsNumberState(details, self._detailsOriginal)
    self._detailsOriginal = nil
    return restored
end

function Definition:SetupDetailsNumberFixHook()
    local details = Adapter:GetDetails()
    if not details or type(details.SelectNumericalSystem) ~= "function" then return false end
    if not self._detailsHook then
        self._detailsHook = self:HookSecureFunction(details, "SelectNumericalSystem", function(_, _, system)
            local profile = self:GetProfile()
            if not (profile and profile.detailsNumberFix) then return end
            if system == 2 then self:ApplyDetailsNumberFix() else self:RestoreDetailsNumberFix() end
        end, "ExtraTools Details number system")
    end
    return self:ApplyDetailsNumberFix()
end

function Definition:HideBWHideDungeonNames()
    if not Adapter.features.bigWigsDungeonNames then return false end
    local regions, frame = Adapter:GetBigWigsDungeonNameRegions(self._bigWigsScratch)
    self._bigWigsScratch = regions
    local index
    for index = 1, #regions do
        local region = regions[index]
        if Adapter:IsShown(region) then Adapter:Hide(region) self._hiddenBigWigsRegions[region] = true end
    end
    if frame and not self._bigWigsHook then
        self._bigWigsHook = self:HookFrameScript(frame, "OnShow", function()
            local profile = self:GetProfile()
            if profile and profile.bwHideDungeonNames then self:HideBWHideDungeonNames() end
        end, "ExtraTools ChallengesFrame OnShow")
    end
    return true
end

function Definition:RestoreBWHideDungeonNames()
    local region
    for region in pairs(self._hiddenBigWigsRegions) do Adapter:Show(region) end
    self._hiddenBigWigsRegions = {}
    return true
end

function Definition:GetLayoutString()
    return Adapter.features.editMode and Data.RETAIL_LAYOUT or nil
end

function Definition:OnImportDialogShown()
    local profile = self:GetProfile()
    if not (profile and profile.enableImportCopyButton) then return false end
    local dialog = Adapter:GetImportDialog()
    return View:EnsureImportCopyButton(self, dialog, function()
        if Adapter:IsInCombat() then
            if type(ns.Print) == "function" then ns.Print("战斗中无法操作") end
            return
        end
        View:ShowCopyWindow(self, Data.RETAIL_LAYOUT, self.importCopyButton)
    end) ~= nil
end

function Definition:ApplyEditModeState()
    if not Adapter.features.editMode then return false end
    local profile = self:GetProfile()
    View:EnsureLayoutHint(self, profile.enableLeftHint)
    local manager = Adapter:GetEditModeManager()
    if profile.enableImportCopyButton and manager and type(manager.ShowImportLayoutDialog) == "function" then
        if not self._importHook then
            self._importHook = self:HookSecureFunction(manager, "ShowImportLayoutDialog", function()
                self:RequestRefresh("extra-tools-import-dialog", self.OnImportDialogShown, 0)
            end, "ExtraTools edit mode import")
        end
        self:OnImportDialogShown()
    elseif self.importCopyButton then self.importCopyButton:Hide() end
    return true
end

function Definition:CancelMinimapVolumeRetry()
    local handle = self._minimapVolumeRetryHandle
    if handle then self:CancelSchedule(handle) end
    self._minimapVolumeRetryHandle = nil
    self._minimapVolumeRetryAttempt = 0
    return handle ~= nil
end

function Definition:ApplyMinimapVolumeState()
    if not Adapter.features.minimapVolume then return false end
    local profile = self:GetProfile()
    if not (self.runtimeActive and profile
        and profile.ellesmereMinimapVolume) then
        self:CancelMinimapVolumeRetry()
        Adapter:DeactivateMinimapVolume(self)
        return false
    end

    local active, shouldRetry = Adapter:ActivateMinimapVolume(self)
    if active then
        self:CancelMinimapVolumeRetry()
        return true
    end
    if not shouldRetry or self._minimapVolumeRetryHandle then return false end

    local attempt = (self._minimapVolumeRetryAttempt or 0) + 1
    local delay = Data.MINIMAP_VOLUME_RETRY_DELAYS[attempt]
    self._minimapVolumeRetryAttempt = attempt
    if not delay then return false end
    self._minimapVolumeRetryHandle = self:Schedule(delay, OnMinimapVolumeRetry,
        "ExtraTools minimap volume retry")
    return false
end

function Definition:IsLFGToolsEnabled()
    local profile, lfg = self:GetProfile(), self:GetLFGToolsDB()
    return self.runtimeActive and lfg and lfg.enabled or false
end

function Definition:GetActiveLFGToolsPosition()
    local profile = self:GetLFGToolsDB()
    if not profile then return Data.LFG.defaultX, Data.LFG.defaultY end
    local provider = Providers:GetPreferredLFGProvider(profile)
    if provider and type(provider.GetLFGPosition) == "function" then
        return provider:GetLFGPosition(profile)
    end
    return profile.x, profile.y
end

function Definition:SetActiveLFGToolsPosition(x, y)
    local profile = self:GetLFGToolsDB()
    if not profile then return false end
    x, y = Data.SafeRound(x, Data.LFG.defaultX), Data.SafeRound(y, Data.LFG.defaultY)
    local provider = Providers:GetPreferredLFGProvider(profile)
    if provider and type(provider.SetLFGPosition) == "function" then
        provider:SetLFGPosition(profile, x, y)
    else profile.x, profile.y = x, y end
    return true
end

function Definition:RunLFGAction(action)
    if self.lfgToolsPreviewMode then
        Adapter:Print(action == "leave" and "预览模式：点击了离开副本队伍。" or "预览模式：点击了传送随机本。")
        return true
    end
    if not Adapter:IsInInstanceParty() then
        Adapter:Print(action == "leave" and "当前不在随机副本队伍，无法退出。" or "当前不在随机副本队伍，无法传送。")
        return false
    end
    if action ~= "leave" and action ~= "teleport" then return false end
    if Adapter:PerformLFGAction(action) then return true end
    Adapter:Print(action == "leave" and "当前客户端不支持一键退出副本队伍。" or "当前客户端不支持随机本快速传送。")
    return false
end

function Definition:UpdateLFGTools()
    if not (Adapter.features.lfgTools and self.runtimeActive) then return false end
    local profile = self:GetLFGToolsDB()
    local shouldShow = self:IsLFGToolsEnabled()
        and (Adapter:IsInInstanceParty() or self.isUnlocked or self.lfgToolsPreviewMode)
    if not shouldShow then
        if self.lfgButtons or self.lfgToolsMover then View:ReleaseLFGOwnership(self) end
        return false
    end
    local x, y = self:GetActiveLFGToolsPosition()
    local shown = View:ApplyLFGButtons(self, profile, x, y, shouldShow)
    if self.isUnlocked and profile.enabled then
        local count = (profile.showLeaveButton and 1 or 0) + (profile.showTeleportButton and 1 or 0)
        local width = math.max(count, 1) * Data.LFG.buttonWidth
            + math.max(count - 1, 0) * Data.LFG.buttonSpacing
        local mover = View:EnsureLFGMover(self, x, y, width)
        View:PositionLFGMover(mover, x, y, width)
        mover:Show()
        local overlay = View:EnsureLFGMoveOverlay(self, mover)
        if overlay then overlay:Show() end
    elseif self.lfgToolsMover or self.lfgToolsMoveOverlay then
        View:HideLFGMover(self)
    end
    return shown
end

function Definition:QueueUpdateLFGTools()
    if not (self.runtimeActive and self:IsLFGToolsEnabled()) then return false end
    self:RequestRefresh("extra-tools-lfg", OnLFGRefresh, Data.RETAIL_DELAY)
    return true
end

function Definition:ResetLFGToolsDefaults()
    local profile = self:GetProfile()
    profile.lfgTools = Data.CreateDefaults("classic").profile.lfgTools
    self.lfgToolsPreviewMode = false
    self:UpdateLFGTools()
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return true
end

function Definition:ResetLFGToolsPosition()
    local profile = self:GetLFGToolsDB()
    local provider = Providers:GetPreferredLFGProvider(profile)
    if provider and type(provider.ResetLFGPosition) == "function" then
        provider:ResetLFGPosition(profile, Data.LFG)
    else profile.x, profile.y = Data.LFG.defaultX, Data.LFG.defaultY end
    self:UpdateLFGTools()
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return true
end

function Definition:SetLFGToolsPreview(enabled)
    self.lfgToolsPreviewMode = IsTrue(enabled)
    return self:UpdateLFGTools()
end

function Definition:IsCelestialBarSupported()
    return Adapter:IsCelestialSupported()
end

function Definition:IsCelestialBarEnabled()
    local profile, celestial = self:GetProfile(), self:GetCelestialBarDB()
    return self.runtimeActive and celestial and celestial.enabled or false
end

function Definition:ShouldOwnNativeAltPowerBar()
    local profile = self:GetCelestialBarDB()
    return self.runtimeActive and self:IsCelestialBarEnabled()
        and profile and (profile.simpleMode or self.celestialPreviewMode)
        and not Providers:HasAltPowerOwner()
end

function Definition:RefreshCelestialBar()
    if not self:ShouldOwnNativeAltPowerBar() then
        View:HideCelestial(self)
        View:RestoreNativeAltPower(self)
        return false, false
    end
    local state, reason = Adapter:GetAltPowerState(self.celestialPreviewMode)
    if not state then
        View:HideCelestial(self)
        View:RestoreNativeAltPower(self)
        return false, reason == "retry"
    end
    local shown = View:ApplyCelestialState(self, self:GetCelestialBarDB(), state)
    if shown then View:DisableNativeAltPower(self)
    else View:RestoreNativeAltPower(self) end
    return shown == true, false
end

function Definition:QueueApplyCelestialBarPosition()
    if not self:IsCelestialBarEnabled() then return false end
    self._celestialApplyHandle = self:RequestRefresh("extra-tools-celestial", OnCelestialRefresh, Data.APPLY_DELAY)
    return true
end

function Definition:CancelCelestialRetries()
    self._celestialRetryAttempt = 0
    if self._celestialRetryHandle then self:CancelSchedule(self._celestialRetryHandle) end
    self._celestialRetryHandle = nil
end

function Definition:ScheduleCelestialRetry()
    if self._celestialRetryHandle or not self:ShouldOwnNativeAltPowerBar() then return false end
    local attempt = self._celestialRetryAttempt + 1
    local delay = Data.CELESTIAL_RETRY_DELAYS[attempt]
    if not delay then return false end
    self._celestialRetryAttempt = attempt
    self._celestialRetryHandle = self:Schedule(delay, OnCelestialRetry, "ExtraTools celestial retry")
    return true
end

function Definition:ResetCelestialBarDefaults()
    self:GetProfile().celestialBar = Data.CreateDefaults("classic").profile.celestialBar
    self:GetProfile().celestialBar.enabled = Adapter:IsCelestialSupported()
    self.celestialPreviewMode = false
    local refreshed = self:RefreshCelestialBar()
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return refreshed
end

function Definition:ResetCelestialBarPosition()
    local profile = self:GetCelestialBarDB()
    profile.x, profile.y = Data.CELESTIAL.defaultX, Data.CELESTIAL.defaultY
    local refreshed = self:RefreshCelestialBar()
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return refreshed
end

function Definition:SetCelestialBarPreview(enabled)
    self.celestialPreviewMode = IsTrue(enabled)
    return self:RefreshCelestialBar()
end

function Definition:SetUnlocked(unlocked)
    if Adapter:IsInCombat() then return false end
    self.isUnlocked = IsTrue(unlocked)
    if self.isUnlocked and self:IsCelestialBarEnabled() then
        self:RefreshCelestialBar()
        View:EnsureCelestialMover(self, self:GetCelestialBarDB()):Show()
    elseif self.celestialMover then self.celestialMover:Hide() end
    self:UpdateLFGTools()
    return true
end

function Definition:IsExternalUpdateText(text)
    return Providers:MatchesUpdateNotice(text)
end

function Definition:ShouldBlockExternalUpdatePopup(which, text)
    return Providers:ShouldBlockUpdatePopup(which, text)
end

function Definition:ApplyExternalUpdateBlockers()
    local profile = self:GetUpdateBlockerDB()
    if not (profile and profile.enabled) then
        Providers:RestoreUpdateBlockers(self)
        return false
    end
    return Providers:ApplyUpdateBlockers(self)
end

function Definition:MERCHANT_SHOW()
    local profile = self:GetProfile()
    if not (self.runtimeActive and profile and profile.autoSellJunk) then return end
    Adapter:SellJunk()
end

-- 快速拾取：只转发原生事件，占用判定与批次去重都留在 FastLoot 服务里。
function Definition:LOOT_READY(_, autoloot)
    local service = GetFastLoot()
    if service then return service:OnLootReady(autoloot) end
end

function Definition:LOOT_OPENED(_, autoLoot, isFromItem)
    local service = GetFastLoot()
    if service then return service:OnLootOpened(autoLoot, isFromItem) end
end

function Definition:LOOT_CLOSED()
    local service = GetFastLoot()
    if service then return service:OnLootClosed() end
end

-- Compatibility data owner only. Runtime work lives in independent features.
function Definition:Enable() return true end
function Definition:Disable() return true end

function Definition:GetDiagnostics()
    return {
        family = Adapter.family,
        buildId = Adapter.buildId,
        runtimeActive = self.runtimeActive,
        unlocked = self.isUnlocked,
        lfgPreview = self.lfgToolsPreviewMode,
        celestialPreview = self.celestialPreviewMode,
    }
end

local module, reason = ns.RegisterModule("ExtraTools", Definition)
if module then
    ns.ExtraTools = module
    ns.ExtraToolsDefinition = Definition
    ns.EnhancementMethods = Definition
else
    ns.ExtraToolsRegistrationError = reason
end

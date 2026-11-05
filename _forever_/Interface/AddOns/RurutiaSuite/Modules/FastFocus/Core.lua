local _, ns = ...

-- Own secure focus actions, reminder settings and the module's Runtime lifecycle.
if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then
    return
end

local Adapter = ns.FastFocusAdapter
local Data = ns.FastFocusData
local Macro = ns.FastFocusMacro
local Reminder = ns.FastFocusReminder
if type(Adapter) ~= "table" or type(Data) ~= "table"
    or type(Macro) ~= "table" or type(Reminder) ~= "table" then
    error("FastFocus adapter, data, macro and reminder must load before Core.lua", 2)
end

local Definition = {
    databaseName = "RSFastFocus",
    defaultEnabled = true,
    defaults = Data.defaults,
}

local VALID_MODIFIERS = { SHIFT = true, CTRL = true, ALT = true }
local VALID_MOUSE_BUTTONS = { ["1"] = true, ["2"] = true, ["3"] = true, ["4"] = true, ["5"] = true }
local CLICK_BUTTONS = {
    ["1"] = "LeftButton",
    ["2"] = "RightButton",
    ["3"] = "MiddleButton",
    ["4"] = "Button4",
    ["5"] = "Button5",
}
local RETRY_DELAYS = { 1, 2, 5 }
local SECURE_BUTTON_NAME = "RSFastFocusSecureButton"
local MARKER_BUTTON_NAME = "RSFastFocusMarkerButton"
local REFRESH_KEY = "fast-focus-provider-refresh"

local function SetButtonAttribute(button, attribute, value)
    if button == nil or type(button.SetAttribute) ~= "function" then return false end
    return pcall(button.SetAttribute, button, attribute, value)
end

local function CleanupSecureButton(button)
    Adapter:ClearBindings(button)
end

local function CleanupMarkerButton(button)
    Adapter:ConfigureMarkerButton(button, nil, false)
end

local function OnRetryPass(module)
    if not module.runtimeActive then return end
    module:RequestProviderRefresh(true)
end

local function OnProviderRefresh(module)
    module.providerRefreshHandle = nil
    if not module.runtimeActive then return end
    -- Combat may begin after the event queued this pass. Preserve all work
    -- until regen rather than consuming flags before protected writes fail.
    if Adapter:IsInCombat() then
        module:QueueSettingsUpdate(module.pendingConflictCleanup)
        return
    end
    local cleanConflicts = module.pendingConflictCleanup
    local updateSettings = module.pendingSettingsUpdate
    module.pendingConflictCleanup = false
    module.pendingSettingsUpdate = false
    if cleanConflicts then module:CleanConflictBindings() end
    if updateSettings then
        module:UpdateSettings()
    else
        module:ApplyToFrames()
        if cleanConflicts then module:ApplyGlobalFocus() end
    end
    module:RecordRefresh()
end

function Definition:GetProfile()
    return self.db and self.db.profile
end

function Definition:Initialize()
    self.adapter = Adapter
    self.runtimeActive = false
    self.pendingSettingsUpdate = false
    self.pendingConflictCleanup = false
    self.pendingDisable = false
    self.providerRefreshHandle = nil
    self.retryHandles = {}
    self.lastApplyStats = nil
    Data.NormalizeProfile(self.db.profile)
    local position = self.db.profile.reminderPosition
    if tonumber(position.x) == 0 and tonumber(position.y) == 0 then position.y = 190 end
    Adapter:RegisterPreviewCommands(self)
    ns.CenterTextGroup:RegisterSource("fastfocus", self)
    self.lastValidMacroText = Macro.Build(self.db.profile, { inRaid = Adapter:IsRaidInstance() })
    if ns.FastFocusSettings and type(ns.FastFocusSettings.Register) == "function" then
        ns.FastFocusSettings:Register(self)
    end
end

function Definition:ProfileChanged()
    Data.NormalizeProfile(self.db.profile)
    Reminder:Cancel(self, "profile-changed")
    Reminder:Refresh(self)
    if self.runtimeActive then self:RequestSettingsUpdate() end
end

function Definition:RegisterRuntimeEvents()
    self:RegisterEvent("UPDATE_BINDINGS", self.OnFrameProviderEvent)
    self:RegisterEvent("NAME_PLATE_UNIT_ADDED", self.UpdateNamePlate)
    self:RegisterEvent("ADDON_LOADED", self.OnFrameProviderEvent)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.OnPlayerEnteringWorld)
    self:RegisterEvent("GROUP_ROSTER_UPDATE", self.OnFrameProviderEvent)
    self:RegisterEvent("CHALLENGE_MODE_START", self.OnChallengeModeStart)
    self:RegisterEvent("PLAYER_REGEN_DISABLED", self.OnCombatStarted)
end

function Definition:ScheduleProviderPasses()
    local index
    for index = 1, #RETRY_DELAYS do
        self.retryHandles[index] = self:Schedule(
            RETRY_DELAYS[index],
            OnRetryPass,
            "FastFocus provider pass " .. index
        )
    end
end

function Definition:ActivateRuntime()
    local profile = self:GetProfile()
    if self.runtimeActive or not (profile and profile.enabled) then return false end
    self.runtimeActive = true
    self:RegisterRuntimeEvents()
    self:ScheduleProviderPasses()
    self:RequestConflictCleanup()
    self:RequestSettingsUpdate()
    return true
end

function Definition:Enable()
    self:ActivateRuntime()
end

function Definition:Disable()
    self.runtimeActive = false
    self.pendingSettingsUpdate = false
    self.pendingConflictCleanup = false
    self.pendingDisable = false
    self.providerRefreshHandle = nil
    self.retryHandles = {}
    self:UnregisterAllEvents()
    self:CancelRefresh(REFRESH_KEY)
    Reminder:Release(self, "module-disabled")
    Adapter:RestoreFrameAttributes(self)
    self:ClearBindings()
    if self.secureButton then self:ReleaseFrame(self.secureButton) end
    if self.markerButton then self:ReleaseFrame(self.markerButton) end
end

function Definition:QueueSettingsUpdate(cleanConflicts)
    self.pendingSettingsUpdate = true
    if cleanConflicts then self.pendingConflictCleanup = true end
    self:RegisterEvent("PLAYER_REGEN_ENABLED", self.FlushPendingSettingsUpdate)
    return true
end

function Definition:RequestConflictCleanup()
    if not self.runtimeActive then return true end
    if Adapter:IsInCombat() then
        return self:QueueSettingsUpdate(true)
    end
    return self:CleanConflictBindings()
end

function Definition:CleanConflictBindings()
    if Adapter:IsInCombat() then return false end
    return Adapter:ClearConflictBindings()
end

function Definition:RequestSettingsUpdate()
    if not self.runtimeActive then return true end
    if Adapter:IsInCombat() then return self:QueueSettingsUpdate(false) end
    self.pendingSettingsUpdate = false
    return self:UpdateSettings()
end

function Definition:RequestProviderRefresh(cleanConflicts)
    if not self.runtimeActive then return false end
    if cleanConflicts then self.pendingConflictCleanup = true end
    if Adapter:IsInCombat() then return self:QueueSettingsUpdate(cleanConflicts) end
    if self.providerRefreshHandle then return self.providerRefreshHandle end
    self.providerRefreshHandle = self:RequestRefresh(REFRESH_KEY, OnProviderRefresh, 0)
    return self.providerRefreshHandle
end

function Definition:FlushPendingSettingsUpdate()
    if Adapter:IsInCombat() then return false end
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    local ok, reason
    if self.pendingDisable then
        self.pendingDisable = false
        ok, reason = self:CommitEnabledState(false)
    else
        local cleanConflicts = self.pendingConflictCleanup
        local updateSettings = self.pendingSettingsUpdate
        self.pendingConflictCleanup = false
        self.pendingSettingsUpdate = false
        if cleanConflicts then self:CleanConflictBindings() end
        if updateSettings then ok, reason = self:UpdateSettings()
        else ok = true end
    end
    if ns.UI and type(ns.UI.RefreshNavigationSwitch) == "function" then
        ns.UI:RefreshNavigationSwitch("fast-focus")
    end
    return ok, reason
end

function Definition:OnFrameProviderEvent(event, addonName)
    if not Adapter:ShouldRefreshForEvent(event, addonName) then return false end
    if event == "PLAYER_ENTERING_WORLD" then return self:RequestSettingsUpdate() end
    if event == "GROUP_ROSTER_UPDATE" then
        -- Share the existing provider pass with binding/addon events; a full
        -- settings refresh subsumes its frame scan and global binding work.
        if not self.runtimeActive then return false end
        self.pendingSettingsUpdate = true
        return self:RequestProviderRefresh(false)
    end
    return self:RequestProviderRefresh(event == "UPDATE_BINDINGS")
end

function Definition:OnPlayerEnteringWorld(event, isInitialLogin, isReloadingUi)
    self:OnFrameProviderEvent(event)
    Reminder:OnPlayerEnteringWorld(self, isInitialLogin, isReloadingUi)
end

function Definition:OnChallengeModeStart()
    Reminder:OnChallengeModeStart(self)
end

function Definition:OnCombatStarted()
    Reminder:Cancel(self, "combat")
    self:HideHub("combat")
end

function Definition:UpdateNamePlate(_, unit)
    if Adapter:IsInCombat() then return false end
    return self:ApplyToSingleFrame(Adapter:GetNamePlateForUnit(unit))
end

function Definition:ApplyToSingleFrame(frame)
    local profile = self:GetProfile()
    if not (self.runtimeActive and profile and profile.enabled) then return false end
    return Adapter:ApplyFrame(self, frame, profile, self:GetResolvedMacroText())
end

function Definition:ApplyToFrames()
    local profile = self:GetProfile()
    if Adapter:IsInCombat() or not (self.runtimeActive and profile and profile.enabled) then
        return false
    end
    self.lastApplyStats = Adapter:ApplyProviders(self, profile, self:GetResolvedMacroText())
    return true, self.lastApplyStats
end

function Definition:EnsureSecureButton()
    if self.secureButton == nil then
        self.secureButton = self:CreateFrame(
            "CheckButton",
            SECURE_BUTTON_NAME,
            _G.UIParent,
            "SecureActionButtonTemplate",
            CleanupSecureButton,
            "FastFocus secure binding button"
        )
        if type(self.secureButton.RegisterForClicks) == "function" then
            self.secureButton:RegisterForClicks("AnyDown", "AnyUp")
        end
    else
        self:OwnFrame(self.secureButton, CleanupSecureButton, "FastFocus secure binding button")
    end
    return self.secureButton
end

function Definition:EnsureMarkerButton()
    if self.markerButton == nil then
        self.markerButton = self:CreateFrame(
            "Button",
            MARKER_BUTTON_NAME,
            _G.UIParent,
            "SecureActionButtonTemplate",
            CleanupMarkerButton,
            "FastFocus secure marker button"
        )
        if type(self.markerButton.RegisterForClicks) == "function" then
            self.markerButton:RegisterForClicks("AnyDown")
        end
    else
        self:OwnFrame(self.markerButton, CleanupMarkerButton, "FastFocus secure marker button")
    end
    return self.markerButton
end

function Definition:ConfigureMarkerButton()
    if Adapter:IsInCombat() then return self:QueueSettingsUpdate(false) end
    return Adapter:ConfigureMarkerButton(
        self:EnsureMarkerButton(),
        self:GetProfile(),
        Adapter:IsRaidInstance()
    )
end

function Definition:ApplyGlobalFocus()
    if Adapter:IsInCombat() then return self:QueueSettingsUpdate(false) end
    local profile = self:GetProfile()
    if not (self.runtimeActive and profile and profile.enabled) then return false end

    local button = self:EnsureSecureButton()
    Adapter:ClearBindings(button)
    local macro = self:GetResolvedMacroText()
    if not SetButtonAttribute(button, "type", "macro")
        or not SetButtonAttribute(button, "macrotext", macro) then
        return false
    end

    local binding = Data.GetBinding(profile)
    if binding == "" then self.activeBinding = nil; return true end
    local success = Adapter:SetBinding(
        button,
        binding,
        SECURE_BUTTON_NAME,
        CLICK_BUTTONS[select(2, Data.GetMouseBinding(profile))] or "LeftButton"
    )
    if success then self.activeBinding = binding end
    return success
end

function Definition:ClearBindings()
    self.activeBinding = nil
    if self.secureButton == nil then return true end
    return Adapter:ClearBindings(self.secureButton)
end

function Definition:UpdateSettings()
    if Adapter:IsInCombat() then return self:QueueSettingsUpdate(false) end
    self:ClearBindings()
    Adapter:RestoreFrameAttributes(self)
    local profile = self:GetProfile()
    if not (self.runtimeActive and profile and profile.enabled) then return true end
    if not self:ConfigureMarkerButton() then return false end
    self:ApplyToFrames()
    return self:ApplyGlobalFocus()
end

function Definition:CommitEnabledState(enabled)
    if ns.Assembly and type(ns.Assembly.SetModuleEnabled) == "function" then
        return ns.Assembly:SetModuleEnabled("FastFocus", enabled)
    end
    if enabled then
        if self:IsEnabled() then return self:ActivateRuntime() end
        return self:Enable()
    end
    return self:Disable()
end

function Definition:SetEnabled(value)
    value = value and true or false
    self.db.profile.enabled = value
    if not value and not self.runtimeActive then
        return self:CommitEnabledState(false)
    end
    if not value and Adapter:IsInCombat() then
        self.pendingDisable = true
        self:RegisterEvent("PLAYER_REGEN_ENABLED", self.FlushPendingSettingsUpdate)
        return true, "queued"
    end
    if value and self:IsEnabled() then
        if self.runtimeActive then return true end
        return self:ActivateRuntime()
    end
    return self:CommitEnabledState(value)
end

Definition.Toggle = Definition.SetEnabled

function Definition:SetBinding(value)
    if Adapter:IsInCombat() then return false, "战斗中无法修改按键。" end
    local binding = Data.NormalizeBinding(value)
    if binding == nil then return false, "不支持此按键。" end
    self.db.profile.binding = binding
    self:RequestSettingsUpdate()
    return true
end

function Definition:SetModifier(value)
    value = tostring(value or ""):upper()
    if not VALID_MODIFIERS[value] then return false end
    self.db.profile.binding = nil
    self.db.profile.modifier = value
    self:RequestSettingsUpdate()
    return true
end

function Definition:SetMouseButton(value)
    value = tostring(value or "")
    if not VALID_MOUSE_BUTTONS[value] then return false end
    self.db.profile.binding = nil
    self.db.profile.mouseButton = value
    self:RequestSettingsUpdate()
    return true
end

function Definition:SetAllowClearFocus(value)
    return self:TryCommitMacroSetting("allowClearFocus", value and true or false)
end

function Definition:GetResolvedMacroText()
    local macro, reason = Macro.Build(self.db.profile, { inRaid = Adapter:IsRaidInstance() })
    if macro then
        self.lastValidMacroText = macro
        self.lastMacroError = nil
        return macro
    end
    self.lastMacroError = reason
    return self.lastValidMacroText or Macro.BuildFocusOnly(self.db.profile)
end

function Definition:NotifyHubChanged()
    Reminder:Refresh(self)
    local topBar = ns.TopBar
    if type(topBar) == "table" then
        if type(topBar.RequestFastFocusHubUpdate) == "function" then
            topBar:RequestFastFocusHubUpdate()
        elseif type(topBar.RefreshRoleMarker) == "function" then
            topBar:RefreshRoleMarker()
        end
    end
end

function Definition:HideHub(reason)
    local topBar = ns.TopBar
    if type(topBar) == "table" and type(topBar.HideFastFocusHub) == "function" then
        return topBar:HideFastFocusHub(reason)
    end
    return false
end

function Definition:HideReminderCallout(reason)
    Reminder:HideCenter(self)
end

function Definition:SetCenterPreview(value)
    if not ns.CenterTextGroup.active then Reminder:Cancel(self) end
    self.isUnlocked = value == true and self.runtimeActive and self:GetProfile().enabled
        and self:GetProfile().disableCenterReminder ~= true
    if self.isUnlocked then
        Reminder:HideCenter(self)
        Reminder:EnsureCenterFrame(self):Show()
    elseif self.centerReminderFrame then self.centerReminderFrame:Hide() end
    ns.CenterTextGroup:QueueLayout()
end
function Definition:RefreshCenterStyle() Reminder:Refresh(self) end

function Definition:PreviewCenterReminder() return Reminder:Preview(self) end
function Definition:SetUnlocked(unlocked) return Reminder:SetUnlocked(self, unlocked) end
function Definition:GetReminderPosition() return Reminder:GetPosition(self) end
function Definition:ApplyReminderPosition() return Reminder:ApplyPosition(self) end
function Definition:CommitReminderPosition() return Reminder:CommitPosition(self) end
function Definition:ResetPosition() return Reminder:ResetPosition(self) end

function Definition:SetDisableCenterReminder(value)
    if Adapter:IsInCombat() then return false, "combat" end
    self.db.profile.disableCenterReminder = value == true
    if value then Reminder:Cancel(self, "center-reminder-disabled") end
    return true
end

function Definition:SetDisableHealerReminder(value)
    if Adapter:IsInCombat() then return false, "combat" end
    self.db.profile.disableHealerReminder = value == true
    return true
end

function Definition:TryCommitMacroChanges(changes, options)
    if Adapter:IsInCombat() then return false, "combat" end
    local candidate, macro, reason = Macro.BuildCandidate(
        self.db.profile,
        changes,
        { inRaid = Adapter:IsRaidInstance() }
    )
    if not candidate then return false, reason end
    local key, value
    for key, value in pairs(changes) do self.db.profile[key] = Data.Copy(value) end
    Data.NormalizeProfile(self.db.profile)
    self.lastValidMacroText = macro
    self.lastMacroError = nil
    if options and options.cancelReminder then Reminder:Cancel(self, "marker-enabled") end
    self:RequestSettingsUpdate()
    self:NotifyHubChanged()
    return true
end

function Definition:TryCommitMacroSetting(key, value, options)
    return self:TryCommitMacroChanges({ [key] = value }, options)
end

function Definition:RestoreChatTemplates()
    return self:TryCommitMacroChanges({
        chatTemplateCN = Data.defaults.profile.chatTemplateCN,
        chatTemplateEN = Data.defaults.profile.chatTemplateEN,
    })
end

function Definition:RestorePageSettings()
    local changes = Data.Copy(Data.defaults.profile)
    -- The navigation switch owns module enable/disable and its secure lifecycle.
    changes.enabled = nil
    local ok, reason = self:TryCommitMacroChanges(changes)
    if ok then self.db.profile.binding = nil; return true end
    return false, reason
end

function Definition:IsMarkerEnabled() return self.db.profile.markEnabled == true end
function Definition:IsChatEnabled() return self.db.profile.chatEnabled ~= false end
function Definition:IsOverwriteExistingMarkEnabled()
    return self.db.profile.overwriteExistingMark == true
end
function Definition:GetChatMarkerMode()
    local value = self.db.profile.chatMarkerMode
    return value == "icon" and "icon" or value == "none" and "none" or "text"
end
function Definition:IsFocusNameEnabled()
    return self.db.profile.showFocusName ~= false
end
function Definition:GetSelectedMarker() return tonumber(self.db.profile.marker) or 3 end
function Definition:GetChatCommand() return Data.GetChatCommand(self.db.profile.chatCommand).command end
function Definition:GetChatCommandLabel() return Data.GetChatCommand(self.db.profile.chatCommand).label end
function Definition:GetAvailableMarkers() return Data.GetAvailableMarkers(self.db.profile) end

function Definition:SetMarkerEnabled(value)
    value = value == true
    local changes = {
        markEnabled = value,
        chatMarkerMode = value and "text" or "none",
    }
    if value then changes.showFocusName = true end
    return self:TryCommitMacroChanges(changes, { cancelReminder = value })
end

function Definition:SetChatEnabled(value)
    return self:TryCommitMacroSetting("chatEnabled", value == true)
end

function Definition:SetOverwriteExistingMarkEnabled(value)
    return self:TryCommitMacroSetting("overwriteExistingMark", value == true)
end

function Definition:SetChatMarkerMode(value)
    if value ~= "text" and value ~= "icon" and value ~= "none" then
        return false, "invalid-marker-mode"
    end
    return self:TryCommitMacroSetting("chatMarkerMode", value)
end

function Definition:CycleChatMarkerMode()
    local current = self:GetChatMarkerMode()
    local nextValue = current == "text" and "icon" or current == "icon" and "none" or "text"
    return self:SetChatMarkerMode(nextValue)
end

function Definition:SetFocusNameEnabled(value)
    value = value == true
    if not value then
        return self:TryCommitMacroChanges({
            showFocusName = false,
            chatMarkerMode = "icon",
        })
    end
    return self:TryCommitMacroChanges({
        showFocusName = true,
        chatMarkerMode = "text",
    })
end

function Definition:SetUseEnglishChat(value)
    return self:TryCommitMacroSetting("useEnglishChat", value == true)
end

function Definition:SetDisableChatInRaid(value)
    return self:TryCommitMacroSetting("disableChatInRaid", value == true)
end

function Definition:SetDisableMarkInRaid(value)
    return self:TryCommitMacroSetting("disableMarkInRaid", value == true)
end

function Definition:SetChatCommand(command)
    command = tostring(command or ""):lower()
    if Data.chatCommands[command] == nil then return false, "invalid-channel" end
    return self:TryCommitMacroSetting("chatCommand", command)
end

function Definition:CycleChatCommand(direction)
    local order = Data.chatCommandOrder
    local current = self:GetChatCommand()
    local currentIndex = 1
    for index = 1, #order do
        if order[index] == current then
            currentIndex = index
            break
        end
    end
    direction = tonumber(direction) or 1
    local nextIndex = ((currentIndex - 1 + (direction < 0 and -1 or 1)) % #order) + 1
    return self:SetChatCommand(order[nextIndex])
end

function Definition:SetSelectedMarker(marker, enableMarking)
    marker = tonumber(marker)
    if not Data.IsValidMarker(marker) then return false, "invalid-marker" end
    local excluded = Data.Copy(self.db.profile.excludedMarkers or {})
    excluded[marker] = false
    local changes = { marker = marker, excludedMarkers = excluded }
    if enableMarking ~= false then changes.markEnabled = true end
    return self:TryCommitMacroChanges(changes, { cancelReminder = enableMarking ~= false })
end

function Definition:SetMarkerExcluded(marker, excluded)
    marker = tonumber(marker)
    if not Data.IsValidMarker(marker) then return false, "invalid-marker" end
    local map = Data.Copy(self.db.profile.excludedMarkers or {})
    map[marker] = excluded == true
    local candidate = Data.CloneProfile(self.db.profile)
    candidate.excludedMarkers = map
    local available = Data.GetAvailableMarkers(candidate)
    if #available == 0 then return false, "at-least-one-marker" end
    local changes = { excludedMarkers = map }
    if map[self:GetSelectedMarker()] == true then changes.marker = available[1].id end
    return self:TryCommitMacroChanges(changes)
end

function Definition:SetChatTemplate(key, value)
    if key ~= "chatTemplateCN" and key ~= "chatTemplateEN" then return false end
    value = tostring(value or "")
    return self:TryCommitMacroSetting(key, value)
end

function Definition:OpenSettings()
    if ns.UI and type(ns.UI.OpenMain) == "function" then
        return ns.UI:OpenMain("fast-focus")
    end
    return false
end

local module, reason = ns.RegisterModule("FastFocus", Definition)
if module == nil then
    error("Unable to register FastFocus: " .. tostring(reason), 2)
end
ns.FastFocus = module
ns.RSFastFocus = module

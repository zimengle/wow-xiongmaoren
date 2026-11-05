local _, ns = ...

local Data = ns.ChatBarData
local Adapter = ns.ChatBarAdapter
if type(Data) ~= "table" then error("ChatBar Data.lua must load before Definition.lua", 2) end
if type(Adapter) ~= "table" then
    ns.ChatBarUnavailableReason = "no active Classic ChatBar adapter"
    return
end

local BUTTONS = Adapter:GetButtons()
local SETTINGS_BUTTON_ORDER = Adapter:GetSettingsButtonOrder()
local DEFAULTS = Adapter:GetDefaults()

local Definition = {
    defaults = Data.Copy(DEFAULTS),
    defaultEnabled = true,
}

local function SafeNumber(value, fallback)
    value = tonumber(value)
    return value or fallback
end

local function StripLeadingCommand(text)
    if not text or text == "" then return "" end
    if string.sub(text, 1, 1) ~= "/" then return text end
    return string.match(text, "^/%S+%s*(.*)$") or ""
end

Definition.GetSafeNumber = SafeNumber
Definition.StripLeadingCommand = StripLeadingCommand

function Definition:GetProfile()
    return self.db and self.db.profile
end

function Definition:GetButtonInfo(key)
    return Data.GetButton(key, BUTTONS)
end

function Definition:GetButtonDefinitions()
    return BUTTONS
end

function Definition:GetSettingsButtonOrder()
    return SETTINGS_BUTTON_ORDER
end

function Definition:GetChannelName(info)
    local key = info and info.channelKey
    return key and self.channels[key] or nil
end

function Definition:SanitizeProfile()
    local profile = self:GetProfile()
    if not profile then return false end
    if not profile.frameStrata or not profile.frameLevel
        or (profile.frameStrata == "HIGH" and profile.frameLevel == 100) then
        profile.frameStrata = "LOW"
        profile.frameLevel = 5
    end
    if type(profile.buttonsEnabled) ~= "table" then profile.buttonsEnabled = {} end
    if self:GetButtonInfo("goldLedger") then
        -- 稀疏 DB 的虚拟默认值不能覆盖旧存档显式保存的隐藏选择。
        local buttons = profile.buttonsEnabled
        local legacy = rawget(buttons, "biaoge")
        if rawget(buttons, "goldLedger") == nil and type(legacy) == "boolean" then
            buttons.goldLedger = legacy
        end
        buttons.biaoge = nil
    end
    local index
    for index = 1, #BUTTONS do
        local key = BUTTONS[index].key
        if profile.buttonsEnabled[key] == nil then profile.buttonsEnabled[key] = true end
    end
    if self:SupportsTabChannelSwitch() and profile.tabChannelSwitchEnabled == nil then
        profile.tabChannelSwitchEnabled = true
    end
    return true
end

function Definition:Initialize()
    self.adapter = Adapter
    self.data = Data
    self.buttonDefinitions = BUTTONS
    self.settingsButtonOrder = SETTINGS_BUTTON_ORDER
    self.supported = Adapter:IsSupported()
    self.channels = Adapter:GetChannels()
    self.isUnlocked = false
    self.runtimeActive = false
    self.emojiFiltersRegistered = false
    self:SanitizeProfile()
    if ns.ChatBarView and type(ns.ChatBarView.New) == "function" then
        self.view = ns.ChatBarView.New(self, Data, Adapter)
    end
    if ns.ChatBarSettings and type(ns.ChatBarSettings.Register) == "function" then
        ns.ChatBarSettings:Register(self, Data)
    end
end

function Definition:ProfileChanged()
    self:SanitizeProfile()
    self.channels = Adapter:GetChannels()
    local profile = self:GetProfile()
    if self.runtimeActive and profile and profile.tabChannelSwitchEnabled then
        self:EnsureTabChannelHook()
    end
end

function Definition:SupportsTabChannelSwitch()
    return type(Adapter.SupportsTabChannelSwitch) == "function"
        and Adapter:SupportsTabChannelSwitch() == true
end

function Definition:EnsureTabChannelHook()
    if not self:SupportsTabChannelSwitch()
        or type(Adapter.EnsureTabChannelHook) ~= "function" then
        return false
    end
    return Adapter:EnsureTabChannelHook(self)
end

function Definition:RemoveTabChannelHook()
    local token = self.tabChannelHookToken
    if token == nil then return false end
    self.tabChannelHookToken = nil
    if type(self.RemoveHook) ~= "function" then return false end
    return self:RemoveHook(token)
end

function Definition:HandleTabChannelPressed(editBox)
    local profile = self:GetProfile()
    if not (self.runtimeActive and profile and profile.enabled
        and profile.tabChannelSwitchEnabled) then
        return false
    end
    if type(Adapter.HandleTabChannelPressed) ~= "function" then return false end
    return Adapter:HandleTabChannelPressed(self, editBox)
end

function Definition:SetTabChannelSwitchEnabled(enabled)
    local profile = self:GetProfile()
    if not (profile and self:SupportsTabChannelSwitch()) then return false end
    enabled = enabled == true
    local previous = profile.tabChannelSwitchEnabled == true
    profile.tabChannelSwitchEnabled = enabled
    if enabled and self.runtimeActive and not self:EnsureTabChannelHook() then
        profile.tabChannelSwitchEnabled = previous
        return false
    end
    if not enabled then self:RemoveTabChannelHook() end
    return true
end

function Definition:IsButtonEnabled(key)
    local profile = self:GetProfile()
    local values = profile and profile.buttonsEnabled
    if type(values) ~= "table" or values[key] == nil then return true end
    return values[key] and true or false
end

function Definition:IsButtonShown(info)
    if not info or not info.key or not self:IsButtonEnabled(info.key) then return false end
    return Adapter:ShouldShow(info.showKey)
end

function Definition:SafeRegisterEvent(event)
    if type(event) ~= "string" or event == "" then return false end
    local ok = pcall(self.RegisterEvent, self, event, self.OnDynamicEvent)
    return ok
end

function Definition:RegisterDynamicEvents()
    local events = Adapter:GetDynamicEvents()
    local index
    for index = 1, #events do self:SafeRegisterEvent(events[index]) end
end

function Definition:OnDynamicEvent()
    self:RequestRefresh("chat-bar-dynamic-layout", self.OnDynamicRefresh, 0.05)
end

function Definition:OnDynamicRefresh()
    if not self.runtimeActive then return end
    self:UpdateLayout()
    self:UpdateChatCopy()
end

function Definition:RegisterEmojiFilters()
    if not Adapter:SupportsEmojiFilters()
        or self.emojiFiltersRegistered or not ns.ChatBarEmoji then return false end
    local callback = ns.ChatBarEmoji.Filter
    local registeredEvents = self.emojiFilterEvents or {}
    local previous
    for previous = #registeredEvents, 1, -1 do registeredEvents[previous] = nil end
    self.emojiFilterEvents = registeredEvents
    local index
    for index = 1, #Data.emojiEvents do
        local event = Data.emojiEvents[index]
        if Adapter:AddMessageFilter(event, callback) then
            registeredEvents[#registeredEvents + 1] = event
        else
            local rollback
            for rollback = #registeredEvents, 1, -1 do
                Adapter:RemoveMessageFilter(registeredEvents[rollback], callback)
                registeredEvents[rollback] = nil
            end
            self.emojiFiltersRegistered = false
            return false
        end
    end
    self.emojiFiltersRegistered = #registeredEvents == #Data.emojiEvents
    return self.emojiFiltersRegistered
end

function Definition:RegisterAliases()
    if self.aliasToken ~= nil then return true end
    local token = Adapter:RegisterAliases(self)
    if token == nil then return false end
    self.aliasToken = token
    return true
end

function Definition:UnregisterAliases()
    if self.aliasToken == nil then return false end
    Adapter:UnregisterAliases(self.aliasToken)
    self.aliasToken = nil
    return true
end

function Definition:UnregisterEmojiFilters()
    if not self.emojiFiltersRegistered or not ns.ChatBarEmoji then return false end
    local callback = ns.ChatBarEmoji.Filter
    local events = self.emojiFilterEvents
    local index
    if events then
        for index = #events, 1, -1 do
            Adapter:RemoveMessageFilter(events[index], callback)
            events[index] = nil
        end
    else
        for index = #Data.emojiEvents, 1, -1 do
            Adapter:RemoveMessageFilter(Data.emojiEvents[index], callback)
        end
    end
    self.emojiFiltersRegistered = false
    return true
end

function Definition:ActivateRuntime()
    local profile = self:GetProfile()
    if not (self.supported and profile and profile.enabled) then return false end
    self.runtimeActive = true
    self:RegisterDynamicEvents()
    self:RegisterEmojiFilters()
    self:RegisterAliases()
    if profile.tabChannelSwitchEnabled then self:EnsureTabChannelHook() end
    self:EnsureBar()
    self:UpdateLayout()
    self:ApplyPositionLocked()
    self:UpdateVisibility()
    self:UpdateChatCopy()
    return true
end

function Definition:StopRuntime()
    self.runtimeActive = false
    self:HideChatCopy()
    self:UnregisterAllEvents()
    self:CancelRefresh("chat-bar-dynamic-layout")
    self:CancelRefresh("chat-bar-popup-hide")
    self:RemoveTabChannelHook()
    self:UnregisterEmojiFilters()
    self:UnregisterAliases()
    if self.HidePopupMenu then self:HidePopupMenu() end
    if self.HideEmojiMenu then self:HideEmojiMenu() end
    if self.view then
        self.view:HideAll()
        self.view:ReleaseOwnership()
    end
end

function Definition:Enable()
    local profile = self:GetProfile()
    if self.supported and profile and profile.enabled then self:ActivateRuntime() end
end

function Definition:Disable()
    self.isUnlocked = false
    self:StopRuntime()
end

function Definition:EnsureBar()
    if not self.view then return nil end
    local frame = self.view:EnsureBar()
    self.bar = frame
    self.buttons = self.view.buttons
    return frame
end

function Definition:UpdateLayout()
    if not self.view then return false end
    return self.view:UpdateLayout(self:GetProfile())
end

function Definition:UpdateVisibility()
    if not self.view then return false end
    return self.view:UpdateVisibility(self:GetProfile(), self.isUnlocked)
end

function Definition:RefreshClamp()
    return self.view and self.view:RefreshClamp() or false
end

function Definition:ApplySharedFont()
    if self.view and self.view:IsShown() then return self:UpdateLayout() end
    return false
end

function Definition:OpenChannelChat(channelName)
    if not channelName or channelName == "" then return false end
    local channelNumber, foundName = Adapter:GetChannel(channelName)
    channelNumber = tonumber(channelNumber)
    if not foundName or not channelNumber or channelNumber <= 0 then
        Adapter:Notify("|cffffd700[你不在" .. channelName .. "，请先右键加入频道]|r")
        return false
    end
    local frame = Adapter:GetChatFrame()
    local message = StripLeadingCommand(Adapter:GetInputText(frame))
    return Adapter:OpenChat("/" .. tostring(channelNumber) .. " " .. message, frame)
end

function Definition:ToggleJoinLeaveChannel(channelName)
    if not channelName or channelName == "" then return false end
    local frame = Adapter:GetChatFrame()
    local _, foundName = Adapter:GetChannel(channelName)
    if foundName == nil then
        Adapter:JoinChannel(channelName, frame)
        Adapter:Notify("|cff00d200[已加入" .. channelName .. "]|r")
        return true
    end
    Adapter:LeaveChannel(channelName)
    Adapter:Notify("|cffd20000[已离开" .. channelName .. "]|r")
    return false
end

function Definition:HandleButtonClick(info, mouseButton)
    local profile = self:GetProfile()
    if not info or not (profile and profile.enabled) then return false end
    local right = mouseButton == "RightButton"
    if info.action == "rs" then
        if right then return Adapter:OpenRSAClass() end
        return Adapter:OpenMainFrame()
    elseif info.action == "open" then
        return Adapter:OpenChat((right and info.rightCommand) or info.command or "")
    elseif info.action == "raid" then
        return Adapter:OpenChat(right and "/rw " or "/ra ")
    elseif info.action == "macro" then
        return not right and Adapter:OpenMacroPanel() or false
    elseif info.action == "meeting" then
        return not right and Adapter:OpenMeetingStone() or false
    elseif info.action == "emoji" then
        return not right and self:ToggleEmojiMenu(self.buttons and self.buttons[info.key]) or false
    elseif info.action == "loot" then
        return Adapter:HandleLoot(right)
    elseif info.action == "run" then
        if info.key == "roll" then return Adapter:RandomRoll() end
        if info.key == "combat" then return Adapter:ToggleCombatLogging() end
        return Adapter:RunMacro(info.command)
    elseif info.action == "addon" then
        return Adapter:HandleAddon(info.key, mouseButton)
    elseif info.action == "channel" then
        local channelName = self:GetChannelName(info)
        if right then return self:ToggleJoinLeaveChannel(channelName) end
        return self:OpenChannelChat(channelName)
    end
    return false
end

function Definition:ApplyPositionLocked()
    return self.view and self.view:ApplyPositionLocked(self:GetProfile()) or false
end

function Definition:ApplyPositionUnlocked()
    return self.view and self.view:ApplyPositionUnlocked() or false
end

function Definition:CommitPositionToChatFrame()
    return self.view and self.view:CommitPosition(self:GetProfile()) or false
end

function Definition:SetUnlocked(unlocked)
    unlocked = unlocked == true
    if unlocked and not self:IsEnabled() then return false end
    if unlocked and Adapter:IsInCombat() then return false end
    self.isUnlocked = unlocked
    if unlocked then
        self:EnsureBar()
        self:ApplyPositionUnlocked()
        self.view:SetUnlocked(true)
    elseif self.view then
        self.view:SetUnlocked(false)
        self:ApplyPositionLocked()
        self:UpdateVisibility()
        if not self.runtimeActive then self.view:ReleaseOwnership() end
    end
    return true
end

function Definition:ToggleAnchor()
    return self:SetUnlocked(not self.isUnlocked)
end

function Definition:SetEnabled(enabled)
    local profile = self:GetProfile()
    if not profile then return false end
    profile.enabled = enabled == true
    if profile.enabled then
        if not self:IsEnabled() then return self:Enable() end
        return self:ActivateRuntime()
    end
    self.isUnlocked = false
    self:StopRuntime()
    return true
end

function Definition:ResetPosition()
    local profile = self:GetProfile()
    if not profile then return false end
    rawset(profile, "offsetX", nil)
    rawset(profile, "offsetY", nil)
    self:ApplyPositionLocked()
    if self.isUnlocked then self:ApplyPositionUnlocked() end
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return true
end

function Definition:ResetDefaults()
    if self.db and type(self.db.ResetProfile) == "function" then self.db:ResetProfile() end
    self:SanitizeProfile()
    if self:GetProfile().enabled then
        if not self:IsEnabled() then self:Enable()
        else self:ActivateRuntime() end
    else
        self:StopRuntime()
    end
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return true
end

function Definition:OpenSettings()
    if ns.UI and type(ns.UI.OpenMain) == "function" then
        return ns.UI:OpenMain("chat-bar")
    end
    return false
end

ns.ChatBarDefinition = Definition

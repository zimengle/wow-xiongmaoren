local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("ellesmereui") then return end

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")
    and ns.Build.HasModule and ns.Build.HasModule("EllesmereQuestAutomation")) then return end

-- This integration is only a shortcut for settings owned by
-- EllesmereUIQuestTracker. It must never implement quest automation itself or
-- persist a second copy of the provider settings in RurutiaSuiteDB.
local Integration = {
    providerAddon = "EllesmereUIQuestTracker",
    worldMapAddon = "Blizzard_WorldMap",
    label = "EUI 任务自动交接（设置快捷入口）",
}

local function IsAddOnLoaded(addonName)
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(callback) ~= "function" then return false end
    local ok, loaded = pcall(callback, addonName)
    if not ok then return false end
    if type(loaded) == "table" then return loaded[1] and true or false end
    return loaded and true or false
end

local function GetProvider()
    if not IsAddOnLoaded(Integration.providerAddon) then return nil end
    local provider = _G.EllesmereUIQuestTracker
    if type(provider) ~= "table" or type(provider.Cfg) ~= "function"
        or type(provider.Set) ~= "function" then
        return nil
    end
    return provider
end

local function ReadState(provider)
    provider = provider or GetProvider()
    if not provider then return nil, "provider_unavailable" end
    local ok, trackerEnabled, autoAccept, autoTurnIn = pcall(function()
        return provider.Cfg("enabled") ~= false,
            provider.Cfg("autoAccept") == true,
            provider.Cfg("autoTurnIn") == true
    end)
    if not ok then return nil, "provider_read_failed" end
    return {
        trackerEnabled = trackerEnabled,
        autoAccept = autoAccept,
        autoTurnIn = autoTurnIn,
        enabled = autoAccept and autoTurnIn,
        mixed = autoAccept ~= autoTurnIn,
    }
end

local function RestoreProvider(provider, state)
    if not (provider and state) then return false end
    local acceptOK = pcall(provider.Set, "autoAccept", state.autoAccept)
    local turnInOK = pcall(provider.Set, "autoTurnIn", state.autoTurnIn)
    return acceptOK and turnInOK
end

function Integration:GetProviderState()
    return ReadState()
end

function Integration:SetProviderEnabled(enabled)
    local provider = GetProvider()
    local before, reason = ReadState(provider)
    if not before then return false, reason end
    if not before.trackerEnabled then return false, "tracker_disabled" end

    enabled = enabled and true or false
    local acceptOK = pcall(provider.Set, "autoAccept", enabled)
    if not acceptOK then return false, "write_auto_accept_failed" end
    local turnInOK = pcall(provider.Set, "autoTurnIn", enabled)
    if not turnInOK then
        RestoreProvider(provider, before)
        return false, "write_auto_turn_in_failed"
    end

    local after = ReadState(provider)
    if not after or after.autoAccept ~= enabled or after.autoTurnIn ~= enabled then
        RestoreProvider(provider, before)
        return false, "provider_write_not_applied"
    end
    return true
end

local function SetMixedVisible(indicator, visible)
    if not indicator then return end
    if visible and type(indicator.Show) == "function" then indicator:Show()
    elseif not visible and type(indicator.Hide) == "function" then indicator:Hide() end
end

local function IsModuleActive(module)
    return module ~= nil and module.runtimeActive == true
end

function Integration:Refresh(module)
    local button = self.button
    if not button or button._owner ~= module or not IsModuleActive(module) then return false end

    local state, reason = ReadState()
    if not state then
        button._providerState = nil
        button._status = reason
        button:Hide()
        return false
    end

    button._providerState = state
    button._status = state.trackerEnabled and (state.mixed and "mixed" or "ready") or "tracker_disabled"
    button:SetChecked(state.enabled and not state.mixed)
    button:SetEnabled(state.trackerEnabled)
    SetMixedVisible(button.mixedIndicator, state.mixed)
    if button.text and type(button.text.SetTextColor) == "function" then
        button.text:SetTextColor(1, 0.82, 0, state.trackerEnabled and 1 or 0.5)
    end
    button:Show()
    return true
end

local function ShowTooltip(button)
    local tooltip = _G.GameTooltip
    if not (tooltip and type(tooltip.SetOwner) == "function") then return end
    tooltip:SetOwner(button, "ANCHOR_BOTTOMLEFT")
    tooltip:SetText(Integration.label)
    tooltip:AddLine("这里只代理 EllesmereUI 的自动接取与自动交付设置。", 1, 1, 1, true)
    tooltip:AddLine("Shift 临时跳过、多任务保护和奖励选择仍完全由 EUI 负责。", 0.8, 0.8, 0.8, true)
    local state = button._providerState
    if state and state.mixed then
        tooltip:AddLine("当前两项设置不一致（mixed）；只有点击才会统一。", 1, 0.82, 0, true)
    elseif state and not state.trackerEnabled then
        tooltip:AddLine("EUI 任务追踪器已关闭，快捷入口不可用。", 1, 0.35, 0.25, true)
    end
    tooltip:Show()
end

local function HideTooltip()
    local tooltip = _G.GameTooltip
    if tooltip and type(tooltip.Hide) == "function" then tooltip:Hide() end
end

local function CreateControl(self, module, parent)
    local button = module:CreateFrame(
        "CheckButton", nil, parent, "OptionsBaseCheckButtonTemplate",
        function(frame)
            frame._owner = nil
            frame._providerState = nil
            frame:Hide()
        end,
        "EllesmereUI quest automation shortcut"
    )
    button:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 25)
    button:SetSize(26, 26)
    button:SetHitRectInsets(-5, -235, -5, -5)
    button:SetFrameLevel(999)

    local text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    text:SetPoint("LEFT", button, "LEFT", 25, 0)
    text:SetText(self.label)
    button.text = text

    local mixed = button:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    mixed:SetPoint("CENTER", button, "CENTER", 0, 1)
    mixed:SetText("—")
    mixed:SetTextColor(1, 0.82, 0, 1)
    mixed:Hide()
    button.mixedIndicator = mixed

    button:SetScript("OnClick", function(target)
        local owner = target._owner
        if not IsModuleActive(owner) then return end
        local state = target._providerState
        if not (state and state.trackerEnabled) then
            Integration:Refresh(owner)
            return
        end
        local ok, reason = Integration:SetProviderEnabled(target:GetChecked() and true or false)
        target._status = ok and "written" or reason
        Integration:Refresh(owner)
    end)
    button:SetScript("OnEnter", ShowTooltip)
    button:SetScript("OnLeave", HideTooltip)
    self.button = button
    return button
end

function Integration:EnsureControl(module)
    if not (GetProvider() and IsAddOnLoaded(self.worldMapAddon)) then return false end
    local worldMap = _G.WorldMapFrame
    local parent = _G.QuestMapFrame
    if not (worldMap and type(worldMap.HookScript) == "function"
        and parent and type(parent.GetObjectType) == "function") then return false end

    local button = self.button
    if button then
        module:OwnFrame(button, function(frame)
            frame._owner = nil
            frame._providerState = nil
            frame:Hide()
        end, "EllesmereUI quest automation shortcut")
    else
        button = CreateControl(self, module, parent)
    end
    button._owner = module
    module:HookFrameScript(worldMap, "OnShow", function(owner)
        if button._owner == owner then Integration:Refresh(owner) end
    end, "EllesmereQuestAutomation:WorldMapOnShow")
    return true
end

function Integration:Activate(module)
    if not self:EnsureControl(module) then return false end
    module:UnregisterEvent("ADDON_LOADED")
    self:Refresh(module)
    return true
end

function Integration:Deactivate(module)
    local button = self.button
    if button and (module == nil or button._owner == module) then
        button._owner = nil
        button._providerState = nil
        button:Hide()
    end
    return true
end

local Definition = {}

local function CanWaitForProvider()
    if IsAddOnLoaded(Integration.providerAddon) then return true end
    local addons = _G.C_AddOns
    if not (addons and type(addons.GetAddOnMetadata) == "function"
        and type(addons.GetAddOnEnableState) == "function") then return false end
    local ok, version = pcall(addons.GetAddOnMetadata, Integration.providerAddon, "Version")
    if not ok or version == nil then return false end
    local guid = type(_G.UnitGUID) == "function" and _G.UnitGUID("player") or nil
    local checked, enabled = pcall(addons.GetAddOnEnableState, Integration.providerAddon, guid)
    return checked and type(enabled) == "number" and enabled > 0
end

function Definition:Enable()
    -- The unified native/EUI entry owns the map control when present.
    if ns.QuestAutomation then self.runtimeActive = false; return true end
    self.runtimeActive = CanWaitForProvider()
    if not self.runtimeActive then return true end
    if not Integration:Activate(self) then
        self:RegisterEvent("ADDON_LOADED", self.ADDON_LOADED)
    end
    return true
end

function Definition:Disable()
    self.runtimeActive = false
    self:UnregisterAllEvents()
    Integration:Deactivate(self)
    return true
end

function Definition:ADDON_LOADED(_, addonName)
    if addonName ~= Integration.providerAddon and addonName ~= Integration.worldMapAddon then return false end
    return Integration:Activate(self)
end

ns.EllesmereQuestAutomationIntegration = Integration
ns.EllesmereQuestAutomationDefinition = Definition
ns.RegisterModule("EllesmereQuestAutomation", Definition)

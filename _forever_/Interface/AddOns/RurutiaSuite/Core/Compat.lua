local _, ns = ...

local Build = ns.Build
local Compat = {}
ns.Compat = Compat

function Compat.GetTocVersion()
    return Build.GetInterfaceVersion()
end

function Compat.IsEraToc()
    return Build.Is("classic-era")
end

function Compat.HasWorldMarkers()
    return Build.GetCapability("worldMarkers", false) == true
end

function Compat.IsAutoMarkSupported()
    return Build.GetCapability("autoMark", false) == true
end

function Compat.ShouldUseMacroTargetMarkerClear()
    return Build.GetCapability("macroTargetMarkerClear", false) == true
end

function Compat.GetPrimarySecureClickEvents()
    if Build.GetCapability("secureClickMode") == "era" then
        return "LeftButtonUp"
    end
    return "AnyUp", "AnyDown"
end

function Compat.GetThreeButtonSecureClickEvents()
    if Build.GetCapability("secureClickMode") == "era" then
        return "LeftButtonUp", "RightButtonUp", "MiddleButtonUp"
    end
    return "LeftButtonUp", "LeftButtonDown", "RightButtonUp", "RightButtonDown", "MiddleButtonUp", "MiddleButtonDown"
end

function Compat.GetActionButtonUseKeyDown()
    if type(_G.GetCVarBool) == "function" then
        return _G.GetCVarBool("ActionButtonUseKeyDown") and true or false
    end
    if type(_G.GetCVar) == "function" then
        return _G.GetCVar("ActionButtonUseKeyDown") == "1"
    end
    return false
end

function Compat.SyncSecureClickUseOnKeyDown(button)
    if button == nil or type(button.SetAttribute) ~= "function" then
        return false
    end
    local useOnKeyDown = Compat.GetActionButtonUseKeyDown()
    if Build.GetCapability("secureClickMode") == "era" then
        useOnKeyDown = false
    end
    button:SetAttribute("useOnKeyDown", useOnKeyDown)
    return true
end

function Compat.RegisterPrimarySecureClicks(button)
    if button == nil or type(button.RegisterForClicks) ~= "function" then
        return false
    end
    Compat.SyncSecureClickUseOnKeyDown(button)
    button:RegisterForClicks(Compat.GetPrimarySecureClickEvents())
    return true
end

function Compat.RegisterThreeButtonSecureClicks(button)
    if button == nil or type(button.RegisterForClicks) ~= "function" then
        return false
    end
    Compat.SyncSecureClickUseOnKeyDown(button)
    button:RegisterForClicks(Compat.GetThreeButtonSecureClickEvents())
    return true
end

function Compat.InterfaceOptions_AddCategory(frame)
    if type(_G.InterfaceOptions_AddCategory) == "function" then
        return _G.InterfaceOptions_AddCategory(frame)
    end
    local settings = _G.Settings
    if settings == nil then
        return nil
    end
    if frame.parent then
        local category = settings.GetCategory(frame.parent)
        local subcategory = settings.RegisterCanvasLayoutSubcategory(category, frame, frame.name, frame.name)
        subcategory.ID = frame.name
        return subcategory, category
    end
    local category = settings.RegisterCanvasLayoutCategory(frame, frame.name, frame.name)
    category.ID = frame.name
    settings.RegisterAddOnCategory(category)
    return category
end

function Compat.InterfaceOptionsFrame_OpenToCategory(categoryOrFrame)
    if type(_G.InterfaceOptionsFrame_OpenToCategory) == "function" then
        return _G.InterfaceOptionsFrame_OpenToCategory(categoryOrFrame)
    end
    if _G.Settings == nil or type(_G.Settings.OpenToCategory) ~= "function" then
        return nil
    end
    if type(categoryOrFrame) == "table" then
        categoryOrFrame = categoryOrFrame.name
    end
    return _G.Settings.OpenToCategory(categoryOrFrame)
end

function Compat.GetContainerNumSlots(bagID)
    if type(_G.GetContainerNumSlots) == "function" then
        return _G.GetContainerNumSlots(bagID)
    end
    local container = _G.C_Container
    return container and container.GetContainerNumSlots and container.GetContainerNumSlots(bagID) or nil
end

function Compat.GetContainerItemInfo(bagID, slotID)
    if type(_G.GetContainerItemInfo) == "function" then
        return _G.GetContainerItemInfo(bagID, slotID)
    end
    local container = _G.C_Container
    local info = container and container.GetContainerItemInfo and container.GetContainerItemInfo(bagID, slotID)
    if info then
        return info.iconFileID, info.stackCount, info.isLocked, info.quality, info.isReadable,
            info.hasLoot, info.hyperlink, info.isFiltered, info.hasNoValue, info.itemID, info.isBound
    end
    return nil
end

function Compat.GetContainerItemLink(bagID, slotID)
    if type(_G.GetContainerItemLink) == "function" then
        return _G.GetContainerItemLink(bagID, slotID)
    end
    local container = _G.C_Container
    return container and container.GetContainerItemLink and container.GetContainerItemLink(bagID, slotID) or nil
end

function Compat.PickupContainerItem(bagID, slotID)
    if type(_G.PickupContainerItem) == "function" then
        return _G.PickupContainerItem(bagID, slotID)
    end
    local container = _G.C_Container
    return container and container.PickupContainerItem and container.PickupContainerItem(bagID, slotID) or nil
end

function Compat.UseContainerItem(bagID, slotID, target)
    if type(_G.UseContainerItem) == "function" then
        return _G.UseContainerItem(bagID, slotID, target)
    end
    local container = _G.C_Container
    return container and container.UseContainerItem and container.UseContainerItem(bagID, slotID, target) or nil
end

function Compat.GetAddOnMetadata(addonName, field)
    local addons = _G.C_AddOns
    if addons and type(addons.GetAddOnMetadata) == "function" then
        return addons.GetAddOnMetadata(addonName, field)
    end
    if type(_G.GetAddOnMetadata) == "function" then
        return _G.GetAddOnMetadata(addonName, field)
    end
    return nil
end

function Compat.IsAddOnLoaded(addonName)
    local addons = _G.C_AddOns
    if addons and type(addons.IsAddOnLoaded) == "function" then
        return addons.IsAddOnLoaded(addonName) and true or false
    end
    if type(_G.IsAddOnLoaded) == "function" then
        return _G.IsAddOnLoaded(addonName) and true or false
    end
    return false
end

function Compat.SetRaidTarget(unit, markIndex)
    if not unit or (type(_G.UnitExists) == "function" and not _G.UnitExists(unit)) then
        return false, "单位不存在"
    end
    if type(_G.IsInGroup) == "function" and not _G.IsInGroup() then
        return false, "不在队伍中"
    end

    if Build.IsFamily("retail") then
        local isLeader = type(_G.UnitIsGroupLeader) == "function" and _G.UnitIsGroupLeader("player")
        local isAssistant = type(_G.UnitIsGroupAssistant) == "function" and _G.UnitIsGroupAssistant("player")
        if not isLeader and not isAssistant then
            return false, "需要队长或助理权限"
        end
    end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return false, "战斗中无法标记"
    end
    if type(_G.SetRaidTarget) ~= "function" then
        return false, "SetRaidTarget 不存在"
    end

    local ok, reason = pcall(_G.SetRaidTarget, unit, markIndex)
    if ok then
        return true
    end
    return false, reason or "SetRaidTarget 调用失败"
end

function Compat.GetRaidTargetIndex(unit)
    local unitAPI = _G.C_Unit
    if Build.IsFamily("retail") and unitAPI and type(unitAPI.GetRaidTargetIndex) == "function" then
        return unitAPI.GetRaidTargetIndex(unit)
    end
    if type(_G.GetRaidTargetIndex) == "function" then
        return _G.GetRaidTargetIndex(unit)
    end
    return nil
end

function Compat.IsAddonVersionCheckEnabled()
    local addons = _G.C_AddOns
    if addons and type(addons.IsAddonVersionCheckEnabled) == "function" then
        return addons.IsAddonVersionCheckEnabled()
    end
    if type(_G.IsAddonVersionCheckEnabled) == "function" then
        return _G.IsAddonVersionCheckEnabled()
    end
    if type(_G.GetCVar) == "function" then
        local value = _G.GetCVar("checkAddonVersion")
        if value ~= nil then
            return value ~= "0"
        end
    end
    return nil
end

function Compat.SetAddonVersionCheck(enabled)
    local addons = _G.C_AddOns
    if addons and type(addons.SetAddonVersionCheck) == "function" then
        return addons.SetAddonVersionCheck(enabled)
    end
    if type(_G.SetAddonVersionCheck) == "function" then
        return _G.SetAddonVersionCheck(enabled)
    end
    if type(_G.SetCVar) == "function" then
        return _G.SetCVar("checkAddonVersion", enabled and "1" or "0")
    end
    return nil
end

local function TryShowFrame(frame)
    if frame == nil then return false end
    if type(_G.ShowUIPanel) == "function" and pcall(_G.ShowUIPanel, frame) then
        return true
    end
    return type(frame.Show) == "function" and pcall(frame.Show, frame)
end

local function TryToggleFrame(frame)
    if frame == nil then return false end
    if type(frame.Toggle) == "function" and pcall(frame.Toggle, frame) then
        return true
    end
    if type(frame.IsShown) == "function" and frame:IsShown() then
        if type(_G.HideUIPanel) == "function" and pcall(_G.HideUIPanel, frame) then
            return true
        end
        return type(frame.Hide) == "function" and pcall(frame.Hide, frame)
    end
    return TryShowFrame(frame)
end

local function TryAddonSlashCommand(addonName)
    local commands = _G.SlashCmdList
    if type(commands) ~= "table" or type(addonName) ~= "string" then return false end
    local command = commands[addonName] or commands[string.upper(addonName)]
    return type(command) == "function" and pcall(command, "") or false
end

function Compat.OpenMeetingStoneAddon(addonName)
    local addon = addonName and _G[addonName]
    local integration = ns.MeetingHornIntegration
    if not addon and integration and type(integration.GetAddon) == "function" then
        local ok, registered = pcall(integration.GetAddon, integration, addonName)
        if ok then addon = registered end
    end
    if addon and type(addon.Toggle) == "function" and pcall(addon.Toggle, addon) then
        return true
    end
    if addonName == "MeetingHorn" and addon then
        if type(addon.SlashCommand) == "function" and pcall(addon.SlashCommand, addon, "") then
            return true
        end
        if type(addon.HandleChatCommand) == "function" and pcall(addon.HandleChatCommand, addon, "") then
            return true
        end
    end
    if TryAddonSlashCommand(addonName) then return true end
    -- MeetingHorn 4.x registers /mh under a different slash-command key.
    if addonName == "MeetingHorn" and TryAddonSlashCommand("MEETINGHORNHEROIC") then
        return true
    end
    -- Optional globals leave holes in a Lua array; do not use # to visit them.
    return TryToggleFrame(_G.MeetingHornHeroicMainFrame)
        or TryToggleFrame(addon and addon.MainPanel)
        or TryToggleFrame(_G.MeetingHornFrame)
        or TryToggleFrame(_G.MeetingHornMainFrame)
        or TryToggleFrame(_G.MeetingStoneFrame)
end

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Adapter = {
    family = "retail",
    buildId = "retail",
    features = {
        editMode = true,
        detailsNumberFix = true,
        bigWigsDungeonNames = true,
        tinyInspect = true,
        addonCompartment = true,
        backpack = true,
        windowDrag = true,
        minimapVolume = true,
        lfgTools = false,
        celestialBar = false,
    },
}

local function SafeCall(callback, ...)
    if type(callback) ~= "function" then return false end
    local ok, result = pcall(callback, ...)
    if not ok then return false end
    return true, result
end

local function IsLoaded(name)
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(callback) ~= "function" then return false end
    local ok, loaded = pcall(callback, name)
    if not ok then return false end
    if type(loaded) == "table" then return loaded[1] and true or false end
    return loaded and true or false
end

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Adapter:CanSellJunk()
    return _G.C_MerchantFrame and type(_G.C_MerchantFrame.SellAllJunkItems) == "function" or false
end

function Adapter:SellJunk()
    if self:CanSellJunk() then _G.C_MerchantFrame.SellAllJunkItems() end
end

function Adapter:IsAddOnLoaded(name)
    return IsLoaded(name)
end

local function GetMinimapVolumeIntegration()
    local integration = ns.ExtraToolsEllesmereMinimapIntegration
    return type(integration) == "table" and integration or nil
end

function Adapter:ActivateMinimapVolume(module)
    local integration = GetMinimapVolumeIntegration()
    if not integration or type(integration.Activate) ~= "function" then return false, false end
    return integration:Activate(module)
end

function Adapter:DeactivateMinimapVolume(module)
    local integration = GetMinimapVolumeIntegration()
    if not integration or type(integration.Deactivate) ~= "function" then return false end
    return integration:Deactivate(module)
end

function Adapter:ShouldRefreshMinimapVolumeForAddon(addonName)
    local integration = GetMinimapVolumeIntegration()
    return integration and type(integration.ShouldRefreshForAddon) == "function"
        and integration:ShouldRefreshForAddon(addonName) or false
end

function Adapter:GetMeetingStoneShown()
    local integration = ns.MeetingStoneAutomationIntegration
    local profile = integration and integration:GetSettings()
    return profile and profile.showFloatingWindow == true or false
end

function Adapter:SetMeetingStoneShown(value)
    local integration = ns.MeetingStoneAutomationIntegration
    local profile = integration and integration:GetSettings()
    if not profile then return false end
    profile.showFloatingWindow = value == true
    return true
end

function Adapter:ApplyMeetingStoneChoice()
    local integration = ns.MeetingStoneAutomationIntegration
    if not integration then return false, "integration_unavailable" end
    return integration:Apply(true)
end

function Adapter:IsTopBarMicroMenuActive()
    local runtime = ns.Runtime
    local topBar = runtime and runtime.GetModule and runtime:GetModule("TopBar") or nil
    return topBar ~= nil and type(topBar.IsMicroMenuTakeoverActive) == "function"
        and topBar:IsMicroMenuTakeoverActive() == true
end

function Adapter:GetMicroMenuFrame()
    return _G.MicroMenuContainer or _G.MicroMenu
end

function Adapter:GetBackpackFrame()
    return _G.MainMenuBarBackpackButton
end

function Adapter:GetAddonCompartmentFrame()
    return _G.AddonCompartmentFrame
end

function Adapter:IsShown(frame)
    return frame and type(frame.IsShown) == "function" and frame:IsShown() and true or false
end

function Adapter:Show(frame)
    local ok = SafeCall(frame and frame.Show, frame)
    return ok
end

function Adapter:Hide(frame)
    local ok = SafeCall(frame and frame.Hide, frame)
    return ok
end

function Adapter:IsAddonVersionCheckSupported()
    local addons = _G.C_AddOns
    return addons and type(addons.IsAddonVersionCheckEnabled) == "function"
        and type(addons.SetAddonVersionCheck) == "function" or false
end

function Adapter:AllowOutOfDateAddons()
    if not self:IsAddonVersionCheckSupported() then return false end
    local addons = _G.C_AddOns
    local ok, enabled = pcall(addons.IsAddonVersionCheckEnabled)
    if not ok or not enabled then return false end
    return pcall(addons.SetAddonVersionCheck, false)
end

function Adapter:GetTinyInspectState()
    if not IsLoaded("TinyInspect-Remake") and type(_G.TinyInspectRemakeDB) ~= "table" then
        return nil
    end
    local inHomeParty = type(_G.IsInGroup) == "function"
        and _G.IsInGroup(_G.LE_PARTY_CATEGORY_HOME) and true or false
    local inHomeRaid = type(_G.IsInRaid) == "function"
        and _G.IsInRaid(_G.LE_PARTY_CATEGORY_HOME) and true or false
    local hasPartyPlayer = false
    if inHomeParty and not inHomeRaid then
        local index
        for index = 1, 4 do
            local unit = "party" .. index
            if type(_G.UnitExists) == "function" and _G.UnitExists(unit)
                and type(_G.UnitIsPlayer) == "function" and _G.UnitIsPlayer(unit) then
                hasPartyPlayer = true
                break
            end
        end
    end
    local inInstance, instanceType = false, nil
    if type(_G.IsInInstance) == "function" then inInstance, instanceType = _G.IsInInstance() end
    return {
        inRaid = type(_G.IsInRaid) == "function" and _G.IsInRaid() and true or false,
        inInstanceGroup = type(_G.IsInGroup) == "function"
            and _G.IsInGroup(_G.LE_PARTY_CATEGORY_INSTANCE) and true or false,
        normalHomeParty = inHomeParty and not inHomeRaid,
        hasPartyPlayer = hasPartyPlayer,
        inInstance = inInstance and true or false,
        instanceType = instanceType,
    }
end

function Adapter:SetTinyInspectItemLevels(partyEnabled, raidEnabled)
    local db = _G.TinyInspectRemakeDB
    if type(db) ~= "table" then return false end
    db.EnablePartyItemLevel = partyEnabled and true or false
    db.EnableRaidItemLevel = raidEnabled and true or false
    return true
end

function Adapter:GetDetails()
    return _G.Details
end

function Adapter:CaptureDetailsNumberState(details)
    if type(details) ~= "table" then return nil end
    return {
        damage = details.abbreviateOptionsDamage,
        dps = details.abbreviateOptionsDPS,
        healing = details.abbreviateOptionsHealing,
        hps = details.abbreviateOptionsHPS,
        buffs = details.abbreviateOptionsBuffs,
    }
end

function Adapter:ApplyDetailsNumberFix(details)
    if type(details) ~= "table" or details.numerical_system ~= 2
        or type(_G.CreateAbbreviateConfig) ~= "function"
        or type(_G.AbbreviateNumbers) ~= "function" then return false end
    local locale = type(_G.GetLocale) == "function" and _G.GetLocale() or "zhCN"
    local thousand, tenThousand, hundredMillion = "千", "万", "亿"
    if locale == "koKR" then
        thousand, tenThousand, hundredMillion = "천", "만", "억"
    elseif locale == "zhTW" then
        tenThousand, hundredMillion = "萬", "億"
    end
    local options = {
        { breakpoint = 100000000, abbreviation = hundredMillion, significandDivisor = 1000000, fractionDivisor = 100, abbreviationIsGlobal = false },
        { breakpoint = 100000, abbreviation = tenThousand, significandDivisor = 10000, fractionDivisor = 1, abbreviationIsGlobal = false },
        { breakpoint = 10000, abbreviation = tenThousand, significandDivisor = 1000, fractionDivisor = 10, abbreviationIsGlobal = false },
        { breakpoint = 1000, abbreviation = thousand, significandDivisor = 100, fractionDivisor = 10, abbreviationIsGlobal = false },
        { breakpoint = 1, abbreviation = "", significandDivisor = 1, fractionDivisor = 1, abbreviationIsGlobal = false },
    }
    local value = { config = _G.CreateAbbreviateConfig(options) }
    details.abbreviateOptionsDamage = value
    details.abbreviateOptionsDPS = value
    details.abbreviateOptionsHealing = value
    details.abbreviateOptionsHPS = value
    details.abbreviateOptionsBuffs = value
    return true
end

function Adapter:RestoreDetailsNumberState(details, state)
    if type(details) ~= "table" or type(state) ~= "table" then return false end
    details.abbreviateOptionsDamage = state.damage
    details.abbreviateOptionsDPS = state.dps
    details.abbreviateOptionsHealing = state.healing
    details.abbreviateOptionsHPS = state.hps
    details.abbreviateOptionsBuffs = state.buffs
    return true
end

function Adapter:GetBigWigsDungeonNameRegions(result)
    result = result or {}
    local count = 0
    local frame = _G.ChallengesFrame
    local icons = frame and frame.DungeonIcons
    if type(icons) ~= "table" then return result, frame end
    local index
    for index = 1, #icons do
        local icon = icons[index]
        if icon and type(icon.GetRegions) == "function" then
            local regions = { icon:GetRegions() }
            local regionIndex
            for regionIndex = 1, #regions do
                local region = regions[regionIndex]
                local isFont = region and type(region.IsObjectType) == "function"
                    and region:IsObjectType("FontString")
                local font = isFont and type(region.GetFontObject) == "function" and region:GetFontObject() or nil
                if font and (font == _G.GameFontNormalMed1 or font == _G.SystemFont_Shadow_Med1_Outline) then
                    count = count + 1
                    result[count] = region
                end
            end
        end
    end
    index = #result
    while index > count do result[index] = nil index = index - 1 end
    return result, frame
end

function Adapter:GetImportDialog()
    local manager = _G.EditModeManagerFrame
    return _G.EditModeImportLayoutDialog
        or (manager and (manager.ImportLayoutDialog or manager.ImportDialog))
end

function Adapter:GetEditModeManager()
    return _G.EditModeManagerFrame
end

function Adapter:GetRootFrame()
    return _G.UIParent
end

function Adapter:GetTooltip()
    return _G.GameTooltip
end

function Adapter:GetFontPath()
    if ns.Font and type(ns.Font.GetInterfaceFontPath) == "function" then
        return ns.Font:GetInterfaceFontPath()
    end
    return "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
end

-- Read the client preference on demand; RS never stores a second default.
function Adapter:GetBagSortState()
    local api = _G.C_Container
    if not api or type(api.GetSortBagsRightToLeft) ~= "function"
        or type(api.SetSortBagsRightToLeft) ~= "function" then
        return false, false, "当前客户端不支持原生整理方向设置。"
    end
    local ok, value = pcall(api.GetSortBagsRightToLeft)
    if not ok or type(value) ~= "boolean" then return false, false, "无法读取原生整理方向。" end
    local combat = self:IsInCombat()
    return value, not combat, combat and "战斗结束后可修改。"
        or "同步客户端的跨背包整理方向；开启为反向，关闭为正向。修改后请再整理背包，不改变格子显示顺序。"
end

function Adapter:SetBagSortEnabled(value)
    local before, mutable, reason = self:GetBagSortState()
    if not mutable then return false, reason end
    value = value and true or false
    if before == value then return true end
    local api = _G.C_Container
    local written = pcall(api.SetSortBagsRightToLeft, value)
    if not written then return false, "原生整理方向写入失败。" end
    -- The client commits this preference asynchronously (verified on Forever).
    -- The settings owner runs this readback once after the client has settled.
    return true, nil, function()
        local readOK, after = pcall(api.GetSortBagsRightToLeft)
        if readOK and after == value then return true end
        if self:IsInCombat() then return false, "整理方向未确认，脱战后请重新检查。" end
        pcall(api.SetSortBagsRightToLeft, before)
        return false, "原生整理方向未能修改，已尝试恢复。"
    end
end

ns.ExtraToolsAdapter = Adapter
ns.ExtraToolsRetailAdapter = Adapter

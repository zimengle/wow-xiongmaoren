local addonName, ST = ...

ST.frame = CreateFrame("Frame")
ST.pendingRestrictedTasks = {}

local function copyDefaults(src, dst)
    if type(src) ~= "table" then
        return dst
    end
    if type(dst) ~= "table" then
        dst = {}
    end
    for k, v in pairs(src) do
        if type(v) == "table" then
            dst[k] = copyDefaults(v, dst[k])
        elseif dst[k] == nil then
            dst[k] = v
        end
    end
    return dst
end

ST.defaults = {
    lock = false,
    point = { "CENTER", "UIParent", "CENTER", 0, -120 },
    secondaryPoint = { "TOPLEFT", "TotemMaster_MainFrame", "BOTTOMLEFT", 0, -8 },
    activeEditPreset = 1,
    currentSummonPreset = 1,
    presets = {
        [1] = {},
        [2] = {},
        [3] = {},
    },
    defaultShieldSpell = 52127,
    defaultWeaponSpell = 51730,
    earthShieldTarget = "",
    showCooldownRing = true,
    showIconCooldownNumber = true,
    timerInnerFormat = "unit",
    timerOuterFormat = "unit",
    showNumericTimer = true,
    showDecimalBelowTen = false,
    timerOffsetX = 0,
    timerOffsetY = -2,
    timerOuterSide = "below",
    timerFontSize = 12,
    timerOuterFontSize = 12,
    timerInnerFontSize = 16,
    timerFontPath = "",
    timerFontFamily = "standard",
    timerFontOutline = "OUTLINE",
    fontColorMode = "smart",
    fontColor = { r = 1, g = 1, b = 1, a = 1 },
    showCooldownRingSecondary = true,
    showIconCooldownNumberSecondary = true,
    timerInnerFormatSecondary = "unit",
    timerOuterFormatSecondary = "unit",
    showNumericTimerSecondary = true,
    timerOffsetXSecondary = 0,
    timerOffsetYSecondary = -2,
    timerOuterSideSecondary = "below",
    stackOffsetXSecondary = -2,
    stackOffsetYSecondary = 2,
    stackFontSizeSecondary = 16,
    timerOuterFontSizeSecondary = 12,
    timerInnerFontSizeSecondary = 16,
    earthShieldTargetFontSize = 12,
    earthShieldTargetNameMode = "short",
    showShieldIcon = true,
    showWeaponIcon = true,
    showReincarnationIcon = true,
    flashReadyMainElements = true,
    flashReadyWeapon = true,
    flashReadyReincarnation = true,
    showEarthShieldIcon = true,
    showIconBorder = true,
    showEarthShieldTargetText = true,
    hideBlizzardTotemTracker = true,
    splitSecondaryBar = false,
    iconGap = 6,
    mainIconGap = 6,
    secondaryIconGap = 6,
    mainScale = 1,
    secondaryScale = 1,
    mainMenuPopupDirection = "up",
    secondaryMenuPopupDirection = "up",
}

function ST:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ccffTotemMaster|r: " .. tostring(msg))
end

function ST:IsCorrectInterface()
    local interfaceVersion = tonumber((select(4, GetBuildInfo())))
    return interfaceVersion == ST.Config.Interface
end

function ST:IsRestricted()
    return InCombatLockdown()
end

function ST:RunOrQueue(taskName, fn)
    if not ST:IsRestricted() then
        fn()
        return true
    end
    ST.pendingRestrictedTasks[taskName] = fn
    ST:Print("战斗中，已排队：" .. taskName)
    return false
end

function ST:FlushRestrictedQueue()
    if ST:IsRestricted() then
        return
    end
    for taskName, fn in pairs(ST.pendingRestrictedTasks) do
        ST.pendingRestrictedTasks[taskName] = nil
        local ok, err = pcall(fn)
        if not ok then
            ST:Print("执行排队任务失败 " .. taskName .. ": " .. tostring(err))
        end
    end
end

local hiddenFrameHooks = setmetatable({}, { __mode = "k" })

local function shouldHideBlizzardTotemTracker()
    if not ST.db then
        return true
    end
    return ST.db.hideBlizzardTotemTracker ~= false
end

local function applyTrackerFrameState(frame, shouldHide)
    if not frame then
        return
    end
    if frame.IsForbidden and frame:IsForbidden() then
        return
    end
    if frame.HookScript and not hiddenFrameHooks[frame] then
        frame:HookScript("OnShow", function(self)
            applyTrackerFrameState(self, shouldHideBlizzardTotemTracker())
        end)
        hiddenFrameHooks[frame] = true
    end
    if frame.SetAlpha then
        frame:SetAlpha(shouldHide and 0 or 1)
    end
    if frame.EnableMouse and not (InCombatLockdown and InCombatLockdown()) then
        frame:EnableMouse(shouldHide and false or true)
    end
end

local hideBlizzardTotemRetryToken = 0

function ST:HideBlizzardMultiCastBar()
    local shouldHide = shouldHideBlizzardTotemTracker()
    local multiCastActionBarFrame = _G["MultiCastActionBarFrame"]
    local totemFrame = _G["TotemFrame"]
    applyTrackerFrameState(totemFrame, shouldHide)
    applyTrackerFrameState(multiCastActionBarFrame, shouldHide)
end

function ST:RequestHideBlizzardTotemTracker(retries, interval)
    local remaining = math.max(1, tonumber(retries) or 6)
    local delay = tonumber(interval) or 0.5
    hideBlizzardTotemRetryToken = hideBlizzardTotemRetryToken + 1
    local token = hideBlizzardTotemRetryToken
    local function tryHide()
        if token ~= hideBlizzardTotemRetryToken then
            return
        end
        ST:HideBlizzardMultiCastBar()
        local totemFrame = _G["TotemFrame"]
        local multiCastActionBarFrame = _G["MultiCastActionBarFrame"]
        local hasAnyTrackerFrame = totemFrame or multiCastActionBarFrame
        local needRetry = not hasAnyTrackerFrame
        remaining = remaining - 1
        if needRetry and remaining > 0 and C_Timer and C_Timer.After then
            C_Timer.After(delay, tryHide)
        end
    end
    tryHide()
end

local function requestApplyAllPresets(reason)
    local attempt = 0
    local maxAttempts = 8
    local function tryApply()
        attempt = attempt + 1
        ST:RunOrQueue(reason .. "#" .. attempt, function()
            local ok = ST.CastEngine:ApplyAllPresets(false)
            if ok then
                return
            end
            if attempt < maxAttempts and C_Timer and C_Timer.After then
                C_Timer.After(0.3, tryApply)
            end
        end)
    end
    tryApply()
end

local function onAddonLoaded(loadedName)
    if loadedName ~= addonName then
        return
    end

    if select(2, UnitClass("player")) ~= "SHAMAN" then
        return
    end

    if not ST:IsCorrectInterface() then
        ST:Print("当前接口版本不是 38001，插件已停用。")
        return
    end

    local charDBEmpty = type(TotemMasterCharDB) ~= "table" or next(TotemMasterCharDB) == nil
    if charDBEmpty then
        TotemMasterCharDB = {}
        if type(TotemMasterDB) == "table" and next(TotemMasterDB) ~= nil then
            TotemMasterCharDB = copyDefaults(TotemMasterDB, TotemMasterCharDB)
            ST:Print("已从账号级旧配置导入一份作为该角色的初始设置，后续修改将仅保存到当前角色。")
        end
    end
    TotemMasterCharDB = copyDefaults(ST.defaults, TotemMasterCharDB)
    ST.db = TotemMasterCharDB

    ST.SpellCatalog:Rebuild()
    ST.Presets:EnsureValid()
    ST.CastEngine:Init()
    ST:RequestHideBlizzardTotemTracker()
    ST.UI:Create()
    ST.UI:RefreshAll()

    requestApplyAllPresets("应用三召唤预设")
end

local function onPlayerEnteringWorld()
    if not ST.db then
        return
    end
    ST:RequestHideBlizzardTotemTracker()
    requestApplyAllPresets("进入世界后应用预设")
    if ST.UI and ST.UI.RefreshButtonBorderVisibility then
        ST.UI:RefreshButtonBorderVisibility()
    end
end

local function onExternalUISkinAddonLoaded(loadedName)
    if loadedName ~= "ElvUI" and loadedName ~= "NDui" and loadedName ~= "NDui_Plus" then
        return
    end
    if not ST.db or not ST.UI then
        return
    end
    if ST.UI.RefreshButtonBorderVisibility then
        ST.UI:RefreshButtonBorderVisibility()
    end
    if ST.UI.RefreshPanelButtonThirdPartySkins then
        ST.UI:RefreshPanelButtonThirdPartySkins()
    end
    if ST.UI.RefreshCheckButtonThirdPartySkins then
        ST.UI:RefreshCheckButtonThirdPartySkins()
    end
    if ST.UI.RefreshSettingsSliderThirdPartySkins then
        ST.UI:RefreshSettingsSliderThirdPartySkins()
    end
end

local function onSpellbookChanged()
    if not ST.db then
        return
    end
    ST.SpellCatalog:Rebuild()
    ST.Presets:EnsureValid()
    ST.UI:RefreshAll()
    requestApplyAllPresets("技能变化后应用预设")
end

local function onTotemUpdate()
    if not ST.db then
        return
    end
    ST.UI:UpdateTotemTimers()
end

ST.frame:SetScript("OnEvent", function(_, event, arg1)
    if event == "ADDON_LOADED" then
        onAddonLoaded(arg1)
        onExternalUISkinAddonLoaded(arg1)
    elseif event == "PLAYER_REGEN_ENABLED" then
        ST:FlushRestrictedQueue()
        ST:RequestHideBlizzardTotemTracker(2, 0.2)
    elseif event == "PLAYER_ENTERING_WORLD" then
        onPlayerEnteringWorld()
    elseif event == "SPELLS_CHANGED" then
        onSpellbookChanged()
    elseif event == "PLAYER_TOTEM_UPDATE"
        or event == "SPELL_UPDATE_COOLDOWN"
        or event == "BAG_UPDATE"
        or event == "PLAYER_ALIVE"
        or event == "PLAYER_DEAD"
        or event == "GLYPH_ADDED"
        or event == "GLYPH_REMOVED"
        or event == "GLYPH_UPDATED" then
        onTotemUpdate()
    end
end)

ST.frame:RegisterEvent("ADDON_LOADED")
ST.frame:RegisterEvent("PLAYER_REGEN_ENABLED")
ST.frame:RegisterEvent("PLAYER_ENTERING_WORLD")
ST.frame:RegisterEvent("SPELLS_CHANGED")
ST.frame:RegisterEvent("PLAYER_TOTEM_UPDATE")
ST.frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
ST.frame:RegisterEvent("BAG_UPDATE")
ST.frame:RegisterEvent("PLAYER_ALIVE")
ST.frame:RegisterEvent("PLAYER_DEAD")
ST.frame:RegisterEvent("GLYPH_ADDED")
ST.frame:RegisterEvent("GLYPH_REMOVED")
ST.frame:RegisterEvent("GLYPH_UPDATED")

SLASH_TOTEMMASTER1 = "/ttm"
SLASH_TOTEMMASTER2 = "/totemmaster"
SlashCmdList.TOTEMMASTER = function(msg)
    if not ST.UI.mainFrame then
        return
    end
    msg = string.lower((msg or ""):gsub("^%s+", ""):gsub("%s+$", ""))
    if msg == "" then
        ST.UI:ToggleSettings()
        return
    end
    if msg == "settings" then
        ST.UI:ToggleSettings()
        return
    end
    if msg == "lock" then
        ST.db.lock = not ST.db.lock
        ST:Print(ST.db.lock and "窗口已锁定" or "窗口已解锁")
        return
    end
    if msg == "bar" then
        if ST.UI.mainFrame:IsShown() then
            ST.UI.mainFrame:Hide()
            if ST.UI.secondaryFrame then
                ST.UI.secondaryFrame:Hide()
            end
        else
            ST.UI.mainFrame:Show()
            ST.UI:RefreshAll()
        end
    end
end

BINDING_HEADER_TOTEMMASTER = "TotemMaster"
BINDING_NAME_TOTEMMASTER_CALL_ELEMENTS = "元素召唤（预设1）"
BINDING_NAME_TOTEMMASTER_CALL_ANCESTORS = "先祖召唤（预设2）"
BINDING_NAME_TOTEMMASTER_CALL_SPIRITS = "灵魂召唤（预设3）"

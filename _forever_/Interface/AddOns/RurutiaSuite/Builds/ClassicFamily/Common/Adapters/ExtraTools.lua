local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local buildId = ns.Build.GetID()

local Adapter = {
    family = "classic",
    buildId = buildId,
    features = {
        editMode = false,
        detailsNumberFix = false,
        bigWigsDungeonNames = false,
        tinyInspect = false,
        minimapVolume = buildId == "classic-infinite",
        addonCompartment = false,
        minimapEventButton = buildId == "classic-titan"
            and type(_G.GetCurrentRegion) == "function" and _G.GetCurrentRegion() == 5,
        backpack = buildId == "classic-infinite",
        endCaps = buildId == "classic-infinite",
        lfgTools = true,
        celestialBar = buildId == "classic-cata-legacy" or buildId == "classic-mists",
        fastLoot = buildId == "classic-infinite",
        lootSparkles = buildId == "classic-infinite",
        -- Blizzard 内置的 PTR/beta 反馈窗口只在测试客户端加载，无限服按需隐藏。
        hidePTRFeedback = buildId == "classic-infinite",
        windowDrag = buildId == "classic-infinite",
        merchantExpansion = buildId == "classic-infinite",
        knownRecipeTint = buildId == "classic-infinite",
    },
}

function Adapter:GetMinimapEventButton()
    return self.features.minimapEventButton and _G.MinimapBackdrop
        and _G.MinimapBackdrop.ExternalEventURLButton or nil
end

function Adapter:GetLootSparkleCVar(name)
    local get = _G.C_CVar and _G.C_CVar.GetCVar or _G.GetCVar
    if type(get) ~= "function" then return nil end
    local ok, value = pcall(get, name)
    if ok and value ~= nil then return tostring(value) end
end

function Adapter:SetLootSparkleCVar(name, value)
    local set = _G.C_CVar and _G.C_CVar.SetCVar or _G.SetCVar
    if type(set) ~= "function" then return false end
    local ok = pcall(set, name, value)
    return ok and self:GetLootSparkleCVar(name) == tostring(value)
end


local function IsLoaded(name)
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(callback) ~= "function" then return false end
    local ok, loaded = pcall(callback, name)
    return ok and loaded and true or false
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

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Adapter:IsAddOnLoaded(name)
    return IsLoaded(name)
end

function Adapter:IsTopBarMicroMenuActive()
    local runtime = ns.Runtime
    local topBar = runtime and runtime.GetModule and runtime:GetModule("TopBar") or nil
    return topBar ~= nil and type(topBar.IsMicroMenuTakeoverActive) == "function"
        and topBar:IsMicroMenuTakeoverActive() == true
end

function Adapter:GetMicroMenuFrame()
    -- Forever owns decorative art on MicroMenu itself; it may be reparented
    -- independently of the legacy container by the action-bar layout.
    if buildId == "classic-infinite" then return _G.MicroMenu or _G.MicroMenuContainer end
    return _G.MicroMenuContainer or _G.MicroMenu
end

function Adapter:GetMicroMenuContentFrame()
    return _G.MicroMenu
end

function Adapter:CanSellJunk()
    return _G.C_MerchantFrame and type(_G.C_MerchantFrame.SellAllJunkItems) == "function" or false
end

function Adapter:SellJunk()
    if self:CanSellJunk() then _G.C_MerchantFrame.SellAllJunkItems() end
end

function Adapter:IsLootApiSupported()
    return self.features.fastLoot == true
        and type(_G.GetNumLootItems) == "function"
        and type(_G.GetLootSlotInfo) == "function"
        and type(_G.LootSlot) == "function"
        and type(_G.GetCVarBool) == "function"
        and type(_G.IsModifiedClick) == "function"
end

function Adapter:GetNumLootItems()
    return _G.GetNumLootItems()
end

function Adapter:GetLootSlotInfo(slot)
    return _G.GetLootSlotInfo(slot)
end

function Adapter:LootSlot(slot)
    return _G.LootSlot(slot)
end

function Adapter:GetAutoLootState()
    return _G.GetCVarBool("autoLootDefault") and true or false
end

-- 只读转发 Integrations 的判定结果：第三方插件名与运行态判断都不在本文件里。
function Adapter:GetFastLootConflict()
    local registry = ns.ExtraToolsProviderRegistry
    if type(registry) ~= "table" or type(registry.GetFastLootOwner) ~= "function" then return nil end
    return registry:GetFastLootOwner()
end

-- 与 Leatrix Plus 相同的窄防护：TSM 分解按钮显示但未就绪时不提交拾取；
-- 未安装 TSM 或无该按钮时返回 false，不影响快速拾取。
function Adapter:IsDestroyButtonBlocked()
    local button = _G.TSMDestroyBtn
    if type(button) ~= "table" and type(button) ~= "userdata" then return false end
    if type(button.IsShown) ~= "function" or type(button.GetButtonState) ~= "function" then return false end
    local okShown, shown = pcall(button.IsShown, button)
    if not okShown or shown ~= true then return false end
    local okState, state = pcall(button.GetButtonState, button)
    return okState and state == "DISABLED" or false
end

function Adapter:GetBackpackFrame()
    return _G.BagsBar or _G.MainMenuBarBackpackButton
end

-- Blizzard 内置的 PTR/beta 问题反馈（PTR Issue Reporter）。只在 beta/PTR 客户端存在，
-- 普通客户端这些全局为空，调用方需要自己处理 nil。
function Adapter:GetPTRFeedbackFrame()
    return _G.PTR_IssueReporter
end

function Adapter:GetPTRFeedbackAlertFrame()
    return _G.PTRIssueReporterAlertFrame
end

-- 注册表以「面板框架」为键、registration 描述表为值；值里的按钮字段就是界面上的
-- UIPanelBugButton（截图里那个蓝色虫子按钮）。
function Adapter:GetPTRFeedbackButtons()
    local reporter = _G.PTR_IssueReporter
    local registry = reporter and reporter.RegisteredUIPanelButtons
    if type(registry) ~= "table" then return nil end
    local buttons = {}
    local _, entry
    for _, entry in pairs(registry) do
        if type(entry) == "table" and type(entry.Button) == "table" then
            buttons[#buttons + 1] = entry.Button
        end
    end
    return buttons
end

function Adapter:IsPTRFeedbackAddonLoaded()
    return self:IsAddOnLoaded("Blizzard_PTRFeedback")
end

function Adapter:GetEndCapFrames()
    local caps = _G.MainActionBar and _G.MainActionBar.EndCaps
    return caps and caps.LeftEndCap, caps and caps.RightEndCap
end

function Adapter:GetRootFrame()
    return _G.UIParent
end

function Adapter:GetTooltip()
    return _G.GameTooltip
end

function Adapter:IsShown(frame)
    return frame and type(frame.IsShown) == "function" and frame:IsShown() and true or false
end

function Adapter:Show(frame)
    return frame and type(frame.Show) == "function" and pcall(frame.Show, frame) or false
end

function Adapter:Hide(frame)
    return frame and type(frame.Hide) == "function" and pcall(frame.Hide, frame) or false
end

function Adapter:IsInInstanceParty()
    return type(_G.IsInGroup) == "function"
        and _G.IsInGroup(_G.LE_PARTY_CATEGORY_INSTANCE or 2) and true or false
end

function Adapter:Print(message)
    if type(ns.Print) == "function" then ns.Print(message) return end
    print("|cff00ff00<露露的副本助手>|r " .. tostring(message))
end

function Adapter:PerformLFGAction(action)
    if action == "leave" then
        local party = _G.C_PartyInfo
        if party and type(party.ConfirmLeaveParty) == "function" then
            return pcall(party.ConfirmLeaveParty, _G.LE_PARTY_CATEGORY_INSTANCE or 2)
        end
        return false
    end
    if action == "teleport" and type(_G.LFGTeleport) == "function"
        and type(_G.IsInInstance) == "function" then
        local ok, inInstance = pcall(_G.IsInInstance)
        if ok then return pcall(_G.LFGTeleport, inInstance) end
    end
    return false
end

function Adapter:GetFontPath()
    if ns.Font and type(ns.Font.GetInterfaceFontPath) == "function" then
        return ns.Font:GetInterfaceFontPath()
    end
    return "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
end

function Adapter:GetCompat()
    return ns.Compat
end

function Adapter:SyncSecureClick(button)
    local compat = ns.Compat
    if compat and type(compat.SyncSecureClickUseOnKeyDown) == "function" then
        return pcall(compat.SyncSecureClickUseOnKeyDown, button)
    end
    return true
end

function Adapter:GetFrameTopRightOffset(frame)
    local root = _G.UIParent
    if not frame or type(frame.GetRight) ~= "function" or type(frame.GetTop) ~= "function"
        or not root or type(root.GetRight) ~= "function" or type(root.GetTop) ~= "function" then return nil end
    local right, top, rootRight, rootTop = frame:GetRight(), frame:GetTop(), root:GetRight(), root:GetTop()
    if type(right) ~= "number" or type(top) ~= "number" or type(rootRight) ~= "number"
        or type(rootTop) ~= "number" then return nil end
    return math.floor(right - rootRight + 0.5), math.floor(top - rootTop + 0.5)
end

function Adapter:GetFrameTopOffset(frame)
    local root = _G.UIParent
    if not frame or type(frame.GetCenter) ~= "function" or type(frame.GetTop) ~= "function"
        or not root or type(root.GetCenter) ~= "function" or type(root.GetTop) ~= "function" then return nil end
    local center, top = frame:GetCenter(), frame:GetTop()
    local rootCenter, rootTop = root:GetCenter(), root:GetTop()
    if type(center) ~= "number" or type(top) ~= "number" or type(rootCenter) ~= "number"
        or type(rootTop) ~= "number" then return nil end
    return math.floor(center - rootCenter + 0.5), math.floor(top - rootTop + 0.5)
end

function Adapter:IsCelestialSupported()
    return self.features.celestialBar
end

function Adapter:GetAltPowerState(preview)
    if preview then
        return { value = 50, maximum = 100, title = "天神能量条", tooltip = "预览模式" }
    end
    if type(_G.GetUnitPowerBarInfo) ~= "function" or type(_G.GetUnitPowerBarStrings) ~= "function"
        or type(_G.UnitPower) ~= "function" or type(_G.UnitPowerMax) ~= "function" then return nil end
    local ok, barId = pcall(_G.GetUnitPowerBarInfo, "player")
    if not ok or not barId then return nil, "retry" end
    local stringsOk, name, tooltip = pcall(_G.GetUnitPowerBarStrings, "player")
    if not stringsOk then name, tooltip = nil, nil end
    local maximum = _G.UnitPowerMax("player", _G.ALTERNATE_POWER_INDEX) or 0
    if maximum <= 0 then return nil, "retry" end
    return {
        value = _G.UnitPower("player", _G.ALTERNATE_POWER_INDEX) or 0,
        maximum = maximum,
        title = type(name) == "string" and name or "天神能量条",
        tooltip = type(tooltip) == "string" and tooltip or nil,
    }
end

function Adapter:GetNativeAltPowerFrame()
    return _G.PlayerPowerBarAlt
end

function Adapter:RefreshNativeAltPower(frame)
    if type(_G.UnitPowerBarAlt_UpdateAll) ~= "function" then return false end
    return pcall(_G.UnitPowerBarAlt_UpdateAll, frame)
end

function Adapter:GetPlayerClassColor()
    if type(_G.UnitClass) ~= "function" then return nil end
    local _, class = _G.UnitClass("player")
    return _G.RAID_CLASS_COLORS and _G.RAID_CLASS_COLORS[class] or nil
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
ns.ExtraToolsClassicAdapter = Adapter

local _, RS = ...

if not RS.Build.IsFamily("retail") then return end

local function Globals(adapter)
    return adapter.globals or _G
end

local function OpenRSAClass(adapter)
    local globals = Globals(adapter)
    local addon = globals.RurutiaSA_Class
    if not (addon and type(addon.OpenMainPanel) == "function") then return false end
    local panel = globals.RSA_Class_MainPanel
    if panel and type(panel.IsShown) == "function" and panel:IsShown()
        and type(panel.Hide) == "function" then
        panel:Hide()
    else
        addon:OpenMainPanel("iconGroup")
    end
    return true
end

local function SetTrinketMove(adapter, unlocked)
    local addon = Globals(adapter).RurutiaSA_Trinkets
    local bar = addon and addon.ItemBar
    if not (bar and type(bar.SetMoveMode) == "function") then return false end
    bar.SetMoveMode(unlocked and true or false)
    return true
end

local function OpenTrinkets(adapter)
    local globals = Globals(adapter)
    local addon = globals.RurutiaSA_Trinkets
    if addon and addon.Options and type(addon.Options.Open) == "function" then
        addon.Options.Open()
        return true
    end
    if adapter:CallSlash("/rsa sp", "RSA饰品模块", "RURUTIASA") then return true end
    return false
end

local function LockDanders(adapter, argument)
    local handler = adapter.slashCommands.DANDERSFRAMES
    if type(handler) ~= "function" then return false end
    local ok = pcall(handler, argument)
    return ok and true or false
end

local function SetWarpMove(adapter, unlocked)
    local warp = Globals(adapter).WarpDeplete
    if not warp then return false end
    if unlocked and warp.state and not warp.state.inChallenge
        and not warp.state.demoModeActive and type(warp.EnableDemoMode) == "function" then
        warp:EnableDemoMode()
    end
    if type(warp.SetUnlocked) == "function" then warp:SetUnlocked(unlocked and true or false) end
    if not unlocked and warp.state and warp.state.demoModeActive
        and type(warp.DisableDemoMode) == "function" then
        warp:DisableDemoMode()
    end
    return type(warp.SetUnlocked) == "function"
end

local function OpenEditMode(adapter)
    if adapter:CallSlash("/editmode", "EditMode", "EDITMODE") then return true end
    local globals = Globals(adapter)
    local addons = globals.C_AddOns
    if addons and type(addons.LoadAddOn) == "function" then
        pcall(addons.LoadAddOn, "Blizzard_EditMode")
    elseif type(globals.LoadAddOn) == "function" then
        pcall(globals.LoadAddOn, "Blizzard_EditMode")
    end
    local frame = globals.EditModeManagerFrame
    if not frame then return false end
    if type(globals.ShowUIPanel) == "function" then globals.ShowUIPanel(frame)
    elseif type(frame.Show) == "function" then frame:Show()
    else return false end
    return true
end

local function GetEllesmereUnlockState(adapter)
    local eui = Globals(adapter).EllesmereUI
    if not eui then return false end
    if type(eui.IsUnlockModeActive) == "function" then
        local ok, active = pcall(eui.IsUnlockModeActive, eui)
        if ok then return active and true or false end
    end
    return eui._unlockModeActive and true or false
end

local function SetEllesmereMove(adapter, unlocked)
    local globals = Globals(adapter)
    local eui = globals.EllesmereUI
    if not eui then return false end
    if GetEllesmereUnlockState(adapter) == unlocked then return true end
    if unlocked and type(globals.InCombatLockdown) == "function" and globals.InCombatLockdown() then
        adapter.print("战斗中无法解锁 EllesmereUI。")
        return false
    end
    local action = unlocked and eui.OpenUnlockMode or eui.ToggleUnlockMode
    if type(action) ~= "function" then return false end
    local ok, reason = pcall(action, eui)
    if not ok then adapter.print("EllesmereUI 移动模式切换失败: " .. tostring(reason)); return false end
    -- Closing may open EllesmereUI's own save/discard confirmation. A successful
    -- handoff is enough; only opening requires an immediate active-state readback.
    return not unlocked or GetEllesmereUnlockState(adapter)
end

local function OpenEllesmere(adapter)
    local eui = Globals(adapter).EllesmereUI
    if eui and type(eui.OpenConfig) == "function" then
        local ok = pcall(eui.OpenConfig, eui)
        if ok then return true end
    end
    return adapter:CallSlash("/eui", "EllesmereUI", "EUIOPTIONS")
end

local function EnsureBigWigsPlugins(adapter)
    local globals = Globals(adapter)
    if adapter.isAddonLoaded("BigWigs_Plugins") then return true end
    local addons = globals.C_AddOns
    local loader = addons and addons.LoadAddOn or globals.LoadAddOn
    if type(loader) ~= "function" then return false end
    local ok, loaded = pcall(loader, "BigWigs_Plugins")
    return ok and loaded ~= false and adapter.isAddonLoaded("BigWigs_Plugins")
end

local function SetBigWigsMove(adapter, mode, unlocked)
    if not EnsureBigWigsPlugins(adapter) then return false end
    local bigWigs = Globals(adapter).BigWigs
    if not (bigWigs and type(bigWigs.Enable) == "function" and type(bigWigs.SendMessage) == "function") then
        return false
    end
    local enabled, reason = pcall(bigWigs.Enable, bigWigs)
    if not enabled then adapter.print("BigWigs 核心启用失败: " .. tostring(reason)); return false end
    local message = unlocked and "BigWigs_StartConfigureMode" or "BigWigs_StopConfigureMode"
    local ok, failure = pcall(bigWigs.SendMessage, bigWigs, message, mode)
    if not ok then adapter.print("BigWigs 移动模式切换失败: " .. tostring(failure)); return false end
    return true
end

local function GetAPIMoveState(adapter, apiName)
    local api = Globals(adapter)[apiName]
    return api and type(api.IsMoveMode) == "function" and api.IsMoveMode() == true or false
end

local function SetAPIMove(adapter, apiName, label, unlocked)
    local globals = Globals(adapter)
    local api = globals[apiName]
    if not (api and type(api.SetMoveMode) == "function" and type(api.IsMoveMode) == "function") then
        adapter.print("请更新" .. label .. "后再使用移动管理。")
        return false
    end
    if type(globals.InCombatLockdown) == "function" and globals.InCombatLockdown() then
        adapter.print("战斗中无法切换" .. label .. "移动状态，请脱战后重试。")
        return false
    end
    local ok, result = pcall(api.SetMoveMode, unlocked)
    local readOK, state = pcall(GetAPIMoveState, adapter, apiName)
    if not ok or result ~= true or not readOK or state ~= unlocked then
        adapter.print(label .. "移动操作失败，请脱战后重试。")
        return false
    end
    return true
end

local function SubscribeAPIMove(adapter, apiName, owner, callback)
    local api = Globals(adapter)[apiName]
    if not (api and type(api.RegisterMoveModeCallback) == "function"
        and type(api.UnregisterMoveModeCallback) == "function") then return nil end
    local active = true
    local function Stop()
        active = false
        pcall(api.UnregisterMoveModeCallback, owner)
    end
    local ok, result = pcall(api.RegisterMoveModeCallback, owner, function()
        if active then callback() end
    end)
    if not ok or result == false then Stop(); return nil end
    return Stop
end

local function PowerBarName()
    return RS.PowerBarIntegration and RS.PowerBarIntegration:GetDisplayName() or "露露的资源条"
end

local function KiraNamespace(adapter)
    local plugin = Globals(adapter).KiraUIPlugin
    return type(plugin) == "table" and type(plugin.__ns) == "table" and plugin.__ns or nil
end

local function GetKiraMoveState(adapter)
    local namespace = KiraNamespace(adapter)
    return namespace and type(namespace.EditModeActive) == "function" and namespace.EditModeActive() == true or false
end

local function SetKiraMove(adapter, unlocked)
    local globals = Globals(adapter)
    if type(globals.InCombatLockdown) == "function" and globals.InCombatLockdown() then return false end
    local namespace = KiraNamespace(adapter)
    if not namespace then return false end
    -- Load the official options once on explicit use. Calling ToggleEditMode
    -- before this load would queue a toggle and make immediate readback untrue.
    if type(namespace.EditModeActive) ~= "function" or type(namespace.EditModeToggle) ~= "function" then
        if not unlocked then return false end
        local loader = globals.C_AddOns and globals.C_AddOns.LoadAddOn or globals.LoadAddOn
        if type(loader) ~= "function" then return false end
        local ok, loaded = pcall(loader, "KiraUI-Plugin_Options")
        if not ok or not loaded then return false end
        namespace = KiraNamespace(adapter)
    end
    if not namespace or type(namespace.EditModeActive) ~= "function"
        or type(namespace.EditModeToggle) ~= "function" then return false end
    local readOK, active = pcall(GetKiraMoveState, adapter)
    if not readOK then return false end
    if active == unlocked then return true end
    local ok, result = pcall(namespace.EditModeToggle)
    if not ok or result == false then return false end
    readOK, active = pcall(GetKiraMoveState, adapter)
    -- Kira may show its own save/discard prompt when closing a dirty edit.
    -- Keep that decision with the player; getState continues to report active.
    return readOK and (not unlocked or active == true)
end

local providers = {
    {
        id = "rtl", addon = "Rurutia_Timeline", name = "RTL时间轴", buttonLabel = "RTL",
        canMove = true, getState = function(adapter) return GetAPIMoveState(adapter, "RurutiaTimelineAPI") end,
        subscribe = function(adapter, owner, callback) return SubscribeAPIMove(adapter, "RurutiaTimelineAPI", owner, callback) end,
        unlock = function(adapter) return SetAPIMove(adapter, "RurutiaTimelineAPI", "RTL时间轴", true) end,
        lock = function(adapter) return SetAPIMove(adapter, "RurutiaTimelineAPI", "RTL时间轴", false) end,
        openLabel = "RTL设置", openSettings = function(adapter)
            return adapter:CallSlash("/rtl", "RTL时间轴", "RURUTIATIMELINE")
        end,
    },
    {
        id = "rsa-class", addon = "RurutiaSA_Class", name = "职业模块",
        buttonLabel = "职业模块", macro = "/rsam", directKey = "RURUTIASAMOVE",
        openLabel = "打开职业模块", openSettings = OpenRSAClass, canMove = true,
    },
    {
        id = "rsa-trinkets", addon = "RurutiaSA_Trinkets", name = "饰品模块",
        buttonLabel = "饰品", stateKey = "RurutiaSA_Trinkets", canMove = true,
        unlock = function(adapter) return SetTrinketMove(adapter, true) end,
        lock = function(adapter) return SetTrinketMove(adapter, false) end,
        openLabel = "打开饰品模块", openSettings = OpenTrinkets,
    },
    {
        id = "ndui", addon = "NDui", name = "NDui", buttonLabel = "NDui",
        macro = "/mm", directKey = "NDUI_MOVER", openLabel = "打开NDui",
        canMove = true, lockKind = "ndui",
        openSettings = function(adapter) return RS.OpenRetailNDuiSettings(Globals(adapter), adapter.print) end,
    },
    {
        id = "ellesmereui", addon = "EllesmereUI", name = "EllesmereUI", buttonLabel = "EllesUI",
        stateKey = "EllesmereUI", canMove = true,
        unlock = function(adapter) return SetEllesmereMove(adapter, true) end,
        lock = function(adapter) return SetEllesmereMove(adapter, false) end,
        openLabel = "打开EllesUI", openSettings = OpenEllesmere,
    },
    {
        id = "kiraui", addon = "KiraUI-Plugin", name = "KiraUI", buttonLabel = "KiraUI",
        canMove = true, getState = GetKiraMoveState,
        unlock = function(adapter) return SetKiraMove(adapter, true) end,
        lock = function(adapter) return SetKiraMove(adapter, false) end,
        openLabel = "KiraUI设置", openSettings = function(adapter)
            local plugin = Globals(adapter).KiraUIPlugin
            if not plugin or type(plugin.OpenConfig) ~= "function" then return false end
            local ok, result = pcall(plugin.OpenConfig)
            return ok and result ~= false
        end,
    },
    {
        id = "elvui", addon = "ElvUI", name = "ElvUI", buttonLabel = "ElvUI",
        macro = "/emove", directKey = "ACECONSOLE_EMOVE", openLabel = "打开ElvUI",
        canMove = true, settingsKind = "elvui",
    },
    {
        id = "exwind", addon = "ExwindCore", name = "EX工具箱", buttonLabel = "EX工具箱",
        macro = "/ex edmode", directKey = "EX", canMove = true,
        openLabel = "打开EX工具箱",
        openSettings = function(adapter)
            local tools = Globals(adapter).ExwindTools
            if not (tools and type(tools.OpenConfig) == "function") then return false end
            tools:OpenConfig()
            return true
        end,
    },
    {
        id = "danders-party", addon = "DandersFrames", name = "DF队伍框", buttonLabel = "队伍",
        stateKey = "DandersFrames_party", macro = "/df unlock", directKey = "DANDERSFRAMES",
        canMove = true, lock = function(adapter) return LockDanders(adapter, "lock") end,
        openLabel = "打开团框设置",
        openSettings = function(adapter)
            local frames = Globals(adapter).DandersFrames
            if not (frames and type(frames.ToggleGUI) == "function") then return false end
            frames:ToggleGUI()
            return true
        end,
    },
    {
        id = "danders-raid", addon = "DandersFrames", name = "DF团队框", buttonLabel = "团框",
        stateKey = "DandersFrames_raid", macro = "/df unlockraid", directKey = "DANDERSFRAMES",
        canMove = true, lock = function(adapter) return LockDanders(adapter, "lockraid") end,
    },
    {
        id = "warpdeplete", addon = "WarpDeplete", name = "大秘计时", buttonLabel = "大秘计时",
        stateKey = "WarpDeplete", canMove = true,
        unlock = function(adapter) return SetWarpMove(adapter, true) end,
        lock = function(adapter) return SetWarpMove(adapter, false) end,
        openLabel = "打开大秘计时",
        openSettings = function(adapter)
            local globals = Globals(adapter)
            local warp = globals.WarpDeplete
            if warp and type(warp.HandleChatCommand) == "function" then
                warp:HandleChatCommand("")
                return true
            end
            local settings = globals.Settings
            if warp and settings and type(settings.OpenToCategory) == "function" and warp.categoryID then
                settings.OpenToCategory(warp.categoryID)
                return true
            end
            return false
        end,
    },
    {
        id = "bigwigs-messages", addon = "BigWigs", name = "BigWigs信息", buttonLabel = "BW信息",
        stateKey = "BigWigs_Messages", canMove = true, includeInAll = false,
        unlock = function(adapter) return SetBigWigsMove(adapter, "Messages", true) end,
        lock = function(adapter) return SetBigWigsMove(adapter, "Messages", false) end,
        openLabel = "打开BigWigs", openSettings = function(adapter)
            return adapter:CallSlash("/bw", "BigWigs", "BigWigs")
        end,
    },
    {
        id = "bigwigs-bars", addon = "BigWigs", name = "BigWigs计时条", buttonLabel = "BW计时条",
        stateKey = "BigWigs_Bars", canMove = true, includeInAll = false,
        unlock = function(adapter) return SetBigWigsMove(adapter, "Bars", true) end,
        lock = function(adapter) return SetBigWigsMove(adapter, "Bars", false) end,
    },
    {
        id = "bigwigs-auras", addon = "BigWigs", name = "BigWigs光环", buttonLabel = "BW光环",
        stateKey = "BigWigs_Auras", canMove = true, includeInAll = false,
        unlock = function(adapter) return SetBigWigsMove(adapter, "Auras", true) end,
        lock = function(adapter) return SetBigWigsMove(adapter, "Auras", false) end,
    },
    {
        id = "editmode", name = "暴雪编辑模式", actionLabel = "解锁编辑模式",
        check = function() return true end, action = OpenEditMode,
    },
    {
        id = "exboss", addon = "EXBoss", name = "副本模块", openLabel = "打开副本模块",
        openSettings = function(adapter)
            local boss = Globals(adapter).ExBoss
            local toggle = boss and boss.UI and boss.UI.Panel and boss.UI.Panel.Toggle
            if type(toggle) ~= "function" then return false end
            toggle(boss.UI.Panel)
            return true
        end,
    },
    {
        id = "cooldown-viewer", name = "冷却管理器", openLabel = "冷却管理器",
        check = function(adapter) return Globals(adapter).CooldownViewerSettings ~= nil end,
        openSettings = function(adapter)
            local frame = Globals(adapter).CooldownViewerSettings
            if not frame then return false end
            if type(frame.IsShown) == "function" and frame:IsShown() then frame:Hide() else frame:Show() end
            return true
        end,
    },
    {
        id = "rsac", addon = "RurutiaSA_Combat", name = "RSA副本模块", openLabel = "打开副本模块",
        openSettings = function(adapter)
            local globals = Globals(adapter)
            local ui = globals.RSAC and globals.RSAC.ConfigUI
            if ui and type(ui.Toggle) == "function" then ui:Toggle(); return true end
            if ui and type(ui.Show) == "function" then ui:Show(); return true end
            return adapter:CallSlash("/rsac", "RSA副本模块", "RSAC")
        end,
    },
    {
        id = "simple-cursor", addon = "Rurutia_SimpleCursor", name = "鼠标圆圈显示",
        openLabel = "鼠标圆圈显示",
        openSettings = function(adapter) return adapter:CallSlash("/rsc", "鼠标圆圈显示", "RSC") end,
    },
    {
        id = "rpb", addon = "Rurutia_PowerBar", name = PowerBarName(), buttonLabel = "资源条",
        canMove = true, getState = function(adapter) return GetAPIMoveState(adapter, "RurutiaPowerBarAPI") end,
        subscribe = function(adapter, owner, callback) return SubscribeAPIMove(adapter, "RurutiaPowerBarAPI", owner, callback) end,
        unlock = function(adapter) return SetAPIMove(adapter, "RurutiaPowerBarAPI", "资源条", true) end,
        lock = function(adapter) return SetAPIMove(adapter, "RurutiaPowerBarAPI", "资源条", false) end,
        openLabel = "资源条设置", openSettings = function(adapter)
            return adapter:CallSlash("/rpb", PowerBarName(), "RURUTIAPOWERBAR")
        end,
    },
}

local index = 1
while index <= #providers do
    RS:RegisterExternalMoveProvider(providers[index])
    index = index + 1
end

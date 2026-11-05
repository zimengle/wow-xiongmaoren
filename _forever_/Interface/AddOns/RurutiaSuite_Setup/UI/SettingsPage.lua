local _, ns = ...

local SettingsPage = {}
ns.SettingsPage = SettingsPage
local UpdateCooldownView
local LoadCooldownDetail
local ACTION_HEIGHT = 38

local function IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() == true
end

local SIDE_TEXT = {
    middle = "露露-中布局",
    left = "露露-左布局",
    right = "露露-右布局",
    mixed = "状态不一致",
    unknown = "状态未知",
}

local PRESET_TEXT = {
    all = "一键导入",
    em = "编辑模式",
    blizzard = "暴雪设置",
    rxp = "RXP 外观",
    cd = "冷却管理器",
    sensei = "常规资源条",
    jx = "酒仙酒池条",
    at = "AT时间轴",
    exwind = "EXWindTools",
    bigwigs = "BigWigs",
    exboss = "EXBoss",
    canvasEdge = "边缘修正",
}

local PRESET_ADDONS = {
    rxp = "RXPGuides",
    sensei = "SenseiClassResourceBar",
    jx = "SenseiClassResourceBar",
    at = "AbilityTimeline",
    exwind = "ExwindTools",
    bigwigs = "BigWigs",
    exboss = { "EXBoss", "EXBOSS-RURUTIA" },
}

local REASON_TEXT = {
    ["not_ready"] = "当前客户端的预设数据与布局适配尚未验证，暂不可安装或切换",
    ["unsupported-on-current-build"] = "当前客户端不支持此功能",
    ["ADDON_NOT_LOADED"] = "目标插件未安装或未启用",
    ["addon-not-loaded"] = "目标插件未安装或未启用",
    ["IN_COMBAT"] = "战斗中不能执行",
    ["combat-lockdown"] = "战斗中不能执行",
    ["IMPORTER_UNAVAILABLE"] = "导入器不可用",
    ["rxp-style-readback-failed"] = "RXP 外观回读失败，已尝试恢复原设置，请重载后检查",
    ["API_UNAVAILABLE"] = "目标插件版本不支持导入",
    ["codec-unavailable"] = "目标插件编解码能力不可用",
    ["unsupported-import-api"] = "目标插件版本不支持导入",
    ["IMPORT_PENDING"] = "此项正在等待确认，请先完成目标插件的提示",
}

local function TranslateReason(reason)
    reason = tostring(reason or "未知错误")
    return REASON_TEXT[reason] or reason
end

-- Visibility is based on loaded addons only; never load providers while rendering.
local function IsAddonAvailable(name)
    local addons = _G.C_AddOns
    local callback = type(addons) == "table" and addons.IsAddOnLoaded or nil
    if type(callback) ~= "function" then callback = _G.IsAddOnLoaded end
    if type(callback) ~= "function" then return false end
    local ok, loaded = pcall(callback, name)
    return ok and loaded == true
end

local function DependenciesLoaded(dependencies)
    if type(dependencies) == "string" then return IsAddonAvailable(dependencies) end
    for _, name in ipairs(dependencies or {}) do
        if not IsAddonAvailable(name) then return false end
    end
    return true
end

local OPTION_ADDONS = {
    sensei = "SenseiClassResourceBar",
    exboss = PRESET_ADDONS.exboss,
    danders = "DandersFrames",
    edge = "EllesmereUI",
    ellesQuickSignup = "EllesmereUI",
}

local function OptionVisible(key)
    if key == "uiLayout" then
        for _, name in ipairs({ "EllesmereUI", "ElvUI", "NDui", "DandersFrames" }) do
            if IsAddonAvailable(name) then return true end
        end
        return false
    end
    if key == "automation" then
        return DependenciesLoaded(OPTION_ADDONS.sensei) or DependenciesLoaded(OPTION_ADDONS.exboss)
            or DependenciesLoaded(OPTION_ADDONS.danders)
    end
    return DependenciesLoaded(OPTION_ADDONS[key])
end

local function HasMethods(target, ...)
    if type(target) ~= "table" then return false end
    for index = 1, select("#", ...) do
        if type(target[select(index, ...)]) ~= "function" then return false end
    end
    return true
end

local function OptionEnabled(key)
    if not OptionVisible(key) then return false end
    if key == "sensei" then
        return HasMethods(_G.SCRB, "exportProfileAsString", "importProfileFromString", "getCurrentProfileName")
    elseif key == "danders" then
        local switcher = ns.ProfileSwitcher
        if not HasMethods(switcher, "Inspect") then return false end
        local ok, status = switcher:Inspect()
        return ok and type(status) == "table"
            and (status.provider == "elvui" or status.provider == "ndui" or status.provider == "danders")
            and HasMethods(_G.DandersFrames, "SetProfile")
            and type(_G.DandersFramesDB_v2) == "table" and type(_G.DandersFramesDB_v2.profiles) == "table"
    elseif key == "exboss" then
        local addon = _G.ExBoss
        local voice = type(addon) == "table" and addon.Voice
        local engine = type(voice) == "table" and voice.Engine
        local registry = type(voice) == "table" and voice.PackRegistry
        local db = _G.EXBOSS12S2
        return HasMethods(registry, "GetPack")
            and HasMethods(engine, "InvalidateLabelCache", "ApplyEventOverridesToAPI")
            and type(db) == "table" and type(db.voice) == "table" and type(db.voice.global) == "table"
    elseif key == "edge" then
        return HasMethods(ns.EllesmereEdgeCorrection, "Plan", "Apply") and not IsInCombat()
    end
    return false
end

local function PresetVisible(command)
    return ns.ProductManifest:HasPreset(command) and DependenciesLoaded(PRESET_ADDONS[command])
end

local function PresetEnabled(command)
    local service = ns.PresetCommandService
    if not PresetVisible(command) or not HasMethods(service, "IsSupported")
        or not service:IsSupported(command) or IsInCombat() then return false end
    if command == "all" or command == "em" or command == "cd" or command == "blizzard" then return true end
    if command == "rxp" then
        return HasMethods(ns.RXPStyleImporter, "IsAvailable") and ns.RXPStyleImporter:IsAvailable()
    end
    if command == "sensei" or command == "jx" then
        local importer = ns.LegacyPresetImports and ns.LegacyPresetImports[command]
        return HasMethods(importer, "CanImport") and importer:CanImport()
    elseif command == "exboss" then
        local api = _G.EXBOSSRurutiaPresetAPI
        local catalog = ns.LegacyPresetImports and ns.LegacyPresetImports.Catalog
        catalog = catalog and catalog.exboss
        return HasMethods(api, "Install", "ShowInstaller")
            and tonumber(api.API_VERSION) ~= nil and type(catalog) == "table"
            and tonumber(api.API_VERSION) >= (tonumber(catalog.requiredAPIVersion) or math.huge)
    elseif command == "bigwigs" then
        return HasMethods(_G.BigWigsAPI, "RegisterProfile", "ImportBossOptions")
    elseif command == "exwind" then
        local db = _G.EXTOOLS12S2
        return type(db) == "table" and tonumber(db.DBVersion) == 1
            and type(db.ModuleDB) == "table" and type(db.LoadByKey) == "table"
    elseif command == "at" then
        local integration = ns.Integrations and ns.Integrations.AbilityTimeline
        if not HasMethods(integration, "GetDatabase") or type(_G.LibStub) ~= "table" then return false end
        -- Probe only the registered libraries; GetDatabase may create saved data.
        local aceOK, ace = pcall(_G.LibStub, "AceDB-3.0", true)
        local deflateOK, deflate = pcall(_G.LibStub, "LibDeflate", true)
        local serializeOK, serialize = pcall(_G.LibStub, "LibSerialize", true)
        return aceOK and deflateOK and serializeOK and HasMethods(ace, "New")
            and HasMethods(deflate, "DecodeForPrint", "DecompressDeflateWithLimit")
            and HasMethods(serialize, "Deserialize")
    end
    return false
end

local function ProfileStatus()
    local ready, reason = ns.ProductManifest:Check("layoutSwitch")
    if not ready then return { side="unknown", provider="not_ready", message=TranslateReason(reason) } end
    local inspected, status = ns.ProfileSwitcher:Inspect()
    if not inspected then
        return {
            side = "unknown",
            provider = "未识别",
            message = "布局状态未知：" .. TranslateReason(status),
        }
    end
    local side = status.side or "unknown"
    return {
        side = side,
        provider = status.provider or "未识别",
        message = string.format("当前：%s（%s）", SIDE_TEXT[side] or side,
            status.provider or "未识别"),
    }
end

local function CanSwitchLayout()
    if not ns.ProductManifest:Check("layoutSwitch") then return false end
    if ns.ProductManifest:Check("infinitePreset") then
        local ok, status = ns.ProfileSwitcher:Inspect()
        return ok and status.provider == "ellesmere"
    end
    return true
end

local function GetHostUI()
    local host = _G.RurutiaSuite
    return type(host) == "table" and host.UI or nil
end

local function GetAutomation()
    return ns.DB and ns.DB.global and ns.DB.global.automation
end

local function GetGameMenu()
    return ns.DB and ns.DB.global and ns.DB.global.gameMenu
end

local function CallMethod(target, methodName, ...)
    local method = type(target) == "table" and target[methodName] or nil
    if type(method) ~= "function" then return false, "SERVICE_UNAVAILABLE" end
    local called, ok, reason = pcall(method, target, ...)
    if not called then return false, "CALL_FAILED" end
    if ok == false then return false, reason or "CALL_FAILED" end
    return true, reason
end

local function FailureText(reason)
    if type(reason) == "table" and type(reason.failures) == "table" then
        local names = {}
        for name in pairs(reason.failures) do names[#names + 1] = name end
        table.sort(names)
        if #names > 0 then
            local name = names[1]
            return name .. ": " .. tostring(reason.failures[name])
        end
    end
    return tostring(reason or "CALL_FAILED")
end

local function SetAutomation(key, value, context)
    local ready, reason = ns.ProductManifest:Check((key == "editModeLayout" or key == "enabled") and "editModeActivation" or "automation")
    if not ready then return false, reason end
    local settings = GetAutomation()
    if not settings then return false end
    local previous = rawget(settings, key)
    local wanted = value and true or false
    rawset(settings, key, wanted)
    local owner
    local applied, reason = true, nil
    if key == "enabled" then
        applied, reason = CallMethod(ns.EditModeActivator, "RefreshSubscriptions")
        if applied and ns.ProductManifest:Has("automation") then
            applied, reason = CallMethod(ns.AutomationCoordinator, "RefreshSubscriptions")
        end
    elseif key == "editModeLayout" and ns.EditModeActivator then
        owner = ns.EditModeActivator
        applied, reason = CallMethod(owner, "RefreshSubscriptions")
        if applied and wanted then applied, reason = CallMethod(owner, "ActivateOnly") end
    else
        owner = ns.AutomationCoordinator
        applied, reason = CallMethod(owner, "RefreshSubscriptions")
        if applied then applied, reason = CallMethod(owner, "ApplySetting", key) end
    end
    if not applied then
        rawset(settings, key, previous)
        if key == "enabled" then
            CallMethod(ns.EditModeActivator, "RefreshSubscriptions")
            if ns.ProductManifest:Has("automation") then CallMethod(ns.AutomationCoordinator, "RefreshSubscriptions") end
        else CallMethod(owner, "RefreshSubscriptions") end
        SettingsPage:Refresh(context, "自动化设置更新失败：" .. FailureText(reason))
        return false, reason
    end
    local pending = type(reason) == "table" and reason.pending == true
    SettingsPage:Refresh(context, pending and "自动化设置已保存，脱战后应用。" or "自动化设置已更新。")
    return true
end

function SettingsPage:ResetAutomation(context)
    local ready, reason = ns.ProductManifest:Check("automation")
    local editOnly = not ready and ns.ProductManifest:Check("editModeActivation")
    if editOnly then ready = true end
    if not ready then return false, reason end
    local settings = GetAutomation()
    local defaults = ns.Defaults and ns.Defaults.global and ns.Defaults.global.automation
    if not settings or not defaults then return false, "自动化设置尚未就绪" end
    local previous = {}
    for key, value in pairs(defaults) do
        if not editOnly or key == "editModeLayout" or key == "enabled" then
        previous[key] = { value = rawget(settings, key) }
        rawset(settings, key, value)
        end
    end
    local ok, why = CallMethod(ns.EditModeActivator, "RefreshSubscriptions")
    if ok and not editOnly then ok, why = CallMethod(ns.AutomationCoordinator, "RefreshSubscriptions") end
    if not ok then
        for key, saved in pairs(previous) do rawset(settings, key, saved.value) end
        CallMethod(ns.EditModeActivator, "RefreshSubscriptions")
        if not editOnly then CallMethod(ns.AutomationCoordinator, "RefreshSubscriptions") end
        self:Refresh(context, "恢复默认失败：" .. FailureText(why))
        return false, why
    end
    self:Refresh(context, "自动化开关已恢复默认；登录或切专精时按设置执行。")
    return true
end

local function SetGameMenu(value, context)
    local settings = GetGameMenu()
    if not settings then return false end
    settings.enabled = value and true or false
    if ns.GameMenuService then ns.GameMenuService:Refresh() end
    SettingsPage:Refresh(context, "ESC 工具箱入口已更新。")
    return true
end

local function FormatPresetResult(command, ok, result)
    if command == "all" and type(result) == "table" then
        local completed = 0
        local skipped = 0
        local failed = 0
        local failedNames = {}
        local name
        local order = {}
        for _, item in ipairs(result.order or {}) do order[#order + 1] = item end
        if result.edgeCorrectionAttempted then order[#order + 1] = "canvasEdge" end
        for _, name in ipairs(order) do
            if result.results and result.results[name] then
                if result.results[name].skipped then skipped = skipped + 1
                else completed = completed + 1 end
            end
            if result.failures and result.failures[name] then
                failed = failed + 1
                failedNames[#failedNames + 1] = PRESET_TEXT[name] or name
            end
        end
        local message = string.format("整套预设已处理：%d 项完成，%d 项未完成。", completed, failed)
        if skipped > 0 then message = message .. string.format(" %d 项跳过。", skipped) end
        if #failedNames > 0 then message = message .. " 未完成：" .. table.concat(failedNames, "、") .. "。" end
        if result.reloadRequired then message = message .. " 正在重载，战斗中将在脱战后重载。" end
        return message
    end
    if not ok then
        return (PRESET_TEXT[command] or command) .. "导入失败：" .. TranslateReason(result)
    end
    local changed = type(result) == "table" and result.changed == true
    if type(result) == "table" and result.pending == true then
        return (PRESET_TEXT[command] or command) .. "导入已启动，请按目标插件提示确认。"
    end
    local message = (changed and "已导入：" or "无需重复导入：")
        .. (PRESET_TEXT[command] or command) .. "。"
    if type(result) == "table" and result.reloadRequired then
        message = message .. " 正在重载，战斗中将在脱战后重载。"
    end
    return message
end

local function UpdateLayoutSelection(view)
    local page = view and view.page
    if not page then return end
    for key, side in pairs({ layoutLeft = "left", layoutMiddle = "middle", layoutRight = "right" }) do
        local button = page:GetControl(key)
        if button and type(button.SetSelected) == "function" then
            button:SetSelected(view.profileStatus.side == side)
        end
    end
    for index = 1, 4 do
        local button = page:GetControl("cooldownDifferenceSpec" .. index)
        local spec = view.cooldownSpecs and view.cooldownSpecs[index]
        if button and type(button.SetSelected) == "function" then
            button:SetSelected(spec ~= nil and view.selectedCooldownSpec == spec.name)
        end
    end
end

function SettingsPage:Refresh(context, message)
    local view = context and context.rssSetup
    if type(view) ~= "table" then return false end
    if type(UpdateCooldownView) == "function" then UpdateCooldownView(view) end
    if view.showCooldownDetails and view.selectedCooldownSpec
        and not view.cooldownDetail and not view.cooldownDetailError then
        LoadCooldownDetail(view, view.selectedCooldownSpec)
    end
    view.profileStatus = ProfileStatus()
    if message ~= nil then view.message = message end
    local page = view.page
    if page and type(page.Refresh) == "function" and not view.refreshing then
        view.refreshing = true
        local ok, reason = pcall(page.Refresh, page, "rss-refresh")
        view.refreshing = false
        if not ok then return false, tostring(reason) end
    end
    UpdateLayoutSelection(view)
    return true
end

local function SwitchResultText(result)
    local message = result.reloadRequired and "布局已更新，正在重载，战斗中将在脱战后重载。" or "布局已切换。"
    local edge = result.edgeCorrection
    if type(edge) == "table" then
        if edge.pending then message = message .. " 正在修正边缘位置。"
        elseif edge.status == "applied" then message = message .. " 已贴边，可撤销本次修改。"
        elseif edge.status == "unchanged" then message = message .. " 边缘位置无需调整。"
        elseif edge.status == "failed" then message = message .. " 贴边失败：" .. TranslateReason(edge.reason)
        elseif edge.status == "cancelled" then message = message .. " 本次自动贴边已取消。"
        elseif edge.status == "reload-required" then message = message .. " 请重载后手动贴边。" end
    end
    if result.layoutIntegration and result.layoutIntegration.partial then
        message = message .. " 部分侧面组或距离监控联动未完成，请检查目标插件。"
    end
    return message
end

function SettingsPage:SwitchSide(context, side)
    local originalView = context and context.rssSetup
    -- A newer click, a hidden page or a rebuilt view must not receive old results.
    local request = {}
    if originalView then originalView.edgeRequest = request end
    local switched, result = ns.Commands:SwitchSide(side, function(detail)
        if originalView and context.rssSetup == originalView and originalView.active
            and originalView.edgeRequest == request then
            self:Refresh(context, SwitchResultText(detail))
        end
    end)
    if not switched then
        self:Refresh(context, "切换失败：" .. TranslateReason(result))
        return false, result
    end
    self:Refresh(context, SwitchResultText(result))
    return true, result
end

local function CancelEdgeSwitch(context)
    local view = context and context.rssSetup
    if view then view.edgeRequest = nil end
    if HasMethods(ns.Commands, "CancelEdgeSwitch") then ns.Commands:CancelEdgeSwitch() end
end

function SettingsPage:RecalculateCanvasAndEdge(context, quiet)
    CancelEdgeSwitch(context)
    local ready, reason = ns.ProductManifest:Check("canvasEdge")
    if not ready then return false, reason end
    local engine = ns.EllesmereEdgeCorrection
    if not HasMethods(engine, "Plan", "Apply") then
        local reason = "边缘修正模块不可用"
        if not quiet then self:Refresh(context, "边缘修正失败：" .. reason) end
        return false, reason
    end
    local preview, planReason = engine:Plan()
    if not preview then
        if not quiet then self:Refresh(context, "边缘修正失败：" .. tostring(planReason)) end
        return false, planReason
    end
    local result, applyReason = engine:Apply(preview)
    if not quiet then
        self:Refresh(context, result and
            (result.changed and "当前布局已贴边，可撤销本次修改。" or "当前布局无需调整。")
            or "边缘修正失败：" .. tostring(applyReason))
    end
    return result ~= nil, result or applyReason
end

function SettingsPage:RunPreset(context, command, canvasId)
    local service = ns.PresetCommandService
    if type(service) ~= "table" or type(service.Run) ~= "function" then
        local reason = "IMPORTER_UNAVAILABLE"
        self:Refresh(context, FormatPresetResult(command, false, reason))
        return false, reason
    end
    local originalView = context and context.rssSetup
    local completed = false
    local ok, result = service:Run(command, {
        canvasId = canvasId,
        onComplete = function(success, detail)
            completed = true
            -- A provider may finish after this page was closed and rebuilt.
            if originalView and context.rssSetup == originalView then
                self:Refresh(context, FormatPresetResult(command, success, detail))
            end
        end,
    })
    local cooldownImported = command == "cd" and ok
        or command == "all" and type(result) == "table" and result.results and result.results.cd
    if cooldownImported and ns.HealthCheckService then
        ns.HealthCheckService:Run(true)
    end
    if not completed then self:Refresh(context, FormatPresetResult(command, ok, result)) end
    return ok, result
end

function SettingsPage:RunHealthCheck(context)
    local view = context and context.rssSetup
    if view then view.cooldownDetail, view.cooldownDetailError = nil, nil end
    local service = ns.HealthCheckService
    if type(service) ~= "table" or type(service.Run) ~= "function" then
        if view then view.healthError = "检查功能暂时不可用，请重载界面后重试。" end
        if view then view.cooldownDetailError = view.healthError end
        self:Refresh(context, "")
        return false, "安装检查检查不可用"
    end
    local snapshot, reason = service:Run(true)
    if view then
        UpdateCooldownView(view)
        view.healthError = not snapshot and (reason == "combat"
            and "战斗中暂停检查，请脱战后重新检查。"
            or "本次检查未完成，请重试或重载界面。") or nil
        view.cooldownDetailError = view.healthError
        for _, pending in ipairs(snapshot and snapshot.pending or {}) do
            if pending.category == "cooldown" then
                view.cooldownDetailError = "冷却管理器检查尚未完成，请稍后重新检查。"
            end
        end
    end
    if view then view.healthCheckedManually = snapshot ~= nil end
    self:Refresh(context, "")
    local pending = snapshot and type(snapshot.pending) == "table" and #snapshot.pending or 0
    return snapshot ~= nil and pending == 0, snapshot or reason
end

local HEALTH_CATEGORY_TEXT = {
    critical = "RS/RSS版本", editMode = "编辑模式", uiLayout = "界面布局",
    cooldown = "冷却管理器", sensei = "常规资源条", automation = "自动化依赖",
    activation = "预设使用状态", ellesQuickSignup = "Elles快速申请",
}

local function HealthStatusText(view)
    if view.healthError then return view.healthError end
    local service = ns.HealthCheckService
    local snapshot = service and service:GetSnapshot() or {}
    local issues, pending = snapshot.issues or {}, snapshot.pending or {}
    local lines = {}
    if #issues > 0 then
        local titles = {}
        for index = 1, math.min(4, #issues) do titles[#titles + 1] = issues[index].title end
        lines[#lines + 1] = "发现 " .. #issues .. " 项：" .. table.concat(titles, "、")
    end
    if #pending > 0 then
        local labels, seen = {}, {}
        for _, item in ipairs(pending) do
            local label = HEALTH_CATEGORY_TEXT[item.category] or "其他项目"
            if not seen[label] then labels[#labels + 1] = label; seen[label] = true end
        end
        lines[#lines + 1] = "待检查：" .. table.concat(labels, "、")
    elseif #issues == 0 then
        lines[#lines + 1] = snapshot.checkedAt and "|cff00ff00检查通过|r" or "状态：待检查"
    end
    if view.healthCheckedManually then lines[1] = "重新检查完成：" .. (lines[1] or "") end
    return table.concat(lines, "\n")
end

local function GetCooldownIssue()
    local service = ns.HealthCheckService
    local snapshot = type(service) == "table" and type(service.GetSnapshot) == "function"
        and service:GetSnapshot() or nil
    local _, issue
    for _, issue in ipairs(snapshot and snapshot.issues or {}) do
        if issue.category == "cooldown" then return issue, snapshot end
    end
    return nil, snapshot
end

local function GetProblemSpecs(issue)
    local result = {}
    local _, spec
    for _, spec in ipairs(issue and issue.data and issue.data.specs or {}) do
        if spec.status == "missing" or spec.status == "different" then result[#result + 1] = spec end
    end
    table.sort(result, function(left, right) return tostring(left.displayName) < tostring(right.displayName) end)
    return result
end

UpdateCooldownView = function(view)
    if not ns.ProductManifest:HasHealthCategory("cooldown") then return end
    local issue = GetCooldownIssue()
    local fingerprint = issue and issue.fingerprint or nil
    if view.cooldownIssueFingerprint ~= fingerprint then
        view.cooldownIssueFingerprint = fingerprint
        view.cooldownDetail = nil
        view.cooldownDetailError = nil
    end
    view.cooldownIssue = issue
    view.cooldownSpecs = GetProblemSpecs(issue)
    local selectedExists = false
    for _, spec in ipairs(view.cooldownSpecs) do
        if spec.name == view.selectedCooldownSpec then selectedExists = true end
    end
    if not selectedExists then
        view.selectedCooldownSpec = nil
        view.cooldownDetail = nil
    end
    if not view.selectedCooldownSpec and view.cooldownSpecs[1] then
        view.selectedCooldownSpec = view.cooldownSpecs[1].name
    end
    return issue
end

local function FormatCooldownSummary(view)
    local issue = view.cooldownIssue
    if not issue then return "当前没有检测到冷却管理器预设差异。" end
    local data = issue.data or {}
    local lines = { "当前职业：" .. tostring(data.className or data.class or "未知") }
    if type(issue.detail) == "string" and issue.detail ~= "" then lines[#lines + 1] = issue.detail end
    lines[#lines + 1] = "选择异常专精可按需计算技能、栏目、顺序与显示设置差异。"
    return table.concat(lines, "\n")
end

local function AppendDifferenceLines(lines, title, entries, formatter, limit)
    if type(entries) ~= "table" or #entries == 0 then return end
    lines[#lines + 1] = title .. "（" .. #entries .. "）"
    local index
    for index = 1, math.min(#entries, limit or 6) do
        lines[#lines + 1] = "• " .. formatter(entries[index])
    end
    if #entries > (limit or 6) then lines[#lines + 1] = "• 另有 " .. (#entries - (limit or 6)) .. " 项" end
end

local function FormatCooldownDetail(view)
    if view.cooldownDetailError then return view.cooldownDetailError end
    local detail = view.cooldownDetail
    if not detail then
        if view.cooldownIssue then return "请选择上方异常专精查看具体差异。" end
        return "没有可显示的冷却管理器差异。"
    end
    local lines = {
        "专精：" .. tostring(detail.displayName or detail.name),
        "预设：" .. tostring(detail.layoutName or "露露预设"),
    }
    if detail.status == "missing" then
        lines[#lines + 1] = "当前缺少整套同名预设，无法继续比较单个技能。"
        return table.concat(lines, "\n")
    end
    local difference = detail.difference or {}
    local function FormatSetting(entry)
        local text = tostring(entry.label or entry.path or "设置")
        if entry.expected ~= nil or entry.actual ~= nil then
            text = text .. "：" .. tostring(entry.expected) .. " → " .. tostring(entry.actual)
        end
        if entry.reason then text = text .. "（" .. tostring(entry.reason) .. "）" end
        return text
    end
    AppendDifferenceLines(lines, "当前新增或启用", difference.added,
        function(entry) return entry.label end)
    AppendDifferenceLines(lines, "当前缺少或隐藏", difference.removed,
        function(entry) return entry.label end)
    AppendDifferenceLines(lines, "栏目变化", difference.moved,
        function(entry)
            return entry.label .. "：" .. tostring(entry.expectedCategory) .. " → " .. tostring(entry.actualCategory)
        end)
    AppendDifferenceLines(lines, "顺序变化", difference.order,
        function(entry)
            return entry.label .. "：第 " .. tostring(entry.expectedIndex) .. " 位 → 第 " .. tostring(entry.actualIndex) .. " 位"
        end)
    AppendDifferenceLines(lines, "显示设置变化", difference.settings, FormatSetting)
    AppendDifferenceLines(lines, "其他设置变化", difference.fields, FormatSetting)
    if difference.reason or detail.reason then
        lines[#lines + 1] = "说明：" .. tostring(difference.reason or detail.reason)
    end
    local truncated = difference.truncatedFields or difference.fieldsTruncated
    if truncated and truncated ~= 0 then
        lines[#lines + 1] = type(truncated) == "number"
            and ("另有 " .. truncated .. " 个字段未展开，已达到详情上限。")
            or "部分字段未展开，已达到详情上限。"
    end
    if difference.missingLayout then lines[#lines + 1] = "• 当前缺少对应的布局数据块。" end
    if difference.extraLayout then lines[#lines + 1] = "• 当前存在内置预设没有的布局数据块。" end
    if tonumber(difference.total) == 0 then
        lines[#lines + 1] = detail.status == "current" and "当前内容与内置预设一致。"
            or "检测到内部数据不同，但没有可安全解释为技能变化的字段。"
    end
    return table.concat(lines, "\n")
end

LoadCooldownDetail = function(view, specName)
    view.cooldownDetail, view.cooldownDetailError = nil, nil
    local cooldown = ns.LegacyPresetImports and ns.LegacyPresetImports.Cooldown
    local detail, reason
    if IsInCombat() then
        reason = "战斗中暂停差异查询，请脱战后重新查看。"
    elseif type(cooldown) ~= "table" or type(cooldown.GetDetailedDiff) ~= "function" then
        reason = "冷却管理器差异查询不可用"
    else
        local called
        called, detail, reason = pcall(cooldown.GetDetailedDiff, cooldown, specName)
        if not called then detail, reason = nil, "差异计算未完成，请重试或重载界面。" end
    end
    if type(detail) ~= "table" then
        view.cooldownDetailError = "差异查询失败：" .. TranslateReason(reason)
        return false, reason
    end
    view.cooldownDetail = detail
    return true, detail
end

function SettingsPage:SelectCooldownSpec(context, specName)
    if not ns.ProductManifest:HasHealthCategory("cooldown") then return false, "unsupported-on-current-build" end
    local view = context and context.rssSetup
    if type(view) ~= "table" then return false, "设置页不可用" end
    UpdateCooldownView(view)
    view.selectedCooldownSpec = specName
    local ok, result = LoadCooldownDetail(view, specName)
    self:Refresh(context)
    return ok, result
end

function SettingsPage:ScrollToCooldownDetails(context)
    local view = context and context.rssSetup
    local page = view and view.page
    if view and view.tabs then view.tabs:Select("install") end
    local header = view and view.cooldownSection and view.cooldownSection.header
    local target = header and (header.frame or header)
    if not page or not target or type(target.GetPoint) ~= "function" then return false end
    local scroll = page:GetScroll()
    local frame = scroll and (scroll.frame or scroll)
    local point, relative, relativePoint, _, y = target:GetPoint(1)
    if frame and type(frame.SetVerticalScroll) == "function"
        and point == "TOPLEFT" and relative == page:GetContent() and relativePoint == "TOPLEFT"
        and type(y) == "number" then
        frame:SetVerticalScroll(math.max(0, -y))
        return true
    end
    return false
end

function SettingsPage:IgnoreCooldownDifference(context)
    local issue, snapshot = GetCooldownIssue()
    if not issue or not snapshot then return false, "当前没有可忽略的冷却管理器差异" end
    local service = ns.HealthCheckService
    if type(service) ~= "table" or type(service.AcknowledgeSnapshot) ~= "function" then
        return false, "安装检查检查不可用"
    end
    service:AcknowledgeSnapshot({ issues = { issue } })
    self:Refresh(context, "已忽略当前这份冷却管理器差异；内容变化后会重新提醒。")
    return true
end

local function IsCooldownDifferenceAcknowledged(issue)
    local service = ns.HealthCheckService
    return issue ~= nil and type(service) == "table"
        and type(service.IsIssueAcknowledged) == "function"
        and service:IsIssueAcknowledged(issue) == true
end

function SettingsPage:ShowCooldownImportConfirmation(context)
    local ready, reason = ns.ProductManifest:CheckPreset("cd")
    if not ready then return false, reason end
    local view = context and context.rssSetup
    local issue = view and view.cooldownIssue
    if type(view) ~= "table" or not issue then return false, "当前没有冷却管理器差异" end
    local ui = GetHostUI()
    if type(ui) ~= "table" or type(ui.CreateCallout) ~= "function" or not _G.UIParent then
        return false, "确认窗口不可用"
    end
    local className = issue.data and (issue.data.className or issue.data.class) or "当前职业"
    local function Close()
        local callout = view.cooldownImportCallout
        view.cooldownImportCallout = nil
        if callout and type(callout.Release) == "function" then
            callout:Release()
        elseif callout and type(callout.Hide) == "function" then
            callout:Hide("cooldown-import")
        end
    end
    local options = {
        relativeTo = _G.UIParent, point = "CENTER", relativePoint = "CENTER", y = 60,
        width = 560, columns = 2, rowHeight = 32, mouseEnabled = true,
        items = {
            { text = "确认重新导入冷却管理器预设", span = 2, height = 28, fontSize = 17 },
            { text = "将覆盖" .. tostring(className) .. "全部同名“露露”预设；不会删除其他命名布局，但可能切换当前活动布局。",
                span = 2, height = 56, justifyH = "LEFT" },
            { kind = "button", text = "确认重新导入", onClick = function()
                Close()
                local ok, result = SettingsPage:RunPreset(context, "cd")
                UpdateCooldownView(view)
                SettingsPage:Refresh(context, FormatPresetResult("cd", ok, result))
            end },
            { kind = "button", text = "取消", onClick = Close },
        },
    }
    if not view.cooldownImportCallout then
        view.cooldownImportCallout = ui:CreateCallout(_G.UIParent, options)
    end
    return view.cooldownImportCallout and view.cooldownImportCallout:Show(options) or false
end

-- Lazily created page-owned dialog; no events, timers or idle work.
function SettingsPage:ShowEditModeSelection(context)
    local ready, reason = ns.ProductManifest:CheckPreset("em")
    if not ready then return false, reason end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        self:Refresh(context, "战斗中无法导入编辑模式。")
        return false, "layout-import-blocked-during-combat"
    end
    local view = context and context.rssSetup
    local canvases = ns.EditModePresets and ns.EditModePresets.canvases
    if not view or type(canvases) ~= "table" or type(context.Create) ~= "function" or not _G.UIParent then
        return false, "画布预设不可用"
    end
    local labels = { ["standard-16x9"] = "2K 16比9", ["4k-16x9"] = "4K 16比9",
        ["ultrawide-21x9"] = "21比9 带鱼屏", ["2k-16x10"] = "2K 16比10",
        ["standard-16x9-ndui"] = "NDui+CMC专用",
        ["standard-16x9-ellesmere"] = "2K 16比9 · Elles",
        ["4k-16x9-ellesmere"] = "4K 16比9 · Elles",
        ["ultrawide-21x9-ellesmere"] = "21比9 · Elles" }
    for _, canvas in ipairs(canvases) do
        if canvas.id == "standard-16x9-ellesmere" then labels["standard-16x9"] = "2K 16比9 · 原生" end
        if canvas.id == "4k-16x9-ellesmere" then labels["4k-16x9"] = "4K 16比9 · 原生" end
        if canvas.id == "ultrawide-21x9-ellesmere" then labels["ultrawide-21x9"] = "21比9 · 原生" end
    end
    local detected, why, snapshot = ns.CanvasRouter:Resolve()
    local current = "无法识别"
    if snapshot and snapshot.physicalWidth and snapshot.physicalHeight
        and snapshot.physicalWidth > 0 and snapshot.physicalHeight > 0 then
        current = tostring(snapshot.physicalWidth) .. " × " .. tostring(snapshot.physicalHeight)
    end
    if detected then
        local label = labels[detected.id] or detected.label or detected.id
        local prefix = why == "default_fallback" and "兜底："
            or ((why == "display_fallback" or why == "window_fallback") and "兼容：" or "")
        current = current .. "（" .. prefix .. label .. "）"
    end
    local dialog = view.editModeDialog
    if not dialog then
        dialog = {controls={},buttons={}}
        view.editModeDialog = dialog
        local function Create(kind, parent, options)
            local control = assert(context:Create(kind, parent, options))
            dialog.controls[#dialog.controls+1] = control
            return control
        end
        local function Close() dialog.popup:SetVisible(false) end
        dialog.popup = Create("popup", _G.UIParent, {
            width=560,height=320,hidden=true,movable=true,clampedToScreen=true,
            frameStrata="FULLSCREEN_DIALOG",frameLevel=150,
            backgroundToken="color.window.background",
        })
        local function Label(text, y, height, font)
            local control = Create("label", dialog.popup, {
                text=text,width=512,height=height,fontKey=font or "body",labelFill=true,
                wordWrap=true,nonSpaceWrap=true,justifyH="LEFT",
            })
            control.frame:SetPoint("TOPLEFT",dialog.popup.frame,"TOPLEFT",24,-y)
            control.frame:EnableMouse(false)
            return control
        end
        dialog.title = Label("编辑模式布局",18,30,"heading")
        dialog.hint = Label("点击选择自己的分辨率",58,28)
        dialog.status = Label("",90,48)
        for _, id in ipairs({"standard-16x9", "standard-16x9-ndui", "standard-16x9-ellesmere", "4k-16x9", "2k-16x10", "4k-16x9-ellesmere", "ultrawide-21x9", "ultrawide-21x9-ellesmere"}) do
            dialog.buttons[id] = Create("button",dialog.popup, {
                text=labels[id],width=250,height=38,
                selectedBackgroundToken="color.accent.soft",selectedBorderToken="color.accent",
                onAction=function()
                    Close()
                    if context.rssSetup == view and not dialog.popup.released then
                        SettingsPage:RunPreset(context,"em",id)
                    end
                end,
            })
        end
        dialog.close = Create("button",dialog.popup, {
            text="关闭",width=126,height=34,onAction=Close,
        })
        dialog.close.frame:SetPoint("BOTTOMRIGHT",dialog.popup.frame,"BOTTOMRIGHT",-24,20)
        dialog.popup:SetOnHide(function() dialog.popup.frame:StopMovingOrSizing() end)
    end
    dialog.status:SetText("当前：|cff00ff00" .. current .. "|r")
    local textHeight = dialog.status.label.GetStringHeight and dialog.status.label:GetStringHeight() or 0
    local statusHeight = math.max(48,math.ceil(textHeight)+8)
    dialog.status.frame:SetHeight(statusHeight)
    local available = {}
    for _, canvas in ipairs(canvases) do available[canvas.id] = true end
    local count, gridTop = 0, 90+statusHeight+16
    for _, id in ipairs({"standard-16x9", "standard-16x9-ndui", "standard-16x9-ellesmere", "4k-16x9", "2k-16x10", "4k-16x9-ellesmere", "ultrawide-21x9", "ultrawide-21x9-ellesmere"}) do
        local button = dialog.buttons[id]
        button:SetVisible(available[id] == true)
        button:SetSelected(available[id] == true and detected ~= nil and detected.id == id)
        if available[id] then
            button.frame:ClearAllPoints()
            button.frame:SetPoint("TOPLEFT",dialog.popup.frame,"TOPLEFT",
                24+(count%2)*262,-gridTop-math.floor(count/2)*50)
            count = count+1
        end
    end
    local frame = dialog.popup.frame
    frame:SetHeight(gridTop+math.ceil(count/2)*50+66)
    frame:ClearAllPoints()
    frame:SetPoint("CENTER",_G.UIParent,"CENTER",0,0)
    dialog.popup:SetVisible(true)
    return true
end

local function AddPresetButton(row, key, command, context)
    local tooltip = "导入露露的" .. PRESET_TEXT[command] .. "预设。"
    if command == "em" or command == "all" then
        tooltip = tooltip .. " 同名“露露”内容不一致时会覆盖自定义修改；导入失败会保留原布局。"
        if command == "all" then tooltip = tooltip .. " EllesmereUI 已加载时还会修正当前布局的边缘位置。" end
    end
    if command == "rxp" then
        tooltip = "导入指定窗口、箭头、字号及升级追踪、升级通告、任务交互选项，保留路线进度和其他设置；重载后生效。"
    end
    row:Button(key, {
        text = PRESET_TEXT[command],
        tooltip = command ~= "all" and (tooltip .. " 接口不兼容时不可用。") or nil,
        widthRatio = command == "all" and (1 / 3) or (1 / 6),
        getVisible = function() return PresetVisible(command) end,
        getEnabled = function() return PresetEnabled(command) end,
        onAction = function()
            if command == "em" then return SettingsPage:ShowEditModeSelection(context) end
            return SettingsPage:RunPreset(context, command)
        end,
    })
end

local function StopView(view)
    if not view then return end
    view.active = false
    view.edgeRequest = nil
    local token = view.addonLoadedToken
    view.addonLoadedToken = nil
    if token and ns.EventHub then ns.EventHub:Unsubscribe(token) end
    -- This UIParent popup stays interactive when the settings page is hidden.
    -- Reuse it on reopen; PageContext still releases it on page unregister.
    local callout = view.cooldownImportCallout
    view.cooldownImportCallout = nil
    if callout and type(callout.Release) == "function" then callout:Release() end
end

function SettingsPage:Build(context)
    local ready, buildReason = ns.ProductManifest:Check("setup")
    if not ready then return false, buildReason end
    if type(context) ~= "table" or type(context.GetRoot) ~= "function" then
        return false, "RurutiaSuite settings page context is unavailable"
    end
    local root = context:GetRoot()
    if type(root) ~= "table" and type(root) ~= "userdata" then
        return false, "RurutiaSuite settings page root is unavailable"
    end
    local ui = GetHostUI()
    if type(ui) ~= "table" or type(ui.CreateSettingsPage) ~= "function" then
        return false, "RurutiaSuite SettingsBuilder is unavailable"
    end
    local page, reason = ui:CreateSettingsPage(context, { id = "setup" })
    if not page then return false, reason end

    local view = context.rssSetup
    if type(view) ~= "table" then
        view = {
            layoutName = ns.LayoutPolicy.CANONICAL_LAYOUT_NAME,
            status = "installer",
            message = "",
        }
        context.rssSetup = view
    end
    view.page = page
    if not view.lifecycleCleanup and type(context.Track) == "function" then
        -- Registry stops tracked work even when onShow fails before onHide can run.
        local function stop() StopView(view) end
        view.lifecycleCleanup = context:Track({ StopTemporaryWork = stop, Release = stop })
    end
    view.profileStatus = ProfileStatus()
    UpdateCooldownView(view)

    if page:GetControl("importAll") then
        page:Refresh("reuse")
        UpdateLayoutSelection(view)
        return page
    end

    local function StatusText()
        return view.message and view.message ~= "" and ("状态：" .. view.message) or "状态：待操作"
    end
    local tabs = page:Tabs("setupTabs", { default = "install", gapAfter = 8 })
    view.tabs = tabs
    local installTab = tabs:Tab("install", { title = "安装布局" })
    local automationTab = tabs:Tab("automation", { title = "自动设置" })

    local quick = installTab:Section("安装配置")
    if ns.ProductManifest:Check("infinitePreset") then
        quick:Description("一键导入同步编辑模式与暴雪设置，已加载Elles时关闭原生伤害统计并修正当前露露布局，完成后重载。")
    end
    local quickActions = quick:ActionRow({ columns = 3, rowHeight = 44 })
    AddPresetButton(quickActions, "importAll", ns.ProductManifest:Has("presetDetails") and "all" or "em", context)
    if ns.ProductManifest:Has("canvasEdge") then
        quickActions:Button("recalculateCanvasEdge", {
            text = "边缘修正", widthRatio = 1 / 3,
            tooltip = "更换分辨率、窗口大小或UI缩放后，重新适配当前左、中、右布局。",
            getVisible = function() return OptionVisible("edge") end,
            getEnabled = function() return OptionEnabled("edge") end,
            onAction = function() SettingsPage:RecalculateCanvasAndEdge(context) end,
        })
        quickActions:Button("undoEdge", {
            text = "撤销贴边", widthRatio = 1 / 3,
            getVisible = function() return OptionVisible("edge") end,
            getEnabled = function() return not IsInCombat() and HasMethods(ns.EllesmereEdgeCorrection, "Undo") end,
            onAction = function()
                CancelEdgeSwitch(context)
                local result, reason = ns.EllesmereEdgeCorrection:Undo()
                SettingsPage:Refresh(context, result and "已恢复贴边前的位置。" or tostring(reason))
            end,
        })
    elseif not ns.ProductManifest:Check("infinitePreset") then
        quick:Description(TranslateReason("not_ready"))
    end
    quick:Description(StatusText, { textToken = "color.text.normal" })
    local layout = installTab:Section("布局切换")
    if ns.ProductManifest:Check("infinitePreset") then
        layout:Description("加载Elles及露露配置后，可切换左、中、右布局并修正屏幕边缘。")
    end
    layout:Description(function()
        return "当前布局：|cff00ff00" .. (SIDE_TEXT[view.profileStatus.side] or "未识别") .. "|r"
    end, { textToken = "color.text.normal" })
    local layoutActions = layout:ActionRow({ columns = 3, layout = "grid", rowHeight = 44,
        preserveColumns = true, responsive = false })
    layoutActions:Button("layoutLeft", {
        text = "左布局",
        selectedBackgroundToken = "color.accent.soft",
        selectedBorderToken = "color.accent",
        getEnabled = CanSwitchLayout,
        onAction = function() SettingsPage:SwitchSide(context, "left") end,
    })
    if ns.ProductManifest:Has("middleLayout") then
        layoutActions:Button("layoutMiddle", {
            text = "中布局",
            selectedBackgroundToken = "color.accent.soft",
            selectedBorderToken = "color.accent",
            getVisible = function()
                local ok, status = ns.ProfileSwitcher:Inspect()
                return ok and status.provider == "ellesmere" and status.main
                    and status.main.targets and type(status.main.targets.middle) == "string"
            end,
            getEnabled = function() return not (type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown()) end,
            onAction = function() SettingsPage:SwitchSide(context, "middle") end,
        })
    end
    layoutActions:Button("layoutRight", {
        text = "右布局",
        selectedBackgroundToken = "color.accent.soft",
        selectedBorderToken = "color.accent",
        getEnabled = CanSwitchLayout,
        onAction = function() SettingsPage:SwitchSide(context, "right") end,
    })
    if ns.ProductManifest:Has("canvasEdge") then
        local kiraOptions = layout:ToggleRow({ columns = 4, toggleColumns = 4 })
        kiraOptions:Checkbox("adjustKira", {
            text = "同步KiraUI减伤组",
            tooltip = "默认开启，可关闭以保留自己的减伤组布局。开启后，仅手动切换左、中、右布局或一键导入完成时调整Kira队伍冷却；登录、重载和进出副本不调整。左右布局放左侧，中布局放下方。",
            getEnabled = CanSwitchLayout,
            getValue = function()
                local settings = ns.DB and ns.DB.global and ns.DB.global.layout
                return settings and settings.adjustKira ~= false
            end,
            onChange = function(_, value)
                local settings = ns.DB and ns.DB.global and ns.DB.global.layout
                if not settings then return end
                settings.adjustKira = value == true
                SettingsPage:Refresh(context, "Kira布局选项已保存，下次切换布局或一键导入时生效。")
            end,
        })
        kiraOptions:Checkbox("adjustKiraInterrupts", {
            text = "同步打断组",
            tooltip = "默认开启，可关闭以保留自定义位置。手动切换左、中、右布局或一键导入完成时，同步KiraUI打断组位置；右布局与中布局共用位置。保留原有启停、尺寸和样式；登录、重载和进出副本不调整。",
            getEnabled = CanSwitchLayout,
            getValue = function()
                local settings = ns.DB and ns.DB.global and ns.DB.global.layout
                return settings and settings.adjustKiraInterrupts ~= false
            end,
            onChange = function(_, value)
                local settings = ns.DB and ns.DB.global and ns.DB.global.layout
                if not settings then return end
                settings.adjustKiraInterrupts = value == true
                SettingsPage:Refresh(context, "Kira打断组选项已保存，下次切换布局或一键导入时生效。")
            end,
        })
        kiraOptions:Checkbox("adjustKiraStops", {
            text = "同步群控组",
            tooltip = "默认开启，可关闭以保留自定义位置。手动切换左、中、右布局或一键导入完成时，同步KiraUI两组队伍群控位置；右布局与中布局共用位置。保留原有启停、尺寸和样式；登录、重载和进出副本不调整。",
            getEnabled = CanSwitchLayout,
            getValue = function()
                local settings = ns.DB and ns.DB.global and ns.DB.global.layout
                return settings and settings.adjustKiraStops ~= false
            end,
            onChange = function(_, value)
                local settings = ns.DB and ns.DB.global and ns.DB.global.layout
                if not settings then return end
                settings.adjustKiraStops = value == true
                SettingsPage:Refresh(context, "Kira群控组选项已保存，下次切换布局或一键导入时生效。")
            end,
        })
        layout:ToggleRow({ columns = 1 }):Checkbox("edgeOnSwitch", {
            text = "切换布局自动贴边",
            tooltip = "切换 EUI 左、中、右布局后修正边缘位置；接口不可用时暂不能开启。",
            getVisible = function() return OptionVisible("edge") end,
            getEnabled = function() return OptionEnabled("edge") end,
            getValue = function()
                local settings = ns.DB and ns.DB.global and ns.DB.global.layout
                return settings and settings.edgeOnSwitch ~= false
            end,
            onChange = function(_, value)
                local settings = ns.DB and ns.DB.global and ns.DB.global.layout
                if not settings then return end
                settings.edgeOnSwitch = value and true or false
                SettingsPage:Refresh(context, "切换布局自动贴边设置已更新。")
            end,
        })
    end
    if ns.ProductManifest:Has("presetDetails") then
        local presets = installTab:Section("分项导入")
        local presetActions = presets:ActionRow({ autoWrap = true, rowHeight = ACTION_HEIGHT })
        AddPresetButton(presetActions, "importEditMode", "em", context)
        if ns.ProductManifest:HasPreset("blizzard") then
            AddPresetButton(presetActions, "importBlizzard", "blizzard", context)
        end
        if ns.ProductManifest:HasPreset("rxp") then
            AddPresetButton(presetActions, "importRXP", "rxp", context)
        end
        AddPresetButton(presetActions, "importCooldown", "cd", context)
        AddPresetButton(presetActions, "importSensei", "sensei", context)
        AddPresetButton(presetActions, "importBrewmaster", "jx", context)
        AddPresetButton(presetActions, "importAbilityTimeline", "at", context)
        AddPresetButton(presetActions, "importEXBoss", "exboss", context)
        AddPresetButton(presetActions, "importEXWINDTOOLS", "exwind", context)
        AddPresetButton(presetActions, "importBigWigs", "bigwigs", context)
        presets:Description(ns.ProductManifest:Check("infinitePreset")
            and "编辑模式导入布局，暴雪设置导入界面选项，RXP 外观保留路线进度。"
            or "酒仙酒池条、BigWigs 需单独导入。")
    end

    local health = installTab:Section("安装检查")
    local healthActions = health:ActionRow({ autoWrap = true, widthRatio = 1 / 6, rowHeight = ACTION_HEIGHT })
    healthActions:Button("runHealthCheck", {
        text = "重新检查",
        tooltip = "重新检查安装情况。待检查表示数据暂不可用，可稍后重试。",
        getEnabled = function() return not IsInCombat() end,
        onAction = function() SettingsPage:RunHealthCheck(context) end,
    })
    health:Description(function() return HealthStatusText(view) end, { minHeight = 20 })
    if ns.ProductManifest:Has("editModeActivation") then
        healthActions:Button("showEditModeDetails", {
            text = "编辑模式差异",
            tooltip = "手动比较位置和设置，仅查看，不会修改布局。登录只检查是否存在露露布局。",
            getEnabled = function() return not IsInCombat() end,
            onAction = function()
                local importer = ns.EditModeImporter
                local lines, reason
                if importer and type(importer.GetDetailedDiff) == "function" then
                    lines, reason = importer:GetDetailedDiff()
                end
                page:ShowTextDialog({ title = "编辑模式差异", mode = "view", width = 780, height = 520,
                    description = lines and lines[1] or "比较结果：无法比较",
                    value = lines and table.concat(lines, "\n") or reason or "编辑模式比较暂不可用。",
                })
            end,
        })
    end
    if ns.ProductManifest:HasHealthCategory("cooldown") then
        healthActions:Button("showCooldownDetails", {
            getText = function() return view.showCooldownDetails and "收起差异" or "查看差异" end,
            getVisible = function() return view.cooldownIssue ~= nil end,
            onAction = function()
                view.showCooldownDetails = not view.showCooldownDetails
                view.cooldownDetail, view.cooldownDetailError = nil, nil
                SettingsPage:Refresh(context)
                if view.showCooldownDetails then SettingsPage:ScrollToCooldownDetails(context) end
            end,
        })
        local results = installTab:Section("冷却管理器详情", {
            getVisible = function() return view.showCooldownDetails == true and view.cooldownIssue ~= nil end,
        })
        view.cooldownSection = results
        results:Description(function() return FormatCooldownSummary(view) end, {
            minHeight = 20,
            textToken = "color.text.normal",
        })
        local specActions = results:ActionRow({ columns = 4, rowHeight = ACTION_HEIGHT })
        local specIndex
        for specIndex = 1, 4 do
            local currentIndex = specIndex
            specActions:Button("cooldownDifferenceSpec" .. currentIndex, {
                getText = function()
                    local spec = view.cooldownSpecs and view.cooldownSpecs[currentIndex]
                    if not spec then return "无异常专精" end
                    return tostring(spec.displayName or spec.name)
                end,
                selectedBackgroundToken = "color.accent.soft",
                selectedBorderToken = "color.accent",
                getVisible = function()
                    return view.cooldownSpecs and view.cooldownSpecs[currentIndex] ~= nil
                end,
                getEnabled = function() return not IsInCombat() end,
                onAction = function()
                    local spec = view.cooldownSpecs and view.cooldownSpecs[currentIndex]
                    if spec then SettingsPage:SelectCooldownSpec(context, spec.name) end
                end,
            })
        end
        results:Description(function() return FormatCooldownDetail(view) end, {
            minHeight = 20,
            textToken = "color.text.muted",
        })
        local resultActions = results:ActionRow({ columns = 3, rowHeight = ACTION_HEIGHT })
        resultActions:Button("recheckCooldownDifference", {
            text = "重新检查",
            getEnabled = function() return not IsInCombat() end,
            tooltip = "重新读取当前冷却管理器布局，不会修改配置。",
            onAction = function()
                view.cooldownDetail = nil
                SettingsPage:RunHealthCheck(context)
            end,
        })
        resultActions:Button("reimportCooldownDifference", {
            text = "重装职业预设",
            tooltip = "确认后覆盖当前职业全部同名“露露”冷却预设。",
            getVisible = function() return view.cooldownIssue ~= nil end,
            getEnabled = function() return PresetEnabled("cd") end,
            onAction = function() SettingsPage:ShowCooldownImportConfirmation(context) end,
        })
        resultActions:Button("ignoreCooldownDifference", {
            getText = function()
                return IsCooldownDifferenceAcknowledged(view.cooldownIssue)
                    and "已忽略" or "忽略差异"
            end,
            tooltip = "只忽略当前这份差异；内容变化后会重新提醒。",
            getVisible = function() return view.cooldownIssue ~= nil end,
            getEnabled = function()
                return view.cooldownIssue ~= nil
                    and not IsCooldownDifferenceAcknowledged(view.cooldownIssue)
            end,
            onAction = function() SettingsPage:IgnoreCooldownDifference(context) end,
        })

    end
    local healthOptions = automationTab:Section("登录提醒")
    local healthCategories = healthOptions:ToggleRow({ columns = 3 })
    healthCategories:Checkbox("healthReminder", {
        text = "登录配置提醒",
        tooltip = "登录时提醒预设缺失、配置差异等问题。只提示，不会自动导入或修改配置。",
        getValue = function()
            local healthDB = ns.DB and ns.DB.global and ns.DB.global.health
            return healthDB and healthDB.reminderEnabled ~= false
        end,
        onChange = function(_, value)
            ns.HealthCheckService:SetReminderEnabled(value)
            SettingsPage:Refresh(context)
        end,
    })
    local function CategoryToggle(key, text, tooltip)
        if not ns.ProductManifest:HasHealthCategory(key) then return end
        healthCategories:Checkbox("healthCategory-" .. key, {
            text = text,
            getVisible = function() return OptionVisible(key) end,
            tooltip = tooltip .. "关闭仅停止此类登录提醒，仍可手动检查。",
            getValue = function() return not ns.HealthCheckService:IsCategoryIgnored(key) end,
            onChange = function(_, value)
                ns.HealthCheckService:SetCategoryIgnored(key, not value)
                SettingsPage:Refresh(context)
            end,
        })
    end
    CategoryToggle("editMode", "缺少编辑模式", "缺少名为露露的编辑模式布局时提醒。")
    CategoryToggle("uiLayout", "布局异常提醒", "缺少露露左右布局，或主界面与团队框架方向不一致时提醒。")
    CategoryToggle("cooldown", "冷却预设差异", "冷却管理器的露露预设缺失或内容与内置预设不同时提醒。")
    CategoryToggle("sensei", "资源条预设缺失", "Sensei 资源条缺少露露配置，或自动切换所需接口不可用时提醒。")
    CategoryToggle("automation", "自动设置异常", "已开启的自动设置缺少所需插件或配置时提醒，包括 EXBoss 露露语音包及 DandersFrames 团队框架。")
    CategoryToggle("activation", "未用露露预设", "已安装但当前没有使用露露界面布局或冷却预设时提醒。")
    CategoryToggle("ellesQuickSignup", "快速申请提醒", "EllesmereUI 开启快速申请时提醒，该功能会跳过手动填写申请说明。")

    local automation, generalAutomation
    if ns.ProductManifest:Has("automation") or ns.ProductManifest:Has("editModeActivation") then
        automation = automationTab:Section("自动化设置")
        generalAutomation = automation:ToggleRow()
        generalAutomation:Checkbox("automationEnabled", {
            text = "启用自动化",
            tooltip = "统一控制下方自动设置，关闭后保留各项选择。登录提醒单独控制。",
            getValue = function() local s = GetAutomation(); return s and s.enabled ~= false end,
            onChange = function(_, value) SetAutomation("enabled", value, context) end,
        })
        generalAutomation:Checkbox("autoEditMode", {
            text = "露露编辑模式",
            tooltip = "登录、重载或切换专精后，仅激活已存在的“露露”布局。",
            getValue = function() local s = GetAutomation(); return s and s.editModeLayout ~= false end,
            getEnabled = function() local s = GetAutomation(); return s and s.enabled ~= false end,
            onChange = function(_, value) SetAutomation("editModeLayout", value, context) end,
        })
        if ns.ProductManifest:Has("automation") then
        generalAutomation:Checkbox("autoEXBoss", {
            text = "露露语音包",
            tooltip = "登录或重载后选择 EXBOSS 露露语音包；接口不兼容时不可用。",
            getValue = function() local s = GetAutomation(); return s and s.exbossVoice == true end,
            getVisible = function() return OptionVisible("exboss") end,
            getEnabled = function() local s = GetAutomation(); return s and s.enabled ~= false and OptionEnabled("exboss") end,
            onChange = function(_, value) SetAutomation("exbossVoice", value, context) end,
        })
        local senseiAutomation = generalAutomation
        senseiAutomation:Checkbox("autoSensei", {
            text = "酒仙自动切换酒池条",
            tooltip = "根据当前专精在常规与酒仙资源条配置之间切换；接口不兼容时不可用。",
            getValue = function() local s = GetAutomation(); return s and s.senseiBrewmaster == true end,
            getVisible = function() return OptionVisible("sensei") end,
            getEnabled = function() local s = GetAutomation(); return s and s.enabled ~= false and OptionEnabled("sensei") end,
            onChange = function(_, value) SetAutomation("senseiBrewmaster", value, context) end,
        })
        senseiAutomation:Checkbox("senseiNotify", {
            text = "资源条切换提示",
            getVisible = function() return OptionVisible("sensei") end,
            getValue = function() local s = GetAutomation(); return s and s.senseiNotify == true end,
            getEnabled = function()
                local s = GetAutomation()
                return s and s.enabled ~= false and s.senseiBrewmaster == true and OptionEnabled("sensei")
            end,
            onChange = function(_, value) SetAutomation("senseiNotify", value, context) end,
        })
        local dandersAutomation = generalAutomation
        dandersAutomation:Checkbox("autoDanders", {
            text = "治疗进团本切换大团框",
            tooltip = "ElvUI、NDui 或独立 DF 的右布局生效；EUI 不联动，接口不兼容时不可用。",
            getValue = function() local s = GetAutomation(); return s and s.dandersProfile == true end,
            getVisible = function() return OptionVisible("danders") end,
            getEnabled = function() local s = GetAutomation(); return s and s.enabled ~= false and OptionEnabled("danders") end,
            onChange = function(_, value) SetAutomation("dandersProfile", value, context) end,
        })
        dandersAutomation:Checkbox("dandersMythicOnly", {
            text = "仅限史诗团本",
            getVisible = function() return OptionVisible("danders") end,
            getValue = function() local s = GetAutomation(); return s and s.dandersMythicOnly ~= false end,
            getEnabled = function()
                local s = GetAutomation()
                return s and s.enabled ~= false and s.dandersProfile == true and OptionEnabled("danders")
            end,
            onChange = function(_, value) SetAutomation("dandersMythicOnly", value, context) end,
        })
        end
        page:FooterActions():Button("resetAutomation", {
            action = "restoreDefaults",
            getEnabled = function() return tabs:GetSelected() == "automation" end,
            text = "恢复默认",
            tooltip = "只恢复自动化开关，不重装预设、不立即切换布局；登录或切专精时按新设置执行。",
            onAction = function()
                page:ShowTextDialog({ title = "恢复自动设置", confirmLabel = "恢复默认",
                    description = "仅恢复本页自动化开关，不修改 ESC 菜单入口。",
                    value = "不会重装预设或立即切换布局。登录或切换专精时按默认设置执行。",
                    onConfirm = function() return SettingsPage:ResetAutomation(context) end,
                })
                if page.textDialog then page.textDialog.close:SetText("取消") end
            end,
        })
    end
    local entryAutomation = generalAutomation or automationTab:Section("菜单入口"):ToggleRow()
    entryAutomation:Checkbox("gameMenuEntry", {
        text = "菜单顶部工具箱按钮",
        tooltip = "在游戏 ESC 菜单顶部增加固定样式入口。",
        getValue = function() local s = GetGameMenu(); return s and s.enabled ~= false end,
        onChange = function(_, value) SetGameMenu(value, context) end,
    })



    page:Finish()
    UpdateLayoutSelection(view)
    return page
end

function SettingsPage:GetDefinition()
    return {
        id = "setup",
        title = "一键导入",
        description = "安装露露的整套配置，或按需导入单个预设并切换布局。",
        group = "pinned",
        groupOrder = 10,
        navigationOrder = 10,
        searchKeywords = { "RSS", "预设安装器", "配置安装器", "预设", "安装", "布局", "冷却", "Sensei", "EXBOSS" },
        build = function(context) return self:Build(context) end,
        onShow = function(context)
            local current = context and context.rssSetup
            if current then current.active = true end
            if current and not current.addonLoadedToken and ns.EventHub then
                current.addonLoadedToken = ns.EventHub:Subscribe("ADDON_LOADED", function()
                    if context.rssSetup == current then self:Refresh(context) end
                end)
            end
            local data = context and context.data
            local view = context and context.rssSetup
            local fromHealth = type(data) == "table" and data.source == "health"
            local fromInstallReminder = type(data) == "table" and data.source == "health-install"
            if view and fromInstallReminder and view.tabs then view.tabs:Select("install") end
            if view and fromHealth then
                if view.tabs then view.tabs:Select("install") end
                UpdateCooldownView(view)
                if view.cooldownIssue then
                    view.showCooldownDetails = true
                    view.cooldownDetail, view.cooldownDetailError = nil, nil
                end
            end
            self:Refresh(context)
            local page = view and view.page
            if fromHealth and view and view.cooldownIssue and page then
                self:ScrollToCooldownDetails(context)
            elseif fromHealth and page
                and type(page.GetScroll) == "function" then
                local scroll = page:GetScroll()
                local frame = scroll and (scroll.frame or scroll)
                if frame and type(frame.SetVerticalScroll) == "function" then frame:SetVerticalScroll(0) end
            end
        end,
        onHide = function(context)
            StopView(context and context.rssSetup)
        end,
        onRefresh = function(context) self:Refresh(context) end,
    }
end

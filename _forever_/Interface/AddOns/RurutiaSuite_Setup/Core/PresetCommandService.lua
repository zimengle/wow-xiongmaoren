local _, ns = ...

-- 一键导入器只负责调度显式导入器。第三方导入不是可回滚事务，all 采用尽力执行并逐项报告。
local Service = {}
ns.PresetCommandService = Service
local activeRequests = {}

local RELOAD_POPUP = "RURUTIASUITE_SETUP_RELOAD_REQUIRED"
local FAILURE_POPUP = "RURUTIASUITE_SETUP_IMPORT_FAILED"

function Service:PromptFailure(command, result, afterReload)
    local reason = (command == "em" or (command == "all" and type(result) == "string")) and result
        or (type(result) == "table" and result.failures and result.failures.em)
    local message
    local blockMessage = ns.LayoutPolicy and ns.LayoutPolicy:GetEditModeBlockMessage(reason)
    if blockMessage then
        message = (afterReload and "重载前的编辑模式导入未完成。\n" or "编辑模式导入未完成。\n") .. blockMessage .. "\n原因：" .. reason
    elseif reason == "manual-edit-in-progress" then
        message = (afterReload and "上次导入被编辑模式状态阻止，当前显示的是重载前保留的错误。\n" or "编辑模式状态阻止了本次导入。\n")
            .. "请确认编辑模式已退出，再重新导入；若仍失败，请保留新的原因反馈。"
    elseif reason == "layout-capacity-full" then
        message = "编辑模式已满，请删除不需要的编辑模式，再尝试导入。"
    elseif reason then
        message = "编辑模式导入失败。\n原因：" .. tostring(reason)
            .. "\n请保留此提示，排查后再尝试导入。"
    elseif type(result) == "table" and result.failures then
        local labels = {rxp="RXP 外观",canvasEdge="Elles 布局贴边",cd="冷却管理器",sensei="常规资源条",at="AT 时间轴",exwind="ExwindTools",exboss="EXBoss"}
        local lines = {}
        for name, detail in pairs(result.failures) do
            lines[#lines + 1] = (labels[name] or name) .. "：" .. tostring(detail)
        end
        table.sort(lines)
        message = "以下项目未完成：\n" .. table.concat(lines, "\n")
    else
        message = "预设导入未全部完成，请查看导入结果后重试。"
    end

    if type(_G.StaticPopupDialogs) ~= "table" or type(_G.StaticPopup_Show) ~= "function" then
        if type(_G.print) == "function" then _G.print(message) end
        return false
    end
    if not _G.StaticPopupDialogs[FAILURE_POPUP] then
        _G.StaticPopupDialogs[FAILURE_POPUP] = {
            text = "%s", button1 = "知道了", timeout = 0,
            whileDead = true, hideOnEscape = true, preferredIndex = 3,
        }
    end
    return _G.StaticPopup_Show(FAILURE_POPUP, message) ~= nil
end

function Service:ShowPendingImportFailure()
    local global = ns.DB and ns.DB.global
    local pending = global and global.pendingImportFailure
    if not pending then return end
    global.pendingImportFailure = nil
    if type(pending) == "table" then
        self:PromptFailure(pending.command, pending.result, true)
    else
        self:PromptFailure("all", {failures={previous=pending}}, true)
    end
end

function Service:ForceReload()
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        if not self.reloadFrame and type(_G.CreateFrame) == "function" then
            self.reloadFrame = _G.CreateFrame("Frame")
            self.reloadFrame:SetScript("OnEvent", function(frame)
                frame:UnregisterEvent("PLAYER_REGEN_ENABLED")
                self:ForceReload()
            end)
        end
        if self.reloadFrame then self.reloadFrame:RegisterEvent("PLAYER_REGEN_ENABLED") end
        return false
    end
    if self.reloadFrame then self.reloadFrame:UnregisterEvent("PLAYER_REGEN_ENABLED") end
    if type(_G.ReloadUI) == "function" then _G.ReloadUI(); return true end
    return false
end

function Service:PromptReload()
    if type(_G.StaticPopupDialogs) ~= "table" or type(_G.StaticPopup_Show) ~= "function" then
        return false -- Button and slash-command result text still asks for /reload.
    end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then return false end
    if not _G.StaticPopupDialogs[RELOAD_POPUP] then
        _G.StaticPopupDialogs[RELOAD_POPUP] = {
            text = "预设已导入。\n\n为避免导入后界面状态引发报错，请重载界面后继续使用。",
            button1 = "立即重载",
            button2 = "稍后",
            OnAccept = function()
                if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then return end
                if type(_G.ReloadUI) == "function" then _G.ReloadUI() end
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
    end
    return _G.StaticPopup_Show(RELOAD_POPUP) ~= nil
end

local ALIASES = {
    import = "em",
    layout = "em",
    install = "all",
    setup = "all",
    bw = "bigwigs",
    extools = "exwind",
}

local OPTIONAL_ADDONS = {
    rxp = "RXPGuides",
    sensei = "SenseiClassResourceBar",
    jx = "SenseiClassResourceBar",
    bigwigs = "BigWigs",
    at = "AbilityTimeline",
    exwind = "ExwindTools",
    exboss = "EXBoss",
}

-- Unloaded optional addons never enter their importer, including disabled addons.
local function MissingOptionalAddon(command)
    local name = OPTIONAL_ADDONS[command]
    if not name then return nil end
    local addons = _G.C_AddOns
    local isLoaded = type(addons) == "table" and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(isLoaded) == "function" then
        local ok, loaded = pcall(isLoaded, name)
        if ok and loaded ~= true then return name end
        if ok then return nil end
    end
    local getInfo = type(addons) == "table" and addons.GetAddOnInfo or _G.GetAddOnInfo
    if type(getInfo) ~= "function" then return nil end
    local ok, info = pcall(getInfo, name)
    if ok and info == nil then return name end
end

local function IsEllesmereLoaded()
    local addons = _G.C_AddOns
    local isLoaded = type(addons) == "table" and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(isLoaded) ~= "function" then return false end
    local ok, loadedOrLoading, loaded = pcall(isLoaded, "EllesmereUI")
    return ok and (loadedOrLoading == true or loaded == true)
end

local function RecalculateEllesmereEdge()
    local api = _G.EllesmereUI
    if type(api) == "table" and type(api.GetActiveProfileName) == "function" then
        local called, name = pcall(api.GetActiveProfileName)
        if called and type(name) == "string" and name ~= "露露-左布局"
            and name ~= "露露-中布局" and name ~= "露露-右布局" then
            return true, {skipped=true,changed=false,reloadRequired=false,reason="custom-elles-profile"}
        end
    end
    local engine = ns.EllesmereEdgeCorrection
    if type(engine) ~= "table" or type(engine.RecalculateCurrentSide) ~= "function" then
        return false, "EDGE_CORRECTION_UNAVAILABLE"
    end
    local called, result, reason = pcall(engine.RecalculateCurrentSide, engine)
    if not called then return false, "EDGE_CORRECTION_ERROR" end
    if type(result) ~= "table" then return false, reason or "EDGE_CORRECTION_FAILED" end
    return true, result
end

local function ImportEditMode(request)
    local importer = ns.EditModeImporter
    if type(importer) ~= "table" or type(importer.ImportBaseLayout) ~= "function" then
        return false, "IMPORTER_UNAVAILABLE"
    end
    -- Buttons and slash commands are explicit user actions. Preserve the legacy
    -- contract that an outdated canonical "露露" layout is replaced transactionally.
    local ok, result = importer:ImportBaseLayout(true, request and request.canvasId)
    if not ok then return false, result end
    if type(result) ~= "table" then return true, result end
    result.provider = result.provider or "Blizzard_EditMode"
    result.reloadRequired = true
    return true, result
end

local function ExecuteOne(command, request)
    if command == "em" then return ImportEditMode(request) end
    if command == "blizzard" then
        if not ns.BlizzardSettingsImporter then return false, "IMPORTER_UNAVAILABLE" end
        return ns.BlizzardSettingsImporter:Import()
    end
    if command == "rxp" then
        if not ns.RXPStyleImporter then return false, "IMPORTER_UNAVAILABLE" end
        return ns.RXPStyleImporter:Import()
    end
    local imports = ns.LegacyPresetImports
    local importer = type(imports) == "table" and imports[command] or nil
    if type(importer) ~= "table" or type(importer.Import) ~= "function" then
        return false, "IMPORTER_UNAVAILABLE"
    end
    return importer:Import(request)
end

function Service:Normalize(command)
    command = string.lower(tostring(command or ""))
    return ALIASES[command] or command
end

function Service:RunOne(command, options)
    options = type(options) == "table" and options or {}
    command = self:Normalize(command)
    local finished, finalOK, finalResult = false, nil, nil
    local function complete(ok, result)
        if finished then return finalOK, finalResult end
        finished = true
        if ok ~= true then
            ok, result = false, result or "IMPORT_FAILED"
        elseif type(result) ~= "table" or result.pending then
            ok, result = false, "INVALID_RESULT"
        elseif command == "exwind" and ns.LayoutIntegration then
            -- Only reapply layout policy after a completed import.
            local called, synced, detail = pcall(ns.LayoutIntegration.Sync, ns.LayoutIntegration)
            if called and synced then result.layoutIntegration = detail end
        end
        finalOK, finalResult = ok, result
        if type(options.onComplete) == "function" then pcall(options.onComplete, ok, result) end
        return ok, result
    end
    local supported, reason = ns.ProductManifest:CheckPreset(command)
    if not supported then return complete(false, reason) end
    if command == "all" then return complete(false, "unknown-command") end
    local skippedAddon = MissingOptionalAddon(command)
    if skippedAddon then
        return complete(true, {skipped=true,changed=false,reloadRequired=false,
            provider=skippedAddon,reason="addon-not-loaded"})
    end
    local called, ok, result = pcall(ExecuteOne, command, {
        command = command, parentCommand = options.parentCommand, onComplete = complete,
        canvasId = options.canvasId,
    })
    -- Some official providers complete inline before Import returns.
    if finished then return finalOK, finalResult end
    if not called then return complete(false, "IMPORTER_ERROR") end
    if ok == true and type(result) == "table" and result.pending == true then
        result.changed, result.reloadRequired = false, false
        return true, result
    end
    return complete(ok, result)
end

local function RunBatch(self, onComplete)
    local order = ns.ProductManifest:GetQuickInstallOrder()
    local result = {
        command = "all",
        changed = false,
        reloadRequired = false,
        results = {},
        failures = {},
        order = order,
        transactional = false,
    }
    local index, finished, finalOK = 0, false, nil
    local function finish()
        if ns.ProductManifest:Check("canvasEdge") and IsEllesmereLoaded() then
            result.edgeCorrectionAttempted = true
            local ok, item = RecalculateEllesmereEdge()
            if ok then
                result.results.canvasEdge = item
                result.changed = result.changed or item.changed == true
                result.reloadRequired = result.reloadRequired or item.reloadRequired == true
            else
                result.failures.canvasEdge = tostring(item or "UNKNOWN_FAILURE")
            end
        end
        if next(result.failures) == nil and ns.ProductManifest:Check("canvasEdge")
            and ns.LayoutIntegration then
            local called, ok, item = pcall(ns.LayoutIntegration.ApplyKiraCurrent, ns.LayoutIntegration)
            if called and ok then result.results.kiraLayout = item
            else result.failures.kiraLayout = tostring(item or "KIRA_LAYOUT_FAILED") end
        end
        finished, finalOK = true, next(result.failures) == nil
        onComplete(finalOK,result)
    end
    local function advance()
        index = index+1
        if index > #order then finish(); return end
        local name = order[index]
        local missingAddon = MissingOptionalAddon(name)
        if missingAddon then
            result.results[name] = { skipped = true, changed = false,
                reloadRequired = false, provider = missingAddon, reason = "addon-not-loaded" }
            advance()
            return
        end
        self:RunOne(name, { parentCommand="all", onComplete=function(ok,item)
            if ok then
                result.results[name] = item
                result.changed = result.changed or item.changed == true
                result.reloadRequired = result.reloadRequired or item.reloadRequired == true
            else
                result.failures[name] = tostring(item or "UNKNOWN_FAILURE")
            end
            advance()
        end })
    end
    advance()
    if finished then return finalOK,result end
    return true,{pending=true,command="all",changed=false,reloadRequired=false}
end

-- Completion is delivered exactly once for synchronous and asynchronous runs.
-- A successful pending return only means the provider is awaiting confirmation.
function Service:Run(command, options)
    options = type(options) == "table" and options or {}
    command = self:Normalize(command)
    local finished = false
    local request = {}
    local function complete(ok, result)
        if finished then return end
        finished = true
        -- Only the owning run can release a command; rejected duplicates and
        -- late provider callbacks must not unlock another request.
        local attempted = activeRequests[command] == request
        if attempted then activeRequests[command] = nil end
        local forceReload = command ~= "em" and attempted and not (type(result) == "table" and (result.pending or result.skipped))
        -- Standalone Edit Mode applies directly; batch installation keeps its reload.
        if command == "em" and type(result) == "table" then result.reloadRequired = false end
        if forceReload and type(result) == "table" then result.reloadRequired = true end
        if forceReload and ok ~= true and ns.DB and ns.DB.global then
            local failures = {}
            if type(result) == "table" then
                for name, reason in pairs(result.failures or {}) do
                    failures[#failures + 1] = tostring(name) .. ": " .. tostring(reason)
                end
                table.sort(failures)
            else failures[1] = tostring(result) end
            ns.DB.global.pendingImportFailure = {command=command,
                result=type(result)=="table" and {failures=result.failures or {[command]=table.concat(failures,"\n")}} or result}
        end
        if type(options.onComplete) == "function" then pcall(options.onComplete, ok, result) end
        -- Batch completion waits for all providers; partial failures must also reload.
        if forceReload then self:ForceReload()
        elseif ok ~= true and (command == "all" or command == "em") then
            self:PromptFailure(command, result)
        end
    end
    local supported, reason = ns.ProductManifest:CheckPreset(command)
    if not supported then complete(false, reason) return false, reason end
    if command ~= "all" then
        if activeRequests[command] or activeRequests.all then
            complete(false, "IMPORT_PENDING")
            return false, "IMPORT_PENDING"
        end
        -- Acquire before calling the provider, including synchronous callbacks.
        activeRequests[command] = request
        return self:RunOne(command, { onComplete = complete, canvasId = options.canvasId })
    end
    if next(activeRequests) then
        complete(false,"IMPORT_PENDING")
        return false,"IMPORT_PENDING"
    end
    activeRequests.all = request
    return RunBatch(self,complete)
end

function Service:IsSupported(command)
    command = self:Normalize(command)
    if not ns.ProductManifest:CheckPreset(command) then return false end
    if command == "all" or command == "em" then return true end
    if command == "rxp" then
        return type(ns.RXPStyleImporter) == "table" and type(ns.RXPStyleImporter.Import) == "function"
    end
    if command == "blizzard" then
        return type(ns.BlizzardSettingsImporter) == "table"
            and type(ns.BlizzardSettingsImporter.Import) == "function"
    end
    local importer = ns.LegacyPresetImports and ns.LegacyPresetImports[command]
    return type(importer) == "table" and type(importer.Import) == "function"
end

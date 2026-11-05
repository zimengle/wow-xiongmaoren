local _, ns = ...

local Commands = {}
ns.Commands = Commands

local COMMAND_KEY = "RURUTIASUITE_SETUP"

local function CommandInUse(command)
    command = string.lower(command)
    local key, value
    for key, value in pairs(_G) do
        if type(key) == "string" and string.match(key, "^SLASH_")
            and type(value) == "string" and string.lower(value) == command then
            return true, key
        end
    end
    return false
end

local function Print(message)
    local host = _G.RurutiaSuite
    if host and type(host.Print) == "function" then
        host.Print(message)
    elseif type(_G.print) == "function" then
        _G.print("[RSS] " .. tostring(message))
    end
end

local function StatusText()
    local ready, reason = ns.ProductManifest:Check("layoutSwitch")
    if not ready then return "RSS 布局尚未就绪：" .. tostring(reason) end
    local global = ns.DB and ns.DB.global
    local layout = global and global.layout
    if not layout then return "RSS 数据库尚未就绪。" end
    local inspected, profileStatus = ns.ProfileSwitcher:Inspect()
    local side = inspected and profileStatus.side or layout.side
    local provider = inspected and profileStatus.provider or "未识别"
    return string.format("编辑模式：%s；方向：%s；配置来源：%s；画布：%s。",
        layout.editModeLayoutName, side, provider, layout.canvasMode)
end

local function UserFacingReason(reason)
    if reason == "state-unknown-after-ellesmere-commit" then
        return "状态未知，需要 /reload 后检查"
    end
    return tostring(reason or "未知错误")
end

local COMMAND_NAMES = {
    em = "编辑模式",
    blizzard = "暴雪设置",
    rxp = "RXP 外观",
    cd = "冷却管理器",
    sensei = "中心资源条",
    jx = "酒仙资源条",
    at = "AT时间轴",
    exboss = "EXBOSS",
    canvasEdge = "边缘修正",
}

local function PrintPresetResult(command, ok, result)
    if not ok and result == "IMPORT_PENDING" then
        Print("正在等待确认：" .. (COMMAND_NAMES[command] or command) .. "，请先完成或取消插件中的导入确认。")
        return
    end
    if command == "all" and type(result) == "table" then
        local order = {}
        for _, item in ipairs(result.order or {}) do order[#order + 1] = item end
        if result.edgeCorrectionAttempted then order[#order + 1] = "canvasEdge" end
        local name
        for _, name in ipairs(order) do
            if result.results and result.results[name] then
                local item = result.results[name]
                if item.skipped then
                    Print("已跳过：" .. (COMMAND_NAMES[name] or name) .. "（" .. tostring(item.reason or "不可用") .. "）")
                else
                    Print("已处理：" .. (COMMAND_NAMES[name] or name))
                end
            elseif result.failures and result.failures[name] then
                Print("未完成：" .. (COMMAND_NAMES[name] or name) .. "（"
                    .. result.failures[name] .. "）")
            end
        end
        if ok then Print("露露整套配置已处理完成。")
        else Print("整套配置只完成了部分项目；未完成项目不会自动回滚已成功项目。") end
        if result.reloadRequired then Print("请执行 /reload 让全部配置生效。") end
        return
    end
    if ok then
        local changed = type(result) == "table" and result.changed == true
        Print((changed and "已导入：" or "无需重复导入：") .. (COMMAND_NAMES[command] or command))
        if type(result) == "table" and result.reloadRequired then
            Print("请执行 /reload 让配置生效。")
        end
    else
        Print("导入失败：" .. (COMMAND_NAMES[command] or command) .. "（"
            .. tostring(result) .. "）")
    end
end

function Commands:GetStatusText()
    return StatusText()
end

function Commands:CancelEdgeSwitch()
    self.edgeGeneration=(self.edgeGeneration or 0)+1
    if self.edgeToken and ns.Host and ns.Host.CancelSchedule then ns.Host:CancelSchedule(self.edgeToken) end
    self.edgeToken=nil
end

function Commands:QueueEdgeSwitch(side,result,onComplete)
    local generation=self.edgeGeneration
    local host=ns.Host
    local api=_G.EllesmereUI
    local target=({left="露露-左布局",middle="露露-中布局",right="露露-右布局"})[side]
    local function finish(status,reason,changed)
        result.edgeCorrection={status=status,reason=reason,changed=changed}
        if type(onComplete)=="function" then onComplete(result)
        elseif status=="failed" then Print("布局已切换，贴边未完成："..tostring(reason)) end
    end
    if not host or type(host.Schedule)~="function" then finish("failed","贴边调度不可用"); return end
    result.edgeCorrection={pending=true}
    -- EUI's synchronous refresh tail queues two next-frame passes. Queue one
    -- extra frame after those passes, never poll. Every continuation is owned
    -- by RSS and invalidated when another switch or manual operation occurs.
    local function step(remaining)
        self.edgeToken=nil
        if generation~=self.edgeGeneration then return end
        local readable,current=false,nil
        if api and type(api.GetActiveProfileName)=="function" then readable,current=pcall(api.GetActiveProfileName) end
        if not readable then finish("failed","无法读取当前布局，请稍后点击边缘修正"); return end
        if current~=target then
            finish("cancelled","当前布局已变化"); return
        end
        if remaining>0 then
            local scheduled,token=pcall(host.Schedule,host,0,function() step(remaining-1) end,"RSS:edge-switch")
            self.edgeToken=scheduled and token or nil
            if not self.edgeToken then finish("failed","贴边调度失败") end
            return
        end
        local layout=ns.DB and ns.DB.global and ns.DB.global.layout
        if not layout or layout.edgeOnSwitch==false then finish("cancelled","已关闭切换时贴边"); return end
        if api._specProfileSwitching or api._abAnchorSuppressed then
            finish("failed","布局仍在刷新，请稍后点击边缘修正"); return
        end
        local engine=ns.EllesmereEdgeCorrection
        local called,applied,reason=pcall(engine.RecalculateCurrentSide,engine)
        if not called then finish("failed",tostring(applied))
        elseif not applied then finish("failed",reason)
        else finish(applied.changed and "applied" or "unchanged",nil,applied.changed) end
    end
    local scheduled,token=pcall(host.Schedule,host,0,function() step(2) end,"RSS:edge-switch")
    self.edgeToken=scheduled and token or nil
    if not self.edgeToken then finish("failed","贴边调度失败") end
end

function Commands:SwitchSide(side,onEdgeComplete)
    if side == "middle" and not ns.ProductManifest:Check("middleLayout") then
        return false, "unsupported-on-current-build"
    end
    local ready, reason = ns.ProductManifest:Check("layoutSwitch")
    if not ready then return false, reason end
    if side ~= "left" and side ~= "middle" and side ~= "right" then
        return false, "无效的布局方向"
    end
    local global = ns.DB and ns.DB.global
    if not global or not global.layout then return false, "RSS 数据库尚未就绪" end
    local ready, readyReason = ns.Database:PrepareForSave()
    if not ready then return false, UserFacingReason(readyReason or "RSS 保存状态异常") end
    self:CancelEdgeSwitch()
    local engine=ns.EllesmereEdgeCorrection
    if engine and type(engine.ClearHistory)=="function" then
        local cleared,clearReason=engine:ClearHistory(true)
        if not cleared then return false,clearReason end
    end
    local switched, result = ns.ProfileSwitcher:Switch(side)
    if not switched then return false, UserFacingReason(result) end
    if engine and type(engine.ClearHistory)=="function"
        and (result.ellesmereCommitted or result.provider~="ellesmere") then engine:ClearHistory() end
    -- PrepareForSave may rebuild default-backed tables; reacquire the live view.
    local layout = ns.DB and ns.DB.global and ns.DB.global.layout
    if not layout then return false, "RSS 布局状态不可用" end
    layout.side = side
    if ns.ProductManifest:Check("canvasEdge")
        and (result.provider == "ellesmere" or result.provider == "ndui") and ns.LayoutIntegration then
        local ok, detail = ns.LayoutIntegration:Apply(side, false, result.provider)
        result.layoutIntegration = ok and detail or { partial = true, reason = detail }
        if not ok or detail.partial then
            Print("布局已切换，部分侧面组或距离监控联动未完成，请检查目标插件。")
        end
    end
    if result.provider=="ellesmere" and layout.edgeOnSwitch~=false and ns.ProductManifest:Check("canvasEdge") then
        if result.reloadRequired then result.edgeCorrection={status="reload-required"}
        elseif engine and type(engine.RecalculateCurrentSide)=="function" then self:QueueEdgeSwitch(side,result,onEdgeComplete)
        else result.edgeCorrection={status="failed",reason="贴边服务不可用"} end
    end
    if result.reloadRequired and ns.PresetCommandService then ns.PresetCommandService:PromptReload() end
    return true, result
end

function Commands:Handle(message)
    local supported, reason = ns.ProductManifest:CheckBuild()
    if not supported then return false, reason end
    local command = string.lower(string.match(tostring(message or ""), "^%s*(.-)%s*$") or "")
    if command == "" then
        return ns.Host and ns.Host:OpenPage("setup") or nil
    end
    if command == "status" then
        Print(StatusText())
        return true
    end
    local presetCommand = ns.PresetCommandService and ns.PresetCommandService:Normalize(command)
    if presetCommand and ns.ProductManifest:IsKnownPreset(presetCommand) then
        local imported, result = ns.PresetCommandService:Run(presetCommand, {
            onComplete = function(ok, detail) PrintPresetResult(presetCommand, ok, detail) end,
        })
        if imported and type(result) == "table" and result.pending then
            Print("等待确认：" .. (COMMAND_NAMES[presetCommand] or presetCommand) .. "，请按插件提示继续。")
        end
        return imported, result
    end
    if command == "left" or command == "middle" or command == "right" then
        local switched, result = self:SwitchSide(command)
        if not switched then
            Print("布局切换失败：" .. tostring(result))
            return false, result
        end
        local label = ({ left = "左布局", middle = "中布局", right = "右布局" })[command]
        if result.changed then
            if result.reloadRequired then
                Print("已选择" .. label .. "；请执行 /reload 让全部插件生效。")
            else
                Print("已切换到" .. label .. "。")
            end
        else
            Print("当前已经是" .. label .. "。")
        end
        return true, result
    end
    local names = { "/rss", "status" }
    for _, name in ipairs({ "left", "middle", "right", "all", "em", "rxp", "cd", "sensei", "jx", "at", "exboss", "exwind", "bigwigs" }) do
        if (name == "left" or name == "right") and ns.ProductManifest:Has("layoutSwitch")
            or name == "middle" and ns.ProductManifest:Has("middleLayout")
            or ns.ProductManifest:HasPreset(name) then names[#names + 1] = name end
    end
    Print("可用命令：" .. table.concat(names, "、") .. "。")
    return false, "unknown-command"
end

function Commands:Enable(handle)
    if self.enabled then return true end
    if type(_G.SlashCmdList) ~= "table" then
        return false, "SlashCmdList is unavailable"
    end
    local inUse, owner = CommandInUse("/rss")
    if inUse then return false, "/rss is already registered by " .. tostring(owner) end
    self.previousHandler = _G.SlashCmdList[COMMAND_KEY]
    self.previousAlias = _G.SLASH_RURUTIASUITE_SETUP1
    _G.SlashCmdList[COMMAND_KEY] = function(message) self:Handle(message) end
    _G.SLASH_RURUTIASUITE_SETUP1 = "/rss"
    ns.Host = handle
    self.enabled = true
    return true
end

function Commands:Disable()
    self:CancelEdgeSwitch()
    if not self.enabled then return true end
    _G.SlashCmdList[COMMAND_KEY] = self.previousHandler
    _G.SLASH_RURUTIASUITE_SETUP1 = self.previousAlias
    self.previousHandler = nil
    self.previousAlias = nil
    self.enabled = false
    return true
end

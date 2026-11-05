local _, ns = ...

local TransferPage = {}
ns.TransferPage = TransferPage

local function GetHostUI()
    local host = _G.RurutiaSuite
    return host and host.UI
end

local function State(context)
    context.rssTransfer = context.rssTransfer or {
        message = "",
    }
    return context.rssTransfer
end

local function Refresh(context, message, reason)
    local state = State(context)
    if message then state.message = message end
    local page = state.page
    if page and type(page.Refresh) == "function" and not state.refreshing then
        state.refreshing = true
        local refreshed, refreshReason = pcall(page.Refresh, page, reason or "rss-transfer")
        state.refreshing = false
        return refreshed, refreshReason
    end
    return false, "transfer page refresh unavailable"
end

local function Translate(reason)
    local map = {
        ["combat-lockdown"] = "请脱离战斗后再操作。",
        ["addon-not-loaded"] = "未安装或无法加载AT时间轴（AbilityTimeline）。",
        ["payload-missing"] = "请先粘贴分享字符串。",
        ["payload-too-large"] = "分享字符串超过安全体积限制。",
        ["unsupported-codec"] = "不是受支持的AT时间轴分享字符串。",
        ["readback-mismatch"] = "导入回读不一致，已恢复原配置。",
        ["service-unavailable"] = "配置迁移服务不可用，请 /reload 后重试。",
        ["service-error"] = "配置迁移服务调用失败，请 /reload 后重试。",
    }
    return map[reason] or tostring(reason or "未知错误")
end

local function HasPayload(value)
    return type(value) == "string" and value:find("%S") ~= nil
end

local function CallService(method, ...)
    local ready, reason = ns.ProductManifest:Check("transfer")
    if not ready then return false, nil, reason end
    local service = ns.TransferService
    if type(service) ~= "table" or type(service[method]) ~= "function" then
        return false, nil, "service-unavailable"
    end
    local invoked, first, second = pcall(service[method], service, ...)
    if not invoked then return false, nil, "service-error" end
    return true, first, second
end

local function AddTransferSection(page, context, options)
    local section = page:Section(options.title, { description = options.description })
    local actions = section:ActionRow({ columns = 2 })
    actions:Button(options.key .. "Export", {
        text = "导出",
        onAction = function()
            local invoked, payload, reason = CallService(options.exportMethod)
            if not invoked or not HasPayload(payload) then
                Refresh(context, "导出失败：" .. Translate(reason))
                return false
            end
            local dialog = page:ShowTextDialog({
                title = options.title .. " · 导出",
                mode = "view",
                description = "复制下方字符串后关闭。",
                value = payload, selectAll = true, maxLetters = options.maxLetters,
            })
            return dialog ~= nil
        end,
    })
    actions:Button(options.key .. "Import", {
        text = "导入",
        onAction = function()
            local dialog = page:ShowTextDialog({
                title = options.title .. " · 导入",
                description = options.description,
                maxLetters = options.maxLetters, confirmLabel = "确认导入",
                onConfirm = function(payload)
                    if not HasPayload(payload) then return false, "请先粘贴分享字符串。" end
                    local invoked, ok, result = CallService(options.importMethod, payload)
                    if invoked and ok then
                        local note = type(result) == "table" and result.legacyNote or nil
                        Refresh(context, (note or (options.title .. "已导入；")) .. "请 /reload 让全部模块重新加载。")
                        return true
                    end
                    return false, "导入失败：" .. Translate(result)
                end,
            })
            return dialog ~= nil
        end,
    })
end

local function BuildUnavailable(context)
    local ui = GetHostUI()
    if type(ui) ~= "table" or type(ui.CreateSettingsPage) ~= "function" then
        return false, "RurutiaSuite SettingsBuilder is unavailable"
    end
    local page, reason = ui:CreateSettingsPage(context, { id = "transfer" })
    if not page then return false, reason end
    local state = State(context)
    state.page = page
    if state.unavailableBuilt then
        Refresh(context, nil, "reuse")
        return page
    end
    state.unavailableBuilt = true
    page:Section("配置管理"):Description("当前客户端未开放配置迁移。", {
        textToken = "color.text.normal",
    })
    page:Finish()
    return page
end

function TransferPage:Build(context)
    local ready, reason = ns.ProductManifest:Check("transfer")
    if not ready then return false, reason end
    local ui = GetHostUI()
    if type(ui) ~= "table" or type(ui.CreateSettingsPage) ~= "function" then
        return false, "RurutiaSuite SettingsBuilder is unavailable"
    end
    local page, reason = ui:CreateSettingsPage(context, { id = "transfer" })
    if not page then return false, reason end
    local state = State(context)
    state.page = page
    if page:GetControl("rsTransferExport") then Refresh(context, nil, "reuse") return page end

    AddTransferSection(page, context, {
        title = "RS 设置迁移",
        description = "新版字符串替换 RS 设置；旧版字符串迁入外观与 RSS 自动化设置，保留当前模块开关、模块设置和本机提醒。",
        key = "rsTransfer",
        maxLetters = 262144,
        exportMethod = "ExportRS",
        importMethod = "ImportRS",
    })
    if ns.ProductManifest:CheckPreset("at") then
    AddTransferSection(page, context, {
        title = "AT时间轴设置迁移",
        description = "导入会替换AT时间轴设置。",
        key = "atTransfer",
        maxLetters = 524288,
        exportMethod = "ExportAT",
        importMethod = "ImportAT",
    })
    end
    page:Description(function() return state.message end, {
        textToken = "color.text.normal",
        minHeight = 20, hideWhenEmpty = true,
    })
    page:Finish()
    return page
end

function TransferPage:GetUnsupportedDefinition()
    return {
        id = "transfer",
        title = "配置管理",
        description = "当前客户端未开放配置迁移。",
        group = "management",
        groupOrder = 70,
        navigationOrder = 10,
        searchKeywords = { "RSS", "配置管理", "配置迁移", "导入", "导出", "字符串", "AbilityTimeline" },
        build = function(context) return BuildUnavailable(context) end,
        onShow = function(context) Refresh(context) end,
        onRefresh = function(context) Refresh(context) end,
    }
end

function TransferPage:GetDefinition()
    if not ns.ProductManifest:Check("transfer") then
        return self:GetUnsupportedDefinition()
    end
    return {
        id = "transfer",
        title = "配置管理",
        description = "导入或导出RS配置字符串。",
        group = "management",
        groupOrder = 70,
        navigationOrder = 10,
        searchKeywords = { "RSS", "配置管理", "配置迁移", "导入", "导出", "字符串", "AbilityTimeline" },
        build = function(context) return self:Build(context) end,
        onShow = function(context) Refresh(context) end,
        onRefresh = function(context) Refresh(context) end,
    }
end

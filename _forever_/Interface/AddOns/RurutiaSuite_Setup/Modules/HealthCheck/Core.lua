local _, ns = ...

local Health = {}
ns.HealthCheckService = Health

local READINESS_RETRY_DELAY = 2
local CATEGORY_LABELS = {
    editMode = "编辑模式",
    uiLayout = "UI 布局",
    cooldown = "冷却管理器",
    sensei = "中心资源条",
    automation = "自动化依赖",
    activation = "预设使用状态",
    ellesQuickSignup = "Elles 快速申请",
}

local function Add(issues, category, code, title, detail, metadata)
    local issue = { category = category, code = code, title = title, detail = detail }
    if type(metadata) == "table" then
        issue.data = metadata.data
        issue.fingerprint = metadata.fingerprint
    end
    issues[#issues + 1] = issue
    return issue
end

local function AddPending(pending, category, reason)
    pending[#pending + 1] = {
        category = category,
        reason = tostring(reason or "not-ready"),
    }
end

local function IsInCombat()
    local check = _G.InCombatLockdown
    if type(check) ~= "function" then return false end
    local ok, locked = pcall(check)
    return ok and locked == true
end

local function IsAddonLoaded(name)
    local addons = _G.C_AddOns
    local isLoaded = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(isLoaded) ~= "function" then return false end
    local ok, loadedOrLoading, loaded = pcall(isLoaded, name)
    return ok and (loadedOrLoading == true or loaded == true)
end

local function Wants(options, category)
    return ns.ProductManifest:HasHealthCategory(category)
        and (type(options) ~= "table" or type(options.wants) ~= "table"
            or options.wants[category] == true)
end

local function CheckEnabledAutomation(issues, pending, status, options)
    local settings = ns.DB and ns.DB.global and ns.DB.global.automation or {}
    if settings.enabled == false then return end
    if settings.senseiBrewmaster == true and Wants(options, "sensei")
        and IsAddonLoaded("SenseiClassResourceBar") then
        local api = _G.SCRB
        if type(api) ~= "table" or type(api.importProfileFromString) ~= "function" then
            Add(issues, "sensei", "sensei-api", "Sensei 接口不可用", "当前 Sensei 版本没有配置导入接口。")
        end
    end
    local main = status and status.main
    if settings.dandersProfile == true and Wants(options, "automation")
        and IsAddonLoaded("DandersFrames") then
        if main == nil then
            AddPending(pending, "automation", "profile-provider-not-ready")
        elseif main.provider ~= "ellesmere" then
            local db = _G.DandersFramesDB_v2
            local profiles = type(db) == "table" and db.profiles or nil
            if type(profiles) ~= "table" then
                AddPending(pending, "automation", "danders-database-not-ready")
            elseif type(profiles["露露-右布局"]) ~= "table"
                or type(profiles["露露-右布局大团框"]) ~= "table" then
                Add(issues, "automation", "danders-profiles", "DandersFrames 配置不完整", "缺少露露右布局或大团框配置。")
            end
        end
    end
end

local function SenseiConfigured()
    local db = _G.SenseiClassResourceBarDB
    local catalog = ns.EditModePresets
    local layoutName = catalog and catalog.layoutName or "露露"
    if type(db) ~= "table" then return false end
    local key, layouts
    for key, layouts in pairs(db) do
        if key ~= "_Settings" and type(layouts) == "table" and layouts[layoutName] ~= nil then
            return true
        end
    end
    return false
end

local function IsEllesQuickSignupEnabled()
    local db = _G.EllesmereUIDB
    return IsAddonLoaded("EllesmereUI") and type(db) == "table" and db.quickSignup == true
end

function Health:GetReminderSettings()
    return ns.DB and ns.DB.global and ns.DB.global.health or nil
end

function Health:IsReminderEnabled()
    local health = self:GetReminderSettings()
    return type(health) == "table" and health.reminderEnabled ~= false
end

function Health:Inspect(options)
    local supported, buildReason = ns.ProductManifest:CheckBuild()
    if not supported then return nil, buildReason end
    if IsInCombat() then return nil, "combat" end

    options = type(options) == "table" and options or nil
    local issues, pending, skipped = {}, {}, {}
    local hostVersion = _G.RurutiaSuite and _G.RurutiaSuite.version
    local setupVersion = ns.version
    if Wants(options, "ellesQuickSignup") and IsEllesQuickSignupEnabled() then
        Add(issues, "ellesQuickSignup", "elles-quick-signup",
            "Elles 快速申请会跳过手动申请说明",
            "关闭后可以在集合石申请时手动填写说明；也可以保留并关闭此项登录提醒。")
    end
    if type(hostVersion) ~= "string" or type(setupVersion) ~= "string" then
        AddPending(pending, "critical", "generation-not-ready")
    elseif string.match(hostVersion, "^(%d+)") ~= string.match(setupVersion, "^(%d+)") then
        Add(issues, "critical", "generation", "RS 与 RSS 版本不配套", "请使用同一套新版 RS 与 RSS。")
    end

    local wantsEditMode = Wants(options, "editMode")
    local wantsActivation = Wants(options, "activation")
    if wantsEditMode or wantsActivation then
        if IsInCombat() then return nil, "combat" end
        local importer = ns.EditModeImporter
        local ready, readyReason = true, nil
        if not ns.ProductManifest:Has("editModeActivation") then
            ready, readyReason = ns.ProductManifest:CheckPreset("em")
        end
        if not ready then
            AddPending(pending, wantsEditMode and "editMode" or "activation", readyReason)
        elseif type(importer) ~= "table" or type(importer.Inspect) ~= "function" then
            AddPending(pending, wantsEditMode and "editMode" or "activation", "editmode-inspector-not-ready")
        else
            local called, editMode, editReason = pcall(importer.Inspect, importer, true, true)
            if not called or type(editMode) ~= "table" then
                AddPending(pending, wantsEditMode and "editMode" or "activation",
                    called and editReason or "editmode-inspector-error")
            else
                if wantsEditMode and editMode.exists ~= true then
                    Add(issues, "editMode", "editmode-missing", "缺少“露露”编辑模式布局", "请先导入当前画布预设。")
                end
                -- 未保存修改标记不阻塞显式导入（会直接替换“露露”），体检不再提示。
                if wantsEditMode and not (options and options.login) and editMode.blockReason
                    and editMode.blockReason ~= "edit-mode-unsaved-changes" then
                    Add(issues, "editMode", editMode.blockReason, "编辑模式暂时不能导入",
                        ns.LayoutPolicy:GetEditModeBlockMessage(editMode.blockReason) or editMode.blockReason)
                end

            end
        end
    end

    local wantsUILayout = Wants(options, "uiLayout")
    local wantsAutomation = Wants(options, "automation")
    local wantsProfileActivation = wantsActivation
    local automation = ns.DB and ns.DB.global and ns.DB.global.automation or {}
    local needsAutomationProfile = wantsAutomation and automation.enabled ~= false and automation.dandersProfile == true
        and IsAddonLoaded("DandersFrames")
    -- EUI uses exact design profiles on every screen size; its old canvas
    -- exemptions are retired. Other UI providers retain their login scope.
    if options and options.login == true and ns.ProductManifest:Check("layoutSwitch")
        and not IsAddonLoaded("EllesmereUI") then
        wantsUILayout = false
        wantsProfileActivation = wantsProfileActivation
            and (IsAddonLoaded("ElvUI") or IsAddonLoaded("NDui"))
    end
    local status
    if (wantsUILayout or wantsProfileActivation or needsAutomationProfile) and ns.ProductManifest:Check("layoutSwitch") then
        if IsInCombat() then return nil, "combat" end
        local switcher = ns.ProfileSwitcher
        if type(switcher) ~= "table" or type(switcher.Inspect) ~= "function" then
            AddPending(pending, wantsUILayout and "uiLayout" or "activation", "profile-inspector-not-ready")
        else
            local called, inspected, inspectedStatus = pcall(switcher.Inspect, switcher)
            if not called or inspected ~= true or type(inspectedStatus) ~= "table"
                or type(inspectedStatus.main) ~= "table"
                or type(inspectedStatus.main.available) ~= "table" then
                AddPending(pending, wantsUILayout and "uiLayout" or "activation",
                    called and inspectedStatus or "profile-inspector-error")
            else
                status = inspectedStatus
                local main = status.main
                if wantsUILayout and (main.available.left ~= true or main.available.right ~= true) then
                    Add(issues, "uiLayout", "profiles-missing", "左右布局配置不完整", "缺少露露左布局或右布局配置。")
                end
                if wantsProfileActivation and main.side == "unknown" then
                    Add(issues, "activation", "profile-inactive", "当前没有使用露露界面布局", "露露左右布局已经安装，可以在预设安装器中切换。")
                elseif wantsUILayout and status.mixed then
                    Add(issues, "uiLayout", "profile-mixed", "界面布局状态不一致", "主界面与 DandersFrames 当前左右方向不一致。")
                end
            end
        end
    end

    local wantsCooldown = Wants(options, "cooldown")
    if (wantsCooldown or wantsActivation) and ns.ProductManifest:HasHealthCategory("cooldown") then
        if IsInCombat() then return nil, "combat" end
        local cooldown = ns.LegacyPresetImports and ns.LegacyPresetImports.Cooldown
        if type(cooldown) ~= "table" or type(cooldown.Inspect) ~= "function" then
            AddPending(pending, wantsCooldown and "cooldown" or "activation", "cooldown-inspector-not-ready")
        else
            local called, cooldownStatus = pcall(cooldown.Inspect, cooldown)
            if not called or type(cooldownStatus) ~= "table" or cooldownStatus.status == "unavailable" then
                AddPending(pending, wantsCooldown and "cooldown" or "activation",
                    called and cooldownStatus and cooldownStatus.reason or "cooldown-inspector-error")
            else
                if wantsCooldown and (cooldownStatus.status == "missing" or cooldownStatus.status == "different") then
                    local details = {}
                    local missing, different = {}, {}
                    local _, spec
                    for _, spec in ipairs(type(cooldownStatus.specs) == "table" and cooldownStatus.specs or {}) do
                        if spec.status == "missing" then missing[#missing + 1] = spec.displayName or spec.name end
                        if spec.status == "different" then different[#different + 1] = spec.displayName or spec.name end
                    end
                    if #missing == 0 then missing = type(cooldownStatus.missing) == "table" and cooldownStatus.missing or {} end
                    if #different == 0 then different = type(cooldownStatus.different) == "table" and cooldownStatus.different or {} end
                    if #missing > 0 then details[#details + 1] = "缺少：" .. table.concat(missing, "、") end
                    if #different > 0 then details[#details + 1] = "已修改：" .. table.concat(different, "、") end
                    Add(issues, "cooldown", "cooldown-" .. cooldownStatus.status,
                        "冷却管理器预设不完整", table.concat(details, "；"), {
                            data = cooldownStatus,
                            fingerprint = cooldownStatus.fingerprint,
                        })
                elseif wantsActivation and cooldownStatus.status == "current" and cooldownStatus.active == false then
                    Add(issues, "activation", "cooldown-inactive", "当前没有使用露露冷却预设",
                        "已安装“" .. tostring(cooldownStatus.expectedActiveLayoutName or "当前专精预设")
                            .. "”，当前使用“" .. tostring(cooldownStatus.activeLayoutName or "其他预设") .. "”。")
                end
            end
        end
    end

    if Wants(options, "sensei") and IsAddonLoaded("SenseiClassResourceBar") then
        if IsInCombat() then return nil, "combat" end
        if type(_G.SenseiClassResourceBarDB) == "table" then
            local called, configured = pcall(SenseiConfigured)
            if not called then
                AddPending(pending, "sensei", "sensei-inspector-error")
            elseif not configured then
                Add(issues, "sensei", "sensei-layout-missing", "中心资源条预设不完整", "编辑模式“露露”下没有中心资源条配置。")
            end
        else
            AddPending(pending, "sensei", "sensei-database-not-ready")
        end
    end

    if Wants(options, "automation") or Wants(options, "sensei") then
        if IsInCombat() then return nil, "combat" end
        local called = pcall(CheckEnabledAutomation, issues, pending, status, options)
        if not called then AddPending(pending, "automation", "automation-inspector-error") end
    end

    if IsInCombat() then return nil, "combat" end
    self.snapshot = {
        issues = issues,
        pending = pending,
        skipped = skipped,
        checkedAt = type(_G.time) == "function" and _G.time() or 0,
    }
    self:PruneAcknowledgedIssues(self.snapshot)
    return self.snapshot
end

function Health:GetSnapshot()
    return self.snapshot or { issues = {}, pending = {} }
end

function Health:SetReminderEnabled(enabled)
    local health = self:GetReminderSettings()
    if type(health) ~= "table" then return false, "RSS 健康检查配置不可用" end
    health.reminderEnabled = enabled and true or false
    if not enabled then self:HideCallout() end
    return true
end

function Health:IsCategoryIgnored(category)
    local health = self:GetReminderSettings()
    if category == "activation" then
        return type(health) ~= "table" or health.activationReminder ~= true
    end
    local ignored = health and health.ignoredCategories
    return CATEGORY_LABELS[category] ~= nil and type(ignored) == "table" and ignored[category] == true
end

function Health:SetCategoryIgnored(category, ignored)
    if not ns.ProductManifest:HasHealthCategory(category) then return false, "unsupported-on-current-build" end
    if CATEGORY_LABELS[category] == nil then return false, "未知的登录检查分类" end
    local health = self:GetReminderSettings()
    if type(health) ~= "table" then return false, "RSS 健康检查配置不可用" end
    if category == "activation" then
        health.activationReminder = not ignored
        return true
    end
    local categories = rawget(health, "ignoredCategories")
    if type(categories) ~= "table" then
        categories = {}
        rawset(health, "ignoredCategories", categories)
    end
    -- 冷却检查默认关闭，显式 false 才能保留玩家主动开启的选择。
    if category == "cooldown" then
        categories[category] = ignored and true or false
    else
        categories[category] = ignored and true or nil
    end
    return true
end

local function IssueAcknowledgementKey(issue)
    if type(issue) ~= "table" or type(issue.category) ~= "string"
        or type(issue.fingerprint) ~= "string" or issue.fingerprint == "" then
        return nil
    end
    return issue.category .. ":" .. issue.fingerprint
end

function Health:GetAcknowledgedIssues()
    local health = self:GetReminderSettings()
    if type(health) ~= "table" then return nil end
    local acknowledged = rawget(health, "acknowledgedIssues")
    if type(acknowledged) ~= "table" then
        acknowledged = {}
        rawset(health, "acknowledgedIssues", acknowledged)
    end
    return acknowledged
end

function Health:IsIssueAcknowledged(issue)
    local key = IssueAcknowledgementKey(issue)
    local acknowledged = key and self:GetAcknowledgedIssues() or nil
    return type(acknowledged) == "table" and acknowledged[key] == true
end

function Health:AcknowledgeSnapshot(snapshot)
    local acknowledged = self:GetAcknowledgedIssues()
    if type(acknowledged) ~= "table" then return false end
    local changed, issue = false, nil
    for _, issue in ipairs(snapshot and snapshot.issues or {}) do
        local key = IssueAcknowledgementKey(issue)
        if key and acknowledged[key] ~= true then acknowledged[key], changed = true, true end
    end
    return changed
end

function Health:PruneAcknowledgedIssues(snapshot)
    local acknowledged = self:GetAcknowledgedIssues()
    if type(acknowledged) ~= "table" then return false end
    local current, issue, key = {}, nil, nil
    for _, issue in ipairs(snapshot and snapshot.issues or {}) do
        key = IssueAcknowledgementKey(issue)
        if key then current[key] = true end
    end
    local changed = false
    for key in pairs(acknowledged) do
        if not current[key] then acknowledged[key], changed = nil, true end
    end
    return changed
end

function Health:FilterLoginIssues(snapshot)
    local filtered = { issues = {}, pending = {}, checkedAt = snapshot and snapshot.checkedAt or 0 }
    local index, issue
    for index, issue in ipairs(snapshot and snapshot.issues or {}) do
        if not self:IsCategoryIgnored(issue.category) and not self:IsIssueAcknowledged(issue) then
            filtered.issues[#filtered.issues + 1] = issue
        end
    end
    return filtered
end

function Health:HideCallout()
    if self.callout and type(self.callout.Hide) == "function" then self.callout:Hide("health") end
end

function Health:ShowCallout(snapshot)
    if not self:IsReminderEnabled() then return false end
    snapshot = snapshot or self:GetSnapshot()
    if not snapshot.issues or #snapshot.issues == 0 then self:HideCallout() return false end
    local host = _G.RurutiaSuite
    local ui = host and host.UI
    if type(ui) ~= "table" or type(ui.CreateCallout) ~= "function" or not _G.UIParent then return false end
    local quickSignup
    local index
    for index = 1, #snapshot.issues do
        if snapshot.issues[index].category == "ellesQuickSignup" then
            quickSignup = snapshot.issues[index]
            break
        end
    end
    local function RemainingWithoutQuickSignup()
        local remaining = { issues = {}, pending = {}, checkedAt = snapshot.checkedAt or 0 }
        local issue
        for _, issue in ipairs(snapshot.issues or {}) do
            if issue.category ~= "ellesQuickSignup" then remaining.issues[#remaining.issues + 1] = issue end
        end
        return remaining
    end
    local function ContinueAfterQuickSignup()
        Health:HideCallout()
        local remaining = RemainingWithoutQuickSignup()
        if #remaining.issues > 0 then Health:ShowCallout(remaining) end
    end
    if quickSignup then
        local options = {
            relativeTo = _G.UIParent, point = "CENTER", relativePoint = "CENTER", y = 80,
            width = 520, columns = 3, rowHeight = 32, mouseEnabled = true,
            items = {
                { text = "Elles 快速申请", span = 3, height = 28, fontSize = 17 },
                { text = quickSignup.detail, span = 3, height = 48, justifyH = "LEFT" },
                { kind = "button", text = "关闭快速申请", onClick = function()
                    Health:DisableEllesQuickSignup()
                    ContinueAfterQuickSignup()
                end },
                { kind = "button", text = "保留快速申请", onClick = ContinueAfterQuickSignup },
                { kind = "button", text = "不再提醒", onClick = function()
                    Health:SetCategoryIgnored("ellesQuickSignup", true)
                    ContinueAfterQuickSignup()
                end },
            },
        }
        if not self.callout then self.callout = ui:CreateCallout(_G.UIParent, options) end
        return self.callout and self.callout:Show(options) or false
    end
    local function Summary()
        local lines = {}
        for index = 1, math.min(4, #snapshot.issues) do
            local issue = snapshot.issues[index]
            lines[#lines + 1] = "• " .. issue.title
            if issue.category == "cooldown" and type(issue.detail) == "string" and issue.detail ~= "" then
                local className = issue.data and issue.data.className
                lines[#lines + 1] = "  " .. (className and ("当前职业：" .. className .. "｜") or "") .. issue.detail
            end
        end
        if #snapshot.issues > 4 then lines[#lines + 1] = "• 另有 " .. (#snapshot.issues - 4) .. " 项" end
        return table.concat(lines, "\n")
    end
    local hasAcknowledgement, hasCooldown, hasEditMode = false, false, false
    local issue
    for _, issue in ipairs(snapshot.issues) do
        if IssueAcknowledgementKey(issue) then hasAcknowledgement = true end
        if issue.category == "cooldown" then hasCooldown = true end
        if issue.category == "editMode" then hasEditMode = true end
    end
    local hasUILayout = false
    for _, issue in ipairs(snapshot.issues) do if issue.category == "uiLayout" then hasUILayout = true end end
    local columns = (hasAcknowledgement or hasEditMode or hasUILayout) and 3 or 2
    local options = {
        relativeTo = _G.UIParent, point = "CENTER", relativePoint = "CENTER", y = 80,
        width = hasCooldown and 560 or 440, columns = columns, rowHeight = 32, mouseEnabled = true,
        items = {
            { text = "RSS 检测到需要处理的安装状态", span = columns, height = 28, fontSize = 17 },
            { text = Summary(), span = columns, height = math.max(42, #snapshot.issues * 24 + (hasCooldown and 22 or 0)), justifyH = "LEFT" },
            { kind = "button", text = hasEditMode and "打开安装" or (hasCooldown and "查看具体差异" or "打开安装"), onClick = function()
                Health:HideCallout()
                if ns.Host then ns.Host:OpenPage("setup", {
                    source = hasEditMode and "health-install" or "health", issues = snapshot.issues,
                }) end
            end },
            { kind = "button", text = "稍后处理", onClick = function()
                Health:HideCallout()
            end },
        },
    }
    if hasEditMode then
        options.items[#options.items + 1] = {
            kind = "button", text = "不再提示", onClick = function()
                Health:SetCategoryIgnored("editMode", true)
                Health:HideCallout()
                local remaining = Health:FilterLoginIssues(snapshot)
                if #remaining.issues > 0 then Health:ShowCallout(remaining) end
            end,
        }
    elseif hasUILayout then
        options.items[#options.items + 1] = {
            kind = "button", text = "不再提醒", onClick = function()
                Health:SetCategoryIgnored("uiLayout", true)
                Health:HideCallout()
                local remaining = Health:FilterLoginIssues(snapshot)
                if #remaining.issues > 0 then Health:ShowCallout(remaining) end
            end,
        }
    elseif hasAcknowledgement then
        options.items[#options.items + 1] = {
            kind = "button", text = "忽略当前差异", onClick = function()
                Health:AcknowledgeSnapshot(snapshot)
                Health:HideCallout()
            end,
        }
    end
    if not self.callout then self.callout = ui:CreateCallout(_G.UIParent, options) end
    return self.callout and self.callout:Show(options) or false
end

function Health:DisableEllesQuickSignup()
    if not ns.ProductManifest:HasHealthCategory("ellesQuickSignup") then return false, "unsupported-on-current-build" end
    if IsInCombat() then return false, "combat" end
    local db = _G.EllesmereUIDB
    if type(db) ~= "table" or db.quickSignup ~= true then return false, "not-enabled" end
    db.quickSignup = false
    local provider = _G.EllesmereUI
    if type(provider) == "table" and type(provider._applyQuickSignup) == "function" then
        local ok = pcall(provider._applyQuickSignup)
        if not ok then return true, "reload-required" end
    end
    return true
end

function Health:BuildLoginInspectOptions()
    local wants = {}
    for category in pairs(CATEGORY_LABELS) do
        wants[category] = ns.ProductManifest:HasHealthCategory(category) and not self:IsCategoryIgnored(category)
    end
    return { wants = wants, login = true }
end

function Health:CancelSchedule(key)
    local token = self[key]
    if token and self.handle then self.handle:CancelSchedule(token) end
    self[key] = nil
end

function Health:QueueAfterCombat(manual, automatic, isReadinessRetry)
    self.pendingCombatManual = self.pendingCombatManual or manual == true
    self.pendingCombatAutomatic = self.pendingCombatAutomatic or automatic == true
    self.pendingCombatReadinessRetry = self.pendingCombatReadinessRetry or isReadinessRetry == true
    if self.combatToken then return true end
    if not self.enabled or not ns.EventHub then return false, "health check is disabled" end
    local token, reason = ns.EventHub:Subscribe("PLAYER_REGEN_ENABLED", function()
        self:OnCombatEnded()
    end)
    if not token then return false, reason end
    self.combatToken = token
    return true
end

function Health:ScheduleReadinessRetry(manual, automatic)
    self.pendingReadinessManual = self.pendingReadinessManual or manual == true
    self.pendingReadinessAutomatic = self.pendingReadinessAutomatic or automatic == true
    if self.readinessSchedule then return true end
    if not self.enabled or not self.handle then return false, "health check is disabled" end
    local token, reason = self.handle:Schedule(READINESS_RETRY_DELAY, function()
        self.readinessSchedule = nil
        local retryManual = self.pendingReadinessManual == true
        local retryAutomatic = self.pendingReadinessAutomatic == true
        self.pendingReadinessManual = nil
        self.pendingReadinessAutomatic = nil
        if not self.enabled then return end
        self:ExecuteRequests(retryManual, retryAutomatic, true)
    end, "RSS:health-readiness")
    if not token then
        self.pendingReadinessManual = nil
        self.pendingReadinessAutomatic = nil
        return false, reason
    end
    self.readinessSchedule = token
    return true
end

function Health:ExecuteRequests(manual, automatic, isReadinessRetry)
    manual = manual == true
    automatic = automatic == true
    if not manual and not automatic then return self:GetSnapshot() end
    if IsInCombat() then
        self:QueueAfterCombat(manual, automatic, isReadinessRetry)
        return nil, "combat"
    end

    if automatic and not isReadinessRetry and self.checkedThisSession then
        automatic = false
        if not manual then return self:GetSnapshot(), "session-gated" end
    end
    if automatic and not self:IsReminderEnabled() then
        self.checkedThisSession = true
        automatic = false
        if not manual then return self:GetSnapshot(), "reminder-disabled" end
    end

    local inspectOptions
    if not manual then inspectOptions = self:BuildLoginInspectOptions() end
    local snapshot, reason = self:Inspect(inspectOptions)
    if not snapshot then
        if reason == "combat" then self:QueueAfterCombat(manual, automatic, isReadinessRetry) end
        return nil, reason
    end
    if IsInCombat() then
        self:QueueAfterCombat(manual, automatic, isReadinessRetry)
        return nil, "combat"
    end
    if automatic then self.checkedThisSession = true end

    if #snapshot.pending > 0 and not isReadinessRetry then
        self:ScheduleReadinessRetry(manual, automatic)
        return snapshot, "readiness-pending"
    end

    if automatic and not self.calloutShownThisSession then
        local shown = self:ShowCallout(self:FilterLoginIssues(snapshot))
        if shown then self.calloutShownThisSession = true end
    end
    return snapshot
end

function Health:Run(manual)
    return self:ExecuteRequests(manual == true, manual ~= true, false)
end

function Health:OnCombatEnded()
    if IsInCombat() then return false, "combat" end
    if self.combatToken then ns.EventHub:Unsubscribe(self.combatToken) end
    self.combatToken = nil
    local manual = self.pendingCombatManual == true
    local automatic = self.pendingCombatAutomatic == true
    local isReadinessRetry = self.pendingCombatReadinessRetry == true
    self.pendingCombatManual = nil
    self.pendingCombatAutomatic = nil
    self.pendingCombatReadinessRetry = nil
    return self:ExecuteRequests(manual, automatic, isReadinessRetry)
end

function Health:Enable(handle)
    local supported, reason = ns.ProductManifest:Check("health")
    if not supported then return false, reason end
    if self.enabled then return true end
    self.handle, self.enabled = handle, true
    self.eventToken = ns.EventHub:Subscribe("PLAYER_ENTERING_WORLD", function(_, initial, reload)
        if ns.PresetCommandService and ns.PresetCommandService.ShowPendingImportFailure then
            ns.PresetCommandService:ShowPendingImportFailure()
        end
        if self.loginRequestedThisSession or self.checkedThisSession
            or (initial ~= true and reload ~= true) then return end
        self.loginRequestedThisSession = true
        local token = handle:Schedule(3, function()
            self.loginSchedule = nil
            if self.enabled then self:ExecuteRequests(false, true, false) end
        end, "RSS:health-login")
        if token then self.loginSchedule = token
        else self.loginRequestedThisSession = nil end
    end, self)
    if not self.eventToken then
        self.handle, self.enabled = nil, false
        return false, "unable to subscribe health check"
    end
    return true
end

function Health:Disable()
    if self.eventToken then ns.EventHub:Unsubscribe(self.eventToken) end
    if self.combatToken then ns.EventHub:Unsubscribe(self.combatToken) end
    self:CancelSchedule("loginSchedule")
    self:CancelSchedule("readinessSchedule")
    if self.callout then self.callout:Release() end
    self.eventToken, self.combatToken, self.callout, self.handle = nil, nil, nil, nil
    self.pendingCombatManual, self.pendingCombatAutomatic = nil, nil
    self.pendingCombatReadinessRetry = nil
    self.pendingReadinessManual, self.pendingReadinessAutomatic = nil, nil
    self.loginRequestedThisSession, self.checkedThisSession = nil, nil
    self.calloutShownThisSession, self.enabled = nil, false
    return true
end

return Health

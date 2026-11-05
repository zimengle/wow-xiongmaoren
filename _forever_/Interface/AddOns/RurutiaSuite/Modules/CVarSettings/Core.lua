local _, ns = ...

local Adapter = ns.CVarSettingsAdapter
local Data = ns.CVarSettingsData
if type(Adapter) ~= "table" or type(Data) ~= "table" then
    error("CVarSettings requires a Build adapter and data before Core.lua", 2)
end

-- 组合姓名板 CVar 的位数来自暴雪 NamePlateConstantsDocumentation（forever @ 70ef1b2）：
-- StackType=2 位、InfoDisplay=3 位、CastBarDisplay=5 位、ThreatDisplay=3 位。按位读写，
-- 不把控制字符形态的原始值当字符串写入。
local NAMEPLATE_BITFIELDS = {
    nameplateStackingTypes = 2,
    nameplateInfoDisplay = 3,
    nameplateCastBarDisplay = 5,
    nameplateThreatDisplay = 3,
}

local function IsNameplateCVar(cvar)
    if type(cvar) ~= "string" then return false end
    local wanted = string.lower(cvar)
    for name in pairs(NAMEPLATE_BITFIELDS) do
        if string.lower(name) == wanted then return true end
    end
    for name, definition in pairs(Data.metadata or {}) do
        if definition.category == "nameplate" and string.lower(name) == wanted then return true end
    end
    return false
end

local function IsManualNameplateSetting(cvar)
    if not Adapter.supportsNameplateControls or type(cvar) ~= "string" then return false end
    local name = string.lower(cvar)
    return IsNameplateCVar(cvar) or name == "nameplateshowfriendlynpcs" or name == "nameplateshowfriends"
end

local function RefreshSettingsPage(reason)
    local ui = ns.UI
    local system = ui and type(ui.GetSystem) == "function" and ui:GetSystem() or nil
    local pages = system and system.pages or nil
    if pages and type(pages.Refresh) == "function" then
        pages:Refresh("cvar", reason)
        return true
    end
    return false
end

local Definition = {
    databaseName = "CVarSettings",
    defaultEnabled = true,
    defaults = {
        profile = {
            enabled = true,
            customSettings = {},
            specialSettings = {
                simplifiedNameplatesDisabled = Adapter.family == "retail" and true or nil,
            },
            autoApply = true,
            repairDeathRecap = true,
            notifyOnApply = false,
            smartApply = true,
            disableAddonProfiler = Adapter.supportsAddonProfiler and true or nil,
            notifyAddonProfiler = false,
            nameOnlyNameFontSize = Adapter.supportsNameplateControls and 22 or nil,
        },
    },
}

local NAMEONLY_FONT_SIZE_DEFAULT = 22
local NAMEONLY_FONT_SIZE_MIN = 15
local NAMEONLY_FONT_SIZE_MAX = 28

local function NormalizeNameOnlyFontSize(value)
    local size = tonumber(value)
    if not size or size < NAMEONLY_FONT_SIZE_MIN or size > NAMEONLY_FONT_SIZE_MAX then
        return NAMEONLY_FONT_SIZE_DEFAULT
    end
    return math.floor(size + 0.5)
end

local function NormalizeProfile(profile)
    profile.enabled = profile.enabled ~= false
    profile.autoApply = profile.autoApply ~= false
    profile.repairDeathRecap = profile.repairDeathRecap ~= false
    profile.notifyOnApply = profile.notifyOnApply and true or false
    profile.smartApply = profile.smartApply ~= false
    if type(profile.customSettings) ~= "table" then profile.customSettings = {} end
    if type(profile.specialSettings) ~= "table" then profile.specialSettings = {} end
    if Adapter.supportsNameplateControls then
        profile.nameOnlyNameFontSize = NormalizeNameOnlyFontSize(profile.nameOnlyNameFontSize)
    end
    if Adapter.family == "retail" and profile.specialSettings.simplifiedNameplatesDisabled == nil then
        profile.specialSettings.simplifiedNameplatesDisabled = true
    end
    if Adapter.supportsAddonProfiler then
        profile.disableAddonProfiler = profile.disableAddonProfiler ~= false
        profile.notifyAddonProfiler = profile.notifyAddonProfiler and true or false
    end
end

local function SyncRootModuleSetting(module)
    if ns.Assembly and type(ns.Assembly.SyncModuleConfigured) == "function" then
        ns.Assembly:SyncModuleConfigured("CVarSettings", module.db.profile.enabled ~= false)
    end
end

function Definition:GetProfile()
    return self.db.profile
end

function Definition:Initialize()
    self.adapter = Adapter
    self.Data = Data
    self._pendingCVars = nil
    self._pendingBits = nil
    self._pendingSpecialSettings = nil
    self._pendingRegistered = false
    NormalizeProfile(self.db.profile)
    SyncRootModuleSetting(self)
    if ns.CVarSettingsSettings and type(ns.CVarSettingsSettings.Register) == "function" then
        ns.CVarSettingsSettings:Register(self, Data, Adapter)
    end
end

function Definition:ProfileChanged()
    self._pendingDeathRecap = nil
    -- 不把上一配置的战斗队列写入新配置。
    self._pendingCVars, self._pendingBits, self._pendingSpecialSettings = nil, nil, nil
    if self._pendingRegistered and not self._settingsVisible then self:UnregisterEvent("PLAYER_REGEN_ENABLED") end
    self._pendingRegistered = false
    NormalizeProfile(self.db.profile)
    SyncRootModuleSetting(self)
end

function Definition:Enable()
    local profile = self.db.profile
    if not profile.enabled then return end
    self:SetSettingsVisible(self._settingsVisible)
    -- 外部改值（暴雪设置、快捷键、其他插件）后只刷新回显，不反向写值。
    if Adapter.supportsNameplateControls then
        self:RegisterEvent("CVAR_UPDATE", self.CVAR_UPDATE)
        -- 仅名字字号不是 CVar，每次登录都按玩家意图重新应用。
        self:ApplyNameOnlyNameFont()
    end
    if not profile.autoApply then return end
    if Adapter:IsLoggedIn() then
        self:ApplyLoginSettings()
        return
    end
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.PLAYER_ENTERING_WORLD)
end

function Definition:Disable()
    self._pendingDeathRecap = nil
    self._pendingCVars = nil
    self._pendingBits = nil
    self._pendingSpecialSettings = nil
    self._pendingRegistered = false
    self:UnregisterAllEvents()
    if Adapter.supportsNameplateControls then
        Adapter:SetNameOnlyNameFontSize(nil)
    end
end

function Definition:Toggle(value)
    value = value and true or false
    self.db.profile.enabled = value
    if ns.Assembly and type(ns.Assembly.SetModuleEnabled) == "function" then
        return ns.Assembly:SetModuleEnabled("CVarSettings", value)
    end
    if value then return self:Enable() end
    return self:Disable()
end

Definition.SetEnabled = Definition.Toggle

function Definition:ResolveCVarName(cvar)
    return Adapter:ResolveCVarName(cvar)
end

function Definition:CVarExists(cvar)
    return Adapter:CVarExists(cvar)
end

function Definition:GetCVarValue(cvar)
    return Adapter:GetCVar(cvar)
end

Definition.GetRuntimeCVar = Definition.GetCVarValue

function Definition:SetCVarValue(cvar, value)
    return Adapter:SetCVar(cvar, value)
end

Definition.SetRuntimeCVar = Definition.SetCVarValue

function Definition:GetRuntimeToggle(cvar)
    local value = self:GetCVarValue(cvar)
    if value == nil then
        local metadata = Data.metadata and Data.metadata[cvar]
        value = metadata and metadata.default or 0
    end
    return tostring(value) == "1"
end

-- 姓名板开关是当前状态控件：只写运行值，不进入 customSettings，避免下次登录把
-- 玩家本次手动取消当成本人意图持续回写。
function Definition:ApplyManualCVar(cvar, value)
    if not self.db.profile.enabled or not IsNameplateCVar(cvar) then return false end
    if not Adapter:CVarExists(cvar) then return false end
    value = tostring(value)
    if Adapter:IsInCombat() then
        self:QueueCVar(cvar, value)
        return true, "queued"
    end
    return Adapter:SetCVar(cvar, value)
end

function Definition:SetNameplateSwitch(cvar, enabled)
    return self:ApplyManualCVar(cvar, enabled and "1" or "0")
end

function Definition:SetNameplateValue(cvar, value)
    return self:ApplyManualCVar(cvar, value)
end

function Definition:GetBitfieldBit(cvar, index)
    if NAMEPLATE_BITFIELDS[cvar] == nil then return nil end
    if type(Adapter.GetCVarBitfield) ~= "function" then return nil end
    return Adapter:GetCVarBitfield(cvar, index)
end

function Definition:SetBitfieldBit(cvar, index, value)
    if not self.db.profile.enabled or NAMEPLATE_BITFIELDS[cvar] == nil then return false end
    if type(Adapter.SetCVarBitfield) ~= "function" then return false end
    if Adapter:IsInCombat() then
        return self:QueueBitfield(cvar, index, value) and true or false, "queued"
    end
    return Adapter:SetCVarBitfield(cvar, index, value and true or false)
end

function Definition:GetEffectiveCVar(cvar)
    local custom = self.db and self.db.profile and self.db.profile.customSettings
    if custom and custom[cvar] ~= nil then return custom[cvar] end
    return self:GetCVarValue(cvar)
end

function Definition:EnsurePendingEvent()
    if not self._pendingRegistered then
        self._pendingRegistered = true
        self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
    end
end

function Definition:QueueCVar(cvar, value)
    self._pendingCVars = self._pendingCVars or {}
    self._pendingCVars[cvar] = tostring(value)
    self:EnsurePendingEvent()
    return true
end

function Definition:ApplyQueuedCVars()
    local pending = self._pendingCVars
    if not pending or not next(pending) or Adapter:IsInCombat() then return 0 end
    local applied = 0
    local cvar
    local value
    for cvar, value in pairs(pending) do
        if Adapter:SetCVar(cvar, value) then
            pending[cvar] = nil
            applied = applied + 1
        end
    end
    if not next(pending) then
        self._pendingCVars = nil
    end
    return applied
end

function Definition:QueueBitfield(cvar, index, value)
    self._pendingBits = self._pendingBits or {}
    local pending = self._pendingBits[cvar]
    if pending == nil then
        pending = {}
        self._pendingBits[cvar] = pending
    end
    pending[index] = value and true or false
    self:EnsurePendingEvent()
    return true
end

function Definition:ApplyQueuedBitfields()
    local pending = self._pendingBits
    if not pending or not next(pending) or Adapter:IsInCombat() then return 0 end
    local applied = 0
    local cvar
    local bits
    for cvar, bits in pairs(pending) do
        local index
        local value
        for index, value in pairs(bits) do
            if Adapter:SetCVarBitfield(cvar, index, value) then
                bits[index] = nil
                applied = applied + 1
            end
        end
        if next(bits) == nil then pending[cvar] = nil end
    end
    if next(pending) == nil then self._pendingBits = nil end
    return applied
end

function Definition:GetSpecialSettingIntent(key)
    local settings = self.db and self.db.profile and self.db.profile.specialSettings
    local value = settings and settings[key]
    if value == nil then return nil end
    return value and true or false
end

function Definition:GetSimplifiedNameplatesDisabled()
    if type(Adapter.GetSimplifiedNameplatesDisabled) ~= "function" then return nil end
    return Adapter:GetSimplifiedNameplatesDisabled()
end

function Definition:QueueSpecialSetting(key, value)
    if key ~= "simplifiedNameplatesDisabled" then return false end
    self._pendingSpecialSettings = self._pendingSpecialSettings or {}
    self._pendingSpecialSettings[key] = value and true or false
    self:EnsurePendingEvent()
    return true
end

function Definition:ApplySpecialSettings()
    if not self.db.profile.enabled or type(Adapter.SetSimplifiedNameplatesDisabled) ~= "function" then return 0 end
    local desired = self:GetSpecialSettingIntent("simplifiedNameplatesDisabled")
    local current = self:GetSimplifiedNameplatesDisabled()
    if desired == nil or current == nil or self.db.profile.smartApply and current == desired then return 0 end
    if Adapter:IsInCombat() then
        return self:QueueSpecialSetting("simplifiedNameplatesDisabled", desired) and 1 or 0
    end
    return Adapter:SetSimplifiedNameplatesDisabled(desired) and 1 or 0
end

function Definition:ApplyQueuedSpecialSettings()
    local pending = self._pendingSpecialSettings
    if not pending or not next(pending) or Adapter:IsInCombat() then return 0 end
    local applied = 0
    local desired = pending.simplifiedNameplatesDisabled
    if desired ~= nil and type(Adapter.SetSimplifiedNameplatesDisabled) == "function"
        and Adapter:SetSimplifiedNameplatesDisabled(desired) then
        pending.simplifiedNameplatesDisabled = nil
        applied = 1
    end
    if not next(pending) then self._pendingSpecialSettings = nil end
    return applied
end

function Definition:ApplyQueuedSettings()
    if Adapter:IsInCombat() then return 0 end
    local applied = self:ApplyQueuedCVars() + self:ApplyQueuedBitfields() + self:ApplyQueuedSpecialSettings()
    if self._pendingDeathRecap then
        local explicitRepair = self._pendingDeathRecap == "repair"
        local requiresLogin = self._pendingDeathRecap == "login"
        self._pendingDeathRecap = nil
        if explicitRepair then
            if self.db.profile.enabled and self.db.profile.repairDeathRecap and self:RepairDeathRecap() then
                applied = applied + 1
            end
        elseif not requiresLogin or self.db.profile.autoApply then
            applied = applied + self:ApplyDeathRecapPolicy()
        end
    end
    if not self._pendingCVars and not self._pendingBits and not self._pendingSpecialSettings
        and self._pendingRegistered then
        self._pendingRegistered = false
        if not self._settingsVisible then self:UnregisterEvent("PLAYER_REGEN_ENABLED") end
    end
    return applied
end

function Definition:PLAYER_REGEN_ENABLED()
    local applied = self:ApplyQueuedSettings()
    if self._settingsVisible then RefreshSettingsPage("combat-ended") end
    return applied
end

function Definition:SetSettingsVisible(visible)
    self._settingsVisible = visible == true
    if self._settingsVisible and self.db.profile.enabled then
        self:RegisterEvent("PLAYER_REGEN_DISABLED", self.RefreshCombatSettings)
        self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
    else
        self:UnregisterEvent("PLAYER_REGEN_DISABLED")
        if not self._pendingRegistered then self:UnregisterEvent("PLAYER_REGEN_ENABLED") end
    end
end

function Definition:RefreshCombatSettings()
    if self._settingsVisible then RefreshSettingsPage("combat-started") end
end

function Definition:GetCurrentSettings()
    local settings = {}
    local preset = Data.presets and Data.presets.rurutia or nil
    local key
    local value
    for key, value in pairs(preset or {}) do settings[key] = value end
    for key, value in pairs(self.db.profile.customSettings) do
        if not IsManualNameplateSetting(key) and Adapter:IsSettingSupported(key) then settings[key] = value end
    end
    -- This repair has its own opt-out/minimum policy; never let a preset bypass it.
    settings.combatLogRetentionTime = nil
    -- 暴雪的状态文字下拉同时写显示模式和总开关；不能只改模式而仍不显示。
    if Data.metadata.statusTextDisplay and settings.statusTextDisplay then
        settings.statusText = settings.statusTextDisplay == "NONE" and "0" or "1"
    end
    return settings
end

function Definition:GetBaseSettings()
    return Data.presets and Data.presets.rurutia or {}
end

function Definition:ApplySettings(settings)
    if not self.db.profile.enabled or type(settings) ~= "table" or not next(settings) then return 0 end
    local applied = 0
    local cvar
    local value
    for cvar, value in pairs(settings) do
        if Adapter:IsSettingSupported(cvar) and Adapter:CVarExists(cvar) then
            local changed = not self.db.profile.smartApply
                or tostring(Adapter:GetCVar(cvar)) ~= tostring(value)
            if changed then
                if Adapter:IsInCombat() then
                    self:QueueCVar(cvar, value)
                    applied = applied + 1
                elseif Adapter:SetCVar(cvar, value) then
                    applied = applied + 1
                end
            end
        end
    end
    return applied
end

function Definition:IsAddonProfilerSupported()
    return Adapter.supportsAddonProfiler
        and type(Adapter.IsAddonProfilerSupported) == "function"
        and Adapter:IsAddonProfilerSupported()
        or false
end

function Definition:IsAddonProfilerEnabled()
    if not self:IsAddonProfilerSupported() then return nil end
    return Adapter:IsAddonProfilerEnabled()
end

function Definition:DisableAddonProfiler()
    local profile = self.db.profile
    if not Adapter.supportsAddonProfiler or not profile.disableAddonProfiler then return false end
    local disabled = Adapter:DisableAddonProfiler()
    if disabled and profile.notifyAddonProfiler and Adapter:IsAddonProfilerEnabled() == false then
        self:Print("暴雪插件性能分析已关闭")
    end
    return disabled
end

function Definition:ApplyCurrentSettings(fromLogin)
    local applied = self:ApplySettings(self:GetCurrentSettings()) + self:ApplySpecialSettings()
    applied = applied + self:ApplyDeathRecapPolicy(fromLogin)
    self:DisableAddonProfiler()
    if applied > 0 and self.db.profile.notifyOnApply then
        self:Print("已应用 %d 项CVAR设置", applied)
    end
    return applied
end

function Definition:GetDeathRecapRetention()
    local value = Adapter:GetDeathRecapRetention()
    local number = tonumber(value)
    if not number or number ~= number or number == math.huge or number == -math.huge then return nil end
    return number
end

function Definition:CanRepairDeathRecap()
    return self.db.profile.enabled and not Adapter:IsInCombat()
        and self:GetDeathRecapRetention() ~= nil and Adapter:CanWriteDeathRecapRetention()
end

function Definition:GetDeathRecapStatusText()
    local value = self:GetDeathRecapRetention()
    if value == nil or not Adapter:CanWriteDeathRecapRetention() then
        return "死亡摘要：当前客户端不支持或无法读取"
    end
    if Adapter:IsInCombat() then return "死亡摘要：保留 " .. tostring(value) .. " 秒，脱战后可修复" end
    return "死亡摘要：战斗日志保留 " .. tostring(value) .. " 秒"
end

function Definition:RepairDeathRecap()
    if not self:CanRepairDeathRecap() then
        self:Print("死亡摘要未应用：请确认模块已启用、客户端支持，并在脱战后操作。")
        return false
    end
    if self:GetDeathRecapRetention() == 300 then
        self:Print("死亡摘要保留时间已是300秒，设置正常；若仍缺失需继续排查。")
        return true
    end
    local ok = Adapter:SetDeathRecapRetention()
    if ok then
        self:Print("保留时间已设为300秒，请查看之后产生的死亡记录；旧记录无法补回。")
    else
        self:Print("死亡摘要设置未应用：写入失败或回读不符。")
    end
    RefreshSettingsPage("death-recap-repair")
    return ok
end

function Definition:SetDeathRecapRepairEnabled(enabled)
    local wasEnabled = self.db.profile.repairDeathRecap
    self.db.profile.repairDeathRecap = enabled == true
    if not enabled then
        self._pendingDeathRecap = nil
        if self._pendingRegistered and not self._pendingCVars and not self._pendingBits
            and not self._pendingSpecialSettings then
            if not self._settingsVisible then self:UnregisterEvent("PLAYER_REGEN_ENABLED") end
            self._pendingRegistered = false
        end
    elseif not wasEnabled then
        if self.db.profile.enabled and Adapter:IsInCombat() then
            self._pendingDeathRecap = "repair"
            self:EnsurePendingEvent()
            self:Print("死亡摘要修复已排队，将在脱战后执行。")
        else
            self:RepairDeathRecap()
        end
    end
end

function Definition:ApplyDeathRecapPolicy(fromLogin)
    if not self.db.profile.enabled or not self.db.profile.repairDeathRecap then return 0 end
    local value = self:GetDeathRecapRetention()
    if value == nil or value >= 300 or not Adapter:CanWriteDeathRecapRetention() then return 0 end
    if Adapter:IsInCombat() then
        if self._pendingDeathRecap ~= "repair" then
            self._pendingDeathRecap = fromLogin and "login" or "manual"
        end
        self:EnsurePendingEvent()
        return 0
    end
    if Adapter:SetDeathRecapRetention() then return 1 end
    self:Print("死亡摘要自动修复未应用：写入失败或回读不符。")
    return 0
end

function Definition:GetNameplateLoginSettings()
    local settings = {}
    if not Adapter.supportsNameplateControls then return settings end
    local cvar
    local metadata
    for cvar, metadata in pairs(Data.metadata or {}) do
        if metadata.loginPolicy then settings[cvar] = "1" end
    end
    return settings
end

-- 仅名字字号不是 CVar：只保存玩家意图并立即应用，登录时由 Enable 重新应用。
function Definition:GetNameOnlyNameFontSize()
    local profile = self.db and self.db.profile
    return NormalizeNameOnlyFontSize(profile and profile.nameOnlyNameFontSize)
end

function Definition:SetNameOnlyNameFontSize(size)
    if not self.db.profile.enabled or not Adapter.supportsNameplateControls then return false end
    if tonumber(size) == nil then return false end
    self.db.profile.nameOnlyNameFontSize = NormalizeNameOnlyFontSize(size)
    return self:ApplyNameOnlyNameFont()
end

-- 挂钩走 Runtime 的 HookSecureFunction（模块禁用时代理自动失效）；Blizzard_NamePlates
-- 按需加载，未就绪时登记 ADDON_LOADED 等待，不提前强制加载。
function Definition:EnsureNameOnlyFontHook()
    if not Adapter.supportsNameplateControls
        or type(Adapter.ApplyNameOnlyFontToFrame) ~= "function"
        or type(self.HookSecureFunction) ~= "function" then return false end
    local mixin = _G.NamePlateUnitFrameMixin
    if type(mixin) ~= "table" or type(mixin.UpdateAnchors) ~= "function" then return false end
    self:HookSecureFunction(mixin, "UpdateAnchors", function(_, frame)
        Adapter:ApplyNameOnlyFontToFrame(frame)
    end, "name-only font size")
    return true
end

function Definition:ApplyNameOnlyNameFont()
    if not self.db.profile.enabled or not Adapter.supportsNameplateControls then return false end
    if not self:EnsureNameOnlyFontHook() then
        self:RegisterEvent("ADDON_LOADED", self.ADDON_LOADED)
    end
    return Adapter:SetNameOnlyNameFontSize(self:GetNameOnlyNameFontSize())
end

function Definition:ADDON_LOADED(_, addonName)
    if addonName ~= "Blizzard_NamePlates" then return end
    if self:EnsureNameOnlyFontHook() then
        self:UnregisterEvent("ADDON_LOADED")
        Adapter:SetNameOnlyNameFontSize(self:GetNameOnlyNameFontSize())
    end
end

-- 登录/重载策略：只把三项已确认的开关设为开；友方玩家与友方NPC姓名板不做任何检查或回写。
function Definition:ApplyNameplateLoginPolicy()
    if not self.db.profile.enabled or not self.db.profile.autoApply then return 0 end
    return self:ApplySettings(self:GetNameplateLoginSettings())
end

function Definition:ApplyLoginSettings()
    if not self.db.profile.enabled or not self.db.profile.autoApply then return 0 end
    return self:ApplyCurrentSettings(true) + self:ApplyNameplateLoginPolicy()
end

function Definition:LoadAndApplyPreset()
    return self:ApplyCurrentSettings()
end

function Definition:PLAYER_ENTERING_WORLD()
    local applied = self:ApplyLoginSettings()
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    return applied
end

function Definition:CVAR_UPDATE(_, cvarName)
    if not Adapter.supportsNameplateControls or not IsNameplateCVar(cvarName) then return false end
    RefreshSettingsPage("cvar-update:" .. tostring(cvarName))
    return true
end

function Definition:SetCustomSetting(cvar, value)
    if not self.db.profile.enabled or not Adapter:IsSettingSupported(cvar) then return false end
    if cvar == "statusTextDisplay" and Data.metadata.statusTextDisplay then
        if not Data.validate(cvar, tostring(value)) then return false end
        self.db.profile.customSettings[cvar] = tostring(value)
        -- 只保存模式；伴随开关由模式派生，登录、重置与战斗延后复用同一应用路径。
        self:ApplySettings({ statusTextDisplay = tostring(value), statusText = value == "NONE" and "0" or "1" })
        if Adapter:IsInCombat() then return true, "queued" end
        return true
    end
    self.db.profile.customSettings[cvar] = tostring(value)
    if not Adapter:CVarExists(cvar) then return true end
    if Adapter:IsInCombat() then
        self:QueueCVar(cvar, value)
        return true, "queued"
    end
    return Adapter:SetCVar(cvar, value)
end

function Definition:GetCustomSetting(cvar)
    return self.db.profile.customSettings[cvar]
end

-- 外部安装器（RSS 一键导入）写完成功后，把导入值同步为本模块的持久意图，
-- 避免下次登录用安装前的旧值覆盖导入结果；只更新玩家本来就自定义过的项目。
function Definition:AdoptExternalSettings(settings)
    if type(settings) ~= "table" then return 0 end
    local custom = self.db and self.db.profile and self.db.profile.customSettings
    if type(custom) ~= "table" then return 0 end
    local adopted = 0
    local incoming = {}
    for cvar, value in pairs(settings) do
        if type(cvar) == "string" then incoming[string.lower(cvar)] = value end
    end
    -- 游戏 CVar 名称不区分大小写；例如 RSS weatherDensity 对应 RS weatherdensity。
    for cvar in pairs(custom) do
        local value = type(cvar) == "string" and incoming[string.lower(cvar)] or nil
        if value ~= nil and not IsManualNameplateSetting(cvar) and Adapter:IsSettingSupported(cvar) then
            custom[cvar] = tostring(value)
            adopted = adopted + 1
        end
    end
    return adopted
end

function Definition:SetSpecialSettingIntent(key, value)
    if not self.db.profile.enabled or key ~= "simplifiedNameplatesDisabled"
        or type(Adapter.SetSimplifiedNameplatesDisabled) ~= "function" then return false end
    self.db.profile.specialSettings[key] = value and true or false
    if Adapter:IsInCombat() then
        return self:QueueSpecialSetting(key, value), "queued"
    end
    return Adapter:SetSimplifiedNameplatesDisabled(value and true or false)
end

function Definition:ResetToRecommended()
    self.db.profile.repairDeathRecap = true
    rawset(self.db.profile, "customSettings", nil)
    rawset(self.db.profile, "specialSettings", nil)
    rawset(self.db.profile, "nameOnlyNameFontSize", nil)
    NormalizeProfile(self.db.profile)
    local applied = self:ApplyCurrentSettings() + (self:ApplyNameOnlyNameFont() and 1 or 0)
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    self:Print("已重置为默认设置")
    return applied
end

function Definition:Print(message, ...)
    if type(ns.Print) == "function" then return ns.Print(message, ...) end
end

-- 组合姓名板 CVar 的位数（供测试与后续复用读取，不参与客户端访问）。
Definition.NameplateBitfields = NAMEPLATE_BITFIELDS

local module, reason = ns.RegisterModule("CVarSettings", Definition)
if module then
    ns.CVarSettings = module
    ns.Modules = ns.Modules or {}
    ns.Modules.CVarSettings = module
else
    ns.CVarSettingsRegistrationError = reason
end

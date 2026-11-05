-- 文件职责：进组职责保护模块运行时。
-- 负责：在短暂进组窗口内纠正外部插件自动写入的治疗职责；不接管排队职责或玩家后续手动选择。

local _, ns = ...

local Adapter = ns.RoleGuardAdapter
if ns.Build and ns.Build.HasModule and ns.Build.HasModule("RoleGuard")
    and type(Adapter) ~= "table" then
    error("RoleGuard requires the Classic Mists adapter before Core.lua", 2)
end

local GUARD_WINDOW_SECONDS = 10
local DBM_FALLBACK_DELAY = 6.5
local POST_DBM_DELAY = 0.2
local DEFAULT_TARGET_ROLE = "DAMAGER"
local VALID_TARGET_ROLES = {
    DAMAGER = true,
    TANK = true,
}

local Definition = {
    activationGate = "LFGTools",
    databaseName = "RoleGuard",
    defaultEnabled = false,
    defaults = {
        profile = {
            enabled = false,
            targetRole = DEFAULT_TARGET_ROLE,
        },
    },
}

local function CancelHandle(module, key)
    local handle = module[key]
    module[key] = nil
    if handle and type(handle.Cancel) == "function" then handle:Cancel() end
end

local function NormalizeProfile(profile)
    profile.enabled = profile.enabled and true or false
    if not VALID_TARGET_ROLES[profile.targetRole] then
        profile.targetRole = DEFAULT_TARGET_ROLE
    end
end

local function SyncRootModuleSetting(module)
    if ns.Assembly and type(ns.Assembly.SyncModuleConfigured) == "function" then
        ns.Assembly:SyncModuleConfigured("RoleGuard", module.db.profile.enabled == true)
    end
end

function Definition:GetProfile()
    return self.db.profile
end

function Definition:IsSupported()
    return type(Adapter) == "table" and Adapter:IsSupported()
end

function Definition:GetTargetRole()
    local role = self.db and self.db.profile and self.db.profile.targetRole
    return VALID_TARGET_ROLES[role] and role or DEFAULT_TARGET_ROLE
end

function Definition:SetTargetRole(role)
    if not VALID_TARGET_ROLES[role] then return false end
    self.db.profile.targetRole = role
    return true
end

function Definition:SetEnabled(enabled)
    enabled = enabled and true or false
    local previous = self.db.profile.enabled == true
    self.db.profile.enabled = enabled
    if ns.Assembly and type(ns.Assembly.SetModuleEnabled) == "function" then
        local ok, reason = ns.Assembly:SetModuleEnabled("RoleGuard", enabled)
        if ok == false then
            self.db.profile.enabled = previous
            if type(ns.Assembly.SetModuleConfigured) == "function" then
                ns.Assembly:SetModuleConfigured("RoleGuard", previous)
            end
            return false, reason
        end
    end
    return true
end

function Definition:IsGuardWindowActive()
    return self:IsEnabled()
        and self.db.profile.enabled == true
        and self._guardUntil ~= nil
        and Adapter:GetTime() <= self._guardUntil
        and Adapter:IsGrouped()
        and not Adapter:IsLFGGroup()
end

function Definition:CloseGuardWindow()
    self._guardGeneration = (self._guardGeneration or 0) + 1
    self._guardUntil = nil
    self._pendingCombatCorrection = false
    CancelHandle(self, "_fallbackHandle")
    CancelHandle(self, "_dbmHandle")
    CancelHandle(self, "_combatHandle")
end

function Definition:ScheduleCorrection(delay, key)
    if not self:IsGuardWindowActive() then return false end
    key = key or "_dbmHandle"
    if self[key] ~= nil then return true end
    local generation = self._guardGeneration
    self[key] = self:Schedule(delay or 0, function(module)
        module[key] = nil
        if generation == module._guardGeneration then module:CorrectRole() end
    end, "RoleGuard correction")
    return true
end

function Definition:OpenGuardWindow()
    if not self:IsEnabled() or not self.db.profile.enabled or not self:IsSupported()
        or not Adapter:IsGrouped() or Adapter:IsLFGGroup() then
        self:CloseGuardWindow()
        return false
    end

    self:CloseGuardWindow()
    self._guardUntil = Adapter:GetTime() + GUARD_WINDOW_SECONDS
    self._pendingCombatCorrection = false
    self:ScheduleCorrection(DBM_FALLBACK_DELAY, "_fallbackHandle")
    return true
end

function Definition:CorrectRole()
    if not self:IsGuardWindowActive() or self._correcting then return false end
    if Adapter:GetPlayerRole() ~= "HEALER" then return false end

    if Adapter:IsInCombat() then
        self._pendingCombatCorrection = true
        return false
    end

    local targetRole = self:GetTargetRole()
    self._correcting = true
    local changed = Adapter:SetPlayerRole(targetRole)
    self._correcting = false
    if not changed then return false end

    self._pendingCombatCorrection = false
    if self._lastNoticeGeneration ~= self._guardGeneration then
        self._lastNoticeGeneration = self._guardGeneration
        local roleText = targetRole == "TANK" and "坦克" or "伤害"
        ns.Print("已阻止进组后自动切换为治疗，职责恢复为%s。", roleText)
    end
    return true
end

function Definition:InstallDBMRoleCheckHook()
    local target = Adapter:GetDBMRoleCheckTarget()
    if target == nil then return false end
    if self._dbmHookTarget == target and self._dbmHookToken ~= nil then return true end
    if self._dbmHookToken ~= nil then self:RemoveHook(self._dbmHookToken) end

    local ok, token = pcall(self.HookSecureFunction, self, target, "RoleCheck", function(module)
        if module:IsGuardWindowActive() then
            module:ScheduleCorrection(POST_DBM_DELAY, "_dbmHandle")
        end
    end, "RoleGuard DBM RoleCheck")
    if not ok then
        self._dbmHookTarget = nil
        self._dbmHookToken = nil
        return false
    end
    self._dbmHookTarget = target
    self._dbmHookToken = token
    return true
end

function Definition:Initialize()
    NormalizeProfile(self.db.profile)
    self._guardGeneration = 0
    self._wasGrouped = Adapter:IsGrouped()
    SyncRootModuleSetting(self)
end

function Definition:ProfileChanged()
    NormalizeProfile(self.db.profile)
    SyncRootModuleSetting(self)
end

function Definition:Enable()
    if not self:IsSupported() or not self.db.profile.enabled then return end
    self._wasGrouped = Adapter:IsGrouped()
    self:RegisterEvent("ADDON_LOADED", self.ADDON_LOADED)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.PLAYER_ENTERING_WORLD)
    self:RegisterEvent("GROUP_ROSTER_UPDATE", self.GROUP_ROSTER_UPDATE)
    self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
    self:InstallDBMRoleCheckHook()
end

function Definition:Disable()
    self:CloseGuardWindow()
    self._wasGrouped = Adapter and Adapter:IsGrouped() or false
    self._dbmHookTarget = nil
    self._dbmHookToken = nil
end

function Definition:ADDON_LOADED(_, loadedAddon)
    if loadedAddon == "DBM-Core" then self:InstallDBMRoleCheckHook() end
end

function Definition:PLAYER_ENTERING_WORLD()
    self:CloseGuardWindow()
    self._wasGrouped = Adapter:IsGrouped()
    self:InstallDBMRoleCheckHook()
end

function Definition:GROUP_ROSTER_UPDATE()
    local grouped = Adapter:IsGrouped()
    if grouped and not self._wasGrouped then
        self:OpenGuardWindow()
    elseif not grouped then
        self:CloseGuardWindow()
    end
    self._wasGrouped = grouped
end

function Definition:PLAYER_REGEN_ENABLED()
    if self._pendingCombatCorrection and self:IsGuardWindowActive() then
        self:ScheduleCorrection(0.1, "_combatHandle")
    else
        self._pendingCombatCorrection = false
    end
end

local module, reason = ns.RegisterModule("RoleGuard", Definition)
if module then
    ns.RoleGuard = module
    ns.RoleGuardDefinition = Definition
else
    ns.RoleGuardRegistrationError = reason
end

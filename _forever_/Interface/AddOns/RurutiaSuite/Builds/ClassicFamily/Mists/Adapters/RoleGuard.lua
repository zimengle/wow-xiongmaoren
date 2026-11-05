-- 文件职责：隔离 Classic Mists 职责 API 与 DBM 集成入口。
-- 负责：提供进组职责保护所需的版本能力和可测试环境边界。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("RoleGuard")) then return end

local Adapter = {
    family = "classic",
    buildId = "classic-mists",
}

function Adapter:IsSupported()
    return type(_G.UnitGroupRolesAssigned) == "function"
        and type(_G.UnitSetRole) == "function"
end

function Adapter:GetTime()
    return type(_G.GetTime) == "function" and _G.GetTime() or 0
end

function Adapter:IsGrouped()
    return type(_G.IsInGroup) == "function" and _G.IsInGroup() and true or false
end

function Adapter:IsLFGGroup()
    return type(_G.IsPartyLFG) == "function" and _G.IsPartyLFG() and true or false
end

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Adapter:GetPlayerRole()
    if type(_G.UnitGroupRolesAssigned) ~= "function" then return "NONE" end
    return _G.UnitGroupRolesAssigned("player")
end

function Adapter:SetPlayerRole(role)
    if type(_G.UnitSetRole) ~= "function" then return false end
    local ok, result = pcall(_G.UnitSetRole, "player", role)
    return ok and result ~= false
end

function Adapter:GetDBMRoleCheckTarget()
    local dbm = _G.DBM
    if type(dbm) ~= "table" or type(dbm.RoleCheck) ~= "function" then return nil end
    return dbm
end

ns.RoleGuardAdapter = Adapter
ns.RoleGuardMistsAdapter = Adapter

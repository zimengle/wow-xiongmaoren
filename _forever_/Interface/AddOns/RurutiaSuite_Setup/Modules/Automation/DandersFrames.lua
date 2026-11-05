local _, ns = ...

local Danders = {}
ns.DandersAutomation = Danders
local NORMAL = "露露-右布局"
local RAID = "露露-右布局大团框"

local function IsHealer()
    if type(_G.GetSpecialization) ~= "function" or type(_G.GetSpecializationInfo) ~= "function" then
        return false
    end
    local index = _G.GetSpecialization()
    if not index then return false end
    return select(5, _G.GetSpecializationInfo(index)) == "HEALER"
end

function Danders:Apply()
    local settings = ns.DB and ns.DB.global and ns.DB.global.automation
    if not settings or settings.enabled == false or settings.dandersProfile ~= true then return true, "disabled" end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return false, "combat-pending"
    end
    local inspected, profile = ns.ProfileSwitcher:Inspect()
    if not inspected or type(profile) ~= "table" or profile.provider == "ellesmere" then
        return true, "not-owned"
    end
    local mainSide = profile.main and profile.main.side or profile.side
    -- 独立 DF 的大团框也是右布局；通用布局检查器不把它认作标准母版。
    local db = _G.DandersFramesDB_v2
    local standaloneRight = profile.provider == "danders" and type(db) == "table"
        and (db.currentProfile == NORMAL or db.currentProfile == RAID)
    if mainSide ~= "right" and not standaloneRight then return true, "not-owned" end
    local df = _G.DandersFrames
    if type(df) ~= "table" or type(df.SetProfile) ~= "function"
        or type(db) ~= "table" or type(db.profiles) ~= "table" then
        return false, "ADDON_NOT_LOADED"
    end
    local inInstance, instanceType = false, nil
    if type(_G.IsInInstance) == "function" then inInstance, instanceType = _G.IsInInstance() end
    local inRaid = type(_G.IsInRaid) == "function" and _G.IsInRaid()
        and inInstance and instanceType == "raid"
    local useRaid = IsHealer() and inRaid
    if useRaid and settings.dandersMythicOnly == true then
        local difficulty = type(_G.GetInstanceInfo) == "function" and select(3, _G.GetInstanceInfo()) or nil
        useRaid = difficulty == 16
    end
    local target = useRaid and RAID or NORMAL
    if type(db.profiles[target]) ~= "table" then return true, "target-missing" end
    local current = type(df.GetCurrentProfile) == "function" and df:GetCurrentProfile() or db.currentProfile
    if current == target then return true, "already-active" end
    local ok, reason = pcall(df.SetProfile, df, target)
    if not ok then return false, tostring(reason) end
    current = type(df.GetCurrentProfile) == "function" and df:GetCurrentProfile() or db.currentProfile
    if current ~= target then return false, "profile-readback-failed" end
    return true, target
end

return Danders

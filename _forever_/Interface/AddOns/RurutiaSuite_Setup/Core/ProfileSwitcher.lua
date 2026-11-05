local _, ns = ...

local ProfileSwitcher = {}
ns.ProfileSwitcher = ProfileSwitcher

local PROFILE_NAMES = {
    elvui = {
        left = { "露露的左布局 DPS用" },
        right = { "露露的右布局 治疗用" },
    },
    ndui = {
        left = { "露露缇娅-DPS用左布局" },
        right = { "露露缇娅-治疗用右布局", "露露缇娅" },
    },
    ellesmere = {
        middle = { "露露-中布局" },
        left = { "露露-左布局" },
        right = { "露露-右布局" },
    },
    danders = {
        left = { "露露-左布局" },
        right = { "露露-右布局" },
    },
}

ProfileSwitcher.PROFILE_NAMES = PROFILE_NAMES

local function IsLoaded(name)
    local api = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(api) ~= "function" then return false end
    local ok, loaded = pcall(api, name)
    return ok and loaded == true
end

local function PlayerIdentity()
    local name = type(_G.UnitName) == "function" and _G.UnitName("player") or nil
    local realm = type(_G.GetRealmName) == "function" and _G.GetRealmName() or nil
    if type(name) ~= "string" or name == "" or type(realm) ~= "string" or realm == "" then
        return nil, "player identity is unavailable"
    end
    return { name = name, realm = realm }
end

local function NamesFor(provider, side)
    local names = PROFILE_NAMES[provider]
    return names and names[side]
end

local function InCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() == true
end

local function FirstExistingProfile(profiles, names)
    if type(profiles) ~= "table" or type(names) ~= "table" then return nil end
    local index
    for index = 1, #names do
        if type(profiles[names[index]]) == "table" then return names[index] end
    end
end

local function FindNDuiIndex(names, target)
    if type(names) ~= "table" then return nil, "NDui profile list is unavailable" end
    local found
    local index, name
    for index, name in ipairs(names) do
        if name == target then
            if found then return nil, "NDui profile name is duplicated" end
            found = index
        end
    end
    return found
end

local function ResolveNDuiTarget(db, side)
    local candidates = NamesFor("ndui", side)
    local candidateIndex, target
    for candidateIndex = 1, #candidates do
        local index, reason = FindNDuiIndex(db.ProfileNames, candidates[candidateIndex])
        if reason then return nil, nil, reason end
        if index then
            target = candidates[candidateIndex]
            return target, index
        end
    end
    return nil, nil, "NDui target profile is missing"
end

local function ProviderCandidates()
    local result = {}
    local ellesOnly = ns.ProductManifest:Check("infinitePreset")
    if not ellesOnly and IsLoaded("ElvUI") and type(_G.ElvDB) == "table" then
        result[#result + 1] = "elvui"
    end
    if not ellesOnly and IsLoaded("NDui") and type(_G.NDuiADB) == "table" then
        result[#result + 1] = "ndui"
    end
    if IsLoaded("EllesmereUI") and type(_G.EllesmereUIDB) == "table"
        and type(_G.EllesmereUI) == "table" then
        result[#result + 1] = "ellesmere"
    end
    return result
end

local function SideFromName(provider, value)
    local side, names, index
    for _, side in ipairs({ "left", "middle", "right" }) do
        names = NamesFor(provider, side)
        if type(names) == "table" then
            for index = 1, #names do
                if value == names[index] then return side end
            end
        end
    end
    return "unknown"
end

local function InspectElvUI(identity)
    local db = _G.ElvDB
    if type(db) ~= "table" or type(db.profiles) ~= "table" then
        return nil, "ElvUI profile database is unavailable"
    end
    local key = identity.name .. " - " .. identity.realm
    local current = type(db.profileKeys) == "table" and db.profileKeys[key] or nil
    return {
        provider = "elvui",
        side = SideFromName("elvui", current),
        available = {
            left = FirstExistingProfile(db.profiles, NamesFor("elvui", "left")) ~= nil,
            right = FirstExistingProfile(db.profiles, NamesFor("elvui", "right")) ~= nil,
        },
    }
end

local function InspectNDui(identity)
    local db = _G.NDuiADB
    if type(db) ~= "table" or type(db.ProfileNames) ~= "table" then
        return nil, "NDui profile database is unavailable"
    end
    local key = identity.name .. "-" .. identity.realm
    local current = type(db.ProfileIndex) == "table" and db.ProfileIndex[key] or nil
    local leftName, leftIndex, leftReason = ResolveNDuiTarget(db, "left")
    local rightName, rightIndex, rightReason = ResolveNDuiTarget(db, "right")
    local side = "unknown"
    if leftIndex and current == leftIndex then side = "left" end
    if rightIndex and current == rightIndex then side = "right" end
    return {
        provider = "ndui",
        side = side,
        available = { left = leftName ~= nil, right = rightName ~= nil },
        warning = leftReason or rightReason,
    }
end

local function ProfileExists(name, keys, profiles)
    return type(name) == "string" and type(keys) == "table" and keys[name] == true
        and type(profiles) == "table" and type(profiles[name]) == "table"
end

-- EUI identity is independent of the current display. No derived profiles.
local function BuildEllesmereTargetState(keys, profiles)
    local targets, available = {}, {}
    for _, side in ipairs({ "left", "middle", "right" }) do
        targets[side] = PROFILE_NAMES.ellesmere[side][1]
        available[side] = ProfileExists(targets[side], keys, profiles)
    end
    return { targets = targets, available = available }
end

local function InspectEllesmere()
    local db = _G.EllesmereUIDB
    local api = _G.EllesmereUI
    if type(db) ~= "table" or type(db.profiles) ~= "table"
        or type(api) ~= "table" or type(api.GetActiveProfileName) ~= "function"
        or type(api.GetProfileKeys) ~= "function" then
        return nil, "EllesmereUI profile API is unavailable"
    end
    local ok, current = pcall(api.GetActiveProfileName)
    if not ok then return nil, "EllesmereUI active profile read failed" end
    local keysOK, keys = pcall(api.GetProfileKeys)
    if not keysOK or type(keys) ~= "table" then
        return nil, "EllesmereUI profile list read failed"
    end
    local state = BuildEllesmereTargetState(keys, db.profiles)
    local side = SideFromName("ellesmere", current)
    return { provider = "ellesmere", current = current, side = side,
        available = state.available, targets = state.targets }
end

local function ValidateEllesmereTarget(side, expectedTarget)
    local db = _G.EllesmereUIDB
    local api = _G.EllesmereUI
    if type(db) ~= "table" or type(db.profiles) ~= "table"
        or type(api) ~= "table" or type(api.SetProfile) ~= "function"
        or type(api.GetActiveProfileName) ~= "function"
        or type(api.GetProfileKeys) ~= "function"
        or type(api.IsUnlockModeActive) ~= "function" then
        return nil, "EllesmereUI profile API is unavailable"
    end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return nil, "EllesmereUI profile switch is blocked during combat"
    end
    local unlockOK, unlocked = pcall(api.IsUnlockModeActive)
    if not unlockOK then return nil, "EllesmereUI unlock state read failed" end
    if unlocked then return nil, "EllesmereUI unlock mode is active" end

    if side ~= "left" and side ~= "middle" and side ~= "right" then
        return nil, "invalid layout side"
    end
    local keysOK, keys = pcall(api.GetProfileKeys)
    if not keysOK or type(keys) ~= "table" then
        return nil, "EllesmereUI profile list read failed"
    end
    local targetState = BuildEllesmereTargetState(keys, db.profiles)
    local target = targetState.targets[side]
    if not target or expectedTarget and target ~= expectedTarget then
        return nil, "EllesmereUI target profile is missing"
    end
    if not ProfileExists(target, keys, db.profiles) then
        return nil, "EllesmereUI target profile is missing"
    end
    local specIndex = type(_G.GetSpecialization) == "function" and _G.GetSpecialization() or nil
    local specID
    if specIndex and type(_G.GetSpecializationInfo) == "function" then
        specID = _G.GetSpecializationInfo(specIndex)
    end
    local assigned = specID and type(db.specProfiles) == "table" and db.specProfiles[specID] or nil
    if assigned ~= nil and assigned ~= target then
        return nil, "current specialization is assigned to another EllesmereUI profile"
    end
    return target, targetState
end

local function RefreshEllesmereLive()
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return false, "EllesmereUI live refresh is blocked during combat"
    end
    local api = _G.EllesmereUI
    if type(api) ~= "table" or type(api.RefreshAllAddons) ~= "function" then
        return false, "EllesmereUI live refresh API is unavailable"
    end
    local ok, reason = pcall(api.RefreshAllAddons)
    if not ok then
        return false, "EllesmereUI live refresh failed: " .. tostring(reason)
    end
    return true
end

local function InspectDanders()
    if ns.ProductManifest:Check("infinitePreset") then return nil end
    local db = _G.DandersFramesDB_v2
    if type(db) ~= "table" or type(db.profiles) ~= "table" then return nil end
    return {
        provider = "danders",
        side = SideFromName("danders", db.currentProfile),
        available = {
            left = FirstExistingProfile(db.profiles, NamesFor("danders", "left")) ~= nil,
            right = FirstExistingProfile(db.profiles, NamesFor("danders", "right")) ~= nil,
        },
    }
end

local INSPECTORS = {
    elvui = InspectElvUI,
    ndui = InspectNDui,
    ellesmere = InspectEllesmere,
}

function ProfileSwitcher:Inspect(snapshot)
    local candidates = ProviderCandidates()
    if #candidates > 1 then return false, "multiple UI profile providers are loaded" end
    local identity, identityReason
    if candidates[1] == "elvui" or candidates[1] == "ndui" then
        identity, identityReason = PlayerIdentity()
        if not identity then return false, identityReason end
    end

    local main
    if #candidates == 1 then
        local inspector = INSPECTORS[candidates[1]]
        local status, reason = inspector(identity, snapshot)
        if not status then return false, reason end
        main = status
    end
    local danders
    if not main or main.provider ~= "ellesmere" then danders = InspectDanders() end
    if not main and not danders then return false, "no supported UI profile provider is available" end

    local side = main and main.side or danders.side
    local mixed = main and danders and main.side ~= "unknown" and danders.side ~= "unknown"
        and main.side ~= danders.side or false
    if mixed then side = "mixed" end
    return true, {
        provider = main and main.provider or "danders",
        side = side or "unknown",
        main = main,
        danders = danders,
        mixed = mixed,
    }
end

local function PlanElvUI(side, identity)
    local db = _G.ElvDB
    if type(db) ~= "table" or type(db.profiles) ~= "table" then
        return nil, "ElvUI profile database is unavailable"
    end
    local target = FirstExistingProfile(db.profiles, NamesFor("elvui", side))
    if not target then return nil, "ElvUI target profile is missing" end
    return { provider = "elvui", side = side, target = target,
        key = identity.name .. " - " .. identity.realm }
end

local function PlanNDui(side, identity)
    local db = _G.NDuiADB
    if type(db) ~= "table" then return nil, "NDui profile database is unavailable" end
    local target, index, reason = ResolveNDuiTarget(db, side)
    if not target then return nil, reason end
    return { provider = "ndui", side = side, target = target, targetIndex = index,
        key = identity.name .. "-" .. identity.realm }
end

local function PlanEllesmere(side)
    local target, reason = ValidateEllesmereTarget(side)
    if not target then return nil, reason end
    return { provider = "ellesmere", side = side, target = target }
end

local PLANNERS = {
    elvui = PlanElvUI,
    ndui = PlanNDui,
    ellesmere = PlanEllesmere,
}

local function PlanDanders(side)
    if ns.ProductManifest:Check("infinitePreset") then return nil end
    local db = _G.DandersFramesDB_v2
    if type(db) ~= "table" or type(db.profiles) ~= "table" then return nil end
    local target = FirstExistingProfile(db.profiles, NamesFor("danders", side))
    if not target then return false, "DandersFrames target profile is missing" end
    return { provider = "danders", side = side, target = target }
end

function ProfileSwitcher:Plan(side)
    if InCombat() then return false, "profile switch is blocked during combat" end
    if side ~= "left" and side ~= "middle" and side ~= "right" then return false, "invalid layout side" end
    local candidates = ProviderCandidates()
    if #candidates > 1 then return false, "multiple UI profile providers are loaded" end
    if side == "middle" and candidates[1] ~= "ellesmere" then
        return false, "middle layout requires EllesmereUI"
    end
    local identity, identityReason
    if candidates[1] == "elvui" or candidates[1] == "ndui" then
        identity, identityReason = PlayerIdentity()
        if not identity then return false, identityReason end
    end

    local steps = {}
    if #candidates == 1 then
        local step, reason = PLANNERS[candidates[1]](side, identity)
        if not step then return false, reason end
        steps[#steps + 1] = step
    end
    if candidates[1] ~= "ellesmere" then
        local danders, dandersReason = PlanDanders(side)
        if danders == false then return false, dandersReason end
        if danders then steps[#steps + 1] = danders end
    end
    if #steps == 0 then return false, "no supported UI profile provider is available" end
    return true, { side = side, steps = steps,
        provider = #candidates == 1 and candidates[1] or "danders" }
end

local function CaptureStep(step)
    if step.provider == "elvui" then
        local db = _G.ElvDB
        local map = db and db.profileKeys
        return { provider = "elvui", key = step.key, mapPresent = type(map) == "table", mapRef = map,
            present = map and rawget(map, step.key) ~= nil,
            value = map and rawget(map, step.key) or nil }
    elseif step.provider == "ndui" then
        local db = _G.NDuiADB
        local map = db and db.ProfileIndex
        return { provider = "ndui", key = step.key, mapPresent = type(map) == "table", mapRef = map,
            present = map and rawget(map, step.key) ~= nil,
            value = map and rawget(map, step.key) or nil }
    elseif step.provider == "ellesmere" then
        local ok, value = pcall(_G.EllesmereUI.GetActiveProfileName)
        if not ok then return nil, "EllesmereUI active profile read failed" end
        return { provider = "ellesmere", value = value }
    elseif step.provider == "danders" then
        local db = _G.DandersFramesDB_v2
        local char = _G.DandersFramesCharDB
        return { provider = "danders", dbRef = db, globalValue = db and db.currentProfile,
            charExists = type(char) == "table",
            charRef = type(char) == "table" and char or nil,
            charPresent = type(char) == "table" and rawget(char, "currentProfile") ~= nil,
            charValue = type(char) == "table" and rawget(char, "currentProfile") or nil }
    end
    return nil, "unknown profile provider"
end

local function RestoreMapValue(map, snapshot)
    if snapshot.present then map[snapshot.key] = snapshot.value else map[snapshot.key] = nil end
end

local function RestoreProviderMap(db, field, snapshot)
    local map = db[field]
    if snapshot.mapPresent then
        if type(map) ~= "table" or map ~= snapshot.mapRef then return false end
        RestoreMapValue(map, snapshot)
        return (snapshot.present and rawget(map, snapshot.key) == snapshot.value)
            or (not snapshot.present and rawget(map, snapshot.key) == nil)
    end
    if map == nil then return true end
    if type(map) ~= "table" then return false end
    local key
    for key in pairs(map) do
        if key ~= snapshot.key then return false end
    end
    map[snapshot.key] = nil
    db[field] = nil
    return db[field] == nil
end

local function RestoreStep(snapshot)
    if snapshot.provider == "elvui" then
        local db = _G.ElvDB
        if type(db) ~= "table" then return false end
        return RestoreProviderMap(db, "profileKeys", snapshot)
    elseif snapshot.provider == "ndui" then
        local db = _G.NDuiADB
        if type(db) ~= "table" then return false end
        return RestoreProviderMap(db, "ProfileIndex", snapshot)
    elseif snapshot.provider == "ellesmere" then
        if type(_G.EllesmereUI) ~= "table" or type(_G.EllesmereUI.SetProfile) ~= "function" then
            return false
        end
        local ok = pcall(_G.EllesmereUI.SetProfile, snapshot.value)
        if not ok then return false end
        local readOK, current = pcall(_G.EllesmereUI.GetActiveProfileName)
        return readOK and current == snapshot.value
    elseif snapshot.provider == "danders" then
        local db = _G.DandersFramesDB_v2
        if type(db) ~= "table" or db ~= snapshot.dbRef then return false end
        db.currentProfile = snapshot.globalValue
        local char = _G.DandersFramesCharDB
        if snapshot.charExists then
            if type(char) ~= "table" or char ~= snapshot.charRef then return false end
            if snapshot.charPresent then char.currentProfile = snapshot.charValue
            else char.currentProfile = nil end
        elseif char ~= nil then
            return false
        end
        return db.currentProfile == snapshot.globalValue
            and (not snapshot.charExists
                or (snapshot.charPresent and char.currentProfile == snapshot.charValue)
                or (not snapshot.charPresent and char.currentProfile == nil))
    end
    return false
end

function ProfileSwitcher:Rollback(snapshot)
    if type(snapshot) ~= "table" then return false, "profile switch snapshot is invalid" end
    local failures = {}
    local index
    for index = #snapshot, 1, -1 do
        if snapshot[index].provider == "ellesmere" then
            return false, "EllesmereUI profile switch is not safely reversible"
        end
        local ok, restored = pcall(RestoreStep, snapshot[index])
        if not ok or not restored then failures[#failures + 1] = snapshot[index].provider end
    end
    if #failures > 0 then return false, "profile switch rollback failed" end
    return true
end

local function ApplyStep(step, before)
    if step.provider == "elvui" then
        local db = _G.ElvDB
        if type(db) ~= "table" or type(db.profiles[step.target]) ~= "table" then
            return false, "ElvUI target profile is unavailable"
        end
        if type(db.profileKeys) ~= "table" then db.profileKeys = {} end
        db.profileKeys[step.key] = step.target
        return db.profileKeys[step.key] == step.target
    elseif step.provider == "ndui" then
        local db = _G.NDuiADB
        local _, currentIndex, reason = ResolveNDuiTarget(db, step.side)
        if reason or currentIndex ~= step.targetIndex then return false, "NDui target profile changed" end
        if type(db.ProfileIndex) ~= "table" then db.ProfileIndex = {} end
        db.ProfileIndex[step.key] = step.targetIndex
        return db.ProfileIndex[step.key] == step.targetIndex
    elseif step.provider == "ellesmere" then
        local target, validateReason = ValidateEllesmereTarget(step.side, step.target)
        if not target then return false, validateReason end
        local setOK, setReason = pcall(_G.EllesmereUI.SetProfile, step.target)
        if not setOK then return false, "EllesmereUI profile switch failed: " .. tostring(setReason) end
        local readOK, current = pcall(_G.EllesmereUI.GetActiveProfileName)
        if readOK and current == step.target then
            local refreshed, refreshReason = RefreshEllesmereLive()
            return true, nil, false, not refreshed, refreshReason
        end
        if readOK and current == before.value then return false, "EllesmereUI profile switch failed" end
        if not readOK then
            -- The external write may have landed. Without a readable state,
            -- another write would be a guess; stop and require a reload.
            return false, "state-unknown-after-ellesmere-commit", true
        end
        -- A known unexpected profile can be rolled back safely through the
        -- same public API, then verified.
        local rollbackOK = pcall(_G.EllesmereUI.SetProfile, before.value)
        local verifyOK, restored = pcall(_G.EllesmereUI.GetActiveProfileName)
        if rollbackOK and verifyOK and restored == before.value then
            RefreshEllesmereLive()
            return false, "EllesmereUI profile switch failed; previous profile restored"
        end
        return false, "state-unknown-after-ellesmere-commit", true
    elseif step.provider == "danders" then
        local db = _G.DandersFramesDB_v2
        if type(db) ~= "table" or type(db.profiles) ~= "table"
            or type(db.profiles[step.target]) ~= "table" then
            return false, "DandersFrames target profile is unavailable"
        end
        db.currentProfile = step.target
        if type(_G.DandersFramesCharDB) == "table" then
            _G.DandersFramesCharDB.currentProfile = step.target
        end
        return db.currentProfile == step.target
            and (type(_G.DandersFramesCharDB) ~= "table"
                or _G.DandersFramesCharDB.currentProfile == step.target)
    end
    return false, "unknown profile provider"
end

function ProfileSwitcher:Apply(plan)
    if InCombat() then return false, "profile switch is blocked during combat" end
    if type(plan) ~= "table" or type(plan.steps) ~= "table" then
        return false, "profile switch plan is invalid"
    end
    local orderedSteps = {}
    local ellesmereStep
    local index
    for index = 1, #plan.steps do
        if plan.steps[index].provider == "ellesmere" then ellesmereStep = plan.steps[index]
        else orderedSteps[#orderedSteps + 1] = plan.steps[index] end
    end
    if ellesmereStep then orderedSteps[#orderedSteps + 1] = ellesmereStep end

    local snapshot = {}
    for index = 1, #orderedSteps do
        local captured, reason = CaptureStep(orderedSteps[index])
        if not captured then return false, reason end
        snapshot[index] = captured
    end

    local changed = false
    local reloadRequired = false
    local appliedSnapshots = {}
    local ellesmereCommitted = false
    local ellesmereLiveRefreshFailed = false
    local ellesmereLiveRefreshReason
    for index = 1, #orderedSteps do
        local step = orderedSteps[index]
        local before = snapshot[index]
        local already = ((step.provider == "elvui" or step.provider == "ndui")
                and before.present
                and before.value == (step.provider == "ndui" and step.targetIndex or step.target))
            or (step.provider == "ellesmere" and before.value == step.target)
            or (step.provider == "danders" and before.globalValue == step.target
                and (not before.charExists or before.charValue == step.target))
        if already and step.provider == "ellesmere" then
            local refreshed, refreshReason = RefreshEllesmereLive()
            if not refreshed then
                reloadRequired = true
                ellesmereLiveRefreshFailed = true
                ellesmereLiveRefreshReason = refreshReason
            end
        elseif not already then
            if InCombat() then
                local rolledBack = self:Rollback(appliedSnapshots)
                if not rolledBack then return false, "combat started and profile rollback failed" end
                return false, "profile switch is blocked during combat"
            end
            -- A provider can mutate its first storage location and then fail while
            -- updating a second one. Include the current reversible step before
            -- calling it so that partial writes are restored as well.
            if step.provider ~= "ellesmere" then
                appliedSnapshots[#appliedSnapshots + 1] = before
            end
            local ok, applied, reason, stateUnknown, refreshNeedsReload, refreshReason = pcall(ApplyStep, step, before)
            if not ok or not applied then
                if stateUnknown then
                    return false, "state-unknown-after-ellesmere-commit"
                end
                local rolledBack = self:Rollback(appliedSnapshots)
                if not rolledBack then
                    return false, "profile switch failed and rollback failed"
                end
                return false, tostring(reason or applied or "profile switch failed")
            end
            changed = true
            if step.provider == "ellesmere" then
                ellesmereCommitted = true
                if refreshNeedsReload then
                    reloadRequired = true
                    ellesmereLiveRefreshFailed = true
                    ellesmereLiveRefreshReason = refreshReason
                end
            else
                reloadRequired = true
            end
        end
    end
    return true, {
        changed = changed,
        provider = plan.provider,
        side = plan.side,
        reloadRequired = reloadRequired,
        snapshot = appliedSnapshots,
        ellesmereCommitted = ellesmereCommitted,
        ellesmereLiveRefreshFailed = ellesmereLiveRefreshFailed,
        ellesmereLiveRefreshReason = ellesmereLiveRefreshReason,
        reversible = not ellesmereCommitted,
    }
end

function ProfileSwitcher:Switch(side)
    if InCombat() then return false, "profile switch is blocked during combat" end
    local planned, planOrReason = self:Plan(side)
    if not planned then return false, planOrReason end
    return self:Apply(planOrReason)
end

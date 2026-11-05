-- 文件职责：Retail职业状态、可读大餐通告和声音接口；不持有事件或计时器。
-- 边界：仅Retail装配；配置沿用旧namespace，运行资源由新版Runtime管理。
local _, ns = ...
if not ns.Build.IsFamily("retail") or not ns.Build.HasModule("ClassReminders") then return end
local Adapter, Data = {}, ns.ClassReminderData
local function IsSecret(value) return issecretvalue and issecretvalue(value) end
local function Known(id)
    local value = IsPlayerSpell(id)
    if IsSecret(value) then return false end
    if value then return true end
    value = IsSpellKnown(id)
    return not IsSecret(value) and value == true
end

local function FeastName(name)
    -- 仅在匹配到大餐时查队伍身份；不读取施法，不保留可能过期的名单缓存。
    local matchedColor, ambiguous
    local function ReadUnit(unit)
        local unitName, realm = UnitFullName(unit)
        if IsSecret(unitName) or type(unitName) ~= "string" then return end
        local fullName = unitName
        if not IsSecret(realm) and type(realm) == "string" and realm ~= "" then
            fullName = unitName .. "-" .. realm
        end
        if name ~= unitName and name ~= fullName then return end
        local _, class = UnitClass(unit)
        if IsSecret(class) or type(class) ~= "string" then return end
        local color = RAID_CLASS_COLORS[class]
        if not color then return end
        if matchedColor and matchedColor ~= color.colorStr then ambiguous = true end
        matchedColor = color.colorStr
    end
    ReadUnit("player")
    local raid = IsInRaid()
    for index = 1, raid and GetNumGroupMembers() or GetNumSubgroupMembers() do
        ReadUnit((raid and "raid" or "party") .. index)
    end
    if matchedColor and not ambiguous then return "|c" .. matchedColor .. name .. "|r" end
    return name
end

function Adapter:ReadWeapon(profile)
    if not profile.weapon then return end
    local rite
    for _, candidate in ipairs(Data.rites) do
        if Known(candidate.spellID) then rite = candidate; break end
    end
    if not rite then return end
    local item = GetInventoryItemID("player", 16)
    if IsSecret(item) or not item then return end
    local query = C_PaperDollInfo and C_PaperDollInfo.GetTemporaryEnchantmentInfo
    if not query then return end
    -- pcall 仅隔离接口异常；不清洗 secret，不回退到 Aura 扫描。
    local ok, info = pcall(query, 16)
    if not ok or IsSecret(info) then return end
    -- 进本后主手已可读，临时附魔字段仍可能为空。空结果不是已确认缺失。
    if info == nil then return rite.spellID, nil, true end
    -- Match Elles' Paladin rite check: presence, not a hard-coded enchant ID.
    -- Do not inspect enchantID: it can differ between rites/builds or be restricted.
    if type(info) ~= "table" then return end
    local remaining, expires = info.remainingTimeMs, info.hasExpirationTime
    if not IsSecret(remaining) and not IsSecret(expires) and expires == true
        and type(remaining) == "number" then
        if remaining <= 0 then return end
        -- 附魔到期后复查一次。装备/附魔变化事件会取消并重排此计时。
        return nil, remaining / 1000 + 0.1
    end
end

local function NeedsBeacon(id)
    local query = C_SpellActivationOverlay and C_SpellActivationOverlay.IsSpellOverlayed
    if not query then return false end
    local ok, value = pcall(query, id)
    return ok and not IsSecret(value) and value == true
end

function Adapter:ReadBeacons(profile)
    if not profile.beacon then return end
    local light = Known(Data.light) and not Known(Data.virtue) and NeedsBeacon(Data.light)
    local faith = Known(Data.faith) and NeedsBeacon(Data.faith)
    if light and faith then return Data.light, Data.faith end
    if light then return Data.light, Data.light end
    if faith then return Data.faith, Data.faith end
end

function Adapter:InReminderContext()
    local _, kind = IsInInstance()
    return (kind == "party" or kind == "raid")
        and not UnitIsDeadOrGhost("player") and not UnitInVehicle("player")
        and not (IsMounted() and IsFlying())
end


function Adapter:IsInCombat() return InCombatLockdown() end
function Adapter:IsPaladin() local _, class = UnitClass("player"); return class == "PALADIN" end
function Adapter:IsInGroup() return IsInGroup() end
function Adapter:GetTime() return GetTime() end
function Adapter:GetTexture(id) return C_Spell.GetSpellTexture(id) end
function Adapter:IsEncounterActive()
    if type(IsEncounterInProgress) ~= "function" then return true end
    local ok, active = pcall(IsEncounterInProgress)
    return not ok or IsSecret(active) or active ~= false
end
function Adapter:SupportsFeast()
    local types, states = Enum and Enum.AddOnRestrictionType, Enum and Enum.AddOnRestrictionState
    return types and types.ChallengeMode ~= nil and states and states.Inactive ~= nil
        and C_RestrictedActions and type(C_RestrictedActions.IsAddOnRestrictionActive) == "function"
        and type(IsEncounterInProgress) == "function" or false
end
function Adapter:IsChallengeActive()
    local kind = Enum and Enum.AddOnRestrictionType and Enum.AddOnRestrictionType.ChallengeMode
    local states = Enum and Enum.AddOnRestrictionState
    local query = C_RestrictedActions and C_RestrictedActions.IsAddOnRestrictionActive
    if kind == nil or not states or states.Inactive == nil or type(query) ~= "function" then return true end
    local ok, active = pcall(query, kind)
    return not ok or IsSecret(active) or active ~= false
end
function Adapter:ReadChallengeEvent(kind, state)
    local types, states = Enum and Enum.AddOnRestrictionType, Enum and Enum.AddOnRestrictionState
    if not types or not states or types.ChallengeMode == nil or states.Inactive == nil then return true end
    if IsSecret(kind) or IsSecret(state) then return true end
    if kind ~= types.ChallengeMode then return nil end
    return state ~= states.Inactive
end
function Adapter:CanListenForFeast()
    if self:IsInCombat() then return false end
    local _, kind, difficulty = GetInstanceInfo()
    return difficulty ~= 8 and (kind == "party" or kind == "raid")
end
function Adapter:IsRefreshEvent(event, value)
    if event == "SPELL_ACTIVATION_OVERLAY_GLOW_SHOW" or event == "SPELL_ACTIVATION_OVERLAY_GLOW_HIDE" then
        return not IsSecret(value) and (value == Data.light or value == Data.faith)
    elseif event == "UNIT_INVENTORY_CHANGED" then return not IsSecret(value) and value == "player" end
    return true
end
function Adapter:ReadFeast(message, sender)
    if IsSecret(message) or type(message) ~= "string" then return end
    local name, food = message:match("^(.+)摆下了一席(.+)，供大家享用！$")
    if not name or not Data.feastNames[food] then return end
    if name == "%s" then
        name = not IsSecret(sender) and type(sender) == "string" and sender ~= "" and sender or "有人"
    end
    return name .. "\n" .. food, FeastName(name) .. " 放大餐咯！快来吃吃"
end
function Adapter:PlayFeastSound()
    local played, handle = PlaySoundFile(Data.feastSound, "Master")
    if played then return handle end
end
function Adapter:StopSound(handle) if handle then StopSound(handle) end end
ns.ClassReminderAdapter = Adapter

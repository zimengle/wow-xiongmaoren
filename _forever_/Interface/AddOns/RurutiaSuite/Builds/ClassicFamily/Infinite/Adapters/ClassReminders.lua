-- 无限服职业增益：低频解析已学技能，按本地化名称匹配光环；不持有事件或计时器。
local _, ns = ...
if not ns.Build.Is("classic-infinite") or not ns.Build.HasModule("ClassReminders") then return end
local Adapter = {}
Adapter.description = "脱战时检测职业增益、属性食物、武器毒药和萨满武器附魔，缺失或临期时显示中央文字。"
local AURA_SCAN_LIMIT = 80
local function IsSecret(value) return issecretvalue and issecretvalue(value) end
local function Number(value) return not IsSecret(value) and type(value) == "number" end
local function String(value) return not IsSecret(value) and type(value) == "string" and value ~= "" end
local function SpellName(id)
    if not Number(id) then return end
    local query = C_Spell and C_Spell.GetSpellName or GetSpellInfo
    if type(query) ~= "function" then return end
    local ok, value = pcall(query, id)
    if ok and String(value) then return value end
end
local function Known(id)
    for _, query in ipairs({IsPlayerSpell or false, IsSpellKnown or false}) do
        if type(query) == "function" then
            local ok, value = pcall(query, id)
            if ok and not IsSecret(value) and value == true then return true end
        end
    end
    return false
end
local function LearnedLevel(id, fallback)
    local query = C_Spell and C_Spell.GetSpellLevelLearned
    if type(query) == "function" then
        local ok, value = pcall(query, id)
        if ok and Number(value) and value > 0 then return value end
    end
    return fallback
end
local function SelectKnown(state, id, level)
    state.known = true
    -- “最新”按已学法术的学习等级排序；同级用稳定ID顺序，不持久记录学习时间。
    if not state.iconID or level > state.level or (level == state.level and id > state.iconID) then
        state.iconID, state.level = id, level
    end
end

local function ReadTable(query, ...)
    if type(query) ~= "function" then return end
    local ok, value = pcall(query, ...)
    if ok and not IsSecret(value) and type(value) == "table" then return value end
end

-- Forever uses C_Traits. Only inspect the active configuration at cache rebuild;
-- activeRank excludes pending talent previews. Match names to cover all ranks.
local function HasTalent(spellID)
    local classes, traits = C_ClassTalents, C_Traits
    if type(classes) ~= "table" or type(classes.GetActiveConfigID) ~= "function"
        or type(traits) ~= "table" then return false end
    local ok, configID = pcall(classes.GetActiveConfigID)
    if not ok or not Number(configID) then return false end
    local config = ReadTable(traits.GetConfigInfo, configID)
    local trees = config and config.treeIDs
    if IsSecret(trees) or type(trees) ~= "table" then return false end
    local wantedName = SpellName(spellID)
    for treeIndex = 1, math.min(#trees, 8) do
        local nodes = Number(trees[treeIndex]) and ReadTable(traits.GetTreeNodes, trees[treeIndex])
        if nodes then
            for index = 1, math.min(#nodes, 512) do
                local node = Number(nodes[index]) and ReadTable(traits.GetNodeInfo, configID, nodes[index])
                local active = node and node.activeEntry
                if node and Number(node.activeRank) and node.activeRank > 0
                    and not IsSecret(active) and type(active) == "table" and Number(active.entryID) then
                    local entry = ReadTable(traits.GetEntryInfo, configID, active.entryID)
                    local definition = entry and Number(entry.definitionID) and ReadTable(traits.GetDefinitionInfo, entry.definitionID)
                    local id = definition and definition.spellID
                    if Number(id) and (id == spellID or (wantedName and SpellName(id) == wantedName)) then return true end
                end
            end
        end
    end
    return false
end

local shamanWeaponSpells = {
    {level = 30, ids = {8232, 8235, 10486, 16362}},
    {level = 10, ids = {8024, 8027, 8030, 16339, 16341, 16342}},
    {level = 20, ids = {8033, 8038, 10456, 16355, 16356}},
    {level = 1, ids = {8017, 8018, 8019, 10399, 16314, 16315, 16316}},
}

local function RegisterSpell(match, names, id)
    local state = match.state
    local name, known = SpellName(id), Known(id)
    if name then
        state.names[#state.names + 1] = name
        names[name] = match
    elseif known then
        state.unresolved = true
    end
    if known then SelectKnown(state, id, LearnedLevel(id, match.level)) end
end

local function ScanKnownSpells(names, weaponIDs)
    if not weaponIDs and not next(names) then return end
    local book = C_SpellBook
    local bank = Enum and Enum.SpellBookSpellBank and Enum.SpellBookSpellBank.Player
    local future = Enum and Enum.SpellBookItemType and Enum.SpellBookItemType.FutureSpell
    if type(book) == "table" and Number(bank) and type(book.GetNumSpellBookSkillLines) == "function"
        and type(book.GetSpellBookSkillLineInfo) == "function" and type(book.GetSpellBookItemInfo) == "function" then
        local ok, count = pcall(book.GetNumSpellBookSkillLines)
        if ok and Number(count) then
            for lineIndex = 1, count do
                local lineOK, line = pcall(book.GetSpellBookSkillLineInfo, lineIndex)
                if lineOK and not IsSecret(line) and type(line) == "table" and not IsSecret(line.shouldHide) and line.shouldHide ~= true
                    and Number(line.itemIndexOffset) and Number(line.numSpellBookItems) then
                    for slot = line.itemIndexOffset + 1, line.itemIndexOffset + line.numSpellBookItems do
                        local itemOK, item = pcall(book.GetSpellBookItemInfo, slot, bank)
                        if itemOK and not IsSecret(item) and type(item) == "table"
                            and not IsSecret(item.isOffSpec) and item.isOffSpec ~= true
                            and not IsSecret(item.future) and item.future ~= true
                            and not IsSecret(item.itemType) and (not future or item.itemType ~= future)
                            and Number(item.spellID) then
                            local match = (weaponIDs and weaponIDs[item.spellID])
                                or (String(item.name) and names[item.name])
                            if match then SelectKnown(match.state, item.spellID, LearnedLevel(item.spellID, match.level)) end
                        end
                    end
                end
            end
        end
    end
end

-- 只在启用、重新进入世界或技能变化后解析已学技能，共用一次技能书遍历。
function Adapter:BuildStates(rows, armorRow, selectedArmor, includeShamanWeapon)
    local states, names = {}, {}
    for i, spec in ipairs(rows) do
        local members = spec == armorRow and selectedArmor or spec.members
        local state = {names = {}, ids = {}, known = false, level = -1, previewID = members[1] and members[1].id}
        states[i] = state
        for _, member in ipairs(members) do
            state.ids[#state.ids + 1] = member.id
            RegisterSpell({state = state, level = member.level}, names, member.id)
        end
    end
    local weapon, weaponIDs
    if includeShamanWeapon then
        weapon, weaponIDs = {names = {}, known = false}, {}
        for _, family in ipairs(shamanWeaponSpells) do
            local match = {state = weapon, level = family.level}
            for _, id in ipairs(family.ids) do
                weaponIDs[id] = match
                RegisterSpell(match, names, id)
            end
        end
    end
    ScanKnownSpells(names, weaponIDs)
    for index, spec in ipairs(rows) do
        if spec.requiredTalent then
            states[index].known = states[index].known and HasTalent(spec.requiredTalent)
        end
    end
    return states, weapon and {known = weapon.known, iconID = weapon.iconID, previewID = 8232}
end

function Adapter:ResolveShamanWeaponImbue(rows, armorRow, selectedArmor)
    local states, weapon = self:BuildStates(rows or {}, armorRow, selectedArmor, true)
    return weapon, states
end

-- 名称查询未命中时所有组共用一次有界扫描。true优先，未知不当作缺失。
function Adapter:ReadAuras(states)
    local api = C_UnitAuras or {}
    local byName, byIndex = api.GetAuraDataBySpellName, api.GetAuraDataByIndex
    local needsScan = false
    for _, state in ipairs(states) do
        state.has, state.uncertain = nil, state.unresolved
        if type(byName) == "function" then
            for _, name in ipairs(state.names) do
                local ok, aura = pcall(byName, "player", name, "HELPFUL")
                if not ok or IsSecret(aura) then state.uncertain = true
                elseif aura ~= nil then state.has = true; break end
            end
        end
        if state.has ~= true then needsScan = true end
    end
    if not needsScan then return end
    if type(byIndex) == "function" then
        local complete, unreadable = false, false
        for index = 1, AURA_SCAN_LIMIT do
            local ok, aura = pcall(byIndex, "player", index, "HELPFUL")
            if not ok or IsSecret(aura) then unreadable = true; break end
            if aura == nil then complete = true; break end
            if type(aura) ~= "table" then unreadable = true
            else
                local name = String(aura.name) and aura.name or SpellName(aura.spellId)
                if not name then unreadable = true
                else
                    for _, state in ipairs(states) do
                        for _, candidate in ipairs(state.names) do
                            if name == candidate then state.has = true; break end
                        end
                    end
                end
            end
        end
        for _, state in ipairs(states) do
            if state.has ~= true and complete and not unreadable and not state.uncertain then state.has = false end
        end
    elseif type(byName) == "function" then
        for _, state in ipairs(states) do
            if state.has ~= true and not state.uncertain then state.has = false end
        end
    end
    -- 无名称读取能力时保持未知；基础ID不代表该系列全部等级。
end
function Adapter:IsInCombat() return InCombatLockdown() end
function Adapter:PlayerClass() local _, class = UnitClass("player"); return class end
function Adapter:IsPlayerDeadOrGhost()
    return type(UnitIsDeadOrGhost) == "function" and UnitIsDeadOrGhost("player")
end

function Adapter:IsOnTaxi()
    return type(UnitOnTaxi) == "function" and UnitOnTaxi("player")
end

function Adapter:IsFlying()
    if type(IsFlying) ~= "function" then return false end
    local ok, flying = pcall(IsFlying)
    return not ok or IsSecret(flying) or flying == true
end

function Adapter:GetAttributeFood()
    local data = ns.ConsumableBarDataRegistry
    local catalog = data and data.GetByKey("forever")
    if catalog then return data.GetAttributeFood(catalog.catalog) end
end

function Adapter:HasCarriedFood(items)
    return ns.ConsumableBarAdapter:HasCarriedFood(items)
end

function Adapter:GetPoisonItems()
    local data = ns.ConsumableBarDataRegistry
    local catalog = data and data.GetByKey("forever")
    if not catalog then return end
    local items = {}
    for _, item in ipairs(catalog.catalog) do
        if item.poisonFamily and item.itemID then items[item.itemID] = true end
    end
    return items
end

function Adapter:HasCarriedPoison(items)
    return ns.ConsumableBarAdapter:HasCarriedPoison(items)
end

function Adapter:HasFoodBuff(buffs)
    local reader = ns.ConsumableBarAdapter
    if reader:ShouldAurasBeSecret() then return end
    local complete = true
    for i = 1, AURA_SCAN_LIMIT do
        local _, id, state = reader:GetHelpfulAura(i)
        if state == "end" then
            if complete then return false end
            return
        end
        if state == "unknown" then complete = false end
        if id and buffs[id] then return true end
    end
end

function Adapter:ReadWeaponImbue(slot)
    local reader = ns.ConsumableBarAdapter
    if not reader then return "unknown" end
    local weapon = reader:GetEquippedWeapon(slot)
    if weapon == false then return "notWeapon" end
    if not weapon then return "unknown" end
    local record = reader:ReadCategoryEnchant(slot, "imbue")
    if IsSecret(record) then return "unknown" end
    if record == false then return "missing" end
    if type(record) == "table" then
        local seconds = record.seconds
        return "present", Number(seconds) and seconds >= 0 and seconds < math.huge and seconds or nil
    end
    return "unknown"
end

function Adapter:IsPoisonMissing(slot)
    return self:ReadWeaponImbue(slot) == "missing"
end

function Adapter:GetWeaponEnchantEvent()
    local reader = ns.ConsumableBarAdapter
    return reader and reader:GetWeaponEnchantEvent() or "UNIT_INVENTORY_CHANGED"
end

function Adapter:IsResting()
    if type(IsResting) ~= "function" then return true end
    local ok, resting = pcall(IsResting)
    if not ok or IsSecret(resting) then return true end
    return resting == true
end
function Adapter:GetSpellName(id) return SpellName(id) end
function Adapter:GetTexture(id)
    if C_Spell and type(C_Spell.GetSpellTexture) == "function" then return C_Spell.GetSpellTexture(id) end
    if type(GetSpellInfo) == "function" then local _, _, texture = GetSpellInfo(id); return texture end
end
ns.ClassReminderAdapter = Adapter

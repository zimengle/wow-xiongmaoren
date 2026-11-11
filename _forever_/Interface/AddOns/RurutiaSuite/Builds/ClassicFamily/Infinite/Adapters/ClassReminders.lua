-- 无限服职业增益：低频解析已学技能，按本地化名称匹配光环；不持有事件或计时器。
local _, ns = ...
if not ns.Build.Is("classic-infinite") or not ns.Build.HasModule("ClassReminders") then return end
local Adapter = {}
Adapter.description = "脱战检测本职业已学的常驻增益，缺失时显示中央文字；战斗中与休息时不提醒。"
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

-- 只在启用、重新进入世界或技能变化后调用。仅解析当前职业的提醒组；技能书最多遍历一次。
function Adapter:BuildStates(rows)
    local states, names = {}, {}
    for i, spec in ipairs(rows) do
        local state = {names = {}, ids = {}, known = false, level = -1}
        states[i] = state
        for _, member in ipairs(spec.members) do
            state.ids[#state.ids + 1] = member.id
            local name = SpellName(member.id)
            if name then
                state.names[#state.names + 1] = name
                names[name] = {state = state, level = member.level}
            elseif Known(member.id) then
                state.unresolved = true
            end
            if Known(member.id) then SelectKnown(state, member.id, LearnedLevel(member.id, member.level)) end
        end
    end
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
                            and String(item.name) and Number(item.spellID) then
                            local match = names[item.name]
                            if match then SelectKnown(match.state, item.spellID, LearnedLevel(item.spellID, match.level)) end
                        end
                    end
                end
            end
        end
    end
    return states
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

function Adapter:IsResting()
    if type(IsResting) ~= "function" then return true end
    local ok, resting = pcall(IsResting)
    if not ok or IsSecret(resting) then return true end
    return resting == true
end
function Adapter:GetTexture(id)
    if C_Spell and type(C_Spell.GetSpellTexture) == "function" then return C_Spell.GetSpellTexture(id) end
    if type(GetSpellInfo) == "function" then local _, _, texture = GetSpellInfo(id); return texture end
end
ns.ClassReminderAdapter = Adapter

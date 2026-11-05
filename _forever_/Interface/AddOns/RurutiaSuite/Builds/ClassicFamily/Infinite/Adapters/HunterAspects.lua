local _, ns = ...
if not ns.Build.HasModule("HunterAspects") then return end
local Adapter = {}
-- Original owner WA order; presence in this catalogue never means learned.
local IDS = {61847, 13165, 34074, 20043, 13163, 5118, 13159, 13161}
local function Readable(v) return not (issecretvalue and issecretvalue(v)) end
local function Name(id)
    local query = C_Spell and C_Spell.GetSpellName or GetSpellInfo
    if not query then return end
    local ok, name = pcall(query, id)
    if ok and Readable(name) and type(name) == "string" and name ~= "" then return name end
end
local function Known(id)
    for _, query in ipairs({IsPlayerSpell or false, IsSpellKnown or false}) do
        if type(query) == "function" then
            local ok, value = pcall(query, id)
            if ok and Readable(value) and value == true then return true end
        end
    end
    return false
end
local function Level(id)
    local query = C_Spell and C_Spell.GetSpellLevelLearned
    if query then
        local ok, value = pcall(query, id)
        if ok and Readable(value) and type(value) == "number" then return value end
    end
    return 0
end
function Adapter:IsHunter() local _, class = UnitClass("player"); return class == "HUNTER" end
function Adapter:InCombat() return InCombatLockdown() end
function Adapter:Learned()
    local candidates, byName = {}, {}
    for _, id in ipairs(IDS) do
        local name = Name(id)
        if name then
            local row = {id = id, name = name}
            candidates[#candidates + 1], byName[name] = row, row
            row.known, row.level = Known(id), Level(id)
        end
    end
    -- Name matching finds learned higher ranks even when the base rank is replaced.
    local book, bank = C_SpellBook, Enum and Enum.SpellBookSpellBank and Enum.SpellBookSpellBank.Player
    if book and bank and book.GetNumSpellBookSkillLines and book.GetSpellBookSkillLineInfo
        and book.GetSpellBookItemInfo then
        for line = 1, book.GetNumSpellBookSkillLines() do
            local info = book.GetSpellBookSkillLineInfo(line)
            if info and Readable(info) and Readable(info.shouldHide) and not info.shouldHide
                and Readable(info.itemIndexOffset) and type(info.itemIndexOffset) == "number"
                and Readable(info.numSpellBookItems) and type(info.numSpellBookItems) == "number" then
                for slot = info.itemIndexOffset + 1, info.itemIndexOffset + info.numSpellBookItems do
                    local spell = book.GetSpellBookItemInfo(slot, bank)
                    local future = Enum.SpellBookItemType and Enum.SpellBookItemType.FutureSpell
                    if spell and Readable(spell) and Readable(spell.name) and Readable(spell.spellID)
                        and type(spell.spellID) == "number" and Readable(spell.isOffSpec)
                        and Readable(spell.future) and Readable(spell.itemType)
                        and not spell.isOffSpec and not spell.future and (not future or spell.itemType ~= future) then
                        local row = byName[spell.name]
                        if row then
                            local level = Level(spell.spellID)
                            if not row.known or level > row.level or (level == row.level and spell.spellID > row.id) then
                                row.id, row.level = spell.spellID, level
                            end
                            row.known = true
                        end
                    end
                end
            end
        end
    end
    local result = {}
    for _, row in ipairs(candidates) do
        if row.known then
            row.icon = C_Spell and C_Spell.GetSpellTexture and C_Spell.GetSpellTexture(row.id)
            result[#result + 1] = row
        end
    end
    return result
end
function Adapter:Active(name)
    local query = C_UnitAuras and C_UnitAuras.GetAuraDataBySpellName
    if not query then return nil end
    local ok, aura = pcall(query, "player", name, "HELPFUL")
    if not ok or not Readable(aura) then return nil end
    return aura ~= nil
end
function Adapter:Configure(button, name)
    ns.Compat.RegisterPrimarySecureClicks(button)
    button:SetAttribute("type1", "spell")
    -- Localized name lets the client choose the learned rank; no insecure cast.
    button:SetAttribute("spell1", name)
end
function Adapter:Preview()
    local rows = {}
    -- Eagle first for the visual sample; keep the live learned order unchanged.
    for _, id in ipairs({13165, 61847, 34074, 20043, 13163, 5118, 13159, 13161}) do
        local name = Name(id)
        if name then rows[#rows + 1] = {id = id, name = name,
            icon = C_Spell and C_Spell.GetSpellTexture and C_Spell.GetSpellTexture(id)} end
    end
    return rows
end
function Adapter:Tooltip(button, row, preview)
    if not GameTooltip then return end
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    GameTooltip:SetSpellByID(row.id)
    GameTooltip:AddLine(preview and "预览技能，不施放" or "左键切换守护", 1, 1, 1)
    GameTooltip:Show()
end
function Adapter:HideTooltip() if GameTooltip then GameTooltip:Hide() end end
ns.HunterAspectsAdapter = Adapter

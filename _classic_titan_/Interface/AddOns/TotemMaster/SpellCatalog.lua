local addonName, ST = ...

ST.SpellCatalog = {
    elementSpells = {},
    nameToElement = {},
    nameOrder = {},
    knownShield = {},
    knownWeapon = {},
}

local BOOKTYPE_SPELL = BOOKTYPE_SPELL or "spell"
local IsSpellKnownCompat = IsSpellKnownOrOverridesKnown or IsSpellKnown
local IsPlayerSpellCompat = IsPlayerSpell or function()
    return false
end

local function rankWeight(rankText, spellID)
    if not rankText or rankText == "" then
        return tonumber(spellID) or 0
    end
    local n = tonumber(string.match(rankText, "(%d+)"))
    return n or (tonumber(spellID) or 0)
end

function ST.SpellCatalog:BuildNameToElementMap()
    wipe(self.nameToElement)
    wipe(self.nameOrder)
    for elementSlot, baseIDs in pairs(ST.Config.TotemBaseIDsByElement) do
        self.nameOrder[elementSlot] = {}
        for i = 1, #baseIDs do
            local spellName = GetSpellInfo(baseIDs[i])
            if spellName then
                self.nameToElement[spellName] = elementSlot
                self.nameOrder[elementSlot][spellName] = i
            end
        end
    end
end

function ST.SpellCatalog:Rebuild()
    for _, slot in ipairs(ST.Config.ElementOrder) do
        self.elementSpells[slot] = {}
    end
    wipe(self.knownShield)
    wipe(self.knownWeapon)

    self:BuildNameToElementMap()
    local bestByName = {}

    local tabCount = GetNumSpellTabs() or 0
    for tab = 1, tabCount do
        local _, _, offset, numSpells = GetSpellTabInfo(tab)
        offset = offset or 0
        numSpells = numSpells or 0
        for i = offset + 1, offset + numSpells do
            local spellType, spellID = GetSpellBookItemInfo(i, BOOKTYPE_SPELL)
            if spellType == "SPELL" and spellID then
                local spellName, rankText = GetSpellBookItemName(i, BOOKTYPE_SPELL)
                if spellName then
                    local element = self.nameToElement[spellName]
                    if element then
                        local weight = rankWeight(rankText, spellID)
                        local prev = bestByName[spellName]
                        if not prev or weight > prev.weight then
                            bestByName[spellName] = {
                                id = spellID,
                                name = spellName,
                                icon = GetSpellTexture(spellID),
                                weight = weight,
                            }
                        end
                    end
                end
            end
        end
    end

    for _, slot in ipairs(ST.Config.ElementOrder) do
        local list = self.elementSpells[slot]
        local order = self.nameOrder[slot] or {}
        for spellName, idx in pairs(order) do
            local best = bestByName[spellName]
            if best then
                list[#list + 1] = {
                    id = best.id,
                    name = best.name,
                    icon = best.icon,
                    idx = idx,
                }
            end
        end
        table.sort(self.elementSpells[slot], function(a, b)
            return a.idx < b.idx
        end)
    end

    for i = 1, #ST.Config.ShieldSpellIDs do
        local id = ST.Config.ShieldSpellIDs[i]
        if (IsSpellKnownCompat and IsSpellKnownCompat(id)) or IsPlayerSpellCompat(id) then
            self.knownShield[#self.knownShield + 1] = id
        end
    end

    for i = 1, #ST.Config.WeaponSpellIDs do
        local id = ST.Config.WeaponSpellIDs[i]
        if (IsSpellKnownCompat and IsSpellKnownCompat(id)) or IsPlayerSpellCompat(id) then
            self.knownWeapon[#self.knownWeapon + 1] = id
        end
    end
end

function ST.SpellCatalog:GetElementSpells(slot)
    return self.elementSpells[slot] or {}
end

function ST.SpellCatalog:GetHighestKnownInElement(slot)
    local list = self:GetElementSpells(slot)
    return list[1] and list[1].id or nil
end

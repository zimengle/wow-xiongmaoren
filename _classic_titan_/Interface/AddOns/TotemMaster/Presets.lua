local addonName, ST = ...

ST.Presets = {}
local IsSpellKnownCompat = IsSpellKnownOrOverridesKnown or IsSpellKnown
local IsPlayerSpellCompat = IsPlayerSpell or function(_)
    return false
end

local function elementKey(slot)
    return ST.Config.ElementKeys[slot]
end

local function isSpellKnownInElement(slot, spellID)
    local list = ST.SpellCatalog:GetElementSpells(slot)
    for i = 1, #list do
        if list[i].id == spellID then
            return true
        end
    end
    return false
end

local function listContains(list, value)
    for i = 1, #list do
        if list[i] == value then
            return true
        end
    end
    return false
end

function ST.Presets:GetPreset(index)
    return ST.db and ST.db.presets and ST.db.presets[index] or nil
end

function ST.Presets:GetSpell(index, slot)
    local preset = self:GetPreset(index)
    if not preset then
        return 0
    end
    return preset[elementKey(slot)] or 0
end

function ST.Presets:SetSpell(index, slot, spellID)
    local preset = self:GetPreset(index)
    if not preset then
        return
    end
    preset[elementKey(slot)] = spellID or 0
end

function ST.Presets:GetActiveEditPreset()
    return ST.db.activeEditPreset or 1
end

function ST.Presets:SetActiveEditPreset(index)
    if index < 1 or index > 3 then
        return
    end
    ST.db.activeEditPreset = index
end

function ST.Presets:GetCurrentSummonPreset()
    return ST.db.currentSummonPreset or 1
end

function ST.Presets:SetCurrentSummonPreset(index)
    if index < 1 or index > 3 then
        return
    end
    ST.db.currentSummonPreset = index
end

function ST.Presets:ResetPreset(index)
    local preset = self:GetPreset(index)
    if not preset then
        return
    end
    for _, slot in ipairs(ST.Config.ElementOrder) do
        local key = elementKey(slot)
        preset[key] = ST.SpellCatalog:GetHighestKnownInElement(slot) or 0
    end
end

function ST.Presets:EnsureValid()
    ST.db.presets = ST.db.presets or {}
    for i = 1, 3 do
        ST.db.presets[i] = ST.db.presets[i] or {}
    end

    if not ST.db.activeEditPreset or ST.db.activeEditPreset < 1 or ST.db.activeEditPreset > 3 then
        ST.db.activeEditPreset = 1
    end
    if not ST.db.currentSummonPreset or ST.db.currentSummonPreset < 1 or ST.db.currentSummonPreset > 3 then
        ST.db.currentSummonPreset = 1
    end

    for presetIndex = 1, 3 do
        for _, slot in ipairs(ST.Config.ElementOrder) do
            local key = elementKey(slot)
            local current = ST.db.presets[presetIndex][key]
            local hasCatalogData = #(ST.SpellCatalog:GetElementSpells(slot) or {}) > 0
            if hasCatalogData then
                if current == nil then
                    local fallback = ST.SpellCatalog:GetHighestKnownInElement(slot)
                    if fallback then
                        ST.db.presets[presetIndex][key] = fallback
                    else
                        ST.db.presets[presetIndex][key] = 0
                    end
                end
            end
        end
    end

    local hasShieldData = #ST.SpellCatalog.knownShield > 0
    if hasShieldData and (not ST.db.defaultShieldSpell
        or not listContains(ST.SpellCatalog.knownShield, ST.db.defaultShieldSpell)
        or not (((IsSpellKnownCompat and IsSpellKnownCompat(ST.db.defaultShieldSpell))) or IsPlayerSpellCompat(ST.db.defaultShieldSpell))) then
        ST.db.defaultShieldSpell = ST.SpellCatalog.knownShield[1]
    end
    if not ST.db.defaultShieldSpell then
        ST.db.defaultShieldSpell = ST.Config.ShieldSpellIDs[1]
    end

    local hasWeaponData = #ST.SpellCatalog.knownWeapon > 0
    if hasWeaponData and (not ST.db.defaultWeaponSpell
        or not listContains(ST.SpellCatalog.knownWeapon, ST.db.defaultWeaponSpell)
        or not (((IsSpellKnownCompat and IsSpellKnownCompat(ST.db.defaultWeaponSpell))) or IsPlayerSpellCompat(ST.db.defaultWeaponSpell))) then
        ST.db.defaultWeaponSpell = ST.SpellCatalog.knownWeapon[1]
    end
    if not ST.db.defaultWeaponSpell then
        ST.db.defaultWeaponSpell = ST.Config.WeaponSpellIDs[5]
    end
end

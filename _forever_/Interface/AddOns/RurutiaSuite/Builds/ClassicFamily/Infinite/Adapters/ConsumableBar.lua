local _, ns = ...
if ns.Build.GetID() ~= "classic-infinite" then return end

local Adapter = ns.ConsumableBarAdapterBase.New("forever", "无限（Forever）")
Adapter.supportsCategoryEffects = true

local function Read(query, ...)
    if type(query) ~= "function" then return end
    local ok, a, b, c, d, e, f, g, h, i, j = pcall(query, ...)
    if ok then return a, b, c, d, e, f, g, h, i, j end
end

function Adapter:IsSecret(value)
    return type(issecretvalue) == "function" and issecretvalue(value)
end

function Adapter:PlainNumber(value)
    if not self:IsSecret(value) and type(value) == "number" then return value end
end

function Adapter:ShouldAurasBeSecret()
    local check = C_Secrets and C_Secrets.ShouldAurasBeSecret
    if type(check) ~= "function" then return false end
    local value = Read(check)
    return self:IsSecret(value) or value ~= false
end

function Adapter:GetHelpfulAura(index)
    local query = C_UnitAuras and C_UnitAuras.GetAuraDataByIndex
    local id, expiration
    if type(query) == "function" then
        local ok, aura = pcall(query, "player", index, "HELPFUL")
        if not ok or self:IsSecret(aura) then return nil, nil, "unknown" end
        if aura == nil then return nil, nil, "end" end
        if type(aura) ~= "table" then return nil, nil, "unknown" end
        id, expiration = aura.spellId, aura.expirationTime
    elseif type(UnitAura) == "function" then
        local ok, name, _, _, _, _, time, _, _, _, spellID = pcall(UnitAura, "player", index, "HELPFUL")
        if not ok or self:IsSecret(name) then return nil, nil, "unknown" end
        if name == nil then return nil, nil, "end" end
        id, expiration = spellID, time
    end
    id = self:PlainNumber(id)
    return self:PlainNumber(expiration), id, id and "aura" or "unknown"
end

function Adapter:GetCarriedCount(itemID, charges)
    local count = Read(C_Item and C_Item.GetItemCount, itemID, false, charges == true, false, false)
    if not self:IsSecret(count) and count == nil then
        count = Read(GetItemCount, itemID, false, charges == true)
    end
    return self:PlainNumber(count)
end

function Adapter:GetItemCount(itemID, charges)
    return self:GetCarriedCount(itemID, charges) or 0
end

local function HasCarriedItem(self, itemIDs, eligible)
    local bags = C_Container
    if bags and type(bags.GetContainerNumSlots) == "function" and type(bags.GetContainerItemID) == "function" then
        local lastBag = math.max(NUM_TOTAL_EQUIPPED_BAG_SLOTS or 0, NUM_BAG_SLOTS or 4)
        for bag = 0, lastBag do
            local slots = self:PlainNumber(Read(bags.GetContainerNumSlots, bag)) or 0
            for slot = 1, slots do
                local id = self:PlainNumber(Read(bags.GetContainerItemID, bag, slot))
                if id and itemIDs[id] and eligible(id) then return true end
            end
        end
    else
        for id in pairs(itemIDs) do
            if (self:GetCarriedCount(id) or 0) > 0 and eligible(id) then return true end
        end
    end
    return false
end

function Adapter:HasCarriedFood(itemIDs)
    local level = self:PlainNumber(Read(UnitLevel, "player")) or 0
    return HasCarriedItem(self, itemIDs, function(id) return itemIDs[id] <= level end)
end

function Adapter:HasCarriedPoison(itemIDs)
    local usable = C_Item and C_Item.IsUsableItem or IsUsableItem
    return HasCarriedItem(self, itemIDs, function(id)
        if type(usable) ~= "function" then return true end
        local value = Read(usable, id)
        return not self:IsSecret(value) and value == true
    end)
end

function Adapter:GetActiveTalentGroup()
    local group = self:PlainNumber(Read(C_SpecializationInfo and C_SpecializationInfo.GetActiveSpecGroup))
    if not group or group < 1 then group = self:PlainNumber(Read(GetActiveTalentGroup)) end
    if group and group >= 1 then return group end
    -- Clients without a talent-group API have a single binding namespace.
    if not (C_SpecializationInfo and C_SpecializationInfo.GetActiveSpecGroup) and not GetActiveTalentGroup then return 1 end
end

function Adapter:IsRogue()
    local _, class = Read(UnitClass, "player")
    return not self:IsSecret(class) and class == "ROGUE"
end

function Adapter:SupportsTalentGroupEvent()
    local check = C_EventUtils and C_EventUtils.IsEventValid
    if type(check) ~= "function" then return true end
    local value = Read(check, "ACTIVE_TALENT_GROUP_CHANGED")
    return not self:IsSecret(value) and value == true
end

function Adapter:GetEquippedWeapon(slot)
    local ok, itemID = pcall(GetInventoryItemID, "player", slot)
    if not ok or self:IsSecret(itemID) then return end
    if itemID == nil then return false end
    itemID = self:PlainNumber(itemID)
    if not itemID then return end
    local instant = C_Item and C_Item.GetItemInfoInstant or GetItemInfoInstant
    local _, _, _, _, _, class = Read(instant, itemID)
    class = self:PlainNumber(class)
    if class and class ~= 2 then return false end -- Weapon class; exclude shields and held items.
    if slot == 17 and not class then return end
    local guid
    if ItemLocation and C_Item and type(C_Item.GetItemGUID) == "function" then
        guid = Read(C_Item.GetItemGUID, ItemLocation:CreateFromEquipmentSlot(slot))
    end
    if not self:IsSecret(guid) and type(guid) == "string" then return guid end
    return itemID
end

function Adapter:GetItemSpell(itemID)
    local name, id = Read(C_Item and C_Item.GetItemSpell, itemID)
    if not self:IsSecret(name) and not self:IsSecret(id) and name == nil and id == nil then
        name, id = Read(GetItemSpell, itemID)
    end
    if self:IsSecret(name) then name = nil end
    return name, self:PlainNumber(id)
end

function Adapter:GetItemName(itemID)
    local name = Read(C_Item and C_Item.GetItemInfo, itemID)
    if not self:IsSecret(name) and name == nil then name = Read(GetItemInfo, itemID) end
    if not self:IsSecret(name) and type(name) == "string" then return name end
end

function Adapter:GetInventoryItemID(slot)
    return self:PlainNumber(Read(GetInventoryItemID, "player", slot))
end

function Adapter:GetInventoryItemTexture(slot)
    return self:PlainNumber(Read(GetInventoryItemTexture, "player", slot))
end

function Adapter:GetItemIcon(itemID)
    local icon = self:PlainNumber(Read(C_Item and C_Item.GetItemIconByID, itemID))
    if icon then return icon end
    icon = self:PlainNumber(Read(GetItemIcon, itemID))
    if icon then return icon end
    local _, _, _, _, _, _, _, _, _, resolved = Read(GetItemInfo, itemID)
    return self:PlainNumber(resolved)
end

local function PlainCooldown(self, start, duration, enabled)
    if self:IsSecret(enabled) then return end
    return self:PlainNumber(start), self:PlainNumber(duration), enabled == false and 0 or enabled
end

function Adapter:GetInventoryCooldown(slot)
    return PlainCooldown(self, Read(GetInventoryItemCooldown, "player", slot))
end

function Adapter:GetItemCooldown(itemID)
    local query = C_Item and C_Item.GetItemCooldown or C_Container and C_Container.GetItemCooldown or GetItemCooldown
    return PlainCooldown(self, Read(query, itemID))
end

function Adapter:GetWeaponEnchantEvent()
    local event = "WEAPON_ENCHANT_CHANGED"
    local valid = Read(C_EventUtils and C_EventUtils.IsEventValid, event)
    if not self:IsSecret(valid) and valid == true then return event end
    return "UNIT_INVENTORY_CHANGED"
end

local function EnchantRecord(self, id, milliseconds, icon)
    local time = self:PlainNumber(milliseconds)
    if time and time <= 0 then return false end
    return {id = self:PlainNumber(id), seconds = time and time / 1000, icon = self:PlainNumber(icon)}
end

-- Each channel is a record, false (confirmed absent), or nil (unreadable).
-- Forever can put poisons and temporary oils/stones on the same weapon.
function Adapter:ReadWeaponEnchantments(slot)
    local query = C_Item and C_Item.GetWeaponEnchantInfo
    if type(query) == "function" then
        local types, slots = Enum and Enum.ItemEnchantType, Enum and Enum.WeaponSlot
        local temporaryType = types and types.Temporary or 2
        local imbueType = types and types.Imbue
        local weaponSlot = slots and (slot == 16 and slots.MainHand or slots.OffHand) or slot - 16
        local list = Read(query, weaponSlot)
        if self:IsSecret(list) or type(list) ~= "table" then return nil, nil, imbueType ~= nil end
        local temporary, imbue, sawTemporary, sawImbue, unknown
        for _, entry in ipairs(list) do
            if self:IsSecret(entry) or type(entry) ~= "table" then
                unknown = true
            else
                local kind = self:PlainNumber(entry.enchantType)
                if kind == nil then
                    unknown = true
                elseif kind == temporaryType or kind == imbueType then
                    local record, present = nil, entry.hasEnchant
                    if not self:IsSecret(present) and type(present) == "boolean" then
                        record = false
                        if present then record = EnchantRecord(self, entry.enchantID, entry.timeLeft, entry.enchantIconID) end
                    end
                    if kind == temporaryType then temporary, sawTemporary = record, true
                    else imbue, sawImbue = record, true end
                end
            end
        end
        if not unknown and not sawTemporary then temporary = false end
        if imbueType and not unknown and not sawImbue then imbue = false end
        return temporary, imbue, imbueType ~= nil
    end
    local main, mainTime, _, mainID, off, offTime, _, offID = Read(GetWeaponEnchantInfo)
    local present, id, milliseconds
    if slot == 16 then present, id, milliseconds = main, mainID, mainTime
    else present, id, milliseconds = off, offID, offTime end
    if self:IsSecret(present) or type(present) ~= "boolean" then return end
    if not present then return false end
    return EnchantRecord(self, id, milliseconds)
end

function Adapter:ReadCategoryEnchant(slot, category)
    local temporary, imbue, separate = self:ReadWeaponEnchantments(slot)
    if separate and (category == "poison" or category == "imbue") then return imbue end
    return temporary
end

-- Prefer current structured tooltip data. Only called out of combat for a new
-- temporary enchant identity when its icon alone could not classify it.
function Adapter:GetWeaponTooltipLines(slot)
    local tooltip = Read(C_TooltipInfo and C_TooltipInfo.GetInventoryItem, "player", slot)
    if self:IsSecret(tooltip) or type(tooltip) ~= "table" then return end
    local lines = tooltip.lines
    if self:IsSecret(lines) or type(lines) ~= "table" then return end
    return lines
end

ns.ConsumableBarAdapter = Adapter

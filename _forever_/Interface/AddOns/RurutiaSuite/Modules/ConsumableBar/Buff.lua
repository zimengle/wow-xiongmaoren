local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ConsumableBar")) then return end

local Definition = ns.ConsumableBarDefinition
if type(Definition) ~= "table" then
    error("ConsumableBar Definition.lua must load before Buff.lua", 2)
end

local Adapter = Definition.ADAPTER
local WEAPON_CATEGORIES = {weapon = true, poison = true}
local MAIN, OFF = 16, 17

local function FormatAuraTime(expirationTime)
    if not expirationTime or expirationTime == 0 then return "" end
    local remaining = expirationTime - Adapter:GetTime()
    if remaining <= 0 then return "" end
    if remaining >= 3600 then
        return string.format("%dh", math.floor(remaining / 3600 + 0.5))
    elseif remaining >= 60 then
        return string.format("%dm", math.floor(remaining / 60 + 0.5))
    end
    return tostring(math.floor(remaining + 0.5))
end

function Definition:GetBuffTimeText(info)
    local expirations = self.foodBuffExpirations
    if info and info.buffID then
        return FormatAuraTime(expirations and expirations[info.buffID])
    end
    local index
    for index = 1, #(info and info.buffIDs or {}) do
        local text = FormatAuraTime(expirations and expirations[info.buffIDs[index]])
        if text ~= "" then return text end
    end
    return ""
end

function Definition:RefreshCategoryAuras()
    self.auraScanComplete = false
    if Adapter:ShouldAurasBeSecret() then return end
    local seen = self.categoryAuraScratch or {}
    self.categoryAuraScratch = seen
    for id in pairs(seen) do seen[id] = nil end
    local expirations = self.foodBuffExpirations
    local present = self.foodBuffPresent or {}
    self.foodBuffPresent = present
    local readable = true
    for index = 1, 80 do
        local expiration, id, status = Adapter:GetHelpfulAura(index)
        if status == "end" then
            self.auraScanComplete = readable
            break
        end
        if status == "unknown" then readable = false end
        if id and self.foodBuffIDs[id] then
            seen[id], present[id] = true, true
            if expiration ~= nil then expirations[id] = expiration end
        end
    end
    if self.auraScanComplete then
        for id in pairs(present) do
            if not seen[id] then present[id], expirations[id] = nil, nil end
        end
    end
    self:RecordScan()
end

local function MatchTooltipName(text, name)
    if not name then return false end
    local last = #name
    return text:sub(1, last) == name and
        (text:sub(last + 1, last + 1) == " " or text:sub(last + 1, last + 1) == "("
            or text:sub(last + 1, last + 3) == "（" or #text == last)
end

local function BuildEnchantIconIndex(self)
    local byAny, byCategory = {}, {}
    for item, category in pairs(self.weaponItemCategories or {}) do
        local itemIcon = Adapter:GetItemIcon(item.itemID)
        if itemIcon then
            local prevCat = byAny[itemIcon]
            if prevCat == nil then byAny[itemIcon] = category
            elseif prevCat ~= category then byAny[itemIcon] = false end

            local bucket = byCategory[category]
            if not bucket then bucket = {}; byCategory[category] = bucket end
            local entry = bucket[itemIcon]
            if not entry then
                bucket[itemIcon] = {itemID = item.itemID, poisonFamily = item.poisonFamily or false}
            else
                if entry.itemID ~= item.itemID then entry.itemID = false end
                if entry.poisonFamily ~= (item.poisonFamily or false) then entry.poisonFamily = false end
            end
        end
    end
    self.enchantIconIndex = {byAny = byAny, byCategory = byCategory}
    return self.enchantIconIndex
end

function Definition:IdentifyWeaponEnchant(slot, icon, knownCategory)
    local index = self.enchantIconIndex or BuildEnchantIconIndex(self)
    local category = knownCategory or (icon and index.byAny[icon]) or nil
    if category == false then category = nil end
    if icon and category then
        local entry = index.byCategory[category] and index.byCategory[category][icon]
        if entry then
            if entry.itemID then return category, entry.itemID, entry.poisonFamily or nil end
            if category == "poison" and entry.poisonFamily then return category, nil, entry.poisonFamily end
        end
    end
    local lines = Adapter:GetWeaponTooltipLines(slot)
    if lines then
        local matchedCategory, matchedItem, matchedLen, ambiguous = nil, nil, 0, false
        for lineIndex = 2, #lines do
            local line = lines[lineIndex]
            if not Adapter:IsSecret(line) and type(line) == "table" then
                local text = line.leftText
                if not Adapter:IsSecret(text) and type(text) == "string" then
                    for item, itemCategory in pairs(self.weaponItemCategories or {}) do
                        if not knownCategory or itemCategory == knownCategory then
                            local name = item.name
                            local localized = Adapter:GetItemName(item.itemID)
                            if Adapter:IsSecret(localized) then localized = nil end
                            local oilShort = name and name:gsub("之油$", "油")
                            local hitLen = MatchTooltipName(text, name) and #name
                                or (MatchTooltipName(text, localized) and #localized)
                                or (MatchTooltipName(text, oilShort) and #oilShort)
                                or nil
                            if hitLen then
                                if matchedCategory and matchedCategory ~= itemCategory then
                                    ambiguous = true
                                elseif hitLen > matchedLen then
                                    matchedCategory, matchedItem, matchedLen = itemCategory, item, hitLen
                                elseif hitLen == matchedLen and matchedItem and matchedItem.itemID ~= item.itemID then
                                    if matchedItem.poisonFamily and matchedItem.poisonFamily == item.poisonFamily then
                                        matchedItem = {poisonFamily = item.poisonFamily}
                                    else
                                        matchedItem = nil
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if not ambiguous and matchedCategory then
            return matchedCategory, matchedItem and matchedItem.itemID or nil, matchedItem and matchedItem.poisonFamily or nil
        end
    end
    return category, nil, nil
end

local function ClearEnchant(snapshot)
    snapshot.expiration, snapshot.category, snapshot.id, snapshot.icon, snapshot.present = nil, nil, nil, nil, nil
    snapshot.classifiedID, snapshot.classified, snapshot.itemID, snapshot.poisonFamily = nil, nil, nil, nil
end

local function SyncEnchant(module, slot, generation, snapshot, record, knownCategory, now, combat)
    if snapshot.generation ~= generation or record == false
        or record and (record.id and snapshot.id ~= record.id
            or not record.id and record.icon and snapshot.icon and snapshot.icon ~= record.icon) then
        ClearEnchant(snapshot)
        snapshot.generation = generation
    end
    if not record then snapshot.present = record; return end
    snapshot.present = true
    if combat then return end
    if record.seconds and (record.id or not snapshot.id) then snapshot.expiration = now + record.seconds end
    if snapshot.classifiedID ~= record.id or snapshot.icon ~= record.icon then
        snapshot.category, snapshot.classified, snapshot.itemID, snapshot.poisonFamily = nil, nil, nil, nil
    end
    snapshot.id, snapshot.classifiedID, snapshot.icon = record.id or snapshot.id, record.id, record.icon
    if not snapshot.classified then
        -- Cache classification & item identity for this hand, enchant ID and icon until the snapshot changes.
        local category, itemID, poisonFamily = module:IdentifyWeaponEnchant(slot, record.icon, knownCategory)
        snapshot.category = category or knownCategory or false
        snapshot.itemID = itemID
        snapshot.poisonFamily = poisonFamily
        snapshot.classified = true
    end
end

function Definition:RefreshWeaponEnchants()
    local states = self.weaponEnchants or {
        {generation = 0, temporary = {}, imbue = {}},
        {generation = 0, temporary = {}, imbue = {}},
    }
    self.weaponEnchants = states
    local now, combat = Adapter:GetTime(), Adapter:IsInCombat()
    for index = 1, 2 do
        local slot, state = MAIN + index - 1, states[index]
        local weapon = Adapter:GetEquippedWeapon(slot)
        if weapon ~= nil and weapon ~= state.weapon then
            state.weapon, state.generation = weapon, state.generation + 1
        end
        local temporary, imbue, separate
        if weapon then temporary, imbue, separate = Adapter:ReadWeaponEnchantments(slot) end
        if separate ~= nil then state.separate = separate end
        SyncEnchant(self, slot, state.generation, state.temporary, temporary, state.separate and "weapon", now, combat)
        SyncEnchant(self, slot, state.generation, state.imbue, imbue, state.separate and self.isRogue and "poison", now, combat)
    end
end

function Definition:InvalidateWeaponSlot(slot)
    if self.pendingCategoryUse and self.pendingCategoryUse.slot == slot then self:ClearPendingCategoryUse() end
    local state = self.weaponEnchants and self.weaponEnchants[slot - MAIN + 1]
    if not state then return end
    state.generation = state.generation + 1
    state.weapon = nil
    ClearEnchant(state.temporary)
    ClearEnchant(state.imbue)
end

function Definition:GetEnchantSnapshot(slot, category)
    local state = self.weaponEnchants and self.weaponEnchants[slot - MAIN + 1]
    if not state or not state.weapon then return end
    return state.separate and category == "poison" and state.imbue or state.temporary, state
end

local function WeaponCategoryEffect(snapshot, category)
    if not snapshot or snapshot.category ~= category then return "" end
    return FormatAuraTime(snapshot.expiration)
end

local function SnapshotMatchesItem(snapshot, category, info)
    if not snapshot or snapshot.category ~= category then return false end
    if snapshot.itemID then return snapshot.itemID == info.itemID end
    if snapshot.poisonFamily then return snapshot.poisonFamily == info.poisonFamily end
    if snapshot.icon and info.itemID then
        local icon = Adapter:GetItemIcon(info.itemID)
        return icon ~= nil and icon == snapshot.icon
    end
    return false
end

function Definition:GetWeaponItemEffect(info)
    if not info or info.kind ~= "weaponConsumable" then return "", "", false end
    local category = self:GetCategoryKey(info)
    local mainSnap = self:GetEnchantSnapshot(MAIN, category)
    local offSnap, offState = self:GetEnchantSnapshot(OFF, category)
    local main = SnapshotMatchesItem(mainSnap, category, info) and FormatAuraTime(mainSnap.expiration) or ""
    local off = SnapshotMatchesItem(offSnap, category, info) and FormatAuraTime(offSnap.expiration) or ""
    local dual = off ~= "" or (main ~= "" and offState ~= nil and offState.weapon ~= nil and offState.weapon ~= false)
    return main, off, dual
end

function Definition:GetCategoryEffect(category)
    local now = Adapter:GetTime()
    if WEAPON_CATEGORIES[category] then
        local mainSnap = self:GetEnchantSnapshot(MAIN, category)
        local offSnap, offState = self:GetEnchantSnapshot(OFF, category)
        local main = WeaponCategoryEffect(mainSnap, category)
        local off = WeaponCategoryEffect(offSnap, category)
        local dual = off ~= "" or (offState ~= nil and offState.weapon ~= nil and offState.weapon ~= false)
        return main, off, dual
    end
    local best
    for id in pairs(self.categoryBuffIDs[category] or {}) do
        local expiration = self.foodBuffExpirations[id]
        if expiration and expiration > now then
            if not best or best == 0 or expiration < best then best = expiration end
        elseif (not expiration or expiration == 0) and self.foodBuffPresent and self.foodBuffPresent[id] then
            best = best or 0
        end
    end
    return FormatAuraTime(best), "", false
end

function Definition:RefreshFoodBuffState()
    if Adapter.supportsCategoryEffects then
        self.categoryAurasDirty = true
        self:QueueVisualRefresh()
        return
    end
    local expirations = self.foodBuffExpirations
    local spellID
    for spellID in pairs(self.foodBuffIDs or {}) do expirations[spellID] = nil end
    local index
    for index = 1, 40 do
        local expirationTime, auraSpellID = Adapter:GetHelpfulAura(index)
        if not auraSpellID then break end
        if self.foodBuffIDs[auraSpellID] then
            expirations[auraSpellID] = expirationTime
        end
    end
    self:RecordScan()
    self:QueueVisualRefresh()
    self:ScheduleNextFoodBuffTextRefresh()
end

function Definition:HasActiveFoodBuff()
    local now = Adapter:GetTime()
    local _, expirationTime
    for _, expirationTime in pairs(self.foodBuffExpirations or {}) do
        if expirationTime and expirationTime > now then return true end
    end
    if self.weaponEnchants then
        for _, state in ipairs(self.weaponEnchants) do
            local temporary, imbue = state.temporary, state.imbue
            if temporary.category and temporary.expiration and temporary.expiration > now
                or imbue.category and imbue.expiration and imbue.expiration > now then return true end
        end
    end
    return false
end

local function NextTextBoundary(expirationTime, now, bestDelay)
    if not expirationTime or expirationTime <= now then return bestDelay end
    local remaining = expirationTime - now
    local delay
    if Adapter.supportsCategoryEffects and remaining >= 3600 then
        local boundary = (math.floor(remaining / 3600 + 0.5) - 0.5) * 3600
        delay = math.min(remaining - boundary, remaining - 3600)
    elseif remaining > 60 then
        local currentText = math.floor(remaining / 60 + 0.5)
        local nextBoundary = (currentText - 0.5) * 60
        delay = math.min(remaining - nextBoundary, remaining - 60)
    else
        delay = remaining - (math.floor(remaining + 0.5) - 0.5)
    end
    if Adapter.supportsCategoryEffects then delay = math.min(remaining, delay) end
    delay = math.max(0.05, delay)
    return bestDelay and math.min(bestDelay, delay) or delay
end

function Definition:GetNextFoodBuffTextDelay()
    local now = Adapter:GetTime()
    local bestDelay
    for _, expirationTime in pairs(self.foodBuffExpirations or {}) do
        bestDelay = NextTextBoundary(expirationTime, now, bestDelay)
    end
    if self.weaponEnchants then
        for _, state in ipairs(self.weaponEnchants) do
            local temporary, imbue = state.temporary, state.imbue
            if temporary.category then bestDelay = NextTextBoundary(temporary.expiration, now, bestDelay) end
            if imbue.category then bestDelay = NextTextBoundary(imbue.expiration, now, bestDelay) end
        end
    end
    return bestDelay
end

function Definition:CancelFoodBuffTextRefresh()
    self.nextBuffTextRefresh = nil
    if not self.nextCooldownRefresh then self:StopVisualDriver() end
end

function Definition:ScheduleNextFoodBuffTextRefresh()
    local delay = self:GetNextFoodBuffTextDelay()
    if not delay then
        self.nextBuffTextRefresh = nil
        return false
    end
    self.nextBuffTextRefresh = Adapter:GetTime() + delay
    self:ArmVisualDriver(delay)
    return true
end

ns.ConsumableBarBuff = true

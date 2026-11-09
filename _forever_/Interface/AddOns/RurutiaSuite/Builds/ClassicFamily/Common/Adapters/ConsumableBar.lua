-- 文件职责：适配 Classic 消耗品 API；目录仅在功能或设置首次使用时展开。
local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")) then return end

local Registry = ns.ConsumableBarDataRegistry
if type(Registry) ~= "table" then
    error("ConsumableBar Data.lua must load before its ClassicFamily adapter", 2)
end
local AnchorResolver = ns.ConsumableBarAnchorResolver
if type(AnchorResolver) ~= "table" then
    error("ConsumableBar anchor integration must load before its ClassicFamily adapter", 2)
end

local Base = {}
Base.__index = Base

local function SafeCall(callback, ...)
    if type(callback) ~= "function" then
        return nil
    end
    local ok, a, b, c, d, e, f, g, h, i, j = pcall(callback, ...)
    if not ok then
        return nil
    end
    return a, b, c, d, e, f, g, h, i, j
end

function Base.New(dataKey, label)
    return setmetatable({
        dataKey = dataKey,
        label = label,
        expansion = Registry.keyToExpansion[dataKey],
        available = Registry.IsAvailable(dataKey),
    }, Base)
end

function Base:IsAvailable()
    return self.available
end

function Base:GetData()
    if self.data == nil and self.available then
        self.data = Registry.GetByKey(self.dataKey)
        if self.data and ns.Build.GetID() == "classic-infinite" then
            for _, group in ipairs(self.data.groups or {}) do
                if group.key == "other" then group.buttonWidth, group.buttonHeight = 35, 35 end
            end
        end
    end
    return self.data
end

function Base:GetExpansion()
    return self.expansion
end

function Base:GetClientLabel()
    return self.label
end

function Base:GetRootFrame()
    return _G.UIParent
end

function Base:GetGroupDefaultValue(group, field)
    if not group then return nil end
    if ns.Build.GetID() == "classic-infinite" then
        local defaults = AnchorResolver:GetGroupDefaults(group.key)
        if defaults and defaults[field] ~= nil then return defaults[field] end
    end
    return group[field]
end

function Base:GetClassColorHex()
    local _, class = SafeCall(_G.UnitClass, "player")
    local colors = _G.CUSTOM_CLASS_COLORS or _G.RAID_CLASS_COLORS
    local color = class and colors and colors[class]
    if color then
        return string.format("%02x%02x%02x", math.floor(color.r * 255 + 0.5),
            math.floor(color.g * 255 + 0.5), math.floor(color.b * 255 + 0.5))
    end
    return "ffffff"
end

function Base:ResolveAnchorFrame(preferredName)
    if not preferredName then return _G.UIParent end
    return AnchorResolver:Resolve(preferredName)
end

function Base:IsInCombat()
    return SafeCall(_G.InCombatLockdown) == true
end

function Base:GetTime()
    return tonumber(SafeCall(_G.GetTime)) or 0
end

function Base:GetItemCount(itemID, countCharges)
    local items = _G.C_Item
    local count = items and SafeCall(items.GetItemCount, itemID, false, countCharges == true)
    if count == nil then
        count = SafeCall(_G.GetItemCount, itemID, false, countCharges == true)
    end
    return tonumber(count) or 0
end

function Base:GetItemName(itemID)
    local items = _G.C_Item
    local name = items and SafeCall(items.GetItemInfo, itemID)
    if name ~= nil then return name end
    return SafeCall(_G.GetItemInfo, itemID)
end

function Base:GetItemIcon(itemID)
    if type(_G.C_Item) == "table" and type(_G.C_Item.GetItemIconByID) == "function" then
        local icon = SafeCall(_G.C_Item.GetItemIconByID, itemID)
        if icon then return icon end
    end
    local icon = SafeCall(_G.GetItemIcon, itemID)
    if icon then return icon end
    local _, _, _, _, _, _, _, _, _, resolved = SafeCall(_G.GetItemInfo, itemID)
    return resolved
end

function Base:GetInventoryItemID(slot)
    return SafeCall(_G.GetInventoryItemID, "player", slot)
end

function Base:GetInventoryItemTexture(slot)
    return SafeCall(_G.GetInventoryItemTexture, "player", slot)
end

function Base:GetInventoryCooldown(slot)
    return SafeCall(_G.GetInventoryItemCooldown, "player", slot)
end

function Base:GetItemCooldown(itemID)
    if type(_G.C_Container) == "table" and type(_G.C_Container.GetItemCooldown) == "function" then
        local start, duration, enabled = SafeCall(_G.C_Container.GetItemCooldown, itemID)
        if start ~= nil then return start, duration, enabled end
    end
    return SafeCall(_G.GetItemCooldown, itemID)
end

function Base:GetItemSpell(itemID)
    if type(_G.C_Item) == "table" and type(_G.C_Item.GetItemSpell) == "function" then
        local name, spellID = SafeCall(_G.C_Item.GetItemSpell, itemID)
        if name or spellID then return name, spellID end
    end
    return SafeCall(_G.GetItemSpell, itemID)
end

function Base:IsUsableItem(itemID)
    if type(_G.C_Item) == "table" and type(_G.C_Item.IsUsableItem) == "function" then
        return SafeCall(_G.C_Item.IsUsableItem, itemID) == true
    end
    return SafeCall(_G.IsUsableItem, itemID) == true
end

local function FindFirstAidProfessionRank(firstAidName, ...)
    for index = 1, select("#", ...) do
        local profession = select(index, ...)
        if profession then
            local name, _, rank, _, _, _, skillLineID = SafeCall(_G.GetProfessionInfo, profession)
            if skillLineID == 129 or (firstAidName and name == firstAidName) then
                return tonumber(rank) or 0
            end
        end
    end
end

-- Read only on secure refresh, never from the visual/cooldown driver.
function Base:GetFirstAidRank()
    if self.dataKey == "forever" then
        -- Forever's profession book exposes First Aid in the third slot.
        local _, _, firstAid = SafeCall(_G.GetProfessions)
        if not firstAid then return 0 end
        local _, _, rank = SafeCall(_G.GetProfessionInfo, firstAid)
        return tonumber(rank) or 0
    end
    -- Era uses the Classic skill book. Do not expand/collapse the user's headers.
    local firstAidName = _G.FIRSTAID or SafeCall(_G.GetSpellInfo, 3273)
    -- Newer Classic clients can expose profession indices independently of
    -- the skill window's collapsed headers. Validate the skill, not its slot.
    local p1, p2, p3, p4, p5, p6 = SafeCall(_G.GetProfessions)
    local professionRank = FindFirstAidProfessionRank(firstAidName, p1, p2, p3, p4, p5, p6)
    if professionRank ~= nil then return professionRank end
    if not firstAidName then return 0 end
    local count = tonumber(SafeCall(_G.GetNumSkillLines)) or 0
    for index = 1, count do
        local name, isHeader, _, rank = SafeCall(_G.GetSkillLineInfo, index)
        if not isHeader and name == firstAidName then return tonumber(rank) or 0 end
    end
    return 0
end

function Base:GetHelpfulAura(index)
    if type(_G.UnitAura) == "function" then
        local _, _, _, _, _, expirationTime, _, _, _, spellID =
            SafeCall(_G.UnitAura, "player", index, "HELPFUL")
        return expirationTime, spellID
    end
    if type(_G.C_UnitAuras) == "table" and type(_G.C_UnitAuras.GetAuraDataByIndex) == "function" then
        local aura = SafeCall(_G.C_UnitAuras.GetAuraDataByIndex, "player", index, "HELPFUL")
        if type(aura) == "table" then
            return aura.expirationTime, aura.spellId
        end
    end
    return nil, nil
end

function Base:RegisterSecureClicks(button)
    local compat = ns.Compat
    if type(compat) == "table" and type(compat.RegisterThreeButtonSecureClicks) == "function" then
        return compat.RegisterThreeButtonSecureClicks(button)
    end
    if button and type(button.RegisterForClicks) == "function" then
        button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        return true
    end
    return false
end

function Base:GetInterfaceFontPath()
    if type(ns.GetInterfaceFontPath) == "function" then
        return ns:GetInterfaceFontPath()
    end
    return "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
end

function Base:GetSystemFontPath()
    if type(ns.GetSystemFontPath) == "function" then
        return ns:GetSystemFontPath()
    end
    return _G.STANDARD_TEXT_FONT or self:GetInterfaceFontPath()
end

function Base:IsOffscreenDragEnabled()
    if type(ns.IsOffscreenDragEnabled) == "function" then
        return ns:IsOffscreenDragEnabled()
    end
    return false
end

-- The module owns the lazy UI lifetime; adapters only populate/display it.
function Base:GetTooltip()
    return self.tooltipProvider and self.tooltipProvider(true)
end

function Base:PresentTooltip(tooltip)
    if self.tooltipStyleProvider then self.tooltipStyleProvider(tooltip) end
    tooltip:Show()
end

function Base:ShowTooltip(owner, text)
    local tooltip = self:GetTooltip()
    if not tooltip then return false end
    tooltip:Hide()
    if type(tooltip.SetOwner) == "function" then tooltip:SetOwner(owner, "ANCHOR_RIGHT") end
    if type(tooltip.ClearLines) == "function" then tooltip:ClearLines() end
    if type(tooltip.SetText) == "function" then tooltip:SetText(text) end
    self:PresentTooltip(tooltip)
    return true
end

function Base:HideTooltip()
    local tooltip = self.tooltipProvider and self.tooltipProvider(false)
    if tooltip then tooltip:Hide() end
end

function Base:ShowItemTooltip(owner, info, itemID)
    if not (info and info.slot) and not itemID then
        self:HideTooltip()
        return false
    end
    local tooltip = self:GetTooltip()
    if not tooltip then return false end
    tooltip:Hide()
    if type(tooltip.SetOwner) == "function" then tooltip:SetOwner(owner, "ANCHOR_RIGHT") end
    if type(tooltip.ClearLines) == "function" then tooltip:ClearLines() end
    if info and info.slot and type(tooltip.SetInventoryItem) == "function" then
        tooltip:SetInventoryItem("player", info.slot)
    elseif itemID and type(tooltip.SetHyperlink) == "function" then
        tooltip:SetHyperlink("item:" .. itemID)
    else
        return false
    end
    self:PresentTooltip(tooltip)
    return true, tooltip
end

function Base:GetDetailedItemLevel(itemID)
    local value = SafeCall(_G.GetDetailedItemLevelInfo, itemID)
    if value then return value end
    local _, _, _, itemLevel = SafeCall(_G.GetItemInfo, itemID)
    return itemLevel
end

function Base:GetCursorPosition()
    return SafeCall(_G.GetCursorPosition)
end

function Base:Print(message)
    if type(ns.Print) == "function" then
        ns.Print(message)
    end
end

ns.ConsumableBarAdapterBase = Base

function Base:SetSecureFrameRef(owner, key, frame)
    assert(type(_G.SecureHandlerSetFrameRef) == "function", "SecureHandlerSetFrameRef is unavailable")
    _G.SecureHandlerSetFrameRef(owner, key, frame)
end

function Base:IsSpellKnown(spellID)
    return (_G.IsPlayerSpell and _G.IsPlayerSpell(spellID))
        or (_G.IsSpellKnown and _G.IsSpellKnown(spellID)) or false
end

function Base:WrapSecureScript(owner, script, snippet)
    _G.SecureHandlerWrapScript(owner, script, owner, snippet)
end

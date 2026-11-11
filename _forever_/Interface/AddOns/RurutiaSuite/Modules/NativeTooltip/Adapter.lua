local _, ns = ...
if not (ns.Build and ns.Build.HasModule("NativeTooltip")) then return end

local Adapter = {}
ns.NativeTooltipAdapter = Adapter
local tooltipNames = { "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2", "ItemRefTooltip",
    "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2" }
-- Native aura entry points. Index setters, instance-ID setters and ClearLines
-- are hooked; each keeps its own effective aura filter. Addons never rewrite
-- these methods.
local auraInstanceSetters = { "SetUnitBuffByAuraInstanceID", "SetUnitDebuffByAuraInstanceID" }
local neutralSourceColor = { r = 0.9, g = 0.9, b = 0.9 }

function Adapter:IsSecret(value)
    local checker = _G.issecretvalue
    if type(checker) ~= "function" then return false end
    local ok, result = pcall(checker, value)
    return ok and result == true
end

function Adapter:Safe(value)
    if self:IsSecret(value) then return nil end
    return value
end

-- A value is only usable as data when it is neither secret nor access-restricted.
function Adapter:Accessible(value)
    -- Secret first: comparing a secret value against nil is itself unsafe.
    if self:IsSecret(value) then return false end
    if value == nil then return false end
    local checker = _G.canaccessvalue
    if type(checker) ~= "function" then return true end
    local ok, result = pcall(checker, value)
    if not ok or self:IsSecret(result) then return false end
    return result == true
end

function Adapter:IsUsable(frame)
    return frame and (not frame.IsForbidden or self:Safe(frame:IsForbidden()) == false)
end

function Adapter:GetBlocker()
    local loaded = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    for _, name in ipairs({ "NDui", "ElvUI" }) do
        if (loaded and loaded(name)) or _G[name] then return name end
    end
end

function Adapter:IsColorOnly()
    local loaded = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    for _, name in ipairs({ "EllesmereUI", "EllesmereUIBlizzardSkin" }) do
        if (loaded and loaded(name)) or _G[name] then return true end
    end
    return false
end

function Adapter:InEditMode()
    local frame = _G.EditModeManagerFrame
    return frame and frame.IsShown and self:Safe(frame:IsShown()) == true
end

function Adapter:OpenEllesTooltipSettings()
    if _G.InCombatLockdown and _G.InCombatLockdown() then
        return false, "战斗中无法打开 Elles 设置，请脱战后重试。"
    end
    local addon = _G.EllesmereUI
    if not addon then return false, "EllesmereUI 尚未加载。" end
    local ok, opened = pcall(function()
        -- Drain first-open options loading before selecting the page: ShowModule
        -- otherwise defers itself and a subsequent SelectPage can be overwritten.
        if type(addon.EnsureLoaded) == "function" then addon:EnsureLoaded() end
        if addon._deferredLoaded == false or type(addon.ShowModule) ~= "function"
            or type(addon.SelectPage) ~= "function" then return false end
        addon:ShowModule("EllesmereUIBlizzardSkin")
        addon:SelectPage("Tooltips, Menus & Popups")
        if type(addon.GetActiveModule) == "function" and addon:GetActiveModule() ~= "EllesmereUIBlizzardSkin" then return false end
        if type(addon.GetActivePage) == "function" and addon:GetActivePage() ~= "Tooltips, Menus & Popups" then return false end
        return true
    end)
    if ok and opened then return true end
    return false, "无法加载 Elles 鼠标设置，请确认 EllesmereUIOptions 已启用后重试。"
end

function Adapter:IsSuppressed(profile)
    if not _G.InCombatLockdown or not _G.InCombatLockdown() then return false end
    if profile.combatVisibility == "show" then return false end
    if profile.combatVisibility == "ctrl" then return not (_G.IsControlKeyDown and _G.IsControlKeyDown()) end
    if profile.combatVisibility == "shift" then return not (_G.IsShiftKeyDown and _G.IsShiftKeyDown()) end
    return true
end

function Adapter:IsHoverTooltip(tooltip)
    return tooltip and (self:IsMain(tooltip) or tooltip == _G.ShoppingTooltip1 or tooltip == _G.ShoppingTooltip2)
end

function Adapter:IsWorldOwner(tooltip)
    local owner = tooltip:GetOwner()
    return owner == _G.UIParent or (_G.WorldFrame and owner == _G.WorldFrame)
end

function Adapter:IsCurrentHover(tooltip)
    if self:IsWorldOwner(tooltip) then
        local unit = self:GetUnit(tooltip)
        return unit and _G.UnitIsUnit and self:Safe(_G.UnitIsUnit(unit, "mouseover")) == true
    end
    local owner = tooltip:GetOwner()
    return self:IsUsable(owner) and _G.MouseIsOver and self:Safe(_G.MouseIsOver(owner)) == true
end

function Adapter:GetFont()
    return ns.Font and ns.Font:GetPath("tooltip") or _G.STANDARD_TEXT_FONT
end

function Adapter:IsMain(tooltip) return tooltip and tooltip == _G.GameTooltip end

function Adapter:IsTarget(tooltip)
    return tooltip and (tooltip == _G.GameTooltip or tooltip == _G.ShoppingTooltip1
        or tooltip == _G.ShoppingTooltip2 or tooltip == _G.ItemRefTooltip
        or tooltip == _G.ItemRefShoppingTooltip1 or tooltip == _G.ItemRefShoppingTooltip2)
end

function Adapter:CanAttach() return self:IsUsable(_G.GameTooltip) end

function Adapter:Attach(owner)
    local function Hook(token) owner.hooks[#owner.hooks + 1] = token end
    Hook(owner:HookSecureFunction("GameTooltip_SetDefaultAnchor", owner.OnDefaultAnchor))
    Hook(owner:HookSecureFunction(_G.GameTooltip, "SetOwner", owner.OnOwnerChanged))
    Hook(owner:HookFrameScript(_G.GameTooltip, "OnHide", owner.OnHide))
    if _G.GameTooltip.FadeOut then
        Hook(owner:HookSecureFunction(_G.GameTooltip, "FadeOut", owner.OnFadeOut))
    end
    for _, name in ipairs(tooltipNames) do
        if self:IsUsable(_G[name]) then Hook(owner:HookFrameScript(_G[name], "OnShow", owner.OnShow)) end
    end
    if _G.GameTooltipStatusBar then
        Hook(owner:HookFrameScript(_G.GameTooltipStatusBar, "OnValueChanged", owner.OnHealthChanged))
        Hook(owner:HookFrameScript(_G.GameTooltipStatusBar, "OnShow", owner.OnHealthChanged))
        Hook(owner:HookFrameScript(_G.GameTooltipStatusBar, "OnHide", owner.OnHealthChanged))
    end
    local tooltip = _G.GameTooltip
    local function HookAura(method, callback)
        if type(tooltip[method]) ~= "function" then return end
        -- A vendored client can expose an aura setter that cannot be secure
        -- hooked; losing the optional aura rows must never break the tooltip.
        local ok, token = pcall(owner.HookSecureFunction, owner, tooltip, method, callback)
        if ok and token then Hook(token) end
    end
    -- Buff/Debuff setters accept an optional filter that is frequently nil, so
    -- pin their aura kind instead of trusting the raw argument.
    HookAura("SetUnitAura", owner.OnUnitAura)
    HookAura("SetUnitBuff", owner.OnUnitBuff)
    HookAura("SetUnitDebuff", owner.OnUnitDebuff)
    for _, method in ipairs(auraInstanceSetters) do HookAura(method, owner.OnUnitAuraInstance) end
    -- Any native content rebuild invalidates the aura context; the aura setter
    -- post-hook re-marks it when the new content really is an aura.
    HookAura("ClearLines", owner.OnTooltipCleared)
    self:Subscribe(owner)
end

function Adapter:GetUnit(tooltip, data)
    if not self:IsUsable(tooltip) or not tooltip.GetUnit then return end
    local ok, _, unit = pcall(tooltip.GetUnit, tooltip)
    if not ok then unit = nil end
    unit = self:Safe(unit)
    local guid = type(data) == "table" and self:Accessible(data) and data.guid
    if self:IsSecret(guid) or (guid ~= nil and not self:Accessible(guid)) then return end
    if type(guid) ~= "string" then
        if type(unit) == "string" and self:Safe(_G.UnitExists(unit)) == true then return unit end
        return
    end
    -- Frame-origin unit tokens can be restricted while the tooltip GUID is public.
    -- Only accept a readable token that still identifies this exact tooltip unit.
    if type(_G.UnitGUID) ~= "function" then return end
    local function Matches(candidate)
        if not self:Accessible(candidate) or type(candidate) ~= "string" then return false end
        local guidOK, candidateGUID = pcall(_G.UnitGUID, candidate)
        return guidOK and self:Accessible(candidateGUID) and candidateGUID == guid
    end
    if Matches(unit) then return unit end
    if type(_G.UnitTokenFromGUID) == "function" then
        local tokenOK, token = pcall(_G.UnitTokenFromGUID, guid)
        if tokenOK and Matches(token) then return token end
    end
    if Matches("mouseover") then return "mouseover" end
    if Matches("player") then return "player" end
    local raid = type(_G.IsInRaid) == "function" and self:Safe(_G.IsInRaid()) == true
    local getCount = raid and _G.GetNumGroupMembers or _G.GetNumSubgroupMembers
    local count = type(getCount) == "function" and self:Safe(getCount()) or 0
    if type(count) ~= "number" then return end
    for index = 1, math.min(count, raid and 40 or 4) do
        local token = (raid and "raid" or "party") .. index
        if Matches(token) then return token end
    end
end

function Adapter:GetUnitColor(unit)
    if self:Safe(_G.UnitIsPlayer(unit)) then
        local _, class = _G.UnitClass(unit)
        class = self:Safe(class)
        local colors = _G.CUSTOM_CLASS_COLORS or _G.RAID_CLASS_COLORS
        local color = class and colors and colors[class]
        if color then return color.r, color.g, color.b end
    end
    local reaction = self:Safe(_G.UnitReaction(unit, "player"))
    local color = reaction and _G.FACTION_BAR_COLORS and _G.FACTION_BAR_COLORS[reaction]
    if color then return color.r, color.g, color.b end
end

local function PositiveID(value)
    value = Adapter:Safe(value)
    if type(value) == "number" and value > 0 and value == math.floor(value) then return value end
end

-- Only creature/vehicle GUIDs contain an NPC entry; player and pet IDs are not NPC IDs.
function Adapter:GetNPCID(tooltip)
    if not self:IsMain(tooltip) or not _G.UnitGUID then return end
    local unit = self:GetUnit(tooltip)
    if not unit then return end
    local guid = self:Safe(_G.UnitGUID(unit))
    if type(guid) ~= "string" then return end
    local kind, id = guid:match("^(%a+)%-[^-]+%-[^-]+%-[^-]+%-[^-]+%-(%d+)%-")
    if kind == "Creature" or kind == "Vehicle" then return PositiveID(tonumber(id)) end
end

function Adapter:GetIDs(tooltip, data, wantIcon)
    local kind, id
    local types = _G.Enum and _G.Enum.TooltipDataType
    if type(data) == "table" and types then
        local dataType = self:Safe(data.type)
        if types.Item and dataType == types.Item then kind, id = "item", PositiveID(data.id)
        elseif types.Spell and dataType == types.Spell then kind, id = "spell", PositiveID(data.id) end
    end
    if not id and tooltip.GetItem then
        local _, link = tooltip:GetItem()
        link = self:Safe(link)
        if type(link) == "string" then
            id = PositiveID(tonumber(link:match("item:(%d+)")))
            if id then kind = "item" end
        end
    end
    if not id and tooltip.GetSpell then
        local _, spellID = tooltip:GetSpell()
        id = PositiveID(spellID)
        if id then kind = "spell" end
    end
    local icon
    if wantIcon and id then
        if kind == "item" then
            local getter = _G.C_Item and _G.C_Item.GetItemIconByID or _G.GetItemIcon
            if getter then icon = PositiveID(getter(id)) end
        else
            local getter = _G.C_Spell and _G.C_Spell.GetSpellTexture or _G.GetSpellTexture
            if getter then icon = PositiveID(getter(id)) end
        end
    end
    return kind, id, icon
end

local function FilterHas(filter, token)
    return type(filter) == "string" and filter:find(token, 1, true) ~= nil
end

-- A predicate answer that cannot be read as plain false counts as restricted.
local function PredicateRestricted(predicate, ...)
    if type(predicate) ~= "function" then return false end
    local ok, value = pcall(predicate, ...)
    if not ok or Adapter:IsSecret(value) then return true end
    return value == true
end

-- Buff/Debuff setters usually omit the optional filter, which would otherwise
-- make an index lookup read whatever aura shares that index. An inaccessible
-- filter is never inspected, compared or concatenated: it is returned as-is so
-- GetAuraInfo's access gate drops the read while the aura bypass stays.
function Adapter:CombineAuraFilter(filter, base)
    if filter == nil then return base end
    if not self:Accessible(filter) then return filter end
    if type(filter) ~= "string" or filter == "" then return base end
    if FilterHas(filter, "HELPFUL") or FilterHas(filter, "HARMFUL") then return filter end
    return base .. "|" .. filter
end

-- 12.1 gate: the overall predicate plus the matching per-aura predicate must
-- both clear before any query. Unknown or secret answers stay restricted.
function Adapter:AurasRestricted(unit, index, filter, auraInstanceID)
    local secrets = _G.C_Secrets
    if not secrets then return false end
    if PredicateRestricted(secrets.ShouldAurasBeSecret) then return true end
    if auraInstanceID ~= nil then
        if PredicateRestricted(secrets.ShouldUnitAuraInstanceBeSecret, unit, auraInstanceID) then return true end
    elseif index ~= nil then
        if PredicateRestricted(secrets.ShouldUnitAuraIndexBeSecret, unit, index, filter) then return true end
    end
    return false
end

function Adapter:IsAuraSpellRestricted(spellId)
    local secrets = _G.C_Secrets
    if not secrets then return false end
    return PredicateRestricted(secrets.ShouldSpellAuraBeSecret, spellId)
end

-- Modern clients expose completed aura data through C_UnitAuras; older builds
-- still answer the positional UnitAura family. Restricted queries are dropped
-- before any read and never replaced by another API or a cached value.
function Adapter:GetAuraInfo(unit, index, filter, auraInstanceID)
    -- Reject every secret argument before the first comparison below.
    if self:IsSecret(unit) or self:IsSecret(index) or self:IsSecret(filter)
        or self:IsSecret(auraInstanceID) then
        return
    end
    if type(unit) ~= "string" or not self:Accessible(unit) then return end
    if index ~= nil and not self:Accessible(index) then return end
    if filter ~= nil and not self:Accessible(filter) then return end
    if auraInstanceID ~= nil and not self:Accessible(auraInstanceID) then return end
    if self:AurasRestricted(unit, index, filter, auraInstanceID) then return end

    local auraAPI = _G.C_UnitAuras
    local modernGetter
    if auraInstanceID ~= nil and auraAPI and type(auraAPI.GetAuraDataByAuraInstanceID) == "function" then
        modernGetter = auraAPI.GetAuraDataByAuraInstanceID
    elseif index ~= nil and auraAPI and type(auraAPI.GetAuraDataByIndex) == "function" then
        modernGetter = auraAPI.GetAuraDataByIndex
    end

    local spellId, sourceUnit, icon
    if modernGetter then
        local ok, data
        if auraInstanceID ~= nil then
            ok, data = pcall(modernGetter, unit, auraInstanceID)
        else
            ok, data = pcall(modernGetter, unit, index, filter)
        end
        -- A blocked query raises RequiresUnitAuraAccess; keep the native tip and
        -- never re-query the same aura through another entry point.
        if not ok then return end
        if type(data) == "table" and not self:IsSecret(data) then
            spellId = PositiveID(data.spellId)
            icon = PositiveID(data.icon)
            local source = self:Safe(data.sourceUnit)
            if type(source) == "string" and self:Accessible(source) then sourceUnit = source end
        end
    elseif auraInstanceID == nil and index ~= nil then
        local getter
        if FilterHas(filter, "HARMFUL") then getter = _G.UnitDebuff
        elseif FilterHas(filter, "HELPFUL") then getter = _G.UnitBuff
        else getter = _G.UnitAura end
        if type(getter) == "function" then
            local ok, _, classicIcon, _, _, _, _, classicSource, _, _, classicSpell =
                pcall(getter, unit, index, filter)
            if ok then
                local safeSpell = PositiveID(classicSpell)
                if safeSpell then spellId = safeSpell end
                local safeSource = self:Safe(classicSource)
                if type(safeSource) == "string" and self:Accessible(safeSource) then sourceUnit = safeSource end
                if not icon then icon = PositiveID(classicIcon) end
            end
        end
    end

    if spellId and self:IsAuraSpellRestricted(spellId) then return end
    if not (spellId or sourceUnit or icon) then return end
    return { spellId = spellId, sourceUnit = sourceUnit, icon = icon }
end

function Adapter:GetSpellIcon(spellId)
    spellId = PositiveID(spellId)
    if not spellId then return end
    local getter
    if _G.C_Spell and type(_G.C_Spell.GetSpellTexture) == "function" then getter = _G.C_Spell.GetSpellTexture
    elseif type(_G.GetSpellTexture) == "function" then getter = _G.GetSpellTexture end
    if not getter then return end
    local ok, icon = pcall(getter, spellId)
    if not ok then return end
    return PositiveID(icon)
end

-- Source line: player names take the class colour, NPC/pet sources stay neutral.
-- Secret or inaccessible identities are dropped instead of guessed.
function Adapter:GetAuraSource(sourceUnit)
    if type(sourceUnit) ~= "string" or self:IsSecret(sourceUnit) then return end
    local secrets = _G.C_Secrets
    if secrets and type(secrets.ShouldUnitIdentityBeSecret) == "function" then
        local ok, identitySecret = pcall(secrets.ShouldUnitIdentityBeSecret, sourceUnit)
        if not ok or self:IsSecret(identitySecret) or identitySecret == true then return end
    end
    if type(_G.UnitExists) ~= "function" then return end
    local existsOk, exists = pcall(_G.UnitExists, sourceUnit)
    if not existsOk or self:IsSecret(exists) or exists ~= true then return end

    local name
    if type(_G.GetUnitName) == "function" then
        local nameOk, value = pcall(_G.GetUnitName, sourceUnit, true)
        if nameOk and self:Accessible(value) and type(value) == "string" and value ~= "" then name = value end
    end
    if not name then return end

    local isPlayer = false
    if type(_G.UnitIsPlayer) == "function" then
        local playerOk, value = pcall(_G.UnitIsPlayer, sourceUnit)
        if playerOk and not self:IsSecret(value) and value == true then isPlayer = true end
    end
    if isPlayer and type(_G.UnitClass) == "function" then
        local classOk, _, class = pcall(_G.UnitClass, sourceUnit)
        if classOk and not self:IsSecret(class) and type(class) == "string" then
            local colors = _G.CUSTOM_CLASS_COLORS or _G.RAID_CLASS_COLORS
            local color = colors and colors[class]
            if color then
                return { name = name, r = color.r, g = color.g, b = color.b, player = true }
            end
        end
    end
    return { name = name, r = neutralSourceColor.r, g = neutralSourceColor.g,
        b = neutralSourceColor.b, player = false }
end

-- Never inspect restricted content or infer a unit from stale GetUnit state.
function Adapter:IsUnitData(data)
    if not self:Accessible(data) or type(data) ~= "table" then return false end
    local kind = data.type
    if not self:Accessible(kind) then return false end
    local types = _G.Enum and _G.Enum.TooltipDataType
    return types ~= nil and types.Unit ~= nil and kind == types.Unit
end

function Adapter:IsAuraData(data)
    if not self:Accessible(data) or type(data) ~= "table" then return false end
    local types = _G.Enum and _G.Enum.TooltipDataType
    local auraType = types and types.UnitAura
    if auraType == nil then return false end
    return self:Accessible(data.type) and data.type == auraType
end

-- Modern clients publish completed data; older clients provide tooltip scripts.
-- One physical callback, no subscribers and no work after release.
local subscriber, installed
local colorSubscriber, colorInstalled
Adapter.supportsItemLevel = _G.WOW_PROJECT_CAMELOT ~= nil and _G.WOW_PROJECT_ID == _G.WOW_PROJECT_CAMELOT
local itemLevelInstalled
function Adapter:InstallItemLevel()
    if not self.supportsItemLevel or itemLevelInstalled then return end
    local kinds = Enum.TooltipDataLineType
    local function AfterHeader(tooltip, line)
        local owner = subscriber or colorSubscriber
        if not owner or not owner.runtimeActive or not owner:IsEnabled() or not owner:GetProfile().showItemLevel then return end
        if not Adapter:IsUsable(tooltip) then return end
        local info = tooltip:GetProcessingTooltipInfo()
        local data = info and info.tooltipData
        if not Adapter:Accessible(data) or Adapter:Safe(data.type) ~= Enum.TooltipDataType.Item then return end
        if not Adapter:Accessible(data.lines) then return end
        for _, entry in ipairs(data.lines) do
            if not Adapter:Accessible(entry) then return end
            local kind = Adapter:Safe(entry.type)
            if kind == kinds.ItemLevel then return end
            if kind == kinds.ItemQuality and line.type == kinds.ItemName then return end
        end
        local item = Adapter:Safe(data.hyperlink)
        local guid = Adapter:Safe(data.guid)
        if not item and guid then item = Adapter:Safe(C_Item.GetItemLinkByGUID(guid)) end
        item = item or Adapter:Safe(data.id)
        if not item or not C_Item.IsEquippableItem(item) then return end
        local level = Adapter:Safe(C_Item.GetDetailedItemLevelInfo(item))
        if level and level > 0 then tooltip:AddLine(string.format(ITEM_LEVEL, level), 1, 0.82, 0) end
    end
    TooltipDataProcessor.AddLinePostCall(kinds.ItemName, AfterHeader)
    TooltipDataProcessor.AddLinePostCall(kinds.ItemQuality, AfterHeader)
    itemLevelInstalled = true
end

function Adapter:Subscribe(owner)
    local processor = _G.TooltipDataProcessor
    local unitType = _G.Enum and _G.Enum.TooltipDataType and _G.Enum.TooltipDataType.Unit
    if not (processor and processor.AddTooltipPostCall and unitType) then
        for _, name in ipairs(tooltipNames) do
            local tooltip = _G[name]
            if self:IsUsable(tooltip) then
                for _, script in ipairs({ "OnTooltipSetUnit", "OnTooltipSetItem", "OnTooltipSetSpell" }) do
                    if not tooltip.HasScript or tooltip:HasScript(script) then
                        owner.hooks[#owner.hooks + 1] = owner:HookFrameScript(tooltip, script,
                            script == "OnTooltipSetUnit" and owner.OnUnitContent or owner.OnOtherContent)
                    end
                end
            end
        end
        return
    end
    if not installed then
        processor.AddTooltipPostCall(processor.AllTypes or unitType, function(tooltip, data)
            local current = subscriber
            if current and current.runtimeActive and current:IsEnabled() then current:OnContent(tooltip, data) end
        end)
        installed = true
    end
    subscriber = owner
end

function Adapter:AttachColorOnly(owner)
    local processor = _G.TooltipDataProcessor
    local unitType = _G.Enum and _G.Enum.TooltipDataType and _G.Enum.TooltipDataType.Unit
    if processor and processor.AddTooltipPostCall and unitType then
        if not colorInstalled then
            processor.AddTooltipPostCall(unitType, function(tooltip, data)
                local current = colorSubscriber
                if current and current.runtimeActive and current:IsEnabled() then current:OnColorUnit(tooltip, data) end
            end)
            colorInstalled = true
        end
        colorSubscriber = owner
    else
        owner.hooks[#owner.hooks + 1] = owner:HookFrameScript(_G.GameTooltip, "OnTooltipSetUnit", owner.OnColorUnit)
    end
end

function Adapter:Unsubscribe(owner)
    if subscriber == owner then subscriber = nil end
    if colorSubscriber == owner then colorSubscriber = nil end
end

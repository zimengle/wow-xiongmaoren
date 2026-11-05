-- 文件职责：消耗品业务与配置语义；首次使用才取得目录并建立所需索引。
local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ConsumableBar")) then return end

local Adapter = ns.ConsumableBarAdapter
if type(Adapter) ~= "table" then
    error("ConsumableBar active Build adapter must load before Definition.lua", 2)
end

-- 所有模块分片共享稳定外壳；未使用前不向 Adapter 请求大型目录。
local Data = { catalog = {}, groups = {} }
local Definition = {
    defaults = {
        profile = {
            enabled = true,
            ownedOnly = true,
            cooldownDesaturate = false,
            positions = {},
            groupOverrides = {},
        },
    },
    defaultEnabled = Adapter:IsAvailable(),
    DATA = Data,
    ADAPTER = Adapter,
    FALLBACK_ICON = "Interface\\Icons\\INV_Misc_QuestionMark",
    POSITION_LAYOUT_VERSION = 8,
    LAYOUT_SETTINGS_VERSION = 2,
}

local GROWTH_DIRECTIONS = {
    RIGHT = "向右",
    LEFT = "向左",
    DOWN = "向下",
    UP = "向上",
}
local GROWTH_DIRECTION_ORDER = { "RIGHT", "LEFT", "DOWN", "UP" }
local WRAP_DIRECTIONS = {
    RIGHT = "向右",
    LEFT = "向左",
    DOWN = "向下",
    UP = "向上",
}
local WRAP_DIRECTION_ORDER = {
    horizontal = { "DOWN", "UP" },
    vertical = { "RIGHT", "LEFT" },
}
local SCREEN_ANCHOR_POINTS = {
    CENTER = "中心",
    TOP = "上",
    BOTTOM = "下",
    LEFT = "左",
    RIGHT = "右",
    TOPLEFT = "左上",
    TOPRIGHT = "右上",
    BOTTOMLEFT = "左下",
    BOTTOMRIGHT = "右下",
}
local SCREEN_ANCHOR_POINT_ORDER = {
    "CENTER", "TOP", "BOTTOM", "LEFT", "RIGHT",
    "TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT",
}
local CLICK_ORDER = { "left", "right" }
local SCREEN_FALLBACK_POSITION = { point = "TOPLEFT", relativePoint = "CENTER", x = -365, y = -195 }

local function GetEffectiveStoredPosition(group, stored)
    -- Avatar offsets cannot be interpreted as screen offsets. Once moved in
    -- fallback mode, CENTER-based saved coordinates remain user-owned.
    if group.anchorFrame and (not stored or stored.relativePoint == group.anchorPoint) then
        local anchor = Adapter:ResolveAnchorFrame(group.anchorFrame)
        if not anchor or anchor == Adapter:GetRootFrame() then return SCREEN_FALLBACK_POSITION end
    end
    return stored
end

Definition.GROWTH_DIRECTIONS = GROWTH_DIRECTIONS
Definition.GROWTH_DIRECTION_ORDER = GROWTH_DIRECTION_ORDER
Definition.WRAP_DIRECTIONS = WRAP_DIRECTIONS
Definition.WRAP_DIRECTION_ORDER = WRAP_DIRECTION_ORDER
Definition.SCREEN_ANCHOR_POINTS = SCREEN_ANCHOR_POINTS
Definition.SCREEN_ANCHOR_POINT_ORDER = SCREEN_ANCHOR_POINT_ORDER

local function CopyPosition(position)
    return {
        point = position and position.point or "CENTER",
        relativePoint = position and position.relativePoint or "CENTER",
        x = position and position.x or 0,
        y = position and position.y or 0,
    }
end

local function GetDefaultPosition(group)
    return {
        point = Adapter:GetGroupDefaultValue(group, "selfPoint") or "CENTER",
        relativePoint = Adapter:GetGroupDefaultValue(group, "anchorPoint") or "CENTER",
        x = Adapter:GetGroupDefaultValue(group, "xOffset") or 0,
        y = Adapter:GetGroupDefaultValue(group, "yOffset") or 0,
    }
end

local function FindGroup(groupKey)
    local index
    for index = 1, #(Data.groups or {}) do
        local group = Data.groups[index]
        if group.key == groupKey then return group end
    end
    return nil
end

local function ValuesEqual(left, right)
    if type(left) == "number" and type(right) == "number" then
        return math.abs(left - right) < 0.0001
    end
    return left == right
end

local function PruneOverrideValue(override, field, defaultValue)
    if override[field] ~= nil and ValuesEqual(override[field], defaultValue) then
        override[field] = nil
    end
end

function Definition:GetProfile()
    return self.db and self.db.profile
end

function Definition:IsAvailable()
    return Adapter:IsAvailable()
end

function Definition:ResolveFontPath()
    if ns.Font and type(ns.Font.GetConsumableBarFontPath) == "function" then
        return ns.Font:GetConsumableBarFontPath()
    end
    return Adapter:GetInterfaceFontPath()
end

function Definition:GetCurrentExpansionLabel()
    return Adapter:GetClientLabel()
end

function Definition:HasConsumableData()
    return Adapter:IsAvailable()
end

function Definition:EnsureData(forSettings)
    if not Adapter:IsAvailable() then return false end
    if not self.dataReady then
        local source = Adapter:GetData()
        if type(source) ~= "table" or type(source.groups) ~= "table" then return false end
        for key, value in pairs(source) do Data[key] = value end
        self.dataReady = true
    end
    self:MigrateProfile()
    self:BuildIndexes(forSettings)
    return true
end

-- Defaults depend on the loaded catalog and anchor provider. Do not materialize
-- a catalog at logout, and never discard unknown keys or a custom coordinate.
function Definition:PruneSavedDefaults()
    if not self.dataReady then return end
    local p = self:GetProfile()
    for _, group in ipairs(Data.groups) do
        local overrides = rawget(p, "groupOverrides")
        local row = overrides and overrides[group.key]
        if type(row) == "table" then
            for key, value in pairs(row) do
                local default = Adapter:GetGroupDefaultValue(group, key)
                if default ~= nil and value == default then row[key] = nil end
            end
            if not next(row) then overrides[group.key] = nil end
        end
        local positions = rawget(p, "positions")
        local position = positions and positions[group.key]
        if group.key == "other" and type(position) == "table" then
            local expected = {
                point = Adapter:GetGroupDefaultValue(group, "selfPoint"),
                relativePoint = Adapter:GetGroupDefaultValue(group, "anchorPoint"),
                x = Adapter:GetGroupDefaultValue(group, "xOffset"),
                y = Adapter:GetGroupDefaultValue(group, "yOffset"),
            }
            local matches = true
            for key, value in pairs(position) do
                if expected[key] == nil or value ~= expected[key] then matches = false break end
            end
            for key, value in pairs(expected) do
                if position[key] ~= value then matches = false break end
            end
            if matches then positions[group.key] = nil end
        end
    end
end

function Definition:BuildIndexes(forSettings)
    if self.catalog == nil then
        self.catalog = {}
        for index = 1, #(Data.catalog or {}) do
            local item = Data.catalog[index]
            if item and item.key then self.catalog[item.key] = item end
        end
    end
    -- 页面只需要目录查找，不持有冷却和增益运行索引。
    if forSettings or self.cooldownGroups ~= nil then return end
    self.cooldownGroups = {}
    self.foodBuffIDs = {}
    local index
    for index = 1, #(Data.catalog or {}) do
        local item = Data.catalog[index]
        if item and item.cooldownGroup then
            local group = self.cooldownGroups[item.cooldownGroup]
            if not group then
                group = {}
                self.cooldownGroups[item.cooldownGroup] = group
            end
            group[#group + 1] = item
        end
        if item and item.buffID then self.foodBuffIDs[item.buffID] = true end
        local buffIDs = item and item.buffIDs
        if buffIDs then
            for buffIndex = 1, #buffIDs do
                self.foodBuffIDs[buffIDs[buffIndex]] = true
            end
        end
    end
end

function Definition:ReleaseIndexes()
    if not self.settingsVisible then self.catalog = nil end
    self.cooldownGroups = nil
    self.foodBuffIDs = nil
    self.visibleByGroup = {}
    self.foodBuffExpirations = {}
    self.sharedCooldownCache = {}
    if not self.settingsVisible then
        self.itemIconCache = {}
        self.itemLevelCache = {}
    end
    self.itemIDScratch = {}
end

function Definition:GetGroupOverride(groupKey)
    local profile = self:GetProfile()
    local overrides = profile and profile.groupOverrides
    return type(overrides) == "table" and overrides[groupKey] or nil
end

function Definition:GetGroupValue(group, field, fallback)
    local override = group and self:GetGroupOverride(group.key)
    if override and override[field] ~= nil then return override[field] end
    local default = Adapter:GetGroupDefaultValue(group, field)
    if default ~= nil then return default end
    return fallback
end

function Definition:GetGroupItemCount(group)
    local fallback = group and (group.itemsPerGroup or group.gridWidth or #(group.items or {})) or 1
    local value = tonumber(self:GetGroupValue(group, "itemsPerGroup", fallback)) or fallback
    if group and group.categoryMenus then value = math.min(value, #self.CATEGORIES) end
    return math.max(math.floor(value + 0.5), 1)
end

function Definition:IsGroupEnabled(group)
    return self:GetGroupValue(group, "enabled", true) ~= false
end

function Definition:IsItemEnabled(itemKey)
    local profile = self:GetProfile()
    local hidden = profile and profile.hiddenItems
    if type(hidden) == "table" and hidden[itemKey] ~= nil then return hidden[itemKey] ~= true end
    local info = self.catalog and self.catalog[itemKey]
    return not info or info.defaultEnabled ~= false
end

function Definition:SetItemEnabled(itemKey, enabled, deferRefresh)
    local profile = self:GetProfile()
    if not itemKey or not profile then return false end
    local info = self.catalog and self.catalog[itemKey]
    local defaultEnabled = not info or info.defaultEnabled ~= false
    if (enabled and true or false) == defaultEnabled then
        if type(profile.hiddenItems) == "table" then
            profile.hiddenItems[itemKey] = nil
            if not next(profile.hiddenItems) then profile.hiddenItems = nil end
        end
    else
        profile.hiddenItems = type(profile.hiddenItems) == "table" and profile.hiddenItems or {}
        profile.hiddenItems[itemKey] = not enabled
    end
    if not deferRefresh then self:QueueSecureRefresh() end
    return true
end

function Definition:SetGroupItemsEnabled(group, enabled)
    if not group then return false end
    local index
    for index = 1, #(group.items or {}) do
        self:SetItemEnabled(group.items[index], enabled, true)
    end
    self:QueueSecureRefresh()
    return true
end

function Definition:GetGroupSelectionCounts(group)
    local total, selected = 0, 0
    local index
    for index = 1, #(group and group.items or {}) do
        local key = group.items[index]
        if self.catalog and self.catalog[key] then
            total = total + 1
            if self:IsItemEnabled(key) then selected = selected + 1 end
        end
    end
    return total, selected
end

function Definition:GetConsumableStats()
    local total, selected, visible = 0, 0, 0
    local profile = self:GetProfile() or {}
    local editing = self.previewMode or self.isUnlocked
    for _, group in ipairs(Data.groups or {}) do
        local groupTotal, groupSelected = self:GetGroupSelectionCounts(group)
        total, selected = total + groupTotal, selected + groupSelected
        if self.catalog and (profile.enabled or editing) and (editing or self:IsGroupEnabled(group)) then
            visible = visible + #self:GetVisibleItems(group)
        end
    end
    return total, selected, visible
end

function Definition:SetGroupOverrideValue(groupKey, field, value, defaultValue)
    local profile = self:GetProfile()
    if not groupKey or not field or not profile then return false end
    local presetDefault = Adapter:GetGroupDefaultValue(FindGroup(groupKey), field)
    if presetDefault ~= nil then defaultValue = presetDefault end
    local overrides = profile.groupOverrides
    local override = type(overrides) == "table" and overrides[groupKey] or nil
    if value == defaultValue or value == nil then
        if override then
            override[field] = nil
            if not next(override) then
                overrides[groupKey] = nil
                if not next(overrides) then profile.groupOverrides = nil end
            end
        end
        return true
    end
    if type(overrides) ~= "table" then
        overrides = {}
        profile.groupOverrides = overrides
    end
    if not override then
        override = {}
        overrides[groupKey] = override
    end
    override[field] = value
    return true
end

function Definition:ClearGroupOverrides(groupKey)
    local profile = self:GetProfile()
    if profile and type(profile.groupOverrides) == "table" then
        profile.groupOverrides[groupKey] = nil
        if not next(profile.groupOverrides) then profile.groupOverrides = nil end
    end
end

function Definition:SetGroupEnabled(group, enabled)
    if not group then return false end
    self:SetGroupOverrideValue(group.key, "enabled", enabled and true or false, group.enabled ~= false)
    self:QueueSecureRefresh()
    return true
end

function Definition:GetClickName(click, fallbackName)
    if not click then return nil end
    if click.type == "item" and click.id then
        return Adapter:GetItemName(click.id) or fallbackName or ("物品" .. click.id)
    elseif click.type == "slot" and click.slot then
        return fallbackName or ("装备槽 " .. click.slot)
    elseif click.type == "macro" then
        return fallbackName or "宏"
    end
    return fallbackName
end

function Definition:GetClickFallbackName(info, button)
    if not info then return nil end
    return info.clickNames and info.clickNames[button] or info.name
end

function Definition:GetPrimaryItemID(info)
    if not info then return nil end
    if info.itemID then return info.itemID end
    if info.displayItemID then return info.displayItemID end
    local left = info.clicks and info.clicks.left
    if left and left.type == "item" then return left.id end
    local right = info.clicks and info.clicks.right
    return right and right.type == "item" and right.id or nil
end

function Definition:GetDisplayItemID(info)
    if not info then return nil end
    -- An unexpanded default has the same item on both buttons. Resolving its
    -- display ID must not create click descriptors or query that ID twice.
    if info.itemID and rawget(info, "clicks") == nil then return info.itemID end
    local index
    for index = 1, #CLICK_ORDER do
        local click = info.clicks and info.clicks[CLICK_ORDER[index]]
        if click and click.type == "item" and click.id and Adapter:GetItemCount(click.id) > 0 then
            return click.id
        end
    end
    return self:GetPrimaryItemID(info)
end

function Definition:GetItemIDs(info, result)
    result = result or {}
    local index
    for index = #result, 1, -1 do result[index] = nil end
    if info.itemID then result[#result + 1] = info.itemID end
    if info.displayItemID then result[#result + 1] = info.displayItemID end
    -- itemID already covers an unmaterialized default action. Do not build
    -- click tables while checking every catalogue entry against the bags.
    local clicks = rawget(info, "clicks")
    if clicks then
        for _, click in pairs(clicks) do
            if click.type == "item" and click.id then result[#result + 1] = click.id end
        end
    end
    return result
end

function Definition:HasOwnedItem(info)
    if info.slot then return self:HasUsableInventorySlot(info) end
    local itemID, displayID = info.itemID, info.displayItemID
    local hasItemID = itemID ~= nil or displayID ~= nil
    if itemID and Adapter:GetItemCount(itemID) > 0 then return true end
    if displayID and displayID ~= itemID and Adapter:GetItemCount(displayID) > 0 then return true end
    -- Default actions add no candidates beyond itemID. Explicit actions may
    -- use another item; keep those candidates without duplicate bag queries.
    local clicks = rawget(info, "clicks")
    local previousID
    if clicks then
        for _, click in pairs(clicks) do
            if click.type == "item" and click.id then
                hasItemID = true
                local id = click.id
                if id ~= itemID and id ~= displayID and id ~= previousID then
                    if Adapter:GetItemCount(id) > 0 then return true end
                    previousID = id
                end
            end
        end
    end
    return not hasItemID
end

function Definition:GetItemIDIcon(itemID)
    if not itemID then return nil end
    local cached = self.itemIconCache[itemID]
    if cached then return cached end
    local icon = Adapter:GetItemIcon(itemID)
    if icon then self.itemIconCache[itemID] = icon end
    return icon
end

function Definition:GetInfoIcon(info)
    if info.slot then return Adapter:GetInventoryItemTexture(info.slot) or self.FALLBACK_ICON end
    local itemID = self:GetDisplayItemID(info)
    return (itemID and self:GetItemIDIcon(itemID)) or info.icon or self.FALLBACK_ICON
end

function Definition:FormatCount(info)
    if info.slot then return info.name or "" end
    local itemID = self:GetDisplayItemID(info)
    if self.previewMode then return "20" end
    local count = itemID and Adapter:GetItemCount(itemID, false) or 0
    return count > 0 and tostring(count) or (not self:GetProfile().ownedOnly and "0" or "")
end

function Definition:GetGroupWrapDirection(group, growthDirection)
    local growth = growthDirection or self:GetGroupValue(group, "growDirection", "RIGHT")
    local horizontal = growth == "RIGHT" or growth == "LEFT"
    local order = horizontal and WRAP_DIRECTION_ORDER.horizontal or WRAP_DIRECTION_ORDER.vertical
    local fallback = group and group.wrapDirection or order[1]
    local value = self:GetGroupValue(group, "wrapDirection", fallback)
    return (value == order[1] or value == order[2]) and value or order[1]
end

function Definition:GetGroupPosition(group)
    local profile = self:GetProfile()
    local stored = profile.positions and profile.positions[group.key]
    return CopyPosition(GetEffectiveStoredPosition(group, stored) or GetDefaultPosition(group))
end

function Definition:GetPointCoord(frame, point)
    if not frame then return nil, nil end
    local left = type(frame.GetLeft) == "function" and frame:GetLeft()
    local right = type(frame.GetRight) == "function" and frame:GetRight()
    local top = type(frame.GetTop) == "function" and frame:GetTop()
    local bottom = type(frame.GetBottom) == "function" and frame:GetBottom()
    if not left or not right or not top or not bottom then return nil, nil end
    local centerX, centerY = (left + right) / 2, (top + bottom) / 2
    if point == "TOPLEFT" then return left, top end
    if point == "TOP" then return centerX, top end
    if point == "TOPRIGHT" then return right, top end
    if point == "LEFT" then return left, centerY end
    if point == "RIGHT" then return right, centerY end
    if point == "BOTTOMLEFT" then return left, bottom end
    if point == "BOTTOM" then return centerX, bottom end
    if point == "BOTTOMRIGHT" then return right, bottom end
    return centerX, centerY
end

function Definition:GetPointFrame(group, position)
    local root = Adapter:GetRootFrame()
    local anchor = Adapter:ResolveAnchorFrame(group and group.anchorFrame)
    if anchor and position.relativePoint == (group.anchorPoint or position.relativePoint) then
        return anchor
    end
    return root
end

function Definition:ComputeAnchorPosition(frame, group, position)
    position = position or self:GetGroupPosition(group)
    local point = position.point or group.selfPoint or "CENTER"
    local relativePoint = position.relativePoint or group.anchorPoint or "CENTER"
    local frameX, frameY = self:GetPointCoord(frame, point)
    local anchorX, anchorY = self:GetPointCoord(self:GetPointFrame(group, position), relativePoint)
    if not frameX or not frameY or not anchorX or not anchorY then return nil end
    return { point = point, relativePoint = relativePoint, x = frameX - anchorX, y = frameY - anchorY }
end

function Definition:ApplyGroupPosition(frame, group)
    -- Position reads during layout do not need two temporary copied tables.
    local profile = self:GetProfile()
    local position = GetEffectiveStoredPosition(group, profile.positions and profile.positions[group.key])
    local point = position and (position.point or "CENTER") or Adapter:GetGroupDefaultValue(group, "selfPoint") or "CENTER"
    local relativePoint = position and (position.relativePoint or "CENTER") or Adapter:GetGroupDefaultValue(group, "anchorPoint") or "CENTER"
    local anchor = Adapter:ResolveAnchorFrame(group.anchorFrame)
    if not anchor or relativePoint ~= (group.anchorPoint or relativePoint) then anchor = Adapter:GetRootFrame() end
    if group.anchorFrame then
        -- A SetPoint anchor does not inherit strata. The player's extended hover
        -- region can sit above a LOW bar while still allowing clicks through.
        -- Apply to the owned bar only, on the existing layout/position path.
        local strata, level = group.frameStrata or "HIGH", group.frameLevel or 100
        if anchor ~= Adapter:GetRootFrame() and type(anchor.GetFrameStrata) == "function" then
            strata = anchor:GetFrameStrata()
            if type(anchor.GetFrameLevel) == "function" then level = level + anchor:GetFrameLevel() end
        end
        if frame.isPreview then level = level + 10 end
        if type(frame.GetFrameStrata) ~= "function" or frame:GetFrameStrata() ~= strata then
            frame:SetFrameStrata(strata)
        end
        if type(frame.GetFrameLevel) ~= "function" or frame:GetFrameLevel() ~= level then
            frame:SetFrameLevel(level)
        end
    end
    frame:ClearAllPoints()
    frame:SetPoint(point, anchor, relativePoint,
        position and (position.x or 0) or Adapter:GetGroupDefaultValue(group, "xOffset") or 0,
        position and (position.y or 0) or Adapter:GetGroupDefaultValue(group, "yOffset") or 0)
    return true
end

function Definition:GetGroupSelfAnchorPoint(group)
    local position = group and self:GetGroupPosition(group)
    local point = position and position.point or group and group.selfPoint or "CENTER"
    return SCREEN_ANCHOR_POINTS[point] and point or "CENTER"
end

function Definition:GetGroupScreenAnchorPoint(group)
    local position = group and self:GetGroupPosition(group)
    local point = position and position.relativePoint or group and group.anchorPoint or "CENTER"
    return SCREEN_ANCHOR_POINTS[point] and point or "CENTER"
end

local function SetGroupAnchorPoints(self, group, point, relativePoint)
    if not group or not group.screenAnchorConfigurable
        or not SCREEN_ANCHOR_POINTS[point] or not SCREEN_ANCHOR_POINTS[relativePoint] then return false end
    if Adapter:IsInCombat() then
        Adapter:Print("战斗中不能调整位置。")
        return false
    end
    local frame = self.groupFrames and self.groupFrames[group.key]
    local target = self.previewMode and frame and frame.preview or frame
    local frameX, frameY = self:GetPointCoord(target, point)
    local anchorX, anchorY = self:GetPointCoord(Adapter:GetRootFrame(), relativePoint)
    -- Do not replace a saved position with zero offsets before layout is ready.
    if not frameX or not frameY or not anchorX or not anchorY then return false end
    local profile = self:GetProfile()
    profile.positions = profile.positions or {}
    profile.positions[group.key] = {
        point = point,
        relativePoint = relativePoint,
        x = frameX - anchorX,
        y = frameY - anchorY,
    }
    if frame then self:ApplyGroupPosition(frame, group) end
    if frame and frame.preview then self:ApplyGroupPosition(frame.preview, group) end
    return true
end

function Definition:SetGroupSelfAnchorPoint(group, point)
    return SetGroupAnchorPoints(self, group, point, self:GetGroupScreenAnchorPoint(group))
end

function Definition:SetGroupScreenAnchorPoint(group, point)
    return SetGroupAnchorPoints(self, group, self:GetGroupSelfAnchorPoint(group), point)
end

function Definition:MigrateProfile()
    local profile = self:GetProfile()
    local storedPositionVersion = rawget(profile, "positionLayoutVersion")
    if storedPositionVersion ~= self.POSITION_LAYOUT_VERSION then
        local positions = type(profile.positions) == "table" and profile.positions or {}
        local oldVersion = tonumber(storedPositionVersion)
        if oldVersion == nil or oldVersion == 3 then
            local supported = { TOPLEFT = true, BOTTOMLEFT = true, BOTTOM = true }
            local key, position
            for key, position in pairs(positions) do
                if not position or not supported[position.point] then positions[key] = nil end
            end
        elseif oldVersion == 7 then
            -- Version 7's Classic resolver treated a nil anchorFrame as the
            -- player frame; drop the suspect "other" position once and keep
            -- the user's other saved groups.
            positions.other = nil
        elseif oldVersion ~= 4 and oldVersion ~= 5 and oldVersion ~= 6 then
            positions = {}
        end
        local other = positions.other
        if (oldVersion == 4 or oldVersion == 5 or oldVersion == 6)
            and other and other.point == "TOPRIGHT" and other.relativePoint == "TOPRIGHT"
            and math.abs((tonumber(other.x) or 0) + 65) < 1
            and math.abs((tonumber(other.y) or 0) + 197) < 1 then
            positions.other = nil
        end
        if (oldVersion == 4 or oldVersion == 5) and Adapter:GetExpansion() == 5
            and other and other.point == "BOTTOMLEFT" and other.relativePoint == "BOTTOM"
            and math.abs((tonumber(other.x) or 0) - 224) < 1
            and math.abs((tonumber(other.y) or 0) - 73) < 1 then
            positions.other = nil
        end
        profile.positions = positions
        profile.positionLayoutVersion = self.POSITION_LAYOUT_VERSION
    end

    local storedLayoutVersion = rawget(profile, "layoutSettingsVersion")
    -- 关闭登录时尚未展开目录，不能把未知分组误判为已删除。
    if self.dataReady and storedLayoutVersion ~= self.LAYOUT_SETTINGS_VERSION then
        local overrides = profile.groupOverrides
        if type(overrides) == "table" then
            local groupKey, override
            for groupKey, override in pairs(overrides) do
                local group = FindGroup(groupKey)
                if type(override) ~= "table" or not group then
                    overrides[groupKey] = nil
                else
                    local spacing = tonumber(override.buttonSpacing)
                    override.buttonSpacing = nil
                    if spacing then
                        if override.rowSpacing == nil then override.rowSpacing = spacing end
                        if override.columnSpacing == nil then override.columnSpacing = spacing end
                    end
                    PruneOverrideValue(override, "enabled", group.enabled ~= false)
                    PruneOverrideValue(override, "buttonWidth", group.buttonWidth or 32)
                    PruneOverrideValue(override, "buttonHeight", group.buttonHeight or 32)
                    PruneOverrideValue(override, "itemsPerGroup", group.itemsPerGroup or group.gridWidth or #(group.items or {}))
                    PruneOverrideValue(override, "growDirection", Adapter:GetGroupDefaultValue(group, "growDirection") or "RIGHT")
                    PruneOverrideValue(override, "wrapDirection", Adapter:GetGroupDefaultValue(group, "wrapDirection"))
                    PruneOverrideValue(override, "rowSpacing", group.rowSpace or group.space or 1)
                    PruneOverrideValue(override, "columnSpacing", group.columnSpace or group.space or 1)
                    if not next(override) then overrides[groupKey] = nil end
                end
            end
            if not next(overrides) then profile.groupOverrides = nil end
        else
            profile.groupOverrides = nil
        end
        profile.layoutSettingsVersion = self.LAYOUT_SETTINGS_VERSION
    end
end

function Definition:ApplyGroupSetting(group, field, value)
    if not group then return false end
    local defaultValue = group[field]
    if field == "rowSpacing" then
        defaultValue = group.rowSpace or group.space or 1
    elseif field == "columnSpacing" then
        defaultValue = group.columnSpace or group.space or 1
    end
    self:SetGroupOverrideValue(group.key, field, value, defaultValue)
    self:QueueSecureRefresh()
    return true
end

function Definition:ApplyGroupGrowthDirectionSetting(group, value)
    if not group or not GROWTH_DIRECTIONS[value] then return false end
    self:SetGroupOverrideValue(group.key, "growDirection", value, group.growDirection or "RIGHT")
    local horizontal = value == "RIGHT" or value == "LEFT"
    local order = horizontal and WRAP_DIRECTION_ORDER.horizontal or WRAP_DIRECTION_ORDER.vertical
    local current = self:GetGroupValue(group, "wrapDirection", group.wrapDirection or order[1])
    if current ~= order[1] and current ~= order[2] then
        self:SetGroupOverrideValue(group.key, "wrapDirection", order[1], group.wrapDirection)
    end
    self:QueueSecureRefresh()
    return true
end

function Definition:ApplyGroupWrapDirectionSetting(group, value)
    if not group then return false end
    local growth = self:GetGroupValue(group, "growDirection", "RIGHT")
    local horizontal = growth == "RIGHT" or growth == "LEFT"
    local order = horizontal and WRAP_DIRECTION_ORDER.horizontal or WRAP_DIRECTION_ORDER.vertical
    if value ~= order[1] and value ~= order[2] then return false end
    local defaultValue = group.wrapDirection
    if defaultValue ~= order[1] and defaultValue ~= order[2] then defaultValue = order[1] end
    self:SetGroupOverrideValue(group.key, "wrapDirection", value, defaultValue)
    self:QueueSecureRefresh()
    return true
end

function Definition:ApplyGroupItemCountSetting(group, value)
    if not group then return false end
    local defaultValue = group.itemsPerGroup or group.gridWidth or #(group.items or {}) or 1
    value = math.max(math.floor((tonumber(value) or defaultValue) + 0.5), 1)
    self:SetGroupOverrideValue(group.key, "itemsPerGroup", value, defaultValue)
    self:QueueSecureRefresh()
    return true
end

function Definition:ResetPositions()
    rawset(self:GetProfile(), "positions", nil)
    self:QueueSecureRefresh()
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
end

function Definition:ResetDefaults()
    if self.db and type(self.db.ResetProfile) == "function" then self.db:ResetProfile() end
    self:MigrateProfile()
    self:QueueSecureRefresh()
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
end

ns.ConsumableBarDefinition = Definition

function Definition:GetFoodMinLevel(group)
    local fallback = group and group.foodMinLevel or 40
    return math.max(0, math.min(70, math.floor(tonumber(self:GetGroupValue(group, "foodMinLevel", fallback)) or fallback)))
end

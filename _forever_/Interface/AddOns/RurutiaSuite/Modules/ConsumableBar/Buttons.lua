local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ConsumableBar")) then return end

local Definition = ns.ConsumableBarDefinition
if type(Definition) ~= "table" then
    error("ConsumableBar Definition.lua must load before Buttons.lua", 2)
end

local Adapter = Definition.ADAPTER
local Data = Definition.DATA
local PixelBorder = ns.UI and ns.UI.PixelBorder

local function HideFrame(frame)
    if frame and type(frame.Hide) == "function" then frame:Hide() end
end

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) == "function" then return callback(target, ...) end
    return nil
end

local function GetClickMacro(click)
    if not click then return nil end
    if click.type == "item" and click.id then
        return "/use item:" .. click.id
    elseif click.type == "slot" and click.slot then
        return "/use " .. click.slot
    elseif click.type == "macro" then
        return click.macro
    end
    return nil
end

local function Coordinate(index, primary, direction, wrapDirection)
    local within = (index - 1) % primary
    local line = math.floor((index - 1) / primary)
    if direction == "RIGHT" then
        return within, wrapDirection == "UP" and -line or line
    elseif direction == "LEFT" then
        return -within, wrapDirection == "UP" and -line or line
    elseif direction == "UP" then
        return wrapDirection == "LEFT" and -line or line, -within
    end
    return wrapDirection == "LEFT" and -line or line, within
end

function Definition:AcquireGroupOwnership(frame)
    if frame.preview then self:AcquireGroupOwnership(frame.preview) end
    self:OwnFrame(frame, HideFrame, "ConsumableBar group")
    local index
    for index = 1, #(frame.buttons or {}) do
        local button = frame.buttons[index]
        self:OwnFrame(button, HideFrame, "ConsumableBar button")
        if button.cooldown then
            self:OwnFrame(button.cooldown, HideFrame, "ConsumableBar cooldown")
        end
    end
    for _, entry in pairs(frame.flyouts or {}) do
        self:OwnFrame(entry.toggle, HideFrame, "ConsumableBar category toggle")
        if entry.toggle.cooldown then self:OwnFrame(entry.toggle.cooldown, HideFrame, "ConsumableBar category cooldown") end
        self:AcquireGroupOwnership(entry.menu)
    end
    if frame.dragOverlay then
        self:OwnFrame(frame.dragOverlay, HideFrame, "ConsumableBar move overlay")
    end
end

function Definition:CreateButton(groupFrame, group, index, isToggle)
    local width = group.buttonWidth or 32
    local height = group.buttonHeight or 32
    local button = self:CreateFrame(
        "Button",
        group.frameName .. "Btn" .. index,
        groupFrame,
        isToggle and "SecureHandlerClickTemplate, BackdropTemplate" or "SecureActionButtonTemplate, BackdropTemplate",
        HideFrame,
        "ConsumableBar " .. group.key .. " button " .. index
    )
    Call(button, "SetSize", width, height)
    if isToggle then
        Call(button, "RegisterForClicks", "LeftButtonUp")
    else
        Adapter:RegisterSecureClicks(button)
    end
    Call(button, "SetBackdrop", {
        bgFile = "Interface\\Buttons\\WHITE8X8",
    })
    Call(button, "SetBackdropColor", 0, 0, 0, 0.8)
    if PixelBorder then
        button.pixelBorder = PixelBorder:Ensure(button, button, "OVERLAY", 6)
        PixelBorder:Update(button.pixelBorder, { 0, 0, 0, 1 }, true)
    end

    button.icon = Call(button, "CreateTexture", nil, "ARTWORK")
    if button.icon then
        local inset = PixelBorder and PixelBorder:GetSize(button, 1, 1) or 1
        Call(button.icon, "SetPoint", "TOPLEFT", button, "TOPLEFT", inset, -inset)
        Call(button.icon, "SetPoint", "BOTTOMRIGHT", button, "BOTTOMRIGHT", -inset, inset)
        Call(button.icon, "SetTexCoord", 0.08, 0.92, 0.08, 0.92)
    end

    button.cooldown = self:CreateFrame(
        "Cooldown",
        nil,
        button,
        "CooldownFrameTemplate",
        HideFrame,
        "ConsumableBar cooldown"
    )
    Call(button.cooldown, "SetAllPoints", button)
    Call(button.cooldown, "SetDrawEdge", false)
    Call(button.cooldown, "SetDrawBling", false)

    local font = self:ResolveFontPath()
    button.countText = Call(button, "CreateFontString", nil, "OVERLAY")
    Call(button.countText, "SetFont", font, 11, "OUTLINE")
    Call(button.countText, "SetPoint", "BOTTOMRIGHT", button.icon, "BOTTOMRIGHT", 3, -2)
    Call(button.countText, "SetJustifyH", "RIGHT")
    Call(button.countText, "SetTextColor", 1, 1, 1)

    button.buffText = Call(button, "CreateFontString", nil, "OVERLAY")
    Call(button.buffText, "SetFont", font, 12, "OUTLINE")
    Call(button.buffText, "SetPoint", "CENTER", button.icon, "CENTER", 1, 0)
    Call(button.buffText, "SetJustifyH", "CENTER")
    Call(button.buffText, "SetTextColor", 0, 1, 0)

    button.slotText = Call(button, "CreateFontString", nil, "OVERLAY")
    Call(button.slotText, "SetFont", font, 13, "OUTLINE")
    Call(button.slotText, "SetPoint", "BOTTOM", button.icon, "BOTTOM", 1, -2)
    Call(button.slotText, "SetJustifyH", "CENTER")
    Call(button.slotText, "SetTextColor", 1, 1, 1)

    local pushed = Call(button, "CreateTexture", nil, "OVERLAY")
    Call(pushed, "SetAllPoints")
    Call(pushed, "SetColorTexture", 0, 0, 0, 0.3)
    Call(button, "SetPushedTexture", pushed)
    local highlight = Call(button, "CreateTexture", nil, "HIGHLIGHT")
    Call(highlight, "SetAllPoints")
    Call(highlight, "SetColorTexture", 1, 1, 1, 0.15)
    Call(button, "SetHighlightTexture", highlight)
    Call(button, "SetScript", "OnEnter", function(current)
        self:ShowTooltip(current)
    end)
    Call(button, "SetScript", "OnLeave", function()
        Adapter:HideTooltip()
    end)
    return button
end

-- Display-only objects never own secure actions or cooldown widgets.
local PREVIEW_BACKDROP = { bgFile = "Interface\\Buttons\\WHITE8X8" }
local PREVIEW_BORDER = { 0, 0, 0, 1 }
function Definition:CreatePreviewButton(parent)
    local button = self:CreateFrame("Frame", nil, parent, "BackdropTemplate", HideFrame, "ConsumableBar preview icon")
    button.isPreview = true
    Call(button, "EnableMouse", true)
    Call(button, "SetBackdrop", PREVIEW_BACKDROP)
    Call(button, "SetBackdropColor", 0, 0, 0, 0.8)
    if PixelBorder then
        button.pixelBorder = PixelBorder:Ensure(button, button, "OVERLAY", 6)
        PixelBorder:Update(button.pixelBorder, PREVIEW_BORDER, true)
    end
    button.icon = Call(button, "CreateTexture", nil, "ARTWORK")
    local inset = PixelBorder and PixelBorder:GetSize(button, 1, 1) or 1
    Call(button.icon, "SetPoint", "TOPLEFT", button, "TOPLEFT", inset, -inset)
    Call(button.icon, "SetPoint", "BOTTOMRIGHT", button, "BOTTOMRIGHT", -inset, inset)
    Call(button.icon, "SetTexCoord", 0.08, 0.92, 0.08, 0.92)
    button.countText = Call(button, "CreateFontString", nil, "OVERLAY")
    Call(button.countText, "SetPoint", "BOTTOMRIGHT", button.icon, "BOTTOMRIGHT", 3, -2)
    Call(button.countText, "SetTextColor", 1, 1, 1)
    Call(button, "SetScript", "OnEnter", function(current) self:ShowTooltip(current) end)
    Call(button, "SetScript", "OnLeave", function(current)
        Adapter:HideTooltip()
        if current.previewEntry then self:QueuePreviewMenuHide(current.previewEntry) end
    end)
    return button
end

function Definition:QueuePreviewMenuHide(entry)
    if not self:CanRun() then return end
    self:RequestRefresh(entry.hideKey, entry.hideCallback, 0.2)
end

function Definition:PaintPreviewButton(button, info)
    button.customInfo = info
    Call(button.icon, "SetTexture", self:GetInfoIcon(info))
    Call(button.countText, "SetFont", self:ResolveFontPath(), info.kind == "food" and 12 or 11, "OUTLINE")
    Call(button.countText, "SetText", info.kind == "categoryMenu" and "" or info.slot and info.name or "20")
end

-- Enumerate both bar and menu buttons without rebuilding a merged list on every refresh.
local function NextDisplayButton(frame, index)
    index = index + 1
    local normal = #frame.buttons
    if index <= normal then return index, frame.buttons[index] end
    local offset = index - normal
    for _, category in ipairs(Definition.CATEGORIES) do
        local entry = frame.flyouts and frame.flyouts[category.key]
        if entry then
            if offset == 1 then return index, entry.toggle end
            offset = offset - 1
            if offset <= #entry.buttons then return index, entry.buttons[offset] end
            offset = offset - #entry.buttons
        end
    end
end

function Definition:IterateDisplayButtons(frame)
    return NextDisplayButton, frame, 0
end

function Definition:ApplyFonts()
    local font = self:ResolveFontPath()
    local function ApplyFrameFonts(frame)
        for _, button in NextDisplayButton, frame, 0 do
            local info = button.customInfo
            Call(button.countText, "SetFont", font, info and info.kind == "food" and 12 or 11, "OUTLINE")
            Call(button.buffText, "SetFont", font, 12, "OUTLINE")
            Call(button.slotText, "SetFont", font, 13, "OUTLINE")
            if button.countText then button.countText._rsFont = nil end
            if button.buffText then button.buffText._rsFont = nil end
            if button.slotText then button.slotText._rsFont = nil end
        end
    end
    for _, frame in pairs(self.groupFrames or {}) do
        ApplyFrameFonts(frame)
        if frame.preview then ApplyFrameFonts(frame.preview) end
    end
    return true
end

function Definition:CreateGroupFrame(group)
    local frame = self:CreateFrame(
        "Frame",
        group.frameName,
        Adapter:GetRootFrame(),
        "BackdropTemplate",
        HideFrame,
        "ConsumableBar group " .. group.key
    )
    Call(frame, "SetFrameStrata", group.frameStrata or "HIGH")
    Call(frame, "SetFrameLevel", group.frameLevel or 100)
    Call(frame, "SetMovable", true)
    Call(frame, "SetClampedToScreen", not Adapter:IsOffscreenDragEnabled())
    frame.groupKey = group.key
    frame.groupData = group
    frame.buttons = {}
    Call(frame, "SetSize", group.buttonWidth or 32, group.buttonHeight or 32)
    self:ApplyGroupPosition(frame, group)
    self.groupFrames[group.key] = frame
    return frame
end

function Definition:RefreshClamp()
    local _, frame
    for _, frame in pairs(self.groupFrames or {}) do
        Call(frame, "SetClampedToScreen", not Adapter:IsOffscreenDragEnabled())
    end
end

function Definition:CreateGroups()
    local index
    for index = 1, #(Data.groups or {}) do
        local group = Data.groups[index]
        local frame = self.groupFrames[group.key]
        if frame then
            if not self.groupsOwned then self:AcquireGroupOwnership(frame) end
        else
            self:CreateGroupFrame(group)
        end
    end
    self.groupsOwned = true
end

local POISON_ORDER = { "instant", "deadly", "wound", "crippling", "mindnumbing" }

Definition.CATEGORIES = {
    {key="flask", name="合剂", icon="Interface\\Icons\\INV_Potion_62"},
    {key="battle", name="战斗药剂", icon=134812},
    {key="guardian", name="守护药剂", icon=134846},
    {key="scroll", name="卷轴", icon=134943},
    {key="misc", name="其他", icon="Interface\\Icons\\INV_Misc_Bag_10"},
    {key="weapon", name="油/磨刀石", icon="Interface\\Icons\\INV_Potion_100"},
    {key="poison", name="毒药", icon="Interface\\Icons\\Ability_Poisons"},
    {key="food", name="食物", icon="Interface\\Icons\\INV_Misc_Food_15"},
}
local KIND_CATEGORY = {flask="flask", elixir="misc", scroll="scroll", weaponConsumable="weapon", food="food"}

local function ClearArray(array)
    for index = #array, 1, -1 do array[index] = nil end
end

-- Borrowed per-group scratch: callers must not modify or retain a snapshot.
-- Catalog definitions are shared read-only; only choices are refreshed.
function Definition:GetCategoryItems(group, preview)
    if preview == nil then preview = self.previewMode end
    local field = preview and "previewCategoryScratch" or "categoryScratch"
    self[field] = self[field] or {}
    local cache = self[field][group.key]
    if not cache then
        cache = { buckets = {}, poisons = {}, items = {}, descriptors = {} }
        self[field][group.key] = cache
    end
    local buckets, poisons = cache.buckets, cache.poisons
    for _, choices in pairs(buckets) do ClearArray(choices) end
    for family in pairs(poisons) do poisons[family] = nil end
    local foodMinLevel = self:GetFoodMinLevel(group)
    local ownedOnly = self:GetProfile().ownedOnly
    for _, key in ipairs(group.items or {}) do
        local info = self.catalog[key]
        if info and (info.kind ~= "food" or (info.requiredLevel or 0) >= foodMinLevel) and (preview or self:IsItemEnabled(key)) and (preview or not ownedOnly or self:HasOwnedItem(info)) then
            if info.poisonFamily then
                local previous = poisons[info.poisonFamily]
                if not previous or info.poisonRank > previous.poisonRank then poisons[info.poisonFamily] = info end
            else
                local category = info.category or KIND_CATEGORY[info.kind] or "misc"
                local bucket = buckets[category]
                if not bucket then bucket = {}; buckets[category] = bucket end
                bucket[#bucket+1] = info
            end
        end
    end
    for _, family in ipairs(POISON_ORDER) do
        if poisons[family] then
            if not buckets.poison then buckets.poison = {} end
            buckets.poison[#buckets.poison+1] = poisons[family]
        end
    end
    local items = cache.items
    ClearArray(items)
    for _, category in ipairs(self.CATEGORIES) do
        local choices = buckets[category.key]
        if (choices and #choices > 0) or preview then
            -- Empty bags need no category objects; allocate only categories actually shown.
            if not choices then choices = {}; buckets[category.key] = choices end
            local descriptor = cache.descriptors[category.key]
            if not descriptor then
                descriptor = {
                    key = "category_" .. category.key, kind = "categoryMenu", category = category.key,
                    name = category.name, icon = category.icon, choices = choices,
                }
                cache.descriptors[category.key] = descriptor
            end
            items[#items+1] = descriptor
        end
    end
    return items
end

function Definition:CanConjure(info)
    local spellID = info and info.conjureSpellID
    return spellID and Adapter.IsSpellKnown and Adapter:IsSpellKnown(spellID)
end

-- Same borrowed-array contract as GetCategoryItems; definitions remain shared read-only.
function Definition:GetVisibleItems(group, preview)
    if preview == nil then preview = self.previewMode end
    if group.categoryMenus then return self:GetCategoryItems(group, preview) end
    local field = preview and "previewVisibleByGroup" or "visibleByGroup"
    self[field] = self[field] or {}
    local items = self[field][group.key]
    if not items then items = {}; self[field][group.key] = items end
    ClearArray(items)
    local healthIndex, healthstone
    local bandageIndex, bandage, bandageFallback
    local ownedOnly = self:GetProfile().ownedOnly
    local firstAidRank = not preview and self.DATA.hasBandages and Adapter:GetFirstAidRank() or 0
    for _, key in ipairs(group.items or {}) do
        local info = self.catalog[key]
        if info and self:IsItemEnabled(key) then
            if info.kind == "bandage" then
                -- Reserve one stable position; selection is based on permanent skill,
                -- not temporary target/cooldown usability. Never rebind in combat.
                if not bandageIndex then
                    bandageIndex = #items + 1
                    items[bandageIndex] = info
                end
                if not bandageFallback or info.bandageRank < bandageFallback.bandageRank then
                    bandageFallback = info
                end
                if (preview or (info.requiredSkillRank <= firstAidRank and self:HasOwnedItem(info)))
                    and (not bandage or info.bandageRank > bandage.bandageRank) then
                    bandage = info
                end
            elseif preview and info.kind == "healthstone" then
                if not healthIndex then
                    healthIndex = #items + 1
                    items[healthIndex] = info
                end
                if not healthstone or (info.previewRank or 0) > (healthstone.previewRank or 0) then
                    healthstone = info
                    items[healthIndex] = info
                end
            elseif preview or not ownedOnly or self:HasOwnedItem(info) or self:CanConjure(info) then
                items[#items + 1] = info
            end
        end
    end

    if bandageIndex then
        if bandage then
            items[bandageIndex] = bandage
        elseif not ownedOnly then
            items[bandageIndex] = bandageFallback
        else
            table.remove(items, bandageIndex)
        end
    end

    return items
end

function Definition:BindButton(button, info, previewOnly, categoryItem)
    if Adapter:IsInCombat() then return false end
    button.customInfo = info
    button.isCategoryItem = categoryItem == true
    Call(button, "SetAttribute", "type1", nil)
    Call(button, "SetAttribute", "macrotext1", nil)
    Call(button, "SetAttribute", "type2", nil)
    Call(button, "SetAttribute", "macrotext2", nil)
    Call(button, "SetAttribute", "spell2", nil)
    if previewOnly then return true end
    local leftMacro = GetClickMacro(info.clicks and info.clicks.left)
    local rightMacro = GetClickMacro(info.clicks and info.clicks.right)
    if info.poisonFamily then
        leftMacro = "/use item:" .. info.itemID .. "\n/use 16"
        rightMacro = "/use item:" .. info.itemID .. "\n/use 17"
    end
    if info.kind == "bandage" then
        leftMacro = "/use [@target,help,nodead][@player] item:" .. info.itemID
        rightMacro = "/use [@player] item:" .. info.itemID
    end
    if categoryItem and not info.poisonFamily then rightMacro = nil end
    if leftMacro then
        Call(button, "SetAttribute", "type1", "macro")
        Call(button, "SetAttribute", "macrotext1", leftMacro)
    end
    if info.conjureSpellID then
        Call(button, "SetAttribute", "spell2", info.conjureSpellID)
        Call(button, "SetAttribute", "type2", "spell")
        return true
    end
    if rightMacro then
        Call(button, "SetAttribute", "type2", "macro")
        Call(button, "SetAttribute", "macrotext2", rightMacro)
    end
    return true
end

function Definition:LayoutPreviewGroup(frame, group, items)
    local preview = frame.preview
    if not preview then
        -- Sibling of the live group: preview size/visibility cannot affect secure children.
        preview = self:CreateFrame("Frame", nil, Adapter:GetRootFrame(), nil, HideFrame, "ConsumableBar preview")
        preview.isPreview, preview.buttons = true, {}
        preview.groupKey, preview.groupData = group.key, group
        Call(preview, "EnableMouse", true)
        Call(preview, "SetFrameStrata", group.frameStrata or "HIGH")
        Call(preview, "SetFrameLevel", (group.frameLevel or 100) + 10)
        Call(preview, "SetMovable", true)
        Call(preview, "SetClampedToScreen", not Adapter:IsOffscreenDragEnabled())
        frame.preview = preview
    end
    self:LayoutGroup(preview, group, items)
    self:ApplyGroupPosition(preview, group)
    Call(preview, "Show")
    if self.isUnlocked then Call(self:CreateMoveOverlay(preview, group), "Show") end
    return preview
end

function Definition:LayoutGroup(frame, group, items)
    if Adapter:IsInCombat() then return false end
    local width = self:GetGroupValue(group, "buttonWidth", 32)
    local height = self:GetGroupValue(group, "buttonHeight", 32)
    local direction = self:GetGroupValue(group, "growDirection", "RIGHT")
    local wrapDirection = self:GetGroupWrapDirection(group, direction)
    local primary = math.max(self:GetGroupItemCount(group), 1)
    local override = self:GetGroupOverride(group.key)
    local columnSpace = override and (override.columnSpacing or override.buttonSpacing)
        or group.columnSpace or group.space or 1
    local rowSpace = override and (override.rowSpacing or override.buttonSpacing)
        or group.rowSpace or group.space or 1
    local coordinateCount = math.max(#items, 1)
    local minColumn, maxColumn, minRow, maxRow = 0, 0, 0, 0
    local index
    for index = 1, coordinateCount do
        local column, row = Coordinate(index, primary, direction, wrapDirection)
        minColumn = math.min(minColumn, column)
        maxColumn = math.max(maxColumn, column)
        minRow = math.min(minRow, row)
        maxRow = math.max(maxRow, row)
    end
    local columns = maxColumn - minColumn + 1
    local rows = maxRow - minRow + 1
    local layoutWidth = columns * width + math.max(columns - 1, 0) * columnSpace
    local layoutHeight = rows * height + math.max(rows - 1, 0) * rowSpace
    Call(frame, "SetSize", layoutWidth, layoutHeight)
    frame.activeCategories = frame.activeCategories or {}
    local normalCount, activeCategories = 0, frame.activeCategories
    for key in pairs(activeCategories) do activeCategories[key] = nil end
    for index = 1, #items do
        local info = items[index]
        local button
        if info.kind == "categoryMenu" then
            activeCategories[info.category] = true
            button = self:PrepareCategoryMenu(frame, group, info, width, height, wrapDirection, direction, columnSpace, rowSpace)
        else
            normalCount = normalCount + 1
            button = frame.buttons[normalCount]
            if not button then
                button = frame.isPreview and self:CreatePreviewButton(frame) or self:CreateButton(frame, group, index)
                frame.buttons[normalCount] = button
            end
            if frame.isPreview then self:PaintPreviewButton(button, info) else self:BindButton(button, info) end
        end
        local column, row = Coordinate(index, primary, direction, wrapDirection)
        Call(button, "SetSize", width, height)
        Call(button, "ClearAllPoints")
        Call(button, "SetPoint", "TOPLEFT", frame, "TOPLEFT",
            (column - minColumn) * (width + columnSpace), -(row - minRow) * (height + rowSpace))
        Call(button, "Show")
    end
    for index = normalCount + 1, #frame.buttons do
        local button = frame.buttons[index]
        button.customInfo = nil
        Call(button, "Hide")
    end
    self:FinishCategoryMenus(frame, activeCategories)
    return true
end

function Definition:SaveGroupPosition(group)
    local frame = self.groupFrames and self.groupFrames[group.key]
    if not frame then return false end
    if self.previewMode then frame = frame.preview or frame end
    local position = self:ComputeAnchorPosition(frame, group, self:GetGroupPosition(group))
    if not position then return false end
    local profile = self:GetProfile()
    profile.positions = profile.positions or {}
    profile.positions[group.key] = position
    return true
end

function Definition:CreateMoveOverlay(frame, group)
    if frame.dragOverlay then
        self:OwnFrame(frame.dragOverlay, HideFrame, "ConsumableBar move overlay")
        return frame.dragOverlay
    end
    local service = ns.MoveOverlay
    if not service then return nil end
    local function CanInteract()
        local live = self.groupFrames[group.key]
        local target = self.previewMode and live and live.preview or live
        return self.isUnlocked and frame == target and not Adapter:IsInCombat()
    end
    local function OpenSettings() return self:OpenSettings() end
    local nudge = {
        label = group.label or group.title,
        getPosition = function()
            local position = self:GetGroupPosition(group)
            return position.x, position.y
        end,
        setPosition = function(x, y)
            if not CanInteract() then return false end
            local position = self:GetGroupPosition(group)
            position.x, position.y = tonumber(x) or 0, tonumber(y) or 0
            local profile = self:GetProfile()
            profile.positions = profile.positions or {}
            profile.positions[group.key] = position
            return self:ApplyGroupPosition(frame, group)
        end,
        savePosition = function() return CanInteract() and self:ApplyGroupPosition(frame, group) end,
        onSettings = OpenSettings,
        onLock = function()
            if type(ns.SetRsMoveMode) == "function" then return ns:SetRsMoveMode(false) end
            return self:SetUnlocked(false)
        end,
    }
    local overlay = service:Ensure(frame, {
        label = group.label or group.title,
        createFrame = function(parent)
            return self:CreateFrame("Button", nil, parent, "BackdropTemplate", HideFrame, "ConsumableBar move overlay")
        end,
        canInteract = CanInteract,
        onDragStart = function() Adapter:HideTooltip(); Call(frame, "StartMoving") end,
        onDragStop = function()
            self:SaveGroupPosition(group)
            self:ApplyGroupPosition(frame, group)
        end,
        onSettings = OpenSettings,
        nudgeConfig = nudge,
    })
    frame.dragOverlay = overlay
    return overlay
end

function Definition:SetUnlocked(unlocked)
    if Adapter:IsInCombat() or not self.available then return false end
    self.isUnlocked = unlocked and true or false
    if self.isUnlocked and self:GetState() ~= "enabled" then
        local ok = ns.Runtime:EnableModule(self)
        if not ok then self.isUnlocked = false; return false end
    elseif not self.isUnlocked and not self.previewMode and not self:ShouldRunLive() then
        ns.Runtime:DisableModule(self)
        return true
    end
    self:CreateGroups()
    local index
    for index = 1, #(Data.groups or {}) do
        local group = Data.groups[index]
        local frame = self.groupFrames[group.key]
        if self.previewMode and frame then frame = frame.preview end
        if frame then
            if self.isUnlocked then
                Call(self:CreateMoveOverlay(frame, group), "Show")
            elseif frame.dragOverlay then
                Call(frame.dragOverlay, "Hide")
                self:ApplyGroupPosition(frame, group)
            end
        end
    end
    self:UpdateBar()
    return true
end

function Definition:UpdateDragOverlay()
    if not self.isUnlocked then return end
    local _, frame
    for _, live in pairs(self.groupFrames or {}) do
        local frame = self.previewMode and live.preview or live
        if frame and frame.dragOverlay then
            ns.MoveOverlay:Refresh(frame.dragOverlay.__rsMoveOverlayRecord)
            for _, entry in pairs(frame.flyouts or {}) do HideFrame(entry.menu) end
        end
    end
end

local HOVER = [[
    local menu = self:GetFrameRef("menu")
    for index = 1, self:GetAttribute("menu-count") do
        local other = self:GetFrameRef("menu-" .. index)
        if other and other ~= menu then other:Hide() end
    end
    if menu and self:GetAttribute("has-choices") then
        menu:Show()
        menu:RegisterAutoHide(0.2)
        menu:AddToAutoHide(self)
    end
]]
local AXIS = { LEFT = {-1, 0}, RIGHT = {1, 0}, UP = {0, -1}, DOWN = {0, 1} }

function Definition:PrepareCategoryMenu(frame, group, info, width, height, direction, growth, columnSpace, rowSpace, materialize)
    if Adapter:IsInCombat() then return end
    frame.flyouts = frame.flyouts or {}
    local entry = frame.flyouts[info.category]
    if not entry then
        local toggle = frame.isPreview and self:CreatePreviewButton(frame) or self:CreateButton(frame, group, "Category" .. info.category, true)
        local menu = self:CreateFrame("Frame", nil, toggle, not frame.isPreview and "SecureHandlerBaseTemplate" or nil, HideFrame, "ConsumableBar category menu")
        menu:SetFrameStrata("HIGH")
        menu:Hide()
        entry = { toggle = toggle, menu = menu, buttons = {} }
        menu.buttons = entry.buttons
        frame.flyouts[info.category] = entry
        if frame.isPreview then
            menu.isPreview = true
            Call(menu, "EnableMouse", true)
            Call(toggle, "SetScript", "OnEnter", function(current)
                if not self.previewMode or Adapter:IsInCombat() then return end
                for _, other in pairs(frame.flyouts) do HideFrame(other.menu) end
                self:PrepareCategoryMenu(frame, group, current.customInfo, entry.width, entry.height,
                    entry.direction, entry.growth, entry.columnSpace, entry.rowSpace, true)
                self:ShowTooltip(current)
                if #current.customInfo.choices > 0 then menu:Show() end
            end)
            toggle.previewEntry = entry
            entry.hideKey = "consumable-preview-" .. group.key .. "-" .. info.category
            entry.hideCallback = function()
                if not Call(menu, "IsMouseOver") and not Call(toggle, "IsMouseOver") then menu:Hide() end
            end
            Call(menu, "SetScript", "OnLeave", function() self:QueuePreviewMenuHide(entry) end)
        else
            Adapter:SetSecureFrameRef(toggle, "menu", menu)
            Adapter:WrapSecureScript(toggle, "OnEnter", HOVER)
        end
        frame.flyoutsDirty = true
    end
    local toggle, menu, choices = entry.toggle, entry.menu, info.choices
    toggle.customInfo = info
    if frame.isPreview then
        self:PaintPreviewButton(toggle, info)
        entry.width, entry.height, entry.direction, entry.growth = width, height, direction, growth
        entry.columnSpace, entry.rowSpace = columnSpace, rowSpace
        if not materialize and (self.categoryPreviewTransition or not Call(menu, "IsShown")) then
            menu:Hide()
            return toggle
        end
    else
        toggle:SetAttribute("menu-count", #self.CATEGORIES)
        toggle:SetAttribute("has-choices", #choices > 0)
    end
    if #choices == 0 then menu:Hide() end
    local axis, wrap = AXIS[direction], AXIS[growth]
    local perLine = self:GetMenuItemsPerLine(group)
    local minX, maxX, minY, maxY = 0, 0, 0, 0
    for index = 1, math.max(1, #choices) do
        local within, line = (index - 1) % perLine, math.floor((index - 1) / perLine)
        local x, y = within * axis[1] + line * wrap[1], within * axis[2] + line * wrap[2]
        minX, maxX, minY, maxY = math.min(minX,x), math.max(maxX,x), math.min(minY,y), math.max(maxY,y)
    end
    local anchor, relative
    if direction == "LEFT" or direction == "RIGHT" then
        local edge = growth == "UP" and "BOTTOM" or "TOP"
        anchor = edge .. (direction == "LEFT" and "RIGHT" or "LEFT")
        relative = edge .. (direction == "LEFT" and "LEFT" or "RIGHT")
    else
        local edge = growth == "LEFT" and "RIGHT" or "LEFT"
        anchor = (direction == "UP" and "BOTTOM" or "TOP") .. edge
        relative = (direction == "UP" and "TOP" or "BOTTOM") .. edge
    end
    menu:ClearAllPoints()
    menu:SetPoint(anchor, toggle, relative, axis[1]*columnSpace, -axis[2]*rowSpace)
    menu:SetSize((maxX-minX+1)*(width+columnSpace)-columnSpace, (maxY-minY+1)*(height+rowSpace)-rowSpace)
    local childGroup = entry.childGroup
    if not childGroup then
        childGroup = {key=group.key .. info.category, frameName=group.frameName .. "Category" .. info.category}
        entry.childGroup = childGroup
    end
    childGroup.buttonWidth, childGroup.buttonHeight = width, height
    for index, choice in ipairs(choices) do
        local button = entry.buttons[index]
        if not button then
            button = frame.isPreview and self:CreatePreviewButton(menu) or self:CreateButton(menu, childGroup, index)
            entry.buttons[index] = button
        end
        button:SetSize(width, height)
        button:ClearAllPoints()
        local within, line = (index - 1) % perLine, math.floor((index - 1) / perLine)
        local x, y = within * axis[1] + line * wrap[1], within * axis[2] + line * wrap[2]
        button:SetPoint("TOPLEFT", menu, "TOPLEFT", (x-minX)*(width+columnSpace), -(y-minY)*(height+rowSpace))
        if frame.isPreview then
            button.isCategoryItem = true
            button.previewEntry = entry
            self:PaintPreviewButton(button, choice)
        else
            self:BindButton(button, choice, false, true)
        end
        button:Show()
    end
    for index = #choices+1, #entry.buttons do
        entry.buttons[index].customInfo = nil
        entry.buttons[index]:Hide()
    end
    return toggle
end

function Definition:FinishCategoryMenus(frame, active)
    local entries = frame.flyouts
    if not entries then return end
    for key, entry in pairs(entries) do
        if not active[key] then
            entry.toggle.customInfo = nil
            entry.toggle:Hide()
            entry.menu:Hide()
            for _, button in ipairs(entry.buttons) do button.customInfo = nil; button:Hide() end
        end
        if frame.flyoutsDirty and not frame.isPreview then
            for index, category in ipairs(self.CATEGORIES) do
                local other = entries[category.key]
                if other then Adapter:SetSecureFrameRef(entry.toggle, "menu-" .. index, other.menu) end
            end
        end
        if self.categoryPreviewTransition then entry.menu:Hide() end
    end
    frame.flyoutsDirty = nil

end

function Definition:GetMenuItemsPerLine(group)
    return math.max(1, math.min(12, math.floor(tonumber(self:GetGroupValue(group, "menuItemsPerLine", 6)) or 6)))
end

ns.ConsumableBarButtons = true

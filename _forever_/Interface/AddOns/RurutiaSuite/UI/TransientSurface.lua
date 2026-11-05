-- Event-driven facade for callouts and hover menus.
-- The backend deliberately uses native frames instead of the retained-page
-- component lifecycle. Business modules own timing and protected behavior.
local _, RS = ...
local UI = RS.UI

local TransientSurface = {}
TransientSurface.__index = TransientSurface

local Surface = {}
Surface.__index = Surface

local WHITE = "Interface\\Buttons\\WHITE8X8"
local DEFAULTS = {
    callout = {
        width = 220, columns = 1, padding = 10, spacing = 6, rowHeight = 30,
        point = "TOP", relativePoint = "BOTTOM", y = -6, mouseEnabled = false,
    },
    hoverMenu = {
        width = 360, columns = 2, padding = 8, spacing = 5, rowHeight = 34,
        point = "TOP", relativePoint = "BOTTOM", y = -6, mouseEnabled = true,
    },
}

local function GetFrame(value)
    return type(value) == "table" and value.frame or value
end

local function Merge(defaults, current, changes)
    local result = {}
    for key, value in pairs(defaults) do result[key] = value end
    for key, value in pairs(current or {}) do result[key] = value end
    for key, value in pairs(changes or {}) do result[key] = value end
    return result
end

local function SetShown(region, shown)
    if region.SetShown then region:SetShown(shown and true or false)
    elseif shown and region.Show then region:Show()
    elseif not shown and region.Hide then region:Hide()
    else region.shown = shown and true or false end
end

local function Paint(texture, color)
    if not (texture and type(color) == "table") then return end
    if texture.SetColorTexture then
        texture:SetColorTexture(color[1], color[2], color[3], color[4] or 1)
    else
        texture:SetTexture(WHITE)
        texture:SetVertexColor(color[1], color[2], color[3], color[4] or 1)
    end
end

local function SetOnePixel(region)
    local pixel = _G.PixelUtil
    if pixel and pixel.SetHeight then pixel.SetHeight(region, 1, 1)
    else region:SetHeight(1) end
end

local function ParseHexColor(value)
    if type(value) ~= "string" then return nil end
    local hex = value:gsub("^#", ""):gsub("^|c", ""):gsub("|r$", "")
    if #hex ~= 6 and #hex ~= 8 then return nil end
    local alpha = 255
    if #hex == 8 then alpha, hex = tonumber(hex:sub(1, 2), 16), hex:sub(3) end
    local red = tonumber(hex:sub(1, 2), 16)
    local green = tonumber(hex:sub(3, 4), 16)
    local blue = tonumber(hex:sub(5, 6), 16)
    if not (red and green and blue and alpha) then return nil end
    return { red / 255, green / 255, blue / 255, alpha / 255 }
end

local function ResolveColor(theme, value, fallback)
    if type(value) == "table" then return value end
    if type(value) == "string" then
        if value:match("^color%.") then return theme:Get(value) end
        local parsed = ParseHexColor(value)
        if parsed then return parsed end
    end
    return theme:Get(fallback)
end

local function SetTextColor(region, color)
    if region and region.SetTextColor and type(color) == "table" then
        region:SetTextColor(color[1], color[2], color[3], color[4] or 1)
    end
end

local function ApplyFont(surface, region, item, valueFont)
    if not (region and region.SetFont) then return end
    local path, size, flags = surface.theme:ResolveFont(item.fontKey or "body")
    if valueFont then size = item.valueFontSize or item.fontSize or size
    else size = item.fontSize or size end
    region:SetFont(path, tonumber(size) or 17,
        item.fontFlags ~= nil and item.fontFlags or flags)
end

local function Resolve(value, surface, item)
    if type(value) == "function" then return value(surface, item) end
    return value
end

local function ResolveItems(surface)
    local items = Resolve(surface.options.items, surface)
    if type(items) == "table" then return items end
    if surface.kind == "callout" and surface.options.text ~= nil then
        return {{
            kind = "text", text = Resolve(surface.options.text, surface),
            justifyH = surface.options.justifyH or "CENTER",
            fontSize = surface.options.fontSize, textColor = surface.options.textColor,
        }}
    end
    return {}
end

local function ResolveKind(item)
    if item.separator or item.kind == "separator" then return "separator" end
    if item.kind == "button" or type(item.onClick) == "function" then return "button" end
    return "text"
end

local NativeComponent = {}
NativeComponent.__index = NativeComponent

function NativeComponent:SetVisible(visible) SetShown(self.frame, visible) end
function NativeComponent:IsVisible() return self.frame:IsShown() end
function NativeComponent:GetText() return self.label and self.label:GetText() or "" end
function NativeComponent:SetText(text) if self.label then self.label:SetText(text or "") end end
-- Text and separator slots are plain Frames. Native frames reject unsupported
-- scripts even when clearing with nil, and an error here aborts the owner's
-- whole release (TopBar then kept visible buttons with their scripts removed).
local RELEASE_SCRIPTS = { "OnClick", "OnEnter", "OnLeave" }
function NativeComponent:Release()
    local frame = self.frame
    for _, script in ipairs(RELEASE_SCRIPTS) do
        if not frame.HasScript or frame:HasScript(script) then frame:SetScript(script, nil) end
    end
    frame:Hide()
    return true
end

local function CreateSlot(surface, index, kind)
    local frameType = kind == "button" and "Button" or "Frame"
    local frame = surface.createFrame(frameType, nil, surface.frame)
    local component = setmetatable({ frame = frame }, NativeComponent)
    local slot = { kind = kind, frame = frame, component = component }

    if kind == "separator" then
        slot.separator = frame:CreateTexture(nil, "ARTWORK")
        slot.separator:SetPoint("LEFT", frame, "LEFT")
        slot.separator:SetPoint("RIGHT", frame, "RIGHT")
        SetOnePixel(slot.separator)
        component.separator = slot.separator
    else
        slot.background = frame:CreateTexture(nil, "BACKGROUND")
        slot.background:SetAllPoints(frame)
        slot.label = frame:CreateFontString(nil, "OVERLAY")
        slot.label:SetJustifyV("MIDDLE")
        component.label = slot.label
        if kind == "button" then
            frame:RegisterForClicks("AnyUp")
            frame:SetScript("OnClick", function(_, mouseButton)
                local item = slot.item
                if not item or Resolve(item.enabled, surface, item) == false then return end
                if type(item.onClick) == "function" then
                    item.onClick(surface, item, mouseButton)
                end
                if item.closeOnClick == true
                    or (item.closeOnClick == nil and surface.options.closeOnClick == true) then
                    surface:Hide("action")
                end
            end)
            frame:SetScript("OnEnter", function()
                slot.hovered = true
                surface:_PaintSlot(slot)
                if type(surface.options.onEnter) == "function" then surface.options.onEnter(surface) end
            end)
            frame:SetScript("OnLeave", function()
                slot.hovered = false
                surface:_PaintSlot(slot)
                if type(surface.options.onLeave) == "function" then surface.options.onLeave(surface) end
            end)
        end
    end
    frame:Hide()
    surface.slots[index] = slot
    return slot
end

local function EnsureSlot(surface, index, kind)
    local slot = surface.slots[index]
    if slot and slot.kind == kind then return slot end
    if slot then slot.component:Release() end
    return CreateSlot(surface, index, kind)
end

local function EnsureIcon(slot)
    if not slot.icon then slot.icon = slot.frame:CreateTexture(nil, "ARTWORK") end
    return slot.icon
end

local function EnsureValueLabel(slot)
    if not slot.valueLabel then
        slot.valueLabel = slot.frame:CreateFontString(nil, "OVERLAY")
        slot.valueLabel:SetJustifyV("MIDDLE")
    end
    return slot.valueLabel
end

function Surface:_PaintSlot(slot)
    local item = slot.item
    if not item then return end
    if slot.kind == "separator" then
        Paint(slot.separator, ResolveColor(self.theme, item.color, item.colorToken or "color.section.border"))
        return
    end
    local enabled = Resolve(item.enabled, self, item) ~= false
    local selected = Resolve(item.selected, self, item) == true
    local backgroundToken = item.backgroundToken
        or (slot.hovered and "color.button.hover")
        or (selected and "color.navigation.selected")
        or (enabled and "color.button.background" or "color.button.disabled")
    local backgroundColor = item.backgroundColor
    if slot.hovered then
        backgroundColor = item.hoverBackgroundColor or self.options.itemHoverColor or backgroundColor
    elseif selected then
        backgroundColor = item.selectedBackgroundColor or self.options.itemSelectedColor or backgroundColor
    else
        backgroundColor = item.normalBackgroundColor or self.options.itemBackgroundColor or backgroundColor
    end
    Paint(slot.background, ResolveColor(self.theme, backgroundColor, backgroundToken))
    if slot.kind == "button" then
        slot.pixelBorder = UI.PixelBorder:Ensure(slot.frame)
        local borderToken = slot.hovered and "color.accent" or (item.borderToken or "color.button.border")
        local borderColor = item.borderColor or self.options.itemBorderColor
        if slot.hovered then
            borderColor = item.hoverBorderColor or self.options.itemHoverBorderColor or borderColor
        elseif selected then
            borderColor = item.selectedBorderColor or self.options.itemSelectedBorderColor or borderColor
        end
        UI.PixelBorder:Update(slot.pixelBorder,
            ResolveColor(self.theme, borderColor, borderToken), true)
    end
end

function Surface:_ConfigureContent(slot, item)
    local label = slot.label
    if not label then return end
    ApplyFont(self, label, item)
    label:SetText(tostring(Resolve(item.text, self, item) or ""))
    if label.SetWordWrap then label:SetWordWrap(item.wordWrap ~= false) end
    if label.SetNonSpaceWrap then label:SetNonSpaceWrap(item.wordWrap ~= false) end
    SetTextColor(label, ResolveColor(self.theme, item.textColor, item.textToken or "color.text.normal"))

    local iconValue = Resolve(item.icon, self, item)
    local hasIcon = iconValue ~= nil and iconValue ~= ""
    if hasIcon then
        local icon = EnsureIcon(slot)
        icon:SetTexture(iconValue)
        icon:SetSize(tonumber(item.iconSize) or tonumber(item.fontSize) or 18,
            tonumber(item.iconSize) or tonumber(item.fontSize) or 18)
        icon:Show()
    elseif slot.icon then slot.icon:Hide() end

    local value = Resolve(item.valueText, self, item)
    local hasValue = value ~= nil and tostring(value) ~= ""
    if hasValue then
        local valueLabel = EnsureValueLabel(slot)
        ApplyFont(self, valueLabel, item, true)
        valueLabel:SetText(tostring(value))
        valueLabel:ClearAllPoints()
        valueLabel:SetPoint("RIGHT", slot.frame, "RIGHT", -(tonumber(item.contentInset) or 10), 0)
        valueLabel:SetWidth(tonumber(item.valueWidth) or 58)
        valueLabel:SetJustifyH(item.valueJustifyH or "RIGHT")
        SetTextColor(valueLabel,
            ResolveColor(self.theme, item.valueColor, item.valueTextToken or "color.accent"))
        SetShown(valueLabel, true)
    elseif slot.valueLabel then SetShown(slot.valueLabel, false) end

    label:ClearAllPoints()
    local gap = tonumber(item.iconGap) or 5
    local inset = tonumber(item.contentInset) or 10
    if hasValue then
        if hasIcon then
            slot.icon:ClearAllPoints()
            slot.icon:SetPoint("LEFT", slot.frame, "LEFT", inset, 0)
            label:SetPoint("LEFT", slot.icon, "RIGHT", gap, 0)
        else label:SetPoint("LEFT", slot.frame, "LEFT", inset, 0) end
        label:SetPoint("RIGHT", slot.valueLabel, "LEFT", -gap, 0)
        label:SetJustifyH(item.justifyH or "LEFT")
    elseif hasIcon then
        local iconSize = tonumber(item.iconSize) or tonumber(item.fontSize) or 18
        label:SetPoint("CENTER", slot.frame, "CENTER", (iconSize + gap) / 2, 0)
        slot.icon:ClearAllPoints()
        slot.icon:SetPoint("RIGHT", label, "LEFT", -gap, 0)
        label:SetJustifyH(item.justifyH or "CENTER")
    else
        local justify = item.justifyH or (slot.kind == "button" and "CENTER" or "LEFT")
        if justify == "CENTER" then label:SetPoint("CENTER", slot.frame, "CENTER")
        else
            label:SetPoint("LEFT", slot.frame, "LEFT", tonumber(item.contentInset) or 0, 0)
            label:SetPoint("RIGHT", slot.frame, "RIGHT", -(tonumber(item.contentInset) or 0), 0)
        end
        label:SetJustifyH(justify)
    end
end

function Surface:Refresh(changes)
    if self.released then return false end
    self.options = Merge(DEFAULTS[self.kind], self.options, changes)
    local options = self.options
    local items = ResolveItems(self)
    local columns = math.max(1, math.floor(tonumber(options.columns) or 1))
    local padding = math.max(0, tonumber(options.padding) or 0)
    local spacing = math.max(0, tonumber(options.spacing) or 0)
    local rowHeight = math.max(1, tonumber(options.rowHeight) or 1)
    local width = math.max(1, tonumber(options.width) or DEFAULTS[self.kind].width)
    local cellWidth = math.max(1, (width - padding * 2 - spacing * (columns - 1)) / columns)
    local column, top, activeRowHeight = 1, padding, 0

    for index, rawItem in ipairs(items) do
        local item = type(rawItem) == "table" and rawItem or { text = tostring(rawItem) }
        local kind = ResolveKind(item)
        local span = math.max(1, math.min(columns,
            math.floor(tonumber(item.span) or (kind == "separator" and columns or 1))))
        if column + span - 1 > columns then
            top, column, activeRowHeight = top + activeRowHeight + spacing, 1, 0
        end
        local height = math.max(1, tonumber(item.height) or (kind == "separator" and 1 or rowHeight))
        local slot = EnsureSlot(self, index, kind)
        slot.item, slot.hovered = item, false
        slot.frame:ClearAllPoints()
        slot.frame:SetPoint("TOPLEFT", self.frame, "TOPLEFT",
            padding + (column - 1) * (cellWidth + spacing), -top)
        slot.frame:SetSize(cellWidth * span + spacing * (span - 1), height)
        if kind ~= "separator" then self:_ConfigureContent(slot, item) end
        self:_PaintSlot(slot)
        slot.frame:EnableMouse(kind == "button" and Resolve(item.enabled, self, item) ~= false)
        slot.frame:Show()
        activeRowHeight = math.max(activeRowHeight, height)
        column = column + span
        if column > columns then
            top, column, activeRowHeight = top + activeRowHeight + spacing, 1, 0
        end
    end
    for index = #items + 1, #self.slots do
        self.slots[index].item = nil
        self.slots[index].frame:Hide()
    end
    local totalHeight = #items == 0 and math.max(1, padding * 2)
        or top + activeRowHeight + padding
    if activeRowHeight == 0 and #items > 0 then totalHeight = math.max(1, top - spacing + padding) end
    self.frame:SetSize(width, totalHeight)
    Paint(self.background,
        ResolveColor(self.theme, options.backgroundColor, options.backgroundToken or "color.popover.background"))
    UI.PixelBorder:Update(self.pixelBorder,
        ResolveColor(self.theme, options.borderColor, options.borderToken or "color.popover.border"), true)
    self.frame:EnableMouse(options.mouseEnabled == true)
    self:SetClampedToScreen(options.clampedToScreen ~= false)
    return true
end

function Surface:Show(changes)
    if self.released then return false end
    self:Refresh(changes)
    local canShow = self.options.canShow
    if canShow == false or (type(canShow) == "function" and canShow(self) ~= true) then return false end
    local relativeTo = GetFrame(self.options.relativeTo) or GetFrame(self.owner)
    if not relativeTo then error("TransientSurface owner is unavailable", 2) end
    self.frame:ClearAllPoints()
    self.frame:SetPoint(self.options.point, relativeTo,
        self.options.relativePoint or self.options.point,
        tonumber(self.options.x or self.options.offsetX) or 0,
        tonumber(self.options.y or self.options.offsetY) or 0)
    self.frame:Show()
    return true
end

function Surface:Hide(reason)
    if self.released then return false end
    self.hideReason = reason
    self.frame:Hide()
    return true
end

function Surface:GetItemFrame(index)
    if self.released then return nil end
    local slot = self.slots[tonumber(index)]
    return slot and slot.item and slot.frame or nil
end

function Surface:IsMouseOver()
    return not self.released and self.frame:IsShown()
        and type(self.frame.IsMouseOver) == "function" and self.frame:IsMouseOver() and true or false
end

function Surface:SetClampedToScreen(clamped)
    if self.released then return false end
    self.clampedToScreen = clamped ~= false
    self.frame:SetClampedToScreen(self.clampedToScreen)
    return true
end

function Surface:IsShown() return not self.released and self.frame:IsShown() end
function Surface:RefreshTheme() return not self.released and self:Refresh() end

function Surface:Release()
    if self.released then return false end
    self:Hide("release")
    self.theme:Unsubscribe(self)
    for _, slot in ipairs(self.slots) do slot.component:Release() end
    self.frame:SetScript("OnEnter", nil)
    self.frame:SetScript("OnLeave", nil)
    self.frame:SetScript("OnMouseUp", nil)
    self.frame:SetScript("OnHide", nil)
    self.frame:EnableMouse(false)
    self.owner, self.released = nil, true
    return true
end

function TransientSurface:New(system)
    return setmetatable({
        system = system, theme = system.theme,
        createFrame = system.components.createFrame or _G.CreateFrame,
    }, self)
end

function TransientSurface:Create(kind, owner, options)
    if kind ~= "callout" and kind ~= "hoverMenu" then return nil, "unknown transient surface kind" end
    local ownerFrame = GetFrame(owner)
    local parent = GetFrame(options and options.parent) or _G.UIParent or ownerFrame
    if not parent then return nil, "transient surface requires a parent or owner" end
    if type(self.createFrame) ~= "function" then return nil, "native frame factory is unavailable" end

    local frame = self.createFrame("Frame", options and options.name, parent)
    frame:SetFrameStrata((options and options.frameStrata) or "DIALOG")
    frame:SetFrameLevel((options and options.frameLevel) or 40)
    frame:SetClampedToScreen(not options or options.clampedToScreen ~= false)
    local surface = setmetatable({
        manager = self, theme = self.theme, createFrame = self.createFrame,
        kind = kind, owner = ownerFrame, frame = frame, slots = {}, options = {},
    }, Surface)
    surface.popup = {
        frame = frame,
        IsVisible = function() return frame:IsShown() end,
        SetVisible = function(_, visible) SetShown(frame, visible) end,
    }
    surface.background = frame:CreateTexture(nil, "BACKGROUND")
    surface.background:SetAllPoints(frame)
    surface.pixelBorder = UI.PixelBorder:Ensure(frame)
    surface.popup.pixelBorder = surface.pixelBorder
    frame:SetScript("OnEnter", function()
        if type(surface.options.onEnter) == "function" then surface.options.onEnter(surface) end
    end)
    frame:SetScript("OnLeave", function()
        if type(surface.options.onLeave) == "function" then surface.options.onLeave(surface) end
    end)
    frame:SetScript("OnMouseUp", function(_, mouseButton)
        local callback = surface.options.onClick
        if type(callback) == "function" then callback(surface, mouseButton) end
    end)
    frame:SetScript("OnHide", function()
        local callback = surface.options.onHide
        if type(callback) == "function" then callback(surface, surface.hideReason) end
        surface.hideReason = nil
    end)
    frame:Hide()
    self.theme:Subscribe(surface, function(target) target:RefreshTheme() end)
    surface:Refresh(options)
    return surface
end

function TransientSurface:CreateCallout(owner, options) return self:Create("callout", owner, options) end
function TransientSurface:CreateHoverMenu(owner, options) return self:Create("hoverMenu", owner, options) end

UI.TransientSurface = TransientSurface

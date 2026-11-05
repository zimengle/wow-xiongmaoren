local _, RS = ...
local UI = RS.UI

local Components = {}
Components.__index = Components

local Component = {}
Component.__index = Component

local BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Buttons\\WHITE8X8",
    edgeSize = 1,
}

local WHITE_TEXTURE = "Interface\\Buttons\\WHITE8X8"
-- Hutu 箭头素材，经作者授权用于 RS。
local DROPDOWN_ARROW_TEXTURE = "Interface\\AddOns\\RurutiaSuite\\Media\\Menu\\arrow"
local CONTROL_DEFAULTS = {
    button = { width = 140, height = 30 },
    checkbox = { width = 260, height = 40 },
    slider = { width = 280, height = 40 },
    dropdown = { width = 240, height = 36 },
    color = { width = 240, height = 36 },
}

local RELEASE_SCRIPTS = {
    "OnClick",
    "OnValueChanged",
    "OnTextChanged",
    "OnEnterPressed",
    "OnEscapePressed",
    "OnEditFocusGained",
    "OnEditFocusLost",
    "OnEnter",
    "OnLeave",
    "OnMouseDown",
    "OnMouseUp",
    "OnMouseWheel",
    "OnShow",
    "OnHide",
    "OnDragStart",
    "OnDragStop",
}

local INTERACTIVE_KIND = {
    button = true,
    checkbox = true,
    dropdown = true,
    color = true,
}

local FRAME_TYPE = {
    frame = "Frame",
    group = "Frame",
    label = "Frame",
    button = "Button",
    checkbox = "CheckButton",
    slider = "Slider",
    editbox = "EditBox",
    dropdown = "Button",
    color = "Button",
    scroll = "ScrollFrame",
    popup = "Frame",
}

local function GetFrame(object)
    if type(object) == "table" and object.frame then
        return object.frame
    end
    return object
end

local function ApplyColor(method, object, color)
    if object and object[method] and type(color) == "table" then
        object[method](object, color[1], color[2], color[3], color[4] or 1)
    end
end

local function PaintTexture(texture, color)
    if not texture or type(color) ~= "table" then return end
    if texture.SetColorTexture then
        texture:SetColorTexture(color[1], color[2], color[3], color[4] or 1)
    elseif texture.SetTexture and texture.SetVertexColor then
        texture:SetTexture(WHITE_TEXTURE)
        texture:SetVertexColor(color[1], color[2], color[3], color[4] or 1)
    end
end

local function PaintCheckTexture(texture, name, color)
    if not texture or type(color) ~= "table" then return end
    texture:SetTexture("Interface\\AddOns\\RurutiaSuite\\Media\\Textures\\" .. name)
    ApplyColor("SetVertexColor", texture, color)
end

local function SetRegionShown(region, shown)
    if not region then return end
    if region.SetShown then
        region:SetShown(shown and true or false)
    elseif shown then
        if region.Show then region:Show() end
    elseif region.Hide then
        region:Hide()
    end
end

local PixelBorder = {}

function PixelBorder:GetSize(owner, size, minPixels)
    size = tonumber(size) or 1
    minPixels = tonumber(minPixels) or 1
    local pixelUtil = _G.PixelUtil
    if pixelUtil and type(pixelUtil.GetNearestPixelSize) == "function"
        and owner and type(owner.GetEffectiveScale) == "function" then
        return pixelUtil.GetNearestPixelSize(size, owner:GetEffectiveScale(), minPixels)
    end
    return size
end

local function ApplyPixelBorderSize(border)
    if not border then return end
    local pixelUtil = _G.PixelUtil
    if pixelUtil and pixelUtil.SetHeight and pixelUtil.SetWidth then
        pixelUtil.SetHeight(border.top, 1, 1)
        pixelUtil.SetHeight(border.bottom, 1, 1)
        pixelUtil.SetWidth(border.left, 1, 1)
        pixelUtil.SetWidth(border.right, 1, 1)
    else
        if border.top.SetHeight then border.top:SetHeight(1) end
        if border.bottom.SetHeight then border.bottom:SetHeight(1) end
        if border.left.SetWidth then border.left:SetWidth(1) end
        if border.right.SetWidth then border.right:SetWidth(1) end
    end
end

function PixelBorder:Ensure(owner, anchor, layer, subLevel)
    anchor = anchor or owner
    if not (owner and owner.CreateTexture and anchor) then return nil end
    if anchor.__rsPixelBorder then return anchor.__rsPixelBorder end

    local border = {}
    local edges = { "top", "bottom", "left", "right" }
    local index = 1
    while index <= #edges do
        border[edges[index]] = owner:CreateTexture(nil, layer or "OVERLAY", nil, subLevel or 7)
        index = index + 1
    end
    border[1], border[2], border[3], border[4] = border.top, border.bottom, border.left, border.right

    border.top:SetPoint("TOPLEFT", anchor, "TOPLEFT")
    border.top:SetPoint("TOPRIGHT", anchor, "TOPRIGHT")
    border.bottom:SetPoint("BOTTOMLEFT", anchor, "BOTTOMLEFT")
    border.bottom:SetPoint("BOTTOMRIGHT", anchor, "BOTTOMRIGHT")
    border.left:SetPoint("TOPLEFT", anchor, "TOPLEFT")
    border.left:SetPoint("BOTTOMLEFT", anchor, "BOTTOMLEFT")
    border.right:SetPoint("TOPRIGHT", anchor, "TOPRIGHT")
    border.right:SetPoint("BOTTOMRIGHT", anchor, "BOTTOMRIGHT")

    ApplyPixelBorderSize(border)

    border.owner = owner
    border.anchor = anchor
    anchor.__rsPixelBorder = border
    self:Update(border, nil, false)
    return border
end

function PixelBorder:Update(target, color, shown, owner)
    local border = target and target.top and target.bottom and target
        or target and target.__rsPixelBorder
    if not border and shown then border = self:Ensure(owner or target, target) end
    if not border then return end
    ApplyPixelBorderSize(border)

    local edges = { border.top, border.bottom, border.left, border.right }
    local index = 1
    while index <= #edges do
        local edge = edges[index]
        if shown then PaintTexture(edge, color) end
        SetRegionShown(edge, shown)
        index = index + 1
    end
    border.shown = shown and true or false
    return border
end

local function ResolveTooltipText(component)
    local value = component and component.options and component.options.tooltip
    if type(value) == "function" then
        local ok, resolved = pcall(value, component)
        value = ok and resolved or nil
    end
    if value == nil then return nil end
    value = tostring(value)
    return value ~= "" and value or nil
end

local function HideComponentTooltip(component)
    local tooltip = component and component.activeTooltip
    if not tooltip then return false end
    if not tooltip.GetOwner or tooltip:GetOwner() == component.frame then
        if tooltip.Hide then tooltip:Hide() end
    end
    component.activeTooltip = nil
    return true
end

local function ShowComponentTooltip(component)
    local text = ResolveTooltipText(component)
    local tooltip = text and _G.GameTooltip
    if not (tooltip and tooltip.SetOwner and tooltip.SetText) then return false end

    tooltip:SetOwner(component.frame, component.options.tooltipAnchor or "ANCHOR_CURSOR_RIGHT")
    local title = component.options.tooltipTitle
    if title == nil then title = component:GetText() end
    title = title ~= nil and tostring(title) or ""
    if title ~= "" and tooltip.AddLine then
        tooltip:SetText(title)
        tooltip:AddLine(text, 0.82, 0.82, 0.82, true)
    else
        tooltip:SetText(text)
    end
    if tooltip.Show then tooltip:Show() end
    component.activeTooltip = tooltip
    return true
end

local function HideRegion(region)
    if not region then return end
    if region.SetAlpha then region:SetAlpha(0) end
    if region.Hide then region:Hide() end
    if region.Disable then region:Disable() end
end

local function FindTemplateScrollBar(frame)
    local scrollBar = frame and (frame.ScrollBar or frame.scrollBar)
    if scrollBar or not (frame and frame.GetChildren) then
        return scrollBar
    end
    local children = { frame:GetChildren() }
    local index = 1
    while index <= #children do
        local child = children[index]
        local objectType = child.GetObjectType and child:GetObjectType() or nil
        if objectType == "Slider" then
            return child
        end
        index = index + 1
    end
    return nil
end

local function ConfigureTemplateScrollBar(component)
    local frame = component.frame
    local scrollBar = FindTemplateScrollBar(frame)
    if not scrollBar then return end

    component.scrollBar = scrollBar
    local name = scrollBar.GetName and scrollBar:GetName() or nil
    local up = scrollBar.ScrollUpButton or scrollBar.UpButton
        or (name and _G[name .. "ScrollUpButton"])
    local down = scrollBar.ScrollDownButton or scrollBar.DownButton
        or (name and _G[name .. "ScrollDownButton"])
    HideRegion(up)
    HideRegion(down)

    if scrollBar.GetChildren then
        local children = { scrollBar:GetChildren() }
        local index = 1
        while index <= #children do
            local child = children[index]
            if child and child.GetObjectType and child:GetObjectType() == "Button" then
                HideRegion(child)
            end
            index = index + 1
        end
    end

    for _, key in ipairs({ "Track", "trackBG", "Top", "Middle", "Bottom" }) do
        HideRegion(scrollBar[key])
    end
    if scrollBar.ClearAllPoints then scrollBar:ClearAllPoints() end
    if scrollBar.SetPoint then
        scrollBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -3, -5)
        scrollBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -3, 5)
    end
    if scrollBar.SetWidth then scrollBar:SetWidth(8) end

    local thumb = scrollBar.ThumbTexture or scrollBar.thumbTexture
    if not thumb and scrollBar.GetThumbTexture then
        thumb = scrollBar:GetThumbTexture()
    end
    component.scrollThumb = thumb
    if thumb then
        if thumb.SetTexture then thumb:SetTexture(WHITE_TEXTURE) end
        if thumb.SetWidth then thumb:SetWidth(8) end
    end
end

-- Skin an existing native scroll frame without replacing its scroll child.
-- Used by native chat copy to preserve EditBox selection and caret behavior.
function UI:SkinNativeScrollFrame(frame)
    local component = { frame = frame }
    ConfigureTemplateScrollBar(component)
    local system = self.GetSystem and self:GetSystem()
    local theme = system and system.theme
    PaintTexture(component.scrollThumb, theme and theme:Get("color.scroll.thumb") or {0.42,0.37,0.43,0.95})
    return component.scrollBar
end

local function UpdateScrollBarVisibility(component, contentHeight)
    if not component or component.kind ~= "scroll" then return end
    local frame = component.frame
    local bar = component.scrollBar or FindTemplateScrollBar(frame)
    if not bar then return end
    component.scrollBar = bar
    local viewportHeight = frame.GetHeight and tonumber(frame:GetHeight()) or 0
    local overflow = (tonumber(contentHeight) or 0) > viewportHeight + 1
    if bar.SetShown then bar:SetShown(overflow)
    elseif overflow and bar.Show then bar:Show()
    elseif not overflow and bar.Hide then bar:Hide() end
    if not overflow then
        if frame.SetVerticalScroll then frame:SetVerticalScroll(0) end
        if bar.SetValue then bar:SetValue(0) end
    end
end

local function OnScrollMouseWheel(frame, delta)
    if not frame.SetVerticalScroll then return end
    local current = tonumber(frame.GetVerticalScroll and frame:GetVerticalScroll()) or 0
    local range = math.max(0, tonumber(frame.GetVerticalScrollRange
        and frame:GetVerticalScrollRange()) or 0)
    local nextValue = math.max(0, math.min(range, current - (tonumber(delta) or 0) * 42))
    frame:SetVerticalScroll(nextValue)
    local component = frame.__rsUIComponent
    local scrollBar = component and component.scrollBar
    if scrollBar and scrollBar.SetValue then scrollBar:SetValue(nextValue) end
end

local function OnTemporaryUpdate(frame, elapsed)
    local component = frame.__rsUIComponent
    local callback = component and component.temporaryCallback
    if callback then
        callback(component, elapsed)
    end
end

local function UpdateButtonLabelOffset(component)
    if not component or component.kind ~= "button" or not component.label
        or not component.label.SetPoint or component.options.pressOffset == false
        or component.options.variant == "navigation" or component.options.variant == "tab" then
        return false
    end
    local x = component.pressed and (tonumber(component.options.pressedTextOffsetX) or 1) or 0
    local y = component.pressed and (tonumber(component.options.pressedTextOffsetY) or -1) or 0
    if component.label.ClearAllPoints then component.label:ClearAllPoints() end
    if component.options.variant == "settings" and component.settingsIcon then
        component.label:SetPoint("LEFT", component.frame, "LEFT", 10 + x, y)
        component.label:SetPoint("RIGHT", component.settingsIcon, "LEFT", -4 + x, y)
        if component.label.SetJustifyH then component.label:SetJustifyH("LEFT") end
    else
        component.label:SetPoint("CENTER", component.frame, "CENTER", x, y)
    end
    return true
end

local function OnFrameHidden(frame)
    local component = frame.__rsUIComponent
    if component then
        local stateChanged = component.hovered or component.pressed
        component.hovered = false
        component.pressed = false
        UpdateButtonLabelOffset(component)
        if stateChanged and not component.released then component:RefreshTheme() end
        HideComponentTooltip(component)
        if component.kind == "dropdown" and component.dropdownMenu then
            component.dropdownMenu:Hide()
            if component.factory and component.factory.openDropdown == component then
                component.factory.openDropdown = nil
            end
        end
        component:StopTemporaryWork()
        component:StopSoundPreview()
        if component.onHide then
            component.onHide(component)
        end
    end
end

local function OnFrameShown(frame)
    local component = frame.__rsUIComponent
    if component and component.onShow then
        component.onShow(component)
    end
end

local function OnFrameEntered(frame)
    local component = frame.__rsUIComponent
    if component and not component.released then
        component.hovered = true
        component:RefreshTheme()
        ShowComponentTooltip(component)
        if component.onEnter then component.onEnter(component) end
    end
end

local function OnFrameLeft(frame)
    local component = frame.__rsUIComponent
    if component and not component.released then
        component.hovered = false
        component.pressed = false
        UpdateButtonLabelOffset(component)
        component:RefreshTheme()
        HideComponentTooltip(component)
        if component.onLeave then component.onLeave(component) end
    end
end

local function OnFrameMouseDown(frame)
    local component = frame.__rsUIComponent
    if component and not component.released and component.enabled ~= false then
        component.pressed = true
        UpdateButtonLabelOffset(component)
        component:RefreshTheme()
    end
end

local function OnFrameMouseUp(frame)
    local component = frame.__rsUIComponent
    if component and not component.released then
        component.pressed = false
        UpdateButtonLabelOffset(component)
        component:RefreshTheme()
    end
end

local function GetDropdownText(component, value)
    local values = component.options.options
    local text
    if type(values) == "table" then
        text = values[value]
    end
    if text == nil then
        text = value
    end
    if text == nil then
        text = component.options.text or ""
    end
    return tostring(text)
end

local DROPDOWN_VISIBLE_ROWS = 10
local DROPDOWN_ROW_HEIGHT = 30

local function HideDropdownMenu(component)
    if component and component.dropdownMenu then component.dropdownMenu:Hide() end
    if component and component.factory and component.factory.openDropdown == component then
        component.factory.openDropdown = nil
    end
end

local function GetDropdownOrder(component)
    local order = component.options.order
    if type(order) == "table" and #order > 0 then return order end
    local generated = component.generatedDropdownOrder or {}
    local count = 0
    for key in pairs(component.options.options or {}) do
        count = count + 1
        generated[count] = key
    end
    local index = #generated
    while index > count do generated[index] = nil index = index - 1 end
    table.sort(generated, function(left, right) return tostring(left) < tostring(right) end)
    component.generatedDropdownOrder = generated
    return generated
end

local function OnDropdownOptionClicked(button)
    local component = button.dropdownComponent
    if not component or component.released or button.dropdownValue == nil then return end
    component:SetValue(button.dropdownValue)
    HideDropdownMenu(component)
end

local function RefreshDropdownOption(button)
    local component = button.dropdownComponent
    local theme = component and component.factory and component.factory.theme
    if theme then
        local selected = component.value == button.dropdownValue
        local hovered = button.dropdownHovered
        ApplyColor("SetBackdropColor", button, theme:Get(hovered and "color.dropdown.hover"
            or "color.transparent"))
        ApplyColor("SetTextColor", button.dropdownLabel, theme:Get(hovered and "color.dropdown.hoverText"
            or selected and "color.dropdown.selectedText" or "color.text.normal"))
    end
end

local function OnDropdownOptionEntered(button)
    button.dropdownHovered = true
    RefreshDropdownOption(button)
end

local function OnDropdownOptionLeft(button)
    button.dropdownHovered = false
    RefreshDropdownOption(button)
end

local function CanPreviewSound(component, value)
    if not component or component.released or component.enabled == false
        or not component.options.soundPreview or type(component.options.onPreview) ~= "function"
        or value == nil then return false end
    local check = component.options.getPreviewEnabled
    return type(check) ~= "function" or check(value, component) == true
end

local function PreviewButtonValue(button)
    local row = button.dropdownRow
    if row then return row.dropdownValue end
    return button.dropdownComponent and button.dropdownComponent.value
end

local function OnSoundPreviewClicked(button)
    local value = PreviewButtonValue(button)
    local cancelled = button.pressInvalidated or (button.pressedValue ~= nil and button.pressedValue ~= value)
    button.pressedValue, button.pressInvalidated = nil, nil
    local component = button.dropdownComponent
    if cancelled or not CanPreviewSound(component, value) then return end
    if button.dropdownRow and not component.dropdownMenu:IsShown() then return end
    local result = component.options.onPreview(value, component)
    if result ~= false then component.soundPreviewActive = true end
end

local function OnSoundPreviewLeft(button)
    if button.icon then button.icon:SetVertexColor(1, 1, 1) end
    local tooltip = _G.GameTooltip
    if tooltip and tooltip.GetOwner and tooltip:GetOwner() == button then tooltip:Hide() end
end

local function NewSoundPreviewButton(component, parent, row)
    local button = component.factory.createFrame("Button", nil, parent)
    button:SetSize(20, 20)
    button.dropdownComponent, button.dropdownRow = component, row
    local icon = button:CreateTexture(nil, "ARTWORK")
    icon:SetAllPoints()
    icon:SetTexture("Interface\\Common\\VoiceChat-Speaker")
    icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    button.icon = icon
    if button.RegisterForClicks then button:RegisterForClicks("LeftButtonUp") end
    button:SetScript("OnClick", OnSoundPreviewClicked)
    button:SetScript("OnMouseDown", function(self)
        self.pressedValue, self.pressInvalidated = PreviewButtonValue(self), nil
    end)
    button:SetScript("OnEnter", function(self)
        if not CanPreviewSound(self.dropdownComponent, PreviewButtonValue(self)) then return end
        self.icon:SetVertexColor(1, 0.82, 0)
        local tooltip = _G.GameTooltip
        if tooltip and tooltip.SetOwner and tooltip.SetText then
            tooltip:SetOwner(self, "ANCHOR_RIGHT")
            tooltip:SetText("试听语音")
            tooltip:Show()
        end
    end)
    button:SetScript("OnLeave", OnSoundPreviewLeft)
    button:SetScript("OnHide", function(self)
        if self.pressedValue ~= nil then self.pressInvalidated = true end
        OnSoundPreviewLeft(self)
    end)
    return button
end

local function ReleaseSoundPreviewButton(button)
    if not button then return end
    OnSoundPreviewLeft(button)
    for _, event in ipairs({ "OnClick", "OnMouseDown", "OnEnter", "OnLeave", "OnHide" }) do
        button:SetScript(event, nil)
    end
    button:Hide()
    button.dropdownComponent, button.dropdownRow = nil, nil
    button.pressedValue, button.pressInvalidated = nil, nil
end

local function EnsureDropdownButton(component, index)
    local existing = component.dropdownButtons[index]
    if existing then return existing end
    local button = component.factory.createFrame("Button", nil, component.dropdownMenu, "BackdropTemplate")
    button:SetBackdrop(BACKDROP)
    button:SetHeight(DROPDOWN_ROW_HEIGHT)
    button:SetPoint("TOPLEFT", component.dropdownMenu, "TOPLEFT", 1, -1 - (index - 1) * DROPDOWN_ROW_HEIGHT)
    button:SetPoint("TOPRIGHT", component.dropdownMenu, "TOPRIGHT", -1, -1 - (index - 1) * DROPDOWN_ROW_HEIGHT)
    local label = button:CreateFontString(nil, "OVERLAY")
    label:SetPoint("LEFT", button, "LEFT", 12, 0)
    label:SetPoint("RIGHT", button, "RIGHT", -12, 0)
    if label.SetJustifyH then label:SetJustifyH("LEFT") end
    local path, size, flags = component.factory.theme:ResolveFont("body")
    if label.SetFont and path then label:SetFont(path, size, flags) end
    button.dropdownLabel = label
    button.dropdownComponent = component
    button:SetScript("OnClick", OnDropdownOptionClicked)
    button:SetScript("OnEnter", OnDropdownOptionEntered)
    button:SetScript("OnLeave", OnDropdownOptionLeft)
    component.dropdownButtons[index] = button
    return button
end

local function RefreshDropdownMenu(component)
    local order = GetDropdownOrder(component)
    local total = #order
    local visible = math.min(total, DROPDOWN_VISIBLE_ROWS)
    local maximumOffset = math.max(1, total - visible + 1)
    component.dropdownOffset = math.max(1, math.min(component.dropdownOffset or 1, maximumOffset))
    local theme = component.factory.theme
    local index = 1
    while index <= DROPDOWN_VISIBLE_ROWS do
        -- Audio menus lazily create only visible slots; every menu stays bounded by the shared row pool.
        local button = (not component.options.soundPreview or index <= visible)
            and EnsureDropdownButton(component, index) or component.dropdownButtons[index]
        local value = order[component.dropdownOffset + index - 1]
        if button then
            button.dropdownValue = value
            if component.options.soundPreview then
                local playable = CanPreviewSound(component, value)
                if playable and not button.previewButton then
                    button.previewButton = NewSoundPreviewButton(component, button, button)
                    button.previewButton:SetPoint("RIGHT", button, "RIGHT", -4, 0)
                    button.dropdownLabel:ClearAllPoints()
                    button.dropdownLabel:SetPoint("LEFT", button, "LEFT", 12, 0)
                    button.dropdownLabel:SetPoint("RIGHT", button, "RIGHT", -30, 0)
                end
                if button.previewButton then
                    local preview = button.previewButton
                    if preview.pressedValue ~= nil and preview.pressedValue ~= value then preview.pressInvalidated = true end
                    SetRegionShown(preview, playable and index <= visible)
                end
            end
            if value ~= nil and index <= visible then
                button.dropdownLabel:SetText(GetDropdownText(component, value))
                ApplyColor("SetBackdropBorderColor", button, theme:Get("color.transparent"))
                button:Show()
                button.dropdownHovered = button.IsMouseOver and button:IsMouseOver() or false
                RefreshDropdownOption(button)
            else
                button:Hide()
            end
        end
        index = index + 1
    end
    component.dropdownMenu:SetHeight(math.max(2, visible * DROPDOWN_ROW_HEIGHT + 2))
end

local function OnDropdownMenuWheel(menu, delta)
    local component = menu.dropdownComponent
    if not component then return end
    local order = GetDropdownOrder(component)
    local visible = math.min(#order, DROPDOWN_VISIBLE_ROWS)
    local maximumOffset = math.max(1, #order - visible + 1)
    component.dropdownOffset = math.max(
        1,
        math.min(maximumOffset, (component.dropdownOffset or 1) - delta)
    )
    RefreshDropdownMenu(component)
end

local function DropdownOwnsFocus(component, focus)
    while focus do
        if issecretvalue and issecretvalue(focus) then return false end
        if focus == component.dropdownMenu or focus == component.frame then return true end
        if focus.IsForbidden and focus:IsForbidden() then return false end
        if not focus.GetParent then return false end
        focus = focus:GetParent()
    end
    return false
end

local function OnDropdownOutsideClick(menu)
    local component = menu.dropdownComponent
    if not component then return end
    if GetMouseFoci then
        for _, focus in ipairs(GetMouseFoci()) do
            if DropdownOwnsFocus(component, focus) then return end
        end
    elseif GetMouseFocus then
        if DropdownOwnsFocus(component, GetMouseFocus()) then return end
    elseif (menu.IsMouseOver and menu:IsMouseOver())
        or (component.frame.IsMouseOver and component.frame:IsMouseOver()) then return end
    HideDropdownMenu(component)
end

local function DropdownOwner(component)
    local context = component.pageContext
    local system = context and context.registry and context.registry.system
    local window = system and system.mainWindow
    if window and window.GetFrame then
        local frame = window:GetFrame()
        -- A page context can also create an independent dialog. Only attach
        -- to the main window when it really owns this dropdown's frame.
        local ancestor = component.frame
        while frame and ancestor do
            if ancestor == frame then return frame end
            ancestor = ancestor.GetParent and ancestor:GetParent() or nil
        end
    end
    local owner = component.frame
    while owner.GetParent do
        local parent = owner:GetParent()
        if not parent or parent == UIParent then break end
        owner = parent
    end
    return owner
end

local function EnsureDropdownMenu(component)
    if component.dropdownMenu then return component.dropdownMenu end
    local menu = component.factory.createFrame("Frame", nil, DropdownOwner(component), "BackdropTemplate")
    menu:SetBackdrop(BACKDROP)
    menu.pixelBorder = PixelBorder:Ensure(menu)
    menu:SetClampedToScreen(true)
    menu:EnableMouse(true)
    if menu.EnableMouseWheel then menu:EnableMouseWheel(true) end
    menu:SetScript("OnMouseWheel", OnDropdownMenuWheel)
    menu:SetScript("OnEvent", OnDropdownOutsideClick)
    menu:SetScript("OnHide", function(self)
        self:UnregisterEvent("GLOBAL_MOUSE_DOWN")
        if component.factory.openDropdown == component then component.factory.openDropdown = nil end
        if self:IsShown() then self:Hide() end
    end)
    -- Frames start shown. A newly-created menu must start closed or the first
    -- click only hides it and appears to do nothing.
    menu:Hide()
    menu.dropdownComponent = component
    component.dropdownMenu = menu
    component.dropdownButtons = {}
    return menu
end

local function ToggleDropdownMenu(component)
    local factory = component.factory
    if factory.openDropdown and factory.openDropdown ~= component then
        HideDropdownMenu(factory.openDropdown)
    end
    local menu = EnsureDropdownMenu(component)
    if menu:IsShown() then
        HideDropdownMenu(component)
        return false
    end
    menu:ClearAllPoints()
    local owner = DropdownOwner(component)
    if menu.SetParent then menu:SetParent(owner) end
    menu:SetFrameStrata(owner.GetFrameStrata and owner:GetFrameStrata() or "HIGH")
    menu:SetFrameLevel((component.frame.GetFrameLevel and component.frame:GetFrameLevel() or 0) + 20)
    local anchor = component.dropdownBox or component.frame
    menu:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -4)
    menu:SetWidth(anchor:GetWidth())
    ApplyColor("SetBackdropColor", menu, factory.theme:Get("color.panel.background"))
    ApplyColor("SetBackdropBorderColor", menu, factory.theme:Get("color.transparent"))
    PixelBorder:Update(menu.pixelBorder, factory.theme:Get("color.border.strong"), true)
    component.dropdownOffset = 1
    RefreshDropdownMenu(component)
    menu:Show()
    menu:RegisterEvent("GLOBAL_MOUSE_DOWN")
    factory.openDropdown = component
    return true
end

local function CopyColor(value)
    value = type(value) == "table" and value or {}
    return {
        tonumber(value[1]) or 1,
        tonumber(value[2]) or 1,
        tonumber(value[3]) or 1,
        tonumber(value[4]) or 1,
    }
end

local function GetPickerAlpha(picker, fallback)
    if type(picker.GetColorAlpha) == "function" then
        local alpha = tonumber(picker:GetColorAlpha())
        if alpha then return alpha end
    end
    local opacitySlider = _G.OpacitySliderFrame
    if opacitySlider and type(opacitySlider.GetValue) == "function" then
        local opacity = tonumber(opacitySlider:GetValue())
        if opacity then return 1 - opacity end
    end
    return fallback
end

local function ApplyPickerValue(component, picker, fallbackAlpha)
    if not component or component.released or not picker
        or type(picker.GetColorRGB) ~= "function" then
        return false
    end
    local r, g, b = picker:GetColorRGB()
    component:SetValue({ r, g, b, GetPickerAlpha(picker, fallbackAlpha) })
    return true
end

local function OpenColorPicker(component)
    local picker = _G.ColorPickerFrame
    if not picker or type(picker.GetColorRGB) ~= "function" then return false end

    local previous = CopyColor(component.value)
    local function changed()
        ApplyPickerValue(component, picker, previous[4])
    end
    local function cancelled()
        if component and not component.released then
            component:SetValue(CopyColor(previous))
        end
    end

    if type(picker.SetupColorPickerAndShow) == "function" then
        picker:SetupColorPickerAndShow({
            r = previous[1],
            g = previous[2],
            b = previous[3],
            opacity = previous[4],
            hasOpacity = true,
            swatchFunc = changed,
            opacityFunc = changed,
            cancelFunc = cancelled,
        })
        return true
    end

    if type(picker.SetColorRGB) ~= "function" or type(picker.Show) ~= "function" then
        return false
    end
    picker.func = changed
    picker.opacityFunc = changed
    picker.cancelFunc = cancelled
    picker.hasOpacity = true
    picker.opacity = 1 - previous[4]
    picker:SetColorRGB(previous[1], previous[2], previous[3])
    if type(picker.Hide) == "function" then picker:Hide() end
    picker:Show()
    return true
end

local function OnFrameClicked(frame, mouseButton)
    local component = frame.__rsUIComponent
    if not component or component.suppressed or component.released or component.enabled == false then
        return
    end

    if component.kind == "dropdown" then
        ToggleDropdownMenu(component)
    elseif component.kind == "color" then
        OpenColorPicker(component)
    elseif component.kind == "checkbox" and frame.GetChecked then
        component.value = frame:GetChecked() and true or false
        component:RefreshValueVisual()
        if component.onChange then
            component.onChange(component, component.value)
        end
    end

    if component.onAction then
        component.onAction(component, mouseButton)
    end
end

local function OnSliderChanged(frame, value)
    local component = frame.__rsUIComponent
    if not component or component.released then
        return
    end
    component.value = value
    component:RefreshValueVisual()
    if component.enabled ~= false and not component.suppressed and component.onChange then
        component.onChange(component, value)
    end
end

local function OnDragStart(frame)
    local component = frame.__rsUIComponent
    if component and component.enabled ~= false and frame.StartMoving then
        frame:StartMoving()
    end
end

local function OnDragStop(frame)
    if frame.StopMovingOrSizing then
        frame:StopMovingOrSizing()
    end
    local component = frame.__rsUIComponent
    local callback = component and component.options and component.options.onDragStop
    if type(callback) == "function" then
        callback(component)
    end
end

local function OnTextChanged(frame, userInput)
    local component = frame.__rsUIComponent
    if not component then
        return
    end
    component.value = frame:GetText()
    component:RefreshValueVisual()
    if not component.suppressed and component.onChange then
        component.onChange(component, component.value, userInput)
    end
end

local function OnEnterPressed(frame)
    local component = frame.__rsUIComponent
    if component and component.onAction then
        component.onAction(component, frame:GetText())
    end
end

local function OnEscapePressed(frame)
    if frame.ClearFocus then
        frame:ClearFocus()
    end
end

local function OnEditFocusGained(frame)
    local component = frame.__rsUIComponent
    if component and component.onFocusGained then
        component.onFocusGained(component)
    end
    if component and component.options.selectAllOnFocus and frame.HighlightText then
        frame:HighlightText()
    end
end

local function OnEditFocusLost(frame)
    local component = frame.__rsUIComponent
    if component and component.onFocusLost then
        component.onFocusLost(component)
    end
end

local function GetInsets(options)
    local insets = options.textInsets
    if type(insets) == "table" then
        return tonumber(insets[1]) or 0, tonumber(insets[2]) or 0,
            tonumber(insets[3]) or 0, tonumber(insets[4]) or 0
    end
    local inset = tonumber(insets) or 0
    return inset, inset, inset, inset
end

local function ConfigureTextRegion(region, options)
    if options.justifyH and region.SetJustifyH then
        region:SetJustifyH(options.justifyH)
    end
    if options.justifyV and region.SetJustifyV then
        region:SetJustifyV(options.justifyV)
    end
    if options.wordWrap ~= nil and region.SetWordWrap then
        region:SetWordWrap(options.wordWrap and true or false)
    end
    if options.nonSpaceWrap ~= nil and region.SetNonSpaceWrap then
        region:SetNonSpaceWrap(options.nonSpaceWrap and true or false)
    end
end

local function ApplyInitialFont(region, theme, fontKey, fontFlags)
    if not region or not region.SetFont or not theme or not theme.ResolveFont then
        return false
    end
    local path, size, flags = theme:ResolveFont(fontKey or "body")
    if not path then
        return false
    end
    if fontFlags ~= nil then
        flags = fontFlags
    end
    region:SetFont(path, size, flags)
    return true
end

local function CreateLabel(frame, options, theme)
    if not frame.CreateFontString then
        return nil
    end
    local label = frame:CreateFontString(nil, "OVERLAY")
    if options.labelFill and label.SetPoint then
        local left, right, top, bottom = GetInsets(options)
        label:SetPoint("TOPLEFT", frame, "TOPLEFT", left, -top)
        if options.autoHeight then
            -- An auto-height FontString must remain vertically unconstrained;
            -- otherwise GetStringHeight can report the old clipped frame height.
            label:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -right, -top)
        else
            label:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -right, bottom)
        end
    elseif label.SetPoint then
        label:SetPoint("CENTER")
    end
    if options.textWidth and label.SetWidth then
        label:SetWidth(options.textWidth)
    end
    ApplyInitialFont(label, theme, options.fontKey or "body", options.fontFlags)
    if label.SetText then
        label:SetText(options.text or "")
    end
    -- Real WoW can reset justification when SetFont runs. Keep alignment last.
    ConfigureTextRegion(label, options)
    return label
end

local function ConfigureEditBox(frame, options)
    if frame.SetMultiLine then
        frame:SetMultiLine(options.multiline and true or false)
    end
    if frame.SetAutoFocus then
        frame:SetAutoFocus(options.autoFocus and true or false)
    end
    if frame.SetTextInsets then
        local left, right, top, bottom
        if options.textInsets == nil then
            left, right, top, bottom = 10, 10, 6, 6
        else
            left, right, top, bottom = GetInsets(options)
        end
        frame:SetTextInsets(left, right, top, bottom)
    end
    if frame.SetJustifyH then frame:SetJustifyH(options.justifyH or "LEFT") end
    if frame.SetJustifyV then frame:SetJustifyV(options.justifyV or "MIDDLE") end
    if options.maxLetters and frame.SetMaxLetters then
        frame:SetMaxLetters(options.maxLetters)
    end
    ConfigureTextRegion(frame, options)
end

local function ConfigureFrame(frame, kind, options)
    local defaults = CONTROL_DEFAULTS[kind]
    local width = options.width or (defaults and defaults.width)
    local height = options.height or (defaults and defaults.height)
    if width and height and frame.SetSize then
        frame:SetSize(width, height)
    elseif width and frame.SetWidth then
        frame:SetWidth(width)
    elseif height and frame.SetHeight then
        frame:SetHeight(height)
    end

    if options.point and frame.SetPoint then
        frame:SetPoint(
            options.point,
            GetFrame(options.relativeTo),
            options.relativePoint or options.point,
            options.x or 0,
            options.y or 0
        )
    end
    if options.frameStrata and frame.SetFrameStrata then
        frame:SetFrameStrata(options.frameStrata)
    end
    if options.frameLevel and frame.SetFrameLevel then
        frame:SetFrameLevel(options.frameLevel)
    end
    if options.topLevel ~= nil and frame.SetToplevel then
        frame:SetToplevel(options.topLevel and true or false)
    end
    if (options.clipChildren or kind == "scroll") and frame.SetClipsChildren then
        frame:SetClipsChildren(true)
    end
    if options.movable then
        if frame.SetMovable then frame:SetMovable(true) end
        if frame.SetClampedToScreen then
            frame:SetClampedToScreen(options.clampedToScreen ~= false)
        end
        if frame.EnableMouse then frame:EnableMouse(true) end
        if frame.RegisterForDrag then
            frame:RegisterForDrag(options.dragButton or "LeftButton")
        end
        if frame.SetScript then
            frame:SetScript("OnDragStart", OnDragStart)
            frame:SetScript("OnDragStop", OnDragStop)
        end
    end
end

function Component:GetFrame()
    return self.frame
end

function Component:SetText(text)
    text = text or ""
    if self.label and self.label.SetText then
        self.label:SetText(text)
        ConfigureTextRegion(self.label, self.options)
    elseif self.frame.SetText then
        self.frame:SetText(text)
    end
    if self.options.autoHeight then
        self:FitTextHeight(self.options.minHeight, self.options.heightPadding)
    end
end

local function NewTexture(frame, layer)
    return frame.CreateTexture and frame:CreateTexture(nil, layer or "ARTWORK") or nil
end

local function SetRegionSize(region, width, height)
    if not region then return end
    if region.SetSize then
        region:SetSize(width, height)
        return
    end
    if region.SetWidth then region:SetWidth(width) end
    if region.SetHeight then region:SetHeight(height) end
end

local function LayoutControlLabel(component)
    local label = component.label
    if not label or not label.SetPoint then return end
    if label.ClearAllPoints then label:ClearAllPoints() end
    if component.kind == "checkbox" then
        if component.options.toggleSide == "left" then
            label:SetPoint("LEFT", component.checkBorder or component.checkBox or component.frame, "RIGHT", 10, 0)
            label:SetPoint("RIGHT", component.frame, "RIGHT", -10, 0)
        else
            label:SetPoint("LEFT", component.frame, "LEFT", 10, 0)
            label:SetPoint("RIGHT", component.checkBox or component.frame, "LEFT", -10, 0)
        end
        if label.SetJustifyH then label:SetJustifyH("LEFT") end
    elseif component.kind == "dropdown" then
        if component.options.controlOnly then
            if label.Hide then label:Hide() end
        else
            label:SetPoint("LEFT", component.frame, "LEFT", 10, 0)
            if label.SetJustifyH then label:SetJustifyH("LEFT") end
        end
    elseif component.kind == "color" then
        label:SetPoint("LEFT", component.frame, "LEFT", 8, 0)
        label:SetPoint("RIGHT", component.colorSwatch or component.frame, "LEFT", -8, 0)
        if label.SetJustifyH then label:SetJustifyH("LEFT") end
    elseif component.kind == "slider" then
        label:SetPoint("LEFT", component.frame, "LEFT", 8, 0)
        if label.SetJustifyH then label:SetJustifyH("LEFT") end
    elseif component.kind == "label" and component.options.labelFill then
        local left, right, top, bottom = GetInsets(component.options)
        label:SetPoint("TOPLEFT", component.frame, "TOPLEFT", left, -top)
        if component.options.autoHeight then
            label:SetPoint("TOPRIGHT", component.frame, "TOPRIGHT", -right, -top)
        else
            label:SetPoint("BOTTOMRIGHT", component.frame, "BOTTOMRIGHT", -right, bottom)
        end
        if label.SetJustifyH then label:SetJustifyH(component.options.justifyH or "LEFT") end
        if label.SetJustifyV then label:SetJustifyV(component.options.justifyV or "MIDDLE") end
    elseif component.kind == "button" and component.options.variant == "navigation" then
        local rightInset = tonumber(component.options.navigationRightInset) or 8
        label:SetPoint("LEFT", component.frame, "LEFT", 12, 0)
        label:SetPoint("RIGHT", component.frame, "RIGHT", -rightInset, 0)
        if label.SetJustifyH then label:SetJustifyH("LEFT") end
    else
        label:SetPoint("CENTER")
    end
end

local function ConfigureControlStructure(component)
    local frame, kind, options = component.frame, component.kind, component.options
    if kind == "checkbox" then
        component.checkBorder = NewTexture(frame, "BACKGROUND")
        component.checkBox = NewTexture(frame)
        component.checkIndicator = NewTexture(frame, "OVERLAY")
        if component.checkBorder then
            if options.toggleSide == "left" then
                component.checkBorder:SetPoint("LEFT", frame, "LEFT", tonumber(options.toggleInset) or 8, 0)
            else
                component.checkBorder:SetPoint("RIGHT", frame, "RIGHT", -(tonumber(options.toggleInset) or 8), 0)
            end
            SetRegionSize(component.checkBorder, 18, 18)
        end
        if component.checkBox then
            component.checkBox:SetPoint("CENTER", component.checkBorder or frame, "CENTER", 0, 0)
            SetRegionSize(component.checkBox, 18, 18)
        end
        if component.checkIndicator then
            SetRegionSize(component.checkIndicator, 10, 10)
        end
        for _, texture in ipairs({ component.checkBox, component.checkIndicator }) do
            if texture.SetSnapToPixelGrid then texture:SetSnapToPixelGrid(false) end
            if texture.SetTexelSnappingBias then texture:SetTexelSnappingBias(0) end
        end
    elseif kind == "slider" then
        local minimum, maximum = tonumber(options.min) or 0, tonumber(options.max) or 1
        if maximum < minimum then minimum, maximum = maximum, minimum end
        if frame.SetOrientation then frame:SetOrientation(options.orientation or "HORIZONTAL") end
        if frame.SetMinMaxValues then frame:SetMinMaxValues(minimum, maximum) end
        if frame.SetValueStep then frame:SetValueStep(tonumber(options.step) or 1) end
        if frame.SetObeyStepOnDrag then frame:SetObeyStepOnDrag(true) end
        component.sliderTrack = NewTexture(frame, "BACKGROUND")
        component.sliderFill = NewTexture(frame, "ARTWORK")
        component.sliderValueBox = NewTexture(frame, "BACKGROUND")
        if frame.SetThumbTexture then
            frame:SetThumbTexture(WHITE_TEXTURE)
            component.nativeSliderThumb = frame.GetThumbTexture and frame:GetThumbTexture() or nil
            if component.nativeSliderThumb and component.nativeSliderThumb.SetAlpha then
                component.nativeSliderThumb:SetAlpha(0)
            end
        end
        component.sliderThumb = NewTexture(frame, "OVERLAY")
        if component.sliderTrack and component.sliderTrack.SetHeight then
            component.sliderTrack:SetHeight(4)
        end
        if component.sliderFill and component.sliderTrack then
            if component.sliderFill.SetHeight then component.sliderFill:SetHeight(4) end
        end
        if component.sliderThumb then
            SetRegionSize(component.sliderThumb, 14, 14)
        end
        component.valueEdit = component.factory.createFrame("EditBox", nil, frame, nil)
        component.valueLabel = component.valueEdit
        if component.valueEdit.SetAutoFocus then component.valueEdit:SetAutoFocus(false) end
        if component.valueEdit.SetJustifyH then component.valueEdit:SetJustifyH("CENTER") end
        if component.valueEdit.SetJustifyV then component.valueEdit:SetJustifyV("MIDDLE") end
        if component.valueEdit.SetTextInsets then component.valueEdit:SetTextInsets(4, 4, 0, 0) end
        ApplyInitialFont(component.valueEdit, component.factory.theme, "body")
        component.valueEdit.sliderComponent = component
        component.valueEdit:SetScript("OnEditFocusGained", function(edit)
            local owner = edit.sliderComponent
            if not owner then return end
            edit:SetText(tostring(owner.value or ""))
            if edit.HighlightText then edit:HighlightText() end
        end)
        component.valueEdit:SetScript("OnEnterPressed", function(edit)
            local owner = edit.sliderComponent
            if not owner then return end
            if owner.released or owner.enabled == false then
                if edit.ClearFocus then edit:ClearFocus() end
                owner:RefreshValueVisual()
                return
            end
            local text = tostring(edit:GetText() or "")
            local value = tonumber(string.match(text, "[-+]?%d*%.?%d+"))
            if value then
                local minimum = tonumber(owner.options.min) or 0
                local maximum = tonumber(owner.options.max) or 1
                if maximum < minimum then minimum, maximum = maximum, minimum end
                local step = math.abs(tonumber(owner.options.step) or 1)
                if step > 0 then
                    value = minimum + math.floor((value - minimum) / step + 0.5) * step
                end
                value = math.max(minimum, math.min(maximum, value))
                owner.frame:SetValue(value)
            end
            if edit.ClearFocus then edit:ClearFocus() end
            owner:RefreshValueVisual()
        end)
        component.valueEdit:SetScript("OnEscapePressed", function(edit)
            if edit.ClearFocus then edit:ClearFocus() end
            local owner = edit.sliderComponent
            if owner then owner:RefreshValueVisual() end
        end)
        component.valueEdit:SetScript("OnEditFocusLost", function(edit)
            local owner = edit.sliderComponent
            if owner then owner:RefreshValueVisual() end
        end)
    elseif kind == "dropdown" and frame.CreateFontString then
        component.dropdownBox = component.factory.createFrame("Frame", nil, frame, "BackdropTemplate")
        if component.dropdownBox.SetBackdrop then component.dropdownBox:SetBackdrop(BACKDROP) end
        component.dropdownValueLabel = component.dropdownBox:CreateFontString(nil, "OVERLAY")
        component.dropdownValueLabel:SetPoint("LEFT", component.dropdownBox, "LEFT", 12, 0)
        component.dropdownValueLabel:SetPoint("RIGHT", component.dropdownBox, "RIGHT", -34, 0)
        if component.dropdownValueLabel.SetJustifyH then component.dropdownValueLabel:SetJustifyH("LEFT") end
        ApplyInitialFont(component.dropdownValueLabel, component.factory.theme, "body")
        component.arrowTexture = component.dropdownBox:CreateTexture(nil, "OVERLAY")
        component.arrowTexture:SetTexture(DROPDOWN_ARROW_TEXTURE)
        component.arrowTexture:SetPoint("RIGHT", component.dropdownBox, "RIGHT", -10, 0)
        SetRegionSize(component.arrowTexture, 16, 16)
        if component.arrowTexture.SetRotation then component.arrowTexture:SetRotation(math.rad(180)) end
        if options.soundPreview and type(options.onPreview) == "function" then
            component.previewButton = NewSoundPreviewButton(component, frame)
            component.previewButton:SetPoint("RIGHT", frame, "RIGHT", -4, 0)
        end
    elseif kind == "color" then
        component.colorSwatch = NewTexture(frame)
        if component.colorSwatch then
            component.colorSwatch:SetPoint("RIGHT", frame, "RIGHT", -5, 0)
            SetRegionSize(component.colorSwatch, 30, 16)
        end
    end
    if options.variant == "navigation" or options.variant == "tab" or options.accentEdge then
        component.accentEdge = NewTexture(frame, "OVERLAY")
        if component.accentEdge then
            if options.variant == "tab" then
                component.accentEdge:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
                component.accentEdge:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
                if component.accentEdge.SetHeight then component.accentEdge:SetHeight(2) end
            else
                component.accentEdge:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
                component.accentEdge:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
                if component.accentEdge.SetWidth then component.accentEdge:SetWidth(2) end
            end
            component.accentEdge:Hide()
        end
    end
    LayoutControlLabel(component)
end

function Component:GetText()
    if self.kind == "dropdown" and self.dropdownValueLabel
        and self.dropdownValueLabel.GetText then
        return self.dropdownValueLabel:GetText()
    end
    if self.label and self.label.GetText then
        return self.label:GetText()
    end
    if self.frame.GetText then
        return self.frame:GetText()
    end
    return nil
end

function Component:SetValue(value, silent)
    self.value = value
    self.suppressed = silent and true or false

    if self.kind == "checkbox" and self.frame.SetChecked then
        self.frame:SetChecked(value and true or false)
    elseif self.kind == "slider" and self.frame.SetValue and value ~= nil then
        self.frame:SetValue(value)
    elseif self.kind == "editbox" and self.frame.SetText then
        self.frame:SetText(value or "")
    elseif self.kind == "dropdown" then
        if self.dropdownValueLabel and self.dropdownValueLabel.SetText then
            self.dropdownValueLabel:SetText(GetDropdownText(self, value))
        end
        if self.dropdownMenu and self.dropdownMenu.IsShown and self.dropdownMenu:IsShown() then
            RefreshDropdownMenu(self)
        end
    end

    self:RefreshValueVisual()

    self.suppressed = false
    if not silent and self.kind ~= "slider" and self.kind ~= "editbox" and self.onChange then
        self.onChange(self, value)
    end
end

local function FormatSliderValue(component)
    local value = tonumber(component.value) or 0
    local options = component.options or {}
    if type(options.formatValue) == "function" then
        local ok, result = pcall(options.formatValue, value, component)
        if ok and result ~= nil then return tostring(result) end
    end
    local step = math.abs(tonumber(options.step) or 1)
    local text
    if step >= 1 then
        text = string.format("%d", value >= 0 and math.floor(value + 0.5) or math.ceil(value - 0.5))
    elseif step >= 0.1 then
        text = string.format("%.1f", value)
    elseif step >= 0.01 then
        text = string.format("%.2f", value)
    else
        text = string.format("%.3f", value)
    end
    if options.valueSuffix then
        text = text .. tostring(options.valueSuffix)
    end
    return text
end

function Component:RefreshValueVisual()
    if self.clearButton then
        if self.value ~= nil and self.value ~= "" then self.clearButton:Show() else self.clearButton:Hide() end
    end
    if self.placeholder then
        self.placeholder:SetText((self.value == nil or self.value == "") and self.options.placeholder or "")
    end
    if self.kind == "checkbox" and self.checkIndicator then
        local theme = self.factory and self.factory.theme
        -- Derive both checkbox styles from one snapped track and shared inset.
        -- Two vertical anchors avoid independent center/height rounding.
        local square = self.options.variant == "square"
        local trackHeight = PixelBorder:GetSize(self.frame, 18, 1)
        local inset = PixelBorder:GetSize(self.frame, square and 4 or 1, 1)
        local knobSize = math.max(inset, trackHeight - inset * 2)
        local trackWidth = square and trackHeight or PixelBorder:GetSize(self.frame, 32, 1)
        SetRegionSize(self.checkBorder, trackWidth, trackHeight)
        SetRegionSize(self.checkBox, trackWidth, trackHeight)
        SetRegionSize(self.checkIndicator, knobSize, knobSize)
        if self.checkIndicator.ClearAllPoints then self.checkIndicator:ClearAllPoints() end
        local side = not square and self.value and "RIGHT" or "LEFT"
        local x = side == "RIGHT" and -inset or inset
        self.checkIndicator:SetPoint("TOP" .. side, self.checkBox or self.frame, "TOP" .. side, x, -inset)
        self.checkIndicator:SetPoint("BOTTOM" .. side, self.checkBox or self.frame, "BOTTOM" .. side, x, inset)
        if self.checkIndicator.SetAlpha then self.checkIndicator:SetAlpha(square and (self.value and 1 or 0) or 1) end
        if theme then
            PaintTexture(self.checkBorder, theme:Get("color.transparent"))
            if square then
                PaintTexture(self.checkBox, theme:Get("color.control.background"))
                PaintTexture(self.checkIndicator, theme:Get("color.accent.control"))
            else
                PaintCheckTexture(self.checkBox, "switch-track-compact.tga",
                    theme:Get(self.value and "color.accent.control" or "color.switch.off"))
                PaintCheckTexture(self.checkIndicator, "switch-knob-balanced.tga",
                    theme:Get("color.switch.knob"))
            end
        end
    elseif self.kind == "slider" and self.valueLabel then
        self.valueLabel:SetText(FormatSliderValue(self))
        if self.frame.GetWidth then
            local width = math.max(1, tonumber(self.frame:GetWidth()) or 240)
            local requestedValueWidth = math.max(56, tonumber(self.options.sliderValueWidth) or 64)
            local valueWidth = math.min(requestedValueWidth, math.max(44, math.floor(width * 0.28)))
            local valueLeft = math.max(1, width - valueWidth - 8)
            local labelWidth = math.max(32, math.min(120, math.floor((valueLeft - 8) * 0.40)))
            local trackLeft = 8 + labelWidth + 8
            local trackWidth = math.max(8, math.min(180, valueLeft - trackLeft - 12))
            if self.label then
                self.label:ClearAllPoints()
                self.label:SetPoint("LEFT", self.frame, "LEFT", 8, 0)
                if self.label.SetWidth then self.label:SetWidth(labelWidth) end
                if self.label.SetJustifyH then self.label:SetJustifyH("LEFT") end
            end
            if self.sliderTrack then
                if self.sliderTrack.ClearAllPoints then self.sliderTrack:ClearAllPoints() end
                self.sliderTrack:SetPoint("LEFT", self.frame, "LEFT", trackLeft, 0)
                if self.sliderTrack.SetWidth then self.sliderTrack:SetWidth(trackWidth) end
            end
            if self.sliderValueBox then
                if self.sliderValueBox.ClearAllPoints then self.sliderValueBox:ClearAllPoints() end
                self.sliderValueBox:SetPoint("RIGHT", self.frame, "RIGHT", -8, 0)
                SetRegionSize(self.sliderValueBox, valueWidth, 28)
            end
            if self.valueLabel.ClearAllPoints then self.valueLabel:ClearAllPoints() end
            self.valueLabel:SetPoint("CENTER", self.sliderValueBox or self.frame, "CENTER", 0, 0)
            if self.valueLabel.SetSize then self.valueLabel:SetSize(valueWidth - 4, 24)
            elseif self.valueLabel.SetWidth then self.valueLabel:SetWidth(valueWidth - 4) end
            local minimum, maximum = tonumber(self.options.min) or 0, tonumber(self.options.max) or 1
            if self.frame.GetMinMaxValues then
                minimum, maximum = self.frame:GetMinMaxValues()
            end
            minimum, maximum = tonumber(minimum) or 0, tonumber(maximum) or 1
            local span = maximum - minimum
            local ratio = span > 0 and ((tonumber(self.value) or minimum) - minimum) / span or 0
            ratio = math.max(0, math.min(1, ratio))
            if self.sliderFill then
                if self.sliderFill.ClearAllPoints then self.sliderFill:ClearAllPoints() end
                self.sliderFill:SetPoint("LEFT", self.sliderTrack, "LEFT", 0, 0)
                if self.sliderFill.SetWidth then
                    self.sliderFill:SetWidth(math.max(1, trackWidth * ratio))
                end
            end
            if self.sliderThumb then
                if self.sliderThumb.ClearAllPoints then self.sliderThumb:ClearAllPoints() end
                self.sliderThumb:SetPoint("CENTER", self.sliderTrack, "LEFT", trackWidth * ratio, 0)
            end
        end
    elseif self.kind == "dropdown" and self.dropdownBox then
        local width = math.max(1, tonumber(self.frame:GetWidth()) or 240)
        local previewInset = self.previewButton and 32 or 0
        self.dropdownBox:ClearAllPoints()
        if self.options.controlOnly then
            self.dropdownBox:SetPoint("LEFT", self.frame, "LEFT", 0, 0)
            SetRegionSize(
                self.dropdownBox,
                math.max(1, width - previewInset),
                tonumber(self.options.controlHeight) or 30
            )
        else
            local fieldWidth = math.max(140, math.min(190, math.floor(width * 0.50)))
            fieldWidth = math.max(1, fieldWidth - previewInset)
            local fieldLeft = math.max(96, width - fieldWidth - previewInset - 4)
            self.dropdownBox:SetPoint("RIGHT", self.frame, "RIGHT", -4 - previewInset, 0)
            SetRegionSize(self.dropdownBox, fieldWidth, 30)
            if self.label and self.label.SetWidth then
                self.label:SetWidth(math.max(80, fieldLeft - 24))
            end
        end
        if self.dropdownValueLabel then
            self.dropdownValueLabel:SetText(GetDropdownText(self, self.value))
        end
        if self.previewButton then SetRegionShown(self.previewButton, CanPreviewSound(self, self.value)) end
    elseif self.kind == "color" and self.colorSwatch then
        local color = type(self.value) == "table" and self.value or { 1, 1, 1, 1 }
        PaintTexture(self.colorSwatch, color)
    end
end

function Component:SetSelected(selected)
    selected = selected and true or false
    if self.selected == selected then return true end
    self.selected = selected
    self:RefreshTheme()
    return true
end

function Component:GetValue()
    if self.kind == "checkbox" and self.frame.GetChecked then
        return self.frame:GetChecked() and true or false
    end
    if self.kind == "slider" and self.frame.GetValue then
        return self.frame:GetValue()
    end
    if self.kind == "editbox" and self.frame.GetText then
        return self.frame:GetText()
    end
    return self.value
end

function Component:GetContent()
    return self.content
end

function Component:SetContentSize(width, height)
    if self.kind ~= "scroll" or not self.content then
        return false
    end
    width = tonumber(width) or (self.content.GetWidth and self.content:GetWidth()) or 1
    height = tonumber(height) or (self.content.GetHeight and self.content:GetHeight()) or 1
    width, height = math.max(1, width), math.max(1, height)
    if self.content.SetSize then
        self.content:SetSize(width, height)
    else
        if self.content.SetWidth then self.content:SetWidth(width) end
        if self.content.SetHeight then self.content:SetHeight(height) end
    end
    UpdateScrollBarVisibility(self, height)
    return true
end

function Component:FitTextHeight(minimum, padding)
    if not self.label then
        return nil
    end
    minimum = tonumber(minimum) or 1
    padding = tonumber(padding) or 0
    local height
    if self.label.GetStringHeight then
        height = tonumber(self.label:GetStringHeight())
    end
    if not height or height <= 0 then
        local text = self:GetText() or ""
        local lines = 1
        for _ in string.gmatch(text, "\n") do lines = lines + 1 end
        height = lines * (tonumber(self.options.lineHeight) or 16)
    end
    height = math.max(minimum, height + padding)
    if self.frame.SetHeight then
        self.frame:SetHeight(height)
    end
    return height
end

function Component:HighlightText(startPosition, endPosition)
    if not self.frame.HighlightText then return false end
    self.frame:HighlightText(startPosition, endPosition)
    return true
end

function Component:SetFocus()
    if not self.frame.SetFocus then return false end
    self.frame:SetFocus()
    return true
end

function Component:ClearFocus()
    if not self.frame.ClearFocus then return false end
    self.frame:ClearFocus()
    return true
end

function Component:SetEnabled(enabled, deferTheme)
    enabled = enabled and true or false
    if self.enabled == enabled then
        return true
    end
    self.enabled = enabled
    if not enabled then
        self.pressed = false
        UpdateButtonLabelOffset(self)
    end
    if not enabled and self.kind == "dropdown" then
        HideDropdownMenu(self)
        self:StopSoundPreview()
    end
    if self.previewButton then self:RefreshValueVisual() end
    if self.kind == "slider" and self.valueEdit then
        if not enabled and self.valueEdit.ClearFocus then self.valueEdit:ClearFocus() end
        if enabled and self.valueEdit.Enable then
            self.valueEdit:Enable()
        elseif not enabled and self.valueEdit.Disable then
            self.valueEdit:Disable()
        end
        self:RefreshValueVisual()
    end
    if self.enabled and self.frame.Enable then
        self.frame:Enable()
    elseif not self.enabled and self.frame.Disable then
        self.frame:Disable()
    end
    if not deferTheme then
        self:RefreshTheme()
    end
end

function Component:SetVisible(visible)
    if visible then
        self.frame:Show()
    else
        if self.kind == "dropdown" then HideDropdownMenu(self) end
        self.frame:Hide()
    end
end

function Component:IsVisible()
    if self.frame.IsShown then
        return self.frame:IsShown()
    end
    return false
end

function Component:SetOnChange(callback)
    self.onChange = type(callback) == "function" and callback or nil
end

function Component:SetOnAction(callback)
    self.onAction = type(callback) == "function" and callback or nil
end

function Component:SetOnShow(callback)
    self.onShow = type(callback) == "function" and callback or nil
end

function Component:SetOnHide(callback)
    self.onHide = type(callback) == "function" and callback or nil
end

function Component:SetOnEnter(callback)
    if self.released then
        return false
    end
    self.onEnter = type(callback) == "function" and callback or nil
    self.frame:SetScript("OnEnter", (self.onEnter or INTERACTIVE_KIND[self.kind]) and OnFrameEntered or nil)
    return true
end

function Component:SetOnLeave(callback)
    if self.released then
        return false
    end
    self.onLeave = type(callback) == "function" and callback or nil
    self.frame:SetScript("OnLeave", (self.onLeave or INTERACTIVE_KIND[self.kind]) and OnFrameLeft or nil)
    return true
end

function Component:BeginTemporaryWork(callback)
    if self.released or type(callback) ~= "function" then
        return false
    end
    if self.frame.IsShown and not self.frame:IsShown() then
        return false
    end
    if self.pageContext and not self.pageContext.visible then
        return false
    end

    self.temporaryCallback = callback
    if self.temporaryActive then
        return true
    end

    self.temporaryActive = true
    self.factory.activeTemporary = self.factory.activeTemporary + 1
    self.frame:SetScript("OnUpdate", OnTemporaryUpdate)
    return true
end

function Component:StopTemporaryWork()
    if not self.temporaryActive then
        self.temporaryCallback = nil
        return false
    end

    self.temporaryActive = false
    self.temporaryCallback = nil
    self.frame:SetScript("OnUpdate", nil)
    self.factory.activeTemporary = self.factory.activeTemporary - 1
    return true
end

function Component:StopSoundPreview()
    if not self.soundPreviewActive then return false end
    self.soundPreviewActive = nil
    local stop = self.options.onStopPreview
    if type(stop) == "function" then stop(self) end
    return true
end

function Component:ApplyNativeTheme(theme, kind)
    local frame = self.frame
    local isNavigation = kind == "button" and self.options.variant == "navigation"
    local isTab = kind == "button" and self.options.variant == "tab"
    local isActionButton = kind == "button" and not isNavigation and not isTab
    local backgroundKey = self.options.backgroundToken
    if not backgroundKey then
        if isActionButton then
            backgroundKey = "color.button.background"
        elseif kind == "editbox" then
            backgroundKey = "color.input.background"
        elseif kind == "color" then
            backgroundKey = "color.transparent"
        elseif kind == "frame" or kind == "group" or kind == "popup" or kind == "scroll" then
            backgroundKey = "color.panel.background"
        else
            backgroundKey = "color.control.background"
        end
    end
    if isNavigation then
        if not self.enabled then
            backgroundKey = "color.control.disabled"
        elseif self.selected then
            backgroundKey = "color.navigation.selected"
        elseif self.pressed then
            backgroundKey = "color.navigation.hover"
        elseif self.hovered then
            backgroundKey = "color.navigation.hover"
        else
            backgroundKey = "color.navigation.background"
        end
    elseif isTab then
        if not self.enabled then
            backgroundKey = "color.control.disabled"
        elseif self.selected then
            backgroundKey = "color.tab.selected"
        elseif self.pressed or self.hovered then
            backgroundKey = "color.tab.hover"
        else
            backgroundKey = "color.tab.background"
        end
    elseif isActionButton then
        if not self.enabled then
            backgroundKey = self.options.disabledBackgroundToken or "color.button.disabled"
        elseif self.pressed then
            backgroundKey = self.options.pressedBackgroundToken or "color.button.pressed"
        elseif self.hovered then
            backgroundKey = self.options.hoverBackgroundToken or "color.button.hover"
        elseif self.selected then
            backgroundKey = self.options.selectedBackgroundToken or "color.navigation.selected"
        end
    elseif self.hovered and INTERACTIVE_KIND[kind] then
        backgroundKey = self.options.hoverBackgroundToken
            or (kind == "checkbox" and backgroundKey or "color.control.hover")
    end
    if not self.enabled and not isActionButton and not isNavigation and not isTab then
        backgroundKey = "color.control.disabled"
    end

    local wantsBackdrop = not self.options.noBackdrop
        and (kind ~= "label" or self.options.backgroundToken or self.options.decorated)
    if frame.SetBackdrop and wantsBackdrop and not self.nativeBackdropApplied then
        frame:SetBackdrop(BACKDROP)
        self.nativeBackdropApplied = true
    end
    local borderToken = self.options.borderToken
        or (isActionButton and "color.button.border" or "color.border")
    local showPhysicalBorder = wantsBackdrop and not self.options.noBorder
    if wantsBackdrop then
        ApplyColor("SetBackdropColor", frame, theme:Get(backgroundKey))
        ApplyColor("SetBackdropBorderColor", frame, theme:Get("color.transparent"))
    end

    local showHoverAccent = isActionButton
        and self.options.hoverAccent ~= false
        and not self.options.noBorder
        and self.enabled
        and self.hovered
        and not self.pressed
    local showSelectedAccent = isActionButton
        and self.options.selectedAccent ~= false
        and not self.options.noBorder
        and self.enabled
        and self.selected
        and not self.pressed
        and not self.hovered
    if showPhysicalBorder then
        self.pixelBorder = self.pixelBorder or PixelBorder:Ensure(frame)
        self.hoverAccentBorder = self.pixelBorder
        PixelBorder:Update(
            self.pixelBorder,
            theme:Get((showHoverAccent and (self.options.hoverBorderToken or "color.accent"))
                or (showSelectedAccent and (self.options.selectedBorderToken or "color.accent"))
                or borderToken),
            true
        )
    elseif self.pixelBorder then
        PixelBorder:Update(self.pixelBorder, nil, false)
    end

    if self.sliderTrack then PaintTexture(self.sliderTrack, theme:Get("color.slider.track")) end
    if self.sliderFill then PaintTexture(self.sliderFill, theme:Get("color.accent.control")) end
    if self.sliderThumb then PaintTexture(self.sliderThumb, theme:Get("color.accent")) end
    if self.sliderValueBox then PaintTexture(self.sliderValueBox, theme:Get("color.input.background")) end
    if self.checkBorder then
        if self.options.variant == "square" then
            self.checkPixelBorder = self.checkPixelBorder or PixelBorder:Ensure(frame, self.checkBox)
            PixelBorder:Update(self.checkPixelBorder,
                theme:Get((self.value or (self.options.checkHoverAccent ~= false and self.hovered)) and "color.accent.control" or "color.border"), true)
        else
            PixelBorder:Update(self.checkPixelBorder, nil, false)
        end
    end
    if self.sliderValueBox then
        self.sliderValuePixelBorder = self.sliderValuePixelBorder or PixelBorder:Ensure(frame, self.sliderValueBox)
        PixelBorder:Update(self.sliderValuePixelBorder, theme:Get("color.input.border"), true)
    end
    if self.dropdownBox then
        ApplyColor("SetBackdropColor", self.dropdownBox, theme:Get("color.input.background"))
        ApplyColor("SetBackdropBorderColor", self.dropdownBox, theme:Get("color.transparent"))
        self.dropdownPixelBorder = self.dropdownPixelBorder or PixelBorder:Ensure(self.dropdownBox)
        PixelBorder:Update(self.dropdownPixelBorder, theme:Get("color.input.border"), true)
    end
    if self.scrollThumb then PaintTexture(self.scrollThumb, theme:Get("color.scroll.thumb")) end
    if self.accentEdge then
        PaintTexture(self.accentEdge, theme:Get("color.accent"))
        if self.enabled and (self.selected
            or (self.options.accentEdge and self.options.variant ~= "navigation")) then
            self.accentEdge:Show()
        else
            self.accentEdge:Hide()
        end
    end

    local fontObject = self.label or (frame.SetFont and frame)
    if self.placeholder then
        self.placeholder:SetFont(theme:ResolveFont(self.options.fontKey or "body"))
        ApplyColor("SetTextColor", self.placeholder, theme:Get("color.text.muted"))
    end
    if fontObject then
        local fontKey = self.options.fontKey or (kind == "label" and "body" or "body")
        local path, size, flags = theme:ResolveFont(fontKey)
        if self.options.fontFlags ~= nil then
            flags = self.options.fontFlags
        end
        if fontObject.SetFont then
            fontObject:SetFont(path, size, flags)
        end
        -- Theme refreshes call SetFont again; restore the component's declared
        -- alignment after that final font application.
        ConfigureTextRegion(fontObject, self.options)
        local textKey = self.options.textToken or "color.text.normal"
        if isTab and self.options.textToken == nil then
            textKey = (self.selected or self.hovered) and "color.text.normal" or "color.text.muted"
        end
        if not self.enabled then textKey = "color.text.disabled" end
        ApplyColor("SetTextColor", fontObject, theme:Get(textKey))
    end
    if self.arrowTexture and self.arrowTexture.SetVertexColor then
        local color = self.enabled and theme:Get("color.text.normal") or theme:Get("color.text.muted")
        self.arrowTexture:SetVertexColor(color[1], color[2], color[3], color[4] or 1)
    end
    if self.dropdownValueLabel then
        local path, size, flags = theme:ResolveFont("body")
        if self.dropdownValueLabel.SetFont then self.dropdownValueLabel:SetFont(path, size, flags) end
        ApplyColor("SetTextColor", self.dropdownValueLabel, theme:Get("color.text.normal"))
    end
    if self.valueLabel then
        local path, size, flags = theme:ResolveFont("body")
        if self.valueLabel.SetFont then self.valueLabel:SetFont(path, size, flags) end
        ApplyColor("SetTextColor", self.valueLabel, theme:Get("color.accent"))
    end
    self:RefreshValueVisual()
    return true
end

function Component:RefreshTheme()
    if self.released then
        return false
    end
    return self.factory.providers:Apply(self.kind, self)
end

function Component:Release()
    if self.released then
        return false
    end

    self.pressed = false
    UpdateButtonLabelOffset(self)
    self:StopTemporaryWork()
    self:StopSoundPreview()
    if self.valueEdit then
        self.valueEdit:SetScript("OnEditFocusGained", nil)
        self.valueEdit:SetScript("OnEnterPressed", nil)
        self.valueEdit:SetScript("OnEscapePressed", nil)
        self.valueEdit:SetScript("OnEditFocusLost", nil)
        self.valueEdit.sliderComponent = nil
        if self.valueEdit.Disable then self.valueEdit:Disable() end
        self.valueEdit:Hide()
    end
    if self.kind == "dropdown" then
        HideDropdownMenu(self)
        ReleaseSoundPreviewButton(self.previewButton)
        self.previewButton = nil
        if self.dropdownButtons then
            local index = 1
            while index <= #self.dropdownButtons do
                local button = self.dropdownButtons[index]
                if button then
                    ReleaseSoundPreviewButton(button.previewButton)
                    button.previewButton = nil
                    button:SetScript("OnClick", nil)
                    button:SetScript("OnEnter", nil)
                    button:SetScript("OnLeave", nil)
                    button:Hide()
                    button.dropdownComponent = nil
                    button.dropdownValue = nil
                end
                index = index + 1
            end
        end
        self.options.onPreview, self.options.onStopPreview, self.options.getPreviewEnabled = nil, nil, nil
        if self.dropdownMenu then
            self.dropdownMenu:SetScript("OnMouseWheel", nil)
            self.dropdownMenu.dropdownComponent = nil
            self.dropdownMenu:Hide()
        end
    end
    if self.frame.UnregisterAllEvents then
        self.frame:UnregisterAllEvents()
    end
    -- Native frames reject unsupported scripts even when clearing with nil.
    -- Finish cleanup instead of leaving a visible button with OnClick removed.
    for _, script in ipairs(RELEASE_SCRIPTS) do
        if not self.frame.HasScript or self.frame:HasScript(script) then
            self.frame:SetScript(script, nil)
        end
    end
    if self.frame.ClearAllPoints then
        self.frame:ClearAllPoints()
    end
    if self.scrollBar and self.scrollBar.Hide then self.scrollBar:Hide() end
    self.frame:Hide()
    if self.clearButton then
        self.clearButton:SetScript("OnClick", nil)
        self.clearButton:Hide()
    end
    self.frame.__rsUIComponent = nil
    self.onChange = nil
    self.onAction = nil
    self.onFocusGained = nil
    self.onFocusLost = nil
    self.onShow = nil
    self.onHide = nil
    self.onEnter = nil
    self.onLeave = nil
    self.hovered = nil
    self.pressed = nil
    PixelBorder:Update(self.pixelBorder, nil, false)
    PixelBorder:Update(self.checkPixelBorder, nil, false)
    PixelBorder:Update(self.sliderValuePixelBorder, nil, false)
    PixelBorder:Update(self.dropdownPixelBorder, nil, false)
    self.hoverAccentBorder = nil
    self.pixelBorder = nil
    self.checkPixelBorder = nil
    self.sliderValuePixelBorder = nil
    self.dropdownPixelBorder = nil
    self.value = nil
    self.released = true
    self.factory.active = self.factory.active - 1
    return true
end

function Components:New(theme, providers, options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.theme = theme
    instance.providers = providers
    instance.createFrame = options.createFrame or CreateFrame
    instance.created = 0
    instance.active = 0
    instance.activeTemporary = 0
    instance.openDropdown = nil
    return instance
end

function Components:Create(kind, parent, options)
    options = options or {}
    local frameType = FRAME_TYPE[kind]
    if not frameType or type(self.createFrame) ~= "function" then
        return nil, "unknown component kind or unavailable frame factory"
    end

    local parentFrame = GetFrame(parent)
    local template = options.template
    if template == nil and kind == "scroll" then
        template = "UIPanelScrollFrameTemplate"
    elseif template == nil and kind ~= "label" then
        template = "BackdropTemplate"
    end
    local frame = self.createFrame(frameType, options.name, parentFrame, template)
    local component = setmetatable({
        factory = self,
        frame = frame,
        kind = kind,
        options = options,
        enabled = nil,
        value = options.value,
    }, Component)

    frame.__rsUIComponent = component
    ConfigureFrame(frame, kind, options)

    if kind == "label" or kind == "button" or kind == "checkbox" or kind == "slider"
        or kind == "dropdown" or kind == "color" then
        component.label = CreateLabel(frame, options, self.theme)
    end
    ConfigureControlStructure(component)
    if kind == "editbox" and options.placeholder then
        component.placeholder = CreateLabel(frame, {
            text = options.placeholder, labelFill = true, justifyH = "LEFT",
            textInsets = { 10, 10, 0, 0 }, wordWrap = false,
            textToken = "color.text.muted", fontKey = options.fontKey or "body",
        }, self.theme)
    end
    if frame.SetFont then
        ApplyInitialFont(frame, self.theme, options.fontKey or "body", options.fontFlags)
    end
    if kind == "scroll" then
        component.content = self.createFrame("Frame", nil, frame, nil)
        if component.content.SetPoint then
            component.content:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
        end
        component:SetContentSize(options.contentWidth or options.width or 1, options.contentHeight or 1)
        if frame.SetScrollChild then
            frame:SetScrollChild(component.content)
        end
        ConfigureTemplateScrollBar(component)
        if frame.EnableMouseWheel then frame:EnableMouseWheel(true) end
        if frame.SetScript then frame:SetScript("OnMouseWheel", OnScrollMouseWheel) end
    end

    if frame.HookScript then
        frame:HookScript("OnHide", OnFrameHidden)
        frame:HookScript("OnShow", OnFrameShown)
    else
        frame:SetScript("OnHide", OnFrameHidden)
        frame:SetScript("OnShow", OnFrameShown)
    end

    if kind == "button" or kind == "checkbox" or kind == "dropdown" or kind == "color" then
        frame:SetScript("OnClick", OnFrameClicked)
        if frame.RegisterForClicks then
            frame:RegisterForClicks("AnyUp")
        end
        if kind == "button" then
            frame:SetScript("OnMouseDown", OnFrameMouseDown)
            frame:SetScript("OnMouseUp", OnFrameMouseUp)
        end
    elseif kind == "slider" then
        frame:SetScript("OnValueChanged", OnSliderChanged)
    elseif kind == "editbox" then
        ConfigureEditBox(frame, options)
        if options.clearable then
            frame:SetTextInsets((options.textInsets or {10})[1], 30, 0, 0)
            local clear = self.createFrame("Button", nil, frame, nil)
            component.clearButton = clear
            clear:SetSize(16,16)
            clear:SetPoint("RIGHT",frame,"RIGHT",-6,0)
            local icon=clear:CreateTexture(nil,"ARTWORK")
            icon:SetTexture("Interface\\FriendsFrame\\ClearBroadcastIcon")
            icon:SetAllPoints(clear)
            clear:SetScript("OnClick",function() component:SetValue(""); frame:SetFocus() end)
            clear:Hide()
        end
        frame:SetScript("OnTextChanged", OnTextChanged)
        frame:SetScript("OnEnterPressed", OnEnterPressed)
        frame:SetScript("OnEscapePressed", OnEscapePressed)
        frame:SetScript("OnEditFocusGained", OnEditFocusGained)
        frame:SetScript("OnEditFocusLost", OnEditFocusLost)
    end

    component:SetValue(options.value, true)
    component:SetEnabled(options.enabled ~= false, true)

    if options.hidden or kind == "popup" then
        frame:Hide()
    end

    component.onChange = options.onChange
    component.onAction = options.onAction
    component.onFocusGained = options.onFocusGained
    component.onFocusLost = options.onFocusLost
    component.onShow = options.onShow
    component.onHide = options.onHide
    component:SetOnEnter(options.onEnter)
    component:SetOnLeave(options.onLeave)

    self.created = self.created + 1
    self.active = self.active + 1
    component:RefreshTheme()
    return component
end

function Components:GetDiagnostics()
    return {
        created = self.created,
        active = self.active,
        activeTemporary = self.activeTemporary,
    }
end

UI.Components = Components
UI.PixelBorder = PixelBorder

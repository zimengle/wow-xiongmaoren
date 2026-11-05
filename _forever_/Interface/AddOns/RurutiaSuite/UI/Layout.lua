local _, RS = ...
local UI = RS.UI

local Layout = {}
Layout.__index = Layout

local function GetFrame(object)
    if type(object) == "table" and object.frame then
        return object.frame
    end
    return object
end

local function GetNumber(options, key, theme, token, fallback)
    local value = options and options[key]
    if value == nil and theme then
        value = theme:Get(token)
    end
    return tonumber(value) or fallback
end

local function VerticalLayout(parent, children, options, theme)
    parent = GetFrame(parent)
    local padding = GetNumber(options, "padding", theme, "layout.padding", 12)
    local spacing = GetNumber(options, "spacing", theme, "layout.spacing", 8)
    local previous
    local totalHeight = padding * 2
    local index = 1

    while index <= #children do
        local child = GetFrame(children[index])
        local shown = not child.IsShown or child:IsShown()
        if shown then
            child:ClearAllPoints()
            if previous then
                child:SetPoint("TOPLEFT", previous, "BOTTOMLEFT", 0, -spacing)
                child:SetPoint("TOPRIGHT", previous, "BOTTOMRIGHT", 0, -spacing)
                totalHeight = totalHeight + spacing
            else
                child:SetPoint("TOPLEFT", parent, "TOPLEFT", padding, -padding)
                child:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -padding, -padding)
            end
            if child.GetHeight then
                totalHeight = totalHeight + (child:GetHeight() or 0)
            end
            previous = child
        end
        index = index + 1
    end

    if options and options.autoHeight and parent.SetHeight then
        parent:SetHeight(totalHeight)
    end
end

local function HorizontalLayout(parent, children, options, theme)
    parent = GetFrame(parent)
    local padding = GetNumber(options, "padding", theme, "layout.padding", 12)
    local spacing = GetNumber(options, "spacing", theme, "layout.spacing", 8)
    local previous
    local index = 1

    while index <= #children do
        local child = GetFrame(children[index])
        child:ClearAllPoints()
        if previous then
            child:SetPoint("LEFT", previous, "RIGHT", spacing, 0)
        else
            child:SetPoint("LEFT", parent, "LEFT", padding, 0)
        end
        previous = child
        index = index + 1
    end
end

local function GridLayout(parent, children, options, theme)
    parent = GetFrame(parent)
    options = options or {}
    local columns = math.max(1, tonumber(options.columns) or 2)
    local padding = GetNumber(options, "padding", theme, "layout.padding", 12)
    local spacing = GetNumber(options, "spacing", theme, "layout.spacing", 8)
    local rowHeight = GetNumber(options, "rowHeight", theme, "layout.rowHeight", 28)
    local rowSpacing = tonumber(options.rowSpacing) or spacing
    local columnWidth = tonumber(options.columnWidth) or 180
    local index = 1

    while index <= #children do
        local child = GetFrame(children[index])
        local zeroIndex = index - 1
        local row = math.floor(zeroIndex / columns)
        local column = zeroIndex % columns
        child:ClearAllPoints()
        child:SetPoint(
            "TOPLEFT",
            parent,
            "TOPLEFT",
            padding + column * (columnWidth + spacing),
            -padding - row * (rowHeight + rowSpacing)
        )
        if child.SetSize then
            child:SetSize(columnWidth, rowHeight)
        end
        index = index + 1
    end
end

function Layout:New(theme)
    local instance = setmetatable({}, self)
    instance.theme = theme
    instance.layouts = {
        vertical = VerticalLayout,
        horizontal = HorizontalLayout,
        grid = GridLayout,
    }
    instance.applyCount = 0
    return instance
end

function Layout:Register(name, callback)
    if type(name) ~= "string" or name == "" or type(callback) ~= "function" then
        return false
    end
    self.layouts[name] = callback
    return true
end

function Layout:Apply(name, parent, children, options)
    local callback = self.layouts[name]
    if not callback or not parent or type(children) ~= "table" then
        return false
    end
    callback(parent, children, options, self.theme)
    self.applyCount = self.applyCount + 1
    return true
end

function Layout:GetDiagnostics()
    local registered = 0
    for _ in pairs(self.layouts) do
        registered = registered + 1
    end
    return { registered = registered, applies = self.applyCount }
end

UI.Layout = Layout

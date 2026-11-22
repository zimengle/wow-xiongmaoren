local _, RS = ...
local UI = RS.UI

local SettingsBuilder = {}
SettingsBuilder.__index = SettingsBuilder

local Page = {}
Page.__index = Page

local Section = {}
Section.__index = Section

local Row = {}
Row.__index = Row

local Tabs = {}
Tabs.__index = Tabs

local Tab = {}
Tab.__index = Tab

local DEFAULTS = {
    width = 560,
    height = 460,
    padding = 8,
    spacing = 6,
    sectionGap = 10,
    sectionHeaderHeight = 26,
    descriptionMinHeight = 20,
    descriptionPadding = 0,
    rowGap = 4,
    rowHeight = 32,
    columnGap = 10,
    minimumColumnWidth = 180,
    sliderMinimumColumnWidth = 300,
    actionColumns = 4,
    actionMinimumColumnWidth = 80,
    toggleColumns = 4,
    toggleMinimumColumnWidth = 120,
    toggleColumnGap = 6,
    fieldColumns = 4,
    fieldMinimumColumnWidth = 180,
    fieldRowHeight = 58,
    fieldPaddingX = 0,
    fieldPaddingTop = 4,
    fieldLabelHeight = 18,
    fieldControlHeight = 28,
    fieldControlGap = 4,
    popoverMinimumColumnWidth = 130,
    bottomPadding = 24,
    scrollbarReserve = 12,
    tabBarHeight = 40,
    tabBarGap = 8,
    tabGap = 6,
}

local CONTROL_KINDS = {
    button = true,
    checkbox = true,
    color = true,
    dropdown = true,
    editbox = true,
    label = true,
    slider = true,
}

local KIND_ALIASES = {
    checkbox = "checkbox",
    checkbutton = "checkbox",
    color = "color",
    colour = "color",
    colorpicker = "color",
    dropdown = "dropdown",
    editbox = "editbox",
    input = "editbox",
    label = "label",
    slider = "slider",
    button = "button",
}

local function CopyTable(source)
    local result = {}
    if type(source) == "table" then
        for key, value in pairs(source) do
            result[key] = value
        end
    end
    return result
end

local function GetFrame(object)
    if type(object) == "table" and object.frame then
        return object.frame
    end
    return object
end

local function GetContextData(context)
    if type(context) == "table" and type(context.GetData) == "function" then
        return context:GetData()
    end
    return type(context) == "table" and context.data or nil
end

local function ReadNumber(options, key, fallback)
    local value = options and options[key]
    if value == nil and options and type(options.layout) == "table" then
        value = options.layout[key]
    end
    return tonumber(value) or fallback
end

local function ResolveValue(value, page, entry, reason, data)
    if type(value) == "function" then
        return value(page, entry, reason, data)
    end
    return value
end

local function TryResolveValue(value, page, entry, reason, data)
    if type(value) ~= "function" then return true, value end
    local ok, result = pcall(value, page, entry, reason, data)
    if not ok then return false, nil, tostring(result) end
    return true, result
end

local function ResolvePageOptionValue(value, page, entry, reason, data)
    if page and page.dryRun then
        local ok, result = TryResolveValue(value, page, entry, reason, data)
        return ok and result or nil
    end
    return ResolveValue(value, page, entry, reason, data)
end

local function CleanSearchText(value)
    if type(value) ~= "string" and type(value) ~= "number" then return nil end
    local text = tostring(value)
    if text == "" then return nil end
    if string.find(text, "|", 1, true) then
        text = text:gsub("|T.-|t", " ")
            :gsub("|A.-|a", " ")
            :gsub("|c%x%x%x%x%x%x%x%x", "")
            :gsub("|r", "")
            :gsub("|H.-|h", "")
            :gsub("|h", "")
            :gsub("|n", " ")
    end
    text = text:gsub("[\r\n]+", " "):gsub("%s+", " ")
    text = string.match(text, "^%s*(.-)%s*$")
    if not text or text == "" then return nil end
    return text
end

local function InvokeLifecycleCallback(label, callback, ...)
    if type(callback) ~= "function" then return true end
    local invoked, result, reason = pcall(callback, ...)
    if not invoked then return false, label .. ": " .. tostring(result) end
    if result == false then
        return false, tostring(reason or (label .. " returned failure"))
    end
    return true
end

local function NormalizeKind(kind)
    if type(kind) ~= "string" then
        return nil
    end
    return KIND_ALIASES[string.lower(kind)]
end

local function Clamp(value, minimum, maximum)
    if value < minimum then return minimum end
    if value > maximum then return maximum end
    return value
end

local function CountKeys(source)
    local count = 0
    for _ in pairs(source) do
        count = count + 1
    end
    return count
end

local function BuildMetrics(system, options)
    local theme = system.theme
    local themePadding = theme and theme:Get("layout.padding") or nil
    local themeSpacing = theme and theme:Get("layout.spacing") or nil
    local themeRowHeight = theme and theme:Get("layout.rowHeight") or nil
    return {
        padding = ReadNumber(options, "padding", tonumber(themePadding) or DEFAULTS.padding),
        spacing = ReadNumber(options, "spacing", tonumber(themeSpacing) or DEFAULTS.spacing),
        sectionGap = ReadNumber(options, "sectionGap", tonumber(theme and theme:Get("layout.sectionGap")) or DEFAULTS.sectionGap),
        sectionHeaderHeight = ReadNumber(
            options,
            "sectionHeaderHeight",
            DEFAULTS.sectionHeaderHeight
        ),
        descriptionMinHeight = ReadNumber(
            options,
            "descriptionMinHeight",
            DEFAULTS.descriptionMinHeight
        ),
        descriptionPadding = ReadNumber(
            options,
            "descriptionPadding",
            DEFAULTS.descriptionPadding
        ),
        rowGap = ReadNumber(options, "rowGap", tonumber(theme and theme:Get("layout.rowGap")) or DEFAULTS.rowGap),
        rowHeight = ReadNumber(options, "rowHeight", tonumber(themeRowHeight) or DEFAULTS.rowHeight),
        columnGap = ReadNumber(options, "columnGap", DEFAULTS.columnGap),
        minimumColumnWidth = ReadNumber(
            options,
            "minimumColumnWidth",
            DEFAULTS.minimumColumnWidth
        ),
        sliderMinimumColumnWidth = ReadNumber(
            options,
            "sliderMinimumColumnWidth",
            DEFAULTS.sliderMinimumColumnWidth
        ),
        bottomPadding = ReadNumber(options, "bottomPadding", DEFAULTS.bottomPadding),
        scrollbarReserve = ReadNumber(
            options,
            "scrollbarReserve",
            DEFAULTS.scrollbarReserve
        ),
    }
end

local function PrepareControlOptions(page, entry)
    local source = entry.options
    local prepared = CopyTable(source)
    if entry.kind == "checkbox" or (entry.kind == "button" and entry.row.kind == "action") then
        if prepared.wordWrap == nil then prepared.wordWrap = true end
        if prepared.nonSpaceWrap == nil then prepared.nonSpaceWrap = true end
    end
    entry.getValue = source.getValue
    if entry.getValue == nil and type(source.value) == "function" then
        entry.getValue = source.value
    end
    entry.getTextToken = source.getTextToken
    if entry.getTextToken then prepared.textToken = ResolvePageOptionValue(entry.getTextToken, page, entry, "build", GetContextData(page.context)) end
    entry.getText = source.getText
    if entry.getText == nil and type(source.text) == "function" then
        entry.getText = source.text
    end
    entry.getEnabled = source.getEnabled
    if entry.getEnabled == nil and type(source.enabled) == "function" then
        entry.getEnabled = source.enabled
    end
    entry.getVisible = source.getVisible
    if entry.getVisible == nil and type(source.visible) == "function" then
        entry.getVisible = source.visible
    end

    if entry.getValue then
        prepared.value = ResolvePageOptionValue(entry.getValue, page, entry, "build", GetContextData(page.context))
    end
    if entry.getText then
        prepared.text = ResolvePageOptionValue(entry.getText, page, entry, "build", GetContextData(page.context))
    end
    if entry.getEnabled then
        prepared.enabled = ResolvePageOptionValue(
            entry.getEnabled,
            page,
            entry,
            "build",
            GetContextData(page.context)
        ) and true or false
    end
    if entry.getVisible then
        prepared.hidden = not ResolvePageOptionValue(
            entry.getVisible,
            page,
            entry,
            "build",
            GetContextData(page.context)
        )
    elseif source.visible ~= nil then
        prepared.hidden = not source.visible
    end
    if prepared.onAction == nil and type(source.onClick) == "function" then
        prepared.onAction = source.onClick
    end
    if prepared.onChange == nil and type(source.onValueChanged) == "function" then
        prepared.onChange = source.onValueChanged
    end
    prepared.getValue = nil
    prepared.getText = nil
    prepared.getEnabled = nil
    prepared.getVisible = nil
    prepared.visible = nil
    -- Rows provide the shared card/background.  Switches and sliders should
    -- read as settings inside that row, not as a second full-width button.
    if entry.kind == "checkbox" or entry.kind == "slider" or entry.kind == "dropdown"
        or entry.kind == "color" then
        if prepared.backgroundToken == nil then
            prepared.backgroundToken = "color.transparent"
        end
        if prepared.noBorder == nil then
            prepared.noBorder = true
        end
        if (entry.kind == "dropdown" or entry.kind == "color")
            and prepared.hoverBackgroundToken == nil then
            prepared.hoverBackgroundToken = "color.transparent"
        end
    end
    if entry.kind == "checkbox" and prepared.wordWrap == nil then prepared.wordWrap = true end
    if entry.kind == "checkbox" and prepared.toggleInset == nil then prepared.toggleInset = 0 end
    if entry.kind == "checkbox" and prepared.toggleSide == nil then
        prepared.toggleSide = prepared.variant == "square" and "left" or "right"
    end
    if entry.row and entry.row.kind == "field" then
        entry.getFieldLabel = source.getFieldLabel
        local fieldLabel = source.fieldLabel
        if entry.getFieldLabel == nil and type(fieldLabel) == "function" then
            entry.getFieldLabel = fieldLabel
        end
        if fieldLabel == nil and entry.kind ~= "button" then
            fieldLabel = prepared.text
            if entry.getFieldLabel == nil and entry.getText then
                entry.getFieldLabel = entry.getText
                entry.getText = nil
            end
        end
        entry.fieldLabelText = ResolvePageOptionValue(
            entry.getFieldLabel or fieldLabel,
            page,
            entry,
            "build",
            GetContextData(page.context)
        ) or ""
        if entry.kind == "dropdown" then
            prepared.text = ""
            prepared.controlOnly = true
            prepared.controlHeight = tonumber(source.controlHeight)
                or tonumber(entry.row.options.controlHeight)
                or DEFAULTS.fieldControlHeight
        end
        prepared.fieldLabel = nil
        prepared.getFieldLabel = nil
    end
    return prepared
end

local function UntrackContextObject(context, object)
    if type(context) ~= "table" or not object then return false end
    local removed = false
    if type(context.objectIndex) == "table" and context.objectIndex[object] then
        context.objectIndex[object] = nil
        removed = true
    end
    local objects = context.objects
    if type(objects) == "table" then
        local index = #objects
        while index >= 1 do
            if objects[index] == object then
                table.remove(objects, index)
                removed = true
            end
            index = index - 1
        end
    end
    if type(object) == "table" and object.pageContext == context then
        object.pageContext = nil
    end
    return removed
end

local function ReleaseContextObject(context, object)
    if not object then return false end
    if type(object) == "table" and type(object.Release) == "function" then
        pcall(object.Release, object)
    end
    UntrackContextObject(context, object)
    return true
end

local function CapturePoints(region)
    if not region or type(region.GetNumPoints) ~= "function"
        or type(region.GetPoint) ~= "function" then
        return nil
    end
    local countOk, count = pcall(region.GetNumPoints, region)
    if not countOk then return nil end
    local points = {}
    local index = 1
    while index <= (tonumber(count) or 0) do
        local pointOk, point, relativeTo, relativePoint, x, y = pcall(region.GetPoint, region, index)
        if not pointOk then return nil end
        points[index] = { point, relativeTo, relativePoint, x, y }
        index = index + 1
    end
    return points
end

local function RestorePoints(region, points)
    if not region or not points then return false end
    local restored = pcall(function()
        region:ClearAllPoints()
        local index = 1
        while index <= #points do
            local point = points[index]
            region:SetPoint(point[1], point[2], point[3], point[4], point[5])
            index = index + 1
        end
    end)
    return restored
end

local function DryRunNoop() end
local function DryRunZero() return 0 end
local function DryRunTrue() return true end
local function DryRunEmpty() return "" end

local DRY_RUN_NUMBER_METHODS = {
    GetWidth = true,
    GetHeight = true,
    GetStringWidth = true,
    GetUnboundedStringWidth = true,
    GetStringHeight = true,
    GetNumPoints = true,
    GetVerticalScroll = true,
    GetVerticalScrollRange = true,
    GetFrameLevel = true,
    GetScale = true,
    GetEffectiveScale = true,
}

local DUMMY_FRAME = setmetatable({}, {
    __index = function(_, key)
        if DRY_RUN_NUMBER_METHODS[key] then return DryRunZero end
        if key == "IsShown" or key == "IsVisible" then return DryRunTrue end
        if key == "GetText" then return DryRunEmpty end
        return DryRunNoop
    end,
})

local DryRunComponentMethods = {
    GetText = function(self) return self.text or "" end,
    SetText = function(self, value) self.text = value or "" end,
    GetValue = function(self) return self.value end,
    SetValue = function(self, value) self.value = value end,
    SetVisible = function(self, visible) self.visible = visible and true or false end,
    IsVisible = function(self) return self.visible ~= false end,
    SetEnabled = function(self, enabled) self.enabled = enabled and true or false end,
    IsEnabled = function(self) return self.enabled ~= false end,
    SetSelected = function(self, selected) self.selected = selected and true or false end,
    GetContent = function() return DUMMY_FRAME end,
    FitTextHeight = function() return 20 end,
    GetControl = function() return DUMMY_FRAME end,
}

local DRY_RUN_COMPONENT_META = {
    __index = function(_, key)
        return DryRunComponentMethods[key] or DryRunNoop
    end,
}

local function NewDryRunComponent(kind, options)
    options = type(options) == "table" and options or {}
    return setmetatable({
        kind = kind,
        options = options,
        frame = DUMMY_FRAME,
        label = DUMMY_FRAME,
        checkBox = DUMMY_FRAME,
        checkBorder = DUMMY_FRAME,
        text = options.text or "",
        value = options.value,
        visible = not options.hidden,
        enabled = options.enabled ~= false,
    }, DRY_RUN_COMPONENT_META)
end

local function NewDryRunContext(pageId)
    local root = NewDryRunComponent("frame", { id = pageId })
    return {
        id = pageId,
        dryRun = true,
        objects = {},
        objectIndex = {},
        GetRoot = function() return root end,
        SetRoot = function() return true end,
        Create = function(_, kind, _, opts) return NewDryRunComponent(kind, opts) end,
        Track = function(_, obj) return obj end,
        GetData = function() return nil end,
        OnBuildRollback = function() return true end,
        ApplyLayout = function() return true end,
    }
end

function SettingsBuilder:New(system)
    if type(system) ~= "table" or type(system.components) ~= "table"
        or type(system.layout) ~= "table" then
        return nil, "settings builder requires a UI system"
    end

    local instance = setmetatable({}, self)
    instance.system = system
    instance.pages = setmetatable({}, { __mode = "k" })
    instance.created = 0
    instance.reused = 0
    return instance
end

function SettingsBuilder:GetPage(context)
    return self.pages[context]
end

function SettingsBuilder:CreatePage(context, options)
    if type(context) ~= "table" or type(context.GetRoot) ~= "function"
        or type(context.Create) ~= "function" then
        return nil, "settings page requires a PageRegistry context"
    end

    local existing = self.pages[context]
    if not existing and context.__rsSettingsPage
        and context.__rsSettingsPage.system == self.system then
        existing = context.__rsSettingsPage
        self.pages[context] = existing
    end
    if existing then
        existing:UpdateOptions(options)
        self.reused = self.reused + 1
        return existing
    end

    local page, reason = Page:New(self, context, options)
    if not page then
        return nil, reason
    end
    self.pages[context] = page
    context.__rsSettingsPage = page
    self.created = self.created + 1
    if type(context.OnBuildRollback) ~= "function"
        or not context:OnBuildRollback(function()
            self:_DiscardPage(context, page)
        end) then
        self:_DiscardPage(context, page)
        return nil, "settings page context cannot register build rollback"
    end
    local installed, installReason = page:_InstallLifecycle()
    if not installed then
        self:_DiscardPage(context, page)
        return nil, installReason
    end
    return page
end

function SettingsBuilder:_DiscardPage(context, page)
    if not page or page.discarded then
        return false
    end

    page:ReleasePopovers()
    page:_UninstallLifecycle()
    if self.pages[context] == page then
        self.pages[context] = nil
    end
    if context.__rsSettingsPage == page then
        context.__rsSettingsPage = nil
    end
    page.discarded = true
    self.created = math.max(0, self.created - 1)
    return true
end

function SettingsBuilder:GetDiagnostics()
    return {
        created = self.created,
        reused = self.reused,
    }
end

function SettingsBuilder:CreateDryRunPage(context, options)
    if type(context) ~= "table" then return nil, "dry-run context is required" end
    options = CopyTable(options)
    local width = ReadNumber(options, "width", DEFAULTS.width)
    local height = ReadNumber(options, "height", DEFAULTS.height)
    local metrics = BuildMetrics(self.system, options)
    local root = context.GetRoot and context:GetRoot() or NewDryRunComponent("frame")
    local scroll = NewDryRunComponent("scroll")
    local page = setmetatable({
        manager = self,
        system = self.system,
        context = context,
        options = options,
        metrics = metrics,
        dryRun = true,
        root = root,
        scroll = scroll,
        content = DUMMY_FRAME,
        blocks = {},
        controls = {},
        controlEntries = {},
        controlOrder = {},
        popovers = {},
        popoverOrder = {},
        refreshEntries = {},
        rows = {},
        sections = {},
        tabsByKey = {},
        tabOrder = {},
        tabs = nil,
        currentTab = nil,
        currentSection = nil,
        availableWidth = width,
        availableHeight = height,
        contentWidth = math.max(1, width - metrics.scrollbarReserve),
        contentHeight = 1,
        cursor = 0,
        finished = false,
        finishCount = 0,
        layoutCount = 0,
        refreshCount = 0,
        maximumEffectiveColumns = 0,
        lastRefreshError = nil,
    }, Page)
    local description = options.description
    if type(description) == "table" then
        page:Description(description.text or "", description)
    elseif description ~= nil then
        page:Description(description)
    end
    context.dryRunPage = page
    return page
end

function Page:New(manager, context, options)
    options = CopyTable(options)
    local root = context:GetRoot()
    if not root then
        return nil, "settings page root is unavailable"
    end

    local width = ReadNumber(options, "width", DEFAULTS.width)
    local height = ReadNumber(options, "height", DEFAULTS.height)
    local metrics = BuildMetrics(manager.system, options)
    local scroll, reason = context:Create("scroll", root, {
        width = width,
        height = height,
        contentWidth = math.max(1, width - metrics.scrollbarReserve),
        contentHeight = 1,
        backgroundToken = "color.workspace.background",
        noBorder = true,
        clipChildren = true,
    })
    if not scroll then
        return nil, reason or "settings page scroll is unavailable"
    end

    local rootFrame = GetFrame(root)
    local scrollFrame = GetFrame(scroll)
    if scrollFrame.ClearAllPoints then scrollFrame:ClearAllPoints() end
    if scrollFrame.SetPoint then
        scrollFrame:SetPoint("TOPLEFT", rootFrame, "TOPLEFT", 0, 0)
        scrollFrame:SetPoint("BOTTOMRIGHT", rootFrame, "BOTTOMRIGHT", 0, 0)
    end

    local instance = setmetatable({
        manager = manager,
        system = manager.system,
        context = context,
        options = options,
        metrics = metrics,
        root = root,
        scroll = scroll,
        content = scroll:GetContent(),
        blocks = {},
        controls = {},
        controlEntries = {},
        controlOrder = {},
        popovers = {},
        popoverOrder = {},
        refreshEntries = {},
        rows = {},
        sections = {},
        tabsByKey = {},
        tabOrder = {},
        tabs = nil,
        currentTab = nil,
        currentSection = nil,
        availableWidth = width,
        availableHeight = height,
        contentWidth = math.max(1, width - metrics.scrollbarReserve),
        contentHeight = 1,
        cursor = 0,
        finished = false,
        finishCount = 0,
        layoutCount = 0,
        refreshCount = 0,
        maximumEffectiveColumns = 0,
        lastRefreshError = nil,
    }, self)

    local description = options.description
    if type(description) == "table" then
        instance:Description(description.text or "", description)
    elseif description ~= nil then
        instance:Description(description)
    end
    return instance
end

function Page:UpdateOptions(options)
    if type(options) ~= "table" then
        return false
    end
    if options.onRefresh ~= nil then
        self.options.onRefresh = options.onRefresh
    end
    if options.responsive ~= nil then
        self.options.responsive = options.responsive
    end
    return true
end

function Page:_InstallLifecycle()
    if self.options.autoRefresh == false then
        return true
    end
    local definition = self.context.definition
    if type(definition) ~= "table" then
        return nil, "settings page definition is unavailable"
    end
    if definition.__rsSettingsPageLifecycle then
        return nil, "settings page lifecycle is already owned"
    end

    local previousOnShow = definition.onShow
    local previousOnHide = definition.onHide
    local previousOnRefresh = definition.onRefresh
    local previousOnThemeChanged = definition.onThemeChanged
    local installedOnShow = function(context, data)
        local ok, reason = InvokeLifecycleCallback(
            "settings page onShow failed", previousOnShow, context, data
        )
        if not ok then return false, reason end
        return self:Refresh("show", data)
    end
    local installedOnHide = function(context)
        self:DeactivateActions()
        self:ClosePopovers()
        return InvokeLifecycleCallback("settings page onHide failed", previousOnHide, context)
    end
    local installedOnRefresh = function(context, reason)
        local ok, callbackReason = InvokeLifecycleCallback(
            "settings page onRefresh failed", previousOnRefresh, context, reason
        )
        if not ok then return false, callbackReason end
        return self:Refresh(reason or "refresh", GetContextData(context))
    end
    local installedOnThemeChanged = function(context, changed, theme)
        local ok, reason = InvokeLifecycleCallback(
            "settings page onThemeChanged failed", previousOnThemeChanged,
            context, changed, theme
        )
        if not ok then return false, reason end
        self:RefreshLayout()
        return true
    end
    self.lifecycle = {
        definition = definition,
        previousOnShow = previousOnShow,
        previousOnHide = previousOnHide,
        previousOnRefresh = previousOnRefresh,
        previousOnThemeChanged = previousOnThemeChanged,
        installedOnShow = installedOnShow,
        installedOnHide = installedOnHide,
        installedOnRefresh = installedOnRefresh,
        installedOnThemeChanged = installedOnThemeChanged,
    }
    definition.__rsSettingsPageLifecycle = self
    definition.onShow = installedOnShow
    definition.onHide = installedOnHide
    definition.onRefresh = installedOnRefresh
    definition.onThemeChanged = installedOnThemeChanged
    return true
end

function Page:_UninstallLifecycle()
    local lifecycle = self.lifecycle
    if not lifecycle then
        return false
    end

    local definition = lifecycle.definition
    if definition.__rsSettingsPageLifecycle == self then
        definition.__rsSettingsPageLifecycle = nil
        if definition.onShow == lifecycle.installedOnShow then
            definition.onShow = lifecycle.previousOnShow
        end
        if definition.onHide == lifecycle.installedOnHide then
            definition.onHide = lifecycle.previousOnHide
        end
        if definition.onRefresh == lifecycle.installedOnRefresh then
            definition.onRefresh = lifecycle.previousOnRefresh
        end
        if definition.onThemeChanged == lifecycle.installedOnThemeChanged then
            definition.onThemeChanged = lifecycle.previousOnThemeChanged
        end
    end
    self.lifecycle = nil
    return true
end

function Page:GetRoot()
    return self.root
end

function Page:GetScroll()
    return self.scroll
end

function Page:GetContent()
    return self.content
end

function Page:GetControl(key)
    return self.controls[key]
end

function Page:GetPopover(key)
    return self.popovers[key]
end

function Page:ShowKeyBindingDialog(options)
    self:ClosePopovers()
    if not self.keyBindingDialog then self.keyBindingDialog = UI.KeyBindingDialog:New(self) end
    return self.keyBindingDialog:Show(options)
end

function Page:ShowTextDialog(options)
    self:ClosePopovers()
    if not self.textDialog then
        if not UI.TextDialog then return nil, "TextDialog is unavailable" end
        self.textDialog = UI.TextDialog:New(self)
    end
    return self.textDialog:Show(options)
end

function Page:ClosePopovers()
    if self.keyBindingDialog then self.keyBindingDialog:Hide() end
    if self.textDialog then self.textDialog:Hide() end
    local index = 1
    while index <= #self.popoverOrder do
        self.popoverOrder[index]:Hide()
        index = index + 1
    end
    return true
end

function Page:ReleasePopovers()
    if self.keyBindingDialog then self.keyBindingDialog:Release(); self.keyBindingDialog = nil end
    if self.textDialog then self.textDialog:Release(); self.textDialog = nil end
    local index = #self.popoverOrder
    while index >= 1 do
        self.popoverOrder[index]:Release()
        index = index - 1
    end
    self.popovers = {}
    self.popoverOrder = {}
    return true
end

function Page:_AppendBlock(kind, component, gapBefore, owner)
    local block = {
        kind = kind,
        component = component,
        gapBefore = tonumber(gapBefore) or self.metrics.spacing,
        owner = owner,
        tab = self.currentTab or (owner and owner.tab) or nil,
    }
    self.blocks[#self.blocks + 1] = block
    return block
end

function Page:Description(text, options)
    options = CopyTable(options)
    local getText = options.getText
    if getText == nil and type(text) == "function" then
        getText = text
    end
    local resolvedText = ResolvePageOptionValue(getText or text, self, nil, "build", GetContextData(self.context))
    local component, reason = self.context:Create("label", self.content, {
        text = resolvedText or "",
        width = self.contentWidth - self.metrics.padding * 2,
        height = self.metrics.descriptionMinHeight,
        minHeight = options.minHeight or self.metrics.descriptionMinHeight,
        heightPadding = options.heightPadding or self.metrics.descriptionPadding,
        autoHeight = true,
        labelFill = true,
        justifyH = options.justifyH or "LEFT",
        justifyV = options.justifyV or "TOP",
        wordWrap = options.wordWrap ~= false,
        nonSpaceWrap = options.nonSpaceWrap,
        fontKey = options.fontKey or "body",
        textToken = options.textToken or "color.text.muted",
    })
    if not component then
        return nil, reason
    end
    local block = self:_AppendBlock(
        "description",
        component,
        options.gapBefore or self.metrics.spacing,
        self.currentSection
    )
    block.minHeight = options.minHeight or self.metrics.descriptionMinHeight
    block.hideWhenEmpty = options.hideWhenEmpty == true
    block.heightPadding = options.heightPadding or self.metrics.descriptionPadding
    block.text = resolvedText
    if getText and not self.dryRun then
        self.refreshEntries[#self.refreshEntries + 1] = {
            component = component,
            getText = getText,
        }
    end
    return component
end

function Page:Section(title, options)
    options = CopyTable(options)
    local section = setmetatable({
        page = self,
        title = title,
        options = options,
        rows = {},
        tab = self.currentTab,
    }, Section)
    self.sections[#self.sections + 1] = section
    self.currentSection = section

    if title ~= nil and title ~= "" then
        local component, reason = self.context:Create("label", self.content, {
            text = title,
            width = self.contentWidth - self.metrics.padding * 2,
            height = options.height or self.metrics.sectionHeaderHeight,
            labelFill = true,
            justifyH = options.justifyH or "LEFT",
            justifyV = options.justifyV or "MIDDLE",
            fontKey = options.fontKey or "heading",
            textToken = options.textToken or "color.accent",
            textInsets = options.textInsets or { 0, 0, 0, 0 },
            backgroundToken = options.backgroundToken or "color.transparent",
            borderToken = options.borderToken or "color.transparent",
            decorated = options.decorated and true or false,
            accentEdge = options.accentEdge and true or false,
        })
        if not component then
            return nil, reason
        end
        section.header = component
        local gap = #self.blocks == 0 and 0 or (options.gapBefore or self.metrics.sectionGap)
        local block = self:_AppendBlock("section", component, gap, section)
        block.height = options.height or self.metrics.sectionHeaderHeight
        section.block = block
    end
    if options.description ~= nil then
        section:Description(options.description, options.descriptionOptions)
    end
    return section
end

local function IsValidKey(key)
    return type(key) == "string" and key ~= ""
end

function Page:Tabs(key, options)
    if not IsValidKey(key) then
        return nil, "settings tabs key is required"
    end
    if self.tabs then
        if self.tabs.key == key then
            return nil, "settings tabs key is already registered"
        end
        return nil, "settings page supports one tabs collection"
    end

    options = CopyTable(options)
    local height = ReadNumber(options, "height", DEFAULTS.tabBarHeight)
    local component, reason = self.context:Create("group", self.root, {
        width = self.availableWidth,
        height = height,
        backgroundToken = options.backgroundToken or "color.transparent",
        borderToken = options.borderToken or "color.transparent",
    })
    if not component then
        return nil, reason
    end

    local tabs = setmetatable({
        page = self,
        key = key,
        options = options,
        component = component,
        items = {},
        order = {},
        selected = nil,
        invalidDefault = nil,
        height = height,
    }, Tabs)
    self.tabs = tabs
    self.tabsByKey[key] = tabs
    self.tabOrder[#self.tabOrder + 1] = tabs
    self.currentTab = nil
    self.currentSection = nil
    self:_AnchorViewport()
    return tabs
end

function Page:_AnchorViewport()
    local rootFrame = GetFrame(self.root)
    local scrollFrame = GetFrame(self.scroll)
    if scrollFrame.ClearAllPoints then scrollFrame:ClearAllPoints() end

    local tabs = self.tabs
    if tabs then
        local tabFrame = GetFrame(tabs.component)
        if tabFrame.ClearAllPoints then tabFrame:ClearAllPoints() end
        if tabFrame.SetPoint then
            tabFrame:SetPoint("TOPLEFT", rootFrame, "TOPLEFT", 0, 0)
            tabFrame:SetPoint("TOPRIGHT", rootFrame, "TOPRIGHT", 0, 0)
        end
        if scrollFrame.SetPoint then
            scrollFrame:SetPoint(
                "TOPLEFT",
                rootFrame,
                "TOPLEFT",
                0,
                -(tabs.height + ReadNumber(tabs.options, "gapAfter", DEFAULTS.tabBarGap))
            )
            scrollFrame:SetPoint("BOTTOMRIGHT", rootFrame, "BOTTOMRIGHT", 0, self.footerHeight or 0)
        end
    elseif scrollFrame.SetPoint then
        scrollFrame:SetPoint("TOPLEFT", rootFrame, "TOPLEFT", 0, 0)
        scrollFrame:SetPoint("BOTTOMRIGHT", rootFrame, "BOTTOMRIGHT", 0, self.footerHeight or 0)
    end
end

function Tabs:Tab(key, options)
    if not IsValidKey(key) then
        return nil, "settings tab key is required"
    end
    if self.items[key] then
        return nil, "settings tab key is already registered"
    end

    options = CopyTable(options)
    local title = options.title
    if title == nil or title == "" then
        return nil, "settings tab title is required"
    end

    local tab = setmetatable({
        tabs = self,
        page = self.page,
        key = key,
        title = title,
        options = options,
        currentSection = nil,
    }, Tab)
    local buttonOptions = CopyTable(options.buttonOptions)
    buttonOptions.text = title
    buttonOptions.variant = buttonOptions.variant or "tab"
    if buttonOptions.noBorder == nil then buttonOptions.noBorder = true end
    buttonOptions.height = buttonOptions.height or self.height
    buttonOptions.onAction = function()
        self:Select(key)
    end
    local button, reason = self.page.context:Create("button", self.component, buttonOptions)
    if not button then
        return nil, reason
    end
    tab.button = button
    self.items[key] = tab
    self.order[#self.order + 1] = tab
    if not self.selected then
        self.selected = key
    end
    return tab
end

function Tabs:_ReadRequested(reason, data)
    local getValue = self.options.getValue
    if type(getValue) == "function" then
        return ResolvePageOptionValue(getValue, self.page, self, reason, data)
    end
    return self.options.default
end

function Tabs:_ResolveInitial(reason, data)
    if #self.order == 0 then
        self.selected = nil
        return nil
    end
    local requested = self:_ReadRequested(reason or "build", data)
    if requested ~= nil and self.items[requested] then
        self.selected = requested
        self.invalidDefault = nil
    elseif requested ~= nil then
        self.invalidDefault = requested
        if not self.items[self.selected] then
            self.selected = self.order[1].key
        end
    elseif not self.items[self.selected] then
        self.selected = self.order[1].key
    end
    return self.selected
end

function Tabs:GetSelected()
    return self.selected
end

function Tabs:Select(key, silent, deferLayout)
    local tab = self.items[key]
    if not tab then
        return false, "settings tab is not registered"
    end
    if self.page.dryRun then
        self.selected = key
        return true
    end
    local previous = self.selected
    if previous and previous ~= key then self.page:DeactivateActions() end
    self.selected = key

    local index = 1
    while index <= #self.order do
        local item = self.order[index]
        item.button:SetSelected(item.key == key)
        index = index + 1
    end

    if self.page.finished and not deferLayout then
        self.page:RefreshLayout()
    end
    if not silent and previous ~= key and type(self.options.onChange) == "function" then
        self.options.onChange(self, key, previous)
    end
    local shell = self.page.system.mainWindow
    if shell and shell.currentPage == self.page.context.id and shell:IsOpen() then
        shell:BindPageActions(self.page)
    end
    return true
end

function Tabs:_Layout(width)
    local count = #self.order
    local frame = GetFrame(self.component)
    if frame.SetSize then frame:SetSize(width, self.height) end
    if count == 0 then return true end

    local gap = ReadNumber(self.options, "tabGap", DEFAULTS.tabGap)
    local padding = ReadNumber(self.options, "padding", self.page.metrics.padding)
    local x = padding
    local index = 1
    while index <= count do
        local button = self.order[index].button
        local buttonFrame = GetFrame(button)
        local label = button.label
        local textWidth = label and label.GetStringWidth and label:GetStringWidth() or 60
        local buttonWidth = math.max(1, textWidth + 30)
        if buttonFrame.SetSize then buttonFrame:SetSize(buttonWidth, self.height) end
        if buttonFrame.ClearAllPoints then buttonFrame:ClearAllPoints() end
        if buttonFrame.SetPoint then
            buttonFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", x, 0)
        end
        x = x + buttonWidth + gap
        index = index + 1
    end
    return true
end

function Tab:_Invoke(method, ...)
    local page = self.page
    local previousTab = page.currentTab
    local previousSection = page.currentSection
    page.currentTab = self
    page.currentSection = self.currentSection
    local first, second, third = method(page, ...)
    if page.currentSection and page.currentSection.tab == self then
        self.currentSection = page.currentSection
    end
    page.currentTab = previousTab
    page.currentSection = previousSection
    return first, second, third
end

function Tab:Section(title, options)
    return self:_Invoke(Page.Section, title, options)
end

function Tab:Description(text, options)
    return self:_Invoke(Page.Description, text, options)
end

function Tab:Row(options)
    return self:_Invoke(Page.Row, options)
end

function Tab:DualRow(options)
    return self:_Invoke(Page.DualRow, options)
end

function Tab:TripleRow(options)
    return self:_Invoke(Page.TripleRow, options)
end

function Tab:QuadRow(options)
    return self:_Invoke(Page.QuadRow, options)
end

function Tab:ToggleRow(options)
    return self:_Invoke(Page.ToggleRow, options)
end

function Tab:ActionRow(options)
    return self:_Invoke(Page.ActionRow, options)
end

function Tab:GridRow(columns, options)
    return self:_Invoke(Page.GridRow, columns, options)
end

function Tab:FieldRow(options)
    return self:_Invoke(Page.FieldRow, options)
end

function Page:_CreateRow(section, columns, kind, options, parent)
    options = CopyTable(options)
    if options.toggleColumns == nil then
        options.toggleColumns = self.options.toggleColumns
    end
    if options.preserveColumns == nil then
        options.preserveColumns = true
    end
    local rowHeight = options.rowHeight or options.height
        or (kind == "field" and DEFAULTS.fieldRowHeight)
        or self.metrics.rowHeight
    local backgroundToken = options.backgroundToken
        or (kind == "field" and "color.transparent")
        or "color.row.background"
    local borderToken = options.borderToken
        or (kind == "field" and "color.transparent")
        or "color.row.border"
    local component, reason = self.context:Create("group", parent or self.content, {
        width = self.contentWidth - self.metrics.padding * 2,
        height = rowHeight,
        backgroundToken = backgroundToken,
        borderToken = borderToken,
        noBackdrop = kind == "field",
        noBorder = kind == "field",
    })
    if not component then
        return nil, reason
    end

    local row = setmetatable({
        page = self,
        section = section,
        component = component,
        kind = kind or "row",
        options = options,
        requestedColumns = math.max(1, tonumber(columns) or 1),
        effectiveColumns = 0,
        records = {},
        visibleItems = {},
        layoutCount = 0,
        itemHeight = rowHeight,
        height = rowHeight,
    }, Row)
    self.rows[#self.rows + 1] = row
    if section then section.rows[#section.rows + 1] = row end
    -- Footer rows share controls and refresh ownership, but are not scroll blocks.
    row.block = parent and { gapBefore = 0 } or self:_AppendBlock(
        "row", component, options.gapBefore or self.metrics.rowGap, section
    )
    row.block.row = row

    if kind == "action" and type(options.buttons) == "table" then
        local index = 1
        while index <= #options.buttons do
            local buttonOptions = CopyTable(options.buttons[index])
            local key = buttonOptions.key or ("action" .. index)
            buttonOptions.key = nil
            row:Add("button", key, buttonOptions)
            index = index + 1
        end
    end
    return row
end

function Page:Row(options)
    return self:_CreateRow(self.currentSection, 2, "row", options)
end

function Page:DualRow(options)
    return self:_CreateRow(self.currentSection, 2, "dual", options)
end

function Page:TripleRow(options)
    return self:_CreateRow(self.currentSection, 3, "triple", options)
end

function Page:QuadRow(options)
    return self:_CreateRow(self.currentSection, 4, "quad", options)
end

function Page:ToggleRow(options)
    options = CopyTable(options)
    if options.minimumColumnWidth == nil then
        options.minimumColumnWidth = DEFAULTS.toggleMinimumColumnWidth
    end
    if options.columnGap == nil then
        options.columnGap = DEFAULTS.toggleColumnGap
    end
    return self:_CreateRow(
        self.currentSection,
        options.columns or DEFAULTS.toggleColumns,
        "toggle",
        options
    )
end

function Page:ActionRow(options)
    local columns = type(options) == "table" and options.columns or nil
    return self:_CreateRow(self.currentSection, columns or DEFAULTS.actionColumns, "action", options)
end

-- One persistent action row outside the scrolling content. Its optional short
-- description and responsive button wrapping both contribute to viewport reserve.
function Page:FooterActions(options)
    if self.footer then return nil, "settings footer is already registered" end
    options = CopyTable(options)
    local row, reason = self:_CreateRow(nil, options.columns or DEFAULTS.actionColumns, "action", options, self.root)
    if not row then return nil, reason end
    if options.description then
        local getText = type(options.description) == "function" and options.description or nil
        local label, labelReason = self.context:Create("label", self.root, {
            text = ResolvePageOptionValue(options.description, self, nil, "build", GetContextData(self.context)),
            height = 20, wordWrap = true, labelFill = true, justifyH = "LEFT",
            textToken = options.descriptionTextToken or "color.text.muted", noBorder = true,
        })
        if not label then return nil, labelReason end
        row.description = label
        if getText and not self.dryRun then
            self.refreshEntries[#self.refreshEntries + 1] = { component = label, getText = getText }
        end
    end
    self.footer = row
    return row
end

function Page:GridRow(columns, options)
    return self:_CreateRow(self.currentSection, columns or 1, "grid", options)
end

function Page:FieldRow(options)
    options = CopyTable(options)
    if options.minimumColumnWidth == nil then
        options.minimumColumnWidth = DEFAULTS.fieldMinimumColumnWidth
    end
    return self:_CreateRow(
        self.currentSection,
        options.columns or DEFAULTS.fieldColumns,
        "field",
        options
    )
end

function Section:Description(text, options)
    local previous = self.page.currentSection
    self.page.currentSection = self
    local component, reason = self.page:Description(text, options)
    self.page.currentSection = previous or self
    return component, reason
end

function Section:Row(options)
    return self.page:_CreateRow(self, 2, "row", options)
end

function Section:DualRow(options)
    return self.page:_CreateRow(self, 2, "dual", options)
end

function Section:TripleRow(options)
    return self.page:_CreateRow(self, 3, "triple", options)
end

function Section:QuadRow(options)
    return self.page:_CreateRow(self, 4, "quad", options)
end

function Section:ToggleRow(options)
    options = CopyTable(options)
    if options.minimumColumnWidth == nil then
        options.minimumColumnWidth = DEFAULTS.toggleMinimumColumnWidth
    end
    if options.columnGap == nil then
        options.columnGap = DEFAULTS.toggleColumnGap
    end
    return self.page:_CreateRow(
        self,
        options.columns or DEFAULTS.toggleColumns,
        "toggle",
        options
    )
end

function Section:ActionRow(options)
    local columns = type(options) == "table" and options.columns or nil
    return self.page:_CreateRow(self, columns or DEFAULTS.actionColumns, "action", options)
end

function Section:GridRow(columns, options)
    return self.page:_CreateRow(self, columns or 1, "grid", options)
end

function Section:FieldRow(options)
    options = CopyTable(options)
    if options.minimumColumnWidth == nil then
        options.minimumColumnWidth = DEFAULTS.fieldMinimumColumnWidth
    end
    return self.page:_CreateRow(
        self,
        options.columns or DEFAULTS.fieldColumns,
        "field",
        options
    )
end

function Row:Add(kind, key, options)
    kind = NormalizeKind(kind)
    if not kind or not CONTROL_KINDS[kind] then
        return self, nil, "unknown settings control kind"
    end
    if self.kind == "field" and kind ~= "dropdown" and kind ~= "button" then
        return self, nil, "field rows support dropdown and button controls"
    end
    if self.kind == "toggle" and kind ~= "checkbox" then
        return self, nil, "toggle rows support checkbox controls"
    end
    local mixedToolbar = self.kind == "action" and self.options.allowMixed == true
        and (kind == "button" or kind == "checkbox" or kind == "editbox")
        and (not self.controlKind or self.controlKind == "button" or self.controlKind == "checkbox"
            or self.controlKind == "editbox" or self.controlKind == "mixed")
    local mixedActions = mixedToolbar or self.kind == "grid" and self.options.allowMixed == true
        and (kind == "button" or kind == "checkbox")
        and (not self.controlKind or self.controlKind == "button"
            or self.controlKind == "checkbox" or self.controlKind == "mixed")
    if self.controlKind and self.controlKind ~= kind and not mixedActions then
        return self, nil, "settings rows cannot mix control types"
    end
    if mixedActions and self.controlKind and self.controlKind ~= kind then
        self.controlKind = "mixed"
    end
    if type(key) ~= "string" or key == "" then
        return self, nil, "settings control key is required"
    end

    local existing = self.page.controlEntries[key]
    if existing then
        return self, existing.component, "settings control key is already registered"
    end
    self.controlKind = self.controlKind or kind
    if kind == "slider" then
        if not self.options.rowHeight then self.itemHeight = math.max(self.itemHeight, 40) end
        self.options.minimumColumnWidth = math.max(
            tonumber(self.options.minimumColumnWidth) or 0,
            self.page.metrics.sliderMinimumColumnWidth
        )
    end

    local entry = {
        key = key,
        kind = kind,
        options = CopyTable(options),
        row = self,
        visible = true,
    }
    if kind == "checkbox" and not self.options.rowHeight then
        self.itemHeight = math.max(self.itemHeight or 0,
            tonumber(self.page.system.theme:Get("layout.toggleHeight")) or 28)
        if self.controlKind == "checkbox" then
            self.itemHeight = tonumber(self.page.system.theme:Get("layout.toggleHeight")) or 28
        end
        if self.options.gapBefore == nil then self.block.gapBefore = self.page.metrics.rowGap end
    end
    local prepared = PrepareControlOptions(self.page, entry)
    local controlParent = self.component
    if self.kind == "field" then
        local wrapper, wrapperReason = self.page.context:Create("group", self.component, {
            height = self.height,
            backgroundToken = "color.transparent",
            borderToken = "color.transparent",
            noBackdrop = true,
            noBorder = true,
            clipChildren = true,
        })
        if not wrapper then return self, nil, wrapperReason end
        local fieldLabel, labelReason = self.page.context:Create("label", wrapper, {
            text = entry.fieldLabelText or "",
            height = tonumber(entry.options.fieldLabelHeight)
                or tonumber(self.options.fieldLabelHeight)
                or DEFAULTS.fieldLabelHeight,
            labelFill = true,
            justifyH = "LEFT",
            justifyV = "MIDDLE",
            wordWrap = false,
            fontKey = entry.options.fieldLabelFontKey or "body",
            textToken = entry.options.fieldLabelTextToken or "color.text.muted",
        })
        if not fieldLabel then return self, nil, labelReason end
        entry.layoutComponent = wrapper
        entry.fieldLabel = fieldLabel
        controlParent = wrapper
    end

    local component, reason = self.page.context:Create(kind, controlParent, prepared)
    if not component then
        return self, nil, reason
    end

    entry.component = component
    entry.layoutComponent = entry.layoutComponent or component
    if entry.layoutComponent ~= component then
        component._fieldContainer = entry.layoutComponent
        component._fieldLabel = entry.fieldLabel
    end
    entry.visible = not prepared.hidden
    if entry.layoutComponent ~= component then
        entry.layoutComponent:SetVisible(entry.visible)
    end
    self.records[#self.records + 1] = entry
    self.page.controls[key] = component
    self.page.controlEntries[key] = entry
    self.page.controlOrder[#self.page.controlOrder + 1] = entry
    if not self.page.dryRun and type(entry.options.onCreated) == "function" then
        entry.options.onCreated(component, self.page, self)
    end
    return self, component
end

function Row:Checkbox(key, options)
    return self:Add("checkbox", key, options)
end

function Row:Slider(key, options)
    return self:Add("slider", key, options)
end

function Row:Dropdown(key, options)
    if self.kind ~= "field" then
        return self, nil, "settings dropdowns require field rows"
    end
    return self:Add("dropdown", key, options)
end

function Row:SoundDropdown(key, options)
    if type(options) ~= "table" or type(options.onPreview) ~= "function" then
        return self, nil, "sound dropdown requires a preview callback"
    end
    local prepared = CopyTable(options)
    prepared.soundPreview = true
    return self:Dropdown(key, prepared)
end

function Row:Color(key, options)
    return self:Add("color", key, options)
end

function Row:ColorPicker(key, options)
    return self:Add("color", key, options)
end

-- Page actions are data, not per-page button frames. MainWindow owns the three
-- reusable controls; the handles preserve module callbacks and refresh binding.
local PageAction = {}
PageAction.__index = PageAction
function PageAction:SetText(value) self.text = value; self:_Notify() end
function PageAction:GetText() return self.text end
function PageAction:SetEnabled(value) self.enabled = value == true; self:_Notify() end
function PageAction:SetVisible(value) self.visible = value == true; self:_Notify() end
function PageAction:IsVisible() return self.visible end
function PageAction:RefreshTheme() self:_Notify() end
function PageAction:_Notify()
    local shell = self.page.system.mainWindow
    if shell and shell.actionPage == self.page then shell:RefreshPageActions() end
end
function PageAction:Invoke()
    if not self.visible or not self.enabled then return false end
    local result, reason = self.onAction(self)
    self.page:Refresh("page-action")
    return result, reason
end

function Row:Button(key, options)
    if not (options and options.action) then return self:Add("button", key, options) end
    local slot = options.action
    if slot ~= "preview" and slot ~= "resetPosition" and slot ~= "restoreDefaults" then
        return self, nil, "unknown page action"
    end
    if self.page.controlEntries[key] then return self, nil, "duplicate page action" end
    local entry = { key = key, kind = "button", options = CopyTable(options), row = self, visible = true }
    local prepared = PrepareControlOptions(self.page, entry)
    if type(prepared.onAction) ~= "function" then return self, nil, "page action callback is required" end
    local control = setmetatable({ page = self.page, options = prepared, slot = slot,
        text = prepared.text or "", enabled = prepared.enabled ~= false,
        visible = not prepared.hidden, onAction = prepared.onAction,
    }, PageAction)
    entry.component = control
    self.page.controls[key], self.page.controlEntries[key] = control, entry
    self.page.controlOrder[#self.page.controlOrder + 1] = entry
    self.page.pageActions = self.page.pageActions or {}
    self.page.pageActions[#self.page.pageActions + 1] = entry
    return self, control
end

-- Page-leave cleanup for controls that are not page actions, for example a
-- shared movement entry. The handler stays registered across page re-entry.
function Page:SetDeactivateHandler(handler)
    self.deactivateHandler = type(handler) == "function" and handler or nil
    return true
end

function Page:DeactivateActions()
    local shell = self.system.mainWindow
    if shell and shell.actionPage == self then shell:BindPageActions(nil) end
    if self.keyBindingDialog then self.keyBindingDialog:Hide() end
    if self.textDialog then self.textDialog:Hide() end
    for _, entry in ipairs(self.pageActions or {}) do
        if entry.options.onDeactivate then entry.options.onDeactivate() end
    end
    if self.deactivateHandler then self.deactivateHandler() end
end

function Row:Popover(key, options)
    options = CopyTable(options)
    if type(options.rows) ~= "table" or #options.rows == 0 then
        return self, nil, "settings popover requires at least one row"
    end
    if self.page.popovers[key] or self.page.controlEntries[key] then
        local existing = self.page.popovers[key]
        return self, existing and existing.button or self.page.controls[key],
            "settings popover key is already registered"
    end
    if self.options.minimumColumnWidth == nil then
        self.options.minimumColumnWidth = DEFAULTS.popoverMinimumColumnWidth
    end
    if self.page.dryRun then
        local dryOptions = CopyTable(options)
        local buttonOptions = CopyTable(dryOptions.button)
        buttonOptions.text = buttonOptions.text or ""
        if buttonOptions.text == "外观样式" or buttonOptions.text == "外观设置"
            or buttonOptions.text == "样式设置" or buttonOptions.text == "外观调整" then
            buttonOptions.text = "样式调整"
            dryOptions.title = "样式调整"
        end
        local dryButton = NewDryRunComponent("button", buttonOptions)
        local dryPopover = {
            key = key,
            page = self.page,
            row = self,
            options = dryOptions,
            button = dryButton,
            attachedTo = dryOptions.attachTo,
            GetControl = function() return DUMMY_FRAME end,
        }
        local entry = {
            key = key,
            kind = "button",
            options = buttonOptions,
            row = self,
            component = dryButton,
            layoutComponent = dryButton,
            visible = not buttonOptions.hidden,
            attachedTo = dryOptions.attachTo,
        }
        if not dryOptions.attachTo then
            self.records[#self.records + 1] = entry
        end
        self.page.controls[key] = dryButton
        self.page.controlEntries[key] = entry
        self.page.controlOrder[#self.page.controlOrder + 1] = entry
        self.page.popovers[key] = dryPopover
        self.page.popoverOrder[#self.page.popoverOrder + 1] = dryPopover
        return self, dryButton, dryPopover
    end

    if not self.page.system.settingsPopovers then
        local factory = UI.SettingsPopover
        if type(factory) ~= "table" or type(factory.New) ~= "function" then
            return self, nil, "settings popover service is unavailable"
        end
        local controller, controllerReason = factory:New(self.page.system)
        if not controller then return self, nil, controllerReason end
        self.page.system.settingsPopovers = controller
    end

    local buttonOptions = CopyTable(options.button)
    buttonOptions.matchToggleColumn = not options.attachTo and buttonOptions.width == nil and options.buttonWidth == nil
    buttonOptions.variant = "settings"
    buttonOptions.justifyH = "LEFT"
    buttonOptions.text = buttonOptions.text or ""
    -- Hosted plugins share the same appearance action vocabulary as RS pages.
    if buttonOptions.text == "外观样式" or buttonOptions.text == "外观设置"
        or buttonOptions.text == "样式设置" or buttonOptions.text == "外观调整" then
        buttonOptions.text = "样式调整"
        options.title = "样式调整"
    end
    buttonOptions.tooltip = buttonOptions.tooltip or options.tooltip or "更多设置"
    buttonOptions.width = buttonOptions.width or options.buttonWidth
        or (buttonOptions.text ~= "" and self.page.system.theme:Get("layout.settingsButtonWidth")) or 32
    buttonOptions.height = buttonOptions.height or options.buttonHeight or self.page.system.theme:Get("layout.settingsButtonHeight") or 32
    buttonOptions.noBorder = true
    buttonOptions.backgroundToken = buttonOptions.backgroundToken or "color.transparent"
    local attachKey = options.attachTo
    local attachEntry = type(attachKey) == "string" and self.page.controlEntries[attachKey] or nil
    local dropdown = attachEntry and attachEntry.kind == "dropdown"
    if attachKey and (not attachEntry or attachEntry.row ~= self or (attachEntry.kind ~= "checkbox" and not dropdown)) then
        return self, nil, "settings popover attachment requires a checkbox or dropdown in the same row"
    end

    local button, reason
    local function CleanupButton()
        self.page.controls[key] = nil
        self.page.controlEntries[key] = nil
        local index = #self.page.controlOrder
        while index >= 1 do
            if self.page.controlOrder[index].key == key then
                table.remove(self.page.controlOrder, index)
                break
            end
            index = index - 1
        end
        index = #self.records
        while index >= 1 do
            if self.records[index].key == key then
                table.remove(self.records, index)
                break
            end
            index = index - 1
        end
        if attachEntry and attachEntry.component
            and attachEntry.component.attachedAction == button then
            attachEntry.component.attachedAction = nil
        end
        ReleaseContextObject(self.page.context, button)
    end
    if attachEntry then
        local target = attachEntry.component
        local userOnEnter = buttonOptions.onEnter
        local userOnLeave = buttonOptions.onLeave
        buttonOptions.width = options.buttonWidth or buttonOptions.width or 34
        buttonOptions.height = options.buttonHeight or buttonOptions.height or 34
        buttonOptions.onEnter = function(component)
            target.hovered = true
            target:RefreshTheme()
            if type(userOnEnter) == "function" then userOnEnter(component) end
        end
        buttonOptions.onLeave = function(component)
            target.hovered = false
            target:RefreshTheme()
            if type(userOnLeave) == "function" then userOnLeave(component) end
        end
        local created
        created, button, reason = pcall(
            self.page.context.Create,
            self.page.context,
            "button",
            target,
            buttonOptions
        )
        if not created then
            reason, button = button, nil
        end
        if button then
            local buttonWidth = tonumber(buttonOptions.width) or 34
            local buttonHeight = tonumber(buttonOptions.height) or 34
            local positioned, positionReason = pcall(function()
                button.frame:ClearAllPoints()
                if dropdown then
                    button.frame:SetPoint("LEFT", target.frame, "RIGHT", 4, 0)
                elseif target.options.toggleSide == "left" then
                    button.frame:SetPoint("RIGHT", target.frame, "RIGHT", -2, 0)
                else
                    button.frame:SetPoint("RIGHT", target.checkBorder or target.checkBox or target.frame, "LEFT", -4, 0)
                end
                button.frame:SetSize(buttonWidth, buttonHeight)
            end)
            if not positioned then
                reason = positionReason
            end
        end
    else
        local added, addResult, standaloneButton, standaloneReason = pcall(
            self.Add,
            self,
            "button",
            key,
            buttonOptions
        )
        if added then
            button, reason = standaloneButton, standaloneReason
        else
            button, reason = nil, addResult
        end
    end
    if not button or reason then
        if button then CleanupButton() end
        return self, nil, reason
    end
    local created, popover, popoverReason = pcall(
        self.page.system.settingsPopovers.Create,
        self.page.system.settingsPopovers,
        self.page,
        key,
        button,
        options
    )
    if not created then
        popoverReason, popover = popover, nil
    end
    if not popover then
        CleanupButton()
        return self, nil, tostring(popoverReason or "settings popover creation failed")
    end
    if attachEntry then
        local target = attachEntry.component
        local originalPoints = CapturePoints(target.label)
        local anchored, anchorReason = pcall(function()
            if not dropdown and target.label then
                target.label:ClearAllPoints()
                if target.options.toggleSide == "left" then
                    target.label:SetPoint("LEFT", target.checkBorder or target.checkBox or target.frame, "RIGHT", 10, 0)
                else
                    target.label:SetPoint("LEFT", target.frame, "LEFT", 10, 0)
                end
                target.label:SetPoint("RIGHT", button.frame, "LEFT", -4, 0)
            end
        end)
        if not anchored then
            RestorePoints(target.label, originalPoints)
            pcall(popover.Release, popover)
            CleanupButton()
            return self, nil, tostring(anchorReason)
        end
        local entry = {
            key = key,
            kind = "button",
            options = buttonOptions,
            row = self,
            component = button,
            layoutComponent = button,
            visible = true,
            attachedTo = attachKey,
            getEnabled = buttonOptions.getEnabled,
        }
        self.page.controls[key] = button
        self.page.controlEntries[key] = entry
        self.page.controlOrder[#self.page.controlOrder + 1] = entry
        button.attachedTo = target
        target.attachedAction = button
    end
    popover.row = self
    self.page.popovers[key] = popover
    self.page.popoverOrder[#self.page.popoverOrder + 1] = popover
    return self, button, popover
end

function Row:EditBox(key, options)
    return self:Add("editbox", key, options)
end

function Row:Label(key, options)
    return self:Add("label", key, options)
end

function Page:_ResolveWidth(width)
    width = tonumber(width)
    if (not width or width <= 0) and self.root then
        local frame = GetFrame(self.root)
        width = frame.GetWidth and tonumber(frame:GetWidth()) or nil
    end
    if not width or width <= 0 then
        width = tonumber(self.availableWidth)
            or tonumber(self.options.availableWidth)
            or tonumber(self.options.width)
    end
    if not width or width <= 0 then
        width = DEFAULTS.width
    end
    return width
end

function Page:_ResolveHeight(height)
    height = tonumber(height)
    if (not height or height <= 0) and self.root then
        local frame = GetFrame(self.root)
        height = frame.GetHeight and tonumber(frame:GetHeight()) or nil
    end
    if not height or height <= 0 then
        height = tonumber(self.availableHeight)
            or tonumber(self.options.availableHeight)
            or tonumber(self.options.height)
    end
    if not height or height <= 0 then
        height = DEFAULTS.height
    end
    return height
end

function Page:_ResolveColumns(row, innerWidth, visibleCount)
    if row.controlKind == "checkbox" and row.kind ~= "action" then
        return self:_ToggleGrid(innerWidth, row)
    end
    local requested = row.requestedColumns
    if row.options.preserveColumns ~= true then
        requested = math.min(requested, math.max(1, visibleCount))
    end
    if self.options.responsive == false or row.options.responsive == false then
        return requested
    end

    local minimumWidth = tonumber(row.options.minimumColumnWidth)
    if not minimumWidth and row.kind == "action" then
        minimumWidth = DEFAULTS.actionMinimumColumnWidth
    end
    minimumWidth = minimumWidth or self.metrics.minimumColumnWidth
    local gap = tonumber(row.options.columnGap) or self.metrics.columnGap
    local maxColumns = math.floor((innerWidth + gap) / (minimumWidth + gap))
    maxColumns = Clamp(maxColumns, 1, requested)
    return math.min(requested, maxColumns)
end

-- One page-wide grid for short settings, independent of item count or section.
function Page:_ToggleGrid(innerWidth, row)
    local requested = row and tonumber(row.options.toggleColumns) or 4
    if requested ~= 2 and requested ~= 3 and requested ~= 4 and requested ~= 8 then requested = 4 end
    local gap = self.metrics.columnGap
    local minimum = requested == 8 and 90 or math.max(180, self.metrics.minimumColumnWidth)
    local fit = math.floor((innerWidth + gap) / (minimum + gap))
    local columns = requested
    while columns > 1 and columns > fit do columns = columns == 3 and 1 or columns / 2 end
    return columns, gap
end

local function ToggleLabelUnits(text)
    text = tostring(text or "")
    if text:find("|", 1, true) then
        -- Texture/atlas markup renders one icon; asset paths are not visible label text.
        text = text:gsub("|T.-|t", "■"):gsub("|A.-|a", "■")
            :gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
    end
    text = text:gsub("%s", "")
    local _, ascii = text:gsub("[%z\1-\127]", "")
    local _, wide = text:gsub("[\194-\244]", "")
    return wide + ascii * 0.5
end

function Page:_LayoutCheckboxRow(row, innerWidth, entries, count)
    local columns, gap = self:_ToggleGrid(innerWidth, row)
    local cellWidth = (innerWidth - (columns - 1) * gap) / columns
    local rowHeight = tonumber(row.options.rowHeight) or row.itemHeight or self.metrics.rowHeight
    local verticalGap = tonumber(row.options.rowGap) or self.metrics.rowGap
    local column, line = 0, 0
    for index = 1, count do
        local entry = entries[index]
        local span = not row.options.toggleColumns and ToggleLabelUnits(entry.component:GetText()) > 9 and 2 or 1
        span = math.min(span, columns)
        if column + span > columns then column, line = 0, line + 1 end
        entry.toggleColumn, entry.toggleLine = column, line
        local child = GetFrame(entry.component)
        child:ClearAllPoints()
        child:SetSize(cellWidth * span + gap * (span - 1), rowHeight)
        column = column + span
        rowHeight = math.max(rowHeight, tonumber(entry.options.height) or 0)
    end
    for index = 1, count do
        local label = entries[index].component.label
        if label and label.GetStringHeight then rowHeight = math.max(rowHeight, label:GetStringHeight() + 8) end
    end
    local frame = GetFrame(row.component)
    local height = (line + 1) * rowHeight + line * verticalGap
    frame:SetSize(innerWidth, height)
    for index = 1, count do
        local entry = entries[index]
        local child = GetFrame(entry.component)
        child:SetHeight(rowHeight)
        child:SetPoint("TOPLEFT", frame, "TOPLEFT", entry.toggleColumn * (cellWidth + gap), -entry.toggleLine * (rowHeight + verticalGap))
        entry.component:RefreshValueVisual()
    end
    row.effectiveColumns = columns
    row.height, row.layoutCount = height, row.layoutCount + 1
    self.maximumEffectiveColumns = math.max(self.maximumEffectiveColumns, columns)
    return height
end

function Page:_SettingsColumnWidth(row, innerWidth)
    local columns, gap = self:_ToggleGrid(innerWidth)
    return (innerWidth - (columns - 1) * gap) / columns
end

function Page:_LayoutFieldEntry(row, entry, columnWidth)
    local wrapper = GetFrame(entry.layoutComponent)
    local label = entry.fieldLabel and GetFrame(entry.fieldLabel)
    local control = GetFrame(entry.component)
    if not wrapper or not label or not control then return false end

    local labelHeight = tonumber(entry.options.fieldLabelHeight)
        or tonumber(row.options.fieldLabelHeight)
        or DEFAULTS.fieldLabelHeight
    local controlHeight = tonumber(entry.options.controlHeight)
        or tonumber(row.options.controlHeight)
        or DEFAULTS.fieldControlHeight
    local controlGap = tonumber(entry.options.controlGap)
        or tonumber(row.options.controlGap)
        or DEFAULTS.fieldControlGap
    local paddingX = tonumber(entry.options.fieldPaddingX)
        or tonumber(row.options.fieldPaddingX)
        or DEFAULTS.fieldPaddingX
    local paddingTop = tonumber(entry.options.fieldPaddingTop)
        or tonumber(row.options.fieldPaddingTop)
        or DEFAULTS.fieldPaddingTop
    local availableWidth = math.max(1, columnWidth - paddingX * 2)
    if entry.kind == "dropdown" and entry.component.attachedAction then
        availableWidth = math.max(1, availableWidth - entry.component.attachedAction.frame:GetWidth() - 4)
    end
    local requestedWidth = tonumber(entry.options.controlWidth)
        or tonumber(row.options.controlWidth)
    local controlWidth = requestedWidth and math.min(requestedWidth, availableWidth) or availableWidth

    label:ClearAllPoints()
    label:SetPoint("TOPLEFT", wrapper, "TOPLEFT", paddingX, -paddingTop)
    label:SetSize(availableWidth, labelHeight)

    control:ClearAllPoints()
    control:SetPoint(
        "TOPLEFT",
        wrapper,
        "TOPLEFT",
        paddingX,
        -(paddingTop + labelHeight + controlGap)
    )
    control:SetSize(controlWidth, controlHeight)
    return true
end

function Page:_LayoutRow(row, innerWidth, remainingHeight)
    local visibleItems = row.visibleItems
    local visibleEntries = row.visibleEntries or {}
    row.visibleEntries = visibleEntries
    local visibleCount = 0
    local index = 1
    while index <= #row.records do
        local entry = row.records[index]
        if entry.visible then
            visibleCount = visibleCount + 1
            visibleItems[visibleCount] = entry.layoutComponent or entry.component
            visibleEntries[visibleCount] = entry
        end
        index = index + 1
    end
    index = #visibleItems
    while index > visibleCount do
        visibleItems[index] = nil
        visibleEntries[index] = nil
        index = index - 1
    end

    if visibleCount == 0 then
        row.component:SetVisible(false)
        row.effectiveColumns = 0
        row.height = 0
        return 0
    end

    row.component:SetVisible(true)
    if row.controlKind == "checkbox" and row.kind ~= "action" then
        return self:_LayoutCheckboxRow(row, innerWidth, visibleEntries, visibleCount)
    end
    if row.kind == "action" and row.options.layout ~= "grid" then
        local spacing = tonumber(row.options.columnGap) or self.metrics.columnGap
        local verticalGap = tonumber(row.options.rowGap) or self.metrics.rowGap
        local baseHeight = tonumber(row.options.rowHeight) or row.itemHeight
        local x, y, lineHeight, inLine, lines = 0, 0, baseHeight, 0, 1
        local maxInLine = 0
        local columnLimit = row.options.autoWrap and visibleCount or row.requestedColumns
        local _, fontSize = self.system.theme:ResolveFont("body")
        local standardWidth = (tonumber(fontSize) or 17) * 6 + 28
        local equalWidth = tonumber(row.options.buttonWidth)
        local widths = row.itemWidths or {}
        row.itemWidths = widths
        for itemIndex, entry in ipairs(visibleEntries) do
            local component = entry.component
            local label = component.label
            local measure = label and (label.GetUnboundedStringWidth or label.GetStringWidth)
            -- Remove the previous wrapped width before measuring on older clients.
            if label and label.SetWidth and entry.options.variant ~= "settings" then label:SetWidth(0) end
            local textWidth = measure and measure(label) or #(component:GetText() or "") * 8
            local buttonWidth = math.min(innerWidth, math.max(96,
                tonumber(entry.options.width) or equalWidth
                or (row.options.widthPolicy == "content" and (textWidth + 28)) or standardWidth))
            if entry.options.matchToggleColumn then
                buttonWidth = self:_SettingsColumnWidth(row, innerWidth) or buttonWidth
            end
            local widthRatio = tonumber(entry.options.widthRatio or row.options.widthRatio)
            if widthRatio then
                -- Fractions include their share of gutters, matching an equal grid.
                buttonWidth = math.max(1, (innerWidth + spacing)
                    * Clamp(widthRatio, 0.05, 1) - spacing)
            end
            widths[itemIndex] = buttonWidth
        end
        for itemIndex, entry in ipairs(visibleEntries) do
            local component, buttonWidth = entry.component, widths[itemIndex]
            local label = component.label
            -- A trailing toolbar group uses spare space, and wraps naturally below
            -- the selector when the available width cannot contain both groups.
            if entry.options.alignRight then
                local trailingWidth = buttonWidth
                for nextIndex = itemIndex + 1, #visibleEntries do
                    trailingWidth = trailingWidth + spacing + widths[nextIndex]
                end
                if inLine > 0 and x + trailingWidth > innerWidth + 0.01 then
                    x, y, inLine, lines = 0, y + lineHeight + verticalGap, 0, lines + 1
                    lineHeight = baseHeight
                end
                x = math.max(x, innerWidth - trailingWidth)
            end
            if inLine > 0 and (x + buttonWidth > innerWidth + 0.01 or inLine >= columnLimit) then
                x, y, inLine, lines = 0, y + lineHeight + verticalGap, 0, lines + 1
                lineHeight = baseHeight
            end
            local child = GetFrame(component)
            child:ClearAllPoints()
            local settingsButton = entry.options.variant == "settings"
            local itemHeight = settingsButton and (tonumber(entry.options.height) or baseHeight) or baseHeight
            child:SetPoint("TOPLEFT", GetFrame(row.component), "TOPLEFT", x,
                -y - math.max(0, (baseHeight - itemHeight) / 2))
            child:SetSize(buttonWidth, itemHeight)
            if not settingsButton then
                if label and label.SetWidth then label:SetWidth(math.max(1, buttonWidth - 16)) end
                if label and label.GetStringHeight then
                    itemHeight = math.max(itemHeight, label:GetStringHeight() + 8)
                    child:SetHeight(itemHeight)
                end
            end
            lineHeight = math.max(lineHeight, itemHeight)
            x, inLine = x + buttonWidth + spacing, inLine + 1
            maxInLine = math.max(maxInLine, inLine)
        end
        local height = y + lineHeight
        GetFrame(row.component):SetSize(innerWidth, height)
        row.effectiveColumns = maxInLine
        row.height, row.layoutCount = height, row.layoutCount + 1
        self.maximumEffectiveColumns = math.max(self.maximumEffectiveColumns, row.effectiveColumns)
        return height
    end
    local columns = self:_ResolveColumns(row, innerWidth, visibleCount)
    local gap = tonumber(row.options.columnGap) or self.metrics.columnGap
    if row.controlKind == "checkbox" then columns, gap = self:_ToggleGrid(innerWidth, row) end
    local rowHeight = tonumber(row.options.rowHeight) or row.itemHeight or self.metrics.rowHeight
    if row.options.fillRemaining and remainingHeight then
        rowHeight = math.max(rowHeight, remainingHeight)
    end
    for _, entry in ipairs(visibleEntries) do
        rowHeight = math.max(rowHeight, tonumber(entry.options.height) or 0)
    end
    local lineCount = math.ceil(visibleCount / columns)
    local verticalGap = tonumber(row.options.rowGap) or self.metrics.rowGap
    local height = lineCount * rowHeight + math.max(0, lineCount - 1) * verticalGap
    local columnWidth = math.max(1, (innerWidth - math.max(0, columns - 1) * gap) / columns)
    local frame = GetFrame(row.component)
    if frame.SetSize then frame:SetSize(innerWidth, height) end
    self.system.layout:Apply("grid", row.component, visibleItems, {
        columns = columns,
        padding = 0,
        spacing = gap,
        rowHeight = rowHeight,
        rowSpacing = verticalGap,
        columnWidth = columnWidth,
    })
    local sizeIndex = 1
    while sizeIndex <= visibleCount do
        local entry = visibleEntries[sizeIndex]
        local options = entry.options or {}
        if row.kind == "field" then
            self:_LayoutFieldEntry(row, entry, columnWidth)
        else
            local width = options.matchToggleColumn and self:_SettingsColumnWidth(row, innerWidth) or tonumber(options.width)
            local ratio = tonumber(options.widthRatio)
            if not width and ratio then
                width = innerWidth * Clamp(ratio, 0.05, 1)
            end
            local height = tonumber(options.height) or rowHeight
            local child = GetFrame(entry.component)
            if entry.kind == "editbox" then
                local inset = DEFAULTS.fieldPaddingX
                local offset = sizeIndex - 1
                child:ClearAllPoints()
                child:SetPoint("TOPLEFT", frame, "TOPLEFT",
                    (offset % columns) * (columnWidth + gap) + inset,
                    -math.floor(offset / columns) * (rowHeight + verticalGap))
                child:SetSize(math.max(1, math.min(width or columnWidth, columnWidth) - inset * 2), height)
            elseif options.variant == "settings" then
                local offset = sizeIndex - 1
                child:ClearAllPoints()
                child:SetPoint("TOPLEFT", frame, "TOPLEFT",
                    (offset % columns) * (columnWidth + gap),
                    -math.floor(offset / columns) * (rowHeight + verticalGap) - (rowHeight - height) / 2)
                child:SetSize(math.min(width or columnWidth, columnWidth), height)
            elseif width then
                child:SetSize(math.min(math.max(1, width), columnWidth), height)
            end
        end
        sizeIndex = sizeIndex + 1
    end
    if row.controlKind == "checkbox" then
        local fittedHeight = rowHeight
        for _, entry in ipairs(visibleEntries) do
            local label = entry.component.label
            if label and label.GetStringHeight then
                fittedHeight = math.max(fittedHeight, label:GetStringHeight() + 8)
            end
        end
        if fittedHeight > rowHeight then
            rowHeight = fittedHeight
            height = lineCount * rowHeight + math.max(0, lineCount - 1) * verticalGap
            frame:SetHeight(height)
            self.system.layout:Apply("grid", row.component, visibleItems, {
                columns = columns, padding = 0, spacing = gap, rowSpacing = verticalGap,
                rowHeight = rowHeight, columnWidth = columnWidth,
            })
        end
    end
    local refreshIndex = 1
    while refreshIndex <= visibleCount do
        local refreshEntry = visibleEntries[refreshIndex]
        local refreshComponent = refreshEntry and refreshEntry.component
        if refreshComponent and refreshComponent.RefreshValueVisual then
            refreshComponent:RefreshValueVisual()
        end
        refreshIndex = refreshIndex + 1
    end
    row.effectiveColumns = columns
    row.height = height
    row.layoutCount = row.layoutCount + 1
    if columns > self.maximumEffectiveColumns then
        self.maximumEffectiveColumns = columns
    end
    return height
end

function Page:RefreshLayout(width, height)
    if self.dryRun then return 0 end
    if self.system.layoutBatchPageId and self.context and self.system.layoutBatchPageId == self.context.id then
        return self.contentHeight or 0
    end
    self.availableWidth = self:_ResolveWidth(width)
    self.availableHeight = self:_ResolveHeight(height)
    local contentWidth = math.max(1, self.availableWidth - self.metrics.scrollbarReserve)
    local innerWidth = math.max(1, contentWidth - self.metrics.padding * 2)
    local viewportOffset = 0
    if self.tabs then
        viewportOffset = self.tabs.height
            + ReadNumber(self.tabs.options, "gapAfter", DEFAULTS.tabBarGap)
        self.tabs:_Layout(self.availableWidth)
    end
    self.footerHeight = 0
    if self.footer then
        local row = self.footer
        local height = self:_LayoutRow(row, innerWidth)
        local frame, rootFrame = GetFrame(row.component), GetFrame(self.root)
        frame:ClearAllPoints()
        frame:SetPoint("BOTTOMLEFT", rootFrame, "BOTTOMLEFT", self.metrics.padding, self.metrics.padding)
        if row.description then
            local label = row.description
            label.frame:SetWidth(innerWidth)
            local labelHeight = label:FitTextHeight(20, 0)
            label.frame:ClearAllPoints()
            label.frame:SetPoint("BOTTOMLEFT", rootFrame, "BOTTOMLEFT", self.metrics.padding, self.metrics.padding + height + self.metrics.rowGap)
            height = height + labelHeight + self.metrics.rowGap
        end
        self.footerHeight = height > 0 and (height + self.metrics.padding * 2) or 0
        self:_AnchorViewport()
    end
    local viewportHeight = math.max(1, self.availableHeight - viewportOffset - self.footerHeight)
    if self.footer then GetFrame(self.scroll):SetHeight(viewportHeight) end
    local cursor = self.metrics.padding
    local hasVisibleBlock = false
    self.maximumEffectiveColumns = 0

    local sectionVisibility = {}
    for _, section in ipairs(self.sections) do
        local getVisible = section.options and section.options.getVisible
        sectionVisibility[section] = getVisible == nil
            or ResolveValue(getVisible, self, section, "layout", GetContextData(self.context)) ~= false
    end
    local index = 1
    while index <= #self.blocks do
        local block = self.blocks[index]
        local component = block.component
        local frame = GetFrame(component)
        local height
        local tabVisible = not block.tab
            or (self.tabs and block.tab.key == self.tabs.selected)
        if not tabVisible or (block.owner and sectionVisibility[block.owner] == false) then
            component:SetVisible(false)
            height = 0
        elseif block.kind == "row" then
            height = self:_LayoutRow(block.row, innerWidth,
                viewportHeight - cursor - self.metrics.bottomPadding
                    - (hasVisibleBlock and block.gapBefore or 0))
        elseif block.kind == "description" then
            component:SetVisible(true)
            if frame.SetWidth then frame:SetWidth(innerWidth) end
            local empty = block.hideWhenEmpty and component:GetText() == ""
            component:SetVisible(not empty)
            height = empty and 0 or component:FitTextHeight(block.minHeight, block.heightPadding)
        else
            component:SetVisible(true)
            height = block.height or (frame.GetHeight and frame:GetHeight()) or 0
            if frame.SetSize then frame:SetSize(innerWidth, height) end
        end

        if height and height > 0 then
            if hasVisibleBlock then
                cursor = cursor + block.gapBefore
            end
            block.layoutY = cursor
            block.layoutHeight = height
            if frame.ClearAllPoints then frame:ClearAllPoints() end
            if frame.SetPoint then
                frame:SetPoint("TOPLEFT", self.content, "TOPLEFT", self.metrics.padding, -cursor)
            end
            cursor = cursor + height
            hasVisibleBlock = true
        else
            block.layoutY = nil
            block.layoutHeight = 0
        end
        index = index + 1
    end

    local contentHeight = cursor + self.metrics.bottomPadding
    contentHeight = math.max(contentHeight, viewportHeight)
    self.scroll:SetContentSize(contentWidth, contentHeight)
    self.contentWidth = contentWidth
    self.contentHeight = contentHeight
    self.cursor = cursor
    self.layoutCount = self.layoutCount + 1
    return contentHeight
end

function Page:Finish(width, height)
    if self.dryRun then
        if self.tabs then
            self.tabs:_ResolveInitial("build", GetContextData(self.context))
        end
        self.finished = true
        self.finishCount = self.finishCount + 1
        return 0
    end
    if self.tabs then
        self.tabs:_ResolveInitial("build", GetContextData(self.context))
        if self.tabs.selected then
            self.tabs:Select(self.tabs.selected, true)
        end
    end
    self.finished = true
    self.finishCount = self.finishCount + 1
    return self:RefreshLayout(width, height)
end

function Page:Refresh(reason, data)
    if self.dryRun then return true end
    data = data == nil and GetContextData(self.context) or data
    local prepared = {
        controls = {},
        descriptions = {},
        popovers = {},
    }
    local function Fail(stage, failureReason)
        self.lastRefreshError = tostring(stage) .. ": " .. tostring(failureReason)
        return false, self.lastRefreshError
    end

    if type(self.options.onRefresh) == "function" then
        local invoked, result, callbackReason = pcall(self.options.onRefresh, self, reason, data)
        if not invoked then return Fail("settings page onRefresh failed", result) end
        if result == false then
            return Fail("settings page onRefresh failed", callbackReason or "callback returned failure")
        end
    end

    if self.tabs and type(self.tabs.options.getValue) == "function" then
        local ok, requested, resolveReason = TryResolveValue(
            self.tabs.options.getValue, self, self.tabs, reason, data
        )
        if not ok then return Fail("settings tabs getter failed", resolveReason) end
        if self.tabs.items[requested] then
            prepared.requestedTab = requested
        end
    end

    local index = 1
    while index <= #self.controlOrder do
        local entry = self.controlOrder[index]
        local values = { entry = entry }
        if entry.getValue then
            local ok, value, resolveReason = TryResolveValue(
                entry.getValue, self, entry, reason, data
            )
            if not ok then
                return Fail("settings value getter failed [" .. tostring(entry.key) .. "]", resolveReason)
            end
            values.hasValue, values.value = true, value
        end
        if entry.getTextToken then
            local ok, value, resolveReason = TryResolveValue(entry.getTextToken, self, entry, reason, data)
            if not ok then return Fail("settings text color getter failed", resolveReason) end
            values.hasTextToken, values.textToken = true, value
        end
        if entry.getText then
            local ok, value, resolveReason = TryResolveValue(
                entry.getText, self, entry, reason, data
            )
            if not ok then
                return Fail("settings text getter failed [" .. tostring(entry.key) .. "]", resolveReason)
            end
            values.hasText, values.text = true, value or ""
        end
        if entry.getFieldLabel and entry.fieldLabel then
            local ok, value, resolveReason = TryResolveValue(
                entry.getFieldLabel, self, entry, reason, data
            )
            if not ok then
                return Fail(
                    "settings field label getter failed [" .. tostring(entry.key) .. "]",
                    resolveReason
                )
            end
            values.hasFieldLabel, values.fieldLabel = true, value or ""
        end
        if entry.getEnabled then
            local ok, value, resolveReason = TryResolveValue(
                entry.getEnabled, self, entry, reason, data
            )
            if not ok then
                return Fail("settings enabled getter failed [" .. tostring(entry.key) .. "]", resolveReason)
            end
            values.hasEnabled, values.enabled = true, value and true or false
        end
        if entry.getVisible then
            local ok, value, resolveReason = TryResolveValue(
                entry.getVisible, self, entry, reason, data
            )
            if not ok then
                return Fail("settings visible getter failed [" .. tostring(entry.key) .. "]", resolveReason)
            end
            values.hasVisible, values.visible = true, value and true or false
        end
        prepared.controls[index] = values
        index = index + 1
    end

    index = 1
    while index <= #self.refreshEntries do
        local entry = self.refreshEntries[index]
        local ok, value, resolveReason = TryResolveValue(
            entry.getText, self, entry, reason, data
        )
        if not ok then
            return Fail("settings description getter failed [" .. tostring(index) .. "]", resolveReason)
        end
        prepared.descriptions[index] = { entry = entry, text = value or "" }
        index = index + 1
    end

    index = 1
    while index <= #self.popoverOrder do
        local popover = self.popoverOrder[index]
        if popover.created and not popover.released then
            local invoked, values, popoverReason = pcall(popover.PrepareRefresh, popover)
            if not invoked then
                return Fail("settings popover refresh failed [" .. tostring(popover.key) .. "]", values)
            end
            if not values then
                return Fail(
                    "settings popover refresh failed [" .. tostring(popover.key) .. "]",
                    popoverReason or "preparation failed"
                )
            end
            prepared.popovers[#prepared.popovers + 1] = { popover = popover, values = values }
        end
        index = index + 1
    end

    local applied, applyReason = pcall(function()
        if prepared.requestedTab then
            self.tabs:Select(prepared.requestedTab, true, true)
        end
        local controlIndex = 1
        while controlIndex <= #prepared.controls do
            local values = prepared.controls[controlIndex]
            local entry, component = values.entry, values.entry.component
            if values.hasValue then component:SetValue(values.value, true) end
            if values.hasText then component:SetText(values.text) end
            if values.hasTextToken then
                component.options.textToken = values.textToken
                component:RefreshTheme()
            end
            if values.hasFieldLabel then entry.fieldLabel:SetText(values.fieldLabel) end
            if values.hasEnabled then component:SetEnabled(values.enabled) end
            if values.hasVisible then
                entry.visible = values.visible
                component:SetVisible(values.visible)
                if entry.layoutComponent and entry.layoutComponent ~= component then
                    entry.layoutComponent:SetVisible(values.visible)
                end
            end
            controlIndex = controlIndex + 1
        end
        local descriptionIndex = 1
        while descriptionIndex <= #prepared.descriptions do
            local values = prepared.descriptions[descriptionIndex]
            values.entry.component:SetText(values.text)
            descriptionIndex = descriptionIndex + 1
        end
        local popoverIndex = 1
        while popoverIndex <= #prepared.popovers do
            local values = prepared.popovers[popoverIndex]
            if values.popover:ApplyPreparedRefresh(values.values) == false then
                error("settings popover apply failed [" .. tostring(values.popover.key) .. "]", 0)
            end
            popoverIndex = popoverIndex + 1
        end
    end)
    if not applied then return Fail("settings refresh apply failed", applyReason) end

    self.refreshCount = self.refreshCount + 1
    if self.finished then
        self:RefreshLayout()
    end
    self.lastRefreshError = nil
    local shell = self.system.mainWindow
    if shell and shell.currentPage == self.context.id and shell:IsOpen() then
        shell:BindPageActions(self)
    end
    return true
end

function Page:GetDiagnostics()
    return {
        id = self.options.id,
        finished = self.finished,
        finishes = self.finishCount,
        layouts = self.layoutCount,
        refreshes = self.refreshCount,
        sections = #self.sections,
        tabs = self.tabs and #self.tabs.order or 0,
        selectedTab = self.tabs and self.tabs.selected or nil,
        invalidTabDefault = self.tabs and self.tabs.invalidDefault or nil,
        rows = #self.rows,
        controls = CountKeys(self.controls),
        availableWidth = self.availableWidth,
        contentWidth = self.contentWidth,
        contentHeight = self.contentHeight,
        cursor = self.cursor,
        bottomPadding = self.metrics.bottomPadding,
        maximumEffectiveColumns = self.maximumEffectiveColumns,
        dynamicResources = 0,
        lastRefreshError = self.lastRefreshError,
    }
end

local function ResolveSearchOptionText(option, arg1, arg2)
    if type(option) == "function" then
        local ok, resolved = pcall(option, arg1, arg2)
        return ok and CleanSearchText(resolved) or nil
    end
    return CleanSearchText(option)
end

local function JoinSearchContext(...)
    local parts = {}
    local count = select("#", ...)
    for index = 1, count do
        local part = select(index, ...)
        if part and part ~= "" then
            parts[#parts + 1] = part
        end
    end
    if #parts == 0 then return nil end
    return table.concat(parts, " > ")
end

local function AppendSearchEntry(entries, seen, pageId, kind, tier, label, fields)
    label = CleanSearchText(label)
    if not label then return end
    local searchLower = string.lower(label)
    local dedupeKey = table.concat({
        kind,
        fields.tabKey or "",
        tostring(fields.sectionIndex or ""),
        tostring(fields.blockIndex or ""),
        fields.controlKey or "",
        fields.popoverKey or "",
        fields.popRowKey or "",
        searchLower,
    }, "\0")
    if seen[dedupeKey] then return end
    seen[dedupeKey] = true
    entries[#entries + 1] = {
        pageId = pageId,
        kind = kind,
        tier = tier,
        label = label,
        searchLower = searchLower,
        tabKey = fields.tabKey,
        tabTitle = fields.tabTitle,
        sectionIndex = fields.sectionIndex,
        sectionTitle = fields.sectionTitle,
        blockIndex = fields.blockIndex,
        controlKey = fields.controlKey,
        popoverKey = fields.popoverKey,
        popoverTitle = fields.popoverTitle,
        popRowKey = fields.popRowKey,
        contextLabel = fields.contextLabel,
    }
end

function SettingsBuilder:ExtractSearchEntries(page, pageId)
    if type(page) ~= "table" then return {} end
    local entries = {}
    local seen = {}
    local resolvedPageId = pageId or (page.options and page.options.id) or (page.context and page.context.id)

    if page.tabs and type(page.tabs.order) == "table" then
        for _, tab in ipairs(page.tabs.order) do
            local title = CleanSearchText(tab.title)
            if title then
                AppendSearchEntry(entries, seen, resolvedPageId, "tab", 1, title, {
                    tabKey = tab.key,
                    tabTitle = title,
                })
            end
        end
    end

    local sectionIndexMap = {}
    for sectionIndex, section in ipairs(page.sections or {}) do
        sectionIndexMap[section] = sectionIndex
        local sectionTitle = CleanSearchText(section.title)
        if sectionTitle then
            local tab = section.tab
            local tabTitle = tab and CleanSearchText(tab.title) or nil
            AppendSearchEntry(entries, seen, resolvedPageId, "section", 2, sectionTitle, {
                tabKey = tab and tab.key or nil,
                tabTitle = tabTitle,
                sectionIndex = sectionIndex,
                sectionTitle = sectionTitle,
                contextLabel = tabTitle,
            })
        end
    end

    for _, entry in ipairs(page.controlOrder or {}) do
        local options = entry.options
        if not (options and options.action) and not (page.popovers and page.popovers[entry.key]) then
            local row = entry.row
            local section = row and row.section
            local tab = (row and row.block and row.block.tab) or (section and section.tab)
            local tabKey = tab and tab.key or nil
            local tabTitle = tab and CleanSearchText(tab.title) or nil
            local sectionIndex = section and sectionIndexMap[section] or nil
            local sectionTitle = section and CleanSearchText(section.title) or nil
            local contextLabel = JoinSearchContext(tabTitle, sectionTitle)

            local fieldLabel = CleanSearchText(entry.fieldLabelText)
                or ResolveSearchOptionText(options and options.fieldLabel, page, entry)
            local liveText = entry.component and entry.component.GetText
                and CleanSearchText(entry.component:GetText()) or nil
            local staticText = ResolveSearchOptionText(options and options.text, page, entry)

            local fields = {
                tabKey = tabKey,
                tabTitle = tabTitle,
                sectionIndex = sectionIndex,
                sectionTitle = sectionTitle,
                controlKey = entry.key,
                contextLabel = contextLabel,
            }
            if fieldLabel then AppendSearchEntry(entries, seen, resolvedPageId, "control", 1, fieldLabel, fields) end
            if liveText then AppendSearchEntry(entries, seen, resolvedPageId, "control", 1, liveText, fields) end
            if staticText and staticText ~= liveText then
                AppendSearchEntry(entries, seen, resolvedPageId, "control", 1, staticText, fields)
            end
        end
    end

    for _, popover in ipairs(page.popoverOrder or {}) do
        local opts = popover.options or {}
        local row = popover.row or (popover.key and page.controlEntries[popover.key] and page.controlEntries[popover.key].row)
        local section = row and row.section
        local tab = (row and row.block and row.block.tab) or (section and section.tab)
        local tabKey = tab and tab.key or nil
        local tabTitle = tab and CleanSearchText(tab.title) or nil
        local sectionIndex = section and sectionIndexMap[section] or nil
        local sectionTitle = section and CleanSearchText(section.title) or nil

        local popoverTitle = ResolveSearchOptionText(opts.title, page, popover)
        local buttonText = ResolveSearchOptionText(opts.button and opts.button.text, page, popover)
        local displayTitle = popoverTitle or buttonText
        local popFields = {
            tabKey = tabKey,
            tabTitle = tabTitle,
            sectionIndex = sectionIndex,
            sectionTitle = sectionTitle,
            popoverKey = popover.key,
            popoverTitle = displayTitle,
            contextLabel = JoinSearchContext(tabTitle, sectionTitle),
        }
        if popoverTitle then AppendSearchEntry(entries, seen, resolvedPageId, "popover", 2, popoverTitle, popFields) end
        if buttonText and buttonText ~= popoverTitle then
            AppendSearchEntry(entries, seen, resolvedPageId, "popover", 2, buttonText, popFields)
        end

        for rowIndex, childRow in ipairs(opts.rows or {}) do
            if type(childRow) == "table" then
                local popRowKey = childRow.key or tostring(rowIndex)
                local rowLabel = ResolveSearchOptionText(childRow.text, popover, childRow)
                    or ResolveSearchOptionText(childRow.label, popover, childRow)
                    or ResolveSearchOptionText(childRow.fieldLabel, popover, childRow)
                    or ResolveSearchOptionText(childRow.title, popover, childRow)
                if rowLabel then
                    AppendSearchEntry(entries, seen, resolvedPageId, "popover-row", 1, rowLabel, {
                        tabKey = tabKey,
                        tabTitle = tabTitle,
                        sectionIndex = sectionIndex,
                        sectionTitle = sectionTitle,
                        popoverKey = popover.key,
                        popoverTitle = displayTitle,
                        popRowKey = popRowKey,
                        contextLabel = JoinSearchContext(tabTitle, sectionTitle, displayTitle),
                    })
                end
            end
        end
    end

    for blockIndex, block in ipairs(page.blocks or {}) do
        if block.kind == "description" then
            local text = CleanSearchText(block.component and block.component.GetText and block.component:GetText())
                or CleanSearchText(block.text)
            if text then
                local section = block.owner
                local tab = block.tab or (section and section.tab)
                local tabTitle = tab and CleanSearchText(tab.title) or nil
                local sectionTitle = section and CleanSearchText(section.title) or nil
                AppendSearchEntry(entries, seen, resolvedPageId, "description", 3, text, {
                    tabKey = tab and tab.key or nil,
                    tabTitle = tabTitle,
                    sectionIndex = section and sectionIndexMap[section] or nil,
                    sectionTitle = sectionTitle,
                    blockIndex = blockIndex,
                    contextLabel = JoinSearchContext(tabTitle, sectionTitle),
                })
            end
        end
    end

    return entries
end

function SettingsBuilder:CollectPageSearchIndex(pageId, definition, liveContext)
    local livePage = liveContext and self:GetPage(liveContext) or nil
    if livePage then
        return self:ExtractSearchEntries(livePage, pageId)
    end
    if type(definition) ~= "table" or type(definition.build) ~= "function" then
        return {}
    end
    local dryContext = NewDryRunContext(pageId)
    pcall(definition.build, dryContext)
    if dryContext.dryRunPage then
        return self:ExtractSearchEntries(dryContext.dryRunPage, pageId)
    end
    return {}
end

function SettingsBuilder:HideSearchHighlight()
    local hl = self.searchHighlight
    if not hl then return false end
    if hl.animGroup and hl.animGroup.Stop then
        hl.animGroup:Stop()
    end
    hl.target = nil
    if hl.frame and hl.frame.Hide then
        hl.frame:Hide()
    end
    return true
end

function SettingsBuilder:_HighlightComponent(target)
    if not target then return false end
    local targetFrame = GetFrame(target)
    if not targetFrame then return false end
    local hl = self.searchHighlight
    if not hl then
        local createFrame = self.system and self.system.components
            and self.system.components.createFrame or _G.CreateFrame
        if type(createFrame) ~= "function" then return false end
        local frame = createFrame("Frame", nil, targetFrame)
        if not frame then return false end
        if frame.EnableMouse then frame:EnableMouse(false) end
        local fill = frame.CreateTexture and frame:CreateTexture(nil, "OVERLAY") or nil
        if fill and fill.SetAllPoints then fill:SetAllPoints(frame) end
        local edges = {}
        if frame.CreateTexture then
            for _, key in ipairs({ "top", "bottom", "left", "right" }) do
                edges[key] = frame:CreateTexture(nil, "OVERLAY")
            end
            edges.top:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
            edges.top:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
            if edges.top.SetHeight then edges.top:SetHeight(2) elseif edges.top.SetSize then edges.top:SetSize(2, 2) end
            edges.bottom:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
            edges.bottom:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
            if edges.bottom.SetHeight then edges.bottom:SetHeight(2) elseif edges.bottom.SetSize then edges.bottom:SetSize(2, 2) end
            edges.left:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
            edges.left:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
            if edges.left.SetWidth then edges.left:SetWidth(2) elseif edges.left.SetSize then edges.left:SetSize(2, 2) end
            edges.right:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
            edges.right:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
            if edges.right.SetWidth then edges.right:SetWidth(2) elseif edges.right.SetSize then edges.right:SetSize(2, 2) end
        end
        local animGroup
        if frame.CreateAnimationGroup then
            animGroup = frame:CreateAnimationGroup()
            if animGroup and animGroup.CreateAnimation then
                local fadeOut = animGroup:CreateAnimation("Alpha")
                fadeOut:SetFromAlpha(1)
                fadeOut:SetToAlpha(0.25)
                fadeOut:SetDuration(0.4)
                fadeOut:SetOrder(1)
                local fadeIn = animGroup:CreateAnimation("Alpha")
                fadeIn:SetFromAlpha(0.25)
                fadeIn:SetToAlpha(1)
                fadeIn:SetDuration(0.3)
                fadeIn:SetOrder(2)
                local settle = animGroup:CreateAnimation("Alpha")
                settle:SetFromAlpha(1)
                settle:SetToAlpha(0)
                settle:SetDuration(0.8)
                settle:SetStartDelay(0.35)
                settle:SetOrder(3)
                animGroup:SetScript("OnFinished", function()
                    frame:Hide()
                end)
            end
        end
        hl = { frame = frame, fill = fill, edges = edges, animGroup = animGroup }
        self.searchHighlight = hl
    end

    local accent = self.system and self.system.theme and self.system.theme:Get("color.accent")
        or { 0, 1, 0, 1 }
    local r, g, b = accent[1] or 0, accent[2] or 1, accent[3] or 0
    if hl.fill and hl.fill.SetColorTexture then
        hl.fill:SetColorTexture(r, g, b, 0.12)
    end
    for _, edge in pairs(hl.edges) do
        if edge and edge.SetColorTexture then
            edge:SetColorTexture(r, g, b, 0.95)
        end
    end

    local frame = hl.frame
    if hl.animGroup and hl.animGroup.Stop then hl.animGroup:Stop() end
    if frame.SetParent then frame:SetParent(targetFrame) end
    if frame.ClearAllPoints then frame:ClearAllPoints() end
    if frame.SetAllPoints then
        frame:SetAllPoints(targetFrame)
    elseif frame.SetPoint then
        frame:SetPoint("TOPLEFT", targetFrame, "TOPLEFT", 0, 0)
        frame:SetPoint("BOTTOMRIGHT", targetFrame, "BOTTOMRIGHT", 0, 0)
    end
    if frame.SetFrameStrata and targetFrame.GetFrameStrata then
        frame:SetFrameStrata(targetFrame:GetFrameStrata())
    end
    if frame.SetFrameLevel and targetFrame.GetFrameLevel then
        frame:SetFrameLevel((targetFrame:GetFrameLevel() or 0) + 12)
    end
    if frame.SetAlpha then frame:SetAlpha(1) end
    hl.target = target
    if frame.Show then frame:Show() end
    if hl.animGroup and hl.animGroup.Play then hl.animGroup:Play() end
    return true
end

function Page:ScrollToY(y)
    if self.dryRun or not self.scroll then return false end
    local frame = GetFrame(self.scroll)
    if not frame then return false end
    if frame.UpdateScrollChildRect then frame:UpdateScrollChildRect() end
    local viewportHeight = frame.GetHeight and tonumber(frame:GetHeight()) or self.availableHeight or 0
    local computedRange = math.max(0, (self.contentHeight or 0) - viewportHeight)
    local range
    if frame.GetVerticalScrollRange then
        local apiRange = tonumber(frame:GetVerticalScrollRange()) or 0
        range = apiRange > 0 and apiRange or computedRange
    else
        range = computedRange
    end
    local target = math.max(0, (tonumber(y) or 0) - 48)
    local clamped = math.max(0, math.min(range, target))
    if frame.SetVerticalScroll then frame:SetVerticalScroll(clamped) end
    local bar = self.scroll.scrollBar
    if bar and bar.SetValue then bar:SetValue(clamped) end
    self.lastScrollY = clamped
    return true, clamped
end

local function FindSectionForHit(page, hit)
    if hit.sectionIndex and page.sections[hit.sectionIndex] then
        return page.sections[hit.sectionIndex]
    end
    if hit.sectionTitle then
        for _, section in ipairs(page.sections or {}) do
            if CleanSearchText(section.title) == hit.sectionTitle then
                return section
            end
        end
    end
    return nil
end

function Page:FocusSearchTarget(hit)
    if self.dryRun or type(hit) ~= "table" then return false end
    if self.manager then self.manager:HideSearchHighlight() end
    self:ClosePopovers()

    if hit.tabKey and self.tabs and self.tabs.items[hit.tabKey] then
        if self.tabs:GetSelected() ~= hit.tabKey then
            self.tabs:Select(hit.tabKey)
        end
    end
    if not self.layoutCount or self.layoutCount == 0 then
        self:RefreshLayout()
    end

    local kind = hit.kind
    local resolvedKind
    local targetComponent
    local scrollY

    if kind == "tab" then
        local tab = hit.tabKey and self.tabs and self.tabs.items[hit.tabKey]
        if tab and tab.button then
            scrollY = 0
            targetComponent = tab.button
            resolvedKind = "tab"
        end
    elseif kind == "section" then
        local section = FindSectionForHit(self, hit)
        if section and section.block and section.block.layoutY ~= nil and section.header then
            scrollY = section.block.layoutY
            targetComponent = section.header
            resolvedKind = "section"
        end
    elseif kind == "description" then
        local block = hit.blockIndex and self.blocks[hit.blockIndex]
        if block and block.kind == "description" and block.layoutY ~= nil and block.component then
            scrollY = block.layoutY
            targetComponent = block.component
            resolvedKind = "description"
        end
    elseif kind == "control" then
        local entry = hit.controlKey and self.controlEntries[hit.controlKey]
        if entry and entry.visible and entry.row and entry.row.block and entry.row.block.layoutY ~= nil then
            scrollY = entry.row.block.layoutY
            targetComponent = entry.layoutComponent or entry.component
            resolvedKind = "control"
        else
            local section = (entry and entry.row and entry.row.section) or FindSectionForHit(self, hit)
            if section and section.block and section.block.layoutY ~= nil and section.header then
                scrollY = section.block.layoutY
                targetComponent = section.header
                resolvedKind = "section-fallback"
            end
        end
    elseif kind == "popover" or kind == "popover-row" then
        local popover = hit.popoverKey and self.popovers[hit.popoverKey]
        if popover then
            local row = popover.row or (popover.key and self.controlEntries[popover.key] and self.controlEntries[popover.key].row)
            local rowBlock = row and row.block
            if rowBlock and rowBlock.layoutY ~= nil then
                self:ScrollToY(rowBlock.layoutY)
            end
            local btn = popover.button
            local btnEntry = popover.key and self.controlEntries[popover.key]
            local btnVisible = (not btnEntry or btnEntry.visible) and (not btn or not btn.IsVisible or btn:IsVisible())
            local btnEnabled = not btn or btn.enabled ~= false
            if kind == "popover-row" and btnVisible and btnEnabled then
                local ok, shown = pcall(popover.Show, popover)
                if ok and shown and popover.visible then
                    local child = hit.popRowKey and popover:GetControl(hit.popRowKey)
                    if child and (not child.IsVisible or child:IsVisible()) then
                        targetComponent = child
                        resolvedKind = "popover-row"
                    elseif popover.popup then
                        targetComponent = popover.popup
                        resolvedKind = "popover-popup"
                    end
                end
            end
            if not targetComponent and btn and btnVisible then
                targetComponent = btn
                resolvedKind = "popover"
            elseif not targetComponent then
                local section = (row and row.section) or FindSectionForHit(self, hit)
                if section and section.block and section.block.layoutY ~= nil and section.header then
                    scrollY = section.block.layoutY
                    targetComponent = section.header
                    resolvedKind = "section-fallback"
                end
            end
        end
    end

    if scrollY ~= nil then
        self:ScrollToY(scrollY)
    end
    self.lastFocusedHit = hit
    if targetComponent and self.manager then
        self.manager:_HighlightComponent(targetComponent)
        return true, resolvedKind
    end
    return false, resolvedKind
end

UI.SettingsBuilder = SettingsBuilder

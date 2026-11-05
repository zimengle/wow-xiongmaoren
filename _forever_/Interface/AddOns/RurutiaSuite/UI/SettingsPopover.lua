local _, RS = ...
local UI = RS.UI

local SettingsPopover = {}
SettingsPopover.__index = SettingsPopover

local Popover = {}
Popover.__index = Popover

local SUPPORTED_KINDS = {
    button = true,
    checkbox = true,
    color = true,
    dropdown = true,
    editbox = true,
    slider = true,
}

local KIND_ALIASES = {
    button = "button",
    checkbox = "checkbox",
    color = "color",
    colorpicker = "color",
    dropdown = "dropdown",
    editbox = "editbox",
    input = "editbox",
    slider = "slider",
    toggle = "checkbox",
}

local DEFAULT_ICON = "Interface\\AddOns\\RurutiaSuite\\Media\\Textures\\settings-gear-white.png"

local function CopyTable(source)
    local result = {}
    if type(source) == "table" then
        for key, value in pairs(source) do result[key] = value end
    end
    return result
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

local function ReleaseObjects(context, objects)
    local index = #objects
    while index >= 1 do
        ReleaseContextObject(context, objects[index])
        index = index - 1
    end
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
    return pcall(function()
        region:ClearAllPoints()
        local index = 1
        while index <= #points do
            local point = points[index]
            region:SetPoint(point[1], point[2], point[3], point[4], point[5])
            index = index + 1
        end
    end)
end

local function GetFrame(object)
    if type(object) == "table" and object.frame then return object.frame end
    return object
end

local function Resolve(value, ...)
    if type(value) == "function" then return value(...) end
    return value
end

local function TryResolve(value, ...)
    if type(value) ~= "function" then return true, value end
    local ok, result = pcall(value, ...)
    if not ok then return false, nil, tostring(result) end
    return true, result
end

local function SanitizeName(value)
    value = string.gsub(tostring(value or "Popover"), "[^%w_]", "_")
    return value ~= "" and value or "Popover"
end

local function NormalizeKind(row)
    local value = row and (row.kind or row.type)
    if type(value) ~= "string" then return nil end
    return KIND_ALIASES[string.lower(value)]
end

local function OnCatcherMouseDown(frame)
    local owner = frame.settingsPopoverOwner
    if owner then owner:CloseActive() end
end

function SettingsPopover:New(system)
    if type(system) ~= "table" or type(system.components) ~= "table" then
        return nil, "settings popover requires an initialized UI system"
    end
    local instance = setmetatable({}, self)
    instance.system = system
    instance.active = nil
    instance.catcher = nil
    instance.items = {}
    instance.created = 0
    instance.opened = 0
    return instance
end

function SettingsPopover:_EnsureCatcher()
    if self.catcher then return self.catcher end
    local parent = _G.UIParent
    local catcher, reason = self.system.components:Create("frame", parent, {
        name = "RurutiaSuiteSettingsPopoverCatcher",
        hidden = true,
        noBackdrop = true,
        noBorder = true,
        frameStrata = "DIALOG",
        frameLevel = 190,
    })
    if not catcher then return nil, reason end
    local configured, configureReason = pcall(function()
        local frame = catcher.frame
        if frame.SetAllPoints then
            frame:SetAllPoints(parent)
        elseif frame.SetPoint then
            frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
            frame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0)
        end
        if frame.EnableMouse then frame:EnableMouse(true) end
        frame.settingsPopoverOwner = self
        frame:SetScript("OnMouseDown", OnCatcherMouseDown)
    end)
    if not configured then
        pcall(catcher.Release, catcher)
        return nil, tostring(configureReason)
    end
    self.catcher = catcher
    return catcher
end

function SettingsPopover:Create(page, key, button, options)
    if type(page) ~= "table" or type(page.context) ~= "table"
        or type(button) ~= "table" or type(options) ~= "table" then
        return nil, "settings popover requires a page, button, and options"
    end
    if type(options.rows) ~= "table" or #options.rows == 0 then
        return nil, "settings popover requires at least one row"
    end

    local instance = setmetatable({
        controller = self,
        page = page,
        context = page.context,
        key = key,
        button = button,
        options = options,
        rows = options.rows,
        controls = {},
        controlOrder = {},
        popup = nil,
        title = nil,
        created = false,
        visible = false,
        released = false,
        refreshCount = 0,
    }, Popover)

    local frame = button.frame
    local buttonText = button.options and button.options.text
    local hasButtonText = type(buttonText) == "string" and buttonText ~= ""
    local previousOnAction = button.onAction
    local previousOnEnter = button.onEnter
    local previousOnLeave = button.onLeave
    local originalLabelPoints = CapturePoints(button.label)
    instance.previousOnAction = previousOnAction
    instance.previousOnEnter = previousOnEnter
    instance.previousOnLeave = previousOnLeave
    instance.originalLabelPoints = originalLabelPoints
    local configured, configureReason = pcall(function()
        local icon = options.showIcon ~= false and frame and frame.CreateTexture
            and frame:CreateTexture(nil, "ARTWORK") or nil
        instance.icon = icon
        button.settingsIcon = icon
        if icon then
            icon:SetTexture(options.icon or DEFAULT_ICON)
            if hasButtonText then
                local iconSize = tonumber(options.iconSize) or self.system.theme:Get("layout.settingsIconSize") or 18
                -- Match the 32px switch track's horizontal center in its column.
                local inset = button.options and button.options.matchToggleColumn and (32 - iconSize) / 2 or 10
                icon:SetPoint("RIGHT", frame, "RIGHT", -inset, 0)
            else
                icon:SetPoint("CENTER", frame, "CENTER", 0, 0)
            end
            if icon.SetSize then
                local iconSize = tonumber(options.iconSize) or self.system.theme:Get("layout.settingsIconSize") or 18
                icon:SetSize(iconSize, iconSize)
            end
            if icon.SetVertexColor then icon:SetVertexColor(1, 1, 1, 1) end
            if hasButtonText and button.label then
                button.label:ClearAllPoints()
                button.label:SetPoint("LEFT", frame, "LEFT", 10, 0)
                button.label:SetPoint("RIGHT", icon, "LEFT", -4, 0)
                if button.label.SetJustifyH then button.label:SetJustifyH("LEFT") end
            end
        end
        button.settingsPopover = instance
        button:SetOnAction(function() instance:Toggle() end)
        button:SetOnEnter(function(component)
            if type(previousOnEnter) == "function" then previousOnEnter(component) end
            instance:RefreshButton()
        end)
        button:SetOnLeave(function(component)
            if type(previousOnLeave) == "function" then previousOnLeave(component) end
            instance:RefreshButton()
        end)
        instance:RefreshButton()
    end)
    if not configured then
        if instance.icon and instance.icon.Hide then pcall(instance.icon.Hide, instance.icon) end
        RestorePoints(button.label, originalLabelPoints)
        if button.settingsPopover == instance then button.settingsPopover = nil end
        pcall(button.SetOnAction, button, previousOnAction)
        pcall(button.SetOnEnter, button, previousOnEnter)
        pcall(button.SetOnLeave, button, previousOnLeave)
        instance.icon = nil
        return nil, tostring(configureReason)
    end

    self.items[#self.items + 1] = instance
    return instance
end

function SettingsPopover:Open(popover)
    if not popover or popover.released then return false end
    if self.active and self.active ~= popover then self.active:Hide() end
    local ensured, popup, reason = pcall(popover.EnsureCreated, popover)
    if not ensured then
        reason, popup = popup, nil
    end
    if not popup then return false, reason end
    local caught, catcher, catcherReason = pcall(self._EnsureCatcher, self)
    if not caught then
        catcherReason, catcher = catcher, nil
    end
    if not catcher then
        popover:_DiscardCreated()
        return false, catcherReason
    end

    local opened, openReason = pcall(function()
        local refreshed, refreshReason = popover:Refresh()
        if not refreshed then
            error(refreshReason or "settings popover refresh failed", 0)
        end
        self.active = popover
        catcher:SetVisible(true)
        popup.frame:ClearAllPoints()
        popup.frame:SetPoint(
            popover.options.anchorPoint or "TOP",
            popover.button.frame,
            popover.options.relativePoint or "BOTTOM",
            tonumber(popover.options.x) or 0,
            tonumber(popover.options.y) or -6
        )
        popup:SetVisible(true)
        popover.visible = true
        popover:RefreshButton()
    end)
    if not opened then
        if self.active == popover then self.active = nil end
        popover.visible = false
        pcall(catcher.SetVisible, catcher, false)
        pcall(popup.SetVisible, popup, false)
        popover:_DiscardCreated()
        return false, tostring(openReason)
    end
    self.opened = self.opened + 1
    return true
end

function SettingsPopover:CloseActive()
    local active = self.active
    if not active then
        if self.catcher then self.catcher:SetVisible(false) end
        return false
    end
    return active:Hide()
end

function SettingsPopover:_HandleHidden(popover)
    if self.active == popover then
        self.active = nil
        if self.catcher then self.catcher:SetVisible(false) end
    end
end

function SettingsPopover:Remove(popover)
    if not popover then return false end
    if self.active == popover then self:CloseActive() end
    local index = #self.items
    while index >= 1 do
        if self.items[index] == popover then
            table.remove(self.items, index)
            break
        end
        index = index - 1
    end
    return true
end

function SettingsPopover:GetDiagnostics()
    return {
        registered = #self.items,
        created = self.created,
        opened = self.opened,
        active = self.active and self.active.key or nil,
        catcherBuilt = self.catcher ~= nil,
    }
end

function Popover:RefreshButton()
    if not self.icon or not self.icon.SetAlpha then return false end
    local alpha
    if self.visible then alpha = 1
    elseif self.button and self.button.hovered then alpha = 0.9
    else alpha = 0.6 end
    self.icon:SetAlpha(alpha)
    return true
end

function Popover:EnsureCreated()
    if self.popup then return self.popup end
    if self.released then return nil, "settings popover was released" end

    local normalizedRows = {}
    local seenKeys = {}
    local index = 1
    while index <= #self.rows do
        local row = self.rows[index]
        local kind = NormalizeKind(row)
        if not kind or not SUPPORTED_KINDS[kind] then
            return nil, "unsupported settings popover row kind"
        end
        local key = row.key or tostring(index)
        if seenKeys[key] then return nil, "duplicate settings popover row key" end
        seenKeys[key] = true
        normalizedRows[index] = { row = row, kind = kind, key = key }
        index = index + 1
    end

    local resources = {}
    local built, result = pcall(function()
        local width = tonumber(self.options.width) or 440
        local sidePadding = tonumber(self.options.sidePadding) or 12
        local topPadding = tonumber(self.options.topPadding) or 12
        local titleHeight = tonumber(self.options.titleHeight) or 24
        local rowHeight = tonumber(self.options.rowHeight) or 38
        local rowGap = tonumber(self.options.rowGap) or 6
        local rowCount = #self.rows
        local height = topPadding + titleHeight + 8
            + rowCount * rowHeight + math.max(0, rowCount - 1) * rowGap + sidePadding
        local pageId = self.page.options and self.page.options.id or self.context.id or "Page"
        local name = "RurutiaSuiteSettingsPopover_"
            .. SanitizeName(pageId) .. "_" .. SanitizeName(self.key)
        local parent = _G.UIParent or GetFrame(self.context:GetRoot())
        local popup, reason = self.context:Create("popup", parent, {
            name = name,
            width = width,
            height = height,
            hidden = true,
            backgroundToken = self.options.backgroundToken or "color.popover.background",
            borderToken = self.options.borderToken or "color.popover.border",
            accentEdge = self.options.accentEdge ~= false,
            frameStrata = "DIALOG",
            frameLevel = 200,
        })
        if not popup then error(reason or "settings popover popup is unavailable", 0) end
        resources[#resources + 1] = popup
        local frame = popup.frame
        if frame.SetClampedToScreen then frame:SetClampedToScreen(true) end
        if frame.EnableMouse then frame:EnableMouse(true) end

        local title, titleReason = self.context:Create("label", popup, {
            text = self.options.title or "高级设置",
            width = width - sidePadding * 2,
            height = titleHeight,
            point = "TOPLEFT",
            relativeTo = popup,
            relativePoint = "TOPLEFT",
            x = sidePadding,
            y = -topPadding,
            fontKey = "heading",
            textToken = "color.text.normal",
            justifyH = "CENTER",
            noBackdrop = true,
            noBorder = true,
        })
        if not title then error(titleReason or "settings popover title is unavailable", 0) end
        resources[#resources + 1] = title

        local builtControls = {}
        local builtOrder = {}
        index = 1
        while index <= rowCount do
            local normalized = normalizedRows[index]
            local row, kind, key = normalized.row, normalized.kind, normalized.key
            local prepared = CopyTable(row)
            prepared.kind = nil
            prepared.type = nil
            prepared.key = nil
            prepared.label = nil
            prepared.get = nil
            prepared.getValue = nil
            prepared.getEnabled = nil
            prepared.getVisible = nil
            prepared.set = nil
            prepared.text = row.text or row.label or ""
            prepared.width = width - sidePadding * 2
            prepared.height = tonumber(row.height) or rowHeight
            prepared.point = "TOPLEFT"
            prepared.relativeTo = popup
            prepared.relativePoint = "TOPLEFT"
            prepared.x = sidePadding
            prepared.y = -(topPadding + titleHeight + 8 + (index - 1) * (rowHeight + rowGap))
            prepared.backgroundToken = row.backgroundToken or "color.transparent"
            prepared.noBorder = row.noBorder ~= false
            prepared.value = Resolve(row.getValue or row.get, self, row)
            prepared.enabled = Resolve(row.getEnabled, self, row) ~= false
            prepared.hidden = Resolve(row.getVisible, self, row) == false
            local write = row.onChange or row.set
            if type(write) == "function" then prepared.onChange = write end
            local control, controlReason = self.context:Create(kind, popup, prepared)
            if not control then
                error(controlReason or "settings popover control is unavailable", 0)
            end
            resources[#resources + 1] = control
            control.settingsPopoverOwner = self
            builtControls[key] = control
            builtOrder[#builtOrder + 1] = { row = row, control = control }
            index = index + 1
        end
        popup:SetOnHide(function() self:_HandleHidden() end)
        return {
            popup = popup,
            title = title,
            controls = builtControls,
            controlOrder = builtOrder,
        }
    end)
    if not built then
        ReleaseObjects(self.context, resources)
        return nil, tostring(result)
    end

    self.popup = result.popup
    self.title = result.title
    self.controls = result.controls
    self.controlOrder = result.controlOrder
    self.created = true
    self.controller.created = self.controller.created + 1
    local invoked, refreshed, refreshReason = pcall(self.Refresh, self)
    if not invoked or refreshed == false then
        self:_DiscardCreated()
        return nil, tostring(invoked and refreshReason or refreshed)
    end
    return self.popup
end

function Popover:_DiscardCreated()
    local hadResources = self.popup ~= nil or self.title ~= nil or #self.controlOrder > 0
    local wasCreated = self.created
    self.visible = false
    pcall(self.controller._HandleHidden, self.controller, self)
    local resources = {}
    if self.popup then resources[#resources + 1] = self.popup end
    if self.title then resources[#resources + 1] = self.title end
    local index = 1
    while index <= #self.controlOrder do
        resources[#resources + 1] = self.controlOrder[index].control
        index = index + 1
    end
    ReleaseObjects(self.context, resources)
    self.popup = nil
    self.title = nil
    self.controls = {}
    self.controlOrder = {}
    self.created = false
    if wasCreated then
        self.controller.created = math.max(0, self.controller.created - 1)
    end
    pcall(self.RefreshButton, self)
    return hadResources
end

function Popover:_HandleHidden()
    self.visible = false
    self.controller:_HandleHidden(self)
    self:RefreshButton()
end

function Popover:GetControl(key)
    return self.controls[key]
end

function Popover:PrepareRefresh()
    if not self.created or self.released then
        return nil, "settings popover is not available for refresh"
    end
    local prepared = {}
    local index = 1
    while index <= #self.controlOrder do
        local entry = self.controlOrder[index]
        local row = entry.row
        local values = { entry = entry }
        local getter = row.getValue or row.get
        if getter then
            local ok, value, reason = TryResolve(getter, self, row)
            if not ok then
                return nil, "settings popover value getter failed [" .. tostring(row.key or index)
                    .. "]: " .. tostring(reason)
            end
            values.hasValue, values.value = true, value
        end
        if row.getText then
            local ok, value, reason = TryResolve(row.getText, self, row)
            if not ok then
                return nil, "settings popover text getter failed [" .. tostring(row.key or index)
                    .. "]: " .. tostring(reason)
            end
            values.hasText, values.text = true, value or ""
        end
        if row.getEnabled then
            local ok, value, reason = TryResolve(row.getEnabled, self, row)
            if not ok then
                return nil, "settings popover enabled getter failed [" .. tostring(row.key or index)
                    .. "]: " .. tostring(reason)
            end
            values.hasEnabled, values.enabled = true, value ~= false
        end
        if row.getVisible then
            local ok, value, reason = TryResolve(row.getVisible, self, row)
            if not ok then
                return nil, "settings popover visible getter failed [" .. tostring(row.key or index)
                    .. "]: " .. tostring(reason)
            end
            values.hasVisible, values.visible = true, value ~= false
        end
        prepared[index] = values
        index = index + 1
    end
    return prepared
end

function Popover:ApplyPreparedRefresh(prepared)
    if not self.created or self.released or type(prepared) ~= "table" then return false end
    local index = 1
    while index <= #prepared do
        local values = prepared[index]
        local control = values.entry.control
        if values.hasValue then control:SetValue(values.value, true) end
        if values.hasText then control:SetText(values.text) end
        if values.hasEnabled then control:SetEnabled(values.enabled) end
        if values.hasVisible then control:SetVisible(values.visible) end
        index = index + 1
    end
    -- Hidden rows do not reserve space; reuse the existing controls on refresh.
    local padding = tonumber(self.options.sidePadding) or 12
    local cursor = (tonumber(self.options.topPadding) or 12)
        + (tonumber(self.options.titleHeight) or 24) + 8
    local gap = tonumber(self.options.rowGap) or 6
    local count = 0
    for _, entry in ipairs(self.controlOrder) do
        if entry.control:IsVisible() then
            if count > 0 then cursor = cursor + gap end
            local frame = entry.control.frame
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", self.popup.frame, "TOPLEFT", padding, -cursor)
            cursor = cursor + (tonumber(entry.row.height) or tonumber(self.options.rowHeight) or 38)
            count = count + 1
        end
    end
    self.popup.frame:SetHeight(cursor + padding)
    self.refreshCount = self.refreshCount + 1
    return true
end

function Popover:Refresh()
    local prepared, reason = self:PrepareRefresh()
    if not prepared then return false, reason end
    local invoked, applied = pcall(self.ApplyPreparedRefresh, self, prepared)
    if not invoked then return false, tostring(applied) end
    if applied == false then return false, "settings popover refresh could not be applied" end
    return true
end

function Popover:Show()
    return self.controller:Open(self)
end

function Popover:Hide()
    if not self.popup then
        self.visible = false
        self.controller:_HandleHidden(self)
        self:RefreshButton()
        return false
    end
    self.popup:SetVisible(false)
    return true
end

function Popover:Toggle()
    if self.visible then return self:Hide() end
    return self:Show()
end

function Popover:Release()
    if self.released then return false end
    pcall(self.Hide, self)
    pcall(self.controller.Remove, self.controller, self)
    self:_DiscardCreated()
    if self.button then
        if self.button.settingsPopover == self then self.button.settingsPopover = nil end
        if self.button.settingsIcon == self.icon then self.button.settingsIcon = nil end
        RestorePoints(self.button.label, self.originalLabelPoints)
        pcall(self.button.SetOnAction, self.button, self.previousOnAction)
        pcall(self.button.SetOnEnter, self.button, self.previousOnEnter)
        pcall(self.button.SetOnLeave, self.button, self.previousOnLeave)
    end
    if self.icon and self.icon.Hide then pcall(self.icon.Hide, self.icon) end
    self.icon = nil
    self.button = nil
    self.released = true
    return true
end

UI.SettingsPopover = SettingsPopover

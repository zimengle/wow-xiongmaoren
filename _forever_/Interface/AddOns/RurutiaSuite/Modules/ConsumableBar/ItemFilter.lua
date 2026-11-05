-- 文件职责：消耗品过滤标签、缓存目录与虚拟四列网格；资源归页面 context 所有。
local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ConsumableBar")) then return end

local Definition = ns.Runtime and ns.Runtime:GetModule("ConsumableBar") or ns.ConsumableBarDefinition
if type(Definition) ~= "table" then
    error("ConsumableBar Definition.lua must load before ItemFilter.lua", 2)
end
local Data = Definition.DATA

local function GetItemWindowGroup(context)
    local groupIndex = tonumber(context.consumableBarItemGroup) or 1
    if not Data.groups[groupIndex] then groupIndex = 1 end
    context.consumableBarItemGroup = groupIndex
    return Data.groups[groupIndex]
end

-- Cache definition rows per group for the lifetime of this settings context.
-- Runtime indexes may be released/rebuilt while this page is closed.
local function GetGroupRows(context, module)
    local group = GetItemWindowGroup(context)
    local cache = context.consumableBarItemRowCache
    if not cache then cache = {}; context.consumableBarItemRowCache = cache end
    local entry = cache[group.key]
    if entry and entry.source == group.items and entry.count == #group.items then return entry.rows end
    if not context.consumableBarItemRowMeta then
        -- Retain identity only. Labels are requested by visible controls; search
        -- text is derived only during a search, without warming every item icon.
        context.consumableBarItemRowMeta = { __index = function(row, key)
            if key == "itemKey" then return row.info.key end
            if key == "label" then return module:GetItemSettingLabel(row) end
            if key == "searchText" then return module:GetItemSettingSearchText(row) end
        end }
    end
    local rows = {}
    for _, key in ipairs(group.items) do
        local info = module.catalog[key]
        if info then
            for _, row in ipairs(module:GetItemSettingRows(info, key, true)) do
                row.info = info
                setmetatable(row, context.consumableBarItemRowMeta)
                rows[#rows + 1] = row
            end
        end
    end
    cache[group.key] = { source = group.items, count = #group.items, rows = rows }
    return rows
end

-- Only the viewport owns controls; the complete ordered catalog remains data.
local function BuildItemPage(root, context, module)
    local function Create(kind, parent, options)
        return assert(context:Create(kind, parent, options))
    end
    local page = { controls = {}, pool = {}, active = false }
    function page:GetControl(key) return self.controls[key] end
    function page:ClearSearchRows()
        if not self.searchRows then return end
        for _, row in ipairs(self.searchRows) do rawset(row, "searchText", nil) end
        self.searchRows = nil
    end
    local settings = context.consumableBarSettingsPage
    page.controls.search = settings:GetControl("search")
    page.controls.selectedOnly = settings:GetControl("selectedOnly")
    local scroll = Create("scroll", root, {
        width = math.max(1, root.frame:GetWidth()), height = math.max(26, root.frame:GetHeight()),
        contentWidth = math.max(1, root.frame:GetWidth() - 12), contentHeight = 1,
        backgroundToken = "color.transparent", borderToken = "color.transparent",
    })
    scroll.frame:SetPoint("TOPLEFT", root.frame, "TOPLEFT", 0, 0)
    scroll.frame:SetPoint("BOTTOMRIGHT", root.frame, "BOTTOMRIGHT", 0, 0)
    page.scroll = scroll
    local BindVisible
    local function Resize()
        if page.released then return end
        local width = math.max(1, root.frame:GetWidth())
        scroll.frame:SetSize(width, math.max(26, root.frame:GetHeight()))
        if BindVisible then BindVisible(true) end
    end
    Resize()
    root.frame:HookScript("OnSizeChanged", Resize)
    local theme = settings.system and settings.system.theme
    local rowHeight = theme and theme:Get("layout.toggleHeight") or 28
    local rowGap = theme and theme:Get("layout.rowGap") or 6
    local stride, bufferRows = rowHeight + rowGap, 2
    local binding = false
    local lastFirst, lastWidth, lastHeight, lastRows
    BindVisible = function(force)
        if binding or not page.active then return end
        binding = true
        local rows = context.consumableBarItemRows or {}
        local height = math.max(1, scroll.frame:GetHeight())
        local width = math.max(1, scroll.frame:GetWidth() - 12)
        local columns = math.max(1, math.min(4, math.floor((width + 12) / 210)))
        local totalRows = math.ceil(#rows / columns)
        local limit = math.min(totalRows, math.ceil(height / stride) + bufferRows) * columns
        local contentHeight = math.max(height, totalRows * stride)
        if scroll:GetContent():GetWidth() ~= width or scroll:GetContent():GetHeight() ~= contentHeight then
            scroll:SetContentSize(width, contentHeight)
        end
        local offset = math.max(0, math.min(scroll.frame:GetVerticalScroll() or 0, contentHeight - height))
        if offset ~= scroll.frame:GetVerticalScroll() then scroll.frame:SetVerticalScroll(offset) end
        local firstRow = math.max(0, math.floor(offset / stride) - 1)
        firstRow = math.min(firstRow, math.max(0, totalRows - limit / columns))
        if not force and firstRow == lastFirst and width == lastWidth and height == lastHeight
            and rows == lastRows then
            binding = false
            return
        end
        lastFirst, lastWidth, lastHeight, lastRows = firstRow, width, height, rows
        local cellWidth = (width - (columns - 1) * 12) / columns
        for slot = 1, limit do
            local control = page.pool[slot]
            if not control then
                control = Create("checkbox", scroll:GetContent(), {
                    variant = "square", height = rowHeight, width = cellWidth, text = "", wordWrap = false,
                    toggleSide = "left", toggleInset = 0, noBorder = true, checkHoverAccent = false,
                    backgroundToken = "color.transparent", borderToken = "color.transparent",
                    onChange = function(widget, value)
                        local entry = widget.entry
                        if not entry then return end
                        module:SetItemEnabled(entry.itemKey, value)
                        for _, other in ipairs(page.pool) do
                            if other.entry and other.entry.itemKey == entry.itemKey then
                                other:SetValue(value, true)
                            end
                        end
                        page:Refresh(false)
                    end,
                    onEnter = function(widget)
                        local entry = widget.entry
                        if entry then module:ShowItemSettingTooltip(widget, entry.info, entry.itemID) end
                    end,
                    onLeave = function() module:HideItemSettingTooltips() end,
                })
                page.pool[slot] = control
            end
            local index = firstRow * columns + slot
            local entry = rows[index]
            if control.entry ~= entry then
                if control.hovered then module:HideItemSettingTooltips() end
                control.hovered = false
            end
            control.entry, control.itemIndex = entry, entry and index or nil
            control.frame:ClearAllPoints()
            control.frame:SetPoint("TOPLEFT", scroll:GetContent(), "TOPLEFT",
                ((slot - 1) % columns) * (cellWidth + 12), -math.floor((index - 1) / columns) * stride)
            control.frame:SetWidth(cellWidth)
            control:SetText(entry and entry.label or "")
            control:SetValue(entry ~= nil and module:IsItemEnabled(entry.itemKey), true)
            control:SetVisible(entry ~= nil)
        end
        for slot = limit + 1, #page.pool do
            local control = page.pool[slot]
            control.entry, control.itemIndex = nil, nil
            control:SetVisible(false)
        end
        page.poolLimit = limit
        binding = false
    end
    -- Hook the template handler so its scrollbar synchronization stays intact.
    scroll.frame:HookScript("OnVerticalScroll", function()
        if not page.active or binding then return end
        module:HideItemSettingTooltips()
        BindVisible()
    end)
    scroll.frame:HookScript("OnSizeChanged", function() BindVisible() end)
    function page:Refresh(resetScroll)
        if not self.active then return end
        module:EnsureData(true)
        local rows = GetGroupRows(context, module)
        local query = self.query or ""
        if query == "" or self.searchRows ~= rows then
            self:ClearSearchRows()
            if query ~= "" then
                for _, row in ipairs(rows) do
                    rawset(row, "searchText", module:GetItemSettingSearchText(row))
                end
                self.searchRows = rows
            end
        end
        local selected, selectionChanged = 0, false
        for _, row in ipairs(rows) do
            local enabled = module:IsItemEnabled(row.itemKey)
            if row.enabled ~= enabled then selectionChanged = true; row.enabled = enabled end
            if enabled then selected = selected + 1 end
        end
        local group = GetItemWindowGroup(context)
        local selectionText = (group.title or group.label or group.key)
            .. "  ·  已选 " .. selected .. " / " .. #rows .. " 项"
        if context.consumableBarItemSelectionText ~= selectionText then
            context.consumableBarItemSelectionText = selectionText
            settings:Refresh("filter-selection")
        end
        if query == "" and not self.selectedOnly then
            context.consumableBarItemRows = rows
        else
            local filtered = self.filtered or {}
            self.filtered = filtered
            if self.filterSource ~= rows or self.filterQuery ~= query
                or self.filterSelectedOnly ~= self.selectedOnly or (self.selectedOnly and selectionChanged) then
                local count = 0
                for _, row in ipairs(rows) do
                    if (not self.selectedOnly or row.enabled)
                        and (query == "" or string.find(row.searchText, query, 1, true)) then
                        count = count + 1
                        filtered[count] = row
                    end
                end
                for index = #filtered, count + 1, -1 do filtered[index] = nil end
            end
            context.consumableBarItemRows = filtered
        end
        self.filterSource, self.filterQuery, self.filterSelectedOnly = rows, query, self.selectedOnly
        context.consumableBarItemRowCount = #context.consumableBarItemRows
        module:HideItemSettingTooltips()
        if resetScroll ~= false then
            binding = true
            scroll.frame:SetVerticalScroll(0)
            binding = false
        end
        BindVisible(true)
    end
    context:Track({ Release = function()
        page.active, page.released = false, true
        page:ClearSearchRows()
        -- Hook closures become inert before the context releases its controls.
    end })
    -- Initial allocation belongs to the lazy build transaction, including rollback.
    page.active = true
    page:Refresh(true)
    page.active = false
    return page
end

-- The filter is an inline tab body; no fullscreen surface or duplicate group selector.
local function BuildItemWindowBody(context, module)
    local host = assert(context.consumableBarFilterHost, "ConsumableBar filter host is unavailable")
    local panel = { visible = false }
    panel.root = assert(context:Create("frame", host, {
        width = host.frame:GetWidth(), height = host.frame:GetHeight(),
        noBorder = true, backgroundToken = "color.transparent",
    }))
    panel.root.frame:SetPoint("TOPLEFT", host.frame, "TOPLEFT", 0, 0)
    panel.root.frame:SetPoint("BOTTOMRIGHT", host.frame, "BOTTOMRIGHT", 0, 0)
    panel.page = BuildItemPage(panel.root, context, module)
    function panel:RefreshItems(resetScroll) return self.page:Refresh(resetScroll) end
    function panel:Hide()
        self.visible, self.page.active = false, false
        self.page:ClearSearchRows()
        module:HideItemSettingTooltips()
        self.root:SetVisible(false)
    end
    function panel:Show()
        self.visible, self.page.active = true, true
        self.root:SetVisible(true)
        self:RefreshItems(true)
    end
    context:Track({ Release = function() panel:Hide() end })
    panel.root:SetVisible(false)
    context.consumableBarItemWindow = panel
    return panel
end

-- This lazy build runs after the parent PageRegistry transaction has committed.
-- Roll back only objects and state acquired here, leaving the main page intact.
local function BuildItemWindow(context, module)
    local firstObject = #context.objects + 1
    local fields = {
        "consumableBarItemWindow", "consumableBarItemRows", "consumableBarItemGroup",
        "consumableBarItemRowCount", "consumableBarItemRowCache",
        "consumableBarItemSelectionText",
        "consumableBarItemRowMeta",
    }
    local previous = {}
    for _, key in ipairs(fields) do previous[key] = context[key] end
    local ok, result = pcall(BuildItemWindowBody, context, module)
    if ok then return result end

    -- Virtual grid cleanup runs through its tracked Release.
    -- Continue cleanup even if an individual component release fails.
    for index = #context.objects, firstObject, -1 do
        local object = context.objects[index]
        local frame = type(object) == "table" and object.frame
        if type(object.Release) == "function" then pcall(object.Release, object) end
        if frame then
            if frame.SetScript then
                for _, script in ipairs({ "OnHide", "OnShow", "OnClick", "OnUpdate", "OnMouseWheel" }) do
                    pcall(frame.SetScript, frame, script, nil)
                end
            end
            if frame.Hide then pcall(frame.Hide, frame) end
            if frame.ClearAllPoints then pcall(frame.ClearAllPoints, frame) end
        end
        context.objectIndex[object] = nil
        object.pageContext = nil
        context.objects[index] = nil
    end
    for _, key in ipairs(fields) do context[key] = previous[key] end
    module:HideItemSettingTooltips()
    error(result, 0)
end

-- Tab contents stay lazy and share the existing page context lifecycle.
function Definition:OpenItemFilter(context)
    local dialog = context.consumableBarItemWindow or BuildItemWindow(context, self)
    dialog:Show()
    return dialog
end

function Definition:RefreshItemFilter(context, resetScroll)
    local dialog = context.consumableBarItemWindow
    if dialog and dialog.visible then
        dialog:RefreshItems(resetScroll)
    end
end

function Definition:HideItemFilter(context)
    local dialog = context.consumableBarItemWindow
    if dialog then dialog:Hide() end
end

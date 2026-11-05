-- 文件职责：按需构建消耗品设置；页面独立于动作条开关持有临时目录索引。
local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ConsumableBar")) then return end

local Definition = ns.ConsumableBarDefinition
if type(Definition) ~= "table" then
    error("ConsumableBar Definition.lua must load before Settings.lua", 2)
end

local Adapter = Definition.ADAPTER
local Data = Definition.DATA
local Settings = {
    pageId = "consumableBar",
    registered = false,
}

local function FormatSettingIcon(icon)
    return "|T" .. tostring(icon or Definition.FALLBACK_ICON) .. ":15:15:0:0:64:64:5:59:5:59|t"
end

local function FindIndex(values, selected)
    local index
    for index = 1, #values do
        if values[index] == selected then return index end
    end
    return 1
end

function Definition:RefreshSettings()
    local system = ns.UISystem
    if system and type(system.RefreshPage) == "function" then
        system:RefreshPage(Settings.pageId)
        return true
    end
    return false
end

function Definition:GetItemSettingLabel(row)
    local info = row.info
    local name = row.side and self:GetClickFallbackName(info, row.side) or info.name
    local icon = row.side and self:GetItemIDIcon(row.itemID) or self:GetInfoIcon(info)
    return FormatSettingIcon(icon) .. " " .. (name or info.name or row.itemKey)
end

function Definition:GetItemSettingSearchText(row)
    local info = row.info
    local name = row.side and self:GetClickFallbackName(info, row.side) or info.name
    return string.lower(" " .. (name or info.name or row.itemKey):gsub("|T.-|t", "")
        .. " " .. tostring(row.itemID or "") .. " " .. row.itemKey)
end

function Definition:GetItemSettingRows(info, itemKey, compact)
    local rows = {}
    local left = info.clicks and info.clicks.left
    local right = info.clicks and info.clicks.right
    local leftID = left and left.type == "item" and left.id
    local rightID = right and right.type == "item" and right.id
    if leftID and rightID and leftID ~= rightID then
        rows[1] = {
            itemKey = (not compact or info.key ~= itemKey) and itemKey or nil,
            itemID = leftID,
            side = compact and "left" or nil,
            label = not compact and (FormatSettingIcon(self:GetItemIDIcon(leftID)) .. " "
                .. (self:GetClickFallbackName(info, "left") or info.name or itemKey)) or nil,
        }
        rows[2] = {
            itemKey = (not compact or info.key ~= itemKey) and itemKey or nil,
            itemID = rightID,
            side = compact and "right" or nil,
            label = not compact and (FormatSettingIcon(self:GetItemIDIcon(rightID)) .. " "
                .. (self:GetClickFallbackName(info, "right") or info.name or itemKey)) or nil,
        }
    else
        local itemID = leftID or rightID or self:GetPrimaryItemID(info)
        rows[1] = {
            itemKey = (not compact or info.key ~= itemKey) and itemKey or nil,
            itemID = itemID,
            label = not compact and (FormatSettingIcon(self:GetInfoIcon(info)) .. " " .. (info.name or itemKey)) or nil,
        }
    end
    return rows
end

function Definition:HideItemSettingTooltips()
    Adapter:HideTooltip()
end

function Definition:ShowItemSettingTooltip(widget, info, itemID)
    local owner = widget and (widget.frame or widget)
    return Adapter:ShowItemTooltip(owner, info, itemID)
end

function Definition:GetItemSettingItemLevel(itemID)
    if not itemID then return nil end
    local cached = self.itemLevelCache[itemID]
    if cached ~= nil then return cached ~= false and cached or nil end
    local level = Adapter:GetDetailedItemLevel(itemID)
    self.itemLevelCache[itemID] = level or false
    return level
end

function Definition:ApplySharedFont()
    self.settingsTooltipFontPath = self:ResolveFontPath()
    self.settingsTooltipFallbackFontPath = Adapter:GetSystemFontPath()
end

local function BuildPage(context, module)
    module:EnsureData(true)
    module:ApplySharedFont()
    context.consumableBarItemGroup = context.consumableBarItemGroup or 1
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then error("Unable to create ConsumableBar settings page: " .. tostring(reason), 2) end
    context.consumableBarSettingsPage = page
    context.consumableBarControls = page.controls
    if page:GetControl("ownedOnly") or page:GetControl("unavailable") then
        page:Refresh("reuse"); return page
    end
    if not module:IsAvailable() then
        page:Section(""):Row():Label("unavailable", {
            text = "当前客户端未登记消耗品数据，模块保持停机。", textToken = "color.text.muted",
        })
        page:Finish()
        return page
    end

    local tabs = assert(page:Tabs("consumableTabs", {
        default = "bar",
        onChange = function(_, key)
            page:ClosePopovers()
            module:HideItemSettingTooltips()
            if key == "items" then
                local ok, reason = pcall(module.OpenItemFilter, module, context)
                if not ok then
                    context.consumableBarTabs:Select("bar", true)
                    page:Refresh("filter-failed")
                    error(reason, 0)
                end
            else module:HideItemFilter(context) end
            page:Refresh("tab")
        end,
    }))
    context.consumableBarTabs = tabs
    local bar = tabs:Tab("bar", { title = "常规" })
    local items = tabs:Tab("items", { title = "物品过滤" })
    local groupButtons = {}
    local groups = items:Section(""):ActionRow({
        columns = #Data.groups + 2, allowMixed = true, autoWrap = true,
    })
    local function SelectGroup(index)
        if not Data.groups[index] then return end
        context.consumableBarItemGroup = index
        page:ClosePopovers()
        for i, control in pairs(groupButtons) do control:SetSelected(i == index) end
        module:RefreshItemFilter(context, true)
        page:Refresh("group")
    end
    for index, group in ipairs(Data.groups) do
        local selected = index
        local _, control = groups:Button("group:" .. group.key, {
            text = group.title or group.label or group.key,
            onAction = function() SelectGroup(selected) end,
        })
        groupButtons[index] = control
        control:SetSelected(index == context.consumableBarItemGroup)
    end
    local function FilterVisible() return tabs:GetSelected() == "items" end
    groups:EditBox("search", {
        text = "", placeholder = "搜索名称或物品ID…", width = 240, clearable = true,
        alignRight = true, getVisible = FilterVisible,
        tooltip = "搜索物品名称或物品 ID",
        onChange = function(_, value)
            local panel = context.consumableBarItemWindow
            if panel then
                panel.page.query = string.lower((value or ""):match("^%s*(.-)%s*$"))
                panel:RefreshItems(true)
            end
        end,
    })
    groups:Checkbox("selectedOnly", {
        text = "只看已选", variant = "square", width = 140, getVisible = FilterVisible,
        onChange = function(_, value)
            local panel = context.consumableBarItemWindow
            if panel then panel.page.selectedOnly = value == true; panel:RefreshItems(true) end
        end,
    })

    local globalSettings = bar:Section("全局设置"):ToggleRow({ columns = 2 })
    globalSettings:Checkbox("ownedOnly", {
        text = "仅显示持有物品", getValue = function() return module:GetProfile().ownedOnly end,
        onChange = function(_, value) module:ToggleOwnedOnly(value) end,
    })
    globalSettings:Checkbox("cooldownDesaturate", {
        text = "冷却中褪色",
        getValue = function() return module:GetProfile().cooldownDesaturate end,
        onChange = function(_, value) module:ToggleCooldownDesaturate(value) end,
    })
    for index, group in ipairs(Data.groups) do
        local section = bar:Section(group.title or group.label or group.key)
        local groupActions = section:ActionRow({ columns = 2, allowMixed = true })
        groupActions:Checkbox("groupEnabled:" .. group.key, {
            text = "启用分组", getValue = function() return module:IsGroupEnabled(group) end,
            onChange = function(_, value) module:SetGroupEnabled(group, value) end,
        })
        local rows, wrapLabels = {}, {}
        local function AppendSettingSpec(kind, key, options)
            options.kind, options.key = kind, key .. ":" .. group.key
            rows[#rows + 1] = options
        end
        local function WrapOrder()
            local growth = module:GetGroupValue(group, "growDirection", "RIGHT")
            local order = (growth == "RIGHT" or growth == "LEFT")
                and Definition.WRAP_DIRECTION_ORDER.horizontal or Definition.WRAP_DIRECTION_ORDER.vertical
            wrapLabels[1], wrapLabels[2] = Definition.WRAP_DIRECTIONS[order[1]], Definition.WRAP_DIRECTIONS[order[2]]
            return order
        end
        local function RefreshStyle()
            page:Refresh("style")
        end
        AppendSettingSpec("dropdown", "growth", {
            text = "增长方向", options = { "向右", "向左", "向下", "向上" }, order = { 1, 2, 3, 4 },
            getValue = function() return FindIndex(Definition.GROWTH_DIRECTION_ORDER, module:GetGroupValue(group, "growDirection", "RIGHT")) end,
            onChange = function(_, value)
                module:ApplyGroupGrowthDirectionSetting(group, Definition.GROWTH_DIRECTION_ORDER[value])
                WrapOrder(); RefreshStyle()
            end,
        })
        WrapOrder()
        AppendSettingSpec("dropdown", "wrap", {
            text = "排列方向", options = wrapLabels, order = { 1, 2 },
            getValue = function() return FindIndex(WrapOrder(), module:GetGroupWrapDirection(group)) end,
            onChange = function(_, value) module:ApplyGroupWrapDirectionSetting(group, WrapOrder()[value]); RefreshStyle() end,
        })
        AppendSettingSpec("slider", "count", {
            text = "每组个数", min = 1, max = group.categoryMenus and #module.CATEGORIES or math.max(#(group.items or {}), 1), step = 1,
            getValue = function() return module:GetGroupItemCount(group) end,
            onChange = function(_, value) module:ApplyGroupItemCountSetting(group, value) end,
        })
        local function Dimension(key, title, field, fallback, min, max, step)
            AppendSettingSpec("slider", key, {
                text = title, min = min, max = max, step = step,
                getValue = function() return module:GetGroupValue(group, field, fallback) end,
                onChange = function(_, value) module:ApplyGroupSetting(group, field, value) end,
            })
        end
        Dimension("width", "图标宽度", "buttonWidth", group.buttonWidth or 32, 16, 64, 1)
        Dimension("height", "图标高度", "buttonHeight", group.buttonHeight or 32, 16, 64, 1)
        Dimension("row", "行间距", "rowSpacing", group.rowSpace or group.space or 1, 0, 20, 0.5)
        Dimension("column", "列间距", "columnSpacing", group.columnSpace or group.space or 1, 0, 20, 0.5)
        if group.categoryMenus then
            AppendSettingSpec("slider", "foodMinLevel", {
                text = "食物最低需求等级", min = 0, max = 70, step = 1,
                getValue = function() return module:GetFoodMinLevel(group) end,
                onChange = function(_, value) module:SetGroupOverrideValue(group.key, "foodMinLevel", value, group.foodMinLevel or 40); module:QueueSecureRefresh() end,
            })
            AppendSettingSpec("slider", "menuItemsPerLine", {
                text = "菜单每行个数", min = 1, max = 12, step = 1,
                getValue = function() return module:GetMenuItemsPerLine(group) end,
                onChange = function(_, value) module:SetGroupOverrideValue(group.key, "menuItemsPerLine", value, 6); module:QueueSecureRefresh() end,
            })
        end
        if group.screenAnchorConfigurable then
            AppendSettingSpec("dropdown", "selfAnchor", {
                text = "自身锚点", options = { "中心", "上", "下", "左", "右", "左上", "右上", "左下", "右下" },
                tooltip = "选择分组自身用于定位的点。切换时保留当前位置，图标数量变化时以此点为基准。",
                order = { 1, 2, 3, 4, 5, 6, 7, 8, 9 },
                getValue = function() return FindIndex(Definition.SCREEN_ANCHOR_POINT_ORDER, module:GetGroupSelfAnchorPoint(group)) end,
                onChange = function(_, value) module:SetGroupSelfAnchorPoint(group, Definition.SCREEN_ANCHOR_POINT_ORDER[value]); RefreshStyle() end,
            })
            AppendSettingSpec("dropdown", "anchor", {
                text = "屏幕锚点", options = { "中心", "上", "下", "左", "右", "左上", "右上", "左下", "右下" },
                tooltip = "选择屏幕上用于计算位置偏移的点。切换时保留当前位置，之后拖动仍沿用此参照点。",
                order = { 1, 2, 3, 4, 5, 6, 7, 8, 9 },
                getValue = function() return FindIndex(Definition.SCREEN_ANCHOR_POINT_ORDER, module:GetGroupScreenAnchorPoint(group)) end,
                onChange = function(_, value) module:SetGroupScreenAnchorPoint(group, Definition.SCREEN_ANCHOR_POINT_ORDER[value]); RefreshStyle() end,
            })
        end
        groupActions:Popover("style:" .. group.key, {
            title = (group.title or group.key) .. " · 样式调整", rows = rows,
            width = 400, rowHeight = 36, rowGap = 6,
            button = { text = "样式调整", noBorder = false },
        })
    end
    -- A public frame-backed label reserves a responsive host for the existing virtual grid.
    local _, host = items:GridRow(1, { height = 120, fillRemaining = true, gapBefore = page.system and page.system.theme:Get("layout.toolbarGap") or 12 }):Label("filterHost", {
        text = "", noBorder = true, backgroundToken = "color.transparent",
    })
    context.consumableBarFilterHost = host
    local actions = assert(page:FooterActions({
        columns = 3, descriptionTextToken = "color.text.success",
        description = function()
            local total, selected = module:GetConsumableStats()
            local text = module:GetCurrentExpansionLabel() .. "  ·  预设 " .. total .. "  ·  已选 " .. selected
            if tabs:GetSelected() == "items" and context.consumableBarItemSelectionText then
                text = text .. "\n" .. context.consumableBarItemSelectionText
            end
            return text
        end,
    }))
    actions:Button("preview", { action = "preview", onDeactivate = function() if module.previewMode then module:SetPreviewMode(false) end end,
        text = "预览模式", getText = function() return module.previewMode and "取消预览" or "预览模式" end,
        onAction = function(control) module:SetPreviewMode(not module.previewMode, control) end,
    })
    actions:Button("resetPosition", { action = "resetPosition",
        text = "重置位置", tooltip = "重置所有分组的位置，保留物品选择和外观设置。",
        onAction = function() module:ResetPositions(); page:Refresh("reset-position") end,
    })
    actions:Button("reset", { action = "restoreDefaults",
        text = "恢复默认", tooltip = "恢复消耗品模块所有分组的默认设置。",
        onAction = function()
            page:ClosePopovers()
            module:HideItemSettingTooltips()
            page:ShowTextDialog({
                title = "恢复消耗品默认设置", confirmLabel = "恢复默认",
                description = "将恢复整个消耗品模块的默认设置。",
                value = "所有分组的位置、外观、物品选择和显示设置均会重置。",
                onConfirm = function()
                    module:ResetDefaults()
                    module:RefreshItemFilter(context, false)
                    page:Refresh("reset-defaults")
                    return true
                end,
            })
        end,
    })
    page:Finish()
    return page
end

function Settings:Refresh(context)
    local page = context and context.consumableBarSettingsPage
    if not page then return false end
    local module = ns.Runtime:GetModule("ConsumableBar")
    module:RefreshItemFilter(context, false)
    return page:Refresh("module-refresh")
end


function Settings:Register(module)
    if self.registered then return true end
    local system = ns.UISystem or (ns.UI and ns.UI.GetSystem and ns.UI:GetSystem())
    if type(system) ~= "table" or type(system.RegisterPage) ~= "function" then return false end
    local definition = {
        title = "消耗品",
        description = "设置动作条的显示方式和可用物品。",
        group = "qol",
        navigationOrder = 10,
        searchKeywords = { "体验优化", "怀旧服", "消耗品", "药水", "动作条" },
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                local available = module:IsAvailable()
                out.available = available
                out.enabled = profile ~= nil and profile.enabled == true
                out.mutable = available
                out.active = available and module:IsEnabled()
                out.pending = false
                out.reason = available and nil or "当前客户端没有可用的消耗品数据。"
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                if not desired and module.previewMode then
                    module:SetPreviewMode(false)
                end
                module:ToggleEnabled(desired)
                local profile = module:GetProfile()
                return profile ~= nil and profile.enabled == desired
            end,
        },
        build = function(context)
            local ok, result = pcall(BuildPage, context, module)
            -- 构建失败或尚未显示时不能遗留关闭模块的目录索引。
            if module:GetState() ~= "enabled" then module:ReleaseIndexes() end
            if not ok then error(result, 0) end
            return result
        end,
        onShow = function(context)
            module.settingsVisible = true
            module:EnsureData(true)
            module:ApplySharedFont()
            Settings:Refresh(context)
            if context.consumableBarTabs and context.consumableBarTabs:GetSelected() == "items" then module:OpenItemFilter(context) end
        end,
        onRefresh = function(context)
            module:EnsureData(true)
            Settings:Refresh(context)
        end,
        onHide = function(context)
            module:HideItemFilter(context)
            module.settingsVisible = false
            if module:GetState() ~= "enabled" then module:ReleaseIndexes() end
            module:HideItemSettingTooltips()
        end,
    }
    ns.ConsumableBarPageDefinition = definition
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("consumables", self.pageId)
    end
    return self.registered
end

ns.ConsumableBarSettings = Settings

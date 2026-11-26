local _, ns = ...
if not ns.Build.HasModule("HunterAspects") then return end
local Settings = {}
local ALIGNMENTS = {LEFT = "左对齐", CENTER = "居中", RIGHT = "右对齐", TOP = "顶部对齐", BOTTOM = "底部对齐"}
local ALIGNMENT_ORDER = {"LEFT", "CENTER", "RIGHT", "TOP", "BOTTOM"}
local DIRECTIONS = {LEFT = "向左", RIGHT = "向右", UP = "向上", DOWN = "向下"}
local DIRECTION_ORDER = {"RIGHT", "LEFT", "UP", "DOWN"}
local function Editable() return not ns.HunterAspectsAdapter:InCombat() end

local function AddTrackingSettings(page, module)
    local Tracking = ns.HunterAspectsTracking
    local section = page:Section("追踪设置")
    local function Profile() return module.db.profile.tracking end
    local function Enabled() return Profile().enabled end
    local function Merged() return Enabled() and not Profile().detached end
    local function Detached() return Enabled() and Profile().detached end
    local function CustomStyle() return Detached() and not Profile().useAspectStyle end
    local function Add(row, kind, key, options)
        options.getValue = function() return Profile()[key] end
        options.getEnabled = Editable
        options.onChange = function(control, value)
            if not Tracking.SetSetting(module, key, value) then control:SetValue(Profile()[key], true) end
        end
        row[kind](row, "tracking_" .. key, options)
    end
    local switches = section:ToggleRow()
    Add(switches, "Checkbox", "enabled", {text = "显示追踪"})
    Add(switches, "Checkbox", "detached", {text = "独立追踪条", getVisible = Enabled})

    local catalog
    local function GetCatalog()
        if module.trackingByID then return module.trackingByID end
        if not catalog then catalog = Tracking.CatalogByID() end
        return catalog
    end
    local function Counts()
        local p, byID = Profile(), GetCatalog()
        local checked, visible = 0, 0
        for _, id in ipairs(p.order) do
            if not p.hidden[id] then
                checked = checked + 1
                if byID[id].known and byID[id].name then visible = visible + 1 end
            end
        end
        return checked, module:IsEnabled() and visible or 0
    end
    local rows = {}
    for i = 1, #ns.HunterAspectsAdapter.TRACKING_IDS do
        local index = i
        local function Checked() return not Profile().hidden[Profile().order[index]] end
        rows[#rows + 1] = {
            kind = "checkbox", key = "tracking" .. i, variant = "square", toggleSide = "left", wordWrap = false,
            getValue = Checked, getEnabled = Editable,
            getText = function()
                local row = GetCatalog()[Profile().order[index]]
                local label = index .. ". " .. (row.name or tostring(row.id))
                return row.known and label or ("|cff999999" .. label .. "（未学会）|r")
            end,
            onChange = function(control, checked)
                if not Tracking.SetChecked(module, index, checked) then control:SetValue(Checked(), true) end
            end,
        }
        rows[#rows + 1] = {
            kind = "button", key = "up" .. i, text = "上移", noBorder = false,
            getEnabled = function() return index > 1 and Editable() end,
            onAction = function() Tracking.Move(module, index, -1) end,
        }
        rows[#rows + 1] = {
            kind = "button", key = "down" .. i, text = "下移", noBorder = false,
            getEnabled = function() return index < #Profile().order and Editable() end,
            onAction = function() Tracking.Move(module, index, 1) end,
        }
    end
    rows[#rows + 1] = {
        kind = "button", key = "restoreOrder", text = "恢复顺序", fullRow = true, noBorder = false,
        getEnabled = Editable, onAction = function() Tracking.RestoreOrder(module) end,
    }
    section:ActionRow():Popover("manageTracking", {
        button = {text = "管理追踪", getEnabled = Editable, getVisible = Enabled},
        columns = 3, columnWidths = {0, 52, 52}, width = 440, rowHeight = 30, rowGap = 4,
        title = "管理追踪",
        getTitle = function() return ("管理追踪（已勾选 %d/8）"):format(Counts()) end,
        beforeRefresh = function() catalog = nil end,
        rows = rows,
    })
    section:Row({rowHeight = 24, gapBefore = 2}):Label("trackingCount", {
        textToken = "color.text.muted", getVisible = Enabled,
        labelFill = true, justifyH = "LEFT", noBackdrop = true, noBorder = true,
        getText = function()
            if not Enabled() then return "" end
            local checked, visible = Counts()
            return ("已勾选 %d/8 · 当前可见 %d"):format(checked, visible)
        end})
    page:UpdateOptions({onRefresh = function()
        catalog = nil
        local popover = page:GetPopover("manageTracking")
        if popover and popover.visible and not Enabled() then popover:Hide() end
    end})

    local merge = section:FieldRow()
    Add(merge, "Dropdown", "slot", {text = "追踪格位置", getVisible = Merged,
        options = {LAST = "最后一格", FIRST = "第一格"}, order = {"LAST", "FIRST"}})
    Add(merge, "Dropdown", "menuDirection", {text = "展开方向", getVisible = Merged,
        options = {AUTO = "自动", UP = "向上", DOWN = "向下", LEFT = "向左", RIGHT = "向右"},
        order = {"AUTO", "UP", "DOWN", "LEFT", "RIGHT"}})
    Add(section:Row(), "Slider", "menuPerLine", {text = "弹出每列图标", min = 1, max = 9, step = 1, getVisible = Merged,
        getText = function()
            local direction = Tracking.GetMenuDirection(module.db.profile)
            return (direction == "UP" or direction == "DOWN") and "弹出每列图标" or "弹出每行图标"
        end})

    local growth = section:FieldRow()
    Add(growth, "Dropdown", "direction", {text = "生长方向", getVisible = Detached,
        options = DIRECTIONS, order = DIRECTION_ORDER})
    Add(section:Row(), "Slider", "perLine", {text = "每行图标", min = 1, max = 9, step = 1, getVisible = Detached,
        getText = function()
            local direction = Profile().direction
            return (direction == "UP" or direction == "DOWN") and "每列图标" or "每行图标"
        end})
    local style = section:FieldRow()
    Add(style, "Dropdown", "alignment", {text = "对齐方式", getVisible = Detached,
        options = ALIGNMENTS, order = ALIGNMENT_ORDER})
    Add(style, "Dropdown", "useAspectStyle", {text = "图标样式", getVisible = Detached,
        options = {[true] = "沿用守护", [false] = "自定义"}, order = {true, false}})
    local dimensions = section:Row({minimumColumnWidth = 360})
    Add(dimensions, "Slider", "iconWidth", {text = "追踪图标宽度", min = 16, max = 80, step = 1,
        getVisible = CustomStyle})
    Add(dimensions, "Slider", "iconHeight", {text = "追踪图标高度", min = 16, max = 80, step = 1,
        getVisible = CustomStyle})
    Add(dimensions, "Slider", "spacing", {text = "追踪图标间距", min = 0, max = 20, step = 1,
        getVisible = CustomStyle})
end

local function BuildPage(context, module)
    local page = ns.UI:CreateSettingsPage(context, {id = "hunter-aspects", refreshOnCombatChange = true})
    context.hunterAspectsPage = page
    if page.hunterBuilt then page:Refresh("reuse"); return page end
    page.hunterBuilt = true
    local layout = page:Section("守护布局")
    for _, spec in ipairs({{"iconWidth", "图标宽度", 16, 80}, {"iconHeight", "图标高度", 16, 80}, {"spacing", "图标间距", 0, 20}}) do
        local key = spec[1]
        layout:Row():Slider(key, {text = spec[2], min = spec[3], max = spec[4], step = 1,
            getValue = function() return module.db.profile[key] end, getEnabled = Editable,
            onChange = function(control, value)
                if not module:SetLayout(key, value) then control:SetValue(module.db.profile[key], true) end
            end})
    end
    layout:FieldRow():Dropdown("alignment", {text = "对齐方式",
        options = ALIGNMENTS, order = ALIGNMENT_ORDER,
        tooltip = "选择守护条哪一边固定在保存的位置；增加守护时，该对齐点保持不动。",
        getValue = function() return module.db.profile.alignment end, getEnabled = Editable,
        onChange = function(control, value)
            if not module:SetLayout("alignment", value) then control:SetValue(module.db.profile.alignment, true) end
        end})
    layout:FieldRow():Dropdown("direction", {text = "生长方向",
        options = DIRECTIONS, order = DIRECTION_ORDER,
        getValue = function() return module.db.profile.direction end, getEnabled = Editable,
        onChange = function(control, value)
            if module:SetLayout("direction", value) then module:RefreshSettings("layout")
            else control:SetValue(module.db.profile.direction, true) end
        end})
    AddTrackingSettings(page, module)
    page:FooterActions()
        :Button("preview", {action = "preview", text = "预览模式",
            getEnabled = function() return module:IsEnabled() and not ns.HunterAspectsAdapter:InCombat() end,
            onAction = function() return module:SetPreview(not module.preview) end,
        })
        :Button("resetPosition", {action = "resetPosition", text = "重置位置",
            getEnabled = Editable,
            onAction = function() return module:ResetPosition() end,
        })
        :Button("restoreDefaults", {action = "restoreDefaults", text = "恢复默认", getEnabled = Editable,
            onAction = function()
                page:ShowTextDialog({title = "恢复猎人守护与追踪默认设置", confirmLabel = "恢复默认",
                    description = "恢复两条的布局与位置，以及追踪勾选和顺序。保留模块开关和「显示追踪」开关。",
                    value = "追踪回到守护条最后一格，默认勾选全部 8 项。",
                    onConfirm = function()
                        if not module:RestoreDefaults() then return false end
                        page:Refresh("defaults"); return true
                    end})
            end})
    page:Finish()
    return page
end
function Settings:Register(module)
    local definition = {
        title = "猎人守护与追踪", group = "class", navigationOrder = 20,
        showInNavigation = true,
        visible = function() return ns.HunterAspectsAdapter:IsHunter() end,
        searchKeywords = {"猎人", "守护条", "守护与追踪", "追踪", "追踪条", "雄鹰", "灵猴", "猎豹",
            "野兽", "人型", "亡灵", "恶魔", "龙类"},
        navigationSwitch = {
            GetState = function(out)
                out.available = ns.HunterAspectsAdapter:IsHunter()
                out.enabled = ns.Assembly:IsModuleEnabled("HunterAspects")
                out.mutable = out.available and not ns.HunterAspectsAdapter:InCombat()
                out.active = out.enabled and module.rows ~= nil
                out.pending = false
                return out
            end,
            SetEnabled = function(value) return module:SetEnabled(value) end,
        },
        build = function(context) return BuildPage(context, module) end,
    }
    ns.HunterAspectsPageDefinition = definition
    return ns.UI:GetSystem():RegisterPage("hunter-aspects", definition)
end
ns.HunterAspectsSettings = Settings

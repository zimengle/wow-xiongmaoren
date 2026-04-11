-- SettingsFrame.lua
-- 设置页面：控制悬浮框显示和关键字过滤

---@type MeetingHornHeroicNS
local ns = select(2, ...)

---@class HeroicSettingsFrame
local HeroicSettingsFrame = {}

-- 每行关键字高度
local FILTER_ROW_HEIGHT = 24
-- 关键字列表最大显示行数（超出则滚动）
local FILTER_LIST_HEIGHT = 200

function HeroicSettingsFrame:New(parent)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetAllPoints()
    frame:Hide()

    -- 绑定方法
    for k, v in pairs(HeroicSettingsFrame) do
        if type(v) == "function" then
            frame[k] = v
        end
    end

    frame:CreateUI()

    return frame
end

function HeroicSettingsFrame:CreateUI()
    local y = -10  -- 当前纵向偏移（向下为负）

    -- =====================================================
    -- 基本设置区域
    -- =====================================================
    local sectionTitle1 = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    sectionTitle1:SetPoint("TOPLEFT", 20, y)
    sectionTitle1:SetText("|cffffd100基本设置|r")
    y = y - 28

    -- 分隔线
    local sep1 = self:CreateTexture(nil, "BACKGROUND")
    sep1:SetHeight(1)
    sep1:SetPoint("TOPLEFT", 10, y)
    sep1:SetPoint("TOPRIGHT", -10, y)
    sep1:SetColorTexture(0.4, 0.4, 0.4, 0.8)
    y = y - 10

    -- 显示悬浮窗 CheckButton
    local showFloatCB = CreateFrame("CheckButton", nil, self, "UICheckButtonTemplate")
    showFloatCB:SetPoint("TOPLEFT", 16, y)
    showFloatCB:SetSize(24, 24)
    local showFloatLabel = self:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    showFloatLabel:SetPoint("LEFT", showFloatCB, "RIGHT", 4, 0)
    showFloatLabel:SetText("显示悬浮窗")
    showFloatCB:SetScript("OnClick", function(cb)
        local checked = cb:GetChecked() and true or false
        if ns.Addon and ns.Addon.db and ns.Addon.db.profile then
            ns.Addon.db.profile.options.floatingFrame = checked
        end
        if ns.FloatingFrame then
            ns.FloatingFrame:SetShown(checked)
        end
    end)
    self.showFloatCB = showFloatCB
    y = y - 30

    -- 启用关键字过滤 CheckButton
    local filterCB = CreateFrame("CheckButton", nil, self, "UICheckButtonTemplate")
    filterCB:SetPoint("TOPLEFT", 16, y)
    filterCB:SetSize(24, 24)
    local filterLabel = self:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    filterLabel:SetPoint("LEFT", filterCB, "RIGHT", 4, 0)
    filterLabel:SetText("启用关键字过滤（过滤含关键字的活动）")
    filterCB:SetScript("OnClick", function(cb)
        local checked = cb:GetChecked() and true or false
        if ns.Addon and ns.Addon.db and ns.Addon.db.profile then
            ns.Addon.db.profile.options.activityfilter = checked
        end
        -- 触发活动列表刷新
        if ns.MainFrame and ns.MainFrame.browserFrame then
            ns.MainFrame.browserFrame:RefreshActivityList()
        end
    end)
    self.filterCB = filterCB
    y = y - 38

    -- =====================================================
    -- 关键字过滤区域
    -- =====================================================
    local sectionTitle2 = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    sectionTitle2:SetPoint("TOPLEFT", 20, y)
    sectionTitle2:SetText("|cffffd100关键字过滤|r")
    y = y - 28

    local sep2 = self:CreateTexture(nil, "BACKGROUND")
    sep2:SetHeight(1)
    sep2:SetPoint("TOPLEFT", 10, y)
    sep2:SetPoint("TOPRIGHT", -10, y)
    sep2:SetColorTexture(0.4, 0.4, 0.4, 0.8)
    y = y - 14

    -- 输入区域：EditBox + "正则"复选框 + "添加"按钮
    local inputBox = CreateFrame("EditBox", nil, self, "InputBoxTemplate")
    inputBox:SetSize(200, 28)
    inputBox:SetPoint("TOPLEFT", 20, y)
    inputBox:SetAutoFocus(false)
    inputBox:SetMaxLetters(50)
    self.filterInputBox = inputBox

    local regexCB = CreateFrame("CheckButton", nil, self, "UICheckButtonTemplate")
    regexCB:SetSize(20, 20)
    regexCB:SetPoint("LEFT", inputBox, "RIGHT", 8, 0)
    local regexLabel = self:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    regexLabel:SetPoint("LEFT", regexCB, "RIGHT", 2, 0)
    regexLabel:SetText("正则")
    self.regexCB = regexCB

    local addBtn = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
    addBtn:SetSize(60, 26)
    addBtn:SetPoint("LEFT", regexLabel, "RIGHT", 10, 0)
    addBtn:SetText("添加")
    addBtn:SetScript("OnClick", function()
        local text = strtrim(inputBox:GetText() or "")
        if text == "" then
            print("|cffff8800[MeetingHornHeroic]|r 请输入关键字。")
            return
        end
        local isRegex = regexCB:GetChecked() and true or false
        local keyword = { text = text, plainText = not isRegex and true or nil }
        local ok = ns.MeetingHornAPI:AddActivityFilter(keyword)
        if ok then
            inputBox:SetText("")
            self:RefreshFilterList()
            -- 触发活动列表刷新
            if ns.MainFrame and ns.MainFrame.browserFrame then
                ns.MainFrame.browserFrame:RefreshActivityList()
            end
        end
    end)
    -- 按 Enter 触发添加
    inputBox:SetScript("OnEnterPressed", function()
        addBtn:Click()
    end)
    y = y - 36

    -- 导入/导出按钮
    local importBtn = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
    importBtn:SetSize(60, 26)
    importBtn:SetPoint("TOPLEFT", 20, y)
    importBtn:SetText("导入")
    importBtn:SetScript("OnClick", function()
        self:ShowImportDialog()
    end)

    local exportBtn = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
    exportBtn:SetSize(60, 26)
    exportBtn:SetPoint("LEFT", importBtn, "RIGHT", 8, 0)
    exportBtn:SetText("导出")
    exportBtn:SetScript("OnClick", function()
        self:ShowExportDialog()
    end)
    y = y - 36

    -- 关键字列表（ScrollFrame）
    local listTitle = self:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    listTitle:SetPoint("TOPLEFT", 20, y)
    listTitle:SetText("|cffaaaaaa当前过滤关键字（普通=纯文本匹配，!开头=正则）|r")
    y = y - 20

    -- 关键字列表背景帧（ScrollFrame 本身不支持 SetBackdrop，需独立背景帧）
    local listBg = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
    listBg:SetPoint("TOPLEFT", 10, y)
    listBg:SetPoint("BOTTOMRIGHT", -30, 10)
    if listBg.SetBackdrop then
        listBg:SetBackdrop({
            bgFile   = "Interface/Tooltips/UI-Tooltip-Background",
            edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
            tile = true, tileSize = 8, edgeSize = 8,
            insets = { left = 2, right = 2, top = 2, bottom = 2 }
        })
        listBg:SetBackdropColor(0.05, 0.05, 0.1, 0.7)
        listBg:SetBackdropBorderColor(0.3, 0.3, 0.5, 0.8)
    end

    local scrollFrame = CreateFrame("ScrollFrame", nil, listBg, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", listBg, "TOPLEFT", 4, -4)
    scrollFrame:SetPoint("BOTTOMRIGHT", listBg, "BOTTOMRIGHT", -22, 4)
    self.scrollFrame = scrollFrame

    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetWidth(scrollFrame:GetWidth() - 20)
    scrollChild:SetHeight(10)
    scrollFrame:SetScrollChild(scrollChild)
    self.scrollChild = scrollChild
end

-- OnShow：Tab 切换进来时同步复选框状态
function HeroicSettingsFrame:OnShow()
    if ns.Addon and ns.Addon.db and ns.Addon.db.profile and ns.Addon.db.profile.options then
        local opts = ns.Addon.db.profile.options
        self.showFloatCB:SetChecked(opts.floatingFrame and true or false)
        self.filterCB:SetChecked(opts.activityfilter and true or false)
    end
    self:RefreshFilterList()
end

-- 刷新关键字列表
function HeroicSettingsFrame:RefreshFilterList()
    local scrollChild = self.scrollChild
    if not scrollChild then return end

    -- 清除现有行帧（使用 SetParent(UIParent) 确保真正脱离 scrollChild）
    for _, child in ipairs({ scrollChild:GetChildren() }) do
        child:Hide()
        child:SetParent(UIParent)
    end

    -- 隐藏/延迟创建"暂无关键字"提示（FontString 不在 GetChildren 中，需单独管理）
    if not self.emptyLabel then
        self.emptyLabel = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontDisable")
        self.emptyLabel:SetPoint("TOP", 0, -20)
        self.emptyLabel:SetText("暂无过滤关键字")
    end
    self.emptyLabel:Hide()

    local filters = ns.MeetingHornAPI:GetActivityFilters()
    local totalHeight = 0

    for i, kw in ipairs(filters) do
        local row = CreateFrame("Frame", nil, scrollChild)
        row:SetSize(scrollChild:GetWidth(), FILTER_ROW_HEIGHT)
        row:SetPoint("TOPLEFT", 0, -totalHeight)

        -- 背景（交替色）
        local bg = row:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        if i % 2 == 0 then
            bg:SetColorTexture(0.1, 0.1, 0.15, 0.5)
        else
            bg:SetColorTexture(0.08, 0.08, 0.12, 0.3)
        end

        -- 关键字类型标签
        local typeLabel = row:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        typeLabel:SetPoint("LEFT", 6, 0)
        typeLabel:SetWidth(40)
        if kw.plainText then
            typeLabel:SetText("|cff88ff88普通|r")
        else
            typeLabel:SetText("|cffffaa00正则|r")
        end

        -- 关键字文本
        local kwLabel = row:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        kwLabel:SetPoint("LEFT", typeLabel, "RIGHT", 4, 0)
        kwLabel:SetWidth(scrollChild:GetWidth() - 110)
        kwLabel:SetText(kw.text or "")
        kwLabel:SetJustifyH("LEFT")

        -- 删除按钮
        local delBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
        delBtn:SetSize(44, 20)
        delBtn:SetPoint("RIGHT", row, "RIGHT", -4, 0)
        delBtn:SetText("删除")
        -- 捕获当前关键字（避免闭包共享问题）
        local capturedKw = { text = kw.text, plainText = kw.plainText }
        delBtn:SetScript("OnClick", function()
            ns.MeetingHornAPI:RemoveActivityFilter(capturedKw)
            self:RefreshFilterList()
            -- 触发活动列表刷新
            if ns.MainFrame and ns.MainFrame.browserFrame then
                ns.MainFrame.browserFrame:RefreshActivityList()
            end
        end)

        totalHeight = totalHeight + FILTER_ROW_HEIGHT
    end

    -- 空列表提示（复用 self.emptyLabel，不重复创建）
    if #filters == 0 then
        self.emptyLabel:Show()
        totalHeight = 40
    end

    scrollChild:SetHeight(math.max(totalHeight, 10))
end

-- 导出关键字对话框
function HeroicSettingsFrame:ShowExportDialog()
    local filters = ns.MeetingHornAPI:GetActivityFilters()
    local lines = {}
    for _, kw in ipairs(filters) do
        if kw.plainText then
            table.insert(lines, kw.text)
        else
            table.insert(lines, "!" .. kw.text)
        end
    end
    local exportText = table.concat(lines, "\n")

    -- 使用简单弹出框
    local dialog = self:GetOrCreateTextDialog("export")
    dialog.titleText:SetText("导出关键字（复制后可导入到其他角色）")
    dialog.editBox:SetText(exportText)
    dialog.editBox:SetCursorPosition(0)
    dialog.editBox:HighlightText()
    dialog.acceptBtn:SetText("关闭")
    dialog.acceptBtn:SetScript("OnClick", function() dialog:Hide() end)
    dialog.cancelBtn:Hide()
    dialog:Show()
end

-- 导入关键字对话框
function HeroicSettingsFrame:ShowImportDialog()
    local dialog = self:GetOrCreateTextDialog("import")
    dialog.titleText:SetText("导入关键字（每行一个，!开头=正则匹配）")
    dialog.editBox:SetText("")
    dialog.acceptBtn:SetText("导入")
    dialog.acceptBtn:SetScript("OnClick", function()
        local text = dialog.editBox:GetText() or ""
        local lines = { strsplit("\n", text) }
        for _, line in ipairs(lines) do
            line = strtrim(line)
            if line ~= "" then
                local isRegex = line:sub(1, 1) == "!"
                local kwText = isRegex and line:sub(2) or line
                kwText = strtrim(kwText)
                if kwText ~= "" then
                    ns.MeetingHornAPI:AddActivityFilter({
                        text = kwText,
                        plainText = not isRegex and true or nil
                    })
                end
            end
        end
        self:RefreshFilterList()
        if ns.MainFrame and ns.MainFrame.browserFrame then
            ns.MainFrame.browserFrame:RefreshActivityList()
        end
        dialog:Hide()
    end)
    dialog.cancelBtn:Show()
    dialog.cancelBtn:SetScript("OnClick", function() dialog:Hide() end)
    dialog:Show()
end

-- 获取或创建文本输入对话框（复用）
function HeroicSettingsFrame:GetOrCreateTextDialog(id)
    if self["_dialog_" .. id] then
        return self["_dialog_" .. id]
    end

    local dialog = CreateFrame("Frame", nil, UIParent, BackdropTemplateMixin and "BackdropTemplate")
    dialog:SetSize(420, 280)
    dialog:SetPoint("CENTER")
    dialog:SetFrameStrata("DIALOG")
    dialog:SetMovable(true)
    dialog:EnableMouse(true)
    dialog:RegisterForDrag("LeftButton")
    dialog:SetScript("OnDragStart", dialog.StartMoving)
    dialog:SetScript("OnDragStop", dialog.StopMovingOrSizing)
    if dialog.SetBackdrop then
        dialog:SetBackdrop({
            bgFile   = "Interface/Tooltips/UI-Tooltip-Background",
            edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
            tile = true, tileSize = 16, edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        dialog:SetBackdropColor(0.1, 0.1, 0.2, 0.97)
        dialog:SetBackdropBorderColor(0.4, 0.5, 0.8, 1)
    end
    dialog:Hide()

    local title = dialog:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    title:SetPoint("TOP", 0, -12)
    title:SetWidth(380)
    dialog.titleText = title

    local editBox = CreateFrame("EditBox", nil, dialog, "InputBoxTemplate")
    editBox:SetSize(390, 180)
    editBox:SetPoint("TOP", 0, -40)
    editBox:SetMultiLine(true)
    editBox:SetAutoFocus(false)
    editBox:SetMaxLetters(5000)
    dialog.editBox = editBox

    local acceptBtn = CreateFrame("Button", nil, dialog, "UIPanelButtonTemplate")
    acceptBtn:SetSize(80, 26)
    acceptBtn:SetPoint("BOTTOMRIGHT", -60, 10)
    dialog.acceptBtn = acceptBtn

    local cancelBtn = CreateFrame("Button", nil, dialog, "UIPanelButtonTemplate")
    cancelBtn:SetSize(80, 26)
    cancelBtn:SetPoint("BOTTOMLEFT", 60, 10)
    cancelBtn:SetText("取消")
    dialog.cancelBtn = cancelBtn

    self["_dialog_" .. id] = dialog
    return dialog
end

-- 注册到 ns.UI
ns.UI.SettingsFrame = HeroicSettingsFrame

-- BrowserFrame.lua
-- 团本招募广场界面 - 参考MeetingHorn实现

---@type MeetingHornHeroicNS
local ns = select(2, ...)
local L = ns.L

---@class BrowserFrame: Frame
local BrowserFrame = {}

--- 统一获取活动显示名称（列表行 + tooltip 共用）
--- 优先级：_mhActivityName > raidData.name > "未知团本"
local function GetActivityDisplayName(activity)
    if activity._mhActivityName and activity._mhActivityName ~= "" then
        return activity._mhActivityName
    end
    local raidData = activity:GetRaidData()
    if raidData and raidData.name then
        return raidData.name
    end
    return "未知团本"
end

function BrowserFrame:New(parent)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetAllPoints()
    frame:Hide()

    -- 绑定方法
    for k, v in pairs(BrowserFrame) do
        if type(v) == "function" then
            frame[k] = v
        end
    end

    -- 初始化数据
    frame.activities = {}
    frame.filteredActivities = {}
    frame.activityButtons = {}
    frame.selectedActivity = nil
    frame.autoRefreshTimer = nil

    -- 创建界面元素
    frame:CreateElements()

    -- 注册活动管理器回调
    ns.ActivityManager:RegisterUpdateCallback(function(eventType, data)
        frame:OnActivityUpdate(eventType, data)
    end)

    -- 当 frame 变为可见时（tab 切换等），补刷积压的更新
    frame:SetScript("OnShow", function(self)
        if self._needsRefreshOnShow then
            self._needsRefreshOnShow = false
            self.pendingRefreshReasons = {}
            self:RefreshActivityList()
        end
    end)

    return frame
end

function BrowserFrame:CreateElements()
    -- 创建筛选区域
    self:CreateFilterArea()

    -- 创建列表头部
    self:CreateListHeader()

    -- 创建活动列表
    self:CreateActivityList()

    -- 创建刷新区域
    self:CreateRefreshArea()
end

function BrowserFrame:CreateFilterArea()
    -- 筛选区域 (扩大主窗口)
    local filterFrame = CreateFrame("Frame", nil, self, "BackdropTemplate")
    filterFrame:SetSize(820, 80)
    filterFrame:SetPoint("TOP", 0, -20)
    filterFrame:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    filterFrame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    filterFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)

    -- 第一行：搜索和团本筛选
    -- 搜索输入框
    local searchBox = CreateFrame("EditBox", nil, filterFrame, "InputBoxTemplate")
    searchBox:SetSize(160, 32)
    searchBox:SetPoint("TOPLEFT", 20, -15)
    searchBox:SetText("")
    searchBox:SetAutoFocus(false)  -- 不自动获得焦点

    -- 添加占位符提示
    local placeholderText = searchBox:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
    placeholderText:SetPoint("LEFT", searchBox, "LEFT", 5, 0)
    placeholderText:SetText("搜索")
    placeholderText:SetTextColor(0.5, 0.5, 0.5, 1)

    -- 管理占位符的显示和隐藏
    local function updatePlaceholder()
        if searchBox:GetText() == "" and not searchBox:HasFocus() then
            placeholderText:Show()
        else
            placeholderText:Hide()
        end
    end

    searchBox:SetScript("OnTextChanged", function()
        updatePlaceholder()
        self:RefreshActivityList()
    end)
    searchBox:SetScript("OnEditFocusGained", function()
        updatePlaceholder()
    end)
    searchBox:SetScript("OnEditFocusLost", function()
        updatePlaceholder()
    end)
    searchBox:SetScript("OnEnterPressed", function()
        searchBox:ClearFocus()
        self:RefreshActivityList()
    end)

    -- 初始状态显示占位符
    updatePlaceholder()

    local searchLabel = filterFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    searchLabel:SetPoint("BOTTOMLEFT", searchBox, "TOPLEFT", 0, -5)
    searchLabel:SetText("搜索:")

    -- 团本类型下拉
    local raidDropdown = CreateFrame("Frame", nil, filterFrame, "UIDropDownMenuTemplate")
    raidDropdown:SetPoint("LEFT", searchBox, "RIGHT", 10, -2)
    UIDropDownMenu_SetWidth(raidDropdown, 120)
    UIDropDownMenu_SetText(raidDropdown, "全部团本")
    UIDropDownMenu_Initialize(raidDropdown, function()
        -- "全部团本"选项
        local allInfo = UIDropDownMenu_CreateInfo()
        allInfo.text = "全部团本"
        allInfo.func = function()
            UIDropDownMenu_SetText(raidDropdown, "全部团本")
            self:RefreshActivityList()
        end
        UIDropDownMenu_AddButton(allInfo)
        -- 按 raidOrder 有序添加团本选项
        for _, raidId in ipairs(ns.raidOrder) do
            local raidData = ns.raidData[raidId]
            if raidData then
                local info = UIDropDownMenu_CreateInfo()
                info.text = raidData.name
                info.func = function()
                    UIDropDownMenu_SetText(raidDropdown, raidData.name)
                    self:RefreshActivityList()
                end
                UIDropDownMenu_AddButton(info)
            end
        end
    end)

    -- 活动模式下拉
    local modeDropdown = CreateFrame("Frame", nil, filterFrame, "UIDropDownMenuTemplate")
    modeDropdown:SetPoint("LEFT", raidDropdown, "RIGHT", 0, 0)
    UIDropDownMenu_SetWidth(modeDropdown, 100)
    UIDropDownMenu_SetText(modeDropdown, "全部模式")
    UIDropDownMenu_Initialize(modeDropdown, function()
        local modes = {"全部模式"}
        for _, modeData in ipairs(ns.activityModes) do
            table.insert(modes, modeData.name)
        end
        for _, mode in ipairs(modes) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = mode
            info.func = function()
                UIDropDownMenu_SetText(modeDropdown, mode)
                self:RefreshActivityList()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)

    -- 排序方式下拉
    local sortDropdown = CreateFrame("Frame", nil, filterFrame, "UIDropDownMenuTemplate")
    sortDropdown:SetPoint("LEFT", modeDropdown, "RIGHT", 0, 0)
    UIDropDownMenu_SetWidth(sortDropdown, 90)
    UIDropDownMenu_SetText(sortDropdown, "推荐排序")
    self.sortMode = 1
    UIDropDownMenu_Initialize(sortDropdown, function()
        local sortOptions = {
            {text = "推荐排序", value = 1},
            {text = "星团长优先", value = 2},
            {text = "最新发布", value = 3},
        }
        for _, option in ipairs(sortOptions) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = option.text
            info.func = function()
                self.sortMode = option.value
                UIDropDownMenu_SetText(sortDropdown, option.text)
                self:RefreshActivityList()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)

    -- 移除"只显示我的活动"按钮，默认只显示MeetingHornHeroic创建的活动

    -- 第二行：职业需求筛选（向下移动5像素）
    local needTankFilter = CreateFrame("CheckButton", nil, filterFrame, "UICheckButtonTemplate")
    needTankFilter:SetPoint("TOPLEFT", 20, -50)
    needTankFilter:SetSize(16, 16)
    needTankFilter:SetScript("OnClick", function()
        self:RefreshActivityList()
    end)
    needTankFilter:SetScript("OnEnter", function()
        GameTooltip:SetOwner(needTankFilter, "ANCHOR_TOP")
        GameTooltip:SetText("筛选缺坦克的活动", 1, 1, 1)
        GameTooltip:Show()
    end)
    needTankFilter:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    local tankLabel = filterFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    tankLabel:SetPoint("LEFT", needTankFilter, "RIGHT", 2, 0)
    tankLabel:SetText("缺坦克")
    tankLabel:SetTextColor(0.8, 0.8, 1)

    local needHealerFilter = CreateFrame("CheckButton", nil, filterFrame, "UICheckButtonTemplate")
    needHealerFilter:SetPoint("LEFT", needTankFilter, "RIGHT", 80, 0)
    needHealerFilter:SetSize(16, 16)
    needHealerFilter:SetScript("OnClick", function()
        self:RefreshActivityList()
    end)
    needHealerFilter:SetScript("OnEnter", function()
        GameTooltip:SetOwner(needHealerFilter, "ANCHOR_TOP")
        GameTooltip:SetText("筛选缺治疗的活动", 1, 1, 1)
        GameTooltip:Show()
    end)
    needHealerFilter:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    local healerLabel = filterFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    healerLabel:SetPoint("LEFT", needHealerFilter, "RIGHT", 2, 0)
    healerLabel:SetText("缺治疗")
    healerLabel:SetTextColor(0.8, 1, 0.8)

    local needDpsFilter = CreateFrame("CheckButton", nil, filterFrame, "UICheckButtonTemplate")
    needDpsFilter:SetPoint("LEFT", needHealerFilter, "RIGHT", 80, 0)
    needDpsFilter:SetSize(16, 16)
    needDpsFilter:SetScript("OnClick", function()
        self:RefreshActivityList()
    end)
    needDpsFilter:SetScript("OnEnter", function()
        GameTooltip:SetOwner(needDpsFilter, "ANCHOR_TOP")
        GameTooltip:SetText("筛选缺输出的活动", 1, 1, 1)
        GameTooltip:Show()
    end)
    needDpsFilter:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    local dpsLabel = filterFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    dpsLabel:SetPoint("LEFT", needDpsFilter, "RIGHT", 2, 0)
    dpsLabel:SetText("缺输出")
    dpsLabel:SetTextColor(1, 0.8, 0.8)

    self.searchBox = searchBox
    self.raidDropdown = raidDropdown
    self.modeDropdown = modeDropdown
    self.sortDropdown = sortDropdown
    self.needTankFilter = needTankFilter
    self.needHealerFilter = needHealerFilter
    self.needDpsFilter = needDpsFilter
    self.filterFrame = filterFrame
end

function BrowserFrame:CreateListHeader()
    -- 表头
    local headerFrame = CreateFrame("Frame", nil, self)
    headerFrame:SetSize(760, 30)
    headerFrame:SetPoint("TOP", self.filterFrame, "BOTTOM", 0, -10)

    -- 定义列配置（在类级别存储，供其他方法使用）
    self.columnConfig = {
        {text = "", width = 40},      -- 收藏
        {text = "星标", width = 80},  -- 星标认证
        {text = "活动", width = 200}, -- 活动名称
        {text = "模式", width = 70},  -- 模式
        {text = "装等", width = 60},  -- 装等要求
        {text = "成员", width = 80},  -- 成员数
        {text = "团长", width = 100}, -- 团长+等级
        {text = "操作", width = 80}   -- 操作
    }

    local xPos = 15
    for i, header in ipairs(self.columnConfig) do
        local headerText = headerFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
        headerText:SetPoint("LEFT", xPos, 0)
        headerText:SetSize(header.width - 10, 30)
        headerText:SetJustifyH("LEFT")
        headerText:SetText(header.text)
        headerText:SetTextColor(1, 0.8, 0, 1)
        xPos = xPos + header.width
    end

    -- 分隔线
    local separator = headerFrame:CreateTexture(nil, "ARTWORK")
    separator:SetSize(730, 1)
    separator:SetPoint("BOTTOM", 0, 0)
    separator:SetColorTexture(0.5, 0.5, 0.5, 1)

    self.headerFrame = headerFrame
end

function BrowserFrame:CreateActivityList()
    -- 滚动框架
    local scrollFrame = CreateFrame("ScrollFrame", nil, self, "UIPanelScrollFrameTemplate")
    scrollFrame:SetSize(760, 350)
    scrollFrame:SetPoint("TOP", self.headerFrame, "BOTTOM", 0, -5)

    -- 滚动内容
    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetSize(730, 1)
    scrollFrame:SetScrollChild(scrollChild)

    -- 无数据提示 - 参考MeetingHorn样式
    local emptyFrame = CreateFrame("Frame", nil, scrollChild)
    emptyFrame:SetAllPoints()
    emptyFrame:Hide()

    local emptyIcon = emptyFrame:CreateTexture(nil, "ARTWORK")
    emptyIcon:SetSize(64, 64)
    emptyIcon:SetPoint("CENTER", 0, 50)
    -- 使用 MeetingHorn 的图标样式，而不是问号
    emptyIcon:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\Icon")
    emptyIcon:SetVertexColor(0.5, 0.5, 0.5, 1)

    local emptyText = emptyFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    emptyText:SetPoint("TOP", emptyIcon, "BOTTOM", 0, -10)
    emptyText:SetText("暂无活动数据，请尝试搜索")
    emptyText:SetTextColor(0.5, 0.5, 0.5, 1)

    self.scrollFrame = scrollFrame
    self.scrollChild = scrollChild
    self.emptyFrame = emptyFrame
end

function BrowserFrame:CreateRefreshArea()
    -- 刷新按钮区域 - 放在上方
    local refreshFrame = CreateFrame("Frame", nil, self)
    refreshFrame:SetSize(760, 40)
    refreshFrame:SetPoint("TOP", self.scrollFrame, "BOTTOM", 0, -10)

    local refreshButton = CreateFrame("Button", nil, refreshFrame, "UIPanelButtonTemplate")
    refreshButton:SetSize(100, 32)
    refreshButton:SetPoint("LEFT", 20, 0)
    refreshButton:SetText("刷新")
    refreshButton:SetScript("OnClick", function()
        -- 使用强制刷新，立即响应用户操作
        self:ForceRefresh()
        ns.Addon:Print("已刷新活动列表")
    end)

    self.refreshButton = refreshButton
    self.refreshFrame = refreshFrame
end

function BrowserFrame:CreateActivityRow(index)
    local button = CreateFrame("Button", "HeroicActivityRow" .. index, self.scrollChild, "BackdropTemplate")
    button:SetSize(730, 40)
    button:EnableMouse(true)

    -- 背景
    local bg = button:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    if index % 2 == 0 then
        bg:SetColorTexture(0.1, 0.1, 0.1, 0.3)
    else
        bg:SetColorTexture(0.15, 0.15, 0.15, 0.3)
    end

    -- 悬停效果和Tooltip
    button:SetScript("OnEnter", function()
        bg:SetColorTexture(0.2, 0.3, 0.5, 0.5)
        self:ShowActivityTooltip(button)
    end)
    button:SetScript("OnLeave", function()
        if button.selected then
            bg:SetColorTexture(0.3, 0.5, 0.8, 0.6)
        else
            -- 恢复原始状态：检查是否是自己的活动或收藏的活动
            self:RestoreButtonBackgroundColor(button, index)
        end
        GameTooltip:Hide()
    end)

    local xPos = 15
    local columns = self.columnConfig

    -- Column 1: 收藏按钮 - 使用配置中的宽度
    local favoriteButton = CreateFrame("Button", nil, button)
    favoriteButton:SetSize(20, 20)
    favoriteButton:SetPoint("LEFT", xPos + 10, 0)
    favoriteButton:SetNormalTexture("Interface\\Common\\FavoritesIcon")
    favoriteButton:SetScript("OnClick", function()
        self:OnFavoriteClick(button)
    end)
    favoriteButton:SetScript("OnEnter", function()
        GameTooltip:SetOwner(favoriteButton, "ANCHOR_TOP")
        GameTooltip:SetText("收藏/取消收藏", 1, 1, 1)
        GameTooltip:Show()
    end)
    favoriteButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    button.favoriteButton = favoriteButton
    xPos = xPos + columns[1].width  -- 使用配置中的宽度

    -- Column 2: 认证星标图标 - 使用配置中的宽度
    local starIcon = button:CreateTexture(nil, "ARTWORK")
    starIcon:SetSize(64, 16) -- 调整大小，与MeetingHorn一致
    starIcon:SetPoint("LEFT", xPos, 0)
    starIcon:SetTexCoord(0, 225 / 256, 0, 56 / 64)
    starIcon:SetShown(false) -- 默认隐藏，在UpdateActivityButton中设置
    button.Icon = starIcon
    xPos = xPos + columns[2].width  -- 使用配置中的宽度

    -- Column 3: 活动信息 - 两行显示，使用配置中的宽度
    local activityName = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    activityName:SetPoint("LEFT", xPos, 8)
    activityName:SetSize(columns[3].width - 10, 15)  -- 统一边距处理
    activityName:SetJustifyH("LEFT")
    activityName:SetTextColor(1, 1, 1, 1)
    button.activityName = activityName

    local activityComment = button:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    activityComment:SetPoint("LEFT", xPos, -8)
    activityComment:SetSize(columns[3].width - 10, 15)  -- 统一边距处理
    activityComment:SetJustifyH("LEFT")
    activityComment:SetTextColor(0.7, 0.7, 0.7, 1)
    button.activityComment = activityComment
    xPos = xPos + columns[3].width - 10  -- 使用配置中的宽度

    -- Column 4: 模式 - 使用配置中的宽度
    local modeText = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    modeText:SetPoint("LEFT", xPos, 0)
    modeText:SetSize(columns[4].width - 10, 40)  -- 使用配置宽度并留出边距
    modeText:SetJustifyH("CENTER")
    modeText:SetJustifyV("MIDDLE")
    modeText:SetTextColor(0.8, 0.8, 1, 1)
    button.modeText = modeText
    xPos = xPos + columns[4].width  -- 使用配置中的宽度

    -- Column 5: 装等要求 - 使用配置中的宽度
    local itemLevelText = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    itemLevelText:SetPoint("LEFT", xPos, 0)
    itemLevelText:SetSize(columns[5].width - 10, 40)  -- 使用配置宽度并留出边距
    itemLevelText:SetJustifyH("CENTER")
    itemLevelText:SetJustifyV("MIDDLE")
    itemLevelText:SetTextColor(1, 0.8, 0.2, 1) -- 金色
    button.itemLevelText = itemLevelText
    xPos = xPos + columns[5].width - 5  -- 使用配置中的宽度

    -- Column 6: 成员数 - 使用配置中的宽度
    local membersText = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    membersText:SetPoint("LEFT", xPos, 0)
    membersText:SetSize(columns[6].width - 10, 40)  -- 使用配置宽度并留出边距
    membersText:SetJustifyH("CENTER")
    membersText:SetJustifyV("MIDDLE")
    membersText:SetTextColor(1, 1, 1, 1)
    button.membersText = membersText
    xPos = xPos + columns[6].width + 15  -- 使用配置中的宽度

    -- Column 7: 团长信息 - 两行显示，使用配置中的宽度
    local leaderName = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    leaderName:SetPoint("LEFT", xPos, 8)
    leaderName:SetSize(columns[7].width - 20, 15)  -- 使用配置宽度并留出边距
    leaderName:SetJustifyH("LEFT")
    leaderName:SetTextColor(0.5, 1, 0.5, 1)
    button.leaderName = leaderName

    local leaderLevel = button:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    leaderLevel:SetPoint("LEFT", xPos, -8)
    leaderLevel:SetSize(columns[7].width - 20, 15)  -- 使用配置宽度并留出边距
    leaderLevel:SetJustifyH("LEFT")
    leaderLevel:SetTextColor(0.7, 0.7, 0.7, 1)
    button.leaderLevel = leaderLevel
    xPos = xPos + columns[7].width  -- 使用配置中的宽度

    -- Column 8: 操作 - 只有密语按钮，使用配置中的宽度
    local whisperButton = CreateFrame("Button", nil, button, "UIPanelButtonTemplate")
    whisperButton:SetSize(60, 25)
    whisperButton:SetPoint("LEFT", xPos, 0)
    whisperButton:SetText("密语")
    whisperButton:SetScript("OnClick", function()
        self:OnWhisperClick(button)
    end)
    button.whisperButton = whisperButton

    -- 点击选中
    button:SetScript("OnClick", function()
        self:OnActivityButtonClick(button)
    end)

    -- 右键菜单
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:SetScript("OnClick", function(self, mouseButton)
        if mouseButton == "LeftButton" then
            self.parent:OnActivityButtonClick(self)
        elseif mouseButton == "RightButton" then
            self.parent:ShowContextMenu(self)
        end
    end)
    button.parent = self

    button.bg = bg
    return button
end

function BrowserFrame:RefreshActivityList()
    -- 清理现有按钮
    for _, button in ipairs(self.activityButtons) do
        button:Hide()
    end

    -- 获取活动数据
    local activities = ns.ActivityManager:GetFilteredActivities()
    local filteredActivities = self:FilterActivities(activities)

    -- 显示无数据提示
    if #filteredActivities == 0 then
        self.emptyFrame:Show()
        self.scrollChild:SetHeight(400)
        return
    else
        self.emptyFrame:Hide()
    end

    -- 创建或更新活动按钮
    local totalHeight = 0
    for i, activity in ipairs(filteredActivities) do
        local button = self.activityButtons[i]
        if not button then
            button = self:CreateActivityRow(i)
            self.activityButtons[i] = button
        end

        -- 更新按钮数据
        self:UpdateActivityButton(button, activity)

        -- 定位按钮
        button:SetPoint("TOPLEFT", 0, -totalHeight)
        button:Show()
        totalHeight = totalHeight + 40
    end

    -- 设置滚动高度
    self.scrollChild:SetHeight(math.max(totalHeight, 350))
end

function BrowserFrame:FilterActivities(activities)
    local filtered = {}
    local searchText = self.searchBox:GetText():lower()
    local playerName = UnitName("player")

    -- 获取筛选条件
    local selectedRaid = UIDropDownMenu_GetText(self.raidDropdown)
    local selectedMode = UIDropDownMenu_GetText(self.modeDropdown)
    local needTank = self.needTankFilter:GetChecked()
    local needHealer = self.needHealerFilter:GetChecked()
    local needDps = self.needDpsFilter:GetChecked()

    for _, activity in ipairs(activities) do
        local match = true

        -- 注意：不根据 isOurAddonCreate 过滤可见性，所有有效活动（本地创建+远程接收）均应显示
        -- isOurAddonCreate 字段仅用于排序/样式区分（如自己的活动置顶）

        -- 搜索过滤
        if match and searchText ~= "" then
            local raidData = activity:GetRaidData()
            local activityText = ((raidData and raidData.name) or "未知团本") .. " " .. (activity.comment or "")
            if not string.find(activityText:lower(), searchText, 1, true) then
                match = false
            end
        end

        -- 团本类型筛选
        if match and selectedRaid and selectedRaid ~= "全部团本" then
            local raidData = activity:GetRaidData()
            if not raidData or raidData.name ~= selectedRaid then
                match = false
            end
        end

        -- 活动模式筛选
        if match and selectedMode and selectedMode ~= "全部模式" then
            -- MeetingHorn 原生活动的 modeId 与 MHH 定义不一致（MH: 1=带新,2=自强... vs MHH: 1=金团,2=DKP...），直接排除
            if activity._source == "meetinghorn" then
                match = false
            else
                local modeData = activity:GetModeData()
                if not modeData or modeData.name ~= selectedMode then
                    match = false
                end
            end
        end

        -- 职业需求筛选
        if match and (needTank or needHealer or needDps) then
            -- MeetingHorn 原生活动无真实角色需求数据，选择特定角色时排除
            if activity._source == "meetinghorn" then
                match = false
            else
                local hasNeededRole = false

                if needTank and activity:GetNeededRoleCount("tank") > 0 then
                    hasNeededRole = true
                end

                if needHealer and activity:GetNeededRoleCount("healer") > 0 then
                    hasNeededRole = true
                end

                if needDps and activity:GetNeededRoleCount("dps") > 0 then
                    hasNeededRole = true
                end

                if not hasNeededRole then
                    match = false
                end
            end
        end

        -- 关键字过滤（任务 2.1）
        if match then
            local comment = activity.comment or ""
            if ns.MeetingHornAPI:IsActivityFiltered(comment) then
                match = false
            end
        end

        if match then
            table.insert(filtered, activity)
        end
    end

    -- 排序：分层排序
    -- 固定优先级层级（所有排序模式共享）：
    -- 1. 自己的活动（最高）
    -- 2. 收藏的活动
    -- 3/4. MHH 活动（高于 MH 原生）
    -- 排序模式影响层级内星团长排序方式：
    --   sortMode 1 (推荐排序): 按梯队分组 Lv3-6→梯队2, Lv1-2→梯队1, Lv0→梯队0
    --   sortMode 2 (星团长优先): 星级从大到小
    --   sortMode 3 (最新发布): 忽略星级，纯按时间

    local sortMode = self.sortMode or 1

    -- 梯队映射：用于推荐排序模式
    local function GetCertificationTier(starLevel)
        if starLevel >= 3 and starLevel <= 6 then
            return 2  -- 第一梯队
        elseif starLevel >= 1 and starLevel <= 2 then
            return 1  -- 第二梯队
        else
            return 0  -- 第三梯队（普通用户）
        end
    end

    -- 预计算排序 key：避免 table.sort 比较函数中重复调用 DB 查表
    -- 一次遍历计算所有 activity 的 _sortPriority / _sortStarLevel，比较函数直接读取
    local favorites = ns.Addon.db.profile.favorites
    for _, activity in ipairs(filtered) do
        local leaderName = activity.leaderName
        local priority, starLevel

        if leaderName == playerName then
            priority, starLevel = 6, 0
        elseif favorites and favorites[leaderName] then
            priority, starLevel = 5, 0
        else
            local isMHH = (activity._source ~= "meetinghorn")
            starLevel = ns.MeetingHornAPI:GetPlayerRegimentLevel(leaderName) or 0

            if sortMode == 3 then
                priority = isMHH and 3 or 1
                starLevel = 0
            else
                if isMHH then
                    priority = (starLevel > 0) and 4 or 3
                else
                    priority = (starLevel > 0) and 2 or 1
                end
            end
        end

        activity._sortPriority = priority
        activity._sortStarLevel = starLevel
    end

    table.sort(filtered, function(a, b)
        -- 直接读预计算值，零 DB 查表开销
        local aPriority = a._sortPriority
        local bPriority = b._sortPriority

        -- 优先级不同，高优先级在前
        if aPriority ~= bPriority then
            return aPriority > bPriority
        end

        -- 同优先级内，根据排序模式决定星级排序方式
        if sortMode == 1 then
            -- 推荐排序：按梯队分组，同梯队按时间
            local aTier = GetCertificationTier(a._sortStarLevel)
            local bTier = GetCertificationTier(b._sortStarLevel)
            if aTier ~= bTier then
                return aTier > bTier
            end
        elseif sortMode == 2 then
            -- 星团长优先：星级从大到小
            if a._sortStarLevel ~= b._sortStarLevel then
                return a._sortStarLevel > b._sortStarLevel
            end
        end
        -- sortMode == 3 或同梯队/同星级：按创建时间降序

        return (a.createdTime or 0) > (b.createdTime or 0)
    end)

    return filtered
end

function BrowserFrame:UpdateActivityButton(button, activity)
    -- 获取团本数据
    local raidData = activity:GetRaidData()
    local modeData = activity:GetModeData()

    -- 更新活动信息
    button.activityName:SetText(GetActivityDisplayName(activity))
    button.activityComment:SetText(activity.comment or "")

    -- 模式显示：MeetingHorn 原生活动的 modeId 与我们不兼容，统一显示灰色"未知"
    if activity._source == "meetinghorn" then
        button.modeText:SetText("未知")
        button.modeText:SetTextColor(0.5, 0.5, 0.5, 1)
    else
        button.modeText:SetText(modeData and modeData.name or "25人模式")
        button.modeText:SetTextColor(1, 1, 1, 1)
    end

    -- 更新装等要求（确保为整数显示）
    local itemLevel = activity.itemLevelRequirement or (raidData and raidData.requirements and raidData.requirements.minItemLevel) or 200
    button.itemLevelText:SetText(tostring(math.floor(itemLevel)))

    -- 获取成员数
    local memberCount = activity:GetMemberCount()
    button.membersText:SetText(string.format("%d/%d", memberCount, activity.maxMembers or 25))

    -- 团长信息 - 使用活动对象的GetLeaderClass方法
    local fullLeaderName = activity.leaderName or ""
    -- 提取团长名字（去掉区服信息）
    local leaderName = string.match(fullLeaderName, "([^%-]+)") or fullLeaderName
    local leaderClassFileName = activity:GetLeaderClass()
    local leaderClassName = ""
    local leaderLevel = ""

    -- 尝试从成员列表获取团长其他信息
    if activity.members and activity.members[leaderName] then
        local leaderData = activity.members[leaderName]
        -- 使用本地化职业名称
        local localizedClass = ns.GetClassLocale(leaderData.class) or leaderData.class or ""
        leaderClassName = localizedClass

        if leaderData.level then
            leaderLevel = string.format("%d级", leaderData.level)
            if leaderClassName ~= "" then
                leaderLevel = leaderLevel .. " " .. leaderClassName
            end
        end
    else
        -- 回退1：从活动对象直接获取职业和等级（远程活动的 leaderClass / leaderLevel 字段）
        if leaderClassFileName then
            leaderClassName = ns.GetClassLocale(leaderClassFileName) or leaderClassFileName or ""
        end

        -- 回退2：尝试实时获取职业信息（玩家在附近时可用）
        if leaderClassName == "" then
            local localizedClass, classFileName = UnitClass(leaderName)
            if localizedClass then
                leaderClassName = ns.GetClassLocale(classFileName) or localizedClass
            end
            if not leaderClassFileName and classFileName then
                leaderClassFileName = classFileName
            end
        end

        -- 等级：优先用活动字段，回退实时获取
        local lvl = activity.leaderLevel
        if not lvl or lvl == 0 then
            lvl = UnitLevel(leaderName)
        end
        if lvl and lvl > 0 then
            leaderLevel = string.format("%d级", lvl)
            if leaderClassName ~= "" then
                leaderLevel = leaderLevel .. " " .. leaderClassName
            end
        elseif leaderClassName ~= "" then
            leaderLevel = leaderClassName
        end
    end

    -- 设置团长名字颜色 - 使用GetClassColor或RAID_CLASS_COLORS
    if leaderClassFileName then
        local classColor = nil

        -- 尝试使用GetClassColor（如果可用）
        if GetClassColor then
            local r, g, b = GetClassColor(leaderClassFileName)
            if r and g and b then
                classColor = {r = r, g = g, b = b}
            end
        end

        -- 回退到RAID_CLASS_COLORS
        if not classColor and RAID_CLASS_COLORS and RAID_CLASS_COLORS[leaderClassFileName] then
            classColor = RAID_CLASS_COLORS[leaderClassFileName]
        end

        if classColor then
            button.leaderName:SetTextColor(classColor.r, classColor.g, classColor.b, 1)
        else
            button.leaderName:SetTextColor(0.5, 1, 0.5, 1) -- Default green
        end
    else
        button.leaderName:SetTextColor(0.5, 1, 0.5, 1) -- Default green
    end
    button.leaderName:SetText(leaderName)
    button.leaderLevel:SetText(leaderLevel)

    -- 检查是否是自己创建的活动或参与的活动
    local playerName = UnitName("player")
    local isPlayerActivity = (activity.leaderName == playerName)
    local isPlayerInActivity = activity.members and activity.members[playerName] ~= nil

    -- 设置认证星标图标
    local leaderFullName = leaderName
            local currentLevel = ns.MeetingHornAPI:GetPlayerRegimentLevel(leaderFullName)

    -- 如果有认证等级，显示星标图标
    if currentLevel and currentLevel > 0 then
        -- 使用MeetingHorn的认证图标
        button.Icon:SetTexture([[Interface\AddOns\MeetingHorn\Media\certification\1001\certification_icon]])
        button.Icon:SetSize(64, 16) -- 调整为合适的大小
        button.Icon:SetTexCoord(0, 225 / 256, 0, 56 / 64)
        button.Icon:SetShown(true)
    else
        button.Icon:SetShown(false)
    end

    -- 更新收藏按钮的显示状态
    local isFavorite = ns.Addon.db.profile.favorites and ns.Addon.db.profile.favorites[leaderName] or false
    if button.favoriteButton then
        if isFavorite then
            -- 被收藏，显示高亮效果
            button.favoriteButton:SetNormalTexture("Interface\\Common\\FavoritesIcon")
            button.favoriteButton:GetNormalTexture():SetVertexColor(1, 1, 0.3) -- 金色
        else
            -- 未收藏，显示默认状态
            button.favoriteButton:SetNormalTexture("Interface\\Common\\FavoritesIcon")
            button.favoriteButton:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5) -- 灰色
        end
    end

    -- 保存活动数据到按钮
    button.activity = activity
    button.isPlayerActivity = isPlayerActivity
    button.isPlayerInActivity = isPlayerInActivity

    -- 根据是否是自己的活动来显示/隐藏密语按钮
    if button.whisperButton then
        if isPlayerActivity then
            button.whisperButton:Hide() -- 隐藏自己活动的密语按钮
        else
            button.whisperButton:Show() -- 显示其他人活动的密语按钮
        end
    end

    -- 设置背景颜色：自己的活动为淡蓝色
    if isPlayerActivity then
        button.bg:SetColorTexture(0.2, 0.4, 0.8, 0.4) -- 淡蓝色背景，表示自己的活动
    else
        -- 恢复默认的交替行背景
        local index = 1
        for i, btn in ipairs(self.activityButtons) do
            if btn == button then
                index = i
                break
            end
        end
        if index % 2 == 0 then
            button.bg:SetColorTexture(0.1, 0.1, 0.1, 0.3)
        else
            button.bg:SetColorTexture(0.15, 0.15, 0.15, 0.3)
        end
    end
end

-- 恢复按钮背景颜色（在鼠标离开时调用）
function BrowserFrame:RestoreButtonBackgroundColor(button, index)
    if not button.activity then
        -- 如果没有活动数据，使用默认交替行背景
        if index % 2 == 0 then
            button.bg:SetColorTexture(0.1, 0.1, 0.1, 0.3)
        else
            button.bg:SetColorTexture(0.15, 0.15, 0.15, 0.3)
        end
        return
    end

    -- 检查是否是自己的活动
    local playerName = UnitName("player")
    local isPlayerActivity = (button.activity.leaderName == playerName)

    if isPlayerActivity then
        -- 自己的活动：淡蓝色背景
        button.bg:SetColorTexture(0.2, 0.4, 0.8, 0.4)
    else
        -- 其他活动：默认交替行背景
        if index % 2 == 0 then
            button.bg:SetColorTexture(0.1, 0.1, 0.1, 0.3)
        else
            button.bg:SetColorTexture(0.15, 0.15, 0.15, 0.3)
        end
    end
end

function BrowserFrame:OnFavoriteClick(button)
    if not button.activity then return end

    local leaderName = button.activity.leaderName
    local isFavorite = ns.Addon.db.profile.favorites and ns.Addon.db.profile.favorites[leaderName] or false

    -- 初始化收藏数据表
    if not ns.Addon.db.profile.favorites then
        ns.Addon.db.profile.favorites = {}
    end

    -- 切换收藏状态
    ns.Addon.db.profile.favorites[leaderName] = not isFavorite

    if not isFavorite then
        -- 记录收藏时间用于排序
        ns.Addon.db.profile.favoriteTime = ns.Addon.db.profile.favoriteTime or {}
        ns.Addon.db.profile.favoriteTime[leaderName] = time()
    end

    -- 更新收藏按钮的显示状态
    if button.favoriteButton then
        if not isFavorite then
            -- 被收藏，显示高亮效果
            button.favoriteButton:SetNormalTexture("Interface\\Common\\FavoritesIcon")
            button.favoriteButton:GetNormalTexture():SetVertexColor(1, 1, 0.3) -- 金色
        else
            -- 取消收藏，恢复默认
            button.favoriteButton:SetNormalTexture("Interface\\Common\\FavoritesIcon")
            button.favoriteButton:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5) -- 灰色
        end
    end

    -- 刷新列表以重新排序
    self:RefreshActivityList()

    ns.Addon:Print(string.format("%s %s", leaderName, isFavorite and "已取消收藏" or "已添加到收藏"))
end

function BrowserFrame:OnWhisperClick(button)
    if not button.activity then return end

    local leaderName = button.activity.leaderName
    if leaderName and leaderName ~= "" then
        -- 私聊埋点
        ns.MeetingHornAPI:InsertLog({time(), "raid_private_chat", {page_sheet = "团本招募", target_player_name = leaderName}})
        -- 使用 ChatFrame_OpenChat API 正确初始化聊天输入框（解决首次点击不生效的问题）
        ChatFrame_OpenChat("/w " .. leaderName .. " ", ChatFrame1)
    else
        ns.Addon:Print("无法获取团长信息")
    end
end

function BrowserFrame:OnActivityButtonClick(button)
    -- 取消之前选中的按钮
    if self.selectedActivity and self.selectedActivity ~= button then
        self.selectedActivity.selected = false
        self.selectedActivity:GetScript("OnLeave")()
    end

    -- 设置当前选中
    button.selected = true
    button.bg:SetColorTexture(0.3, 0.5, 0.8, 0.6)
    self.selectedActivity = button
end

-- 获取职业颜色 - 使用WoW内置的颜色表
function BrowserFrame:GetClassColor(className)
    if not className then
        return {1, 1, 1} -- 默认白色
    end

    -- 转换为大写
    local classToken = string.upper(className)

    -- 使用WoW内置的职业颜色
    if RAID_CLASS_COLORS and RAID_CLASS_COLORS[classToken] then
        local color = RAID_CLASS_COLORS[classToken]
        return {color.r, color.g, color.b}
    end

    -- 备用颜色表
    local colors = {
        ["战士"] = {0.78, 0.61, 0.43},
        ["WARRIOR"] = {0.78, 0.61, 0.43},
        ["圣骑士"] = {0.96, 0.55, 0.73},
        ["PALADIN"] = {0.96, 0.55, 0.73},
        ["猎人"] = {0.67, 0.83, 0.45},
        ["HUNTER"] = {0.67, 0.83, 0.45},
        ["盗贼"] = {1.00, 0.96, 0.41},
        ["ROGUE"] = {1.00, 0.96, 0.41},
        ["牧师"] = {1.00, 1.00, 1.00},
        ["PRIEST"] = {1.00, 1.00, 1.00},
        ["死亡骑士"] = {0.77, 0.12, 0.23},
        ["DEATHKNIGHT"] = {0.77, 0.12, 0.23},
        ["萨满祭司"] = {0.14, 0.35, 1.00},
        ["SHAMAN"] = {0.14, 0.35, 1.00},
        ["法师"] = {0.25, 0.78, 0.92},
        ["MAGE"] = {0.25, 0.78, 0.92},
        ["术士"] = {0.53, 0.53, 0.93},
        ["WARLOCK"] = {0.53, 0.53, 0.93},
        ["德鲁伊"] = {1.00, 0.49, 0.04},
        ["DRUID"] = {1.00, 0.49, 0.04}
    }

    return colors[classToken] or colors[className] or {1, 1, 1} -- 默认白色
end

function BrowserFrame:ShowActivityTooltip(button)
    if not button.activity then return end

    local activity = button.activity
    local raidData = activity:GetRaidData()
    local modeData = activity:GetModeData()
    local playerName = UnitName("player")

    -- 固定到插件主框架右上角
    local mainFrame = _G["MeetingHornHeroicMainFrame"]
    if mainFrame then
        GameTooltip:SetOwner(mainFrame, "ANCHOR_NONE")
        GameTooltip:ClearAllPoints()
        GameTooltip:SetPoint("TOPLEFT", mainFrame, "TOPRIGHT", 10, 0)
    else
        -- 如果主框架未找到，回退到UIParent
        GameTooltip:SetOwner(UIParent, "ANCHOR_NONE")
        GameTooltip:ClearAllPoints()
        GameTooltip:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -50, -50)
    end
    GameTooltip:ClearLines()

    -- 标题：活动显示名称（优先使用自定义标题）
    GameTooltip:AddLine(GetActivityDisplayName(activity), 1, 1, 1)

    -- 模式和队长
    local modeText
    if activity._source == "meetinghorn" then
        modeText = "未知"
        GameTooltip:AddDoubleLine("模式:", modeText, 0.7, 0.7, 0.7, 0.5, 0.5, 0.5)
    else
        modeText = modeData and modeData.name or "英雄"
        GameTooltip:AddDoubleLine("模式:", modeText, 0.7, 0.7, 0.7, 1, 1, 1)
    end

    -- 队长名字使用职业颜色和认证星标
    local fullLeaderName = activity.leaderName or ""
    -- 提取团长名字（去掉区服信息）
    local leaderName = string.match(fullLeaderName, "([^%-]+)") or fullLeaderName
    local leaderClassFileName = activity:GetLeaderClass()

    -- 检查认证等级
    local leaderFullName = leaderName
    local currentLevel = ns.MeetingHornAPI:GetPlayerRegimentLevel(leaderFullName)

    -- 构建显示文本（包含认证图标）
    local displayLeaderName = leaderName
    if currentLevel and currentLevel > 0 then
        displayLeaderName = leaderName .. string.format([[|TInterface\AddOns\MeetingHorn\Media\certification_icon_%d:16:64:0:0:128:64:0:128:0:33|t]], currentLevel)
    end

    -- 设置队长名字颜色
    if leaderClassFileName then
        local classColor = nil

        -- 尝试使用GetClassColor（如果可用）
        if GetClassColor then
            local r, g, b = GetClassColor(leaderClassFileName)
            if r and g and b then
                classColor = {r = r, g = g, b = b}
            end
        end

        -- 回退到RAID_CLASS_COLORS
        if not classColor and RAID_CLASS_COLORS and RAID_CLASS_COLORS[leaderClassFileName] then
            classColor = RAID_CLASS_COLORS[leaderClassFileName]
        end

        if classColor then
            GameTooltip:AddDoubleLine("队长:", displayLeaderName, 0.7, 0.7, 0.7, classColor.r, classColor.g, classColor.b)
        else
            GameTooltip:AddDoubleLine("队长:", displayLeaderName, 0.7, 0.7, 0.7, 0.5, 1, 0.5)
        end
    else
        GameTooltip:AddDoubleLine("队长:", displayLeaderName, 0.7, 0.7, 0.7, 0.5, 1, 0.5)
    end

    -- 活动状态
    local isPlayerActivity = (activity.leaderName == playerName)
    local isPlayerInActivity = activity.members and activity.members[playerName] ~= nil

    if isPlayerActivity then
        GameTooltip:AddLine(" ", 1, 1, 1)
        GameTooltip:AddLine("|cFFFFD700[我创建的活动]|r", 1, 1, 0)
    elseif isPlayerInActivity then
        GameTooltip:AddLine(" ", 1, 1, 1)
        GameTooltip:AddLine("|cFF00FF00[我参与的活动]|r", 0, 1, 0)
    end

    -- 备注
    if activity.comment and activity.comment ~= "" then
        GameTooltip:AddLine(" ", 1, 1, 1)
        GameTooltip:AddLine("备注:", 0.7, 0.7, 0.7)
        GameTooltip:AddLine(activity.comment, 1, 1, 1, 1)
    end

    -- 职业需求统计（仅 MeetingHornHeroic 创建的活动才有职业需求）
    if activity._source ~= "meetinghorn" then
        GameTooltip:AddLine(" ", 1, 1, 1)
        GameTooltip:AddLine("职业需求:", 0.7, 0.7, 0.7)

        -- 统计当前成员
        local tankCount = 0
        local healerCount = 0
        local dpsCount = 0

        if activity.members then
            for _, member in pairs(activity.members) do
                if member.role == "tank" then
                    tankCount = tankCount + 1
                elseif member.role == "healer" then
                    healerCount = healerCount + 1
                else
                    dpsCount = dpsCount + 1
                end
            end
        end

        -- 获取总需求数量（固定值，不随成员变化）
        local tankNeeded = activity.neededRoles and activity.neededRoles.tank or 0
        local healerNeeded = activity.neededRoles and activity.neededRoles.healer or 0
        local dpsNeeded = activity.neededRoles and activity.neededRoles.dps or 0

        -- 显示职业进度
        if tankNeeded > 0 then
            local colorR, colorG, colorB = 0.8, 0.8, 1 -- 坦克蓝色
            if tankCount >= tankNeeded then
                colorR, colorG, colorB = 0.5, 1, 0.5 -- 满员时绿色
            elseif tankCount == 0 then
                colorR, colorG, colorB = 1, 0.5, 0.5 -- 没人时红色
            end
            GameTooltip:AddDoubleLine("坦克:", string.format("%d/%d", tankCount, tankNeeded), 0.7, 0.7, 0.7, colorR, colorG, colorB)
        end

        if healerNeeded > 0 then
            local colorR, colorG, colorB = 0.8, 1, 0.8 -- 治疗绿色
            if healerCount >= healerNeeded then
                colorR, colorG, colorB = 0.5, 1, 0.5 -- 满员时绿色
            elseif healerCount == 0 then
                colorR, colorG, colorB = 1, 0.5, 0.5 -- 没人时红色
            end
            GameTooltip:AddDoubleLine("治疗:", string.format("%d/%d", healerCount, healerNeeded), 0.7, 0.7, 0.7, colorR, colorG, colorB)
        end

        if dpsNeeded > 0 then
            local colorR, colorG, colorB = 1, 0.8, 0.8 -- 输出红色
            if dpsCount >= dpsNeeded then
                colorR, colorG, colorB = 0.5, 1, 0.5 -- 满员时绿色
            elseif dpsCount == 0 then
                colorR, colorG, colorB = 1, 0.5, 0.5 -- 没人时红色
            end
            GameTooltip:AddDoubleLine("输出:", string.format("%d/%d", dpsCount, dpsNeeded), 0.7, 0.7, 0.7, colorR, colorG, colorB)
        end
    else
        -- MeetingHorn 原生活动，显示来源提示
        GameTooltip:AddLine(" ", 1, 1, 1)
        GameTooltip:AddLine("|cFF808080来自 MeetingHorn 的活动，无职业需求数据|r", 0.5, 0.5, 0.5)
    end

    -- 成员详细信息（可选显示，在职业统计下方）
    if activity.members and next(activity.members) then
        GameTooltip:AddLine(" ", 1, 1, 1)
        GameTooltip:AddLine("成员列表:", 0.7, 0.7, 0.7)

        local tankMembers = {}
        local healerMembers = {}
        local dpsMembers = {}

        for _, member in pairs(activity.members) do
            if member.role == "tank" then
                table.insert(tankMembers, member)
            elseif member.role == "healer" then
                table.insert(healerMembers, member)
            else
                table.insert(dpsMembers, member)
            end
        end

        -- 显示坦克成员
        if #tankMembers > 0 then
            for i, member in ipairs(tankMembers) do
                local memberName = member.name

                -- 使用正确的职业颜色获取方法
                local r, g, b = 1, 1, 1 -- 默认白色
                if member.classFileName and RAID_CLASS_COLORS and RAID_CLASS_COLORS[member.classFileName] then
                    local classColor = RAID_CLASS_COLORS[member.classFileName]
                    r, g, b = classColor.r, classColor.g, classColor.b
                end

                GameTooltip:AddDoubleLine("坦克:", memberName, 0.8, 0.8, 1, r, g, b)
            end
        end

        -- 显示治疗成员
        if #healerMembers > 0 then
            for i, member in ipairs(healerMembers) do
                local memberName = member.name

                -- 使用正确的职业颜色获取方法
                local r, g, b = 1, 1, 1 -- 默认白色
                if member.classFileName and RAID_CLASS_COLORS and RAID_CLASS_COLORS[member.classFileName] then
                    local classColor = RAID_CLASS_COLORS[member.classFileName]
                    r, g, b = classColor.r, classColor.g, classColor.b
                end

                GameTooltip:AddDoubleLine("治疗:", memberName, 0.8, 1, 0.8, r, g, b)
            end
        end

        -- 显示DPS成员
        if #dpsMembers > 0 then
            for i, member in ipairs(dpsMembers) do
                local memberName = member.name

                -- 使用正确的职业颜色获取方法
                local r, g, b = 1, 1, 1 -- 默认白色
                if member.classFileName and RAID_CLASS_COLORS and RAID_CLASS_COLORS[member.classFileName] then
                    local classColor = RAID_CLASS_COLORS[member.classFileName]
                    r, g, b = classColor.r, classColor.g, classColor.b
                end
                GameTooltip:AddDoubleLine("伤害:", memberName, 1, 0.8, 0.8, r, g, b)
            end
        end
    end

    -- 创建时间
    if activity.createdTime then
        GameTooltip:AddLine(" ", 1, 1, 1)
        GameTooltip:AddDoubleLine("创建时间:", date("%H:%M", activity.createdTime), 0.7, 0.7, 0.7, 1, 1, 1)
    end

    GameTooltip:Show()
end

-- 显示右键菜单
function BrowserFrame:ShowContextMenu(button)
    if not button.activity then return end

    local activity = button.activity
    local playerName = UnitName("player")
    local leaderName = activity.leaderName
    local isPlayerActivity = (leaderName == playerName)
    local isFavorite = ns.Addon.db.profile.favorites and ns.Addon.db.profile.favorites[leaderName] or false

    -- 初始化收藏数据表
    if not ns.Addon.db.profile.favorites then
        ns.Addon.db.profile.favorites = {}
    end

    local menu = {
        {
            text = leaderName, -- 显示角色名字但不带区服
            isTitle = true,
            notCheckable = true
        },
        {
            text = " ",
            disabled = true,
            notCheckable = true
        }
    }

    -- 收藏/取消收藏
    if not isPlayerActivity then
        table.insert(menu, {
            text = isFavorite and "取消收藏" or "收藏",
            func = function()
                ns.Addon.db.profile.favorites[leaderName] = not isFavorite
                if not isFavorite then
                    -- 记录收藏时间用于排序
                    ns.Addon.db.profile.favoriteTime = ns.Addon.db.profile.favoriteTime or {}
                    ns.Addon.db.profile.favoriteTime[leaderName] = time()
                end
                self:RefreshActivityList()
                ns.Addon:Print(string.format("%s %s", leaderName, isFavorite and "已取消收藏" or "已添加收藏"))
            end,
            notCheckable = true
        })
    end

    -- 私聊
    table.insert(menu, {
        text = "私聊",
        func = function()
            ChatFrame1EditBox:SetText("/whisper " .. leaderName .. " ")
            ChatFrame1EditBox:Show()
            ChatFrame1EditBox:SetFocus()
        end,
        notCheckable = true
    })

    -- 取消选择
    table.insert(menu, {
        text = "取消",
        func = function()
            -- 什么也不做，只是关闭菜单
        end,
        notCheckable = true
    })

    -- 使用 WoW 的菜单系统
    local menuFrame = CreateFrame("Frame", "HeroicBrowserContextMenu", UIParent, "UIDropDownMenuTemplate")
    UIDropDownMenu_Initialize(menuFrame, function(self, level)
        for _, item in ipairs(menu) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = item.text
            info.func = item.func
            info.notCheckable = item.notCheckable
            UIDropDownMenu_AddButton(info, level)
        end
    end, "MENU")

    ToggleDropDownMenu(1, nil, menuFrame, "cursor", 0, 0)
end

function BrowserFrame:OnActivityUpdate(eventType, data)
    -- 智能刷新 - 使用节流机制避免频繁刷新导致卡顿

    -- 记录需要刷新的原因（用于调试）
    self.pendingRefreshReasons = self.pendingRefreshReasons or {}

    if eventType == "ACTIVITY_CREATED" then
        self.pendingRefreshReasons["created"] = true
        if data and data.leaderName then
            ns.Addon:Print(string.format("新活动已创建：%s", data.leaderName))
        end
    elseif eventType == "ACTIVITY_UPDATED" then
        self.pendingRefreshReasons["updated"] = true
    elseif eventType == "ACTIVITY_CLOSED" then
        self.pendingRefreshReasons["closed"] = true
        if data and data.leaderName then
            ns.Addon:Print(string.format("活动已关闭：%s", data.leaderName))
        end
    elseif eventType == "EXTERNAL_ACTIVITY_RECEIVED" then
        self.pendingRefreshReasons["external"] = true
        -- 外部活动接收是最频繁的，不打印消息避免刷屏
    elseif eventType == "MEMBER_JOINED" then
        self.pendingRefreshReasons["member_joined"] = true
    elseif eventType == "MEMBER_LEFT" then
        self.pendingRefreshReasons["member_left"] = true
    elseif eventType == "ACTIVITY_EXPIRED" then
        self.pendingRefreshReasons["expired"] = true
        if data and data.leaderName then
            ns.Addon:Print(string.format("活动已过期：%s", data.leaderName))
        end
    elseif eventType == "ACTIVITIES_CLEANED" then
        self.pendingRefreshReasons["cleaned"] = true
        if data and type(data) == "number" and data > 0 then
            ns.Addon:Print(string.format("已清理%d个过期活动", data))
        end
    elseif eventType == "ACTIVITY_SYNCED" then
        self.pendingRefreshReasons["synced"] = true
        -- 活动与队伍同步后需要更新列表
    elseif eventType == "ACTIVITY_LIST_UPDATED" then
        self.pendingRefreshReasons["manual"] = true
    end

    -- 使用节流刷新
    self:ScheduleRefresh()
end

-- 节流刷新机制 - 避免频繁刷新导致游戏卡顿
function BrowserFrame:ScheduleRefresh()
    -- 如果界面没有显示，标记需要刷新，等可见时补刷
    if not self:IsVisible() then
        self._needsRefreshOnShow = true
        return
    end

    -- 如果已经有待处理的刷新，取消它
    if self.refreshTimer then
        self.refreshTimer:Cancel()
    end

    -- 设置延迟刷新，200ms内的多次更新会被合并（从500ms缩短到200ms）
    self.refreshTimer = C_Timer.NewTimer(0.2, function()
        self:DoRefresh()
        self.refreshTimer = nil
    end)
end

-- 实际执行刷新
function BrowserFrame:DoRefresh()
    -- 只有在界面可见时才刷新
    if not self:IsVisible() then
        return
    end

    -- 执行刷新
    self:RefreshActivityList()

    -- 清除待刷新标记
    self.pendingRefreshReasons = {}
end

-- 立即刷新（用于手动刷新按钮等需要立即响应的操作）
function BrowserFrame:ForceRefresh()
    if self.refreshTimer then
        self.refreshTimer:Cancel()
        self.refreshTimer = nil
    end

    self:DoRefresh()
end

-- 保持清理定时器，但不用于刷新UI
function BrowserFrame:StartCleanupTimer()
    if self.cleanupTimer then
        self.cleanupTimer:Cancel()
    end

    -- 每60秒清理一次过期活动（在后台进行，不影响UI）
    self.cleanupTimer = C_Timer.NewTicker(60, function()
        ns.ActivityManager:CleanExpiredActivities()
        -- 注意：CleanExpiredActivities 会触发 ACTIVITY_EXPIRED 事件，然后通过回调刷新UI
    end)
end

function BrowserFrame:StopCleanupTimer()
    if self.cleanupTimer then
        self.cleanupTimer:Cancel()
        self.cleanupTimer = nil
    end
end

-- 公共接口
function BrowserFrame:Show()
    self:SetShown(true)
    self:RefreshActivityList()
    self._needsRefreshOnShow = false
    self.pendingRefreshReasons = {}
    self:StartCleanupTimer() -- 开始后台清理定时器
end

function BrowserFrame:Hide()
    self:SetShown(false)
    self:StopCleanupTimer() -- 停止后台清理定时器
end

ns.UI = ns.UI or {}
ns.UI.BrowserFrame = BrowserFrame

local _, RS = ...
local UI = RS.UI

local MainWindow = {}
MainWindow.__index = MainWindow

local DEFAULT_LAYOUT = {
    width = 1100,
    height = 700,
    screenMargin = 20,
    titleY = -30,
    titleHeight = 30,
    bodyTop = -20,
    sidePadding = 14,
    navigationWidth = 210,
    navigationInnerPadding = 6,
    sidebarHeaderHeight = 112,
    sidebarFooterHeight = 48,
    navigationContentPadding = 6,
    navigationScrollbarReserve = 10,
    navigationGroupHeaderHeight = 22,
    navigationButtonHeight = 30,
    navigationSwitchHitSize = 28,
    navigationSwitchIconSize = 18,
    navigationSwitchGap = 2,
    navigationGap = 1,
    navigationGroupGap = 3,
    contentGap = 10,
    pageTitleHeight = 34,
    pageTitleRightReserve = 210,
    pageDescriptionHeight = 34,
    pageHeaderGap = 2,
    pageContentGap = 8,
    footerHeight = 48,
    footerBottom = 0,
    closeButtonWidth = 130,
}

local function GetFrame(object)
    if type(object) == "table" and object.frame then return object.frame end
    return object
end

local SEARCH_KEYWORDS = {
    ["rss-settings"] = "预设安装器 安装器 安装 预设 RSS 布局 配置安装器",
    ["rss-transfer"] = "配置管理 配置迁移 导入 导出 字符串 RSS AT时间轴 AbilityTimeline",
    movemanager = "移动管理 移动 解锁 锁定 职业模块 饰品 ex工具箱 编辑模式 外部插件",
    about = "关于 插件简介 作者 命令 kook dd bilibili",
    addonprofile = "插件管理 预设 白名单 topbar 方案 导入 导出 插件列表",
    extratools = "插件增强 管理工具 EllesmereUI ElvUI BigWigs Details TinyInspect 集合石 国服符文兼容 小地图音量 面板位置清理 更新屏蔽",
    ["quest"] = "任务与拾取 任务 拾取 自动出售垃圾 快速拾取 任务自动交接 自动接任务 自动交任务 Shift 体验优化",
    ["celestial"] = "天神能量条 天神条 天神 简洁模式 体验优化",
    cvar = "cvar cvar设置 游戏设置 伤害数字 血条距离 装备比较 画面特效 镜头",
    topBar = "顶部组件 顶部快捷按钮 顶部快捷按钮 快捷按钮 topbar 微型菜单 炉石 时间 背包 插件入口",
    ["micro-menu"] = "微型菜单 微型菜单栏 菜单栏 MicroMenu 顶部组件",
    ["native-tooltip"] = "鼠标提示增强 鼠标提示 鼠标 提示 着色 跟随 HUD",
    ["macroUI"] = "宏界面增强 宏界面扩展 宏界面拓展 宏 Macro NDui ElvUI PIG",
    ["classreminders"] = "职业提醒 职业工具箱 Class 奥术智慧 霜甲术 主手附魔 道标 中心文字",
    ["general-text"] = "通用文字提醒 大餐 大餐提醒 中心文字 体验优化",
    ["blizzard-ui"] = "暴雪界面增强 暴雪窗口移动解锁 解锁拖动 隐藏 微型菜单 背包 狮鹫 暴雪 平砍 Swing Timer 界面增强",
    ["lfg-tools"] = "随机本工具 随机本 传送 退队 进组职责保护 NDui 独立坐标 ElvUI 独立坐标 体验优化",
    ["rpb-settings"] = "职业资源条 职业工具箱 扩展接入",
    versionDisplay = "版本号显示 版本号",
    appearance = "界面样式 界面 字体 聊天条字体 经验条字体 战斗字体 时间字体",
    chatbar = "聊天条 字号 间距 频道 说 喊 会 队 团",
    raidmarker = "标记栏 目标标记 世界光柱 倒数 就位 职责确认",
    experienceBar = "经验条 顶部经验条 经验 等级 双倍 任务经验 升级时间",
    combat = "战斗提醒 计时 提醒字号 坐标 体验优化",
    ["fast-focus"] = "快速焦点 焦点 鼠标按键 shift ctrl alt 顶部组件",
    ["player-tooltip"] = "鼠标增强 玩家资料 玩家提示 鼠标提示 装等 钥匙",
    ["chat-bar"] = "聊天条 字号 间距 频道 说 喊 会 队 团",
    ["experience-bar"] = "经验条 顶部经验条 经验 等级 双倍 任务经验 升级时间",
    portal = "法师动作条 传送门 传送 生长方向 职业工具箱",
    raidMarker = "标记栏 目标标记 世界光柱 倒数 就位 职责确认",
    autoMark = "自动标记 坦克 治疗 团队标记 顶部组件",
}

local function GetLayoutValue(self, key)
    if self.shellFooterHeight and (key == "footerHeight" or key == "sidebarFooterHeight") then
        return self.shellFooterHeight
    end
    local value = self.layout[key]
    if value == nil then
        value = DEFAULT_LAYOUT[key]
    end
    return value
end

local function ClearArrayAfter(values, count)
    local index = #values
    while index > count do
        values[index] = nil
        index = index - 1
    end
end

local function ResolveVersion()
    if RS.version and RS.version ~= "" then return tostring(RS.version) end
    local getter = RS.Compat and RS.Compat.GetAddOnMetadata
    if type(getter) == "function" then
        local version = getter(RS.addonName or "RurutiaSuite", "Version")
        if version and version ~= "" then return tostring(version) end
    end
    return "0.0.0"
end

local function ResolveDisplayVersion()
    local version = ResolveVersion()
    local build = RS.Build
    local id = build and type(build.GetID) == "function" and build.GetID()
    local scope
    if id == "retail" then
        scope = "retail"
    elseif id == "classic-infinite" then
        scope = "forever"
    elseif type(id) == "string" and id:match("^classic%-") then
        scope = "classic"
    end
    return "v" .. version .. (scope and (" " .. scope) or "")
end

local function OnWindowHidden(component)
    local owner = component.mainWindowOwner
    if owner then
        owner:_HandleHidden()
    end
end

local function OnCloseClicked(component)
    local owner = component.mainWindowOwner
    if owner then
        owner:Close()
    end
end

local function IsRsMoveUnlocked()
    return RS.MoveManager and RS.MoveManager.isMoveMode == true
end

local function OnMoveClicked(component)
    if type(RS.ToggleMarkerAnchors) == "function" then
        RS:ToggleMarkerAnchors()
    elseif type(RS.OnMoveCommand) == "function" then
        RS:OnMoveCommand("")
    end
    component:SetText(IsRsMoveUnlocked() and "锁定移动" or "解锁移动")
end

local function OnChangelogClicked()
    if type(RS.ShowChangelog) == "function" then
        RS:ShowChangelog()
    end
end

local PAGE_ACTIONS = {
    { key = "preview", text = "预览模式" },
    { key = "resetPosition", text = "重置位置" },
    { key = "restoreDefaults", text = "恢复默认" },
}
local function OnPageActionClicked(component)
    local owner = component.mainWindowOwner
    if not owner then return end
    owner:RefreshPageActions()
    local action = component.pageAction
    if action and owner.actionPage == action.page and component.enabled then
        return action:Invoke()
    end
end

function MainWindow:BindPageActions(page)
    self.actionPage = page
    self:RefreshPageActions()
end

function MainWindow:RefreshPageActions()
    if not self.pageActionButtons then return end
    local page = self.actionPage
    for _, spec in ipairs(PAGE_ACTIONS) do
        local button, chosen = self.pageActionButtons[spec.key], nil
        for _, entry in ipairs(page and page.pageActions or {}) do
            local action = entry.component
            local visible = entry.getVisible and entry.getVisible(page, entry) ~= false
                or not entry.getVisible and action.visible
            if action.slot == spec.key and visible then
                -- Ambiguous bindings fail closed rather than dispatching arbitrarily.
                if chosen then chosen = nil; break end
                chosen = entry
            end
        end
        local action = chosen and chosen.component
        button.pageAction = action
        local enabled = action and action.enabled
        if chosen and chosen.getEnabled then enabled = chosen.getEnabled(page, chosen) == true end
        if action then
            action.enabled = enabled == true
            if chosen.getText then action.text = chosen.getText(page, chosen) or "" end
        end
        button:SetText(action and action:GetText() or spec.text)
        button:SetEnabled(enabled == true)
        button.options.tooltip = action and (action.options.tooltip or spec.text) or "本页无此功能"
    end
end

local function OnNavigationClicked(component)
    local owner = component.mainWindowOwner
    if owner then
        if component.mainWindowSearchAction then return component.mainWindowSearchAction() end
        owner:SelectPage(component.mainWindowPageId)
    end
end

local function OnNavigationGroupClicked(frame, mouseButton)
    if mouseButton ~= "LeftButton" then return end
    local component = frame.mainWindowNavigationLabel
    local owner = component.mainWindowOwner
    if owner then owner:ToggleNavigationGroup(component.mainWindowGroupId) end
end

local function OnNavigationSwitchClicked(component)
    local owner = component.mainWindowOwner
    if owner then owner:ToggleNavigationSwitch(component.mainWindowPageId) end
end

local function SetNavigationRowHovered(component, hovered)
    local owner = component.mainWindowOwner
    local selectButton = owner and owner.navigationButtons[component.mainWindowPageId]
    if selectButton and not selectButton.released then
        selectButton.hovered = hovered and true or false
        selectButton:RefreshTheme()
    end
end

local function OnNavigationSwitchEntered(component)
    SetNavigationRowHovered(component, true)
end

local function OnNavigationSwitchLeft(component)
    local owner = component.mainWindowOwner
    SetNavigationRowHovered(component, false)
    if owner then owner:_ApplyNavigationSwitchVisual(component.mainWindowPageId) end
end

local function OnSearchChanged(component, value)
    local owner = component.mainWindowOwner
    if owner then owner:SetSearchQuery(value) end
end

local function OnSearchFocusGained(component)
    local owner = component.mainWindowOwner
    if owner then
        owner.searchFocused = true
        owner:_UpdateSearchHint()
    end
end

local function OnSearchFocusLost(component)
    local owner = component.mainWindowOwner
    if owner then
        owner.searchFocused = false
        owner:_UpdateSearchHint()
    end
end

local function OnThemeChanged(self)
    self:_HandleVisualChange()
end

local function OnProviderChanged(self)
    self:_HandleVisualChange()
end

function MainWindow:New(system, options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.system = system
    instance.parent = options.parent
    instance.title = options.title or "露露的工具箱"
    instance.layout = options.layout or {}
    instance.window = nil
    instance.sidebarPanel = nil
    instance.sidebarDivider = nil
    instance.brandIcon = nil
    instance.titleLabel = nil
    instance.brandSubtitle = nil
    instance.searchBox = nil
    instance.searchHint = nil
    instance.headerDivider = nil
    instance.footerDivider = nil
    instance.versionLabel = nil
    instance.navigationScroll = nil
    instance.navigationContainer = nil
    instance.navigationContent = nil
    instance.pageTitleLabel = nil
    instance.pageDescriptionLabel = nil
    instance.contentViewport = nil
    instance.contentContainer = nil
    instance.footerContainer = nil
    instance.closeButton = nil
    instance.moveButton = nil
    instance.changelogButton = nil
    instance.shellObjects = {}
    instance.navigationButtons = {}
    instance.navigationItems = {}
    instance.navigationSwitchButtons = {}
    instance.navigationSwitchStates = {}
    instance.navigationGroupLabels = {}
    instance.collapsedGroups = {}
    instance.availablePageSet = {}
    instance.navigationOrder = {}
    instance.navigationGroupOrder = {}
    instance.navigationLayoutOrder = {}
    instance.navigationEntries = {}
    instance.filteredNavigationEntries = {}
    instance.navigationMetadata = {}
    instance.visiblePageSet = {}
    instance.visibleGroupSet = {}
    instance.navigationContentHeight = 1
    instance.currentPage = nil
    instance.currentDescription = ""
    instance.searchQuery = ""
    instance.searchFocused = false
    instance.visualDirty = false
    instance.builds = 0
    instance.opens = 0
    instance.closes = 0
    instance.visualRefreshes = 0
    instance.hasPosition = false
    instance.backgroundOpacity = 0.50
    instance.containerOpacity = 0
    instance.resolvedWidth = GetLayoutValue(instance, "width")
    instance.resolvedHeight = GetLayoutValue(instance, "height")
    return instance
end

function MainWindow:_ResolveWindowSize()
    local desiredWidth = GetLayoutValue(self, "width")
    local desiredHeight = GetLayoutValue(self, "height")
    local margin = GetLayoutValue(self, "screenMargin")
    local parent = GetFrame(self.parent) or UIParent
    local parentWidth = parent and parent.GetWidth and tonumber(parent:GetWidth()) or nil
    local parentHeight = parent and parent.GetHeight and tonumber(parent:GetHeight()) or nil
    local scale = 1
    if parentWidth and parentWidth > margin * 2 then
        scale = math.min(scale, (parentWidth - margin * 2) / desiredWidth)
    end
    if parentHeight and parentHeight > margin * 2 then
        scale = math.min(scale, (parentHeight - 150 - margin) / desiredHeight)
    end
    scale = math.max(0.45, math.min(1, scale))
    self.resolvedWidth = math.floor(desiredWidth * scale + 0.5)
    self.resolvedHeight = math.floor(desiredHeight * scale + 0.5)
    return self.resolvedWidth, self.resolvedHeight
end

function MainWindow:_Track(object)
    self.shellObjects[#self.shellObjects + 1] = object
    object.mainWindowOwner = self
    return object
end

function MainWindow:_ApplyNavigationLayout()
    local padding = GetLayoutValue(self, "navigationContentPadding")
    local groupHeight = GetLayoutValue(self, "navigationGroupHeaderHeight")
    local buttonHeight = GetLayoutValue(self, "navigationButtonHeight")
    local gap = GetLayoutValue(self, "navigationGap")
    local groupGap = GetLayoutValue(self, "navigationGroupGap")
    local width = math.max(
        1,
        GetLayoutValue(self, "navigationWidth")
            - GetLayoutValue(self, "navigationInnerPadding") * 2
            - GetLayoutValue(self, "navigationScrollbarReserve")
    )
    local usedHeight = padding
    local index = 1
    while index <= #self.navigationLayoutOrder do
        local object = self.navigationLayoutOrder[index]
        local isGroup = object.mainWindowNavigationKind == "group"
        if isGroup and index > 1 then
            usedHeight = usedHeight + groupGap
        end

        local height = isGroup and groupHeight or buttonHeight
        object.frame:ClearAllPoints()
        local left = isGroup and padding or (padding + 12)
        object.frame:SetPoint("TOPLEFT", self.navigationContent, "TOPLEFT", left, -usedHeight)
        object.frame:SetPoint("TOPRIGHT", self.navigationContent, "TOPRIGHT", -padding, -usedHeight)
        object.frame:SetHeight(height)
        if not isGroup then
            local selectButton = object.mainWindowSelectButton
            local toggleButton = object.mainWindowSwitchButton
            selectButton.frame:ClearAllPoints()
            selectButton.frame:SetPoint("TOPLEFT", object.frame, "TOPLEFT", 0, 0)
            selectButton.frame:SetPoint("BOTTOMLEFT", object.frame, "BOTTOMLEFT", 0, 0)
            selectButton.frame:SetPoint("TOPRIGHT", object.frame, "TOPRIGHT", 0, 0)
            selectButton.frame:SetPoint("BOTTOMRIGHT", object.frame, "BOTTOMRIGHT", 0, 0)
            if selectButton.label then
                local rightInset = object.mainWindowHasSwitch
                    and (GetLayoutValue(self, "navigationSwitchHitSize")
                        + GetLayoutValue(self, "navigationSwitchGap") + 4)
                    or 8
                selectButton.label:ClearAllPoints()
                selectButton.label:SetPoint("LEFT", selectButton.frame, "LEFT", 12, 0)
                selectButton.label:SetPoint("RIGHT", selectButton.frame, "RIGHT", -rightInset, 0)
            end
            if object.mainWindowHasSwitch then
                local hitSize = GetLayoutValue(self, "navigationSwitchHitSize")
                toggleButton.frame:ClearAllPoints()
                toggleButton.frame:SetPoint("RIGHT", object.frame, "RIGHT", 0, 0)
                toggleButton.frame:SetSize(hitSize, hitSize)
                -- The page selector deliberately fills the whole row so its
                -- hover stays continuous.  Keep the independent power hitbox
                -- above that sibling or the full-row button wins mouse input
                -- on the live client even though the icon remains visible.
                if toggleButton.frame.SetFrameLevel and selectButton.frame.GetFrameLevel then
                    toggleButton.frame:SetFrameLevel((selectButton.frame:GetFrameLevel() or 0) + 2)
                end
            end
        end
        object.mainWindowNavigationOffset = usedHeight
        usedHeight = usedHeight + height + gap
        index = index + 1
    end

    if #self.navigationLayoutOrder > 0 then
        usedHeight = usedHeight - gap
    end
    self.navigationContentHeight = math.max(1, usedHeight + padding)
    self.navigationScroll:SetContentSize(width, self.navigationContentHeight)
    self:_SetNavigationScrollOffset()
end

function MainWindow:_SetNavigationScrollOffset(offset)
    local frame = self.navigationScroll.frame
    local current = tonumber(frame.GetVerticalScroll and frame:GetVerticalScroll()) or 0
    local maximum = math.max(0, self.navigationContentHeight - (tonumber(frame:GetHeight()) or 0))
    local value = math.max(0, math.min(maximum, offset or current))
    if frame.SetVerticalScroll and value ~= current then frame:SetVerticalScroll(value) end
    local bar = self.navigationScroll.scrollBar
    if bar and bar.SetValue then bar:SetValue(value) end
end

function MainWindow:_RevealNavigationRow(id)
    local item = self.navigationItems[id]
    if not item or not self.visiblePageSet[id] then return end
    local frame = self.navigationScroll.frame
    local current = tonumber(frame.GetVerticalScroll and frame:GetVerticalScroll()) or 0
    local top = item.mainWindowNavigationOffset or 0
    local bottom = top + GetLayoutValue(self, "navigationButtonHeight")
    local height = tonumber(frame:GetHeight()) or 0
    if top < current then self:_SetNavigationScrollOffset(top)
    elseif bottom > current + height then self:_SetNavigationScrollOffset(bottom - height) end
end

function MainWindow:_ApplyPageHeaderLayout()
    local sidePadding = GetLayoutValue(self, "sidePadding")
    local rightLeft = GetLayoutValue(self, "navigationWidth")
        + GetLayoutValue(self, "contentGap")
    local bodyTop = GetLayoutValue(self, "bodyTop")
    local contentBottom = GetLayoutValue(self, "footerBottom")
        + GetLayoutValue(self, "footerHeight")
    local titleHeight = GetLayoutValue(self, "pageTitleHeight")
    local titleRightReserve = GetLayoutValue(self, "pageTitleRightReserve")
    local descriptionHeight = GetLayoutValue(self, "pageDescriptionHeight")
    local headerGap = GetLayoutValue(self, "pageHeaderGap")
    local contentGap = GetLayoutValue(self, "pageContentGap")
    local contentTop = bodyTop - titleHeight - headerGap - descriptionHeight - contentGap

    self.pageTitleLabel.frame:ClearAllPoints()
    self.pageTitleLabel.frame:SetPoint("TOPLEFT", self.window.frame, "TOPLEFT", rightLeft, bodyTop)
    self.pageTitleLabel.frame:SetPoint(
        "TOPRIGHT", self.window.frame, "TOPRIGHT", -titleRightReserve, bodyTop
    )
    self.pageTitleLabel.frame:SetHeight(titleHeight)

    self.pageDescriptionLabel.frame:ClearAllPoints()
    self.pageDescriptionLabel.frame:SetPoint(
        "TOPLEFT", self.pageTitleLabel.frame, "BOTTOMLEFT", 0, -headerGap
    )
    self.pageDescriptionLabel.frame:SetPoint(
        "TOPRIGHT", self.window.frame, "TOPRIGHT", -sidePadding, bodyTop - titleHeight - headerGap
    )
    self.pageDescriptionLabel.frame:SetHeight(descriptionHeight)

    self.pageTitleLabel:SetVisible(true)
    self.pageDescriptionLabel:SetVisible(true)

    self.contentViewport.frame:ClearAllPoints()
    self.contentViewport.frame:SetPoint("TOPLEFT", self.window.frame, "TOPLEFT", rightLeft, contentTop)
    self.contentViewport.frame:SetPoint("TOPRIGHT", self.window.frame, "TOPRIGHT", -sidePadding, contentTop)
    self.contentViewport.frame:SetPoint(
        "BOTTOMRIGHT",
        self.window.frame,
        "BOTTOMRIGHT",
        -sidePadding,
        contentBottom
    )
end

function MainWindow:_ApplyShellLayout()
    local width, height = self:_ResolveWindowSize()
    local shellButtonWidth = self.system.theme:Get("layout.shellButtonWidth") or 89
    local shellButtonHeight = self.system.theme:Get("layout.shellButtonHeight") or 31
    self.shellFooterHeight = nil
    local wrapActions = width < 12 + 6 * shellButtonWidth + 5 * 8
        + GetLayoutValue(self, "closeButtonWidth") + 34
    if wrapActions then
        self.shellFooterHeight = math.max(GetLayoutValue(self, "footerHeight"),
            GetLayoutValue(self, "sidebarFooterHeight")) + shellButtonHeight + 8
    end
    local sidePadding = GetLayoutValue(self, "sidePadding")
    local bodyTop = GetLayoutValue(self, "bodyTop")
    local footerHeight = GetLayoutValue(self, "footerHeight")
    local footerBottom = GetLayoutValue(self, "footerBottom")
    local rightLeft = GetLayoutValue(self, "navigationWidth")
        + GetLayoutValue(self, "contentGap")
    local navigationWidth = GetLayoutValue(self, "navigationWidth")
    local navigationInnerPadding = GetLayoutValue(self, "navigationInnerPadding")
    local sidebarHeaderHeight = GetLayoutValue(self, "sidebarHeaderHeight")
    local sidebarFooterHeight = GetLayoutValue(self, "sidebarFooterHeight")

    self.window.frame:SetSize(width, height)
    if not self.hasPosition then
        self.window.frame:ClearAllPoints()
        self.window.frame:SetPoint("TOP", GetFrame(self.parent) or UIParent, "TOP", 0, -150)
        self.hasPosition = true
    end

    self.sidebarPanel.frame:ClearAllPoints()
    self.sidebarPanel.frame:SetPoint("TOPLEFT", self.window.frame, "TOPLEFT", 0, 0)
    self.sidebarPanel.frame:SetPoint("BOTTOMLEFT", self.window.frame, "BOTTOMLEFT", 0, 0)
    self.sidebarPanel.frame:SetWidth(navigationWidth)

    self.sidebarDivider.frame:ClearAllPoints()
    self.sidebarDivider.frame:SetPoint("TOPRIGHT", self.sidebarPanel.frame, "TOPRIGHT", 0, 0)
    self.sidebarDivider.frame:SetPoint("BOTTOMRIGHT", self.sidebarPanel.frame, "BOTTOMRIGHT", 0, 0)
    self.sidebarDivider.frame:SetWidth(1)

    self.brandIcon:ClearAllPoints()
    self.brandIcon:SetPoint("TOPLEFT", self.sidebarPanel.frame, "TOPLEFT", 14, -12)
    self.brandIcon:SetSize(50, 50)

    self.titleLabel.frame:ClearAllPoints()
    self.titleLabel.frame:SetPoint("TOPLEFT", self.brandIcon, "TOPRIGHT", 10, 1)
    self.titleLabel.frame:SetPoint(
        "TOPRIGHT", self.sidebarPanel.frame, "TOPRIGHT", -10, -13
    )
    self.titleLabel.frame:SetHeight(GetLayoutValue(self, "titleHeight"))

    self.brandSubtitle.frame:ClearAllPoints()
    self.brandSubtitle.frame:SetPoint("TOPLEFT", self.titleLabel.frame, "BOTTOMLEFT", 0, 1)
    self.brandSubtitle.frame:SetPoint("TOPRIGHT", self.titleLabel.frame, "BOTTOMRIGHT", 0, 1)
    self.brandSubtitle.frame:SetHeight(22)

    self.searchBox.frame:ClearAllPoints()
    self.searchBox.frame:SetPoint("TOPLEFT", self.sidebarPanel.frame, "TOPLEFT", 12, -76)
    self.searchBox.frame:SetPoint("TOPRIGHT", self.sidebarPanel.frame, "TOPRIGHT", -12, -76)
    self.searchBox.frame:SetHeight(30)

    self.searchHint.frame:ClearAllPoints()
    self.searchHint.frame:SetPoint("TOPLEFT", self.searchBox.frame, "TOPLEFT", 12, 0)
    self.searchHint.frame:SetPoint("BOTTOMRIGHT", self.searchBox.frame, "BOTTOMRIGHT", -12, 0)

    self.headerDivider.frame:ClearAllPoints()
    self.headerDivider.frame:SetPoint("TOPLEFT", self.window.frame, "TOPLEFT", 0, -sidebarHeaderHeight)
    self.headerDivider.frame:SetPoint("TOPRIGHT", self.window.frame, "TOPRIGHT", 0, -sidebarHeaderHeight)
    self.headerDivider.frame:SetHeight(1)
    self.headerDivider:SetVisible(false)

    self.footerDivider.frame:ClearAllPoints()
    self.footerDivider.frame:SetPoint("BOTTOMLEFT", self.window.frame, "BOTTOMLEFT", 0, sidebarFooterHeight)
    self.footerDivider.frame:SetPoint("BOTTOMRIGHT", self.window.frame, "BOTTOMRIGHT", 0, sidebarFooterHeight)
    self.footerDivider.frame:SetHeight(1)
    self.footerDivider:SetVisible(false)

    self.versionLabel.frame:ClearAllPoints()
    self.versionLabel.frame:SetPoint("TOPRIGHT", self.window.frame, "TOPRIGHT", -18, -18)
    self.versionLabel.frame:SetWidth(180)
    self.versionLabel.frame:SetHeight(22)
    self.versionLabel:SetVisible(true)

    self.navigationScroll.frame:ClearAllPoints()
    self.navigationScroll.frame:SetPoint(
        "TOPLEFT", self.sidebarPanel.frame, "TOPLEFT",
        navigationInnerPadding, -sidebarHeaderHeight - 10
    )
    self.navigationScroll.frame:SetPoint(
        "BOTTOMLEFT", self.sidebarPanel.frame, "BOTTOMLEFT",
        navigationInnerPadding, sidebarFooterHeight + 10
    )
    self.navigationScroll.frame:SetWidth(navigationWidth - navigationInnerPadding * 2)

    self.footerContainer.frame:ClearAllPoints()
    self.footerContainer.frame:SetPoint("BOTTOMLEFT", self.window.frame, "BOTTOMLEFT", rightLeft, footerBottom)
    self.footerContainer.frame:SetPoint("BOTTOMRIGHT", self.window.frame, "BOTTOMRIGHT", -sidePadding, footerBottom)
    self.footerContainer.frame:SetHeight(footerHeight)

    self.closeButton.frame:ClearAllPoints()
    self.closeButton.frame:SetPoint("BOTTOMRIGHT", self.footerContainer.frame, "BOTTOMRIGHT", -10, 12)
    self.closeButton.frame:SetSize(GetLayoutValue(self, "closeButtonWidth"), 35)

    self.moveButton.frame:ClearAllPoints()
    self.moveButton.frame:SetPoint("BOTTOMLEFT", self.sidebarPanel.frame, "BOTTOMLEFT", 12, 12)
    self.moveButton.frame:SetSize(shellButtonWidth, shellButtonHeight)

    self.changelogButton.frame:ClearAllPoints()
    self.changelogButton.frame:SetPoint("BOTTOMLEFT", self.moveButton.frame, "BOTTOMRIGHT", 8, 0)
    self.changelogButton.frame:SetSize(shellButtonWidth, shellButtonHeight)
    local previous = self.changelogButton.frame
    for _, spec in ipairs(PAGE_ACTIONS) do
        local button = self.pageActionButtons and self.pageActionButtons[spec.key]
        if button then
            button.frame:ClearAllPoints()
            if wrapActions and spec.key == "preview" then
                button.frame:SetPoint("BOTTOMLEFT", self.window.frame, "BOTTOMLEFT", 12, 12 + shellButtonHeight + 8)
            else
                button.frame:SetPoint("BOTTOMLEFT", previous, "BOTTOMRIGHT", 8, 0)
            end
            button.frame:SetSize(shellButtonWidth, shellButtonHeight)
            previous = button.frame
        end
    end

    self.guideButton.frame:ClearAllPoints()
    self.guideButton.frame:SetPoint("BOTTOMLEFT", previous, "BOTTOMRIGHT", 8, 0)
    self.guideButton.frame:SetSize(shellButtonWidth, shellButtonHeight)

    self:_ApplyNavigationLayout()
    self:_ApplyPageHeaderLayout()
end

function MainWindow:EnsureCreated()
    if self.window then
        return self.window
    end

    local components = self.system.components
    local staged = setmetatable({}, getmetatable(self))
    for key, value in pairs(self) do staged[key] = value end
    staged.shellObjects = {}

    local function Create(kind, parent, options, label)
        local component, reason = components:Create(kind, parent, options)
        if not component then
            error(reason or ("main window " .. tostring(label or kind) .. " is unavailable"), 0)
        end
        return staged:_Track(component)
    end

    local function ReleaseStaged()
        local index = #staged.shellObjects
        while index >= 1 do
            local object = staged.shellObjects[index]
            if type(object) == "table" and type(object.Release) == "function" then
                pcall(object.Release, object)
            end
            index = index - 1
        end
        staged.shellObjects = {}
    end

    local built, buildReason = pcall(function()
    staged.window = Create("frame", staged.parent or UIParent, {
        name = "RurutiaSuiteMainWindow",
        width = GetLayoutValue(staged, "width"),
        height = GetLayoutValue(staged, "height"),
        hidden = true,
        backgroundToken = "color.window.background",
        borderToken = "color.border.strong",
        frameStrata = "HIGH",
        frameLevel = 100,
        topLevel = true,
        clipChildren = true,
        movable = true,
        clampedToScreen = false,
        noBorder = true,
    }, "root")
    staged.window:SetOnHide(OnWindowHidden)

    staged.sidebarPanel = Create("group", staged.window, {
        backgroundToken = "color.sidebar.background",
        noBorder = true,
    }, "sidebar")
    staged.sidebarDivider = Create("group", staged.sidebarPanel, {
        backgroundToken = "color.border.strong",
        noBorder = true,
    }, "sidebar divider")
    staged.brandIcon = staged.sidebarPanel.frame:CreateTexture(nil, "ARTWORK")
    if not staged.brandIcon then error("main window brand icon is unavailable", 0) end
    staged.brandIcon:SetTexture("Interface\\AddOns\\RurutiaSuite\\Media\\icon-transparent.png")
    staged.titleLabel = Create("label", staged.sidebarPanel, {
        text = staged.title,
        fontKey = "brand",
        fontFlags = "OUTLINE",
        textToken = "color.text.normal",
        labelFill = true,
        justifyH = "LEFT",
    }, "title")
    staged.brandSubtitle = Create("label", staged.sidebarPanel, {
        text = "RurutiaSuite",
        fontKey = "heading",
        fontFlags = "OUTLINE",
        textToken = "color.accent",
        labelFill = true,
        justifyH = "LEFT",
    }, "brand subtitle")
    staged.searchBox = Create("editbox", staged.sidebarPanel, {
        clearable = true,
        value = "",
        fontKey = "body",
        textInsets = { 12, 12, 0, 0 },
        backgroundToken = "color.input.background",
        borderToken = "color.input.border",
        onChange = OnSearchChanged,
        onFocusGained = OnSearchFocusGained,
        onFocusLost = OnSearchFocusLost,
    }, "search box")
    staged.searchHint = Create("label", staged.sidebarPanel, {
        text = "搜索设置…",
        fontKey = "description",
        textToken = "color.text.faint",
        labelFill = true,
        justifyH = "LEFT",
    }, "search hint")
    staged.headerDivider = Create("group", staged.window, {
        backgroundToken = "color.border.strong",
        noBorder = true,
    }, "header divider")
    staged.footerDivider = Create("group", staged.window, {
        backgroundToken = "color.border.strong",
        noBorder = true,
    }, "footer divider")
    staged.versionLabel = Create("label", staged.window, {
        text = ResolveDisplayVersion(),
        fontKey = "description",
        fontFlags = "OUTLINE",
        textToken = "color.accent",
        labelFill = true,
        justifyH = "RIGHT",
    }, "version")
    staged.navigationScroll = Create("scroll", staged.sidebarPanel, {
        contentWidth = GetLayoutValue(staged, "navigationWidth")
            - GetLayoutValue(staged, "navigationInnerPadding") * 2
            - GetLayoutValue(staged, "navigationScrollbarReserve"),
        contentHeight = 1,
        backgroundToken = "color.sidebar.background",
        noBorder = true,
        clipChildren = true,
    }, "navigation scroll")
    -- Compatibility name for callers that only need the navigation viewport.
    staged.navigationContainer = staged.navigationScroll
    staged.navigationContent = staged.navigationScroll:GetContent()
    if not staged.navigationContent then error("main window navigation content is unavailable", 0) end

    staged.pageTitleLabel = Create("label", staged.window, {
        text = "",
        fontKey = "title",
        labelFill = true,
        justifyH = "LEFT",
        hidden = true,
    }, "page title")
    staged.pageDescriptionLabel = Create("label", staged.window, {
        text = "",
        fontKey = "pageDescription",
        labelFill = true,
        justifyH = "LEFT",
        justifyV = "MIDDLE",
        wordWrap = false,
        hidden = true,
    }, "page description")
    staged.contentViewport = Create("group", staged.window, {
        backgroundToken = "color.workspace.background",
        noBorder = true,
        clipChildren = true,
    }, "content viewport")
    -- PageContext roots are mounted here. SettingsBuilder may own one page ScrollFrame;
    -- MainWindow deliberately does not add a second business-content scroll layer.
    staged.contentContainer = staged.contentViewport

    staged.footerContainer = Create("group", staged.window, {
        backgroundToken = "color.workspace.background",
        noBorder = true,
    }, "footer")
    staged.closeButton = Create("button", staged.footerContainer, {
        text = "关闭",
        fontKey = "body",
        onAction = OnCloseClicked,
    }, "close button")
    staged.moveButton = Create("button", staged.sidebarPanel, {
        text = IsRsMoveUnlocked() and "锁定移动" or "解锁移动",
        fontKey = "body",
        onAction = OnMoveClicked,
    }, "move button")
    staged.guideButton = Create("button", staged.window, {
        text = "小手册", fontKey = "body",
        onAction = function() if type(RS.OpenGuide) == "function" then RS:OpenGuide() end end,
    }, "guide button")
    staged.changelogButton = Create("button", staged.sidebarPanel, {
        text = "更新日志",
        fontKey = "body",
        onAction = OnChangelogClicked,
    }, "changelog button")

    staged.pageActionButtons = {}
    for _, spec in ipairs(PAGE_ACTIONS) do
        local button = Create("button", staged.window, {
            text = spec.text, enabled = false, fontKey = "body", onAction = OnPageActionClicked,
            tooltip = "本页无此功能",
        }, "page action " .. spec.key)
        staged.pageActionButtons[spec.key] = button
    end
    staged:_ApplyShellLayout()
    staged:_ApplyBackgroundOpacity()
    end)
    if not built then
        ReleaseStaged()
        return nil, tostring(buildReason)
    end

    local addedSpecialFrame = false
    local themeSubscribed = false
    local providerSubscribed = false
    local sideEffectsOK, sideEffectReason = pcall(function()
        if not self.system.theme:Subscribe(self, OnThemeChanged) then
            error("main window theme subscription failed", 0)
        end
        themeSubscribed = true
        if not self.system.providers:Subscribe(self, OnProviderChanged) then
            error("main window provider subscription failed", 0)
        end
        providerSubscribed = true
    if type(_G.UISpecialFrames) == "table" then
        local found = false
        local index = 1
        while index <= #_G.UISpecialFrames do
            if _G.UISpecialFrames[index] == "RurutiaSuiteMainWindow" then
                found = true
                break
            end
            index = index + 1
        end
        if not found then
            _G.UISpecialFrames[#_G.UISpecialFrames + 1] = "RurutiaSuiteMainWindow"
                addedSpecialFrame = true
        end
    end
    end)
    if not sideEffectsOK then
        if providerSubscribed then pcall(self.system.providers.Unsubscribe, self.system.providers, self) end
        if themeSubscribed then pcall(self.system.theme.Unsubscribe, self.system.theme, self) end
        if addedSpecialFrame and type(_G.UISpecialFrames) == "table" then
            local index = #_G.UISpecialFrames
            while index >= 1 do
                if _G.UISpecialFrames[index] == "RurutiaSuiteMainWindow" then
                    table.remove(_G.UISpecialFrames, index)
                    break
                end
                index = index - 1
            end
        end
        ReleaseStaged()
        return nil, tostring(sideEffectReason)
    end

    local fields = {
        "window", "sidebarPanel", "sidebarDivider", "brandIcon", "titleLabel",
        "brandSubtitle", "searchBox", "searchHint", "headerDivider", "footerDivider",
        "versionLabel", "navigationScroll", "navigationContainer", "navigationContent",
        "pageTitleLabel", "pageDescriptionLabel", "contentViewport", "contentContainer",
        "footerContainer", "closeButton", "moveButton", "changelogButton", "guideButton", "pageActionButtons", "shellObjects",
        "resolvedWidth", "resolvedHeight", "hasPosition", "shellFooterHeight",
    }
    local index = 1
    while index <= #fields do
        local key = fields[index]
        self[key] = staged[key]
        index = index + 1
    end
    index = 1
    while index <= #self.shellObjects do
        self.shellObjects[index].mainWindowOwner = self
        index = index + 1
    end
    self.builds = self.builds + 1
    return self.window
end

function MainWindow:SetSearchQuery(value)
    local query = string.lower(string.match(tostring(value or ""), "^%s*(.-)%s*$") or "")
    if self.searchQuery == query then return true end
    self.searchQuery = query
    self:RefreshNavigation()
    return true
end

function MainWindow:_UpdateSearchHint()
    if not self.searchHint then return false end
    self.searchHint:SetText(next(UI.searchProviders or {}) and "搜索设置或手册…" or "搜索设置…")
    self.searchHint:SetVisible(not self.searchFocused and self.searchQuery == "")
    return true
end

function MainWindow:_EntryMatchesSearch(entry)
    local query = self.searchQuery
    if query == "" then return true end
    local corpus = table.concat({
        entry.id or "", entry.title or "", entry.description or "",
        entry.groupTitle or "", entry.group or "",
        SEARCH_KEYWORDS[entry.id] or "", entry.searchText or "",
    }, " ")
    return string.find(string.lower(corpus), query, 1, true) ~= nil
end

function MainWindow:_SetPageHeader(metadata)
    self.currentTitle = metadata and metadata.title or ""
    self.currentDescription = metadata and metadata.description or ""
    self.pageTitleLabel:SetText(self.currentTitle)
    self.pageDescriptionLabel:SetText(self.currentDescription)
    self.pageTitleLabel:SetVisible(true)
    self.pageDescriptionLabel:SetVisible(true)
    self:_ApplyPageHeaderLayout()
end

local function SetTextureColor(texture, color, alpha)
    if not texture then return end
    color = color or { 1, 1, 1, 1 }
    if texture.SetVertexColor then
        texture:SetVertexColor(color[1] or 1, color[2] or 1, color[3] or 1, 1)
    end
    if texture.SetAlpha then texture:SetAlpha(alpha or color[4] or 1) end
end

function MainWindow:_ReadNavigationSwitchState(id)
    local metadata = self.navigationMetadata[id]
    local descriptor = metadata and metadata.navigationSwitch
    local state = self.navigationSwitchStates[id]
    if not state then
        state = {}
        self.navigationSwitchStates[id] = state
    end
    state.visible = descriptor ~= nil
    state.available = true
    state.enabled = false
    state.mutable = true
    state.active = nil
    state.pending = false
    state.reason = nil
    state.error = nil
    if not descriptor then return state end

    local ok, result, reason = pcall(descriptor.GetState, state)
    if ok and type(result) == "table" and result ~= state then
        state.available = result.available
        state.enabled = result.enabled
        state.mutable = result.mutable
        state.active = result.active
        state.pending = result.pending
        state.reason = result.reason
    elseif not ok or result == false then
        state.available = false
        state.enabled = false
        state.mutable = false
        state.active = false
        state.pending = false
        state.reason = not ok and tostring(result) or tostring(reason or "模块状态不可用")
        state.error = state.reason
    end
    state.available = state.available ~= false
    state.enabled = state.enabled == true
    state.mutable = state.mutable ~= false
    if state.active == nil then state.active = state.enabled end
    state.active = state.active == true
    state.pending = state.pending == true
    return state
end

function MainWindow:_GetNavigationSwitchTooltip(id)
    local state = self:_ReadNavigationSwitchState(id)
    self:_ApplyNavigationSwitchVisual(id)
    if state.reason and state.reason ~= "" then return state.reason end
    if state.pending then return "状态正在等待应用。" end
    if state.enabled and not state.active then return "已启用，但当前条件下未运行。" end
    return state.enabled and "点击关闭模块。" or "点击启用模块。"
end

function MainWindow:_ApplyNavigationSwitchVisual(id)
    local button = self.navigationSwitchButtons[id]
    local state = self.navigationSwitchStates[id]
    if not button or not state or not state.visible then return false end
    local theme = self.system.theme
    local canToggle = state.available and state.mutable and not state.pending
    local hovered = button.hovered and canToggle
    local ringColor
    local ringAlpha = 1
    local showPending = false

    if not state.available or not state.mutable then
        ringColor = theme:Get("color.text.muted")
        ringAlpha = 0.25
    elseif state.pending then
        ringColor = theme:Get("color.moduleSwitch.pending")
        showPending = true
    elseif hovered then
        ringColor = theme:Get("color.text.normal")
        ringAlpha = 0.98
    elseif state.enabled then
        ringColor = theme:Get("color.accent")
    else
        ringColor = theme:Get("color.text.muted")
        ringAlpha = 0.55
    end

    SetTextureColor(button.powerRing, ringColor, ringAlpha)
    SetTextureColor(button.powerPending, theme:Get("color.moduleSwitch.pending"), 1)
    if showPending then button.powerPending:Show() else button.powerPending:Hide() end
    return true
end

function MainWindow:RefreshNavigationSwitch(id)
    local button = self.navigationSwitchButtons[id]
    local metadata = self.navigationMetadata[id]
    if not button or not metadata or not metadata.navigationSwitch then
        if button then button:SetVisible(false) end
        return nil, "page has no navigation switch"
    end
    local state = self:_ReadNavigationSwitchState(id)
    button:SetVisible(true)
    button:SetEnabled(state.available and state.mutable and not state.pending, true)
    self:_ApplyNavigationSwitchVisual(id)
    return state
end

function MainWindow:RefreshNavigationSwitches()
    for id, button in pairs(self.navigationSwitchButtons) do
        if button:IsVisible() and self.visiblePageSet[id] then
            self:RefreshNavigationSwitch(id)
        end
    end
    return true
end

function MainWindow:ToggleNavigationSwitch(id)
    local metadata = self.navigationMetadata[id]
    local descriptor = metadata and metadata.navigationSwitch
    if not descriptor then return false, "page has no navigation switch" end
    local state = self:RefreshNavigationSwitch(id)
    if not state or not state.available or not state.mutable or state.pending then
        return false, state and state.reason or "module switch is unavailable"
    end
    local desired = not state.enabled
    local ok, result, reason = pcall(descriptor.SetEnabled, desired)
    local refreshed = self:RefreshNavigationSwitch(id)
    local changed = refreshed and (refreshed.enabled == desired or refreshed.pending)
    if self.currentPage == id then
        self.system.pages:Refresh(id, "navigation-switch")
    end
    if not ok then return false, tostring(result) end
    if result == false then return false, reason or "module rejected state change" end
    if reason == "confirmation-required" then return true end
    if not changed then return false, reason or result or "module state did not change" end
    return true, refreshed.pending and "queued" or nil
end

function MainWindow:ToggleNavigationGroup(group)
    if group == "pinned" or not self.visibleGroupSet[group] or self.searchQuery ~= "" then return false end
    self.collapsedGroups[group] = not self.collapsedGroups[group] or nil
    self:RefreshNavigation(true)
    return true
end

function MainWindow:RefreshNavigation(useCachedEntries)
    local window, createReason = self:EnsureCreated()
    if not window then return nil, createReason end
    self.guideButton:SetEnabled(type(RS.OpenGuide) == "function")
    local entries = useCachedEntries and self.navigationEntries
        or self.system.pages:GetNavigationEntries(self.navigationEntries)
    for id in pairs(self.availablePageSet) do
        self.availablePageSet[id] = nil
        self.navigationMetadata[id] = nil
    end
    for _, entry in ipairs(entries) do
        self.availablePageSet[entry.id] = true
        self.navigationMetadata[entry.id] = entry
    end
    local displayEntries = self.filteredNavigationEntries
    local displayCount = 0
    local entryIndex = 1
    while entryIndex <= #entries do
        if self:_EntryMatchesSearch(entries[entryIndex]) then
            displayCount = displayCount + 1
            displayEntries[displayCount] = entries[entryIndex]
        end
        entryIndex = entryIndex + 1
    end
    -- Explicit external results follow settings and never build their UI here.
    if self.searchQuery ~= "" then
        for _, provider in pairs(UI.searchProviders or {}) do
            local ok, results = pcall(provider, self.searchQuery)
            if ok and type(results) == "table" then
                for i = 1, math.min(#results, 12) do
                    local entry = results[i]
                    if type(entry) == "table" and type(entry.onAction) == "function" then
                        displayCount = displayCount + 1
                        displayEntries[displayCount] = entry
                    end
                end
            end
        end
    end
    ClearArrayAfter(displayEntries, displayCount)
    self:_UpdateSearchHint()

    for id in pairs(self.visiblePageSet) do
        self.visiblePageSet[id] = nil
    end
    for group in pairs(self.visibleGroupSet) do
        self.visibleGroupSet[group] = nil
    end

    local pageCount = 0
    local groupCount = 0
    local layoutCount = 0
    local currentGroup
    local index = 1
    while index <= #displayEntries do
        local entry = displayEntries[index]

        if entry.group ~= currentGroup then
            currentGroup = entry.group
            self.visibleGroupSet[currentGroup] = true
            groupCount = groupCount + 1
            self.navigationGroupOrder[groupCount] = currentGroup
            local groupLabel = self.navigationGroupLabels[currentGroup]
            if entry.groupTitle and entry.groupTitle ~= "" then
                if not groupLabel then
                    groupLabel = self:_Track(self.system.components:Create("label", self.navigationContent, {
                        text = entry.groupTitle,
                        fontKey = "heading",
                        labelFill = true,
                        justifyH = "LEFT",
                        textToken = "color.accent",
                        textInsets = { 8, 0, 0, 0 },
                    }))
                    groupLabel.mainWindowNavigationKind = "group"
                    groupLabel.mainWindowGroupId = currentGroup
                    groupLabel.frame.mainWindowNavigationLabel = groupLabel
                    groupLabel.frame:EnableMouse(true)
                    groupLabel.frame:SetScript("OnMouseUp", OnNavigationGroupClicked)
                    self.navigationGroupLabels[currentGroup] = groupLabel
                end
                local expanded = self.searchQuery ~= "" or not self.collapsedGroups[currentGroup]
                groupLabel:SetText(entry.groupTitle)
                groupLabel.options.tooltip = self.searchQuery ~= "" and "搜索期间展开匹配分类" or (expanded and "收起分类" or "展开分类")
                groupLabel:SetVisible(true)
                layoutCount = layoutCount + 1
                self.navigationLayoutOrder[layoutCount] = groupLabel
            elseif groupLabel then
                groupLabel:SetVisible(false)
            end
        end

        local showRow = entry.group == "pinned" or self.searchQuery ~= "" or not self.collapsedGroups[entry.group]
        if showRow then
            self.visiblePageSet[entry.id] = true
            local item = self.navigationItems[entry.id]
            local wasVisible = item and item:IsVisible()
            local button = self.navigationButtons[entry.id]
            local switchButton = self.navigationSwitchButtons[entry.id]
            if not item then
                local navigationRightInset = entry.navigationSwitch
                    and (GetLayoutValue(self, "navigationSwitchHitSize")
                        + GetLayoutValue(self, "navigationSwitchGap") + 4)
                    or 8
                item = self:_Track(self.system.components:Create("group", self.navigationContent, {
                    noBackdrop = true,
                    noBorder = true,
                }))
                button = self:_Track(self.system.components:Create("button", item, {
                    text = entry.title,
                    fontKey = "navigation",
                    onAction = OnNavigationClicked,
                    variant = "navigation",
                    navigationRightInset = navigationRightInset,
                    noBorder = true,
                }))
                button.mainWindowNavigationKind = "page"
                button.mainWindowPageId = entry.id
                item.mainWindowNavigationKind = "page"
                item.mainWindowPageId = entry.id
                item.mainWindowSelectButton = button
                self.navigationItems[entry.id] = item
                self.navigationButtons[entry.id] = button
            else
                button.options.navigationRightInset = entry.navigationSwitch
                    and (GetLayoutValue(self, "navigationSwitchHitSize")
                        + GetLayoutValue(self, "navigationSwitchGap") + 4)
                    or 8
                button:SetText(entry.title)
            end

            button.mainWindowSearchAction = entry.onAction
            button:SetSelected(self.currentPage == entry.id)
            item.mainWindowHasSwitch = entry.navigationSwitch ~= nil
            if item.mainWindowHasSwitch and not switchButton then
                switchButton = self:_Track(self.system.components:Create("button", item, {
                    text = "",
                    onAction = OnNavigationSwitchClicked,
                    onEnter = OnNavigationSwitchEntered,
                    onLeave = OnNavigationSwitchLeft,
                    tooltipTitle = entry.title,
                    tooltip = function(component)
                        local owner = component.mainWindowOwner
                        return owner and owner:_GetNavigationSwitchTooltip(component.mainWindowPageId)
                    end,
                    noBackdrop = true,
                    noBorder = true,
                    hoverAccent = false,
                    hidden = true,
                }))
                switchButton.mainWindowPageId = entry.id
                local iconSize = GetLayoutValue(self, "navigationSwitchIconSize")
                switchButton.powerRing = switchButton.frame:CreateTexture(nil, "ARTWORK")
                switchButton.powerRing:SetTexture(
                    "Interface\\AddOns\\RurutiaSuite\\Media\\Textures\\module-power-ring-white.png"
                )
                switchButton.powerRing:SetPoint("CENTER", switchButton.frame, "CENTER", 0, 0)
                switchButton.powerRing:SetSize(iconSize, iconSize)
                switchButton.powerPending = switchButton.frame:CreateTexture(nil, "OVERLAY")
                switchButton.powerPending:SetTexture(
                    "Interface\\AddOns\\RurutiaSuite\\Media\\Textures\\module-power-pending-white.png"
                )
                switchButton.powerPending:SetPoint("CENTER", switchButton.frame, "CENTER", 0, 0)
                switchButton.powerPending:SetSize(iconSize, iconSize)
                item.mainWindowSwitchButton = switchButton
                self.navigationSwitchButtons[entry.id] = switchButton
            end
            if switchButton then
                switchButton.options.tooltipTitle = entry.title
                switchButton:SetVisible(item.mainWindowHasSwitch)
            end
            item:SetVisible(true)
            button:SetVisible(true)
            pageCount = pageCount + 1
            self.navigationOrder[pageCount] = button
            layoutCount = layoutCount + 1
            self.navigationLayoutOrder[layoutCount] = item
            if item.mainWindowHasSwitch and (not useCachedEntries or not wasVisible) then
                self:RefreshNavigationSwitch(entry.id)
            end
        end
        index = index + 1
    end

    for id, button in pairs(self.navigationButtons) do
        if not self.visiblePageSet[id] then
            button.mainWindowSearchAction = nil
            button:SetVisible(false)
            self.navigationItems[id]:SetVisible(false)
            local switchButton = self.navigationSwitchButtons[id]
            if switchButton then switchButton:SetVisible(false) end
        end
    end
    for group, label in pairs(self.navigationGroupLabels) do
        if not self.visibleGroupSet[group] then
            label:SetVisible(false)
        end
    end

    ClearArrayAfter(self.navigationOrder, pageCount)
    ClearArrayAfter(self.navigationGroupOrder, groupCount)
    ClearArrayAfter(self.navigationLayoutOrder, layoutCount)

    if useCachedEntries then self:_ApplyNavigationLayout() else self:_ApplyShellLayout() end
    return displayEntries
end

function MainWindow:_RefreshVisuals()
    local index = 1
    while index <= #self.shellObjects do
        self.shellObjects[index]:RefreshTheme()
        index = index + 1
    end
    for id in pairs(self.navigationSwitchStates) do
        self:_ApplyNavigationSwitchVisual(id)
    end
    self:_ApplyBackgroundOpacity()
    self.visualDirty = false
    self.visualRefreshes = self.visualRefreshes + 1
end

function MainWindow:_ApplyBackgroundOpacity()
    if not self.window then return false end
    local alpha = math.max(0.20, math.min(1, tonumber(self.backgroundOpacity) or 0.50))
    local targets = {
        { self.window, "color.window.background" },
        { self.sidebarPanel, "color.sidebar.background" },
        { self.contentViewport, "color.workspace.background" },
        { self.footerContainer, "color.workspace.background" },
        { self.navigationScroll, "color.sidebar.background" },
    }
    local index = 1
    while index <= #targets do
        local component, token = targets[index][1], targets[index][2]
        local frame = component and component.frame
        local color = self.system.theme:Get(token)
        if frame and frame.SetBackdropColor and color then
            local targetAlpha = component == self.window and alpha or (color[4] or 0)
            frame:SetBackdropColor(color[1] or 0, color[2] or 0, color[3] or 0, targetAlpha)
        end
        index = index + 1
    end
    return true
end


function MainWindow:SetContainerOpacity(percent)
    percent = math.max(0, math.min(100, tonumber(percent) or 0))
    self.containerOpacity = percent / 100
    local alpha = self.containerOpacity
    local theme = self.system.theme
    local keys = {
        "color.sidebar.background",
        "color.workspace.background",
        "color.section.background",
        "color.row.background",
        "color.changelog.contentBackground",
    }
    local changes = {}
    local index = 1
    while index <= #keys do
        local key = keys[index]
        local color = theme:Get(key)
        changes[key] = { color[1] or 0, color[2] or 0, color[3] or 0, alpha }
        index = index + 1
    end
    theme:UpdateTokens(changes)
    return self:_ApplyBackgroundOpacity()
end

function MainWindow:SetBackgroundOpacity(percent)
    percent = math.max(20, math.min(100, tonumber(percent) or 50))
    self.backgroundOpacity = percent / 100
    local theme = self.system.theme
    local color = theme:Get("color.changelog.background")
    theme:UpdateTokens({
        ["color.changelog.background"] = {
            color[1] or 0, color[2] or 0, color[3] or 0, self.backgroundOpacity,
        },
    })
    return self:_ApplyBackgroundOpacity()
end

function MainWindow:_HandleVisualChange()
    if not self.window then
        return
    end
    if self:IsOpen() then
        self:_RefreshVisuals()
    else
        self.visualDirty = true
    end
end

function MainWindow:_HandleHidden()
    self.system.pages:CloseActive()
    self:BindPageActions(nil)
    if self.window then
        self.window.frame:UnregisterEvent("PLAYER_REGEN_DISABLED")
        self.window.frame:UnregisterEvent("PLAYER_REGEN_ENABLED")
    end
end

function MainWindow:GetContentHost()
    local window, reason = self:EnsureCreated()
    if not window then return nil, reason end
    return self.contentViewport
end

function MainWindow:SelectPage(id, data, navigationStateIsFresh, preserveNavigation)
    local canonicalId = self.system.pages:ResolveId(id)
    if not canonicalId then return nil, "page is not registered for navigation" end
    if not navigationStateIsFresh then self:RefreshNavigation() end
    if not self.availablePageSet[canonicalId] then return nil, "page is not available" end
    if not preserveNavigation then
        local metadata = self.navigationMetadata[canonicalId]
        local refresh = self.collapsedGroups[metadata.group] == true
        self.collapsedGroups[metadata.group] = nil
        if not self:_EntryMatchesSearch(metadata) then
            self.searchQuery = ""
            self.searchBox:SetValue("", true)
            refresh = true
        end
        if refresh then self:RefreshNavigation(true) end
    end
    local button = self.navigationButtons[canonicalId]

    local contentHost, hostReason = self:GetContentHost()
    if not contentHost then return nil, hostReason end
    -- Only defer the selected page inside this synchronous open transaction.
    -- Prepare final geometry before Registry commits the page switch.
    local previousBatch = self.system.layoutBatchPageId
    local previousHeader = { title = self.currentTitle, description = self.currentDescription }
    local headerChanged = false
    self.system.layoutBatchPageId = canonicalId
    local opened, context, reason = pcall(self.system.pages.Open, self.system.pages,
        canonicalId, contentHost, data, function(candidate)
            local root = candidate:GetRoot().frame
            root:ClearAllPoints()
            root:SetPoint("TOPLEFT", self.contentViewport.frame, "TOPLEFT", 0, 0)
            root:SetPoint("BOTTOMRIGHT", self.contentViewport.frame, "BOTTOMRIGHT", 0, 0)
            headerChanged = true
            self:_SetPageHeader(self.navigationMetadata[canonicalId])
            self.system.layoutBatchPageId = nil
            local settingsPage = self.system:GetSettingsPage(candidate)
            if settingsPage then settingsPage:RefreshLayout() end
        end)
    self.system.layoutBatchPageId = previousBatch
    if (not opened or not context) and headerChanged then
        self:_SetPageHeader(previousHeader)
    end
    if not opened then return nil, tostring(context) end
    if not context then
        return nil, reason
    end

    for _, navigationButton in pairs(self.navigationButtons) do
        navigationButton:SetEnabled(true)
        navigationButton:SetSelected(navigationButton == button)
    end
    self.currentPage = canonicalId
    if not preserveNavigation then self:_RevealNavigationRow(canonicalId) end
    self:BindPageActions(self.system:GetSettingsPage(context))
    if not navigationStateIsFresh then
        self:RefreshNavigationSwitch(canonicalId)
    end

    return context
end

function MainWindow:Open(pageId, data)
    local window, createReason = self:EnsureCreated()
    if not window then return nil, createReason end
    local entries, navigationReason = self:RefreshNavigation()
    if not entries then return nil, navigationReason end
    if self.visualDirty then
        self:_RefreshVisuals()
    end

    self.window:SetVisible(true)
    self.window.frame:RegisterEvent("PLAYER_REGEN_DISABLED")
    self.window.frame:RegisterEvent("PLAYER_REGEN_ENABLED")
    self.window.frame:SetScript("OnEvent", function() self:RefreshPageActions() end)
    local selectedId = self.system.pages:ResolveId(pageId)
    if not selectedId or not self.availablePageSet[selectedId] then
        selectedId = self.currentPage
    end
    if not selectedId or not self.availablePageSet[selectedId] then
        selectedId = entries[1] and entries[1].id or nil
    end
    if selectedId then
        self:SelectPage(selectedId, data, true, pageId == nil)
    end
    self.opens = self.opens + 1
    return self.window, selectedId
end

function MainWindow:Close()
    if not self.window or not self:IsOpen() then
        return false
    end
    self.system.pages:CloseActive()
    self:BindPageActions(nil)
    self.window:SetVisible(false)
    self.closes = self.closes + 1
    return true
end

function MainWindow:Toggle(pageId, data)
    if self:IsOpen() then
        self:Close()
        return false
    end
    self:Open(pageId, data)
    return true
end

function MainWindow:IsOpen()
    return self.window and self.window:IsVisible() or false
end

function MainWindow:GetFrame()
    return self.window and self.window.frame or nil
end

function MainWindow:GetNavigationIds(reusableResult)
    local result = reusableResult or {}
    local index = 1
    while index <= #self.navigationEntries do
        result[index] = self.navigationEntries[index].id
        index = index + 1
    end
    ClearArrayAfter(result, #self.navigationEntries)
    return result
end

function MainWindow:GetDiagnostics()
    return {
        built = self.window ~= nil,
        builds = self.builds,
        open = self:IsOpen(),
        opens = self.opens,
        closes = self.closes,
        navigationButtons = #self.navigationOrder,
        navigationSwitches = (function()
            local count = 0
            for id, button in pairs(self.navigationSwitchButtons) do
                if self.visiblePageSet[id] and button:IsVisible() then count = count + 1 end
            end
            return count
        end)(),
        navigationGroups = #self.navigationGroupOrder,
        navigationContentHeight = self.navigationContentHeight,
        activePage = self.currentPage,
        pageTitle = self.pageTitleLabel and self.pageTitleLabel:GetText() or nil,
        visualDirty = self.visualDirty,
        visualRefreshes = self.visualRefreshes,
        width = self.resolvedWidth,
        height = self.resolvedHeight,
    }
end

function UI:RegisterSearchProvider(id, provider)
    if type(id) ~= "string" or type(provider) ~= "function" then return false end
    self.searchProviders = self.searchProviders or {}
    self.searchProviders[id] = provider
    return true
end

function UI:UnregisterSearchProvider(id)
    if self.searchProviders then self.searchProviders[id] = nil end
    local system = self.GetSystem and self:GetSystem()
    local window = system and system.mainWindow
    if window and window:IsOpen() then window:RefreshNavigation() end
end

UI.MainWindow = MainWindow

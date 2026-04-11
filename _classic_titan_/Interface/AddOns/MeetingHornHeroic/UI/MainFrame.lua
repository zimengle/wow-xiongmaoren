-- MainFrame.lua
-- 主界面框架

---@type MeetingHornHeroicNS
local ns = select(2, ...)
local L = ns.L

---@class HeroicMainFrame: Frame
local HeroicMainFrame = {}

function HeroicMainFrame:New()
    -- 创建主框架
    local frame = CreateFrame("Frame", "MeetingHornHeroicMainFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate")
    frame:SetSize(850, 650)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(10)
    frame:Hide()
    
    -- 设置背景
    frame:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    frame:SetBackdropColor(0.1, 0.1, 0.2, 0.95)
    frame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    
    -- 标题栏
    local titleBar = CreateFrame("Frame", nil, frame)
    titleBar:SetHeight(32)
    titleBar:SetPoint("TOPLEFT", 4, -4)
    titleBar:SetPoint("TOPRIGHT", -4, -4)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function() frame:StartMoving() end)
    titleBar:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
    
    -- 标题背景
    local titleBg = titleBar:CreateTexture(nil, "BACKGROUND")
    titleBg:SetAllPoints()
    titleBg:SetColorTexture(0.2, 0.2, 0.3, 0.8)
    
    -- 标题文字
    local titleText = titleBar:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    titleText:SetPoint("LEFT", 10, 0)
    titleText:SetText("集结号团本招募 " .. (ns.VERSION or ""))
    titleText:SetTextColor(1, 0.8, 0, 1)
    
    -- 关闭按钮
    local closeButton = CreateFrame("Button", nil, titleBar, "UIPanelCloseButton")
    closeButton:SetPoint("RIGHT", -5, 0)
    closeButton:SetScript("OnClick", function() frame:Hide() end)
    
    -- 选项卡按钮
    local tabFrame = CreateFrame("Frame", nil, frame)
    tabFrame:SetHeight(30)
    tabFrame:SetPoint("TOPLEFT", titleBar, "BOTTOMLEFT", 0, -2)
    tabFrame:SetPoint("TOPRIGHT", titleBar, "BOTTOMRIGHT", 0, -2)
    
    -- 创建选项卡
    local tabs = {}
    local tabButtons = {}
    
    local function CreateTab(index, text, frameClass)
        -- 给按钮一个名称，这对 PanelTemplates 函数很重要
        local buttonName = "MeetingHornHeroicMainFrameTab" .. index
        local tabButton = CreateFrame("Button", buttonName, frame, "CharacterFrameTabButtonTemplate")

        -- 设置选项卡位置，相对于 tabFrame
        if index == 1 then
            tabButton:SetPoint("LEFT", tabFrame, "LEFT", 10, 0)
        else
            tabButton:SetPoint("LEFT", tabButtons[index-1], "RIGHT", 5, 0)
        end

        tabButton:SetText(text)
        tabButton:SetID(index)
        
        tabButton:SetScript("OnClick", function(button)
            frame:SwitchTab(button:GetID())
        end)
        
        tabButtons[index] = tabButton
        return tabButton
    end
    
    -- 创建选项卡按钮
    CreateTab(1, L['Create Heroic Raid'], "CreatorFrame")
    CreateTab(2, "团本招募", "BrowserFrame")
    CreateTab(3, "个人求组", "PlayerSquareFrame")
    CreateTab(4, "我的活动", "MyActivityFrame")
    CreateTab(5, "设置", "SettingsFrame")

    -- 内容区域
    local contentFrame = CreateFrame("Frame", nil, frame)
    contentFrame:SetPoint("TOPLEFT", tabFrame, "BOTTOMLEFT", 0, -5)
    contentFrame:SetPoint("BOTTOMRIGHT", -10, 10)
    
    -- 存储框架引用
    frame.titleBar = titleBar
    frame.tabFrame = tabFrame
    frame.contentFrame = contentFrame
    frame.tabs = tabs
    frame.tabButtons = tabButtons
    frame.currentTab = 1
    
    -- 为 PanelTemplates 系统设置必要的属性
    frame.Tabs = tabButtons  -- PanelTemplates 系统需要这个属性
    PanelTemplates_SetNumTabs(frame, #tabButtons)

    -- 绑定方法
    for k, v in pairs(HeroicMainFrame) do
        if type(v) == "function" then
            frame[k] = v
        end
    end
    
    -- 创建子框架
    frame:CreateSubFrames()
    
    -- 初始默认显示团本招募（Tab 2）
    frame:SwitchTab(2)
    
    return frame
end

function HeroicMainFrame:CreateSubFrames()
    -- 创建选项卡内容框架
    self.creatorFrame = ns.UI.CreatorFrame:New(self.contentFrame)
    self.browserFrame = ns.UI.BrowserFrame:New(self.contentFrame)
    self.playerSquareFrame = ns.UI.PlayerSquareFrame:New(self.contentFrame)
    self.myActivityFrame = ns.UI.MyActivityFrame:New(self.contentFrame)
    -- 第5个 Tab：设置页面（任务 5.2）
    self.settingsFrame = ns.UI.SettingsFrame and ns.UI.SettingsFrame:New(self.contentFrame) or nil

    -- 将框架添加到 tabs 数组中
    self.tabs = {
        self.creatorFrame,
        self.browserFrame,
        self.playerSquareFrame,
        self.myActivityFrame,
        self.settingsFrame,
    }
end

-- Tab index → 页面名称映射（用于埋点日志）
local TAB_SHEET_NAMES = {
    [1] = "创建团本",
    [2] = "团本招募",
    [3] = "个人求组",
    [4] = "我的活动",
    [5] = "设置",
}

function HeroicMainFrame:SwitchTab(tabIndex)
    if not self.tabs or not self.tabs[tabIndex] then
        return
    end

    -- 使用暴雪标准的选项卡系统
    PanelTemplates_SetTab(self, tabIndex)
    self.currentTab = tabIndex

    -- 隐藏所有选项卡内容
    for i, tab in ipairs(self.tabs) do
        if tab then
            tab:Hide()
        end
    end

    -- 显示选中的选项卡
    if self.tabs[tabIndex] then
        self.tabs[tabIndex]:Show()
        -- 触发选项卡切换事件
        if self.tabs[tabIndex].OnShow then
            self.tabs[tabIndex]:OnShow()
        end
    end

    -- 页面曝光埋点
    local sheetName = TAB_SHEET_NAMES[tabIndex]
    if sheetName then
        ns.MeetingHornAPI:InsertLog({time(), "raid_sheet_exposure", {page_sheet = sheetName}})
    end
end

function HeroicMainFrame:Show()
    self:SetShown(true)
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN)
    -- 加入 MeetingHorn 频道，确保能收到活动消息
    ns.MeetingHornAPI:JoinChannel()
    -- 更新MeetingHorn集成按钮状态
    if ns.MeetingHornIntegration then
        ns.MeetingHornIntegration:UpdateButtonState()
    end
end

function HeroicMainFrame:Hide()
    self:SetShown(false)
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE)
    -- 延迟退出 MeetingHorn 频道（MeetingHorn 主界面在显示或有活跃活动时不退出）
    ns.MeetingHornAPI:ScheduleLeaveChannel()
    -- 更新MeetingHorn集成按钮状态
    if ns.MeetingHornIntegration then
        ns.MeetingHornIntegration:UpdateButtonState()
    end
end

function HeroicMainFrame:Toggle()
    if self:IsShown() then
        self:Hide()
    else
        self:Show()
    end
end

-- 注册主界面类（不立即实例化）
ns.UI.MainFrame = HeroicMainFrame

-- 延迟创建主界面实例的函数
function ns.CreateMainFrame()
    if not ns.MainFrame then
        ns.MainFrame = HeroicMainFrame:New()
        -- ESC键支持
        table.insert(UISpecialFrames, "MeetingHornHeroicMainFrame")
    end
    return ns.MainFrame
end

-- 当主框架状态改变时，更新集成按钮状态
local function UpdateIntegrationButtonState()
    if ns.MeetingHornIntegration then
        ns.MeetingHornIntegration:UpdateButtonState()
    end
end

-- Hook框架显示/隐藏事件
local originalShow, originalHide
local function HookFrameEvents(frame)
    if not originalShow then
        originalShow = frame.Show
        frame.Show = function(self)
            originalShow(self)
            UpdateIntegrationButtonState()
        end
    end

    if not originalHide then
        originalHide = frame.Hide
        frame.Hide = function(self)
            originalHide(self)
            UpdateIntegrationButtonState()
        end
    end
end

-- 注册全局创建函数
ns.CreateMainFrame = function()
    if not ns.MainFrame then
        ns.MainFrame = HeroicMainFrame:New()
        -- ESC键支持
        table.insert(UISpecialFrames, "MeetingHornHeroicMainFrame")
        -- Hook事件
        HookFrameEvents(ns.MainFrame)
    end
    return ns.MainFrame
end

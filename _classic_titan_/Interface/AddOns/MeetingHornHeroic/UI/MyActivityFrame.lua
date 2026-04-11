-- MyActivityFrame.lua
-- 我的活动页面，显示参与者的详细信息

---@type MeetingHornHeroicNS
local ns = select(2, ...)
local L = ns.L or {}

---@class HeroicMyActivityFrame: Frame
local HeroicMyActivityFrame = {}

-- ========== 聊天气泡公用渲染模块 ==========
-- MIN_WIDTH 和 BG_PADDING_H 由 LibTextLayout-1.0 统一管理
local LibTextLayout = LibStub and LibStub("LibTextLayout-1.0", true)
local CHAT_BUBBLE_MAX_RATIO = 0.73
local CHAT_ELEMENT_MIN_HEIGHT = 48
local CHAT_ELEMENT_PADDING = 6
-- 注意：原始 BG_PADDING_H = 16（左右各 8），与库默认 20 不同，保持原值以不改变视觉效果
local BG_PADDING_H = LibTextLayout and LibTextLayout.DEFAULT_BG_PADDING_H or 16
local BG_PADDING_TOP = 8     -- 气泡背景顶部 padding
local BG_PADDING_BOTTOM = 8  -- 气泡背景底部 padding

-- 气泡圆角 Backdrop 配置（WoW 内置 Tooltip 圆角纹理）
local BUBBLE_BACKDROP = {
    bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile     = true,
    tileSize = 16,
    edgeSize = 12,
    insets   = { left = 3, right = 3, top = 3, bottom = 3 },
}

--- 创建圆角气泡背景 Frame（替代原来的 Texture）
local function CreateBubbleBg(parentFrame, w, h, isSelf)
    local bg = CreateFrame("Frame", nil, parentFrame, "BackdropTemplate")
    bg:SetFrameLevel(parentFrame:GetFrameLevel())  -- 压低层级，让文字/图标渲染在气泡上方
    bg:SetSize(w, h)
    bg:SetBackdrop(BUBBLE_BACKDROP)
    if isSelf then
        bg:SetBackdropColor(0.35, 0.20, 0.18, 0.92)
        bg:SetBackdropBorderColor(0.50, 0.30, 0.25, 0.8)
    else
        bg:SetBackdropColor(0.18, 0.28, 0.22, 0.92)
        bg:SetBackdropBorderColor(0.25, 0.40, 0.30, 0.8)
    end
    return bg
end

-- 执行斜杠命令：兼容 WotLK 3.3.5a（RunMacroText / RunSlashCmd 不可用）
-- 方案一：直接用命令名大写 key 查 SlashCmdList（如 /reload → SlashCmdList["RELOAD"]）
-- 方案二：遍历 SlashCmdList 并通过 _G["SLASH_XXXi"] 反查（处理别名，如 /g → SlashCmdList["GUILD"]）
local function ExecuteSlashCommand(text)
    local cmdWord, args = text:match("^/([%a_%-]+)%s*(.*)")
    if not cmdWord then return end
    args = args or ""
    local upperKey = cmdWord:upper()

    -- 方案一：直接 key 匹配（覆盖绝大多数 WoW 内置命令，如 /reload /who /party /raid）
    if SlashCmdList[upperKey] then
        SlashCmdList[upperKey](args)
        return
    end

    -- 方案二：通过 _G["SLASH_XXXi"] 字符串反查（处理别名命令，如 /g /p 等缩写）
    local fullCmd = "/" .. cmdWord:lower()
    for name, handler in pairs(SlashCmdList) do
        local i = 1
        while true do
            local slash = _G["SLASH_" .. name .. i]
            if not slash then break end
            if slash:lower() == fullCmd then
                handler(args)
                return
            end
            i = i + 1
        end
    end

    --[=[@debug@
    DEFAULT_CHAT_FRAME:AddMessage(string.format("[MHH Debug] 未找到命令: '%s' upperKey='%s' SlashCmdList[upperKey]=%s",
        text, upperKey, tostring(SlashCmdList[upperKey])))
    --@end-debug@]=]
    DEFAULT_CHAT_FRAME:AddMessage("|cffff4444未知命令: /" .. cmdWord .. "|r")
end

-- Shift+点击物品链接插入支持：记录当前聚焦的聊天输入框
local _activeChatEditBox = nil
local _origChatEditGetActiveWindow = ChatEdit_GetActiveWindow
ChatEdit_GetActiveWindow = function()
    if _activeChatEditBox then
        return _activeChatEditBox
    end
    if _origChatEditGetActiveWindow then
        return _origChatEditGetActiveWindow()
    end
end

-- 左对齐布局（他人消息）：头像左，名字在头像旁，气泡在下方，时间戳在气泡右侧
local function ChatApplyLeftLayout(element)
    -- 头像：左上角
    element.avatar:ClearAllPoints()
    element.avatar:SetPoint("TOPLEFT", element, "TOPLEFT", 5, -2)
    -- 名字：头像右侧偏上（气泡外部）
    element.playerInfo:ClearAllPoints()
    element.playerInfo:SetPoint("LEFT", element.avatar, "RIGHT", 5, 0)
    element.playerInfo:SetJustifyH("LEFT")
    -- bg 气泡背景：头像下方偏右
    element.bg:ClearAllPoints()
    element.bg:SetPoint("TOPLEFT", element.avatar, "BOTTOMRIGHT", 3, -2)
    -- 消息文字：bg 内部左对齐
    element.message:ClearAllPoints()
    element.message:SetPoint("TOPLEFT", element.bg, "TOPLEFT", 8, -BG_PADDING_TOP)
    element.message:SetJustifyH("LEFT")
    -- 时间戳：bg 右侧，底部对齐
    element.timestamp:ClearAllPoints()
    element.timestamp:SetPoint("BOTTOMLEFT", element.bg, "BOTTOMRIGHT", 4, 0)
    element.timestamp:SetJustifyH("LEFT")
    -- 隐藏方向箭头
    if element.directionArrow then
        element.directionArrow:Hide()
    end
end

-- 右对齐布局（自己发出的消息）：头像右，名字在头像旁，气泡在下方，时间戳在气泡右下角
local function ChatApplyRightLayout(element)
    -- 头像：右上角
    element.avatar:ClearAllPoints()
    element.avatar:SetPoint("TOPRIGHT", element, "TOPRIGHT", -5, -2)
    -- 名字：头像左侧偏上（气泡外部）
    element.playerInfo:ClearAllPoints()
    element.playerInfo:SetPoint("RIGHT", element.avatar, "LEFT", -5, 0)
    element.playerInfo:SetJustifyH("RIGHT")
    -- bg 气泡背景：头像下方偏左
    element.bg:ClearAllPoints()
    element.bg:SetPoint("TOPRIGHT", element.avatar, "BOTTOMLEFT", -3, -2)
    -- 消息文字：bg 内部右对齐
    element.message:ClearAllPoints()
    element.message:SetPoint("TOPRIGHT", element.bg, "TOPRIGHT", -8, -BG_PADDING_TOP)
    element.message:SetJustifyH("RIGHT")
    -- 时间戳：bg 左侧，底部对齐（与左布局对称）
    element.timestamp:ClearAllPoints()
    element.timestamp:SetPoint("BOTTOMRIGHT", element.bg, "BOTTOMLEFT", -4, 0)
    element.timestamp:SetJustifyH("RIGHT")
    -- 隐藏方向箭头
    if element.directionArrow then
        element.directionArrow:Hide()
    end
end

-- 动态计算气泡宽高并重排（OnUpdate 调用）
local function ChatUpdateBubbleSize(element, scrollChild, chatSelf, allElements)
    local scrollW = (scrollChild and scrollChild:GetWidth() > 0) and scrollChild:GetWidth() or 300
    local maxW = math.floor(scrollW * CHAT_BUBBLE_MAX_RATIO)

    -- 名字行：不限制宽度，测量自然宽度（不换行），此逻辑保留在业务层
    element.playerInfo:SetWidth(0)
    local infoNaturalW = math.ceil(element.playerInfo:GetStringWidth()) + 2  -- luacheck: ignore

    local bubbleW, msgH
    if LibTextLayout then
        -- ===== 委托 LibTextLayout-1.0 计算气泡尺寸 =====
        local minWidth = LibTextLayout.DEFAULT_MIN_WIDTH
        local result = LibTextLayout:CalcBubbleSize({
            fontString = element.message,
            text       = element.message:GetText() or "",
            maxWidth   = maxW,
            minWidth   = minWidth,
            bgPaddingH = BG_PADDING_H,
        })
        bubbleW = result.width
        msgH    = result.height
    else
        -- ===== 降级：保留原始内联逻辑（LibTextLayout 未加载时兜底）=====
        local CHAT_MIN_BUBBLE_WIDTH_FALLBACK = 120
        element.message:SetWidth(maxW)
        local msgNaturalW = element.message:GetStringWidth()
        bubbleW = math.max(CHAT_MIN_BUBBLE_WIDTH_FALLBACK, math.min(maxW, math.ceil(msgNaturalW) + 2))
        element.message:SetWidth(bubbleW)
        msgH = element.message:GetHeight()
        if msgH <= 0 then msgH = 14 end
    end

    element.message:SetWidth(bubbleW)
    element.playerInfo:SetWidth(0) -- 名字行在气泡外，不限制宽度

    local infoH = element.playerInfo:GetHeight()
    if infoH <= 0 then infoH = 14 end
    if msgH  <= 0 then msgH  = 14 end

    -- bg 尺寸：仅包裹消息文字
    local bgW = bubbleW + BG_PADDING_H
    local bgH = BG_PADDING_TOP + msgH + BG_PADDING_BOTTOM
    element.bg:SetSize(bgW, bgH)

    -- element 高度 = 名字/头像行 + 间距 + bg + 时间戳行(右布局需要空间)
    local nameRowH = math.max(32, infoH)  -- 32 = 头像高度
    local totalH = nameRowH + 2 + bgH + 14  -- 14 = 时间戳行预留高度
    if totalH < CHAT_ELEMENT_MIN_HEIGHT then totalH = CHAT_ELEMENT_MIN_HEIGHT end
    element:SetHeight(totalH)

    if allElements and scrollChild then
        local yOffset = 0
        for _, el in ipairs(allElements) do
            local h = el:GetHeight()
            if h < CHAT_ELEMENT_MIN_HEIGHT then h = CHAT_ELEMENT_MIN_HEIGHT end
            el:ClearAllPoints()
            el:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, -yOffset)
            yOffset = yOffset + h + CHAT_ELEMENT_PADDING
        end
        scrollChild:SetHeight(math.max(yOffset, 10))
    end
end

--[[
  CreateChatBubbleElement：通用聊天气泡创建函数
  params:
    parent       - 父 Frame（scrollChild）
    record       - 消息记录
    opts = {
      isSelf       - boolean，是否是自己发出的消息
      senderName   - 显示名字
      senderClass  - 职业英文 key（可空）
      level        - 等级（可空）
      itemLevel    - 装等（可空）
      replyLabel   - 回复标签文字（可空），如 "→ 回复 @xxx"
      scrollChild  - 滚动子容器（用于 OnUpdate 测宽）
      allElements  - 所有 element 列表（用于重排）
      chatSelf     - HeroicMyActivityFrame 实例
      onRightClick - 右键回调 function(record)，nil 则不注册
    }
]]
local function CreateChatBubbleElement(parent, record, opts)
    local element = CreateFrame("Frame", nil, parent)
    element:SetSize(parent:GetWidth() > 0 and parent:GetWidth() or 330, CHAT_ELEMENT_MIN_HEIGHT)

    -- 背景：圆角气泡（Frame + Backdrop 替代原 Texture）
    local initW = LibTextLayout and LibTextLayout.DEFAULT_MIN_WIDTH or 120
    element.bg = CreateBubbleBg(element, initW, CHAT_ELEMENT_MIN_HEIGHT, opts.isSelf)

    -- 头像
    element.avatar = CreateFrame("Frame", nil, element)
    element.avatar:SetSize(32, 32)
    element.avatarTexture = element.avatar:CreateTexture(nil, "ARTWORK")
    element.avatarTexture:SetAllPoints()
    local cls = opts.senderClass
    if cls and CLASS_ICON_TCOORDS[cls] then
        element.avatarTexture:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
        element.avatarTexture:SetTexCoord(unpack(CLASS_ICON_TCOORDS[cls]))
    else
        element.avatarTexture:SetTexture("Interface\\CharacterFrame\\TempPortrait")
    end

    -- 玩家信息行
    element.playerInfo = element:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
            element.playerInfo:SetWidth(LibTextLayout and LibTextLayout.DEFAULT_MIN_WIDTH or 120)
    local infoText = opts.senderName or "未知"
    if opts.replyLabel then
        infoText = infoText .. " |cff888888" .. opts.replyLabel .. "|r"
    end
    element.playerInfo:SetText(infoText)
    if cls then
        local cc = RAID_CLASS_COLORS[cls]
        if cc then element.playerInfo:SetTextColor(cc.r, cc.g, cc.b, 1) end
    end

    -- 消息文字（只设宽不设高，让 WordWrap 自由扩展）
    element.message = element:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
            element.message:SetWidth(LibTextLayout and LibTextLayout.DEFAULT_MIN_WIDTH or 120)
    element.message:SetWordWrap(true)
    element.message:SetNonSpaceWrap(true)
    element.message:SetText(record.message or "")
    element.message:SetTextColor(1, 1, 1, 1)
    -- 物品链接渲染支持：hyperlink 事件挂在父 Frame（element）上
    -- FontString 不支持 SetHyperlinksEnabled / OnHyperlinkEnter 等，Frame 才支持
    element:EnableMouse(true)
    element:SetHyperlinksEnabled(true)
    element:SetScript("OnHyperlinkEnter", function(self, link, text)
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
        GameTooltip:SetHyperlink(link)
        GameTooltip:Show()
    end)
    element:SetScript("OnHyperlinkLeave", function()
        GameTooltip:Hide()
    end)
    element:SetScript("OnHyperlinkClick", function(self, link, text, button)
        SetItemRef(link, text, button)
    end)

    -- 时间戳（缩小字号，避免与气泡内容抢视觉重心）
    element.timestamp = element:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
    do
        local fontPath, _, fontFlags = element.timestamp:GetFont()
        element.timestamp:SetFont(fontPath, 9, fontFlags)
    end
    element.timestamp:SetText(date("%H:%M:%S", record.timestamp))
    element.timestamp:SetTextColor(0.7, 0.7, 0.7, 1)

    -- 方向箭头
    element.directionArrow = element:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    if opts.isSelf then
        element.directionArrow:SetText("←")
        element.directionArrow:SetTextColor(1, 0.4, 0.4, 1)
    else
        element.directionArrow:SetText("→")
        element.directionArrow:SetTextColor(0.4, 1, 0.4, 1)
    end

    -- 应用左/右布局
    if opts.isSelf then
        ChatApplyRightLayout(element)
    else
        ChatApplyLeftLayout(element)
    end

    -- OnUpdate：一帧后测量宽高并重排
    element:SetScript("OnUpdate", function(el)
        el:SetScript("OnUpdate", nil)
        ChatUpdateBubbleSize(el, opts.scrollChild, opts.chatSelf, opts.allElements)
    end)

    -- 右键菜单
    if opts.onRightClick then
        element:EnableMouse(true)
        element:SetScript("OnMouseUp", function(_, btn)
            if btn == "RightButton" then opts.onRightClick(record) end
        end)
    end

    return element
end

-- 星团长图标纹理（从meetinghorn复制）
local certificationTextures = {
    [1] = [[|TInterface\AddOns\MeetingHorn\Media\mini_certification_icon_1:17:40:0:0:1:1:0:1:0:1|t]],
    [2] = [[|TInterface\AddOns\MeetingHorn\Media\mini_certification_icon_2:17:40:0:0:1:1:0:1:0:1|t]],
    [3] = [[|TInterface\AddOns\MeetingHorn\Media\mini_certification_icon_3:17:40:0:0:1:1:0:1:0:1|t]],
    [4] = [[|TInterface\AddOns\MeetingHorn\Media\mini_certification_icon_4:17:40:0:0:1:1:0:1:0:1|t]],
    [5] = [[|TInterface\AddOns\MeetingHorn\Media\mini_certification_icon_5:17:40:0:0:1:1:0:1:0:1|t]],
    [6] = [[|TInterface\AddOns\MeetingHorn\Media\mini_certification_icon_6:17:40:0:0:1:1:0:1:0:1|t]],
}

function HeroicMyActivityFrame:New(parent)
    local frame = CreateFrame("Frame", "HeroicMyActivityFrame", parent)
    frame:SetAllPoints()
    frame:Hide()
    
    -- 绑定方法
    for k, v in pairs(HeroicMyActivityFrame) do
        if type(v) == "function" then
            frame[k] = v
        end
    end
    
    frame:CreateUI()
    return frame
end

function HeroicMyActivityFrame:CreateTabSystem(participantArea)
    -- ====== Chat Tab 栏（在参与者区域下方）======
    local tabFrame = CreateFrame("Frame", nil, self)
    tabFrame:SetPoint("TOPLEFT", participantArea, "BOTTOMLEFT", 0, -5)
    tabFrame:SetPoint("TOPRIGHT", participantArea, "BOTTOMRIGHT", 0, -5)
    tabFrame:SetHeight(30)
    self.tabFrame = tabFrame

    -- 创建私聊频道标签（Tab 1: whisper 私聊）
    local chatTab = ns.MHTabLib.CreateTab(tabFrame, "私聊频道", 120, 28)
    chatTab:SetPoint("LEFT", 10, 0)
    chatTab:SetID(1)
    chatTab:SetScript("OnClick", function()
        self:SwitchToTab("chat")
    end)
    self.chatTab = chatTab

    -- 创建团队频道标签（Tab 2: 团队聊天）
    local teamChatTab = ns.MHTabLib.CreateTab(tabFrame, "团队频道", 120, 28)
    teamChatTab:SetPoint("LEFT", chatTab, "RIGHT", 8, 0)
    teamChatTab:SetID(2)
    teamChatTab:SetScript("OnClick", function()
        self:SwitchToTab("teamchat")
    end)
    self.teamChatTab = teamChatTab

    -- 创建管理活动按钮 (普通按钮样式)
    local manageButton = CreateFrame("Button", nil, tabFrame, "UIPanelButtonTemplate")
    manageButton:SetText("管理活动")
    manageButton:SetSize(80, 24)
    manageButton:SetPoint("RIGHT", -10, 0)
    manageButton:SetScript("OnClick", function(button)
        self:ShowManageMenu(button)
    end)
    self.manageButton = manageButton

    -- 初始化标签按钮列表
    self.tabButtons = {chatTab, teamChatTab}

    -- ====== 回复提示条（在输入框上方）======
    local replyBar = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
    replyBar:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 20, 52)
    replyBar:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -20, 52)
    replyBar:SetHeight(24)
    replyBar:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    replyBar:SetBackdropColor(0.2, 0.3, 0.4, 0.8)
    replyBar:Hide()
    self.replyBar = replyBar

    local replyLabel = replyBar:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    replyLabel:SetPoint("LEFT", 8, 0)
    replyLabel:SetTextColor(0.7, 0.9, 1, 1)
    self.replyLabel = replyLabel

    local replyCloseBtn = CreateFrame("Button", nil, replyBar)
    replyCloseBtn:SetSize(16, 16)
    replyCloseBtn:SetPoint("RIGHT", -4, 0)
    replyCloseBtn:SetNormalTexture("Interface\\Buttons\\UI-StopButton")
    replyCloseBtn:SetScript("OnClick", function()
        self:ClearReplyState()
    end)

    -- ====== 聊天内容区域 ======
    local contentFrame = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
    contentFrame:SetPoint("TOPLEFT", tabFrame, "BOTTOMLEFT", 0, -5)
    contentFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -20, 60) -- 底部留 60px 给输入框
    contentFrame:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    contentFrame:SetBackdropColor(0.1, 0.1, 0.1, 0.3)
    contentFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    self.contentFrame = contentFrame

    -- 聊天记录滚动框架（whisper）
    local chatScrollFrame = CreateFrame("ScrollFrame", "HeroicChatScrollFrame", contentFrame, "UIPanelScrollFrameTemplate")
    chatScrollFrame:SetPoint("TOPLEFT", 10, -10)
    chatScrollFrame:SetPoint("BOTTOMRIGHT", -40, 10)

    local chatScrollChild = CreateFrame("Frame", nil, chatScrollFrame)
    chatScrollChild:SetSize(1, 1)
    chatScrollFrame:SetScrollChild(chatScrollChild)

    self.chatScrollFrame = chatScrollFrame
    self.chatScrollChild = chatScrollChild

    -- 聊天室滚动框架（团队聊天）
    local teamChatScrollFrame = CreateFrame("ScrollFrame", "HeroicTeamChatScrollFrame", contentFrame, "UIPanelScrollFrameTemplate")
    teamChatScrollFrame:SetPoint("TOPLEFT", 10, -10)
    teamChatScrollFrame:SetPoint("BOTTOMRIGHT", -40, 10)
    teamChatScrollFrame:Hide()

    local teamChatScrollChild = CreateFrame("Frame", nil, teamChatScrollFrame)
    teamChatScrollChild:SetSize(1, 1)
    teamChatScrollFrame:SetScrollChild(teamChatScrollChild)

    self.teamChatScrollFrame = teamChatScrollFrame
    self.teamChatScrollChild = teamChatScrollChild

    -- 无聊天记录提示
    local noChatRecordsLabel = contentFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    noChatRecordsLabel:SetPoint("CENTER")
    noChatRecordsLabel:SetText("暂无聊天记录")
    noChatRecordsLabel:SetTextColor(0.5, 0.5, 0.5, 1)
    noChatRecordsLabel:Hide()
    self.noChatRecordsLabel = noChatRecordsLabel

    -- ====== IM 输入框区域（底部）======
    local inputFrame = CreateFrame("Frame", nil, self)
    inputFrame:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 20, 20)
    inputFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -20, 20)
    inputFrame:SetHeight(32)
    self.inputFrame = inputFrame

    -- 输入框
    local chatEditBox = CreateFrame("EditBox", "HeroicChatEditBox", inputFrame, BackdropTemplateMixin and "BackdropTemplate")
    chatEditBox:SetPoint("LEFT", 0, 0)
    chatEditBox:SetPoint("RIGHT", -70, 0)
    chatEditBox:SetHeight(28)
    chatEditBox:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    chatEditBox:SetBackdropColor(0.05, 0.05, 0.05, 0.9)
    chatEditBox:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    chatEditBox:SetFontObject(ChatFontNormal)
    chatEditBox:SetAutoFocus(false)
    chatEditBox:SetMaxLetters(500)
    chatEditBox:SetTextInsets(8, 8, 0, 0)
    chatEditBox:SetScript("OnEnterPressed", function()
        self:OnSendMessage()
    end)
    chatEditBox:SetScript("OnEscapePressed", function()
        chatEditBox:ClearFocus()
    end)
    -- Shift+点击物品链接插入：聚焦时注册为活跃编辑框
    chatEditBox:SetScript("OnEditFocusGained", function()
        _activeChatEditBox = chatEditBox
    end)
    chatEditBox:SetScript("OnEditFocusLost", function()
        _activeChatEditBox = nil
    end)
    self.chatEditBox = chatEditBox

    -- 私聊对象提示标签（在输入框左侧内嵌，类似 WoW 的"密语 [玩家名]:"）
    local whisperTargetLabel = inputFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    whisperTargetLabel:SetPoint("LEFT", 8, 0)
    whisperTargetLabel:SetTextColor(1, 0.5, 1, 1) -- 紫色，WoW whisper 风格
    whisperTargetLabel:SetText("")
    whisperTargetLabel:Hide()
    self.whisperTargetLabel = whisperTargetLabel

    -- 发送按钮
    local sendButton = CreateFrame("Button", nil, inputFrame, "UIPanelButtonTemplate")
    sendButton:SetText("发送")
    sendButton:SetSize(60, 28)
    sendButton:SetPoint("RIGHT", 0, 0)
    sendButton:SetScript("OnClick", function()
        self:OnSendMessage()
    end)
    self.sendButton = sendButton

    -- 回复状态
    self.replyToName = nil

    -- 聊天元素列表
    self.chatElements = {}
    self.teamChatElements = {}

    -- 默认显示聊天记录标签页
    self.currentTab = "chat"
    self:UpdateTabButtons()
end

function HeroicMyActivityFrame:SwitchToTab(tabName)
    -- 如果切换到团队频道，先消费待刷新标志
    -- （_needsTeamChatRefresh 在窗口已显示但 Tab 不在 teamchat 时收到消息后设置）
    local pendingTeamRefresh = self._needsTeamChatRefresh
    if tabName == "teamchat" and pendingTeamRefresh then
        self._needsTeamChatRefresh = false
    end

    if self.currentTab == tabName then
        -- 即使 Tab 未切换，若有待刷新标志也要补刷
        if tabName == "teamchat" and pendingTeamRefresh then
            self:RefreshTeamChatData()
            self:ScrollToBottom(self.teamChatScrollFrame)
        end
        return
    end

    self.currentTab = tabName
    self:UpdateTabButtons()

    if tabName == "chat" then
        self.chatScrollFrame:Show()
        self.teamChatScrollFrame:Hide()
        self.noChatRecordsLabel:SetText("暂无聊天记录")
        self.noChatRecordsLabel:Hide()
        self:RefreshChatData()
        self:ScrollToBottom(self.chatScrollFrame)
        self:UpdateWhisperTarget()
    elseif tabName == "teamchat" then
        self.chatScrollFrame:Hide()
        self:UpdateWhisperTarget()
        if not IsInGroup() then
            -- 不在队伍中，显示提示，隐藏聊天室
            self.teamChatScrollFrame:Hide()
            self.noChatRecordsLabel:SetText("需要加入队伍或团队才能使用聊天室")
            self.noChatRecordsLabel:Show()
        else
            self.teamChatScrollFrame:Show()
            self.noChatRecordsLabel:Hide()
            self:RefreshTeamChatData()
            self:ScrollToBottom(self.teamChatScrollFrame)
        end
    end
end

function HeroicMyActivityFrame:UpdateTabButtons()
    -- 使用 MHTabLib 统一更新标签视觉状态
    ns.MHTabLib.SetTabSelected(self.chatTab,        self.currentTab == "chat")
    ns.MHTabLib.SetTabSelected(self.teamChatTab,    self.currentTab == "teamchat")
end

-- ========== IM 消息发送 ==========

function HeroicMyActivityFrame:OnSendMessage()
    local text = self.chatEditBox:GetText()
    if not text or text == "" then return end

    -- 斜杠命令检测：以 "/" 开头时查 SlashCmdList 执行 WoW 官方命令，不作为聊天消息发送
    if text:sub(1, 1) == "/" then
        ExecuteSlashCommand(text)
        self.chatEditBox:SetText("")
        return
    end

    if self.currentTab == "chat" then
        -- Whisper 发送模式
        if ns.ChatManager and ns.ChatManager.lastReceivedFrom then
            SendChatMessage(text, "WHISPER", nil, ns.ChatManager.lastReceivedFrom)
        else
            ns.Addon:Print("没有可回复的私聊对象")
            return
        end
    elseif self.currentTab == "teamchat" then
        -- 团队聊天发送模式
        if not IsInGroup() then
            ns.Addon:Print("需要加入队伍或团队才能使用聊天室")
            return
        end
        if ns.ChatManager then
            ns.ChatManager:SendTeamChatMessage(text, self.replyToName)
        end
    end

    -- 清空输入框和回复状态
    self.chatEditBox:SetText("")
    self:ClearReplyState()
end

function HeroicMyActivityFrame:SetReplyTarget(playerName)
    if not playerName or playerName == "" then return end
    self.replyToName = playerName
    if self.replyBar then
        self.replyLabel:SetText("回复 @" .. playerName)
        self.replyBar:Show()
    end
    -- replyBar 可见时，contentFrame 底部多留空间
    if self.contentFrame then
        self.contentFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -20, 84)
    end
    if self.chatEditBox then
        self.chatEditBox:SetFocus()
    end
end

function HeroicMyActivityFrame:ClearReplyState()
    self.replyToName = nil
    if self.replyBar then
        self.replyBar:Hide()
    end
    -- 恢复 contentFrame 底部边距
    if self.contentFrame then
        self.contentFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -20, 60)
    end
end

-- ========== 私聊对象提示 ==========

function HeroicMyActivityFrame:UpdateWhisperTarget()
    if self.currentTab == "chat" then
        local target = ns.ChatManager and ns.ChatManager.lastReceivedFrom
        if target and target ~= "" then
            local shortName = Ambiguate(target, "short")
            self.whisperTargetLabel:SetText("密语 " .. shortName .. ":")
            self.whisperTargetLabel:SetTextColor(1, 0.5, 1, 1) -- 紫色 whisper 风格
            self.whisperTargetLabel:Show()
            -- 输入框左边留出空间给提示标签
            local labelWidth = self.whisperTargetLabel:GetStringWidth() + 16
            self.chatEditBox:SetPoint("LEFT", labelWidth, 0)
        else
            self.whisperTargetLabel:SetText("")
            self.whisperTargetLabel:Hide()
            self.chatEditBox:SetPoint("LEFT", 0, 0)
        end
    elseif self.currentTab == "teamchat" then
        self.whisperTargetLabel:SetText("团队聊天")
        self.whisperTargetLabel:SetTextColor(1, 0.8, 0, 1) -- 金色
        self.whisperTargetLabel:Show()
        local labelWidth = self.whisperTargetLabel:GetStringWidth() + 16
        self.chatEditBox:SetPoint("LEFT", labelWidth, 0)
    else
        self.whisperTargetLabel:Hide()
        self.chatEditBox:SetPoint("LEFT", 0, 0)
    end
end

-- ========== 通用自动滚底 ==========

function HeroicMyActivityFrame:ScrollToBottom(scrollFrame)
    if not scrollFrame then return end
    -- 使用 OnUpdate 多帧等待方案，跳过前 2 帧让布局引擎更新 scrollChild 高度
    local frameCount = 0
    local lastRange = -1
    scrollFrame:SetScript("OnUpdate", function(sf)
        frameCount = frameCount + 1
        local range = sf:GetVerticalScrollRange()
        -- 至少等 2 帧让布局稳定，且 range 不再变化时才设置滚动
        if frameCount >= 2 and range > 0 and range == lastRange then
            sf:SetVerticalScroll(range)
            sf:SetScript("OnUpdate", nil)
        elseif frameCount > 30 then
            -- 超时：最后再尝试一次
            if range > 0 then
                sf:SetVerticalScroll(range)
            end
            sf:SetScript("OnUpdate", nil)
        end
        lastRange = range
    end)
end

function HeroicMyActivityFrame:CreateUI()
    -- ====== 标题行（单行紧凑：我的活动: 活动名）======
    local titleFrame = CreateFrame("Frame", nil, self)
    titleFrame:SetPoint("TOPLEFT", 20, -15)
    titleFrame:SetPoint("TOPRIGHT", self, "TOPRIGHT", -20, -15)
    titleFrame:SetHeight(28)

    local title = titleFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("LEFT", 0, 0)
    title:SetText("我的活动")
    title:SetTextColor(1, 0.8, 0, 1)
    self.titleLabel = title

    local activityInfo = titleFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    activityInfo:SetPoint("LEFT", title, "RIGHT", 10, 0)
    activityInfo:SetText("")
    activityInfo:SetTextColor(1, 1, 1, 1)
    self.activityInfo = activityInfo

    -- ====== 参与者区域（标题下方，固定高度 ~110px）======
    local participantArea = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
    participantArea:SetPoint("TOPLEFT", titleFrame, "BOTTOMLEFT", 0, -5)
    participantArea:SetPoint("TOPRIGHT", titleFrame, "BOTTOMRIGHT", 0, -5)
    participantArea:SetHeight(110)
    participantArea:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    participantArea:SetBackdropColor(0, 0, 0, 0.3)
    participantArea:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
    self.participantArea = participantArea

    -- 参与者滚动框架（两列布局）
    local participantScrollFrame = CreateFrame("ScrollFrame", "HeroicParticipantScrollFrame", participantArea, "UIPanelScrollFrameTemplate")
    participantScrollFrame:SetPoint("TOPLEFT", 5, -5)
    participantScrollFrame:SetPoint("BOTTOMRIGHT", -30, 5)

    local participantScrollChild = CreateFrame("Frame", nil, participantScrollFrame)
    participantScrollChild:SetSize(1, 1)
    participantScrollFrame:SetScrollChild(participantScrollChild)

    self.participantScrollFrame = participantScrollFrame
    self.participantScrollChild = participantScrollChild
    self.scrollFrame = participantScrollFrame
    self.scrollChild = participantScrollChild

    -- 直接创建标签页系统
    self:CreateTabSystem(participantArea)

    -- 参与者按钮列表
    self.participantButtons = {}

    -- 初始化数据
    self:RefreshData()

    -- 统一注册 ActivityManager 回调（全生命周期监听活动状态变化 + 聊天记录事件）
    if ns.ActivityManager and not self._activityCallbackRegistered then
        ns.ActivityManager:RegisterUpdateCallback(function(eventType, data)
            -- 活动核心状态事件：创建/关闭/更新/同步/加载
            if eventType == "ACTIVITY_CLOSED" or eventType == "ACTIVITY_CREATED"
                or eventType == "ACTIVITY_LOADED" or eventType == "ACTIVITY_UPDATED"
                or eventType == "ACTIVITY_SYNCED" then
                if self:IsShown() then
                    self:RefreshData()
                else
                    self._needsRefreshOnShow = true
                end
            -- 聊天记录事件（whisper）
            elseif eventType == "CHAT_RECORD_ADDED" or eventType == "CHAT_RECORD_UPDATED" then
                if self:IsShown() then
                    if self.currentTab == "chat" then
                        self:RefreshChatData()
                        self:ScrollToBottom(self.chatScrollFrame)
                    end
                else
                    self._needsRefreshOnShow = true
                end
            -- 团队聊天事件
            elseif eventType == "TEAM_CHAT_ADDED" then
                if self:IsShown() then
                    if self.currentTab == "teamchat" then
                        -- 确保 scrollFrame 可见（可能之前因不在队伍而被隐藏）
                        if not self.teamChatScrollFrame:IsShown() and IsInGroup() then
                            self.teamChatScrollFrame:Show()
                            self.noChatRecordsLabel:Hide()
                        end
                        self:RefreshTeamChatData()
                        self:ScrollToBottom(self.teamChatScrollFrame)
                    else
                        -- 窗口已打开但 Tab 不在团队频道，标记待刷新
                        -- SwitchToTab("teamchat") 时会消费此标志并刷新
                        self._needsTeamChatRefresh = true
                    end
                else
                    self._needsRefreshOnShow = true
                end
            -- 成员信息事件
            elseif eventType == "MEMBER_INFO_RECEIVED" then
                if self:IsShown() then
                    if self.currentTab == "participants" then
                        self:RefreshData()
                    elseif self.currentTab == "chat" then
                        self:RefreshChatData()
                    end
                end
            end
        end)
        self._activityCallbackRegistered = true
    end
end

function HeroicMyActivityFrame:CreateParticipantButton(index)
    local buttonName = "HeroicParticipantButton" .. index
    local button = CreateFrame("Button", buttonName, self.scrollChild, BackdropTemplateMixin and "BackdropTemplate")

    -- 两列布局计算
    local col = (index - 1) % 2  -- 0为左列，1为右列
    local row = math.floor((index - 1) / 2)  -- 行数
    local buttonWidth = 280  -- 每个按钮宽度
    local buttonHeight = 48  -- 按钮高度
    local colSpacing = 290   -- 列间距
    local rowSpacing = 53    -- 行间距

    button:SetSize(buttonWidth, buttonHeight)

    -- 设置位置：左列x=10，右列x=10+290
    local xPos = 10 + col * colSpacing
    local yPos = -(row * rowSpacing) - 10
    button:SetPoint("TOPLEFT", xPos, yPos)
    
    -- 背景
    button:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    button:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    button:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    
    -- 职业图标
    local classIcon = button:CreateTexture(nil, "ARTWORK")
    classIcon:SetSize(32, 32)
    classIcon:SetPoint("LEFT", 10, 0)
    button.classIcon = classIcon
    
    -- 专精图标
    local specIcon = button:CreateTexture(nil, "ARTWORK")
    specIcon:SetSize(24, 24)
    specIcon:SetPoint("LEFT", classIcon, "RIGHT", 5, 0)
    button.specIcon = specIcon
    
    -- 玩家姓名（带职业颜色，垂直居中）
    local playerName = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    playerName:SetPoint("LEFT", specIcon, "RIGHT", 10, 0)
    playerName:SetJustifyH("LEFT")
    button.playerName = playerName


    -- 星团长信息 - 紧跟在名字后面
    local leaderInfo = button:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    leaderInfo:SetPoint("LEFT", playerName, "RIGHT", 10, 0)
    leaderInfo:SetTextColor(1, 0.8, 0.2, 1)
    button.leaderInfo = leaderInfo
    
    -- 右键菜单支持
    button:SetScript("OnMouseUp", function(self, mouseButton)
        if mouseButton == "RightButton" and self.playerData and self.playerData.name then
            button:ShowPlayerContextMenu()
        end
    end)
    button:RegisterForClicks("AnyUp")
    
    -- 鼠标悬停效果
    button:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.2, 0.2, 0.3, 0.8)
        if self.playerData then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(self.playerData.name, 1, 1, 1)
            if self.playerData.guild then
                GameTooltip:AddLine("公会: " .. self.playerData.guild, 0.8, 0.8, 1)
            end
            if self.playerData.note then
                GameTooltip:AddLine("备注: " .. self.playerData.note, 1, 1, 0.8)
            end
            GameTooltip:Show()
        end
    end)
    
    button:SetScript("OnLeave", function(self)
        self:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
        GameTooltip:Hide()
    end)
    
    -- 添加右键菜单方法
    function button:ShowPlayerContextMenu()
        if not self.playerData or not self.playerData.name then
            return
        end

        local parentFrame = self:GetParent():GetParent():GetParent() -- scrollChild → scrollFrame → participantArea → MyActivityFrame
        -- 向上找到 MyActivityFrame 实例（通过 name 匹配）
        local myActivityFrame = parentFrame
        while myActivityFrame and not myActivityFrame.SwitchToTab do
            myActivityFrame = myActivityFrame:GetParent()
        end

        local menu = {}

        -- 不能私聊自己
        if self.playerData.name ~= UnitName("player") then
            table.insert(menu, {
                text = "私聊 " .. self.playerData.name,
                func = function()
                    -- 切到我们的 IM 聊天记录 Tab，设置私聊对象
                    if ns.ChatManager then
                        ns.ChatManager.lastReceivedFrom = self.playerData.name
                    end
                    if myActivityFrame and myActivityFrame.SwitchToTab then
                        myActivityFrame.currentTab = nil -- 强制刷新
                        myActivityFrame:SwitchToTab("chat")
                        myActivityFrame:UpdateWhisperTarget()
                        if myActivityFrame.chatEditBox then
                            myActivityFrame.chatEditBox:SetFocus()
                        end
                    end
                end,
                notCheckable = true
            })
        end

        table.insert(menu, {
            text = "查看装备",
            func = function()
                -- 使用 playerName 而非 unit API，避免 "未知单位" 错误
                local playerName = self.playerData.name
                local unit = nil

                -- 尝试获取有效的 unit ID
                if UnitExists(playerName) then
                    unit = playerName
                elseif UnitExists("target") and UnitName("target") == playerName then
                    unit = "target"
                else
                    -- 在队伍/团队中搜索
                    if IsInRaid() then
                        for i = 1, 40 do
                            local raidUnit = "raid" .. i
                            if UnitExists(raidUnit) and UnitName(raidUnit) == playerName then
                                unit = raidUnit
                                break
                            end
                        end
                    elseif IsInGroup() then
                        for i = 1, 4 do
                            local partyUnit = "party" .. i
                            if UnitExists(partyUnit) and UnitName(partyUnit) == playerName then
                                unit = partyUnit
                                break
                            end
                        end
                    end
                end

                if unit and CanInspect(unit) then
                    InspectUnit(unit)
                else
                    ns.Addon:Print("无法检视该玩家（不在附近或无法检视）")
                end
            end,
            notCheckable = true
        })

        -- 只有团长可以踢出队伍
        if UnitIsGroupLeader("player") and self.playerData.name ~= UnitName("player") then
            table.insert(menu, {
                text = "移出队伍",
                func = function()
                    UninviteUnit(self.playerData.name)
                end,
                notCheckable = true
            })
        end

        -- 创建并显示菜单
        local menuFrame = CreateFrame("Frame", "HeroicPlayerContextMenu", UIParent, "UIDropDownMenuTemplate")
        UIDropDownMenu_Initialize(menuFrame, function(self, level)
            for _, item in ipairs(menu) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = item.text
                info.func = item.func
                info.notCheckable = item.notCheckable
                UIDropDownMenu_AddButton(info, level)
            end
        end, "MENU")

        -- 在鼠标位置显示菜单
        ToggleDropDownMenu(1, nil, menuFrame, "cursor", 0, 0)
    end

    return button
end

function HeroicMyActivityFrame:GetOrCreateParticipantButton(index)
    if not self.participantButtons[index] then
        self.participantButtons[index] = self:CreateParticipantButton(index)
    end
    return self.participantButtons[index]
end

function HeroicMyActivityFrame:UpdateParticipantButton(button, playerData)
    if not button or not playerData then
        return
    end

    button.playerData = playerData

    -- 设置职业图标（使用 CLASS_ICON_TCOORDS sprite sheet，兼容所有职业包括死亡骑士）
    if playerData.classFileName then
        local classIconCoords = CLASS_ICON_TCOORDS[playerData.classFileName]
        if classIconCoords then
            button.classIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
            button.classIcon:SetTexCoord(unpack(classIconCoords))
        else
            button.classIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
            button.classIcon:SetTexCoord(0, 1, 0, 1)
        end

        -- 设置职业颜色
        local classColor = RAID_CLASS_COLORS[playerData.classFileName]
        if classColor then
            button.playerName:SetTextColor(classColor.r, classColor.g, classColor.b, 1)
        end
    end

    -- 设置专精图标（如果有专精信息）
    if playerData.specIcon then
        button.specIcon:SetTexture(playerData.specIcon)
        button.specIcon:Show()
    else
        button.specIcon:Hide()
    end

    -- 设置玩家姓名
    button.playerName:SetText(playerData.name or "未知玩家")


    -- 设置星团长信息
    local leaderText = ""
    if playerData.regimentLevel and playerData.regimentLevel > 0 then
        local levelIcon = certificationTextures[playerData.regimentLevel]
        if levelIcon then
            leaderText = levelIcon .. " 星团长"
        else
            leaderText = "★" .. playerData.regimentLevel .. " 星团长"
        end
    else
        leaderText = "普通玩家"
    end
    button.leaderInfo:SetText(leaderText)

    button:Show()
end

function HeroicMyActivityFrame:RefreshData()
    -- 获取当前团队信息
    local myActivityData = self:GetMyActivityData()

    -- 更新管理活动按钮状态
    if myActivityData and myActivityData.hasActivity then
        -- 有活动时，检查是否是创建者或队长
        if self.manageButton then
            if myActivityData.isCreator or UnitIsGroupLeader("player") then
                self.manageButton:Enable()
                self.manageButton:SetAlpha(1)
            else
                -- 非创建者且非队长，禁用管理按钮
                self.manageButton:Disable()
                self.manageButton:SetAlpha(0.5)
            end
        end
        -- 更新活动信息（紧凑标题行）
        self.activityInfo:SetText(": " .. (myActivityData.activityName or "未知活动"))
        self.activityInfo:SetTextColor(1, 1, 1, 1)

        -- 更新参与者列表
        local participants = myActivityData.participants or {}
        local buttonCount = math.max(#participants, 1)

        -- 隐藏所有现有按钮
        for i, button in pairs(self.participantButtons) do
            button:Hide()
        end

        if #participants > 0 then
            -- 显示参与者
            for i, playerData in ipairs(participants) do
                local button = self:GetOrCreateParticipantButton(i)
                self:UpdateParticipantButton(button, playerData)
            end

            -- 调整滚动内容高度，两列布局按行数计算
            local rowCount = math.ceil(buttonCount / 2)  -- 两列，所以行数是参与者数除以2向上取整
            local contentHeight = math.max(rowCount * 53 + 20, self.scrollFrame:GetHeight())  -- 53是行间距，20是额外的边距
            self.scrollChild:SetHeight(contentHeight)
            self.scrollChild:SetWidth(self.scrollFrame:GetWidth())
        else
            -- 没有参与者时显示提示
            local button = self:GetOrCreateParticipantButton(1)
            button:Show()
            button.playerName:SetText("暂无参与者")
            button.playerName:SetTextColor(0.7, 0.7, 0.7, 1)
            button.leaderInfo:SetText("")
            button.classIcon:SetTexture(nil)
            button.specIcon:Hide()
            button.playerData = nil
        end
    else
        -- 没有活动时，按钮变灰不可点击
        if self.manageButton then
            self.manageButton:Disable()
            self.manageButton:SetAlpha(0.5)
        end
        -- 没有活动时显示提示
        self.activityInfo:SetText(": 当前没有活动或不是团长")
        self.activityInfo:SetTextColor(0.7, 0.7, 0.7, 1)

        -- 隐藏所有参与者按钮
        for i, button in pairs(self.participantButtons) do
            button:Hide()
        end
    end
end

function HeroicMyActivityFrame:GetMyActivityData()
    local groupSize = GetNumGroupMembers()
    local isInGroup = groupSize > 0

    -- 检查是否有创建的活动（从ActivityManager）
    local hasCreatedActivity = false
    if ns.ActivityManager and ns.ActivityManager.currentPlayerActivity then
        -- 进一步检查活动是否真的有效（不是过期的缓存数据）
        local activity = ns.ActivityManager.currentPlayerActivity
        if activity and not activity:IsExpired() then
            hasCreatedActivity = true
        else
            -- 如果活动已过期，清理缓存
            ns.ActivityManager.currentPlayerActivity = nil
            ns.ActivityManager:DeleteSavedActivity(UnitName("player"))
        end
    end

    -- 如果没有团队且没有创建活动，则返回nil
    if not isInGroup and not hasCreatedActivity then
        return nil
    end

    local data = {
        hasActivity = true,
        activityName = "25人英雄团本", -- 默认值，稍后会被替换
        memberCount = math.max(groupSize, 1), -- 至少显示1人（自己）
        participants = {},
        isCreator = hasCreatedActivity, -- 标记当前玩家是否是活动创建者
    }

    -- 获取实际创建的活动名称
    if hasCreatedActivity and ns.ActivityManager.currentPlayerActivity then
        local activity = ns.ActivityManager.currentPlayerActivity
        local raidData = activity:GetRaidData()

        if raidData then
            local raidName = raidData.name or "未知团本"
            -- 格式：熔火之心（1/25人）
            data.activityName = string.format("%s（%d/%d人）",
                raidName,
                activity:GetMemberCount() or 0,
                activity.maxMembers or 25)
        end
    elseif isInGroup and not hasCreatedActivity then
        -- 非创建者：尝试从 receivedActivities 或 activities 中匹配队长的活动
        local leaderName = nil
        if IsInRaid() then
            for i = 1, GetNumGroupMembers() do
                local name, rank = GetRaidRosterInfo(i)
                if rank == 2 then -- 队长
                    leaderName = name
                    break
                end
            end
        else
            -- 小队中，检查队长
            if UnitIsGroupLeader("party1") then
                leaderName = UnitName("party1")
            elseif UnitIsGroupLeader("player") then
                leaderName = UnitName("player")
            else
                for i = 1, 4 do
                    local unit = "party" .. i
                    if UnitExists(unit) and UnitIsGroupLeader(unit) then
                        leaderName = UnitName(unit)
                        break
                    end
                end
            end
        end

        -- 尝试从队长的活动中获取活动名称
        local matchedActivity = nil
        if leaderName then
            -- 从 ActivityManager.activities 中查找
            if ns.ActivityManager and ns.ActivityManager.activities then
                for _, activity in pairs(ns.ActivityManager.activities) do
                    if activity.leaderName == leaderName then
                        matchedActivity = activity
                        break
                    end
                end
            end
            -- 从 ChatManager.receivedActivities 中查找
            if not matchedActivity and ns.ActivityManager and ns.ActivityManager.chatManager then
                for _, activity in pairs(ns.ActivityManager.chatManager.receivedActivities) do
                    if activity.leaderName == leaderName then
                        matchedActivity = activity
                        break
                    end
                end
            end
        end

        if matchedActivity then
            local raidData = matchedActivity:GetRaidData()
            if raidData then
                local raidName = raidData.name or "未知团本"
                data.activityName = string.format("%s（%d人）", raidName, groupSize)
            else
                data.activityName = string.format("组队活动（%d人）", groupSize)
            end
        else
            data.activityName = string.format("组队活动（%d人）", groupSize)
        end
    end

    -- 如果有团队，获取团队成员信息
    if isInGroup then
        local maxMembers = IsInRaid() and GetNumGroupMembers() or GetNumSubgroupMembers()
        local unitPrefix = IsInRaid() and "raid" or "party"

        -- 获取团队成员信息
        for i = 1, maxMembers do
            local unit = unitPrefix .. i
            if UnitExists(unit) then
                local name = UnitName(unit)
                local class, classFileName = UnitClass(unit)
                local level = UnitLevel(unit)
                local guild = GetGuildInfo(unit)

                local playerData = {
                    name = name,
                    class = class,
                    classFileName = classFileName,
                    level = level,
                    guild = guild,
                    itemLevel = self:GetPlayerItemLevel(unit),
                    regimentLevel = self:GetPlayerRegimentLevel(name),
                    specIcon = self:GetPlayerSpecIcon(unit)
                }

                table.insert(data.participants, playerData)
            end
        end

        -- 如果是小队，也检查玩家自己
        if not IsInRaid() then
            local name = UnitName("player")
            local class, classFileName = UnitClass("player")
            local level = UnitLevel("player")
            local guild = GetGuildInfo("player")

            local playerData = {
                name = name,
                class = class,
                classFileName = classFileName,
                level = level,
                guild = guild,
                itemLevel = self:GetPlayerItemLevel("player"),
                regimentLevel = self:GetPlayerRegimentLevel(name),
                specIcon = self:GetPlayerSpecIcon("player")
            }

            table.insert(data.participants, 1, playerData) -- 把自己放在第一位
        end
    else
        local name = UnitName("player")
        local class, classFileName = UnitClass("player")
        local level = UnitLevel("player")
        local guild = GetGuildInfo("player")

        local playerData = {
            name = name,
            class = class,
            classFileName = classFileName,
            level = level,
            guild = guild,
            itemLevel = self:GetPlayerItemLevel("player"),
            regimentLevel = self:GetPlayerRegimentLevel(name),
            specIcon = self:GetPlayerSpecIcon("player")
        }

        table.insert(data.participants, playerData)
    end

    return data
end

function HeroicMyActivityFrame:GetPlayerItemLevel(unit)
    if unit == "player" then
        -- 获取玩家自己的装等
        -- 优先使用 GetAverageItemLevel（如果可用）
        if GetAverageItemLevel then
            local avgItemLevel, avgItemLevelEquipped = GetAverageItemLevel()
            if avgItemLevelEquipped and avgItemLevelEquipped > 0 then
                return math.floor(avgItemLevelEquipped)
            elseif avgItemLevel and avgItemLevel > 0 then
                return math.floor(avgItemLevel)
            end
        end

        -- 备用方案：手动计算装等
        local totalItemLevel = 0
        local itemCount = 0
        local slots = {
            1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
        }

        for _, slot in ipairs(slots) do
            local itemLink = GetInventoryItemLink("player", slot)
            if itemLink then
                local itemLevel = GetDetailedItemLevelInfo and GetDetailedItemLevelInfo(itemLink)
                if not itemLevel then
                    -- 尝试从 GetItemInfo 获取
                    local _, _, _, iLevel = GetItemInfo(itemLink)
                    itemLevel = iLevel
                end
                if itemLevel and itemLevel > 0 then
                    totalItemLevel = totalItemLevel + itemLevel
                    itemCount = itemCount + 1
                end
            end
        end

        if itemCount > 0 then
            return math.floor(totalItemLevel / itemCount)
        end

        return nil
    else
        -- 对于队友，尝试从缓存中获取装等
        local playerName = UnitName(unit)
        if playerName and ns.ChatManager then
            local cachedInfo = ns.ChatManager:GetCachedMemberInfo(playerName)
            if cachedInfo and cachedInfo.itemLevel and cachedInfo.itemLevel > 0 then
                return math.floor(cachedInfo.itemLevel)
            end
        end
        return nil
    end
end



        function HeroicMyActivityFrame:GetPlayerRegimentLevel(playerName)
            return ns.MeetingHornAPI:GetPlayerRegimentLevel(playerName)
end

function HeroicMyActivityFrame:GetPlayerSpecIcon(unit)
    -- 获取专精图标
    local specID = GetInspectSpecialization(unit)
    if specID and specID > 0 then
        local _, _, _, icon = GetSpecializationInfoByID(specID)
        return icon
    end
    return nil
end

function HeroicMyActivityFrame:OnShow()
    self._needsRefreshOnShow = false
    self._needsTeamChatRefresh = false

    -- 当页面显示时刷新参与者数据
    self:RefreshData()

    -- 始终根据当前 Tab 刷新聊天数据（解决首次进入不显示的问题）
    if self.currentTab == "chat" then
        self:RefreshChatData()
        self:ScrollToBottom(self.chatScrollFrame)
        self:UpdateWhisperTarget()
    elseif self.currentTab == "teamchat" then
        self:RefreshTeamChatData()
        self:ScrollToBottom(self.teamChatScrollFrame)
        self:UpdateWhisperTarget()
    end

    -- 注册事件以自动更新
    self:RegisterEvent("GROUP_ROSTER_UPDATE")
    self:RegisterEvent("INSPECT_READY")
    self:SetScript("OnEvent", self.OnEvent)

    -- 聊天记录事件已统一在 CreateUI() 的 ActivityManager 回调中处理
end

function HeroicMyActivityFrame:OnHide()
    -- 取消注册事件
    self:UnregisterEvent("GROUP_ROSTER_UPDATE")
    self:UnregisterEvent("INSPECT_READY")
    self:SetScript("OnEvent", nil)
end

function HeroicMyActivityFrame:OnEvent(event, ...)
    if event == "GROUP_ROSTER_UPDATE" then
        self:RefreshData()
    elseif event == "INSPECT_READY" then
        -- 装备检查完成，更新显示
        C_Timer.After(0.5, function()
            self:RefreshData()
        end)
    end
end

function HeroicMyActivityFrame:RefreshParticipantData()
    -- 刷新参与者数据（已有的 RefreshData 方法）
    self:RefreshData()
end

function HeroicMyActivityFrame:RefreshChatData()
    -- 获取聊天记录
    local records = self:GetChatRecords()

    -- 清理旧的显示元素
    for _, element in ipairs(self.chatElements) do
        element:Hide()
    end
    self.chatElements = {}

    -- 显示/隐藏无记录提示
    if #records == 0 then
        self.noChatRecordsLabel:Show()
        self.chatScrollChild:SetHeight(1)
        return
    else
        self.noChatRecordsLabel:Hide()
    end

    -- 设置 scrollChild 宽度（匹配 scrollFrame 可见宽度）
    local scrollWidth = self.chatScrollFrame:GetWidth()
    self.chatScrollChild:SetWidth(scrollWidth)

    -- 创建聊天记录显示元素
    local yOffset = 0
    for i, record in ipairs(records) do
        local element = self:CreateChatElement(record, i)
        element:SetPoint("TOPLEFT", 0, -yOffset)
        table.insert(self.chatElements, element)
        yOffset = yOffset + 50 -- 每个记录高度50
    end

    -- 设置滚动高度
    self.chatScrollChild:SetHeight(math.max(yOffset, self.chatScrollFrame:GetHeight()))

    -- 自动滚底
    self:ScrollToBottom(self.chatScrollFrame)
end

-- ========== 团队聊天室视图 ==========

function HeroicMyActivityFrame:RefreshTeamChatData()
    -- 获取团队聊天记录
    local records = {}
    if ns.ChatManager then
        records = ns.ChatManager:GetTeamChatRecords()
    end

    -- 清理旧的显示元素
    if not self.teamChatElements then self.teamChatElements = {} end
    for _, element in ipairs(self.teamChatElements) do
        element:Hide()
    end
    self.teamChatElements = {}

    -- 显示/隐藏无记录提示
    if #records == 0 then
        self.noChatRecordsLabel:Show()
        self.teamChatScrollChild:SetHeight(1)
        return
    else
        self.noChatRecordsLabel:Hide()
    end

    -- 设置 scrollChild 宽度
    local scrollWidth = self.teamChatScrollFrame:GetWidth()
    self.teamChatScrollChild:SetWidth(scrollWidth)

    -- 创建消息元素
    local yOffset = 0
    for i, record in ipairs(records) do
        local element = self:CreateTeamChatElement(record, i)
        element:SetPoint("TOPLEFT", 0, -yOffset)
        table.insert(self.teamChatElements, element)
        yOffset = yOffset + 50
    end

    -- 设置滚动高度
    self.teamChatScrollChild:SetHeight(math.max(yOffset, self.teamChatScrollFrame:GetHeight()))

    -- 自动滚底
    self:ScrollToBottom(self.teamChatScrollFrame)
end

function HeroicMyActivityFrame:CreateTeamChatElement(record, index)
    local element = CreateFrame("Frame", nil, self.teamChatScrollChild)
    element:SetSize(self.teamChatScrollChild:GetWidth() - 10, 48)

    -- 背景：圆角气泡
    local isSelf = (record.direction == "sent")
    element.bg = CreateBubbleBg(element, element:GetWidth(), element:GetHeight(), isSelf)
    element.bg:SetAllPoints()

    local senderClass = isSelf and select(2, UnitClass("player")) or record.senderClass
    if not senderClass and not isSelf and ns.ChatManager then
        local gc = ns.ChatManager:GetGroupMemberClass(record.playerName)
        if gc then senderClass = gc; record.senderClass = gc end
    end
    local capturedSelf = self
    return CreateChatBubbleElement(self.teamChatScrollChild, record, {
        isSelf      = isSelf,
        senderName  = record.playerName or "未知",
        senderClass = senderClass,
        level       = record.senderLevel,
        itemLevel   = record.senderItemLevel,
        replyLabel  = record.replyToName and ("→ 回复 @" .. record.replyToName) or nil,
        scrollChild = self.teamChatScrollChild,
        allElements = self.teamChatElements,
        chatSelf    = self,
        onRightClick = function(r)
            capturedSelf:ShowTeamChatContextMenu(r)
        end,
    })
end

function HeroicMyActivityFrame:ShowTeamChatContextMenu(record)
    if not record or not record.playerName then return end

    local playerName = record.playerName
    local coloredName = playerName
    local displayClass = record.senderClass
    if record.direction == "sent" then
        displayClass = select(2, UnitClass("player"))
    end
    if displayClass then
        local classColor = RAID_CLASS_COLORS[displayClass]
        if classColor then
            coloredName = string.format("|cff%02x%02x%02x%s|r",
                classColor.r * 255, classColor.g * 255, classColor.b * 255, playerName)
        end
    end

    local menu = {
        {
            text = "回复 " .. coloredName,
            func = function()
                self:SetReplyTarget(playerName)
            end,
            notCheckable = true
        },
    }

    -- 不能密语/邀请自己
    if playerName ~= UnitName("player") then
        table.insert(menu, {
            text = "密语 " .. coloredName,
            func = function()
                -- 切到"私聊频道"Tab 并设置私聊对象
                if ns.ChatManager then
                    ns.ChatManager.lastReceivedFrom = playerName
                end
                self.currentTab = nil -- 强制刷新（即使当前已在 chat tab）
                self:SwitchToTab("chat")
                self:UpdateWhisperTarget()
                if self.chatEditBox then
                    self.chatEditBox:SetFocus()
                end
            end,
            notCheckable = true
        })
        table.insert(menu, {
            text = "邀请加入队伍",
            func = function()
                InviteUnit(playerName)
            end,
            notCheckable = true
        })
    end

    table.insert(menu, {
        text = "取消",
        func = function() end,
        notCheckable = true
    })

    local menuFrame = CreateFrame("Frame", "HeroicTeamChatContextMenu", UIParent, "UIDropDownMenuTemplate")
    UIDropDownMenu_Initialize(menuFrame, function(_, level)
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

function HeroicMyActivityFrame:CreateChatElement(record, index)
    local element = CreateFrame("Frame", nil, self.chatScrollChild)
    element:SetSize(self.chatScrollChild:GetWidth() - 10, 48)

    -- 背景：圆角气泡
    local isSelf = (record.direction == "sent")
    element.bg = CreateBubbleBg(element, element:GetWidth(), element:GetHeight(), isSelf)
    element.bg:SetAllPoints()

    -- 补全收到消息的职业/等级信息
    if not isSelf and ns.ChatManager then
        if not record.playerClass or not record.playerLevel or record.playerLevel == 0 then
            local gc, gl, gi = ns.ChatManager:GetGroupMemberClass(record.playerName)
            if gc then
                record.playerClass = record.playerClass or gc
                if (not record.playerLevel or record.playerLevel == 0) and gl and gl > 0 then record.playerLevel = gl end
                if (not record.itemLevel or record.itemLevel == 0) and gi and gi > 0 then record.itemLevel = gi end
            end
        end
    end
    local senderClass = isSelf and select(2, UnitClass("player")) or record.playerClass
    local senderName  = isSelf and UnitName("player") or (record.playerName or "未知")
    local level       = isSelf and UnitLevel("player") or record.playerLevel
    local itemLevel   = record.itemLevel
    local replyLabel  = (isSelf and record.replyTo) and ("→ " .. record.replyTo) or nil
    local capturedSelf = self
    return CreateChatBubbleElement(self.chatScrollChild, record, {
        isSelf      = isSelf,
        senderName  = senderName,
        senderClass = senderClass,
        level       = level,
        itemLevel   = itemLevel,
        replyLabel  = replyLabel,
        scrollChild = self.chatScrollChild,
        allElements = self.chatElements,
        chatSelf    = self,
        onRightClick = (not isSelf) and function(r)
            capturedSelf:ShowChatContextMenu(r)
        end or nil,
    })
end

function HeroicMyActivityFrame:ShowChatContextMenu(record)
    if not record or not record.playerName then
        return
    end

    local playerName = record.playerName

    -- 使用职业颜色格式化名字
    local coloredName = playerName
    if record.playerClass then
        local classColor = RAID_CLASS_COLORS[record.playerClass]
        if classColor then
            coloredName = string.format("|cff%02x%02x%02x%s|r",
                classColor.r * 255,
                classColor.g * 255,
                classColor.b * 255,
                playerName)
        end
    end

    local menu = {}

    -- 不能对自己密语/邀请/加好友/忽略
    if playerName ~= UnitName("player") then
        table.insert(menu, {
            text = "密语 " .. coloredName,
            func = function()
                -- 切到我们的 IM，设置私聊对象
                if ns.ChatManager then
                    ns.ChatManager.lastReceivedFrom = playerName
                end
                self.currentTab = nil -- 强制刷新
                self:SwitchToTab("chat")
                self:UpdateWhisperTarget()
                if self.chatEditBox then
                    self.chatEditBox:SetFocus()
                end
            end,
            notCheckable = true
        })
        table.insert(menu, {
            text = "邀请加入队伍",
            func = function()
                InviteUnit(playerName)
            end,
            notCheckable = true
        })
        table.insert(menu, {
            text = "添加好友",
            func = function()
                AddFriend(playerName)
            end,
            notCheckable = true
        })
        table.insert(menu, {
            text = "忽略玩家",
            func = function()
                AddIgnore(playerName)
            end,
            notCheckable = true
        })
    end

    table.insert(menu, {
        text = "取消",
        func = function() end,
        notCheckable = true
    })

    local menuFrame = CreateFrame("Frame", "HeroicChatRecordContextMenu", UIParent, "UIDropDownMenuTemplate")
    UIDropDownMenu_Initialize(menuFrame, function(_, level)
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

function HeroicMyActivityFrame:GetChatRecords()
    -- 从 ActivityManager 获取聊天记录
    if ns.ActivityManager and ns.ActivityManager.GetChatRecords then
        return ns.ActivityManager:GetChatRecords()
    end

    -- 返回模拟数据用于测试
    return {
        {
            playerName = "玩家1",
            playerClass = "WARRIOR",
            playerLevel = 85,
            itemLevel = 285,
            message = "请收我，装等285",
            timestamp = time() - 300,
            direction = "received"
        },
        {
            playerName = "玩家2",
            playerClass = "MAGE",
            playerLevel = 85,
            itemLevel = 270,
            message = "有位置吗？",
            timestamp = time() - 200,
            direction = "received"
        },
        {
            playerName = UnitName("player"),
            playerClass = select(2, UnitClass("player")),
            playerLevel = UnitLevel("player"),
            message = "欢迎加入",
            timestamp = time() - 100,
            direction = "sent"
        }
    }
end

function HeroicMyActivityFrame:ShowChatRecords()
    -- 切换到聊天记录标签页
    self:SwitchToTab("chat")
end

function HeroicMyActivityFrame:ShowManageMenu(button)
    -- 显示管理活动菜单 (用于标签按钮)
    self:ManageActivity()
end

function HeroicMyActivityFrame:ManageActivity()
    -- 管理活动功能
    local activity = ns.ActivityManager:GetPlayerActivity()
    if activity then
        -- 显示活动管理菜单
        local menu = {
            {
                text = "编辑活动",
                func = function()
                    -- 切换到创建活动页面进行编辑，并跳转到"创建团本"子标签
                    if ns.MainFrame then
                        ns.MainFrame:SwitchTab(1)
                        C_Timer.After(0.1, function()
                            if ns.MainFrame and ns.MainFrame.creatorFrame then
                                ns.MainFrame.creatorFrame:SwitchToRole("leader")
                            end
                        end)
                    end
                end,
                notCheckable = true
            },
            {
                text = "关闭活动",
                func = function()
                    StaticPopup_Show("HEROIC_CLOSE_ACTIVITY_CONFIRM")
                end,
                notCheckable = true
            },
            {
                text = "刷新广播",
                func = function()
                    if ns.ActivityManager.chatManager then
                        ns.ActivityManager.chatManager:BroadcastCurrentActivity()
                        ns.Addon:Print("活动已重新广播")
                    end
                end,
                notCheckable = true
            }
        }

        -- 使用 WoW 的菜单系统替代 EasyMenu
        local menuFrame = CreateFrame("Frame", "HeroicActivityManageMenu", UIParent, "UIDropDownMenuTemplate")
        UIDropDownMenu_Initialize(menuFrame, function(self, level)
            for _, item in ipairs(menu) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = item.text
                info.func = item.func
                info.notCheckable = item.notCheckable
                UIDropDownMenu_AddButton(info, level)
            end
        end, "MENU")

        -- 在鼠标位置显示菜单
        ToggleDropDownMenu(1, nil, menuFrame, "cursor", 0, 0)
    else
        ns.Addon:Print("当前没有正在进行的活动")
    end
end

-- 创建关闭活动确认对话框
StaticPopupDialogs["HEROIC_CLOSE_ACTIVITY_CONFIRM"] = {
    text = "确定要关闭当前活动吗？",
    button1 = "确定",
    button2 = "取消",
    OnAccept = function()
        local success, message = ns.ActivityManager:ClosePlayerActivity()
        if success then
            ns.Addon:Print("活动已关闭")
            -- 刷新我的活动页面
            if ns.MainFrame and ns.MainFrame.myActivityFrame then
                ns.MainFrame.myActivityFrame:RefreshData()
            end
        else
            ns.Addon:Print("关闭活动失败: " .. (message or "未知错误"))
        end
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

-- 注册到命名空间
ns.UI = ns.UI or {}
ns.UI.MyActivityFrame = HeroicMyActivityFrame

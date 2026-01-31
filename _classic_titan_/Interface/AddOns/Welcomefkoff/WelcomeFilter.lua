local addonName = ...

-- 插件名称和本地化
local WelcomeFilterLocal = (GetLocale() == "zhCN" or GetLocale() == "zhTW") and "欢迎文字快滚" or "WelcomeFilter"

-- 默认关键字列表
local DEFAULT_KEYWORDS = {
    "^%s*欢迎",
    "巅峰",
    "强者"
}

-- 全局配置变量（会自动保存）
WelcomeFilterDB = WelcomeFilterDB or {}
WelcomeFilterDB.keywords = WelcomeFilterDB.keywords or {}

-- 确保默认关键字存在
local function EnsureDefaultKeywords()
    if #WelcomeFilterDB.keywords == 0 then
        for _, keyword in ipairs(DEFAULT_KEYWORDS) do
            tinsert(WelcomeFilterDB.keywords, keyword)
        end
    end
end

-- 过滤函数：返回 true 表示这条信息被拦截，不会显示
local function WelcomeSystemFilter(self, event, msg, ...)
    if type(msg) == "string" then
        local keywords = WelcomeFilterDB.keywords
        for _, keyword in ipairs(keywords) do
            if keyword and keyword ~= "" then
                -- 检查是否为以关键字开头（带^符号）
                if keyword:sub(1, 1) == "^" then
                    if msg:match(keyword) then
                        return true
                    end
                else
                    -- 否则检查是否包含关键字
                    if msg:find(keyword, 1, true) then
                        return true
                    end
                end
            end
        end
    end
    -- 不返回 / 返回 nil = 不处理，照常显示
end

-- 注册过滤事件
local function RegisterFilters()
    -- 系统黄字一般走这两个事件
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", WelcomeSystemFilter)
    ChatFrame_AddMessageEventFilter("UI_INFO_MESSAGE", WelcomeSystemFilter)
end

-- 创建选项界面
local function CreateOptionsPanel()
    local panel = CreateFrame("Frame", WelcomeFilterLocal, InterfaceOptionsFramePanelContainer)
    panel.name = WelcomeFilterLocal
    
    -- 添加到界面选项
    if InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    else
        local category = Settings.RegisterCanvasLayoutCategory(panel, WelcomeFilterLocal)
        Settings.RegisterAddOnCategory(category)
        panel.categoryID = category:GetID()
    end

    local content = CreateFrame("Frame", nil, panel)
    content:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, -16)
    content:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -16, 16)

    -- 标题
    local title = content:CreateFontString(nil, "ARTWORK", "GameFontNormalHuge")
    title:SetPoint("TOP", 0, 0)
    title:SetText(WelcomeFilterLocal)

    -- 副标题
    local subtitle = content:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    subtitle:SetPoint("TOPLEFT", 0, -40)
    subtitle:SetJustifyH("LEFT")
    subtitle:SetText("自定义要屏蔽的系统消息关键字")

    -- 说明文字
    local description = content:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    description:SetPoint("TOPLEFT", 0, -60)
    description:SetJustifyH("LEFT")
    description:SetWidth(500)
    description:SetText("在下方输入框中添加关键字，所有包含这些关键字的|cff00ff00系统消息|r将被屏蔽。\n\n" ..
        "注意：如果关键字以^符号开头，则只会匹配以该关键字开头的消息（支持正则表达式）。")

    -- 添加关键字的输入框
    local keywordInput = CreateFrame("EditBox", nil, content, "InputBoxTemplate")
    keywordInput:SetPoint("TOPLEFT", 0, -120)
    keywordInput:SetWidth(300)
    keywordInput:SetHeight(24)
    keywordInput:SetAutoFocus(false)
    keywordInput:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)
    keywordInput:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)

    -- 关键字列表框引用
    local listContent
    local listFrame

    -- 添加关键字按钮
    local addButton = CreateFrame("Button", nil, content, "UIPanelButtonTemplate")
    addButton:SetPoint("LEFT", keywordInput, "RIGHT", 10, 0)
    addButton:SetWidth(100)
    addButton:SetHeight(24)
    addButton:SetText("添加关键字")
    addButton:SetScript("OnClick", function()
        local keyword = keywordInput:GetText()
        if keyword and keyword ~= "" then
            tinsert(WelcomeFilterDB.keywords, keyword)
            keywordInput:SetText("")
            UpdateKeywordList()
        end
    end)

    -- 关键字列表标题
    local listTitle = content:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    listTitle:SetPoint("TOPLEFT", 0, -160)
    listTitle:SetText("当前屏蔽的关键字：")

    -- 关键字列表框
    listFrame = CreateFrame("ScrollFrame", nil, content, "UIPanelScrollFrameTemplate")
    listFrame:SetPoint("TOPLEFT", 0, -180)
    listFrame:SetWidth(400)
    listFrame:SetHeight(200)

    listContent = CreateFrame("Frame", nil, listFrame)
    listContent:SetWidth(400 - 30) -- 减去滚动条宽度
    listContent:SetHeight(1)
    listFrame:SetScrollChild(listContent)

    -- 更新关键字列表的函数
    function UpdateKeywordList()
        -- 清除现有列表项
        for _, child in ipairs({listContent:GetChildren()}) do
            child:Hide()
            child:SetParent(nil)
        end

        local keywords = WelcomeFilterDB.keywords
        local yOffset = 0

        -- 创建新的列表项
        for i, keyword in ipairs(keywords) do
            local itemFrame = CreateFrame("Frame", nil, listContent)
            itemFrame:SetWidth(listContent:GetWidth())
            itemFrame:SetHeight(24)
            itemFrame:SetPoint("TOPLEFT", 0, yOffset)

            -- 关键字文本
            local keywordText = itemFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
            keywordText:SetPoint("LEFT", 10, 0)
            keywordText:SetText(keyword)
            keywordText:SetJustifyH("LEFT")

            -- 删除按钮
            local deleteButton = CreateFrame("Button", nil, itemFrame, "UIPanelButtonTemplate")
            deleteButton:SetPoint("RIGHT", -10, 0)
            deleteButton:SetWidth(80)
            deleteButton:SetHeight(20)
            deleteButton:SetText("删除")
            deleteButton:SetScript("OnClick", function()
                tremove(WelcomeFilterDB.keywords, i)
                UpdateKeywordList()
            end)

            yOffset = yOffset - 26
        end

        -- 更新列表高度
        listContent:SetHeight(math.abs(yOffset) + 1)
    end

    -- 重置为默认按钮
    local resetButton = CreateFrame("Button", nil, content, "UIPanelButtonTemplate")
    resetButton:SetPoint("BOTTOMLEFT", 0, 10)
    resetButton:SetWidth(120)
    resetButton:SetHeight(24)
    resetButton:SetText("重置为默认")
    resetButton:SetScript("OnClick", function()
        -- 清空当前关键字并添加默认关键字
        WelcomeFilterDB.keywords = {}
        for _, keyword in ipairs(DEFAULT_KEYWORDS) do
            tinsert(WelcomeFilterDB.keywords, keyword)
        end
        UpdateKeywordList()
    end)

    -- 初始更新列表
    UpdateKeywordList()

    -- 在面板显示时更新列表
    panel:SetScript("OnShow", function()
        UpdateKeywordList()
    end)
end

-- 初始化插件
local function Initialize()
    EnsureDefaultKeywords()
    RegisterFilters()
    CreateOptionsPanel()
end

-- 运行初始化
Initialize()

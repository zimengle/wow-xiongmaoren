-- PlayerSquareFrame.lua
-- 玩家广场界面，显示寻找队伍的玩家

---@type MeetingHornHeroicNS
local ns = select(2, ...)
local L = ns.L or {}

---@class HeroicPlayerSquareFrame: Frame
local HeroicPlayerSquareFrame = {}

-- 专精信息（包含所有职业专精）
local SPEC_DATA = {
    -- 战士
    {id = 1, class = "WARRIOR", name = "武器", icon = 132355, role = "tank"},
    {id = 2, class = "WARRIOR", name = "狂怒", icon = 132347, role = "dps"},
    {id = 3, class = "WARRIOR", name = "防护", icon = 132341, role = "tank"},
    
    -- 圣骑士
    {id = 4, class = "PALADIN", name = "神圣", icon = 135920, role = "healer"},
    {id = 5, class = "PALADIN", name = "防护", icon = 135893, role = "tank"},
    {id = 6, class = "PALADIN", name = "惩戒", icon = 135873, role = "dps"},
    
    -- 猎人
    {id = 7, class = "HUNTER", name = "野兽控制", icon = 132164, role = "dps"},
    {id = 8, class = "HUNTER", name = "射击", icon = 132222, role = "dps"},
    {id = 9, class = "HUNTER", name = "生存", icon = 132215, role = "dps"},
    
    -- 盗贼
    {id = 10, class = "ROGUE", name = "刺杀", icon = 132292, role = "dps"},
    {id = 11, class = "ROGUE", name = "战斗", icon = 132090, role = "dps"},
    {id = 12, class = "ROGUE", name = "敏锐", icon = 132320, role = "dps"},
    
    -- 牧师
    {id = 13, class = "PRIEST", name = "戒律", icon = 135940, role = "healer"},
    {id = 14, class = "PRIEST", name = "神圣", icon = 135920, role = "healer"},
    {id = 15, class = "PRIEST", name = "暗影", icon = 136207, role = "dps"},
    
    -- 死亡骑士
    {id = 16, class = "DEATHKNIGHT", name = "鲜血", icon = 135770, role = "tank"},
    {id = 17, class = "DEATHKNIGHT", name = "冰霜", icon = 135773, role = "dps"},
    {id = 18, class = "DEATHKNIGHT", name = "邪恶", icon = 135775, role = "dps"},
    
    -- 萨满祭司
    {id = 19, class = "SHAMAN", name = "元素", icon = 136048, role = "dps"},
    {id = 20, class = "SHAMAN", name = "增强", icon = 136051, role = "dps"},
    {id = 21, class = "SHAMAN", name = "恢复", icon = 136052, role = "healer"},
    
    -- 法师
    {id = 22, class = "MAGE", name = "奥术", icon = 135932, role = "dps"},
    {id = 23, class = "MAGE", name = "火焰", icon = 135810, role = "dps"},
    {id = 24, class = "MAGE", name = "冰霜", icon = 135846, role = "dps"},
    
    -- 术士
    {id = 25, class = "WARLOCK", name = "痛苦", icon = 136145, role = "dps"},
    {id = 26, class = "WARLOCK", name = "恶魔学识", icon = 136172, role = "dps"},
    {id = 27, class = "WARLOCK", name = "毁灭", icon = 136186, role = "dps"},
    
    -- 德鲁伊
    {id = 28, class = "DRUID", name = "平衡", icon = 136096, role = "dps"},
    {id = 29, class = "DRUID", name = "野性战斗", icon = 132276, role = "dps"},
    {id = 30, class = "DRUID", name = "野性守护", icon = 132276, role = "tank"},
    {id = 31, class = "DRUID", name = "恢复", icon = 136041, role = "healer"}
}

function HeroicPlayerSquareFrame:New(parent)
    local frame = CreateFrame("Frame", "HeroicPlayerSquareFrame", parent)
    frame:SetAllPoints()
    frame:Hide()
    
    -- 绑定方法
    for k, v in pairs(HeroicPlayerSquareFrame) do
        if type(v) == "function" then
            frame[k] = v
        end
    end
    
    frame:CreateUI()
    return frame
end

function HeroicPlayerSquareFrame:CreateUI()
    -- 初始化数据 - 移到最前面
    self.playerButtons = {}
    self.currentFilters = {
        specs = {}, -- 选中的专精ID列表
        roles = {}, -- 选中的角色类型列表
        targetRaidId = nil, -- 目标团本筛选
        minLevel = 80,
        maxLevel = 85
    }

    -- 标题
    local title = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 20, -20)
    title:SetText("个人求组广场")
    title:SetTextColor(1, 0.8, 0, 1)

    -- 创建筛选区域
    self:CreateFilterArea()

    -- 创建功能按钮区域
    self:CreateActionButtons()

    -- 创建玩家列表区域
    self:CreatePlayerList()
    
    -- 注册事件回调，当有新数据时使用节流刷新（200ms 合并多次更新）
    if ns.PlayerSquareManager then
        ns.PlayerSquareManager:RegisterCallback("PLAYER_SQUARE_UPDATED", function()
            self:ScheduleRefresh()
        end)
    end

    self:RefreshData()
end

function HeroicPlayerSquareFrame:CreateFilterArea()
    -- 筛选区域背景
    local filterBg = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
    filterBg:SetPoint("TOPLEFT", 20, -60)
    filterBg:SetPoint("TOPRIGHT", -20, -60)
    filterBg:SetHeight(120)
    self.filterBaseHeight = 120
    self.specTagRowHeight = 26
    filterBg:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    filterBg:SetBackdropColor(0.1, 0.1, 0.1, 0.3)
    filterBg:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)

    self.filterBg = filterBg

    -- 筛选标题
    local filterTitle = filterBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    filterTitle:SetPoint("TOPLEFT", 10, -10)
    filterTitle:SetText("筛选条件")
    filterTitle:SetTextColor(1, 1, 1, 1)

    -- 职业角色筛选
    local roleLabel = filterBg:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    roleLabel:SetPoint("TOPLEFT", 10, -35)
    roleLabel:SetText("职责类型:")
    roleLabel:SetTextColor(1, 1, 1, 1)

    -- 创建角色筛选按钮
    self.roleFilters = {}
    local roleTypes = {
        {key = "tank", name = "坦克", icon = "Interface\\Icons\\Ability_Defend"},
        {key = "healer", name = "治疗", icon = "Interface\\Icons\\Spell_Holy_Heal"},
        {key = "dps", name = "输出", icon = "Interface\\Icons\\Ability_Warrior_WeaponMastery"}
    }

    for i, roleData in ipairs(roleTypes) do
        local roleBtn = self:CreateFilterButton(filterBg, roleData.name, roleData.icon)
        roleBtn:SetPoint("LEFT", roleLabel, "RIGHT", 10 + (i-1) * 80, 0)
        roleBtn.filterType = "role"
        roleBtn.filterKey = roleData.key
        self.roleFilters[roleData.key] = roleBtn
    end

    -- 专精筛选
    local specLabel = filterBg:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    specLabel:SetPoint("TOPLEFT", 10, -65)
    specLabel:SetText("专精筛选:")
    specLabel:SetTextColor(1, 1, 1, 1)

    -- 专精下拉菜单
    self.specDropdown = CreateFrame("Frame", nil, filterBg, "HeroicDropDownMenuTemplate")
    self.specDropdown:SetPoint("LEFT", specLabel, "RIGHT", 10, 0)
    UIDropDownMenu_SetWidth(self.specDropdown, 150)
    UIDropDownMenu_SetText(self.specDropdown, "选择专精")

    local specDropdown = self.specDropdown
    UIDropDownMenu_Initialize(specDropdown, function(dropdown, level)
        if level == 1 then
            -- 显示职业列表
            local classes = {}
            for _, spec in ipairs(SPEC_DATA) do
                if not classes[spec.class] then
                    classes[spec.class] = true
                    local classColor = RAID_CLASS_COLORS[spec.class]
                    local info = UIDropDownMenu_CreateInfo()
                    info.text = LOCALIZED_CLASS_NAMES_MALE[spec.class] or spec.class
                    info.value = spec.class
                    info.hasArrow = true
                    if classColor then
                        info.colorCode = string.format("|cff%02x%02x%02x", classColor.r*255, classColor.g*255, classColor.b*255)
                    end
                    UIDropDownMenu_AddButton(info, level)
                end
            end
        elseif level == 2 then
            -- 显示专精列表
            local selectedClass = UIDROPDOWNMENU_MENU_VALUE
            for _, spec in ipairs(SPEC_DATA) do
                if spec.class == selectedClass then
                    local info = UIDropDownMenu_CreateInfo()
                    info.text = spec.name
                    info.value = spec.id
                    info.func = function()
                        self:ToggleSpecFilter(spec.id)
                        CloseDropDownMenus()
                    end
                    -- 如果已选中，显示勾选标记
                    info.checked = self.currentFilters.specs[spec.id] ~= nil
                    UIDropDownMenu_AddButton(info, level)
                end
            end
        end
    end)

    -- 已选专精标签容器
    self.specTagContainer = CreateFrame("Frame", nil, filterBg)
    self.specTagContainer:SetPoint("TOPLEFT", 10, -90)
    self.specTagContainer:SetPoint("RIGHT", -10, 0)
    self.specTagContainer:SetHeight(1) -- 初始高度，由 UpdateSpecTags 动态调整
    self.specTags = {}

    -- 清除筛选按钮
    local clearBtn = CreateFrame("Button", nil, filterBg, "UIPanelButtonTemplate")
    clearBtn:SetSize(80, 24)
    clearBtn:SetPoint("TOPRIGHT", -10, -35)
    clearBtn:SetText("清除筛选")
    clearBtn:SetScript("OnClick", function()
        self:ClearFilters()
    end)

    -- 刷新按钮
    local refreshBtn = CreateFrame("Button", nil, filterBg, "UIPanelButtonTemplate")
    refreshBtn:SetSize(60, 24)
    refreshBtn:SetPoint("RIGHT", clearBtn, "LEFT", -5, 0)
    refreshBtn:SetText("刷新")
    refreshBtn:SetScript("OnClick", function()
        self:RefreshData()
    end)
end

function HeroicPlayerSquareFrame:CreateFilterButton(parent, text, icon)
    local button = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    button:SetSize(24, 24)

    -- 图标放在复选框右侧
    if icon then
        local iconTexture = button:CreateTexture(nil, "ARTWORK")
        iconTexture:SetSize(16, 16)
        iconTexture:SetPoint("LEFT", button, "RIGHT", 2, 0)
        iconTexture:SetTexture(icon)
        button.icon = iconTexture
    end

    -- 文字放在图标右侧
    local label = button:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    if icon then
        label:SetPoint("LEFT", button, "RIGHT", 20, 0)
    else
        label:SetPoint("LEFT", button, "RIGHT", 2, 0)
    end
    label:SetText(text)
    label:SetTextColor(1, 1, 1, 1)
    button.label = label

    button:SetScript("OnClick", function()
        self:ToggleRoleFilter(button.filterKey)
    end)

    return button
end

function HeroicPlayerSquareFrame:CreateActionButtons()
    -- 功能按钮区域
    local actionFrame = CreateFrame("Frame", nil, self)
    actionFrame:SetPoint("TOPLEFT", self.filterBg, "BOTTOMLEFT", 0, -10)
    actionFrame:SetPoint("TOPRIGHT", self.filterBg, "BOTTOMRIGHT", 0, -10)
    actionFrame:SetHeight(40)

    -- 团本筛选下拉菜单
    local raidFilterLabel = actionFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    raidFilterLabel:SetPoint("LEFT", 10, 0)
    raidFilterLabel:SetText("团本筛选:")
    raidFilterLabel:SetTextColor(1, 1, 1, 1)

    self.raidFilterDropdown = CreateFrame("Frame", nil, actionFrame, "HeroicDropDownMenuTemplate")
    self.raidFilterDropdown:SetPoint("LEFT", raidFilterLabel, "RIGHT", 10, 0)
    UIDropDownMenu_SetWidth(self.raidFilterDropdown, 150)
    UIDropDownMenu_SetText(self.raidFilterDropdown, "所有团本")

    local raidDropdown = self.raidFilterDropdown
    UIDropDownMenu_Initialize(raidDropdown, function(dropdown, level)
        -- 添加"所有团本"选项
        local info = UIDropDownMenu_CreateInfo()
        info.text = "所有团本"
        info.value = nil
        info.func = function()
            UIDropDownMenu_SetSelectedValue(raidDropdown, nil)
            UIDropDownMenu_SetText(raidDropdown, "所有团本")
            CloseDropDownMenus()
            self.currentFilters.targetRaidId = nil
            self:RefreshData()
        end
        info.checked = self.currentFilters.targetRaidId == nil
        UIDropDownMenu_AddButton(info, level)

        -- 添加各个团本选项（按 raidOrder 有序遍历）
        if ns.raidOrder and ns.raidData then
            for _, raidId in ipairs(ns.raidOrder) do
                local raidData = ns.raidData[raidId]
                if raidData then
                    local raidInfo = UIDropDownMenu_CreateInfo()
                    raidInfo.text = raidData.name
                    raidInfo.value = raidId
                    raidInfo.func = function()
                        UIDropDownMenu_SetSelectedValue(raidDropdown, raidId)
                        UIDropDownMenu_SetText(raidDropdown, raidData.name)
                        CloseDropDownMenus()
                        self.currentFilters.targetRaidId = raidId
                        self:RefreshData()
                    end
                    raidInfo.checked = self.currentFilters.targetRaidId == raidId
                    UIDropDownMenu_AddButton(raidInfo, level)
                end
            end
        end
    end)

    -- 发布需求按钮 - 移动到右边
    local publishBtn = CreateFrame("Button", nil, actionFrame, "UIPanelButtonTemplate")
    publishBtn:SetSize(100, 32)
    publishBtn:SetPoint("RIGHT", -10, 0)
    publishBtn:SetText("发布需求")
    publishBtn:SetScript("OnClick", function()
        -- 跳转到创建英雄团本页面，并切换到"团本求组"子标签
        if ns.MainFrame then
            ns.MainFrame:SwitchTab(1) -- 切换到创建英雄团本标签
            -- 等待界面创建完成后切换到"团本求组"子标签
            C_Timer.After(0.1, function()
                if ns.MainFrame and ns.MainFrame.creatorFrame then
                    ns.MainFrame.creatorFrame:SwitchToRole("member")
                end
            end)
        end
    end)
    self.publishBtn = publishBtn

    self.actionFrame = actionFrame
end

function HeroicPlayerSquareFrame:CreatePlayerList()
    -- 玩家列表背景
    local listBg = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
    listBg:SetPoint("TOPLEFT", self.actionFrame, "BOTTOMLEFT", 0, -5)
    listBg:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -20, 20)
    listBg:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    listBg:SetBackdropColor(0, 0, 0, 0.3)
    listBg:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)

    self.listBg = listBg

    -- 玩家列表滚动框架
    local scrollFrame = CreateFrame("ScrollFrame", "HeroicPlayerSquareScrollFrame", listBg, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 10, -10)
    scrollFrame:SetPoint("BOTTOMRIGHT", -40, 10)

    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetSize(1, 1)
    scrollFrame:SetScrollChild(scrollChild)

    self.scrollFrame = scrollFrame
    self.scrollChild = scrollChild

    -- 无数据提示
    local noDataLabel = listBg:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    noDataLabel:SetPoint("CENTER")
    noDataLabel:SetText("暂无玩家发布需求")
    noDataLabel:SetTextColor(0.5, 0.5, 0.5, 1)
    noDataLabel:Hide()
    self.noDataLabel = noDataLabel
end

function HeroicPlayerSquareFrame:CreatePlayerRequestButton(index)
    local buttonName = "HeroicPlayerRequestButton" .. index
    local button = CreateFrame("Button", buttonName, self.scrollChild, BackdropTemplateMixin and "BackdropTemplate")

    -- 两列布局计算
    local col = (index - 1) % 2  -- 0为左列，1为右列
    local row = math.floor((index - 1) / 2)  -- 行数
    local buttonWidth = 360  -- 每个按钮宽度
    local buttonHeight = 80   -- 按钮高度
    local colSpacing = 370    -- 列间距
    local rowSpacing = 90     -- 行间距

    button:SetSize(buttonWidth, buttonHeight)

    -- 设置位置：左列x=10，右列x=10+370
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

    -- 队伍信息标题
    local titleText = button:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    titleText:SetPoint("TOPLEFT", 15, -10)
    titleText:SetTextColor(1, 0.8, 0, 1)
    button.titleText = titleText

    -- 队伍组成信息
    local membersText = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    membersText:SetPoint("TOPLEFT", titleText, "BOTTOMLEFT", 0, -5)
    membersText:SetTextColor(0.8, 0.8, 1, 1)
    button.membersText = membersText

    -- 目标团本
    local targetText = button:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    targetText:SetPoint("TOPLEFT", membersText, "BOTTOMLEFT", 0, -5)
    targetText:SetTextColor(1, 1, 0.8, 1)
    button.targetText = targetText

    -- 联系方式/操作按钮
    local contactBtn = CreateFrame("Button", nil, button, "UIPanelButtonTemplate")
    contactBtn:SetSize(80, 24)
    contactBtn:SetPoint("BOTTOMRIGHT", -10, 10)
    contactBtn:SetText("私聊")
    button.contactBtn = contactBtn

    -- 时间戳
    local timeText = button:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
    timeText:SetPoint("BOTTOMLEFT", 15, 10)
    timeText:SetTextColor(0.7, 0.7, 0.7, 1)
    button.timeText = timeText

    -- 右键菜单功能
    button:SetScript("OnMouseUp", function(self, mouseButton)
        if mouseButton == "RightButton" and self.requestData then
            local requestData = self.requestData
            local myName = UnitName("player")
            local myRequest = ns.PlayerSquareManager and ns.PlayerSquareManager:GetMyRequest()
            local isMyActivity = (requestData.playerName == myName) or (myRequest and myRequest.id == requestData.id)

            if not isMyActivity then
                -- 创建右键菜单
                local menu = CreateFrame("Frame", "HeroicPlayerSquareContextMenu", UIParent, "UIDropDownMenuTemplate")
                local isFavorite = self.parentFrame:IsFavorite(requestData.playerName)

                local menuList = {
                    {
                        text = isFavorite and "取消收藏" or "收藏",
                        func = function()
                            self.parentFrame:ToggleFavorite(requestData.playerName)
                            CloseDropDownMenus()
                        end
                    },
                    {
                        text = "密语",
                        func = function()
                            self.parentFrame:ContactPlayer(requestData.playerName)
                            CloseDropDownMenus()
                        end
                    }
                }

                UIDropDownMenu_Initialize(menu, function(self, level)
                    for _, item in ipairs(menuList) do
                        local info = UIDropDownMenu_CreateInfo()
                        info.text = item.text
                        info.func = item.func
                        info.notCheckable = true
                        UIDropDownMenu_AddButton(info, level)
                    end
                end, "MENU")
                ToggleDropDownMenu(1, nil, menu, "cursor", 0, 0)
            end
        end
    end)

    -- 鼠标悬停效果
    button:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.2, 0.2, 0.3, 0.8)
        if self.requestData then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("队伍需求详情", 1, 1, 1)

            -- 显示队伍成员详情
            if self.requestData.members and #self.requestData.members > 0 then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("队伍成员:", 0.8, 0.8, 1)

                for _, member in ipairs(self.requestData.members) do
                    local memberLine = ""
                    local classColor = {r = 1, g = 1, b = 1} -- 默认白色

                    -- 获取职业颜色 (兼容旧版本API)
                    if member.class then
                        local classColorInfo = RAID_CLASS_COLORS[member.class]
                        if classColorInfo then
                            classColor = classColorInfo
                        end
                    end

                    -- 构建成员信息行
                    memberLine = member.name or "未知玩家"

                    -- 添加装等信息
                    if member.itemLevel and member.itemLevel > 0 then
                                memberLine = memberLine .. " (装等: " .. math.floor(member.itemLevel) .. ")"
                    end

                    -- 添加星团长等级（如果有的话）
                    if member.guildRank and member.guildRank ~= "" then
                        memberLine = memberLine .. " [" .. member.guildRank .. "]"
                    end

                    -- 添加角色信息
                    if member.role then
                        local roleText = ""
                        if member.role == "tank" then
                            roleText = " - 坦克"
                        elseif member.role == "healer" then
                            roleText = " - 治疗"
                        elseif member.role == "dps" then
                            roleText = " - 伤害输出"
                        end
                        memberLine = memberLine .. roleText
                    end

                    -- 使用职业颜色显示角色名字
                    GameTooltip:AddLine(memberLine, classColor.r, classColor.g, classColor.b)
                end
            end

            -- 显示备注
            if self.requestData.comment then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("备注: " .. self.requestData.comment, 1, 1, 0.8, true)
            end

            GameTooltip:Show()
        end
    end)

    button:SetScript("OnLeave", function(self)
        self:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
        GameTooltip:Hide()
    end)

    -- 存储父框架的引用，供右键菜单使用
    button.parentFrame = self

    return button
end

function HeroicPlayerSquareFrame:GetOrCreatePlayerButton(index)
    if not self.playerButtons[index] then
        self.playerButtons[index] = self:CreatePlayerRequestButton(index)
    end
    return self.playerButtons[index]
end

function HeroicPlayerSquareFrame:UpdatePlayerButton(button, requestData)
    if not button or not requestData then
        return
    end

    button.requestData = requestData

    -- 检查是否是自己的活动
    local myName = UnitName("player")
    local myRequest = ns.PlayerSquareManager and ns.PlayerSquareManager:GetMyRequest()

    local isMyActivity = (requestData.playerName == myName) or
                        (myRequest and myRequest.id == requestData.id)

    -- 设置标题 - 显示具体团本名称
    local titleText = ""
    local targetRaidName = ns.GetRaidName(requestData.targetRaidId) or "未指定团本"

    local displayMemberCount = requestData.memberCount or (requestData.members and #requestData.members) or 1
    if requestData.isGroup then
        titleText = string.format("%s (%d/25人)", targetRaidName, displayMemberCount)
    else
        titleText = string.format("%s (%d/25人)", targetRaidName, displayMemberCount)
    end

    -- 如果是自己的活动，添加标识
    if isMyActivity then
        titleText = "|cff00ff00【我的活动】|r" .. titleText
    end

    button.titleText:SetText(titleText)

    -- 设置成员信息
    local membersInfo = ""
    if requestData.members and #requestData.members > 0 then
        local roleCount = {tank = 0, healer = 0, dps = 0}
        for _, member in ipairs(requestData.members) do
            if member.role then
                roleCount[member.role] = (roleCount[member.role] or 0) + 1
            end
        end

        local parts = {}
        if roleCount.tank > 0 then
            table.insert(parts, roleCount.tank .. "坦克")
        end
        if roleCount.healer > 0 then
            table.insert(parts, roleCount.healer .. "治疗")
        end
        if roleCount.dps > 0 then
            table.insert(parts, roleCount.dps .. "输出")
        end
        membersInfo = table.concat(parts, " + ")
    else
        membersInfo = "待补充信息"
    end
    button.membersText:SetText("队伍组成: " .. membersInfo)

    -- 设置目标团本（保持原有的目标显示逻辑）
    -- 备注展示截断：超过 20 个 UTF-8 字符时截断 + ...，tooltip 仍显示完整内容
    local comment = requestData.comment
    if comment and comment ~= "" then
        local truncated = ns.UTF8Sub(comment, 20)
        if #truncated < #comment then
            button.targetText:SetText("备注: " .. truncated .. "...")
        else
            button.targetText:SetText("备注: " .. comment)
        end
    else
        button.targetText:SetText("备注: 无")
    end

    -- 检查收藏状态
    local isFavorite = self:IsFavorite(requestData.playerName)

    -- 设置联系按钮 - 如果是自己的活动，隐藏私聊按钮
    if isMyActivity then
        button.contactBtn:Hide()
        -- 为自己的活动设置特殊的背景颜色
        button:SetBackdropColor(0.1, 0.2, 0.1, 0.8)  -- 淡绿色背景
                button:SetBackdropBorderColor(0.2, 0.4, 0.8, 1) -- 淡蓝色边框
    elseif isFavorite then
        -- 收藏的活动使用橙色背景
        button:SetBackdropColor(0.2, 0.15, 0.1, 0.8)  -- 淡橙色背景
        button:SetBackdropBorderColor(1, 0.6, 0.2, 1) -- 橙色边框
        button.contactBtn:Show()
        button.contactBtn:SetScript("OnClick", function()
            if requestData.playerName then
                self:ContactPlayer(requestData.playerName)
            end
        end)
        -- 更新鼠标悬停效果（收藏条目）
        button:SetScript("OnEnter", function(self)
            self:SetBackdropColor(0.25, 0.2, 0.15, 0.8)  -- 悬停时亮橙色
            if self.requestData then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText("收藏的队伍需求详情", 1, 1, 1)

                -- 显示队伍成员详情
                if self.requestData.members and #self.requestData.members > 0 then
                    GameTooltip:AddLine(" ")
                    GameTooltip:AddLine("队伍成员:", 0.8, 0.8, 1)

                    for _, member in ipairs(self.requestData.members) do
                        local memberLine = ""
                        local classColor = {r = 1, g = 1, b = 1} -- 默认白色

                        -- 获取职业颜色 (兼容旧版本API)
                        if member.class then
                            local classColorInfo = RAID_CLASS_COLORS[member.class]
                            if classColorInfo then
                                classColor = classColorInfo
                            end
                        end

                        -- 构建成员信息行
                        memberLine = member.name or "未知玩家"

                        -- 添加装等信息
                        if member.itemLevel and member.itemLevel > 0 then
                            memberLine = memberLine .. " (装等: " .. math.floor(member.itemLevel) .. ")"
                        end

                        -- 添加星团长等级（如果有的话）
                        if member.guildRank and member.guildRank ~= "" then
                            memberLine = memberLine .. " [" .. member.guildRank .. "]"
                        end

                        -- 添加角色信息
                        if member.role then
                            local roleText = ""
                            if member.role == "tank" then
                                roleText = " - 坦克"
                            elseif member.role == "healer" then
                                roleText = " - 治疗"
                            elseif member.role == "dps" then
                                roleText = " - 伤害输出"
                            end
                            memberLine = memberLine .. roleText
                        end

                        -- 使用职业颜色显示角色名字
                        GameTooltip:AddLine(memberLine, classColor.r, classColor.g, classColor.b)
                    end
                end

                -- 显示备注
                if self.requestData.comment then
                    GameTooltip:AddLine(" ")
                    GameTooltip:AddLine("备注: " .. self.requestData.comment, 1, 1, 0.8, true)
                end

                GameTooltip:Show()
            end
        end)

        button:SetScript("OnLeave", function(self)
            self:SetBackdropColor(0.2, 0.15, 0.1, 0.8)  -- 恢复淡橙色背景
            GameTooltip:Hide()
        end)
    else
        button.contactBtn:Show()
        button.contactBtn:SetScript("OnClick", function()
            if requestData.playerName then
                self:ContactPlayer(requestData.playerName)
            end
        end)
        -- 恢复默认背景颜色
        button:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
        button:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
        -- 恢复默认鼠标悬停效果
        button:SetScript("OnEnter", function(self)
            self:SetBackdropColor(0.2, 0.2, 0.3, 0.8)
            if self.requestData then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText("队伍需求详情", 1, 1, 1)

                -- 显示队伍成员详情
                if self.requestData.members and #self.requestData.members > 0 then
                    GameTooltip:AddLine(" ")
                    GameTooltip:AddLine("队伍成员:", 0.8, 0.8, 1)

                    for _, member in ipairs(self.requestData.members) do
                        local memberLine = ""
                        local classColor = {r = 1, g = 1, b = 1} -- 默认白色

                        -- 获取职业颜色 (兼容旧版本API)
                        if member.class then
                            local classColorInfo = RAID_CLASS_COLORS[member.class]
                            if classColorInfo then
                                classColor = classColorInfo
                            end
                        end

                        -- 构建成员信息行
                        memberLine = member.name or "未知玩家"

                        -- 添加装等信息
                        if member.itemLevel and member.itemLevel > 0 then
                                    memberLine = memberLine .. " (装等: " .. math.floor(member.itemLevel) .. ")"
                        end

                        -- 添加星团长等级（如果有的话）
                        if member.guildRank and member.guildRank ~= "" then
                            memberLine = memberLine .. " [" .. member.guildRank .. "]"
                        end

                        -- 添加角色信息
                        if member.role then
                            local roleText = ""
                            if member.role == "tank" then
                                roleText = " - 坦克"
                            elseif member.role == "healer" then
                                roleText = " - 治疗"
                            elseif member.role == "dps" then
                                roleText = " - 伤害输出"
                            end
                            memberLine = memberLine .. roleText
                        end

                        -- 使用职业颜色显示角色名字
                        GameTooltip:AddLine(memberLine, classColor.r, classColor.g, classColor.b)
                    end
                end

                -- 显示备注
                if self.requestData.comment then
                    GameTooltip:AddLine(" ")
                    GameTooltip:AddLine("备注: " .. self.requestData.comment, 1, 1, 0.8, true)
                end

                GameTooltip:Show()
            end
        end)

        button:SetScript("OnLeave", function(self)
            self:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
            GameTooltip:Hide()
        end)
    end

    -- 设置时间
    if requestData.publishTime then
        local timeText = date("%H:%M", requestData.publishTime)
        button.timeText:SetText(timeText)
    end

    button:Show()
end

function HeroicPlayerSquareFrame:RefreshData()
    -- 根据是否已有需求更新发布按钮文案
    if self.publishBtn then
        local hasRequest = ns.PlayerSquareManager and ns.PlayerSquareManager:GetMyRequest() ~= nil
        if hasRequest then
            self.publishBtn:SetText("更新需求")
        else
            self.publishBtn:SetText("发布需求")
        end
    end

    -- 获取玩家请求数据
    local requests = self:GetPlayerRequests()

    -- 应用筛选
    local filteredRequests = self:ApplyFilters(requests)

    -- 排序：自己的活动在最前，然后收藏的，最后是其他的
    filteredRequests = self:SortRequests(filteredRequests)

    -- 隐藏所有现有按钮
    for i, button in pairs(self.playerButtons) do
        button:Hide()
    end

    -- 显示/隐藏无数据提示
    if #filteredRequests == 0 then
        self.noDataLabel:Show()
        self.scrollChild:SetHeight(1)
        return
    else
        self.noDataLabel:Hide()
    end

    -- 更新按钮显示
    for i, requestData in ipairs(filteredRequests) do
        local button = self:GetOrCreatePlayerButton(i)
        self:UpdatePlayerButton(button, requestData)
    end

    -- 调整滚动高度
    local rowCount = math.ceil(#filteredRequests / 2)
    local contentHeight = math.max(rowCount * 90 + 20, self.scrollFrame:GetHeight())
    self.scrollChild:SetHeight(contentHeight)
    self.scrollChild:SetWidth(self.scrollFrame:GetWidth())
end

function HeroicPlayerSquareFrame:GetPlayerRequests()
    -- 获取玩家广场的请求数据
    if ns.PlayerSquareManager and ns.PlayerSquareManager.GetAllRequests then
        return ns.PlayerSquareManager:GetAllRequests()
    end

    -- 模拟数据用于测试
    return {
        {
            id = 1,
            leaderName = "测试玩家1",
            isGroup = false,
            memberCount = 1,
            members = {
                {name = "测试玩家1", class = "WARRIOR", role = "tank", level = 85}
            },
            targetRaidId = ns.SPEC.SERPENTSHRINE_CAVERN,
            comment = "有经验老玩家，求稳定团队",
            publishTime = time() - 300,
            neededRoles = {tank = 0, healer = 2, dps = 3}
        },
        {
            id = 2,
            leaderName = "测试队长",
            isGroup = true,
            memberCount = 3,
            members = {
                {name = "测试队长", class = "PALADIN", role = "tank", level = 85},
                {name = "测试治疗", class = "PRIEST", role = "healer", level = 84},
                {name = "测试输出", class = "MAGE", role = "dps", level = 85}
            },
            targetRaidId = ns.SPEC.MOLTEN_CORE,
            comment = "缺22人，有T有奶",
            publishTime = time() - 600,
            neededRoles = {tank = 1, healer = 4, dps = 17}
        }
    }
end

function HeroicPlayerSquareFrame:ApplyFilters(requests)
    local filtered = {}

    for _, request in ipairs(requests) do
        local passFilter = true

        -- 团本筛选
        if self.currentFilters.targetRaidId and passFilter then
            if request.targetRaidId ~= self.currentFilters.targetRaidId then
                passFilter = false
            end
        end

        -- 角色筛选
        if next(self.currentFilters.roles) and passFilter then
            local hasMatchingRole = false
            if request.members then
                for _, member in ipairs(request.members) do
                    if self.currentFilters.roles[member.role] then
                        hasMatchingRole = true
                        break
                    end
                end
            end
            if not hasMatchingRole then
                passFilter = false
            end
        end

        -- 专精筛选
        if next(self.currentFilters.specs) and passFilter then
            local hasMatchingSpec = false
            if request.members then
                for _, member in ipairs(request.members) do
                    -- 这里需要根据职业和专精来匹配
                    -- 简化处理，检查职业是否匹配选中的专精对应的职业
                    for specId, _ in pairs(self.currentFilters.specs) do
                        local specData = self:GetSpecData(specId)
                        if specData and specData.class == member.class then
                            hasMatchingSpec = true
                            break
                        end
                    end
                    if hasMatchingSpec then break end
                end
            end
            if not hasMatchingSpec then
                passFilter = false
            end
        end

        if passFilter then
            table.insert(filtered, request)
        end
    end

    return filtered
end

function HeroicPlayerSquareFrame:GetSpecData(specId)
    for _, spec in ipairs(SPEC_DATA) do
        if spec.id == specId then
            return spec
        end
    end
    return nil
end

function HeroicPlayerSquareFrame:ToggleRoleFilter(role)
    if self.currentFilters.roles[role] then
        self.currentFilters.roles[role] = nil
        self.roleFilters[role]:SetChecked(false)
    else
        self.currentFilters.roles[role] = true
        self.roleFilters[role]:SetChecked(true)
    end
    self:RefreshData()
end

function HeroicPlayerSquareFrame:ToggleSpecFilter(specId)
    if self.currentFilters.specs[specId] then
        self.currentFilters.specs[specId] = nil
    else
        self.currentFilters.specs[specId] = true
    end
    self:UpdateSpecTags()
    self:RefreshData()
end

function HeroicPlayerSquareFrame:ClearFilters()
    self.currentFilters = {
        specs = {},
        roles = {},
        targetRaidId = nil,
        minLevel = 80,
        maxLevel = 85
    }

    -- 清除UI状态
    for _, roleFilter in pairs(self.roleFilters) do
        roleFilter:SetChecked(false)
    end

    UIDropDownMenu_SetText(self.specDropdown, "选择专精")
    UIDropDownMenu_SetText(self.raidFilterDropdown, "所有团本")

    self:UpdateSpecTags()
    self:RefreshData()
end

function HeroicPlayerSquareFrame:UpdateSpecTags()
    -- 隐藏并回收所有现有标签
    for _, tag in ipairs(self.specTags) do
        tag:Hide()
    end
    self.specTags = {}

    -- 遍历已选专精，创建标签
    local containerWidth = self.specTagContainer:GetWidth()
    if containerWidth <= 0 then
        containerWidth = self.filterBg:GetWidth() - 20 -- 减去左右边距
    end

    local xOffset = 0
    local yOffset = 0
    local rows = 0
    local hasSpecs = false

    for specId, _ in pairs(self.currentFilters.specs) do
        -- 从 SPEC_DATA 查找对应专精数据
        local specData = nil
        for _, spec in ipairs(SPEC_DATA) do
            if spec.id == specId then
                specData = spec
                break
            end
        end

        if specData then
            hasSpecs = true

            -- 创建标签按钮
            local tag = CreateFrame("Frame", nil, self.specTagContainer, BackdropTemplateMixin and "BackdropTemplate")
            tag:SetHeight(20)
            tag:SetBackdrop({
                bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                tile = true,
                tileSize = 8,
                edgeSize = 8,
                insets = { left = 2, right = 2, top = 2, bottom = 2 }
            })
            tag:SetBackdropColor(0.2, 0.2, 0.2, 0.8)
            tag:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)

            -- 专精名称文本（带职业颜色）
            local label = tag:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
            label:SetPoint("LEFT", 6, 0)
            local classColor = RAID_CLASS_COLORS[specData.class]
            if classColor then
                label:SetTextColor(classColor.r, classColor.g, classColor.b, 1)
            else
                label:SetTextColor(1, 1, 1, 1)
            end
            label:SetText(specData.name)

            -- "×" 关闭按钮
            local closeBtn = CreateFrame("Button", nil, tag)
            closeBtn:SetSize(14, 14)
            closeBtn:SetPoint("LEFT", label, "RIGHT", 4, 0)
            closeBtn:SetNormalFontObject("GameFontNormalSmall")
            closeBtn:SetText("×")
            closeBtn:GetFontString():SetTextColor(0.8, 0.2, 0.2, 1)
            closeBtn:SetScript("OnEnter", function(btn)
                btn:GetFontString():SetTextColor(1, 0, 0, 1)
            end)
            closeBtn:SetScript("OnLeave", function(btn)
                btn:GetFontString():SetTextColor(0.8, 0.2, 0.2, 1)
            end)
            local capturedSpecId = specId
            closeBtn:SetScript("OnClick", function()
                self.currentFilters.specs[capturedSpecId] = nil
                self:UpdateSpecTags()
                self:RefreshData()
            end)

            -- 计算标签宽度
            local textWidth = label:GetStringWidth()
            local tagWidth = textWidth + 6 + 4 + 14 + 6 -- leftPad + gap + closeBtn + rightPad
            tag:SetWidth(tagWidth)

            -- 布局：检查是否需要换行
            if xOffset > 0 and (xOffset + tagWidth + 4) > containerWidth then
                xOffset = 0
                yOffset = yOffset - self.specTagRowHeight
            end

            if xOffset == 0 then
                rows = rows + 1
            end

            tag:SetPoint("TOPLEFT", self.specTagContainer, "TOPLEFT", xOffset, yOffset)
            xOffset = xOffset + tagWidth + 4 -- 4px 标签间距

            tag:Show()
            table.insert(self.specTags, tag)
        end
    end

    -- 调整 filterBg 高度
    if hasSpecs then
        self.filterBg:SetHeight(self.filterBaseHeight + rows * self.specTagRowHeight)
    else
        self.filterBg:SetHeight(self.filterBaseHeight)
    end
end

function HeroicPlayerSquareFrame:ShowPublishDialog()
    -- 显示发布需求对话框
    if not self.publishDialog then
        self.publishDialog = self:CreatePublishDialog()
    end
    self.publishDialog:Show()
end

function HeroicPlayerSquareFrame:CreatePublishDialog()
    -- 创建发布需求对话框
    local dialog = CreateFrame("Frame", "HeroicPublishRequestDialog", self, BackdropTemplateMixin and "BackdropTemplate")
    dialog:SetSize(400, 300)
    dialog:SetPoint("CENTER")
    dialog:SetFrameStrata("DIALOG")
    dialog:SetFrameLevel(100)
    dialog:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    dialog:SetBackdropColor(0.1, 0.1, 0.2, 0.95)
    dialog:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    dialog:EnableMouse(true)
    dialog:Hide()
    
    -- 标题
    local title = dialog:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -20)
    title:SetText("发布队伍需求")
    title:SetTextColor(1, 0.8, 0, 1)
    
    -- 关闭按钮
    local closeBtn = CreateFrame("Button", nil, dialog, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -5, -5)
    closeBtn:SetScript("OnClick", function() dialog:Hide() end)
    
    -- 这里会添加更多的对话框内容...
    -- 包括团本选择、队伍信息、备注等
    
    return dialog
end

function HeroicPlayerSquareFrame:ShowMyRequest()
    -- 显示我的需求
    local myRequest = self:GetMyRequest()
    if myRequest then
        ns.Addon:Print("你当前的需求: " .. (myRequest.comment or "无备注"))
    else
        ns.Addon:Print("你还没有发布需求")
    end
end

function HeroicPlayerSquareFrame:GetMyRequest()
    -- 获取当前玩家的需求
    if ns.PlayerSquareManager and ns.PlayerSquareManager.GetPlayerRequest then
        return ns.PlayerSquareManager:GetPlayerRequest(UnitName("player"))
    end
    return nil
end

function HeroicPlayerSquareFrame:ContactPlayer(playerName)
    -- 联系玩家
    if playerName and playerName ~= UnitName("player") then
        -- 私聊埋点
        ns.MeetingHornAPI:InsertLog({time(), "raid_private_chat", {page_sheet = "个人求组", target_player_name = playerName}})
        local editBox = ChatEdit_ChooseBoxForSend()
        if editBox then
            ChatEdit_ActivateChat(editBox)
            editBox:SetText("/w " .. playerName .. " 你好，我对你发布的队伍需求感兴趣")
        end
    end
end

function HeroicPlayerSquareFrame:SortRequests(requests)
    local myName = UnitName("player")
    local myRequest = ns.PlayerSquareManager and ns.PlayerSquareManager:GetMyRequest()

    -- 初始化收藏数据
    if not ns.Addon or not ns.Addon.db or not ns.Addon.db.profile then
        return requests -- 如果没有数据库，直接返回
    end

    if not ns.Addon.db.profile.playerSquareFavorites then
        ns.Addon.db.profile.playerSquareFavorites = {}
    end

    table.sort(requests, function(a, b)
        local playerName = UnitName("player")

        -- 检查是否是自己的活动
        local aIsPlayer = (a.playerName == myName) or (myRequest and myRequest.id == a.id)
        local bIsPlayer = (b.playerName == myName) or (myRequest and myRequest.id == b.id)

        -- 自己的活动最优先
        if aIsPlayer ~= bIsPlayer then
            return aIsPlayer
        end

        -- 检查收藏状态
        local aIsFavorite = ns.Addon.db.profile.playerSquareFavorites[a.playerName] or false
        local bIsFavorite = ns.Addon.db.profile.playerSquareFavorites[b.playerName] or false

        -- 收藏的活动其次优先
        if aIsFavorite ~= bIsFavorite then
            return aIsFavorite
        end

        -- 最后按时间排序（最新的在前）
        return (a.publishTime or 0) > (b.publishTime or 0)
    end)

    return requests
end

function HeroicPlayerSquareFrame:IsFavorite(playerName)
    return ns.Addon.db.profile.playerSquareFavorites and
           ns.Addon.db.profile.playerSquareFavorites[playerName] or false
end

function HeroicPlayerSquareFrame:ToggleFavorite(playerName)
    if not ns.Addon.db.profile.playerSquareFavorites then
        ns.Addon.db.profile.playerSquareFavorites = {}
    end

    local isFavorite = ns.Addon.db.profile.playerSquareFavorites[playerName]
    ns.Addon.db.profile.playerSquareFavorites[playerName] = not isFavorite

    -- 刷新显示
    self:RefreshData()
end

-- 节流刷新机制：合并 200ms 内的多次 PLAYER_SQUARE_UPDATED 事件
function HeroicPlayerSquareFrame:ScheduleRefresh()
    -- 不可见时标记待刷新，等 Show 时补刷
    if not self:IsVisible() then
        self._needsRefreshOnShow = true
        return
    end

    -- 取消已有的待处理刷新
    if self._refreshTimer then
        self._refreshTimer:Cancel()
    end

    -- 200ms 延迟合并
    self._refreshTimer = C_Timer.NewTimer(0.2, function()
        self:RefreshData()
        self._refreshTimer = nil
    end)
end

function HeroicPlayerSquareFrame:OnShow()
    if self._needsRefreshOnShow then
        self._needsRefreshOnShow = false
    end
    self:RefreshData()
end

-- 注册到命名空间
ns.UI = ns.UI or {}
ns.UI.PlayerSquareFrame = HeroicPlayerSquareFrame

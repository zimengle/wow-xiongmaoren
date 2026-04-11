-- CreatorFrame.lua
-- 创建活动界面

---@type MeetingHornHeroicNS
local ns = select(2, ...)
local L = ns.L

---@class CreatorFrame: Frame
local CreatorFrame = {}

function CreatorFrame:New(parent)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetAllPoints()
    frame:Hide()
    
    -- 绑定方法
    for k, v in pairs(CreatorFrame) do
        if type(v) == "function" then
            frame[k] = v
        end
    end
    
    -- 创建界面元素
    frame:CreateElements()
    
    -- 注册活动管理器回调
    ns.ActivityManager:RegisterUpdateCallback(function(eventType, data)
        frame:OnActivityUpdate(eventType, data)
    end)
    
    return frame
end

function CreatorFrame:CreateElements()
    -- 主标题
    local title = self:CreateFontString(nil, "ARTWORK", "GameFontNormalHuge")
    title:SetPoint("TOP", 0, -20)
    title:SetText(L['Create Heroic Raid'])
    title:SetTextColor(1, 0.8, 0, 1)
    self.mainTitle = title

    -- 创建角色选择标签页
    self:CreateRoleTabSystem()

    -- 创建左侧团本选择区域（位置会根据当前标签调整）
    self:CreateRaidSelectionArea()

    -- 创建右侧配置区域
    self:CreateConfigurationArea()

    -- 创建底部按钮区域
    self:CreateButtonArea()

    -- 初始化为团长模式
    self.currentRole = "leader"
    self:SwitchToRole("leader")
end

-- 辅助：为 Tab 按钮设置选中/未选中视觉状态
-- Tab 样式由 UI/TabLib.lua 中的 ns.MHTabLib 提供
-- 本地别名，方便调用
local function CreateStyledTab(parent, labelText, width, height)
    return ns.MHTabLib.CreateTab(parent, labelText, width, height)
end

local function SetTabAppearance(tab, isSelected)
    ns.MHTabLib.SetTabSelected(tab, isSelected)
end

function CreatorFrame:CreateRoleTabSystem()
    -- 角色选择标签容器
    local roleTabFrame = CreateFrame("Frame", nil, self)
    roleTabFrame:SetHeight(32)
    roleTabFrame:SetPoint("TOPLEFT", 20, -30)
    roleTabFrame:SetPoint("TOPRIGHT", -20, -30)

    -- 创建团长标签
    local leaderTab = CreateStyledTab(roleTabFrame, "创建团本", 120, 30)
    leaderTab:SetPoint("LEFT", roleTabFrame, "LEFT", 10, 0)
    leaderTab:SetID(1)
    leaderTab:SetScript("OnClick", function()
        self:SwitchToRole("leader")
    end)

    -- 创建队员标签
    local memberTab = CreateStyledTab(roleTabFrame, "团本求组", 120, 30)
    memberTab:SetPoint("LEFT", leaderTab, "RIGHT", 8, 0)
    memberTab:SetID(2)
    memberTab:SetScript("OnClick", function()
        self:SwitchToRole("member")
    end)

    -- 存储标签引用
    self.roleTabFrame = roleTabFrame
    self.leaderTab = leaderTab
    self.memberTab = memberTab
    self.roleTabs = {leaderTab, memberTab}
    self._setTabAppearance = SetTabAppearance

    self.selectedTab = 1
    self.numTabs = 2
end

function CreatorFrame:SwitchToRole(role)
    self.currentRole = role

    -- 更新标签选中状态（使用自定义外观）
    if role == "leader" then
        SetTabAppearance(self.leaderTab, true)
        SetTabAppearance(self.memberTab, false)
        if self.mainTitle then
            self.mainTitle:SetText("创建团本活动")
        end
        self:ShowLeaderInterface()
    elseif role == "member" then
        SetTabAppearance(self.memberTab, true)
        SetTabAppearance(self.leaderTab, false)
        if self.mainTitle then
            self.mainTitle:SetText("团本求组")
        end
        self:ShowMemberInterface()
        -- 切换到队员界面后，重置按钮状态
        C_Timer.After(0.1, function()
            self:UpdateMemberButtonStates()
        end)
    end
end

function CreatorFrame:ShowLeaderInterface()
    -- 显示团长界面元素
    if self.raidSelectionBg then
        self.raidSelectionBg:Show()
    end
    if self.configBg then
        self.configBg:Show()
    end
    if self.createButton then
        -- 检查是否有现有活动来设置按钮文本
        local currentActivity = ns.ActivityManager and ns.ActivityManager:GetPlayerActivity()
        if currentActivity then
            self.createButton:SetText("更新活动")
        else
            self.createButton:SetText("创建活动")
        end
        self.createButton:Show()
    end
    if self.closeButton then
        self.closeButton:Show()
    end

    -- 隐藏队员界面元素
    if self.memberRequestBg then
        self.memberRequestBg:Hide()
    end
    if self.publishRequestButton then
        self.publishRequestButton:Hide()
    end
    if self.closeRequestButton then
        self.closeRequestButton:Hide()
    end

    -- 注册队伍事件监听以便实时更新总人数显示
    self:RegisterGroupEventsForLeader()
end

function CreatorFrame:ShowMemberInterface()
    -- 隐藏团长界面元素
    if self.raidSelectionBg then
        self.raidSelectionBg:Hide()
    end
    if self.configBg then
        self.configBg:Hide()
    end
    if self.createButton then
        self.createButton:Hide()
    end
    if self.closeButton then
        self.closeButton:Hide()
    end

    -- 显示队员界面元素
    self:CreateMemberInterface()
    if self.memberRequestBg then
        self.memberRequestBg:Show()
    end
    if self.publishRequestButton then
        self.publishRequestButton:Show()
    end
    if self.closeRequestButton then
        self.closeRequestButton:Show()
    end

    -- 每次显示时更新队伍状态
    self:UpdateTeamTypeAndInfo()
end

function CreatorFrame:CreateMemberInterface()
    -- 如果已经创建过，直接返回
    if self.memberRequestBg then
        return
    end

    -- 队员需求发布界面
    local memberBg = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
    memberBg:SetSize(760, 400)
    memberBg:SetPoint("TOPLEFT", 20, -60)
    memberBg:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    memberBg:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    memberBg:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)

    -- 标题
    local memberTitle = memberBg:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    memberTitle:SetPoint("TOP", 0, -15)
    memberTitle:SetText("发布队伍需求")
    memberTitle:SetTextColor(1, 1, 1, 1)

    -- 队伍类型显示（自动检测）
    local teamTypeLabel = memberBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    teamTypeLabel:SetPoint("TOPLEFT", 20, -50)
    teamTypeLabel:SetText("队伍类型:")
    teamTypeLabel:SetTextColor(1, 1, 1, 1)

    -- 队伍类型显示文字（不再是选择框）
    local teamTypeDisplay = memberBg:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    teamTypeDisplay:SetPoint("LEFT", teamTypeLabel, "RIGHT", 20, 0)
    teamTypeDisplay:SetText("个人求组") -- 默认文字，会被更新
    teamTypeDisplay:SetTextColor(1, 0.8, 0, 1) -- 金色

    -- 目标团本选择
    local targetLabel = memberBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    targetLabel:SetPoint("TOPLEFT", 20, -90)
    targetLabel:SetText("目标团本:")
    targetLabel:SetTextColor(1, 1, 1, 1)

    local targetDropdown = CreateFrame("Frame", nil, memberBg, "HeroicDropDownMenuTemplate")
    targetDropdown:SetPoint("LEFT", targetLabel, "RIGHT", 20, 0)
    UIDropDownMenu_SetWidth(targetDropdown, 200)
    UIDropDownMenu_SetText(targetDropdown, "选择团本|cFFFF0000(必选)|r")

    UIDropDownMenu_Initialize(targetDropdown, function(dropdown, level)
        for _, raidId in ipairs(ns.raidOrder) do
            local raidData = ns.raidData[raidId]
            if raidData then
                local info = UIDropDownMenu_CreateInfo()
                info.text = raidData.name
                info.value = raidId
                info.func = function()
                    UIDropDownMenu_SetSelectedValue(targetDropdown, raidId)
                    UIDropDownMenu_SetText(targetDropdown, raidData.name)
                    CloseDropDownMenus()
                    -- 选择团本后更新按钮状态
                    self:UpdateMemberButtonStates()
                end
                UIDropDownMenu_AddButton(info, level)
            end
        end
    end)

    -- 备注输入
    local commentLabel = memberBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    commentLabel:SetPoint("TOPLEFT", 20, -130)
    commentLabel:SetText("备注说明:")
    commentLabel:SetTextColor(1, 1, 1, 1)

    local commentBox = CreateFrame("EditBox", nil, memberBg, "HeroicEditBoxTemplate")
    commentBox:SetSize(500, 20)
    commentBox:SetPoint("TOPLEFT", 20, -155)
    commentBox:SetMaxLetters(60)
    commentBox:SetAutoFocus(false)

    -- 注册文本变化事件，实时更新按钮状态 + 输入清洗
    local commentBoxUpdating = false
    commentBox:SetScript("OnTextChanged", function()
        if commentBoxUpdating then return end
        local text = commentBox:GetText()
        local sanitized = ns.SanitizeComment(text, 50)
        if sanitized ~= text then
            commentBoxUpdating = true
            commentBox:SetText(sanitized)
            commentBox:SetCursorPosition(#sanitized)
            commentBoxUpdating = false
        end
        self:UpdateMemberButtonStates()
    end)

    -- 队伍信息显示区域
    local teamInfoLabel = memberBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    teamInfoLabel:SetPoint("TOPLEFT", 20, -200)
    teamInfoLabel:SetText("当前队伍信息:")
    teamInfoLabel:SetTextColor(1, 1, 1, 1)

    local teamInfoFrame = CreateFrame("ScrollFrame", nil, memberBg, "UIPanelScrollFrameTemplate")
    teamInfoFrame:SetPoint("TOPLEFT", 20, -225)
    teamInfoFrame:SetSize(500, 140)  -- 增大窗口高度从120到140

    -- 创建滚动内容容器
    local teamInfoScrollChild = CreateFrame("Frame", nil, teamInfoFrame)
    teamInfoScrollChild:SetSize(480, 200)  -- 设置足够的高度以便滚动

    local teamInfoText = teamInfoScrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    teamInfoText:SetSize(480, 200)
    teamInfoText:SetPoint("TOPLEFT", 0, 0)
    teamInfoText:SetJustifyH("LEFT")
    teamInfoText:SetJustifyV("TOP")
    teamInfoText:SetTextColor(0.8, 0.8, 1, 1)

    teamInfoFrame:SetScrollChild(teamInfoScrollChild)

    -- 发布需求按钮 - 移动到底部按钮区域
    local publishBtn = CreateFrame("Button", nil, self.buttonFrame, "UIPanelButtonTemplate")
    publishBtn:SetSize(120, 32)
    publishBtn:SetPoint("CENTER", -70, 0) -- 和创建活动按钮同一位置
    publishBtn:SetText("发布需求")
    publishBtn:SetScript("OnClick", function()
        self:OnPublishRequestClick()
    end)
    publishBtn:Disable() -- 默认禁用，需要选择团本后才能点击
    publishBtn:Hide() -- 默认隐藏

    -- 关闭活动按钮 - 移动到底部按钮区域
    local closeRequestBtn = CreateFrame("Button", nil, self.buttonFrame, "UIPanelButtonTemplate")
    closeRequestBtn:SetSize(120, 32)
    closeRequestBtn:SetPoint("CENTER", 70, 0) -- 和关闭活动按钮同一位置
    closeRequestBtn:SetText("关闭需求")
    closeRequestBtn:SetScript("OnClick", function()
        self:OnCloseRequestClick()
    end)
    closeRequestBtn:Disable() -- 默认禁用，有活动时才能点击
    closeRequestBtn:Hide() -- 默认隐藏

    -- 存储引用
    self.memberRequestBg = memberBg
    self.teamTypeDisplay = teamTypeDisplay
    self.targetDropdown = targetDropdown
    self.commentBox = commentBox
    self.teamInfoText = teamInfoText
    self.publishRequestButton = publishBtn
    self.closeRequestButton = closeRequestBtn

    -- 初始化数据
    self:UpdateTeamTypeAndInfo()

    -- 初始化按钮状态
    self:UpdateMemberButtonStates()

    -- 注册队伍变化事件监听
    self:RegisterGroupEvents()
end

-- 新方法：更新队伍类型和信息（自动检测）
function CreatorFrame:UpdateTeamTypeAndInfo()
    if not self.teamTypeDisplay or not self.teamInfoText then
        return
    end

    local groupSize = GetNumGroupMembers()
    local isInGroup = groupSize > 0
    local isLeader = UnitIsGroupLeader("player")

    -- 自动设置队伍类型
    if isInGroup then
        self.memberRequestType = "group"
        self.teamTypeDisplay:SetText("队伍求组")
    else
        self.memberRequestType = "solo"
        self.teamTypeDisplay:SetText("个人求组")
    end

    -- 更新队伍信息显示
    self:UpdateTeamInfo()

    -- 更新按钮状态（统一通过UpdateMemberButtonStates处理）
    self:UpdateMemberButtonStates()
end

function CreatorFrame:UpdateMemberRequestType(requestType)
    self.memberRequestType = requestType
    self:UpdateTeamInfo()
end

function CreatorFrame:UpdateTeamInfo()
    if not self.teamInfoText then
        return
    end

    local groupSize = GetNumGroupMembers()
    local isInGroup = groupSize > 0

    if self.memberRequestType == "solo" or not isInGroup then
        -- 个人模式或没有队伍
        local playerName = UnitName("player")
        local class, classFileName = UnitClass("player")
        local level = UnitLevel("player")
        local itemLevel = GetAverageItemLevel() or 0

        local classColor = RAID_CLASS_COLORS[classFileName]
        local colorCode = classColor and string.format("|cff%02x%02x%02x", classColor.r*255, classColor.g*255, classColor.b*255) or ""

        local info = string.format("%s%s|r - %d级 - 装等: %d",
                    colorCode, playerName, level, math.floor(itemLevel or 0))
        self.teamInfoText:SetText("个人信息:\n" .. info)
    else
        -- 队伍模式 - 显示所有队伍成员的详细信息
        local teamInfo = "队伍成员:\n"
        local roleCount = {tank = 0, healer = 0, dps = 0}

        local maxMembers = IsInRaid() and GetNumGroupMembers() or GetNumSubgroupMembers()
        local unitPrefix = IsInRaid() and "raid" or "party"
        local isLeader = UnitIsGroupLeader("player")

        -- 添加队长标识和权限提示
        if isLeader then
            teamInfo = teamInfo .. "|cff00ff00[你是队长，可以发布队伍需求]|r\n\n"
        else
            teamInfo = teamInfo .. "|cffff8000[只有队长才能发布队伍需求]|r\n\n"
        end

        -- 获取队伍成员信息，包括装等
        for i = 1, maxMembers do
            local unit = unitPrefix .. i
            if UnitExists(unit) then
                local name = UnitName(unit)
                local class, classFileName = UnitClass(unit)
                local level = UnitLevel(unit)
                local role = self:GuessPlayerRole(classFileName)
                local isUnitLeader = UnitIsGroupLeader(unit)

                -- 尝试获取装等（对其他玩家可能无法获取）
                local itemLevel = 0
                if unit == "player" then
                    itemLevel = GetAverageItemLevel() or 0
                else
                    -- 对其他玩家，我们无法直接获取装等，显示为未知
                    itemLevel = 0
                end

                roleCount[role] = roleCount[role] + 1

                local classColor = RAID_CLASS_COLORS[classFileName]
                local colorCode = classColor and string.format("|cff%02x%02x%02x", classColor.r*255, classColor.g*255, classColor.b*255) or ""

                local leaderIcon = isUnitLeader and "|cffffd700[队长]|r " or ""
                local itemLevelText = itemLevel > 0 and string.format(" - 装等: %d", math.floor(itemLevel)) or ""
                local roleText = role == "tank" and "坦克" or role == "healer" and "治疗" or "输出"

                teamInfo = teamInfo .. string.format("%s%s%s|r - %d级%s (%s)\n",
                    leaderIcon, colorCode, name, level, itemLevelText, roleText)
            end
        end

        -- 添加自己（如果不是团队模式）
        if not IsInRaid() then
            local playerName = UnitName("player")
            local class, classFileName = UnitClass("player")
            local level = UnitLevel("player")
            local role = self:GuessPlayerRole(classFileName)
            local itemLevel = GetAverageItemLevel() or 0

            roleCount[role] = roleCount[role] + 1

            local classColor = RAID_CLASS_COLORS[classFileName]
            local colorCode = classColor and string.format("|cff%02x%02x%02x", classColor.r*255, classColor.g*255, classColor.b*255) or ""

            local leaderIcon = UnitIsGroupLeader("player") and "|cffffd700[队长]|r " or ""

            teamInfo = teamInfo .. string.format("%s%s%s|r - %d级 - 装等: %d (%s)\n",
                leaderIcon, colorCode, playerName, level, math.floor(itemLevel), role == "tank" and "坦克" or role == "healer" and "治疗" or "输出")
        end

        -- 添加角色统计
        teamInfo = teamInfo .. string.format("\n角色构成: %d坦克 + %d治疗 + %d输出 (共%d人)",
            roleCount.tank, roleCount.healer, roleCount.dps, groupSize)

        self.teamInfoText:SetText(teamInfo)
    end
end

function CreatorFrame:GuessPlayerRole(playerClass)
    -- 根据职业猜测角色定位
    local tankClasses = {WARRIOR = true, PALADIN = true, DEATHKNIGHT = true}
    local healerClasses = {PRIEST = true, PALADIN = true, SHAMAN = true, DRUID = true}

    if tankClasses[playerClass] then
        return "tank"
    elseif healerClasses[playerClass] then
        return "healer"
    else
        return "dps"
    end
end


function CreatorFrame:GetCurrentTeamData()
    local members = {}
    local groupSize = GetNumGroupMembers()
    local isInGroup = groupSize > 0

    if self.memberRequestType == "solo" or not isInGroup then
        -- 个人数据
        local playerName = UnitName("player")
        local class, classFileName = UnitClass("player")
        local level = UnitLevel("player")
        local role = self:GuessPlayerRole(classFileName)

        table.insert(members, {
            name = playerName,
            class = classFileName,
            level = level,
            role = role
        })
    else
        -- 队伍数据
        local maxMembers = IsInRaid() and GetNumGroupMembers() or GetNumSubgroupMembers()
        local unitPrefix = IsInRaid() and "raid" or "party"

        for i = 1, maxMembers do
            local unit = unitPrefix .. i
            if UnitExists(unit) then
                local name = UnitName(unit)
                local class, classFileName = UnitClass(unit)
                local level = UnitLevel(unit)
                local role = self:GuessPlayerRole(classFileName)

                table.insert(members, {
                    name = name,
                    class = classFileName,
                    level = level,
                    role = role
                })
            end
        end

        -- 添加自己（如果不是团队模式）
        if not IsInRaid() then
            local playerName = UnitName("player")
            local class, classFileName = UnitClass("player")
            local level = UnitLevel("player")
            local role = self:GuessPlayerRole(classFileName)

            table.insert(members, {
                name = playerName,
                class = classFileName,
                level = level,
                role = role
            })
        end
    end

    return members
end

function CreatorFrame:CreateRaidSelectionArea()
    -- 团本选择区域背景
    local raidBg = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
    raidBg:SetSize(350, 400)
    raidBg:SetPoint("TOPLEFT", 20, -60)
    raidBg:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    raidBg:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    raidBg:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)

    -- 标题
    local raidTitle = raidBg:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    raidTitle:SetPoint("TOP", 0, -15)
    raidTitle:SetText("选择团本|cFFFF0000(必选)|r")
    raidTitle:SetTextColor(1, 1, 1, 1)

    -- 可滚动区域（支持7+个团本按钮）
    local scrollFrame = CreateFrame("ScrollFrame", nil, raidBg, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 4, -40)
    scrollFrame:SetPoint("BOTTOMRIGHT", -26, 4)

    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetWidth(scrollFrame:GetWidth() or 310)
    scrollFrame:SetScrollChild(scrollChild)

    -- 团本按钮容器（按 raidOrder 有序遍历）
    self.raidButtons = {}
    local yOffset = -10
    local raidCount = 0

    for _, raidId in ipairs(ns.raidOrder) do
        local raidData = ns.raidData[raidId]
        if raidData then
            local raidButton = self:CreateRaidButton(scrollChild, raidData, yOffset)
            self.raidButtons[raidId] = raidButton
            yOffset = yOffset - 120
            raidCount = raidCount + 1
        end
    end

    -- 设置滚动内容高度
    scrollChild:SetHeight(math.abs(yOffset) + 10)

    self.raidSelectionBg = raidBg
    self.raidScrollFrame = scrollFrame
end

function CreatorFrame:CreateRaidButton(parent, raidData, yOffset)
    local button = CreateFrame("Button", nil, parent)
    button:SetSize(320, 100)
    button:SetPoint("TOP", 0, yOffset)

    -- 按钮背景
    local bg = button:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.2, 0.2, 0.3, 0.6)

    -- 选中状态背景
    local selectedBg = button:CreateTexture(nil, "BORDER")
    selectedBg:SetAllPoints()
    selectedBg:SetColorTexture(0.3, 0.5, 0.8, 0.4)
    selectedBg:Hide()

    -- BOSS头像
            local bossImage = button:CreateTexture(nil, "ARTWORK")
            bossImage:SetSize(96, 48)  -- 使用2:1的比例，类似meetinghorn
            bossImage:SetPoint("LEFT", 10, 0)

            -- 使用工具函数设置BOSS图像
            local bossTexture = ns.Utils:GetRaidBossTexture(raidData)
--[[@debug@
            ns.Utils.DebugLog("CreatorFrame", "Setting raid boss texture:", bossTexture, "for raid:", raidData.name)
--@end-debug@]]
            ns.Utils:SetTextureAndPreventStretch(bossImage, bossTexture)

    -- 团本名称
    local raidName = button:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    raidName:SetPoint("TOPLEFT", bossImage, "TOPRIGHT", 15, 10)
    raidName:SetText(raidData.name)
    raidName:SetTextColor(1, 0.8, 0, 1)

    -- 25人标签
    local difficultyLabel = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    difficultyLabel:SetPoint("TOPLEFT", raidName, "BOTTOMLEFT", 0, -5)
    difficultyLabel:SetText("25人")
    difficultyLabel:SetTextColor(1, 0.2, 0.2, 1)

    -- 最终BOSS
    local finalBoss = button:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    finalBoss:SetPoint("TOPLEFT", difficultyLabel, "BOTTOMLEFT", 0, -5)
    finalBoss:SetText("最终BOSS: " .. raidData.finalBoss)
    finalBoss:SetTextColor(0.8, 0.8, 0.8, 1)

    -- 装等要求
    local lootLevel = button:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    lootLevel:SetPoint("TOPLEFT", finalBoss, "BOTTOMLEFT", 0, -5)
    lootLevel:SetTextColor(0.5, 1, 0.5, 1)
    button.lootLevel = lootLevel  -- 保存引用供后续更新

    -- 初始设置装等显示
    local defaultItemLevel = raidData.requirements.minItemLevel or 200
    lootLevel:SetText("装等要求: " .. defaultItemLevel)

    -- 按钮事件
    button:SetScript("OnClick", function()
        self:SelectRaid(raidData.id)
    end)

    button:SetScript("OnEnter", function()
        bg:SetColorTexture(0.3, 0.3, 0.4, 0.8)
        GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
        GameTooltip:SetText(raidData.name, 1, 1, 1)
        GameTooltip:AddLine(raidData.description, 1, 1, 1, true)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("最低等级: " .. raidData.minLevel, 0.8, 0.8, 1)
        GameTooltip:AddLine("最大人数: " .. raidData.maxPlayers, 0.8, 0.8, 1)
        local itemLevel = self:GetRaidItemLevel(raidData.id)
        if itemLevel then
            GameTooltip:AddLine("装等要求: " .. math.floor(itemLevel), 1, 0.8, 0.2)
        end
        GameTooltip:Show()
    end)

    button:SetScript("OnLeave", function()
        if button.selected then
            bg:SetColorTexture(0.3, 0.5, 0.8, 0.6)
        else
            bg:SetColorTexture(0.2, 0.2, 0.3, 0.6)
        end
        GameTooltip:Hide()
    end)

    -- 存储引用
    button.bg = bg
    button.selectedBg = selectedBg
    button.raidData = raidData
    button.selected = false

    return button
end

function CreatorFrame:CreateConfigurationArea()
    -- 配置区域背景
    local configBg = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
    configBg:SetSize(380, 400)
    configBg:SetPoint("TOPRIGHT", -20, -60)
    configBg:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    configBg:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    configBg:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)

    -- 标题
    local configTitle = configBg:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    configTitle:SetPoint("TOP", 0, -15)
    configTitle:SetText("活动配置")
    configTitle:SetTextColor(1, 1, 1, 1)

    local yPos = -50

    -- 活动模式选择
    local modeLabel = configBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    modeLabel:SetPoint("TOPLEFT", 20, yPos)
    modeLabel:SetText(L['Activity Mode'])
    modeLabel:SetTextColor(1, 1, 1, 1)

    self.modeDropdown = CreateFrame("Frame", nil, configBg, "HeroicDropDownMenuTemplate")
    self.modeDropdown:SetPoint("LEFT", modeLabel, "RIGHT", 20, 0)
    UIDropDownMenu_SetWidth(self.modeDropdown, 150)
    UIDropDownMenu_SetText(self.modeDropdown, "选择模式|cFFFF0000(必选)|r")

    local modeDropdown = self.modeDropdown
    -- 保存初始化函数引用，以便 ResetInterface 时可以重新调用
    self.modeDropdownInitFunc = function(dropdown, level)
        for _, mode in ipairs(ns.activityModes) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = mode.name
            info.value = mode.id
            info.func = function()
                UIDropDownMenu_SetSelectedValue(modeDropdown, mode.id)
                UIDropDownMenu_SetText(modeDropdown, mode.name)
                CloseDropDownMenus()
                -- 触发创建按钮状态更新
                if self and self.UpdateCreateButton then
                    self:UpdateCreateButton()
                end
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end
    UIDropDownMenu_Initialize(modeDropdown, self.modeDropdownInitFunc)

    yPos = yPos - 40

    -- 装等要求输入
    local itemLevelLabel = configBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    itemLevelLabel:SetPoint("TOPLEFT", 20, yPos)
    itemLevelLabel:SetText("装等要求")
    itemLevelLabel:SetTextColor(1, 1, 1, 1)

    self.itemLevelEditBox = CreateFrame("EditBox", nil, configBg, "HeroicEditBoxTemplate")
    self.itemLevelEditBox:SetSize(100, 20)
    self.itemLevelEditBox:SetPoint("LEFT", itemLevelLabel, "RIGHT", 20, 0)
    self.itemLevelEditBox:SetMaxLetters(3)
    self.itemLevelEditBox:SetAutoFocus(false)
    self.itemLevelEditBox:SetNumeric(true)
    self.itemLevelEditBox:SetText("200")

    -- 监听装等输入框变化，限制数值范围0-999，更新左侧显示并保存到缓存
    self.itemLevelEditBox:SetScript("OnTextChanged", function(editBox, userInput)
        local text = editBox:GetText()
        -- 移除所有非数字字符（双重保险）
        local cleaned = text:gsub("[^%d]", "")
        if cleaned ~= text then
            editBox:SetText(cleaned)
            return
        end
        -- 限制数值范围：最小0，最大999
        if cleaned ~= "" then
            local num = tonumber(cleaned) or 0
            if num > 999 then
                editBox:SetText("999")
                return
            end
            if num < 0 then
                editBox:SetText("0")
                return
            end
        end
        self:UpdateRaidItemLevelDisplays()
        self:SaveItemLevelToCache()
    end)

    -- 失去焦点时，如果为空则设为0
    self.itemLevelEditBox:SetScript("OnEditFocusLost", function(editBox)
        local text = editBox:GetText()
        if text == "" then
            editBox:SetText("0")
        end
    end)

    yPos = yPos - 40

    -- 活动说明
    local commentLabel = configBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    commentLabel:SetPoint("TOPLEFT", 20, yPos)
    commentLabel:SetText(L['Comment'])
    commentLabel:SetTextColor(1, 1, 1, 1)

    yPos = yPos - 25

    self.commentEditBox = CreateFrame("EditBox", nil, configBg, "HeroicEditBoxTemplate")
    self.commentEditBox:SetSize(340, 20)
    self.commentEditBox:SetPoint("TOPLEFT", 20, yPos)
    self.commentEditBox:SetMaxLetters(60)
    self.commentEditBox:SetAutoFocus(false)

    yPos = yPos - 40

    -- 职业配置区域
    local rolesLabel = configBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    rolesLabel:SetPoint("TOPLEFT", 20, yPos)
    rolesLabel:SetText(L['Needed Roles'])
    rolesLabel:SetTextColor(1, 1, 1, 1)

    -- 总人数显示 (动态计算)
    local totalCountLabel = configBg:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    totalCountLabel:SetPoint("RIGHT", configBg, "TOPRIGHT", -20, yPos)
            totalCountLabel:SetText("需求人数:0(队伍人数:1/25人)")
    totalCountLabel:SetTextColor(1, 1, 1, 1)
    self.totalCountLabel = totalCountLabel

    yPos = yPos - 30

    -- 创建职业配置控件
    self.roleControls = {}
    for roleName, roleConfig in pairs(ns.classConfigs) do
        local roleFrame = self:CreateRoleControl(configBg, roleName, roleConfig, yPos)
        self.roleControls[roleName] = roleFrame
        yPos = yPos - 30
    end

    self.configBg = configBg
end

function CreatorFrame:CreateRoleControl(parent, roleName, roleConfig, yPos)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(340, 25)
    frame:SetPoint("TOPLEFT", 20, yPos)

    -- 职业图标
    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(20, 20)
    icon:SetPoint("LEFT", 0, 0)
    icon:SetTexture(roleConfig.icon)

    -- 职业名称
    local roleLabel = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    roleLabel:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    roleLabel:SetText(roleConfig.displayName)
    roleLabel:SetTextColor(1, 1, 1, 1)

    -- 数量输入框
    local countEditBox = CreateFrame("EditBox", nil, frame, "HeroicEditBoxTemplate")
    countEditBox:SetSize(60, 20)
    countEditBox:SetPoint("RIGHT", 0, 0)
    countEditBox:SetMaxLetters(2)
    countEditBox:SetAutoFocus(false)
    countEditBox:SetNumeric(true)

    -- 当前数量
    local currentCount = roleConfig.minCount or 0
    countEditBox:SetText(tostring(currentCount))

    -- 输入框事件
    countEditBox:SetScript("OnTextChanged", function(editBox)
        local text = editBox:GetText()
        local newCount = tonumber(text) or 0

        -- 限制范围
        newCount = math.max(0, math.min(roleConfig.maxCount, newCount))

        -- 检查总人数限制（动态计算）
        local totalCount = self:CalculateTotalRoleCount()
        local otherRolesCount = totalCount - currentCount
        local maxRecruitableCount = self:GetMaxRecruitableCount()
        local maxAllowedForThisRole = maxRecruitableCount - otherRolesCount

        if newCount > maxAllowedForThisRole then
            newCount = math.max(0, maxAllowedForThisRole)
        end

        -- 如果值被修正，更新显示
        if newCount ~= (tonumber(text) or 0) then
            editBox:SetText(tostring(newCount))
        end

        currentCount = newCount

        -- 更新总人数显示和创建按钮状态
        self:UpdateTotalCountDisplay()
        self:UpdateCreateButton()
    end)

    -- 失去焦点时确保数值有效
    countEditBox:SetScript("OnEditFocusLost", function(editBox)
        local text = editBox:GetText()
        local newCount = tonumber(text) or 0
        newCount = math.max(0, math.min(roleConfig.maxCount, newCount))

        -- 检查总人数限制（动态计算）
        local totalCount = self:CalculateTotalRoleCount()
        local otherRolesCount = totalCount - currentCount
        local maxRecruitableCount = self:GetMaxRecruitableCount()
        local maxAllowedForThisRole = maxRecruitableCount - otherRolesCount

        if newCount > maxAllowedForThisRole then
            newCount = math.max(0, maxAllowedForThisRole)
        end

        editBox:SetText(tostring(newCount))
        currentCount = newCount

        -- 更新总人数显示和创建按钮状态
        self:UpdateTotalCountDisplay()
        self:UpdateCreateButton()
    end)

    -- 回车确认
    countEditBox:SetScript("OnEnterPressed", function(editBox)
        editBox:ClearFocus()
    end)

    -- 鼠标滚轮调整数值
    countEditBox:EnableMouseWheel(true)
    countEditBox:SetScript("OnMouseWheel", function(editBox, delta)
        local newCount = currentCount + (delta > 0 and 1 or -1)
        newCount = math.max(0, math.min(roleConfig.maxCount, newCount))

        -- 检查总人数限制（动态计算）
        local totalCount = self:CalculateTotalRoleCount()
        local otherRolesCount = totalCount - currentCount
        local maxRecruitableCount = self:GetMaxRecruitableCount()
        local maxAllowedForThisRole = maxRecruitableCount - otherRolesCount

        if newCount > maxAllowedForThisRole then
            newCount = math.max(0, maxAllowedForThisRole)
        end

        editBox:SetText(tostring(newCount))
        currentCount = newCount

        -- 更新总人数显示和创建按钮状态
        self:UpdateTotalCountDisplay()
        self:UpdateCreateButton()
    end)

    -- 存储引用
    frame.roleName = roleName
    frame.countEditBox = countEditBox
    frame.GetCount = function() return currentCount end
    frame.SetCount = function(count)
        count = math.max(0, math.min(roleConfig.maxCount, count))

        -- 检查总人数限制
        local totalCount = self:CalculateTotalRoleCount()
        local otherRolesCount = totalCount - currentCount
        local maxAllowedForThisRole = 24 - otherRolesCount

        if count > maxAllowedForThisRole then
            count = math.max(0, maxAllowedForThisRole)
        end

        currentCount = count
        countEditBox:SetText(tostring(currentCount))

        -- 更新总人数显示和创建按钮状态
        if self.UpdateTotalCountDisplay then
            self:UpdateTotalCountDisplay()
        end
        if self.UpdateCreateButton then
            self:UpdateCreateButton()
        end
    end

    return frame
end

function CreatorFrame:CreateButtonArea()
    local buttonFrame = CreateFrame("Frame", nil, self)
    buttonFrame:SetSize(760, 50)
    buttonFrame:SetPoint("BOTTOM", 0, 10) -- 向下移动10像素 (从20改为10)

    -- 创建活动按钮
    self.createButton = CreateFrame("Button", nil, buttonFrame, "UIPanelButtonTemplate")
    self.createButton:SetSize(120, 32)
    self.createButton:SetPoint("CENTER", -70, 0)
    self.createButton:SetText(L['Create Heroic Raid'])
    self.createButton:SetScript("OnClick", function() self:OnCreateClick() end)

    -- 关闭活动按钮
    self.closeButton = CreateFrame("Button", nil, buttonFrame, "UIPanelButtonTemplate")
    self.closeButton:SetSize(100, 32)
    self.closeButton:SetPoint("CENTER", 70, 0)
    self.closeButton:SetText(L['Close Activity'])
    self.closeButton:SetScript("OnClick", function() self:OnCloseClick() end)
    self.closeButton:Disable()

    self.buttonFrame = buttonFrame
end

function CreatorFrame:SelectRaid(raidId)
    -- 取消之前的选择
    for _, button in pairs(self.raidButtons) do
        button.selected = false
        button.selectedBg:Hide()
        button.bg:SetColorTexture(0.2, 0.2, 0.3, 0.6)
    end

    -- 选中新的团本
    local button = self.raidButtons[raidId]
    if button then
        button.selected = true
        button.selectedBg:Show()
        button.bg:SetColorTexture(0.3, 0.5, 0.8, 0.6)

        -- 更新职业配置默认值
        self:UpdateDefaultRoleConfiguration(raidId)

        -- 设置当前选中的团本ID（必须在加载缓存前设置）
        self.selectedRaidId = raidId

        -- 优先从缓存加载装等设置，如果没有缓存则使用默认值
        local hasLoadedFromCache = false
        if ns.Addon.db.profile.lastItemLevels and
           ns.Addon.db.profile.lastItemLevels[raidId] and
           self.itemLevelEditBox then
            local cachedItemLevel = ns.Addon.db.profile.lastItemLevels[raidId]
            self.itemLevelEditBox:SetText(tostring(cachedItemLevel))
            hasLoadedFromCache = true
        end

        -- 如果没有从缓存加载，使用默认装等要求
        if not hasLoadedFromCache then
            local raidData = ns.raidData[raidId]
            if raidData and raidData.requirements and raidData.requirements.minItemLevel and self.itemLevelEditBox then
                self.itemLevelEditBox:SetText(tostring(raidData.requirements.minItemLevel))
            end
        end

        -- 更新装等显示
        self:UpdateRaidItemLevelDisplays()
    end

    self:UpdateCreateButton()
end

function CreatorFrame:UpdateDefaultRoleConfiguration(raidId)
    -- 根据团本设置默认的职业配置
    local defaultConfigs = {
        [ns.SPEC.MOLTEN_CORE] = {tank = 3, healer = 6, dps = 16},
        [ns.SPEC.SERPENTSHRINE_CAVERN] = {tank = 2, healer = 7, dps = 16},
        [ns.SPEC.THE_EYE] = {tank = 2, healer = 7, dps = 16}
    }

    local config = defaultConfigs[raidId] or {tank = 2, healer = 6, dps = 17}

    for roleName, count in pairs(config) do
        if self.roleControls[roleName] then
            self.roleControls[roleName].SetCount(count)
        end
    end
end


function CreatorFrame:OnCloseClick()
    local success, message = ns.ActivityManager:ClosePlayerActivity()
    if success then
        self:ResetInterface()
    end
end

function CreatorFrame:ResetInterface()
    -- 重置团本选择
    for _, button in pairs(self.raidButtons) do
        button.selected = false
        button.selectedBg:Hide()
        button.bg:SetColorTexture(0.2, 0.2, 0.3, 0.6)
    end

    -- 重置下拉菜单
    UIDropDownMenu_SetSelectedValue(self.modeDropdown, nil)
    -- 重新初始化下拉框以确保内部状态一致
    if self.modeDropdownInitFunc then
        UIDropDownMenu_Initialize(self.modeDropdown, self.modeDropdownInitFunc)
    end
    -- 延迟设置文本，避免被 UIDropDownMenu_Initialize 的延迟初始化覆盖
    local dropdown = self.modeDropdown
    C_Timer.After(0, function()
        UIDropDownMenu_SetText(dropdown, "选择模式|cFFFF0000(必选)|r")
    end)

    -- 重置编辑框
    self.commentEditBox:SetText("")

    -- 重置职业配置
    for _, control in pairs(self.roleControls) do
        control.SetCount(0)
    end

    -- 重置按钮
    self.createButton:SetText(L['Create Heroic Raid'])
    self.closeButton:Disable()

    self.selectedRaidId = nil
end

function CreatorFrame:OnActivityUpdate(eventType, data)
    if eventType == "ACTIVITY_CLOSED" then
        self:ResetInterface()
    elseif eventType == "ACTIVITY_LOADED" then
        -- 加载已保存的活动
        self:LoadActivity(data)
    elseif eventType == "ACTIVITY_EXPIRED" then
        -- 活动过期时也重置界面
        self:ResetInterface()
    elseif eventType == "ACTIVITY_SYNCED" then
        -- 队伍同步后刷新职业需求显示和按钮状态
        if self.configBg then
            self:UpdateTotalCountDisplay()
            self:UpdateCreateButton()
        end
    end
end

function CreatorFrame:LoadActivity(activity)
    -- 选择对应的团本
    self:SelectRaid(activity.raidId)

    -- 设置活动模式
    UIDropDownMenu_SetSelectedValue(self.modeDropdown, activity.modeId)
    for _, mode in ipairs(ns.activityModes) do
        if mode.id == activity.modeId then
            UIDropDownMenu_SetText(self.modeDropdown, mode.name)
            break
        end
    end

    -- 设置活动说明
    self.commentEditBox:SetText(activity.comment)

    -- 设置职业配置
    for roleName, count in pairs(activity.neededRoles) do
        if self.roleControls[roleName] then
            self.roleControls[roleName].SetCount(count)
        end
    end

    -- 更新按钮
    self.createButton:SetText("更新活动")
    self.closeButton:Enable()
end

function CreatorFrame:EnsureRaidGroup()
    local groupSize = GetNumGroupMembers()
    local isInRaid = IsInRaid()

    if groupSize == 0 then
        -- 没有团队，什么都不做（玩家可以手动创建团队或邀请其他人）
        ns.Addon:Print("提示：创建活动后，你可以通过邀请其他玩家或转换为团队模式来开始组建团队")
    elseif groupSize > 0 and not isInRaid and UnitIsGroupLeader("player") then
        -- 在小队中且是队长，转换为团队
        ConvertToRaid()
    end
end

function CreatorFrame:OnShow()
    -- 加载缓存的装等设置
    self:LoadItemLevelFromCache()

    -- 不自动从缓存加载活动，只检查是否有当前活动
    local currentActivity = ns.ActivityManager and ns.ActivityManager:GetPlayerActivity()
    if currentActivity then
        -- 如果有当前活动，加载到表单中显示
        self:LoadActivityToForm(currentActivity)
    end

    -- 更新创建按钮状态
    self:UpdateCreateButton()

    -- 注册文本变化事件 + 输入清洗
    local commentEditBoxUpdating = false
    self.commentEditBox:SetScript("OnTextChanged", function()
        if commentEditBoxUpdating then return end
        local text = self.commentEditBox:GetText()
        local sanitized = ns.SanitizeComment(text, 50)
        if sanitized ~= text then
            commentEditBoxUpdating = true
            self.commentEditBox:SetText(sanitized)
            self.commentEditBox:SetCursorPosition(#sanitized)
            commentEditBoxUpdating = false
        end
        self:UpdateCreateButton()
    end)
end

function CreatorFrame:LoadActivityToForm(activity)
    -- 加载活动数据到表单，用于编辑现有活动
    if not activity then return end

    -- 选择对应的团本
    if activity.raidId then
        self:SelectRaid(activity.raidId)
    end

    -- 设置活动模式
    if activity.modeId and self.modeDropdown then
        UIDropDownMenu_SetSelectedValue(self.modeDropdown, activity.modeId)
        for _, mode in ipairs(ns.activityModes) do
            if mode.id == activity.modeId then
                UIDropDownMenu_SetText(self.modeDropdown, mode.name)
                break
            end
        end
    end

    -- 设置活动说明
    if activity.comment and self.commentEditBox then
        self.commentEditBox:SetText(activity.comment)
    end

    -- 设置装等要求
    if activity.itemLevel and self.itemLevelEditBox then
        self.itemLevelEditBox:SetText(tostring(activity.itemLevel))
    end

    -- 设置职业配置
    if activity.neededRoles and self.roleControls then
        for roleName, count in pairs(activity.neededRoles) do
            if self.roleControls[roleName] then
                self.roleControls[roleName].SetCount(count)
            end
        end
    end

    -- 更新按钮状态
    self.createButton:SetText("更新活动")
    self.closeButton:Enable()
end

-- 队伍事件监听方法
function CreatorFrame:RegisterGroupEvents()
    if not self.memberRequestBg then
        return
    end

    -- 创建事件处理框架
    if not self.groupEventFrame then
        self.groupEventFrame = CreateFrame("Frame")
        self.groupEventFrame:SetScript("OnEvent", function(frame, event, ...)
            self:OnGroupEvent(event, ...)
        end)
    end

    -- 注册队伍相关事件
    self.groupEventFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
    self.groupEventFrame:RegisterEvent("PARTY_LEADER_CHANGED")
    self.groupEventFrame:RegisterEvent("GROUP_FORMED")
    self.groupEventFrame:RegisterEvent("GROUP_LEFT")
end

function CreatorFrame:UnregisterGroupEvents()
    if self.groupEventFrame then
        self.groupEventFrame:UnregisterAllEvents()
    end
end

function CreatorFrame:OnGroupEvent(event, ...)
    -- 当队伍状态变化时更新界面（无条件更新数据，不依赖当前可见性）
    if event == "GROUP_ROSTER_UPDATE" or
       event == "PARTY_LEADER_CHANGED" or
       event == "GROUP_FORMED" or
       event == "GROUP_LEFT" then
        -- 延迟更新，确保数据已同步
        C_Timer.After(0.1, function()
            -- 更新 member tab 数据
            if self.memberRequestBg then
                self:UpdateTeamTypeAndInfo()
            end
            -- 同时更新 leader tab 数据
            if self.configBg then
                self:UpdateTotalCountDisplay()
                self:UpdateCreateButton()
            end
        end)
    end
end

-- 处理权限检查的方法
function CreatorFrame:CheckPublishPermissions()
    local groupSize = GetNumGroupMembers()
    local isInGroup = groupSize > 0
    local isLeader = UnitIsGroupLeader("player")

    if isInGroup and not isLeader then
        ns.Addon:Print("只有队长才能发布队伍需求")
        return false
    end

    return true
end

-- 处理按钮状态的权限检查（不显示提示信息）
function CreatorFrame:CheckPublishPermissionsForButton()
    local groupSize = GetNumGroupMembers()
    local isInGroup = groupSize > 0
    local isLeader = UnitIsGroupLeader("player")

    if isInGroup and not isLeader then
        return false
    end

    return true
end

-- 更新成员界面按钮状态
function CreatorFrame:UpdateMemberButtonStates()
    if not self.publishRequestButton or not self.closeRequestButton then
        return
    end

    local targetRaidId = UIDropDownMenu_GetSelectedValue(self.targetDropdown)
    local hasRequest = ns.PlayerSquareManager and ns.PlayerSquareManager:GetMyRequest() ~= nil

    -- 发布按钮逻辑：只需要选择团本和有权限，备注可选
    local hasPermission = self:CheckPublishPermissionsForButton()
    local canPublish = targetRaidId ~= nil and hasPermission

    if canPublish then
        self.publishRequestButton:Enable()
    else
        self.publishRequestButton:Disable()
    end

    -- 根据是否已有需求更新按钮文案
    if hasRequest then
        self.publishRequestButton:SetText("更新需求")
    else
        self.publishRequestButton:SetText("发布需求")
    end

    -- 关闭按钮逻辑：有活动时才能点击
    if hasRequest then
        self.closeRequestButton:Enable()
    else
        self.closeRequestButton:Disable()
    end
end

-- 重写发布点击方法，添加权限检查和活动互斥
function CreatorFrame:OnPublishRequestClick()
    -- 防重复点击：按钮级别防抖
    if self._isPublishing then
        return
    end

    -- 检查发布权限
    if not self:CheckPublishPermissions() then
        return
    end

    local targetRaidId = UIDropDownMenu_GetSelectedValue(self.targetDropdown)
    if not targetRaidId then
        ns.Addon:Print("请选择目标团本")
        return
    end

    local comment = self.commentBox:GetText():trim()
    -- 备注可以为空，不再强制要求

    -- 发布需求埋点
    local raidInfo = ns.raidData[targetRaidId]
    if raidInfo then
        ns.MeetingHornAPI:InsertLog({time(), "raid_activity_creation", {raid_name = raidInfo.name}})
    end

    -- 立即禁用按钮，防止重复点击
    self._isPublishing = true
    if self.publishRequestButton then
        self.publishRequestButton:Disable()
    end

    -- 活动互斥：发布队员需求前先关闭团长活动
    if ns.ActivityManager and ns.ActivityManager:GetPlayerActivity() then
        local success, message = ns.ActivityManager:ClosePlayerActivity()
        if success then
            ns.Addon:Print("已关闭之前的团长活动")
        end
    end

    -- 发布需求到玩家广场
    local requestData = {
        isGroup = self.memberRequestType == "group",
        targetRaidId = targetRaidId,
        comment = comment,  -- 可以为空字符串
        members = self:GetCurrentTeamData()
    }

    -- 判断是发布还是更新
    local hasExistingRequest = ns.PlayerSquareManager and ns.PlayerSquareManager:GetMyRequest() ~= nil
    local actionText = hasExistingRequest and "更新" or "发布"

    -- 调用玩家广场管理器发布需求
    if ns.PlayerSquareManager and ns.PlayerSquareManager.PublishRequest then
        local success = ns.PlayerSquareManager:PublishRequest(requestData)
        if success then
            ns.Addon:Print("队伍需求已" .. actionText .. "到玩家广场")
            -- 更新按钮状态
            self:UpdateMemberButtonStates()
            -- 跳转到个人求组 Tab [3]
            C_Timer.After(0.5, function()
                if ns.MainFrame then
                    ns.MainFrame:SwitchTab(3)
                end
            end)
        else
            ns.Addon:Print("发布失败，请稍后再试")
        end
    else
        -- 如果备注为空，显示简单消息，否则显示备注
        if comment == "" then
            ns.Addon:Print("队伍需求已" .. actionText)
        else
            ns.Addon:Print("队伍需求已" .. actionText .. ": " .. comment)
        end
        -- 跳转到个人求组 Tab [3]
        C_Timer.After(0.5, function()
            if ns.MainFrame then
                ns.MainFrame:SwitchTab(3)
            end
        end)
    end

    -- 延迟恢复按钮可点击状态
    C_Timer.After(3, function()
        self._isPublishing = false
        -- 恢复按钮状态由 UpdateMemberButtonStates 管理
        self:UpdateMemberButtonStates()
    end)
end

-- 关闭队员请求
function CreatorFrame:OnCloseRequestClick()
    if ns.PlayerSquareManager and ns.PlayerSquareManager.CloseMyRequest then
        local success = ns.PlayerSquareManager:CloseMyRequest()
        if success then
            ns.Addon:Print("队伍需求已关闭")
            -- 更新按钮状态
            self:UpdateMemberButtonStates()
        else
            ns.Addon:Print("没有可关闭的活动")
        end
    else
        ns.Addon:Print("无法关闭活动")
    end
end

-- 更新所有团本按钮的装等要求显示
function CreatorFrame:UpdateRaidItemLevelDisplays()
    if not self.itemLevelEditBox then
        return
    end

    local currentItemLevel = tonumber(self.itemLevelEditBox:GetText()) or 200

    -- 更新所有团本按钮的装等显示
    for raidId, button in pairs(self.raidButtons or {}) do
        if button.lootLevel then
            if raidId == self.selectedRaidId then
                -- 选中的团本显示当前输入的装等
                button.lootLevel:SetText("装等要求: " .. math.floor(currentItemLevel))
            else
                -- 未选中的团本显示缓存或默认装等要求
                local itemLevel = self:GetRaidItemLevel(raidId)
                if itemLevel then
                    button.lootLevel:SetText("装等要求: " .. math.floor(itemLevel))
                end
            end
        end
    end
end

-- 获取当前队伍人数
function CreatorFrame:GetCurrentGroupSize()
    local groupMembers = GetNumGroupMembers()
    -- 如果未组队，GetNumGroupMembers() 返回0，但玩家自己还是存在的
    return math.max(1, groupMembers)
end

-- 计算还需要招募的最大人数（25 - 当前队伍人数）
function CreatorFrame:GetMaxRecruitableCount()
    local currentGroupSize = self:GetCurrentGroupSize()
    -- 25人团队容量减去当前队伍人数
    return math.max(0, 25 - currentGroupSize)
end

-- 计算当前职业配置总人数
function CreatorFrame:CalculateTotalRoleCount()
    local total = 0
    if self.roleControls then
        for _, control in pairs(self.roleControls) do
            total = total + control.GetCount()
        end
    end
    return total
end

-- 更新总人数显示（动态计算）
function CreatorFrame:UpdateTotalCountDisplay()
    if not self.totalCountLabel then
        return
    end

    local currentGroupSize = self:GetCurrentGroupSize()
    local maxRecruitableCount = self:GetMaxRecruitableCount()
    local requestedCount = self:CalculateTotalRoleCount()

    local displayText = string.format("需求人数:%d(队伍人数:%d/%d人)", requestedCount, currentGroupSize, 25)

    -- 根据人数设置颜色
    if requestedCount == 0 then
        -- 没有招募需求：灰色
        self.totalCountLabel:SetTextColor(0.6, 0.6, 0.6, 1)
    elseif requestedCount > maxRecruitableCount then
        -- 超过可招募限制：红色
        self.totalCountLabel:SetTextColor(1, 0.2, 0.2, 1)
        displayText = displayText .. " |cffff0000(超过限制)|r"
    elseif requestedCount == maxRecruitableCount then
        -- 刚好满员：绿色
        self.totalCountLabel:SetTextColor(0.2, 1, 0.2, 1)
    else
        -- 正常范围：白色
        self.totalCountLabel:SetTextColor(1, 1, 1, 1)
    end

    self.totalCountLabel:SetText(displayText)
end

-- 检查是否超过人数限制并给出提示（动态计算）
function CreatorFrame:CheckTeamSizeLimit()
    local requestedCount = self:CalculateTotalRoleCount()
    local maxRecruitableCount = self:GetMaxRecruitableCount()
    local currentGroupSize = self:GetCurrentGroupSize()

    if requestedCount > maxRecruitableCount then
        ns.Addon:Print(string.format("|cffff0000你创建的活动人数超过限制！当前队伍%d人，最多还能招募%d人，但你设置了%d人，请调整后再次创建！|r",
            currentGroupSize, maxRecruitableCount, requestedCount))
        return false
    end

    return true
end

-- 重写 UpdateCreateButton 方法，加入人数检查（动态计算）
function CreatorFrame:UpdateCreateButton()
    local selectedMode = UIDropDownMenu_GetSelectedValue(self.modeDropdown)
    local comment = self.commentEditBox and self.commentEditBox:GetText() or ""
    local trimmedComment = comment and comment:trim() or ""

    -- 检查是否在队伍中但不是队长（不允许创建）
    local isInGroup = IsInGroup() or IsInRaid()
    local isLeaderOrSolo = not isInGroup or UnitIsGroupLeader("player")

    -- 检查基本条件
    local hasBasicRequirements = self.selectedRaidId and
                                selectedMode and
                                trimmedComment ~= ""

    -- 检查人数限制（动态计算）
    local totalCount = self:CalculateTotalRoleCount()
    local maxRecruitableCount = self:GetMaxRecruitableCount()
    local withinSizeLimit = totalCount <= maxRecruitableCount and totalCount > 0

    local canCreate = hasBasicRequirements and withinSizeLimit and isLeaderOrSolo

    if self.createButton then
        -- 允许 Disabled 状态下也触发 OnEnter/OnLeave
        self.createButton:SetMotionScriptsWhileDisabled(true)

        if canCreate then
            self.createButton:Enable()
            self.createButton:SetScript("OnEnter", nil)
            self.createButton:SetScript("OnLeave", nil)
        else
            self.createButton:Disable()
            if not isLeaderOrSolo then
                self.createButton:SetScript("OnEnter", function(btn)
                    GameTooltip:SetOwner(btn, "ANCHOR_TOP")
                    GameTooltip:SetText("无法创建活动", 1, 0.2, 0.2)
                    GameTooltip:AddLine("你已在队伍中但不是队长，只有队长可以创建团本活动。", 1, 1, 1, true)
                    GameTooltip:Show()
                end)
                self.createButton:SetScript("OnLeave", function()
                    GameTooltip:Hide()
                end)
            else
                self.createButton:SetScript("OnEnter", nil)
                self.createButton:SetScript("OnLeave", nil)
            end
        end
    end
end

-- 重写 OnCreateClick 方法，加入人数限制检查
function CreatorFrame:OnCreateClick()
    -- 防重复点击
    if self._isCreating then
        return
    end

    -- 非队长不允许创建
    local isInGroup = IsInGroup() or IsInRaid()
    if isInGroup and not UnitIsGroupLeader("player") then
        ns.Addon:Print("你已在队伍中但不是队长，只有队长可以创建团本活动。")
        return
    end

    if not self.selectedRaidId then
        ns.Addon:Print("请选择团本")
        return
    end

    local modeId = UIDropDownMenu_GetSelectedValue(self.modeDropdown)
    if not modeId then
        ns.Addon:Print("请选择活动模式")
        return
    end

    local comment = self.commentEditBox:GetText():trim()
    if comment == "" then
        ns.Addon:Print(L['Comment cannot be empty'])
        return
    end

    -- 检查人数限制
    if not self:CheckTeamSizeLimit() then
        return
    end

    -- 活动创建埋点
    local raidInfo = ns.raidData[self.selectedRaidId]
    if raidInfo then
        ns.MeetingHornAPI:InsertLog({time(), "raid_activity_creation", {raid_name = raidInfo.name}})
    end

    -- 立即禁用按钮，防止重复点击
    self._isCreating = true
    if self.createButton then
        self.createButton:Disable()
    end

    -- 获取职业配置
    local neededRoles = {}
    for roleName, control in pairs(self.roleControls) do
        neededRoles[roleName] = control.GetCount()
    end

    -- 活动互斥：发布团长活动前先关闭队员请求
    if ns.PlayerSquareManager and ns.PlayerSquareManager:GetMyRequest() then
        local success = ns.PlayerSquareManager:CloseMyRequest()
        if success then
            ns.Addon:Print("已关闭之前的队员请求")
        end
    end

    -- 自动创建团队（如果还没有团队的话）
    self:EnsureRaidGroup()

    -- 获取装等要求
    local customItemLevel = tonumber(self.itemLevelEditBox:GetText()) or 200

    -- 检查是否有现有活动来决定创建还是更新
    local currentActivity = ns.ActivityManager and ns.ActivityManager:GetPlayerActivity()
    local activity, isUpdate

    if currentActivity then
        -- 更新现有活动
        activity = ns.ActivityManager:UpdateActivity(
            self.selectedRaidId,
            modeId,
            comment,
            neededRoles,
            customItemLevel
        )
        isUpdate = true
    else
        -- 创建新活动
        activity = ns.ActivityManager:CreateActivity(
            self.selectedRaidId,
            modeId,
            comment,
            neededRoles,
            customItemLevel
        )
        isUpdate = false
    end

    if activity then
        if isUpdate then
            ns.Addon:Print("活动已更新")
        else
            ns.Addon:Print(L['Activity created successfully'])
        end

        self.closeButton:Enable()
        self.createButton:SetText("更新活动")

        -- 切换到我的活动页面
        C_Timer.After(0.5, function()
            if ns.MainFrame then
                ns.MainFrame:SwitchTab(4) -- 切换到我的活动页面
            end
        end)
    end

    -- 延迟恢复按钮可点击状态
    C_Timer.After(3, function()
        self._isCreating = false
        if self.createButton then
            self.createButton:Enable()
        end
    end)
end

-- 为团长界面注册队伍事件监听
function CreatorFrame:RegisterGroupEventsForLeader()
    if not self.leaderGroupEventFrame then
        self.leaderGroupEventFrame = CreateFrame("Frame")
        self.leaderGroupEventFrame:SetScript("OnEvent", function(frame, event, ...)
            self:OnLeaderGroupEvent(event, ...)
        end)
    end

    -- 注册队伍相关事件
    self.leaderGroupEventFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
    self.leaderGroupEventFrame:RegisterEvent("PARTY_LEADER_CHANGED")
    self.leaderGroupEventFrame:RegisterEvent("GROUP_FORMED")
    self.leaderGroupEventFrame:RegisterEvent("GROUP_LEFT")
end

function CreatorFrame:UnregisterGroupEventsForLeader()
    if self.leaderGroupEventFrame then
        self.leaderGroupEventFrame:UnregisterAllEvents()
    end
end

function CreatorFrame:OnLeaderGroupEvent(event, ...)
    -- 当队伍状态变化时更新团长界面的总人数显示（无条件更新数据，不依赖当前可见性）
    if event == "GROUP_ROSTER_UPDATE" or
       event == "PARTY_LEADER_CHANGED" or
       event == "GROUP_FORMED" or
       event == "GROUP_LEFT" then
        -- 延迟更新，确保数据已同步
        C_Timer.After(0.1, function()
            if self.configBg then
                self:UpdateTotalCountDisplay()
                self:UpdateCreateButton()
            end
        end)
    end
end

-- 添加界面隐藏时的清理
function CreatorFrame:OnHide()
    self:UnregisterGroupEvents()
    self:UnregisterGroupEventsForLeader()
end

-- 获取指定团本的装等要求（统一优先级：输入框 → 缓存 → 静态默认）
function CreatorFrame:GetRaidItemLevel(raidId)
    -- 1. 如果是当前选中团本且输入框有值，使用输入框值
    if raidId == self.selectedRaidId and self.itemLevelEditBox then
        local editBoxValue = tonumber(self.itemLevelEditBox:GetText())
        if editBoxValue then
            return editBoxValue
        end
    end
    -- 2. 如果缓存中有值，使用缓存值
    if ns.Addon.db and ns.Addon.db.profile and ns.Addon.db.profile.lastItemLevels and
       ns.Addon.db.profile.lastItemLevels[raidId] then
        return ns.Addon.db.profile.lastItemLevels[raidId]
    end
    -- 3. 使用静态默认值
    local raidData = ns.raidData[raidId]
    if raidData and raidData.requirements and raidData.requirements.minItemLevel then
        return raidData.requirements.minItemLevel
    end
    return 200
end

-- 保存装等要求到缓存
function CreatorFrame:SaveItemLevelToCache()
    if not self.selectedRaidId or not self.itemLevelEditBox then
        return
    end

    local itemLevel = tonumber(self.itemLevelEditBox:GetText()) or 200

    -- 初始化缓存表
    if not ns.Addon.db.profile.lastItemLevels then
        ns.Addon.db.profile.lastItemLevels = {}
    end

    -- 保存当前选择团本的装等设置
    ns.Addon.db.profile.lastItemLevels[self.selectedRaidId] = itemLevel
end

-- 从缓存加载装等要求
function CreatorFrame:LoadItemLevelFromCache()
    if not self.selectedRaidId or not self.itemLevelEditBox then
        return
    end

    -- 检查是否有缓存的装等设置
    if ns.Addon.db.profile.lastItemLevels and
       ns.Addon.db.profile.lastItemLevels[self.selectedRaidId] then
        local cachedItemLevel = ns.Addon.db.profile.lastItemLevels[self.selectedRaidId]
        self.itemLevelEditBox:SetText(tostring(cachedItemLevel))
        -- 更新显示
        self:UpdateRaidItemLevelDisplays()
    end
end

-- 注册创建活动框架类
ns.UI.CreatorFrame = CreatorFrame

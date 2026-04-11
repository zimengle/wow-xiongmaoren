-- MeetingHornIntegration.lua
-- 集成到MeetingHorn主框架的按钮

---@type MeetingHornHeroicNS
local ns = select(2, ...)

---@class MeetingHornIntegration
local MeetingHornIntegration = {}

-- 存储创建的按钮引用
local heroicZoneButton = nil

-- 初始化集成
function MeetingHornIntegration:Initialize()
    -- 等待MeetingHorn插件加载完成
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("ADDON_LOADED")
    frame:SetScript("OnEvent", function(eventFrame, event, addonName)
        if addonName == "MeetingHorn" then
            eventFrame:UnregisterEvent("ADDON_LOADED")
            -- 监听MeetingHorn框架的第一次显示
            MeetingHornIntegration:HookMeetingHornShow()
        end
    end)

    -- 如果MeetingHorn已经加载，直接监听显示事件
    if C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded("MeetingHorn") then
        MeetingHornIntegration:HookMeetingHornShow()
    end
end

-- 监听MeetingHorn框架的显示事件
function MeetingHornIntegration:HookMeetingHornShow()
    local mainPanel = ns.MeetingHornAPI:GetMainPanel()
    if mainPanel then
        -- 使用 hooksecurefunc 进行安全 post-hook，避免 taint 传播到拍卖行等 Blizzard 保护框架
        hooksecurefunc(mainPanel, "Show", function()
            -- 第一次显示时异步创建按钮，避免卡顿
            if not heroicZoneButton then
                C_Timer.After(0.1, function()
                    MeetingHornIntegration:CreateHeroicZoneButton()
                    -- 调整我们主界面的初始位置，避免被MeetingHorn遮挡
                    MeetingHornIntegration:AdjustMainFramePosition()
                end)
            end
        end)
    end
end

-- 调整主界面位置，避免被MeetingHorn遮挡
function MeetingHornIntegration:AdjustMainFramePosition(mainFrame)
    mainFrame = mainFrame or ns.MainFrame
    if not mainFrame then
        return
    end

    -- 通过统一 API 获取MeetingHorn主界面的位置
    local meetingHornFrame = ns.MeetingHornAPI:GetMainPanel()
    if meetingHornFrame and meetingHornFrame:IsShown() then
        -- 将我们的界面放在MeetingHorn右侧，保持相同的高度（顶部对齐）
        mainFrame:ClearAllPoints()
        mainFrame:SetPoint("TOPLEFT", meetingHornFrame, "TOPRIGHT", 10, 0)
    end
end

-- 获取Browser框架的函数
function MeetingHornIntegration:GetBrowserFrame()
    local mainPanel = ns.MeetingHornAPI:GetMainPanel()
    if mainPanel and mainPanel.Browser then
        return mainPanel.Browser
    end
    return nil
end

-- 创建团本招募专区按钮
function MeetingHornIntegration:CreateHeroicZoneButton()
    -- 检查是否已经创建了按钮
    if heroicZoneButton then
        return
    end

    -- 使用Browser框架的函数获取Browser容器
    local browserFrame = self:GetBrowserFrame()

    if not browserFrame then
        return
    end

    -- 创建团本招募专区按钮，使用标准按钮模板
    heroicZoneButton = CreateFrame("Button", "MeetingHornHeroicZoneButton", browserFrame, "UIPanelButtonTemplate")
    heroicZoneButton:SetSize(100, 22)

    -- 找到申请星团长按钮，在它左边放置
    local applyLeaderBtn = browserFrame.ApplyLeaderBtn
    if applyLeaderBtn then
        heroicZoneButton:SetPoint("RIGHT", applyLeaderBtn, "LEFT", -5, 0)
    else
        -- 如果找不到申请星团长按钮，使用默认位置
        heroicZoneButton:SetPoint("BOTTOMLEFT", browserFrame, "BOTTOMRIGHT", 5, -25)
    end

    -- 设置按钮文字
    heroicZoneButton:SetText("团本招募")

    -- 设置点击事件
    heroicZoneButton:SetScript("OnClick", function()
        MeetingHornIntegration:ToggleHeroicFrame()
    end)

    -- 设置鼠标悬停提示
    heroicZoneButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("团本招募专区")
        GameTooltip:AddLine("点击打开/关闭25人英雄团本招募界面", 1, 1, 1)
        GameTooltip:AddLine("支持英雄难度：熔火之心、毒蛇神殿、风暴要塞", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)

    heroicZoneButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- 设置按钮可见性
    heroicZoneButton:Show()
end

-- 切换英雄团本框架显示/隐藏
function MeetingHornIntegration:ToggleHeroicFrame()
    local mainFrame = ns.CreateMainFrame()
    if not mainFrame then
        ns.Addon:Print("|cffff0000英雄团本主框架创建失败|r")
        return
    end

    if mainFrame:IsShown() then
        mainFrame:Hide()
        PlaySound(SOUNDKIT.IG_MAINMENU_CLOSE)
    else
        -- 先调整位置，再显示，确保位置正确
        MeetingHornIntegration:AdjustMainFramePosition(mainFrame)
        mainFrame:Show()
        PlaySound(SOUNDKIT.IG_MAINMENU_OPEN)
    end
end

-- 更新按钮状态
function MeetingHornIntegration:UpdateButtonState()
    if not heroicZoneButton then
        return
    end
end

-- 隐藏按钮
function MeetingHornIntegration:HideButton()
    if heroicZoneButton then
        heroicZoneButton:Hide()
    end
end

-- 显示按钮
function MeetingHornIntegration:ShowButton()
    if heroicZoneButton then
        heroicZoneButton:Show()
    end
end

-- 获取按钮是否存在
function MeetingHornIntegration:HasButton()
    return heroicZoneButton ~= nil
end

-- 注册模块
ns.MeetingHornIntegration = MeetingHornIntegration

-- 自动初始化
MeetingHornIntegration:Initialize()
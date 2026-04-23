-- FloatingFrame.lua
-- 悬浮框：仿照 MeetingHorn DataBroker 实现

---@type MeetingHornHeroicNS
local ns = select(2, ...)

---@class HeroicFloatingFrame
local HeroicFloatingFrame = {}

-- MeetingHorn 媒体路径
local LOGO_PATH       = "Interface\\AddOns\\MeetingHornHeroic\\Media\\logo"
local DATABROKER_PATH = "Interface\\AddOns\\MeetingHorn\\Media\\DataBroker"

-- 内联图标：从 DataBroker 64×32 图集裁取两个 16×16 图标
-- ICON1（左格 0~32 列）：申请人图标
-- ICON2（右格 32~64 列）：活动数量图标
local ICON1 = string.format("|T%s:16:16:0:0:64:32:0:32:0:32|t",  DATABROKER_PATH)
local ICON2 = string.format("|T%s:16:16:0:0:64:32:32:64:0:32|t", DATABROKER_PATH)

-- 文字格式（与 MeetingHorn 一致）
local TEXT_FORMAT = ICON1 .. " %d   " .. ICON2 .. " %d"

-- Flash 闪烁纹理（新申请提醒）
local FLASH_TEX = "INTERFACE\\CHATFRAME\\ChatFrameTab-NewMessage"

function HeroicFloatingFrame:New()
    local frame = CreateFrame(
        "Button",
        "MeetingHornHeroicFloatingFrame",
        UIParent,
        BackdropTemplateMixin and "BackdropTemplate"
    )
    frame:SetSize(171, 43)
    frame:SetFrameStrata("HIGH")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForClicks("anyUp")  -- 左右键均可触发，与 MeetingHorn 一致
    frame:RegisterForDrag("LeftButton")

    -- 背景：DataBrokerBg 原版纹理，不做叠色
    local bgTex = frame:CreateTexture(nil, "BACKGROUND")
    pcall(function()
        bgTex:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\DataBrokerBg")
        bgTex:SetTexCoord(0, 0.890625, 0, 0.890625)
        bgTex:SetAllPoints()
    end)

    -- Logo 图标（左侧，34×34）
    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(34, 34)
    icon:SetPoint("LEFT", frame, "LEFT", 4, 0)
    pcall(function() icon:SetTexture(LOGO_PATH) end)
    frame.icon = icon

    -- 文字（居中偏右，蓝色以区分 MeetingHorn 原版）
    local text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    text:SetPoint("CENTER", frame, "CENTER", 16, -2)
    text:SetText("集结号团本")
    text:SetTextColor(0.4, 0.7, 1.0, 1.0)  -- 天蓝色，WoW魔法品质色
    frame.Text = text  -- 大写 Text，与 DataBroker.lua 中对应

    -- Flash 闪烁帧（有新申请时）
    local flash = CreateFrame("Frame", nil, frame)
    flash:SetHeight(30)
    flash:SetPoint("BOTTOM", frame, "BOTTOM", 0, 9)
    flash:SetPoint("LEFT",   frame, "LEFT",  45, 0)
    flash:SetPoint("RIGHT",  frame, "RIGHT", -10, 0)
    flash:Hide()
    local flashTex = flash:CreateTexture(nil, "BACKGROUND")
    flashTex:SetAllPoints()
    pcall(function()
        flashTex:SetTexture(FLASH_TEX)
        flashTex:SetBlendMode("ADD")
        flashTex:SetVertexColor(1, 0.89, 0.18, 1)
    end)
    -- OnUpdate 回调函数：模拟 BOUNCE 闪烁动画
    -- 不在创建时 SetScript，而是由 StartFlash/StopFlash 按需启停，避免 flash:Hide() 后仍每帧计算
    local flashAlpha, flashDir = 1, -1
    frame._flashUpdateFunc = function(self, elapsed)
        flashAlpha = flashAlpha + flashDir * elapsed * 1.5
        if flashAlpha <= 0 then flashAlpha = 0; flashDir = 1
        elseif flashAlpha >= 1 then flashAlpha = 1; flashDir = -1 end
        flashTex:SetAlpha(flashAlpha)
    end
    frame.Flash = flash

    -- 绑定方法（遍历 HeroicFloatingFrame 表）
    for k, v in pairs(HeroicFloatingFrame) do
        if type(v) == "function" then
            frame[k] = v
        end
    end

    -- 注册活动更新回调（节流 + 事件过滤）
    -- 只有影响活动数量的事件才触发文字刷新，聊天/成员信息等事件跳过
    if ns.ActivityManager and ns.ActivityManager.RegisterUpdateCallback then
        local REFRESH_EVENTS = {
            ACTIVITY_CREATED = true,
            ACTIVITY_UPDATED = true,
            ACTIVITY_CLOSED = true,
            ACTIVITY_EXPIRED = true,
            ACTIVITY_LOADED = true,
            ACTIVITIES_REFRESHED = true,
            ACTIVITIES_CLEANED = true,
            EXTERNAL_ACTIVITY_RECEIVED = true,
            MEMBER_JOINED = true,
            MEMBER_LEFT = true,
            ACTIVITY_SYNCED = true,
            FILTER_CHANGED = true,
        }
        ns.ActivityManager:RegisterUpdateCallback(function(eventType, data)
            if eventType == "APPLICANT_ADDED" then
                frame:StartFlash()
                frame:Update()  -- 申请者变化立即刷新
            elseif REFRESH_EVENTS[eventType] then
                frame:ScheduleUpdate()  -- 节流刷新
            end
            -- 其他事件（CHAT_RECORD_*, MEMBER_INFO_*, WHISPER_APPLICANT 等）不刷新
        end)
    end

    -- OnEnter：Tooltip（与 MeetingHorn DataBroker OnEnter 结构一致）
    frame:SetScript("OnEnter", function(self)
        local anchor = self:GetBottom() < GetScreenHeight() / 2 and "ANCHOR_TOP" or "ANCHOR_BOTTOM"
        GameTooltip:SetOwner(self, anchor)
        -- 标题
        GameTooltip:SetText("集结号团本招募", 1, 0.8, 0, 1)
        -- 副标题介绍
        GameTooltip:AddLine("专属团本招募平台", 0.8, 0.8, 0.8, 1)
        GameTooltip:AddLine(" ")
        -- 数据行
        if self:GetPlayerActivity() then
            GameTooltip:AddDoubleLine(ICON1 .. " 申请人数", self:GetApplicantCount(),   1, 1, 1, 1, 1, 1)
        else
            GameTooltip:AddDoubleLine(ICON1 .. " 我的申请", self:GetApplicationCount(), 1, 1, 1, 1, 1, 1)
        end
        GameTooltip:AddDoubleLine(ICON2 .. " 活动总数", self:GetActivityCount(), 1, 1, 1, 1, 1, 1)
        GameTooltip:Show()
    end)

    frame:SetScript("OnLeave", GameTooltip_Hide)

    -- OnClick：切换主界面，同时停止 Flash
    frame:SetScript("OnClick", function(self)
        local mainFrame = ns.CreateMainFrame()
        if mainFrame then mainFrame:Toggle() end
        self:StopFlash()
    end)

    -- 拖动
    frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, _, x, y = self:GetPoint()
        if ns.Addon and ns.Addon.db and ns.Addon.db.profile then
            ns.Addon.db.profile.floatingFrame.pos = { point = point, x = x, y = y }
        end
    end)

    -- 恢复位置
    frame:RestorePosition()

    -- 根据设置决定初始显示状态（默认 true）
    local opts = ns.Addon and ns.Addon.db and ns.Addon.db.profile and ns.Addon.db.profile.options
    frame:SetShown(not opts or opts.floatingFrame ~= false)
    frame:Update()

    return frame
end

-- ========================================================
-- 数据获取辅助
-- ========================================================

function HeroicFloatingFrame:GetActivityCount()
    if not ns.ActivityManager then return 0 end
    -- 优先使用轻量级计数（跳过 Filter/Sort/MeetingHorn 全链路）
    if ns.ActivityManager.GetRawActivityCount then
        return ns.ActivityManager:GetRawActivityCount()
    end
    -- 降级：走完整链路
    if ns.ActivityManager.GetFilteredActivities then
        local list = ns.ActivityManager:GetFilteredActivities()
        return list and #list or 0
    end
    return 0
end

function HeroicFloatingFrame:GetPlayerActivity()
    if ns.ActivityManager and ns.ActivityManager.GetPlayerActivity then
        return ns.ActivityManager:GetPlayerActivity()
    end
    return nil
end

function HeroicFloatingFrame:GetApplicantCount()
    if not ns.ActivityManager then return 0 end
    if not self:GetPlayerActivity() then return 0 end
    if ns.ActivityManager.GetApplicants then
        local applicants = ns.ActivityManager:GetApplicants()
        if not applicants then return 0 end
        local n = 0
        for _, v in pairs(applicants) do
            if v.state ~= "declined" then n = n + 1 end
        end
        return n
    end
    return 0
end

-- 玩家自己发出去的申请数（MeetingHornHeroic 当前暂无此功能，预留）
function HeroicFloatingFrame:GetApplicationCount()
    return 0
end

-- ========================================================
-- 节流刷新（2 秒内多次事件合并为一次 Update）
-- ========================================================
function HeroicFloatingFrame:ScheduleUpdate()
    if self._updateTimer then return end  -- 已有待执行的刷新，跳过
    self._updateTimer = C_Timer.NewTimer(2, function()
        self._updateTimer = nil
        self:Update()
    end)
end

-- ========================================================
-- 刷新文字（仿 MeetingHorn DataBroker:Update）
-- ========================================================
function HeroicFloatingFrame:Update()
    local firstCount = self:GetPlayerActivity()
        and self:GetApplicantCount()
        or  self:GetApplicationCount()
    local secondCount = self:GetActivityCount()

    if firstCount == 0 and secondCount == 0 then
        self.Text:SetText("集结号团本")
    else
        self.Text:SetText(string.format(TEXT_FORMAT, firstCount, secondCount))
    end
end

-- ========================================================
-- Flash 闪烁控制
-- ========================================================
function HeroicFloatingFrame:StartFlash()
    self.Flash:SetScript("OnUpdate", self._flashUpdateFunc)
    self.Flash:Show()
end

function HeroicFloatingFrame:StopFlash()
    self.Flash:Hide()
    self.Flash:SetScript("OnUpdate", nil)
end

-- ========================================================
-- 位置持久化
-- ========================================================
function HeroicFloatingFrame:RestorePosition()
    if ns.Addon and ns.Addon.db and ns.Addon.db.profile then
        local pos = ns.Addon.db.profile.floatingFrame
            and ns.Addon.db.profile.floatingFrame.pos
        if pos and pos.point then
            self:ClearAllPoints()
            self:SetPoint(pos.point, UIParent, pos.point, pos.x or 0, pos.y or 0)
            return
        end
    end
    self:ClearAllPoints()
    self:SetPoint("TOP", UIParent, "TOP", 0, -20)
end

-- 注册到 ns.UI
ns.UI.FloatingFrame = HeroicFloatingFrame

-- Channel.lua
-- MeetingHornHeroic Channel Integration with MeetingHorn

---@class MeetingHornHeroicNS
local ns = select(2, ...)

-- 频道管理器
ns.ChannelManager = {}
local ChannelManager = ns.ChannelManager

-- MeetingHorn 频道名称
local MEETINGHORN_CHANNEL = "MeetingHorn"

function ChannelManager:Initialize()
    -- 通过统一 API 获取 MeetingHorn 的 Channel 模块
    self.meetingHornChannel = ns.MeetingHornAPI:GetChannel()
    if not self.meetingHornChannel then
        -- Debug: MeetingHorn Channel module not available
        return false
    end

    -- 确保 MeetingHorn 的 Channel 模块已启用
    if not self.meetingHornChannel:IsEnabled() then
        self.meetingHornChannel:Enable()
        -- Debug: Enabled MeetingHorn Channel module
    end

    -- 等待 Channel 模块完全初始化
    if not self.meetingHornChannel.joined then
        -- Debug: MeetingHorn Channel module not fully initialized, will retry later
        -- 延迟初始化
        C_Timer.After(1, function()
            self:Initialize()
        end)
        return false
    end

    -- 确保加入 MeetingHorn 频道
    self:EnsureChannelJoined()

    -- Debug: Channel integration initialized with MeetingHorn

    return true
end

-- 确保加入频道
function ChannelManager:EnsureChannelJoined()
    if not self.meetingHornChannel then return end

    -- 检查是否已经在频道中
    if not self:IsInChannel() then
        -- 调用 MeetingHorn 的加入频道功能
        if self.meetingHornChannel.Join then
            self.meetingHornChannel:Join(MEETINGHORN_CHANNEL)
            -- Debug: Attempting to join MeetingHorn channel
        end
    end
end

-- 检查是否在频道中
function ChannelManager:IsInChannel()
    if not self.meetingHornChannel then return false end

    -- 使用 MeetingHorn 的检查方法
    if self.meetingHornChannel.GetSendChannelId then
        local channelId = self.meetingHornChannel:GetSendChannelId(MEETINGHORN_CHANNEL)
        return channelId and channelId > 0
    end

    -- 备用检查方法
    local channels = {GetChannelList()}
    for i = 1, #channels, 3 do
        if channels[i + 1] == MEETINGHORN_CHANNEL then
            return true
        end
    end

    return false
end

-- 注册消息过滤器，识别英雄团本活动
function ns.ChannelManager:RegisterMessageFilters()
    if not self.baseChannel then return end
    
    -- 添加我们的消息解析逻辑
    local originalParseMessage = self.baseChannel.ParseMessage
    if originalParseMessage then
        self.baseChannel.ParseMessage = function(self, message, sender, ...)
            -- 首先尝试用原有逻辑解析
            local activity = originalParseMessage(self, message, sender, ...)
            
            -- 如果是英雄团本消息，添加额外信息
            if activity and ns.ChannelManager:IsHeroicRaidMessage(message) then
                activity.isHeroic = true
                activity.source = "MeetingHornHeroic"
            end
            
            return activity
        end
    end
end

-- 判断消息是否为英雄团本消息
function ns.ChannelManager:IsHeroicRaidMessage(message)
    if not message then return false end
    
    local lowerMessage = string.lower(message)
    
    -- 检查是否包含英雄关键词
    if not (string.find(lowerMessage, "英雄") or string.find(lowerMessage, "heroic")) then
        return false
    end
    
    -- 检查是否包含25人
    if not string.find(lowerMessage, "25") then
        return false
    end
    
    -- 检查是否为支持的团本
    local supportedRaids = {
        "熔火", "mc", "molten",
        "毒蛇", "ssc", "serpent", 
        "风暴", "tk", "tempest", "eye"
    }
    
    for _, keyword in ipairs(supportedRaids) do
        if string.find(lowerMessage, keyword) then
            return true
        end
    end
    
    return false
end

-- 发送英雄团本活动到频道
function ChannelManager:BroadcastActivity(activity)
    if not self.meetingHornChannel or not activity then
        return false
    end

    -- 确保已加入频道
    self:EnsureChannelJoined()

    -- 生成活动消息
    local message = self:BuildActivityMessage(activity)
    if not message then
        return false
    end

    -- 获取频道ID
    local channelId = nil
    if self.meetingHornChannel.GetSendChannelId then
        channelId = self.meetingHornChannel:GetSendChannelId(MEETINGHORN_CHANNEL)
    end

    if not channelId or channelId <= 0 then
        return false
    end

    -- 发送消息到频道（使用分包协议）
    return ns.SendPacketMessage(message, channelId)
end

-- 构建活动消息，直接使用 Activity 的 ToProto 序列化方法
-- 格式：leaderName.comment.memberCount.playerLevel.raidId.modeId.neededRolesStr.leaderClass@@
function ChannelManager:BuildActivityMessage(activity)
    if not activity then return nil end

    -- 使用 Activity 的标准序列化格式，确保与 FromProto 解析格式一致
    if activity.ToProto then
        return activity:ToProto()
    end

    return nil
end

-- 获取当前频道状态
function ChannelManager:GetChannelStatus()
    if not self.meetingHornChannel then
        return "MeetingHorn频道模块不可用"
    end

    if self:IsInChannel() then
        local channelId = nil
        if self.meetingHornChannel.GetSendChannelId then
            channelId = self.meetingHornChannel:GetSendChannelId(MEETINGHORN_CHANNEL)
        end
        return format("已连接到MeetingHorn频道 (ID: %s)", channelId or "未知")
    else
        return "未连接到MeetingHorn频道"
    end
end

-- ChatManager.lua
-- 聊天频道管理器，负责活动的广播和接收
-- 核心策略：直接监听 CHAT_MSG_CHANNEL 事件，自己解析带 MHH@@ 标识的原始消息
-- 不再依赖 MeetingHorn 的 LFG 模块解析

---@type MeetingHornHeroicNS
local ns = select(2, ...)

---@class ChatManager
local ChatManager = {}
ChatManager.__index = ChatManager

-- 聊天频道配置
local CHANNEL_CONFIG = {
    defaultChannel = "大脚世界频道", -- 默认频道
    broadcastInterval = 30, -- 广播间隔(秒)
    maxBroadcastCount = 120, -- 最大广播次数（120 × 30s = 3600s = 1小时）
    activityTimeout = 180, -- 活动超时时间(秒) 3分钟无广播则自动清理
    cleanupInterval = 60, -- 清理间隔(秒)
}

-- 匹配 MHH 协议消息的 pattern：以 .MHH@@ 结尾
local MHH_PROTO_PATTERN = "%.MHH@@$"
-- 匹配 MHHPS 协议消息的 pattern：以 .MHHPS@@ 结尾（个人求组）
local MHHPS_PROTO_PATTERN = "%.MHHPS@@$"
-- 匹配 MHHPS 关闭消息的 pattern：CLOSE.xxx.MHHPS@@
local MHHPS_CLOSE_PATTERN = "^CLOSE%.(.-)%.MHHPS@@$"
-- 匹配 MHH 关闭消息的 pattern：CLOSE.leaderName.MHH@@
local MHH_CLOSE_PATTERN = "^CLOSE%.(.-)%.MHH@@$"

-- ============================================================
-- 分包协议（参考 MeetingStone/NetEaseBroadMiddleware）
-- 使用 MHH 前缀避免与 MeetingHorn 的 @#&$ 控制字符冲突
-- ============================================================
local PACKET_FIRST = 'MHH#'  -- 首包
local PACKET_NEXT  = 'MHH&'  -- 中间包
local PACKET_LAST  = 'MHH$'  -- 末包
local PACKET_ONE   = 'MHH@'  -- 单包（消息不需要分割）
local PACKET_PREFIX_LEN = 4  -- 前缀长度
local MAX_PACKET_LEN = 250   -- 每包最大数据长度（254 - 4前缀）

function ChatManager:New()
    local manager = {
        currentActivity = nil, -- 当前玩家创建的活动
        receivedActivities = {}, -- 接收到的其他玩家活动（按 GUID 索引）
        cleanupTimer = nil,
        eventFrame = nil,
        isListening = false,
        -- 独立的聊天记录（不依赖活动，存储所有私聊消息）
        chatRecords = {},
        -- 记录最后收到消息的发送者（用于快速回复）
        lastReceivedFrom = nil,
        -- 聊天更新回调（用于通知UI刷新聊天记录列表）
        chatUpdateCallbacks = {},
        -- 分包接收缓存：按发送者名缓存 { [senderName] = { parts } }
        packetCache = {},
        -- 团队聊天记录（内存不限条数，DB 持久化最近 10 条，与私聊分开储存）
        teamChatRecords = {},
        -- 团队聊天 ADDON 分包接收缓存
        teamChatPacketCache = {},
        -- 私聊对方通过 ADDON 发来的个人信息缓存 { [playerName] = {class, level, itemLevel} }
        whisperProfileCache = {},
        -- 两阶段广播定时器（参考 meetinghorn LFG 的 activityTimer + sendTimer）
        activityTimer = nil, -- 冷却阶段定时器
        sendTimer = nil, -- 发送阶段定时器
        -- 广播冷却状态（持久化到 db.profile.cache.cooldown）
        cooldown = { start = 0, duration = 0 },
        -- 广播计数
        broadcastCount = 0,
        -- MeetingHorn 活动缓存（脏标记失效策略）
        mhActivityCache = {},
        mhActivityCacheDirty = true,
        -- DB 写入节流（脏标记 + 延迟批量写入）
        -- C_Timer.After 返回 nil，用 pending 布尔标记代替 timer 引用
        chatRecordsDirty = false,
        chatRecordsSavePending = false,
        teamChatRecordsDirty = false,
        teamChatRecordsSavePending = false,
    }

    setmetatable(manager, self)
    manager:Initialize()
    return manager
end

-- 插件通信前缀
local ADDON_PREFIX = "MHH_SYNC"
-- 团队聊天通信前缀
local ADDON_CHAT_PREFIX = "MHH_CHAT"
-- ADDON 通道每包最大数据长度（255 - 4前缀）
local ADDON_MAX_PACKET_LEN = 251

function ChatManager:Initialize()
    -- 创建事件监听框架
    self.eventFrame = CreateFrame("Frame")
    self.eventFrame:RegisterEvent("CHAT_MSG_CHANNEL")
    self.eventFrame:RegisterEvent("CHAT_MSG_WHISPER")
    self.eventFrame:RegisterEvent("CHAT_MSG_WHISPER_INFORM")
    -- GROUP_ROSTER_UPDATE 由 Manager 统一注册处理，避免双重处理
    self.eventFrame:RegisterEvent("CHAT_MSG_ADDON")
    -- 团队/队伍聊天频道（聊天室直接监听）
    self.eventFrame:RegisterEvent("CHAT_MSG_RAID")
    self.eventFrame:RegisterEvent("CHAT_MSG_RAID_LEADER")
    self.eventFrame:RegisterEvent("CHAT_MSG_PARTY")
    self.eventFrame:RegisterEvent("CHAT_MSG_PARTY_LEADER")

    -- 注册插件通信前缀
    C_ChatInfo.RegisterAddonMessagePrefix(ADDON_PREFIX)
    C_ChatInfo.RegisterAddonMessagePrefix(ADDON_CHAT_PREFIX)

    self.eventFrame:SetScript("OnEvent", function(frame, event, ...)
        self:OnEvent(event, ...)
    end)

    -- 存储成员信息（由协议同步获取）
    self.memberInfoCache = {}

    -- 初始化 errorBlocker（参考 meetinghorn LFG:OnEnable 的实现）
    self:InitializeErrorBlocker()

    -- 监听 MeetingHorn 的 Ace3 消息事件，实现活动列表自动刷新
    self:RegisterMeetingHornMessages()

    -- 启动清理定时器
    self:StartCleanupTimer()

    -- 延迟加载聊天记录（等待数据库就绪）
    C_Timer.After(1.5, function()
        self:LoadChatRecords()
    end)
end

-- ============================================================
-- ErrorBlocker：安全发送保护（参考 meetinghorn LFG:OnEnable）
-- 在 SendChatMessage 前后临时接管 ADDON_ACTION_BLOCKED 事件
-- 检测是否触发了 taint（战斗中/loading 等受保护状态）
-- ============================================================
function ChatManager:InitializeErrorBlocker()
    self.errorBlocker = CreateFrame('Frame')
    self.errorBlocker:RegisterEvent('ADDON_ACTION_BLOCKED')
    self.errorBlocker:SetScript('OnEvent', function(self)
        self.ok = nil
    end)
    self.errorBlocker.Start = function(self)
        self.ok = true
        self.frames = { GetFramesRegisteredForEvent('ADDON_ACTION_BLOCKED') }
        for _, frame in ipairs(self.frames) do
            if frame ~= self then
                frame:UnregisterEvent('ADDON_ACTION_BLOCKED')
            end
        end
    end
    self.errorBlocker.End = function(self)
        for _, frame in ipairs(self.frames) do
            frame:RegisterEvent('ADDON_ACTION_BLOCKED')
        end
    end
    self.errorBlocker.IsOk = function(self)
        return self.ok
    end
end

-- 安全发送到频道（pcall + errorBlocker 保护）
-- 供 ChatManager 和 PlayerSquareManager 共用
function ns.SafeSendToChannel(message, channelId, errorBlocker)
    if not message or not channelId or channelId <= 0 then
        return false
    end
    if not errorBlocker then
        -- 无 errorBlocker 时直接 pcall 发送
        local ok = pcall(SendChatMessage, message, 'CHANNEL', nil, channelId)
        return ok
    end
    errorBlocker:Start()
    pcall(SendChatMessage, message, 'CHANNEL', nil, channelId)
    errorBlocker:End()
    return errorBlocker:IsOk()
end

-- 注册 MeetingHorn 的 Ace3 全局消息监听
-- MeetingHorn 通过 AceEvent 的 SendMessage 通知活动变化
-- 我们通过同一总线接收这些消息来触发列表刷新
function ChatManager:RegisterMeetingHornMessages()
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then
        -- 延迟重试：AceEvent 可能还没加载
        C_Timer.After(3, function()
            self:RegisterMeetingHornMessages()
        end)
        return
    end

    -- 创建一个轻量级消息接收器
    if not self.messageReceiver then
        self.messageReceiver = {}
        AceEvent:Embed(self.messageReceiver)
    end

    local receiver = self.messageReceiver

    -- 监听 MeetingHorn 活动更新（活动数据变化，如成员数/说明更新）
    receiver:RegisterMessage("MEETINGHORN_ACTIVITY_UPDATE", function()
        self.mhActivityCacheDirty = true
        self:FireUpdateCallbacks("MEETINGHORN_ACTIVITY_UPDATE")
    end)

    -- 监听 MeetingHorn 新活动添加
    receiver:RegisterMessage("MEETINGHORN_ACTIVITY_ADDED", function()
        self.mhActivityCacheDirty = true
        self:FireUpdateCallbacks("MEETINGHORN_ACTIVITY_ADDED")
    end)

    -- 监听 MeetingHorn 活动移除
    receiver:RegisterMessage("MEETINGHORN_ACTIVITY_REMOVED", function()
        self.mhActivityCacheDirty = true
        self:FireUpdateCallbacks("MEETINGHORN_ACTIVITY_REMOVED")
    end)
end

function ChatManager:OnEvent(event, ...)
    if event == "CHAT_MSG_CHANNEL" then
        self:OnChannelMessage(...)
    elseif event == "CHAT_MSG_WHISPER" then
        self:OnWhisperReceived(...)
    elseif event == "CHAT_MSG_WHISPER_INFORM" then
        self:OnWhisperSent(...)
    elseif event == "CHAT_MSG_ADDON" then
        self:OnAddonMessage(...)
    -- GROUP_ROSTER_UPDATE 已由 Manager 统一处理，ChatManager 不再独立注册
    elseif event == "CHAT_MSG_RAID" or event == "CHAT_MSG_RAID_LEADER"
        or event == "CHAT_MSG_PARTY" or event == "CHAT_MSG_PARTY_LEADER" then
        self:OnGroupChatMessage(event, ...)
    end
end

-- ============================================================
-- 频道消息接收与解析（核心变更：直接监听频道原始消息）
-- ============================================================

-- 处理频道消息
function ChatManager:OnChannelMessage(text, unitName, languageName, channelString, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineId, guid)
    if not text or not unitName then
        return
    end

    -- 快速首字节检查：所有 MHH/MHHPS 协议前缀都以 'M' 开头（ASCII 77）
    -- 跳过大量不相关的频道消息，避免不必要的 sub/匹配开销
    if string.byte(text, 1) ~= 77 then
        return
    end

    -- 不处理自己的消息
    local playerName = UnitName("player")
    local senderName = Ambiguate(unitName, "none")
    if senderName == playerName then
        return
    end

    -- ============================================================
    -- 分包接收拼接逻辑
    -- 前缀：MHH# 首包, MHH& 中间包, MHH$ 末包, MHH@ 单包
    -- ============================================================
    local prefix = text:sub(1, PACKET_PREFIX_LEN)
    if prefix == PACKET_ONE or prefix == PACKET_FIRST or prefix == PACKET_NEXT or prefix == PACKET_LAST then
        local data = text:sub(PACKET_PREFIX_LEN + 1)
        if prefix == PACKET_ONE then
            -- 单包：直接处理
            self:HandleCompleteMessage(data, senderName, guid, lineId)
            return
        elseif prefix == PACKET_FIRST then
            -- 首包：清空缓存，开始新消息
            self.packetCache[senderName] = { data }
            return
        elseif prefix == PACKET_NEXT then
            -- 中间包：追加到缓存
            if self.packetCache[senderName] then
                table.insert(self.packetCache[senderName], data)
            end
            return
        elseif prefix == PACKET_LAST then
            -- 末包：追加并拼接
            if self.packetCache[senderName] then
                table.insert(self.packetCache[senderName], data)
                local fullMessage = table.concat(self.packetCache[senderName])
                self.packetCache[senderName] = nil
                self:HandleCompleteMessage(fullMessage, senderName, guid, lineId)
            end
            return
        end
    end

    -- 非分包消息（兼容旧格式 / MeetingHorn 原版消息，不带 MHH 前缀）
    self:HandleCompleteMessage(text, senderName, guid, lineId)
end

-- 处理完整的（已拼接的）消息
function ChatManager:HandleCompleteMessage(text, senderName, guid, lineId)
    if not text then return end

    -- 优先检查个人求组消息（MHHPS@@）
    if self:IsMHHPSProtoMessage(text) then
        self:HandlePlayerSquareMessage(text, senderName, guid)
        return
    end

    -- 检查团本招募关闭消息（CLOSE.xxx.MHH@@）
    local closeLeaderName = string.match(text, MHH_CLOSE_PATTERN)
    if closeLeaderName then
        -- 移除该队长的活动
        for key, activity in pairs(self.receivedActivities) do
            if activity.leaderName == senderName then
                self.receivedActivities[key] = nil
                self:FireUpdateCallbacks("ACTIVITIES_CLEANED", 1)
                break
            end
        end
        return
    end

    -- 检查团本招募消息（MHH@@）
    if self:IsMHHProtoMessage(text) then
        local activity = self:ParseMHHProto(text, senderName, guid, lineId)
        if activity then
            local key = guid or senderName
            self.receivedActivities[key] = activity

            if ns.ActivityManager then
                ns.ActivityManager:OnExternalActivityReceived(activity)
            end
            self:FireUpdateCallbacks("ACTIVITY_RECEIVED", activity)
        end
    end
end

-- 检查消息是否是 MHH 团本招募协议消息
-- 前置条件：调用方须先排除 MHHPS 消息（HandleCompleteMessage 已保证）
function ChatManager:IsMHHProtoMessage(text)
    return text and string.find(text, MHH_PROTO_PATTERN) ~= nil
end

-- 检查消息是否是 MHHPS 个人求组协议消息
function ChatManager:IsMHHPSProtoMessage(text)
    -- MHHPS 协议消息格式：...MHHPS@@ 或 CLOSE.xxx.MHHPS@@
    return text and (string.find(text, MHHPS_PROTO_PATTERN) ~= nil or string.find(text, MHHPS_CLOSE_PATTERN) ~= nil)
end

-- 处理个人求组频道消息
function ChatManager:HandlePlayerSquareMessage(text, senderName, guid)
    if not ns.PlayerSquareManager then
        return
    end

    -- 检查是否是关闭消息
    local closeRequestId = string.match(text, MHHPS_CLOSE_PATTERN)
    if closeRequestId then
        -- 查找并移除对应的远程请求
        for id, request in pairs(ns.PlayerSquareManager.requests) do
            if request.playerName == senderName and request.isRemote then
                ns.PlayerSquareManager.requests[id] = nil
                ns.PlayerSquareManager:TriggerEvent("PLAYER_SQUARE_UPDATED")
                break
            end
        end
        return
    end

    -- 解析求组请求
    local request = ns.PlayerSquareManager:FromProto(text, senderName, guid)
    if request then
        -- 使用 playerName 作为去重键，同一玩家只保留最新请求
        -- 先移除该玩家之前的请求
        for id, existingRequest in pairs(ns.PlayerSquareManager.requests) do
            if existingRequest.playerName == senderName and existingRequest.isRemote then
                ns.PlayerSquareManager.requests[id] = nil
                break
            end
        end

        -- 添加新请求
        ns.PlayerSquareManager:AddRequest(request)
    end
end

-- 解析 MHH 协议消息，生成 HeroicRaidActivity 对象
-- 协议格式：leaderName.comment.memberCount.playerLevel.raidId.modeId.neededRolesStr.leaderClass.MHH@@
function ChatManager:ParseMHHProto(proto, senderName, guid, lineId)
    if not proto then
        return nil
    end

    -- 使用 HeroicRaidActivity:FromProto 进行解析
    local activity = ns.HeroicRaidActivity:FromProto(proto)
    if not activity then
        return nil
    end

    -- 使用实际发送者名称覆盖（防止伪造）
    activity.leaderName = senderName

    -- 设置 GUID 和职业信息
    if guid then
        activity:SetLeaderGUID(guid, senderName)
    end

    -- 标记为远程活动
    activity.isOurAddonCreate = false
    -- 标记来源
    activity._source = "channel"
    activity._lineId = lineId

    return activity
end

function ChatManager:OnActivityReceived(activity)
    if not activity then return end
    -- 更新接收到的活动列表
    local key = activity.leaderName or "unknown"
    self.receivedActivities[key] = activity
    
    -- 通知活动管理器有新活动
    if ns.ActivityManager then
        ns.ActivityManager:OnExternalActivityReceived(activity)
    end
    
    -- 触发UI更新
    self:FireUpdateCallbacks("ACTIVITY_RECEIVED", activity)
end

function ChatManager:OnWhisperReceived(message, sender, languageName, channelString, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)
    -- 处理收到的密语（无条件记录，不再要求有活动或是团长）
    self:RecordApplicantWhisper(sender, message, "received")
end

function ChatManager:OnWhisperSent(message, receiver, languageName, channelString, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)
    -- 处理发送的密语
    self:RecordApplicantWhisper(receiver, message, "sent")
end

-- 通过 ADDON 通道发送个人信息给私聊对象（官方聊天窗口不可见）
function ChatManager:SendWhisperProfile(targetName)
    if not targetName or targetName == "" then return end
    local _, senderClass = UnitClass("player")
    local senderLevel = UnitLevel("player")
    local senderItemLevel = 0
    if GetAverageItemLevel then
        local avg, equipped = GetAverageItemLevel()
        senderItemLevel = math.floor(equipped or avg or 0)
    end
    local profileData = string.format("P.%s.%d.%d",
        senderClass or "UNKNOWN", senderLevel or 0, senderItemLevel)
    C_ChatInfo.SendAddonMessage(ADDON_CHAT_PREFIX, PACKET_ONE .. profileData, "WHISPER", targetName)
end

function ChatManager:RecordApplicantWhisper(playerName, message, direction)
    -- 统一名字格式：去掉服务器后缀，确保与 UnitName() 返回的纯名字一致
    playerName = Ambiguate(playerName, "short")

    -- 构建聊天记录
    local record = {
        playerName = playerName,
        message = message,
        direction = direction, -- "sent" 或 "received"
        timestamp = time(),
        playerLevel = nil, -- 稍后获取
        playerClass = nil,
        itemLevel = nil,
        replyTo = nil -- 回复目标（仅发送消息时有效）
    }

    -- 尝试获取玩家信息（收到和发送的消息都获取）
    if direction == "received" then
        self:GetPlayerInfo(playerName, record)
        -- 更新最后收到消息的发送者（用于快速回复）
        self.lastReceivedFrom = playerName
    else
        -- 发送消息时，填充自己的信息
        record.playerLevel = UnitLevel("player")
        record.playerClass = select(2, UnitClass("player"))
        -- 标记回复目标（如果存在最近收到消息的发送者）
        if self.lastReceivedFrom then
            record.replyTo = self.lastReceivedFrom
        end
    end

    -- 1. 写入独立的 chatRecords（不依赖活动，用于持久化和无活动显示）
    if not self.chatRecords then
        self.chatRecords = {}
    end
    table.insert(self.chatRecords, record)

    -- 2. 如果有活动，也写入 activity.chatRecords（保持向后兼容）
    if self.currentActivity then
        if not self.currentActivity.chatRecords then
            self.currentActivity.chatRecords = {}
        end
        table.insert(self.currentActivity.chatRecords, record)
    end

    -- 延迟批量写入（2s 节流，避免高频密语时每条都全量序列化 DB）
    self:ScheduleChatRecordsSave()

    -- 通知UI更新聊天记录
    self:FireUpdateCallbacks("CHAT_RECORD_ADDED", record)
    self:FireChatUpdateCallbacks("CHAT_RECORD_ADDED", record)
end

function ChatManager:GetPlayerInfo(playerName, record)
    -- 尝试通过多种方式获取玩家信息
    local unit = self:GetUnitForPlayer(playerName)

    if unit then
        -- 能找到 unit，直接获取信息
        record.playerLevel = UnitLevel(unit)
        record.playerClass = select(2, UnitClass(unit))
    else
        -- 尝试直接用名字获取
        local level = UnitLevel(playerName)
        local _, classFileName = UnitClass(playerName)
        if level and level > 0 then
            record.playerLevel = level
        end
        if classFileName then
            record.playerClass = classFileName
        end
    end

    -- 如果 unit API 和直接名字查询都没获取到完整信息，尝试从 memberInfoCache 回退
    if not record.playerClass or not record.playerLevel or record.playerLevel == 0 then
        local cachedInfo = self:GetCachedMemberInfo(playerName)
        if cachedInfo then
            if not record.playerClass and cachedInfo.class then
                record.playerClass = cachedInfo.class
            end
            if (not record.playerLevel or record.playerLevel == 0) and cachedInfo.level and cachedInfo.level > 0 then
                record.playerLevel = cachedInfo.level
            end
            if cachedInfo.itemLevel and cachedInfo.itemLevel > 0 then
                record.itemLevel = cachedInfo.itemLevel
            end
        end
    end

    -- 如果仍然没有装等信息，设为 nil
    if not record.itemLevel then
        record.itemLevel = nil
    end
end

-- 根据玩家名查找对应的 unit ID
function ChatManager:GetUnitForPlayer(playerName)
    -- 检查是否是自己
    if UnitName("player") == playerName then
        return "player"
    end

    -- 检查目标
    if UnitExists("target") and UnitName("target") == playerName then
        return "target"
    end

    -- 在团队中搜索
    if IsInRaid() then
        for i = 1, 40 do
            local unit = "raid" .. i
            if UnitExists(unit) and UnitName(unit) == playerName then
                return unit
            end
        end
    elseif IsInGroup() then
        -- 在小队中搜索
        for i = 1, 4 do
            local unit = "party" .. i
            if UnitExists(unit) and UnitName(unit) == playerName then
                return unit
            end
        end
    end

    return nil
end

        -- ========== 聊天记录持久化 ==========
        local CHAT_DB_MAX_RECORDS = 50  -- DB 持久化最大条数（私聊和团队频道共用）

-- ========== 聊天记录持久化通用辅助 ==========

-- 通用 FIFO DB 保存：将 records 最新 maxCount 条写入 db.profile[dbKey]
-- fields: { dbField = recordField, ... } 的映射表（字段名相同时可省略 value）
-- 内存列表不受影响
function ChatManager:_SaveRecordsToDB(dbKey, records, maxCount, fields)
    if not ns.Addon.db or not ns.Addon.db.profile then
        return
    end
    if not records then
        records = {}
    end

    local totalRecords = #records
    local startIndex = math.max(1, totalRecords - maxCount + 1)

    ns.Addon.db.profile[dbKey] = {}
    local dbIndex = 1
    for i = startIndex, totalRecords do
        local record = records[i]
        local entry = {}
        for _, fieldName in ipairs(fields) do
            entry[fieldName] = record[fieldName]
        end
        ns.Addon.db.profile[dbKey][dbIndex] = entry
        dbIndex = dbIndex + 1
    end
end

-- 保存私聊记录到数据库（DB 仅保存最近 CHAT_DB_MAX_RECORDS 条 FIFO，内存不限制）
function ChatManager:SaveChatRecords()
    if not self.chatRecords then
        self.chatRecords = {}
    end
    self:_SaveRecordsToDB("chatRecords", self.chatRecords, CHAT_DB_MAX_RECORDS, {
        "playerName", "message", "direction", "timestamp",
        "playerLevel", "playerClass", "itemLevel", "replyTo"
    })
end

-- 保存团队聊天记录到数据库（DB 仅保存最近 CHAT_DB_MAX_RECORDS 条 FIFO，内存不限制）
function ChatManager:SaveTeamChatRecords()
    if not self.teamChatRecords then
        self.teamChatRecords = {}
    end
    self:_SaveRecordsToDB("teamChatRecords", self.teamChatRecords, CHAT_DB_MAX_RECORDS, {
        "playerName", "message", "direction", "chatType",
        "replyToName", "senderClass", "senderLevel", "senderItemLevel", "timestamp"
    })
end

-- 从数据库加载私聊记录
function ChatManager:LoadChatRecords()
    if not ns.Addon.db or not ns.Addon.db.profile then
        return
    end

    local savedRecords = ns.Addon.db.profile.chatRecords
    if not savedRecords then
        -- 尝试加载团队聊天（即使私聊无记录也要加载）
        self:LoadTeamChatRecords()
        return
    end

    -- 恢复私聊记录
    self.chatRecords = {}
    for i, saved in ipairs(savedRecords) do
        table.insert(self.chatRecords, {
            playerName = saved.playerName,
            message = saved.message,
            direction = saved.direction,
            timestamp = saved.timestamp,
            playerLevel = saved.playerLevel,
            playerClass = saved.playerClass,
            itemLevel = saved.itemLevel,
            replyTo = saved.replyTo
        })
    end

    -- 同时加载团队聊天记录
    self:LoadTeamChatRecords()
end

-- 从数据库加载团队聊天记录
function ChatManager:LoadTeamChatRecords()
    if not ns.Addon.db or not ns.Addon.db.profile then
        return
    end

    local savedRecords = ns.Addon.db.profile.teamChatRecords
    if not savedRecords then
        return
    end

    -- 恢复团队聊天记录
    self.teamChatRecords = {}
    for _, saved in ipairs(savedRecords) do
        table.insert(self.teamChatRecords, {
            playerName = saved.playerName,
            message = saved.message,
            direction = saved.direction,
            chatType = saved.chatType,
            replyToName = saved.replyToName,
            senderClass = saved.senderClass,
            senderLevel = saved.senderLevel,
            senderItemLevel = saved.senderItemLevel,
            timestamp = saved.timestamp
        })
    end
end

-- 获取聊天记录（返回独立存储的记录，不依赖 currentActivity）
function ChatManager:GetChatRecords()
    return self.chatRecords or {}
end

-- 注册聊天更新回调
function ChatManager:RegisterChatUpdateCallback(callback)
    if not self.chatUpdateCallbacks then
        self.chatUpdateCallbacks = {}
    end
    table.insert(self.chatUpdateCallbacks, callback)
end

-- 触发聊天更新回调
function ChatManager:FireChatUpdateCallbacks(eventType, data)
    if not self.chatUpdateCallbacks then
        return
    end
    for _, callback in ipairs(self.chatUpdateCallbacks) do
        callback(eventType, data)
    end
end

-- 更新聊天记录中的玩家信息（在玩家加入队伍后调用）
function ChatManager:UpdateChatRecordPlayerInfo(playerName, info)
    if not self.chatRecords then
        return
    end

    for _, record in ipairs(self.chatRecords) do
        if record.playerName == playerName then
            if info.class then
                record.playerClass = info.class
            end
            if info.level then
                record.playerLevel = info.level
            end
            if info.itemLevel then
                record.itemLevel = info.itemLevel
            end
        end
    end

    -- 同步更新 activity.chatRecords（如果存在）
    if self.currentActivity and self.currentActivity.chatRecords then
        for _, record in ipairs(self.currentActivity.chatRecords) do
            if record.playerName == playerName then
                if info.class then
                    record.playerClass = info.class
                end
                if info.level then
                    record.playerLevel = info.level
                end
                if info.itemLevel then
                    record.itemLevel = info.itemLevel
                end
            end
        end
    end

    -- 延迟批量写入
    self:ScheduleChatRecordsSave()
    self:FireChatUpdateCallbacks("CHAT_RECORD_INFO_UPDATED", { playerName = playerName })
end

-- 刷新聊天记录中所有队伍成员的信息
function ChatManager:RefreshChatRecordsFromGroup()
    if not self.chatRecords then
        return
    end

    -- 构建 name→unit 查找表，避免对每条记录做 raid1~40 线性扫描
    local unitLookup = {}
    local myName = UnitName("player")
    if myName then unitLookup[myName] = "player" end
    if IsInRaid() then
        for i = 1, 40 do
            local unit = "raid" .. i
            if UnitExists(unit) then
                local name = UnitName(unit)
                if name then unitLookup[name] = unit end
            end
        end
    elseif IsInGroup() then
        for i = 1, 4 do
            local unit = "party" .. i
            if UnitExists(unit) then
                local name = UnitName(unit)
                if name then unitLookup[name] = unit end
            end
        end
    end

    local updated = false

    for _, record in ipairs(self.chatRecords) do
        local unit = unitLookup[record.playerName]
        if unit then
            -- 玩家在队伍中，更新信息
            local newLevel = UnitLevel(unit)
            local _, newClass = UnitClass(unit)

            if newLevel and newLevel > 0 and record.playerLevel ~= newLevel then
                record.playerLevel = newLevel
                updated = true
            end

            if newClass and record.playerClass ~= newClass then
                record.playerClass = newClass
                updated = true
            end
        end
    end

    if updated then
        self:ScheduleChatRecordsSave()
        self:FireChatUpdateCallbacks("CHAT_RECORDS_REFRESHED", nil)
    end
end

-- ========== 活动管理 ==========

-- 创建并开始广播活动
function ChatManager:StartActivity(activity)
    if self.currentActivity then
        self:StopActivity()
    end
    
    self.currentActivity = activity
    self.broadcastCount = 0
    self:StartBroadcastTimer()
end

-- 停止当前活动的广播（参考 meetinghorn LFG:CloseActivity）
function ChatManager:StopActivity()
    -- 停止两阶段定时器
    self:StopActivityTimer()
    self:StopSendTimer()

    if self.currentActivity then
        -- 广播关闭消息通知其他玩家移除此活动
        self:BroadcastActivityClosure()
        self.currentActivity = nil
    end

    -- 清空广播状态
    self.broadcastCount = 0

    -- 强制刷新：活动关闭时立即 flush 所有待写入的聊天记录
    self:FlushChatRecords()
    self:FlushTeamChatRecords()
end

-- ============================================================
-- DB 写入节流：脏标记 + 延迟批量写入
-- 避免每条消息到达时立即全量序列化 SavedVariables
-- ============================================================

function ChatManager:ScheduleChatRecordsSave()
    self.chatRecordsDirty = true
    if not self.chatRecordsSavePending then
        self.chatRecordsSavePending = true
        C_Timer.After(2, function()
            self:FlushChatRecords()
        end)
    end
end

function ChatManager:FlushChatRecords()
    self.chatRecordsSavePending = false
    if self.chatRecordsDirty then
        self:SaveChatRecords()
        self.chatRecordsDirty = false
    end
end

function ChatManager:ScheduleTeamChatRecordsSave()
    self.teamChatRecordsDirty = true
    if not self.teamChatRecordsSavePending then
        self.teamChatRecordsSavePending = true
        C_Timer.After(2, function()
            self:FlushTeamChatRecords()
        end)
    end
end

function ChatManager:FlushTeamChatRecords()
    self.teamChatRecordsSavePending = false
    if self.teamChatRecordsDirty then
        self:SaveTeamChatRecords()
        self.teamChatRecordsDirty = false
    end
end

-- 广播团本活动关闭消息，通知其他客户端移除该活动
-- 关闭消息作为快速通知，即使丢失也有 3 分钟超时兜底
function ChatManager:BroadcastActivityClosure()
    local playerName = UnitName("player")
    if not playerName then return end

    local closeMessage = string.format("CLOSE.%s.MHH@@", playerName)
    local channelId = self:GetSendChannelId()
    if channelId and channelId > 0 then
        self:SendPacketMessage(closeMessage, channelId)
    end
end

-- ============================================================
-- 两阶段广播引擎（参考 meetinghorn LFG 的 activityTimer + sendTimer）
--
-- 流程：
--   StartBroadcastTimer() → activityTimer(cooldown)
--                                ↓ 触发
--                        OnActivityTimer()
--                          - AFK → 跳过，等下次
--                          - 无频道 → EnsureChannelJoined + 短间隔重试
--                          - 有频道 → sendTimer(0.1)
--                                        ↓ 触发
--                                OnSendTimer()
--                                  - pcall + errorBlocker 发送
--                                  - 成功/AFK → 重启 activityTimer(interval)
--                                  - 被阻止 → 重试
-- ============================================================

-- 内部定时器控制方法
function ChatManager:StartActivityTimer(interval)
    self:StopActivityTimer()
    self.activityTimer = C_Timer.NewTicker(interval, function()
        self:OnActivityTimer()
    end)
end

function ChatManager:StopActivityTimer()
    if self.activityTimer then
        self.activityTimer:Cancel()
        self.activityTimer = nil
    end
end

function ChatManager:StartSendTimer(interval)
    self:StopSendTimer()
    self.sendTimer = C_Timer.NewTicker(interval, function()
        self:OnSendTimer()
    end)
end

function ChatManager:StopSendTimer()
    if self.sendTimer then
        self.sendTimer:Cancel()
        self.sendTimer = nil
    end
end

-- 启动广播定时器（两阶段模型入口）
function ChatManager:StartBroadcastTimer()
    self:StopActivityTimer()
    self:StopSendTimer()
    -- 首次使用 GetCooldown()：新活动返回 0（立即广播），恢复活动返回剩余冷却
    local cooldown = self:GetCooldown()
    if cooldown <= 0 then
        cooldown = 0.1 -- 极短延迟，避免 0 间隔
    end
    self:StartActivityTimer(cooldown)
end

-- 阶段1：冷却定时器到期（参考 meetinghorn LFG:OnActivityTimer）
function ChatManager:OnActivityTimer()
    -- 战斗中跳过广播：SendChatMessage 会被 Blizzard BLOCK，errorBlocker 的 frame 遍历开销极大
    if InCombatLockdown() then
        return -- 战斗中跳过，等下一个 tick 自然重试
    end
    if UnitIsAFK('player') then
        return -- AFK 时跳过，等下一次 tick
    end

    self:StopActivityTimer()

    if not self.currentActivity then
        return
    end

    local channelId = self:GetSendChannelId()
    if channelId and channelId > 0 then
        -- 有频道，进入发送阶段
        self:StartSendTimer(0.1)
    else
        -- 无频道，尝试重新加入，短间隔重试
        self:EnsureChannelJoined()
        self:StartActivityTimer(0.1)
    end
end

-- 阶段2：发送定时器（参考 meetinghorn LFG:OnSendTimer）
function ChatManager:OnSendTimer()
    if not self.currentActivity then
        self:StopSendTimer()
        return
    end

    -- 战斗中跳过实际发送，避免 taint + errorBlocker 开销导致掉帧
    if InCombatLockdown() then
        return
    end

    -- 检查是否超出广播次数上限
    if self.broadcastCount >= CHANNEL_CONFIG.maxBroadcastCount then
        self:StopSendTimer()
        self:StopActivity()
        return
    end

    local channelId = self:GetSendChannelId()
    if channelId and channelId > 0 then
        local isAFK = UnitIsAFK('player')
        if not isAFK then
            -- 使用分包发送（支持超长消息）+ errorBlocker 保护
            local protoMessage = self.currentActivity:ToProto()
            if protoMessage then
                self:SafeSendPacketMessage(protoMessage, channelId)
            end
        end

        if isAFK or self.errorBlocker:IsOk() then
            self:StopSendTimer()
            local interval = CHANNEL_CONFIG.broadcastInterval
            self:StartActivityTimer(interval)
            self:StartCooldown(interval)

            if not isAFK then
                self.broadcastCount = self.broadcastCount + 1
                if self.currentActivity then
                    self.currentActivity.broadcastCount = self.broadcastCount
                    self.currentActivity.lastBroadcastTime = time()
                end
            end
        end
    end
end

-- 安全分包发送（统一走 ns.SendPacketMessage，内部已有 SafeSendToChannel + errorBlocker 保护）
function ChatManager:SafeSendPacketMessage(message, channelId)
    return ns.SendPacketMessage(message, channelId)
end

-- Cooldown 管理（参考 meetinghorn LFG:StartCooldown / GetCooldown）
function ChatManager:StartCooldown(duration)
    self.cooldown.start = time()
    self.cooldown.duration = duration
    -- 持久化到 db
    if ns.Addon.db and ns.Addon.db.profile and ns.Addon.db.profile.cache then
        ns.Addon.db.profile.cache.cooldown = { start = self.cooldown.start, duration = self.cooldown.duration }
    end
end

function ChatManager:GetCooldown()
    local remain = self.cooldown.start + self.cooldown.duration - time()
    if remain < 0 then
        return 0
    end
    return remain
end

-- 从 db 恢复 cooldown 状态
function ChatManager:RestoreCooldown()
    if ns.Addon.db and ns.Addon.db.profile and ns.Addon.db.profile.cache and ns.Addon.db.profile.cache.cooldown then
        local saved = ns.Addon.db.profile.cache.cooldown
        self.cooldown.start = saved.start or 0
        self.cooldown.duration = saved.duration or 0
    end
end

-- 确保已加入广播频道
function ChatManager:EnsureChannelJoined()
    if ns.ChannelManager and ns.ChannelManager.EnsureChannelJoined then
        ns.ChannelManager:EnsureChannelJoined()
    elseif ns.ChannelManager and ns.ChannelManager.meetingHornChannel then
        -- 回退：通过 MeetingHorn Channel 模块尝试加入
        local mhChannel = ns.MeetingHornAPI and ns.MeetingHornAPI:GetChannel()
        if mhChannel and mhChannel.Join then
            mhChannel:Join(CHANNEL_CONFIG.defaultChannel)
        end
    end
end

-- ============================================================
-- 分包发送：将长消息拆分为多个包发送到频道
-- 参考 MeetingStone/NetEaseBroadMiddleware 的分包协议
-- 挂在 ns 上供所有模块使用
-- ============================================================
function ChatManager:SendPacketMessage(message, channelId)
    return ns.SendPacketMessage(message, channelId)
end

-- 全局分包发送方法，供所有模块调用
-- 统一走 ns.SafeSendToChannel + errorBlocker 保护，避免 taint 传播
function ns.SendPacketMessage(message, channelId)
    if not message or not channelId or channelId <= 0 then
        return false
    end

    -- 获取 errorBlocker（如果 ActivityManager 已初始化）
    local errorBlocker = ns.ActivityManager and ns.ActivityManager.chatManager and ns.ActivityManager.chatManager.errorBlocker

    local dataLen = #message
    if dataLen <= MAX_PACKET_LEN then
        -- 单包：消息够短，直接发
        return ns.SafeSendToChannel(PACKET_ONE .. message, channelId, errorBlocker)
    end

    -- 多包：按 MAX_PACKET_LEN 分割
    -- 首包
    local chunk = message:sub(1, MAX_PACKET_LEN)
    local ok = ns.SafeSendToChannel(PACKET_FIRST .. chunk, channelId, errorBlocker)
    if not ok then return false end

    -- 中间包
    local pos = 1 + MAX_PACKET_LEN
    while pos + MAX_PACKET_LEN <= dataLen do
        chunk = message:sub(pos, pos + MAX_PACKET_LEN - 1)
        ok = ns.SafeSendToChannel(PACKET_NEXT .. chunk, channelId, errorBlocker)
        if not ok then return false end
        pos = pos + MAX_PACKET_LEN
    end

    -- 末包
    chunk = message:sub(pos)
    return ns.SafeSendToChannel(PACKET_LAST .. chunk, channelId, errorBlocker)
end

-- 获取可用的发送频道ID（通用方法）
function ChatManager:GetSendChannelId()
    local channelId = nil
    -- 优先通过 MeetingHorn 的 Channel 模块获取
    if ns.ChannelManager and ns.ChannelManager.meetingHornChannel then
        if ns.ChannelManager.meetingHornChannel.GetSendChannelId then
            channelId = ns.ChannelManager.meetingHornChannel:GetSendChannelId("MeetingHorn")
        end
    end
    -- 回退：直接用 WoW API 获取频道ID
    if not channelId or channelId <= 0 then
        channelId = GetChannelName(CHANNEL_CONFIG.defaultChannel)
    end
    return channelId
end


-- 启动清理定时器
function ChatManager:StartCleanupTimer()
    if self.cleanupTimer then
        self.cleanupTimer:Cancel()
    end
    
    self.cleanupTimer = C_Timer.NewTicker(CHANNEL_CONFIG.cleanupInterval, function()
        self:CleanupExpiredActivities()
    end)
end

-- 清理过期的活动
function ChatManager:CleanupExpiredActivities()
    local currentTime = time()
    local expiredCount = 0
    
    for leaderName, activity in pairs(self.receivedActivities) do
        local age = currentTime - activity.lastUpdateTime
        if age > CHANNEL_CONFIG.activityTimeout then
            self.receivedActivities[leaderName] = nil
            expiredCount = expiredCount + 1
        end
    end
    
    if expiredCount > 0 then
        self:FireUpdateCallbacks("ACTIVITIES_CLEANED", expiredCount)
    end
end

-- 获取所有远程接收到的活动（不包括自己的currentActivity，本地活动由Manager管理）
function ChatManager:GetAllActivities()
    local activities = {}

    -- 只添加接收到的远程活动
    for _, activity in pairs(self.receivedActivities) do
        table.insert(activities, activity)
    end
    
    return activities
end

-- 获取 MeetingHorn 原生活动列表（不带 MHH@@ 标识的普通活动）
-- 将 MeetingHorn 的 Activity 对象转换为我们的 HeroicRaidActivity 格式
-- 使用脏标记缓存：仅在 MEETINGHORN_ACTIVITY_UPDATE/ADDED/REMOVED 触发后重建
function ChatManager:GetMeetingHornActivities()
    -- 缓存命中：脏标记为 false 时直接返回缓存，避免每次遍历 + 创建新对象
    if not self.mhActivityCacheDirty then
        return self.mhActivityCache
    end

    local lfg = ns.MeetingHornAPI:GetLFG()
    if not lfg or not lfg.activities then
        self.mhActivityCache = {}
        self.mhActivityCacheDirty = false
        return self.mhActivityCache
    end

    local playerName = UnitName("player")
    local activities = {}

    for _, mhActivity in ipairs(lfg.activities) do
        if mhActivity and mhActivity.GetLeader then
            local leader = mhActivity:GetLeader()
            if leader then
                leader = Ambiguate(leader, "none")
            end

            -- 跳过自己的活动
            if leader and leader ~= playerName then
                local heroicActivity = self:ConvertMeetingHornActivity(mhActivity, leader)
                if heroicActivity then
                    table.insert(activities, heroicActivity)
                end
            end
        end
    end

    self.mhActivityCache = activities
    self.mhActivityCacheDirty = false
    return self.mhActivityCache
end

-- 将 MeetingHorn Activity 转换为我们的 HeroicRaidActivity 格式
function ChatManager:ConvertMeetingHornActivity(mhActivity, leader)
    if not mhActivity then return nil end

    local activityId = mhActivity.GetActivityId and mhActivity:GetActivityId() or nil
    local modeId = mhActivity.GetModeId and mhActivity:GetModeId() or 0
    local comment = mhActivity.GetComment and mhActivity:GetComment() or ""
    local members = mhActivity.GetMembers and mhActivity:GetMembers() or 0
    local leaderLevel = mhActivity.GetLeaderLevel and mhActivity:GetLeaderLevel() or 80
    local leaderClass = mhActivity.GetLeaderClass and mhActivity:GetLeaderClass() or "UNKNOWN"
    local leaderGUID = mhActivity.GetLeaderGUID and mhActivity:GetLeaderGUID() or nil
    local tick = mhActivity.GetTick and mhActivity:GetTick() or time()
    -- 获取活动名称
    local activityName = ""
    if mhActivity.data and mhActivity.data.name then
        activityName = mhActivity.data.name
    elseif mhActivity.GetName then
        activityName = mhActivity:GetName() or ""
    end

    -- 通过活动名称反向查找 MHH raidId（即 mapId，两边常量一致）
    -- 优先级：activityId 反查 → 名称精确匹配 → 去括号后缀匹配 → instanceName → fallback 0
    local raidId = nil

    -- 1. 通过 MeetingHorn 的 activityId 反查 mapId（最可靠：走 MH 自己的 GetActivityIdByRaidId 反向路径）
    --    MH 的 Activity.data 是 ACTIVITY_LIST[id]，其中 name 由 C_Map.GetAreaInfo(mapId) 构建
    --    我们的 SPEC 常量（如 NAXXRAMAS=3456）就是 mapId，所以直接用 raidNameToId 名称匹配即可
    if activityName and activityName ~= "" then
        -- 1a. 精确匹配（含带后缀变体，如"纳克萨玛斯（25人）"）
        raidId = ns.raidNameToId[activityName]
        -- 1b. 去掉括号后缀再匹配（兜底：处理全角/半角括号及任意后缀内容）
        if not raidId then
            local baseName = activityName:gsub("[%(（].-[%)）]$", "")
            if baseName ~= activityName then
                raidId = ns.raidNameToId[baseName]
            end
        end
    end
    -- 2. 通过 data.instanceName 匹配（某些 MH 活动有独立的 instanceName 字段）
    if not raidId and mhActivity.data and mhActivity.data.instanceName then
        raidId = ns.raidNameToId[mhActivity.data.instanceName]
        if not raidId then
            local baseName = mhActivity.data.instanceName:gsub("[%(（].-[%)）]$", "")
            if baseName ~= mhActivity.data.instanceName then
                raidId = ns.raidNameToId[baseName]
            end
        end
    end
    -- 3. 最终 fallback：使用 MH 的 raidId（注意：这是 GetSavedInstanceInfo 返回的锁 ID，不稳定）
    if not raidId then
        raidId = mhActivity.raidId
    end

    -- 创建我们的活动对象 (raidId, modeId, leaderName, comment, itemLevelRequirement)
    local activity = ns.HeroicRaidActivity:New(raidId or 0, modeId, leader, comment, nil)

    if not activity then return nil end

    activity.memberCount = members
    activity.leaderLevel = leaderLevel
    activity.leaderClass = leaderClass
    activity.neededRoles = {tank = 2, healer = 6, dps = 17} -- 默认25人团需求
    activity.createdTime = tick
    activity.lastUpdateTime = tick
    activity.isOurAddonCreate = false
    activity._source = "meetinghorn" -- 标记来源为 MeetingHorn 原生
    activity._mhActivityName = activityName -- 保存原始活动名称

    if leaderGUID then
        activity:SetLeaderGUID(leaderGUID, leader)
    end

    return activity
end

-- 注册更新回调
function ChatManager:RegisterUpdateCallback(callback)
    if not self.updateCallbacks then
        self.updateCallbacks = {}
    end
    table.insert(self.updateCallbacks, callback)
end

-- 触发更新回调
function ChatManager:FireUpdateCallbacks(eventType, data)
    if self.updateCallbacks then
        for _, callback in ipairs(self.updateCallbacks) do
            callback(eventType, data)
        end
    end
end

-- 清理资源
function ChatManager:Destroy()
    self:StopActivityTimer()
    self:StopSendTimer()
    
    if self.cleanupTimer then
        self.cleanupTimer:Cancel()
    end
    
    if self.eventFrame then
        self.eventFrame:UnregisterAllEvents()
        self.eventFrame:SetScript("OnEvent", nil)
    end
end

-- ========== 插件通信协议：成员信息同步 ==========

-- 处理组队变化：发送自己的信息给队长
function ChatManager:OnGroupRosterUpdate()
    if not self.memberInfoCache then
        self.memberInfoCache = {}
    end

    if not IsInGroup() then
        self.memberInfoCache = {}
        return
    end

    -- 延迟一点发送，确保队伍状态稳定
    C_Timer.After(0.5, function()
        self:SendMyInfoToLeader()
    end)
end

-- 发送自己的信息给队长（或广播给所有人）
function ChatManager:SendMyInfoToLeader()
    if not IsInGroup() then
        return
    end

    local myName = UnitName("player")
    local _, myClass = UnitClass("player")
    local myLevel = UnitLevel("player")
    local myItemLevel = 0

    -- 获取自己的装等
    if GetAverageItemLevel then
        local avgItemLevel, avgItemLevelEquipped = GetAverageItemLevel()
        myItemLevel = avgItemLevelEquipped or avgItemLevel or 0
    end

    -- 构建消息：NAME|CLASS|LEVEL|ITEMLEVEL
    local message = string.format("INFO:%s|%s|%d|%d", myName, myClass, myLevel, math.floor(myItemLevel))

    -- 发送到队伍/团队频道（所有人都能收到）
    local channel = IsInRaid() and "RAID" or "PARTY"
    C_ChatInfo.SendAddonMessage(ADDON_PREFIX, message, channel)
end

-- 处理收到的插件消息
function ChatManager:OnAddonMessage(prefix, message, channel, sender)
    if prefix == ADDON_PREFIX then
        -- MHH_SYNC 前缀：成员信息同步
        if message:match("^INFO:") then
            self:HandleMemberInfoMessage(message, sender)
        end
    end
end

-- ========== 团队聊天系统 ==========

-- 处理团队聊天 ADDON 消息（分包接收）
function ChatManager:OnTeamChatAddonMessage(message, channel, sender)
    if not message or not sender then return end
    -- 防御：确保缓存已初始化
    if not self.teamChatPacketCache then self.teamChatPacketCache = {} end
    if not self.whisperProfileCache then self.whisperProfileCache = {} end

    -- 不处理自己发的消息（发送时已本地记录）
    local playerName = UnitName("player")
    local senderName = Ambiguate(sender, "none")
    if senderName == playerName then
        return
    end

    -- 分包协议解析
    local prefix = message:sub(1, PACKET_PREFIX_LEN)
    local data = message:sub(PACKET_PREFIX_LEN + 1)

    if prefix == PACKET_ONE then
        -- 单包：检查消息类型
        if data:sub(1, 2) == "P." then
            -- Profile 消息（私聊附带的个人信息）
            self:OnWhisperProfileReceived(data, senderName)
            return
        end
        self:OnTeamChatReceived(data, senderName)
    elseif prefix == PACKET_FIRST then
        -- 首包：清空缓存
        self.teamChatPacketCache[senderName] = { data }
    elseif prefix == PACKET_NEXT then
        -- 中间包：追加
        if self.teamChatPacketCache[senderName] then
            table.insert(self.teamChatPacketCache[senderName], data)
        end
    elseif prefix == PACKET_LAST then
        -- 末包：拼接并处理
        if self.teamChatPacketCache[senderName] then
            table.insert(self.teamChatPacketCache[senderName], data)
            local fullMessage = table.concat(self.teamChatPacketCache[senderName])
            self.teamChatPacketCache[senderName] = nil
            self:OnTeamChatReceived(fullMessage, senderName)
        end
    else
        -- 无前缀消息（兼容），尝试直接解析
        self:OnTeamChatReceived(message, senderName)
    end
end

-- 序列化团队聊天消息
-- 格式: msgType.senderClass.senderLevel.senderItemLevel.replyToName.messageBody
function ChatManager:SerializeTeamChatMessage(message, replyToName)
    local _, senderClass = UnitClass("player")
    local senderLevel = UnitLevel("player")
    local senderItemLevel = 0
    if GetAverageItemLevel then
        local avg, equipped = GetAverageItemLevel()
        senderItemLevel = math.floor(equipped or avg or 0)
    end

    local msgType = (replyToName and replyToName ~= "") and "R" or "C"
    local replyField = replyToName or ""

    return string.format("%s.%s.%d.%d.%s.%s",
        msgType, senderClass or "UNKNOWN", senderLevel or 0, senderItemLevel,
        replyField, message or "")
end

-- 反序列化团队聊天消息
function ChatManager:DeserializeTeamChatMessage(data, senderName)
    if not data then return nil end

    local msgType, senderClass, senderLevel, senderItemLevel, replyToName, messageBody =
        string.match(data, "^([CR])%.([^%.]+)%.(%d+)%.(%d+)%.([^%.]*)%.(.*)")

    if not msgType then
        return nil
    end

    local record = {
        playerName = senderName,
        senderClass = senderClass,
        senderLevel = tonumber(senderLevel) or 0,
        senderItemLevel = tonumber(senderItemLevel) or 0,
        replyToName = (replyToName ~= "") and replyToName or nil,
        message = messageBody or "",
        chatType = "team",
        direction = "received",
        timestamp = time()
    }

    return record
end

-- 通过 ADDON 通道分包发送团队聊天
function ChatManager:SendTeamChatPacket(serializedData, distributionType)
    if not serializedData or not distributionType then return false end

    local dataLen = #serializedData
    if dataLen <= ADDON_MAX_PACKET_LEN then
        -- 单包
        C_ChatInfo.SendAddonMessage(ADDON_CHAT_PREFIX, PACKET_ONE .. serializedData, distributionType)
        return true
    end

    -- 多包：首包
    local chunk = serializedData:sub(1, ADDON_MAX_PACKET_LEN)
    C_ChatInfo.SendAddonMessage(ADDON_CHAT_PREFIX, PACKET_FIRST .. chunk, distributionType)

    -- 中间包
    local pos = 1 + ADDON_MAX_PACKET_LEN
    while pos + ADDON_MAX_PACKET_LEN <= dataLen do
        chunk = serializedData:sub(pos, pos + ADDON_MAX_PACKET_LEN - 1)
        C_ChatInfo.SendAddonMessage(ADDON_CHAT_PREFIX, PACKET_NEXT .. chunk, distributionType)
        pos = pos + ADDON_MAX_PACKET_LEN
    end

    -- 末包
    chunk = serializedData:sub(pos)
    C_ChatInfo.SendAddonMessage(ADDON_CHAT_PREFIX, PACKET_LAST .. chunk, distributionType)
    return true
end

-- 公共接口：发送团队聊天消息（直接使用 WoW 原生频道）
function ChatManager:SendTeamChatMessage(message, replyToName)
    if not message or message == "" then return false end
    if not IsInGroup() then
        return false
    end

    -- 如果有回复对象，在消息前加 @xxx 前缀
    local sendText = message
    if replyToName and replyToName ~= "" then
        sendText = "@" .. replyToName .. " " .. message
    end

    -- 直接通过 WoW 原生聊天频道发送（所有队友都能看到）
    local chatType = IsInRaid() and "RAID" or "PARTY"
    SendChatMessage(sendText, chatType)

    -- 注意：不需要本地记录，因为自己发的消息也会通过 CHAT_MSG_RAID/PARTY 事件收到
    return true
end

-- 处理 RAID/PARTY 频道聊天消息
function ChatManager:OnGroupChatMessage(event, message, sender, ...)
    if not message or not sender then return end
    if not self.teamChatRecords then self.teamChatRecords = {} end

    local senderName = Ambiguate(sender, "short")
    local playerName = UnitName("player")

    -- 判断是否是自己发的
    local direction = (senderName == playerName) and "sent" or "received"

    -- 从组队列表查找发送者的职业信息
    local senderClass, senderLevel, senderItemLevel = self:GetGroupMemberClass(senderName)

    -- 解析回复对象（消息以 @xxx 开头）
    local replyToName, actualMessage = string.match(message, "^@(%S+)%s+(.*)")
    if not replyToName then
        actualMessage = message
    end

    local record = {
        playerName = senderName,
        senderClass = senderClass,
        senderLevel = senderLevel or 0,
        senderItemLevel = senderItemLevel or 0,
        replyToName = replyToName,
        message = actualMessage,
        chatType = "team",
        direction = direction,
        timestamp = time()
    }

    table.insert(self.teamChatRecords, record)
    -- 延迟批量写入（2s 节流）
    self:ScheduleTeamChatRecordsSave()
    self:FireUpdateCallbacks("TEAM_CHAT_ADDED", record)
    self:FireChatUpdateCallbacks("TEAM_CHAT_ADDED", record)
end

-- 从组队列表查找玩家职业（利用已有的 memberInfoCache + WoW API）
function ChatManager:GetGroupMemberClass(playerName)
    if not playerName then return nil, nil, nil end

    -- 1. 先从 memberInfoCache 查（ADDON 同步过来的最准确）
    if self.memberInfoCache then
        local cached = self.memberInfoCache[playerName]
        if cached and cached.class then
            return cached.class, cached.level, cached.itemLevel
        end
    end

    -- 2. 从 WoW 队伍/团队 API 查
    if IsInRaid() then
        for i = 1, GetNumGroupMembers() do
            local name = UnitName("raid" .. i)
            if name == playerName then
                local _, classFileName = UnitClass("raid" .. i)
                local level = UnitLevel("raid" .. i)
                return classFileName, level, nil
            end
        end
    else
        for i = 1, GetNumGroupMembers() - 1 do
            local name = UnitName("party" .. i)
            if name == playerName then
                local _, classFileName = UnitClass("party" .. i)
                local level = UnitLevel("party" .. i)
                return classFileName, level, nil
            end
        end
    end

    -- 3. 自己
    if playerName == UnitName("player") then
        local _, classFileName = UnitClass("player")
        return classFileName, UnitLevel("player"), nil
    end

    return nil, nil, nil
end

-- 获取团队聊天记录
function ChatManager:GetTeamChatRecords()
    return self.teamChatRecords or {}
end

-- ========== Whisper Profile（私聊附带个人信息）==========

-- 处理收到的 whisper profile（P.CLASS.LEVEL.ILVL）
function ChatManager:OnWhisperProfileReceived(data, senderName)
    local senderClass, senderLevel, senderItemLevel =
        string.match(data, "^P%.([^%.]+)%.(%d+)%.(%d+)")
    if not senderClass then return end

    if not self.whisperProfileCache then self.whisperProfileCache = {} end
    self.whisperProfileCache[senderName] = {
        class = senderClass,
        level = tonumber(senderLevel) or 0,
        itemLevel = tonumber(senderItemLevel) or 0,
        timestamp = time()
    }

    -- 回填最近该玩家的聊天记录中缺失的职业信息
    if self.chatRecords then
        for i = #self.chatRecords, math.max(1, #self.chatRecords - 20), -1 do
            local record = self.chatRecords[i]
            if record and record.playerName == senderName and record.direction == "received" then
                if not record.playerClass then
                    record.playerClass = senderClass
                end
                if not record.playerLevel or record.playerLevel == 0 then
                    record.playerLevel = tonumber(senderLevel) or 0
                end
                if not record.itemLevel or record.itemLevel == 0 then
                    record.itemLevel = tonumber(senderItemLevel) or 0
                end
            end
        end
    end

    -- 通知 UI 刷新
    self:FireUpdateCallbacks("CHAT_RECORD_UPDATED")
    self:FireChatUpdateCallbacks("CHAT_RECORD_UPDATED")
end

-- 获取私聊对方的 profile 缓存
function ChatManager:GetWhisperProfile(playerName)
    if not self.whisperProfileCache then self.whisperProfileCache = {} end
    return self.whisperProfileCache[playerName]
end

-- 处理成员信息消息
function ChatManager:HandleMemberInfoMessage(message, sender)
    -- 格式：INFO:NAME|CLASS|LEVEL|ITEMLEVEL
    local data = message:match("^INFO:(.+)$")
    if not data then
        return
    end

    local parts = { strsplit("|", data) }
    if #parts < 4 then
        return
    end

    local name = parts[1]
    local class = parts[2]
    local level = tonumber(parts[3]) or 0
    local itemLevel = tonumber(parts[4]) or 0

    -- 确保缓存表存在
    if not self.memberInfoCache then
        self.memberInfoCache = {}
    end

    -- 缓存成员信息
    self.memberInfoCache[name] = {
        class = class,
        level = level,
        itemLevel = itemLevel,
        timestamp = time()
    }

    -- 更新聊天记录中该玩家的信息
    self:UpdateChatRecordPlayerInfo(name, {
        class = class,
        level = level,
        itemLevel = itemLevel
    })

    -- 如果当前玩家是队长，更新活动成员信息
    if ns.ActivityManager and ns.ActivityManager.currentPlayerActivity then
        local activity = ns.ActivityManager.currentPlayerActivity
        if activity.members and activity.members[name] then
            activity.members[name].classFileName = class
            activity.members[name].level = level
            activity.members[name].itemLevel = itemLevel
        end
    end

    -- 通知 UI 刷新
    self:FireUpdateCallbacks("MEMBER_INFO_RECEIVED", { name = name })
    self:FireChatUpdateCallbacks("MEMBER_INFO_RECEIVED", { name = name })
end

-- 获取缓存的成员信息
function ChatManager:GetCachedMemberInfo(playerName)
    if not self.memberInfoCache then
        self.memberInfoCache = {}
    end
    return self.memberInfoCache[playerName]
end

ns.ChatManager = ChatManager

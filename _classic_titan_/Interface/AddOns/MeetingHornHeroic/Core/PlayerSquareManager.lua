-- PlayerSquareManager.lua
-- 玩家广场管理器 - 处理玩家求组请求

---@type MeetingHornHeroicNS
local ns = select(2, ...)
local L = ns.L

---@class PlayerSquareManager
local PlayerSquareManager = {
    requests = {}, -- 存储所有的求组请求
    myRequest = nil, -- 自己发布的请求
}

function PlayerSquareManager:Initialize()
    -- 初始化玩家广场管理器
    ns.Utils.DebugLog("Player", "Initializing PlayerSquareManager")
    
    -- 清理过期请求
    self:CleanupExpiredRequests()
    
    -- 创建定时清理任务
        self.cleanupTimer = C_Timer.NewTicker(30, function() -- 每30秒清理一次（配合3分钟超时）
        self:CleanupExpiredRequests()
    end)
end

function PlayerSquareManager:PublishRequest(requestData)
    -- 发布一个求组请求
    if not requestData then
        return false, "无效的请求数据"
    end

    -- 防重复发布：如果正在发布中，直接返回
    if self._isPublishing then
        return false, "正在发布中，请勿重复点击"
    end
    self._isPublishing = true

    -- 验证必要字段
    if not requestData.targetRaidId or not requestData.comment or not requestData.members then
        self._isPublishing = false
        return false, "缺少必要的请求信息"
    end

    -- 创建请求对象
    local request = {
        id = self:GenerateRequestId(),
        playerName = UnitName("player"),
        realm = GetRealmName(),
        isGroup = requestData.isGroup or false,
        targetRaidId = requestData.targetRaidId,
        comment = requestData.comment,
        members = requestData.members,
        createdTime = time(),
        expirationTime = time() + 180, -- 与远程请求统一 3 分钟（本地请求靠广播心跳自动续期）
    }

    -- 计算角色统计
    request.roleStats = self:CalculateRoleStats(request.members)

    -- 关闭之前的请求（如果有的话）
    self:CloseMyRequest()

    -- 添加到请求列表（不再重复广播）
    request.broadcastSeq = 0 -- 广播序号：每次 ToProto 递增，防 WoW 频道反重复丢弃
    self.requests[request.id] = request
    self.myRequest = request

    -- 广播请求给其他玩家（只广播一次）
    self:BroadcastRequest(request)

    -- 触发更新事件
    self:TriggerEvent("PLAYER_SQUARE_UPDATED")

    -- 延迟解锁发布标记，防止短时间内重复点击
    C_Timer.After(2, function()
        self._isPublishing = false
    end)

    -- Debug: Published request
    return true, "请求发布成功"
end

function PlayerSquareManager:AddRequest(request)
    -- 此方法仅用于接收远程请求，不再覆盖 id/时间
    if not request.id then
        request.id = self:GenerateRequestId()
    end
    if not request.createdTime then
        request.createdTime = time()
    end
    if not request.expirationTime then
        -- 远程请求默认 3 分钟过期（靠心跳广播续命），本地请求在 CreateRequest 中已设置 3 小时
        request.expirationTime = request.createdTime + 180
    end

    self.requests[request.id] = request

    -- 触发更新事件
    self:TriggerEvent("PLAYER_SQUARE_UPDATED")
end

function PlayerSquareManager:CloseMyRequest()
    -- 关闭自己的请求
    if self.myRequest then
        local requestId = self.myRequest.id

        -- 停止周期性广播
        self:StopBroadcastTimer()

        -- 从请求列表中移除
        self.requests[requestId] = nil

        -- 广播关闭消息
        self:BroadcastRequestClosure(requestId)

        self.myRequest = nil

        -- 通知 UI 刷新（确保所有关闭路径——手动关闭、自动关闭、队长移交——都能即时更新界面）
        self:TriggerEvent("PLAYER_SQUARE_UPDATED")

        -- Debug: Closed my request
        return true
    end
    return false
end

function PlayerSquareManager:GetAllRequests()
    -- 获取所有有效的请求
    local validRequests = {}
    local currentTime = time()

    for id, request in pairs(self.requests) do
        if currentTime < request.expirationTime then
            table.insert(validRequests, request)
        end
    end

    -- 按创建时间排序（最新的在前）
    table.sort(validRequests, function(a, b)
        return a.createdTime > b.createdTime
    end)

    return validRequests
end

function PlayerSquareManager:GetRequestsByRaid(raidId)
    -- 获取指定团本的请求
    local requests = self:GetAllRequests()
    local filtered = {}
    
    for _, request in ipairs(requests) do
        if request.targetRaidId == raidId then
            table.insert(filtered, request)
        end
    end
    
    return filtered
end

function PlayerSquareManager:GetMyRequest()
    -- 获取自己的请求
    return self.myRequest
end

function PlayerSquareManager:IsExpired(request)
    -- 检查请求是否过期
    return time() >= request.expirationTime
end

function PlayerSquareManager:CleanupExpiredRequests()
    -- 清理过期的请求
    local currentTime = time()
    local removedCount = 0
    
    for id, request in pairs(self.requests) do
        if currentTime >= request.expirationTime then
            self.requests[id] = nil
            removedCount = removedCount + 1
        end
    end
    
    -- 检查自己的请求是否过期
    if self.myRequest and self:IsExpired(self.myRequest) then
        self.myRequest = nil
        -- Debug: My request expired
    end

    if removedCount > 0 then
        -- 清理了过期请求，通知 UI 刷新
        self:TriggerEvent("PLAYER_SQUARE_UPDATED")
    end
end

function PlayerSquareManager:GenerateRequestId()
    -- 生成唯一的请求ID
    local playerName = UnitName("player")
    local realm = GetRealmName()
    local timestamp = time()
    return playerName .. "-" .. realm .. "-" .. timestamp
end

-- 从 roleStats 推导成员角色（优先级：tank > healer > dps）
function PlayerSquareManager:DeriveRoleFromStats(roleStats)
    if not roleStats then
        return "dps"
    end
    if (roleStats.tank or 0) > 0 then
        return "tank"
    elseif (roleStats.healer or 0) > 0 then
        return "healer"
    else
        return "dps"
    end
end

function PlayerSquareManager:CalculateRoleStats(members)
    -- 计算角色统计
    local stats = {tank = 0, healer = 0, dps = 0}
    
    for _, member in ipairs(members) do
        if member.role then
            stats[member.role] = stats[member.role] + 1
        end
    end
    
    return stats
end

-- 获取发送频道 ID（复用 ChatManager 的逻辑）
function PlayerSquareManager:GetSendChannelId()
    if ns.ChannelManager and ns.ChannelManager.meetingHornChannel then
        if ns.ChannelManager.meetingHornChannel.GetSendChannelId then
            return ns.ChannelManager.meetingHornChannel:GetSendChannelId("MeetingHorn")
        end
    end
    return nil
end

function PlayerSquareManager:BroadcastRequest(request)
    -- 广播请求给其他玩家
    -- 通过 MeetingHorn 频道发送带 MHHPS@@ 标识的协议消息

    local protoMessage = self:ToProto(request)
    if not protoMessage then
        return
    end

    -- 首次广播（ns.SendPacketMessage 内部已走 SafeSendToChannel + errorBlocker 保护）
    local channelId = self:GetSendChannelId()
    if channelId and channelId > 0 then
        ns.SendPacketMessage(protoMessage, channelId)
    end

    -- 启动周期性重播定时器（两阶段模型）
    self:StartBroadcastTimer()
end

-- ============================================================
-- 两阶段广播引擎（对齐 ChatManager 的 activityTimer + sendTimer 模型）
-- ============================================================

-- 内部定时器控制
function PlayerSquareManager:StartActivityTimer(interval)
    self:StopActivityTimer()
    self._activityTimer = C_Timer.NewTicker(interval, function()
        self:OnActivityTimer()
    end)
end

function PlayerSquareManager:StopActivityTimer()
    if self._activityTimer then
        self._activityTimer:Cancel()
        self._activityTimer = nil
    end
end

function PlayerSquareManager:StartSendTimer(interval)
    self:StopSendTimer()
    self._sendTimer = C_Timer.NewTicker(interval, function()
        self:OnSendTimer()
    end)
end

function PlayerSquareManager:StopSendTimer()
    if self._sendTimer then
        self._sendTimer:Cancel()
        self._sendTimer = nil
    end
end

-- 启动广播定时器（两阶段模型入口）
function PlayerSquareManager:StartBroadcastTimer()
    self:StopActivityTimer()
    self:StopSendTimer()
    self:StartActivityTimer(60) -- 60 秒间隔
end

-- 停止广播定时器
function PlayerSquareManager:StopBroadcastTimer()
    self:StopActivityTimer()
    self:StopSendTimer()
    -- 兼容旧的 broadcastTimer 字段
    if self.broadcastTimer then
        self.broadcastTimer:Cancel()
        self.broadcastTimer = nil
    end
end

-- 阶段1：冷却定时器到期
function PlayerSquareManager:OnActivityTimer()
    if not self.myRequest or self:IsExpired(self.myRequest) then
        self:StopBroadcastTimer()
        return
    end

    -- 战斗中跳过广播，避免 taint + errorBlocker 开销导致掉帧
    if InCombatLockdown() then
        return
    end
    if UnitIsAFK('player') then
        return -- AFK 时跳过，等下次 tick
    end

    self:StopActivityTimer()

    local channelId = self:GetSendChannelId()
    if channelId and channelId > 0 then
        self:StartSendTimer(0.1)
    else
        -- 无频道，短间隔重试
        self:StartActivityTimer(0.1)
    end
end

-- 阶段2：发送定时器
-- ns.SendPacketMessage 内部已统一走 SafeSendToChannel + errorBlocker，无需外部再包裹
function PlayerSquareManager:OnSendTimer()
    if not self.myRequest then
        self:StopSendTimer()
        return
    end

    -- 战斗中跳过实际发送
    if InCombatLockdown() then
        return
    end

    local channelId = self:GetSendChannelId()
    if channelId and channelId > 0 then
        local isAFK = UnitIsAFK('player')
        local sendOk = true
        if not isAFK then
            local protoMessage = self:ToProto(self.myRequest)
            if protoMessage then
                sendOk = ns.SendPacketMessage(protoMessage, channelId)
            end
        end

        if isAFK or sendOk then
            self:StopSendTimer()
            -- 心跳续命：延长过期时间
            self.myRequest.expirationTime = time() + 180
            self:StartActivityTimer(60)
        end
    end
end

-- 重播当前请求（兼容旧调用，现在由 OnSendTimer 处理）
function PlayerSquareManager:BroadcastMyRequest()
    if not self.myRequest then
        return
    end

    local protoMessage = self:ToProto(self.myRequest)
    if not protoMessage then
        return
    end

    local channelId = self:GetSendChannelId()
    if channelId and channelId > 0 then
        ns.SendPacketMessage(protoMessage, channelId)
    end
end

function PlayerSquareManager:BroadcastRequestClosure(requestId)
    -- 广播请求关闭
    -- 通过 MeetingHorn 频道发送关闭消息
    -- 发送关闭消息（快速通知），即使丢失也有 3 分钟超时兜底
    local closeMessage = "CLOSE." .. (requestId or "") .. ".MHHPS@@"
    if ns.ChannelManager and ns.ChannelManager.meetingHornChannel then
        local channelId = nil
        if ns.ChannelManager.meetingHornChannel.GetSendChannelId then
            channelId = ns.ChannelManager.meetingHornChannel:GetSendChannelId("MeetingHorn")
        end
        if channelId and channelId > 0 then
            ns.SendPacketMessage(closeMessage, channelId)
        end
    end
end

-- 将求组请求序列化为频道协议消息
-- 格式: playerName.targetRaidId.isGroup.comment.tank,healer,dps.playerClass.playerLevel.memberCount.membersData.MHHPS@@
-- membersData 格式: name~class~role~level;name~class~role~level;...
function PlayerSquareManager:ToProto(request)
    if not request then return nil end

    local playerName = request.playerName or UnitName("player")
    local targetRaidId = request.targetRaidId or 0
    local isGroup = request.isGroup and "1" or "0"
    local comment = (request.comment or ""):gsub("%.", ",") -- 替换 . 避免解析冲突
    local roleStats = request.roleStats or {tank = 0, healer = 0, dps = 0}
    local rolesStr = string.format("%d,%d,%d", roleStats.tank or 0, roleStats.healer or 0, roleStats.dps or 0)
    local _, playerClass = UnitClass("player")
    local playerLevel = UnitLevel("player")

    -- 序列化完整成员列表
    local memberCount = 0
    local memberParts = {}
    if request.members and #request.members > 0 then
        for _, member in ipairs(request.members) do
            local mName = (member.name or ""):gsub("[~;%.]", "")
            local mClass = member.class or "UNKNOWN"
            local mRole = member.role or "dps"
            local mLevel = member.level or 0
            table.insert(memberParts, string.format("%s~%s~%s~%d", mName, mClass, mRole, mLevel))
            memberCount = memberCount + 1
        end
    end
    local membersData = table.concat(memberParts, ";")
    if membersData == "" then membersData = "_" end

    -- broadcastSeq: 每次 ToProto 递增，确保频道消息不重复（防 WoW 反重复丢弃）
    request.broadcastSeq = (request.broadcastSeq or 0) + 1

    return string.format("%s.%s.%s.%s.%s.%s.%s.%d.%s.%d.MHHPS@@",
        playerName,
        targetRaidId,
        isGroup,
        comment,
        rolesStr,
        playerClass or "UNKNOWN",
        playerLevel,
        memberCount,
        membersData,
        request.broadcastSeq
    )
end

-- 从频道协议消息解析求组请求
-- 新格式: playerName.targetRaidId.isGroup.comment.tank,healer,dps.playerClass.playerLevel.memberCount.membersData.MHHPS@@
-- 旧格式: playerName.targetRaidId.isGroup.comment.tank,healer,dps.playerClass.playerLevel.MHHPS@@
function PlayerSquareManager:FromProto(proto, senderName, guid)
    if not proto then return nil end

    -- 移除结尾标记
    local data = proto:gsub("@@.*", "")

    -- 分割
    local parts = {}
    for part in data:gmatch("([^.]*)%.?") do
        table.insert(parts, part)
    end

    -- 至少需要 8 个字段
    if #parts < 8 then
        return nil
    end

    -- 检查标识：v3格式在 parts[11]，v2格式在 parts[10]，v1格式在 parts[8]
    local isNewFormat = false
    if #parts >= 11 and parts[11] == "MHHPS" then
        -- v3格式：含 broadcastSeq（parts[10]），忽略该字段
        isNewFormat = true
    elseif #parts >= 10 and parts[10] == "MHHPS" then
        -- v2格式：无 broadcastSeq
        isNewFormat = true
    elseif parts[8] == "MHHPS" then
        isNewFormat = false
    else
        return nil
    end

    local roleParts = {}
    for num in (parts[5] or "0,0,0"):gmatch("([^,]+)") do
        table.insert(roleParts, tonumber(num) or 0)
    end

    local request = {
        id = (senderName or parts[1]) .. "-" .. (GetRealmName() or "") .. "-" .. time(),
        playerName = senderName or parts[1],
        realm = GetRealmName(),
        isGroup = parts[3] == "1",
        targetRaidId = tonumber(parts[2]) or 0,
        comment = (parts[4] or ""):gsub(",", "."), -- 还原 .
        members = {},
        createdTime = time(),
        expirationTime = time() + 180, -- 远程请求 3 分钟无新广播则过期（与团本活动超时统一）
        roleStats = {
            tank = roleParts[1] or 0,
            healer = roleParts[2] or 0,
            dps = roleParts[3] or 0,
        },
        playerClass = parts[6] or "UNKNOWN",
        playerLevel = tonumber(parts[7]) or 80,
        playerGUID = guid,
        isRemote = true,
    }

    -- 新格式：解析完整成员列表
    if isNewFormat then
        request.memberCount = tonumber(parts[8]) or 0
        local membersData = parts[9] or "_"
        if membersData ~= "_" and membersData ~= "" then
            for memberStr in membersData:gmatch("([^;]+)") do
                local mParts = {}
                for mp in memberStr:gmatch("([^~]+)") do
                    table.insert(mParts, mp)
                end
                if #mParts >= 4 then
                    table.insert(request.members, {
                        name = mParts[1],
                        class = mParts[2],
                        role = mParts[3],
                        level = tonumber(mParts[4]) or 0,
                    })
                end
            end
        end
    end

    -- 如果没有从新格式解析到成员（旧格式或空数据），回退到只添加发布者
    if #request.members == 0 then
        local memberName = request.playerName
        local memberRole = self:DeriveRoleFromStats(request.roleStats)
        table.insert(request.members, {
            name = memberName,
            class = request.playerClass,
            role = memberRole,
            level = request.playerLevel,
        })
    end

    -- 更新 memberCount
    request.memberCount = #request.members

    return request
end


function PlayerSquareManager:GetRaidDisplayName(raidId)
    -- 获取团本显示名称
    if ns.raidData and ns.raidData[raidId] then
        return ns.raidData[raidId].name
    end
    return "未知团本"
end

function PlayerSquareManager:FormatRoleStats(roleStats)
    -- 格式化角色统计显示
    local parts = {}
    if roleStats.tank > 0 then
        table.insert(parts, roleStats.tank .. "坦")
    end
    if roleStats.healer > 0 then
        table.insert(parts, roleStats.healer .. "治疗")
    end
    if roleStats.dps > 0 then
        table.insert(parts, roleStats.dps .. "输出")
    end
    return table.concat(parts, " + ")
end


function PlayerSquareManager:TriggerEvent(eventName, ...)
    -- 触发自定义事件
    if self.eventCallbacks and self.eventCallbacks[eventName] then
        for _, callback in ipairs(self.eventCallbacks[eventName]) do
            callback(...)
        end
    end
end

function PlayerSquareManager:RegisterCallback(eventName, callback)
    -- 注册事件回调
    if not self.eventCallbacks then
        self.eventCallbacks = {}
    end

    if not self.eventCallbacks[eventName] then
        self.eventCallbacks[eventName] = {}
    end

    table.insert(self.eventCallbacks[eventName], callback)
end

-- 注册到命名空间
ns.PlayerSquareManager = PlayerSquareManager

return PlayerSquareManager
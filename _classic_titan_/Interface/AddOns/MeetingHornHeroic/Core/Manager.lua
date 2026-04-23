-- Manager.lua
-- 活动管理器

---@type MeetingHornHeroicNS
local ns = select(2, ...)

---@class ActivityManager
local ActivityManager = {}
ActivityManager.__index = ActivityManager

function ActivityManager:New()
    local manager = {
        activities = {},
        currentPlayerActivity = nil,
        updateCallbacks = {},
        filters = {
            raidType = 0,
            activityMode = 0,
            neededRoles = "all",
            sortOrder = "time"
        },
        chatManager = nil,
        groupUpdateFrame = nil,
        lastGroupSyncTime = 0,
        -- 申请者管理（参考 meetinghorn LFG.applicants）
        applicants = {},
    }

    setmetatable(manager, self)

    -- 初始化聊天管理器
    manager.chatManager = ns.ChatManager:New()
    -- 将实例挂回 ns.ChatManager，确保 UI 层通过 ns.ChatManager 访问的是同一个实例
    ns.ChatManager = manager.chatManager
    manager.chatManager:RegisterUpdateCallback(function(eventType, data)
        manager:OnChatManagerEvent(eventType, data)
    end)

    -- 创建队伍更新监听器
    manager:CreateGroupUpdateFrame()

    return manager
end

function ActivityManager:Initialize()
    -- 清理任何过期的缓存活动
    self:CleanCachedActivity()

    -- 延迟1秒恢复缓存的活动（参考meetinghorn的C_Timer.After(1, ...)逻辑）
    -- 等待游戏系统（频道等）就绪后，检查是否有未过期的活动需要恢复
    C_Timer.After(1, function()
        self:TryRestoreCachedActivity()
    end)
end

-- 尝试从缓存恢复活动（reload后自动恢复）
-- 使用 cooldown 机制判断（参考 meetinghorn LFG:OnEnable 中的恢复逻辑）
function ActivityManager:TryRestoreCachedActivity()
    if not ns.Addon.db then
        return
    end

    local saveData = ns.Addon.db.char and ns.Addon.db.char.currentActivity
    if not saveData then
        -- 也尝试从profile.cache读取（双重保险）
        saveData = ns.Addon.db.profile and ns.Addon.db.profile.cache and ns.Addon.db.profile.cache.currentActivity
    end

    if not saveData then
        return
    end

    -- 使用 cooldown 机制判断（参考 meetinghorn: time() - self.cooldown.start < 5 * 60）
    local cooldownData = ns.Addon.db.profile and ns.Addon.db.profile.cache and ns.Addon.db.profile.cache.cooldown
    local cooldownStart = cooldownData and cooldownData.start or 0
    local currentTime = time()

    if currentTime - cooldownStart > 5 * 60 then
        -- 超过5分钟未广播，清除缓存不恢复
        if ns.Addon.db.char then
            ns.Addon.db.char.currentActivity = nil
        end
        if ns.Addon.db.profile and ns.Addon.db.profile.cache then
            ns.Addon.db.profile.cache.currentActivity = nil
        end
        return
    end

    -- 检查必要字段
    if not saveData.raidId or not saveData.modeId then
        return
    end

    -- 恢复活动
    local activity = ns.HeroicRaidActivity:New(
        saveData.raidId,
        saveData.modeId,
        saveData.leaderName or UnitName("player"),
        saveData.comment,
        saveData.itemLevelRequirement
    )

    -- 从保存数据恢复完整状态
    activity:LoadFromData(saveData)

    -- 确保团长信息正确
    activity.leaderName = UnitName("player")
    activity:SetLeader(activity.leaderName)
    activity.isOurAddonCreate = true

    local playerName = UnitName("player")
    self.activities[playerName] = activity
    self.currentPlayerActivity = activity

    -- 恢复 cooldown 状态并重新启动聊天广播
    if self.chatManager then
        self.chatManager:RestoreCooldown()
        self.chatManager:StartActivity(activity)
    end

    -- 触发回调通知UI
    self:FireUpdateCallbacks("ACTIVITY_LOADED", activity)

    ns.Addon:Print("已恢复之前创建的活动")
end

function ActivityManager:CleanCachedActivity()
    -- 清理char层缓存
    if ns.Addon.db and ns.Addon.db.char and ns.Addon.db.char.currentActivity then
        local saveData = ns.Addon.db.char.currentActivity
        -- 检查活动是否过期（超过6小时）
        local currentTime = time()
        if saveData.createdTime and (currentTime - saveData.createdTime) > 21600 then  -- 6小时 = 21600秒
            ns.Addon.db.char.currentActivity = nil
        end
    end

    -- 同时清理profile层缓存
    if ns.Addon.db and ns.Addon.db.profile and ns.Addon.db.profile.cache and ns.Addon.db.profile.cache.currentActivity then
        local saveData = ns.Addon.db.profile.cache.currentActivity
        local currentTime = time()
        if saveData.createdTime and (currentTime - saveData.createdTime) > 21600 then
            ns.Addon.db.profile.cache.currentActivity = nil
        end
    end
end

function ActivityManager:RegisterUpdateCallback(callback)
    table.insert(self.updateCallbacks, callback)
end

function ActivityManager:FireUpdateCallbacks(eventType, activityData)
    for _, callback in ipairs(self.updateCallbacks) do
        callback(eventType, activityData)
    end
end

function ActivityManager:CreateActivity(raidId, modeId, comment, neededRoles, itemLevelRequirement, teamBonus, subsidyList)
    local playerName = UnitName("player")

    -- 如果玩家已有活动，先关闭它
    if self.currentPlayerActivity then
        self:ClosePlayerActivity()
    end

    -- 确保装等要求为整数
    if itemLevelRequirement then
        itemLevelRequirement = math.floor(tonumber(itemLevelRequirement) or 200)
    end

    local activity = ns.HeroicRaidActivity:New(raidId, modeId, playerName, comment, itemLevelRequirement)

    -- 设置需要的职业数量
    if neededRoles then
        activity:SetNeededRoles(neededRoles.tank, neededRoles.healer, neededRoles.dps)
    end

    -- 设置团双和补助数据
    activity.teamBonus = teamBonus and true or false
    if subsidyList and #subsidyList > 0 then
        activity.subsidyList = subsidyList
    end

    -- 添加队长自己
    local playerClass, playerClassFileName = UnitClass("player")
    local playerLevel = UnitLevel("player")
    local playerRole = self:DetectPlayerRole("player", playerClassFileName)

    activity:AddMember({
        name = playerName,
        class = playerClass,
        classFileName = playerClassFileName,
        role = playerRole,
        level = playerLevel
    })

    self.activities[playerName] = activity
    self.currentPlayerActivity = activity

    -- 保存到数据库
    self:SaveActivity(activity)

    -- 创建后立即同步当前队伍成员到活动中
    self:SyncActivityWithGroup()

    -- 启动聊天广播
    if self.chatManager then
        self.chatManager:StartActivity(activity)
    end

    -- 触发回调
    self:FireUpdateCallbacks("ACTIVITY_CREATED", activity)

    return activity
end

-- 角色职责判定：三级策略
-- Level 1: UnitGroupRolesAssigned（玩家手动设置的角色）
-- Level 2: GetTalentTabInfo 天赋点数推断（点数最多的天赋页）
-- Level 3: 职业兜底（默认 dps，不再硬编码坦克/治疗）
function ActivityManager:DetectPlayerRole(unit, classFileName)
    -- 纯 DPS 职业快速返回
    if classFileName and ns.PURE_DPS_CLASSES[classFileName] then
        return "dps"
    end

    -- Level 1: UnitGroupRolesAssigned
    if unit and UnitExists(unit) then
        local assignedRole = UnitGroupRolesAssigned(unit)
        if assignedRole == "TANK" then
            return "tank"
        elseif assignedRole == "HEALER" then
            return "healer"
        elseif assignedRole == "DAMAGER" then
            return "dps"
        end
        -- "NONE" → 继续 Level 2
    end

    -- Level 2: 天赋点数推断
    if unit and classFileName and ns.SPEC_ROLE_MAP[classFileName] then
        local isInspect = (unit ~= "player")
        local maxPoints = 0
        local maxTab = 1
        local hasData = false
        for tab = 1, 3 do
            local _, _, rawPoints = GetTalentTabInfo(tab, isInspect, false)
            local pointsSpent = tonumber(rawPoints) or 0
            if pointsSpent > 0 then
                hasData = true
                if pointsSpent > maxPoints then
                    maxPoints = pointsSpent
                    maxTab = tab
                end
            end
        end
        if hasData then
            local role = ns.SPEC_ROLE_MAP[classFileName][maxTab]
            if role then
                return role
            end
        end
    end

    -- Level 3: 职业兜底 — 默认 dps
    return "dps"
end

function ActivityManager:UpdateActivity(raidId, modeId, comment, neededRoles, itemLevelRequirement, teamBonus, subsidyList)
    if not self.currentPlayerActivity then
        return nil, "没有正在进行的活动"
    end

    local activity = self.currentPlayerActivity
    activity.raidId = raidId
    activity.modeId = modeId
    activity.comment = comment or ""

    -- 确保装等要求为整数
    if itemLevelRequirement then
        activity.itemLevel = math.floor(tonumber(itemLevelRequirement) or 200)
    end

    if neededRoles then
        activity:SetNeededRoles(neededRoles.tank, neededRoles.healer, neededRoles.dps)
    end

    -- 更新团双和补助数据
    activity.teamBonus = teamBonus and true or false
    activity.subsidyList = (subsidyList and #subsidyList > 0) and subsidyList or {}

    activity:UpdateTimestamp()

    -- 保存到数据库
    self:SaveActivity(activity)

    -- 触发回调
    self:FireUpdateCallbacks("ACTIVITY_UPDATED", activity)

    return activity
end

function ActivityManager:ClosePlayerActivity()
    if not self.currentPlayerActivity then
        return false, "没有正在进行的活动"
    end

    local playerName = UnitName("player")
    local activity = self.currentPlayerActivity

    -- 停止聊天广播（两阶段定时器 + 发送 CLOSE 广播）
    if self.chatManager then
        self.chatManager:StopActivity()
    end

    -- 清空申请者列表
    wipe(self.applicants)

    -- 彻底清理所有引用
    self.activities[playerName] = nil
    self.currentPlayerActivity = nil

    -- 从数据库删除（含清空 cooldown 缓存）
    self:DeleteSavedActivity(playerName)

    -- 触发回调
    self:FireUpdateCallbacks("ACTIVITY_CLOSED", activity)

    return true, "活动已关闭"
end

function ActivityManager:JoinActivity(leaderName, memberData)
    local activity = self.activities[leaderName]
    if not activity then
        return false, "活动不存在"
    end

    local success, message = activity:AddMember(memberData)
    if success then
        -- 触发回调
        self:FireUpdateCallbacks("MEMBER_JOINED", activity)
    end

    return success, message
end

function ActivityManager:LeaveActivity(leaderName, playerName)
    local activity = self.activities[leaderName]
    if not activity then
        return false, "活动不存在"
    end

    local success, message = activity:RemoveMember(playerName)
    if success then
        -- 触发回调
        self:FireUpdateCallbacks("MEMBER_LEFT", activity)
    end

    return success, message
end

function ActivityManager:GetActivity(leaderName)
    return self.activities[leaderName]
end

function ActivityManager:GetPlayerActivity()
    return self.currentPlayerActivity
end

function ActivityManager:GetFilteredActivities()
    -- 获取所有活动（包括聊天频道接收到的 + MeetingHorn 原生活动）
    local allActivities = {}
    -- 基于 leaderName 的去重集合，确保同一团长的活动只出现一次
    local seenLeaders = {}

    -- 1. 添加本地活动（优先级最高）
    for _, activity in pairs(self.activities) do
        if not activity:IsExpired() and self:PassesFilter(activity) then
            table.insert(allActivities, activity)
            if activity.leaderName then
                seenLeaders[activity.leaderName] = true
            end
        end
    end

    -- 2. 添加从聊天频道接收的 MHH 远程活动（优先级次之）
    if self.chatManager then
        local chatActivities = self.chatManager:GetAllActivities()
        for _, activity in ipairs(chatActivities) do
            if activity.leaderName and not seenLeaders[activity.leaderName] and
               not activity:IsExpired() and
               self:PassesFilter(activity) then
                table.insert(allActivities, activity)
                seenLeaders[activity.leaderName] = true
            end
        end
    end

    -- 3. 添加 MeetingHorn 原生活动（不带 MHH@@ 标识的普通活动，优先级最低）
    if self.chatManager then
        local mhActivities = self.chatManager:GetMeetingHornActivities()
        for _, activity in ipairs(mhActivities) do
            if activity.leaderName and not seenLeaders[activity.leaderName] and
               not activity:IsExpired() and
               self:PassesFilter(activity) then
                table.insert(allActivities, activity)
                seenLeaders[activity.leaderName] = true
            end
        end
    end

    -- 排序（MHH 插件活动排在前面）
    self:SortActivities(allActivities)

    return allActivities
end

function ActivityManager:PassesFilter(activity)
    -- 满人过滤：无论来源，满人活动一律不显示
    local memberCount = activity.memberCount or (activity.members and #activity.members) or 0
    local maxMembers = activity.maxMembers or 25
    if memberCount >= maxMembers and maxMembers > 0 then
        return false
    end

    -- 团本类型筛选
    if self.filters.raidType ~= 0 and activity.raidId ~= self.filters.raidType then
        return false
    end

    -- 活动模式筛选
    if self.filters.activityMode ~= 0 then
        -- MeetingHorn 原生活动的 modeId 与 MHH 定义不一致（MH: 1=带新,2=自强... vs MHH: 1=金团,2=DKP...），直接排除
        if activity._source == "meetinghorn" then
            return false
        end
        if activity.modeId ~= self.filters.activityMode then
            return false
        end
    end

    -- 需求职业筛选
    if self.filters.neededRoles ~= "all" then
        -- MeetingHorn 原生活动无真实角色需求数据，选择特定角色时排除
        if activity._source == "meetinghorn" then
            return false
        end
        local neededCount = activity:GetNeededRoleCount(self.filters.neededRoles)
        if neededCount <= 0 then
            return false
        end
    end

    return true
end

function ActivityManager:GetChatRecords()
    -- 获取独立存储的聊天记录（不依赖活动存在）
    if self.chatManager then
        return self.chatManager:GetChatRecords()
    end
    return {}
end

function ActivityManager:SortActivities(activities)
    local sortOrder = self.filters.sortOrder

    table.sort(activities, function(a, b)
        -- 优先级1：MHH 插件活动（本地 + MHH 远程）排在 MeetingHorn 原生活动前面
        local aIsMHH = (a._source ~= "meetinghorn")
        local bIsMHH = (b._source ~= "meetinghorn")
        if aIsMHH ~= bIsMHH then
            return aIsMHH
        end

        -- 优先级2：按用户选择的排序方式（所有字段 nil 保护，防止异常远程活动导致排序报错）
        if sortOrder == "time" then
            return (a.createdTime or 0) > (b.createdTime or 0)
        elseif sortOrder == "raid" then
            local raidA = ns.GetRaidName(a.raidId)
            local raidB = ns.GetRaidName(b.raidId)
            return (raidA or "") < (raidB or "")
        elseif sortOrder == "mode" then
            return (a.modeId or 0) < (b.modeId or 0)
        elseif sortOrder == "leader" then
            return (a.leaderName or "") < (b.leaderName or "")
        else
            return (a.createdTime or 0) > (b.createdTime or 0)
        end
    end)
end

function ActivityManager:SetFilter(filterType, value)
    if self.filters[filterType] ~= nil then
        self.filters[filterType] = value
        -- 触发回调
        self:FireUpdateCallbacks("FILTER_CHANGED", {filterType = filterType, value = value})
        return true
    end
    return false
end

function ActivityManager:GetFilter(filterType)
    return self.filters[filterType]
end

function ActivityManager:BroadcastActivity(leaderName)
    local activity = self.activities[leaderName]
    if not activity then
        return false, "活动不存在"
    end

    return activity:Broadcast()
end

function ActivityManager:SaveActivity(activity)
    if not ns.Addon.db then
        return
    end

    local saveData = activity:ToSaveData()

    -- 保存到char层（角色级别持久化）
    if ns.Addon.db.char then
        ns.Addon.db.char.currentActivity = saveData
    end

    -- 同时保存到profile层cache（双重保险，参考meetinghorn的profile.cache.current）
    if ns.Addon.db.profile and ns.Addon.db.profile.cache then
        ns.Addon.db.profile.cache.currentActivity = saveData
        ns.Addon.db.profile.cache.cooldown = { start = time() }
    end
end

function ActivityManager:DeleteSavedActivity(playerName)
    if not ns.Addon.db then
        return
    end

    -- 清除char层缓存
    if ns.Addon.db.char then
        ns.Addon.db.char.currentActivity = nil
    end

    -- 清除profile层cache
    if ns.Addon.db.profile and ns.Addon.db.profile.cache then
        ns.Addon.db.profile.cache.currentActivity = nil
        ns.Addon.db.profile.cache.cooldown = { start = 0 }
    end
end

function ActivityManager:LoadSavedActivity()
    if not ns.Addon.db or not ns.Addon.db.char.currentActivity then
        return
    end
    
    local saveData = ns.Addon.db.char.currentActivity
    local activity = ns.HeroicRaidActivity:New()
    activity:LoadFromData(saveData)
    
    local playerName = UnitName("player")
    self.activities[playerName] = activity
    self.currentPlayerActivity = activity
    
    -- 触发回调
    self:FireUpdateCallbacks("ACTIVITY_LOADED", activity)
end

function ActivityManager:CleanExpiredActivities()
    local expiredActivities = {}
    
    for leaderName, activity in pairs(self.activities) do
        if activity:IsExpired() then
            table.insert(expiredActivities, leaderName)
        end
    end
    
    for _, leaderName in ipairs(expiredActivities) do
        self.activities[leaderName] = nil
        -- 触发回调
        self:FireUpdateCallbacks("ACTIVITY_EXPIRED", {leaderName = leaderName})
    end
    
    return #expiredActivities
end

function ActivityManager:GetActivityStats()
    local stats = {
        totalActivities = 0,
        byRaid = {},
        byMode = {},
        totalMembers = 0
    }
    
    for _, activity in pairs(self.activities) do
        if not activity:IsExpired() then
            stats.totalActivities = stats.totalActivities + 1
            stats.totalMembers = stats.totalMembers + activity:GetMemberCount()
            
            -- 按团本统计
            local raidName = ns.GetRaidName(activity.raidId)
            stats.byRaid[raidName] = (stats.byRaid[raidName] or 0) + 1
            
            -- 按模式统计
            local modeData = activity:GetModeData()
            if modeData then
                stats.byMode[modeData.name] = (stats.byMode[modeData.name] or 0) + 1
            end
        end
    end
    
    return stats
end

-- 聊天管理器事件处理
function ActivityManager:OnChatManagerEvent(eventType, data)
    if eventType == "ACTIVITY_RECEIVED" then
        -- 收到新的 MHH 活动广播
        self:FireUpdateCallbacks("EXTERNAL_ACTIVITY_RECEIVED", data)
    elseif eventType == "CHAT_RECORD_ADDED" then
        -- 添加了新的聊天记录
        self:FireUpdateCallbacks("CHAT_RECORD_UPDATED", data)
    elseif eventType == "ACTIVITIES_CLEANED" then
        -- 清理了过期活动
        self:FireUpdateCallbacks("ACTIVITIES_REFRESHED", data)
    elseif eventType == "TEAM_CHAT_ADDED" then
        -- 团队聊天消息（RAID/PARTY），直接透传给 UI 层
        self:FireUpdateCallbacks("TEAM_CHAT_ADDED", data)
    elseif eventType == "CHAT_RECORD_UPDATED" then
        -- whisper 信息补全后刷新（如 ADDON 同步到 class/level 等）
        self:FireUpdateCallbacks("CHAT_RECORD_UPDATED", data)
    elseif eventType == "MEMBER_INFO_RECEIVED" then
        -- 成员 ADDON INFO 同步完成，UI 需要刷新头像/职业
        self:FireUpdateCallbacks("MEMBER_INFO_RECEIVED", data)
    elseif eventType == "MEETINGHORN_ACTIVITY_UPDATE"
        or eventType == "MEETINGHORN_ACTIVITY_ADDED"
        or eventType == "MEETINGHORN_ACTIVITY_REMOVED" then
        -- MeetingHorn 原生活动列表发生变化，需要刷新 UI
        self:FireUpdateCallbacks("EXTERNAL_ACTIVITY_RECEIVED", data)
    elseif eventType == "WHISPER_APPLICANT" then
        -- 密语申请者检测（原 CHAT_MSG_WHISPER 双重注册已统一到 ChatManager 回调）
        if self.currentPlayerActivity and data then
            local text = data.text
            local sender = data.sender
            local guid = data.guid
            if text == '1' or text == '组' then
                local class, race
                if guid then
                    class, race = select(2, GetPlayerInfoByGUID(guid))
                end
                self:AddApplicant(sender, class, race)
            end
        end
    end
end

-- 轻量级活动计数（跳过 Filter/Sort，但包含所有来源的活动）
-- 按 leaderName 去重，与 GetFilteredActivities 保持一致
function ActivityManager:GetRawActivityCount()
    local count = 0
    local seenLeaders = {}

    -- 1. 本地活动
    for _, activity in pairs(self.activities) do
        if not activity:IsExpired() then
            count = count + 1
            if activity.leaderName then
                seenLeaders[activity.leaderName] = true
            end
        end
    end

    -- 2. MHH 远程活动
    if self.chatManager and self.chatManager.receivedActivities then
        for _, activity in pairs(self.chatManager.receivedActivities) do
            if not activity:IsExpired() then
                if not activity.leaderName or not seenLeaders[activity.leaderName] then
                    count = count + 1
                    if activity.leaderName then
                        seenLeaders[activity.leaderName] = true
                    end
                end
            end
        end
    end

    -- 3. MeetingHorn 原生活动（使用缓存，cache 命中时 O(n) 遍历数组）
    if self.chatManager and self.chatManager.GetMeetingHornActivities then
        local mhActivities = self.chatManager:GetMeetingHornActivities()
        for _, activity in ipairs(mhActivities) do
            if not activity:IsExpired() then
                if not activity.leaderName or not seenLeaders[activity.leaderName] then
                    count = count + 1
                    if activity.leaderName then
                        seenLeaders[activity.leaderName] = true
                    end
                end
            end
        end
    end

    return count
end

-- 处理外部活动接收
function ActivityManager:OnExternalActivityReceived(activity)
    -- 这个方法由ChatManager调用
    -- 不需要添加到本地activities，因为GetFilteredActivities会从ChatManager获取
    self:FireUpdateCallbacks("EXTERNAL_ACTIVITY_RECEIVED", activity)
end

-- 发送密语给指定玩家
function ActivityManager:SendWhisperToPlayer(playerName, message)
    if playerName and message then
        SendChatMessage(message, "WHISPER", nil, playerName)
        return true
    end
    return false
end

-- 创建队伍更新监听器
function ActivityManager:CreateGroupUpdateFrame()
    if self.groupUpdateFrame then
        return
    end

    local frame = CreateFrame("Frame", "MeetingHornHeroicGroupUpdateFrame")
    frame:RegisterEvent("GROUP_ROSTER_UPDATE")
    frame:RegisterEvent("PARTY_LEADER_CHANGED")
    frame:RegisterEvent("CHAT_MSG_SYSTEM")
    -- CHAT_MSG_WHISPER 已统一到 ChatManager，通过 WHISPER_APPLICANT 回调通知（消除双重注册）
    frame:SetScript("OnEvent", function(self, event, ...)
        if event == "CHAT_MSG_SYSTEM" then
            ns.ActivityManager:OnSystemMessage(...)
        else
            ns.ActivityManager:OnGroupRosterUpdate()
        end
    end)

    self.groupUpdateFrame = frame
end

-- 处理队伍成员变化
-- 统一使用延迟去抖，确保 WoW API（UnitIsGroupLeader 等）已更新完成
function ActivityManager:OnGroupRosterUpdate()
    -- 使用延迟去抖：每次事件触发都重置定时器，确保拿到最终稳定的队伍数据
    -- 解决首次组队时 GROUP_ROSTER_UPDATE / PARTY_LEADER_CHANGED 连续触发，
    -- 前几次 UnitIsGroupLeader 等 API 尚未更新的问题
    if self._groupSyncTimer then
        self._groupSyncTimer:Cancel()
        self._groupSyncTimer = nil
    end

    self._groupSyncTimer = C_Timer.NewTimer(1.0, function()
        self._groupSyncTimer = nil

        -- ========== 个人求组关闭检测（无论是否有团本活动都需要检查） ==========
        -- 场景1：只有个人求组没有团本活动，移交队长后应关闭
        -- 场景2：有团本活动也有个人求组，移交队长后两个都应关闭
        -- 场景3：个人求组发布后加入了他人队伍且不是队长
        -- 直接对齐 meetinghorn: not ns.IsGroupLeader() → CloseActivity
        if ns.PlayerSquareManager and ns.PlayerSquareManager:GetMyRequest() then
            if not self:IsPlayerGroupLeader() then
                ns.PlayerSquareManager:CloseMyRequest()
                ns.Addon:Print("检测到您已不再是队长，您的个人求组已自动关闭")
            end
        end

        -- ========== 团本活动处理 ==========
        if not self.currentPlayerActivity then
            return
        end

        -- 先检查是否应该关闭团本活动（玩家不再是领袖）
        if self:ShouldCloseActivityOnGroupChange() then
            self:ClosePlayerActivity()
            ns.Addon:Print("检测到您已不再是队长，您的活动已自动关闭")
            return
        end

        -- 满员检测（参考 meetinghorn LFG:GROUP_ROSTER_UPDATE）
        local maxMembers = self.currentPlayerActivity.maxMembers or 25
        if GetNumGroupMembers() >= maxMembers then
            self:ClosePlayerActivity()
            ns.Addon:Print("队伍已满员，活动已自动关闭")
            return
        end

        -- 清理已加入队伍的申请者（参考 meetinghorn LFG:GROUP_ROSTER_UPDATE）
        self:CleanApplicantsInGroup()

        self:SyncActivityWithGroup()
    end)
end

-- 检查是否应该在队伍变化时关闭活动
-- 直接对齐 meetinghorn LFG:GROUP_ROSTER_UPDATE:
--   if not ns.IsGroupLeader() then self:CloseActivity() end
function ActivityManager:ShouldCloseActivityOnGroupChange()
    if not self.currentPlayerActivity then
        return false
    end

    -- 直接使用 IsPlayerGroupLeader（已对齐 meetinghorn 的 ns.IsGroupLeader）
    -- meetinghorn 中没有 groupSize <= 2 的特殊保护，也没有 leaderName 的二次判断
    -- 1秒的延迟去抖已经足够让 WoW API 更新完成
    return not self:IsPlayerGroupLeader()
end

-- 判断玩家是否为当前队伍/团队的领袖
-- 对齐 meetinghorn 的 ns.IsGroupLeader() 实现
function ActivityManager:IsPlayerGroupLeader()
    -- 完全复制 meetinghorn 的逻辑：不在本服队伍中 → 视为队长，在队伍中 → 检查是否队长
    -- 使用 LE_PARTY_CATEGORY_HOME 确保检测的是本服队伍状态
    return not IsInGroup(LE_PARTY_CATEGORY_HOME) or UnitIsGroupLeader('player', LE_PARTY_CATEGORY_HOME)
end

-- 同步活动成员与当前队伍
function ActivityManager:SyncActivityWithGroup()
    if not self.currentPlayerActivity then
        return
    end

    local activity = self.currentPlayerActivity
    local playerName = UnitName("player")

    -- 获取当前队伍成员
    local currentGroupMembers = {}

    -- 始终添加玩家自己（无论是否组队）
    currentGroupMembers[playerName] = {
        name = playerName,
        class = UnitClass("player"),
        classFileName = select(2, UnitClass("player")),
        level = UnitLevel("player"),
        role = self:DetectPlayerRole("player", select(2, UnitClass("player")))
    }

    -- 检查是否在团队中
    if IsInRaid() then
        -- 团队模式：使用 raid1-raid40
        for i = 1, GetNumGroupMembers() do
            local unit = "raid" .. i
            if UnitExists(unit) then
                local memberName = UnitName(unit)
                if memberName and memberName ~= playerName then
                    local class, classFileName = UnitClass(unit)
                    local level = UnitLevel(unit)

                    currentGroupMembers[memberName] = {
                        name = memberName,
                        class = class,
                        classFileName = classFileName,
                        level = level,
                        role = self:DetectPlayerRole(unit, classFileName)
                    }
                end
            end
        end
    elseif IsInGroup() then
        -- 小队模式：使用 party1-party4，GetNumGroupMembers() 包括自己
        local groupSize = GetNumGroupMembers()
        for i = 1, groupSize - 1 do  -- 减1是因为 GetNumGroupMembers() 包括自己
            local unit = "party" .. i
            if UnitExists(unit) then
                local memberName = UnitName(unit)
                if memberName and memberName ~= playerName then
                    local class, classFileName = UnitClass(unit)
                    local level = UnitLevel(unit)

                    currentGroupMembers[memberName] = {
                        name = memberName,
                        class = class,
                        classFileName = classFileName,
                        level = level,
                        role = self:DetectPlayerRole(unit, classFileName)
                    }
                end
            end
        end
    end
    -- 如果既不在团队也不在小队，currentGroupMembers 就只有玩家自己

    -- 检查是否有变化
    local hasChanges = false

    -- 检查活动中是否有已经不在队伍中的成员
    if activity.members then
        for memberName, _ in pairs(activity.members) do
            if not currentGroupMembers[memberName] then
                activity:RemoveMember(memberName)
                hasChanges = true
            end
        end
    end

    -- 检查队伍中是否有新成员需要添加到活动中
    for memberName, memberData in pairs(currentGroupMembers) do
        if not activity.members or not activity.members[memberName] then
            activity:AddMember(memberData)
            hasChanges = true
            -- 静默添加成员，不显示提示

            -- 更新聊天记录中该玩家的职业/等级信息
            if self.chatManager and memberData.classFileName then
                self.chatManager:UpdateChatRecordPlayerInfo(memberName, {
                    class = memberData.classFileName,
                    level = memberData.level
                })
            end
        end
    end

    -- 如果有变化，更新活动并重新广播
    if hasChanges then
        activity:UpdateTimestamp()

        -- 保存到数据库
        self:SaveActivity(activity)

        -- 队伍成员变化时重置广播计数并重新启动广播定时器
        -- 确保新成员信息能被其他玩家收到
        activity.broadcastCount = 0
        if self.chatManager then
            self.chatManager:StartBroadcastTimer()
        end

        -- 触发回调通知UI更新
        self:FireUpdateCallbacks("ACTIVITY_SYNCED", activity)
    end

    -- 仅在有队伍变化时刷新聊天记录玩家信息（无变化时队员信息不会改变）
    if hasChanges and self.chatManager then
        self.chatManager:RefreshChatRecordsFromGroup()
    end

    -- 通知队长我的信息（由 Manager 统一处理，ChatManager 不再独立监听 GROUP_ROSTER_UPDATE）
    if self.chatManager and self.chatManager.SendMyInfoToLeader then
        self.chatManager:SendMyInfoToLeader()
    end
end

-- ============================================================
-- 申请者管理系统（参考 meetinghorn LFG 的 applicants）
-- ============================================================

-- 检测 ERR_DECLINE_GROUP_S 拒绝入队消息的 pattern
local ERR_DECLINE_GROUP_S_P = ERR_DECLINE_GROUP_S and ERR_DECLINE_GROUP_S:format('(.+)') or nil

-- 添加/更新申请者（参考 meetinghorn LFG:AddApplicant）
function ActivityManager:AddApplicant(unitName, class, race, level)
    unitName = Ambiguate(unitName, 'none')

    local existing = self.applicants[unitName]
    if existing then
        -- 更新已有申请者信息
        if class then existing.class = class end
        if race then existing.race = race end
        if level then existing.level = level end
        existing.timestamp = time()
    else
        local applicant = {
            name = unitName,
            class = class,
            race = race,
            level = level,
            state = "pending", -- pending / invited / declined
            timestamp = time(),
        }
        self.applicants[unitName] = applicant
    end
    self:FireUpdateCallbacks("APPLICANT_ADDED", { name = unitName })
end

-- 移除申请者
function ActivityManager:RemoveApplicant(unitName)
    if self.applicants[unitName] then
        self.applicants[unitName] = nil
        self:FireUpdateCallbacks("APPLICANT_UPDATED", { name = unitName })
    end
end

-- 邀请申请者（参考 meetinghorn LFG:InviteApplicant）
function ActivityManager:InviteApplicant(applicant)
    if not applicant or not applicant.name then return end
    InviteUnit(applicant.name)
    applicant.state = "invited"
    self:FireUpdateCallbacks("APPLICANT_UPDATED", { name = applicant.name })
end

-- 获取所有申请者
function ActivityManager:GetApplicants()
    return self.applicants
end

-- 清理已加入队伍的申请者（参考 meetinghorn LFG:GROUP_ROSTER_UPDATE）
function ActivityManager:CleanApplicantsInGroup()
    if not self.currentPlayerActivity then
        return
    end
    if not self:IsPlayerGroupLeader() then
        return
    end

    local changed = false
    for name, applicant in pairs(self.applicants) do
        if UnitInParty(name) or UnitInRaid(name) then
            self.applicants[name] = nil
            changed = true
        end
    end

    if changed then
        self:FireUpdateCallbacks("APPLICANT_UPDATED", nil)
    end
end

-- 检测拒绝入队（参考 meetinghorn LFG:CheckDecline）
function ActivityManager:CheckDecline(text)
    if not ERR_DECLINE_GROUP_S_P then
        return false
    end
    local unit = text:match(ERR_DECLINE_GROUP_S_P)
    if unit then
        local applicant = self.applicants[unit]
        if applicant then
            applicant.state = "declined"
            self:FireUpdateCallbacks("APPLICANT_UPDATED", { name = unit })
        end
        return true
    end
    return false
end

-- 系统消息处理（CHAT_MSG_SYSTEM）
function ActivityManager:OnSystemMessage(text, ...)
    self:CheckDecline(text)
end

-- 密语申请者检测（CHAT_MSG_WHISPER，参考 meetinghorn LFG:CHAT_MSG_WHISPER）
function ActivityManager:OnWhisperForApplicant(text, unitName, _, _, _, flag, _, _, _, _, _, guid)
    if not self.currentPlayerActivity then
        return
    end
    if not guid then
        return
    end
    if text == '1' or text == '组' then
        local class, race = select(2, GetPlayerInfoByGUID(guid))
        self:AddApplicant(unitName, class, race)
    end
end

-- 创建全局管理器实例
ns.ActivityManager = ActivityManager:New()

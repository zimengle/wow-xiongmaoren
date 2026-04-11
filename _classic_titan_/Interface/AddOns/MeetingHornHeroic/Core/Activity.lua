-- Activity.lua
-- 英雄团本活动核心类

---@type MeetingHornHeroicNS
local ns = select(2, ...)

---@class HeroicRaidActivity
local HeroicRaidActivity = {}
HeroicRaidActivity.__index = HeroicRaidActivity

function HeroicRaidActivity:New(raidId, modeId, leaderName, comment, itemLevelRequirement)
    local activity = {
        raidId = raidId,
        modeId = modeId,
        leaderName = leaderName or UnitName("player"),
        comment = comment or "",
        createdTime = time(),
        lastUpdateTime = time(),
        members = {},
        neededRoles = {
            tank = 0,
            healer = 0,
            dps = 0
        },
        maxMembers = 25,
        broadcastChannel = ns.channelConfig.defaultChannel,
        status = "recruiting", -- recruiting, full, started, finished
        broadcastCount = 0,
        lastBroadcastTime = 0,
        chatRecords = {}, -- 聊天记录
        leaderClass = nil, -- 团长职业
        leaderGUID = nil, -- 团长GUID
        certificationLevel = nil, -- 认证等级
        isOurAddonCreate = false, -- 是否为本插件创建
        itemLevelRequirement = itemLevelRequirement or nil -- 装等要求
    }

    setmetatable(activity, self)

    -- 设置团长信息
    if activity.leaderName then
        activity:SetLeader(activity.leaderName)
    end

    -- 如果是本地玩家创建，标记为本插件创建
    if activity.leaderName == UnitName("player") then
        activity.isOurAddonCreate = true
    end

    return activity
end

function HeroicRaidActivity:GetRaidData()
    return ns.raidData[self.raidId]
end

function HeroicRaidActivity:GetModeData()
    return ns.activityModeMap[self.modeId]
end

-- 获取团长职业信息
function HeroicRaidActivity:GetLeaderClass()
    return self.leaderClass
end

-- 设置团长信息
function HeroicRaidActivity:SetLeader(leaderName)
    self.leaderName = leaderName

    -- 尝试通过不同方式获取GUID和职业
    local guid = UnitGUID(leaderName)
    if not guid and leaderName == UnitName("player") then
        guid = UnitGUID("player")
    end

    if guid then
        self.leaderGUID = guid
        local _, class = GetPlayerInfoByGUID(guid)
        self.leaderClass = class or 'PRIEST'
    else
        -- 如果无法获取GUID，尝试从Unit函数获取
        if leaderName == UnitName("player") then
            local localizedClass, englishClass = UnitClass("player")
            self.leaderClass = englishClass or 'PRIEST'
        else
            -- 默认职业（当无法获取时）
            self.leaderClass = 'PRIEST'
        end
    end
end

-- 设置团长GUID（用于远程活动）
function HeroicRaidActivity:SetLeaderGUID(guid, leaderName)
    if guid then
        self.leaderGUID = guid
        local _, class = GetPlayerInfoByGUID(guid)
        self.leaderClass = class or 'PRIEST'
        if leaderName then
            self.leaderName = leaderName
        end
    end
end

function HeroicRaidActivity:AddMember(memberData)
    local playerName = memberData.name
    if not playerName then
        return false, "缺少玩家姓名"
    end
    
    -- 检查是否已经在队伍中
    if self.members[playerName] then
        return false, "玩家已在队伍中"
    end
    
    -- 检查队伍是否满员
    local totalMembers = self:GetMemberCount()
    if totalMembers >= self.maxMembers then
        return false, "队伍已满员"
    end
    
    -- 添加成员
    self.members[playerName] = {
        name = playerName,
        class = memberData.class,
        classFileName = memberData.classFileName,
        role = memberData.role,
        level = memberData.level or UnitLevel(playerName),
        joinTime = time(),
        status = "joined"
    }
    
    self:UpdateTimestamp()
    return true, "成功加入队伍"
end

function HeroicRaidActivity:RemoveMember(playerName)
    if not self.members[playerName] then
        return false, "玩家不在队伍中"
    end
    
    self.members[playerName] = nil
    self:UpdateTimestamp()
    return true, "成功离开队伍"
end

function HeroicRaidActivity:GetMemberCount()
    local count = 0
    if self.members then
        for _ in pairs(self.members) do
            count = count + 1
        end
    end
    -- 远程活动：优先使用协议解析的 memberCount（因为 members 表在远程端可能不完整）
    if self.memberCount and self.memberCount > count then
        return self.memberCount
    end
    return count
end

function HeroicRaidActivity:GetMembersByRole(role)
    local roleMembers = {}
    for _, member in pairs(self.members) do
        if member.role == role then
            table.insert(roleMembers, member)
        end
    end
    return roleMembers
end

function HeroicRaidActivity:SetNeededRoles(tankCount, healerCount, dpsCount)
    self.neededRoles.tank = tankCount or 0
    self.neededRoles.healer = healerCount or 0  
    self.neededRoles.dps = dpsCount or 0
    self:UpdateTimestamp()
end

function HeroicRaidActivity:GetNeededRoleCount(role)
    local currentCount = #self:GetMembersByRole(role)
    local neededCount = self.neededRoles[role] or 0
    return math.max(0, neededCount - currentCount)
end

function HeroicRaidActivity:UpdateComment(newComment)
    if newComment and newComment ~= "" then
        self.comment = newComment
        self:UpdateTimestamp()
        return true
    end
    return false
end

function HeroicRaidActivity:UpdateTimestamp()
    self.lastUpdateTime = time()
end

function HeroicRaidActivity:CanBroadcast()
    local currentTime = time()
    local timeSinceLastBroadcast = currentTime - self.lastBroadcastTime
    return timeSinceLastBroadcast >= ns.channelConfig.broadcastInterval and 
           self.broadcastCount < ns.channelConfig.maxBroadcastCount
end

function HeroicRaidActivity:CreateBroadcastMessage()
    local raidData = self:GetRaidData()
    local modeData = self:GetModeData()
    
    if not raidData or not modeData then
        return nil
    end
    
    local message = string.format("[%s][%s] %s - %s", 
        raidData.name,
        modeData.name,
        self.leaderName,
        self.comment
    )
    
    -- 添加职业需求信息
    local neededInfo = {}
    for role, count in pairs(self.neededRoles) do
        if count > 0 then
            local currentCount = #self:GetMembersByRole(role)
            local needed = count - currentCount
            if needed > 0 then
                local roleConfig = ns.classConfigs[role]
                if roleConfig then
                    table.insert(neededInfo, string.format("缺%s%d", roleConfig.displayName, needed))
                end
            end
        end
    end
    
    if #neededInfo > 0 then
        message = message .. " [" .. table.concat(neededInfo, ",") .. "]"
    end
    
    return message
end

function HeroicRaidActivity:Broadcast()
    if not self:CanBroadcast() then
        return false, "广播间隔未到或已达上限"
    end
    
    local message = self:CreateBroadcastMessage()
    if not message then
        return false, "无法创建广播消息"
    end
    
    -- 战斗中禁止广播：SendChatMessage 会被 Blizzard BLOCK，产生 taint
    if InCombatLockdown() then
        return false, "战斗中不能广播"
    end

    -- 发送到指定频道（使用分包协议）
    local channelId = GetChannelName(self.broadcastChannel)
    ns.SendPacketMessage(message, channelId)
    
    self.broadcastCount = self.broadcastCount + 1
    self.lastBroadcastTime = time()
    
    return true, "广播发送成功"
end

function HeroicRaidActivity:GetActivityAge()
    return time() - self.createdTime
end

function HeroicRaidActivity:IsExpired()
    -- 活动超过2小时自动过期
    return self:GetActivityAge() > 7200
end

function HeroicRaidActivity:GetFormattedTime()
    local age = self:GetActivityAge()
    if age < 60 then
        return string.format("%d秒前", age)
    elseif age < 3600 then
        return string.format("%d分钟前", math.floor(age / 60))
    else
        return string.format("%d小时前", math.floor(age / 3600))
    end
end

-- 序列化功能（参考meetinghorn的ToProto方法）
function HeroicRaidActivity:ToProto()
    -- 格式：活动名称.活动说明.人数.等级.团本ID.模式ID.需求角色.团长职业@@
    local raidData = self:GetRaidData()
    local modeData = self:GetModeData()
    local memberCount = self:GetMemberCount()
    local playerLevel = UnitLevel("player")

    -- 构建需求职业字符串 格式: tank:2,healer:1,dps:5
    -- 发送总需求量（不减去已有成员），接收端通过 members 表自行计算缺口
    local neededRoles = {}
    for role, count in pairs(self.neededRoles) do
        if count > 0 then
            table.insert(neededRoles, role .. ":" .. count)
        end
    end
    local neededRolesStr = table.concat(neededRoles, ",")

    -- 序列化成员列表作为独立字段（放在 leaderClass 和 MHH 之间）
    -- 格式: name~classFile~role~level;name~classFile~role~level（无成员时为 _）
    local memberParts = {}
    if self.members then
        for _, member in pairs(self.members) do
            local mName = (member.name or ""):gsub("[~;%.]", "")
            local mClass = member.classFileName or member.class or "UNKNOWN"
            local mRole = member.role or "dps"
            local mLevel = member.level or 0
            table.insert(memberParts, string.format("%s~%s~%s~%d", mName, mClass, mRole, mLevel))
        end
    end
    local membersData = #memberParts > 0 and table.concat(memberParts, ";") or "_"

    -- broadcastSeq: 每次 ToProto 递增，确保频道消息不重复（防 WoW 反重复丢弃）
    local broadcastSeq = self.broadcastCount or 0

    return string.format('%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s@@',
        self.leaderName or "",
        self.comment or "",
        memberCount,
        playerLevel,
        self.raidId or "",
        self.modeId or "",
        neededRolesStr,
        self.leaderClass or "",
        membersData,
        broadcastSeq,
        "MHH"
    )
end

-- 反序列化功能（参考meetinghorn的FromProto方法）
function HeroicRaidActivity:FromProto(proto)
    if not proto or not string.find(proto, "@@") then
        return nil, "无效的活动数据格式"
    end

    -- 移除结尾标记
    proto = string.gsub(proto, "@@.*", "")

    -- 分割数据
    local parts = {}
    for part in string.gmatch(proto, "([^.]*).?") do
        table.insert(parts, part)
    end

    if #parts < 7 then
        return nil, "活动数据不完整"
    end

    local activity = {
        leaderName = parts[1],
        comment = parts[2],
        memberCount = tonumber(parts[3]) or 0,
        leaderLevel = tonumber(parts[4]) or 80,
        raidId = tonumber(parts[5]),
        modeId = tonumber(parts[6]),
        neededRolesStr = parts[7] or "",
        leaderClass = parts[8] or nil, -- 团长职业
        createdTime = time(),
        lastUpdateTime = time(),
        members = {},
        neededRoles = {tank = 0, healer = 0, dps = 0},
        maxMembers = 25,
        status = "recruiting",
        broadcastChannel = ns.channelConfig.defaultChannel
    }

    -- 解析需求职业
    if activity.neededRolesStr and activity.neededRolesStr ~= "" then
        for roleData in string.gmatch(activity.neededRolesStr, "([^,]+)") do
            local role, count = string.match(roleData, "([^:]+):(%d+)")
            if role and count then
                activity.neededRoles[role] = tonumber(count) or 0
            end
        end
    end

    setmetatable(activity, self)

    -- 根据职业推测角色的辅助函数
    local function guessRole(classFileName)
        local tankClasses = {WARRIOR = true, PALADIN = true, DEATHKNIGHT = true}
        local healerClasses = {PRIEST = true, PALADIN = true, SHAMAN = true, DRUID = true}

        if tankClasses[classFileName] then
            return "tank"
        elseif healerClasses[classFileName] then
            return "healer"
        else
            return "dps"
        end
    end

    -- 解析成员列表
    -- v3格式(11字段): parts[9]=membersData, parts[10]=broadcastSeq, parts[11]="MHH"
    -- v2格式(10字段): parts[9]=membersData, parts[10]="MHH"
    -- v1格式(9字段):  parts[9]="MHH"
    local membersData = nil
    if parts[11] == "MHH" then
        -- v3格式：含 broadcastSeq，成员数据在 parts[9]，parts[10] 为 seq（忽略）
        membersData = parts[9]
    elseif parts[10] == "MHH" then
        -- v2格式：成员数据在 parts[9]
        membersData = parts[9]
    end

    if membersData and membersData ~= "_" and membersData ~= "" then
        -- 解析完整成员列表（格式: name~classFile~role~level;name~classFile~role~level）
        for memberStr in membersData:gmatch("([^;]+)") do
            local mParts = {}
            for mp in memberStr:gmatch("([^~]+)") do
                table.insert(mParts, mp)
            end
            if #mParts >= 4 then
                local mName = mParts[1]
                local mClassFile = mParts[2]
                local mRole = mParts[3]
                local mLevel = tonumber(mParts[4]) or 0
                local localizedClass = _G["LOCALIZED_CLASS_NAMES_" .. (UnitSex("player") == 2 and "FEMALE" or "MALE")]
                activity.members[mName] = {
                    name = mName,
                    class = (localizedClass and localizedClass[mClassFile]) or mClassFile,
                    classFileName = mClassFile,
                    role = mRole,
                    level = mLevel,
                    joinTime = activity.createdTime,
                    status = (mName == activity.leaderName) and "leader" or "joined"
                }
            end
        end
    else
        -- 旧格式（或无成员数据）：只添加团长
        if activity.leaderName and activity.leaderClass then
            local localizedClass = _G["LOCALIZED_CLASS_NAMES_" .. (UnitSex("player") == 2 and "FEMALE" or "MALE")]
            activity.members[activity.leaderName] = {
                name = activity.leaderName,
                class = (localizedClass and localizedClass[activity.leaderClass]) or activity.leaderClass,
                classFileName = activity.leaderClass,
                role = guessRole(activity.leaderClass),
                level = activity.leaderLevel or 80,
                joinTime = activity.createdTime,
                status = "leader"
            }
        end
    end

    return activity
end

-- 静态方法：从聊天消息创建活动
function HeroicRaidActivity.CreateFromChatMessage(message, sender)
    local activity = HeroicRaidActivity:FromProto(message)
    if activity then
        activity.leaderName = sender -- 使用实际发送者名称
        return activity
    end
    return nil
end

function HeroicRaidActivity:ToSaveData()
    return {
        raidId = self.raidId,
        modeId = self.modeId,
        leaderName = self.leaderName,
        comment = self.comment,
        createdTime = self.createdTime,
        lastUpdateTime = self.lastUpdateTime,
        members = self.members,
        neededRoles = self.neededRoles,
        maxMembers = self.maxMembers,
        broadcastChannel = self.broadcastChannel,
        status = self.status,
        broadcastCount = self.broadcastCount,
        lastBroadcastTime = self.lastBroadcastTime
    }
end

function HeroicRaidActivity:LoadFromData(data)
    for key, value in pairs(data) do
        self[key] = value
    end
end

-- 认证相关方法
function HeroicRaidActivity:GetCertificationLevel()
    return self.certificationLevel
end

function HeroicRaidActivity:SetCertificationLevel(level)
    self.certificationLevel = level
end

function HeroicRaidActivity:IsOurAddonCreate()
    return self.isOurAddonCreate
end

function HeroicRaidActivity:SetOurAddonCreate(isOurAddonCreate)
    self.isOurAddonCreate = isOurAddonCreate
end

ns.HeroicRaidActivity = HeroicRaidActivity

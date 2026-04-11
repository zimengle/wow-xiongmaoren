-- MeetingHornAPI.lua
-- MeetingHorn 依赖接口统一管理（Facade 模式）
-- 所有对 MeetingHorn 插件的外部依赖调用都集中在这里

---@type MeetingHornHeroicNS
local ns = select(2, ...)

-- MeetingHorn API Facade
ns.MeetingHornAPI = {}
local API = ns.MeetingHornAPI

-- 模块级缓存变量
local cachedAddon = nil
local cachedChannel = nil
local cachedLFG = nil

-- ============================================================
-- 核心方法
-- ============================================================

-- 初始化：尝试获取并缓存 MeetingHorn addon 实例
function API:Initialize()
    if cachedAddon then return true end
    local ok, addon = pcall(function()
        return LibStub('AceAddon-3.0'):GetAddon('MeetingHorn', true)
    end)
    if ok and addon then
        cachedAddon = addon
        return true
    end
    return false
end

-- 检查 MeetingHorn 是否可用
function API:IsAvailable()
    return self:GetAddon() ~= nil
end

-- 获取 MeetingHorn addon 实例（带懒加载）
function API:GetAddon()
    if cachedAddon then return cachedAddon end
    -- 懒加载重试
    local ok, addon = pcall(function()
        return LibStub('AceAddon-3.0'):GetAddon('MeetingHorn', true)
    end)
    if ok and addon then
        cachedAddon = addon
    end
    return cachedAddon
end

-- ============================================================
-- 模块获取
-- ============================================================

-- 获取 MeetingHorn 的 Channel 模块
function API:GetChannel()
    if cachedChannel then return cachedChannel end
    local addon = self:GetAddon()
    if not addon then return nil end
    local channel = addon.Channel or (addon.GetModule and addon:GetModule('Channel'))
    if channel then
        cachedChannel = channel
    end
    return cachedChannel
end

-- 获取 MeetingHorn 的 LFG 模块
function API:GetLFG()
    if cachedLFG then return cachedLFG end
    local addon = self:GetAddon()
    if not addon then return nil end
    local lfg = addon:GetModule('LFG', true)
    if lfg then
        cachedLFG = lfg
    end
    return cachedLFG
end

-- 获取 MeetingHorn 的 MainPanel（不缓存 nil，允许重试）
function API:GetMainPanel()
    local addon = self:GetAddon()
    if not addon then return nil end
    return addon.MainPanel
end

-- ============================================================
-- 业务方法
-- ============================================================

-- 获取玩家的星团长认证等级
-- @param playerName string 玩家名字（不含服务器名）
-- @return number 认证等级，0 表示无认证
function API:GetPlayerRegimentLevel(playerName)
    if not playerName then return 0 end
    local addon = self:GetAddon()
    if not addon or not addon.db or not addon.db.realm then return 0 end
    local starRegiment = addon.db.realm.starRegiment
    if not starRegiment or not starRegiment.regimentData then return 0 end
    local data = starRegiment.regimentData[playerName]
    if not data then return 0 end
    if type(data) == "table" then
        return data.level or 0
    elseif type(data) == "number" then
        return data
    end
    return 0
end

-- ============================================================
-- 关键字过滤方法（任务 1.4~1.7）
-- ============================================================

-- 获取过滤关键字列表
-- 优先返回 MeetingHorn 的 db.global.activity.filters（与 MeetingHorn 互通）
-- 降级：使用本地存储
function API:GetActivityFilters()
    local addon = self:GetAddon()
    if addon and addon.db and addon.db.global and addon.db.global.activity and addon.db.global.activity.filters then
        return addon.db.global.activity.filters
    end
    -- 降级：使用本地存储（防御性检查，避免 activity 为 nil 时报错）
    if ns.Addon and ns.Addon.db and ns.Addon.db.global then
        local g = ns.Addon.db.global
        if not g.activity then
            g.activity = {}
        end
        if not g.activity.filters then
            g.activity.filters = {}
        end
        return g.activity.filters
    end
    return {}
end

-- 添加过滤关键字
-- @param keyword table {text = string, plainText = true|nil}
-- @return boolean 成功返回 true，重复返回 false
function API:AddActivityFilter(keyword)
    if type(keyword) ~= "table" or type(keyword.text) ~= "string" or keyword.text == "" then
        return false
    end

    -- 纯文本匹配时转小写并去首尾空白（与 MeetingHorn 行为一致）
    if keyword.plainText then
        keyword.text = strtrim(keyword.text:lower())
    end

    local filters = self:GetActivityFilters()

    -- 检查重复
    for _, v in ipairs(filters) do
        if v.text == keyword.text and v.plainText == keyword.plainText then
            print("|cffff8800[MeetingHornHeroic]|r 添加失败，关键字\"" .. keyword.text .. "\"已存在。")
            return false
        end
    end

    table.insert(filters, keyword)
    print("|cff00ff00[MeetingHornHeroic]|r 添加成功，关键字\"" .. keyword.text .. "\"已添加。")

    -- 按字典序排序
    table.sort(filters, function(a, b)
        return a.text < b.text
    end)

    return true
end

-- 删除过滤关键字
-- @param keyword table {text = string, plainText = true|nil}
-- @return boolean 成功返回 true，不存在返回 false
function API:RemoveActivityFilter(keyword)
    if type(keyword) ~= "table" then return false end

    local filters = self:GetActivityFilters()
    for i, v in ipairs(filters) do
        if v.text == keyword.text and v.plainText == keyword.plainText then
            table.remove(filters, i)
            print("|cff00ff00[MeetingHornHeroic]|r 删除成功，关键字\"" .. keyword.text .. "\"已删除。")
            return true
        end
    end

    print("|cffff8800[MeetingHornHeroic]|r 删除失败，关键字\"" .. (keyword.text or "") .. "\"不存在。")
    return false
end

-- 检查文本是否命中关键字过滤
-- 当 activityfilter 未启用时始终返回 false
-- @param text string 待检查文本
-- @return boolean 命中返回 true
function API:IsActivityFiltered(text)
    if not ns.Addon or not ns.Addon.db then return false end
    if not ns.Addon.db.profile or not ns.Addon.db.profile.options then return false end
    if not ns.Addon.db.profile.options.activityfilter then return false end
    if not text or text == "" then return false end

    local lowerText = text:lower()
    local filters = self:GetActivityFilters()

    for _, v in ipairs(filters) do
        if v.text and v.text ~= "" then
            -- plainText=true 纯文本匹配；nil 为正则匹配
            local ok, matched = pcall(strfind, lowerText, v.text, 1, v.plainText == true)
            if ok and matched then
                return true
            end
        end
    end

    return false
end

-- ============================================================
-- 频道管理方法
-- ============================================================

-- 加入 MeetingHorn 的聊天频道（通过 LFG 模块的 TouchCategory）
-- 同时停止退出计时器，防止正在倒计时的退出逻辑踢掉频道
-- MeetingHorn 不可用时静默返回
function API:JoinChannel()
    local lfg = self:GetLFG()
    if not lfg then return end
    if lfg.TouchCategory then
        lfg:TouchCategory('Raid')
    end
    if lfg.leaveTimer then
        lfg.leaveTimer:Stop()
    end
end

-- 延迟退出 MeetingHorn 的聊天频道（60 秒后）
-- 检查 MeetingHorn 主界面是否在显示、LFG 是否有活跃活动
-- 如果都没有，才启动退出计时器
-- MeetingHorn 不可用时静默返回
function API:ScheduleLeaveChannel()
    local lfg = self:GetLFG()
    if not lfg then return end
    -- 如果 LFG 有活跃活动（正在组队），不退出
    if lfg.current then return end
    -- 如果 MeetingHorn 主界面正在显示，不退出
    local mainPanel = self:GetMainPanel()
    if mainPanel and mainPanel:IsShown() then return end
    -- 启动 60 秒延迟退出
    if lfg.leaveTimer then
        lfg.leaveTimer:Start(60)
    end
end

-- ============================================================
-- 日志方法
-- ============================================================

-- 插入日志到 MeetingHorn 的 LogStatistics 系统
-- @param log table 日志数据，格式: {time(), "event_name", {key=value, ...}}
-- MeetingHorn 不可用或 LogStatistics 不存在时静默降级
function API:InsertLog(log)
    local addon = self:GetAddon()
    if not addon then return end
    local LogStatistics = addon.LogStatistics
    if LogStatistics and LogStatistics.InsertLog then
        LogStatistics:InsertLog(log)
    end
end

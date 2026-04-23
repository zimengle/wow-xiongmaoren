-- Addon.lua
-- MeetingHornHeroic Main Addon File

---@class MeetingHornHeroicNS
local ns = select(2, ...)

-- 插件基础信息
ns.ADDON_NAME = "MeetingHornHeroic"
local _tocVersion = C_AddOns and C_AddOns.GetAddOnMetadata and C_AddOns.GetAddOnMetadata(ns.ADDON_NAME, "Version")
if _tocVersion then
    -- 本地开发环境下 @project-version@ 未被替换，fallback 到 "dev"
    if _tocVersion:find("^@") then
        _tocVersion = "dev"
    else
        -- 与 MeetingHorn 保持一致：去掉打包工具追加的 -数字 后缀（如 3.1.2-1 → 3.1.2）
        _tocVersion = _tocVersion:gsub('%-%d+', '')
    end
end
ns.VERSION = _tocVersion or "1.0.0"

-- 直接创建插件对象（使用我们自己的Ace3库）
local AceAddon = LibStub("AceAddon-3.0")
ns.Addon = AceAddon:NewAddon(ns.ADDON_NAME, "AceEvent-3.0")

-- 混入 LibClass-2.0，提供 NewClass/GetClass 方法（Timer 等模块依赖）
local LibClass = LibStub('LibClass-2.0')
LibClass:Embed(ns.Addon)

-- 数据库初始化
function ns.Addon:OnInitialize()
    -- 防止 AceAddon 自动调用 + 手动调用导致双重初始化
    if self._initialized then return end
    self._initialized = true

    -- 初始化数据库（尝试使用 AceDB，失败则使用简单表）
    if LibStub then
        local AceDB = LibStub:GetLibrary("AceDB-3.0", true)
        if AceDB then
            self.db = AceDB:New("MeetingHornHeroicDB", {
                profile = {
                    minimap = { hide = false },
                    ui = {
                        scale = 1.0,
                        point = "CENTER",
                        x = 0,
                        y = 0
                    },
                    filters = {
                        showMyServer = true,
                        showCrossServer = true,
                        autoRefresh = true,
                        teamBonusFilter = false,
                        minSubsidyAmount = 0,
                    },
                    favorites = {},
                    cache = {
                        currentActivity = nil,
                        cooldown = { start = 0 },
                    },
                    -- 悬浮框与设置选项
                    options = {
                        floatingFrame = false,
                        activityfilter = true,
                    },
                    floatingFrame = {
                        pos = nil,
                    },
                },
                global = {
                    activity = {
                        filters = {},
                    },
                },
                char = {
                    currentActivity = nil,
                },
            })
        end
    end

    -- 如果 AceDB 不可用，创建简单的配置表
    if not self.db then
        if not MeetingHornHeroicDB then
            MeetingHornHeroicDB = {}
        end

        self.db = {
            profile = MeetingHornHeroicDB.profile or {
                minimap = { hide = false },
                ui = {
                    scale = 1.0,
                    point = "CENTER",
                    x = 0,
                    y = 0
                },
                filters = {
                    showMyServer = true,
                    showCrossServer = true,
                    autoRefresh = true
                },
                favorites = {},
                options = {
                    floatingFrame = false,
                    activityfilter = true,
                },
                floatingFrame = {
                    pos = nil,
                },
            },
            global = MeetingHornHeroicDB.global or {
                activity = {
                    filters = {},
                },
            },
        }

        MeetingHornHeroicDB.profile = self.db.profile
        MeetingHornHeroicDB.global = self.db.global
    end

    -- 初始化模块（安全检查）
    -- 初始化 MeetingHorn API Facade（必须在其他模块之前）
    if ns.MeetingHornAPI then
        ns.MeetingHornAPI:Initialize()
    end

    if ns.ActivityManager and ns.ActivityManager.Initialize then
        ns.ActivityManager:Initialize()
    end

    if ns.PlayerSquareManager and ns.PlayerSquareManager.Initialize then
        ns.PlayerSquareManager:Initialize()
    end

    if ns.ChannelManager and ns.ChannelManager.Initialize then
        ns.ChannelManager:Initialize()
    end

    -- 初始化MeetingHorn集成（自动创建团本招募专区按钮）
    if ns.MeetingHornIntegration then
        ns.MeetingHornIntegration:Initialize()
    end

    -- 初始化悬浮框（任务 3.15）
    if ns.UI.FloatingFrame then
        ns.FloatingFrame = ns.UI.FloatingFrame:New()
    end

    -- 注册聊天命令（手动注册，不依赖AceConsole）
    SLASH_MEETINGHORNHEROIC1 = "/mhh"
    SLASH_MEETINGHORNHEROIC2 = "/meetinghornheroic"
    SlashCmdList["MEETINGHORNHEROIC"] = function(input)
        ns.Addon:HandleChatCommand(input)
    end

    -- 输出加载信息
    print("|cff00ff00[MeetingHornHeroic]|r 集结号团本招募已加载！版本: " .. ns.VERSION)
    print("|cff00ff00[MeetingHornHeroic]|r 使用方法：")
    print("|cff00ff00[MeetingHornHeroic]|r - 点击MeetingHorn主界面上的'团本招募专区'按钮")
    print("|cff00ff00[MeetingHornHeroic]|r - 命令：/mhh 或 /meetinghornheroic")
    print("|cff00ff00[MeetingHornHeroic]|r - 输入 /mhh help 查看全部命令")
end

function ns.Addon:OnEnable()
    print("|cff00ff00[MeetingHornHeroic]|r 集结号团本招募扩展已启用！")
end

-- 聊天命令处理
function ns.Addon:HandleChatCommand(input)
    local args = { strsplit(" ", input or "") }
    local command = strlower(args[1] or "")

    if command == "" then
        -- 打开主界面
        local mainFrame = ns.CreateMainFrame()
        if mainFrame then
            mainFrame:Toggle()
        end
    elseif command == "show" then
        -- 显示界面
        local mainFrame = ns.CreateMainFrame()
        if mainFrame then
            mainFrame:Show()
        end
    elseif command == "hide" then
        -- 隐藏界面
        if ns.MainFrame then
            ns.MainFrame:Hide()
        end
    elseif command == "toggle" then
        -- 切换显示状态
        local mainFrame = ns.CreateMainFrame()
        if mainFrame then
            mainFrame:Toggle()
        end
    elseif command == "create" then
        -- 快速创建
        local raidName = args[2] and strlower(args[2])

        local mainFrame = ns.CreateMainFrame()
        if mainFrame then
            mainFrame:Show()
            mainFrame:SwitchTab(1) -- 创建页面
        end
    elseif command == "list" then
        -- 显示当前活动
        local mainFrame = ns.CreateMainFrame()
        if mainFrame then
            mainFrame:Show()
            mainFrame:SwitchTab(2) -- 浏览页面
        end
    elseif command == "my" or command == "myactivity" then
        -- 显示我的活动
        local mainFrame = ns.CreateMainFrame()
        if mainFrame then
            mainFrame:Show()
            mainFrame:SwitchTab(3) -- 我的活动页面
        end
    elseif command == "help" then
        -- 显示帮助
        print("|cff00ff00[MeetingHornHeroic]|r === MeetingHornHeroic 帮助 ===")
        print("|cff00ff00[MeetingHornHeroic]|r /mhh - 打开/关闭主界面")
        print("|cff00ff00[MeetingHornHeroic]|r /mhh show - 显示界面")
        print("|cff00ff00[MeetingHornHeroic]|r /mhh hide - 隐藏界面")
        print("|cff00ff00[MeetingHornHeroic]|r /mhh create [mc|ssc|tk] - 快速创建团本")
        print("|cff00ff00[MeetingHornHeroic]|r /mhh list - 浏览活动列表")
        print("|cff00ff00[MeetingHornHeroic]|r /mhh my - 显示我的活动")
        print("|cff00ff00[MeetingHornHeroic]|r /mhh channel - 检查频道连接状态")
        print("|cff00ff00[MeetingHornHeroic]|r /mhh help - 显示帮助信息")
    elseif command == "version" or command == "v" then
        -- 显示版本信息
        print("|cff00ff00[MeetingHornHeroic]|r MeetingHornHeroic v" .. ns.VERSION)
        print("|cff00ff00[MeetingHornHeroic]|r 专门支持25人英雄难度：MC、SSC、TK")
    elseif command == "channel" or command == "status" then
        -- 显示频道状态
        if ns.ChannelManager then
            local status = ns.ChannelManager:GetChannelStatus()
            -- 尝试重新连接
            ns.ChannelManager:EnsureChannelJoined()
        else
            print("|cffff0000[MeetingHornHeroic]|r 频道管理器未初始化")
        end
    else
        print("|cffff0000[MeetingHornHeroic]|r 未知命令: " .. (command or ""))
        print("|cffff0000[MeetingHornHeroic]|r 输入 /mhh help 查看可用命令")
    end
end

function ns.Addon:SlashCommand(input)
    self:HandleChatCommand(input)
end

function ns.Addon:OpenMainFrame()
    if ns.MainFrame then
        ns.MainFrame:Show()
    end
end

-- 打印函数
function ns.Addon:Print(...)
    local args = {...}
    local message = ""

    for i, arg in ipairs(args) do
        if i > 1 then
            message = message .. " "
        end
        message = message .. tostring(arg)
    end

    print("|cff00ff00[MeetingHornHeroic]|r " .. message)
end

-- 常量定义
ns.SPEC = {
    -- 职业常量  
    WARRIOR = "WARRIOR",
    PALADIN = "PALADIN", 
    HUNTER = "HUNTER",
    ROGUE = "ROGUE",
    PRIEST = "PRIEST",
    SHAMAN = "SHAMAN",
    MAGE = "MAGE",
    WARLOCK = "WARLOCK",
    DRUID = "DRUID",
    DEATHKNIGHT = "DEATHKNIGHT",
    
    -- 难度常量
    HEROIC_25 = 6,
    NORMAL_25 = 4,
    HEROIC_10 = 5,
    NORMAL_10 = 3,
    
    -- 团本ID常量（WotLK）
    NAXXRAMAS = 3456,
    OBSIDIAN_SANCTUM = 4493,
    EYE_OF_ETERNITY = 4500,
    VAULT_OF_ARCHAVON = 4603,
    -- 团本ID常量（经典/TBC）
    MOLTEN_CORE = 2717,
    SERPENTSHRINE_CAVERN = 3607,
    THE_EYE = 3845
}

-- 全局函数
function ns.GetClassLocale(className)
    local localizedClasses = {
        WARRIOR = "战士",
        PALADIN = "圣骑士",
        HUNTER = "猎人",
        ROGUE = "潜行者",
        PRIEST = "牧师",
        SHAMAN = "萨满祭司",
        MAGE = "法师",
        WARLOCK = "术士",
        DRUID = "德鲁伊",
        DEATHKNIGHT = "死亡骑士"
    }
    return localizedClasses[className] or className
end

function ns.GetRaidName(raidId)
    local raidNames = {
        [ns.SPEC.NAXXRAMAS] = "纳克萨玛斯",
        [ns.SPEC.OBSIDIAN_SANCTUM] = "黑曜石圣殿",
        [ns.SPEC.EYE_OF_ETERNITY] = "永恒之眼",
        [ns.SPEC.VAULT_OF_ARCHAVON] = "阿尔卡冯的宝库",
        [ns.SPEC.MOLTEN_CORE] = "熔火之心",
        [ns.SPEC.SERPENTSHRINE_CAVERN] = "毒蛇神殿", 
        [ns.SPEC.THE_EYE] = "风暴要塞"
    }
    return raidNames[raidId] or "未知团本"
end

-- UI命名空间
ns.UI = {}

ns.L = setmetatable({}, {
    __index = function(t, k)
        if LibStub then
            local L = LibStub('AceLocale-3.0'):GetLocale('MeetingHornHeroic', true)
            if L then return L[k] end
        end
        return k
    end
})

-- 启动插件（延迟到 ADDON_LOADED 事件）
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "MeetingHornHeroic" then
        -- 启动插件
        if ns.Addon and ns.Addon.OnInitialize then
            ns.Addon:OnInitialize()
        end

        if ns.Addon and ns.Addon.OnEnable then
            ns.Addon:OnEnable()
        end

        -- 取消注册事件
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

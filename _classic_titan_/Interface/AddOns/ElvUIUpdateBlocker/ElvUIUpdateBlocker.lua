------------------------------------------------------------
-- ElvUI Update Blocker
-- 专注于拦截 ElvUI 更新弹窗，保持轻量级和安全性
------------------------------------------------------------

local ADDON_NAME = ...
local ElvUIUpdateBlocker = CreateFrame("Frame")
local E -- ElvUI 核心对象引用

-- 默认配置
local defaults = {
    enable = true,       -- 总开关
    blockPopup = true,   -- 屏蔽弹窗
    blockChat = true,    -- 屏蔽聊天提示
}

------------------------------------------------------------
-- 初始化与配置处理
------------------------------------------------------------
function ElvUIUpdateBlocker:OnEvent(event, arg1)
    if event == "ADDON_LOADED" and arg1 == "ElvUI" then
        self:Initialize()
    elseif event == "PLAYER_LOGIN" then
        self:Initialize()
        self:ScheduleCleanup() -- 登录后执行定时清理
        self:UnregisterEvent("PLAYER_LOGIN")
    end
end

function ElvUIUpdateBlocker:Initialize()
    if self.initialized then return end
    
    -- 获取 ElvUI 核心对象
    if not ElvUI then return end
    E = ElvUI[1]
    if not E then return end
    
    self.initialized = true

    -- 初始化数据库
    if not Update_Blocker_DB then Update_Blocker_DB = {} end
    for k, v in pairs(defaults) do
        if Update_Blocker_DB[k] == nil then
            Update_Blocker_DB[k] = v
        end
    end

    -- 核心策略：静默模式
    -- 1. 欺骗 ElvUI 认为已经收到过过期消息，从而不再处理新的版本检查
    --    这就像给 ElvUI 打了疫苗，它会忽略后续所有的 ELVUI_VERSIONCHK 消息
    if Update_Blocker_DB.enable then
        E.recievedOutOfDateMessage = true 
    end

    -- 执行 Hook
    self:HookElvUI()
    self:HookCommunication()
    
    -- 打印加载信息
    print("|cff00ff00[ElvUI Update Blocker]|r 已加载。")
end

------------------------------------------------------------
-- 核心屏蔽逻辑
------------------------------------------------------------
function ElvUIUpdateBlocker:HookElvUI()
    if not E then return end

    -- 1. 针对性篡改弹窗定义 (StaticPopupDialogs)
    -- 注意：不删除 E.PopupDialogs 以避免 ElvUI 报错，而是直接修改 WoW 全局弹窗表
    if StaticPopupDialogs then
        local blockedKeys = {}
        
        -- 辅助函数：判断文本是否包含屏蔽关键词
        local function IsBlockedText(text)
            if not text then return false end
            return text:find("ElvUI") and (text:find("out of date") or text:find("过期") or text:find("version") or text:find("版本"))
        end
        
        -- 1.1 扫描并标记需要屏蔽的 Key
        for key, info in pairs(StaticPopupDialogs) do
            if type(info) == "table" then
                if key == "ELVUI_UPDATE_AVAILABLE" or key == "ELVUI_OUTDATED" then
                    table.insert(blockedKeys, key)
                elseif IsBlockedText(info.text) then
                    table.insert(blockedKeys, key)
                end
            end
        end
        
        -- 1.2 篡改定义
        for _, key in ipairs(blockedKeys) do
            -- 替换为一个“无害”的弹窗定义
            -- 立即隐藏自己，且不显示任何内容
            StaticPopupDialogs[key].OnShow = function(self)
                self:Hide()
            end
            StaticPopupDialogs[key].text = ""
            StaticPopupDialogs[key].button1 = nil
            StaticPopupDialogs[key].button2 = nil
            StaticPopupDialogs[key].timeout = 0
            StaticPopupDialogs[key].whileDead = 0
            
            -- 如果 E.PopupDialogs 里也有，同步修改 text 以防万一 (但不删除 Key)
            if E.PopupDialogs and E.PopupDialogs[key] then
                E.PopupDialogs[key].text = ""
            end
        end
    end

    -- 2. 拦截 E:StaticPopup_Show (ElvUI 内部调用)
    -- 使用 Hook 覆盖 E:StaticPopup_Show
    if E.StaticPopup_Show then
        local original_StaticPopup_Show = E.StaticPopup_Show
        
        E.StaticPopup_Show = function(self, which, text_arg1, text_arg2, data)
            -- 检查是否启用了屏蔽功能
            if Update_Blocker_DB.enable and Update_Blocker_DB.blockPopup then
                -- 检查是否是更新提示弹窗 (Key 匹配)
                if which == "ELVUI_UPDATE_AVAILABLE" or which == "ELVUI_OUTDATED" then
                    return 
                end
                
                -- 检查弹窗内容 (模糊匹配)
                local info = E.PopupDialogs and E.PopupDialogs[which]
                local text = info and info.text
                
                if text then
                    if text:find("ElvUI") and (text:find("out of date") or text:find("过期") or text:find("version") or text:find("版本")) then
                        return
                    end
                end
                
                -- 检查 text_arg1 (有时候内容是动态传入的)
                if text_arg1 and type(text_arg1) == "string" then
                     if text_arg1:find("ElvUI") and (text_arg1:find("out of date") or text_arg1:find("过期")) then
                        return
                     end
                end
            end
            
            -- 如果不是要屏蔽的弹窗，或者是其他弹窗，调用原函数
            if original_StaticPopup_Show then
                return original_StaticPopup_Show(self, which, text_arg1, text_arg2, data)
            end
        end
    end
    
    -- 3. 拦截全局 StaticPopup_Show (防止绕过 E 调用的情况)
    -- 使用 hooksecurefunc 并在显示后立即隐藏
    hooksecurefunc("StaticPopup_Show", function(which, text_arg1, text_arg2, data)
        if not (Update_Blocker_DB.enable and Update_Blocker_DB.blockPopup) then return end
        
        local info = StaticPopupDialogs[which]
        if not info then return end
        
        local text = info.text
        local shouldHide = false
        
        -- 检查 Key
        if which == "ELVUI_UPDATE_AVAILABLE" or which == "ELVUI_OUTDATED" or which == "TEST" then
            shouldHide = true
        end
        
        -- 检查文本内容
        if not shouldHide and text then
            if text:find("ElvUI") and (text:find("out of date") or text:find("过期") or text:find("version") or text:find("版本")) then
                shouldHide = true
            end
        end
        
        if shouldHide then
            StaticPopup_Hide(which)
        end
    end)

    -- 4. 拦截聊天信息
    -- ElvUI 通常使用 E:Print 打印版本过期信息
    if E.Print then
        local original_Print = E.Print
        
        E.Print = function(self, msg, ...)
            if Update_Blocker_DB.enable and Update_Blocker_DB.blockChat and type(msg) == "string" then
                -- 定义需要屏蔽的关键词
                if msg:find("ElvUI is out of date") or 
                   msg:find("ElvUI 已过期") or 
                   msg:find("New ElvUI version available") or
                   msg:find("检测到新版本 ElvUI") or
                   msg:find("Your ElvUI version is out of date") or
                   msg:find("Download the latest version") or
                   msg:find("tukui.org") then
                    return -- 拦截消息
                end
            end
            
            if original_Print then
                original_Print(self, msg, ...)
            end
        end
    end
end

------------------------------------------------------------
-- 新增：拦截 ElvUI 通信与广播
------------------------------------------------------------
function ElvUIUpdateBlocker:HookCommunication()
    if not E then return end
    
    -- 1. 禁用 E:SendMessage
    -- ElvUI 使用此函数向 RAID/PARTY/GUILD 广播版本信息
    -- 我们将其替换为空函数，阻止插件向外发送版本检查请求
    if E.SendMessage then
        E.SendMessage = function() end
    end
    
    -- 2. 确保静默模式标记始终为 true
    -- 某些情况下 ElvUI 可能会重置此标记，我们需要确保它保持为 true
    if not self.securityTicker then
        self.securityTicker = C_Timer.NewTicker(5, function()
            if Update_Blocker_DB.enable and E and not E.recievedOutOfDateMessage then
                E.recievedOutOfDateMessage = true
            end
        end)
    end
end

------------------------------------------------------------
-- 新增：定时清理漏网之鱼 (暴力巡查)
------------------------------------------------------------
function ElvUIUpdateBlocker:ScheduleCleanup()
    -- 使用 Ticker 进行持续巡查，确保任何漏网之鱼都会被处理
    -- 间隔设置为 1 秒，对性能影响极小
    if not self.cleanupTicker then
        self.cleanupTicker = C_Timer.NewTicker(1, function()
            if not (Update_Blocker_DB.enable and Update_Blocker_DB.blockPopup) then return end
            
            -- 遍历所有可能的静态弹窗
            for i = 1, 4 do
                local frame = _G["StaticPopup"..i]
                if frame and frame:IsVisible() then
                    -- 检查文本内容
                    local textLabel = _G["StaticPopup"..i.."Text"]
                    if textLabel then
                        local text = textLabel:GetText()
                        if text and text:find("ElvUI") and (text:find("out of date") or text:find("过期") or text:find("version") or text:find("版本")) then
                            frame:Hide()
                        end
                    end
                    
                    -- 检查 which 字段 (如果存在)
                    if frame.which == "ELVUI_UPDATE_AVAILABLE" or frame.which == "ELVUI_OUTDATED" or frame.which == "TEST" then
                        frame:Hide()
                    end
                end
            end
        end)
    end
end

------------------------------------------------------------
-- Slash 命令处理
------------------------------------------------------------
SLASH_EUB1 = "/eub"
SLASH_EUB2 = "/elvuiupdateblocker"
SlashCmdList["EUB"] = function(msg)
    local cmd = msg:lower()
    
    if cmd == "on" then
        Update_Blocker_DB.enable = true
        E.recievedOutOfDateMessage = true -- 立即生效
        print("|cff00ff00[ElvUI Update Blocker]|r 屏蔽功能已启用。")
    elseif cmd == "off" then
        Update_Blocker_DB.enable = false
        print("|cffff0000[ElvUI Update Blocker]|r 屏蔽功能已禁用。需要重载界面生效。")
    elseif cmd == "status" then
        print("|cff00ff00[ElvUI Update Blocker]|r 当前状态:")
        print("  总开关: " .. (Update_Blocker_DB.enable and "|cff00ff00开启|r" or "|cffff0000关闭|r"))
        print("  屏蔽弹窗: " .. (Update_Blocker_DB.blockPopup and "|cff00ff00开启|r" or "|cffff0000关闭|r"))
        print("  静默模式: " .. (E.recievedOutOfDateMessage and "|cff00ff00已激活 (E.recievedOutOfDateMessage=true)|r" or "|cffff0000未激活|r"))
    elseif cmd == "test" then
        print("|cff00ff00[ElvUI Update Blocker]|r 开始测试弹窗拦截...")
        
        StaticPopupDialogs["EUB_TEST_POPUP"] = {
            text = "这是一个测试弹窗：ElvUI 已过期，请更新。",
            button1 = "确定",
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
        
        local frame = StaticPopup_Show("EUB_TEST_POPUP")
        
        if frame then
            C_Timer.After(0.1, function()
                if frame:IsVisible() then
                    print("|cffff0000[ElvUI Update Blocker] 测试失败：弹窗仍然可见。|r")
                else
                    print("|cff00ff00[ElvUI Update Blocker] 测试通过：弹窗已被拦截/隐藏。|r")
                end
            end)
        else
            print("|cff00ff00[ElvUI Update Blocker] 测试通过：无法创建弹窗（已被直接拦截）。|r")
        end
    else
        print("|cff00ff00[ElvUI Update Blocker]|r 命令列表:")
        print("  /eub on     - 启用屏蔽")
        print("  /eub off    - 禁用屏蔽")
        print("  /eub status - 查看状态")
        print("  /eub test   - 测试弹窗拦截")
    end
end

------------------------------------------------------------
-- 事件注册
------------------------------------------------------------
ElvUIUpdateBlocker:RegisterEvent("PLAYER_LOGIN")
ElvUIUpdateBlocker:RegisterEvent("ADDON_LOADED")
ElvUIUpdateBlocker:SetScript("OnEvent", ElvUIUpdateBlocker.OnEvent)

------------------------------------------------------------
-- 立即执行：如果 ElvUI 已加载（得益于 Dependencies）
-- 这样可以在 ElvUI 任何事件处理之前就激活免疫模式
------------------------------------------------------------
if IsAddOnLoaded("ElvUI") then
    ElvUIUpdateBlocker:Initialize()
end

---@type ns
local ns = select(2, ...)
local L = ns.L

local Chat = ns.Addon:NewClass('UI.Chat', 'Frame')

function Chat:Constructor()
    self.ChatFrame:SetFading(false)
    self.ChatFrame:SetMaxLines(2048)
    self.ChatFrame:SetFontObject(ChatFontNormal)
    self.ChatFrame:SetIndentedWordWrap(true)
    self.ChatFrame:SetJustifyH('LEFT')
    self.ChatFrame:SetHyperlinksEnabled(true)
    self.ChatFrame:SetID(1)

    self.TitleLabel:SetText(L['Chat Record'])

    local AddMessage = self.ChatFrame.AddMessage
    self.ChatFrame.AddMessage = function(self, msg, ...)
        AddMessage(self, msg:gsub(':WHISPER:', ':UNKNOWN:'), ...)

        local numMessages = self:GetNumMessages()
        self.scrollBar:SetMinMaxValues(1, numMessages)
        self.scrollBar:SetValue(numMessages - self:GetScrollOffset())
    end

    self.ChatFrame:SetScript('OnHyperlinkClick', function(_, ...)
        self:OnHyperlinkClick(...)
    end)

    -- self.EditBox:Show()

    self:RegisterMessage('MEETINGHORN_CURRENT_CREATED')
    self:RegisterMessage('MEETINGHORN_CURRENT_CLOSED')
end

function Chat:MEETINGHORN_CURRENT_CREATED()
    self:RegisterEvent('CHAT_MSG_WHISPER', 'OnEvent')
    self:RegisterEvent('CHAT_MSG_WHISPER_INFORM', 'OnEvent')
end

function Chat:MEETINGHORN_CURRENT_CLOSED()
    self.ChatFrame:Clear()
    self:UnregisterAllEvents()
end

function Chat:OnEvent(event, text, senderName, _, _, _, _, _, _, _, _, guid)
    -- 使用 WoW 内置颜色和格式字符串
    -- 注意：中文客户端格式串用位置参数 %1$s/%2$s，必须用 WoW 全局 format()，不能用 str:format()
    local chatType = (event == "CHAT_MSG_WHISPER") and "WHISPER" or "WHISPER_INFORM"
    local info = ChatTypeInfo and ChatTypeInfo[chatType]
    local r = info and info.r or 1
    local g = info and info.g or 0.5
    local b = info and info.b or 1

    local fullName = senderName or UNKNOWN
    -- 去掉区服名："Korey-时光II理想国" → "Korey"
    local displayName = fullName:match("^([^%-]+)") or fullName
    -- 构建可点击超链接，右键可弹出官方玩家菜单（交互/邀请/悄悄话等）
    local nameLink = "|Hplayer:" .. fullName .. "|h" .. displayName .. "|h"

    local content = text or ""
    local msg
    if event == "CHAT_MSG_WHISPER" then
        msg = nameLink .. "悄悄地说：" .. content
    elseif event == "CHAT_MSG_WHISPER_INFORM" then
        msg = "发送给" .. nameLink .. "：" .. content
    else
        msg = content
    end

    self.ChatFrame:AddMessage(msg, r, g, b)
end

function Chat:OnHyperlinkClick(link, text, button)
    SetItemRef(link, text, button, self.ChatFrame)
end

local _, ns = ...

local Definition = ns.ChatBarDefinition
local Adapter = ns.ChatBarAdapter
if type(Definition) ~= "table" or type(Adapter) ~= "table" then return end

local Copy = {}

local function Accessible(value)
    if type(_G.issecretvalue) == "function" and _G.issecretvalue(value) then return false end
    if type(_G.canaccessvalue) == "function" and not _G.canaccessvalue(value) then return false end
    return true
end

function Copy.PlainText(text)
    if not Accessible(text) or type(text) ~= "string" then return nil end
    -- Do not expose protected name placeholders in the clipboard text.
    text = text:gsub("|K.-|k", "")
    text = text:gsub("|H.-|h(.-)|h", "%1")
    text = text:gsub("|T.-|t", ""):gsub("|A.-|a", "")
    -- Keep both hex/named color starts and their |r resets for the native EditBox.
    -- Removing resets alone makes named item/currency colors bleed into later lines.
    return (text:gsub("|n", "\n"):gsub("||", "|"))
end

local function ColorByte(value)
    if not Accessible(value) or type(value) ~= "number" or value ~= value then return 255 end
    return math.floor(math.max(0, math.min(1, value)) * 255 + 0.5)
end

-- Resolve nested message colors before passing them to the native EditBox.
-- Emit independent runs: at most one active color, including across messages.
local function FlattenColors(text, base)
    local stack, runs = {base}, {}
    local position, plainStart = 1, 1
    local function Emit(last)
        if last >= plainStart then
            runs[#runs + 1] = stack[#stack] .. text:sub(plainStart, last) .. "|r"
        end
    end
    while position <= #text do
        local pipe = text:find("|", position, true)
        if not pipe then break end
        local marker = text:sub(pipe, pipe + 1)
        local color = text:match("^(|c%x%x%x%x%x%x%x%x)", pipe) or text:match("^(|cn[%w_]+:)", pipe)
        if marker == "||" then
            position = pipe + 2
        elseif color or marker == "|r" then
            Emit(pipe - 1)
            if color then stack[#stack + 1] = color
            elseif #stack > 1 then stack[#stack] = nil end
            position = pipe + (color and #color or 2)
            plainStart = position
        else
            position = pipe + 1
        end
    end
    Emit(#text)
    return table.concat(runs)
end

function Copy.Read(frame)
    if not frame or type(frame.GetNumMessages) ~= "function"
        or type(frame.GetMessageInfo) ~= "function" then return "", 0 end
    local ok, count = pcall(frame.GetNumMessages, frame)
    if not ok or not Accessible(count) or type(count) ~= "number" then return "", 0 end
    local lines, skipped = {}, 0
    for index = 1, count do
        local read, text, r, g, b = pcall(frame.GetMessageInfo, frame, index)
        local clean, line = false, nil
        if read then clean, line = pcall(Copy.PlainText, text) end
        if clean and line and line ~= "" then
            local base = string.format("|cff%02x%02x%02x", ColorByte(r), ColorByte(g), ColorByte(b))
            lines[#lines + 1] = FlattenColors(line, base)
        elseif not clean or not read or line == nil then
            skipped = skipped + 1
        end
    end
    return table.concat(lines, "\n"), skipped
end

local function DrawIcon(button)
    local texture = button:CreateTexture(nil, "ARTWORK")
    texture:SetTexture("Interface\\AddOns\\RurutiaSuite\\Media\\Textures\\chat-copy-rounded.tga")
    texture:SetAllPoints(button)
end

function Definition:ShowChatCopy()
    local profile = self:GetProfile()
    if not (self.runtimeActive and profile and profile.enabled and profile.copyChatEnabled) then return false end
    if not self.copyDialog then
        self.copyDialog = ns.UI:CreateNativeCopyDialog(self, {name="RurutiaChatCopyDialog",parent=Adapter:GetParent(),title="复制聊天"})
    end
    local text, skipped = Copy.Read(Adapter:GetChatFrame())
    local description = "选中内容后按 Ctrl+C 复制，按 Esc 关闭。"
    if text == "" then description = "当前聊天窗口暂无可复制内容。"
    elseif skipped > 0 then description = description .. " 部分受限消息无法复制。" end
    self.copyDialog:Show(text, description)
    return true
end

function Definition:UpdateChatCopy()
    local profile = self:GetProfile()
    if not (self.runtimeActive and profile and profile.enabled and profile.copyChatEnabled) then
        self:HideChatCopy()
        return false
    end
    local anchor = Adapter:GetChatAnchorFrame()
    if not anchor or anchor == Adapter:GetParent() then self:HideChatCopy(); return false end
    local button = self.copyButton
    if not button then
        button = self:CreateFrame("Button", "RurutiaChatCopyButton", Adapter:GetParent())
        button:SetSize(20, 20)
        button:SetFrameStrata("MEDIUM")
        button:RegisterForClicks("LeftButtonUp")
        DrawIcon(button)
        button:SetScript("OnEnter", function(owner) owner.copyHovered = true; owner:SetAlpha(1) end)
        button:SetScript("OnLeave", function(owner) owner.copyHovered = false; owner:SetAlpha(0.3) end)
        button:SetScript("OnClick", function() self:ShowChatCopy() end)
        button:SetScript("OnHide", function(owner) owner.copyHovered = false; owner:SetAlpha(0.3) end)
        self.copyButton = button
    end
    self:OwnFrame(button, nil, "ChatBar copy button")
    button:ClearAllPoints()
    button:SetPoint("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", -7, 7)
    button:SetAlpha(button.copyHovered and 1 or 0.3)
    button:Show()
    return true
end

function Definition:HideChatCopy()
    if self.copyButton then
        self.copyButton:Hide()
        self:ReleaseFrame(self.copyButton)
    end
    if self.copyDialog then
        self.copyDialog:Hide()
    end
end

function Definition:SetChatCopyEnabled(enabled)
    local profile = self:GetProfile()
    if not profile then return false end
    profile.copyChatEnabled = enabled == true
    self:UpdateChatCopy()
    return true
end

ns.ChatBarCopy = Copy

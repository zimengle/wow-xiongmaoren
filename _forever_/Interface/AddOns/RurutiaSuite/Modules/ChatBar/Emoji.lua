local _, ns = ...

local Definition = ns.ChatBarDefinition
local Data = ns.ChatBarData
local Adapter = ns.ChatBarAdapter
if type(Definition) ~= "table" or type(Data) ~= "table" or type(Adapter) ~= "table" then return end

local Emoji = {}

local function EscapePattern(text)
    return string.gsub(text, "([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1")
end

function Emoji.Filter(_, _, message, ...)
    if not message or not string.find(message, "{", 1, true) then return false, message, ... end
    local size = math.max(math.floor(Adapter:GetChatFontSize()), Data.emojiMessageIconSize)
    local index
    for index = Data.customEmoteStartIndex, #Data.emotes do
        local emote = Data.emotes[index]
        if string.find(message, emote.text, 1, true) then
            local icon = string.format("|T%s:%d|t", emote.texture, size)
            message = string.gsub(message, EscapePattern(emote.text), icon)
        end
    end
    return false, message, ...
end

function Definition:InsertEmoji(emote)
    if not emote or not emote.text then return false end
    local editBox = Adapter:GetEditBox()
    if not editBox then return false end
    if type(editBox.IsShown) == "function" and not editBox:IsShown() then
        Adapter:ActivateEditBox(editBox)
    end
    return Adapter:InsertText(editBox, emote.text)
end

function Definition:AcquireEmojiOwnership()
    if not self.emojiFrame then return end
    self:OwnFrame(self.emojiFrame, nil, "ChatBar emoji menu")
    local index
    for index = 1, #(self.emojiIcons or {}) do
        self:OwnFrame(self.emojiIcons[index], nil, "ChatBar emoji icon")
    end
end

function Definition:EnsureEmojiMenu()
    if self.emojiFrame then self:AcquireEmojiOwnership(); return self.emojiFrame end
    local layout = Data.layout
    local frame = self:CreateFrame("Frame", "RSChatBarEmojiMenu", Adapter:GetParent(), "BackdropTemplate")
    frame:SetFrameStrata("DIALOG")
    if type(frame.SetBackdrop) == "function" then
        frame:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            tile = true,
            tileSize = 16,
            edgeSize = 0,
            insets = { left = 0, right = 0, top = 0, bottom = 0 },
        })
        frame:SetBackdropColor(0, 0, 0, 0.72)
        frame:SetBackdropBorderColor(0, 0, 0, 0)
    end
    self.emojiFrame = frame
    self.emojiIcons = {}
    local index
    for index = 1, #Data.emotes do
        local emote = Data.emotes[index]
        local icon = self:CreateFrame("Button", nil, frame)
        icon:SetSize(layout.emojiIconSize, layout.emojiIconSize)
        local column = (index - 1) % layout.emojiColumns
        local row = math.floor((index - 1) / layout.emojiColumns)
        icon:SetPoint(
            "TOPLEFT", frame, "TOPLEFT",
            layout.emojiPadding + column * (layout.emojiIconSize + layout.emojiGap),
            -layout.emojiPadding - row * (layout.emojiIconSize + layout.emojiGap)
        )
        icon.texture = icon:CreateTexture(nil, "ARTWORK")
        icon.texture:SetTexture(emote.texture)
        icon.texture:SetAllPoints(icon)
        icon.emote = emote
        icon:SetScript("OnEnter", function(owner) Adapter:ShowTooltip(owner, owner.emote.text) end)
        icon:SetScript("OnLeave", function() Adapter:HideTooltip() end)
        icon:SetScript("OnClick", function(owner)
            self:InsertEmoji(owner.emote)
            frame:Hide()
        end)
        self.emojiIcons[index] = icon
    end
    local rows = math.ceil(#Data.emotes / layout.emojiColumns)
    frame:SetSize(
        layout.emojiIconSize * layout.emojiColumns
            + layout.emojiGap * (layout.emojiColumns - 1) + layout.emojiPadding * 2,
        layout.emojiIconSize * rows + layout.emojiGap * (rows - 1) + layout.emojiPadding * 2
    )
    return frame
end

function Definition:ToggleEmojiMenu(anchor)
    if self.emojiFrame and self.emojiFrame:IsShown() then self.emojiFrame:Hide(); return false end
    local frame = self:EnsureEmojiMenu()
    frame:ClearAllPoints()
    if anchor then frame:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", -6, 7)
    else frame:SetPoint("CENTER", Adapter:GetParent(), "CENTER", 0, 0) end
    frame:Show()
    return true
end

function Definition:HideEmojiMenu()
    if self.emojiFrame then self.emojiFrame:Hide(); return true end
    return false
end

function Definition:ReleaseEmojiOwnership()
    local index
    for index = 1, #(self.emojiIcons or {}) do self:ReleaseFrame(self.emojiIcons[index]) end
    if self.emojiFrame then self:ReleaseFrame(self.emojiFrame) end
end

ns.ChatBarEmoji = Emoji

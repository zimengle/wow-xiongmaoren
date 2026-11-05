local _, ns = ...

local View = {}
View.__index = View

local function Call(object, method, ...)
    local callback = object and object[method]
    if type(callback) == "function" then return callback(object, ...) end
end

local function CreateText(button, text)
    local font = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    font:SetPoint("CENTER", button, "CENTER", 0, 0)
    font:SetText(text)
    button.Text = font
    return font
end

function View.New(module, data, adapter)
    return setmetatable({
        module = module,
        data = data,
        adapter = adapter,
        definitions = module:GetButtonDefinitions(),
        buttons = {},
        buttonList = {},
    }, View)
end

function View:_OwnBar()
    if not self.frame then return end
    self.module:OwnFrame(self.frame, nil, "ChatBar frame")
    local index
    for index = 1, #self.buttonList do
        self.module:OwnFrame(self.buttonList[index], nil, "ChatBar button")
    end
    if self.overlay then self.module:OwnFrame(self.overlay, nil, "ChatBar move overlay") end
end

function View:_ConfigureButton(button, info)
    button:RegisterForClicks("AnyUp")
    button:SetScript("OnClick", function(_, mouseButton)
        self.module:HandleButtonClick(info, mouseButton)
    end)
    button:SetScript("OnEnter", function(owner)
        -- Never scale layout buttons on hover: scaling shifts their visual
        -- bounds and makes the anchored popup/neighbor buttons jitter.
        Call(owner, "SetAlpha", 0.82)
        if info.key == "preset" then self.module:ShowPopupMenu(owner) end
        if self.module:HasButtonTooltip(info.key) then
            self.module:ShowButtonTooltip(owner, info.key)
        end
    end)
    button:SetScript("OnLeave", function(owner)
        Call(owner, "SetAlpha", 1)
        if info.key == "preset" then self.module:ScheduleHidePopup() end
        if self.module:HasButtonTooltip(info.key) then self.module:HideButtonTooltip() end
    end)
end

function View:EnsureBar()
    if self.frame then
        self:_OwnBar()
        return self.frame
    end
    local profile = self.module:GetProfile()
    local parent = self.adapter:GetParent()
    local frame = self.module:CreateFrame("Frame", "RurutiaChatBar", parent, "BackdropTemplate")
    frame:SetMovable(true)
    frame:SetClampedToScreen(not self.adapter:IsOffscreenDragEnabled())
    if type(frame.SetBackdrop) == "function" then frame:SetBackdrop(nil) end
    if type(frame.SetBackdropColor) == "function" then frame:SetBackdropColor(0, 0, 0, 0) end
    if type(frame.SetBackdropBorderColor) == "function" then frame:SetBackdropBorderColor(0, 0, 0, 0) end
    frame:SetFrameStrata(profile.frameStrata or "LOW")
    frame:SetFrameLevel(tonumber(profile.frameLevel) or 5)
    self.frame = frame

    local index
    for index = 1, #self.definitions do
        local info = self.definitions[index]
        local button = self.module:CreateFrame("Button", nil, frame)
        CreateText(button, info.text)
        self:_ConfigureButton(button, info)
        if type(button.SetBackdropColor) == "function" then button:SetBackdropColor(0, 0, 0, 0) end
        if type(button.SetBackdropBorderColor) == "function" then button:SetBackdropBorderColor(0, 0, 0, 0) end
        self.buttons[info.key] = button
        self.buttonList[index] = button
    end
    return frame
end

function View:RefreshClamp()
    if not self.frame then return false end
    self.frame:SetClampedToScreen(not self.adapter:IsOffscreenDragEnabled())
    return true
end

function View:UpdateLayout(profile)
    if not self.frame then return false end
    local safe = self.module.GetSafeNumber
    local width = safe(profile.buttonWidth, 24)
    local height = safe(profile.buttonHeight, 18)
    local spacing = safe(profile.spacing, -2)
    local padX = safe(profile.paddingX, 6)
    local padY = safe(profile.paddingY, 3)
    local fontSize = safe(profile.fontSize, 18)
    local visibleCount = 0
    local extraSpacing = 0
    local index
    for index = 1, #self.definitions do
        if self.module:IsButtonShown(self.definitions[index]) then
            visibleCount = visibleCount + 1
            extraSpacing = extraSpacing + safe(self.definitions[index].extraSpacingBefore, 0)
        end
    end
    local frameWidth = padX * 2
    if visibleCount > 0 then
        frameWidth = frameWidth + visibleCount * width + (visibleCount - 1) * spacing + extraSpacing
    end
    self.frame:SetSize(frameWidth, padY * 2 + height)
    self.frame:SetFrameStrata(profile.frameStrata or "LOW")
    self.frame:SetFrameLevel(tonumber(profile.frameLevel) or 5)

    local previous
    local classR, classG, classB = self.adapter:GetClassColor()
    local fontPath = self.adapter:GetFontPath()
    for index = 1, #self.definitions do
        local info = self.definitions[index]
        local button = self.buttons[info.key]
        button:ClearAllPoints()
        button:SetSize(width, height)
        if self.module:IsButtonShown(info) then
            if previous then
                button:SetPoint("LEFT", previous, "RIGHT", spacing + safe(info.extraSpacingBefore, 0), 0)
            else button:SetPoint("LEFT", self.frame, "LEFT", padX, 0) end
            previous = button
            local color = self.data.colors[info.key]
            if info.key == "preset" or info.key == "macro" then
                button.Text:SetTextColor(classR, classG, classB, 1)
            elseif color then
                button.Text:SetTextColor(color[1], color[2], color[3], 1)
            end
            self.adapter:ApplyFont(button.Text, fontPath, fontSize, "OUTLINE")
            button:Show()
        else
            button:Hide()
        end
    end
    self:UpdateVisibility(profile, self.module.isUnlocked)
    return true
end

function View:UpdateVisibility(profile, unlocked)
    if not self.frame then return false end
    local anyVisible = false
    local index
    for index = 1, #self.definitions do
        if self.module:IsButtonShown(self.definitions[index]) then anyVisible = true; break end
    end
    local shown = anyVisible and (unlocked == true or (profile.enabled and true or false))
    self.frame:SetShown(shown)
    return shown
end

function View:ApplyPositionLocked(profile)
    if not self.frame then return false end
    local parent = self.adapter:GetParent()
    local anchor = self.adapter:GetChatAnchorFrame()
    local x = self.module.GetSafeNumber(profile.offsetX, 0)
    local y = self.module.GetSafeNumber(profile.offsetY, 28)
    self.frame:ClearAllPoints()
    if anchor == parent then self.frame:SetPoint("BOTTOM", parent, "BOTTOM", x, 120 + y)
    else self.frame:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", x, y) end
    return true
end

function View:ApplyPositionUnlocked()
    if not self.frame then return false end
    local left = self.frame:GetLeft()
    local bottom = self.frame:GetBottom()
    local parent = self.adapter:GetParent()
    self.frame:ClearAllPoints()
    if left and bottom then self.frame:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", left, bottom)
    else self.frame:SetPoint("CENTER", parent, "CENTER", 0, 0) end
    return true
end

function View:CommitPosition(profile)
    if not self.frame then return false end
    local anchor = self.adapter:GetChatAnchorFrame()
    if anchor == self.adapter:GetParent() then return false end
    local barLeft = self.frame:GetLeft()
    local barBottom = self.frame:GetBottom()
    local anchorLeft = anchor and anchor:GetLeft()
    local anchorTop = anchor and anchor:GetTop()
    if not (barLeft and barBottom and anchorLeft and anchorTop) then return false end
    profile.offsetX = barLeft - anchorLeft
    profile.offsetY = barBottom - anchorTop
    self:ApplyPositionLocked(profile)
    return true
end

function View:EnsureOverlay()
    local target = self:EnsureBar()
    local service = ns.MoveOverlay
    if type(service) ~= "table" then return nil end
    if self.overlay then self.module:OwnFrame(self.overlay, nil, "ChatBar move overlay") end
    if not self.nudgeConfig then
        local owner = self
        self.nudgeConfig = {
            label = "聊天条",
            getPosition = function()
                local _, _, _, x, y = target:GetPoint(1)
                return tonumber(x) or 0, tonumber(y) or 0
            end,
            setPosition = function(x, y)
                local point, relativeTo, relativePoint = target:GetPoint(1)
                target:ClearAllPoints()
                target:SetPoint(point or "CENTER", relativeTo or owner.adapter:GetParent(),
                    relativePoint or point or "CENTER", tonumber(x) or 0, tonumber(y) or 0)
            end,
            savePosition = function() return owner.module:CommitPositionToChatFrame() end,
            onSettings = function() return owner.module:OpenSettings() end,
            onLock = function()
                if type(ns.SetRsMoveMode) == "function" then return ns:SetRsMoveMode(false) end
                return owner.module:SetUnlocked(false)
            end,
        }
    end
    local overlay = service:Ensure(target, {
        label = "聊天条",
        createFrame = function(parent)
            return self.module:CreateFrame("Button", nil, parent, "BackdropTemplate", nil, "ChatBar move overlay")
        end,
        canInteract = function() return not self.adapter:IsInCombat() end,
        onDragStop = function() self.module:CommitPositionToChatFrame() end,
        onSettings = function() return self.module:OpenSettings() end,
        nudgeConfig = self.nudgeConfig,
    })
    self.overlay = overlay
    return overlay
end

function View:SetUnlocked(unlocked)
    if unlocked then
        self:EnsureBar():Show()
        local overlay = self:EnsureOverlay()
        if overlay then overlay:Show() end
    elseif self.overlay then
        self.overlay:Hide()
    end
end

function View:IsShown()
    return self.frame and self.frame:IsShown() or false
end

function View:HideAll()
    if self.overlay then self.overlay:Hide() end
    if self.frame then self.frame:Hide() end
    if self.module.HidePopupMenu then self.module:HidePopupMenu() end
    if self.module.HideEmojiMenu then self.module:HideEmojiMenu() end
end

function View:ReleaseOwnership()
    if self.overlay then self.module:ReleaseFrame(self.overlay) end
    local index
    for index = 1, #self.buttonList do self.module:ReleaseFrame(self.buttonList[index]) end
    if self.frame then self.module:ReleaseFrame(self.frame) end
    if self.module.ReleasePopupOwnership then self.module:ReleasePopupOwnership() end
    if self.module.ReleaseEmojiOwnership then self.module:ReleaseEmojiOwnership() end
end

function View:GetSnapshot()
    local shown = {}
    local index
    for index = 1, #self.definitions do
        local info = self.definitions[index]
        local button = self.buttons[info.key]
        if button and button:IsShown() then shown[#shown + 1] = info.key end
    end
    return {
        shown = self:IsShown(),
        buttonKeys = shown,
        frame = self.frame,
        overlay = self.overlay,
    }
end

ns.ChatBarView = View

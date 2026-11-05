local _, ns = ...

local Definition = ns.ChatBarDefinition
local Data = ns.ChatBarData
local Adapter = ns.ChatBarAdapter
local PixelBorder = ns.UI and ns.UI.PixelBorder
if type(Definition) ~= "table" or type(Data) ~= "table" or type(Adapter) ~= "table"
    or type(PixelBorder) ~= "table" then return end

local function SetHover(button, shown)
    if button.hoverTexture then button.hoverTexture:SetShown(shown) end
    PixelBorder:Update(button.hoverBorder, button.hoverBorderColor, shown)
    if button.label then
        if shown then button.label:SetTextColor(button.classR, button.classG, button.classB, 1)
        else button.label:SetTextColor(1, 1, 1, 1) end
    end
end

function Definition:CancelPopupHide()
    self:CancelRefresh("chat-bar-popup-hide")
end

function Definition:OnPopupHideDue()
    if self.popupFrame then self.popupFrame:Hide() end
end

function Definition:ScheduleHidePopup()
    self:RequestRefresh("chat-bar-popup-hide", self.OnPopupHideDue, 0.25)
    return true
end

function Definition:AcquirePopupOwnership()
    if not self.popupFrame then return end
    self:OwnFrame(self.popupFrame, nil, "ChatBar popup menu")
    local index
    for index = 1, #(self.popupButtons or {}) do
        self:OwnFrame(self.popupButtons[index], nil, "ChatBar popup item")
    end
end

function Definition:EnsurePopupFrame()
    if self.popupFrame then self:AcquirePopupOwnership(); return self.popupFrame end
    local frame = self:CreateFrame("Frame", "RSChatBarPopupMenu", Adapter:GetParent(), "BackdropTemplate")
    frame:SetFrameStrata("DIALOG")
    if type(frame.SetBackdrop) == "function" then
        frame:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8" })
        frame:SetBackdropColor(0, 0, 0, 0.6)
    end
    frame:SetScript("OnEnter", function() self:CancelPopupHide() end)
    frame:SetScript("OnLeave", function() self:ScheduleHidePopup() end)
    self.popupFrame = frame
    self.popupButtons = {}
    return frame
end

function Definition:EnsurePopupButton(index)
    local button = self.popupButtons[index]
    if button then self:OwnFrame(button, nil, "ChatBar popup item"); return button end
    local layout = Data.layout
    button = self:CreateFrame("Button", nil, self.popupFrame)
    button:SetSize(layout.popupButtonWidth, layout.popupButtonHeight)
    local hover = button:CreateTexture(nil, "BACKGROUND")
    hover:SetPoint("TOPLEFT", button, "TOPLEFT", -layout.popupPadLeft, 0)
    hover:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", layout.popupPadRight, 0)
    hover:Hide()
    button.hoverTexture = hover

    button.hoverBorder = PixelBorder:Ensure(button, hover, "BORDER")

    local label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", button, "LEFT", 0, 0)
    label:SetTextColor(1, 1, 1, 1)
    button.label = label
    button:SetScript("OnEnter", function(owner)
        self:CancelPopupHide()
        SetHover(owner, true)
    end)
    button:SetScript("OnLeave", function(owner)
        SetHover(owner, false)
        self:ScheduleHidePopup()
    end)
    button:SetScript("OnClick", function(owner)
        self.popupFrame:Hide()
        local item = owner.item
        if item and type(item.open) == "function" then item.open() end
    end)
    self.popupButtons[index] = button
    return button
end

function Definition:ShowPopupMenu(anchor)
    if not anchor then return false end
    self:CancelPopupHide()
    local items = Adapter:GetPopupItems()
    if #items == 0 then return false end
    local layout = Data.layout
    local frame = self:EnsurePopupFrame()
    local r, g, b = Adapter:GetClassColor()
    frame:SetSize(
        layout.popupButtonWidth + layout.popupPadLeft + layout.popupPadRight,
        layout.popupButtonHeight * #items + layout.popupPadTop + layout.popupPadBottom
    )
    frame:ClearAllPoints()
    frame:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", -8, 7)
    local index
    for index = 1, #items do
        local button = self:EnsurePopupButton(index)
        button.item = items[index]
        button.classR, button.classG, button.classB = r, g, b
        button:ClearAllPoints()
        button:SetPoint(
            "BOTTOMLEFT", frame, "BOTTOMLEFT", layout.popupPadLeft,
            layout.popupPadBottom + (index - 1) * layout.popupButtonHeight
        )
        button.hoverTexture:SetColorTexture(r, g, b, 0.2)
        button.hoverBorderColor = button.hoverBorderColor or {}
        button.hoverBorderColor[1], button.hoverBorderColor[2] = r, g
        button.hoverBorderColor[3], button.hoverBorderColor[4] = b, 1
        SetHover(button, false)
        Adapter:ApplyFont(button.label, Adapter:GetFontPath(), 19, "OUTLINE")
        button.label:SetText(items[index].label or "")
        button:Show()
    end
    for index = #items + 1, #(self.popupButtons or {}) do self.popupButtons[index]:Hide() end
    frame:Show()
    return true
end

function Definition:HidePopupMenu()
    self:CancelPopupHide()
    if self.popupFrame then self.popupFrame:Hide(); return true end
    return false
end

function Definition:ReleasePopupOwnership()
    local index
    for index = 1, #(self.popupButtons or {}) do self:ReleaseFrame(self.popupButtons[index]) end
    if self.popupFrame then self:ReleaseFrame(self.popupFrame) end
end

ns.ChatBarPopupMenu = true

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("MagePortal")) then return end

local View = {}
View.__index = View
local PixelBorder = ns.UI and ns.UI.PixelBorder

local textCache = setmetatable({}, { __mode = "k" })
local fontCache = setmetatable({}, { __mode = "k" })

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) == "function" then return callback(target, ...) end
    return nil
end

local function HideFrame(frame)
    Call(frame, "Hide")
end

local function SetText(region, value)
    if not region or textCache[region] == value then return end
    Call(region, "SetText", value)
    textCache[region] = value
end

local function SetFont(region, path, size, flags)
    if not region then return end
    local signature = tostring(path) .. ":" .. tostring(size) .. ":" .. tostring(flags)
    if fontCache[region] == signature then return end
    Call(region, "SetFont", path, size, flags)
    fontCache[region] = signature
end

function View:New(module, adapter)
    return setmetatable({
        module = module,
        adapter = adapter,
        bar = nil,
        buttons = {},
        ownedFrames = {},
        activeCount = 0,
        expanded = false,
        unlocked = false,
        ownershipActive = false,
        secureClicksReady = false,
        unavailableReason = nil,
        builds = 0,
        refreshes = 0,
    }, self)
end

function View:TrackFrame(frame)
    self.ownedFrames[#self.ownedFrames + 1] = frame
    self.ownershipActive = true
    return frame
end

function View:AcquireOwnership()
    if self.ownershipActive then return true end
    local index
    for index = 1, #self.ownedFrames do
        self.module:OwnFrame(self.ownedFrames[index], HideFrame, "MagePortal retained frame")
    end
    self.ownershipActive = true
    return true
end

function View:Ensure(profile)
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return nil, "combat lockdown"
    end
    if self.bar then
        self:AcquireOwnership()
        return self.bar
    end
    if not self.adapter:IsSecureClickRegistrationAvailable() then
        self.unavailableReason = "secure click registration unavailable"
        self.secureClicksReady = false
        return nil, self.unavailableReason
    end
    local layout = self.adapter.layout
    local root = self.adapter:GetRootFrame()
    local bar = self:TrackFrame(self.module:CreateFrame(
        "Frame",
        "RurutiaMageBar",
        root,
        "SecureHandlerStateTemplate",
        HideFrame,
        "MagePortal bar"
    ))
    Call(bar, "SetMovable", true)
    Call(bar, "SetClampedToScreen", true)
    Call(bar, "SetFrameStrata", layout.frameStrata)
    Call(bar, "SetFrameLevel", layout.frameLevel)
    Call(bar, "SetScript", "OnEnter", function() self.module:ExpandFlyout() end)
    Call(bar, "SetScript", "OnLeave", function() self.module:CollapseFlyout() end)
    self.bar = bar

    local index
    for index = 1, layout.maxButtons do
        local button = self:TrackFrame(self.module:CreateFrame(
            "Button",
            "RurutiaMageBarBtn" .. index,
            bar,
            "SecureActionButtonTemplate, BackdropTemplate",
            HideFrame,
            "MagePortal button " .. index
        ))
        if not self.adapter:RegisterSecureClicks(button) then
            self.unavailableReason = "secure click registration failed"
            self.secureClicksReady = false
            self:Hide()
            self:ReleaseOwnership()
            return nil, self.unavailableReason
        end
        Call(button, "SetBackdrop", { bgFile = "Interface\\Buttons\\WHITE8X8" })
        Call(button, "SetBackdropColor", 0, 0, 0, 0.8)
        button.icon = Call(button, "CreateTexture", nil, "ARTWORK")
        Call(button.icon, "SetAllPoints")
        Call(button.icon, "SetTexCoord", 0.08, 0.92, 0.08, 0.92)

        local border = self:TrackFrame(self.module:CreateFrame(
            "Frame", nil, button, "BackdropTemplate", HideFrame, "MagePortal border " .. index
        ))
        Call(border, "SetAllPoints", button)
        Call(border, "SetFrameLevel", (Call(button, "GetFrameLevel") or 1) + 2)
        if PixelBorder then
            border.pixelBorder = PixelBorder:Ensure(border, border, "OVERLAY", 7)
            PixelBorder:Update(border.pixelBorder, { 0, 0, 0, 1 }, true)
        end
        button.borderFrame = border

        local pushed = Call(button, "CreateTexture", nil, "OVERLAY")
        Call(pushed, "SetAllPoints")
        Call(pushed, "SetColorTexture", 0, 0, 0, 0.3)
        Call(button, "SetPushedTexture", pushed)
        local highlight = Call(button, "CreateTexture", nil, "HIGHLIGHT")
        Call(highlight, "SetAllPoints")
        Call(highlight, "SetColorTexture", 1, 1, 1, 0.15)
        Call(button, "SetHighlightTexture", highlight)

        button.textTop = Call(button, "CreateFontString", nil, "OVERLAY")
        Call(button.textTop, "SetPoint", "TOP", 1, -3)
        Call(button.textTop, "SetTextColor", 1, 1, 1)
        button.textBottom = Call(button, "CreateFontString", nil, "OVERLAY")
        Call(button.textBottom, "SetPoint", "CENTER", 1, -9)
        Call(button.textBottom, "SetTextColor", 1, 1, 1)
        local fontPath = self.adapter:GetFontPath()
        SetFont(button.textTop, fontPath, layout.topFontSize, "OUTLINE")
        SetFont(button.textBottom, fontPath, layout.bottomFontSize, "OUTLINE")
        Call(button, "SetScript", "OnEnter", function(frame)
            self.module:ExpandFlyout()
            self:ShowTooltip(frame)
        end)
        Call(button, "SetScript", "OnLeave", function()
            self:HideTooltip()
            self.module:CollapseFlyout()
        end)
        self.buttons[index] = button
    end
    self.secureClicksReady = true
    self.unavailableReason = nil
    self.builds = self.builds + 1
    self:ApplyPosition(profile)
    return bar
end

function View:ApplyPosition(profile)
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return false
    end
    if not self.bar then return false end
    local position = profile.position
    local point = position and position[1] or self.adapter.layout.anchor
    local relativePoint = position and position[3] or point
    local x = position and tonumber(position[4]) or self.adapter.layout.x
    local y = position and tonumber(position[5]) or self.adapter.layout.y
    Call(self.bar, "ClearAllPoints")
    Call(self.bar, "SetPoint", point, self.adapter:GetRootFrame(), relativePoint, x, y)
    return true
end

function View:ShowTooltip(button)
    local info = button and button.customInfo
    local tooltip = self.adapter:GetTooltip()
    if not info or not tooltip then return false end
    Call(tooltip, "SetOwner", button, "ANCHOR_RIGHT")
    local showCount = not self.adapter:IsReagentFree()
    local leftCount = showCount and (" (" .. self.adapter:GetItemCount(info.itemPortal) .. ")") or ""
    local rightCount = showCount and (" (" .. self.adapter:GetItemCount(info.itemTeleport) .. ")") or ""
    Call(tooltip, "SetText",
        "|cffffffff左：|r|cff00ff00" .. info.spellLeft .. leftCount .. "|r\n"
        .. "|cffffffff右：|r|cff00ff00" .. info.spellRight .. rightCount .. "|r")
    if info.isKnown == false and not self.module.previewEnabled then
        Call(tooltip, "AddLine", " ")
        Call(tooltip, "AddLine", "|cffff0000(未学会)|r")
    end
    Call(tooltip, "Show")
    return true
end

function View:HideTooltip()
    Call(self.adapter:GetTooltip(), "Hide")
end

function View:Refresh(spells, profile, preview, unlocked)
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return false
    end
    if not self:Ensure(profile) or not self.secureClicksReady then return false end
    local layout = self.adapter.layout
    local size = tonumber(profile.buttonSize) or layout.buttonSize
    local padding = tonumber(profile.padding) or layout.padding
    local direction = profile.direction or layout.direction
    if direction == "VERTICAL" then direction = "DOWN" end
    if direction == "HORIZONTAL" then direction = "RIGHT" end
    local count = math.min(#spells, tonumber(profile.maxButtons) or layout.maxButtons)
    self.activeCount = count
    self.unlocked = unlocked and true or false
    local collapsed = not self.unlocked and not self.adapter:IsMouseOver(self.bar)
    local fontPath = self.adapter:GetFontPath()
    local index
    for index = 1, #self.buttons do
        local button = self.buttons[index]
        local info = index <= count and spells[index] or nil
        button.customInfo = nil
        SetFont(button.textTop, fontPath, layout.topFontSize, "OUTLINE")
        SetFont(button.textBottom, fontPath, layout.bottomFontSize, "OUTLINE")
        SetText(button.textTop, "")
        SetText(button.textBottom, "")
        Call(button, "SetAttribute", "type1", nil)
        Call(button, "SetAttribute", "spell1", nil)
        Call(button, "SetAttribute", "type2", nil)
        Call(button, "SetAttribute", "spell2", nil)
        if info then
            button.customInfo = info
            Call(button, "SetSize", size, size)
            Call(button, "ClearAllPoints")
            if index == 1 then
                Call(button, "SetPoint", "CENTER", self.bar, "CENTER", 0, 0)
            else
                local previous = self.buttons[index - 1]
                if direction == "DOWN" then Call(button, "SetPoint", "TOP", previous, "BOTTOM", 0, -padding)
                elseif direction == "UP" then Call(button, "SetPoint", "BOTTOM", previous, "TOP", 0, padding)
                elseif direction == "RIGHT" then Call(button, "SetPoint", "LEFT", previous, "RIGHT", padding, 0)
                else Call(button, "SetPoint", "RIGHT", previous, "LEFT", -padding, 0) end
            end
            Call(button.icon, "SetTexture", info.icon or self.adapter.fallbackIcon)
            Call(button.icon, "SetDesaturated", false)
            Call(button.icon, "SetVertexColor", 1, 1, 1)
            if not self.adapter:IsReagentFree() and index == 1 then
                SetText(button.textTop, tostring(self.adapter:GetItemCount(info.itemPortal)))
            end
            SetText(button.textBottom, info.overlayText or "")
            Call(button, "SetAttribute", "type1", "spell")
            Call(button, "SetAttribute", "spell1", info.spellLeft)
            Call(button, "SetAttribute", "type2", "spell")
            Call(button, "SetAttribute", "spell2", info.spellRight)
            if collapsed and index > 1 then HideFrame(button) else Call(button, "Show") end
        else
            HideFrame(button)
        end
    end
    Call(self.bar, "SetSize", size, size)
    Call(self.bar, "Show")
    self.expanded = not collapsed
    self:UpdateOverlay(profile, direction, size, padding)
    self.refreshes = self.refreshes + 1
    return count
end

function View:UpdateReagentCount()
    if not self.buttons[1] then return false end
    local index
    for index = 2, self.activeCount do SetText(self.buttons[index].textTop, "") end
    local info = self.buttons[1].customInfo
    if self.adapter:IsReagentFree() or not info then
        SetText(self.buttons[1].textTop, "")
    else
        SetText(self.buttons[1].textTop, tostring(self.adapter:GetItemCount(info.itemPortal)))
    end
    return true
end

function View:ApplyFonts()
    local path, layout = self.adapter:GetFontPath(), self.adapter.layout
    for _, button in ipairs(self.buttons) do
        SetFont(button.textTop, path, layout.topFontSize, "OUTLINE")
        SetFont(button.textBottom, path, layout.bottomFontSize, "OUTLINE")
    end
    return true
end

function View:Expand()
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return false
    end
    if not self.bar or self.unlocked or self.activeCount <= 1 then return false end
    local index
    for index = 2, self.activeCount do Call(self.buttons[index], "Show") end
    self.expanded = true
    return true
end

function View:Collapse()
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return false
    end
    if not self.bar or self.unlocked or self.activeCount <= 1
        or self.adapter:IsMouseOver(self.bar) then return false end
    local index
    for index = 2, self.activeCount do HideFrame(self.buttons[index]) end
    local size = tonumber(self.module.db.profile.buttonSize) or self.adapter.layout.buttonSize
    Call(self.bar, "SetSize", size, size)
    self.expanded = false
    return true
end

function View:EnsureOverlay(profile)
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return nil
    end
    if not self:Ensure(profile) or type(ns.MoveOverlay) ~= "table" then return nil end
    self:AcquireOwnership()
    local overlay = ns.MoveOverlay:Ensure(self.bar, {
        label = "法师动作条",
        createFrame = function(parent)
            return self:TrackFrame(self.module:CreateFrame(
                "Button", nil, parent, "BackdropTemplate", HideFrame, "MagePortal move overlay"))
        end,
        layout = function(owner) self:LayoutOverlay(owner) end,
        canInteract = function() return not self.adapter:IsInCombat() end,
        onDragStop = function() self.module:SaveCurrentPosition() end,
        onSettings = function() return self.module:OpenSettings() end,
        nudgeConfig = function() return self.module:GetMoveNudgeConfig() end,
        frameLevelOffset = 50,
    })
    self.dragOverlay = overlay
    return overlay
end

function View:LayoutOverlay(overlay)
    local profile = self.module:GetProfile()
    local direction = profile.direction
    local size, padding = profile.buttonSize, profile.padding
    local count = math.max(self.activeCount, 1)
    local extension = count * size + (count - 1) * padding - size
    Call(overlay, "ClearAllPoints")
    if direction == "DOWN" then
        Call(overlay, "SetPoint", "TOPLEFT", self.bar, "TOPLEFT", -5, 5)
        Call(overlay, "SetPoint", "BOTTOMRIGHT", self.bar, "BOTTOMRIGHT", 5, -extension - 5)
    elseif direction == "UP" then
        Call(overlay, "SetPoint", "BOTTOMLEFT", self.bar, "BOTTOMLEFT", -5, -5)
        Call(overlay, "SetPoint", "TOPRIGHT", self.bar, "TOPRIGHT", 5, extension + 5)
    elseif direction == "RIGHT" then
        Call(overlay, "SetPoint", "TOPLEFT", self.bar, "TOPLEFT", -5, 5)
        Call(overlay, "SetPoint", "BOTTOMRIGHT", self.bar, "BOTTOMRIGHT", extension + 5, -5)
    else
        Call(overlay, "SetPoint", "TOPRIGHT", self.bar, "TOPRIGHT", 5, 5)
        Call(overlay, "SetPoint", "BOTTOMLEFT", self.bar, "BOTTOMLEFT", -extension - 5, -5)
    end
end

function View:UpdateOverlay()
    local overlay = self.dragOverlay
    if not overlay then return false end
    if not self.unlocked then HideFrame(overlay) return false end
    if not ns.MoveOverlay:Refresh(overlay.__rsMoveOverlayRecord) then return false end
    Call(overlay, "Show")
    return true
end

function View:SetUnlocked(unlocked, profile)
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return false
    end
    self.unlocked = unlocked and true or false
    if self.unlocked then
        local overlay = self:EnsureOverlay(profile)
        if not overlay then return false end
        Call(overlay, "Show")
    elseif self.dragOverlay then
        HideFrame(self.dragOverlay)
    end
    return true
end

function View:Hide()
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return false
    end
    self:HideTooltip()
    local index
    for index = 1, #self.buttons do
        local button = self.buttons[index]
        button.customInfo = nil
        SetText(button.textTop, "")
        SetText(button.textBottom, "")
        Call(button, "SetAttribute", "type1", nil)
        Call(button, "SetAttribute", "spell1", nil)
        Call(button, "SetAttribute", "type2", nil)
        Call(button, "SetAttribute", "spell2", nil)
    end
    for index = 1, #self.ownedFrames do HideFrame(self.ownedFrames[index]) end
    self.activeCount = 0
    self.unlocked = false
    self.expanded = false
end

function View:ReleaseOwnership()
    if not self.ownershipActive then return false end
    local index
    for index = 1, #self.ownedFrames do
        self.module:ReleaseFrame(self.ownedFrames[index])
    end
    self.ownershipActive = false
    return true
end

function View:GetDiagnostics()
    return {
        created = self.bar ~= nil,
        builds = self.builds,
        refreshes = self.refreshes,
        activeCount = self.activeCount,
        expanded = self.expanded,
        unlocked = self.unlocked,
        ownershipActive = self.ownershipActive,
        secureClicksReady = self.secureClicksReady,
        unavailableReason = self.unavailableReason,
        ownedFrames = #self.ownedFrames,
    }
end

ns.MagePortalViewClass = View

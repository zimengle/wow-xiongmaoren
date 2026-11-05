local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("RaidMarker")) then return end

local View = {}
View.__index = View

local COLOR_WHITE = "|cffffffff"
local COLOR_FALLBACK = "|cFFFFD700"
local COLOR_RESET = "|r"

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return nil end
    local ok, a, b, c, d, e = pcall(callback, target, ...)
    if not ok then return nil end
    return a, b, c, d, e
end

local function HideFrame(frame)
    Call(frame, "Hide")
end

local function White(text)
    return COLOR_WHITE .. text .. COLOR_RESET
end

local function Theme(text)
    local color = COLOR_FALLBACK
    if type(ns.GetThemeColorCode) == "function" then
        color = ns:GetThemeColorCode(false)
    end
    return color .. text .. COLOR_RESET
end

local function TipLine(label, text)
    return White(label) .. Theme(text)
end

local function Colorize(hex, text)
    return "|cFF" .. (hex or "FFFFFF") .. text .. COLOR_RESET
end

local function IconTag(path, size)
    return string.format("|T%s:%d|t", path, size or 16)
end

local function ComputeGroupWidth(count, width, gap)
    if count <= 0 then return 0 end
    return count * width + (count - 1) * gap
end

local function GetSideButtonX(profile, markerWidth, buttonWidth, side, order)
    local margin = tonumber(profile.sideButtonXOffset) or 0
    local gap = tonumber(profile.sideButtonGap) or 0
    order = tonumber(order) or 1
    if side == "LEFT" then
        return -markerWidth / 2 - margin - buttonWidth / 2
            - (order - 1) * (buttonWidth + gap)
    end
    return markerWidth / 2 + margin + buttonWidth / 2
        + (order - 1) * (buttonWidth + gap)
end

local function ResolveThemeColor(key, fallback)
    local system = ns.UISystem or (ns.UI and ns.UI.GetSystem and ns.UI:GetSystem())
    local theme = system and system.theme
    local color = theme and theme.Get and theme:Get(key)
    if type(color) == "table" then return color end
    return fallback
end

function View:New(module, adapter, data)
    return setmetatable({
        module = module,
        adapter = adapter,
        data = data,
        bar = nil,
        markerRecords = {},
        sideRecords = {},
        ownedFrames = {},
        ownershipActive = false,
        secureClicksReady = false,
        unavailableReason = nil,
        moveOverlay = nil,
        unlocked = false,
        builds = 0,
        refreshes = 0,
        visualRefreshes = 0,
        fontSignature = nil,
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
        self.module:OwnFrame(self.ownedFrames[index], HideFrame, "RaidMarker retained frame")
    end
    self.ownershipActive = true
    return true
end

function View:CreateMarkerRecord(index)
    local layout = self.data.barLayout
    local button = self:TrackFrame(self.module:CreateFrame(
        "Button", "RSRMBtn" .. index, self.bar, "SecureActionButtonTemplate",
        HideFrame, "RaidMarker marker " .. index
    ))
    Call(button, "SetFrameLevel", (Call(self.bar, "GetFrameLevel") or layout.frameLevel) + 1)
    Call(button, "EnableMouse", true)
    local record = {
        frame = button,
        icon = Call(button, "CreateTexture", nil, "ARTWORK"),
        marker = nil,
        tooltip = "",
        clicksReady = false,
    }
    Call(record.icon, "SetAllPoints")
    Call(button, "SetScript", "OnMouseDown", function()
        Call(button, "SetAlpha", 0.5)
        Call(record.icon, "SetScale", 1)
    end)
    Call(button, "SetScript", "OnMouseUp", function()
        self.module:UpdateVisuals()
        Call(record.icon, "SetScale", Call(button, "IsMouseOver") and 1.2 or 1)
    end)
    Call(button, "SetScript", "OnEnter", function()
        Call(record.icon, "SetScale", 1.2)
        self:ShowTooltip(button, record.tooltip)
    end)
    Call(button, "SetScript", "OnLeave", function()
        Call(record.icon, "SetScale", 1)
        self:HideTooltip()
    end)
    self.markerRecords[index] = record
    self.module.markerButtons = self.module.markerButtons or {}
    self.module.markerButtons[index] = button
    return record
end

function View:CreateSideRecord(info)
    local layout = self.data.barLayout
    local button = self:TrackFrame(self.module:CreateFrame(
        "Button", "RSRM" .. info.key, self.bar, "SecureActionButtonTemplate",
        HideFrame, "RaidMarker side " .. info.key
    ))
    Call(button, "SetFrameLevel", (Call(self.bar, "GetFrameLevel") or layout.frameLevel) + 1)
    Call(button, "EnableMouse", true)
    local record = {
        frame = button,
        text = Call(button, "CreateFontString", nil, "OVERLAY"),
        info = info,
        tooltip = "",
        clicksReady = false,
    }
    Call(record.text, "SetPoint", "CENTER")
    Call(record.text, "SetTextColor", 1, 1, 1, 0.6)
    Call(button, "SetScript", "OnMouseDown", function() Call(button, "SetAlpha", 0.5) end)
    Call(button, "SetScript", "OnMouseUp", function() self.module:UpdateVisuals() end)
    Call(button, "SetScript", "OnEnter", function() self:ShowTooltip(button, record.tooltip) end)
    Call(button, "SetScript", "OnLeave", function() self:HideTooltip() end)
    self.sideRecords[info.key] = record
    self.module[info.key .. "Button"] = button
    return record
end

function View:ConfigureMarkerClicks()
    local index
    for index = 1, #self.markerRecords do
        local record = self.markerRecords[index]
        if not record.clicksReady and not self.adapter:RegisterSecureClicks(record.frame) then
            self.secureClicksReady = false
            self.unavailableReason = "secure click registration failed"
            return false
        end
        record.clicksReady = true
    end
    self.secureClicksReady = true
    self.unavailableReason = nil
    return true
end

function View:Ensure()
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return nil, "combat lockdown"
    end
    if self.bar then
        self:AcquireOwnership()
        if not self.secureClicksReady and not self:ConfigureMarkerClicks() then
            return nil, self.unavailableReason
        end
        return self.bar
    end

    local root = self.adapter:GetRootFrame()
    if not root then
        self.unavailableReason = "root frame unavailable"
        return nil, self.unavailableReason
    end
    local layout = self.data.barLayout
    local bar = self:TrackFrame(self.module:CreateFrame(
        "Frame", "RSRaidMarkerBar", root, nil, HideFrame, "RaidMarker bar"
    ))
    Call(bar, "SetFrameStrata", layout.frameStrata)
    Call(bar, "SetFrameLevel", layout.frameLevel)
    Call(bar, "SetMovable", true)
    Call(bar, "EnableMouse", false)
    Call(bar, "SetClampedToScreen", self.adapter:ShouldClampToScreen())
    self.bar = bar
    self.module.bar = bar

    local index
    for index = 1, #self.data.markers do self:CreateMarkerRecord(index) end
    if not self:ConfigureMarkerClicks() then
        self:Hide()
        return nil, self.unavailableReason
    end
    self.builds = self.builds + 1
    return bar
end

function View:ShowTooltip(owner, text)
    local tooltip = self.adapter:GetTooltip()
    if not tooltip then return false end
    Call(tooltip, "SetOwner", owner, "ANCHOR_BOTTOM")
    Call(tooltip, "SetText", text or "")
    Call(tooltip, "Show")
    return true
end

function View:HideTooltip()
    Call(self.adapter:GetTooltip(), "Hide")
end

function View:BuildMarkerTooltip(marker)
    local tag = IconTag(marker.icon, 16)
    if not self.adapter:HasWorldMarkers() then
        return White("标记：") .. tag
    end
    return White("左：") .. tag
        .. White(" Shift：") .. Colorize(marker.textColor, "清标")
        .. "\n" .. White("右：") .. Colorize(marker.textColor, "光柱")
        .. White(" 中：") .. Colorize(marker.textColor, "清光柱")
end

function View:BuildSideTooltip(info, profile)
    if info.key == "pull" then
        local text = TipLine("左：", "倒数（" .. (profile.pullCountdown or 10) .. "秒）")
            .. "\n" .. TipLine("右：", "取消倒数")
        if self.adapter:GetPolicy().supportsMiddleSettings then
            text = text .. "\n" .. TipLine("中：", "设置倒数时间")
        end
        return text
    end
    if info.key == "reset" then return Theme("重置副本并通告") end
    if info.key == "ready" then
        return TipLine("左：", "就位确认") .. "\n" .. TipLine("右：", "职责确认")
    end
    if self.adapter:IsTargetOnlyClear() then return TipLine("左：", "清除目标标记") end
    local text = TipLine("左：", "清空标记")
    if self.adapter:HasWorldMarkers() then text = text .. "\n" .. TipLine("右：", "清空光柱") end
    return text
end

function View:GetSideButtonSize(profile)
    local layout = self.data.barLayout
    local size = tonumber(profile.sideButtonFontSize) or layout.sideButtonFontSize
    -- Keep existing geometry at the default size; reserve room for larger labels.
    local growth = math.max(0, size - layout.sideButtonFontSize)
    return layout.sideButtonWidth + growth * 3, layout.sideButtonHeight + growth
end

function View:GetLayoutMetrics(profile)
    local sideWidth, sideHeight = self:GetSideButtonSize(profile)
    local size = tonumber(profile.markerSize) or 22
    local spacing = tonumber(profile.spacing) or 2
    local markerWidth = #self.data.markers * size + (#self.data.markers - 1) * spacing
    local sideEnabled = profile.sideButtonsEnabled ~= false
    local reserve = sideEnabled or self.adapter:GetPolicy().reserveSideSpaceWhenDisabled
    local leftCount, rightCount = 0, 0
    if reserve then
        local index
        for index = 1, #self.data.sideButtons do
            if self.data.sideButtons[index].side == "LEFT" then
                leftCount = leftCount + 1
            else
                rightCount = rightCount + 1
            end
        end
    end
    local gap = tonumber(profile.sideButtonGap) or 0
    local margin = reserve and (tonumber(profile.sideButtonXOffset) or 0) or 0
    local totalWidth = markerWidth + margin * 2
        + ComputeGroupWidth(leftCount, sideWidth, gap)
        + ComputeGroupWidth(rightCount, sideWidth, gap)
    local totalHeight = math.max(size, reserve and sideHeight or 0)
    return size, markerWidth, totalWidth, totalHeight
end

function View:UpdateFont()
    local path = self.adapter:GetFontPath()
    local profile = self.module:GetProfile()
    local size = tonumber(profile.sideButtonFontSize) or self.data.barLayout.sideButtonFontSize
    local signature = tostring(path) .. ":" .. tostring(size) .. ":OUTLINE"
    if self.fontSignature == signature then return false end
    local fontService = ns.Font
    local fallback = _G.STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"
    local allApplied = true
    local _, record
    for _, record in pairs(self.sideRecords) do
        local applied
        if fontService and type(fontService.ApplyFontString) == "function" then
            applied = fontService:ApplyFontString(record.text, path, size, "OUTLINE", fallback)
        else
            local setter = record.text and record.text.SetFont
            if type(setter) == "function" then
                local ok, result = pcall(setter, record.text, path or fallback, size, "OUTLINE")
                applied = ok and result ~= false
            else
                applied = false
            end
        end
        if not applied then
            Call(record.text, "SetFont", fallback, size, "OUTLINE")
            allApplied = false
        end
    end
    self.fontSignature = allApplied and signature or nil
    return allApplied
end

function View:UpdateLayout(profile)
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return false
    end
    if not self:Ensure() then return false end

    local size, markerWidth, totalWidth, totalHeight = self:GetLayoutMetrics(profile)
    local spacing = size + (tonumber(profile.spacing) or 2)
    local startX = -markerWidth / 2 + size / 2
    Call(self.bar, "SetSize", totalWidth, totalHeight)

    local index
    for index = 1, #self.data.markers do
        local marker = self.adapter:GetMarker(self.data.markers, index, profile)
        local record = self.markerRecords[index]
        record.marker = marker
        record.tooltip = self:BuildMarkerTooltip(marker)
        Call(record.frame, "SetSize", size, size)
        Call(record.frame, "ClearAllPoints")
        Call(record.frame, "SetPoint", "CENTER", self.bar, "CENTER", startX + (index - 1) * spacing, 0)
        Call(record.icon, "SetTexture", marker.icon)
        if not self.adapter:ApplyMarkerAttributes(record.frame, marker) then
            self.secureClicksReady = false
            self.unavailableReason = "secure marker attributes unavailable"
            self:Hide()
            return false
        end
        Call(record.frame, "Show")
    end

    local sideEnabled = profile.sideButtonsEnabled ~= false
    if sideEnabled then
        for index = 1, #self.data.sideButtons do
            local info = self.data.sideButtons[index]
            if not self.sideRecords[info.key] then self:CreateSideRecord(info) end
        end
        -- 真实客户端的空 FontString 必须先设定字体，才能写入文字。
        self.fontSignature = nil
        self:UpdateFont()
    end
    for index = 1, #self.data.sideButtons do
        local info = self.data.sideButtons[index]
        local record = self.sideRecords[info.key]
        if sideEnabled then
            if not record.clicksReady and not self.adapter:RegisterSecureClicks(record.frame) then
                self.secureClicksReady = false
                self.unavailableReason = "secure side click registration failed"
                self:Hide()
                return false
            end
            record.clicksReady = true
            record.tooltip = self:BuildSideTooltip(info, profile)
            local sideWidth, sideHeight = self:GetSideButtonSize(profile)
            Call(record.frame, "SetSize", sideWidth, sideHeight)
            Call(record.frame, "ClearAllPoints")
            Call(record.frame, "SetPoint", "CENTER", self.bar, "CENTER",
                GetSideButtonX(profile, markerWidth, sideWidth,
                    info.side, info.order), 0)
            Call(record.text, "SetText", info.text)
            if not self.adapter:ApplySideButtonAttributes(record.frame, info, profile) then
                self.secureClicksReady = false
                self.unavailableReason = "secure side attributes unavailable"
                self:Hide()
                return false
            end
            Call(record.frame, "Show")
        elseif record then
            Call(record.frame, "Hide")
        end
    end

    self.secureClicksReady = true
    self.unavailableReason = nil
    self:UpdateVisuals(profile)
    self:UpdateMoveOverlay()
    self.refreshes = self.refreshes + 1
    return true
end

function View:ApplyPosition(profile)
    if self.adapter:IsInCombat() or not self.bar then return false end
    local defaults = self.data.position
    local position = profile.position or defaults
    local point = position.point or defaults.point
    local relativePoint = position.relativePoint or point
    Call(self.bar, "SetUserPlaced", false)
    Call(self.bar, "StopMovingOrSizing")
    Call(self.bar, "ClearAllPoints")
    Call(self.bar, "SetPoint", point, self.adapter:GetRootFrame(), relativePoint,
        tonumber(position.x) or defaults.x, tonumber(position.y) or defaults.y)
    return true
end

function View:RefreshClamp()
    if not self.bar then return false end
    Call(self.bar, "SetClampedToScreen", self.adapter:ShouldClampToScreen())
    return true
end

function View:UpdateVisuals(profile)
    if not self.bar or self.unlocked then return false end
    local hasTarget = self.adapter:HasTarget()
    local markerAlpha = hasTarget and (profile.alphaWithTarget or 1) or (profile.alphaNoTarget or 0.3)
    local sideAlpha = profile.alphaWithTarget or 1
    local index
    for index = 1, #self.markerRecords do
        local record = self.markerRecords[index]
        Call(record.frame, "SetAlpha", markerAlpha)
        Call(record.icon, "SetDesaturated", not hasTarget)
    end
    local _, record
    for _, record in pairs(self.sideRecords) do Call(record.frame, "SetAlpha", sideAlpha) end
    self.visualRefreshes = self.visualRefreshes + 1
    return true
end

function View:SyncSecureClicks()
    if self.adapter:IsInCombat() then return false end
    local index
    for index = 1, #self.markerRecords do
        if not self.adapter:SyncSecureClick(self.markerRecords[index].frame) then return false end
    end
    local _, record
    for _, record in pairs(self.sideRecords) do
        if not self.adapter:SyncSecureClick(record.frame) then return false end
    end
    return true
end

function View:EnsureMoveOverlay(profile)
    if self.adapter:IsInCombat() or not self:Ensure() then return nil end
    if self.moveOverlay then
        self:AcquireOwnership()
    end
    local service = ns.MoveOverlay
    if type(service) ~= "table" then return nil end
    local inset = self.data.barLayout.moveOverlayInset
    local overlay = service:Ensure(self.bar, {
        label = "标记栏",
        createFrame = function(parent)
            return self:TrackFrame(self.module:CreateFrame(
                "Button", nil, parent, "BackdropTemplate", HideFrame, "RaidMarker move overlay"
            ))
        end,
        layout = function(owner)
            Call(owner, "ClearAllPoints")
            Call(owner, "SetPoint", "TOPLEFT", self.bar, "TOPLEFT", -inset, inset)
            Call(owner, "SetPoint", "BOTTOMRIGHT", self.bar, "BOTTOMRIGHT", inset, -inset)
        end,
        canInteract = function() return not self.adapter:IsInCombat() end,
        onDragStop = function() self.module:SavePosition() end,
        onSettings = function() return self.module:OpenSettings() end,
        nudgeConfig = function() return self.module.movement:GetNudgeConfig() end,
        frameLevelOffset = self.data.barLayout.moveOverlayFrameOffset,
    })
    self.moveOverlay = overlay
    self.module.dragOverlay = overlay
    self:RefreshTheme()
    self:UpdateMoveOverlay()
    return overlay
end

function View:RefreshTheme()
    if not self.moveOverlay then return false end
    local record = self.moveOverlay.__rsMoveOverlayRecord
    return ns.MoveOverlay and ns.MoveOverlay:Refresh(record) or false
end

function View:UpdateMoveOverlay()
    local overlay = self.moveOverlay
    if not overlay then return false end
    if not self.unlocked then Call(overlay, "Hide") return false end
    if ns.MoveOverlay then ns.MoveOverlay:Refresh(overlay.__rsMoveOverlayRecord) end
    Call(overlay, "Show")
    return true
end

function View:SetUnlocked(unlocked, profile)
    if self.adapter:IsInCombat() then return false end
    self.unlocked = unlocked and true or false
    if self.unlocked then
        if not self:EnsureMoveOverlay(profile) then return false end
        Call(self.bar, "SetAlpha", 1)
        Call(self.bar, "Show")
        self:UpdateMoveOverlay()
    else
        Call(self.moveOverlay, "Hide")
        self:UpdateVisuals(profile)
    end
    return true
end

function View:SetVisible(visible)
    if self.adapter:IsInCombat() or not self.bar then return false end
    if visible then Call(self.bar, "Show") else Call(self.bar, "Hide") end
    return true
end

function View:Hide()
    self:HideTooltip()
    Call(self.moveOverlay, "Hide")
    local index
    for index = 1, #self.ownedFrames do Call(self.ownedFrames[index], "Hide") end
    self.unlocked = false
    return true
end

function View:ReleaseOwnership()
    if not self.ownershipActive then return false end
    local index
    for index = 1, #self.ownedFrames do self.module:ReleaseFrame(self.ownedFrames[index]) end
    self.ownershipActive = false
    return true
end

function View:GetDiagnostics()
    local sideCount = 0
    for _ in pairs(self.sideRecords) do sideCount = sideCount + 1 end
    return {
        created = self.bar ~= nil,
        builds = self.builds,
        refreshes = self.refreshes,
        visualRefreshes = self.visualRefreshes,
        markerButtons = #self.markerRecords,
        sideButtons = sideCount,
        ownedFrames = #self.ownedFrames,
        ownershipActive = self.ownershipActive,
        secureClicksReady = self.secureClicksReady,
        unavailableReason = self.unavailableReason,
        unlocked = self.unlocked,
    }
end

ns.RaidMarkerViewClass = View

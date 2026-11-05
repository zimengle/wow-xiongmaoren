-- 文件职责：惰性创建 CursedTide 面板/行池，复用 Frame 并在 1 秒 tick 中只改文本/进度。
-- 不负责：读取 EventScheduler、注册事件/ticker、决定地图可见性或写 DB。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("CursedTide")) then return end

local View = {}
View.__index = View
local WHITE = "Interface\\Buttons\\WHITE8X8"

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return nil end
    return callback(target, ...)
end
local function HideFrame(frame) Call(frame, "Hide") end

local function FormatDuration(seconds)
    seconds = math.max(0, math.floor(tonumber(seconds) or 0))
    local days = math.floor(seconds / 86400); seconds = seconds % 86400
    local hours = math.floor(seconds / 3600); seconds = seconds % 3600
    local minutes, remaining = math.floor(seconds / 60), seconds % 60
    if days > 0 then return string.format("%d天 %02d:%02d:%02d", days, hours, minutes, remaining) end
    if hours > 0 then return string.format("%02d:%02d:%02d", hours, minutes, remaining) end
    return string.format("%02d:%02d", minutes, remaining)
end

function View:New(module, adapter, data)
    return setmetatable({ module = module, adapter = adapter, data = data, rows = {}, ownedFrames = {},
        ownershipActive = false, builds = 0, renders = 0, textWrites = 0, layoutWrites = 0,
        unlocked = false }, self)
end

function View:TrackFrame(frame) self.ownedFrames[#self.ownedFrames + 1] = frame return frame end

function View:AcquireOwnership()
    if self.ownershipActive then return true end
    local index
    for index = 1, #self.ownedFrames do self.module:OwnFrame(self.ownedFrames[index], HideFrame) end
    self.ownershipActive = true
    return true
end

function View:ApplyFont(fontString, size, color)
    local fallback = _G.STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"
    local service, path = ns.Font
    if service and type(service.GetInterfaceFontPath) == "function" then path = service:GetInterfaceFontPath() end
    if service and type(service.ApplyFontString) == "function" then
        service:ApplyFontString(fontString, path, size, "OUTLINE", fallback)
    else Call(fontString, "SetFont", path or fallback, size, "OUTLINE") end
    if color then Call(fontString, "SetTextColor", color[1], color[2], color[3], color[4] or 1) end
end

function View:GetClassColor(alpha)
    local class
    if type(_G.UnitClass) == "function" then local _; _, class = _G.UnitClass("player") end
    local color = class and _G.RAID_CLASS_COLORS and _G.RAID_CLASS_COLORS[class]
    return color and color.r or 1, color and color.g or 0.82, color and color.b or 0, alpha or 1
end

function View:Ensure()
    if self.panel then self:AcquireOwnership() return self.panel end
    local parent = self.adapter:ResolveAttachment()
    if not parent then return nil end
    local layout = self.data.layout
    local panel = self:TrackFrame(self.module:CreateFrame(
        "Frame", nil, parent, "BackdropTemplate", HideFrame, "CursedTide root"))
    Call(panel, "SetSize", layout.width, layout.headerHeight + layout.primaryRowHeight + layout.padding)
    Call(panel, "SetFrameStrata", "DIALOG")
    Call(panel, "SetMovable", true)
    Call(panel, "EnableMouse", true)
    local title = Call(panel, "CreateFontString", nil, "OVERLAY")
    Call(title, "SetPoint", "TOPLEFT", panel, "TOPLEFT", layout.padding, -15)
    self:ApplyFont(title, 17, { self:GetClassColor(1) })
    Call(title, "SetText", "诅咒狂潮")
    local subtitle = Call(panel, "CreateFontString", nil, "OVERLAY")
    Call(subtitle, "SetPoint", "TOPLEFT", title, "BOTTOMLEFT", 0, -1)
    self:ApplyFont(subtitle, 10, { 0.68, 0.68, 0.68, 1 })
    Call(subtitle, "SetText", self.data.content.mapName)
    local collapse = self:TrackFrame(self.module:CreateFrame(
        "Button", nil, panel, nil, HideFrame, "CursedTide collapse"))
    Call(collapse, "SetSize", 34, 18)
    Call(collapse, "SetPoint", "TOPRIGHT", panel, "TOPRIGHT", -8, -(layout.headerHeight + 3))
    Call(collapse, "RegisterForClicks", "LeftButtonUp", "RightButtonUp")
    local collapseText = Call(collapse, "CreateFontString", nil, "OVERLAY")
    Call(collapseText, "SetAllPoints")
    self:ApplyFont(collapseText, 12, { self:GetClassColor(1) })
    Call(collapse, "SetScript", "OnClick", function(_, button)
        if button == "RightButton" then self.module:OpenSettings()
        else self.module:SetCollapsed(not self.module:IsCollapsed()) end
    end)
    local content = self:TrackFrame(self.module:CreateFrame(
        "Frame", nil, panel, nil, HideFrame, "CursedTide content"))
    Call(content, "SetPoint", "TOPLEFT", panel, "TOPLEFT", layout.padding, -(layout.headerHeight + 3))
    Call(content, "SetSize", layout.cardWidth, layout.primaryRowHeight)
    self.panel, self.title, self.subtitle = panel, title, subtitle
    self.collapseButton, self.collapseText, self.content = collapse, collapseText, content
    self.ownershipActive, self.builds = true, self.builds + 1
    return panel
end

function View:CreateRow(index)
    if self.rows[index] then return self.rows[index] end
    if index > self.data.maxEntries or not self:Ensure() then return nil end
    local layout = self.data.layout
    local button = self:TrackFrame(self.module:CreateFrame(
        "Button", nil, self.content, "BackdropTemplate", HideFrame,
        "CursedTide row " .. tostring(index)))
    Call(button, "SetBackdrop", { bgFile = WHITE })
    Call(button, "SetBackdropColor", 0, 0, 0, 0.50)
    local indicator = Call(button, "CreateTexture", nil, "ARTWORK")
    Call(indicator, "SetPoint", "TOPLEFT", button, "TOPLEFT", 1, -1)
    Call(indicator, "SetPoint", "BOTTOMLEFT", button, "BOTTOMLEFT", 1, 1)
    Call(indicator, "SetWidth", 2)
    local bar = self:TrackFrame(self.module:CreateFrame(
        "StatusBar", nil, button, nil, HideFrame, "CursedTide progress " .. tostring(index)))
    Call(bar, "SetPoint", "BOTTOMLEFT", button, "BOTTOMLEFT", 3, 1)
    Call(bar, "SetPoint", "BOTTOMRIGHT", button, "BOTTOMRIGHT", -1, 1)
    Call(bar, "SetHeight", layout.progressHeight)
    Call(bar, "SetStatusBarTexture", WHITE)
    Call(bar, "SetMinMaxValues", 0, 1)
    local status, name, countdown, detail = Call(button, "CreateFontString", nil, "OVERLAY"),
        Call(button, "CreateFontString", nil, "OVERLAY"),
        Call(button, "CreateFontString", nil, "OVERLAY"),
        Call(button, "CreateFontString", nil, "OVERLAY")
    local record = { frame = button, indicator = indicator, bar = bar, status = status,
        name = name, countdown = countdown, detail = detail }
    Call(button, "RegisterForClicks", "LeftButtonUp")
    Call(button, "SetScript", "OnClick", function(_, mouseButton)
        if mouseButton == "LeftButton" and self.visible and record.entry and record.definition then
            return self.module:ToggleWaypoint(record.definition)
        end
    end)
    self.rows[index] = record
    return record
end

function View:LayoutRow(record, mode, topOffset)
    local primary = mode == "next" or mode == "fresh"
    local height = primary and self.data.layout.primaryRowHeight or self.data.layout.rowHeight
    Call(record.frame, "ClearAllPoints")
    Call(record.frame, "SetPoint", "TOPLEFT", self.content, "TOPLEFT", 0, -topOffset)
    Call(record.frame, "SetPoint", "TOPRIGHT", self.content, "TOPRIGHT", 0, -topOffset)
    Call(record.frame, "SetHeight", height)
    if record.mode ~= mode then
        local widget
        for _, widget in ipairs({ record.status, record.name, record.countdown, record.detail }) do Call(widget, "ClearAllPoints") end
        if primary then
            Call(record.status, "SetPoint", "TOPLEFT", record.frame, "TOPLEFT", 8, -3)
            Call(record.detail, "SetPoint", "TOPRIGHT", record.frame, "TOPRIGHT", -8, -3)
            Call(record.name, "SetPoint", "BOTTOMLEFT", record.frame, "BOTTOMLEFT", 8, 5)
            Call(record.countdown, "SetPoint", "BOTTOMRIGHT", record.frame, "BOTTOMRIGHT", -8, 5)
            self:ApplyFont(record.status, 11, { self:GetClassColor(1) })
            self:ApplyFont(record.name, 15, { 1, 1, 1, 1 })
            self:ApplyFont(record.countdown, 15, { self:GetClassColor(1) })
            self:ApplyFont(record.detail, 11, { 0.68, 0.68, 0.68, 1 })
        elseif mode == "active" then
            Call(record.name, "SetPoint", "LEFT", record.frame, "LEFT", 8, 0)
            self:ApplyFont(record.name, 11, { 1, 1, 1, 1 })
        else
            Call(record.name, "SetPoint", "LEFT", record.frame, "LEFT", 8, 0)
            Call(record.countdown, "SetPoint", "RIGHT", record.frame, "RIGHT", -8, 0)
            Call(record.detail, "SetPoint", "RIGHT", record.frame, "RIGHT", -64, 0)
            self:ApplyFont(record.name, 11, { 1, 1, 1, 1 })
            self:ApplyFont(record.countdown, 11, { 1, 1, 1, 1 })
            self:ApplyFont(record.detail, 9, { 0.68, 0.68, 0.68, 1 })
        end
        record.mode = mode
        self.layoutWrites = self.layoutWrites + 1
    end
    return height
end

function View:UpdateRow(record, now)
    local entry, mode = record.entry, record.mode
    if not entry then return false end
    local status, name, countdown, detail, progress = "", entry.definition.name, "", "", 0
    if mode == "fresh" then status, detail = "正在进行", "本轮活动"
    elseif mode == "active" then name = "本轮已刷新 · " .. name
    elseif entry.startTime then
        countdown = FormatDuration(entry.startTime - now)
        detail = self.adapter:FormatClock(entry.startTime)
        if mode == "next" then
            status = "下一场"
            progress = math.min(1, math.max(0, 1 - (entry.startTime - now) / 2700))
        end
    end
    local function Write(widget, key, value)
        if record[key] ~= value then record[key] = value Call(widget, "SetText", value) self.textWrites = self.textWrites + 1 end
    end
    Write(record.status, "statusText", status); Write(record.name, "nameText", name)
    Write(record.countdown, "countdownText", countdown); Write(record.detail, "detailText", detail)
    Call(record.status, "SetShown", mode == "next" or mode == "fresh")
    Call(record.countdown, "SetShown", mode ~= "active")
    Call(record.detail, "SetShown", mode ~= "active")
    Call(record.bar, "SetValue", progress)
    Call(record.bar, mode == "next" and "Show" or "Hide")
    local r, g, b = self:GetClassColor(1)
    Call(record.indicator, "SetColorTexture", r, g, b,
        (mode == "next" or mode == "fresh") and 1 or mode == "active" and 0.32 or 0.68)
    local boundaryKind = entry.active == true and "end" or "start"
    local boundaryTime = entry.active == true and entry.endTime or entry.startTime
    local boundaryKey = type(boundaryTime) == "number"
        and table.concat({ tostring(entry.areaPoiID), boundaryKind, tostring(boundaryTime) }, ":") or nil
    if record.boundaryKey ~= boundaryKey then
        record.boundaryKey = boundaryKey
        record.boundaryNotified = false
    end
    local crossed = boundaryTime and type(now) == "number" and boundaryTime <= now or false
    if crossed and not record.boundaryNotified then
        record.boundaryNotified = true
        return true
    end
    return false
end

function View:Render(rows, profile, preview)
    if type(rows) ~= "table" or #rows == 0 or #rows > self.data.maxEntries or not self:Ensure() then return false end
    self:ApplyProfile(profile)
    self.preview = preview == true
    self.statusOnly = false
    Call(self.collapseText, "SetText", self.module:IsCollapsed() and "展开" or "折叠")
    local now, topOffset = self.adapter:GetNow(), 0
    local index
    for index = 1, #rows do
        local record = self:CreateRow(index)
        record.entry, record.definition = rows[index], rows[index].definition
        topOffset = topOffset + self:LayoutRow(record, rows[index].mode, topOffset)
        self:UpdateRow(record, now)
        Call(record.frame, "Show")
    end
    for index = #rows + 1, #self.rows do
        Call(self.rows[index].frame, "Hide")
        self.rows[index].entry, self.rows[index].definition = nil, nil
    end
    if self.emptyText then Call(self.emptyText, "Hide") end
    Call(self.content, "SetHeight", topOffset)
    Call(self.panel, "SetHeight", self.data.layout.headerHeight + 3 + topOffset + self.data.layout.padding)
    Call(self.panel, "Show")
    self.visible = true
    self.renderedCount, self.renders = #rows, self.renders + 1
    return true
end

function View:RenderStatus(text, profile)
    if not self:Ensure() then return false end
    if type(profile) ~= "table" or not self:ApplyProfile(profile) then
        self:Hide()
        return false
    end
    Call(self.collapseText, "SetText", self.module:IsCollapsed() and "展开" or "折叠")
    local index
    for index = 1, #self.rows do
        Call(self.rows[index].frame, "Hide")
        self.rows[index].entry, self.rows[index].definition = nil, nil
    end
    if not self.emptyText then
        self.emptyText = Call(self.content, "CreateFontString", nil, "OVERLAY")
        Call(self.emptyText, "SetPoint", "TOPLEFT", self.content, "TOPLEFT", 2, -6)
        Call(self.emptyText, "SetPoint", "TOPRIGHT", self.content, "TOPRIGHT", -2, -6)
        self:ApplyFont(self.emptyText, 12, { 0.68, 0.68, 0.68, 1 })
    end
    Call(self.emptyText, "SetText", text)
    Call(self.emptyText, "Show")
    Call(self.content, "SetHeight", 30)
    Call(self.panel, "SetHeight", self.data.layout.headerHeight + 33 + self.data.layout.padding)
    Call(self.panel, "Show")
    self.statusOnly, self.renderedCount = true, 0
    return true
end

function View:Tick(now)
    if not self.panel or self.statusOnly then return false end
    local boundary = false
    local index
    for index = 1, self.renderedCount or 0 do
        local record = self.rows[index]
        if record.entry and self:UpdateRow(record, now) then boundary = true end
    end
    return boundary
end

function View:ApplyProfile(profile)
    if not self.panel then return false end
    Call(self.panel, "SetScale", self.adapter:ClampScale(profile.scale, self.data))
    return self.adapter:ApplyAttachment(self.panel, profile, self.data)
end

function View:EnsureMoveOverlay()
    if not self.panel or type(ns.MoveOverlay) ~= "table" then return nil end
    if self.moveOverlay then self.module:OwnFrame(self.moveOverlay, HideFrame) end
    local owner = self
    self.moveOverlay = ns.MoveOverlay:Ensure(self.panel, {
        label = "诅咒狂潮",
        createFrame = function(parent) return owner.module:CreateFrame(
            "Button", nil, parent, "BackdropTemplate", HideFrame, "CursedTide move overlay") end,
        canInteract = function() return not owner.adapter:IsInCombat() end,
        onDragStop = function() owner.module:SavePosition() end,
        onSettings = function() owner.module:OpenSettings() end,
        nudgeConfig = function() return {
            label = "诅咒狂潮",
            getPosition = function()
                local p, d = owner.module:GetProfile(), owner.data.layout.defaultPosition
                return tonumber(p.positionX) or d.x, tonumber(p.positionY) or d.y
            end,
            setPosition = function(x, y) return owner.module:SetPosition(x, y) end,
            savePosition = function() return owner.module:SavePosition() end,
            applyPosition = function() return owner:ApplyProfile(owner.module:GetProfile()) end,
            onSettings = function() return owner.module:OpenSettings() end,
            onLock = function() return owner.module:SetUnlocked(false) end,
        } end,
    })
    return self.moveOverlay
end

function View:SetUnlocked(unlocked)
    self.unlocked = unlocked and true or false
    if self.unlocked then
        local overlay = self:EnsureMoveOverlay()
        if not overlay then return false end
        Call(self.panel, "Show"); Call(overlay, "Show")
    elseif self.moveOverlay then
        Call(self.moveOverlay, "Hide")
        self.module:ReleaseFrame(self.moveOverlay)
    end
    return true
end

function View:Hide()
    self.visible = false
    Call(self.moveOverlay, "Hide")
    Call(self.panel, "Hide")
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
    return { created = self.panel ~= nil, builds = self.builds, renders = self.renders,
        rowsCreated = #self.rows, renderedCount = self.renderedCount or 0, textWrites = self.textWrites,
        layoutWrites = self.layoutWrites, ownershipActive = self.ownershipActive,
        unlocked = self.unlocked, statusOnly = self.statusOnly == true }
end

ns.CursedTideViewClass = View

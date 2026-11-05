-- 文件职责：按需创建并复用最多 5 个货币项，处理布局、字体、Tooltip 和移动覆盖层。
-- 不负责：读取 C_CurrencyInfo、注册事件、决定地图/等级可见性或写入 DB。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("CurrencyBar")) then return end

local View = {}
View.__index = View

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return nil end
    return callback(target, ...)
end

local function HideFrame(frame) pcall(Call, frame, "Hide") end

local function ReleaseFrame(view, frame)
    if not frame then return false end
    HideFrame(frame)
    pcall(view.module.ReleaseFrame, view.module, frame)
    return true
end

function View:New(module, adapter, data)
    return setmetatable({
        module = module,
        adapter = adapter,
        data = data,
        entries = {},
        ownedFrames = {},
        ownershipActive = false,
        builds = 0,
        renders = 0,
        quantityWrites = 0,
        layoutWrites = 0,
        unlocked = false,
    }, self)
end

function View:TrackFrame(frame)
    self.ownedFrames[#self.ownedFrames + 1] = frame
    return frame
end

function View:AcquireOwnership()
    if self.ownershipActive then return true end
    local acquired = {}
    local index
    for index = 1, #self.ownedFrames do
        local frame = self.ownedFrames[index]
        local owned, result = pcall(self.module.OwnFrame, self.module, frame, HideFrame)
        if not owned or not result then
            local releaseIndex = #acquired
            while releaseIndex >= 1 do
                ReleaseFrame(self, acquired[releaseIndex])
                releaseIndex = releaseIndex - 1
            end
            return false
        end
        acquired[#acquired + 1] = frame
    end
    self.ownershipActive = true
    return true
end

function View:ApplyFont(fontString)
    local fallback = _G.STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"
    local service = ns.Font
    if service and type(service.ApplyFontString) == "function" then
        local ok = service:ApplyFontString(fontString, nil, self.data.layout.fontSize, "OUTLINE", fallback)
        if ok then return true end
    end
    return Call(fontString, "SetFont", fallback, self.data.layout.fontSize, "OUTLINE") ~= false
end

function View:Ensure()
    if self.bar then
        if not self:AcquireOwnership() then return nil end
        return self.bar
    end
    local resolved, parent = pcall(self.adapter.ResolveAttachment, self.adapter)
    if not resolved or not parent then return nil end
    local layout = self.data.layout
    local created, bar = pcall(
        self.module.CreateFrame,
        self.module,
        "Frame", nil, parent, nil, HideFrame, "CurrencyBar root"
    )
    if not created or not bar then return nil end
    local background
    local configured = pcall(function()
        Call(bar, "SetSize", layout.padding * 2, layout.height)
        Call(bar, "SetFrameStrata", "DIALOG")
        Call(bar, "SetMovable", true)
        Call(bar, "EnableMouse", true)
        background = Call(bar, "CreateTexture", nil, "BACKGROUND")
        if background then
            Call(background, "SetPoint", "LEFT", bar, "LEFT", 0, 0)
            Call(background, "SetPoint", "RIGHT", bar, "RIGHT", 0, 0)
            Call(background, "SetHeight", layout.backgroundHeight)
            Call(background, "SetColorTexture", 0, 0, 0, 0.50)
        end
    end)
    if not configured then
        ReleaseFrame(self, bar)
        return nil
    end
    self:TrackFrame(bar)
    self.bar = bar
    self.background = background
    self.ownershipActive = true
    self.builds = self.builds + 1
    return bar
end

function View:CreateEntry(index)
    if index > self.data.maxEntries then return nil end
    local bar = self:Ensure()
    if not bar then return nil end
    local layout = self.data.layout
    local created, button = pcall(
        self.module.CreateFrame,
        self.module,
        "Button", nil, bar, nil, HideFrame, "CurrencyBar entry " .. tostring(index)
    )
    if not created or not button then return nil end
    local record
    local configured = pcall(function()
        Call(button, "SetHeight", layout.height)
        Call(button, "EnableMouse", true)
        local icon = Call(button, "CreateTexture", nil, "ARTWORK")
        local nameText = Call(button, "CreateFontString", nil, "OVERLAY")
        local quantityText = Call(button, "CreateFontString", nil, "OVERLAY")
        if not (icon and nameText and quantityText) then
            error("CurrencyBar entry visual is unavailable", 0)
        end
        Call(icon, "SetSize", layout.iconSize, layout.iconSize)
        Call(icon, "SetPoint", "LEFT", button, "LEFT", 0, 0)
        Call(icon, "SetTexCoord", layout.iconCrop, 1 - layout.iconCrop, layout.iconCrop, 1 - layout.iconCrop)
        Call(nameText, "SetPoint", "LEFT", icon, "RIGHT", layout.iconTextPadding, 0)
        Call(nameText, "SetJustifyH", "LEFT")
        Call(nameText, "SetWordWrap", false)
        if type(nameText.SetMaxLines) == "function" then nameText:SetMaxLines(1) end
        if not self:ApplyFont(nameText) then error("CurrencyBar name font is unavailable", 0) end
        Call(quantityText, "SetPoint", "LEFT", nameText, "RIGHT", layout.nameQuantityPadding, 0)
        Call(quantityText, "SetJustifyH", "LEFT")
        Call(quantityText, "SetWordWrap", false)
        if type(quantityText.SetMaxLines) == "function" then quantityText:SetMaxLines(1) end
        if not self:ApplyFont(quantityText) then error("CurrencyBar quantity font is unavailable", 0) end
        record = { frame = button, icon = icon, nameText = nameText, quantityText = quantityText }
        button:SetScript("OnEnter", function()
            local tooltip = _G.GameTooltip
            if not (tooltip and type(tooltip.SetCurrencyByID) == "function" and record.currencyID) then return end
            tooltip:SetOwner(button, "ANCHOR_TOP")
            tooltip:SetCurrencyByID(record.currencyID)
            tooltip:Show()
        end)
        button:SetScript("OnLeave", function()
            if _G.GameTooltip and type(_G.GameTooltip.Hide) == "function" then _G.GameTooltip:Hide() end
        end)
    end)
    if not configured then
        ReleaseFrame(self, button)
        return nil
    end
    self:TrackFrame(button)
    self.entries[index] = record
    return record
end

function View:EnsureEntry(index)
    local record = self.entries[index]
    if record then return record end
    return self:CreateEntry(index)
end

function View:ApplyTierColor(record, displayTier)
    local color = self.data.displayTierColors[displayTier] or { 1, 1, 1, 1 }
    Call(record.nameText, "SetTextColor", color[1], color[2], color[3], color[4])
    Call(record.quantityText, "SetTextColor", color[1], color[2], color[3], color[4])
end

function View:Layout(count)
    local layout = self.data.layout
    local totalWidth = layout.padding * 2
    local previous
    local index
    for index = 1, count do
        local record = self.entries[index]
        local nameWidth = tonumber(Call(record.nameText, "GetStringWidth")) or 0
        local quantityWidth = tonumber(Call(record.quantityText, "GetStringWidth")) or 0
        local width = math.ceil(layout.iconSize + layout.iconTextPadding + nameWidth
            + layout.nameQuantityPadding + quantityWidth)
        Call(record.frame, "SetWidth", width)
        Call(record.frame, "ClearAllPoints")
        if previous then
            Call(record.frame, "SetPoint", "LEFT", previous, "RIGHT", layout.groupGap, 0)
            totalWidth = totalWidth + layout.groupGap
        else
            Call(record.frame, "SetPoint", "LEFT", self.bar, "LEFT", layout.padding, 0)
        end
        totalWidth = totalWidth + width
        previous = record.frame
    end
    Call(self.bar, "SetSize", math.max(totalWidth, layout.padding * 2), layout.height)
    self.layoutWrites = self.layoutWrites + 1
end

function View:ApplyProfile(profile)
    if not self.bar then return false end
    Call(self.bar, "SetScale", self.adapter:ClampScale(profile.scale, self.data))
    return self.adapter:ApplyAttachment(self.bar, profile, self.data)
end

function View:Render(items, profile)
    if type(items) ~= "table" or #items == 0 or #items > self.data.maxEntries then
        self:Hide()
        return false
    end
    if not self:Ensure() then return false end
    local rendered = pcall(function()
        if self:ApplyProfile(profile) == false then
            error("CurrencyBar attachment is unavailable", 0)
        end
        local layoutDirty = self.renderedCount ~= #items
        local index
        for index = 1, #items do
            local item = items[index]
            local record = self:EnsureEntry(index)
            if not record then error("CurrencyBar entry is unavailable", 0) end
            if record.currencyID ~= item.currencyID then
                record.currencyID = item.currencyID
                record.label = nil
                record.iconFileID = nil
                record.displayTier = nil
                layoutDirty = true
            end
            if record.iconFileID ~= item.iconFileID then
                Call(record.icon, "SetTexture", item.iconFileID)
                record.iconFileID = item.iconFileID
            end
            if record.label ~= item.label then
                Call(record.nameText, "SetText", item.label)
                record.label = item.label
                layoutDirty = true
            end
            if record.quantityTextValue ~= item.quantityText then
                Call(record.quantityText, "SetText", item.quantityText)
                record.quantityTextValue = item.quantityText
                self.quantityWrites = self.quantityWrites + 1
                layoutDirty = true
            end
            if record.displayTier ~= item.displayTier then
                self:ApplyTierColor(record, item.displayTier)
                record.displayTier = item.displayTier
            end
            Call(record.frame, "Show")
        end
        for index = #items + 1, #self.entries do Call(self.entries[index].frame, "Hide") end
        if layoutDirty then self:Layout(#items) end
        Call(self.bar, "Show")
        self.renderedCount = #items
        self.renders = self.renders + 1
    end)
    if not rendered then
        pcall(self.Hide, self)
        return false
    end
    return true
end

function View:GetNudgeConfig()
    if self.nudgeConfig then return self.nudgeConfig end
    local owner = self
    self.nudgeConfig = {
        label = "货币条",
        getPosition = function()
            local profile = owner.module:GetProfile()
            local alignment = profile.alignment == "LEFT" and "LEFT" or "RIGHT"
            local defaults = owner.data.layout.defaultOffsets[alignment]
            return tonumber(profile.positionX) or defaults.x, tonumber(profile.positionY) or defaults.y
        end,
        setPosition = function(x, y) return owner.module:SetPosition(x, y) end,
        savePosition = function() return owner.module:SavePosition() end,
        applyPosition = function() return owner:ApplyProfile(owner.module:GetProfile()) end,
        onSettings = function() return owner.module:OpenSettings() end,
        onLock = function()
            if type(ns.SetRsMoveMode) == "function" then return ns:SetRsMoveMode(false) end
            return owner.module:SetUnlocked(false)
        end,
    }
    return self.nudgeConfig
end

function View:EnsureMoveOverlay()
    if not self.bar or type(ns.MoveOverlay) ~= "table" then return nil end
    if self.moveOverlay then self.module:OwnFrame(self.moveOverlay, HideFrame) end
    local overlay = ns.MoveOverlay:Ensure(self.bar, {
        label = "货币条",
        createFrame = function(parent)
            return self.module:CreateFrame(
                "Button", nil, parent, "BackdropTemplate", HideFrame, "CurrencyBar move overlay"
            )
        end,
        canInteract = function() return not self.adapter:IsInCombat() end,
        onDragStop = function() self.module:SavePosition() end,
        onSettings = function() return self.module:OpenSettings() end,
        nudgeConfig = function() return self:GetNudgeConfig() end,
    })
    self.moveOverlay = overlay
    return overlay
end

function View:SetUnlocked(unlocked)
    self.unlocked = unlocked and true or false
    if self.unlocked then
        if not self.bar then return false end
        local overlay = self:EnsureMoveOverlay()
        if not overlay then return false end
        Call(self.bar, "Show")
        Call(overlay, "Show")
    elseif self.moveOverlay then
        Call(self.moveOverlay, "Hide")
    end
    return true
end

function View:Hide()
    pcall(Call, self.moveOverlay, "Hide")
    pcall(Call, self.bar, "Hide")
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
    return {
        created = self.bar ~= nil,
        builds = self.builds,
        renders = self.renders,
        entriesCreated = #self.entries,
        renderedCount = self.renderedCount or 0,
        quantityWrites = self.quantityWrites,
        layoutWrites = self.layoutWrites,
        ownedFrames = #self.ownedFrames,
        ownershipActive = self.ownershipActive,
        unlocked = self.unlocked,
    }
end

ns.CurrencyBarViewClass = View

local _, ns = ...

local Data = ns.ExperienceBarData
if type(Data) ~= "table" then
    error("ExperienceBar Data.lua must load before View.lua", 2)
end

local View = {}
View.__index = View

local floor = math.floor
local max = math.max
local min = math.min

local function FormatNumber(value)
    value = max(0, floor(tonumber(value) or 0))
    if value >= 10000 then
        return string.format("%.1f万", value / 10000)
    end
    if type(_G.FormatLargeNumber) == "function" then
        return _G.FormatLargeNumber(value)
    end
    if type(_G.BreakUpLargeNumbers) == "function" then
        return _G.BreakUpLargeNumbers(value)
    end
    return tostring(value)
end

local function FormatPercent(value)
    return string.format("%.1f", tonumber(value) or 0):gsub("%.0$", "")
end

local function FormatDuration(seconds)
    seconds = max(0, floor(tonumber(seconds) or 0))
    if seconds < 60 then
        return "<1分"
    end
    local days = floor(seconds / 86400)
    local hours = floor((seconds % 86400) / 3600)
    local minutes = floor((seconds % 3600) / 60)
    if days > 0 then
        return string.format("%d天%d小时%d分", days, hours, minutes)
    end
    if hours > 0 then
        return string.format("%d小时%d分", hours, minutes)
    end
    return string.format("%d分", minutes)
end

local function SetGradient(texture, startColor, endColor)
    local r1, g1, b1, a1 = unpack(startColor)
    local r2, g2, b2, a2 = unpack(endColor)
    texture:SetColorTexture(1, 1, 1, 1)
    if type(texture.SetGradient) == "function" and type(_G.CreateColor) == "function" then
        local ok = pcall(
            texture.SetGradient,
            texture,
            "HORIZONTAL",
            _G.CreateColor(r1, g1, b1, a1),
            _G.CreateColor(r2, g2, b2, a2)
        )
        if ok then
            return
        end
    end
    if type(texture.SetGradientAlpha) == "function" then
        local ok = pcall(
            texture.SetGradientAlpha,
            texture,
            "HORIZONTAL",
            r1,
            g1,
            b1,
            a1,
            r2,
            g2,
            b2,
            a2
        )
        if ok then
            return
        end
    end
    texture:SetColorTexture(r1, g1, b1, a1)
end

local function SetSegment(texture, startX, width, height, color)
    if texture == nil then
        return
    end
    if width <= 0 then
        texture:Hide()
        return
    end
    texture:ClearAllPoints()
    texture:SetPoint("LEFT", texture:GetParent(), "LEFT", startX, 0)
    texture:SetSize(width, height)
    texture:SetColorTexture(unpack(color))
    texture:Show()
end

local function CreateText(frame, point, relativePoint, x, y, justify)
    local text = frame:CreateFontString(nil, "OVERLAY")
    text:SetPoint(point, frame, relativePoint, x, y)
    text:SetJustifyH(justify or "CENTER")
    text:SetTextColor(1, 1, 1, 1)
    return text
end

local function ResolveFont()
    -- ExperienceBar has always owned a dedicated font role.  Do not inherit
    -- the main settings-window body font here: the legacy Retail bar defaults
    -- to RS Rurutia and always uses OUTLINE for readable text over the world.
    if ns.Font and type(ns.Font.GetExperienceBarFontPath) == "function" then
        local path = ns.Font:GetExperienceBarFontPath()
        local fallback = type(ns.Font.GetSystemFontPath) == "function"
            and ns.Font:GetSystemFontPath()
            or (_G.STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF")
        return path or fallback, "OUTLINE", fallback
    end
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if system and system.theme and type(system.theme.ResolveFont) == "function" then
        local path = system.theme:ResolveFont("body")
        return path, "OUTLINE", _G.STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"
    end
    local fallback = _G.STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"
    return fallback, "OUTLINE", fallback
end

local function ApplyFont(fontString, path, size, flags, fallback)
    if ns.Font and type(ns.Font.ApplyFontString) == "function" then
        ns.Font:ApplyFontString(fontString, path, size, flags, fallback)
    elseif fontString and type(fontString.SetFont) == "function" then
        local ok, applied = pcall(fontString.SetFont, fontString, path, size, flags)
        if (not ok or applied == false) and fallback then
            pcall(fontString.SetFont, fontString, fallback, size, flags)
        end
    end
end

function View.New(module, features)
    return setmetatable({
        module = module,
        features = features or {},
        frame = nil,
        overlay = nil,
        overlayComponent = nil,
    }, View)
end

function View:_OwnFrames()
    if self.frame then
        self.module:OwnFrame(self.frame)
    end
    if self.overlay then
        self.module:OwnFrame(self.overlay)
    end
end

function View:Ensure()
    if self.frame then
        self:_OwnFrames()
        return self.frame
    end

    local frame = self.module:CreateFrame("Frame", "RSExperienceBar", _G.UIParent)
    frame:SetFrameStrata("LOW")
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)

    self.background = frame:CreateTexture(nil, "BACKGROUND")
    self.background:SetAllPoints()
    self.background:SetColorTexture(unpack(Data.colors.background))

    self.fill = frame:CreateTexture(nil, "ARTWORK")
    self.fill:SetPoint("LEFT", frame, "LEFT", 0, 0)

    if self.features.questXP then
        self.completeQuest = frame:CreateTexture(nil, "ARTWORK", nil, 1)
        if self.features.incompleteQuestXP ~= false then
            self.incompleteQuest = frame:CreateTexture(nil, "ARTWORK", nil, 2)
        end
        self.rested = frame:CreateTexture(
            nil, "ARTWORK", nil, self.features.incompleteQuestXP ~= false and 3 or 2)
    else
        self.rested = frame:CreateTexture(nil, "ARTWORK", nil, 1)
    end

    self.levelText = CreateText(frame, "BOTTOMLEFT", "BOTTOMLEFT", 2, 0, "LEFT")
    self.xpText = CreateText(frame, "CENTER", "CENTER", 0, 5, "CENTER")
    self.percentText = CreateText(frame, "RIGHT", "RIGHT", -2, 5, "RIGHT")
    self.rateText = CreateText(frame, "TOPLEFT", "BOTTOMLEFT", 4, -12, "LEFT")
    self.questText = CreateText(frame, "TOPRIGHT", "BOTTOMRIGHT", 0, -12, "RIGHT")
    self.levelTimeText = CreateText(frame, "BOTTOMLEFT", "TOPLEFT", 0, 24, "LEFT")
    self.sessionTimeText = CreateText(frame, "BOTTOMRIGHT", "TOPRIGHT", 0, 24, "RIGHT")

    self.frame = frame
    self.module.frame = frame
    self:_OwnFrames()
    return frame
end

function View:ApplyAppearance(profile)
    local frame = self:Ensure()
    frame:SetSize(profile.width, profile.height)
    frame:SetAlpha(profile.alpha)
    self.background:SetColorTexture(unpack(Data.colors.background))
    SetGradient(self.fill, profile.colors.gradientStart, profile.colors.gradientEnd)

    local path, flags, fallback = ResolveFont()
    local scale = profile.textScale
    ApplyFont(self.levelText, path, 21 * scale, flags, fallback)
    ApplyFont(self.xpText, path, 14 * scale, flags, fallback)
    ApplyFont(self.percentText, path, 15 * scale, flags, fallback)
    ApplyFont(self.rateText, path, 15 * scale, flags, fallback)
    ApplyFont(self.questText, path, 15 * scale, flags, fallback)
    ApplyFont(self.levelTimeText, path, 14 * scale, flags, fallback)
    ApplyFont(self.sessionTimeText, path, 14 * scale, flags, fallback)
    self:RefreshClamp()
end

function View:ApplyPosition(profile)
    local frame = self:Ensure()
    frame:ClearAllPoints()
    frame:SetPoint("TOP", _G.UIParent, "TOP", profile.x, profile.y)
end

function View:SavePosition(profile)
    if not self.frame then
        return false
    end
    local _, _, _, x, y = self.frame:GetPoint(1)
    profile.x = tonumber(x) or Data.layout.defaultX
    profile.y = tonumber(y) or Data.layout.defaultY
    self:ApplyPosition(profile)
    return true
end

function View:RefreshClamp()
    if not self.frame then
        return
    end
    local allowOffscreen = ns.DB and ns.DB.profile and ns.DB.profile.moveSettings
        and ns.DB.profile.moveSettings.allowOffscreenDrag == true
    self.frame:SetClampedToScreen(not allowOffscreen)
end

function View:Render(state, profile, shouldShow)
    local frame = self:Ensure()
    frame:SetShown(shouldShow)
    if not shouldShow then
        return false
    end

    local width = profile.width
    local height = profile.height
    local maxXP = max(1, tonumber(state.maxXP) or 0)
    local currentXP = state.isMaxLevel and maxXP or max(0, tonumber(state.currentXP) or 0)
    local currentWidth = min(width, currentXP / maxXP * width)
    self.fill:SetSize(max(0.001, currentWidth), height)
    self.fill:SetShown(currentWidth > 0)

    local remainingWidth = max(0, width - currentWidth)
    local completeXP = self.features.questXP and max(0, tonumber(state.completeXP) or 0) or 0
    local incompleteXP = self.features.questXP and self.features.incompleteQuestXP ~= false
        and max(0, tonumber(state.incompleteXP) or 0) or 0
    local completeWidth = min(remainingWidth, completeXP / maxXP * width)
    local incompleteWidth = self.features.questXP and self.features.incompleteQuestXP ~= false
        and profile.showIncompleteQuestOverlay
        and min(remainingWidth - completeWidth, incompleteXP / maxXP * width) or 0
    local restedWidth = min(
        remainingWidth - completeWidth - incompleteWidth,
        max(0, tonumber(state.restedXP) or 0) / maxXP * width
    )

    SetSegment(self.completeQuest, currentWidth, completeWidth, height, profile.colors.completeQuest)
    SetSegment(
        self.incompleteQuest,
        currentWidth + completeWidth,
        incompleteWidth,
        height,
        profile.colors.incompleteQuest
    )
    SetSegment(
        self.rested,
        currentWidth + completeWidth + incompleteWidth,
        restedWidth,
        height,
        profile.colors.rested
    )

    local percent = state.isMaxLevel and 100 or currentXP / maxXP * 100
    self.levelText:SetText("等级 " .. tostring(state.level))
    if state.isMaxLevel then
        self.xpText:SetText("已满级")
        self.percentText:SetText("100%")
    else
        self.xpText:SetText(string.format(
            "%s / %s (剩余 %s)",
            FormatNumber(currentXP),
            FormatNumber(maxXP),
            FormatNumber(maxXP - currentXP)
        ))
        if self.features.questXP
            and (not self.features.hideEmptyQuestProjection or completeXP > 0) then
            local afterComplete = (currentXP + completeXP) / maxXP * 100
            self.percentText:SetText(string.format("%s%% (%s%%)", FormatPercent(percent), FormatPercent(afterComplete)))
        else
            self.percentText:SetText(string.format("%s%%", FormatPercent(percent)))
        end
    end

    local hourlyXP = 0
    local timeToLevel = 0
    if state.sessionTime > 0 and state.gainedXP > 0 then
        hourlyXP = floor(state.gainedXP / state.sessionTime * 3600 + 0.5)
        if hourlyXP > 0 then
            timeToLevel = floor((maxXP - currentXP) / hourlyXP * 3600 + 0.5)
        end
    end
    self.rateText:SetShown(profile.showXPPerHour and not state.isMaxLevel)
    self.rateText:SetText(string.format(
        "预计升级: %s (%s经验/小时)",
        timeToLevel > 0 and FormatDuration(timeToLevel) or "--",
        FormatNumber(hourlyXP)
    ))
    self.questText:SetShown(profile.showQuestRestedText and not state.isMaxLevel)
    if self.features.questXP then
        self.questText:SetText(string.format(
            "已完成: |cFFFF9700%s%%|r 双倍: |cFF4F90FF%s%%|r",
            FormatPercent(completeXP / maxXP * 100),
            FormatPercent((tonumber(state.restedXP) or 0) / maxXP * 100)
        ))
    else
        self.questText:SetText(string.format(
            "双倍: |cFF4F90FF%s%%|r",
            FormatPercent((tonumber(state.restedXP) or 0) / maxXP * 100)
        ))
    end
    self.levelTimeText:SetShown(profile.showLevelTime)
    self.levelTimeText:SetText("当前等级时间: " .. FormatDuration(state.levelTime))
    self.sessionTimeText:SetShown(profile.showSessionTime)
    self.sessionTimeText:SetText("本次会话时间: " .. FormatDuration(state.sessionTime))
    return true
end

function View:_EnsureOverlay()
    if self.overlay then
        self.module:OwnFrame(self.overlay)
    end

    local frame = self:Ensure()
    local service = ns.MoveOverlay
    if type(service) ~= "table" then return nil end
    if not self.nudgeConfig then
        local owner = self
        self.nudgeConfig = {
            label = "顶部经验条",
            getPosition = function()
                local profile = owner.module:GetProfile()
                return profile.x, profile.y
            end,
            setPosition = function(x, y)
                local profile = owner.module:GetProfile()
                profile.x, profile.y = tonumber(x) or 0, tonumber(y) or 0
            end,
            applyPosition = function() return owner:ApplyPosition(owner.module:GetProfile()) end,
            -- setPosition already persists offsets; drag saving would read the old frame here.
            onSettings = function() return owner.module:OpenSettings() end,
            onLock = function()
                if type(ns.SetRsMoveMode) == "function" then return ns:SetRsMoveMode(false) end
                return owner.module:SetUnlocked(false)
            end,
        }
    end
    local overlay = service:Ensure(frame, {
        label = "顶部经验条",
        createFrame = function(parent)
            return self.module:CreateFrame("Button", nil, parent, "BackdropTemplate")
        end,
        canInteract = function()
            return type(_G.InCombatLockdown) ~= "function" or not _G.InCombatLockdown()
        end,
        onDragStop = function() self.module:SavePosition() end,
        onSettings = function() return self.module:OpenSettings() end,
        nudgeConfig = self.nudgeConfig,
    })

    self.overlay = overlay
    self.module:OwnFrame(overlay)
    return overlay
end

function View:SetUnlocked(unlocked)
    if unlocked then
        self:Ensure():Show()
        local overlay = self:_EnsureOverlay()
        if overlay then overlay:Show() end
    elseif self.overlay then
        self.overlay:Hide()
    end
end

function View:Hide()
    if self.overlay then
        self.overlay:Hide()
    end
    if self.frame then
        self.frame:Hide()
    end
end

function View:ReleaseOwnership()
    if self.overlay then
        self.module:ReleaseFrame(self.overlay)
    end
    if self.frame then
        self.module:ReleaseFrame(self.frame)
    end
end

function View:GetSnapshot()
    return {
        shown = self.frame and self.frame:IsShown() or false,
        levelText = self.levelText and self.levelText:GetText() or nil,
        xpText = self.xpText and self.xpText:GetText() or nil,
        percentText = self.percentText and self.percentText:GetText() or nil,
        rateText = self.rateText and self.rateText:GetText() or nil,
        questText = self.questText and self.questText:GetText() or nil,
        levelTimeText = self.levelTimeText and self.levelTimeText:GetText() or nil,
        sessionTimeText = self.sessionTimeText and self.sessionTimeText:GetText() or nil,
    }
end

ns.ExperienceBarView = View

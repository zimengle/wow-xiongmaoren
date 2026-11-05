local _, ns = ...
if not (ns.Build and ns.Build.HasModule("NativeTooltip")) then return end
local Adapter = ns.NativeTooltipAdapter
local View = {}
View.__index = View
ns.NativeTooltipView = View

local backdropCoordinates = _G.BackdropTemplateMixin and _G.BackdropTemplateMixin.SetupTextureCoordinates
local function SafeBackdropCoordinates(frame)
    -- The tooltip can inherit restricted geometry after creation. Guard every
    -- template resize callback on our own skin, without changing Blizzard's mixin.
    if frame.CanBeAccessedInContext and not frame:CanBeAccessedInContext() then return end
    local ok, width, height = pcall(frame.GetSize, frame)
    if not ok or Adapter:IsSecret(width) or Adapter:IsSecret(height) then return end
    return backdropCoordinates(frame)
end

function View:New(module)
    return setmetatable({ module = module, skins = {}, fonts = {}, processing = {}, parked = {},
        aura = {}, following = false }, self)
end

function View:AddIDs(tooltip, data)
    local profile = self.module:GetProfile()
    if not (profile.showSpellID or profile.showItemID or profile.showIconID or profile.showNPCID) then return false end
    local npcID = profile.showNPCID and Adapter:GetNPCID(tooltip)
    local kind, id, icon
    if npcID then kind, id = "npc", npcID
    else kind, id, icon = Adapter:GetIDs(tooltip, data, profile.showIconID) end
    if not id then return false end
    local label = kind == "spell" and profile.showSpellID and "SpellID:"
        or kind == "item" and profile.showItemID and "ItemID:"
        or kind == "npc" and "NPCID:"
    local iconLabel = profile.showIconID and icon and "IconID:"
    if not label and not iconLabel then return false end
    local name, count = tooltip:GetName(), Adapter:Safe(tooltip:NumLines())
    if not name or type(count) ~= "number" then return false end
    for i = 1, count do
        local line = _G[name .. "TextLeft" .. i]
        local text = line and Adapter:Safe(line:GetText())
        if type(text) == "string" then
            if text == label then label = nil end
            if text == iconLabel then iconLabel = nil end
        end
    end
    if not label and not iconLabel then return false end
    -- NDui Titan TooltipID.lua: one spacer, gold labels, InfoColor #99ccff values.
    tooltip:AddLine(" ")
    if label then tooltip:AddDoubleLine(label, tostring(id), 1, 0.82, 0, 0.6, 0.8, 1) end
    if iconLabel then tooltip:AddDoubleLine(iconLabel, tostring(icon), 1, 0.82, 0, 0.6, 0.8, 1) end
    return true
end

function View:IsAura(tooltip) return tooltip ~= nil and self.aura[tooltip] == true end

function View:SetAura(tooltip) self.aura[tooltip] = true end

function View:ClearAura(tooltip) self.aura[tooltip] = nil end

function View:ClearAuras() self.aura = {} end

-- Aura rows: SpellID/IconID keep the shared ID colours; the source name is
-- class coloured for players and neutral for NPC/pet sources.
function View:AddAura(tooltip, aura)
    local profile = self.module:GetProfile()
    local label = profile.showSpellID and aura.spellId and "SpellID:"
    local iconLabel = profile.showIconID and aura.iconId and "IconID:"
    local source = profile.showAuraSource and aura.source
    if not (label or iconLabel or source) then return false end
    local name, count = tooltip:GetName(), Adapter:Safe(tooltip:NumLines())
    if not name or type(count) ~= "number" then return false end
    for i = 1, count do
        local line = _G[name .. "TextLeft" .. i]
        local text = line and Adapter:Safe(line:GetText())
        if type(text) == "string" then
            if label and text == label then label = nil end
            if iconLabel and text == iconLabel then iconLabel = nil end
            if source and text == "来源:" then source = nil end
        end
    end
    if not (label or iconLabel or source) then return false end
    tooltip:AddLine(" ")
    if label then tooltip:AddDoubleLine(label, tostring(aura.spellId), 1, 0.82, 0, 0.6, 0.8, 1) end
    if iconLabel then tooltip:AddDoubleLine(iconLabel, tostring(aura.iconId), 1, 0.82, 0, 0.6, 0.8, 1) end
    if source then tooltip:AddDoubleLine("来源:", source.name, 1, 0.82, 0, source.r, source.g, source.b) end
    return true
end
-- Keep native secure tooltip content alive under a hidden parent. Modifier
-- changes only reveal that content; never replay protected OnEnter/SetAction.
function View:SetSuppressed(tooltip, suppress)
    if not Adapter:IsUsable(tooltip) or not Adapter:IsHoverTooltip(tooltip) then return end
    local saved = self.parked[tooltip]
    if suppress == (saved ~= nil) then return end
    self.changingVisibility = true
    if suppress then
        if not self.hiddenHost then
            self.hiddenHost = _G.CreateFrame("Frame", nil, _G.UIParent)
            self.hiddenHost:Hide()
        end
        self.parked[tooltip] = { parent = tooltip:GetParent() }
        tooltip:SetParent(self.hiddenHost)
    else
        self.parked[tooltip] = nil
        tooltip:SetParent(saved.parent or _G.UIParent)
        tooltip:SetFrameStrata("TOOLTIP")
    end
    self.changingVisibility = nil
    if Adapter:IsMain(tooltip) then
        if suppress then self:PauseFollowing()
        elseif tooltip:IsShown() then self:StartFollowing() end
    end
end

function View:ReleaseVisibility()
    for tooltip in pairs(self.parked) do
        tooltip:Hide()
        self:SetSuppressed(tooltip, false)
    end
end

function View:PauseFollowing()
    if self.cursor then self.cursor:Hide(); self.cursor:SetScript("OnUpdate", nil) end
end

function View:StopFollowing()
    self.following = false
    if self.cursor then self.cursor:Hide(); self.cursor:SetScript("OnUpdate", nil) end
    self.lastX, self.lastY, self.lastScale = nil, nil, nil
end

function View:UpdateCursor()
    if not self.module.runtimeActive or not self.following then
        self:StopFollowing()
        return
    end
    if Adapter:InEditMode() then
        self:StopFollowing()
        local tooltip = _G.GameTooltip
        local owner = tooltip:GetOwner()
        if Adapter:IsUsable(owner) then
            tooltip:ClearAllPoints()
            _G.GameTooltip_SetDefaultAnchor(tooltip, owner)
        end
        return
    end
    local x, y = _G.GetCursorPosition()
    local scale = _G.UIParent:GetEffectiveScale()
    if scale <= 0 then return end
    if x == self.lastX and y == self.lastY and scale == self.lastScale then return end
    self.lastX, self.lastY, self.lastScale = x, y, scale
    self.cursor:ClearAllPoints()
    self.cursor:SetPoint("CENTER", _G.UIParent, "BOTTOMLEFT", x / scale, y / scale)
end

function View:Follow(tooltip)
    local profile = self.module:GetProfile()
    if not profile.follow or Adapter:InEditMode() then return end
    if not self.cursor then
        self.cursor = _G.CreateFrame("Frame", nil, _G.UIParent)
        self.cursor:SetSize(1, 1)
        self.cursor:Hide()
        self.update = function() self:UpdateCursor() end
    end
    self.following = true
    self:UpdateCursor()
    tooltip:ClearAllPoints()
    local point = profile.direction == "right" and "LEFT" or "BOTTOM"
    tooltip:SetPoint(point, self.cursor, "CENTER", profile.x, profile.y)
    if tooltip:IsShown() then self:StartFollowing() end
end

function View:StartFollowing()
    if not self.following or not self.cursor or self.parked[_G.GameTooltip] then return end
    self.cursor:Show()
    self.cursor:SetScript("OnUpdate", self.update)
    self:UpdateCursor()
end

function View:Style(tooltip)
    if not Adapter:IsUsable(tooltip) then return end
    local profile = self.module:GetProfile()
    local skin = self.skins[tooltip]
    if not skin then
        local bg = _G.CreateFrame("Frame", nil, tooltip, "BackdropTemplate")
        if type(backdropCoordinates) == "function" then bg.SetupTextureCoordinates = SafeBackdropCoordinates end
        bg:SetAllPoints(tooltip)
        bg:SetFrameLevel(math.max(0, tooltip:GetFrameLevel() - 1))
        bg:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1 })
        bg:EnableMouse(false)
        skin = { bg = bg }
        self.skins[tooltip] = skin
    end
    if not skin.owned then
        skin.owned = true
        skin.original = tooltip.NineSlice or tooltip.BackdropFrame
        if skin.original and skin.original.GetAlpha then skin.alpha = skin.original:GetAlpha() end
        if tooltip.GetBackdrop then
            skin.backdrop = tooltip:GetBackdrop()
            if skin.backdrop then
                skin.backdropColor = { tooltip:GetBackdropColor() }
                skin.borderColor = { tooltip:GetBackdropBorderColor() }
                tooltip:SetBackdrop(nil)
            end
        end
        if tooltip.IsClampedToScreen then skin.clamped = tooltip:IsClampedToScreen() end
    end
    if skin.original then skin.original:SetAlpha(0) end
    skin.bg:SetBackdropColor(0.025, 0.035, 0.03, profile.opacity)
    skin.bg:SetBackdropBorderColor(0.08, 0.1, 0.08, 1)
    skin.bg:Show()
    tooltip:SetClampedToScreen(true)
    local name = tooltip:GetName()
    local count = Adapter:Safe(tooltip:NumLines())
    if not name or type(count) ~= "number" then return end
    local path = Adapter:GetFont()
    for i = 1, count do
        for _, side in ipairs({ "Left", "Right" }) do
            local line = _G[name .. "Text" .. side .. i]
            if line then
                local saved = self.fonts[line]
                if not saved then
                    local oldPath, size, flags = line:GetFont()
                    saved = { oldPath, size, flags }
                    self.fonts[line] = saved
                end
                local size = profile.fontSize + (i == 1 and 2 or 0)
                local currentPath, currentSize, currentFlags = line:GetFont()
                if currentPath ~= path or currentSize ~= size or currentFlags ~= "OUTLINE" then
                    line:SetFont(path, size, "OUTLINE")
                    saved.path, saved.size = path, size
                end
            end
        end
    end
end

local function ColorText(text, r, g, b)
    return string.format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, text)
end

local function LevelToken(text, level, isPlayer)
    local offset = 0
    local label = _G.LEVEL
    if type(label) == "string" and label ~= "" and text:sub(1, #label) == label then
        offset = #label
    elseif not isPlayer then
        return
    end
    local first, digits, after = text:sub(offset + 1):match("^%s*()(%d+)()")
    if not digits or digits ~= tostring(level) then return end
    local tail = text:sub(offset + after)
    if tail ~= "" and not tail:match("^%s") then return end
    return offset + first, offset + after - 1
end

function View:ColorUnit(tooltip, data)
    if not self.module:GetProfile().color then return end
    local unit = Adapter:GetUnit(tooltip, data)
    if not unit then return end
    local r, g, b = Adapter:GetUnitColor(unit)
    if r and _G.GameTooltipTextLeft1 then _G.GameTooltipTextLeft1:SetTextColor(r, g, b) end
    local guild, _, _, guildRealm
    local ownGuild, ownRealm
    if _G.GetGuildInfo then
        guild, _, _, guildRealm = _G.GetGuildInfo(unit)
        ownGuild, _, _, ownRealm = _G.GetGuildInfo("player")
        guild, ownGuild = Adapter:Safe(guild), Adapter:Safe(ownGuild)
        guildRealm, ownRealm = Adapter:Safe(guildRealm), Adapter:Safe(ownRealm)
    end
    local level = Adapter:Safe(_G.UnitLevel(unit))
    local difficulty = type(level) == "number" and _G.GetCreatureDifficultyColor(level)
    local isPlayer = Adapter:Safe(_G.UnitIsPlayer(unit)) == true
    local class = isPlayer and Adapter:Safe(_G.UnitClass(unit))
    local count = Adapter:Safe(tooltip:NumLines())
    if type(count) ~= "number" then return end
    -- Ellesmere may insert a localized reaction between guild and level.
    -- Shift only for that header, never for arbitrary appended information.
    local headerOffset = 0
    if self.module.colorOnly then
        local reactionLine = _G["GameTooltipTextLeft" .. (guild and 3 or 2)]
        local reactionText = reactionLine and Adapter:Safe(reactionLine:GetText())
        if type(reactionText) == "string" then
            for reaction = 1, 8 do
                if reactionText == _G["FACTION_STANDING_LABEL" .. reaction] then
                    headerOffset = 1
                    break
                end
            end
        end
    end
    for i = 2, count do
        local line = _G["GameTooltipTextLeft" .. i]
        local text = line and Adapter:Safe(line:GetText())
        if type(text) == "string" then
            -- Match native faction labels exactly, using NDui Titan's palette.
            if self.module.colorOnly and text == "M+ Score:" then
                line:SetText("大秘境分数：")
            elseif text == _G.FACTION_HORDE then
                line:SetText("|cffff5040" .. text .. "|r")
            elseif text == _G.FACTION_ALLIANCE then
                line:SetText("|cff4080ff" .. text .. "|r")
            elseif guild and text:find(guild, 1, true) then
                if guild == ownGuild and guildRealm == ownRealm then line:SetTextColor(0.25, 1, 0.25)
                else line:SetTextColor(0.6, 0.8, 1) end
            elseif difficulty and (i == 2 + headerOffset or (i == 3 + headerOffset and guild))
                and not text:find("|c", 1, true) then
                -- Only the unit header (after the optional guild) can be a level
                -- line. Never match objective counters such as 6/6 by prefix.
                local first, last = LevelToken(text, level, isPlayer)
                if first then
                    text = text:sub(1, first - 1)
                        .. ColorText(text:sub(first, last), difficulty.r, difficulty.g, difficulty.b)
                        .. text:sub(last + 1)
                    if class and r then
                        local start, finish = text:find(class, 1, true)
                        if start then text = text:sub(1, start - 1) .. ColorText(class, r, g, b) .. text:sub(finish + 1) end
                    end
                    line:SetText(text)
                end
            end
            -- Ellesmere can put the specialization/class on a separate header
            -- line. Colour just the class token, never appended score rows.
            if self.module.colorOnly and class and r and i <= 4 + headerOffset
                and not text:find("|c", 1, true) and text:sub(-#class) == class then
                local prefix = text:sub(1, #text - #class)
                if prefix == "" or prefix:match("%s$") then
                    line:SetText(prefix .. ColorText(class, r, g, b))
                end
            end
        end
    end
end

function View:UpdateHealth()
    local tooltip, original = _G.GameTooltip, _G.GameTooltipStatusBar
    local skin = self.skins[tooltip]
    if not skin or not original or not tooltip:IsShown() then return end
    if not self.module:GetProfile().health then
        if skin.health then skin.health:Hide() end
        if skin.healthAlpha ~= nil then original:SetAlpha(skin.healthAlpha); skin.healthAlpha = nil end
        return
    end
    -- Unit loss precedes native FadeOut/OnHide. Keep the original suppressed
    -- while we own its skin; never expose the bottom bar during that interval.
    if not original:IsShown() then
        if skin.health then skin.health:Hide() end
        return
    end
    local unit = Adapter:GetUnit(tooltip)
    if not unit then return end
    if not skin.health then
        skin.health = _G.CreateFrame("StatusBar", nil, tooltip)
        skin.health:SetPoint("BOTTOMLEFT", tooltip, "TOPLEFT", 0, 4)
        skin.health:SetPoint("BOTTOMRIGHT", tooltip, "TOPRIGHT", 0, 4)
        skin.health:SetHeight(5)
        skin.health:SetStatusBarTexture("Interface\\Buttons\\WHITE8X8")
    end
    if skin.healthAlpha == nil then skin.healthAlpha = original:GetAlpha() end
    original:SetAlpha(0)
    skin.health:SetMinMaxValues(original:GetMinMaxValues())
    skin.health:SetValue(original:GetValue())
    local r, g, b = Adapter:GetUnitColor(unit)
    skin.health:SetStatusBarColor(r or 0.4, g or 0.8, b or 0.4)
    skin.health:Show()
end

function View:Restore()
    self:StopFollowing()
    self:ClearAuras()
    self:ReleaseVisibility()
    for tooltip, skin in pairs(self.skins) do
        skin.bg:Hide()
        if skin.health then skin.health:Hide() end
        if skin.healthAlpha ~= nil then
            _G.GameTooltipStatusBar:SetAlpha(skin.healthAlpha)
            skin.healthAlpha = nil
        end
        if skin.owned and Adapter:IsUsable(tooltip) then
            if skin.original and skin.original:GetAlpha() == 0 then skin.original:SetAlpha(skin.alpha or 1) end
            if skin.backdrop and not tooltip:GetBackdrop() then
                tooltip:SetBackdrop(skin.backdrop)
                tooltip:SetBackdropColor(unpack(skin.backdropColor))
                tooltip:SetBackdropBorderColor(unpack(skin.borderColor))
            end
            if skin.clamped ~= nil then tooltip:SetClampedToScreen(skin.clamped) end
            -- Text is rebuilt by the next native owner; never retain colored unit lines.
            tooltip:Hide()
        end
        skin.owned = false
    end
    for line, saved in pairs(self.fonts) do
        local path, size, flags = line:GetFont()
        if path == saved.path and size == saved.size and flags == "OUTLINE" and saved[1] then
            line:SetFont(saved[1], saved[2], saved[3])
        end
        self.fonts[line] = nil
    end
end

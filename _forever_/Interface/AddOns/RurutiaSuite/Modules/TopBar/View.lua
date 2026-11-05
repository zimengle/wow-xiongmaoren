-- Owns reusable TopBar component frames and the noninteractive hearthstone layout anchor.
local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local View = {}
View.__index = View

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return nil end
    local ok, a, b, c, d = pcall(callback, target, ...)
    if not ok then return nil end
    return a, b, c, d
end

local function Cleanup(frame, preserveSecureClick)
    Call(frame, "Hide")
    if not preserveSecureClick then Call(frame, "SetScript", "OnClick", nil) end
    Call(frame, "SetScript", "PostClick", nil)
    Call(frame, "SetScript", "OnMouseDown", nil)
    Call(frame, "SetScript", "OnMouseUp", nil)
    Call(frame, "SetScript", "OnEnter", nil)
    Call(frame, "SetScript", "OnLeave", nil)
    Call(frame, "SetScript", "OnHide", nil)
end

local function CleanupSecure(frame)
    -- OnClick belongs to SecureActionButtonTemplate. Retained secure buttons
    -- must keep that native handler across release/reacquisition.
    Cleanup(frame, true)
end

local function ResolveColor(key, fallback)
    local system = ns.UISystem or (ns.UI and ns.UI.GetSystem and ns.UI:GetSystem())
    local theme = system and system.theme
    local value = theme and theme.Get and theme:Get(key)
    if type(value) == "table" then return value end
    return fallback
end

local PixelBorder = ns.UI and ns.UI.PixelBorder

local ADDON_POPUP_LAYOUT = {
    buttonWidth = 125,
    buttonHeight = 30,
    padLeft = 7,
    padRight = 13,
    padTop = 0,
    padBottom = 1,
}

local function SetAddonPopupHover(record, shown)
    local visibilityMethod = shown and "Show" or "Hide"
    Call(record and record.hoverTexture, visibilityMethod)
    if PixelBorder and record then
        PixelBorder:Update(record.hoverBorder, record.hoverBorderColor, shown)
    end
    if record and record.text then
        if shown then
            Call(record.text, "SetTextColor", record.classR, record.classG, record.classB, 1)
        else
            Call(record.text, "SetTextColor", 1, 1, 1, 1)
        end
    end
end

local function White(text) return "|cffffffff" .. tostring(text) .. "|r" end
local function ClassColor(view, text) return view.module:ColorPlayerClassText(text) end

local function MeetingStoneTooltip(view, label)
    if view.adapter.family ~= "retail" and view.adapter.buildId ~= "classic-infinite" then
        return White("打开/关闭 ") .. ClassColor(view, label)
    end
    local text = White("左：") .. ClassColor(view, label) .. "\n" .. White("右：") .. ClassColor(view, "队伍查找器")
    if view.adapter.buildId == "classic-infinite" and type(view.adapter.HasMeetingStoneAddon) == "function"
        and not view.adapter:HasMeetingStoneAddon() then
        text = text .. "\n" .. White("未安装集结号时，左键打开队伍查找器")
    end
    return text
end

function View:New(module, adapter, data, microMenu)
    return setmetatable({
        module = module,
        adapter = adapter,
        data = data,
        microMenu = microMenu,
        records = {},
        owned = {},
        builds = 0,
        refreshes = 0,
    }, self)
end

function View:Track(frame)
    self.owned[frame] = true
    return frame
end

function View:Own(frame, label, secure)
    if self.owned[frame] then return frame end
    self.module:OwnFrame(frame, secure and CleanupSecure or Cleanup, label)
    self.owned[frame] = true
    return frame
end

function View:AcquireRecord(record, profile)
    if record.active then return true end
    self:Own(record.frame, "TopBar retained " .. record.key, record.secure)
    if record.cooldown then self:Own(record.cooldown, "TopBar retained cooldown") end
    record.active = true
    if not self:RebindRecord(record, profile) then
        self:ReleaseRecord(record)
        return false
    end
    return true
end

function View:ReleaseRecord(record)
    if not record or not record.active then return false end
    if record.cooldown then self.module:ReleaseFrame(record.cooldown) self.owned[record.cooldown] = nil end
    self.module:ReleaseFrame(record.frame)
    self.owned[record.frame] = nil
    record.active = false
    return true
end

function View:ShowTooltip(record, text)
    local tooltip = self.adapter:GetTooltip()
    if not tooltip then return false end
    Call(tooltip, "SetOwner", record.frame, "ANCHOR_BOTTOM")
    Call(tooltip, "SetText", text)
    Call(tooltip, "Show")
    return true
end

function View:HideTooltip() Call(self.adapter:GetTooltip(), "Hide") end

function View:StyleButton(record, profile)
    local frame = record.frame
    local background = ResolveColor("color.control.background", { 0, 0, 0, 0 })
    local border = ResolveColor("color.border", { 0, 0, 0, 0 })
    Call(frame, "SetBackdrop", {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        tile = true, tileSize = 16,
    })
    Call(frame, "SetBackdropColor", background[1] or 0, background[2] or 0, background[3] or 0,
        record.key == "hearthstone" and 0.5 or 0)
    Call(frame, "SetBackdropBorderColor", 0, 0, 0, 0)
    if record.key == "hearthstone" and PixelBorder then
        record.pixelBorder = record.pixelBorder or PixelBorder:Ensure(frame, frame, "OVERLAY", 6)
        PixelBorder:Update(record.pixelBorder,
            { border[1] or 0, border[2] or 0, border[3] or 0, 0.8 }, true)
    elseif record.pixelBorder and PixelBorder then
        PixelBorder:Update(record.pixelBorder, nil, false)
    end
    Call(frame, "SetAlpha", tonumber(profile.alpha) or 1)
end

function View:CreateBase(key, name, profile, secure)
    local template = secure and "SecureActionButtonTemplate,BackdropTemplate" or "BackdropTemplate"
    local frame = self:Track(self.module:CreateFrame(
        "Button", name, self.adapter:GetRootFrame(), template, secure and CleanupSecure or Cleanup, "TopBar " .. key
    ))
    local record = { key = key, frame = frame, active = true, secure = secure }
    Call(frame, "SetFrameStrata", "MEDIUM")
    Call(frame, "SetMovable", true)
    Call(frame, "SetClampedToScreen", self.adapter:ShouldClampToScreen())
    if secure then
        if not self.adapter:RegisterPrimarySecureClicks(frame) then
            self.module.secureDirty = true
            self:ReleaseRecord(record)
            return nil
        end
    else
        Call(frame, "RegisterForClicks", "AnyUp")
    end
    self.records[key] = record
    self.builds = self.builds + 1
    return record
end

function View:BindFeedback(record, profile)
    local frame = record.frame
    Call(frame, "SetScript", "OnMouseDown", function() Call(frame, "SetAlpha", 0.5) end)
    Call(frame, "SetScript", "OnMouseUp", function() Call(frame, "SetAlpha", tonumber(profile.alpha) or 1) end)
    Call(frame, "SetScript", "OnLeave", function() self:HideTooltip() end)
end

function View:CreateMeetingStone(profile)
    local record = self:CreateBase("meetingstone", "RSTopBar_MeetingStone", profile, false)
    if not record then return nil end
    record.icon = Call(record.frame, "CreateTexture", nil, "ARTWORK")
    record.text = Call(record.frame, "CreateFontString", nil, "OVERLAY")
    Call(record.icon, "SetTexture", "Interface\\AddOns\\RurutiaSuite\\Media\\Menu\\LFG")
    Call(record.icon, "SetVertexColor", 0.216, 0.816, 0.918, 1)
    Call(record.icon, "SetBlendMode", "ADD")
    Call(record.frame, "SetScript", "OnClick", function(_, mouseButton)
        local ok, message
        if (self.adapter.family == "retail" or self.adapter.buildId == "classic-infinite") and mouseButton == "RightButton" then
            ok, message = self.adapter:OpenGroupFinder()
        elseif mouseButton == "LeftButton" then
            ok, message = self.adapter:OpenMeetingStone()
        else
            return
        end
        if not ok and message then self.module:Print(message) end
    end)
    Call(record.frame, "SetScript", "OnEnter", function()
        local label = self.adapter.family == "retail" and "集合石" or "集结号"
        self:ShowTooltip(record, MeetingStoneTooltip(self, label))
    end)
    self:BindFeedback(record, profile)
    return record
end

function View:CreateHandbook(profile)
    local record = self:CreateBase("handbook", "RSTopBar_Handbook", profile, false)
    if not record then return nil end
    record.icon = Call(record.frame, "CreateTexture", nil, "ARTWORK")
    record.text = Call(record.frame, "CreateFontString", nil, "OVERLAY")
    Call(record.icon, "SetTexture", "Interface\\AddOns\\RurutiaSuite\\Media\\Menu\\collections")
    Call(record.icon, "SetVertexColor", 0.216, 0.816, 0.918, 1)
    Call(record.icon, "SetBlendMode", "ADD")
    Call(record.frame, "SetScript", "OnClick", function(_, mouseButton)
        if mouseButton == "LeftButton" then self.adapter:OpenGuide() end
    end)
    Call(record.frame, "SetScript", "OnEnter", function()
        self:ShowTooltip(record, White("打开：") .. ClassColor(self, "露露的小手册"))
    end)
    self:BindFeedback(record, profile)
    return record
end

function View:CreateHearthstone(profile)
    local record = self:CreateBase("hearthstone", "RSTopBar_Hearthstone", profile, true)
    if not record then return nil end
    record.icon = Call(record.frame, "CreateTexture", nil, "ARTWORK")
    Call(record.icon, "SetAllPoints")
    Call(record.icon, "SetTexCoord", 0.08, 0.92, 0.08, 0.92)
    Call(record.frame, "SetScript", "OnEnter", function()
        self:ShowTooltip(record, self.module:BuildHearthstoneTooltip())
    end)
    Call(record.frame, "SetScript", "PostClick", function()
        self.module:RequestCooldownRefresh(0.05)
    end)
    self:BindFeedback(record, profile)
    return record
end

function View:CreateAutoMark(profile)
    local record = self:CreateBase("automark", "RSTopBar_AutoMark", profile, true)
    if not record then return nil end
    if self.adapter.RegisterThreeButtonSecureClicks and not self.adapter:RegisterThreeButtonSecureClicks(record.frame) then return nil end
    record.icon = Call(record.frame, "CreateTexture", nil, "ARTWORK")
    Call(record.icon, "SetAllPoints")
    Call(record.icon, "SetTexture", "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2")
    Call(record.frame, "SetAttribute", "type1", "macro")
    Call(record.frame, "SetAttribute", "type2", "macro")
    Call(record.frame, "SetAttribute", "type3", "macro")
    Call(record.frame, "SetAttribute", "macrotext1", "/ram")
    Call(record.frame, "SetAttribute", "macrotext2", "/rs")
    Call(record.frame, "SetAttribute", "macrotext3", "/ramc")
    Call(record.frame, "SetScript", "OnEnter", function()
        self:ShowTooltip(record, White("自动标记") .. "\n" .. White("左键：") .. ClassColor(self, "标坦克/治疗")
            .. "\n" .. White("右键：") .. ClassColor(self, "设置") .. "\n" .. White("中键：") .. ClassColor(self, "清标"))
    end)
    Call(record.frame, "SetScript", "PostClick", function(_, mouseButton)
        if mouseButton == "RightButton" then self.adapter:ToggleAutoMarkSettings() end
    end)
    self:BindFeedback(record, profile)
    return record
end

function View:CreateRoleMarker(profile)
    local record = self:CreateBase("rolemarker", "RSTopBar_RoleMarker", profile, true)
    if not record then return nil end
    record.icon = Call(record.frame, "CreateTexture", nil, "OVERLAY")
    Call(record.icon, "SetAllPoints")
    Call(record.icon, "SetTexture", self.data.constants.roleMarkerTexture)
    self:BindFeedback(record, profile)
    self.module.fastFocusHub:Bind(record)
    return record
end

function View:CreateAddonProfile(profile)
    local record = self:CreateBase("addonprofile", "RSAddonProfileBtn", profile, false)
    if not record then return nil end
    record.text = Call(record.frame, "CreateFontString", nil, "OVERLAY")
    Call(record.text, "SetAllPoints")
    Call(record.text, "SetJustifyH", "LEFT")
    -- Bind generic feedback first: it installs its own OnLeave handler.
    self:BindFeedback(record, profile)
    Call(record.frame, "SetScript", "OnEnter", function()
        self.module:CancelRefresh("topbar-addonprofile-hide")
        self:ShowAddonProfileMenu(record)
    end)
    Call(record.frame, "SetScript", "OnLeave", function()
        self:HideTooltip()
        self:ScheduleAddonProfileMenuHide()
    end)
    return record
end

-- Runtime frame cleanup deliberately removes every script while a module is
-- disabled. Physical WoW frames cannot be destroyed, so retained records
-- rebuild their complete interaction contract when ownership returns.
function View:RebindRecord(record, profile)
    if not (record and record.frame) then return false end
    local moduleProfile = self.module:GetProfile()
    profile = profile or (moduleProfile and moduleProfile[record.key]) or { alpha = 1 }
    local frame = record.frame

    if record.secure then
        if not self.adapter:RegisterPrimarySecureClicks(frame) then
            self.module.secureDirty = true
            return false
        end
    else
        Call(frame, "RegisterForClicks", "AnyUp")
    end

    if record.key == "meetingstone" then
        Call(frame, "SetScript", "OnClick", function(_, mouseButton)
            local ok, message
            if (self.adapter.family == "retail" or self.adapter.buildId == "classic-infinite") and mouseButton == "RightButton" then
                ok, message = self.adapter:OpenGroupFinder()
            elseif mouseButton == "LeftButton" then
                ok, message = self.adapter:OpenMeetingStone()
            else
                return
            end
            if not ok and message then self.module:Print(message) end
        end)
        Call(frame, "SetScript", "OnEnter", function()
            local label = self.adapter.family == "retail" and "集合石" or "集结号"
            self:ShowTooltip(record, MeetingStoneTooltip(self, label))
        end)
    elseif record.key == "handbook" then
        Call(frame, "SetScript", "OnClick", function(_, mouseButton)
            if mouseButton == "LeftButton" then self.adapter:OpenGuide() end
        end)
        Call(frame, "SetScript", "OnEnter", function()
            self:ShowTooltip(record, White("打开：") .. ClassColor(self, "露露的小手册"))
        end)
    elseif record.key == "hearthstone" then
        Call(frame, "SetScript", "OnEnter", function()
            self:ShowTooltip(record, self.module:BuildHearthstoneTooltip())
        end)
        Call(frame, "SetScript", "PostClick", function()
            self.module:RequestCooldownRefresh(0.05)
        end)
    elseif record.key == "automark" then
        if self.adapter.RegisterThreeButtonSecureClicks
            and not self.adapter:RegisterThreeButtonSecureClicks(frame) then
            self.module.secureDirty = true
            return false
        end
        Call(frame, "SetAttribute", "type1", "macro")
        Call(frame, "SetAttribute", "type2", "macro")
        Call(frame, "SetAttribute", "type3", "macro")
        Call(frame, "SetAttribute", "macrotext1", "/ram")
        Call(frame, "SetAttribute", "macrotext2", "/rs")
        Call(frame, "SetAttribute", "macrotext3", "/ramc")
        Call(frame, "SetScript", "OnEnter", function()
            self:ShowTooltip(record, White("自动标记") .. "\n" .. White("左键：") .. ClassColor(self, "标坦克/治疗")
                .. "\n" .. White("右键：") .. ClassColor(self, "设置") .. "\n" .. White("中键：") .. ClassColor(self, "清标"))
        end)
        Call(frame, "SetScript", "PostClick", function(_, mouseButton)
            if mouseButton == "RightButton" then self.adapter:ToggleAutoMarkSettings() end
        end)
    elseif record.key == "rolemarker" then
        self:BindFeedback(record, profile)
        self.module.fastFocusHub:Bind(record)
        return true
    elseif record.key == "addonprofile" then
        self:BindFeedback(record, profile)
        Call(frame, "SetScript", "OnEnter", function()
            self.module:CancelRefresh("topbar-addonprofile-hide")
            self:ShowAddonProfileMenu(record)
        end)
        Call(frame, "SetScript", "OnLeave", function()
            self:HideTooltip()
            self:ScheduleAddonProfileMenuHide()
        end)
        return true
    end

    self:BindFeedback(record, profile)
    return true
end

function View:EnsureAddonPopupRecord(index, popup)
    self.addonPopupRecords = self.addonPopupRecords or {}
    local record = self.addonPopupRecords[index]
    if record then
        self:Own(record.frame, "TopBar retained addon profile menu item")
        return record
    end
    local frame = self:Track(self.module:CreateFrame(
        "Button", nil, popup, nil, Cleanup, "TopBar addon profile menu item " .. index
    ))
    local layout = ADDON_POPUP_LAYOUT
    local hover = Call(frame, "CreateTexture", nil, "BACKGROUND")
    Call(hover, "SetPoint", "TOPLEFT", frame, "TOPLEFT", -layout.padLeft, 0)
    Call(hover, "SetPoint", "BOTTOMRIGHT", frame, "BOTTOMRIGHT", layout.padRight, 0)

    record = {
        frame = frame,
        text = Call(frame, "CreateFontString", nil, "OVERLAY"),
        hoverTexture = hover,
        hoverBorder = PixelBorder and PixelBorder:Ensure(frame, hover, "BORDER") or {},
    }
    Call(record.text, "SetPoint", "LEFT", frame, "LEFT", 0, 0)
    Call(record.text, "SetTextColor", 1, 1, 1, 1)
    self.adapter:ApplyFont(record.text, self.adapter:GetFontPath("interface"), 19, "OUTLINE")
    SetAddonPopupHover(record, false)
    self.addonPopupRecords[index] = record
    return record
end

function View:EnsureAddonPopup(anchor)
    if self.addonPopup then
        self:Own(self.addonPopup, "TopBar retained addon profile popup")
        Call(self.addonPopup, "SetScript", "OnEnter", function() self.module:CancelRefresh("topbar-addonprofile-hide") end)
        Call(self.addonPopup, "SetScript", "OnLeave", function() self:ScheduleAddonProfileMenuHide() end)
        return self.addonPopup
    end
    self.addonPopup = self:Track(self.module:CreateFrame(
        "Frame", "RSAddonProfilePopup", self.adapter:GetRootFrame(), "BackdropTemplate",
        Cleanup, "TopBar addon profile popup"
    ))
    Call(self.addonPopup, "SetFrameStrata", "DIALOG")
    Call(self.addonPopup, "SetBackdrop", { bgFile = "Interface\\Buttons\\WHITE8X8" })
    Call(self.addonPopup, "SetBackdropColor", 0, 0, 0, 0.6)
    Call(self.addonPopup, "SetScript", "OnEnter", function() self.module:CancelRefresh("topbar-addonprofile-hide") end)
    Call(self.addonPopup, "SetScript", "OnLeave", function() self:ScheduleAddonProfileMenuHide() end)
    return self.addonPopup
end

function View:ShowAddonProfileMenu(anchorRecord)
    if self.adapter:IsInCombat() then self.module.secureDirty = true return false end
    local items = self.module:GetAddonProfileMenuItems()
    if type(items) ~= "table" or #items == 0 then return false end
    local layout = ADDON_POPUP_LAYOUT
    local popup = self:EnsureAddonPopup(anchorRecord.frame)
    Call(popup, "SetSize",
        layout.buttonWidth + layout.padLeft + layout.padRight,
        #items * layout.buttonHeight + layout.padTop + layout.padBottom
    )
    Call(popup, "ClearAllPoints")
    Call(popup, "SetPoint", "TOPLEFT", anchorRecord.frame, "BOTTOMLEFT", -6, -4)
    local r, g, b = self.microMenu:GetClassColor()
    local index
    for index = 1, #items do
        local item = items[index]
        local record = self:EnsureAddonPopupRecord(index, popup)
        record.classR, record.classG, record.classB = r, g, b
        Call(record.frame, "SetSize", layout.buttonWidth, layout.buttonHeight)
        Call(record.frame, "ClearAllPoints")
        Call(record.frame, "SetPoint", "TOPLEFT", popup, "TOPLEFT",
            layout.padLeft, -layout.padTop - (index - 1) * layout.buttonHeight)
        Call(record.hoverTexture, "SetColorTexture", r, g, b, 0.2)
        record.hoverBorderColor = record.hoverBorderColor or {}
        record.hoverBorderColor[1], record.hoverBorderColor[2] = r, g
        record.hoverBorderColor[3], record.hoverBorderColor[4] = b, 1
        SetAddonPopupHover(record, false)
        self.adapter:ApplyFont(record.text, self.adapter:GetFontPath("interface"), 19, "OUTLINE")
        Call(record.text, "SetText", item.label)
        Call(record.frame, "SetScript", "OnEnter", function()
            self.module:CancelRefresh("topbar-addonprofile-hide")
            SetAddonPopupHover(record, true)
        end)
        Call(record.frame, "SetScript", "OnLeave", function()
            SetAddonPopupHover(record, false)
            self:ScheduleAddonProfileMenuHide()
        end)
        Call(record.frame, "SetScript", "OnClick", function()
            Call(popup, "Hide")
            self.module:ApplyAddonProfile(item.id, anchorRecord.frame)
        end)
        Call(record.frame, "Show")
    end
    if self.addonPopupRecords then
        for index = #items + 1, #self.addonPopupRecords do Call(self.addonPopupRecords[index].frame, "Hide") end
    end
    Call(popup, "Show")
    return true
end

function View:ScheduleAddonProfileMenuHide()
    local view = self
    self.module:RequestRefresh("topbar-addonprofile-hide", function() view:HideAddonProfileMenu() end, 0.2)
end

function View:HideAddonProfileMenu()
    Call(self.addonPopup, "Hide")
    return true
end

function View:Ensure(key, profile)
    local record = self.records[key]
    if record then
        if not self:AcquireRecord(record, profile) then return nil end
        return record
    end
    if self.adapter:IsInCombat() then self.module.secureDirty = true return nil end
    if key == "meetingstone" then return self:CreateMeetingStone(profile) end
    if key == "handbook" then return self:CreateHandbook(profile) end
    if key == "hearthstone" then return self:CreateHearthstone(profile) end
    if key == "automark" then return self:CreateAutoMark(profile) end
    if key == "rolemarker" then return self:CreateRoleMarker(profile) end
    if key == "addonprofile" then return self:CreateAddonProfile(profile) end
    return nil
end

function View:ApplyPosition(record, position)
    if not (record and position) then return false end
    Call(record.frame, "ClearAllPoints")
    Call(record.frame, "SetPoint", position.point, self.adapter:GetRootFrame(), position.relativePoint, position.x, position.y)
    return true
end

function View:RefreshQuick(key, profile, default)
    local record = self:Ensure(key, profile)
    if not record then return false end
    Call(record.frame, "SetSize", tonumber(profile.width) or default.width, tonumber(profile.height) or default.height)
    self:StyleButton(record, profile)
    if record.icon and (key == "meetingstone" or key == "handbook") then
        Call(record.icon, "SetSize", tonumber(profile.iconWidth) or 33, tonumber(profile.iconHeight) or 34)
        Call(record.icon, "ClearAllPoints")
        Call(record.icon, "SetPoint", "LEFT", record.frame, "LEFT", -4, 0)
    end
    if record.text then
        Call(record.text, "ClearAllPoints")
        Call(record.text, "SetPoint", profile.textPoint or "CENTER", record.frame,
            profile.textRelativePoint or "CENTER", tonumber(profile.textOffsetX) or 6, tonumber(profile.textOffsetY) or 0)
        if profile.textWidth then Call(record.text, "SetWidth", tonumber(profile.textWidth) or 64) end
        Call(record.text, "SetJustifyH", profile.textJustify or "CENTER")
        self.adapter:ApplyFont(record.text, self.adapter:GetFontPath("interface"), tonumber(profile.fontSize) or 18, "OUTLINE")
        Call(record.text, "SetText", key == "meetingstone" and (self.adapter.family == "retail" and "集合石" or "集结号") or "手册")
        Call(record.text, "SetTextColor", 1, 1, 1, 1)
    end
    self:ApplyPosition(record, self.data:CopyPosition(profile.position, default.position))
    Call(record.frame, "Show")
    self.refreshes = self.refreshes + 1
    return true
end

function View:ShowComponent(key, visible, profile, default)
    if key == "micromenu" then
        if visible then return self.microMenu:Refresh(self.module:GetProfile()) end
        self.microMenu:Hide()
        self.microMenu:ReleaseOwnership()
        return true
    end
    local record = self.records[key]
    if not visible then
        if key == "rolemarker" then self.module.fastFocusHub:HideMenu("owner-hidden") end
        if record then Call(record.frame, "Hide") self:ReleaseRecord(record) end
        return true
    end
    if key == "rolemarker" then
        record = self:Ensure(key, { alpha = 1 })
        if not record then return false end
        Call(record.frame, "SetSize", 20, 20)
        local anchor = self:GetHearthstoneAnchor()
        Call(record.frame, "ClearAllPoints")
        Call(record.frame, "SetPoint", "LEFT", anchor, "RIGHT", 9, 0)
        self.module.fastFocusHub:Refresh()
        Call(record.frame, "Show")
        return true
    end
    if key == "addonprofile" then
        record = self:Ensure(key, { alpha = 1 })
        if not record then return false end
        Call(record.frame, "SetSize", 90, 20)
        local data = self.module:GetAddonProfileViewData()
        local position = data.position or { point = "TOP", relativePoint = "TOP", x = -470, y = -2 }
        self:ApplyPosition(record, self.data:CopyPosition(position, position))
        Call(record.text, "SetText", data.label or "自定义")
        self.adapter:ApplyFont(record.text, self.adapter:GetFontPath("interface"), 18, "OUTLINE")
        Call(record.frame, "Show")
        return true
    end
    return self:RefreshQuick(key, profile, default)
end

function View:GetHearthstoneAnchor()
    local hearth = self.records.hearthstone
    if hearth and hearth.active then return hearth.frame end
    local anchor = self.hearthstoneAnchor
    if not anchor then
        anchor = self.module:CreateFrame("Frame", nil, self.adapter:GetRootFrame(), nil,
            Cleanup, "TopBar hearthstone layout anchor")
        self.hearthstoneAnchor = anchor
        self:Track(anchor)
    else
        self:Own(anchor, "TopBar hearthstone layout anchor")
    end
    local default = self.module.db.defaults.profile.hearthstone
    local profile = self.module:GetProfile().hearthstone
    local fallback = default.position
    local position = type(profile.position) == "table" and profile.position or fallback
    Call(anchor, "SetSize", tonumber(profile.width) or default.width, tonumber(profile.height) or default.height)
    Call(anchor, "ClearAllPoints")
    Call(anchor, "SetPoint", position.point or fallback.point or "CENTER", self.adapter:GetRootFrame(),
        position.relativePoint or fallback.relativePoint or "CENTER",
        tonumber(position.x) or tonumber(fallback.x) or 0, tonumber(position.y) or tonumber(fallback.y) or 0)
    Call(anchor, "Hide")
    return anchor
end

function View:UpdateCooldown(start, duration, icon)
    local record = self.records.hearthstone
    if not record then return false end
    if record.icon and icon then Call(record.icon, "SetTexture", icon) end
    record.cooldownStart = tonumber(start) or 0
    record.cooldownDuration = tonumber(duration) or 0
    -- Cooldown is reported in the tooltip. A retained spinner from an older
    -- runtime is cleared and hidden instead of being recreated.
    if record.cooldown then Call(record.cooldown, "Clear") Call(record.cooldown, "Hide") end
    return true
end

function View:GetMovableFrames()
    local frames = {}
    local key
    local record
    for key, record in pairs(self.records) do if record.active then frames[key] = record.frame end end
    if self.microMenu.active and self.microMenu.frame then frames.micromenu = self.microMenu.frame end
    return frames
end

function View:HideAll()
    self.module.fastFocusHub:HideMenu("owner-hidden")
    local _, record
    for _, record in pairs(self.records) do Call(record.frame, "Hide") end
    self.microMenu:Hide()
end

function View:ReleaseOwnership()
    local _, record
    for _, record in pairs(self.records) do
        if record.active then self:ReleaseRecord(record) end
    end
    self.microMenu:ReleaseOwnership()
    local frame
    for frame in pairs(self.owned) do self.module:ReleaseFrame(frame) end
    self.owned = {}
end

function View:RefreshTheme()
    local key
    local record
    for key, record in pairs(self.records) do
        if record.active then
            local profile = self.module:GetProfile()[key] or { alpha = 1 }
            self:StyleButton(record, profile)
        end
    end
    if self.microMenu.active then self.microMenu:Refresh(self.module:GetProfile()) end
    return true
end

function View:GetDiagnostics()
    local retained = 0
    local active = 0
    local _, record
    for _, record in pairs(self.records) do retained = retained + 1 if record.active then active = active + 1 end end
    return { retained = retained, active = active, builds = self.builds, refreshes = self.refreshes, microMenu = self.microMenu:GetDiagnostics() }
end

ns.TopBarViewClass = View

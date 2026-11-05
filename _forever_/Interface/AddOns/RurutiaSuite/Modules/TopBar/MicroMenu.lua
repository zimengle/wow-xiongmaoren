local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local MicroMenu = {}
MicroMenu.__index = MicroMenu

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return nil end
    local ok, a, b, c, d = pcall(callback, target, ...)
    if not ok then return nil end
    return a, b, c, d
end

local function Cleanup(frame)
    Call(frame, "Hide")
    Call(frame, "UnregisterEvent", "UPDATE_INSTANCE_INFO")
    Call(frame, "SetScript", "OnMouseDown", nil)
    Call(frame, "SetScript", "OnMouseUp", nil)
    Call(frame, "SetScript", "OnEnter", nil)
    Call(frame, "SetScript", "OnLeave", nil)
    Call(frame, "SetScript", "OnEvent", nil)
    Call(frame, "SetScript", "OnHide", nil)
    Call(frame, "SetScript", "OnUpdate", nil)
end

local function TexturePath(name)
    return "Interface\\AddOns\\RurutiaSuite\\Media\\Menu\\" .. tostring(name)
end

function MicroMenu:New(module, adapter, data)
    return setmetatable({
        module = module,
        adapter = adapter,
        data = data,
        frame = nil,
        records = {},
        owned = {},
        active = false,
        builds = 0,
        refreshes = 0,
    }, self)
end

function MicroMenu:Own(frame, label)
    if self.owned[frame] then return frame end
    self.module:OwnFrame(frame, function(owned) self:CleanupFrame(owned) end, label)
    self.owned[frame] = true
    return frame
end

function MicroMenu:TrackCreated(frame)
    self.owned[frame] = true
    return frame
end

function MicroMenu:RecordSecureAvailability(record)
    -- Optional adapter capability: only flavors whose secure click depends on a native
    -- target expose it (the classic family does).
    local callback = self.adapter and self.adapter.RecordSecureAvailability
    if type(callback) ~= "function" then return nil end
    return callback(self.adapter, record.frame, record.item)
end

function MicroMenu:AcquireOwnership()
    if self.active then return true end
    if self.adapter:IsInCombat() then
        self.module.secureDirty = true
        return false
    end
    if self.frame then self:Own(self.frame, "TopBar retained micro menu") end
    local _, record
    for _, record in pairs(self.records) do
        self:Own(record.frame, "TopBar retained menu item")
        self:RecordSecureAvailability(record)
        if not self.adapter:RegisterSecureClicks(record.frame, record.item) then
            self.module.secureDirty = true
            self:ReleaseOwnership()
            return false
        end
        self:BindRecord(record)
    end
    self.active = self.frame ~= nil
    return self.active
end

function MicroMenu:SyncSecureAvailability()
    if type(self.adapter.RecordSecureAvailability) ~= "function" then return false end
    local record
    for _, record in pairs(self.records) do
        if record.item.secureClick and self.active and not self.adapter:IsInCombat() then
            -- The native target can appear later than the menu itself (or disappear from
            -- under it), so re-apply the secure registration either way: the adapter
            -- installs the macro when the target exists and drops it when it does not,
            -- instead of leaving a silently inert button.
            self.adapter:RegisterSecureClicks(record.frame, record.item)
        end
    end
    return true
end

function MicroMenu:ReleaseOwnership()
    local frame
    for frame in pairs(self.owned) do self.module:ReleaseFrame(frame) end
    self.owned = {}
    self.active = false
end

function MicroMenu:GetClassColor()
    local profile = self.module:GetProfile()
    local menu = profile and profile.micromenu
    if menu and menu.useClassColor == false then return 1, 1, 1 end
    return self.adapter:GetPlayerClassColor()
end

function MicroMenu:GetClassColorCode()
    local r, g, b = self:GetClassColor()
    return string.format("|cFF%02x%02x%02x", math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5), math.floor(b * 255 + 0.5))
end

function MicroMenu:ShowTooltip(record)
    local tooltip = self.adapter:GetTooltip()
    if not tooltip then return false end
    if record.item.key == "main" and type(_G.MainMenuBarPerformanceBarFrame_OnEnter) == "function" then
        local native = _G.MainMenuMicroButton
        record.frame.tooltipText = type(_G.MicroButtonTooltipText) == "function"
            and _G.MicroButtonTooltipText(_G.MAINMENU_BUTTON or "游戏菜单", "TOGGLEGAMEMENU")
            or self.adapter:GetMenuTooltip(record.item)
        record.frame.newbieText = native and native.newbieText
        local ok = pcall(_G.MainMenuBarPerformanceBarFrame_OnEnter, record.frame)
        if ok then
            -- The native builder uses the screen's default tooltip anchor.
            -- Reposition without SetOwner, which would clear its populated lines.
            tooltip.default = nil
            Call(tooltip, "SetAnchorType", "ANCHOR_NONE")
            Call(tooltip, "ClearAllPoints")
            Call(tooltip, "SetPoint", "BOTTOM", record.frame, "TOP", 0, 1)
            if record.item.tooltipNote then
                Call(tooltip, "AddLine", record.item.tooltipNote, 1, 1, 1, true)
            end
            Call(tooltip, "Show")
            return true
        end
    end
    local text = self.adapter:GetMenuTooltip(record.item)
    local native = record.item.tooltipButton and _G[record.item.tooltipButton]
    if native then text = native.tooltipText or text end
    if not text or text == "" then return false end
    Call(tooltip, "SetOwner", record.frame, "ANCHOR_TOP", 0, 1)
    Call(tooltip, "SetText", text)
    if record.item.tooltipNote then
        Call(tooltip, "AddLine", record.item.tooltipNote, 1, 1, 1, true)
    end
    if native and native.disabledTooltip then
        Call(tooltip, "AddLine", native.disabledTooltip, 1, 0.2, 0.2, true)
    end
    Call(tooltip, "Show")
    return true
end

function MicroMenu:HideTooltip()
    Call(self.adapter:GetTooltip(), "Hide")
end

function MicroMenu:CleanupFrame(frame)
    if type(self.adapter.UnregisterMenuClicks) == "function" then
        self.adapter:UnregisterMenuClicks(frame)
    end
    Cleanup(frame)
end

function MicroMenu:BuildTimeTooltip(owner)
    if not owner then return false end
    local tooltip = self.adapter:GetTooltip()
    local data = self.adapter:GetTimeTooltipData()
    if not (tooltip and type(data) == "table") then return false end
    local r, g, b = self:GetClassColor()
    Call(tooltip, "SetOwner", owner, "ANCHOR_TOP", 0, 1)
    Call(tooltip, "ClearLines")
    Call(tooltip, "AddLine", data.dateText or "", r, g, b)
    Call(tooltip, "AddLine", " ")
    Call(tooltip, "AddDoubleLine", "本地时间", data.localTime or "--:--", r, g, b, 1, 1, 1)
    Call(tooltip, "AddDoubleLine", "服务器时间", data.realmTime or "--:--", r, g, b, 1, 1, 1)
    if data.blocked then
        Call(tooltip, "AddLine", " ")
        Call(tooltip, "AddLine", "当前战斗环境暂不读取副本进度", 0.6, 0.6, 0.6)
    else
        local section
        local index
        for index = 1, #(data.entries or {}) do
            local entry = data.entries[index]
            if entry.section ~= section then
                section = entry.section
                Call(tooltip, "AddLine", " ")
                Call(tooltip, "AddLine", section, r, g, b)
            end
            Call(tooltip, "AddDoubleLine", entry.name, entry.detail or "", 1, 1, 1, 1, 1, 1)
        end
        if #(data.entries or {}) == 0 then
            Call(tooltip, "AddLine", " ")
            Call(tooltip, "AddLine", "本周暂无已保存副本", 0.6, 0.6, 0.6)
        end
    end
    if data.weeklyReset and data.weeklyReset ~= "" then
        Call(tooltip, "AddDoubleLine", "周重置", data.weeklyReset, r, g, b, 1, 1, 1)
    end
    Call(tooltip, "AddLine", " ")
    Call(tooltip, "AddDoubleLine", "左键", "打开日历", 1, 1, 1, r, g, b)
    Call(tooltip, "AddDoubleLine", "中键", "打开宏伟宝库", 1, 1, 1, r, g, b)
    Call(tooltip, "AddDoubleLine", "右键", "打开闹钟", 1, 1, 1, r, g, b)
    Call(tooltip, "Show")
    return true
end

function MicroMenu:RefreshTimeTooltip()
    if type(self.adapter.GetTimeTooltipData) ~= "function" then return false end
    local owner = self.timeTooltipOwner
    if not owner or not Call(owner, "IsShown") or not Call(owner, "IsMouseOver") then return false end
    return self:BuildTimeTooltip(owner)
end

function MicroMenu:ShowTimeTooltip(owner)
    if not owner then return false end
    if type(self.adapter.GetTimeTooltipData) ~= "function"
        or type(self.adapter.IsTimeTooltipReadBlocked) ~= "function"
        or type(self.adapter.RequestTimeTooltipInfo) ~= "function" then
        return false
    end
    self.timeTooltipOwner = owner
    Call(owner, "RegisterEvent", "UPDATE_INSTANCE_INFO")
    if not self.adapter:IsTimeTooltipReadBlocked() then
        local now = self.adapter:GetTime()
        if not self.raidInfoRequestedAt or now - self.raidInfoRequestedAt >= 10 then
            self.raidInfoRequestedAt = now
            self.adapter:RequestTimeTooltipInfo()
        end
    end
    return self:BuildTimeTooltip(owner)
end

function MicroMenu:HideTimeTooltip(owner)
    if owner then Call(owner, "UnregisterEvent", "UPDATE_INSTANCE_INFO") end
    if self.timeTooltipOwner == owner then self.timeTooltipOwner = nil end
    local tooltip = self.adapter:GetTooltip()
    local tooltipOwner = Call(tooltip, "GetOwner")
    if tooltipOwner == nil or tooltipOwner == owner then Call(tooltip, "Hide") end
    return true
end

function MicroMenu:SetHovered(record, hovered)
    local size = record.iconSize or 30
    local scale = hovered and self.data.constants.hoverScale or 1
    if record.icon then
        Call(record.icon, "ClearAllPoints")
        Call(record.icon, "SetPoint", "CENTER", record.frame, "CENTER", 0, 0)
        Call(record.icon, "SetSize", size * scale, size * scale)
    end
    if record.highlight then
        Call(record.highlight, "ClearAllPoints")
        Call(record.highlight, "SetPoint", "CENTER", record.frame, "CENTER", 0, 0)
        Call(record.highlight, "SetSize", size * scale, size * scale)
        if hovered then Call(record.highlight, "Show") else Call(record.highlight, "Hide") end
    end
end

function MicroMenu:BindRecord(record)
    local frame = record.frame
    Call(frame, "SetScript", "OnMouseDown", function()
        Call(frame, "SetAlpha", 0.5)
        self.adapter:PrepareMenuItem(record.item)
    end)
    Call(frame, "SetScript", "OnMouseUp", function(_, mouseButton)
        local profile = self.module:GetProfile()
        Call(frame, "SetAlpha", profile and profile.micromenu.alpha or 1)
        if record.item.combatLocked and self.adapter:IsInCombat() then
            self.module:WarnCombatLocked("战斗中无法打开该面板")
            return false
        end
        if record.item.secureClick and type(self.adapter.IsItemUnavailable) == "function"
            and self.adapter:IsItemUnavailable(record.item) then
            -- No ordinary Lua window opening as a fallback: say it is unavailable instead.
            local label = self.adapter:GetMenuTooltip(record.item) or "面板"
            self.module:Print(label .. "按钮不可用，暂时无法通过插件按钮打开，请按快捷键打开。")
            return false
        end
        if not record.item.nativeMacroButton and not record.item.nativeButton and not (mouseButton == "RightButton" and record.item.rightNativeButton)
            and not record.item.secureClick then
            local ok, message, reason = self.adapter:RunMenuAction(record.item, mouseButton)
            if message then
                if reason == "combat-lockdown" then self.module:WarnCombatLocked(message)
                else self.module:Print(message) end
            end
            return ok
        end
    end)
    Call(frame, "SetScript", "OnEnter", function()
        if record.item.isTime and type(self.adapter.GetTimeTooltipData) == "function" then
            self:ShowTimeTooltip(frame)
        else
            self:ShowTooltip(record)
        end
        if record.item.key == "main" then
            local elapsedSinceUpdate = 0
            Call(frame, "SetScript", "OnUpdate", function(_, elapsed)
                elapsedSinceUpdate = elapsedSinceUpdate + elapsed
                if elapsedSinceUpdate < (_G.PERFORMANCE_BAR_UPDATE_INTERVAL or 1) then return end
                elapsedSinceUpdate = 0
                if Call(self.adapter:GetTooltip(), "GetOwner") == frame then self:ShowTooltip(record) end
            end)
        end
        self:SetHovered(record, true)
    end)
    Call(frame, "SetScript", "OnLeave", function()
        Call(frame, "SetScript", "OnUpdate", nil)
        if record.item.isTime and type(self.adapter.GetTimeTooltipData) == "function" then
            self:HideTimeTooltip(frame)
        else
            self:HideTooltip()
        end
        self:SetHovered(record, false)
    end)
    if record.item.key == "main" then
        Call(frame, "SetScript", "OnHide", function()
            Call(frame, "SetScript", "OnUpdate", nil)
            if Call(self.adapter:GetTooltip(), "GetOwner") == frame then self:HideTooltip() end
        end)
    end
    if record.item.isTime then
        Call(frame, "SetScript", "OnEvent", function(_, event)
            if event == "UPDATE_INSTANCE_INFO" and self.timeTooltipOwner == frame then
                self:RefreshTimeTooltip()
            end
        end)
        Call(frame, "SetScript", "OnHide", function() self:HideTimeTooltip(frame) end)
    end
end

function MicroMenu:CreateRecord(item)
    local secure = item.nativeButton or item.rightNativeButton or item.nativeMacroButton or item.secureClick
    local template = secure and "SecureActionButtonTemplate,BackdropTemplate" or "BackdropTemplate"
    if item.combatLocked then template = template .. ",SecureHandlerStateTemplate" end
    local frame = self:TrackCreated(self.module:CreateFrame(
        "Button", "RSTopBar_MicroMenu_" .. item.key, self.frame, template,
        function(owned) self:CleanupFrame(owned) end, "TopBar menu item " .. item.key
    ))
    local record = { frame = frame, item = item }
    if item.isTime then
        record.text = Call(frame, "CreateFontString", nil, "OVERLAY")
        Call(record.text, "SetAllPoints")
        Call(record.text, "SetJustifyH", "CENTER")
        Call(record.text, "SetJustifyV", "MIDDLE")
        Call(record.text, "SetTextColor", 1, 1, 1, 1)
    else
        record.icon = Call(frame, "CreateTexture", nil, "ARTWORK")
        record.highlight = Call(frame, "CreateTexture", nil, "ARTWORK")
        Call(record.icon, "SetTexture", TexturePath(item.texture))
        Call(record.highlight, "SetTexture", TexturePath(item.texture))
        Call(record.highlight, "SetBlendMode", "ADD")
        Call(record.highlight, "Hide")
    end
    -- Retain failed records too, so a retry reuses their named frames.
    self.records[item.key] = record
    if secure and not self.adapter:RegisterSecureClicks(frame, item) then
        self.module.secureDirty = true
        return nil
    end
    self:BindRecord(record)
    return record
end

function MicroMenu:Ensure()
    if self.adapter:IsInCombat() then self.module.secureDirty = true return nil, "combat lockdown" end
    if self.frame then
        if not self:AcquireOwnership() then return nil, "secure item unavailable" end
    else
        local root = self.adapter:GetRootFrame()
        if not root then return nil, "root frame unavailable" end
        self.frame = self:TrackCreated(self.module:CreateFrame(
            "Frame", "RSTopBar_MicroMenu", root, "BackdropTemplate", Cleanup, "TopBar micro menu"
        ))
        Call(self.frame, "SetFrameStrata", "MEDIUM")
        Call(self.frame, "SetMovable", true)
        Call(self.frame, "SetClampedToScreen", self.adapter:ShouldClampToScreen())
        self.builds = self.builds + 1
    end
    local items = self.data:GetMenuItems(self.adapter.family, self.adapter.buildId)
    local index
    for index = 1, #items do
        local item = items[index]
        if not self.records[item.key] and not self:CreateRecord(item) then
            self:ReleaseOwnership()
            return nil, "secure item unavailable"
        end
    end
    self:SyncSecureAvailability()
    self.active = true
    return self.frame
end

function MicroMenu:ApplyPosition(position)
    if not self.frame then return false end
    Call(self.frame, "ClearAllPoints")
    Call(self.frame, "SetPoint", position.point, self.adapter:GetRootFrame(), position.relativePoint, position.x, position.y)
    return true
end

function MicroMenu:Refresh(profile)
    local frame = self:Ensure()
    if not frame then return false end
    local menu = profile.micromenu
    local sourceItems = self.data:GetMenuItems(self.adapter.family, self.adapter.buildId)
    local items = {}
    local index
    for index = 1, #sourceItems do
        local item = sourceItems[index]
        local hiddenStore = item.key == "store" and self.adapter.SupportsStoreVisibility
            and self.adapter:SupportsStoreVisibility() and menu.showStore ~= true
        if not hiddenStore and (item.key ~= "lfg" or self.adapter.family ~= "retail" or menu.showGroupFinder == true) then
            items[#items + 1] = item
        end
    end
    local layout = self.data:BuildMenuLayout(items, menu.size, menu.spacing)
    local height = math.max(1, (tonumber(menu.size) or 30) - self.data.constants.frameHeightTrim)
    Call(frame, "SetSize", layout.width, height)
    Call(frame, "SetAlpha", tonumber(menu.alpha) or 1)
    local r, g, b = self:GetClassColor()
    local _, record
    for _, record in pairs(self.records) do Call(record.frame, "Hide") end
    for index = 1, #items do
        local item = items[index]
        record = self.records[item.key]
        if record then
            record.iconSize = tonumber(menu.size) or 30
            Call(record.frame, "ClearAllPoints")
            Call(record.frame, "SetPoint", "LEFT", frame, "LEFT", layout.positions[item.key], 0)
            Call(record.frame, "SetSize", item.isTime and self.data.constants.timeWidth or record.iconSize, record.iconSize)
            Call(record.frame, "SetAlpha", tonumber(menu.alpha) or 1)
            if record.icon then Call(record.icon, "SetVertexColor", r, g, b, 1) end
            if record.highlight then Call(record.highlight, "SetVertexColor", r, g, b, 1) end
            self:SetHovered(record, false)
            Call(record.frame, "Show")
        end
    end
    local default = self.data:GetDefaults(self.adapter.family).profile.micromenu.position
    self:ApplyPosition(self.data:CopyPosition(menu.position, default))
    self:UpdateTime()
    Call(frame, "Show")
    self.refreshes = self.refreshes + 1
    return true
end

function MicroMenu:UpdateTime()
    local record = self.records.time
    if not (record and record.text) then return false end
    local value = type(_G.date) == "function" and _G.date("%H:%M") or ""
    local hour, minute = string.match(value, "^(%d%d):(%d%d)$")
    local profile = self.module:GetProfile()
    if hour and profile and profile.micromenu.useClassColor ~= false then
        value = hour .. self:GetClassColorCode() .. ":|r" .. minute
    end
    self.adapter:ApplyFont(record.text, self.adapter:GetFontPath("time"),
        self.data.constants.timeFontSize, self.data.constants.timeFontFlags)
    Call(record.text, "SetText", value)
    return true
end

function MicroMenu:Hide()
    Call(self.frame, "Hide")
    return self.frame ~= nil
end

function MicroMenu:GetDiagnostics()
    local count = 0
    for _ in pairs(self.records) do count = count + 1 end
    return { built = self.frame ~= nil, active = self.active, itemCount = count, builds = self.builds, refreshes = self.refreshes }
end

ns.TopBarMicroMenuClass = MicroMenu

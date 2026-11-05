local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

-- Build capabilities are fixed before module files load. Without either feature,
-- keep Core/View's lifecycle contract but do not retain the Retail menu closures.
-- A saved disable switch is deliberately not used here: supported features may
-- be enabled later in the same session.
if not ns.Build.HasModule("FastFocus") and not ns.Build.HasModule("RoleMarker") then
    local Hub = {}
    Hub.__index = Hub
    function Hub:New(module, adapter, data)
        return setmetatable({ module = module, adapter = adapter, data = data }, self)
    end
    local function Unavailable() return false end
    local function Noop() end
    Hub.IsButtonVisible = Unavailable
    Hub.Bind = Unavailable
    Hub.HideMenu = Noop
    Hub.ReleaseOwnership = Noop
    function Hub:Refresh() return true end
    ns.TopBarFastFocusHubClass = Hub
    return
end

-- FastFocusHub owns only the TopBar presentation and its secure role-marker
-- forwarding button. FastFocus and RoleMarker remain the feature authorities.
local Hub = {}
Hub.__index = Hub

local RAID_ICON_BASE = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_"
local MENU_COLUMNS = 6
local DEFAULT_MARKERS = {
    { id = 3, name = "菱形", color = "#BE20F2" },
    { id = 4, name = "三角", color = "#00FF00" },
    { id = 6, name = "方块", color = "#4C99FF" },
    { id = 7, name = "叉叉", color = "#E53F38" },
    { id = 5, name = "月亮", color = "#DFEDF4" },
    { id = 8, name = "骷髅", color = "|ffffffff" },
}
local DEFAULT_MARKERS_BY_ID = {}
for _, info in ipairs(DEFAULT_MARKERS) do DEFAULT_MARKERS_BY_ID[info.id] = info end
local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return nil end
    local ok, a, b, c, d = pcall(callback, target, ...)
    if not ok then return nil end
    return a, b, c, d
end

local function IsCombat(adapter)
    return adapter and adapter.IsInCombat and adapter:IsInCombat() or false
end

local function MarkerIcon(mark, size)
    return "|T" .. RAID_ICON_BASE .. tostring(mark or 3) .. ":" .. tostring(size or 16)
        .. ":" .. tostring(size or 16) .. ":0:0|t"
end

function Hub:New(module, adapter, data)
    return setmetatable({ module = module, adapter = adapter, data = data }, self)
end

function Hub:GetFastFocus()
    return ns.Runtime and ns.Runtime.GetModule and ns.Runtime:GetModule("FastFocus") or ns.FastFocus
end

function Hub:GetRoleMarker()
    return ns.Runtime and ns.Runtime.GetModule and ns.Runtime:GetModule("RoleMarker") or ns.RoleMarker
end

function Hub:IsFastFocusAvailable()
    local focus = self:GetFastFocus()
    if not focus then return false end
    local profile = Call(focus, "GetProfile") or focus.db and focus.db.profile
    if profile and profile.enabled == false then return false end
    local enabled = Call(focus, "IsEnabled")
    return enabled == nil or enabled == true
end

function Hub:IsRoleMarkerAvailable()
    if self.adapter.family ~= "retail" then return false end
    return self.adapter:IsRoleMarkerEnabled() and true or false
end

function Hub:IsButtonVisible()
    return self:IsFastFocusAvailable() or self:IsRoleMarkerAvailable()
end

function Hub:GetSelectedMarker()
    return tonumber(Call(self:GetFastFocus(), "GetSelectedMarker")) or 3
end

function Hub:IsMarkerEnabled()
    return Call(self:GetFastFocus(), "IsMarkerEnabled") == true
end

function Hub:GetBoolean(method, profileKey)
    local focus = self:GetFastFocus()
    local value = Call(focus, method)
    if value ~= nil then return value == true end
    local profile = Call(focus, "GetProfile") or focus and focus.db and focus.db.profile
    return profile and profile[profileKey] == true or false
end

function Hub:GetMarkers()
    local focus = self:GetFastFocus()
    local markers = Call(focus, "GetAvailableMarkers")
    local profile = Call(focus, "GetProfile") or focus and focus.db and focus.db.profile
    if type(markers) ~= "table" and ns.FastFocusData and type(ns.FastFocusData.GetAvailableMarkers) == "function" then
        markers = ns.FastFocusData.GetAvailableMarkers(profile)
    end
    if type(markers) ~= "table" or #markers == 0 then markers = DEFAULT_MARKERS end
    local result = {}
    local _, entry
    for _, entry in ipairs(markers) do
        local id = tonumber(type(entry) == "table" and (entry.id or entry.mark) or entry)
        if id and id >= 1 and id <= 8 then
            local info = type(entry) == "table" and entry or nil
            local canonical
            if ns.FastFocusData and type(ns.FastFocusData.GetMarkerInfo) == "function" then
                canonical = ns.FastFocusData.GetMarkerInfo(id)
            end
            canonical = canonical or DEFAULT_MARKERS_BY_ID[id]
            if not info and ns.FastFocusData and type(ns.FastFocusData.GetMarkerInfo) == "function" then
                info = canonical
            end
            result[#result + 1] = {
                id = id,
                name = info and (info.name or info.label) or tostring(id),
                icon = info and info.icon or RAID_ICON_BASE .. id,
                color = info and info.color or canonical and canonical.color or nil,
            }
        end
    end
    return result
end

function Hub:GetClassColors()
    local r, g, b = self.adapter:GetPlayerClassColor()
    return {
        accent = { r, g, b, 1 }, background = { r * 0.10, g * 0.10, b * 0.10, 0.96 },
        border = { r, g, b, 0.72 }, hover = { r, g, b, 0.14 }, selected = { r, g, b, 0.24 },
        itemBorder = { 0.24, 0.28, 0.34, 1 }, itemBackground = { 0, 0, 0, 0 },
    }
end

function Hub:GetTransientSurface()
    local system = ns.UISystem or (ns.UI and ns.UI.GetSystem and ns.UI:GetSystem())
    return system and system.transientSurface or nil
end

function Hub:OpenFastFocusSettings()
    if IsCombat(self.adapter) then return self.module:WarnCombatLocked() and false end
    local focus = self:GetFastFocus()
    if Call(focus, "OpenSettings") ~= nil then return true end
    return ns.UI and ns.UI.OpenMain and ns.UI:OpenMain("fast-focus") or false
end

function Hub:OpenRoleMarkerSettings()
    if IsCombat(self.adapter) then return self.module:WarnCombatLocked() and false end
    return self.adapter:OpenRoleMarkerSettings()
end

function Hub:SetFastFocus(method, ...)
    if IsCombat(self.adapter) then self.module:WarnCombatLocked() return false end
    local focus = self:GetFastFocus()
    if not focus or type(focus[method]) ~= "function" then return false end
    local ok, result = pcall(focus[method], focus, ...)
    if not ok or result == false then return false end
    self:Refresh()
    return true
end

function Hub:BuildMenuItems()
    local focus = self:GetFastFocus()
    if not focus then return {} end
    local chat = Call(focus, "IsChatEnabled") == true
    local marker = self:IsMarkerEnabled()
    local overwrite = self:GetBoolean("IsOverwriteExistingMarkEnabled", "overwriteExistingMark")
    local markerMode = tostring(Call(focus, "GetChatMarkerMode") or "text")
    local showFocusName = self:GetBoolean("IsFocusNameEnabled", "showFocusName")
    local selectedMarker = self:GetSelectedMarker()
    local selectedMarkerInfo
    for _, info in ipairs(self:GetMarkers()) do
        if info.id == selectedMarker then selectedMarkerInfo = info break end
    end
    local markerValue = markerMode == "text" and selectedMarkerInfo and selectedMarkerInfo.name
        or markerMode == "icon" and MarkerIcon(selectedMarker, 16) or nil
    local markerValueColor = markerMode == "text"
        and (selectedMarkerInfo and selectedMarkerInfo.color or "|cffff40a0") or nil
    local english = self:GetBoolean("IsEnglishChatEnabled", "useEnglishChat")
    local channel = tostring(Call(focus, "GetChatCommand") or "p"):lower():gsub("^/", "")
    local channelLabel = Call(focus, "GetChatCommandLabel") or channel
    local channelR, channelG, channelB
    if focus.adapter then channelR, channelG, channelB = Call(focus.adapter, "GetChatColor", channel) end
    local channelColor = channelR and { channelR, channelG or 1, channelB or 1, 1 } or nil
    local function refresh(surface)
        Call(surface, "Refresh", { items = self:BuildMenuItems(), columns = MENU_COLUMNS })
        if Call(surface, "IsShown") then self:ShowFooter() end
    end
    local function toggle(method, state)
        return function(surface)
            if self:SetFastFocus(method, not state) then refresh(surface) end
        end
    end
    local items = {
        { kind = "text", id = "roleMarkerFooterSlot", text = "", span = 6, wordWrap = false },
        { id = "chat", text = "焦点发言", selected = chat, span = 3,
            justifyH = "LEFT", contentInset = 10, wordWrap = false,
            onClick = toggle("SetChatEnabled", chat) },
        { id = "mark", text = "焦点标记", selected = marker, span = 3,
            justifyH = "LEFT", contentInset = 10, wordWrap = false,
            onClick = toggle("SetMarkerEnabled", marker) },
        { id = "chatChannel", text = "发言频道",
            valueText = channelLabel, valueColor = channelColor, valueWidth = 40,
            valueJustifyH = "RIGHT", span = 3, closeOnClick = false,
            justifyH = "LEFT", contentInset = 10, iconGap = 4, wordWrap = false,
            onClick = function(surface, _, mouseButton)
                local direction = mouseButton == "RightButton" and -1 or 1
                if self:SetFastFocus("CycleChatCommand", direction) then refresh(surface) end
            end },
        { id = "english", text = "英文发言", selected = english, span = 3,
            justifyH = "LEFT", contentInset = 10, wordWrap = false,
            onClick = toggle("SetUseEnglishChat", english) },
        { id = "chatMarkerMode",
            text = markerMode == "icon" and "播报图标"
                or markerMode == "none" and "播报标记" or "播报文字",
            valueText = markerValue, valueColor = markerValueColor,
            valueWidth = markerMode == "icon" and 28 or 40,
            valueJustifyH = "RIGHT",
            selected = markerMode ~= "none", span = 3,
            justifyH = "LEFT", contentInset = 10, iconGap = 4, wordWrap = false,
            onClick = function(surface)
                if self:SetFastFocus("CycleChatMarkerMode") then refresh(surface) end
            end },
        { id = "showFocusName", text = "播报单位名称", selected = showFocusName, span = 3,
            justifyH = "LEFT", contentInset = 10, wordWrap = false,
            onClick = toggle("SetFocusNameEnabled", showFocusName) },
        { id = "overwrite", text = "覆盖标记", selected = overwrite, span = 3,
            justifyH = "LEFT", contentInset = 10, wordWrap = false,
            onClick = toggle("SetOverwriteExistingMarkEnabled", overwrite) },
        { id = "focusSettings", text = "更多设置", span = 3, closeOnClick = true,
            justifyH = "LEFT", contentInset = 10, wordWrap = false,
            onClick = function() self:OpenFastFocusSettings() self:HideMenu("settings") end },
        { kind = "separator" },
    }
    local _, info
    for _, info in ipairs(self:GetMarkers()) do
        local id = info.id
        items[#items + 1] = {
            id = "marker" .. id, text = info.name, icon = info.icon, fontSize = 18,
            selected = self:GetSelectedMarker() == id, span = 2, wordWrap = false,
            justifyH = "CENTER", closeOnClick = true,
            onClick = function()
                self:SetFastFocus("SetSelectedMarker", id, true)
                self:HideMenu("marker-selected")
            end,
        }
    end
    if not ns.Build.HasModule("RoleMarker") then table.remove(items, 1) end
    for _, info in ipairs(items) do
        if info.kind ~= "separator" then info.fontSize = info.fontSize or 18 end
    end
    return items
end

function Hub:EnsureMenu()
    if self.menu then return self.menu end
    local service = self:GetTransientSurface()
    if not (service and type(service.CreateHoverMenu) == "function" and self.owner) then return nil end
    local colors = self:GetClassColors()
    local ok, menu, reason = pcall(service.CreateHoverMenu, service, self.owner, {
        name = "RSFastFocusHubMenu", point = "TOP", relativePoint = "BOTTOM", y = -10,
        columns = MENU_COLUMNS, rowHeight = 30, width = 284, fontSize = 18, closeOnClick = false,
        backgroundColor = colors.background, borderColor = colors.border,
        itemBackgroundColor = colors.itemBackground,
        itemBorderColor = colors.itemBorder, itemHoverBorderColor = colors.accent,
        itemSelectedBorderColor = colors.accent,
        itemHoverColor = colors.hover, itemSelectedColor = colors.selected,
        onEnter = function() self:CancelHide() end,
        onLeave = function() self:ScheduleHide() end,
        onHide = function() self:HideFooter() end,
    })
    if not ok or not menu then
        self:ReportMenuFailure(not ok and menu or reason or "create-failed")
        return nil
    end
    self.menu = menu
    if self.menu and self.menu.frame then
        Call(self.menu.frame, "SetScript", "OnEnter", function() self:CancelHide() end)
        Call(self.menu.frame, "SetScript", "OnLeave", function() self:ScheduleHide() end)
    end
    return self.menu
end

function Hub:ReportMenuFailure(reason)
    reason = tostring(reason or "unknown")
    if self.lastMenuFailure == reason then return end
    self.lastMenuFailure = reason
    -- Bootstrap exposes ns.Print as a plain function: Print(message, ...).
    -- TopBar's method wrapper historically used ns:Print, which shifts the
    -- namespace table into the format-string position and masks this error.
    if type(ns.Print) == "function" then
        ns.Print("快速焦点菜单打开失败：" .. reason)
    elseif self.module and type(self.module.Print) == "function" then
        -- Keep the module fallback for isolated harnesses, but call the method
        -- only when the real namespace printer is unavailable.
        self.module:Print("快速焦点菜单打开失败：" .. reason)
    end
end

function Hub:GetFooterSlot()
    if self.menu and type(self.menu.GetItemFrame) == "function" then
        return self.menu:GetItemFrame(1)
    end
    local _, slot
    for _, slot in ipairs(self.menu and self.menu.slots or {}) do
        if slot.item and slot.item.id == "roleMarkerFooterSlot" then
            return slot.component and slot.component.frame
        end
    end
    return nil
end

function Hub:StyleFooter(hovered)
    local button = self.footer
    if not button then return end
    local colors = self:GetClassColors()
    local color = hovered and colors.hover or colors.selected
    Call(button, "SetBackdropColor", color[1], color[2], color[3], color[4])
    local pixel = ns.UI and ns.UI.PixelBorder
    if pixel then
        button.pixelBorder = button.pixelBorder or pixel:Ensure(button, button, "OVERLAY", 7)
        pixel:Update(button.pixelBorder, colors.accent, true)
    end
end

function Hub:EnsureFooter()
    if not ns.Build.HasModule("RoleMarker") then return nil end
    if IsCombat(self.adapter) then return nil end
    if self.footerOwned then return self.footer end
    self.footerCleanup = self.footerCleanup or function(frame)
        self.footerOwned = false
        self.adapter:UnregisterCombatHideDriver(frame)
        Call(frame, "SetScript", "OnEnter", nil)
        Call(frame, "SetScript", "OnLeave", nil)
        Call(frame, "Hide")
    end
    local button = self.footer
    if not button then
        button = self.module:CreateFrame("Button", "RSFastFocusHubRoleMarkerButton", self.adapter:GetRootFrame(),
            "SecureActionButtonTemplate,SecureHandlerStateTemplate,BackdropTemplate", self.footerCleanup,
            "TopBar FastFocus secure footer")
        if not button then return nil end
        self.footer = button
        Call(button, "SetFrameStrata", "DIALOG")
        Call(button, "SetBackdrop", { bgFile = "Interface\\Buttons\\WHITE8X8", tile = false })
        local label = Call(button, "CreateFontString", nil, "OVERLAY")
        Call(label, "SetPoint", "LEFT", button, "LEFT", 8, 0)
        Call(label, "SetPoint", "RIGHT", button, "RIGHT", -8, 0)
        Call(label, "SetJustifyH", "LEFT")
        Call(label, "SetWordWrap", false)
        Call(label, "SetTextColor", 1, 1, 1, 1)
        button.label = label
    else
        self.module:OwnFrame(button, self.footerCleanup, "TopBar FastFocus secure footer")
    end
    self.adapter:ApplyFont(button.label, self.adapter:GetFontPath("interface"), 18, "OUTLINE")
    Call(button, "SetScript", "OnEnter", function() self:StyleFooter(true) self:CancelHide() end)
    Call(button, "SetScript", "OnLeave", function() self:StyleFooter(false) self:ScheduleHide() end)
    if not self.adapter:RegisterPrimarySecureClicks(button) or not self.adapter:RegisterCombatHideDriver(button) then
        self.module:ReleaseFrame(button)
        return nil
    end
    Call(button, "Hide")
    self.footerOwned = true
    self:StyleFooter(false)
    self:ConfigureSecureActions()
    return button
end

function Hub:ConfigureSecureActions(owner)
    if IsCombat(self.adapter) then self.module.secureDirty = true return false end
    owner = owner or self.owner
    local tank, healer = Call(self.adapter, "GetRoleMarkerMarks")
    local enabled = self:IsRoleMarkerAvailable()
    local tankUnit, tankReason, healerUnit, healerReason
    if enabled then
        tankUnit, tankReason = self.adapter:GetRoleMarkerUnit("TANK")
        healerUnit, healerReason = self.adapter:GetRoleMarkerUnit("HEALER")
    else
        tankReason, healerReason = "feature-disabled", "feature-disabled"
    end
    local function apply(button)
        if not button then return end
        Call(button, "SetAttribute", "type1", tankUnit and "raidtarget" or nil)
        Call(button, "SetAttribute", "unit1", tankUnit)
        Call(button, "SetAttribute", "marker1", tankUnit and tank or nil)
        Call(button, "SetAttribute", "action1", tankUnit and "set" or nil)
        Call(button, "SetAttribute", "macrotext1", nil)
        Call(button, "SetAttribute", "type2", healerUnit and "raidtarget" or nil)
        Call(button, "SetAttribute", "unit2", healerUnit)
        Call(button, "SetAttribute", "marker2", healerUnit and healer or nil)
        Call(button, "SetAttribute", "action2", healerUnit and "set" or nil)
        Call(button, "SetAttribute", "macrotext2", nil)
    end
    apply(owner)
    apply(self.footer)
    self.roleMarkerDiagnostics = {
        enabled = enabled, tankUnit = tankUnit, healerUnit = healerUnit,
        tankReason = tankUnit and nil or tankReason,
        healerReason = healerUnit and nil or healerReason,
    }
    if self.footer and self.footer.label then
        Call(self.footer.label, "SetText", "左键：标坦克" .. MarkerIcon(tank)
            .. "  右键：标治疗" .. MarkerIcon(healer))
    end
    return true
end

function Hub:GetRoleMarkerDiagnostics()
    return self.roleMarkerDiagnostics
end

function Hub:ShowFooter()
    if IsCombat(self.adapter) then return false end
    local button, slot = self:EnsureFooter(), self:GetFooterSlot()
    if not (button and slot) then return false end
    local left, bottom = Call(slot, "GetLeft"), Call(slot, "GetBottom")
    if not (left and bottom) then return false end
    Call(button, "ClearAllPoints")
    Call(button, "SetPoint", "BOTTOMLEFT", self.adapter:GetRootFrame(), "BOTTOMLEFT", left, bottom)
    Call(button, "SetSize", Call(slot, "GetWidth") or 0, Call(slot, "GetHeight") or 0)
    if self.menu.frame then Call(button, "SetFrameLevel", (Call(self.menu.frame, "GetFrameLevel") or 0) + 5) end
    self:ConfigureSecureActions()
    Call(button, "Show")
    return true
end

function Hub:HideFooter()
    if self.footer and not IsCombat(self.adapter) then Call(self.footer, "Hide") end
end

function Hub:ShowMenu()
    if IsCombat(self.adapter) or not self:IsFastFocusAvailable() then return false end
    self:CancelHide()
    local menu = self:EnsureMenu()
    if not menu then return false end
    local ok, shown = pcall(menu.Show, menu, { items = self:BuildMenuItems(), columns = MENU_COLUMNS })
    if not ok then self:ReportMenuFailure(shown) return false end
    if not shown then self:ReportMenuFailure("show-rejected") return false end
    self.lastMenuFailure = nil
    if shown then self:ShowFooter() end
    return shown and true or false
end

function Hub:HideMenu(reason)
    self.module:CancelRefresh("topbar-fastfocus-show")
    self.module:CancelRefresh("topbar-fastfocus-hide")
    Call(self.menu, "Hide", reason or "hide")
    self:HideFooter()
end

function Hub:CancelHide()
    self.module:CancelRefresh("topbar-fastfocus-hide")
end

function Hub:ScheduleHide()
    if not Call(self.menu, "IsShown") then return end
    self:CancelHide()
    self.module:RequestRefresh("topbar-fastfocus-hide", function()
        local ownerHovered = self.owner and Call(self.owner, "IsMouseOver")
        local footerHovered = self.footer and Call(self.footer, "IsShown") and Call(self.footer, "IsMouseOver")
        local menuHovered = Call(self.menu, "IsMouseOver")
            or self.menu and self.menu.frame and Call(self.menu.frame, "IsMouseOver")
        if ownerHovered or footerHovered or menuHovered then return end
        self:HideMenu("leave")
    end, 0.15)
end

function Hub:ScheduleShow()
    if IsCombat(self.adapter) or not self:IsFastFocusAvailable() then return end
    self.module:CancelRefresh("topbar-fastfocus-show")
    self.module:RequestRefresh("topbar-fastfocus-show", function()
        if not IsCombat(self.adapter) and self.owner and Call(self.owner, "IsMouseOver") then self:ShowMenu() end
    end, 0.08)
end

function Hub:Decorate(record)
    if not (record and record.frame) then return false end
    self.owner = record.frame
    if not record.stateDot then
        local dot = Call(record.frame, "CreateTexture", nil, "OVERLAY", nil, 7)
        Call(dot, "SetSize", 8, 8)
        Call(dot, "SetPoint", "BOTTOMRIGHT", record.frame, "BOTTOMRIGHT", 1, -1)
        Call(dot, "SetColorTexture", 0.95, 0.22, 0.25, 1)
        local mask = Call(record.frame, "CreateMaskTexture", nil, "OVERLAY", nil, 7)
        Call(mask, "SetTexture", "Interface\\CharacterFrame\\TempPortraitAlphaMask")
        Call(mask, "SetAllPoints", dot)
        Call(dot, "AddMaskTexture", mask)
        record.stateDot, record.stateDotMask = dot, mask
    end
    return true
end

function Hub:Bind(record)
    if not self:Decorate(record) then return false end
    local frame = record.frame
    Call(frame, "SetScript", "OnEnter", function()
        if IsCombat(self.adapter) then return end
        self:ConfigureSecureActions(frame)
        if self:IsFastFocusAvailable() then
            self:ShowMenu()
        else
            self.module.view:ShowTooltip(record, "|cffffffff左：|r" .. self.module:ColorPlayerClassText("标坦克")
                .. "\n|cffffffff右：|r" .. self.module:ColorPlayerClassText("标治疗")
                .. "\n|cffffffff中：|r" .. self.module:ColorPlayerClassText("焦点设置"))
        end
    end)
    Call(frame, "SetScript", "OnLeave", function()
        self.module.view:HideTooltip()
        self.module:CancelRefresh("topbar-fastfocus-show")
        self:ScheduleHide()
    end)
    Call(frame, "SetScript", "OnHide", function() self:HideMenu("owner-hidden") end)
    Call(frame, "SetScript", "PostClick", function(_, mouseButton)
        if mouseButton == "MiddleButton" then self:OpenFastFocusSettings() end
    end)
    return true
end

function Hub:Refresh()
    if IsCombat(self.adapter) then
        self.module.secureDirty = true
        self:HideMenu("combat")
        return false
    end
    local record = self.module.view and self.module.view.records.rolemarker
    if record then
        if record.icon then Call(record.icon, "SetTexture", RAID_ICON_BASE .. self:GetSelectedMarker()) end
        if record.stateDot then
            Call(record.stateDot, "SetColorTexture", self:IsMarkerEnabled() and 0 or 0.95,
                self:IsMarkerEnabled() and 1 or 0.22, self:IsMarkerEnabled() and 0 or 0.25, 1)
            if self:IsFastFocusAvailable() then Call(record.stateDot, "Show") else Call(record.stateDot, "Hide") end
        end
        self:ConfigureSecureActions(record.frame)
    end
    if Call(self.menu, "IsShown") then
        Call(self.menu, "Refresh", { items = self:BuildMenuItems(), columns = MENU_COLUMNS })
        self:ShowFooter()
    end
    return true
end

function Hub:ReleaseOwnership()
    self:HideMenu("release")
    -- A menu release failure must not abort TopBar's Disable before the view
    -- releases its records; that left the whole bar visible but unbound.
    Call(self.menu, "Release")
    self.menu = nil
    if self.footer then
        self.module:ReleaseFrame(self.footer)
    end
    self.owner = nil
end

ns.TopBarFastFocusHubClass = Hub

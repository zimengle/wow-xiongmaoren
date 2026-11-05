local _, ns = ...

if not ns.Build.IsFamily("classic") then return end

local Data = ns.ChatBarData
if type(Data) ~= "table" then
    error("ChatBar Data.lua must load before the Classic adapter", 2)
end

local Base = {}
local Adapter = {}
Adapter.__index = Adapter

local providers = {}
local providerOrder = {}
local dynamicEvents = {
    "PLAYER_ENTERING_WORLD",
    "ZONE_CHANGED_NEW_AREA",
    "GROUP_ROSTER_UPDATE",
    "PARTY_MEMBERS_CHANGED",
    "RAID_ROSTER_UPDATE",
}

local function Call(object, method, ...)
    local callback = object and object[method]
    if type(callback) ~= "function" then return false end
    local ok, result = pcall(callback, object, ...)
    return ok and result ~= false
end

function Base.RegisterProvider(provider)
    if type(provider) ~= "table" or type(provider.id) ~= "string" or provider.id == ""
        or providers[provider.id] then
        return false
    end
    if ns.Integrations and not ns.Integrations:IsProviderAllowed(provider.id) then return false end
    providers[provider.id] = provider
    providerOrder[#providerOrder + 1] = provider.id
    return true
end

function Base.New(buildID, label, options)
    options = options or {}
    return setmetatable({
        buildID = buildID,
        label = label,
        preferAtlasLootMY = options.preferAtlasLootMY == true,
    }, Adapter)
end

function Adapter:IsSupported() return true end
function Adapter:GetBuildID() return self.buildID end
function Adapter:GetBuildLabel() return self.label end
function Adapter:GetParent() return _G.UIParent end
function Adapter:GetDynamicEvents() return dynamicEvents end
function Adapter:GetButtons() return Data.buttons end
function Adapter:GetSettingsButtonOrder() return Data.settingsButtonOrder end
function Adapter:GetDefaults() return Data.defaults end
function Adapter:GetTooltipVariant() return "classic" end
function Adapter:SupportsEmojiFilters() return true end
function Adapter:GetMoveLabel() return "聊天条" end
function Adapter:RegisterAliases() return nil end
function Adapter:UnregisterAliases() return false end

function Adapter:GetChannels()
    local locale = type(_G.GetLocale) == "function" and _G.GetLocale() or "enUS"
    return Data.GetChannels(locale)
end

function Adapter:ShouldShow(showKey)
    if showKey == nil then return true end
    if showKey == "raid" then
        return type(_G.IsInRaid) == "function" and _G.IsInRaid() == true
    elseif showKey == "group_or_raid" then
        return (type(_G.IsInGroup) == "function" and _G.IsInGroup() == true)
            or (type(_G.IsInRaid) == "function" and _G.IsInRaid() == true)
    elseif showKey == "battleground" then
        if type(_G.IsInInstance) ~= "function" then return false end
        local _, instanceType = _G.IsInInstance()
        return instanceType == "pvp"
    end
    return false
end

function Adapter:GetChatFrame()
    return _G.SELECTED_DOCK_FRAME or _G.ChatFrame1
end

function Adapter:GetChatAnchorFrame()
    local frame = _G.ChatFrame1
    if frame and type(frame.GetLeft) == "function" then return frame end
    return _G.UIParent
end

function Adapter:GetInputText(frame)
    local editBox = frame and frame.editBox
    return editBox and type(editBox.GetText) == "function" and editBox:GetText() or ""
end

function Adapter:OpenChat(command, frame)
    if type(_G.ChatFrame_OpenChat) ~= "function" then return false end
    _G.ChatFrame_OpenChat(command or "", frame)
    return true
end

function Adapter:GetChannel(name)
    if type(_G.GetChannelName) ~= "function" then return nil, nil end
    return _G.GetChannelName(name)
end

function Adapter:JoinChannel(name, frame)
    local frameID = frame and type(frame.GetID) == "function" and frame:GetID() or 1
    if type(_G.JoinPermanentChannel) == "function" then
        _G.JoinPermanentChannel(name, nil, frameID, 1)
    end
    if type(_G.ChatFrame_AddChannel) == "function" and frame then
        _G.ChatFrame_AddChannel(frame, name)
    end
    return true
end

function Adapter:LeaveChannel(name)
    if type(_G.LeaveChannelByName) ~= "function" then return false end
    _G.LeaveChannelByName(name)
    return true
end

function Adapter:Notify(message)
    if type(ns.Print) == "function" then ns.Print(message)
    elseif type(_G.print) == "function" then _G.print(message) end
end

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() == true
end

function Adapter:GetClassColor()
    local class
    if type(_G.UnitClass) == "function" then local _, value = _G.UnitClass("player"); class = value end
    local color = class and _G.RAID_CLASS_COLORS and _G.RAID_CLASS_COLORS[class]
    if color then return color.r, color.g, color.b end
    return 1, 0.84, 0
end

function Adapter:GetFontPath()
    local font = ns.Font
    if font and type(font.GetChatBarFontPath) == "function" then
        local path = font:GetChatBarFontPath()
        if path then return path end
    end
    if font and type(font.GetSystemFontPath) == "function" then
        return font:GetSystemFontPath()
    end
    return _G.STANDARD_TEXT_FONT or "Fonts\\ARKai_T.ttf"
end

function Adapter:ApplyFont(text, path, size, flags)
    local font = ns.Font
    if font and type(font.ApplyFontString) == "function" then
        return font:ApplyFontString(text, path, size, flags)
    end
    if not (text and type(text.SetFont) == "function") then return false end
    local ok, applied = pcall(text.SetFont, text, path, size, flags)
    return ok and applied ~= false
end

function Adapter:IsOffscreenDragEnabled()
    local settings = ns.DB and ns.DB.profile and ns.DB.profile.moveSettings
    return settings and settings.allowOffscreenDrag == true or false
end

function Adapter:IsAddOnLoaded(name)
    if ns.Compat and type(ns.Compat.IsAddOnLoaded) == "function" then
        return ns.Compat.IsAddOnLoaded(name) == true
    end
    local callback = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback(name) == true
end

function Adapter:LoadOptionalAddon(name)
    if self:IsAddOnLoaded(name) then return true end
    local callback = _G.C_AddOns and _G.C_AddOns.LoadAddOn or _G.LoadAddOn
    if type(callback) ~= "function" then return false end
    local ok, loaded = pcall(callback, name)
    return ok and not not loaded
end

function Adapter:RunMacro(command)
    if type(_G.RunMacroText) ~= "function" then return false end
    _G.RunMacroText(command)
    return true
end

function Adapter:RunSlash(key, command, allowMacroFallback)
    local handler = _G.SlashCmdList and _G.SlashCmdList[key]
    if type(handler) == "function" then handler(""); return true end
    if command and allowMacroFallback ~= false then return self:RunMacro(command) end
    return false
end

function Adapter:OpenAtlasLootMY()
    self:LoadOptionalAddon("AtlasLootMY")
    local addon = _G.AtlasLootMY
    if addon and addon.SlashCommands and type(addon.SlashCommands.Run) == "function" then
        addon.SlashCommands:Run("")
        return true
    end
    return self:RunSlash("ATLASLOOTMY", "/almy", false)
end

function Adapter:OpenAtlasLootClassic()
    self:LoadOptionalAddon("AtlasLootClassic")
    local addon = _G.AtlasLoot
    if addon and addon.SlashCommands and type(addon.SlashCommands.Run) == "function" then
        addon.SlashCommands:Run("")
        return true
    end
    return self:RunSlash("ATLASLOOT", "/al", false)
end

function Adapter:OpenAtlasLoot()
    if self.preferAtlasLootMY then
        if self:OpenAtlasLootMY() or self:OpenAtlasLootClassic() then return true end
        return self:RunSlash("ATLASLOOTMY", "/almy") or self:RunSlash("ATLASLOOT", "/al")
    end
    if self:OpenAtlasLootClassic() or self:OpenAtlasLootMY() then return true end
    return self:RunSlash("ATLASLOOT", "/al") or self:RunSlash("ATLASLOOTMY", "/almy")
end

function Adapter:OpenMeetingStone()
    self:LoadOptionalAddon("MeetingHorn")
    self:LoadOptionalAddon("MeetingStone")
    if ns.Compat and type(ns.Compat.OpenMeetingStoneAddon) == "function" then
        if ns.Compat.OpenMeetingStoneAddon("MeetingHorn") then return true end
        if ns.Compat.OpenMeetingStoneAddon("MeetingStone") then return true end
    end
    return false
end

function Adapter:OpenGoldLedger()
    -- BGLite 沿用 BIAOGE 处理器；以插件加载结果区分它和旧 BiaoGe。
    if self:LoadOptionalAddon("BGLite") then
        return self:RunSlash("BIAOGE", "/bglite", false)
    end
    if self:LoadOptionalAddon("BGNext") then
        return self:RunSlash("BGNEXT", "/bgnext", false)
    end
    if self:LoadOptionalAddon("BiaoGe") then
        return self:RunSlash("BIAOGE", "/biaoge", false)
    end
    if self:LoadOptionalAddon("BGLite_Skye") then
        return self:RunSlash("BIAOGE", "/bglite", false)
    end
    if self:LoadOptionalAddon("BiaoGeX") then
        return self:RunSlash("BIAOGE", "/biaogex", false)
    end
    return false
end

function Adapter:HandleAddon(key)
    -- 接受旧内部键，供共享 Data/配置迁移独立整合。
    if key == "biaoge" or key == "goldLedger" then return self:OpenGoldLedger() end
    return false
end

function Adapter:OpenMacroPanel()
    if type(_G.UIParentLoadAddOn) == "function" and not _G.MacroFrame then
        _G.UIParentLoadAddOn("Blizzard_MacroUI")
    end
    local frame = _G.MacroFrame
    if frame and type(frame.IsShown) == "function" and frame:IsShown() then
        Call(frame, "Hide")
        return true
    end
    if type(_G.ShowMacroFrame) == "function" then _G.ShowMacroFrame(); return true end
    return Call(frame, "Show")
end

function Adapter:OpenLootHistory()
    if type(_G.ToggleLootHistoryFrame) == "function" then
        _G.ToggleLootHistoryFrame()
        return true
    end
    if self:RunMacro("/loot") then return true end
    return self:OpenChat("/loot ", self:GetChatFrame())
end

function Adapter:HandleLoot(rightButton)
    if rightButton then return self:OpenLootHistory() end
    return self:OpenAtlasLoot()
end

function Adapter:RandomRoll()
    if type(_G.RandomRoll) == "function" then _G.RandomRoll(1, 100); return true end
    return self:RunMacro("/roll")
end

function Adapter:ToggleCombatLogging()
    -- Use the native /combatlog handler for both the toggle and system message.
    return self:RunSlash("COMBATLOG", "/combatlog")
end

function Adapter:OpenMainFrame()
    if type(ns.ToggleMainFrame) == "function" then ns:ToggleMainFrame(); return true end
    if type(ns.ShowMainFrame) == "function" then ns:ShowMainFrame(); return true end
    return false
end

function Adapter:OpenRSAClass()
    if not self:IsAddOnLoaded("RurutiaSA_Class") then return false end
    local addon = _G.RurutiaSA_Class
    if addon and type(addon.OpenMainPanel) == "function" then
        addon:OpenMainPanel("iconGroup")
        return true
    end
    return false
end

function Adapter:ToggleRSAClass()
    if not self:IsAddOnLoaded("RurutiaSA_Class") then return false end
    local panel = _G.RSA_Class_MainPanel
    if panel and type(panel.IsShown) == "function" and panel:IsShown() then
        return Call(panel, "Hide")
    end
    return self:OpenRSAClass()
end

function Adapter:OpenRSACombat()
    local addon = _G.RSAC
    local ui = addon and addon.ConfigUI
    if Call(ui, "Toggle") or Call(ui, "Show") then return true end
    return self:RunSlash("RSAC", "/rsac")
end

function Adapter:OpenRSATrinkets()
    local addon = _G.RurutiaSA_Trinkets
    if addon and addon.Options and type(addon.Options.Open) == "function" then
        addon.Options.Open()
        return true
    end
    local handler = _G.SlashCmdList and _G.SlashCmdList.RURUTIASA
    if type(handler) == "function" then handler("sp"); return true end
    return self:RunMacro("/rsa sp")
end

function Adapter:OpenCell()
    if type(ns.OpenCellSettings) == "function" then ns:OpenCellSettings(); return true end
    local cell = _G.Cell
    if cell and cell.funcs and type(cell.funcs.ShowOptionsFrame) == "function" then
        cell.funcs.ShowOptionsFrame()
        return true
    end
    return false
end

function Adapter:OpenCooldownViewer()
    local frame = _G.CooldownViewerSettings
    if not frame then return false end
    if type(frame.IsShown) == "function" and frame:IsShown() then return Call(frame, "Hide") end
    return Call(frame, "Show")
end

function Adapter:OpenSimpleCursor()
    return self:RunSlash("RSC", "/rsc")
end

function Adapter:OpenWarpDeplete()
    local addon = _G.WarpDeplete
    if addon and type(addon.HandleChatCommand) == "function" then
        addon:HandleChatCommand("")
        return true
    end
    if addon and _G.Settings and type(_G.Settings.OpenToCategory) == "function"
        and addon.categoryID then
        _G.Settings.OpenToCategory(addon.categoryID)
        return true
    end
    return self:RunMacro("/warp")
end

function Adapter:OpenEllesmereUI()
    if not self:IsAddOnLoaded("EllesmereUI") then return false end
    if self:IsInCombat() then
        self:Notify("|cffff6060[EllesmereUI]|r 战斗中无法打开设置。")
        return false
    end
    local handler = _G.SlashCmdList and _G.SlashCmdList.EUIOPTIONS
    if type(handler) == "function" then handler(""); return true end

    local addon = _G.EllesmereUI
    if not (addon and type(addon.Toggle) == "function") then return false end
    return Call(addon, "Toggle")
end

function Adapter:GetPreferredProvider()
    local best
    local index
    for index = 1, #providerOrder do
        local provider = providers[providerOrder[index]]
        if provider and type(provider.IsAvailable) == "function"
            and provider:IsAvailable(self)
            and (not best or (provider.priority or 0) > (best.priority or 0)) then
            best = provider
        end
    end
    return best
end

function Adapter:GetPopupItems()
    local items = {
        { id = "toolbox", label = "露露的工具箱", open = function() self:OpenMainFrame() end },
    }
    if self:IsAddOnLoaded("RurutiaSA_Combat") then
        items[#items + 1] = { id = "combat", label = "露露的副本模块", open = function() self:OpenRSACombat() end }
    end
    if self:IsAddOnLoaded("RurutiaSA_Class") then
        items[#items + 1] = { id = "class", label = "露露的职业模块", open = function() self:ToggleRSAClass() end }
    end
    if self:IsAddOnLoaded("RurutiaSA_Trinkets") then
        items[#items + 1] = { id = "trinkets", label = "露露的饰品模块", open = function() self:OpenRSATrinkets() end }
    end
    if self:IsAddOnLoaded("Cell") then
        items[#items + 1] = { id = "cell", label = "Cell", open = function() self:OpenCell() end }
    end
    if _G.CooldownViewerSettings then
        items[#items + 1] = { id = "cooldown", label = "冷却管理器", open = function() self:OpenCooldownViewer() end }
    end
    if self:IsAddOnLoaded("Rurutia_SimpleCursor") then
        items[#items + 1] = { id = "cursor", label = "鼠标圆圈显示", open = function() self:OpenSimpleCursor() end }
    end
    if self:IsAddOnLoaded("WarpDeplete") then
        items[#items + 1] = { id = "warp", label = "大秘境计时器", open = function() self:OpenWarpDeplete() end }
    end
    if self:IsAddOnLoaded("EllesmereUI") then
        items[#items + 1] = { id = "ellesmereui", label = "EllesmereUI", open = function() self:OpenEllesmereUI() end }
    end
    local provider = self:GetPreferredProvider()
    if provider then
        items[#items + 1] = {
            id = provider.id,
            label = type(provider.GetLabel) == "function" and provider:GetLabel(self) or provider.label,
            open = function() provider:Open(self) end,
        }
    end
    return items
end

function Adapter:AddMessageFilter(event, callback)
    if type(_G.ChatFrame_AddMessageEventFilter) ~= "function" then return false end
    local ok, result = pcall(_G.ChatFrame_AddMessageEventFilter, event, callback)
    return ok and result ~= false
end

function Adapter:RemoveMessageFilter(event, callback)
    if type(_G.ChatFrame_RemoveMessageEventFilter) ~= "function" then return false end
    local ok, result = pcall(_G.ChatFrame_RemoveMessageEventFilter, event, callback)
    return ok and result ~= false
end

function Adapter:GetChatFontSize()
    local frame = _G.SELECTED_CHAT_FRAME or _G.DEFAULT_CHAT_FRAME or _G.ChatFrame1
    local size
    if frame and type(frame.GetFont) == "function" then local _, value = frame:GetFont(); size = value end
    return tonumber(size) or Data.emojiMessageIconSize
end

function Adapter:GetEditBox()
    if type(_G.ChatEdit_ChooseBoxForSend) == "function" then
        local box = _G.ChatEdit_ChooseBoxForSend()
        if box then return box end
    end
    local frame = self:GetChatFrame()
    return frame and frame.editBox
end

function Adapter:ActivateEditBox(editBox)
    if type(_G.ChatEdit_ActivateChat) == "function" then
        _G.ChatEdit_ActivateChat(editBox)
        return true
    end
    return self:OpenChat("", self:GetChatFrame())
end

function Adapter:InsertText(editBox, text)
    if not editBox or type(editBox.Insert) ~= "function" then return false end
    editBox:Insert(text)
    return true
end

function Adapter:ShowTooltip(owner, text)
    local tooltip = _G.GameTooltip
    if not tooltip or not owner then return false end
    tooltip:SetOwner(owner, "ANCHOR_TOP")
    tooltip:SetText(text, 1, 1, 1)
    tooltip:Show()
    return true
end

function Adapter:HideTooltip()
    local tooltip = _G.GameTooltip
    if tooltip and type(tooltip.Hide) == "function" then tooltip:Hide(); return true end
    return false
end

ns.ChatBarAdapterBase = Base

local _, ns = ...

if not (ns.Build and ns.Build.GetID and ns.Build.GetID() == "retail") then return end
if ns.Build.GetInterfaceVersion() < 120000 then return end

local Data = ns.ChatBarData
if type(Data) ~= "table" then error("ChatBar Data.lua must load before the Retail adapter", 2) end

local Adapter = {
    buildID = "retail",
    label = "Retail 12.x",
}
local providers = {}
local providerOrder = {}
local dynamicEvents = {
    "PLAYER_ENTERING_WORLD",
    "ZONE_CHANGED_NEW_AREA",
    "GROUP_ROSTER_UPDATE",
}
local canaccessvalue = _G.canaccessvalue

local function CanAccessValue(value)
    if type(value) == "nil" then return true end
    return not canaccessvalue or canaccessvalue(value)
end

local function Call(object, method, ...)
    local callback = object and object[method]
    if type(callback) ~= "function" then return false end
    local ok, result = pcall(callback, object, ...)
    return ok and result ~= false
end

local ProviderRegistry = {}
function ProviderRegistry.RegisterProvider(provider)
    if type(provider) ~= "table" or type(provider.id) ~= "string" or provider.id == ""
        or providers[provider.id] then return false end
    if ns.Integrations and not ns.Integrations:IsProviderAllowed(provider.id) then return false end
    providers[provider.id] = provider
    providerOrder[#providerOrder + 1] = provider.id
    return true
end

function Adapter:IsSupported() return true end
function Adapter:GetBuildID() return self.buildID end
function Adapter:GetBuildLabel() return self.label end
function Adapter:GetParent() return _G.UIParent end
function Adapter:GetDynamicEvents() return dynamicEvents end
function Adapter:GetButtons() return Data.retailButtons end
function Adapter:GetSettingsButtonOrder() return Data.retailSettingsButtonOrder end
function Adapter:GetDefaults() return Data.retailDefaults end
function Adapter:GetTooltipVariant() return "retail" end
function Adapter:SupportsEmojiFilters() return false end
function Adapter:GetMoveLabel() return nil end

function Adapter:GetChannels()
    local locale = type(_G.GetLocale) == "function" and _G.GetLocale() or "enUS"
    return Data.GetChannels(locale)
end

local function AddTabCandidate(candidates, seen, chatType, channelTarget)
    local key = chatType
    if chatType == "CHANNEL" then
        if not CanAccessValue(channelTarget) then return end
        channelTarget = tonumber(channelTarget)
        if not channelTarget or channelTarget <= 0 then return end
        key = chatType .. ":" .. tostring(channelTarget)
    end
    if seen[key] then return end
    seen[key] = true
    candidates[#candidates + 1] = {
        chatType = chatType,
        channelTarget = channelTarget,
    }
end

function Adapter:SupportsTabChannelSwitch() return true end

function Adapter:IsChatMessagingLocked()
    local chatInfo = _G.C_ChatInfo
    local isLocked = type(chatInfo) == "table" and chatInfo.InChatMessagingLockdown
    if type(isLocked) ~= "function" then return true end
    local ok, locked = pcall(isLocked)
    return not ok or locked ~= false
end

function Adapter:IsNativeTabContext(chatType, text)
    if chatType == "COMMUNITIES_CHANNEL" then return true end
    if type(text) ~= "string" then return true end
    local textOK, first = pcall(string.sub, text, 1, 1)
    return not textOK or first == "/"
end

function Adapter:BuildTabChannelCandidates(module)
    local candidates, seen = {}, {}
    AddTabCandidate(candidates, seen, "SAY")

    local isInGroup = _G.IsInGroup
    local homeCategory = _G.LE_PARTY_CATEGORY_HOME
    local instanceCategory = _G.LE_PARTY_CATEGORY_INSTANCE
    local inHomeGroup = type(isInGroup) == "function" and homeCategory ~= nil
        and isInGroup(homeCategory) == true
    if type(isInGroup) == "function" and instanceCategory ~= nil
        and isInGroup(instanceCategory) == true then
        AddTabCandidate(candidates, seen, "INSTANCE_CHAT")
    elseif inHomeGroup then
        if type(_G.IsInRaid) == "function" and _G.IsInRaid(homeCategory) == true then
            AddTabCandidate(candidates, seen, "RAID")
        else
            AddTabCandidate(candidates, seen, "PARTY")
        end
    end

    if type(_G.IsInGuild) == "function" and _G.IsInGuild() == true then
        AddTabCandidate(candidates, seen, "GUILD")
    end

    local channels = module and module.channels
    local index
    for index = 1, #Data.retailTabChannelKeys do
        local name = channels and channels[Data.retailTabChannelKeys[index]]
        local channelID = name and self:GetChannel(name) or nil
        AddTabCandidate(candidates, seen, "CHANNEL", channelID)
    end
    return candidates
end

function Adapter:HandleTabChannelPressed(module, editBox)
    -- During Blizzard chat messaging lockdown, do not inspect the edit box:
    -- chat type, text, and targets can all be Secret values in this state.
    if self:IsChatMessagingLocked() then return false end
    if not editBox or type(editBox.GetChatType) ~= "function"
        or type(editBox.SetChatType) ~= "function"
        or type(editBox.GetText) ~= "function"
        or type(editBox.UpdateHeader) ~= "function" then
        return false
    end

    local chatTypeOK, chatType = pcall(editBox.GetChatType, editBox)
    if not chatTypeOK or not CanAccessValue(chatType) or chatType == "COMMUNITIES_CHANNEL" then return false end
    local textOK, text = pcall(editBox.GetText, editBox)
    if not textOK or not CanAccessValue(text) or self:IsNativeTabContext(chatType, text) then return false end
    -- Tab candidates never include whispers. The previous recipient is not
    -- consumed by this transition; reading it can strand an otherwise usable
    -- input box after messaging lockdown ends.

    local candidates = self:BuildTabChannelCandidates(module)
    if #candidates == 0 then return false end

    local currentTarget
    if chatType == "CHANNEL" and type(editBox.GetChannelTarget) == "function" then
        local targetOK, target = pcall(editBox.GetChannelTarget, editBox)
        if not targetOK or not CanAccessValue(target) then return false end
        currentTarget = tonumber(target)
    end

    local currentIndex
    local index
    for index = 1, #candidates do
        local candidate = candidates[index]
        if candidate.chatType == chatType
            and (chatType ~= "CHANNEL" or candidate.channelTarget == currentTarget) then
            currentIndex = index
            break
        end
    end

    local reverse = type(_G.IsShiftKeyDown) == "function" and _G.IsShiftKeyDown() == true
    local direction = reverse and -1 or 1
    local nextIndex
    if currentIndex then
        nextIndex = ((currentIndex - 1 + direction) % #candidates) + 1
    else
        nextIndex = reverse and #candidates or 1
    end
    local nextChannel = candidates[nextIndex]
    if nextChannel.chatType == "CHANNEL" and type(editBox.SetChannelTarget) ~= "function" then
        return false
    end

    local applied = pcall(function()
        editBox:SetChatType(nextChannel.chatType)
        if nextChannel.chatType == "CHANNEL" then
            editBox:SetChannelTarget(nextChannel.channelTarget)
        end
        editBox:UpdateHeader()
    end)
    if applied then return true end

    pcall(function()
        editBox:SetChatType(chatType)
        if chatType == "CHANNEL" and currentTarget
            and type(editBox.SetChannelTarget) == "function" then
            editBox:SetChannelTarget(currentTarget)
        end
        editBox:UpdateHeader()
    end)
    return false
end

function Adapter:EnsureTabChannelHook(module)
    if module.tabChannelHookToken ~= nil then return true end
    if type(module.HookSecureFunction) ~= "function"
        or type(_G.ChatEdit_CustomTabPressed) ~= "function" then
        return false
    end
    local ok, token = pcall(
        module.HookSecureFunction,
        module,
        "ChatEdit_CustomTabPressed",
        function(_, editBox) pcall(module.HandleTabChannelPressed, module, editBox) end,
        "chatbar-tab-channel"
    )
    if not ok or token == nil then return false end
    module.tabChannelHookToken = token
    return true
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

function Adapter:GetChatFrame() return _G.SELECTED_DOCK_FRAME or _G.ChatFrame1 end
function Adapter:GetChatAnchorFrame()
    local frame = _G.ChatFrame1
    if frame and type(frame.GetLeft) == "function" then return frame end
    return _G.UIParent
end
function Adapter:GetInputText(frame)
    local editBox = frame and frame.editBox
    return editBox and type(editBox.GetText) == "function" and editBox:GetText() or ""
end
local chatCommandTypes = {
    ["say"] = "SAY", ["yell"] = "YELL", ["g"] = "GUILD", ["o"] = "OFFICER",
    ["p"] = "PARTY", ["i"] = "INSTANCE_CHAT", ["bg"] = "INSTANCE_CHAT",
    ["ra"] = "RAID", ["rw"] = "RAID_WARNING",
}

function Adapter:OpenChat(command, frame)
    if type(_G.ChatFrame_OpenChat) ~= "function" then return false end
    -- OpenChat activates (and renders) the OLD whisper header before parsing
    -- the slash command. Select our explicit destination first, so a secret
    -- whisper target never reaches that header's geometry arithmetic.
    local token = type(command) == "string" and command:match("^/([^%s]+)%s")
    local chatType = token and chatCommandTypes[token]
    local channelID = token and tonumber(token)
    if channelID and channelID > 0 then chatType = "CHANNEL" end
    local override = _G.CHAT_FOCUS_OVERRIDE
    if chatType and not (frame == nil and override and override.supportsSlashCommands) then
        local util = _G.ChatFrameUtil
        local chooseBox = type(util) == "table" and util.ChooseBoxForSend or _G.ChatEdit_ChooseBoxForSend
        if type(chooseBox) ~= "function" then return false end
        local editBox = chooseBox(frame)
        if not editBox or type(editBox.SetChatType) ~= "function" then return false end
        if chatType == "CHANNEL" then
            if type(editBox.SetChannelTarget) ~= "function" then return false end
            editBox:SetChannelTarget(channelID)
        end
        editBox:SetChatType(chatType)
    end
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
function Adapter:IsOffscreenDragEnabled() return false end

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
    local ok, result = pcall(callback, name)
    return ok and result ~= false
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

function Adapter:OpenMacroPanel()
    if type(_G.UIParentLoadAddOn) == "function" and not _G.MacroFrame then
        _G.UIParentLoadAddOn("Blizzard_MacroUI")
    end
    local frame = _G.MacroFrame
    if frame and type(frame.IsShown) == "function" and frame:IsShown() then
        return Call(frame, "Hide")
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
function Adapter:HandleLoot() return self:OpenLootHistory() end
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
function Adapter:OpenSimpleCursor() return self:RunSlash("RSC", "/rsc") end
function Adapter:OpenWarpDeplete()
    local addon = _G.WarpDeplete
    if addon and type(addon.HandleChatCommand) == "function" then addon:HandleChatCommand(""); return true end
    if addon and _G.Settings and type(_G.Settings.OpenToCategory) == "function"
        and addon.categoryID then
        _G.Settings.OpenToCategory(addon.categoryID)
        return true
    end
    return self:RunMacro("/warp")
end
function Adapter:OpenMDT()
    local api = _G.MythicDungeonToolsAPI
    if api and type(api.ShowInterface) == "function" then api.ShowInterface(); return true end
    local addon = _G.MDT
    if addon and type(addon.ShowInterface) == "function" then addon:ShowInterface(); return true end
    local handler = _G.SlashCmdList and _G.SlashCmdList.MYTHICDUNGEONTOOLS
    if type(handler) == "function" then handler(""); return true end
    return self:RunMacro("/mdt")
end
function Adapter:OpenBigWigsKeystone()
    local handler = _G.SlashCmdList and _G.SlashCmdList.bwkey
    if type(handler) == "function" then handler(""); return true end
    return false
end
function Adapter:OpenEllesmereKeystone()
    local handler = _G.SlashCmdList and _G.SlashCmdList.EUIKEYS
    if type(handler) ~= "function" then return false end
    local config = _G.EllesmereUIDB and _G.EllesmereUIDB.keystonePopup
    if config and config.enabled == false then return false end
    handler("")
    return true
end
function Adapter:OpenKeystone(mouseButton)
    if mouseButton == "RightButton" then return self:OpenEllesmereKeystone() end
    if self:OpenBigWigsKeystone() then return true end
    return self:OpenEllesmereKeystone()
end
function Adapter:HandleAddon(key, mouseButton)
    if key == "mdt" then return self:OpenMDT() end
    if key == "keystone" then return self:OpenKeystone(mouseButton) end
    return false
end
function Adapter:OpenCooldownViewer()
    local frame = _G.CooldownViewerSettings
    if not frame then return false end
    if type(frame.IsShown) == "function" and frame:IsShown() then return Call(frame, "Hide") end
    return Call(frame, "Show")
end
function Adapter:OpenExwind()
    local tools = _G.ExwindTools
    return Call(tools, "OpenConfig")
end
function Adapter:OpenEXBoss()
    local addon = _G.ExBoss
    return Call(addon and addon.UI and addon.UI.Panel, "Toggle")
end
function Adapter:OpenEXBRInstaller()
    local handler = _G.SlashCmdList and _G.SlashCmdList.EXBOSSRURUTIA
    if type(handler) ~= "function" then return false end
    handler("")
    return true
end
function Adapter:OpenDandersFrames()
    return Call(_G.DandersFrames, "ToggleGUI")
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
        if provider and type(provider.IsAvailable) == "function" and provider:IsAvailable(self)
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
    if self:IsAddOnLoaded("Rurutia_Timeline") then
        items[#items + 1] = { id = "timeline", label = "露露的时间轴", open = function() return self:RunSlash("RURUTIATIMELINE", nil, false) end }
    end
    if self:IsAddOnLoaded("Rurutia_PowerBar") and ns.PowerBarIntegration then
        items[#items + 1] = {
            id = "powerbar", label = ns.PowerBarIntegration:GetDisplayName(),
            open = function() return self:RunSlash("RURUTIAPOWERBAR", nil, false) end,
        }
    end
    if self:IsAddOnLoaded("RurutiaSA_Trinkets") then
        items[#items + 1] = { id = "trinkets", label = "露露的饰品模块", open = function() self:OpenRSATrinkets() end }
    end
    if self:IsAddOnLoaded("ExwindCore") then
        items[#items + 1] = { id = "exwind", label = "EXWind工具箱", open = function() self:OpenExwind() end }
    end
    if self:IsAddOnLoaded("EXBoss") then
        items[#items + 1] = { id = "exboss", label = "EXBoss副本模块", open = function() self:OpenEXBoss() end }
    end
    if self:IsAddOnLoaded("EXBOSS-RURUTIA") then
        items[#items + 1] = { id = "exbr", label = "EXBoss配置导入", open = function() self:OpenEXBRInstaller() end }
    end
    if self:IsAddOnLoaded("DandersFrames") then
        items[#items + 1] = { id = "danders", label = "队伍/团框设置", open = function() self:OpenDandersFrames() end }
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

local function AddAlias(descriptors, command, kind, value)
    descriptors[#descriptors + 1] = { command = command, kind = kind, value = value }
end
function Adapter:RegisterAliases(module)
    -- Reassigning the global (even to the same table) taints Blizzard's native
    -- slash dispatch, including /tm -> SetRaidTarget. Own only our entries.
    local slashCommands = _G.SlashCmdList
    if type(slashCommands) ~= "table" then return nil end
    local descriptors = {}
    AddAlias(descriptors, "队", "open", "/p "); AddAlias(descriptors, "队伍", "open", "/p ")
    AddAlias(descriptors, "喊", "open", "/yell "); AddAlias(descriptors, "大喊", "open", "/yell ")
    AddAlias(descriptors, "副", "open", "/i "); AddAlias(descriptors, "副本", "open", "/i ")
    AddAlias(descriptors, "团", "open", "/ra "); AddAlias(descriptors, "团队", "open", "/ra ")
    AddAlias(descriptors, "领", "open", "/rw "); AddAlias(descriptors, "团队领袖", "open", "/rw ")
    AddAlias(descriptors, "综", "channel", module.channels.general)
    AddAlias(descriptors, "综合", "channel", module.channels.general)
    AddAlias(descriptors, "交", "channel", module.channels.trade)
    AddAlias(descriptors, "交易", "channel", module.channels.trade)
    AddAlias(descriptors, "寻", "channel", module.channels.lfg)
    AddAlias(descriptors, "寻求组队", "channel", module.channels.lfg)
    AddAlias(descriptors, "世", "channel", module.channels.world)
    AddAlias(descriptors, Data.defaultChannelName, "channel", module.channels.world)
    local index
    for index = 2, 10 do
        local name = Data.defaultChannelName .. tostring(index)
        AddAlias(descriptors, "世" .. tostring(index), "channel", name)
        AddAlias(descriptors, name, "channel", name)
    end
    local token = {}
    for index = 1, #descriptors do
        local descriptor = descriptors[index]
        local key = "RURUTIASUITE_CHATBAR_ALIAS_" .. tostring(index)
        local globalName = "SLASH_" .. key .. "1"
        token[index] = {
            key = key,
            globalName = globalName,
            previousCommand = _G[globalName],
            previousHandler = slashCommands[key],
        }
        _G[globalName] = "/" .. descriptor.command
        slashCommands[key] = function()
            if descriptor.kind == "open" then self:OpenChat(descriptor.value)
            else module:OpenChannelChat(descriptor.value) end
        end
    end
    return token
end
function Adapter:UnregisterAliases(token)
    if type(token) ~= "table" then return false end
    local index
    for index = #token, 1, -1 do
        local record = token[index]
        _G[record.globalName] = record.previousCommand
        if _G.SlashCmdList then _G.SlashCmdList[record.key] = record.previousHandler end
    end
    return true
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
        local editBox = _G.ChatEdit_ChooseBoxForSend()
        if editBox then return editBox end
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

ns.RetailChatBarAdapterBase = ProviderRegistry
ns.ChatBarAdapter = Adapter

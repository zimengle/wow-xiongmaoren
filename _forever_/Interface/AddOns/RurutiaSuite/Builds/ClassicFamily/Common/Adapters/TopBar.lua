local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local Adapter = { family = "classic", buildId = ns.Build.GetID() }
local ADDON_ORDER = { "MeetingHorn", "MeetingStone" }

local function CallGlobal(name, ...)
    local callback = _G[name]
    if type(callback) ~= "function" then return false end
    local ok = pcall(callback, ...)
    return ok and true or false
end

function Adapter:IsAvailable() return self.buildId ~= "unsupported" end
function Adapter:GetRootFrame() return _G.UIParent end
function Adapter:GetTooltip() return _G.GameTooltip end
function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end
function Adapter:IsLoggedIn()
    return type(_G.IsLoggedIn) == "function" and _G.IsLoggedIn() and true or false
end
function Adapter:IsPetBattleActive()
    local api = _G.C_PetBattles
    return api and type(api.IsInBattle) == "function" and api.IsInBattle() and true or false
end
function Adapter:IsAddonLoaded(name)
    local compat = ns.Compat
    if compat and type(compat.IsAddOnLoaded) == "function" then return compat.IsAddOnLoaded(name) end
    local api = _G.C_AddOns
    local callback = api and api.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback(name) and true or false
end
function Adapter:LoadAddon(name)
    if self:IsAddonLoaded(name) then return true end
    local api = _G.C_AddOns
    local callback = api and api.LoadAddOn or _G.LoadAddOn
    if type(callback) ~= "function" then return false end
    local ok, loaded = pcall(callback, name)
    return ok and loaded and true or false
end
function Adapter:GetMeetingStoneAddon()
    local index
    for index = 1, #ADDON_ORDER do
        local name = ADDON_ORDER[index]
        if self:IsAddonLoaded(name) or self:LoadAddon(name) then return name end
    end
    return nil
end
function Adapter:HasMeetingStoneAddon()
    local index
    for index = 1, #ADDON_ORDER do
        local name = ADDON_ORDER[index]
        if self:IsAddonLoaded(name) then return true end
        local api = _G.C_AddOns
        local info = api and api.GetAddOnInfo
        if type(info) == "function" then
            local ok, data = pcall(info, name)
            if ok and data ~= nil then return true end
        end
    end
    return false
end
function Adapter:OpenMeetingStone()
    local name = self:GetMeetingStoneAddon()
    if not name then
        if self.buildId == "classic-infinite" then return self:OpenGroupFinder() end
        return false, "未检测到集结号插件。"
    end
    local compat = ns.Compat
    if compat and type(compat.OpenMeetingStoneAddon) == "function" then
        local ok, result = pcall(compat.OpenMeetingStoneAddon, name)
        return ok and result ~= false
    end
    return false, "集结号插件没有可用入口"
end
function Adapter:OpenGroupFinder()
    if self.buildId == "classic-infinite" then
        if self:IsInCombat() then return false, "战斗中请使用快捷键打开队伍查找器。" end
        local api, styles = _G.C_LFGList, _G.Enum and _G.Enum.PremadeGroupFinderStyle
        if api and type(api.GetPremadeGroupFinderStyle) == "function" and styles
            and api.GetPremadeGroupFinderStyle() == styles.Disabled then
            return false, "队伍查找器尚不可用。"
        end
        if not self:LoadAddon("Blizzard_GroupFinder_VanillaStyle") then
            return false, "队伍查找器尚不可用。"
        end
        if CallGlobal("ToggleGroupFinderFrame") then return true end
        return false, "队伍查找器尚不可用。"
    end
    return CallGlobal("PVEFrame_ToggleFrame") or CallGlobal("ToggleLFGParentFrame")
end
function Adapter:RefreshBlizzardMenuTakeover()
    local extra = ns.Runtime and ns.Runtime.GetModule and ns.Runtime:GetModule("BlizzardEnhancements")
    if not extra or extra.runtimeActive ~= true then return false end
    if type(extra.ApplyBlizzardMicroMenuVisibility) == "function" then
        local ok, result = pcall(extra.ApplyBlizzardMicroMenuVisibility, extra)
        return ok and result ~= false
    end
    return false
end
function Adapter:GetNativeTarget(item)
    return item and (item.nativeTarget or item.tooltipButton)
end
function Adapter:IsNativeTargetAvailable(item)
    local name = self:GetNativeTarget(item)
    return type(name) == "string" and name ~= "" and _G[name] ~= nil
end
function Adapter:IsItemUnavailable(item)
    -- `nativeTarget` means the click is a dependency: unavailable target -> unavailable
    -- entry.  `tooltipButton` alone only decorates the tooltip and never gates the click.
    return item ~= nil and item.nativeTarget ~= nil and not self:IsNativeTargetAvailable(item)
end
function Adapter:RecordSecureAvailability(frame, item)
    local available = self:IsNativeTargetAvailable(item)
    frame.secureAvailable = available
    return available
end
local function ClearSecureClickAction(button)
    -- Clear both mouse buttons, including wildcard fallbacks from an earlier setup.
    local names = { "type1", "macrotext1", "*type1", "*macrotext1",
        "type2", "macrotext2", "*type2", "*macrotext2" }
    local index
    for index = 1, #names do button:SetAttribute(names[index], nil) end
end
function Adapter:ApplySecureClickCombatLock(button, item)
    if not (item and item.secureClickCombatLocked) then return false end
    if type(button.SetAttribute) ~= "function" or type(button.GetAttribute) ~= "function"
        or type(_G.RegisterStateDriver) ~= "function" then return false end
    button:SetAttribute("_onstate-combatlock", [[
        if newstate == "combat" then
            self:SetAttribute("type1", nil)
            self:SetAttribute("macrotext1", nil)
            self:SetAttribute("*type1", nil)
            self:SetAttribute("*macrotext1", nil)
        else
            self:SetAttribute("type1", self:GetAttribute("rs-secure-type1"))
            self:SetAttribute("macrotext1", self:GetAttribute("rs-secure-macrotext1"))
            self:SetAttribute("*type1", self:GetAttribute("rs-secure-type1"))
            self:SetAttribute("*macrotext1", self:GetAttribute("rs-secure-macrotext1"))
        end
    ]])
    _G.RegisterStateDriver(button, "combatlock", "[combat] combat; nocombat")
    -- Registration itself is refused in combat (see RegisterSecureClicks), so the driver is
    -- always installed out of combat and the first state transition is the one that fires.
    return true
end
function Adapter:UnregisterMenuClicks(button)
    -- Idempotent cleanup: safe whether or not the combat lock was ever installed.
    if not button or type(button.SetAttribute) ~= "function" then return false end
    if type(_G.UnregisterStateDriver) == "function" then
        _G.UnregisterStateDriver(button, "combatlock")
    end
    button:SetAttribute("_onstate-combatlock", nil)
    ClearSecureClickAction(button)
    button:SetAttribute("rs-secure-type1", nil)
    button:SetAttribute("rs-secure-macrotext1", nil)
    button:SetAttribute("useOnKeyDown", nil)
    return true
end
function Adapter:RegisterSecureClicks(button, item)
    if self:IsInCombat() or not button then return false end
    if item and item.nativeSecureMenu and (type(button.SetAttribute) ~= "function"
        or type(button.RegisterForClicks) ~= "function") then return false end
    if item and item.secureClickCombatLocked and (type(button.SetAttribute) ~= "function"
        or type(button.GetAttribute) ~= "function" or type(_G.RegisterStateDriver) ~= "function") then
        return false
    end
    local compat = ns.Compat
    if item and item.nativeSecureMenu and type(button.RegisterForClicks) == "function" then
        button:RegisterForClicks("AnyUp", "AnyDown")
    elseif item and item.secureClick and compat and type(compat.RegisterPrimarySecureClicks) == "function" then
        compat.RegisterPrimarySecureClicks(button)
    elseif type(button.RegisterForClicks) == "function" then
        button:RegisterForClicks("AnyUp")
    end
    self:RecordSecureAvailability(button, item)
    if item and item.secureClick and type(button.SetAttribute) == "function" then
        if item.nativeSecureMenu then
            -- Both mouse buttons use the same native route; key-down registration
            -- remains available while this button explicitly activates on release.
            ClearSecureClickAction(button)
            button:SetAttribute("useOnKeyDown", false)
        end
        -- Only an entry that depends on a native target can be unavailable; a plain
        -- secureClick macro is installed as before.
        if self:IsItemUnavailable(item) then
            -- No native target: drop the macro so the button cannot become a silent no-op.
            ClearSecureClickAction(button)
            button:SetAttribute("rs-secure-type1", nil)
            button:SetAttribute("rs-secure-macrotext1", nil)
        else
            -- Only explicit snippet users need saved attributes. Forever keeps its
            -- combat restriction inside the macro and never installs this driver.
            if item.secureClickCombatLocked then
                button:SetAttribute("rs-secure-type1", "macro")
                button:SetAttribute("rs-secure-macrotext1", item.secureClick)
            end
            button:SetAttribute("type1", "macro")
            button:SetAttribute("macrotext1", item.secureClick)
            if item.nativeSecureMenu then
                button:SetAttribute("type2", "macro")
                button:SetAttribute("macrotext2", item.secureClick)
            end
            if item.secureClickCombatLocked then
                button:SetAttribute("*type1", "macro")
                button:SetAttribute("*macrotext1", item.secureClick)
            end
        end
    end
    self:ApplySecureClickCombatLock(button, item)
    return true
end
function Adapter:RegisterPrimarySecureClicks(button)
    if self:IsInCombat() or not button then return false end
    local compat = ns.Compat
    if compat and type(compat.RegisterPrimarySecureClicks) == "function" then
        local ok, result = pcall(compat.RegisterPrimarySecureClicks, button)
        return ok and result ~= false
    end
    if type(button.RegisterForClicks) == "function" then button:RegisterForClicks("AnyUp", "AnyDown") return true end
    return false
end
function Adapter:RegisterThreeButtonSecureClicks(button)
    if self:IsInCombat() or not button then return false end
    local compat = ns.Compat
    if compat and type(compat.RegisterThreeButtonSecureClicks) == "function" then
        local ok, result = pcall(compat.RegisterThreeButtonSecureClicks, button)
        return ok and result ~= false
    end
    return false
end
function Adapter:PrepareMenuItem() return true end
function Adapter:IsEra() return self.buildId == "classic-era" or self.buildId == "classic-infinite" end
function Adapter:IsWrath() return self.buildId == "classic-wrath-legacy" or self.buildId == "classic-titan" end
function Adapter:SupportsStoreVisibility()
    return self.buildId == "classic-titan" or self.buildId == "classic-mists"
        or self.buildId == "classic-anniversary"
end
function Adapter:RunTimeAction(mouseButton)
    if self.buildId ~= "classic-titan" then return false end
    local callback, addon
    if mouseButton == "LeftButton" then callback, addon = "ToggleCalendar", "Blizzard_Calendar"
    elseif mouseButton == "RightButton" then callback, addon = "ToggleTimeManager", "Blizzard_TimeManager"
    else return false end
    if self:IsInCombat() then return false, "战斗中暂时无法打开该界面", "combat-lockdown" end
    if type(_G[callback]) ~= "function" then self:LoadAddon(addon) end
    if type(_G[callback]) ~= "function" then return false, "当前客户端暂不支持此时钟入口。" end
    return CallGlobal(callback)
end
function Adapter:RunMenuAction(item, mouseButton)
    if item and item.isTime then return self:RunTimeAction(mouseButton) end
    local action = item and item.action
    if self.buildId == "classic-infinite" then
        -- Reject stale/foreign menu data as well as the current secure entries.
        -- Never fall back to ordinary Lua for a native panel in Forever.
        if action == "character" or action == "spellbook" or action == "talents"
            or action == "legacy" or action == "quest" or action == "guild"
            or action == "professions" or action == "collections" or action == "classic-pvp" then
            return false
        end
        if self:IsInCombat() then
            return false, "战斗中请使用原生快捷键打开。", "combat-lockdown"
        end
    end
    if action == "character" then
        if self:IsInCombat() then return true, "战斗中无法使用插件按钮开启人物面板，请按快捷键打开。" end
        return CallGlobal("ToggleCharacter", "PaperDollFrame")
    elseif action == "talents" then
        if not CallGlobal("TalentFrame_LoadUI") then CallGlobal("PlayerTalentFrame_LoadUI") end
        local frame = _G.PlayerTalentFrame
        if not frame then return false end
        if type(frame.IsShown) == "function" and frame:IsShown() then
            if type(_G.HideUIPanel) == "function" then _G.HideUIPanel(frame) else frame:Hide() end
        elseif type(_G.ShowUIPanel) == "function" then _G.ShowUIPanel(frame) else frame:Show() end
        return true
    elseif action == "quest" then return CallGlobal("ToggleQuestLog")
    elseif action == "guild" then return CallGlobal("ToggleGuildFrame")
    elseif action == "lfg" then return self:OpenGroupFinder()
    elseif action == "professions" then
        self:LoadAddon("Blizzard_ProfessionsBook")
        return CallGlobal("ToggleProfessionsBook")
    elseif action == "collections" then
        self:LoadAddon("Blizzard_Collections")
        local tab = _G.COLLECTIONS_JOURNAL_TAB_INDEX_MOUNTS or 1
        return CallGlobal("ToggleCollectionsJournal", tab) or CallGlobal("SetCollectionsJournalShown", true, tab) or CallGlobal("ToggleCollectionsJournal")
    elseif action == "journal" then
        if self:IsEra() then return CallGlobal("ToggleWorldMap") end
        if self:IsWrath() then
            self:LoadAddon("Blizzard_Collections")
            return CallGlobal("ToggleCollectionsJournal", 5) or CallGlobal("SetCollectionsJournalShown", true, 5) or CallGlobal("ToggleCollectionsJournal")
        end
        return CallGlobal("ToggleEncounterJournal")
    elseif action == "classic-pvp" then return CallGlobal("TogglePVPFrame")
    elseif action == "bags" then return CallGlobal("ToggleAllBags")
    elseif action == "main" then
        -- ToggleGameMenu runs ESC game actions, including protected SpellStopCasting.
        -- An addon Lua click must only toggle the panel, even outside combat.
        if type(_G.ToggleFrame) == "function" and _G.GameMenuFrame then return pcall(_G.ToggleFrame, _G.GameMenuFrame) end
    end
    return false
end
function Adapter:GetMenuTooltip(item)
    if item.isTime and self.buildId == "classic-titan" then
        return "左键：日历\n右键：闹钟（客户端支持时）"
    end
    if item.tooltip == "character" then return _G.CHARACTER_BUTTON or "角色信息" end
    if item.tooltip == "journal" then
        if self:IsEra() then return "世界地图" end
        if self:IsWrath() then return "幻化外观（藏品）" end
        return "地下城手册"
    end
    if item.tooltip == "main" then return _G.MAINMENU_BUTTON or "主菜单" end
    return item.tooltip
end
function Adapter:GetItemCooldown(id)
    if type(_G.GetItemCooldown) == "function" then return _G.GetItemCooldown(id) end
    return 0, 0
end
function Adapter:GetItemIcon() return nil end
function Adapter:GetPlayerClassColor()
    local class
    if type(_G.UnitClass) == "function" then _, class = _G.UnitClass("player") end
    local colors = _G.CUSTOM_CLASS_COLORS or _G.RAID_CLASS_COLORS
    local color = class and colors and colors[class]
    return color and color.r or 1, color and color.g or 1, color and color.b or 1
end
function Adapter:GetFontPath(kind)
    local font = ns.Font
    if kind == "time" and font and type(font.GetTimeFontPath) == "function" then return font:GetTimeFontPath() end
    if font and type(font.GetInterfaceFontPath) == "function" then return font:GetInterfaceFontPath() end
    return "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
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
function Adapter:SupportsAutoMark()
    return ns.Build.GetCapability("autoMark", false) == true
end
function Adapter:OpenGuide()
    local guide = ns.Runtime and ns.Runtime.GetModule and ns.Runtime:GetModule("Guide")
    if guide and type(guide.Open) == "function" then return guide:Open() end
    if type(ns.OpenGuide) == "function" then return ns:OpenGuide() end
    return false
end
function Adapter:ToggleAutoMarkSettings()
    if not self:SupportsAutoMark() then return false end
    return ns.UI and type(ns.UI.OpenMain) == "function" and ns.UI:OpenMain("autoMark") or false
end
function Adapter:ShouldClampToScreen()
    return not (type(ns.IsOffscreenDragEnabled) == "function" and ns:IsOffscreenDragEnabled())
end

ns.TopBarAdapter = Adapter
ns.TopBarClassicAdapter = Adapter

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")
    and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local Adapter = { family = "retail", buildId = ns.Build.GetID() }
function Adapter:ShouldClampToScreen()
    return not (type(ns.IsOffscreenDragEnabled) == "function" and ns:IsOffscreenDragEnabled())
end

local ADDON_ORDER = { "MeetingStone", "MeetingHorn" }
local TAKEOVER_METHODS = { "ApplyBlizzardMicroMenuVisibility", "ApplyBlizzardBackpackButtonVisibility" }
local WEEKDAYS = { "日", "一", "二", "三", "四", "五", "六" }
local MONTHS = { "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" }

local function CallGlobal(name, ...)
    local callback = _G[name]
    if type(callback) ~= "function" then return false end
    local ok = pcall(callback, ...)
    return ok and true or false
end

local function Join(parts)
    return table.concat(parts, " · ")
end

local function SafeFinite(adapter, value)
    if adapter:IsSecretValue(value) then return nil end
    value = tonumber(value)
    if not value or value ~= value or value == math.huge or value == -math.huge then return nil end
    return value
end

local function SafeText(adapter, value)
    if adapter:IsSecretValue(value) or type(value) ~= "string" or value == "" then return nil end
    return value
end

local function FormatClock(adapter, hour, minute)
    hour, minute = SafeFinite(adapter, hour), SafeFinite(adapter, minute)
    if not hour or not minute then return "--:--" end
    if type(_G.GetCVarBool) ~= "function" or _G.GetCVarBool("timeMgrUseMilitaryTime") then
        return string.format("%02d:%02d", hour, minute)
    end
    local suffix = hour < 12 and "AM" or "PM"
    hour = hour % 12
    if hour == 0 then hour = 12 end
    return string.format("%d:%02d %s", hour, minute, suffix)
end

function Adapter:IsAvailable() return self.buildId == "retail" end
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
    return api and type(api.IsAddOnLoaded) == "function" and api.IsAddOnLoaded(name) and true or false
end
function Adapter:LoadAddon(name)
    if self:IsAddonLoaded(name) then return true end
    local api = _G.C_AddOns
    if not api or type(api.LoadAddOn) ~= "function" then return false end
    local ok, loaded = pcall(api.LoadAddOn, name)
    return ok and loaded and true or false
end
function Adapter:GetMeetingStoneAddon()
    local index
    for index = 1, #ADDON_ORDER do
        if self:IsAddonLoaded(ADDON_ORDER[index]) then return ADDON_ORDER[index] end
    end
    return nil
end
function Adapter:OpenMeetingStone()
    local lychee = _G.LycheeGroup
    if lychee and type(lychee.Open) == "function" then
        local ok, result = pcall(lychee.Open, lychee, "find")
        if ok and result ~= false then return true end
    end
    local name = self:GetMeetingStoneAddon()
    if not name then return false, "未检测到集合石插件" end
    local compat = ns.Compat
    if compat and type(compat.OpenMeetingStoneAddon) == "function" then
        local ok, result = pcall(compat.OpenMeetingStoneAddon, name)
        return ok and result ~= false
    end
    local addon = _G[name]
    if addon and type(addon.Toggle) == "function" then return pcall(addon.Toggle, addon) end
    return false, "集合石插件没有可用入口"
end
function Adapter:OpenGroupFinder()
    if type(_G.PVEFrame_ToggleFrame) ~= "function" then
        return false, "队伍查找器尚未加载"
    end
    local ok = pcall(_G.PVEFrame_ToggleFrame)
    if not ok then return false, "队伍查找器打开失败" end
    return true
end
function Adapter:RefreshBlizzardMenuTakeover()
    local extra = ns.Runtime and ns.Runtime.GetModule and ns.Runtime:GetModule("BlizzardEnhancements")
    if not extra or extra.runtimeActive ~= true then return false end
    local refreshed = true
    for _, method in ipairs(TAKEOVER_METHODS) do
        local callback = extra[method]
        if type(callback) == "function" then
            local ok, result = pcall(callback, extra)
            refreshed = ok and result ~= false and refreshed
        else
            refreshed = false
        end
    end
    return refreshed
end
function Adapter:RegisterSecureClicks(button, item)
    if self:IsInCombat() or not button then return false end
    if item and item.combatLocked and (type(button.SetAttribute) ~= "function"
        or type(button.GetAttribute) ~= "function" or type(_G.RegisterStateDriver) ~= "function"
        or type(_G.UnregisterStateDriver) ~= "function") then return false end
    if type(button.RegisterForClicks) == "function" then button:RegisterForClicks("AnyUp") end
    if item and item.nativeMacroButton and type(button.SetAttribute) == "function" then
        local available = _G[item.nativeMacroButton] ~= nil
        button:SetAttribute("useOnKeyDown", false)
        button:SetAttribute("*macrotext1", available and ("/click " .. item.nativeMacroButton) or nil)
        button:SetAttribute("*macrotext2", available and ("/click " .. item.nativeMacroButton) or nil)
        button:SetAttribute("*type1", available and "macro" or nil)
        button:SetAttribute("*type2", available and "macro" or nil)
    end
    local native = item and item.nativeButton and _G[item.nativeButton]
    local rightNative = item and item.rightNativeButton and _G[item.rightNativeButton]
    if native and type(button.SetAttribute) == "function" then
        button:SetAttribute("*clickbutton1", native)
        button:SetAttribute("useOnKeyDown", false)
        button:SetAttribute("*type1", "click")
    end
    if rightNative and type(button.SetAttribute) == "function" then
        button:SetAttribute("*clickbutton2", rightNative)
        button:SetAttribute("useOnKeyDown", false)
        button:SetAttribute("*type2", "click")
    end
    if item and item.combatLocked then
        button:SetAttribute("rs-type1", button:GetAttribute("*type1"))
        button:SetAttribute("rs-type2", button:GetAttribute("*type2"))
        button:SetAttribute("_onstate-combatlock", [[
            if newstate == "combat" then
                self:SetAttribute("*type1", nil)
                self:SetAttribute("*type2", nil)
            else
                self:SetAttribute("*type1", self:GetAttribute("rs-type1"))
                self:SetAttribute("*type2", self:GetAttribute("rs-type2"))
            end
        ]])
        _G.RegisterStateDriver(button, "combatlock", "[combat] combat; nocombat")
    end
    return true
end
function Adapter:UnregisterMenuClicks(button)
    if self:IsInCombat() or not button or type(button.GetAttribute) ~= "function"
        or not button:GetAttribute("_onstate-combatlock") then return false end
    if type(_G.UnregisterStateDriver) ~= "function" then return false end
    _G.UnregisterStateDriver(button, "combatlock")
    button:SetAttribute("_onstate-combatlock", nil)
    button:SetAttribute("*type1", nil)
    button:SetAttribute("*type2", nil)
    button:SetAttribute("rs-type1", nil)
    button:SetAttribute("rs-type2", nil)
    return true
end
function Adapter:RegisterPrimarySecureClicks(button)
    if self:IsInCombat() or not button or type(button.RegisterForClicks) ~= "function" then return false end
    button:RegisterForClicks("AnyUp", "AnyDown")
    return true
end
function Adapter:RegisterCombatHideDriver(button)
    if self:IsInCombat() or not button or type(button.SetAttribute) ~= "function" then return false end
    button:SetAttribute("_onstate-combat", [[if newstate == "combat" then self:Hide() end]])
    if type(_G.RegisterStateDriver) ~= "function" then return false end
    _G.RegisterStateDriver(button, "combat", "[combat] combat; nocombat")
    return true
end
function Adapter:UnregisterCombatHideDriver(button)
    if self:IsInCombat() or not button or type(_G.UnregisterStateDriver) ~= "function" then return false end
    _G.UnregisterStateDriver(button, "combat")
    return true
end
function Adapter:PrepareMenuItem(item)
    -- Kept as a no-op for the shared view contract; never taint Blizzard tab state.
    return true
end
function Adapter:ToggleDungeonJournal(mouseButton)
    if mouseButton ~= "LeftButton" then return false end
    local canShow = _G.CanShowEncounterJournal
    if type(canShow) == "function" then
        local ok, available = pcall(canShow)
        if not ok or not available then return false end
    end
    if type(_G.EncounterJournal_LoadUI) ~= "function" then return false end
    local loadedOK, loaded = pcall(_G.EncounterJournal_LoadUI)
    if not loadedOK or loaded == false then return false end
    local journal = _G.EncounterJournal
    local tab = journal and journal.dungeonsTab
    local selectTab = _G.EJ_ContentTab_Select
    if not (journal and tab and type(tab.GetID) == "function"
        and type(journal.IsShown) == "function" and type(selectTab) == "function") then return false end
    local idOK, tabID = pcall(tab.GetID, tab)
    if not idOK or type(tabID) ~= "number" then return false end
    local shownOK, shown = pcall(journal.IsShown, journal)
    if not shownOK then return false end
    if shown and journal.selectedTab == tabID then return CallGlobal("HideUIPanel", journal) end
    if not shown and not CallGlobal("ShowUIPanel", journal) then return false end
    return CallGlobal("EJ_ContentTab_Select", tabID)
end
function Adapter:RunMenuAction(item, mouseButton)
    local action = item and item.action
    if item and item.isTime then
        return self:RunTimeAction(mouseButton)
    elseif action == "journal" then
        return self:ToggleDungeonJournal(mouseButton)
    elseif action == "pvp" then
        if mouseButton == "LeftButton" or mouseButton == "MiddleButton" then
            if type(_G.PVEFrame_ToggleFrame) ~= "function" then self:LoadAddon("Blizzard_GroupFinder") end
            return CallGlobal("PVEFrame_ToggleFrame", mouseButton == "MiddleButton" and "GroupFinderFrame" or "ChallengesFrame")
        elseif mouseButton == "RightButton" then
            return CallGlobal("TogglePVPUI") or CallGlobal("PVPUIFrame_ToggleFrame")
        end
        return false
    elseif action == "bags" then
        return CallGlobal("ToggleAllBags")
    elseif action == "main" and mouseButton == "LeftButton" then
        if type(_G.ToggleFrame) == "function" and _G.GameMenuFrame then
            return pcall(_G.ToggleFrame, _G.GameMenuFrame)
        end
    end
    return false
end

function Adapter:IsTimeTooltipReadBlocked()
    local challenge = _G.C_ChallengeMode
    if challenge and type(challenge.IsChallengeModeActive) == "function" then
        local ok, active = pcall(challenge.IsChallengeModeActive)
        if not ok or self:IsSecretValue(active) or active == true then return true end
    end
    if not self:IsInCombat() or type(_G.IsInInstance) ~= "function" then return false end
    local ok, _, instanceType = pcall(_G.IsInInstance)
    if not ok or self:IsSecretValue(instanceType) then return true end
    return instanceType == "raid" or instanceType == "pvp" or instanceType == "arena"
end
function Adapter:RequestTimeTooltipInfo()
    if self:IsTimeTooltipReadBlocked() or type(_G.RequestRaidInfo) ~= "function" then return false end
    return pcall(_G.RequestRaidInfo)
end
function Adapter:FormatReset(seconds)
    seconds = SafeFinite(self, seconds)
    if not seconds or seconds <= 0 then return "" end
    if type(_G.SecondsToTime) == "function" then
        local ok, text = pcall(_G.SecondsToTime, seconds, true, nil, 3)
        if ok and type(text) == "string" then return text end
    end
    return string.format("%d小时", math.floor(seconds / 3600))
end
function Adapter:GetCalendarDateText()
    local api = _G.C_DateAndTime
    local current
    if api and type(api.GetCurrentCalendarTime) == "function" then
        local ok, value = pcall(api.GetCurrentCalendarTime)
        if ok and type(value) == "table" then current = value end
    end
    if current then
        local year = SafeFinite(self, current.year)
        local month = SafeFinite(self, current.month)
        local day = SafeFinite(self, current.monthDay)
        local weekday = SafeFinite(self, current.weekday)
        local localizedWeekdays = _G.CALENDAR_WEEKDAY_NAMES
        local localizedMonths = _G.CALENDAR_FULLDATE_MONTH_NAMES
        local fullDate = SafeText(self, _G.FULLDATE)
        if year and month and day and weekday and fullDate
            and type(localizedWeekdays) == "table" and type(localizedMonths) == "table"
            and SafeText(self, localizedWeekdays[weekday]) and SafeText(self, localizedMonths[month]) then
            local ok, text = pcall(string.format, fullDate, localizedWeekdays[weekday],
                localizedMonths[month], day, year)
            if ok and type(text) == "string" then return text end
        end
        if year and month and day and weekday and MONTHS[month] and WEEKDAYS[weekday] then
            return string.format("%d年%s%d日 星期%s", year, MONTHS[month], day, WEEKDAYS[weekday])
        end
    end
    if type(_G.date) == "function" then
        local ok, text = pcall(_G.date, "%Y-%m-%d")
        if ok and type(text) == "string" then return text end
    end
    return ""
end
function Adapter:CollectTimeTooltipEntries()
    local entries = {}
    if self:IsTimeTooltipReadBlocked() then return entries end
    if type(_G.GetNumSavedWorldBosses) == "function" and type(_G.GetSavedWorldBossInfo) == "function" then
        local ok, count = pcall(_G.GetNumSavedWorldBosses)
        count = ok and SafeFinite(self, count) or nil
        local index
        for index = 1, count or 0 do
            local read, name, _, reset = pcall(_G.GetSavedWorldBossInfo, index)
            name = read and SafeText(self, name) or nil
            if name then entries[#entries + 1] = {
                order = 1, section = "世界首领", name = name, detail = self:FormatReset(reset),
            } end
        end
    end
    if type(_G.GetNumSavedInstances) == "function" and type(_G.GetSavedInstanceInfo) == "function" then
        local ok, count = pcall(_G.GetNumSavedInstances)
        count = ok and SafeFinite(self, count) or nil
        local index
        for index = 1, count or 0 do
            local read, name, _, reset, difficultyID, locked, extended, _, isRaid, _, difficultyName, numEncounters, progress =
                pcall(_G.GetSavedInstanceInfo, index)
            name = read and SafeText(self, name) or nil
            local safeLocked = not self:IsSecretValue(locked) and locked == true
            local safeExtended = not self:IsSecretValue(extended) and extended == true
            local safeRaid = not self:IsSecretValue(isRaid) and type(isRaid) == "boolean"
            local difficulty = SafeFinite(self, difficultyID)
            numEncounters = SafeFinite(self, numEncounters)
            progress = SafeFinite(self, progress)
            local isDungeon = safeRaid and not isRaid and (difficulty == 23 or numEncounters and numEncounters > 0)
            if name and safeRaid and (safeLocked or safeExtended) and (isRaid or isDungeon) then
                local parts = {}
                local difficultyText = SafeText(self, difficultyName)
                if difficultyText then parts[#parts + 1] = difficultyText end
                if progress and numEncounters and numEncounters > 0 then
                    parts[#parts + 1] = string.format("%d/%d", progress, numEncounters)
                end
                local resetText = self:FormatReset(reset)
                if resetText ~= "" then parts[#parts + 1] = resetText end
                if safeExtended then parts[#parts + 1] = "已延长" end
                entries[#entries + 1] = {
                    order = isRaid and 3 or 2,
                    section = isRaid and "团队副本" or "地下城",
                    name = name,
                    detail = Join(parts),
                }
            end
        end
    end
    table.sort(entries, function(left, right)
        if left.order ~= right.order then return left.order < right.order end
        if left.name ~= right.name then return left.name < right.name end
        return left.detail < right.detail
    end)
    return entries
end
function Adapter:GetTimeTooltipData()
    local localTime
    if type(_G.date) == "function" then
        local ok, value = pcall(_G.date, "*t")
        if ok and type(value) == "table" then localTime = value end
    end
    local realmHour, realmMinute
    if type(_G.GetGameTime) == "function" then
        local ok, hour, minute = pcall(_G.GetGameTime)
        if ok then realmHour, realmMinute = hour, minute end
    end
    local weeklyReset = ""
    local api = _G.C_DateAndTime
    if api and type(api.GetSecondsUntilWeeklyReset) == "function" then
        local ok, seconds = pcall(api.GetSecondsUntilWeeklyReset)
        if ok then weeklyReset = self:FormatReset(seconds) end
    end
    return {
        dateText = self:GetCalendarDateText(),
        localTime = localTime and FormatClock(self, localTime.hour, localTime.min) or "--:--",
        realmTime = FormatClock(self, realmHour, realmMinute),
        blocked = self:IsTimeTooltipReadBlocked(),
        entries = self:CollectTimeTooltipEntries(),
        weeklyReset = weeklyReset,
    }
end
function Adapter:RunTimeAction(mouseButton)
    if mouseButton == "RightButton" then return CallGlobal("ToggleTimeManager") end
    if mouseButton ~= "LeftButton" and mouseButton ~= "MiddleButton" then return false end
    if self:IsInCombat() then return false, "战斗中暂时无法打开该界面", "combat-lockdown" end
    if mouseButton == "LeftButton" then return CallGlobal("ToggleCalendar") end
    if CallGlobal("WeeklyRewards_ShowUI") then return true end
    self:LoadAddon("Blizzard_WeeklyRewards")
    return CallGlobal("WeeklyRewards_ShowUI")
end
function Adapter:GetMenuTooltip(item)
    if item.tooltip == "character" then return _G.CHARACTER_BUTTON or "角色信息" end
    if item.tooltip == "housing" then return _G.HOUSING_MICRO_BUTTON or "家宅" end
    if item.tooltip == "pvp" then
        return "|cffffffff左：|r大秘境面板\n|cffffffff右：|rPVP、排战场\n|cffffffff中：|r队伍查找器"
    end
    if item.tooltip == "main" then
        local text = _G.MAINMENU_BUTTON or "主菜单"
        if type(_G.GetFramerate) == "function" then
            text = text .. "\n \n每秒帧数: " .. math.floor(_G.GetFramerate()) .. (_G.FPS_ABBR or "fps")
        end
        if type(_G.GetNetStats) == "function" then
            local _, _, homePing, worldPing = _G.GetNetStats()
            text = text .. "\n \n本地延迟: " .. math.floor(homePing or 0) .. (_G.MILLISECONDS_ABBR or "ms")
                .. "\n世界延迟: " .. math.floor(worldPing or 0) .. (_G.MILLISECONDS_ABBR or "ms")
        end
        return text
    end
    return item.tooltip
end
function Adapter:GetItemCount(id)
    local api = _G.C_Item
    local callback = api and api.GetItemCount or _G.GetItemCount
    return type(callback) == "function" and (callback(id) or 0) or 0
end
function Adapter:PlayerHasToy(id)
    return type(_G.PlayerHasToy) == "function" and _G.PlayerHasToy(id) and true or false
end
function Adapter:IsToyUsable(id)
    local api = _G.C_ToyBox
    return not api or type(api.IsToyUsable) ~= "function" or api.IsToyUsable(id) and true or false
end
function Adapter:GetItemInfo(id)
    local api = _G.C_Item
    local callback = api and api.GetItemInfo or _G.GetItemInfo
    if type(callback) ~= "function" then return nil end
    local name, _, _, _, _, _, _, _, _, icon = callback(id)
    return name, icon
end
function Adapter:RequestItemInfo(id)
    local api = _G.C_Item
    if api and type(api.RequestLoadItemDataByID) == "function" then
        api.RequestLoadItemDataByID(id)
        return true
    end
    return false
end
function Adapter:GetItemCooldown(id)
    local api = _G.C_Item
    local callback = api and api.GetItemCooldown or _G.GetItemCooldown
    if type(callback) ~= "function" then return 0, 0 end
    local ok, start, duration = pcall(callback, id)
    if not ok then return 0, 0 end
    return start, duration
end
function Adapter:IsSecretValue(value)
    local callback = _G.issecretvalue
    if type(callback) ~= "function" then return false end
    local ok, secret = pcall(callback, value)
    return ok and secret and true or false
end
function Adapter:GetTime()
    if type(_G.GetTime) ~= "function" then return 0 end
    local ok, value = pcall(_G.GetTime)
    if not ok or self:IsSecretValue(value) then return 0 end
    return tonumber(value) or 0
end
function Adapter:GetItemIcon(id)
    local api = _G.C_Item
    if api and type(api.GetItemIconByID) == "function" then
        local icon = api.GetItemIconByID(id)
        if icon then return icon end
    end
    if type(_G.GetItemIcon) == "function" then
        local icon = _G.GetItemIcon(id)
        if icon then return icon end
    end
    local _, icon = self:GetItemInfo(id)
    return icon
end
function Adapter:GetPlayerClassColor()
    local _, class = type(_G.UnitClass) == "function" and _G.UnitClass("player") or nil, nil
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
function Adapter:IsPartyInstance()
    if type(_G.IsInGroup) ~= "function" or not _G.IsInGroup() then return false end
    if type(_G.IsInRaid) == "function" and _G.IsInRaid() then return false end
    if type(_G.IsInInstance) ~= "function" then return false end
    local inInstance, instanceType = _G.IsInInstance()
    return inInstance and instanceType == "party" or false
end
function Adapter:GetPlayerSpecializationRole()
    local specializationApi = _G.C_SpecializationInfo
    local getSpecialization = specializationApi and specializationApi.GetSpecialization
        or _G.GetSpecialization
    if type(getSpecialization) ~= "function" then return "NONE", "specialization-api-unavailable" end
    local ok, specialization = pcall(getSpecialization)
    if not ok or not specialization then return "NONE", "specialization-unavailable" end

    local getInfo = specializationApi and specializationApi.GetSpecializationInfo
        or _G.GetSpecializationInfo
    if type(getInfo) == "function" then
        local infoOK, specID, name, description, icon, role = pcall(getInfo, specialization)
        if infoOK and role and role ~= "NONE" then return role end
    end
    if type(_G.GetSpecializationRole) == "function" then
        local roleOK, role = pcall(_G.GetSpecializationRole, specialization)
        if roleOK and role and role ~= "NONE" then return role end
    end
    return "NONE", "specialization-role-unavailable"
end

function Adapter:GetRoleMarkerUnit(role)
    if type(_G.UnitGroupRolesAssigned) ~= "function" or type(_G.UnitExists) ~= "function" then
        return nil, "role-api-unavailable"
    end
    local units = { "player", "party1", "party2", "party3", "party4" }
    local index
    for index = 1, #units do
        local unit = units[index]
        local assigned = _G.UnitExists(unit) and _G.UnitGroupRolesAssigned(unit) or "NONE"
        if unit == "player" and (not assigned or assigned == "NONE") then
            assigned = self:GetPlayerSpecializationRole()
        end
        if assigned == role then return unit end
    end
    return nil, "role-unavailable"
end
function Adapter:GetRoleMarkerMarks()
    local module = ns.Runtime and ns.Runtime.GetModule and ns.Runtime:GetModule("RoleMarker")
    local tank = module and type(module.GetTankMark) == "function" and module:GetTankMark() or 2
    local healer = module and type(module.GetHealerMark) == "function" and module:GetHealerMark() or 1
    return tank, healer
end
function Adapter:IsRoleMarkerActive()
    local module = ns.Runtime and ns.Runtime.GetModule and ns.Runtime:GetModule("RoleMarker")
    return module and type(module.IsFeatureActive) == "function" and module:IsFeatureActive() and true or false
end
function Adapter:IsRoleMarkerEnabled()
    local module = ns.Runtime and ns.Runtime.GetModule and ns.Runtime:GetModule("RoleMarker")
    local profile = module and module.db and module.db.profile
    if not profile or profile.enabled == false then return false end
    if profile.leaderOnly and type(_G.IsInGroup) == "function" and _G.IsInGroup()
        and type(_G.UnitIsGroupLeader) == "function" and not _G.UnitIsGroupLeader("player") then
        return false
    end
    return true
end
function Adapter:OpenRoleMarkerSettings()
    return ns.UI and type(ns.UI.OpenMain) == "function"
        and ns.UI:OpenMain("role-marker") or false
end
function Adapter:GetAddonProfileModule()
    return ns.Runtime and ns.Runtime.GetModule and ns.Runtime:GetModule("AddonProfile") or nil
end

ns.TopBarAdapter = Adapter
ns.TopBarRetailAdapter = Adapter

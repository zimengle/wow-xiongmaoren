local _, ns = ...

function ns:IsBarModuleSupported()
    return self.Build.GetCapability("barModules", false) == true
end

function ns:IsWoW12OrLater()
    return self.Build.GetInterfaceVersion() >= 120000
end

function ns:IsSetupAddonLoaded()
    return self.Compat.IsAddOnLoaded("RurutiaSuite_Setup")
end

function ns:GetModule(name)
    return self.Runtime:GetModule(name)
end

function ns:GetThemeColorCode(useClassColor)
    local class
    if type(_G.UnitClass) == "function" then
        _, class = _G.UnitClass("player")
    end
    if not useClassColor and class == "PRIEST" then
        return "|cff00ff00"
    end
    local color = _G.RAID_CLASS_COLORS and _G.RAID_CLASS_COLORS[class]
    if color then
        return string.format("|cFF%02x%02x%02x", color.r * 255, color.g * 255, color.b * 255)
    end
    return "|cFFFFD700"
end

function ns:GetColoredProjectName()
    return self:GetThemeColorCode(true) .. "[露露]|r 工具箱"
end

local RETAIL_TABS = {
    { value = "movemanager", text = "移动管理" },
    { value = "appearance", text = "界面样式" },
    { value = "fast-focus", text = "快速焦点", module = "FastFocus" },
    { value = "topBar", text = "顶部组件", module = "TopBar" },
    { value = "experience-bar", text = "经验条", module = "ExperienceBar" },
    { value = "chat-bar", text = "聊天条", module = "ChatBar" },
    { value = "raidMarker", text = "标记栏", module = "RaidMarker" },
    { value = "combat", text = "战斗提醒", module = "CombatReminder" },
    { value = "cvar", text = "CVAR设置", module = "CVarSettings" },
    { value = "player-tooltip", text = "鼠标增强", module = "PlayerTooltip" },
    { value = "extratools", text = "插件增强", module = "ExtraTools" },
}

local function Add(tabs, value, text)
    tabs[#tabs + 1] = { value = value, text = text }
end

function ns:GetMainTabDefinitions()
    if self.Build.IsFamily("classic") and self.TabRegistry and self.TabRegistry.GetDefinitions then
        return self.TabRegistry:GetDefinitions()
    end

    local tabs = {}
    if self:IsSetupAddonLoaded() then
        Add(tabs, "import", "导入预设")
        Add(tabs, "abilitytimeline", "配置管理")
    end
    if self.Build.HasModule("AddonProfile") then
        Add(tabs, "addonprofile", "插件管理")
    end
    local index
    for index = 1, #RETAIL_TABS do
        local tab = RETAIL_TABS[index]
        if tab.module == nil or self.Build.HasModule(tab.module) then
            Add(tabs, tab.value, tab.text)
        end
    end
    if self.Compat.IsAutoMarkSupported() then
        Add(tabs, "autoMark", "自动标记")
    end
    if self.Build.HasModule("MagePortal") and self:IsBarModuleSupported() then
        Add(tabs, "portal", "法师动作条")
    end
    Add(tabs, "about", "关于")
    return tabs
end

function ns:RefreshMainTabs()
    local window = self.UISystem and self.UISystem.mainWindow
    if window and window.RefreshNavigation then
        return window:RefreshNavigation()
    end
    return false
end

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local Registry = { providers = {}, byID = {} }

local function CallBoolean(provider, method, ...)
    local callback = provider and provider[method]
    if type(callback) ~= "function" then return false end
    local ok, result = pcall(callback, provider, ...)
    return ok and result == true
end

function Registry:Register(provider)
    if type(provider) ~= "table" or type(provider.id) ~= "string" or provider.id == "" then
        error("TopBar provider requires a non-empty id", 2)
    end
    if ns.Integrations and not ns.Integrations:IsProviderAllowed(provider.id) then return nil end
    if self.byID[provider.id] ~= nil then error("Duplicate TopBar provider: " .. provider.id, 2) end
    provider.addonNames = provider.addonNames or {}
    self.providers[#self.providers + 1] = provider
    self.byID[provider.id] = provider
    return provider
end

function Registry:HasRuntimeConflict(module)
    local index
    for index = 1, #self.providers do
        if CallBoolean(self.providers[index], "HasRuntimeConflict", module) then return true end
    end
    return false
end

function Registry:ShouldHideMicroMenu(profile, module)
    local index
    for index = 1, #self.providers do
        if CallBoolean(self.providers[index], "ShouldHideMicroMenu", profile, module) then return true end
    end
    return false
end

function Registry:InstallRuntimeHooks(module)
    local installed = false
    local index
    for index = 1, #self.providers do
        if CallBoolean(self.providers[index], "InstallRuntimeHooks", module) then installed = true end
    end
    return installed
end

function Registry:ShouldRefreshForAddon(addonName)
    local index
    for index = 1, #self.providers do
        if self.providers[index].addonNames[addonName] == true then return true end
    end
    return false
end

if ns.Build.GetID() == "classic-infinite" then
    local QuestGuide = {
        addonName = "Polestar",
    }
    local localized = {
        deDE = true, esES = true, esMX = true, frFR = true, koKR = true,
        ptBR = true, ruRU = true, zhCN = true, zhTW = true,
    }

    local function IsLoaded(name)
        local api = _G.C_AddOns
        if api and type(api.IsAddOnLoaded) == "function" then
            local loadingOrLoaded, loaded = api.IsAddOnLoaded(name)
            if loaded ~= nil then return loaded end
            return loadingOrLoaded
        end
        return ns.Compat.IsAddOnLoaded(name)
    end

    local function IsInstalled(name)
        local api = _G.C_AddOns
        local info = api and (api.DoesAddOnExist or api.GetAddOnInfo) or _G.GetAddOnInfo
        if type(info) ~= "function" then return false end
        local ok, found = pcall(info, name)
        return ok and (found == true or found == name)
    end

    function QuestGuide:IsInstalled()
        return IsLoaded(self.addonName) or IsInstalled(self.addonName)
    end

    function QuestGuide:GetController()
        if not IsLoaded(self.addonName) then return end
        local guide = _G[self.addonName]
        if type(guide) == "table" and type(guide.ToggleHidden) == "function"
            and type(guide.Maps) == "table" and type(guide.Maps.ShowMenu) == "function" then
            return guide
        end
    end

    function QuestGuide:GetIconState()
        local guide = self:GetController()
        if not guide then return "unavailable" end
        local window = guide.UI and guide.UI.GuideFrame
        if window and (not window.frame or not window.frame:IsVisible()) then return "closed" end
        return "open"
    end

    function QuestGuide:SubscribeVisibility(onChanged)
        local guide = self:GetController()
        if not guide or type(guide.On) ~= "function" or type(guide.Off) ~= "function" then return end
        local window = guide.On("GUIDE_VISIBILITY", onChanged)
        local hidden = guide.On("POLESTAR_HIDDEN", onChanged)
        return function()
            guide.Off(window)
            guide.Off(hidden)
        end
    end

    local function FindUnloadedDependency(api, enabledOnly, ...)
        for index = 1, select("#", ...) do
            local name = select(index, ...)
            if name and not IsLoaded(name)
                and (not enabledOnly or IsInstalled(name) and api.GetAddOnEnableState(name) > 0) then
                return name
            end
        end
    end

    local function CanLoadOnDemand(api, name)
        if not (api.LoadAddOn and api.GetAddOnDependencies and api.GetAddOnOptionalDependencies and _G.GetLocale) then
            return false, "当前客户端无法确认能否单独加载北极星。"
        end
        local dependency = FindUnloadedDependency(api, false, api.GetAddOnDependencies(name))
            or FindUnloadedDependency(api, true, api.GetAddOnOptionalDependencies(name))
        if dependency then return false, "单独加载北极星需要先处理依赖 " .. dependency .. "。" end

        -- Polestar loads its enabled UI language pack while running its TOC.
        local locale = GetLocale()
        local pack = localized[locale] and (name .. "_" .. locale)
        if pack and FindUnloadedDependency(api, true, pack) then
            return false, "北极星会同时加载语言包 " .. pack .. "，请通过重载界面加载。"
        end
        return true
    end

    function QuestGuide:TryLoad(inCombat)
        if inCombat then return false, "战斗中无法加载北极星。" end
        local name, api = self.addonName, _G.C_AddOns
        if not self:IsInstalled() then return false, "未找到北极星插件。" end
        if IsLoaded(name) then return false, "北极星已加载。" end
        if not (api and api.GetAddOnEnableState and api.IsAddOnLoadOnDemand) then
            return false, "当前客户端无法确认北极星的加载状态。"
        end
        local onDemand = api.IsAddOnLoadOnDemand(name)
        if onDemand then
            local allowed, reason = CanLoadOnDemand(api, name)
            if not allowed then return false, reason end
        end
        local character = _G.UnitGUID and _G.UnitGUID("player")
        local wasEnabled = api.GetAddOnEnableState(name, character) > 0
        if not wasEnabled then
            if not (character and type(api.EnableAddOn) == "function") then
                return false, "无法为当前角色启用北极星。"
            end
            local enabled = pcall(api.EnableAddOn, name, character)
            if not enabled or api.GetAddOnEnableState(name, character) == 0 then
                return false, "北极星启用失败，请检查插件列表。"
            end
        end
        if not onDemand then return "reload" end
        local ok, loaded, reason = pcall(api.LoadAddOn, name)
        if ok and loaded then return "loaded" end
        if not wasEnabled and type(api.DisableAddOn) == "function" then
            pcall(api.DisableAddOn, name, character)
        end
        local detail = ok and type(reason) == "string" and (_G["ADDON_" .. reason] or reason)
        return false, detail and ("无法加载北极星（" .. detail .. "）。") or "无法加载北极星，请检查插件列表。"
    end

    local function ShowQuestGuideMenu(guide, anchor)
        guide.Maps.ShowMenu(anchor)
        local menu, widgets, anim = _G.PolestarMenu, guide.Widgets, guide.Anim
        if not (menu and widgets and type(widgets.MenuShown) == "function" and widgets.MenuShown(anchor)
            and anim and type(anim.Anchor) == "function") then return end

        -- Keep Polestar's owner, items, screen clamping and animated anchor.
        local point, relativePoint, gap = "TOP", "BOTTOM", -4
        local bottom, top = anchor:GetBottom(), anchor:GetTop()
        local screen = _G.UIParent
        if bottom and top then
            local buttonScale, screenScale = anchor:GetEffectiveScale(), screen:GetEffectiveScale()
            local below = bottom * buttonScale - screen:GetBottom() * screenScale
            local above = screen:GetTop() * screenScale - top * buttonScale
            if below < (menu:GetHeight() + 4) * menu:GetEffectiveScale() and above > below then
                point, relativePoint, gap = "BOTTOM", "TOP", 4
            end
        end
        anim.Anchor(menu, point, anchor, relativePoint, 0, gap)
    end

    function QuestGuide:Click(anchor, mouseButton)
        local guide = self:GetController()
        if not guide then return end
        if mouseButton == "LeftButton" then
            if type(guide.Fire) == "function" then
                local isGuideShown = type(guide.GuideShown) == "function" and guide.GuideShown
                local wasShown = isGuideShown and isGuideShown()
                guide.Fire("TOGGLE_FRAME")
                local shown = isGuideShown and isGuideShown()
                local nav = guide.Nav
                if type(shown) == "boolean" and shown ~= wasShown and nav and type(nav.ToggleArrow) == "function"
                    and type(guide.Get) == "function" and guide.Get("nav.arrow") ~= shown then
                    nav.ToggleArrow()
                end
            else
                guide.ToggleHidden()
            end
        elseif mouseButton == "RightButton" then
            ShowQuestGuideMenu(guide, anchor)
        elseif mouseButton == "MiddleButton" and type(guide.Get) == "function" and type(guide.Set) == "function" then
            if guide.Get("qol.targetSimple") then
                return false, "北极星当前使用简易目标按钮，目标列表可在北极星设置中启用。"
            end
            local enabled = guide.Get("qol.targetButton")
            -- Polestar applies this setting to its protected rows outside combat.
            if type(enabled) == "boolean" then guide.Set("qol.targetButton", not enabled) end
        end
    end

    Registry.questGuide = QuestGuide
end

ns.TopBarProviderRegistry = Registry

local _, RS = ...

-- Metadata only: no optional addon is loaded or scanned to create its entry.
local Optional = { placeholders = {} }
RS.OptionalAddons = Optional
local catalog = {
    Rurutia_Timeline = {
        title = "轻量时间轴", route = "rtl-settings",
        group = "addons", groupTitle = "独立插件", groupOrder = 20, order = 10,
    },
    Rurutia_PowerBar = {
        title = "职业资源条", route = "rpb-settings",
        group = "addons", groupTitle = "独立插件", groupOrder = 20, order = 20,
    },
}
local popupID = "RURUTIASUITE_OPTIONAL_ADDON_RELOAD"
local function InCombat() return InCombatLockdown and InCombatLockdown() end
-- Character-scoped addon preferences use the GUID, as in Blizzard AddonList.
local function Character() return UnitGUID and UnitGUID("player") end
local function Report() if RS.Print then RS.Print("插件状态未能应用，请在插件列表中检查后重试。") end end

function Optional:GetState(name)
    if RS.Build and RS.Build.IsFamily and not RS.Build.IsFamily("retail") then return false, false end
    local api = C_AddOns
    if not catalog[name] or not api or type(api.GetAddOnInfo) ~= "function" then return false, false end
    local ok, found = pcall(api.GetAddOnInfo, name)
    if not ok or not found then return false, false end
    return true, api.IsAddOnLoaded(name) and true or false
end

function Optional:Request(name, desired)
    local installed = self:GetState(name)
    if not installed or InCombat() or not Character() then return false end
    if not StaticPopupDialogs or not StaticPopup_Show then return false end
    if not StaticPopupDialogs[popupID] then
        StaticPopupDialogs[popupID] = {
            text = "%s", button1 = "确认并重载", button2 = "先不处理",
            timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3,
            OnShow = function(frame, data)
                local button = frame.GetButton1 and frame:GetButton1() or frame.button1
                button:SetText(data.desired and "重载并启用" or "重载并禁用")
            end,
            OnAccept = function(_, data)
                if not data or InCombat() or not Optional:GetState(data.name) then return end
                local api, character = C_AddOns, Character()
                local reload = C_UI and C_UI.Reload or ReloadUI
                if not character or type(reload) ~= "function" then Report(); return end
                local previous = api.GetAddOnEnableState(data.name, character) > 0
                local setter = data.desired and api.EnableAddOn or api.DisableAddOn
                local ok = pcall(setter, data.name, character)
                if ok and (api.GetAddOnEnableState(data.name, character) > 0) == data.desired then
                    local reloaded = pcall(reload)
                    if reloaded then return end
                end
                -- An unsuccessful apply/reload must not silently leave a new preference.
                pcall(previous and api.EnableAddOn or api.DisableAddOn, data.name, character)
                Report()
            end,
        }
    end
    local action = desired and "启用" or "禁用"
    local text = action .. catalog[name].title .. "？\n将重新加载界面，重载后" .. action .. "此插件。已有设置会保留。"
    local frame = StaticPopup_Show(popupID, text, nil, { name = name, desired = desired == true })
    if not frame then return false, "confirmation unavailable" end
    return true, "confirmation-required"
end

function Optional:Decorate(name, route, definition)
    local item = catalog[name]
    if not item or item.route ~= route then return end
    -- Known host product entries own the navigation contract even when the
    -- standalone addon declares its own group/order. The addon keeps its build,
    -- lifecycle, module switch and DB ownership.
    definition.group = item.group
    definition.groupTitle = item.groupTitle
    definition.groupOrder = item.groupOrder
    definition.navigationOrder = item.order
    definition.navigationSwitch = {
        GetState = function(out)
            local installed, loaded = self:GetState(name)
            out.available, out.enabled, out.active = installed, loaded, loaded
            out.mutable, out.pending = not InCombat(), false
            out.reason = InCombat() and "战斗结束后可更改插件加载状态。"
                or (loaded and "禁用此插件并重新加载界面。" or "启用此插件并重新加载界面。")
            return out
        end,
        SetEnabled = function(value) return self:Request(name, value) end,
    }
end

function Optional:RemovePlaceholder(route)
    if self.placeholders[route] then
        local removed = RS.UISystem:UnregisterPage(route)
        if not removed then return false end
        self.placeholders[route] = nil
    end
    return true
end

function Optional:Refresh()
    local system = RS.UISystem
    if not system then return end
    for name, item in pairs(catalog) do
        local installed = self:GetState(name)
        if installed and not system:IsPageRegistered(item.route) then
            local definition = {
                title = item.title, group = item.group,
                groupTitle = item.groupTitle, groupOrder = item.groupOrder,
                navigationOrder = item.order,
                visible = function() return self:GetState(name) end,
                build = function(context)
                    local page = assert(RS.UI:CreateSettingsPage(context, {id = item.route}))
                    page:Description(function()
                        local _, loaded = self:GetState(name)
                        return loaded and "插件已加载，但当前角色或版本未提供设置页。"
                            or "职业资源条已安装但未加载。点击电源或下方按钮，确认后重载启用。"
                    end)
                    page:ActionRow():Button("enable", {
                        text = "重载并启用",
                        getEnabled = function() local _, loaded = self:GetState(name); return not loaded and not InCombat() end,
                        onClick = function() self:Request(name, true) end,
                    })
                    page:Finish()
                end,
            }
            self:Decorate(name, item.route, definition)
            if system:RegisterPage(item.route, definition) then self.placeholders[item.route] = true end
        end
    end
end

function Optional:Stop()
    if StaticPopup_Hide then StaticPopup_Hide(popupID) end
    for route in pairs(self.placeholders) do self:RemovePlaceholder(route) end
end

local _, RS = ...

RS.ClassicUI = RS.ClassicUI or {}
local ClassicUI = RS.ClassicUI

local TabRegistry = {}
TabRegistry.__index = TabRegistry

local DEFAULT_TABS = {
    { id = "movemanager", text = "移动管理", order = 10, frameName = "RSMoveManagerOptions", optionsName = "移动管理", pageId = "movemanager" },
    { id = "appearance", text = "界面样式", order = 20, frameName = "RSAppearanceOptions", optionsName = "界面样式", pageId = "appearance" },
    { id = "topBar", text = "顶部组件", order = 30, frameName = "RSTopBarOptions", optionsName = "顶部组件", pageId = "topBar" },
    { id = "chatBar", text = "聊天条", order = 40, frameName = "RSChatBarOptions", optionsName = "聊天条", pageId = "chatBar" },
    { id = "raidMarker", text = "标记栏", order = 50, frameName = "RSRaidMarkerOptions", optionsName = "标记栏", pageId = "raidMarker" },
    { id = "cvar", text = "CVAR设置", order = 60, frameName = "RSCVarOptions", optionsName = "CVAR设置", pageId = "cvar" },
    { id = "extratools", text = "插件增强", order = 70, frameName = "RSExtraToolsOptions", optionsName = "插件增强", pageId = "extratools" },
    { id = "about", text = "关于", order = 80, noOptionsChild = true, pageId = "about" },
    { id = "autoMark", text = "自动标记", order = 90, frameName = "RSAutoMarkOptions", optionsName = "自动标记", pageId = "autoMark", autoMark = true },
    { id = "portal", text = "法师动作条", order = 100, frameName = "RSPortalOptions", optionsName = "法师动作条", pageId = "portal" },
    { id = "consumableBar", text = "消耗品", order = 110, frameName = "RSConsumableBarOptions", optionsName = "消耗品", pageId = "consumables" },
}

local function CopyDefinition(source)
    local result = {}
    for key, value in pairs(source) do
        result[key] = value
    end
    return result
end

local function SortIDs(self, leftID, rightID)
    local left = self.tabs[leftID]
    local right = self.tabs[rightID]
    if left.order == right.order then
        return left.id < right.id
    end
    return left.order < right.order
end

local function CreatePageDraw(registry, pageId)
    return function(container)
        if registry.openPage then
            return registry.openPage(pageId, container)
        end
        return false
    end
end

function TabRegistry:New(options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.tabs = {}
    instance.order = {}
    instance.openPage = options.openPage
    instance.autoMarkSupported = options.autoMarkSupported
    instance.registrationCount = 0
    instance.drawCount = 0
    return instance
end

function TabRegistry:Register(tab)
    if type(tab) ~= "table" or type(tab.id) ~= "string" or tab.id == ""
        or type(tab.text) ~= "string" or tab.text == ""
        or type(tab.order) ~= "number" or type(tab.draw) ~= "function" then
        return false
    end
    if self.tabs[tab.id] then
        return false
    end

    self.tabs[tab.id] = tab
    self.order[#self.order + 1] = tab.id
    table.sort(self.order, function(leftID, rightID)
        return SortIDs(self, leftID, rightID)
    end)
    self.registrationCount = self.registrationCount + 1
    return true
end

function TabRegistry:GetDefinition(id)
    return self.tabs[id]
end

function TabRegistry:GetDefinitions(reusableResult)
    local result = reusableResult or {}
    local count = 0
    local index = 1
    while index <= #self.order do
        local tab = self.tabs[self.order[index]]
        if tab and (not tab.visible or tab.visible()) then
            count = count + 1
            local definition = result[count] or {}
            definition.value = tab.id
            definition.text = tab.text
            result[count] = definition
        end
        index = index + 1
    end
    index = #result
    while index > count do
        result[index] = nil
        index = index - 1
    end
    return result
end

function TabRegistry:Draw(id, container)
    local tab = self:GetDefinition(id)
    if not tab then return false end
    tab.draw(container)
    self.drawCount = self.drawCount + 1
    return true
end

function TabRegistry:Validate()
    local seenOrders = {}
    for id, tab in pairs(self.tabs) do
        if type(tab.text) ~= "string" or tab.text == "" then
            return false, "Missing text for tab " .. tostring(id)
        end
        if type(tab.order) ~= "number" then
            return false, "Missing order for tab " .. tostring(id)
        end
        if seenOrders[tab.order] then
            return false, "Duplicate order " .. tostring(tab.order)
        end
        seenOrders[tab.order] = true
        if type(tab.draw) ~= "function" then
            return false, "Missing draw for tab " .. tostring(id)
        end
    end
    return true
end

function TabRegistry:InstallDefaults()
    local index = 1
    while index <= #DEFAULT_TABS do
        local definition = CopyDefinition(DEFAULT_TABS[index])
        local shouldRegister = not definition.autoMark
            or (self.autoMarkSupported and self.autoMarkSupported())
        if shouldRegister then
            definition.draw = CreatePageDraw(self, definition.pageId)
            self:Register(definition)
        end
        index = index + 1
    end
    return self:Validate()
end

function TabRegistry:GetDiagnostics()
    return {
        registered = self.registrationCount,
        draws = self.drawCount,
    }
end

ClassicUI.TabRegistry = TabRegistry

local _, RS = ...

local ClassicUI = RS.ClassicUI
if type(ClassicUI) ~= "table" then
    error("MoveManagerPage requires ClassicUI before it", 2)
end

local Page = {}

local function OnRsMove(component)
    component.moveManager:OnMoveCommand("")
end

local function OnAllMove(component)
    component.moveManager:ToggleAllMove()
end

local function OnExternalMove(component)
    component.moveManager:ToggleExternal(component.externalEntry)
end

local function OnExternalSettings(component)
    component.moveManager:OpenExternalSettings(component.externalEntry)
end

local function OnExternalAction(component)
    component.moveManager:InvokeExternalAction(component.externalEntry)
end

local function OnOffscreenChanged(component, value)
    component.moveManager:SetAllowOffscreenDrag(value)
end

local function RegisterControl(controls, collection, manager, entry)
    return function(control)
        control.moveManager = manager
        control.externalEntry = entry
        if collection then
            collection[#collection + 1] = control
        end
    end
end

local function IsAvailable(manager, entry)
    return manager.external:IsAvailable(entry)
end

local function GetExternalMoveText(manager, entry)
    local label = entry.buttonLabel or entry.name
    return manager:IsExternalUnlocked(entry) and ("锁定" .. label) or ("解锁" .. label)
end

local function Refresh(context)
    local page = context and context.moveManagerSettingsPage
    if page then
        page:RefreshLayout()
    end
end

local function AddExternalMoveControls(row, controls, manager, entries)
    local index = 1
    while index <= #entries do
        local entry = entries[index]
        if entry.canMove then
            local key = "externalMove" .. index
            row:Button(key, {
                text = GetExternalMoveText(manager, entry),
                getText = function() return GetExternalMoveText(manager, entry) end,
                visible = function() return IsAvailable(manager, entry) end,
                onAction = OnExternalMove,
                onCreated = RegisterControl(controls, controls.externalMove, manager, entry),
            })
        end
        index = index + 1
    end
end

local function AddExternalActionControls(row, controls, manager, entries)
    local index = 1
    while index <= #entries do
        local entry = entries[index]
        if entry.actionLabel then
            local key = "externalAction" .. index
            row:Button(key, {
                text = entry.actionLabel,
                visible = function() return IsAvailable(manager, entry) end,
                onAction = OnExternalAction,
                onCreated = RegisterControl(controls, controls.externalActions, manager, entry),
            })
        end
        index = index + 1
    end
end

local function AddExternalSettingsControls(row, controls, manager, entries)
    local index = 1
    while index <= #entries do
        local entry = entries[index]
        if entry.openLabel then
            local key = "externalSettings" .. index
            row:Button(key, {
                text = entry.openLabel,
                visible = function() return IsAvailable(manager, entry) end,
                onAction = OnExternalSettings,
                onCreated = RegisterControl(controls, controls.externalSettings, manager, entry),
            })
        end
        index = index + 1
    end
end

local function Build(context, manager)
    local page, reason = RS.UI:CreateSettingsPage(context, { id = "movemanager" })
    if not page then
        error("Unable to create MoveManager settings page: " .. tostring(reason), 2)
    end
    context.moveManagerSettingsPage = page
    context.moveManagerScroll = page:GetScroll()
    if page:GetControl("rsMove") then
        Refresh(context)
        page:Refresh("reuse")
        return page:GetRoot()
    end

    local controls = {
        manager = manager,
        externalMove = {},
        externalActions = {},
        externalSettings = {},
    }
    local entries = manager.external:GetEntries()

    local unlock = assert(page:Section("根据插件分别解锁"))
    local unlockActions = assert(unlock:ActionRow({ columns = 4, minimumColumnWidth = 150 }))
    local _, rsMove = unlockActions:Button("rsMove", {
        text = manager.isMoveMode and "锁定RS工具箱" or "解锁RS工具箱",
        getText = function()
            return manager.isMoveMode and "锁定RS工具箱" or "解锁RS工具箱"
        end,
        onAction = OnRsMove,
        onCreated = RegisterControl(controls, nil, manager),
    })
    controls.rsMove = rsMove
    AddExternalMoveControls(unlockActions, controls, manager, entries)

    local global = assert(page:Section("总控制中心"))
    local globalActions = assert(global:ActionRow({ columns = 4, minimumColumnWidth = 150 }))
    local _, allMove = globalActions:Button("allMove", {
        text = manager:IsAllUnlocked() and "锁定全部插件" or "解锁全部插件",
        getText = function()
            return manager:IsAllUnlocked() and "锁定全部插件" or "解锁全部插件"
        end,
        onAction = OnAllMove,
        onCreated = RegisterControl(controls, nil, manager),
    })
    controls.allMove = allMove
    AddExternalActionControls(globalActions, controls, manager, entries)

    local settings = assert(page:Section("插件设置"))
    AddExternalSettingsControls(
        assert(settings:ActionRow({ columns = 4, minimumColumnWidth = 150 })),
        controls,
        manager,
        entries
    )

    local movement = assert(page:Section("移动设置"))
    local offscreenRow = assert(movement:Row())
    local _, offscreen = offscreenRow:Checkbox("offscreen", {
        text = "允许拖出屏幕",
        tooltip = "允许把受移动管理控制的界面元素拖到屏幕边界之外；可能导致元素难以找回。",
        value = manager:IsOffscreenDragEnabled(),
        getValue = function() return manager:IsOffscreenDragEnabled() end,
        onChange = OnOffscreenChanged,
        onCreated = RegisterControl(controls, nil, manager),
    })
    controls.offscreen = offscreen
    local resetActions = assert(page:FooterActions({ columns = 3, minimumColumnWidth = 150 }))
    local _, reset = resetActions:Button("reset", {
        action = "resetPosition", text = "重置RS位置",
        tooltip = "重置由移动管理接管的RS组件位置，不修改其他插件的位置或RS功能设置。",
        onAction = function() manager:ResetAllRsPositions() end,
    })
    controls.reset = reset

    context.moveManagerControls = controls
    -- The page registry stops tracked work on hide, failed open and removal.
    local observer = { stops = {} }
    function observer:StopTemporaryWork()
        for index = #self.stops, 1, -1 do
            pcall(self.stops[index])
            self.stops[index] = nil
        end
    end
    function observer:Start()
        self:StopTemporaryWork()
        for _, entry in ipairs(entries) do
            if type(entry.subscribe) == "function" and IsAvailable(manager, entry) then
                local ok, stop = pcall(entry.subscribe, manager.external, self, function()
                    if context.visible then manager:RefreshPage("external-move-state") end
                end)
                if ok and type(stop) == "function" then self.stops[#self.stops + 1] = stop end
            end
        end
    end
    context.moveManagerObserver = context:Track(observer)
    page:Finish()
    return page:GetRoot()
end

function Page:Register(system, manager)
    local registered = system:RegisterPage("movemanager", {
        title = "移动管理",
        description = "统一解锁、锁定并调整 RS 与兼容插件的界面位置。",
        group = "pinned",
        navigationOrder = 20,
        searchKeywords = { "移动", "解锁", "锁定", "位置", "坐标", "管理工具" },
        themeKeys = {
            "font.*",
            "color.accent",
            "color.text.*",
            "color.panel.background",
            "color.control.*",
            "color.border",
        },
        build = function(context) return Build(context, manager) end,
        onShow = function(context)
            Refresh(context)
            context.moveManagerObserver:Start()
        end,
        onRefresh = Refresh,
    })
    if registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("moveManager", "movemanager")
        system:RegisterPageAlias("move-manager", "movemanager")
    end
    return registered
end

ClassicUI.MoveManagerPage = Page

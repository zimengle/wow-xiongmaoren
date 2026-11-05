local _, RS = ...
local UI = RS.UI

local PageRegistry = {}
PageRegistry.__index = PageRegistry

local PageContext = {}
PageContext.__index = PageContext

local function NormalizeRouteId(id)
    if type(id) ~= "string" then
        return nil
    end
    local value = string.match(id, "^%s*(.-)%s*$") or ""
    if value == "" then
        return nil
    end
    return string.lower(value)
end

local function GetFrame(object)
    if type(object) == "table" and object.frame then
        return object.frame
    end
    return object
end

local function TrackObject(context, object)
    if not object or context.objectIndex[object] then
        return object
    end
    context.objects[#context.objects + 1] = object
    context.objectIndex[object] = true
    if type(object) == "table" then
        object.pageContext = context
    end
    return object
end

local function ThemeKeyMatches(themeKeys, changed)
    if not themeKeys or not changed then
        return true
    end

    local index = 1
    while index <= #themeKeys do
        local key = themeKeys[index]
        if changed[key] or changed["*"] then
            return true
        end

        local prefix = string.match(key, "^(.-)%*$")
        if prefix then
            for changedKey in pairs(changed) do
                if string.sub(changedKey, 1, string.len(prefix)) == prefix then
                    return true
                end
            end
        else
            for changedKey in pairs(changed) do
                local changedPrefix = string.match(changedKey, "^(.-)%*$")
                if changedPrefix and string.sub(key, 1, string.len(changedPrefix)) == changedPrefix then
                    return true
                end
            end
        end
        index = index + 1
    end
    return false
end

local function OnRootHidden(frame)
    local registry = frame.__rsUIPageRegistry
    -- A child receives OnHide when an ancestor is hidden even though the child
    -- itself is still marked shown.  Keep the active-page ownership until the
    -- main window closes it explicitly; otherwise the root reappears beside
    -- the next selected page when the parent is shown again.
    if registry and frame.IsShown and frame:IsShown() then
        return
    end
    if registry then
        registry:_HandleHidden(frame.__rsUIPageId)
    end
end

local function OnThemeChanged(self, _, changed)
    self:_HandleThemeChanged(changed)
end

local function OnProviderChanged(self)
    self:_HandleProviderChanged()
end

local NAVIGATION_GROUP_DEFAULTS = {
    pinned = { title = "", order = 10 },
    addons = { title = "独立插件", order = 20 },
    qol = { title = "体验优化", order = 30 },
    interface = { title = "界面增强", order = 40 },
    top = { title = "顶部组件", order = 50 },
    class = { title = "职业工具", order = 60 },
    management = { title = "管理工具", order = 70 },
}

-- Legacy category names stay accepted for external extensions. Known built-in
-- pages declare the new keys explicitly; unknown groups fall back to management
-- instead of being guessed into a product area.
local NAVIGATION_GROUP_ALIASES = {
    preset = "pinned",
    general = "management",
    tools = "management",
    other = "management",
    enhancement = "qol",
    feature = "qol",
    classic = "qol",
    combat = "qol",
}

local function GetNavigationGroup(definition)
    local group = definition.group
    local groupTitle = definition.groupTitle
    local groupOrder = tonumber(definition.groupOrder)

    if type(group) ~= "string" or group == "" then
        group = "management"
    end
    group = NAVIGATION_GROUP_ALIASES[group] or group

    local defaults = NAVIGATION_GROUP_DEFAULTS[group]
    if not defaults then
        -- Unknown groups are only honored when the extension declares the
        -- complete custom contract. A bare vendor string otherwise creates an
        -- accidental English category, so it falls back to management.
        if type(groupTitle) ~= "string" or groupTitle == ""
            or groupOrder == nil then
            group = "management"
            groupTitle = nil
            groupOrder = nil
            defaults = NAVIGATION_GROUP_DEFAULTS[group]
        end
    end

    if type(groupTitle) ~= "string" or groupTitle == "" then
        groupTitle = defaults and defaults.title or group
    end
    groupOrder = groupOrder or (defaults and defaults.order) or 100
    return group, groupTitle, groupOrder
end

local function SortNavigationEntries(left, right)
    if left.groupOrder ~= right.groupOrder then
        return left.groupOrder < right.groupOrder
    end
    if left.groupRegistrationIndex ~= right.groupRegistrationIndex then
        return left.groupRegistrationIndex < right.groupRegistrationIndex
    end
    if left.navigationOrder ~= right.navigationOrder then
        return left.navigationOrder < right.navigationOrder
    end
    return left.registrationIndex < right.registrationIndex
end

local function IsDefinitionVisible(definition)
    local visible = definition.visible
    if visible == nil then
        return true
    end
    if type(visible) == "function" then
        return visible() and true or false
    end
    return visible and true or false
end

local function InvokePageCallback(label, callback, ...)
    if type(callback) ~= "function" then return true end
    local invoked, result, reason = pcall(callback, ...)
    if not invoked then return false, label .. ": " .. tostring(result) end
    if result == false then
        return false, tostring(reason or (label .. " returned failure"))
    end
    return true
end

function PageContext:GetRoot()
    if self.root then
        return self.root
    end

    local root = self.registry.components:Create("frame", self.parent, {
        name = self.definition.frameName,
        hidden = true,
        width = self.definition.width,
        height = self.definition.height,
        noBackdrop = true,
        noBorder = true,
        clipChildren = true,
    })
    self.root = TrackObject(self, root)
    return root
end

function PageContext:SetRoot(object)
    if not object then
        return false
    end
    self.root = TrackObject(self, object)
    return true
end

function PageContext:Create(kind, parent, options)
    if parent == nil then
        parent = self:GetRoot()
    end
    local object, reason = self.registry.components:Create(kind, parent, options)
    if object then
        TrackObject(self, object)
    end
    return object, reason
end

function PageContext:Track(object)
    return TrackObject(self, object)
end

function PageContext:ApplyLayout(name, parent, children, options)
    return self.registry.layout:Apply(name, parent or self:GetRoot(), children, options)
end

function PageContext:GetData()
    return self.data
end

function PageContext:OnBuildRollback(callback)
    if type(callback) ~= "function" or self.buildState ~= "building" then
        return false
    end
    local callbacks = self.buildRollbackCallbacks
    callbacks[#callbacks + 1] = callback
    return true
end

function PageRegistry:New(components, layout, theme, providers, system)
    local instance = setmetatable({}, self)
    instance.components = components
    instance.layout = layout
    instance.theme = theme
    instance.providers = providers
    instance.system = system
    instance.pages = {}
    instance.aliases = {}
    instance.routes = {}
    instance.order = {}
    instance.currentId = nil
    instance.buildCount = 0
    instance.buildFailureCount = 0
    instance.themeRefreshCount = 0
    instance.contentRefreshCount = 0

    theme:Subscribe(instance, OnThemeChanged)
    providers:Subscribe(instance, OnProviderChanged)
    return instance
end

function PageRegistry:RegisterAlias(aliasId, pageId)
    if type(aliasId) ~= "string" or aliasId == ""
        or type(pageId) ~= "string" or pageId == "" then
        return false
    end
    pageId = self:ResolveId(pageId)
    if aliasId == pageId then return self.pages[pageId] ~= nil end
    if self.pages[pageId] == nil or self.pages[aliasId] ~= nil then
        return false
    end

    local routeId = NormalizeRouteId(aliasId)
    if routeId == nil then
        return false
    end
    local routeTarget = routeId and self.routes[routeId] or nil
    if routeTarget and routeTarget ~= pageId then
        return false
    end
    if self.aliases[aliasId] ~= nil then
        return self.aliases[aliasId] == pageId
    end
    self.aliases[aliasId] = pageId
    self.routes[routeId] = pageId
    return true
end

function PageRegistry:ResolveId(id)
    local routeId = NormalizeRouteId(id)
    return routeId and self.routes[routeId] or id
end

function PageRegistry:Register(id, definition)
    if type(id) ~= "string" or id == "" or type(definition) ~= "table" then
        return false
    end
    local navigationSwitch = definition.navigationSwitch
    if navigationSwitch ~= nil and (
        type(navigationSwitch) ~= "table"
        or type(navigationSwitch.GetState) ~= "function"
        or type(navigationSwitch.SetEnabled) ~= "function"
    ) then
        return false
    end
    local routeId = NormalizeRouteId(id)
    if routeId == nil or type(definition.build) ~= "function" or self.pages[id]
        or self.aliases[id] ~= nil or self.routes[routeId] ~= nil then
        return false
    end

    self.pages[id] = {
        id = id,
        definition = definition,
        context = nil,
        result = nil,
        visible = false,
        stopped = true,
        themeDirty = false,
        builds = 0,
        buildFailures = 0,
        lastBuildError = nil,
        lastStopError = nil,
        lastOpenError = nil,
        lastRefreshError = nil,
        themeRefreshes = 0,
        contentRefreshes = 0,
    }
    self.routes[routeId] = id
    self.order[#self.order + 1] = id
    return true
end

function PageRegistry:IsRegistered(id)
    id = self:ResolveId(id)
    return self.pages[id] ~= nil
end

function PageRegistry:IsBuilt(id)
    id = self:ResolveId(id)
    local entry = self.pages[id]
    return entry and entry.context ~= nil or false
end

function PageRegistry:Unregister(id)
    id = self:ResolveId(id)
    local entry = self.pages[id]
    if not entry then return false end

    if entry.context then
        self:Close(id)
        self:_StopPage(entry)
        local objects = entry.context.objects or {}
        local index = #objects
        while index >= 1 do
            local object = objects[index]
            local frame = GetFrame(object)
            if frame then
                frame.__rsUIPageRegistry = nil
                frame.__rsUIPageId = nil
            end
            if type(object) == "table" and type(object.Release) == "function" then
                pcall(object.Release, object)
            elseif frame then
                if frame.UnregisterAllEvents then frame:UnregisterAllEvents() end
                if frame.SetScript then
                    frame:SetScript("OnUpdate", nil)
                    frame:SetScript("OnEvent", nil)
                    frame:SetScript("OnShow", nil)
                    frame:SetScript("OnHide", nil)
                end
                if frame.ClearAllPoints then frame:ClearAllPoints() end
                if frame.Hide then frame:Hide() end
            end
            index = index - 1
        end
        entry.context.objects = {}
        entry.context.objectIndex = {}
        entry.context.root = nil
        entry.context = nil
        entry.result = nil
    end

    local routeId = NormalizeRouteId(id)
    if routeId then self.routes[routeId] = nil end
    for aliasId, targetId in pairs(self.aliases) do
        if targetId == id then
            self.aliases[aliasId] = nil
            local aliasRoute = NormalizeRouteId(aliasId)
            if aliasRoute then self.routes[aliasRoute] = nil end
        end
    end
    for index = #self.order, 1, -1 do
        if self.order[index] == id then
            table.remove(self.order, index)
            break
        end
    end
    if self.currentId == id then self.currentId = nil end
    self.pages[id] = nil
    return true
end

function PageRegistry:GetNavigationEntries(reusableResult)
    local result = reusableResult or {}
    local count = 0
    local groupCount = 0
    local groupRegistration = {}
    local index = 1
    while index <= #self.order do
        local id = self.order[index]
        local definition = self.pages[id].definition
        if definition.showInNavigation ~= false and IsDefinitionVisible(definition) then
            local group, groupTitle, groupOrder = GetNavigationGroup(definition)
            local groupRegistrationIndex = groupRegistration[group]
            if not groupRegistrationIndex then
                groupCount = groupCount + 1
                groupRegistrationIndex = groupCount
                groupRegistration[group] = groupRegistrationIndex
            end

            count = count + 1
            local item = result[count] or {}
            item.id = id
            item.title = definition.title or id
            item.description = type(definition.description) == "string" and definition.description or ""
            local searchKeywords = definition.searchKeywords
            if type(searchKeywords) == "table" then
                searchKeywords = table.concat(searchKeywords, " ")
            end
            item.searchText = type(searchKeywords) == "string" and searchKeywords or ""
            item.group = group
            item.groupTitle = groupTitle
            item.groupOrder = groupOrder
            item.groupRegistrationIndex = groupRegistrationIndex
            -- Host pages use explicit small orders. Unranked extension pages
            -- stay after them instead of depending on the extension load order.
            item.navigationOrder = tonumber(definition.navigationOrder) or (1000 + index)
            item.navigationSwitch = definition.navigationSwitch
            -- Keep the old field while callers migrate to the explicit name.
            item.order = item.navigationOrder
            item.registrationIndex = index
            item.visible = true
            result[count] = item
        end
        index = index + 1
    end

    index = #result
    while index > count do
        result[index] = nil
        index = index - 1
    end
    table.sort(result, SortNavigationEntries)
    return result
end

function PageRegistry:_RollbackBuild(context)
    if not context or context.buildState ~= "building" then
        return false
    end

    context.buildState = "rolled-back"
    local firstError
    local callbacks = context.buildRollbackCallbacks
    local index = #callbacks
    while index >= 1 do
        local ok, reason = pcall(callbacks[index], context)
        if not ok and not firstError then firstError = tostring(reason) end
        index = index - 1
    end
    context.buildRollbackCallbacks = nil

    local objects = context.objects
    index = #objects
    while index >= 1 do
        local object = objects[index]
        local frame = GetFrame(object)
        if frame then
            frame.__rsUIPageRegistry = nil
            frame.__rsUIPageId = nil
        end

        local ok, reason
        if type(object) == "table" and type(object.Release) == "function" then
            ok, reason = pcall(object.Release, object)
        else
            local stop = type(object) == "table"
                and (object.StopTemporaryWork or object.Stop)
                or nil
            if stop then
                ok, reason = pcall(stop, object)
            else
                ok = true
            end
            if frame then
                if frame.UnregisterAllEvents then frame:UnregisterAllEvents() end
                if frame.SetScript then
                    local scriptNames = { "OnUpdate", "OnEvent", "OnShow", "OnHide" }
                    local scriptIndex = 1
                    while scriptIndex <= #scriptNames do
                        frame:SetScript(scriptNames[scriptIndex], nil)
                        scriptIndex = scriptIndex + 1
                    end
                end
                if frame.ClearAllPoints then frame:ClearAllPoints() end
                if frame.Hide then frame:Hide() end
            end
        end
        if not ok and not firstError then firstError = tostring(reason) end
        index = index - 1
    end

    context.objects = {}
    context.objectIndex = {}
    context.root = nil
    context.data = nil
    context.visible = false
    return true, firstError
end

function PageRegistry:_Build(entry, parent, data)
    local context = setmetatable({
        registry = self,
        definition = entry.definition,
        id = entry.id,
        parent = parent,
        data = data,
        objects = {},
        objectIndex = {},
        root = nil,
        visible = false,
        buildState = "building",
        buildRollbackCallbacks = {},
    }, PageContext)

    local ok, result = pcall(function()
        local buildResult, buildReason = entry.definition.build(context)
        if buildResult == false or (buildResult == nil and buildReason ~= nil) then
            error("build returned failure: " .. tostring(buildReason or "false"), 0)
        end

        if type(buildResult) == "table" then
            if buildResult.frame and not context.root then
                context:SetRoot(buildResult)
            end
            if buildResult.objects then
                local index = 1
                while index <= #buildResult.objects do
                    TrackObject(context, buildResult.objects[index])
                    index = index + 1
                end
            end
        end

        local root = context:GetRoot()
        local rootFrame = GetFrame(root)
        if not rootFrame or type(rootFrame.Show) ~= "function"
            or type(rootFrame.Hide) ~= "function" then
            error("page root is unavailable", 0)
        end

        rootFrame.__rsUIPageRegistry = self
        rootFrame.__rsUIPageId = entry.id
        if rootFrame.HookScript then
            rootFrame:HookScript("OnHide", OnRootHidden)
        elseif rootFrame.SetScript then
            rootFrame:SetScript("OnHide", OnRootHidden)
        else
            error("page root does not support visibility lifecycle", 0)
        end

        if entry.definition.layout and type(buildResult) == "table" and buildResult.children then
            local applied = self.layout:Apply(
                entry.definition.layout,
                context.root,
                buildResult.children,
                entry.definition.layoutOptions
            )
            if applied == false then error("page layout could not be applied", 0) end
        end
        return buildResult
    end)

    if not ok then
        local message = "page build failed [" .. tostring(entry.id) .. "]: " .. tostring(result)
        local _, rollbackReason = self:_RollbackBuild(context)
        if rollbackReason then
            message = message .. " (rollback: " .. rollbackReason .. ")"
        end
        entry.buildFailures = entry.buildFailures + 1
        entry.lastBuildError = message
        self.buildFailureCount = self.buildFailureCount + 1
        return nil, message
    end

    context.buildState = "committed"
    context.buildRollbackCallbacks = nil
    entry.context = context
    entry.result = result
    entry.builds = entry.builds + 1
    self.buildCount = self.buildCount + 1
    return context
end

function PageRegistry:_StopPage(entry)
    local context = entry and entry.context
    if not context or entry.stopped then
        return false
    end

    entry.stopped = true
    entry.lastStopError = nil
    local objects = context.objects
    local index = #objects
    while index >= 1 do
        local object = objects[index]
        local stop
        if object.StopTemporaryWork then
            stop = object.StopTemporaryWork
        elseif object.Stop then
            stop = object.Stop
        end
        if stop then
            local ok, reason = pcall(stop, object)
            if not ok and not entry.lastStopError then
                entry.lastStopError = tostring(reason)
            end
        end
        index = index - 1
    end
    return true
end

function PageRegistry:_RefreshPageTheme(entry, changed)
    local objects = entry.context.objects
    local index = 1
    while index <= #objects do
        local object = objects[index]
        if object.RefreshTheme then
            object:RefreshTheme()
        end
        index = index + 1
    end

    if entry.definition.onThemeChanged then
        entry.definition.onThemeChanged(entry.context, changed, self.theme)
    end
    entry.themeDirty = false
    entry.themeRefreshes = entry.themeRefreshes + 1
    self.themeRefreshCount = self.themeRefreshCount + 1
end

function PageRegistry:_HandleThemeChanged(changed)
    local index = 1
    while index <= #self.order do
        local entry = self.pages[self.order[index]]
        if entry.context and ThemeKeyMatches(entry.definition.themeKeys, changed) then
            if entry.visible then
                self:_RefreshPageTheme(entry, changed)
            else
                entry.themeDirty = true
            end
        end
        index = index + 1
    end
end

function PageRegistry:_HandleProviderChanged()
    local index = 1
    while index <= #self.order do
        local entry = self.pages[self.order[index]]
        if entry.context then
            if entry.visible then
                self:_RefreshPageTheme(entry, { ["provider"] = true })
            else
                entry.themeDirty = true
            end
        end
        index = index + 1
    end
end

function PageRegistry:_HandleHidden(id)
    local entry = self.pages[id]
    if not entry or not entry.context or not entry.visible then
        return false
    end

    entry.visible = false
    entry.context.visible = false
    if self.currentId == id then
        self.currentId = nil
    end
    self:_StopPage(entry)
    if entry.definition.onHide then
        entry.definition.onHide(entry.context)
    end
    return true
end

function PageRegistry:Open(id, parent, data, prepare)
    id = self:ResolveId(id)
    local entry = self.pages[id]
    if not entry then
        return nil, "unknown page"
    end
    if not IsDefinitionVisible(entry.definition) then
        return nil, "page is not available"
    end

    if not entry.context then
        local context, reason = self:_Build(entry, parent, data)
        if not context then
            return nil, reason
        end
    else
        entry.context.data = data
    end

    if entry.themeDirty then
        self:_RefreshPageTheme(entry, nil)
    end

    local rootFrame = GetFrame(entry.context.root)
    local wasVisible = entry.visible == true and self.currentId == id
    entry.stopped = false
    entry.lastStopError = nil
    entry.context.visible = true
    local shown, showReason = pcall(rootFrame.Show, rootFrame)
    if not shown then
        if not wasVisible then
            entry.context.visible = false
            pcall(rootFrame.Hide, rootFrame)
            self:_StopPage(entry)
        end
        entry.lastOpenError = "page show failed [" .. tostring(id) .. "]: " .. tostring(showReason)
        return nil, entry.lastOpenError
    end
    local opened, openReason = InvokePageCallback(
        "page onShow failed [" .. tostring(id) .. "]",
        entry.definition.onShow,
        entry.context,
        data
    )
    if opened then
        opened, openReason = InvokePageCallback(
            "page prepare failed [" .. tostring(id) .. "]", prepare, entry.context, data
        )
    end
    if not opened then
        if not wasVisible then
            entry.context.visible = false
            pcall(rootFrame.Hide, rootFrame)
            self:_StopPage(entry)
        end
        entry.lastOpenError = openReason
        return nil, openReason
    end

    if self.currentId and self.currentId ~= id then
        self:Close(self.currentId)
    end
    entry.visible = true
    entry.context.visible = true
    self.currentId = id
    entry.lastOpenError = nil
    entry.lastRefreshError = nil
    return entry.context
end

function PageRegistry:Close(id)
    id = self:ResolveId(id)
    local entry = self.pages[id]
    if not entry or not entry.context then
        return false
    end

    local rootFrame = GetFrame(entry.context.root)
    rootFrame:Hide()
    if entry.visible then
        self:_HandleHidden(id)
    end
    return true
end

function PageRegistry:CloseActive()
    if not self.currentId then
        return false
    end
    return self:Close(self.currentId)
end

function PageRegistry:Refresh(id, reason)
    id = self:ResolveId(id)
    local entry = self.pages[id]
    if not entry or not entry.context or not entry.visible then
        return false
    end
    local refreshed, refreshReason = InvokePageCallback(
        "page onRefresh failed [" .. tostring(id) .. "]",
        entry.definition.onRefresh,
        entry.context,
        reason
    )
    if not refreshed then
        entry.lastRefreshError = refreshReason
        return false, refreshReason
    end
    entry.lastRefreshError = nil
    entry.contentRefreshes = entry.contentRefreshes + 1
    self.contentRefreshCount = self.contentRefreshCount + 1
    return true
end

function PageRegistry:GetPage(id)
    id = self:ResolveId(id)
    local entry = self.pages[id]
    return entry and entry.context or nil
end

function PageRegistry:GetDiagnostics()
    local built = 0
    local visible = 0
    local perPage = {}
    local index = 1
    while index <= #self.order do
        local id = self.order[index]
        local entry = self.pages[id]
        if entry.context then
            built = built + 1
        end
        if entry.visible then
            visible = visible + 1
        end
        perPage[id] = {
            built = entry.context ~= nil,
            visible = entry.visible,
            stopped = entry.stopped,
            builds = entry.builds,
            buildFailures = entry.buildFailures,
            lastBuildError = entry.lastBuildError,
            lastStopError = entry.lastStopError,
            lastOpenError = entry.lastOpenError,
            lastRefreshError = entry.lastRefreshError,
            themeRefreshes = entry.themeRefreshes,
            contentRefreshes = entry.contentRefreshes,
            themeDirty = entry.themeDirty,
        }
        index = index + 1
    end
    local aliasCount = 0
    for _ in pairs(self.aliases) do aliasCount = aliasCount + 1 end
    return {
        registered = #self.order,
        built = built,
        visible = visible,
        builds = self.buildCount,
        buildFailures = self.buildFailureCount,
        themeRefreshes = self.themeRefreshCount,
        contentRefreshes = self.contentRefreshCount,
        aliases = aliasCount,
        activePage = self.currentId,
        pages = perPage,
    }
end

UI.PageRegistry = PageRegistry

-- 文件职责：面板保留配置、清理事务与原生设置窗口；第三方配置仅通过能力适配器访问。
local _, ns = ...
if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end
local Adapter = ns.EUIPanelCleanupAdapter
if not Adapter then return end
local Module = {}
ns.EUIPanelCleanup = Module
local defaults = {AddonList = true, WorldMapFrame = true}
local labels = {AddonList = "插件列表", WorldMapFrame = "世界地图", PlayerSpellsFrame = "法术书"}

local function copy(value, seen)
    if type(value) ~= "table" then return value end
    seen = seen or {}
    if seen[value] then return seen[value] end
    local result = {}
    seen[value] = result
    for k, v in pairs(value) do result[k] = copy(v, seen) end
    return result
end

local function equal(a, b, seen)
    if a == b then return true end
    if type(a) ~= "table" or type(b) ~= "table" then return false end
    seen = seen or {}
    if seen[a] == b then return true end
    seen[a] = b
    for k, v in pairs(a) do if not equal(v, b[k], seen) then return false end end
    for k in pairs(b) do if a[k] == nil then return false end end
    return true
end

function Module:GetDB()
    return ns.DB:GetNamespace("EUIPanelCleanup")
        or ns.DB:RegisterNamespace("EUIPanelCleanup", {global = {}})
end

function Module:IsKept(id)
    local overrides = self:GetDB().global.keepOverrides
    if type(overrides) == "table" and type(overrides[id]) == "boolean" then return overrides[id] end
    return defaults[id] == true
end

function Module:SetKept(id, value)
    if type(id) ~= "string" or type(value) ~= "boolean" then return end
    local db = self:GetDB().global
    local overrides = type(db.keepOverrides) == "table" and db.keepOverrides or {}
    if value == (defaults[id] == true) then overrides[id] = nil else overrides[id] = value end
    db.keepOverrides = next(overrides) and overrides or nil
end

function Module:ResetKeep()
    self:GetDB().global.keepOverrides = nil
end


function Module:Inspect()
    local root, err = Adapter:GetProvider()
    if not root then return nil, err end
    local positions, scales = Adapter:ReadRecords(root)
    local ids, entries = {}, {}
    for id in pairs(defaults) do ids[id] = true end
    local overrides = self:GetDB().global.keepOverrides
    for id, value in pairs(type(overrides) == "table" and overrides or {}) do
        if type(id) == "string" and type(value) == "boolean" then ids[id] = true end
    end
    for id in pairs(positions or {}) do ids[id] = true end
    for id in pairs(scales or {}) do ids[id] = true end
    for id in pairs(ids) do
        entries[#entries + 1] = {
            id = id, label = labels[id] or id, keep = self:IsKept(id),
            hasPosition = positions ~= nil and positions[id] ~= nil,
            hasScale = scales ~= nil and scales[id] ~= nil,
        }
    end
    table.sort(entries, function(a, b)
        if defaults[a.id] ~= defaults[b.id] then return defaults[a.id] == true end
        return a.label < b.label
    end)
    return entries
end

function Module:Clean()
    if self.running then return nil, "已有清理操作正在执行。" end
    if InCombatLockdown() then return nil, "战斗中不能清理面板记录。" end
    if type(ReloadUI) ~= "function" then return nil, "当前无法重载界面。" end
    local entries, reason = self:Inspect()
    if not entries then return nil, reason end
    local root, err = Adapter:GetProvider()
    if not root then return nil, err end
    local positions, scales = Adapter:ReadRecords(root)
    local originalPositions, originalScales = copy(positions), copy(scales)
    local remove = {}
    for _, entry in ipairs(entries) do
        if not entry.keep and (entry.hasPosition or entry.hasScale) then remove[#remove + 1] = entry end
    end
    if #remove == 0 then return true end
    self.running = true
    local expectedPositions, expectedScales = copy(originalPositions), copy(originalScales)
    for _, entry in ipairs(remove) do
        if expectedPositions then expectedPositions[entry.id] = nil end
        if expectedScales then expectedScales[entry.id] = nil end
    end
    local ok, failure = pcall(function()
        for _, entry in ipairs(remove) do
            Adapter:RemoveRecord(root, entry.id)
        end
        positions, scales = Adapter:ReadRecords(root)
        if not equal(positions, expectedPositions) or not equal(scales, expectedScales) then
            error("清理后回读不一致")
        end
        ReloadUI()
    end)
    self.running = false
    if not ok then
        Adapter:RestoreRecords(root, copy(originalPositions), copy(originalScales))
        positions, scales = Adapter:ReadRecords(root)
        if not equal(positions, originalPositions) or not equal(scales, originalScales) then
            return nil, "面板清理失败，自动恢复未完成。"
        end
        return nil, "面板清理失败，原记录已恢复：" .. tostring(failure)
    end
    return true
end


-- Controls belong to the settings page context; refresh reuses rows instead of
-- allocating a new list. No events, hooks or timers are installed.
function Module:ShowSettings(page)
    local dialog = page.panelCleanupDialog
    local context = page.context
    local owned = dialog and dialog.cleanupComponents or {}
    local before = #context.objects
    local function Create(kind, parent, options)
        local control = assert(context:Create(kind, parent, options))
        owned[#owned + 1] = control
        return control
    end
    local function Render()
        if not dialog then
            dialog = Create("popup", UIParent, {
                width = 600, height = 560, point = "CENTER", relativeTo = UIParent,
                hidden = true, frameStrata = "FULLSCREEN_DIALOG", frameLevel = 150,
                clampedToScreen = true, backgroundToken = "color.window.background",
            })
            dialog.items = {}
            local function Place(control, x, y)
                control.frame:SetPoint("TOPLEFT", dialog.frame, "TOPLEFT", x, y)
                return control
            end
            Place(Create("label", dialog, {
                text = "面板位置清理", width = 552, height = 30, fontKey = "heading", labelFill = true,
            }), 24, -18)
            dialog.status = Place(Create("label", dialog, {
                text = "", width = 552, height = 64, labelFill = true,
                wordWrap = true, nonSpaceWrap = true, justifyH = "LEFT",
            }), 24, -54)
            dialog.scroll = Place(Create("scroll", dialog, {
                width = 552, height = 340, contentWidth = 524, contentHeight = 1,
            }), 24, -126)
            local function Button(text, x, callback)
                return Place(Create("button", dialog, {
                    text = text, width = 126, height = 34, onAction = callback,
                }), x, -494)
            end
            Button("刷新列表", 24, function() Module:ShowSettings(page) end)
            Button("恢复默认", 166, function() Module:ResetKeep(); Module:ShowSettings(page) end)
            dialog.clean = Button("一键清理", 308, function()
                local ok, reason = Module:Clean()
                if not ok then dialog.status:SetText(reason); return end
                Module:ShowSettings(page)
            end)
            Button("关闭", 450, function() dialog:SetVisible(false) end)
            dialog:SetOnHide(function() page:ClosePopovers() end)
        end
        page:ClosePopovers()
        for _, item in ipairs(dialog.items) do item:SetVisible(false) end
        local entries, reason = self:Inspect()
        dialog.status:SetText(reason or "勾选要保留的面板。默认保留插件列表和世界地图；一键清理其他位置与缩放后自动重载，同账号角色受影响。")
        local count = 0
        local function UpdateCount()
            count = 0
            for _, entry in ipairs(entries or {}) do
                if not Module:IsKept(entry.id) and (entry.hasPosition or entry.hasScale) then count = count + 1 end
            end
            dialog.clean:SetEnabled(count > 0)
        end
        for index, entry in ipairs(entries or {}) do
            local item = dialog.items[index]
            if not item then
                item = Create("checkbox", dialog.scroll:GetContent(), {
                    width = 516, height = 32,
                })
                item.frame:SetPoint("TOPLEFT", dialog.scroll:GetContent(), "TOPLEFT", 0, -(index - 1) * 36)
                dialog.items[index] = item
            end
            -- Rebind the closure when the list is refreshed.
            item:SetOnChange(function(control, value)
                page:ClosePopovers()
                Module:SetKept(control.panelID, value); UpdateCount()
            end)
            item.panelID = entry.id
            item:SetText("保留 " .. entry.label .. ((entry.hasPosition or entry.hasScale) and "（有记录）" or "（暂无记录）"))
            item:SetValue(entry.keep, true)
            item:SetVisible(true)
        end
        dialog.scroll:SetContentSize(524, math.max(1, #(entries or {}) * 36))
        UpdateCount()
        dialog:SetVisible(true)
    end
    local ok, reason = pcall(Render)
    if not ok then
        page:ClosePopovers()
        -- Release all owned controls and anything tracked before Create failed.
        -- Detach them from the page so a later theme refresh cannot revisit them.
        local discard = {}
        for _, control in ipairs(owned) do discard[control] = true end
        for index = before + 1, #context.objects do discard[context.objects[index]] = true end
        for index = #context.objects, 1, -1 do
            local control = context.objects[index]
            if discard[control] then
                pcall(control.Release, control)
                context.objectIndex[control] = nil
                table.remove(context.objects, index)
            end
        end
        page.panelCleanupDialog = nil
        return nil, "面板清理窗口创建失败，请重新打开：" .. tostring(reason)
    end
    dialog.cleanupComponents = owned
    page.panelCleanupDialog = dialog
    return dialog
end

function Module:HideSettings(page)
    if page and page.panelCleanupDialog then page.panelCleanupDialog:SetVisible(false) end
end

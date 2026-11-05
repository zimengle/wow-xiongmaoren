local _, ns = ...

local Importer = { status = "idle" }
ns.EditModeImporter = Importer

local function EnsureManager()
    if not ns.EditModeStorage then return nil, "edit-mode-storage-unavailable" end
    return ns.EditModeStorage:Open()
end

function Importer:GetImportBlockReason()
    return ns.LayoutPolicy:GetEditModeBlockReason(_G.EditModeManagerFrame)
end

local function ReadLayouts(manager)
    local ok, layouts = pcall(manager.GetLayouts, manager)
    if not ok or type(layouts) ~= "table" then return nil, "layout-state-unknown" end
    return layouts
end

local function ImportLayout(manager, info, layoutType, layoutName)
    return manager:ImportLayout(info, layoutType, layoutName)
end

local function ReadEnums()
    local layoutTypes = _G.Enum and _G.Enum.EditModeLayoutType
    local presetMeta = _G.Enum and _G.Enum.EditModePresetLayoutsMeta
    if type(layoutTypes) ~= "table" or type(layoutTypes.Account) ~= "number"
        or type(layoutTypes.Character) ~= "number" or type(presetMeta) ~= "table"
        or type(presetMeta.NumValues) ~= "number" then
        return nil, nil, "edit-mode-enums-unavailable"
    end
    return layoutTypes, presetMeta
end

local function FindCanonical(layouts)
    local layoutTypes, presetMeta, enumReason = ReadEnums()
    if not layoutTypes then return nil, nil, enumReason end
    local foundIndex, foundLayout, count = nil, nil, 0
    local index, layout
    for index, layout in ipairs(layouts) do
        if type(layout) == "table" and layout.layoutName == ns.LayoutPolicy.CANONICAL_LAYOUT_NAME then
            if index <= presetMeta.NumValues
                or (layout.layoutType ~= layoutTypes.Account and layout.layoutType ~= layoutTypes.Character) then
                return nil, nil, "canonical-layout-type-unsafe"
            end
            count = count + 1
            if not foundIndex then foundIndex, foundLayout = index, layout end
        end
    end
    if foundIndex and (foundIndex <= presetMeta.NumValues
        or (foundLayout.layoutType ~= layoutTypes.Account
            and foundLayout.layoutType ~= layoutTypes.Character)) then
        return nil, nil, "canonical-layout-type-unsafe"
    end
    return foundIndex, foundLayout, nil, count
end

local function PickLayoutType(layouts, preferredType)
    local layoutTypes, _, enumReason = ReadEnums()
    if not layoutTypes then return nil, enumReason end
    local accountCount, characterCount = 0, 0
    local _, layout
    for _, layout in ipairs(layouts) do
        if type(layout) == "table" and layout.layoutType == layoutTypes.Account then
            accountCount = accountCount + 1
        end
        if type(layout) == "table" and layout.layoutType == layoutTypes.Character then
            characterCount = characterCount + 1
        end
    end
    if preferredType == layoutTypes.Account and accountCount < 5 then return layoutTypes.Account end
    if preferredType == layoutTypes.Character and characterCount < 5 then
        return layoutTypes.Character
    end
    if accountCount < 5 then return layoutTypes.Account end
    if characterCount < 5 then return layoutTypes.Character end
    return nil, "layout-capacity-full"
end

local function ValidatePreset(canvasId)
    local router = ns.CanvasRouter
    if type(router) ~= "table" or type(router.Resolve) ~= "function" then
        return nil, "canvas-router-unavailable"
    end
    local preset, reason, snapshot = router:Resolve(nil, canvasId)
    if type(preset) ~= "table" or type(preset.layoutString) ~= "string"
        or preset.layoutString == "" then
        return nil, reason or "base-layout-preset-invalid", snapshot
    end
    local catalog = ns.EditModePresets
    if type(catalog) ~= "table"
        or catalog.layoutName ~= ns.LayoutPolicy.CANONICAL_LAYOUT_NAME
        or type(preset.layoutString) ~= "string" or preset.layoutString == "" then
        return nil, "base-layout-preset-invalid", snapshot
    end
    preset.layoutName = catalog.layoutName
    preset.accountSettings = catalog.accountSettings
    return preset, nil, snapshot
end

local function ReadAccountSettings()
    local api = _G.C_EditMode
    if type(api) ~= "table" or type(api.GetAccountSettings) ~= "function"
        or type(api.SetAccountSetting) ~= "function" then
        return nil, "account-settings-api-unavailable"
    end
    local ok, settings = pcall(api.GetAccountSettings)
    if not ok or type(settings) ~= "table" then return nil, "account-settings-read-failed" end
    local values = {}
    for key, info in pairs(settings) do
        if type(info) == "table" and type(info.setting) == "number"
            and type(info.value) == "number" then
            values[info.setting] = info.value
        elseif type(key) == "number" and type(info) == "number" then
            -- Some client builds expose a flat setting -> value map.
            values[key] = info
        end
    end
    return values
end

local function ReadAccountPreset(preset)
    local account = type(preset) == "table" and preset.accountSettings or nil
    if account == nil then return false end
    if type(account) ~= "table" or account.schemaVersion ~= 1
        or type(account.values) ~= "table" then
        return nil, "account-settings-preset-invalid"
    end
    local enums = _G.Enum and _G.Enum.EditModeAccountSetting
    if type(enums) ~= "table" then return nil, "account-settings-enums-unavailable" end
    local wanted = {}
    for name, value in pairs(account.values) do
        if type(name) ~= "string" or type(enums[name]) ~= "number" then
            return nil, "account-setting-unknown: " .. tostring(name)
        end
        if value ~= true and value ~= false and type(value) ~= "number" then
            return nil, "account-setting-value-invalid: " .. tostring(name)
        end
        wanted[#wanted + 1] = {
            name = name,
            setting = enums[name],
            value = value == true and 1 or (value == false and 0 or value),
        }
    end
    if #wanted == 0 then return nil, "account-settings-preset-empty" end
    return wanted
end

local function RestoreAccountSettings(api, applied)
    local restored = true
    for index = #applied, 1, -1 do
        local item = applied[index]
        local ok = pcall(api.SetAccountSetting, item.setting, item.value)
        if not ok then restored = false end
    end
    local after = ReadAccountSettings()
    if not after then return false end
    for _, item in ipairs(applied) do
        if after[item.setting] ~= item.value then restored = false end
    end
    return restored
end

-- Account settings are separate from the layout string. Apply them as their own
-- readback transaction so a failure cannot leave a half-applied display state.
local function ApplyAccountSettings(preset)
    local wanted, presetReason = ReadAccountPreset(preset)
    if wanted == false then
        return { applicable = false, changed = false, changedCount = 0, total = 0 }
    end
    if not wanted then return nil, presetReason end
    local before, readReason = ReadAccountSettings()
    if not before then return nil, readReason end
    for _, item in ipairs(wanted) do
        if before[item.setting] == nil then
            return nil, "account-setting-unsupported: " .. tostring(item.name)
        end
    end

    local api = _G.C_EditMode
    local applied, changed = {}, 0
    local function rollback(reason)
        if RestoreAccountSettings(api, applied) then return nil, reason end
        return nil, "account-settings-rollback-failed: " .. tostring(reason)
    end

    for _, item in ipairs(wanted) do
        if before[item.setting] ~= item.value then
            -- Include a setter that mutates the value before raising an error.
            applied[#applied + 1] = { setting = item.setting, value = before[item.setting] }
            local ok = pcall(api.SetAccountSetting, item.setting, item.value)
            if not ok then
                return rollback("account-setting-write-failed: " .. tostring(item.name))
            end
            changed = changed + 1
        end
    end

    local after, afterReason = ReadAccountSettings()
    if not after then return rollback(afterReason) end
    for _, item in ipairs(wanted) do
        if after[item.setting] ~= item.value then
            return rollback("account-setting-readback-failed: " .. tostring(item.name))
        end
    end
    return { applicable = true, changed = changed > 0, changedCount = changed, total = #wanted }
end

local function PrepareImportedLayoutInfo(info)
    if type(info) ~= "table" or type(info.systems) ~= "table" or #info.systems == 0 then
        return false
    end
    -- 70124 rejects legacy strings whose system count is decoded as interfaceStyle.
    -- Never patch the decoded field: the remaining fields may also be shifted.
    local style = info.interfaceStyle
    if style ~= nil then
        local styles = _G.Enum and _G.Enum.InputDeviceInterfaceType
        local mkb = type(styles) == "table" and styles.Mkb or 0
        local gamepad = type(styles) == "table" and styles.Gamepad or 1
        if style ~= mkb and style ~= gamepad then return false end
    end
    local index, systemInfo
    for index, systemInfo in ipairs(info.systems) do
        if type(systemInfo) ~= "table" or systemInfo.system == nil
            or type(systemInfo.anchorInfo) ~= "table" then
            return false
        end
        if type(systemInfo.settings) ~= "table" then systemInfo.settings = {} end
        -- Retail 12.1 SaveLayouts requires this flag even though older layout
        -- strings can still be decoded without it.
        if type(systemInfo.isInDefaultPosition) ~= "boolean" then
            systemInfo.isInDefaultPosition = false
        end
    end
    return true
end

local function NormalizeLayoutString(value)
    local api = _G.C_EditMode
    if type(value) ~= "string" or value == "" or type(api) ~= "table"
        or type(api.ConvertStringToLayoutInfo) ~= "function"
        or type(api.ConvertLayoutInfoToString) ~= "function" then
        return nil
    end
    local parsed, info = pcall(api.ConvertStringToLayoutInfo, value)
    if not parsed or not PrepareImportedLayoutInfo(info) then return nil end
    local encoded, normalized = pcall(api.ConvertLayoutInfoToString, info)
    return encoded and type(normalized) == "string" and normalized or nil
end

local function EncodeLayout(layout)
    local api = _G.C_EditMode
    if type(layout) ~= "table" or type(api) ~= "table"
        or type(api.ConvertLayoutInfoToString) ~= "function" then return nil end
    local ok, value = pcall(api.ConvertLayoutInfoToString, layout)
    return ok and type(value) == "string" and value or nil
end

-- Import success is persistence/activation, not byte-for-byte preset equality.
-- Keep the strict comparison in Inspect() for the separate difference reminder.
local function IsSavedLayout(layout, layoutType)
    if type(layout) ~= "table" or layout.layoutType ~= layoutType
        or type(layout.systems) ~= "table" or #layout.systems == 0 then return false end
    for _, system in ipairs(layout.systems) do
        if type(system) ~= "table" or system.system == nil
            or type(system.anchorInfo) ~= "table" then return false end
    end
    local encoded = EncodeLayout(layout)
    return type(encoded) == "string" and encoded ~= ""
end

local function IsSavedContext(context, layoutType)
    return type(context) == "table" and context.exists
        and IsSavedLayout(context.layout, layoutType)
end

local Fail

local function DecodeLayout(value)
    local api = _G.C_EditMode
    if type(value) ~= "string" or value == "" or type(api) ~= "table"
        or type(api.ConvertStringToLayoutInfo) ~= "function" then return nil end
    local ok, layout = pcall(api.ConvertStringToLayoutInfo, value)
    if not ok or not PrepareImportedLayoutInfo(layout) then return nil end
    return layout
end

local function SnapshotActiveLayout(manager, layouts)
    local activeIndex = manager and manager.layoutInfo and manager.layoutInfo.activeLayout
    local layout = type(activeIndex) == "number" and layouts[activeIndex] or nil
    if type(layout) ~= "table" or type(layout.layoutName) ~= "string"
        or type(layout.layoutType) ~= "number" then
        return nil, "active-layout-snapshot-unavailable"
    end
    local encoded, occurrence = EncodeLayout(layout), 0
    for index = 1, activeIndex do
        local entry = layouts[index]
        if type(entry) == "table" and entry.layoutName == layout.layoutName and entry.layoutType == layout.layoutType
            and (encoded == nil or EncodeLayout(entry) == encoded) then occurrence = occurrence + 1 end
    end
    return {
        layoutName = layout.layoutName,
        layoutType = layout.layoutType,
        encoded = encoded,
        occurrence = occurrence,
    }
end

local function FindSnapshot(layouts, snapshot)
    if type(layouts) ~= "table" or type(snapshot) ~= "table" then return nil end
    local found, occurrence = nil, 0
    local index, layout
    for index, layout in ipairs(layouts) do
        if type(layout) == "table" and layout.layoutName == snapshot.layoutName
            and layout.layoutType == snapshot.layoutType then
            local matches = snapshot.encoded == nil or EncodeLayout(layout) == snapshot.encoded
            if matches then
                occurrence = occurrence + 1
                if occurrence == (snapshot.occurrence or 1) then found = index end
            end
        end
    end
    if not found then return nil, "active-layout-snapshot-missing" end
    return found
end

local function RestoreActiveLayout(manager, snapshot)
    local layouts, layoutReason = ReadLayouts(manager)
    if not layouts then return false, layoutReason end
    local index, findReason = FindSnapshot(layouts, snapshot)
    if not index then return false, findReason end
    local api = _G.C_EditMode
    if type(api) ~= "table" or type(api.SetActiveLayout) ~= "function" then
        return false, "edit-mode-activation-api-unavailable"
    end
    if manager.layoutInfo.activeLayout ~= index then
        local ok = pcall(api.SetActiveLayout, index)
        if not ok then return false, "active-layout-restore-failed" end
    end
    local verified, verifyReason = ReadLayouts(manager)
    if not verified then return false, verifyReason end
    local active = manager.layoutInfo.activeLayout
    local restored = verified[active]
    if active ~= index or type(restored) ~= "table" or restored.layoutName ~= snapshot.layoutName
        or restored.layoutType ~= snapshot.layoutType
        or (snapshot.encoded ~= nil and EncodeLayout(restored) ~= snapshot.encoded) then
        return false, "active-layout-restore-readback-failed"
    end
    return true
end

local function DeleteCanonicalLayouts(manager)
    if type(manager) ~= "table" or type(manager.DeleteLayout) ~= "function" then
        return false, "edit-mode-delete-api-unavailable"
    end
    local initial, initialReason = ReadLayouts(manager)
    if not initial then return false, initialReason end
    local limit = #initial
    for attempt = 0, limit do
        local layouts, layoutReason = ReadLayouts(manager)
        if not layouts then return false, layoutReason end
        local found
        local index, layout
        for index, layout in ipairs(layouts) do
            if type(layout) == "table"
                and layout.layoutName == ns.LayoutPolicy.CANONICAL_LAYOUT_NAME then
                found = index
            end
        end
        if not found then return true end
        if attempt == limit then break end
        local beforeCount = #layouts
        local ok = pcall(manager.DeleteLayout, manager, found)
        if not ok then return false, "canonical-layout-delete-failed" end
        local after, reason = ReadLayouts(manager)
        if not after or #after >= beforeCount then
            return false, reason or "canonical-layout-delete-readback-failed"
        end
    end
    return false, "canonical-layout-delete-readback-failed"
end

local function FindNamedLayout(layouts, name)
    local foundIndex, foundLayout
    local index, layout
    for index, layout in ipairs(layouts or {}) do
        if type(layout) == "table" and layout.layoutName == name then
            if foundIndex then return nil, nil, "duplicate-layout-name" end
            foundIndex, foundLayout = index, layout
        end
    end
    return foundIndex, foundLayout
end

local function DeleteNamedLayout(manager, name)
    local layouts, layoutReason = ReadLayouts(manager)
    if not layouts then return false, layoutReason end
    local index, _, findReason = FindNamedLayout(layouts, name)
    if findReason then return false, findReason end
    if not index then return true end
    if type(manager.DeleteLayout) ~= "function" then
        return false, "edit-mode-delete-api-unavailable"
    end
    local deleted = pcall(manager.DeleteLayout, manager, index)
    if not deleted then return false, "layout-delete-failed" end
    layouts, layoutReason = ReadLayouts(manager)
    if not layouts then return false, layoutReason end
    index, _, findReason = FindNamedLayout(layouts, name)
    if findReason or index then return false, findReason or "layout-delete-readback-failed" end
    return true
end

local function RenameNamedLayout(manager, oldName, newName)
    if type(manager.RenameLayout) ~= "function" then
        return false, "edit-mode-rename-api-unavailable"
    end
    local layouts, layoutReason = ReadLayouts(manager)
    if not layouts then return false, layoutReason end
    local oldIndex, _, oldReason = FindNamedLayout(layouts, oldName)
    local newIndex, _, newReason = FindNamedLayout(layouts, newName)
    if oldReason or newReason then return false, oldReason or newReason end
    if not oldIndex or newIndex then return false, not oldIndex and "rename-source-missing" or "rename-target-exists" end
    local renamed = pcall(manager.RenameLayout, manager, oldIndex, newName)
    if not renamed then return false, "layout-rename-failed" end
    layouts, layoutReason = ReadLayouts(manager)
    if not layouts then return false, layoutReason end
    oldIndex, _, oldReason = FindNamedLayout(layouts, oldName)
    newIndex, _, newReason = FindNamedLayout(layouts, newName)
    if oldReason or newReason or oldIndex or not newIndex then
        return false, oldReason or newReason or "layout-rename-readback-failed"
    end
    return true
end

local function MakeTemporaryLayoutName(layouts, role)
    local base = ns.LayoutPolicy.CANONICAL_LAYOUT_NAME .. "-RSS-" .. tostring(role)
    local suffix
    for suffix = 1, 20 do
        local name = base .. tostring(suffix)
        local index, _, reason = FindNamedLayout(layouts, name)
        if not reason and not index then return name end
    end
    return nil
end

local function IsTransactionRestored(transaction)
    local layouts = ReadLayouts(transaction.manager)
    if not layouts then return false end
    local index, layout, findReason = FindCanonical(layouts)
    if transaction.previous then
        if not index or findReason or layout.layoutType ~= transaction.previous.layoutType
            or EncodeLayout(layout) ~= transaction.previous.encoded then return false end
    elseif index or findReason then
        return false
    end
    local activeIndex = FindSnapshot(layouts, transaction.active)
    return activeIndex ~= nil and transaction.manager.layoutInfo.activeLayout == activeIndex
end

local function RestoreTransaction(transaction)
    if IsTransactionRestored(transaction) then return true end
    local deleted, deleteReason = DeleteCanonicalLayouts(transaction.manager)
    if not deleted then return false, deleteReason end
    if transaction.previous then
        local ok = pcall(
            ImportLayout,
            transaction.manager,
            transaction.previous.restoreInfo,
            transaction.previous.layoutType,
            transaction.previous.layoutName)
        if not ok then return false, "canonical-layout-restore-import-failed" end
        local layouts, layoutReason = ReadLayouts(transaction.manager)
        if not layouts then return false, layoutReason end
        local index, layout, findReason = FindCanonical(layouts)
        if not index or findReason or layout.layoutType ~= transaction.previous.layoutType
            or EncodeLayout(layout) ~= transaction.previous.encoded then
            return false, findReason or "canonical-layout-restore-readback-failed"
        end
    end
    return RestoreActiveLayout(transaction.manager, transaction.active)
end

local function FailAfterMutation(self, reason, transaction)
    local restored, restoreReason = RestoreTransaction(transaction)
    self.rollbackStatus = restored and "restored" or (restoreReason or "rollback-failed")
    if restored then return Fail(self, reason) end
    return Fail(self, "rollback-failed-after-" .. tostring(reason) .. ": "
        .. tostring(restoreReason or "unknown"))
end

Fail = function(self, reason)
    self.status = reason
    return false, reason
end

function Importer:Inspect(skipContentComparison, presenceOnly, canvasId)
    local manager, managerReason = EnsureManager()
    if not manager then return nil, managerReason end
    local layouts, layoutReason = ReadLayouts(manager)
    if not layouts then return nil, layoutReason end
    local index, layout, findReason, count = FindCanonical(layouts)
    if findReason then return nil, findReason end
    local preset, presetReason, snapshot
    if not presenceOnly then
        preset, presetReason, snapshot = ValidatePreset(canvasId)
        if not preset then return nil, presetReason end
    end
    local status = "missing"
    if count > 1 then
        status = "duplicate"
    elseif index and skipContentComparison then
        status = "present"
    elseif index then
        local actual = EncodeLayout(layout)
        local expected = NormalizeLayoutString(preset.layoutString)
        if not actual or not expected then return nil, "layout-normalization-unavailable" end
        status = actual == expected and "current" or "different"
    end
    return {
        manager = manager,
        blockReason = ns.LayoutPolicy:GetEditModeBlockReason(manager),
        layouts = layouts,
        exists = index ~= nil,
        layoutCount = count,
        status = status,
        fullIndex = index,
        active = index ~= nil and manager.layoutInfo.activeLayout == index,
        activeLayoutName = type(layouts[manager.layoutInfo.activeLayout]) == "table"
            and layouts[manager.layoutInfo.activeLayout].layoutName or nil,
        layout = layout,
        preset = preset,
        canvas = snapshot,
    }
end

-- Explicit, read-only inspection. No login work, persistent cache or UI driver.
function Importer:GetDetailedDiff()
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return nil, "战斗中暂停比较，请脱战后重试。"
    end
    local context, reason = self:Inspect(true, true)
    if not context then return nil, "暂时无法读取布局：" .. tostring(reason) end
    if not context.exists then return { "比较结果：尚未安装布局", "尚未安装“露露”布局。" } end
    local preset, presetReason = ValidatePreset()
    if not preset then return nil, "当前画布预设不可用：" .. tostring(presetReason) end
    local expected = DecodeLayout(preset.layoutString)
    local actual = DecodeLayout(EncodeLayout(context.layout))
    if not expected or not actual then return nil, "布局解码失败，请稍后重试。" end
    local lines, visited, truncated = {}, 0, false
    local labels = {
        anchorInfo = "位置", point = "锚点", relativePoint = "相对锚点",
        relativeTo = "相对框体", offsetX = "横向偏移", offsetY = "纵向偏移",
        settings = "设置", value = "值", isInDefaultPosition = "默认位置",
        systemIndex = "编号", system = "系统", version = "布局版本",
        relativeToUIParent = "相对屏幕", anchorInfo2 = "备用位置",
    }
    local systemLabels = {
        ActionBar="动作条", CastBar="施法条", Minimap="小地图", UnitFrame="单位框体",
        EncounterBar="首领特殊技能", ExtraAbilities="额外技能", Auras="增益/减益",
        TalkingHeadFrame="剧情对话", ChatFrame="聊天窗口", VehicleLeaveButton="离开载具",
        LootFrame="拾取窗口", HudTooltip="鼠标提示", ObjectiveTracker="任务追踪",
        DurabilityFrame="耐久度", StatusTrackingBar="经验/声望条", CooldownViewer="冷却管理器",
        PersonalResourceDisplay="个人资源", DamageMeter="伤害统计", TimerBars="计时条",
    }
    local settingLabels = {
        Orientation="排列方向", NumRows="行数", NumIcons="按钮数量", IconSize="图标大小",
        IconPadding="图标间距", VisibleSetting="显示条件", HideBarArt="隐藏装饰",
        HideBarScrolling="隐藏翻页", FrameSize="框体大小", Opacity="透明度",
        ShowTimer="显示计时", ShowIcon="显示图标", BuffDirection="增益排列方向",
    }
    local currentSettingLabels = {}
    local function Value(value)
        if value == nil then return "无" end
        if value == true then return "是" end
        if value == false then return "否" end
        return tostring(value)
    end
    local function Map(items, settings)
        local mapped = {}
        for _, item in ipairs(items or {}) do
            local key = settings and tostring(item.setting)
                or tostring(item.system) .. ":" .. tostring(item.systemIndex or 0)
            mapped[key] = item
        end
        return mapped
    end
    local function Compare(current, recommended, path, depth)
        visited = visited + 1
        if visited > 4000 or #lines >= 100 or depth > 12 then truncated = true; return end
        if type(current) == "table" or type(recommended) == "table" then
            if current == nil or recommended == nil then
                lines[#lines + 1] = path .. (current == nil and "：当前缺少，推荐包含" or "：当前新增，推荐没有")
                return
            end
            if type(current) ~= "table" or type(recommended) ~= "table" then
                lines[#lines + 1] = path .. "：数据类型不同"
                return
            end
            local keys, seen = {}, {}
            for key in pairs(current) do seen[key] = true; keys[#keys + 1] = key end
            for key in pairs(recommended) do if not seen[key] then keys[#keys + 1] = key end end
            table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
            for _, key in ipairs(keys) do
                local left, right = current[key], recommended[key]
                local label = labels[key] or currentSettingLabels[key] or tostring(key)
                if key == "settings" then left, right = Map(left, true), Map(right, true) end
                Compare(left, right, path .. " / " .. label, depth + 1)
                if truncated then break end
            end
        elseif current ~= recommended then
            lines[#lines + 1] = path .. "：当前 " .. Value(current) .. " → 推荐 " .. Value(recommended)
        end
    end
    local currentSystems, expectedSystems = Map(actual.systems), Map(expected.systems)
    local names = {}
    for name, id in pairs((_G.Enum or {}).EditModeSystem or {}) do names[id] = name end
    local ids, seen = {}, {}
    for id in pairs(currentSystems) do ids[#ids + 1] = id; seen[id] = true end
    for id in pairs(expectedSystems) do if not seen[id] then ids[#ids + 1] = id end end
    table.sort(ids)
    for _, id in ipairs(ids) do
        local info = expectedSystems[id] or currentSystems[id]
        local enumName = names[info.system]
        local name = systemLabels[enumName] or enumName or ("系统 " .. tostring(info.system))
        currentSettingLabels = {}
        local settingEnum = enumName and (_G.Enum or {})["EditMode" .. enumName .. "Setting"]
        for settingName, settingId in pairs(settingEnum or {}) do
            currentSettingLabels[tostring(settingId)] = settingLabels[settingName] or settingName
        end
        Compare(currentSystems[id], expectedSystems[id], name .. " #" .. tostring(info.systemIndex or 0), 0)
        if truncated then break end
    end
    if truncated then lines[#lines + 1] = "差异较多，仅显示前面部分。" end
    local result = truncated and "比较结果：未完成，以下为部分结果"
        or (#lines == 0 and "比较结果：一致" or "比较结果：存在差异")
    if #lines == 0 then lines[1] = "各界面元素的位置与设置一致。" end
    table.insert(lines, 1, "只读比较当前“露露”布局与当前画布推荐预设；不会覆盖自己的修改。")
    table.insert(lines, 1, result)
    return lines
end

-- Explicit replacement also repairs duplicate names and a full layout quota.
-- All old canonical records are decoded before deletion; the synchronous
-- transaction only touches these records and restores them on any failure.
local function ReplaceCanonicalFromSnapshots(self, context, importInfo, layoutType, active)
    local previous = {}
    for _, layout in ipairs(context.layouts) do
        if type(layout) == "table" and layout.layoutName == context.preset.layoutName then
            local encoded = EncodeLayout(layout)
            local restoreInfo = encoded and DecodeLayout(encoded)
            if not restoreInfo then return Fail(self, "canonical-layout-snapshot-unavailable") end
            previous[#previous + 1] = {
                encoded = encoded, restoreInfo = restoreInfo, layoutType = layout.layoutType,
            }
        end
    end

    local function Restore()
        local deleted, reason = DeleteCanonicalLayouts(context.manager)
        if not deleted then return false, reason end
        for _, snapshot in ipairs(previous) do
            local ok = pcall(ImportLayout, context.manager, snapshot.restoreInfo,
                snapshot.layoutType, context.preset.layoutName)
            if not ok then return false, "canonical-layout-restore-import-failed" end
        end
        local layouts, readReason = ReadLayouts(context.manager)
        if not layouts then return false, readReason end
        local matched, count = {}, 0
        for _, layout in ipairs(layouts) do
            if layout.layoutName == context.preset.layoutName then
                count = count + 1
                local found
                for index, snapshot in ipairs(previous) do
                    if not matched[index] and layout.layoutType == snapshot.layoutType
                        and EncodeLayout(layout) == snapshot.encoded then
                        matched[index], found = true, true
                        break
                    end
                end
                if not found then return false, "canonical-layout-restore-readback-failed" end
            end
        end
        if count ~= #previous then return false, "canonical-layout-restore-readback-failed" end
        return RestoreActiveLayout(context.manager, active)
    end

    local function Rollback(reason)
        local restored, restoreReason = Restore()
        self.rollbackStatus = restored and "restored" or restoreReason
        return Fail(self, restored and reason or ("rollback-failed-after-" .. tostring(reason)
            .. ": " .. tostring(restoreReason)))
    end

    local deleted, deleteReason = DeleteCanonicalLayouts(context.manager)
    if not deleted then return Rollback(deleteReason) end
    local imported, importReason = pcall(ImportLayout, context.manager, importInfo,
        layoutType, context.preset.layoutName)
    if not imported then return Rollback("base-layout-import-failed: " .. tostring(importReason)) end
    local after, afterReason = self:Inspect(true)
    if not IsSavedContext(after, layoutType) or after.layoutCount ~= 1 then
        return Rollback(afterReason or "base-layout-import-readback-failed")
    end
    local activated, activationReason = pcall(_G.C_EditMode.SetActiveLayout, after.fullIndex)
    if not activated then return Rollback("base-layout-activation-failed: " .. tostring(activationReason)) end
    local verified, verifyReason = self:Inspect(true)
    if not IsSavedContext(verified, layoutType) or verified.layoutCount ~= 1
        or verified.manager.layoutInfo.activeLayout ~= verified.fullIndex then
        return Rollback(verifyReason or "base-layout-activation-readback-failed")
    end
    local account, accountReason = ApplyAccountSettings(context.preset)
    if not account then return Fail(self, "layout-imported-but-account-settings-failed: " .. tostring(accountReason)) end
    self.status = "imported"
    return true, { changed = true, replaced = true, status = self.status,
        fullIndex = verified.fullIndex, accountSettings = account }
end

function Importer:ImportBaseLayout(explicitReset, canvasId)
    self.rollbackStatus = nil
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return Fail(self, "layout-import-blocked-during-combat")
    end
    -- Explicit replacement does not need preset equality. Some clients can
    -- decode an import seed but only encode a named, saved layout record.
    local context, contextReason = self:Inspect(explicitReset == true, false, canvasId)
    if not context then return Fail(self, contextReason) end
    -- 显式导入（按钮/命令）只替换“露露”布局，不碰用户其他布局；暴雪遗留的
    -- “未保存修改”标记不再拦截，直接删除旧露露并导入。其余阻塞原因仍然拦截。
    if context.blockReason and not (explicitReset == true and context.blockReason == "edit-mode-unsaved-changes") then
        return Fail(self, context.blockReason)
    end

    if (context.status == "different" or context.status == "duplicate") and not explicitReset then
        return Fail(self, "canonical-layout-different")
    end
    local shouldImport, policyReason
    if context.status == "current" then shouldImport = false
    else shouldImport, policyReason = ns.LayoutPolicy:ShouldImport(context.exists, explicitReset) end
    if not shouldImport then
        if policyReason then return Fail(self, policyReason) end
        local activeSnapshot, activeReason = SnapshotActiveLayout(context.manager, context.layouts)
        if not activeSnapshot then return Fail(self, activeReason) end
        if context.manager.layoutInfo.activeLayout ~= context.fullIndex then
            local api = _G.C_EditMode
            if type(api) ~= "table" or type(api.SetActiveLayout) ~= "function" then
                return Fail(self, "edit-mode-activation-api-unavailable")
            end
            local activated = pcall(api.SetActiveLayout, context.fullIndex)
            local verified, verifyReason = self:Inspect()
            if not activated or not verified
                or verified.manager.layoutInfo.activeLayout ~= verified.fullIndex then
                local restored, restoreReason = RestoreActiveLayout(context.manager, activeSnapshot)
                self.rollbackStatus = restored and "restored" or restoreReason
                if not restored then
                    return Fail(self, "rollback-failed-after-canonical-layout-activation: "
                        .. tostring(restoreReason or "unknown"))
                end
                return Fail(self, verifyReason or "canonical-layout-activation-readback-failed")
            end
        end
        local account, accountReason = ApplyAccountSettings(context.preset)
        if not account then return Fail(self, accountReason) end
        self.status = account.changed and "settings-updated" or "already-installed"
        return true, {
            changed = account.changed,
            status = self.status,
            fullIndex = context.fullIndex,
            accountSettings = account,
        }
    end

    local preset, presetReason = ValidatePreset(canvasId)
    if not preset then return Fail(self, presetReason) end
    local api = _G.C_EditMode
    if type(api) ~= "table" or type(api.ConvertStringToLayoutInfo) ~= "function"
        or type(api.ConvertLayoutInfoToString) ~= "function"
        or type(api.IsValidLayoutName) ~= "function" or type(api.SetActiveLayout) ~= "function"
        or type(context.manager.DeleteLayout) ~= "function" then
        return Fail(self, "edit-mode-import-api-unavailable")
    end
    local validOk, validName = pcall(api.IsValidLayoutName, preset.layoutName)
    if not validOk or validName ~= true then return Fail(self, "canonical-layout-name-invalid") end
    local importInfo = DecodeLayout(preset.layoutString)
    if not importInfo then
        return Fail(self, "base-layout-conversion-failed")
    end
    local layoutType, typeReason = PickLayoutType(
        context.layouts, context.layout and context.layout.layoutType)
    local replaceWithoutFreeSlot = not layoutType and typeReason == "layout-capacity-full" and context.layout ~= nil
    if replaceWithoutFreeSlot or context.layoutCount > 1 then layoutType = context.layout.layoutType end
    if not layoutType then return Fail(self, typeReason) end

    local activeSnapshot, activeReason = SnapshotActiveLayout(context.manager, context.layouts)
    if not activeSnapshot then return Fail(self, activeReason) end
    -- DecodeLayout validates the seed; encoding is checked on saved records
    -- below, after ImportLayout has supplied the layout name and type.

    if context.layoutCount > 1 or replaceWithoutFreeSlot then
        return ReplaceCanonicalFromSnapshots(self, context, importInfo, layoutType, activeSnapshot)
    end

    if context.layout then
        local previousEncoded = EncodeLayout(context.layout)
        if not previousEncoded or type(context.manager.RenameLayout) ~= "function" then
            return Fail(self, "canonical-layout-snapshot-unavailable")
        end
        local temporaryName = MakeTemporaryLayoutName(context.layouts, "更新")
        local backupName = MakeTemporaryLayoutName(context.layouts, "备份")
        if not temporaryName or not backupName then return Fail(self, "temporary-layout-name-unavailable") end
        local temporaryCall, temporaryValid = pcall(api.IsValidLayoutName, temporaryName)
        local backupCall, backupValid = pcall(api.IsValidLayoutName, backupName)
        if not temporaryCall or temporaryValid ~= true or not backupCall or backupValid ~= true then
            return Fail(self, "temporary-layout-name-invalid")
        end

        local function VerifyOriginal()
            local layouts, layoutReason = ReadLayouts(context.manager)
            if not layouts then return false, layoutReason end
            local index, layout, findReason = FindNamedLayout(layouts, preset.layoutName)
            if not index or findReason or layout.layoutType ~= context.layout.layoutType
                or EncodeLayout(layout) ~= previousEncoded then
                return false, findReason or "canonical-layout-restore-readback-failed"
            end
            return RestoreActiveLayout(context.manager, activeSnapshot)
        end

        local function RestoreOriginal()
            local layouts, layoutReason = ReadLayouts(context.manager)
            if not layouts then return false, layoutReason end
            local canonicalIndex = FindNamedLayout(layouts, preset.layoutName)
            local backupIndex = FindNamedLayout(layouts, backupName)
            if backupIndex and canonicalIndex then
                local moved, moveReason = RenameNamedLayout(
                    context.manager, preset.layoutName, temporaryName)
                if not moved then return false, moveReason end
            end
            layouts, layoutReason = ReadLayouts(context.manager)
            if not layouts then return false, layoutReason end
            backupIndex = FindNamedLayout(layouts, backupName)
            if backupIndex then
                local restored, restoreReason = RenameNamedLayout(
                    context.manager, backupName, preset.layoutName)
                if not restored then return false, restoreReason end
            end
            local cleaned, cleanReason = DeleteNamedLayout(context.manager, temporaryName)
            if not cleaned then return false, cleanReason end
            return VerifyOriginal()
        end

        local imported, importReason = pcall(
            ImportLayout,
            context.manager,
            importInfo,
            layoutType,
            temporaryName)
        if not imported then
            DeleteNamedLayout(context.manager, temporaryName)
            self.rollbackStatus = "preserved"
            return Fail(self, "base-layout-import-failed: " .. tostring(importReason))
        end
        local stagedLayouts, stagedReason = ReadLayouts(context.manager)
        local stagedIndex, stagedLayout, stagedFindReason
        if stagedLayouts then
            stagedIndex, stagedLayout, stagedFindReason = FindNamedLayout(stagedLayouts, temporaryName)
        else
            stagedFindReason = stagedReason
        end
        if not stagedIndex or stagedFindReason or not IsSavedLayout(stagedLayout, layoutType) then
            local cleaned, cleanReason = DeleteNamedLayout(context.manager, temporaryName)
            self.rollbackStatus = cleaned and "preserved" or (cleanReason or "cleanup-failed")
            if not cleaned then
                return Fail(self, "rollback-failed-after-staged-layout-readback: "
                    .. tostring(cleanReason or "unknown"))
            end
            return Fail(self, stagedFindReason or stagedReason or "staged-layout-readback-failed")
        end
        local backedUp, backupReason = RenameNamedLayout(
            context.manager, preset.layoutName, backupName)
        if not backedUp then
            local cleaned, cleanReason = DeleteNamedLayout(context.manager, temporaryName)
            self.rollbackStatus = cleaned and "preserved" or (cleanReason or "cleanup-failed")
            return Fail(self, cleaned and backupReason or ("rollback-failed-after-"
                .. tostring(backupReason) .. ": " .. tostring(cleanReason)))
        end
        local promoted, promoteReason = RenameNamedLayout(
            context.manager, temporaryName, preset.layoutName)
        if not promoted then
            local restored, restoreReason = RestoreOriginal()
            self.rollbackStatus = restored and "restored" or (restoreReason or "rollback-failed")
            return Fail(self, restored and promoteReason or ("rollback-failed-after-"
                .. tostring(promoteReason) .. ": " .. tostring(restoreReason)))
        end

        local after, afterReason = self:Inspect(true)
        if not IsSavedContext(after, layoutType) then
            local restored, restoreReason = RestoreOriginal()
            self.rollbackStatus = restored and "restored" or (restoreReason or "rollback-failed")
            return Fail(self, restored and (afterReason or "base-layout-import-readback-failed")
                or ("rollback-failed-after-base-layout-import-readback: "
                    .. tostring(restoreReason or "unknown")))
        end
        if after.manager.layoutInfo.activeLayout ~= after.fullIndex then
            local activated, activateReason = pcall(api.SetActiveLayout, after.fullIndex)
            if not activated then
                local restored, restoreReason = RestoreOriginal()
                self.rollbackStatus = restored and "restored" or (restoreReason or "rollback-failed")
                return Fail(self, restored and ("base-layout-activation-failed: "
                    .. tostring(activateReason)) or ("rollback-failed-after-base-layout-activation: "
                    .. tostring(restoreReason or "unknown")))
            end
        end
        local verified, verifyReason = self:Inspect(true)
        if not IsSavedContext(verified, layoutType)
            or verified.manager.layoutInfo.activeLayout ~= verified.fullIndex then
            local restored, restoreReason = RestoreOriginal()
            self.rollbackStatus = restored and "restored" or (restoreReason or "rollback-failed")
            return Fail(self, restored and (verifyReason or "base-layout-activation-readback-failed")
                or ("rollback-failed-after-base-layout-activation-readback: "
                    .. tostring(restoreReason or "unknown")))
        end
        local cleaned, cleanReason = DeleteNamedLayout(context.manager, backupName)
        if not cleaned then
            local restored, restoreReason = RestoreOriginal()
            self.rollbackStatus = restored and "restored" or (restoreReason or "rollback-failed")
            return Fail(self, restored and cleanReason or ("rollback-failed-after-"
                .. tostring(cleanReason) .. ": " .. tostring(restoreReason or "unknown")))
        end
        local final, finalReason = self:Inspect(true)
        if not IsSavedContext(final, layoutType) then
            self.rollbackStatus = "new-layout-preserved"
            return Fail(self, finalReason or "base-layout-post-cleanup-readback-failed")
        end
        if final.manager.layoutInfo.activeLayout ~= final.fullIndex then
            local activated, activateReason = pcall(api.SetActiveLayout, final.fullIndex)
            final, finalReason = self:Inspect(true)
            if not activated or not IsSavedContext(final, layoutType)
                or final.manager.layoutInfo.activeLayout ~= final.fullIndex then
                self.rollbackStatus = "new-layout-preserved"
                return Fail(self, finalReason or ("base-layout-post-cleanup-activation-failed: "
                    .. tostring(activateReason)))
            end
        end
        local account, accountReason = ApplyAccountSettings(preset)
        if not account then
            return Fail(self, "layout-imported-but-account-settings-failed: "
                .. tostring(accountReason))
        end
        self.status = "imported"
        return true, {
            changed = true,
            replaced = true,
            status = self.status,
            fullIndex = final.fullIndex,
            accountSettings = account,
        }
    end
    local transaction = {
        manager = context.manager,
        active = activeSnapshot,
        previous = nil,
    }

    local importOk, importReason = pcall(
        ImportLayout, context.manager, importInfo, layoutType, preset.layoutName)
    if not importOk then
        return FailAfterMutation(
            self, "base-layout-import-failed: " .. tostring(importReason), transaction)
    end

    local after, afterReason = self:Inspect(true)
    if not IsSavedContext(after, layoutType) then
        return FailAfterMutation(
            self, afterReason or "base-layout-import-readback-failed", transaction)
    end
    if after.layout.layoutType ~= layoutType then
        return FailAfterMutation(self, "base-layout-type-readback-failed", transaction)
    end
    if after.manager.layoutInfo.activeLayout ~= after.fullIndex then
        local activateOk, activateReason = pcall(api.SetActiveLayout, after.fullIndex)
        if not activateOk then
            return FailAfterMutation(
                self, "base-layout-activation-failed: " .. tostring(activateReason), transaction)
        end
    end
    local verified, verifyReason = self:Inspect(true)
    if not IsSavedContext(verified, layoutType)
        or verified.manager.layoutInfo.activeLayout ~= verified.fullIndex then
        return FailAfterMutation(
            self, verifyReason or "base-layout-activation-readback-failed", transaction)
    end
    local account, accountReason = ApplyAccountSettings(preset)
    if not account then
        return Fail(self, "layout-imported-but-account-settings-failed: "
            .. tostring(accountReason))
    end
    self.status = "imported"
    return true, {
        changed = true,
        replaced = previous ~= nil,
        status = self.status,
        fullIndex = verified.fullIndex,
        accountSettings = account,
    }
end

function Importer:GetStatus()
    return self.status
end

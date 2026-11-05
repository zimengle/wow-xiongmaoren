local _, ns = ...

-- 手动导入并按需比较 Blizzard 冷却管理器预设；不注册事件，不持有定时器。
local Cooldown = {}

ns.LegacyPresetImports = ns.LegacyPresetImports or {}
ns.LegacyPresetImports.Cooldown = Cooldown

local function IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() == true
end

local function IsAddonLoaded(name)
    local addons = _G.C_AddOns
    if type(addons) == "table" and type(addons.IsAddOnLoaded) == "function" then
        local ok, loaded = pcall(addons.IsAddOnLoaded, name)
        return ok and loaded == true
    end
    if type(_G.IsAddOnLoaded) == "function" then
        local ok, loaded = pcall(_G.IsAddOnLoaded, name)
        return ok and loaded == true
    end
    return false
end

local function EnsureAddonLoaded(name)
    if IsAddonLoaded(name) then return true end

    local loader = _G.C_AddOns and _G.C_AddOns.LoadAddOn or _G.LoadAddOn
    if type(loader) ~= "function" then
        return false, name .. " is not loaded"
    end

    local ok, loaded, loadReason = pcall(loader, name)
    if not ok then
        return false, "unable to load " .. name .. ": " .. tostring(loaded)
    end
    if loaded == false then
        return false, "unable to load " .. name .. ": " .. tostring(loadReason or "unknown error")
    end
    if not IsAddonLoaded(name) and type(_G.C_CooldownViewer) ~= "table" then
        return false, name .. " is not loaded"
    end
    return true
end

local function GetClassFile(targetClass)
    if type(targetClass) == "string" and targetClass ~= "" then
        return targetClass:upper()
    end
    if type(_G.UnitClass) ~= "function" then return nil end
    local ok, _, classFile = pcall(_G.UnitClass, "player")
    if not ok or type(classFile) ~= "string" or classFile == "" then return nil end
    return classFile:upper()
end

local function GetEncodingAPI()
    local encoding = _G.C_EncodingUtil
    if type(encoding) ~= "table"
        or type(encoding.DecodeBase64) ~= "function"
        or type(encoding.DecompressString) ~= "function"
        or type(encoding.DeserializeCBOR) ~= "function"
        or type(encoding.SerializeCBOR) ~= "function"
        or type(encoding.CompressString) ~= "function"
        or type(encoding.EncodeBase64) ~= "function" then
        return nil
    end
    return encoding
end

local function DecodeLayoutString(layoutString)
    if type(layoutString) ~= "string" or layoutString == "" then
        return nil, "layout string is empty"
    end
    local separator = layoutString:find("|", 1, true)
    if not separator or separator == #layoutString then
        return nil, "layout string has an invalid format"
    end

    local encoding = GetEncodingAPI()
    if not encoding then return nil, "cooldown encoding API is unavailable" end
    local compression = _G.Enum and _G.Enum.CompressionMethod and _G.Enum.CompressionMethod.Deflate
    if compression == nil then return nil, "Deflate compression enum is unavailable" end

    local ok, raw = pcall(encoding.DecodeBase64, layoutString:sub(separator + 1))
    if not ok or type(raw) ~= "string" then return nil, "DecodeBase64 failed" end
    ok, raw = pcall(encoding.DecompressString, raw, compression)
    if not ok or type(raw) ~= "string" then return nil, "DecompressString failed" end
    local data
    ok, data = pcall(encoding.DeserializeCBOR, raw)
    if not ok or type(data) ~= "table" then
        return nil, "DeserializeCBOR failed: " .. tostring(data)
    end
    return data
end

local function EncodeLayoutTable(data)
    local encoding = GetEncodingAPI()
    if not encoding then return nil, "cooldown encoding API is unavailable" end
    local compression = _G.Enum and _G.Enum.CompressionMethod and _G.Enum.CompressionMethod.Deflate
    if compression == nil then return nil, "Deflate compression enum is unavailable" end

    local ok, raw = pcall(encoding.SerializeCBOR, data)
    if not ok or raw == nil then return nil, "SerializeCBOR failed: " .. tostring(raw) end
    ok, raw = pcall(encoding.CompressString, raw, compression)
    if not ok or raw == nil then return nil, "CompressString failed: " .. tostring(raw) end
    ok, raw = pcall(encoding.EncodeBase64, raw)
    if not ok or type(raw) ~= "string" or raw == "" then
        return nil, "EncodeBase64 failed: " .. tostring(raw)
    end
    return "1|" .. raw
end

local function EnsureSchema(data)
    if type(data) ~= "table" then data = {} end
    data[1] = type(data[1]) == "number" and data[1] or 4
    data[2] = type(data[2]) == "table" and data[2] or {}
    data[3] = type(data[3]) == "table" and data[3] or {}
    data[4] = type(data[4]) == "table" and data[4] or {}
    return data
end

local function CollectExpectedLayouts(tagTable)
    if type(tagTable) ~= "table" then return nil end
    local expected, count = {}, 0
    local tag, layouts, _, layout
    for tag, layouts in pairs(tagTable) do
        if (type(tag) == "string" or type(tag) == "number") and type(layouts) == "table" then
            for _, layout in pairs(layouts) do
                if type(layout) == "table" then expected[tag], count = layout, count + 1 end
            end
        end
    end
    return count > 0 and expected or nil
end

local function DeepEqual(left, right, visited)
    if left == right then return true end
    if type(left) ~= type(right) or type(left) ~= "table" then return false end
    visited = visited or {}
    if visited[left] == right then return true end
    visited[left] = right
    local key, value
    for key, value in pairs(left) do
        if not DeepEqual(value, right[key], visited) then return false end
    end
    for key in pairs(right) do if left[key] == nil then return false end end
    return true
end

local CATEGORY_LABELS = {
    [0] = "主要冷却",
    [1] = "辅助冷却",
    [2] = "增益图标",
    [3] = "增益条",
    [4] = "团队增益",
    [5] = "通用主要冷却",
    [6] = "通用追踪",
    [7] = "装备主要冷却",
    [8] = "装备追踪",
}

local function SortedKeys(value)
    local keys, key = {}, nil
    for key in pairs(type(value) == "table" and value or {}) do keys[#keys + 1] = key end
    table.sort(keys, function(left, right)
        local leftType, rightType = type(left), type(right)
        if leftType ~= rightType then return leftType < rightType end
        if leftType == "number" or leftType == "string" then return left < right end
        return tostring(left) < tostring(right)
    end)
    return keys
end

local function StableFingerprint(value)
    local hash, seen = 5381, {}
    local function AddText(text)
        text = tostring(text)
        local index
        for index = 1, #text do hash = (hash * 33 + string.byte(text, index)) % 2147483647 end
    end
    local function Visit(candidate)
        local candidateType = type(candidate)
        AddText(candidateType)
        if candidateType ~= "table" then AddText(candidate) return end
        if seen[candidate] then AddText("cycle") return end
        seen[candidate] = true
        local _, key
        for _, key in ipairs(SortedKeys(candidate)) do
            Visit(key)
            Visit(candidate[key])
        end
        seen[candidate] = nil
        AddText("end")
    end
    Visit(value)
    return string.format("%08x", hash)
end

local function IsHiddenCategory(category)
    if type(category) == "number" and category < 0 then return true end
    local enum = _G.Enum and _G.Enum.CooldownViewerCategory
    return type(enum) == "table"
        and (category == enum.HiddenSpell or category == enum.HiddenAura)
end

local function CategoryLabel(category)
    if IsHiddenCategory(category) then return "隐藏" end
    return CATEGORY_LABELS[category] or ("栏目 " .. tostring(category or "默认"))
end

local function CollectLayoutIDs(layout)
    local ids = {}
    if type(layout) ~= "table" then return ids end
    local _, cooldownID
    for _, cooldownID in ipairs(type(layout[1]) == "table" and layout[1] or {}) do
        if type(cooldownID) == "number" then ids[cooldownID] = true end
    end
    local _, assigned
    for _, assigned in pairs(type(layout[2]) == "table" and layout[2] or {}) do
        if type(assigned) == "table" then
            for _, cooldownID in ipairs(assigned) do
                if type(cooldownID) == "number" then ids[cooldownID] = true end
            end
        end
    end
    for cooldownID in pairs(type(layout[3]) == "table" and layout[3] or {}) do
        if type(cooldownID) == "number" then ids[cooldownID] = true end
    end
    return ids
end

local function BuildOrderIndex(layout)
    local result = {}
    local index, cooldownID
    for index, cooldownID in ipairs(type(layout) == "table" and type(layout[1]) == "table" and layout[1] or {}) do
        if type(cooldownID) == "number" then result[cooldownID] = index end
    end
    return result
end

local function BuildCategoryIndex(layout)
    local result = {}
    local category, assigned, _, cooldownID
    for category, assigned in pairs(type(layout) == "table" and type(layout[2]) == "table" and layout[2] or {}) do
        if type(assigned) == "table" then
            for _, cooldownID in ipairs(assigned) do
                if type(cooldownID) == "number" then result[cooldownID] = category end
            end
        end
    end
    return result
end

local function ReadCooldownRecord(cooldownID)
    local viewer = _G.C_CooldownViewer
    if type(viewer) ~= "table" or type(viewer.GetCooldownViewerCooldownInfo) ~= "function" then
        return nil
    end
    local ok, info = pcall(viewer.GetCooldownViewerCooldownInfo, cooldownID)
    return ok and type(info) == "table" and info or nil
end

local function ReadSpellLabel(spellID)
    if type(spellID) ~= "number" then return nil end
    local spells = _G.C_Spell
    if type(spells) == "table" and type(spells.GetSpellInfo) == "function" then
        local ok, info = pcall(spells.GetSpellInfo, spellID)
        if ok and type(info) == "table" and type(info.name) == "string" then
            local icon = type(info.iconID) == "number" and info.iconID or nil
            return (icon and string.format("|T%d:14:14|t ", icon) or "") .. info.name
        end
    end
    if type(_G.GetSpellInfo) == "function" then
        local ok, name, _, icon = pcall(_G.GetSpellInfo, spellID)
        if ok and type(name) == "string" then
            return (type(icon) == "number" and string.format("|T%d:14:14|t ", icon) or "") .. name
        end
    end
    return nil
end

local function ResolveCooldownPresentation(cooldownID)
    local info = ReadCooldownRecord(cooldownID)
    local spellID = info and (info.overrideTooltipSpellID or info.overrideSpellID or info.spellID) or nil
    local label = ReadSpellLabel(spellID)
        or (spellID and ("技能 #" .. tostring(spellID)))
        or ("冷却项目 #" .. tostring(cooldownID))
    return label, info and info.category or nil, spellID
end

local function LayoutMatches(data, displayName, expected)
    local names = type(data) == "table" and data[4] or nil
    local layoutsByTag = type(data) == "table" and data[3] or nil
    if type(names) ~= "table" or type(layoutsByTag) ~= "table" then return false, false end
    local found, candidateActual = false, nil
    local id, name, tag, wanted
    for id, name in pairs(names) do
        if type(id) == "number" and name == displayName then
            found = true
            local matches = true
            local actual = {}
            for tag, wanted in pairs(expected) do
                local actualById = layoutsByTag[tag]
                actual[tag] = type(actualById) == "table" and actualById[id] or nil
                if not DeepEqual(wanted, actual[tag]) then
                    matches = false
                end
            end
            if matches then return true, true, actual end
            candidateActual = candidateActual or actual
        end
    end
    return found, false, candidateActual
end

local function GetViewer()
    local viewer = _G.C_CooldownViewer
    if type(viewer) ~= "table" or type(viewer.GetLayoutData) ~= "function"
        or type(viewer.SetLayoutData) ~= "function" then
        return nil
    end
    return viewer
end

local function RefreshViewer()
    local settings = _G.CooldownViewerSettings
    if type(settings) ~= "table" then
        return false, "CooldownViewerSettings is unavailable"
    end

    if type(settings.GetLayoutManager) == "function"
        and type(settings.GetDataProvider) == "function"
        and type(settings.GetSerializer) == "function" then
        local ok, reason = pcall(function()
            local manager = settings:GetLayoutManager()
            local provider = settings:GetDataProvider()
            local serializer = settings:GetSerializer()
            if not manager or not provider or not serializer then
                error("cooldown viewer components are unavailable")
            end
            if type(manager.Init) == "function" and type(serializer.Init) == "function" then
                manager:Init(provider, serializer)
                serializer:Init(manager)
                if type(provider.Init) == "function" then provider:Init(manager) end
            end
            if type(manager.SwitchToBestLayoutForSpec) == "function" then
                manager:SwitchToBestLayoutForSpec()
            end
            if type(settings.RefreshLayout) == "function" then settings:RefreshLayout() end
        end)
        if not ok then return false, tostring(reason) end
        return true
    end

    if type(settings.RefreshLayout) ~= "function" then
        return false, "cooldown refresh API is unavailable"
    end
    local ok, reason = pcall(settings.RefreshLayout, settings)
    if not ok then return false, tostring(reason) end
    return true
end

function Cooldown:CanImport(targetClass)
    if type(targetClass) == "table" then targetClass = targetClass.class end
    if IsInCombat() then return false, "IN_COMBAT" end

    local classFile = GetClassFile(targetClass)
    if not classFile then return false, "CLASS_UNAVAILABLE" end
    local data = ns.LegacyPresetData and ns.LegacyPresetData.Cooldowns
    local presets = data and data[classFile]
    if type(presets) ~= "table" then
        return false, "DATA_MISSING"
    end
    if not GetEncodingAPI() then return false, "API_UNAVAILABLE" end
    if not GetViewer() then
        if not IsAddonLoaded("Blizzard_CooldownViewer") then
            return false, "ADDON_NOT_LOADED"
        end
        return false, "API_UNAVAILABLE"
    end
    return true, { class = classFile, presets = presets }
end

local function RestoreViewerLayout(viewer, originalString)
    local ok = pcall(viewer.SetLayoutData, originalString)
    if not ok then return false end
    local readOK, restored = pcall(viewer.GetLayoutData)
    return readOK and restored == originalString
end

local function GetCurrentSpecName(presets)
    if type(presets) ~= "table" or type(_G.GetSpecialization) ~= "function"
        or type(_G.GetSpecializationInfo) ~= "function" then return nil end
    local indexOK, index = pcall(_G.GetSpecialization)
    if not indexOK or type(index) ~= "number" then return nil end
    local infoOK, _, specName = pcall(_G.GetSpecializationInfo, index)
    return infoOK and type(specName) == "string" and presets[specName] ~= nil
        and specName or nil
end

function Cooldown:Inspect(targetClass)
    self._inspectionCache = nil
    local classFile = GetClassFile(targetClass)
    local presets = ns.LegacyPresetData and ns.LegacyPresetData.Cooldowns
    presets = classFile and presets and presets[classFile]
    if type(presets) ~= "table" then
        return { status = "unavailable", reason = "DATA_MISSING", class = classFile }
    end
    local viewer = GetViewer()
    if not viewer then return { status = "unavailable", reason = "API_UNAVAILABLE", class = classFile } end
    local ok, currentString = pcall(viewer.GetLayoutData)
    if not ok or type(currentString) ~= "string" then
        return { status = "unavailable", reason = "READ_FAILED", class = classFile }
    end
    local current
    if currentString == "" then
        current = {}
    else
        current = DecodeLayoutString(currentString)
    end
    if type(current) ~= "table" then
        return { status = "unavailable", reason = "DECODE_FAILED", class = classFile }
    end
    current = EnsureSchema(current)
    local aliases = ns.LegacyPresetData.CooldownSpecAliases
        and ns.LegacyPresetData.CooldownSpecAliases[classFile] or {}
    local missing, different, specs, inspectionSpecs = {}, {}, {}, {}
    local currentSpecName = GetCurrentSpecName(presets)
    local active, activeLayoutName, expectedActiveLayoutName
    local name, preset
    for name, preset in pairs(presets) do
        local decoded = DecodeLayoutString(preset)
        local expected = decoded and CollectExpectedLayouts(decoded[3])
        if not expected then
            return { status = "unavailable", reason = "PRESET_DECODE_FAILED", class = classFile }
        end
        local displayName = "露露 " .. (aliases[name] or name)
        local found, matches, actual = LayoutMatches(current, displayName, expected)
        if not found then missing[#missing + 1] = name
        elseif not matches then different[#different + 1] = name end
        local specStatus = not found and "missing" or (not matches and "different" or "current")
        specs[#specs + 1] = {
            name = name,
            displayName = aliases[name] or name,
            layoutName = displayName,
            status = specStatus,
        }
        inspectionSpecs[name] = {
            name = name,
            displayName = aliases[name] or name,
            layoutName = displayName,
            status = specStatus,
            expected = expected,
            actual = actual,
        }
        if name == currentSpecName then
            expectedActiveLayoutName = displayName
            active = true
            local selectedByTag = type(current[2]) == "table" and current[2] or {}
            local namesById = type(current[4]) == "table" and current[4] or {}
            local tag
            for tag in pairs(expected) do
                local selectedId = selectedByTag[tag]
                local selectedName = type(selectedId) == "number" and namesById[selectedId] or nil
                activeLayoutName = selectedName or activeLayoutName
                if selectedName ~= displayName then active = false end
            end
        end
    end
    table.sort(missing)
    table.sort(different)
    table.sort(specs, function(left, right) return tostring(left.displayName) < tostring(right.displayName) end)
    local status = #missing > 0 and "missing" or (#different > 0 and "different" or "current")
    local fingerprintParts = { class = classFile, missing = missing, different = different, layouts = {} }
    for name, preset in pairs(inspectionSpecs) do
        if preset.status ~= "current" then
            fingerprintParts.layouts[name] = { expected = preset.expected, actual = preset.actual }
        end
    end
    local className
    if type(_G.UnitClass) == "function" then
        local classOK, localizedName, playerClass = pcall(_G.UnitClass, "player")
        if classOK and playerClass == classFile and type(localizedName) == "string" then
            className = localizedName
        end
    end
    className = className or (_G.LOCALIZED_CLASS_NAMES_MALE and _G.LOCALIZED_CLASS_NAMES_MALE[classFile])
        or (_G.LOCALIZED_CLASS_NAMES_FEMALE and _G.LOCALIZED_CLASS_NAMES_FEMALE[classFile])
        or classFile
    local result = {
        status = status,
        class = classFile,
        className = className,
        missing = missing,
        different = different,
        specs = specs,
        fingerprint = StableFingerprint(fingerprintParts),
        currentSpecName = currentSpecName,
        active = active,
        activeLayoutName = activeLayoutName,
        expectedActiveLayoutName = expectedActiveLayoutName,
    }
    self._inspectionCache = {
        class = classFile,
        currentString = currentString,
        result = result,
        specs = inspectionSpecs,
        details = {},
    }
    return result
end

local function AddDetailedChange(section, change)
    section[#section + 1] = change
end

-- Raw field differences use the same complete tables as DeepEqual. Skill rows
-- remain a readable projection, not the authority for whether a change exists.
local function SafeFieldText(value)
    local limit = 96
    local suffix = ""
    if #value > limit then
        -- Do not split a UTF-8 code point when limiting a value or field name.
        while limit > 0 and string.byte(value, limit + 1) >= 128
            and string.byte(value, limit + 1) < 192 do limit = limit - 1 end
        suffix = "…(" .. #value .. " bytes; " .. StableFingerprint(value) .. ")"
        value = string.sub(value, 1, limit)
    end
    value = value:gsub("\\", "\\\\"):gsub('"', '\\"')
        :gsub("[%z\1-\31\127]", function(char)
            return string.format("\\x%02x", string.byte(char))
        end):gsub("|", "||")
    return '"' .. value .. '"' .. suffix
end

local function FieldSummary(value)
    local kind = type(value)
    if kind == "nil" then return "未设置 (nil)" end
    if kind == "string" then
        if #value > 96 or value:match("^%d+|") or value:match("^![A-Z]+:") then
            return "字符串 (" .. #value .. " bytes; " .. StableFingerprint(value) .. ")"
        end
        return SafeFieldText(value) .. " (string)"
    end
    if kind == "number" or kind == "boolean" then return tostring(value) .. " (" .. kind .. ")" end
    if kind == "table" then
        local count = 0
        for _ in pairs(value) do count = count + 1 end
        return "表 (" .. count .. " 项)"
    end
    return "<" .. kind .. ">"
end

local function CollectFieldDifferences(expected, actual)
    if DeepEqual(expected, actual) then return {}, 0, false end
    local fields, seen, visits, truncated = {}, {}, 0, false
    local function Add(path, left, right, reason)
        fields[#fields + 1] = {
            path = path, expected = FieldSummary(left),
            actual = FieldSummary(right), reason = reason,
        }
    end
    local function Visit(left, right, path, depth)
        visits = visits + 1
        if #fields >= 99 or visits >= 2000 then
            Add(path, left, right, "剩余字段未展开，已达到详情上限")
            truncated = true
            return
        end
        if left == right then return end
        if type(left) ~= "table" or type(right) ~= "table" then
            Add(path, left, right)
            return
        end
        if depth >= 32 then
            Add(path, left, right, "嵌套内容不同，已达到展开深度上限")
            truncated = true
            return
        end
        if seen[left] == right then return end
        seen[left] = right
        local keys = {}
        for key in pairs(left) do keys[key] = true end
        for key in pairs(right) do keys[key] = true end
        for _, key in ipairs(SortedKeys(keys)) do
            local keyText = type(key) == "string" and SafeFieldText(key)
                or (type(key) == "number" and tostring(key) or FieldSummary(key))
            Visit(left[key], right[key], path .. "[" .. keyText .. "]", depth + 1)
            if truncated then break end
        end
    end
    Visit(expected, actual, "layouts", 0)
    return fields, #fields, truncated
end

local function BuildLayoutDifference(expected, actual)
    local difference = {
        added = {},
        removed = {},
        moved = {},
        order = {},
        settings = {},
        total = 0,
    }
    local tags = {}
    local tag
    for tag in pairs(type(expected) == "table" and expected or {}) do tags[tag] = true end
    for tag in pairs(type(actual) == "table" and actual or {}) do tags[tag] = true end
    for _, tag in ipairs(SortedKeys(tags)) do
        local wanted = type(expected) == "table" and expected[tag] or nil
        local present = type(actual) == "table" and actual[tag] or nil
        if type(wanted) == "table" and type(present) == "table" then
            local wantedIDs, presentIDs = CollectLayoutIDs(wanted), CollectLayoutIDs(present)
            local wantedOrder, presentOrder = BuildOrderIndex(wanted), BuildOrderIndex(present)
            local wantedCategories, presentCategories = BuildCategoryIndex(wanted), BuildCategoryIndex(present)
            local ids, cooldownID = {}, nil
            for cooldownID in pairs(wantedIDs) do ids[cooldownID] = true end
            for cooldownID in pairs(presentIDs) do ids[cooldownID] = true end
            for _, cooldownID in ipairs(SortedKeys(ids)) do
                local label, defaultCategory, spellID = ResolveCooldownPresentation(cooldownID)
                local wantedCategory = wantedCategories[cooldownID]
                if wantedCategory == nil then wantedCategory = defaultCategory end
                local presentCategory = presentCategories[cooldownID]
                if presentCategory == nil then presentCategory = defaultCategory end
                local wantedExists, presentExists = wantedIDs[cooldownID] == true, presentIDs[cooldownID] == true
                local wantedHidden, presentHidden = IsHiddenCategory(wantedCategory), IsHiddenCategory(presentCategory)
                local base = { cooldownID = cooldownID, spellID = spellID, label = label }
                if wantedExists and not presentExists then
                    AddDetailedChange(difference.removed, base)
                elseif presentExists and not wantedExists then
                    AddDetailedChange(difference.added, base)
                elseif wantedExists and presentExists then
                    if wantedHidden ~= presentHidden then
                        AddDetailedChange(wantedHidden and difference.added or difference.removed, base)
                    elseif wantedCategory ~= presentCategory then
                        base.expectedCategory = CategoryLabel(wantedCategory)
                        base.actualCategory = CategoryLabel(presentCategory)
                        AddDetailedChange(difference.moved, base)
                    elseif not wantedHidden and wantedOrder[cooldownID] and presentOrder[cooldownID]
                        and wantedOrder[cooldownID] ~= presentOrder[cooldownID] then
                        base.expectedIndex = wantedOrder[cooldownID]
                        base.actualIndex = presentOrder[cooldownID]
                        AddDetailedChange(difference.order, base)
                    end
                    local wantedSettings = type(wanted[3]) == "table" and wanted[3][cooldownID] or nil
                    local presentSettings = type(present[3]) == "table" and present[3][cooldownID] or nil
                    if not DeepEqual(wantedSettings, presentSettings) then
                        AddDetailedChange(difference.settings, base)
                    end
                end
            end
        elseif type(wanted) == "table" then
            difference.missingLayout = true
        elseif type(present) == "table" then
            difference.extraLayout = true
        end
    end
    difference.semanticTotal = #difference.added + #difference.removed + #difference.moved
        + #difference.order + #difference.settings
        + (difference.missingLayout and 1 or 0) + (difference.extraLayout and 1 or 0)
    -- total counts field rows (including a truncation explanation), never the
    -- skill projection as well. With fieldsTruncated it is not an exact count.
    difference.fields, difference.total, difference.fieldsTruncated = CollectFieldDifferences(expected, actual)
    return difference
end

function Cooldown:GetDetailedDiff(specName, targetClass)
    if type(specName) ~= "string" or specName == "" then return nil, "SPEC_UNAVAILABLE" end
    local classFile = GetClassFile(targetClass)
    local viewer = GetViewer()
    if not classFile or not viewer then return nil, "API_UNAVAILABLE" end
    local ok, currentString = pcall(viewer.GetLayoutData)
    if not ok or type(currentString) ~= "string" then return nil, "READ_FAILED" end
    local cache = self._inspectionCache
    if type(cache) ~= "table" or cache.class ~= classFile or cache.currentString ~= currentString then
        local inspected = self:Inspect(targetClass)
        if type(inspected) ~= "table" or inspected.status == "unavailable" then
            return nil, inspected and inspected.reason or "INSPECT_FAILED"
        end
        cache = self._inspectionCache
    end
    local spec = cache and cache.specs and cache.specs[specName]
    if not spec then return nil, "SPEC_UNAVAILABLE" end
    if cache.details[specName] then return cache.details[specName] end
    local detail = {
        class = classFile,
        className = cache.result.className,
        name = spec.name,
        displayName = spec.displayName,
        layoutName = spec.layoutName,
        status = spec.status,
        fingerprint = cache.result.fingerprint,
    }
    detail.difference = BuildLayoutDifference(spec.expected, spec.actual)
    cache.details[specName] = detail
    return detail
end

function Cooldown:Import(targetClass)
    if type(targetClass) == "table" then targetClass = targetClass.class end
    if IsInCombat() then return false, "IN_COMBAT" end
    local loaded, loadReason = EnsureAddonLoaded("Blizzard_CooldownViewer")
    if not loaded then return false, "ADDON_NOT_LOADED" end

    local canImport, context = self:CanImport(targetClass)
    if not canImport then return false, context end

    local viewer = GetViewer()
    local ok, currentString = pcall(viewer.GetLayoutData)
    if not ok or type(currentString) ~= "string" then return false, "API_FAILED" end

    local current
    if currentString ~= "" then
        current = DecodeLayoutString(currentString)
        if type(current) ~= "table" then return false, "DECODE_FAILED" end
    end

    local aliases = ns.LegacyPresetData.CooldownSpecAliases
        and ns.LegacyPresetData.CooldownSpecAliases[context.class] or {}
    local presetNames, decodedPresets = {}, {}
    for presetName, presetString in pairs(context.presets) do
        presetNames[#presetNames + 1] = presetName
        if type(presetString) ~= "string" or presetString:sub(1, 2) ~= "1|" then
            return false, "DATA_INVALID"
        end
        local presetData = DecodeLayoutString(presetString)
        if type(presetData) ~= "table" or not CollectExpectedLayouts(presetData[3]) then
            return false, "DATA_INVALID"
        end
        decodedPresets[presetName] = presetData
    end
    table.sort(presetNames, function(left, right) return tostring(left) < tostring(right) end)

    current = EnsureSchema(current)

    local names, usedIds = {}, {}
    local id, name
    for id, name in pairs(current[4]) do
        if type(id) == "number" then
            usedIds[id] = true
            if type(name) == "string" and name ~= "" then names[name] = id end
        end
    end
    local nextId = 1
    local function ReserveId(layoutName)
        local existing = names[layoutName]
        if type(existing) == "number" then return existing end
        while usedIds[nextId] do nextId = nextId + 1 end
        existing = nextId
        nextId = nextId + 1
        usedIds[existing] = true
        names[layoutName] = existing
        return existing
    end

    local applied, lastIdByTag, preferredIdByTag = 0, {}, {}
    local index
    for index = 1, #presetNames do
        local presetName = presetNames[index]
        local tagTable = decodedPresets[presetName][3]
        local displayName = "露露 " .. (aliases[presetName] or presetName)
        local layoutId = ReserveId(displayName)
        current[4][layoutId] = displayName
        local tag, layouts
        for tag, layouts in pairs(tagTable) do
            if (type(tag) == "string" or type(tag) == "number")
                and type(layouts) == "table" then
                current[3][tag] = type(current[3][tag]) == "table" and current[3][tag] or {}
                local _, layout
                for _, layout in pairs(layouts) do
                    current[3][tag][layoutId] = layout
                    applied = applied + 1
                end
                lastIdByTag[tag] = layoutId
                if context.class == "DRUID" and displayName == "露露 猫奶" then
                    preferredIdByTag[tag] = layoutId
                end
            end
        end
    end
    if applied == 0 then return false, "DATA_INVALID" end

    local tag
    for tag, id in pairs(lastIdByTag) do current[2][tag] = preferredIdByTag[tag] or id end

    local encoded, encodeReason = EncodeLayoutTable(current)
    if not encoded then return false, "ENCODE_FAILED" end
    ok, name = pcall(viewer.SetLayoutData, encoded)
    if not ok then
        if not RestoreViewerLayout(viewer, currentString) then return false, "ROLLBACK_FAILED" end
        return false, "API_FAILED"
    end

    local function FailAfterWrite(reason)
        if not RestoreViewerLayout(viewer, currentString) then
            return false, "ROLLBACK_FAILED"
        end
        -- Best effort only: the persisted layout is already restored, but a
        -- failed live refresh may still require the caller to reload the UI.
        RefreshViewer()
        return false, reason
    end

    local readback
    ok, readback = pcall(viewer.GetLayoutData)
    if not ok then return FailAfterWrite("READBACK_FAILED") end
    if type(readback) ~= "string" or readback == "" then
        return FailAfterWrite("READBACK_FAILED")
    end
    if readback ~= encoded then
        local decoded = DecodeLayoutString(readback)
        if type(decoded) ~= "table" or not DeepEqual(decoded, current) then
            return FailAfterWrite("READBACK_FAILED")
        end
    end

    local refreshed, refreshReason = RefreshViewer()
    if not refreshed then
        return FailAfterWrite("REFRESH_FAILED")
    end
    return true, {
        changed = true,
        provider = "Blizzard_CooldownViewer",
        class = context.class,
        applied = applied,
        refreshed = true,
        -- A successful live refresh does not prove the protected UI is clean.
        -- Preserve the legacy requirement to reload after manual CDM imports.
        reloadRequired = true,
    }
end

function Cooldown:Execute(preset)
    if preset ~= nil and preset ~= "cd" then
        return false, "unsupported cooldown preset: " .. tostring(preset)
    end
    return self:Import()
end

ns.LegacyPresetImports.cd = Cooldown

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("AddonProfile")) then return end

local Data = ns.AddonProfileData
local Adapter = ns.AddonProfileAdapter
if type(Data) ~= "table" or type(Adapter) ~= "table" then
    error("AddonProfile requires Data and a build adapter before Core.lua", 2)
end

local Definition = {
    defaultEnabled = true,
    defaults = {
        profile = {
            enabled = true,
            showSwitchButton = true,
            strictWhitelist = true,
            overrides = {},
            custom = {},
        },
    },
}

local EXPORT_PREFIX = "!RSAP:2:"
local LEGACY_EXPORT_PREFIX = "!RSAP:1:"

local function Trim(value)
    return type(value) == "string" and value:gsub("^%s+", ""):gsub("%s+$", "") or ""
end

local function NormalizeAddonName(name)
    return (Data.RenamedAddons or {})[name] or name
end

local function NormalizeWhitelist(list)
    if type(list) ~= "table" then return list, false end
    local result, seen, changed = {}, {}, false
    local _, name
    for _, name in ipairs(list) do
        if type(name) == "string" then
            local normalized = NormalizeAddonName(name)
            if normalized ~= name or seen[normalized] then changed = true end
            if not seen[normalized] then
                seen[normalized] = true
                result[#result + 1] = normalized
            end
        else
            changed = true
        end
    end
    return result, changed
end

local function CopyList(list)
    local copied, normalized = {}, NormalizeWhitelist(list)
    local _, value
    for _, value in ipairs(normalized or {}) do copied[#copied + 1] = value end
    return copied
end

local function ValidateWhitelist(list)
    if type(list) ~= "table" then return false end
    local _, value
    for _, value in ipairs(list) do if type(value) ~= "string" then return false end end
    return true
end

local function IsIgnored(name)
    if type(name) ~= "string" or name == "" then return false end
    if (Data.DetectionIgnoredAddons or {})[name] then return true end
    local _, prefix
    for _, prefix in ipairs(Data.DetectionIgnoredPrefixes or {}) do
        if name:sub(1, #prefix) == prefix then return true end
    end
    return false
end

function Definition:GetProfileDB()
    return self.db and self.db.profile
end

function Definition:Initialize()
    self.adapter = Adapter
    local profile = self:GetProfileDB()
    profile.overrides = type(profile.overrides) == "table" and profile.overrides or {}
    profile.custom = type(profile.custom) == "table" and profile.custom or {}
    rawset(profile, "position", nil)
    self:MigrateFromOldDB()
    self:MigrateRenamedAddonsInDB()
    profile.currentId = self:NormalizeProfileId(profile.currentId)
    if ns.AddonProfileUI and type(ns.AddonProfileUI.Register) == "function" then
        ns.AddonProfileUI:Register(self)
    end
end

function Definition:ProfileChanged()
    local profile = self:GetProfileDB()
    profile.overrides = type(profile.overrides) == "table" and profile.overrides or {}
    profile.custom = type(profile.custom) == "table" and profile.custom or {}
    rawset(profile, "position", nil)
    profile.currentId = self:NormalizeProfileId(profile.currentId)
    self:MigrateRenamedAddonsInDB()
    local ui = ns.AddonProfileUI
    if type(ui) == "table" and type(ui.ProfileChanged) == "function" then
        local ok, refreshed = pcall(ui.ProfileChanged, ui, self)
        if not ok or refreshed == false then
            self:Print("|cffff0000插件管理页面刷新失败，请重新打开设置页。|r")
        end
    end
end

function Definition:MigrateFromOldDB()
    local old = Adapter:GetLegacyAddonProfileDB()
    if type(old) ~= "table" or old._migrated then return false end
    local profile = self:GetProfileDB()
    local _, key
    for _, key in ipairs({ "currentId", "overrides", "custom", "enabled", "showSwitchButton" }) do
        if old[key] ~= nil then profile[key] = old[key] end
    end
    old._migrated = true
    return true
end

function Definition:MigrateRenamedAddonsInDB()
    local profile, changed = self:GetProfileDB(), false
    local _, item
    for _, item in ipairs(profile.custom or {}) do
        if type(item) == "table" then
            local list, didChange = NormalizeWhitelist(item.whitelist)
            if didChange then item.whitelist, changed = list, true end
        end
    end
    local _, override
    for _, override in pairs(profile.overrides or {}) do
        if type(override) == "table" then
            local list, didChange = NormalizeWhitelist(override.whitelist)
            if didChange then override.whitelist, changed = list, true end
        end
    end
    return changed
end

function Definition:NormalizeProfileId(id)
    return (Data.LegacyProfileIdMap or {})[id] or id
end

function Definition:BuildExpectedSet(profile)
    local expected = {}
    local name
    for name in pairs(Data.ProtectedAddons or {}) do expected[name] = true end
    local _, entry
    for _, entry in ipairs(profile and profile.whitelist or {}) do expected[NormalizeAddonName(entry)] = true end
    return expected
end

function Definition:ShouldIgnoreMissingForDetection(name)
    local _, prefix
    for _, prefix in ipairs(Data.DetectionOptionalAddonPrefixes or {}) do
        if name:sub(1, #prefix) == prefix then return not Adapter:IsAddonInstalled(name) end
    end
    return false
end

function Definition:BuildDetectionExpectedSet(profile)
    local expected, name = {}, nil
    for name in pairs(Data.ProtectedAddons or {}) do if not IsIgnored(name) then expected[name] = true end end
    local _, entry
    for _, entry in ipairs(profile and profile.whitelist or {}) do
        name = NormalizeAddonName(entry)
        if not IsIgnored(name) and not self:ShouldIgnoreMissingForDetection(name) then expected[name] = true end
    end
    return expected
end

function Definition:BuildDetectionCurrentSet()
    local result, character, total = {}, Adapter:GetAddonCharacter(), Adapter:GetNumAddOns()
    local index
    for index = 1, total do
        local name = Adapter:GetAddOnName(index)
        if name and not IsIgnored(name) and Adapter:GetAddOnEnableState(name, character) > 0 then result[name] = true end
    end
    self:RecordScan()
    return result
end

function Definition:GetAvailableVariants()
    local available, _, variantId = {}, nil, nil
    for _, variantId in ipairs(Data.VariantDisplayOrder or {}) do
        local variant = (Data.VariantAddons or {})[variantId]
        local _, name
        for _, name in ipairs((variant and (variant.detect or variant.addons)) or {}) do
            if Adapter:IsAddonLoaded(name) then available[variantId] = true break end
        end
    end
    return available
end

function Definition:IsBuiltinProfileVisible(profile, available)
    if not (profile and profile.builtin and profile.variant) then return true end
    return not next(available or {}) or available[profile.variant] == true
end

function Definition:GetProfile(id)
    local normalized, profile = self:NormalizeProfileId(id), self:GetProfileDB()
    local _, custom
    for _, custom in ipairs(profile.custom or {}) do if custom.id == normalized then return custom end end
    local _, builtin
    for _, builtin in ipairs(Data.Defaults or {}) do
        if builtin.id == normalized then
            local override = profile.overrides and profile.overrides[normalized]
            return { id = builtin.id, name = builtin.name, builtin = true, baseId = builtin.baseId, variant = builtin.variant,
                whitelist = (override and override.whitelist) or builtin.whitelist }
        end
    end
    return nil
end

function Definition:GetProfileDisplayName(profile, showSuffix)
    if type(profile) == "string" then profile = self:GetProfile(profile) end
    if not profile then return "自定义" end
    if profile.id == "elles_lite_elles" and Adapter:IsAddonLoaded("EllesmereUI") then
        return "大秘境"
    end
    if showSuffix == nil then
        local variants = self:GetAvailableVariants()
        showSuffix = (variants.n and variants.e) or (not variants.n and not variants.e)
    end
    if profile.builtin and profile.variant and not showSuffix then return (profile.name or profile.id):gsub("[NE]$", "") end
    return profile.name or profile.id or "自定义"
end

function Definition:ListProfiles(options)
    local result, variants = {}, self:GetAvailableVariants()
    local showSuffix = (variants.n and variants.e) or (not variants.n and not variants.e)
    local visibleOnly = not (options and options.includeHidden)
    local _, builtin
    for _, builtin in ipairs(Data.Defaults or {}) do
        local profile = self:GetProfile(builtin.id)
        if profile and (not visibleOnly or self:IsBuiltinProfileVisible(profile, variants)) then
            profile.displayName = self:GetProfileDisplayName(profile, showSuffix)
            result[#result + 1] = profile
        end
    end
    local _, custom
    for _, custom in ipairs(self:GetProfileDB().custom or {}) do
        custom.displayName = custom.name or custom.id
        result[#result + 1] = custom
    end
    return result
end

function Definition:DetectActive()
    local current = self:BuildDetectionCurrentSet()
    local _, profile
    -- Loaded UI providers define the only meaningful built-in candidates for
    -- this session. Hidden N/E variants must not win while EllesmereUI is the
    -- active provider because of stale enable-state residue.
    for _, profile in ipairs(self:ListProfiles()) do
        local expected, match = self:BuildDetectionExpectedSet(profile), true
        local name
        for name in pairs(current) do if not expected[name] then match = false break end end
        if match then for name in pairs(expected) do if not current[name] then match = false break end end end
        if match then self:GetProfileDB().currentId = profile.id return profile.id end
    end

    -- 检测到 UI 主体不等于插件清单匹配；清除失效标签，保留真实差异。
    self:GetProfileDB().currentId = nil
    return nil
end

function Definition:RequestApply(id, anchorFrame)
    local ui = ns.AddonProfileUI
    if ui and ui.RequestApply then return ui:RequestApply(self, id, anchorFrame) end
    return self:Apply(id, anchorFrame)
end

function Definition:Apply(id, anchorFrame)
    local combatOK, inCombat = pcall(Adapter.IsInCombat, Adapter)
    if not combatOK then
        self:Print("|cffff0000无法读取战斗状态，未更改插件预设。|r")
        return false, "APPLY_UNAVAILABLE"
    end
    if inCombat then
        self:Print("|cffff0000战斗中不能切换插件预设，请脱战后重试。|r")
        return false
    end

    local normalized = self:NormalizeProfileId(id)
    local profile = self:GetProfile(normalized)
    if not profile then
        self:Print("|cffff0000预设不存在：" .. tostring(id) .. "|r")
        return false
    end

    local profileDB = self:GetProfileDB()
    local originalCurrentId = profileDB.currentId
    local expected = self:BuildExpectedSet(profile)
    local characterOK, character = pcall(Adapter.GetAddonCharacter, Adapter)
    local countOK, total = pcall(Adapter.GetNumAddOns, Adapter)
    if not characterOK or not countOK or type(total) ~= "number" or total < 0 then
        self:Print("|cffff0000无法读取插件状态，未应用预设。|r")
        return false, "APPLY_UNAVAILABLE"
    end

    local function ReadEnabled(name)
        local ok, state = pcall(Adapter.GetAddOnEnableState, Adapter, name, character)
        if not ok or type(state) ~= "number" then return nil end
        return state > 0
    end

    local actions = {}
    local index
    for index = 1, total do
        local nameOK, name = pcall(Adapter.GetAddOnName, Adapter, index)
        if not nameOK then
            self:Print("|cffff0000无法读取插件清单，未应用预设。|r")
            return false, "APPLY_UNAVAILABLE"
        end
        if type(name) == "string" and name ~= "" then
            local before = ReadEnabled(name)
            if before == nil then
                self:Print("|cffff0000无法确认插件状态，未应用预设。|r")
                return false, "APPLY_UNAVAILABLE"
            end
            local desired = expected[name] == true
            if desired ~= before and (desired or profileDB.strictWhitelist) then
                actions[#actions + 1] = { name = name, before = before, desired = desired }
            end
        end
    end

    local function WriteAndVerify(action, desired)
        local method = desired and Adapter.EnableAddOn or Adapter.DisableAddOn
        if type(method) ~= "function" then return false end
        local ok = pcall(method, Adapter, action.name, character)
        if not ok then return false end
        return ReadEnabled(action.name) == desired
    end

    local attempted = {}
    local function Rollback()
        local restored = true
        local rollbackIndex
        for rollbackIndex = #attempted, 1, -1 do
            local action = attempted[rollbackIndex]
            if not WriteAndVerify(action, action.before) then restored = false end
        end
        local currentOK = pcall(function() profileDB.currentId = originalCurrentId end)
        if not currentOK or profileDB.currentId ~= originalCurrentId then restored = false end
        return restored
    end

    local enabled, disabled = 0, 0
    for index = 1, #actions do
        local action = actions[index]
        attempted[#attempted + 1] = action
        if not WriteAndVerify(action, action.desired) then
            if not Rollback() then
                self:Print("|cffff0000预设应用失败且自动恢复未完成，请立即重载界面后检查插件状态。|r")
                return false, "ROLLBACK_FAILED"
            end
            self:Print("|cffff0000预设应用失败，已恢复原插件状态。|r")
            return false, "APPLY_FAILED"
        end
        if action.desired then enabled = enabled + 1 else disabled = disabled + 1 end
    end

    local committed = pcall(function() profileDB.currentId = normalized end)
    if not committed or profileDB.currentId ~= normalized then
        if not Rollback() then
            self:Print("|cffff0000预设应用失败且自动恢复未完成，请立即重载界面后检查插件状态。|r")
            return false, "ROLLBACK_FAILED"
        end
        self:Print("|cffff0000预设应用失败，已恢复原插件状态。|r")
        return false, "APPLY_FAILED"
    end

    if not self.reloadPending then self.loadedProfileId = originalCurrentId end
    self.reloadPending = true
    local promptOK, prompted = pcall(Adapter.PromptReload, Adapter, anchorFrame)
    if not promptOK or prompted == false then
        self:Print(("已切换到「%s」（启用 %d，禁用 %d），请手动 /reload 使其生效。"):format(
            profile.name, enabled, disabled))
    else
        self:Print(("已切换到「%s」（启用 %d，禁用 %d），需重载生效。"):format(
            profile.name, enabled, disabled))
    end
    return true
end

function Definition:GetStatusText()
    local loaded = 0
    for index = 1, Adapter:GetNumAddOns() do
        local name = Adapter:GetAddOnName(index)
        if name and Adapter:IsAddonLoaded(name) then loaded = loaded + 1 end
    end
    local id = self.loadedProfileId
    if not self.reloadPending then id = self:GetProfileDB().currentId end
    local text = ("当前加载：|cff00ff00%s · 已加载 %d 个插件|r"):format(self:GetProfileDisplayName(id), loaded)
    if self.reloadPending then
        text = text .. "\n待重载：" .. self:GetProfileDisplayName(self:GetProfileDB().currentId)
    end
    return text
end

function Definition:_NameExists(name)
    local _, profile
    for _, profile in ipairs(self:ListProfiles({ includeHidden = true })) do if profile.name == name then return true end end
    return false
end

function Definition:_NewID()
    return "custom_" .. tostring(Adapter:Now()) .. "_" .. tostring(Adapter:Random(1000, 9999))
end

function Definition:CreateCustom(name, sourceId)
    local whitelist, source = {}, sourceId and self:GetProfile(sourceId)
    if source then whitelist = CopyList(source.whitelist) end
    local id = self:_NewID()
    self:GetProfileDB().custom[#self:GetProfileDB().custom + 1] = { id = id, name = name, builtin = false, whitelist = whitelist }
    return id
end

function Definition:CreateCopy(sourceId, name)
    name = Trim(name)
    if name == "" then return nil end
    return self:CreateCustom(name, sourceId)
end

function Definition:Rename(id, name)
    local _, profile
    for _, profile in ipairs(self:GetProfileDB().custom) do if profile.id == id then profile.name = name return true end end
    return false
end

function Definition:Delete(id)
    local profile, index = self:GetProfileDB(), nil
    for index = 1, #profile.custom do
        if profile.custom[index].id == id then
            table.remove(profile.custom, index)
            if profile.currentId == id then profile.currentId = nil end
            return true
        end
    end
    return false
end

function Definition:RestoreBuiltin(id)
    id = self:NormalizeProfileId(id)
    if self:GetProfileDB().overrides[id] then self:GetProfileDB().overrides[id] = nil return true end
    return false
end

function Definition:RestoreAllBuiltins()
    local profile, had = self:GetProfileDB(), next(self:GetProfileDB().overrides) ~= nil
    profile.overrides = {}
    return had
end

function Definition:ResetAllProfilesToDefault()
    local profile, had = self:GetProfileDB(), next(self:GetProfileDB().overrides) ~= nil or #self:GetProfileDB().custom > 0
    profile.overrides, profile.custom = {}, {}
    local current, exists = self:NormalizeProfileId(profile.currentId), false
    local _, builtin
    for _, builtin in ipairs(Data.Defaults or {}) do if builtin.id == current then exists = true break end end
    profile.currentId = exists and current or nil
    return had
end

function Definition:UpdateWhitelist(id, whitelist)
    id, whitelist = self:NormalizeProfileId(id), NormalizeWhitelist(whitelist)
    local _, builtin
    for _, builtin in ipairs(Data.Defaults or {}) do
        if builtin.id == id then self:GetProfileDB().overrides[id] = { whitelist = whitelist } return true end
    end
    local _, custom
    for _, custom in ipairs(self:GetProfileDB().custom) do if custom.id == id then custom.whitelist = whitelist return true end end
    return false
end

function Definition:ExportProfileString(id)
    local profile = self:GetProfile(id)
    if not profile then return nil, "预设不存在" end
    return Adapter:EncodePayload({ v = 1, name = profile.name, whitelist = profile.whitelist }, LEGACY_EXPORT_PREFIX)
end

function Definition:EncodeAddonProfilePayload(data)
    return Adapter:EncodePayload(data, EXPORT_PREFIX)
end

function Definition:DecodeAddonProfilePayload(text, prefix)
    if type(text) ~= "string" or text == "" then return nil, "字符串为空" end
    prefix = prefix or EXPORT_PREFIX
    if text:sub(1, #prefix) ~= prefix then return nil, "字符串格式错误" end
    local data, reason = Adapter:DecodePayload(text, prefix)
    if not data then return nil, "字符串格式错误：" .. tostring(reason) end
    return data
end

function Definition:BuildExportBundleData(options)
    options = options or {}
    local bundle, profile = { v = 2, module = "AddonProfile", custom = {} }, self:GetProfileDB()
    local _, custom
    for _, custom in ipairs(profile.custom or {}) do
        if type(custom) == "table" then bundle.custom[#bundle.custom + 1] = { name = custom.name, whitelist = CopyList(custom.whitelist) } end
    end
    if options.includeOnlyCustom == false then
        bundle.overrides = {}
        local id, override
        for id, override in pairs(profile.overrides or {}) do
            if type(override) == "table" and type(override.whitelist) == "table" then bundle.overrides[id] = { whitelist = CopyList(override.whitelist) } end
        end
    end
    return bundle
end

function Definition:ExportBundleString(options) return self:EncodeAddonProfilePayload(self:BuildExportBundleData(options)) end

function Definition:MakeUniqueImportedName(base)
    base = Trim(base)
    if base == "" then base = "导入方案" end
    if not self:_NameExists(base) then return base end
    local index = 2
    while self:_NameExists(base .. index) do index = index + 1 end
    return base .. index
end

function Definition:ImportCustomProfiles(incoming, options)
    options = options or {}
    local imported, overwritten, names = 0, 0, {}
    local _, item
    for _, item in ipairs(incoming or {}) do
        if type(item) == "table" and type(item.name) == "string" and ValidateWhitelist(item.whitelist) then
            local target, _, existing = nil, nil, nil
            if options.overwriteSameName ~= false then
                for _, existing in ipairs(self:GetProfileDB().custom) do if existing.name == item.name then target = existing break end end
            end
            if target then target.whitelist = CopyList(item.whitelist) overwritten = overwritten + 1
            else
                local name = options.overwriteSameName ~= false and item.name or self:MakeUniqueImportedName(item.name)
                if options.overwriteSameName ~= false and self:_NameExists(name) then name = self:MakeUniqueImportedName(name) end
                self:GetProfileDB().custom[#self:GetProfileDB().custom + 1] = { id = self:_NewID(), name = name, builtin = false, whitelist = CopyList(item.whitelist) }
                names[#names + 1], imported = name, imported + 1
            end
        end
    end
    return imported, overwritten, names
end

function Definition:ImportBundleData(data, options)
    if type(data) ~= "table" or data.v ~= 2 or data.module ~= "AddonProfile" then return false, "字符串内容无效" end
    options = options or {}
    local imported, overwritten = self:ImportCustomProfiles(data.custom, options)
    if options.includeOverrides and type(data.overrides) == "table" then
        local id, override
        for id, override in pairs(data.overrides) do
            if type(id) == "string" and type(override) == "table" and ValidateWhitelist(override.whitelist) then
                self:GetProfileDB().overrides[id] = { whitelist = CopyList(override.whitelist) }
            end
        end
    end
    return true, nil, imported, overwritten
end

function Definition:ImportBundleString(text, options)
    local data, reason = self:DecodeAddonProfilePayload(text, EXPORT_PREFIX)
    if not data then return false, reason end
    local ok, importReason, imported, overwritten = self:ImportBundleData(data, options)
    if ok then self:Print(("已导入插件管理预设（新增 %d，覆盖 %d） "):format(imported or 0, overwritten or 0)) end
    return ok, importReason
end

function Definition:ImportProfileString(text)
    if type(text) ~= "string" then self:Print("|cffff0000字符串格式错误|r") return false end
    if text:sub(1, #EXPORT_PREFIX) == EXPORT_PREFIX then
        local ok, reason = self:ImportBundleString(text, { overwriteSameName = true })
        if not ok then self:Print("|cffff0000" .. tostring(reason) .. "|r") end
        return ok
    end
    local data, reason = self:DecodeAddonProfilePayload(text, LEGACY_EXPORT_PREFIX)
    if not data or data.v ~= 1 or type(data.name) ~= "string" or not ValidateWhitelist(data.whitelist) then
        self:Print("|cffff0000" .. tostring(reason or "字符串内容无效") .. "|r")
        return false
    end
    local imported, _, names = self:ImportCustomProfiles({ data }, { overwriteSameName = false })
    if imported > 0 then self:Print(("已导入预设「%s」"):format(names[1] or data.name)) return true end
    self:Print("|cffff0000字符串内容无效|r")
    return false
end

function Definition:OnPlayerLogin()
    self:DetectActive()
    local topBar = ns.Runtime:GetModule("TopBar")
    if topBar and type(topBar.RefreshAddonProfileButton) == "function" then topBar:RefreshAddonProfileButton() end
end

function Definition:Enable()
    self:RegisterEvent("PLAYER_LOGIN", function() self:OnPlayerLogin() end)
    if Adapter:IsLoggedIn() then self:OnPlayerLogin() end
end

function Definition:Disable()
    self:UnregisterAllEvents()
end

function Definition:Print(message, ...)
    if type(ns.Print) == "function" then return ns.Print(message, ...) end
end

local module, reason = ns.RegisterModule("AddonProfile", Definition)
if module then
    ns.AddonProfile = module
    ns.AddonProfileDefinition = Definition
else
    ns.AddonProfileRegistrationError = reason
end

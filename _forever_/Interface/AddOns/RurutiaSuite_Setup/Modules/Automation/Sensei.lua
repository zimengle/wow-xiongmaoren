local _, ns = ...

-- 专精与实际 profile 身份共同决定转换；退出只保存已确认的配置。
local Sensei = { lastSpecID = nil }
ns.SenseiAutomation = Sensei
local BREWMASTER_SPEC_ID = 268

local function GetSpecID()
    if type(_G.GetSpecialization) ~= "function" or type(_G.GetSpecializationInfo) ~= "function" then
        return nil
    end
    local index = _G.GetSpecialization()
    if not index then return nil end
    return _G.GetSpecializationInfo(index)
end

local function GetState()
    local global = ns.DB and ns.DB.global
    return global and global.automationState and global.automationState.sensei
end

local function ExportCurrent()
    local scrb = _G.SCRB
    if type(scrb) ~= "table" or type(scrb.exportProfileAsString) ~= "function" then return nil end
    local ok, value = pcall(scrb.exportProfileAsString, true, false)
    return ok and type(value) == "string" and value ~= "" and value or nil
end

local function ImportString(value)
    local scrb = _G.SCRB
    if type(scrb) ~= "table" or type(scrb.importProfileFromString) ~= "function" then
        return false, "ADDON_NOT_LOADED"
    end
    local ok, result, reason = pcall(scrb.importProfileFromString, value)
    if not ok or result == false or (result == nil and reason ~= nil) then
        return false, "API_REJECTED"
    end
    local refresh = scrb.fullUpdateBars or scrb.updateBars
    if type(refresh) == "function" and not pcall(refresh) then return false, "REFRESH_FAILED" end
    return true
end

local function Notify(message)
    local host = _G.RurutiaSuite
    if type(host) == "table" and type(host.Print) == "function" then host.Print(message) end
end

local function Slot(specID)
    return specID == BREWMASTER_SPEC_ID and "brewmasterProfile" or "defaultProfile"
end

local function CharacterKey()
    if type(_G.UnitGUID) == "function" then return _G.UnitGUID("player") end
end

local function ProfileName()
    local scrb = _G.SCRB
    if type(scrb) == "table" and type(scrb.getCurrentProfileName) == "function" then
        local ok, name = pcall(scrb.getCurrentProfileName)
        if ok and type(name) == "string" and name ~= "" then return name end
    end
end

local function Remember(self, state, key, specID, profileName)
    state.characters = state.characters or {}
    state.profileNames = state.profileNames or {}
    state.characters[key] = specID
    state.profileNames[key] = profileName
    self.lastSpecID = specID
    self.lastProfileName = profileName
    self.transition = nil
    if state.pending then state.pending[key] = nil end
end

local function MarkPending(state, key, specID, profileName, value)
    state.pending = state.pending or {}
    local record = { specID = specID, profileName = profileName, value = value }
    state.pending[key] = record
    return record
end

function Sensei:SaveCurrent()
    -- 退出只导出，不导入、不刷新。失败中的目标状态不能污染离开槽。
    if not self.lastSpecID or self.transition then return true, "not-active" end
    local state = GetState()
    if not state then return false, "sensei-state-unavailable" end
    local key = CharacterKey()
    if not key then return false, "character-unavailable" end
    if state.pending and state.pending[key] then return false, "recovery-pending" end
    local profileName, specID = ProfileName(), GetSpecID()
    if profileName ~= self.lastProfileName or not profileName or specID ~= self.lastSpecID then
        -- 例如 EditMode 在校准前切换了 profile。跨登录仍须恢复，绝不备份未知当前值。
        MarkPending(state, key, specID or self.lastSpecID, profileName,
            state[Slot(specID or self.lastSpecID)])
        return false, "profile-changed"
    end
    local exported = ExportCurrent()
    if not exported then return false, "EXPORT_FAILED" end
    if ProfileName() ~= profileName or GetSpecID() ~= specID then return false, "profile-changed" end
    state[Slot(self.lastSpecID)] = exported
    return true, "saved"
end

function Sensei:Apply()
    local settings = ns.DB and ns.DB.global and ns.DB.global.automation
    if not settings or settings.enabled == false or settings.senseiBrewmaster ~= true then return true, "disabled" end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return false, "combat-pending"
    end
    local specID = GetSpecID()
    if not specID then return false, "specialization-unavailable" end
    local state = GetState()
    if type(state) ~= "table" then return false, "sensei-state-unavailable" end
    local key = CharacterKey()
    if not key then return false, "character-unavailable" end
    local profileName = ProfileName()
    if not profileName then return false, "profile-unavailable" end
    local pending = state.pending and state.pending[key]
    if self.lastSpecID == specID and self.lastProfileName == profileName and not pending then
        return true, "already-active"
    end
    local remembered = key and type(state.characters) == "table" and state.characters[key]
    local rememberedProfile = state.profileNames and state.profileNames[key]
    if not pending and not self.lastSpecID and (not rememberedProfile or rememberedProfile == profileName)
        and ((not remembered and specID ~= BREWMASTER_SPEC_ID) or remembered == specID) then
        -- 常规首次登录以及已由本模块初始化的酒仙重登以第三方当前配置为准。
        local exported = ExportCurrent()
        if not exported then return false, "EXPORT_FAILED" end
        if ProfileName() ~= profileName or GetSpecID() ~= specID then return false, "profile-changed" end
        state[Slot(specID)] = exported
        Remember(self, state, key, specID, profileName)
        return true, "current-preserved"
    end

    if not pending and self.lastSpecID and self.lastProfileName == profileName then
        local exported = ExportCurrent()
        if not exported then return false, "EXPORT_FAILED" end
        if ProfileName() ~= profileName or GetSpecID() ~= specID then return false, "profile-changed" end
        state[Slot(self.lastSpecID)] = exported
    elseif not pending and not self.lastSpecID and not remembered
        and (not state.defaultProfile or state.defaultProfile == "") then
        -- 首次酒仙沿旧策略：缺失常规槽时先保护当前值，再使用酒仙槽/预设。
        local exported = ExportCurrent()
        if not exported then return false, "EXPORT_FAILED" end
        if ProfileName() ~= profileName or GetSpecID() ~= specID then return false, "profile-changed" end
        state.defaultProfile = exported
    end

    local slot = Slot(specID)
    -- 未完成导入保留当时的有效目标串，防止其他角色改共享槽后丢失恢复点。
    local value = pending and pending.specID == specID and pending.value or state[slot]
    if type(value) ~= "string" or value == "" then
        local preset = specID == BREWMASTER_SPEC_ID and "jx" or "sensei"
        local importer = ns.LegacyPresetImports and ns.LegacyPresetImports[preset]
        if not importer then return false, "IMPORTER_UNAVAILABLE" end
        local ready, context = importer:CanImport()
        if not ready then return false, context end
        value = context.configString
    end
    -- 必须在第三方可能部分写入前落盘。ResetSession/退出/失败均不得清此记录。
    MarkPending(state, key, specID, profileName, value)
    self.transition = true
    local imported, reason = ImportString(value)
    if not imported then return false, reason end
    if ProfileName() ~= profileName or GetSpecID() ~= specID then return false, "profile-changed" end
    state[slot] = value
    Remember(self, state, key, specID, profileName)
    local target = specID == BREWMASTER_SPEC_ID and "brewmaster" or "default"
    if settings.senseiNotify == true then
        Notify(target == "brewmaster" and "Sensei 已自动切换到酒仙资源条。"
            or "Sensei 已自动切换到常规资源条。")
    end
    return true, target
end

function Sensei:ResetSession()
    self.lastSpecID = nil
    self.lastProfileName = nil
    self.transition = nil
    return true
end

return Sensei

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")) then return end

local Factory = ns.CVarSettingsDataFactory
if type(Factory) ~= "table" then
    error("CVarSettings Data must load before the Classic adapter", 2)
end

local buildID = ns.Build.GetID()
local isWrath = buildID == "classic-wrath-legacy" or buildID == "classic-titan"
local lossCandidate = buildID == "classic-cata-legacy" or buildID == "classic-mists"
-- 姓名板控件与登录策略只对无限生效；其他经典客户端保持原有默认策略。
local supportsNameplateControls = buildID == "classic-infinite"

local function RawGetCVar(name)
    if type(_G.GetCVar) ~= "function" then return nil end
    local ok, value = pcall(_G.GetCVar, name)
    if ok then return value end
    return nil
end

local Adapter = {
    family = "classic",
    isWoW12 = false,
    isWrath = isWrath,
    supportsLossOfControl = lossCandidate and RawGetCVar("lossOfControl") ~= nil or false,
    supportsAddonProfiler = true,
    logicalDamageCVar = "floatingCombatTextCombatDamage",
    addonProfilerCVar = "addonProfilerEnabled",
    supportsNameplateControls = supportsNameplateControls,
    supportsWorldMapFilters = buildID == "classic-infinite",
    supportsStatusText = buildID == "classic-infinite",
}

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Adapter:IsLoggedIn()
    return type(_G.IsLoggedIn) == "function" and _G.IsLoggedIn() and true or false
end

function Adapter:ResolveCVarName(cvar)
    if cvar ~= self.logicalDamageCVar then return cvar end
    if self.damageTextCVar then return self.damageTextCVar end
    local candidates = { "floatingCombatTextCombatDamage_v2", "floatingCombatTextCombatDamage" }
    local index
    for index = 1, #candidates do
        if RawGetCVar(candidates[index]) ~= nil then
            self.damageTextCVar = candidates[index]
            return self.damageTextCVar
        end
    end
    self.damageTextCVar = self.logicalDamageCVar
    return self.damageTextCVar
end

function Adapter:GetCVar(cvar)
    return RawGetCVar(self:ResolveCVarName(cvar))
end

function Adapter:CVarExists(cvar)
    return self:GetCVar(cvar) ~= nil
end

function Adapter:SetCVar(cvar, value)
    local runtimeName = self:ResolveCVarName(cvar)
    if RawGetCVar(runtimeName) == nil or type(_G.SetCVar) ~= "function" then return false end
    local ok = pcall(_G.SetCVar, runtimeName, tostring(value))
    return ok and true or false
end

function Adapter:SupportsNameplateBitfields()
    local cvarAPI = _G.C_CVar
    return cvarAPI ~= nil
        and type(cvarAPI.GetCVarBitfield) == "function"
        and type(cvarAPI.SetCVarBitfield) == "function"
        or false
end

function Adapter:GetCVarBitfield(cvar, index)
    if not self:SupportsNameplateBitfields() then return nil end
    local ok, value = pcall(_G.C_CVar.GetCVarBitfield, cvar, index)
    if ok and type(value) == "boolean" then return value end
    return nil
end

function Adapter:SetCVarBitfield(cvar, index, value)
    if not self:SupportsNameplateBitfields() then return false end
    local ok, result = pcall(_G.C_CVar.SetCVarBitfield, cvar, index, value and true or false)
    return ok and result == true
end


-- Exact shared CVar: probe APIs on this client, never infer support from its flavor.
function Adapter:GetDeathRecapRetention()
    local api = _G.C_CVar
    local getter = api and api.GetCVar
    if type(getter) ~= "function" then getter = _G.GetCVar end
    if type(getter) ~= "function" then return nil end
    local ok, value = pcall(getter, "combatLogRetentionTime")
    if ok then return value end
    return nil
end

function Adapter:CanWriteDeathRecapRetention()
    local api = _G.C_CVar
    return (api and type(api.SetCVar) == "function") or type(_G.SetCVar) == "function"
end

function Adapter:SetDeathRecapRetention()
    if self:IsInCombat() or self:GetDeathRecapRetention() == nil then return false end
    local api = _G.C_CVar
    local setter = api and api.SetCVar
    if type(setter) ~= "function" then setter = _G.SetCVar end
    if type(setter) ~= "function" then return false end
    local ok, result = pcall(setter, "combatLogRetentionTime", "300")
    -- Legacy setters may return nil on success. An explicit false is a failure.
    return ok and result ~= false and tonumber(self:GetDeathRecapRetention()) == 300
end

function Adapter:IsSettingSupported(cvar)
    if cvar == "lossOfControl" or cvar == "spellActivationOverlayOpacity" then
        return ns.CVarSettingsData and ns.CVarSettingsData.metadata[cvar] ~= nil
    end
    return true
end

function Adapter:IsAddonProfilerSupported()
    local cvarAPI = _G.C_CVar
    return cvarAPI
        and type(cvarAPI.RegisterCVar) == "function"
        and type(cvarAPI.SetCVar) == "function"
        or false
end

function Adapter:IsAddonProfilerEnabled()
    local profiler = _G.C_AddOnProfiler
    if profiler and type(profiler.IsEnabled) == "function" then
        local ok, enabled = pcall(profiler.IsEnabled)
        if ok then return enabled and true or false end
    end
    local cvarAPI = _G.C_CVar
    if cvarAPI and type(cvarAPI.GetCVar) == "function" then
        local ok, value = pcall(cvarAPI.GetCVar, self.addonProfilerCVar)
        if ok and value ~= nil then return tostring(value) == "1" end
    end
    local value = RawGetCVar(self.addonProfilerCVar)
    if value ~= nil then return tostring(value) == "1" end
    return nil
end

function Adapter:DisableAddonProfiler()
    if not self:IsAddonProfilerSupported() then return false end
    local cvarAPI = _G.C_CVar
    pcall(cvarAPI.RegisterCVar, self.addonProfilerCVar, "1")
    local ok = pcall(cvarAPI.SetCVar, self.addonProfilerCVar, "0")
    return ok and true or false
end

-- 友方姓名板仅名字模式的字号（无限）。暴雪在 NamePlateUnitFrameMixin:ApplyFrameOptions
-- 中用 healthBarFontHeight 统一覆盖名字高度（forever @ 70ef1b2），玩家字号只能在
-- UpdateAnchors 之后重设；挂钩由模块层通过 Runtime 安装，这里只保持纯应用逻辑。
local nameOnlyFont = { size = nil, originals = nil }

local function RestoreNameOnlyFont(unitFrame)
    local originals = nameOnlyFont.originals
    local name = unitFrame and unitFrame.name
    if not originals or type(name) ~= "table" then return end
    local original = originals[unitFrame]
    if original == nil then return end
    if type(name.SetFontHeight) == "function" then pcall(name.SetFontHeight, name, original) end
    originals[unitFrame] = nil
end

function Adapter:ApplyNameOnlyFontToFrame(unitFrame)
    local name = unitFrame and unitFrame.name
    if type(name) ~= "table" or type(name.GetFont) ~= "function"
        or type(name.SetFontHeight) ~= "function" then return end
    local showOnly = type(unitFrame.IsShowOnlyName) == "function" and unitFrame:IsShowOnlyName() or false
    local size = nameOnlyFont.size
    if showOnly and size then
        if not nameOnlyFont.originals then
            nameOnlyFont.originals = setmetatable({}, { __mode = "k" })
        end
        if nameOnlyFont.originals[unitFrame] == nil then
            local _, height = name:GetFont()
            height = tonumber(height)
            if height and height > 0 then nameOnlyFont.originals[unitFrame] = height end
        end
        local _, current = name:GetFont()
        if tonumber(current) ~= size then pcall(name.SetFontHeight, name, size) end
    else
        RestoreNameOnlyFont(unitFrame)
    end
end

function Adapter:ApplyNameOnlyFontToAll()
    local api = _G.C_NamePlate
    if type(api) ~= "table" or type(api.GetNamePlates) ~= "function" then return end
    local ok, plates = pcall(api.GetNamePlates)
    if not ok or type(plates) ~= "table" then return end
    for index = 1, #plates do
        local plate = plates[index]
        self:ApplyNameOnlyFontToFrame(plate and plate.UnitFrame)
    end
end

-- size 为 nil 时停止接管并把已改动的姓名板还原为暴雪高度。
function Adapter:SetNameOnlyNameFontSize(size)
    if not supportsNameplateControls then return false end
    nameOnlyFont.size = tonumber(size)
    self:ApplyNameOnlyFontToAll()
    return true
end

ns.CVarSettingsAdapter = Adapter
ns.CVarSettingsData = Factory:Build(Adapter)

local _, ns = ...
local Importer = {}
ns.BlizzardSettingsImporter = Importer

local function Copy(value)
    if type(value) ~= "table" then return value end
    local copy = {}
    for key, item in pairs(value) do copy[key] = Copy(item) end
    return copy
end

local function IsEllesmereLoaded()
    local api = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(api) ~= "function" then return false end
    local ok, loaded = pcall(api, "EllesmereUI")
    return ok and loaded == true
end

-- 组合姓名板 CVar 按官方位字段接口逐位读写：JSON 的 mask 是枚举掩码，由低到高
-- 对应枚举值 1..bits（暴雪 NamePlateConstantsDocumentation，forever @ 70ef1b2）。
local MAX_BITFIELD_BITS = 32

local function MaskHasBit(mask, index)
    local weight = 2 ^ (index - 1)
    return math.floor(mask / weight) % 2 == 1
end

-- 宿主 RS 已经存在的自定义值必须跟随本次导入，否则下次登录会用旧值覆盖安装结果。
-- 宿主不可用、版本不匹配或调用失败都不影响安装本身。
local function AdoptHostIntent(cvars)
    local host = _G.RurutiaSuite
    local module = type(host) == "table" and host.CVarSettings or nil
    if type(module) ~= "table" or type(module.AdoptExternalSettings) ~= "function" then
        return 0
    end
    local ok, adopted = pcall(module.AdoptExternalSettings, module, cvars)
    if ok and type(adopted) == "number" then return adopted end
    return 0
end

-- 友方仅名字字号不是 CVar：导入后同步为宿主的持久意图（每次登录重新应用），并立即生效。
-- 宿主不可用、版本不匹配或调用失败都不影响安装本身。
local function ApplyHostNameOnlyFont(size)
    size = tonumber(size)
    if not size then return false end
    local host = _G.RurutiaSuite
    local module = type(host) == "table" and host.CVarSettings or nil
    if type(module) ~= "table" or type(module.SetNameOnlyNameFontSize) ~= "function" then
        return false
    end
    local ok, applied = pcall(module.SetNameOnlyNameFontSize, module, size)
    return ok and applied == true
end

function Importer:Import()
    if not ns.ProductManifest:Check("infinitePreset") then return false, "unsupported-on-current-build" end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then return false, "IN_COMBAT" end
    local preset, meter, api = ns.BlizzardSettingsPreset, _G.DamageMeter, _G.C_CVar
    local nativeMeter = not IsEllesmereLoaded()
    if type(preset) ~= "table" or (nativeMeter and type(meter) ~= "table") or type(api) ~= "table"
        or type(api.SetCVar) ~= "function" or type(api.GetCVar) ~= "function" then
        return false, "blizzard-settings-not-ready"
    end
    for _, method in ipairs({ "GetSessionWindow", "ShowNewSecondarySessionWindow", "HideSessionWindow",
        "SetSessionWindowDamageMeterType", "SetSessionWindowSessionID", "SetSessionWindowLocked",
        "SetSessionWindowMinimized", "SetSessionWindowNonInteractive" }) do
        if nativeMeter and type(meter[method]) ~= "function" then return false, "blizzard-settings-not-ready" end
    end
    -- Resolve only for this explicit import; never mutate the shared preset.
    local cvars = Copy(preset.cvars)
    if not nativeMeter then cvars.damageMeterEnabled = "0" end
    local oldCVars = {}
    for name in pairs(cvars) do
        oldCVars[name] = api.GetCVar(name)
        if oldCVars[name] == nil then return false, "unsupported-cvar: " .. name end
    end
    local actionBarMask = tonumber(preset.cvars.enableMultiActionBars)
    local oldActionBars, wantedActionBars, actionBarsApplied
    if actionBarMask then
        if actionBarMask < 0 or actionBarMask > 127 or math.floor(actionBarMask) ~= actionBarMask
            or type(_G.GetActionBarToggles) ~= "function" or type(_G.SetActionBarToggles) ~= "function" then
            return false, "action-bars-not-ready"
        end
        oldActionBars, wantedActionBars = { _G.GetActionBarToggles() }, {}
        for index = 1, 7 do
            if oldActionBars[index] == nil then return false, "action-bars-not-ready" end
            wantedActionBars[index] = MaskHasBit(actionBarMask, index)
        end
    end
    local bitfields = preset.bitfields or {}
    for name, definition in pairs(bitfields) do
        local bits = tonumber(definition and definition.bits)
        if not bits or bits < 1 or bits > MAX_BITFIELD_BITS or math.floor(bits) ~= bits then
            return false, "unsupported-bitfield: " .. tostring(name)
        end
        if type(api.GetCVarBitfield) ~= "function" or type(api.SetCVarBitfield) ~= "function"
            or api.GetCVar(name) == nil then
            return false, "unsupported-cvar: " .. tostring(name)
        end
        local probed, probe = pcall(api.GetCVarBitfield, name, 1)
        if not probed or type(probe) ~= "boolean" then
            return false, "unsupported-cvar: " .. tostring(name)
        end
    end
    -- Keep the snapshot limited to settings and placement, never combat history.
    local oldSettings = nativeMeter and Copy(_G.DamageMeterPerCharacterSettings) or nil
    local oldBitfields = {}
    for name, definition in pairs(bitfields) do
        local values = {}
        local index
        for index = 1, tonumber(definition.bits) do
            values[index] = api.GetCVarBitfield(name, index)
        end
        oldBitfields[name] = values
    end
    local oldFrames = {}
    for index = 1, nativeMeter and 3 or 0 do
        local frame = meter:GetSessionWindow(index)
        if frame then
            oldFrames[index] = {
                shown = frame:IsShown(), point = { frame:GetPoint() },
                width = frame:GetWidth(), height = frame:GetHeight(), userPlaced = frame:IsUserPlaced(),
            }
        end
    end
    local ok, reason = pcall(function()
        for name, value in pairs(cvars) do
            api.SetCVar(name, value)
            if tostring(api.GetCVar(name)) ~= value then error("cvar-readback-failed: " .. name) end
        end
        local name
        local definition
        for name, definition in pairs(bitfields) do
            local bits = tonumber(definition.bits)
            local mask = tonumber(definition.mask) or 0
            local index
            for index = 1, bits do
                local wanted = MaskHasBit(mask, index)
                if api.GetCVarBitfield(name, index) ~= wanted then
                    if api.SetCVarBitfield(name, index, wanted) ~= true then
                        error("bitfield-write-failed: " .. name)
                    end
                end
            end
        end
        for name, definition in pairs(bitfields) do
            local bits = tonumber(definition.bits)
            local mask = tonumber(definition.mask) or 0
            local index
            for index = 1, bits do
                if api.GetCVarBitfield(name, index) ~= MaskHasBit(mask, index) then
                    error("bitfield-readback-failed: " .. name)
                end
            end
        end
        if wantedActionBars then
            -- 与暴雪设置页相同，一次提交动作条2～8，避免逐条读取服务器镜像再写入。
            -- GetActionBarToggles 的服务器镜像可能延迟；重载后再人工核对开关集合。
            actionBarsApplied = true
            _G.SetActionBarToggles(unpack(wantedActionBars, 1, 7))
        end
        for index, window in ipairs(nativeMeter and preset.windows or {}) do
            local frame = meter:GetSessionWindow(index)
            if not frame or not frame:IsShown() then
                if index == 1 then error("damage-meter-primary-not-ready") end
                meter:ShowNewSecondarySessionWindow()
                frame = meter:GetSessionWindow(index)
            end
            if not frame then error("damage-meter-window-not-ready") end
            meter:SetSessionWindowDamageMeterType(frame, window.damageMeterType)
            meter:SetSessionWindowSessionID(frame, window.sessionType, nil)
            meter:SetSessionWindowNonInteractive(frame, false)
            meter:SetSessionWindowMinimized(frame, window.minimized == true)
            if window.point then
                frame:ClearAllPoints()
                frame:SetPoint(window.point, _G.UIParent, window.point, window.x, window.y)
                frame:SetSize(window.width, window.height)
                frame:SetUserPlaced(true)
            end
            meter:SetSessionWindowLocked(frame, window.locked == true)
        end
        local extra = nativeMeter and meter:GetSessionWindow(3)
        if extra then meter:HideSessionWindow(extra) end
        local saved = _G.DamageMeterPerCharacterSettings
        for index, window in ipairs(nativeMeter and preset.windows or {}) do
            local actual = saved and saved.windowDataList and saved.windowDataList[index]
            if not actual or actual.damageMeterType ~= window.damageMeterType
                or actual.sessionType ~= window.sessionType then error("damage-meter-readback-failed") end
        end
    end)
    if not ok then
        for index = 1, nativeMeter and 3 or 0 do
            local frame, previous = meter:GetSessionWindow(index), oldFrames[index]
            if frame then
                pcall(function()
                    local data = oldSettings and oldSettings.windowDataList and oldSettings.windowDataList[index]
                    if data then
                        meter:SetSessionWindowDamageMeterType(frame, data.damageMeterType)
                        meter:SetSessionWindowSessionID(frame, data.sessionType, data.sessionID)
                        meter:SetSessionWindowNonInteractive(frame, data.nonInteractive == true)
                        meter:SetSessionWindowMinimized(frame, data.minimized == true)
                        meter:SetSessionWindowLocked(frame, data.locked == true)
                    end
                    if previous then
                        if index > 1 then
                            frame:ClearAllPoints()
                            if previous.point[1] then frame:SetPoint(unpack(previous.point)) end
                            frame:SetSize(previous.width, previous.height)
                            frame:SetUserPlaced(previous.userPlaced)
                        end
                        frame:SetShown(previous.shown)
                    elseif index > 1 then meter:HideSessionWindow(frame) end
                end)
            end
        end
        for name, values in pairs(oldBitfields) do
            local index
            for index = 1, #values do
                pcall(api.SetCVarBitfield, name, index, values[index])
            end
        end
        for name, value in pairs(oldCVars) do pcall(api.SetCVar, name, value) end
        if actionBarsApplied then pcall(_G.SetActionBarToggles, unpack(oldActionBars, 1, 7)) end
        if nativeMeter then _G.DamageMeterPerCharacterSettings = oldSettings end
        return false, "暴雪设置未完成，请重载后重试：" .. tostring(reason)
    end
    AdoptHostIntent(cvars)
    ApplyHostNameOnlyFont(preset.nameOnlyNameFontSize)
    return true, { changed = true, reloadRequired = true, provider = "Blizzard" }
end

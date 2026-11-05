local _, ns = ...

-- Shared modern frame providers for Retail and Forever secure focus.
if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("FastFocus")) then
    return
end

local Adapter = {
    family = ns.Build.GetFamily and ns.Build.GetFamily() or "retail",
    providers = {},
    providerByID = {},
}

-- Ownership stays outside Blizzard and third-party frames. FastFocus never
-- writes bookkeeping fields onto protected objects.
local attributesByOwner = setmetatable({}, { __mode = "k" })

local function SafeCall(callback, ...)
    if type(callback) ~= "function" then
        return false, nil
    end
    return pcall(callback, ...)
end

local function ClearArray(values)
    local index
    for index = #values, 1, -1 do
        values[index] = nil
    end
end

function Adapter:RegisterProvider(provider)
    if type(provider) ~= "table" then
        error("FastFocus provider must be a table", 2)
    end
    local id = provider.id
    if type(id) ~= "string" or id == "" then
        error("FastFocus provider requires a non-empty id", 2)
    end
    if ns.Integrations and type(ns.Integrations.IsProviderAllowed) == "function"
        and not ns.Integrations:IsProviderAllowed(id == "blizzard" and "native" or id) then
        return nil, "integration-disabled"
    end
    if self.providerByID[id] ~= nil then
        error("Duplicate FastFocus provider: " .. id, 2)
    end
    provider.staticNames = provider.staticNames or {}
    provider.generatedNames = provider.generatedNames or {}
    provider.addonNames = provider.addonNames or {}
    provider.conflictButtons = provider.conflictButtons or {}
    self.providers[#self.providers + 1] = provider
    self.providerByID[id] = provider
    return provider
end

function Adapter:GetProviders(result)
    result = result or {}
    ClearArray(result)
    local index
    for index = 1, #self.providers do
        result[index] = self.providers[index]
    end
    return result
end

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() == true
end

function Adapter:IsRaidInstance()
    if type(_G.GetInstanceInfo) ~= "function" then return false end
    local ok, _, instanceType = SafeCall(_G.GetInstanceInfo)
    return ok and instanceType == "raid"
end

function Adapter:IsPlainMythicDungeon()
    if type(_G.GetInstanceInfo) ~= "function" then return false end
    local ok, _, instanceType, difficultyID = SafeCall(_G.GetInstanceInfo)
    if not ok or instanceType ~= "party" or difficultyID ~= 23 then return false end
    local challenge = _G.C_ChallengeMode
    if type(challenge) == "table" and type(challenge.IsChallengeModeActive) == "function" then
        local activeOK, active = SafeCall(challenge.IsChallengeModeActive)
        if activeOK and active then return false end
    end
    return true
end

function Adapter:GetTodayKey()
    local provider = _G.C_DateAndTime
    local ok, value = SafeCall(provider and provider.GetCurrentCalendarTime)
    if ok and type(value) == "table" then
        local year, month, day = tonumber(value.year), tonumber(value.month), tonumber(value.monthDay)
        if year and month and day then return year * 10000 + month * 100 + day end
    end
    local dateOK, date = SafeCall(_G.date, "%Y%m%d")
    return dateOK and tonumber(date) or nil
end

function Adapter:IsPlayerHealerExceptRestoShaman()
    local provider = _G.C_SpecializationInfo
    local ok, specialization = SafeCall(provider and provider.GetSpecialization)
    if not ok or not specialization then return false end
    local classOK, _, class = SafeCall(_G.UnitClass, "player")
    if classOK and class == "SHAMAN" then return false end
    local roleOK, role = SafeCall(_G.GetSpecializationRole, specialization)
    return roleOK and role == "HEALER"
end

function Adapter:GetPlayerClassColor()
    local ok, _, class = SafeCall(_G.UnitClass, "player")
    local colors = _G.CUSTOM_CLASS_COLORS or _G.RAID_CLASS_COLORS
    local color = ok and class and colors and colors[class]
    if color then return color.r or 1, color.g or 0.82, color.b or 0.22 end
    return 1, 0.82, 0.22
end

function Adapter:RegisterPreviewCommands(module)
    if type(_G.SlashCmdList) ~= "table" then return false end
    _G.SlashCmdList.RURUTIASUITE_FOCUS_PREVIEW = function()
        return module:PreviewCenterReminder()
    end
    _G.SLASH_RURUTIASUITE_FOCUS_PREVIEW1 = "/rsfocuspreview"
    _G.SLASH_RURUTIASUITE_FOCUS_PREVIEW2 = "/rsfp"
    return true
end

local CHAT_COLOR_KEYS = {
    s = "SAY",
    say = "SAY",
    y = "YELL",
    yell = "YELL",
    p = "PARTY",
    i = "INSTANCE_CHAT",
    raid = "RAID",
}

function Adapter:GetChatColor(command)
    local key = CHAT_COLOR_KEYS[tostring(command or ""):lower()]
    local provider = _G.C_ChatInfo
    if key and type(provider) == "table" and type(provider.GetColorForChatType) == "function" then
        local ok, color = SafeCall(provider.GetColorForChatType, key)
        if ok and type(color) == "table" then
            local red = color.r or (type(color.GetRGB) == "function" and select(1, color:GetRGB()))
            local green = color.g or (type(color.GetRGB) == "function" and select(2, color:GetRGB()))
            local blue = color.b or (type(color.GetRGB) == "function" and select(3, color:GetRGB()))
            if red and green and blue then return red, green, blue end
        end
    end
    local info = key and type(_G.ChatTypeInfo) == "table" and _G.ChatTypeInfo[key] or nil
    if type(info) == "table" then
        return tonumber(info.r) or 1, tonumber(info.g) or 1, tonumber(info.b) or 1
    end
    return 1, 1, 1
end

function Adapter:GetFrame(name)
    if type(name) ~= "string" then
        return nil
    end
    return _G[name]
end

function Adapter:GetNamePlateForUnit(unit)
    local provider = _G.C_NamePlate
    if type(provider) ~= "table" or type(provider.GetNamePlateForUnit) ~= "function" then
        return nil
    end
    local ok, frame = SafeCall(provider.GetNamePlateForUnit, unit)
    return ok and frame or nil
end

function Adapter:IsKnownSafeButton(frame)
    if frame == nil or type(frame.SetAttribute) ~= "function" then
        return false
    end
    if type(frame.IsForbidden) == "function" then
        local ok, forbidden = SafeCall(frame.IsForbidden, frame)
        if not ok or forbidden then
            return false
        end
    end
    return true
end

local function GetOwnerFrames(owner)
    local frames = attributesByOwner[owner]
    if frames == nil then
        frames = setmetatable({}, { __mode = "k" })
        attributesByOwner[owner] = frames
    end
    return frames
end

function Adapter:ApplyFrame(owner, frame, profile, macroText)
    if self:IsInCombat() then
        return false, "combat"
    end
    if not self:IsKnownSafeButton(frame) then
        return false, "unsafe"
    end

    local prefix, mouseButton = ns.FastFocusData.GetMouseBinding(profile)
    if not mouseButton then return true end
    local typeAttribute = prefix .. "type" .. mouseButton
    local macroAttribute = prefix .. "macrotext" .. mouseButton
    local ownerFrames = GetOwnerFrames(owner)
    local record = ownerFrames[frame]
    if record == nil then
        record = { attributes = {} }
        ownerFrames[frame] = record
    end

    local function remember(attribute, applied)
        if record.attributes[attribute] ~= nil then return false end
        local previous
        if type(frame.GetAttribute) == "function" then
            local ok, value = SafeCall(frame.GetAttribute, frame, attribute)
            if ok then previous = value end
        end
        record.attributes[attribute] = {
            hadPrevious = previous ~= nil,
            previous = previous,
            applied = applied,
        }
        return true
    end

    local currentType, currentMacro
    if type(frame.GetAttribute) == "function" then
        local okType, valueType = SafeCall(frame.GetAttribute, frame, typeAttribute)
        local okMacro, valueMacro = SafeCall(frame.GetAttribute, frame, macroAttribute)
        if okType then currentType = valueType end
        if okMacro then currentMacro = valueMacro end
    end
    local createdType = remember(typeAttribute, "macro")
    local createdMacro = remember(macroAttribute, macroText)
    local typeOK = SafeCall(frame.SetAttribute, frame, typeAttribute, "macro")
    local macroOK = typeOK and SafeCall(frame.SetAttribute, frame, macroAttribute, macroText)
    if not (typeOK and macroOK) then
        if typeOK then SafeCall(frame.SetAttribute, frame, typeAttribute, currentType) end
        if macroOK then SafeCall(frame.SetAttribute, frame, macroAttribute, currentMacro) end
        if createdType then record.attributes[typeAttribute] = nil end
        if createdMacro then record.attributes[macroAttribute] = nil end
        if next(record.attributes) == nil then ownerFrames[frame] = nil end
        return false, "attribute-error"
    end
    record.attributes[typeAttribute].applied = "macro"
    record.attributes[macroAttribute].applied = macroText
    return true, typeAttribute
end

function Adapter:ApplyNamedFrame(owner, frameName, profile, macroText)
    return self:ApplyFrame(owner, self:GetFrame(frameName), profile, macroText)
end

function Adapter:ConfigureMarkerButton(button, profile, inRaid)
    if self:IsInCombat() then return false, "combat" end
    if not self:IsKnownSafeButton(button) then return false, "unsafe" end

    local enabled = type(profile) == "table"
        and profile.markEnabled == true
        and not (inRaid == true and profile.disableMarkInRaid == true)
    local values = enabled and {
        type = "raidtarget",
        unit = "focus",
        marker = tonumber(profile.marker),
        action = profile.overwriteExistingMark == true and "set" or "set-unmarked",
        -- Macro.Build sends a down click explicitly; never inherit the player's
        -- unrelated ActionButtonUseKeyDown CVar for this internal marker action.
        useOnKeyDown = true,
    } or {}
    local _, attribute
    for _, attribute in ipairs({ "type", "unit", "marker", "action", "useOnKeyDown" }) do
        local ok = SafeCall(button.SetAttribute, button, attribute, values[attribute])
        if not ok then return false, "attribute-error" end
    end
    return true
end

local function ApplyNames(adapter, owner, names, profile, macroText, stats)
    local index
    for index = 1, #names do
        stats.lookups = stats.lookups + 1
        local frame = adapter:GetFrame(names[index])
        if frame ~= nil then
            local applied = adapter:ApplyFrame(owner, frame, profile, macroText)
            if applied then stats.applied = stats.applied + 1 end
        else
            stats.missing = stats.missing + 1
        end
    end
end

function Adapter:ApplyProviders(owner, profile, macroText)
    local stats = { applied = 0, lookups = 0, missing = 0, providers = 0 }
    local index
    for index = 1, #self.providers do
        local provider = self.providers[index]
        stats.providers = stats.providers + 1
        ApplyNames(self, owner, provider.staticNames, profile, macroText, stats)
        ApplyNames(self, owner, provider.generatedNames, profile, macroText, stats)
        if type(provider.ApplyDynamic) == "function" then
            local ok, applied = SafeCall(provider.ApplyDynamic, provider, self, owner, profile, macroText)
            if ok then stats.applied = stats.applied + (tonumber(applied) or 0) end
        end
    end
    return stats
end

function Adapter:ShouldRefreshForEvent(event, addonName)
    if event == "UPDATE_BINDINGS" or event == "PLAYER_ENTERING_WORLD" then
        return true
    end
    local index
    for index = 1, #self.providers do
        local provider = self.providers[index]
        if event == "GROUP_ROSTER_UPDATE" and provider.refreshOnGroup then
            return true
        end
        if event == "ADDON_LOADED" and provider.addonNames[addonName] then
            return true
        end
    end
    return false
end

function Adapter:ClearBindings(owner)
    if owner == nil then return true end
    if self:IsInCombat() then return false, "combat" end
    if type(_G.ClearOverrideBindings) ~= "function" then return false, "unavailable" end
    local ok, reason = SafeCall(_G.ClearOverrideBindings, owner)
    return ok, reason
end

function Adapter:SetBinding(owner, binding, buttonName, clickButton)
    if self:IsInCombat() then return false, "combat" end
    if type(_G.SetOverrideBindingClick) ~= "function" then return false, "unavailable" end
    local ok, reason = SafeCall(
        _G.SetOverrideBindingClick,
        owner,
        true,
        binding,
        buttonName,
        clickButton
    )
    return ok, reason
end

function Adapter:ClearConflictBindings()
    if self:IsInCombat() then return false, "combat" end
    local cleared = 0
    local seen = {}
    local providerIndex
    for providerIndex = 1, #self.providers do
        local names = self.providers[providerIndex].conflictButtons
        local index
        for index = 1, #names do
            local name = names[index]
            if not seen[name] then
                seen[name] = true
                local frame = self:GetFrame(name)
                if frame ~= nil and self:ClearBindings(frame) then
                    cleared = cleared + 1
                end
            end
        end
    end
    return true, cleared
end

function Adapter:RestoreFrameAttributes(owner)
    if self:IsInCombat() then return false, "combat" end
    local ownerFrames = attributesByOwner[owner]
    if ownerFrames == nil then return true, 0 end

    local restored = 0
    local frame, record
    for frame, record in pairs(ownerFrames) do
        local attribute, attributeRecord
        for attribute, attributeRecord in pairs(record.attributes) do
            local current = attributeRecord.applied
            if type(frame.GetAttribute) == "function" then
                local ok, value = SafeCall(frame.GetAttribute, frame, attribute)
                if ok then current = value end
            end
            -- Do not overwrite a newer value installed by another addon.
            if current == attributeRecord.applied then
                local previous = attributeRecord.hadPrevious and attributeRecord.previous or nil
                local ok = SafeCall(frame.SetAttribute, frame, attribute, previous)
                if ok then restored = restored + 1 end
            end
        end
    end
    attributesByOwner[owner] = nil
    return true, restored
end

function Adapter:GetAttributeOwnershipCount(owner)
    local ownerFrames = attributesByOwner[owner]
    local frames = 0
    local attributes = 0
    if ownerFrames then
        local _, record
        for _, record in pairs(ownerFrames) do
            frames = frames + 1
            for _ in pairs(record.attributes) do attributes = attributes + 1 end
        end
    end
    return frames, attributes
end

ns.FastFocusAdapter = Adapter

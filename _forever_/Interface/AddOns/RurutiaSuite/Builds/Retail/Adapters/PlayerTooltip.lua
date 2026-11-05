local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")) then return end

local Data = ns.PlayerTooltipData
if type(Data) ~= "table" then error("PlayerTooltip Data.lua must load before Retail adapter", 2) end

local Adapter = {}
local summaryCache, raidCache, keystoneCache, lastRaidRequest = {}, {}, {}, {}
local mapOrder, pendingRaidGUID
local achievementFrameGuarded, achievementComparisonEventSuspended = false, false
local keystoneProvider, keystoneProviderResolver, keystoneOwner, keystoneCallbackOwner, keystoneCallback
local keystoneProviderActive, lastKeystoneRequest, lastKeystonePrune = false, 0, 0
local keystoneCacheCount = 0
local competingProviders = {}
local tooltipSubscribers = {}
local tooltipBrokerInstalled = false
local NormalizePlayerName

local function SafeCall(func, ...)
    if type(func) ~= "function" then return nil end
    local ok, a, b, c, d, e, f, g, h = pcall(func, ...)
    if not ok then return nil end
    return a, b, c, d, e, f, g, h
end

function Adapter:IsSecret(value)
    local checker = _G.issecretvalue
    return type(checker) == "function" and checker(value) or false
end

local function SafeNumber(value)
    if Adapter:IsSecret(value) then return nil end
    return tonumber(value)
end

local function SafeTrue(value)
    return not Adapter:IsSecret(value) and value == true
end

local function SuspendAchievementComparisonEvent()
    if achievementComparisonEventSuspended then return end

    local frame = _G.AchievementFrameComparison
    if not (frame and type(frame.IsEventRegistered) == "function"
        and type(frame.UnregisterEvent) == "function") then
        return
    end

    if SafeTrue(SafeCall(frame.IsEventRegistered, frame, "INSPECT_ACHIEVEMENT_READY")) then
        SafeCall(frame.UnregisterEvent, frame, "INSPECT_ACHIEVEMENT_READY")
        achievementComparisonEventSuspended = true
    end
end

local function ResumeAchievementComparisonEvent()
    if not achievementComparisonEventSuspended then return end

    local frame = _G.AchievementFrameComparison
    if frame and type(frame.RegisterEvent) == "function" then
        SafeCall(frame.RegisterEvent, frame, "INSPECT_ACHIEVEMENT_READY")
    end
    achievementComparisonEventSuspended = false
end

local function GetTime()
    local value = SafeNumber(SafeCall(_G.GetTime))
    return value or 0
end

local function PruneTimedCache(cache, now, ttl, maximum)
    local count, key, value = 0, nil, nil
    for key, value in pairs(cache) do
        local updated = type(value) == "table" and value.updated or value
        if type(updated) ~= "number" or now - updated > ttl then
            cache[key] = nil
        else
            count = count + 1
        end
    end
    while count >= maximum do
        local oldestKey, oldestTime
        for key, value in pairs(cache) do
            local updated = type(value) == "table" and value.updated or value
            if oldestTime == nil or updated < oldestTime then
                oldestKey, oldestTime = key, updated
            end
        end
        if oldestKey == nil then break end
        cache[oldestKey] = nil
        count = count - 1
    end
    return count
end

function Adapter:IsInCombatLockdown()
    local value = SafeCall(_G.InCombatLockdown)
    if self:IsSecret(value) then return true end
    return value == true
end

function Adapter:IsModifierDown(modifier)
    if modifier == "NONE" then return true end
    local checker = modifier == "SHIFT" and _G.IsShiftKeyDown
        or modifier == "CTRL" and _G.IsControlKeyDown
        or modifier == "ALT" and _G.IsAltKeyDown or nil
    return SafeTrue(SafeCall(checker))
end

function Adapter:KeyMatchesModifier(key, modifier)
    if self:IsSecret(key) then return false end
    if modifier == "SHIFT" then return key == "LSHIFT" or key == "RSHIFT" end
    if modifier == "CTRL" then return key == "LCTRL" or key == "RCTRL" end
    if modifier == "ALT" then return key == "LALT" or key == "RALT" end
    return false
end

function Adapter:RegisterCompetingUI(provider)
    if type(provider) ~= "table" or type(provider.id) ~= "string"
        or type(provider.label) ~= "string" or type(provider.IsAvailable) ~= "function" then
        error("Invalid PlayerTooltip competing UI provider", 2)
    end
    if ns.Integrations and not ns.Integrations:IsProviderAllowed(provider.id) then return nil end
    competingProviders[#competingProviders + 1] = provider
    return provider
end

function Adapter:GetDetectedCompetingUI(profile)
    local detected, blocker
    local index
    for index = 1, #competingProviders do
        local provider = competingProviders[index]
        if SafeTrue(SafeCall(provider.IsAvailable, provider)) then
            detected = detected or provider.label
            if not blocker and (not profile or profile[provider.settingKey] == true) then
                blocker = provider.label
            end
        end
    end
    return detected, blocker
end

function Adapter:ShouldReevaluateForAddon(addonName)
    if self:IsSecret(addonName) then return false end
    local index
    for index = 1, #competingProviders do
        if competingProviders[index].addonName == addonName then return true end
    end
    return false
end

local function DispatchTooltip(tooltip, tooltipData)
    local owner, record
    for owner, record in pairs(tooltipSubscribers) do
        if record.active and owner:IsEnabled() then
            owner._runtime:_CallModule(owner, "TooltipPostCall", record.callback, tooltip, tooltipData)
        end
    end
end

function Adapter:SubscribeTooltip(owner, callback)
    if tooltipSubscribers[owner] then return tooltipSubscribers[owner].token end
    local processor, enum = _G.TooltipDataProcessor, _G.Enum
    local unitType = enum and enum.TooltipDataType and enum.TooltipDataType.Unit
    if not (processor and type(processor.AddTooltipPostCall) == "function" and unitType) then return nil end
    if not tooltipBrokerInstalled then
        local ok = pcall(processor.AddTooltipPostCall, unitType, DispatchTooltip)
        if not ok then return nil end
        tooltipBrokerInstalled = true
    end
    local token, record = {}, { owner = owner, callback = callback, active = true }
    record.token = token
    tooltipSubscribers[owner] = record
    owner:OwnQueue(token, function()
        record.active = false
        tooltipSubscribers[owner] = nil
    end, function() return 0 end, "PlayerTooltip post-call subscription")
    return token
end

function Adapter:UnsubscribeTooltip(owner, token)
    local record = tooltipSubscribers[owner]
    if not record or record.token ~= token then return false end
    return owner:ReleaseQueue(token)
end

function Adapter:IsOwnedTooltip(tooltip)
    if tooltip ~= _G.GameTooltip or not tooltip then return false end
    local forbidden = SafeCall(tooltip.IsForbidden, tooltip)
    return not self:IsSecret(forbidden) and forbidden ~= true
end

function Adapter:CaptureTooltip(tooltip)
    local result = { lines = {}, font = nil }
    if not tooltip then return result end
    local name = SafeCall(tooltip.GetName, tooltip) or "GameTooltip"
    local lineCount = SafeNumber(SafeCall(tooltip.NumLines, tooltip)) or 0
    local index
    for index = 1, lineCount do
        local line = _G[name .. "TextLeft" .. index]
        local text = line and SafeCall(line.GetText, line)
        if type(text) == "string" and not self:IsSecret(text) then result.lines[index] = text end
    end
    for index = 2, lineCount do
        local line = _G[name .. "TextLeft" .. index]
        if line then
            local path, size, flags = SafeCall(line.GetFont, line)
            if path and size and not self:IsSecret(path) and not self:IsSecret(size) then
                result.font = { path = path, size = size, flags = flags }
                break
            end
        end
    end
    if not result.font then
        local title = _G[name .. "TextLeft1"]
        if title then
            local path, size, flags = SafeCall(title.GetFont, title)
            if path and size and not self:IsSecret(path) and not self:IsSecret(size) then
                result.font = { path = path, size = size, flags = flags }
            end
        end
    end
    return result
end

function Adapter:ApplyTooltipOperations(tooltip, operations, font)
    local firstLine = (SafeNumber(SafeCall(tooltip.NumLines, tooltip)) or 0) + 1
    local index
    for index = 1, #operations do
        local operation = operations[index]
        if operation.kind == "line" then
            SafeCall(tooltip.AddLine, tooltip, operation.text, operation.r, operation.g, operation.b)
        elseif operation.kind == "double" then
            SafeCall(tooltip.AddDoubleLine, tooltip, operation.left, operation.right,
                operation.lr, operation.lg, operation.lb, operation.rr, operation.rg, operation.rb)
        end
    end
    if font then
        local name = SafeCall(tooltip.GetName, tooltip)
        local lineCount = SafeNumber(SafeCall(tooltip.NumLines, tooltip)) or 0
        if name then
            for index = firstLine, lineCount do
                local left, right = _G[name .. "TextLeft" .. index], _G[name .. "TextRight" .. index]
                if left then SafeCall(left.SetFont, left, font.path, font.size, font.flags or "") end
                if right then SafeCall(right.SetFont, right, font.path, font.size, font.flags or "") end
            end
        end
    end
    return true
end

function Adapter:CanRefreshCurrentPlayerTooltip()
    if self:IsInCombatLockdown() then return false end
    local tooltip, enum = _G.GameTooltip, _G.Enum
    local unitType = enum and enum.TooltipDataType and enum.TooltipDataType.Unit
    if not (tooltip and unitType and SafeTrue(SafeCall(tooltip.IsShown, tooltip))) then return false end
    if not self:IsOwnedTooltip(tooltip) or type(tooltip.IsTooltipType) ~= "function" then return false end
    if not SafeTrue(SafeCall(tooltip.IsTooltipType, tooltip, unitType)) then return false end
    local tooltipData = SafeCall(tooltip.GetPrimaryTooltipData, tooltip)
    local guid = self:ResolveTooltipPlayer(tooltip, tooltipData)
    return guid ~= nil
end

function Adapter:RefreshCurrentPlayerTooltip()
    local tooltip = _G.GameTooltip
    if not self:CanRefreshCurrentPlayerTooltip() or type(tooltip.RefreshData) ~= "function" then return false end
    local ok = pcall(tooltip.RefreshData, tooltip)
    return ok
end

local function PlayerKeyFromGUID(guid)
    if not guid or Adapter:IsSecret(guid) or type(_G.GetPlayerInfoByGUID) ~= "function" then return nil end
    local _, _, _, _, _, name, realm = SafeCall(_G.GetPlayerInfoByGUID, guid)
    if Adapter:IsSecret(name) or Adapter:IsSecret(realm)
        or type(name) ~= "string" or name == "" then return nil end
    if type(realm) == "string" and realm ~= "" then name = name .. "-" .. realm end
    return NormalizePlayerName(name)
end

function Adapter:ResolveTooltipPlayer(tooltip, tooltipData)
    local guid = tooltipData and tooltipData.guid
    if self:IsSecret(guid) then guid = nil end
    local unit, tooltipName
    local _, candidate = SafeCall(tooltip and tooltip.GetUnit, tooltip)
    tooltipName = _
    if self:IsSecret(tooltipName) then tooltipName = nil end
    if candidate and not self:IsSecret(candidate) and SafeTrue(SafeCall(_G.UnitExists, candidate)) then
        local candidateGUID = SafeCall(_G.UnitGUID, candidate)
        if candidateGUID and not self:IsSecret(candidateGUID) then
            if not guid then guid = candidateGUID end
            if candidateGUID == guid then unit = candidate end
        end
    end
    if guid and not unit and type(_G.UnitTokenFromGUID) == "function" then
        candidate = SafeCall(_G.UnitTokenFromGUID, guid)
        if candidate and not self:IsSecret(candidate) and SafeTrue(SafeCall(_G.UnitExists, candidate)) then
            local candidateGUID = SafeCall(_G.UnitGUID, candidate)
            if candidateGUID and not self:IsSecret(candidateGUID) and candidateGUID == guid then unit = candidate end
        end
    end
    if guid and not unit and SafeTrue(SafeCall(_G.UnitExists, "mouseover")) then
        local mouseoverGUID = SafeCall(_G.UnitGUID, "mouseover")
        if mouseoverGUID and not self:IsSecret(mouseoverGUID) and mouseoverGUID == guid then unit = "mouseover" end
    end
    if not guid then return nil end
    if unit then
        if not SafeTrue(SafeCall(_G.UnitIsPlayer, unit)) then return nil end
    else
        local playerInfo = _G.C_PlayerInfo
        if not (playerInfo and SafeTrue(SafeCall(playerInfo.GUIDIsPlayer, guid))) then return nil end
    end

    local key = unit and NormalizePlayerName(SafeCall(_G.GetUnitName, unit, true)) or nil
    if not key then key = PlayerKeyFromGUID(guid) end
    if not key and unit then key = NormalizePlayerName(tooltipName) end
    return guid, unit, key
end

function Adapter:ResolveTooltipUnit(tooltip, tooltipData)
    local guid, unit = self:ResolveTooltipPlayer(tooltip, tooltipData)
    if not unit then return nil end
    return guid, unit
end

local function BuildMapOrder()
    if mapOrder then return mapOrder end
    mapOrder = {}
    local challenge = _G.C_ChallengeMode
    local maps = challenge and SafeCall(challenge.GetMapTable)
    if type(maps) == "table" and not Adapter:IsSecret(maps) then
        local index
        for index = 1, #maps do
            local id = SafeNumber(maps[index])
            if id then mapOrder[id] = index end
        end
    end
    return mapOrder
end

local function GetMapInfo(challengeModeID)
    local challenge = _G.C_ChallengeMode
    local name = challenge and SafeCall(challenge.GetMapUIInfo, challengeModeID)
    if Adapter:IsSecret(name) or type(name) ~= "string" or name == "" then
        return "地图 " .. tostring(challengeModeID)
    end
    return name
end

function Adapter:GetMythicPlusSummary(unit, guid)
    if not guid then return nil end
    local now, cached = GetTime(), summaryCache[guid]
    if cached and now - cached.updated <= Data.summaryCacheTTL then return cached end
    local playerInfo = _G.C_PlayerInfo
    if not (unit and playerInfo and playerInfo.GetPlayerMythicPlusRatingSummary) then return nil end
    local summary = SafeCall(playerInfo.GetPlayerMythicPlusRatingSummary, unit)
    if type(summary) ~= "table" or self:IsSecret(summary) then return nil end
    local result = { score = SafeNumber(summary.currentSeasonScore) or 0, runs = {}, updated = now }
    local order = BuildMapOrder()
    if type(summary.runs) == "table" and not self:IsSecret(summary.runs) then
        local index
        for index = 1, #summary.runs do
            local source = summary.runs[index]
            if type(source) == "table" and not self:IsSecret(source) then
                local id = SafeNumber(source.challengeModeID)
                local score, level = SafeNumber(source.mapScore), SafeNumber(source.bestRunLevel)
                if id and score and level then
                    result.runs[#result.runs + 1] = {
                        challengeModeID = id, name = GetMapInfo(id), score = math.floor(score + .5),
                        level = math.floor(level), finishedSuccess = SafeTrue(source.finishedSuccess),
                        order = order[id] or 9999,
                    }
                end
            end
        end
    end
    table.sort(result.runs, function(left, right)
        if left.order == right.order then return left.name < right.name end
        return left.order < right.order
    end)
    PruneTimedCache(summaryCache, now, Data.summaryCacheTTL, Data.cacheMaxEntries)
    summaryCache[guid] = result
    return result
end

local function BuildLegendAchievement(comparison)
    local config = Data.seasonLegendAchievement
    if not config then return nil end
    local completed, month, day, year
    if comparison then
        completed, month, day, year = SafeCall(_G.GetAchievementComparisonInfo, config.id)
    else
        local _, _, _, ownCompleted, ownMonth, ownDay, ownYear = SafeCall(_G.GetAchievementInfo, config.id)
        completed, month, day, year = ownCompleted, ownMonth, ownDay, ownYear
    end
    if Adapter:IsSecret(completed) or completed == nil then return nil end
    local result = { completed = completed == true }
    month, day, year = SafeNumber(month), SafeNumber(day), SafeNumber(year)
    if result.completed and month and day and year then
        if year < 100 then year = year + 2000 end
        result.date = string.format("%d年%d月%d日", year, month, day)
    end
    return result
end

local function BuildRaidProgress(guid, comparison)
    local statisticFunc = comparison and _G.GetComparisonStatistic or _G.GetStatistic
    if type(statisticFunc) ~= "function" then return nil end
    local result = { raids = {}, legendAchievement = BuildLegendAchievement(comparison), updated = GetTime() }
    local raidIndex
    for raidIndex = 1, #Data.raidData do
        local raid, progress = Data.raidData[raidIndex], {}
        local difficultyIndex
        for difficultyIndex = #Data.raidDifficulties, 1, -1 do
            local killed, total, bossIndex = 0, 0, 1
            while bossIndex <= #raid.bossStatisticIDs do
                local id = raid.bossStatisticIDs[bossIndex][difficultyIndex]
                if id then total = total + 1 end
                local count = id and SafeNumber(SafeCall(statisticFunc, id)) or 0
                if count and count > 0 then killed = killed + 1 end
                bossIndex = bossIndex + 1
            end
            if killed > 0 then
                table.insert(progress, 1, { difficulty = difficultyIndex, killed = killed, total = total })
                if killed == total then break end
            end
        end
        if #progress > 0 then
            result.raids[#result.raids + 1] = { key = raid.key, name = raid.name, progress = progress }
        end
    end
    PruneTimedCache(raidCache, result.updated, Data.raidCacheTTL, Data.cacheMaxEntries)
    raidCache[guid] = result
    return result
end

local function StartRaidInspection(unit, guid)
    if Adapter:IsInCombatLockdown() then return false end
    if type(_G.SetAchievementComparisonUnit) ~= "function"
        or type(_G.ClearAchievementComparisonUnit) ~= "function" then return false end
    Adapter:EnsureAchievementFrameGuard()
    local frame = _G.AchievementFrame
    if frame and SafeTrue(SafeCall(frame.IsShown, frame)) then return false end
    if not SafeTrue(SafeCall(_G.CanInspect, unit)) then return false end
    local now = GetTime()
    PruneTimedCache(lastRaidRequest, now, Data.raidCacheTTL, Data.cacheMaxEntries)
    if lastRaidRequest[guid] and now - lastRaidRequest[guid] < Data.raidRequestCooldown then return false end
    lastRaidRequest[guid] = now
    if pendingRaidGUID and pendingRaidGUID ~= guid then SafeCall(_G.ClearAchievementComparisonUnit) end
    pendingRaidGUID = guid
    SuspendAchievementComparisonEvent()
    SafeCall(_G.ClearAchievementComparisonUnit)
    if not SafeTrue(SafeCall(_G.SetAchievementComparisonUnit, unit)) then
        if pendingRaidGUID == guid then pendingRaidGUID = nil end
        ResumeAchievementComparisonEvent()
        return false
    end
    return true
end

function Adapter:GetRaidProgress(unit, guid)
    if not (unit and guid) then return nil end
    local now, cached = GetTime(), raidCache[guid]
    if cached and now - cached.updated <= Data.raidCacheTTL then return cached end
    if SafeTrue(SafeCall(_G.UnitIsUnit, unit, "player")) then return BuildRaidProgress(guid, false) end
    if pendingRaidGUID ~= guid then StartRaidInspection(unit, guid) end
    return raidCache[guid]
end

function Adapter:HandleInspectAchievementReady(guid)
    if self:IsSecret(guid) or not guid or guid ~= pendingRaidGUID then return false end
    BuildRaidProgress(guid, true)
    pendingRaidGUID = nil
    SafeCall(_G.ClearAchievementComparisonUnit)
    ResumeAchievementComparisonEvent()
    return true
end

function Adapter:CancelRaidInspection()
    local hadPendingInspection = pendingRaidGUID ~= nil
    pendingRaidGUID = nil
    if hadPendingInspection then SafeCall(_G.ClearAchievementComparisonUnit) end
    ResumeAchievementComparisonEvent()
end

function Adapter:EnsureAchievementFrameGuard()
    if achievementFrameGuarded then return true end

    local frame = _G.AchievementFrame
    if not (frame and type(frame.HookScript) == "function") then return false end

    local ok = pcall(frame.HookScript, frame, "OnShow", function()
        Adapter:CancelRaidInspection()
    end)
    if not ok then return false end

    achievementFrameGuarded = true
    if pendingRaidGUID then SuspendAchievementComparisonEvent() end
    return true
end

local function ColorScore(score, colorFunc)
    score = SafeNumber(score) or 0
    local text = tostring(math.floor(score + .5))
    local color = SafeCall(colorFunc, score)
    local colored = color and SafeCall(color.WrapTextInColorCode, color, text)
    return type(colored) == "string" and colored or text
end

function Adapter:ColorOverallScore(score)
    local challenge = _G.C_ChallengeMode
    return ColorScore(score, challenge and challenge.GetDungeonScoreRarityColor)
end

function Adapter:ColorMapScore(score)
    local challenge = _G.C_ChallengeMode
    return ColorScore(score, challenge and challenge.GetSpecificDungeonOverallScoreRarityColor)
end

NormalizePlayerName = function(name)
    if Adapter:IsSecret(name) or type(name) ~= "string" or name == "" then return nil end
    name = SafeCall(_G.Ambiguate, name, "none") or name
    name = string.gsub(name, "%s", "")
    if not string.find(name, "-", 1, true) then
        local realm = SafeCall(_G.GetNormalizedRealmName)
        if type(realm) == "string" and realm ~= "" then name = name .. "-" .. realm end
    end
    return string.lower(name)
end

function Adapter:TooltipMatchesKeystoneKey(tooltip, key)
    if not (tooltip and key) then return false end
    local data = type(tooltip.GetPrimaryTooltipData) == "function"
        and SafeCall(tooltip.GetPrimaryTooltipData, tooltip) or nil
    local _, _, playerKey = self:ResolveTooltipPlayer(tooltip, data)
    return playerKey == key
end

function Adapter:CurrentTooltipMatchesKeystoneKey(key)
    return self:TooltipMatchesKeystoneKey(_G.GameTooltip, key)
end

local function ResolveKeystoneProvider()
    if keystoneProvider == nil and type(keystoneProviderResolver) == "function" then
        local ok, provider = pcall(keystoneProviderResolver)
        if ok and provider ~= nil then
            Adapter:SetKeystoneProvider(provider)
        end
    end
    return keystoneProvider
end

function Adapter:SetKeystoneProviderResolver(resolver)
    if type(resolver) ~= "function" then return false end
    keystoneProviderResolver = resolver
    return true
end

function Adapter:SetKeystoneProvider(provider)
    if type(provider) ~= "table" or type(provider.Register) ~= "function"
        or type(provider.Unregister) ~= "function" or type(provider.Request) ~= "function" then
        return false
    end
    if keystoneProviderActive then return false end
    keystoneProvider = provider
    return true
end

local function PruneKeystoneCache(now)
    if now - lastKeystonePrune < 60 then return end
    lastKeystonePrune = now
    keystoneCacheCount = PruneTimedCache(keystoneCache, now,
        Data.keystoneCacheTTL, Data.keystoneCacheMaxEntries + 1)
end

local function NotifyKeystoneChanged(key)
    local owner, callback = keystoneCallbackOwner, keystoneCallback
    if owner and callback and owner:IsEnabled() then
        owner._runtime:_CallModule(owner, "KeystoneData", callback, key)
    end
end

local function StoreKeystone(level, challengeModeID, playerRating, sender)
    level, challengeModeID, playerRating = SafeNumber(level), SafeNumber(challengeModeID), SafeNumber(playerRating)
    local key = NormalizePlayerName(sender)
    if not (level and challengeModeID and key) or level < 0 or challengeModeID < 0 then return end
    if playerRating and playerRating < 0 then playerRating = nil end
    local name = level > 0 and GetMapInfo(challengeModeID) or nil
    local now = GetTime()
    PruneKeystoneCache(now)
    local normalizedLevel, normalizedID = math.floor(level), math.floor(challengeModeID)
    local normalizedRating = playerRating and math.floor(playerRating + .5) or nil
    local previous = keystoneCache[key]
    local changed = not previous or previous.level ~= normalizedLevel
        or previous.challengeModeID ~= normalizedID or previous.name ~= name
        or previous.rating ~= normalizedRating
    if not changed then
        previous.updated = now
        if previous.sharedSummary then previous.sharedSummary.updated = now end
        return
    end
    if not previous then
        if keystoneCacheCount >= Data.keystoneCacheMaxEntries then
            keystoneCacheCount = PruneTimedCache(keystoneCache, now,
                Data.keystoneCacheTTL, Data.keystoneCacheMaxEntries)
        end
        keystoneCacheCount = keystoneCacheCount + 1
    end
    keystoneCache[key] = {
        verified = true, level = normalizedLevel, challengeModeID = normalizedID, name = name,
        rating = normalizedRating,
        sharedSummary = normalizedRating and normalizedRating > 0 and {
            score = normalizedRating, updated = now, source = "LibKeystone",
        } or nil,
        updated = now,
    }
    if changed then NotifyKeystoneChanged(key) end
end

function Adapter:EnableKeystoneData(owner, callback)
    keystoneCallbackOwner, keystoneCallback = owner, callback
    if keystoneProviderActive then return true end
    local provider = ResolveKeystoneProvider()
    if not (provider and type(provider.Register) == "function") then return false end
    keystoneOwner = keystoneOwner or {}
    local ok = pcall(provider.Register, keystoneOwner, function(level, challengeModeID, playerRating, sender)
        StoreKeystone(level, challengeModeID, playerRating, sender)
    end)
    if not ok then return false end
    keystoneProviderActive = true
    return true
end

function Adapter:IsKeystoneProviderActive()
    return keystoneProviderActive
end

function Adapter:DisableKeystoneData(owner)
    if owner and keystoneCallbackOwner and owner ~= keystoneCallbackOwner then return false end
    if keystoneProviderActive and keystoneProvider and type(keystoneProvider.Unregister) == "function" then
        pcall(keystoneProvider.Unregister, keystoneOwner)
    end
    keystoneProviderActive, keystoneCallbackOwner, keystoneCallback = false, nil, nil
    lastKeystoneRequest = 0
    return true
end

function Adapter:RequestKeystoneData()
    if not (keystoneProviderActive and keystoneProvider and type(keystoneProvider.Request) == "function") then
        return false
    end
    local now = GetTime()
    if now - lastKeystoneRequest < Data.keystoneRequestCooldown then return false end
    lastKeystoneRequest = now
    if SafeTrue(SafeCall(_G.IsInGroup)) then pcall(keystoneProvider.Request, "PARTY") end
    if SafeTrue(SafeCall(_G.IsInGuild)) then pcall(keystoneProvider.Request, "GUILD") end
    return true
end

local function GetOwnKeystone()
    local mythic = _G.C_MythicPlus
    if not mythic then return nil end
    local level = SafeNumber(SafeCall(mythic.GetOwnedKeystoneLevel)) or 0
    local id = SafeNumber(SafeCall(mythic.GetOwnedKeystoneChallengeMapID)) or 0
    return {
        verified = true, level = math.floor(level), challengeModeID = math.floor(id),
        name = level > 0 and GetMapInfo(id) or nil,
    }
end

function Adapter:GetPlayerKeystone(unit, key)
    if unit and SafeTrue(SafeCall(_G.UnitIsUnit, unit, "player")) then return GetOwnKeystone() end
    if not key and unit then key = NormalizePlayerName(SafeCall(_G.GetUnitName, unit, true)) end
    local cached = key and keystoneCache[key]
    if not cached or GetTime() - cached.updated > Data.keystoneCacheTTL then return nil end
    return cached
end

function Adapter:GetUnitKeystone(unit)
    return self:GetPlayerKeystone(unit, nil)
end

function Adapter:GetSharedMythicPlusSummary(key)
    local cached = key and keystoneCache[key]
    if not cached or GetTime() - cached.updated > Data.keystoneCacheTTL then return nil end
    return cached.sharedSummary
end

function Adapter:ClearCaches()
    local key
    for key in pairs(summaryCache) do summaryCache[key] = nil end
    for key in pairs(raidCache) do raidCache[key] = nil end
    for key in pairs(keystoneCache) do keystoneCache[key] = nil end
    keystoneCacheCount = 0
    for key in pairs(lastRaidRequest) do lastRaidRequest[key] = nil end
    self:CancelRaidInspection()
    mapOrder, lastKeystoneRequest, lastKeystonePrune = nil, 0, 0
end

local function Count(values)
    local count = 0
    for _ in pairs(values) do count = count + 1 end
    return count
end

function Adapter:GetDiagnostics()
    return {
        summaryCacheEntries = Count(summaryCache),
        raidCacheEntries = Count(raidCache),
        raidInspectionPending = pendingRaidGUID ~= nil,
        keystoneCacheEntries = Count(keystoneCache),
        keystoneProviderActive = keystoneProviderActive,
        tooltipBrokerInstalled = tooltipBrokerInstalled,
        tooltipSubscriptions = Count(tooltipSubscribers),
        competingProviders = #competingProviders,
    }
end

ns.PlayerTooltipAdapter = Adapter

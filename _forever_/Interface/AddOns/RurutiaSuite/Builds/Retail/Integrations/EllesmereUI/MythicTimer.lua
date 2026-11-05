-- Retail-only display adapter. Elles owns timing, history and native layout.
local _, ns = ...
if not (ns.Build and ns.Build.IsFamily("retail") and ns.Build.HasModule("ExtraTools")) then return end
local Timer = { maxRegions = 64 }
ns.EllesmereTimerIntegration = Timer
local settings = {
    objectiveCompareDeltaOnly = true, showUpcomingSplitTargets = false,
    objectiveTimePosition = "LEFT", objectiveAlign = "RIGHT", objectivesSize = 13,
}
local function Secret(value)
    return type(_G.issecretvalue) == "function" and _G.issecretvalue(value)
end
local function ShortTime(text)
    return (text:gsub("^0+(%d+:)", "%1"))
end
function Timer:Format(text)
    if Secret(text) or type(text) ~= "string" then return nil end
    -- These are the exact split strings produced by Elles BuildSplitCompareText.
    local current, suffix = text:match("^|c%x%x%x%x%x%x%x%x([%d:%.]+)|r%s+(.+)$")
    if not current then return nil end
    local sign, delta = suffix:match("^|c%x%x%x%x%x%x%x%x%(([+-])([%d:%.]+)%)|r$")
    if not sign then
        sign, delta = suffix:match("^|cff888888%([%d:%.]+, |c%x%x%x%x%x%x%x%x([+-])([%d:%.]+)%)|r$")
    end
    if not sign then return nil end
    delta, current = ShortTime(delta), ShortTime(current)
    if delta == "0:00" then sign = "±" end
    local color = sign == "+" and "ffff5656" or "ff64ff64"
    return "|c" .. color .. sign .. delta .. "|r |cff55ff43" .. current .. "|r"
end
local function RestoreProfile(state)
    local p = state.profile
    if not p then return end
    for key, value in pairs(settings) do
        if rawget(p, key) == value then rawset(p, key, state.original[key]) end
    end
    state.profile, state.original = nil, nil
end
local function RemoveFrame(state)
    for _, record in pairs(state.regions) do
        state.owner:RemoveHook(record.hook)
        local current = record.region:GetText()
        if record.applied and not Secret(current) and current == record.applied then
            record.region:SetText(record.original)
        end
    end
    if state.creationHook then state.owner:RemoveHook(state.creationHook) end
    state.creationHook, state.frame = nil, nil
    state.regions, state.count = {}, 0
end
function Timer:Detach(owner, refresh)
    local state = self.state
    if not state or (owner and state.owner ~= owner) then return end
    self.state = nil
    RemoveFrame(state)
    for _, hook in ipairs(state.hooks) do state.owner:RemoveHook(hook) end
    RestoreProfile(state)
    if refresh ~= false and type(_G._EMT_StandaloneRefresh) == "function" then _G._EMT_StandaloneRefresh() end
end
function Timer:ObserveRegions(state)
    if self.state ~= state or not state.frame then return end
    for _, region in ipairs({ state.frame:GetRegions() }) do
        if not state.regions[region] and state.count < self.maxRegions
            and region.IsObjectType and region:IsObjectType("FontString") then
            local record = { region = region }
            state.regions[region], state.count = record, state.count + 1
            record.hook = state.owner:HookSecureFunction(region, "SetText", function(_, target, text)
                if Timer.state ~= state or record.writing or Secret(text) then return end
                if text ~= record.input then
                    record.input, record.output = text, Timer:Format(text)
                end
                if record.output then
                    record.original, record.applied = text, record.output
                    record.writing = true
                    target:SetText(record.output)
                    record.writing = false
                else record.original, record.applied = nil, nil end
            end, "Elles boss split text")
        end
    end
end
function Timer:Sync(state)
    if self.state ~= state or state.syncing then return end
    local db = _G._EMT_AceDB
    local p = type(db) == "table" and db.profile
    if type(p) ~= "table" then return end
    if p.enabled == false then
        if state.frame then RemoveFrame(state) end
        RestoreProfile(state)
        return
    end
    state.syncing = true
    local changed = false
    if state.profile ~= p then
        RestoreProfile(state)
        state.profile, state.original = p, {}
        for key, value in pairs(settings) do
            state.original[key] = rawget(p, key)
            p[key] = value
        end
        changed = true
    end
    local frame = _G._EMT_GetStandaloneFrame()
    if frame and frame ~= state.frame and type(frame.GetRegions) == "function" then
        RemoveFrame(state)
        state.frame = frame
        state.creationHook = state.owner:HookSecureFunction(frame, "CreateFontString", function()
            Timer:ObserveRegions(state)
        end, "Elles boss row creation")
        self:ObserveRegions(state)
        changed = true
    end
    if changed then _G._EMT_StandaloneRefresh() end
    state.syncing = false
end
function Timer:Apply(owner)
    if not owner.runtimeActive or owner:GetProfile().ellesmereTimerCompact == false then
        self:Detach(owner)
        return
    end
    if type(_G._EMT_GetStandaloneFrame) ~= "function"
        or type(_G._EMT_StandaloneRefresh) ~= "function" or type(_G._EMT_AceDB) ~= "table" then return end
    local state = self.state
    if not state then
        state = { owner = owner, regions = {}, count = 0, hooks = {} }
        self.state = state
        for _, name in ipairs({ "_EMT_StandaloneRefresh", "_EMT_RebuildStandalone" }) do
            if type(_G[name]) == "function" then
                state.hooks[#state.hooks + 1] = owner:HookSecureFunction(_G, name, function() Timer:Sync(state) end)
            end
        end
    end
    self:Sync(state)
end

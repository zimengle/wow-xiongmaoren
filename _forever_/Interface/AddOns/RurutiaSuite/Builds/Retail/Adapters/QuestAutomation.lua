local _, ns = ...
-- QuestAutomation is shared by Retail and Forever's modern client.
if not ns.Build.HasModule("QuestAutomation") then return end
local Adapter = {}
ns.QuestAutomationSoundAdapter = Adapter

local function Clear(states)
    for id in pairs(states) do states[id] = nil end
end

local function Plain(value, kind)
    return not (_G.issecretvalue and _G.issecretvalue(value)) and type(value) == kind
end

local function ReadStates(states)
    local api = _G.C_QuestLog
    if not (api and api.GetNumQuestLogEntries and api.GetInfo and api.IsComplete) then return false end
    local count = api.GetNumQuestLogEntries()
    -- Bound both work and retained state to the current log, never completed quest history.
    if not Plain(count, "number") or count < 0 or count > 512 or count ~= math.floor(count) then return false end
    for index = 1, count do
        local info = api.GetInfo(index)
        if not Plain(info, "table") then return false end
        if not info.isHeader then
            local id = info.questID
            if not Plain(id, "number") or id <= 0 then return false end
            local complete = api.IsComplete(id)
            if not Plain(complete, "boolean") then return false end
            states[id] = complete
        end
    end
    return true
end

function Adapter:ReadQuestStates(states)
    Clear(states)
    local ok, complete = pcall(ReadStates, states)
    if not ok or not complete then Clear(states); return false end
    return true
end

function Adapter:IsQuestComplete(id)
    local api = _G.C_QuestLog
    if not Plain(id, "number") or id <= 0 or not (api and api.IsComplete) then return nil end
    local ok, complete = pcall(api.IsComplete, id)
    if ok and Plain(complete, "boolean") then return complete end
end

function Adapter:Now()
    if type(_G.GetTime) == "function" then return _G.GetTime() end
end

function Adapter:Play(path)
    if type(_G.PlaySoundFile) ~= "function" then return nil end
    local ok, played, handle = pcall(_G.PlaySoundFile, path, "Master")
    if ok and played then return handle end
end

function Adapter:Stop(handle)
    if handle and type(_G.StopSound) == "function" then pcall(_G.StopSound, handle) end
end

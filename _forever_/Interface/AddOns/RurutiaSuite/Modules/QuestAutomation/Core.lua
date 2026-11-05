local _, ns = ...
if not ns.Build.HasModule("QuestAutomation") then return end

local Definition = {
    activationGate = "LootTools",
    databaseName = "QuestAutomation",
    defaults = { profile = { enabled = true, autoAccept = true, autoTurnIn = true,
        completionSound = "work", completionCooldown = 10 } },
}
local Data, Sound = ns.QuestAutomationData, ns.QuestAutomationSoundAdapter
local EVENTS = { "GOSSIP_SHOW", "GOSSIP_CLOSED", "QUEST_GREETING", "QUEST_DETAIL",
    "QUEST_PROGRESS", "QUEST_COMPLETE", "QUEST_FINISHED" }
local SOUND_EVENTS = { "QUEST_LOG_UPDATE", "QUEST_WATCH_UPDATE", "QUEST_REMOVED", "PLAYER_ENTERING_WORLD" }

local function Clear(states)
    for id in pairs(states) do states[id] = nil end
end

local function Loaded(name)
    return _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded and _G.C_AddOns.IsAddOnLoaded(name)
end

function Definition:GetAutomationState()
    local ndui = ns.NDuiQuestAutomationProvider
    local nd = ndui and ndui:GetState()
    local eui = ns.EllesmereQuestAutomationIntegration
    local eq = eui and eui:GetProviderState()
    -- Only a supported integration can own or suspend native automation.
    local euiLoaded = eui and Loaded("EllesmereUIQuestTracker")
    if nd and eq and eq.trackerEnabled then
        return { owner = "conflict", enabled = false, mutable = false,
            description = "NDui 与 ELLES 任务功能同时加载，请先停用其中一套。RS 已暂停。" }
    elseif nd then
        return { owner = "ndui", enabled = nd.enabled, mutable = false,
            description = "由 NDui 接管，请使用大地图中的原有复选框；RS 不重复执行。" }
    elseif eq and eq.trackerEnabled then
        return { owner = "eui", enabled = eq.enabled, mixed = eq.mixed, mutable = true,
            autoAccept = eq.autoAccept, autoTurnIn = eq.autoTurnIn,
            description = eq.mixed and "由 ELLES 接管，接取与交付设置不同；点击可统一。"
                or "由 ELLES 接管，此开关同步控制它的自动接取与自动交付。" }
    elseif euiLoaded and not eq then
        return { owner = "unavailable", enabled = false, mutable = false,
            description = "ELLES 任务设置暂时不可读取，RS 已暂停，避免重复接交。" }
    end
    return { owner = "native", enabled = self.db and self.db.profile.enabled == true,
        mutable = self.runtimeActive == true,
        autoAccept = self.db and self.db.profile.autoAccept ~= false,
        autoTurnIn = self.db and self.db.profile.autoTurnIn ~= false,
        description = "由 RS 接管原生界面，先交再接。按住 Shift 跳过；多奖励选择及金币、货币交付需手动确认。" }
end

function Definition:SetAutomationEnabled(value)
    local state = self:GetAutomationState()
    if not state.mutable then return false end
    local ok, reason = true
    if state.owner == "eui" then
        ok, reason = ns.EllesmereQuestAutomationIntegration:SetProviderEnabled(value)
    else
        self.db.profile.enabled = value == true
    end
    self:Refresh()
    return ok, reason
end

function Definition:SetAutomationOption(key, value)
    if key ~= "autoAccept" and key ~= "autoTurnIn" then return false end
    if self:GetAutomationState().owner ~= "native" then return false end
    self.db.profile[key] = value == true
    self.lastAction = nil
    self.blockedQuest = nil
    self:Refresh()
    return true
end

function Definition:OpenSettings()
    if ns.UI and ns.UI.OpenMain then return ns.UI:OpenMain("quest") end
    return false
end

function Definition:GetCompletionSound()
    local value = self.db and self.db.profile.completionSound
    return Data.soundOptions[value] and value or "none"
end

function Definition:GetCompletionCooldown()
    local value = self.db and self.db.profile.completionCooldown
    if type(value) ~= "number" or value ~= value or value < 0 or value > 30 then return 10 end
    return math.floor(value)
end

function Definition:SetCompletionCooldown(value)
    if type(value) ~= "number" or value ~= value or value < 0 or value > 30 then return false end
    self.db.profile.completionCooldown = math.floor(value)
    self:Refresh()
    return true
end

function Definition:StopCompletionSound(previewOnly)
    if previewOnly and self.soundKind ~= "preview" then return end
    Sound:Stop(self.soundHandle)
    self.soundHandle, self.soundKind = nil, nil
end

function Definition:PlayCompletionSound(preview, selection)
    if not self.runtimeActive then return false end
    local path = Data.completionSounds[(preview and selection) or self:GetCompletionSound()]
    if not path then return false end
    local now
    if not preview then
        now = Sound:Now()
        if not now then return false end
        local elapsed = self.lastCompletionSoundTime and (now - self.lastCompletionSoundTime)
        -- Drop suppressed events without stopping the current voice or extending its cooldown.
        if elapsed and elapsed >= 0 and elapsed < self:GetCompletionCooldown() then return false end
    end
    self:StopCompletionSound()
    self.soundHandle = Sound:Play(path)
    self.soundKind = self.soundHandle and (preview and "preview" or "completion") or nil
    if self.soundHandle and not preview then self.lastCompletionSoundTime = now end
    return self.soundHandle ~= nil
end

function Definition:SetCompletionSound(value)
    if not Data.soundOptions[value] then return false end
    self.db.profile.completionSound = value
    self:StopCompletionSound()
    self:Refresh()
    return true
end

function Definition:OnQuestCompletionEvent(event, questID)
    local states, scratch = self.questCompletionStates, self.questCompletionScratch
    if not states then return end
    if event == "QUEST_REMOVED" then
        if type(questID) == "number" then states[questID], scratch[questID] = nil, nil end
        return
    elseif event == "QUEST_WATCH_UPDATE" then
        -- Objective progress usually has a quest ID; read only that known quest.
        if type(questID) ~= "number" or states[questID] == nil then return end
        local complete = Sound:IsQuestComplete(questID)
        if complete == nil then return end
        local previous = states[questID]
        states[questID] = complete
        if self.completionReady and previous == false and complete then self:PlayCompletionSound(false) end
        return
    end
    if event == "PLAYER_ENTERING_WORLD" then
        Clear(states)
        self.completionReady = false
    end
    -- Also covers unwatched quests and grouped objectives; reuse two flat maps.
    if not Sound:ReadQuestStates(scratch) then return end
    self.questCompletionStates, self.questCompletionScratch = scratch, states
    if self.completionReady then
        for id, complete in pairs(scratch) do
            if complete and states[id] == false then self:PlayCompletionSound(false) end
        end
    end
    self.completionReady = true
    Clear(states)
end

function Definition:Refresh()
    if not self.runtimeActive then return end
    if self:GetCompletionSound() ~= "none" then
        if not self.questCompletionStates then
            self.questCompletionStates, self.questCompletionScratch = {}, {}
            for _, event in ipairs(SOUND_EVENTS) do self:RegisterEvent(event, self.OnQuestCompletionEvent) end
            -- Login/reload/re-enable seed silently, including already completed quests.
            self:OnQuestCompletionEvent("PLAYER_ENTERING_WORLD")
        end
    else
        for _, event in ipairs(SOUND_EVENTS) do self:UnregisterEvent(event) end
        self.questCompletionStates, self.questCompletionScratch, self.completionReady = nil, nil, nil
        self:StopCompletionSound()
        self.lastCompletionSoundTime = nil
    end
    local state = self:GetAutomationState()
    local active = state.owner == "native" and state.enabled and (state.autoAccept or state.autoTurnIn)
    if active ~= self.automationActive then
        self.automationActive = active
        self.blockedQuest = nil
        self.lastAction = nil
        for _, event in ipairs(EVENTS) do
            if active then self:RegisterEvent(event, self.OnQuestEvent)
            else self:UnregisterEvent(event) end
        end
    end
    if ns.QuestAutomationView then ns.QuestAutomationView:Refresh(self, state) end
    local page = self.settingsPage
    if page and page.Refresh then page:Refresh("quest-automation") end
end

-- Required quest items are part of normal turn-in. Keep monetary costs manual.
local function HasCosts()
    for _, name in ipairs({ "GetQuestMoneyToGet", "GetNumQuestCurrencies" }) do
        local fn = _G[name]
        if type(fn) ~= "function" then return true end
        local value = fn()
        if type(value) ~= "number" or value ~= 0 then return true end
    end
    return false
end

local function InQuestLog(id)
    local log = _G.C_QuestLog
    if log and type(log.IsOnQuest) == "function" then
        local ok, value = pcall(log.IsOnQuest, id)
        if ok and type(value) == "boolean" then return value end
    end
    if type(_G.GetQuestLogIndexByID) == "function" then
        local ok, index = pcall(_G.GetQuestLogIndexByID, id)
        if ok and type(index) == "number" then return index > 0 end
    end
    return false
end

function Definition:ActOnce(event, id, callback, ...)
    if not id or type(callback) ~= "function" then return end
    local key = event .. ":" .. tostring(id)
    if self.lastAction == key then return end
    self.lastAction = key
    callback(...)
end

function Definition:OnQuestEvent(event)
    if event == "GOSSIP_CLOSED" or event == "QUEST_FINISHED" then
        self.lastAction = nil
        if event == "QUEST_FINISHED" then self.blockedQuest = nil end
        return
    end
    if not self.runtimeActive then return end
    local state = self:GetAutomationState()
    if state.owner ~= "native" or not state.enabled then self:Refresh(); return end
    if (_G.IsShiftKeyDown and _G.IsShiftKeyDown())
        or (_G.InCombatLockdown and _G.InCombatLockdown()) then return end
    if event == "GOSSIP_SHOW" then
        local api = _G.C_GossipInfo
        if not (api and api.GetAvailableQuests and api.GetActiveQuests) then return end
        local available, active = api.GetAvailableQuests(), api.GetActiveQuests()
        if type(available) ~= "table" or type(active) ~= "table" then return end
        -- Open only one quest per event; subsequent dialog events advance it.
        -- Gossip options do not prevent quest selection, but are never selected.
        for _, quest in ipairs(active) do
            if state.autoTurnIn and quest.questID and quest.isComplete then
                self:ActOnce(event, quest.questID, api.SelectActiveQuest, quest.questID)
                return
            end
        end
        for _, quest in ipairs(available) do
            if state.autoAccept and quest.questID and not quest.isTrivial then
                self:ActOnce(event, quest.questID, api.SelectAvailableQuest, quest.questID)
                return
            end
        end
    elseif event == "QUEST_GREETING" then
        if not (_G.GetNumAvailableQuests and _G.GetNumActiveQuests) then return end
        local available, active = _G.GetNumAvailableQuests(), _G.GetNumActiveQuests()
        if state.autoTurnIn and _G.GetActiveTitle then
            for index = 1, active do
                local _, complete = _G.GetActiveTitle(index)
                if complete then
                    self:ActOnce(event .. ":active", index, _G.SelectActiveQuest, index)
                    return
                end
            end
        end
        if state.autoAccept and _G.GetAvailableQuestInfo then
            for index = 1, available do
                local trivial = _G.GetAvailableQuestInfo(index)
                if not trivial then
                    self:ActOnce(event .. ":available", index, _G.SelectAvailableQuest, index)
                    return
                end
            end
        end
    else
        local id = _G.GetQuestID and _G.GetQuestID()
        if not id or id <= 0 then return end
        if event == "QUEST_DETAIL" then
            if not state.autoAccept then return end
            -- The client flags some dialogs (item-started quests among them)
            -- as auto-accept while still waiting for Accept. Skip only when
            -- the quest is verifiably already in the log.
            if _G.QuestGetAutoAccept and _G.QuestGetAutoAccept() and InQuestLog(id) then return end
            self:ActOnce(event, id, _G.AcceptQuest)
        elseif event == "QUEST_PROGRESS" then
            if not state.autoTurnIn then return end
            if HasCosts() then self.blockedQuest = id; return end
            if _G.IsQuestCompletable and _G.IsQuestCompletable() then
                self:ActOnce(event, id, _G.CompleteQuest)
            end
        elseif event == "QUEST_COMPLETE" then
            if not state.autoTurnIn then return end
            if self.blockedQuest == id or HasCosts() then return end
            local count = _G.GetNumQuestChoices and _G.GetNumQuestChoices()
            if type(count) == "number" and count >= 0 and count <= 1 then
                self:ActOnce(event, id, _G.GetQuestReward, 1)
            end
        end
    end
end

function Definition:BindProvider()
    if not ns.EllesmereQuestAutomationIntegration then return end
    local provider = _G.EllesmereUIQuestTracker
    if Loaded("EllesmereUIQuestTracker") and type(provider) == "table"
        and type(provider.Set) == "function" then
        self:HookSecureFunction(provider, "Set", function(owner) owner:Refresh() end,
            "QuestAutomation:EUISettings")
    end
end

function Definition:ADDON_LOADED(_, name)
    if name == "NDui" or name == "EllesmereUIQuestTracker" or name == "Blizzard_WorldMap"
        or name == "Blizzard_ObjectiveTracker" then
        self:BindProvider()
        self:Refresh()
    end
end

function Definition:Enable()
    self.runtimeActive = true
    self:RegisterEvent("ADDON_LOADED", self.ADDON_LOADED)
    self:BindProvider()
    self:Refresh()
    return true
end

function Definition:Disable()
    self:StopCompletionSound()
    self.lastCompletionSoundTime = nil
    self.questCompletionStates, self.questCompletionScratch, self.completionReady = nil, nil, nil
    self.runtimeActive = false
    self.automationActive = false
    self.lastAction = nil
    self.blockedQuest = nil
    self:UnregisterAllEvents()
    if ns.QuestAutomationView then ns.QuestAutomationView:Hide() end
    return true
end

ns.QuestAutomationDefinition = Definition
ns.QuestAutomation = ns.RegisterModule("QuestAutomation", Definition)

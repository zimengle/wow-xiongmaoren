local _, ns = ...
if ns.Build.GetID() ~= "classic-infinite" or not ns.Build.HasModule("QuestAutomation") then return end

local Integration = { addonName = "Questie", buttonText = "交接", textHitWidth = 32 }
ns.QuestAutomationTrackerIntegration = Integration

local function Refresh(module)
    if module.runtimeActive then module:Refresh() end
end

function Integration:Bind(module)
    local loader = _G.QuestieLoader
    if not (loader and type(loader.ImportModule) == "function") then return end
    local ok, tracker = pcall(loader.ImportModule, loader, "QuestieTracker")
    if not ok or type(tracker) ~= "table" then return end
    -- Initialize yields while building the line pool. A secure hook introduces
    -- a non-yieldable C boundary in WoW Lua 5.1, so never wrap Initialize.
    -- Questie calls Update after initialization and whenever tracking changes.
    if type(tracker.Update) == "function" then
        module:HookSecureFunction(tracker, "Update", Refresh, "QuestAutomation:Questie:Update")
    end
end

function Integration:GetHeader(module)
    local base, header = _G.Questie_BaseFrame, _G.Questie_HeaderFrame
    if not (base and header) then return nil end
    for _, frame in ipairs({ base, header }) do
        module:HookFrameScript(frame, "OnShow", Refresh)
        module:HookFrameScript(frame, "OnHide", Refresh)
    end
    local questie = _G.Questie
    local profile = questie and questie.db and questie.db.profile
    if profile and profile.trackerEnabled == false then return nil end
    if base:IsVisible() and header:IsVisible() then return header end
end

function Integration:Place(button, header)
    -- Follow the title/counter width and align with its text, not the zone row.
    local label = header.trackedQuests and header.trackedQuests.label
    button:SetPoint("LEFT", label or header, "RIGHT", 7, 0)
end

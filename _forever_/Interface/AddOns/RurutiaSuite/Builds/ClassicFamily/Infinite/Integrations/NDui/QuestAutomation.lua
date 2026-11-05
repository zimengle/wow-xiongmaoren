local _, ns = ...
if ns.Build.GetID() ~= "classic-infinite" or not ns.Build.HasModule("QuestAutomation") then return end

-- Reserve NDui's own map entry even when its automatic interaction is off.
-- An unreadable provider is not permission to start another automation.
local Provider = {}
function Provider:GetState()
    local addons = _G.C_AddOns
    local loaded = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if not (type(loaded) == "function" and loaded("NDui")) then return nil end
    local env = _G.NDui
    local config = type(env) == "table" and env[2]
    local db = type(config) == "table" and config.db
    local misc = type(db) == "table" and db.Misc
    return { available = type(misc) == "table", enabled = type(misc) == "table" and misc.AutoQuest == true }
end
ns.NDuiQuestAutomationProvider = Provider

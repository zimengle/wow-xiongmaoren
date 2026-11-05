local _, ns = ...
if not (ns.Build.IsFamily("retail") and ns.Build.HasModule("QuestAutomation")) then return end

-- NDui QuickQuest owns both the event handlers and its map checkbox even
-- while Misc.AutoQuest is false. Never fall back to RS on that false value.
local Provider = {}
function Provider:GetState()
    local addons = _G.C_AddOns
    if not (addons and addons.IsAddOnLoaded and addons.IsAddOnLoaded("NDui")) then return nil end
    local env = _G.NDui
    local config = type(env) == "table" and env[2]
    local misc = type(config) == "table" and config.db and config.db.Misc
    if type(misc) ~= "table" then
        return { available = false, enabled = false }
    end
    return { available = true, enabled = misc.AutoQuest == true }
end
ns.NDuiQuestAutomationProvider = Provider

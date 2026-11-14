local _, ns = ...
if ns.Build.GetID() ~= "classic-infinite" or not ns.Build.HasModule("QuestAutomation") then return end

local elles = _G.EllesmereUI
if not (elles and elles.RegisterSkin) then return end

local provider
local function Apply(button)
    if not (button and provider and provider.IsEnabled()) then return end
    provider.Checkbox(button, { borderInset = 4, stockCheck = true })
    provider.Font(button.text, 1, 1, 1)
    provider.Font(button.mixed, 1, 1, 1)
end

ns.SkinQuestAutomationControl = Apply
elles.RegisterSkin("RurutiaSuite_QuestAutomation", function(skin)
    provider = skin
    local view = ns.QuestAutomationView
    if view then
        Apply(view.button)
    end
end)

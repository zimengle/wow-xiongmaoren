local _, ns = ...
if not ns.Build.HasModule("QuestAutomation") then return end

local root = [[Interface\AddOns\RurutiaSuite\Media\Sounds\]]
ns.QuestAutomationData = {
    completionSounds = {
        bingo = root .. "【露露】Bingo.ogg",
        work = root .. "【露露】工作完成.ogg",
        quest = root .. "【露露】任务完成.ogg",
    },
    soundOptions = { bingo = "Bingo", work = "工作完成", quest = "任务完成", none = "无" },
    -- B / G / R / W: order by the displayed names' first letters.
    soundOrder = { "bingo", "work", "quest", "none" },
}

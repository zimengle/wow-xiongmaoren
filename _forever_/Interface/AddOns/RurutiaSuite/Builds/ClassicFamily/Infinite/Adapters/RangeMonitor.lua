local _, ns = ...
if not ns.Build.Is("classic-infinite") then return end

local Adapter = {}
-- Fixed-range probes, independently owned by RS. Unknown item results never
-- become an out-of-range answer. No dependency on EllesmereUI/RangeDisplay.
-- The same fixed-range item queries also work on friendly units out of combat.
-- Do not substitute the legacy friendly ladder (no35 / unavailable40 on Forever).
-- Alternatives belong to ONE range rung: an in-range answer wins over an
-- inapplicable item's false answer. Include Forever/Era-compatible fallbacks.
local probes = { {5, 8149, 136605, 63427}, {8, 34368, 33278},
    {10, 32321, 17626, 10699}, {15, 33069, 31129}, {20, 10645, 21519},
    {25, 13289, 24268, 41509, 31463}, {30, 17202, 835, 7734, 34191},
    {35, 18904, 24269}, {40, 4945, 8348, 28767, 18640, 18662} }

local function Plain(value)
    return not (type(_G.issecretvalue) == "function" and _G.issecretvalue(value))
end

-- One bounded request batch per activation, never from the measurement tick.
-- The client completes its item cache asynchronously; normal target ticks pick
-- up the results without another timer or persistent event subscription.
function Adapter:PrepareProbes()
    local request = _G.C_Item and _G.C_Item.RequestLoadItemDataByID
    if type(request) ~= "function" then return end
    for i = 1, #probes do
        for j = 2, #probes[i] do pcall(request, probes[i][j]) end
    end
end

local function CheckRung(check, rung)
    local sawFalse = false
    for i = 2, #rung do
        local ok, answer = pcall(check, rung[i], "target")
        if ok and Plain(answer) then
            if answer == true or answer == 1 then return true end
            if answer == false or answer == 0 then sawFalse = true end
        end
    end
    if sawFalse then return false end
end

function Adapter:GetRoot() return _G.UIParent end
function Adapter:InCombat() return _G.InCombatLockdown() end
function Adapter:HasTarget()
    return _G.UnitExists("target") and not _G.UnitIsUnit("target", "player")
end
function Adapter:GetFont()
    return ns.Font and ns.Font:GetPath("rangeMonitor") or _G.STANDARD_TEXT_FONT
end

function Adapter:GetRange()
    if not self:HasTarget() or _G.UnitIsDeadOrGhost("target") then return nil end
    local check = _G.C_Item and _G.C_Item.IsItemInRange or _G.IsItemInRange
    if type(check) ~= "function" then return nil end
    local attack = _G.UnitCanAttack("player", "target")
    if not Plain(attack) then return nil end
    if not attack then
        -- Item checks against friendly units are protected during combat and
        -- challenge instances. A pcall cannot make a blocked action safe.
        local challenge = _G.C_ChallengeMode and _G.C_ChallengeMode.IsChallengeModeActive
        if self:InCombat() or (challenge and challenge()) then return nil end
    end
    -- Ascending bracket walk, as used by EllesmereUI Range_ItemBracket:
    -- stop at the first known upper bound; later items cannot invalidate it.
    local low, known = 0, false
    for i = 1, #probes do
        local answer = CheckRung(check, probes[i])
        if answer == true then return low, probes[i][1] end
        if answer == false then low, known = probes[i][1], true end
    end
    if known then return low end
end

ns.RangeMonitorAdapter = Adapter

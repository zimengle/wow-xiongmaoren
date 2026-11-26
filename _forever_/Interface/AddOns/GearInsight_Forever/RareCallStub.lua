-- 发现稀有 → 弹框问要不要喊公会（11-24 用户「扫描到稀有后，弹窗，问是否发到工会里，报坐标，和问有没有人来」）
--   内核只留：认稀有（姓名板出现 / 鼠标指向 / 选中 + 常驻稀有怪编号表 ns.LootIdx.rare）+ 不加载就能判的防打扰、设置项、/gi rarecall 入口；
--   「这次刷新问过没有 / 10 分钟 3 次 / 弹框 / 掉落列表 / 话术 / 斜杠命令处理」在按需加载的 GearInsight_Forever_Gate（RareCall.lua 的 RC.Go / RC.Slash），
--   第一次真要弹（或敲 /gi rarecall）时才 LoadAddOn。
--   1.5.0 内核减肥（11-24）：事件借位面识别 Layer.lua 那个框体（它本来就注册了这四个事件，LY.OnEvent 挂钩），内核不再多建框体；
--     问过 / 频率 / 斜杠处理原样搬进 RareCall.lua。行为不变。
--   防打扰：同一只（NPC ID + 这次刷新 = GUID 末段）只弹一次；战斗中不弹（记下，脱战后它还在附近、还活着再弹）；副本 / 战场不弹；
--     10 分钟最多弹 3 次；60 秒没人理自动收起（RareCall.lua）；「这只以后不问」按 NPC ID 存档 rareCall.mute。
--   总开关 rareCall.on（nil = 开），挂在「掉落提示」功能下面（掉落提示关了也不问）。
--   ⛔ 点了才发（不自动发言）；话里不带插件名（网易DD）；不注册战斗日志事件（CLEU）。
local _, ns = ...
local L = ns.L
local RC = {}
ns.RareCall = RC

function RC.DB() ns.db.rareCall = ns.db.rareCall or {}; return ns.db.rareCall end
local function call(f, ...) local ok, v = pcall(f, ...); if ok and not ns.Secret(v) then return v end end
local function load() return RC.Go ~= nil or ns.ModLoad("gate", nil, true) and RC.Go ~= nil end

-- 认一个单位：是稀有、活着、没设「不问」、野外、不在战斗 → 加载 _Gate 交给 RC.Go（问过没有 / 频率 / 弹框）。返回 true = 弹出来了
function RC.Check(unit)
    local db = ns.db and RC.DB()
    if not db or db.on == false or ns.FeatureOff("loottip") then return false end
    local guid = call(UnitGUID, unit)
    if type(guid) ~= "string" then return false end
    local kind, _, _, _, _, id, spawn = strsplit("-", guid)
    local npc, X = tonumber(id), ns.LootIdx
    if kind ~= "Creature" or not (npc and X and X.rare and X.rare[npc]) or type(db.mute) == "table" and db.mute[npc] or call(UnitIsDead, unit) == true or call(IsInInstance) then return false end
    if InCombatLockdown() or call(UnitAffectingCombat, "player") then RC.pending = guid; return false end
    return load() and RC.Go(unit, npc, npc .. "-" .. tostring(spawn))
end

-- 脱战：战斗中看到的那只还在附近（目标 / 鼠标 / 姓名板里找得到同一个 GUID）就补弹
function RC.Regen()
    local g = RC.pending
    RC.pending = nil
    for i = -1, g and 40 or -2 do
        local u = i == -1 and "target" or i == 0 and "mouseover" or ("nameplate" .. i)
        if call(UnitGUID, u) == g then return RC.Check(u) end
    end
end

-- 设置项（搜「稀有」「喊公会」都搜得到），挂在掉落页；「这只以后不问」的找回：/gi rarecall reset
ns.RegisterSettings({ key = "rarecall", order = 46, page = "loot", title = function() return L("发现稀有喊公会", "Rare spotted: call guild") end,
    items = { { type = "check", id = "rarecall.on", keys = "稀有 喊公会 rare guild",
        text = function() return L("发现稀有时问我要不要喊公会（弹框报坐标 + 掉落，点了才发）", "When you spot a rare, offer to call your guild (location + drops; only sends if you click)") end,
        get = function() return RC.DB().on ~= false end, set = function(v) RC.DB().on = v and true or false end } } })

-- /gi rarecall on|off|reset|test：处理在 RareCall.lua（RC.Slash）
ns.ExtraSlash = ns.ExtraSlash or {}
ns.ExtraSlash.rarecall = function(rest) return load() and RC.Slash(rest) end

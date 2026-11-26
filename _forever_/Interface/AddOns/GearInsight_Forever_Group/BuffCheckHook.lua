-- HOLD：团队 / 小队 BUFF 检查器的登录触发（11-25 用户「团本BUFF加小队BUFF检查器…队长或者队员都可以检查所有在队，可以加的BUFF，是否都加，到时间提醒，提前5分钟」）
--   设计稿 docs/forever/raid-buff-check-design.md。逻辑全在按需子插件 GearInsight_Forever_BuffCheck（BuffCheck.lua）；这里只做三件事：
--   ① 借组队信标 BuffAsk.lua 的事件框体（不另建框体）：组队 / 进世界 / 脱战时，开关开着、在队里、不在战斗 → LoadAddOn 一次，之后子插件自己管事件
--   ② 「要 BUFF」设置组末尾挂一个总开关（搜「BUFF / 检查 / 祝福」找得到）
--   ③ /gi bc · /gi 检查buff 由子插件加载后自己登记（进队就会加载；挂在这里内核多 0.7 KB，离线实测）
--   ⛔ 不往 ns / BA 表里加键（表扩容的离线内存假象），状态都放局部变量；本文件 HOLD 时内核一个字节不多
local _, ns = ...; ns = _G.GearInsightForever or ns
local BA = ns and ns.BuffAsk
if not (BA and BA.ev and BA.WantedEvents) then return end

local ADDON = "GearInsight_Forever_BuffCheck"
local EV = { GROUP_ROSTER_UPDATE = true, PLAYER_ENTERING_WORLD = true, PLAYER_REGEN_ENABLED = true }
local tried
local function on() local d = ns.db and ns.db.buffCheck; return ns.db ~= nil and not (type(d) == "table" and d.off) end
local function load()
    if ns.BuffCheck or tried or not on() or (InCombatLockdown and InCombatLockdown()) or not (IsInGroup and IsInGroup()) then return end
    tried = true   -- 只试一次（没装 / 被关 = 不反复 LoadAddOn）
    pcall((C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn, ADDON)
    if ns.BuffCheck then pcall(BA.SyncEvents) end
end
local want = BA.WantedEvents
BA.WantedEvents = function()
    local w = want()
    if not ns.BuffCheck and on() then for e in pairs(EV) do w[e] = true end end
    return w
end
local h = BA.ev:GetScript("OnEvent")
BA.ev:SetScript("OnEvent", function(s, e, a1)
    if EV[e] and not ns.BuffCheck then pcall(load) end
    if h then return h(s, e, a1) end
end)
pcall(BA.SyncEvents)

local g, all = ns.SettingsGroup and ns.SettingsGroup("buffask"), ns._SettingsItems
if g and all then
    local it = { type = "check", id = "buffcheck.on", keys = "BUFF buff 检查 祝福 耐力 智力 团队 小队 提醒 分配 队长 团长 做水 灵魂石 任务 就位 assign leader water task", group = g,
        text = ns.L("团队 / 小队状态：BUFF 检查 + 队长分配（/gi ps）", "Group status: buff check + leader assignments (/gi ps)"),
        get = on,
        set = function(v)
            if type(ns.db.buffCheck) ~= "table" then ns.db.buffCheck = {} end
            ns.db.buffCheck.off = (not v) or nil
            if v then load() end
            if ns.BuffCheck then pcall(ns.BuffCheck.Update, "set") end
            pcall(BA.SyncEvents)
        end }
    g.items[#g.items + 1] = it
    all[it.id] = it
end

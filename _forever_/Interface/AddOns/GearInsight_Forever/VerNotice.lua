-- 11-24 插件过期提醒（HOLD）。用户截图 Questie 聊天框两行红字「你的任务提示插件 Questie 已经过期！/ 请考虑更新新插件！」→「把这个能力实现到我的插件上」
-- 版本从哪来（⛔ 不新开频道、不多发包）：
--   ① 位面心跳 GIFLY1（公会 / 集合口令 / 公共频道 GIForeverLY，本来每 60 秒就发）加一个字段 v=<toc 版本>（LY.AddFields；老版本不认识的字段直接忽略）。
--      长度：Layer.Heartbeat 的 x 字段在各 AddFields 之后才按 ≤ 240 字节裁，任务配对 QuestPair 的钩子排在这之后也按 ≤ 240 裁 → 最坏 240 + 8 < 255（客户端上限）
--      收到的 v 记在位面在线名单 LY.peers[名字].v 上（一人一条、150 秒没心跳自动过期、最多 300 人，都是位面底座管的）；
--      检查时数：同一个比我新的版本 ≥ VN.MIN（2）个不同玩家同时报才信（防单人伪造 / 误报）；大版本号比我大 2 以上的不信（伪造的 99.0.0 之类）
--   ② 更新器写进 DataPack.lua 的 GIF_PACK.addon（主站 forever_link.build_datapack 写 releases.json forever_v2.version；更新器校验过 sha256），单一来源直接信
-- 提示：VN.Check 自己每 VN.TICK 秒跑一次（文件加载时排第一次）；进世界（位面 LY.pewAt）不满 VN.WAIT（10）秒先等够；战斗中这次不提示、下一轮再看。
--   ⛔ ns.Print 本地打印到默认聊天框（不是发言，不发到任何频道）；每个新版本每天最多一次（存档 ns.db.verNote = { v, d }）
--   设置 → 功能 →「插件更新提醒」可关（功能页搜「过期」「更新提醒」；功能清单一条带 get / set，存档 ns.db.feat.vernote：关 / 开立刻生效、不用重载；关着心跳照样带版本，给别人判）
--   （gate 写法离线多 0.5 KB，内核放不下，所以没用）
--   网易 DD 包（toc 带 ## X-GIF-Channel: dd，gi_forever_pack.dd_variant 加）第二行改「在网易 DD 里更新」
-- ⛔ 11-24 实测：解除 HOLD 后内核离线 5,824.6 → 5,832.3 KB（+7.7），超 KERNEL_KB 5,830 约 2.3 KB → 解除前要先在内核别处腾出 ≥ 2.3 KB，或用户批阈值
-- ⛔ 内核登录内存只剩几 KB（离线 lupa 约 15-17 字节 / 条指令）：别再拆小函数、别建框体（离线一个约 3 KB）、别另登记设置组（约 2.4 KB）
local _, ns = ...
if ns.Feature then ns.Feature({ key = "vernote", cat = "set", zh = "插件更新提醒", en = "Update reminder", def = true, get = function() return not (ns.db and ns.db.feat and ns.db.feat.vernote == false) end, set = function(v) ns.db.feat = ns.db.feat or {}; ns.db.feat.vernote = v end, dzh = "插件过期提醒：有新版本时登录后在聊天框提示（每个版本每天最多一次）", den = "Says in chat when a newer version is out (once a day)" }) end
local VN = { MIN = 2, WAIT = 10, TICK = 20 }
ns.VerNotice = VN
local LY, PAT, MY = ns.Layer, "^%d+%.%d+[%.%d]*$", ns.AddonVersion()
local function pad(d) return ("%05d"):format(d) end
-- 版本排序键：每段补成 5 位（"1.5.0" → "00001.00005.00000"），键大 = 版本新（1.5.0 > 1.4.20）
function VN.Key(v) return (v:gsub("%d+", pad)) end
-- 能确认比我新的最高版本 → 提示两行（⛔ 定时器直接调、没包 pcall：这里不许有会报错的路径）
function VN.Check()
    local w = LY and LY.pewAt and VN.WAIT - ((GetTime and GetTime() or 0) - LY.pewAt) or 0
    if VN.busy then return end   -- 有的离线桩 C_Timer.After 当场就调：别递归下去
    VN.busy = true; C_Timer.After(w > 0 and w or VN.TICK, VN.Check); VN.busy = nil
    if w > 0 or MY == "" or not ns.db or ns.FeatureOff("vernote") or InCombatLockdown() then return end
    local me, v, n = VN.Key(MY), GIF_PACK and GIF_PACK.addon, {}
    if not (type(v) == "string" and #v <= 16 and v:match(PAT) and VN.Key(v) > me) then v = nil end
    for _, p in pairs(LY and LY.peers or n) do
        local x = p.v
        if x and x ~= MY and #x <= 16 and x:match(PAT) and VN.Key(x) > me and tonumber(x:match("%d+")) <= tonumber(MY:match("%d+")) + 1 then
            n[x] = (n[x] or 0) + 1
            if n[x] >= VN.MIN and (not v or VN.Key(x) > VN.Key(v)) then v = x end
        end
    end
    local d, day = ns.db.verNote or {}, date and date("%Y-%m-%d") or ""
    if not v or (d.v == v and d.d == day) then return end
    ns.db.verNote = { v = v, d = day }
    local L, o, ch = ns.L, pcall((C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata, "GearInsight_Forever", "X-GIF-Channel")
    ns.Print("|cffff5555" .. string.format(L("GearInsight 无限版有新版本 %s（你现在 %s）", "GearInsight Forever %s is out (you have %s)"), v, MY))
    ns.Print("|cffff5555" .. ((o and ch == "dd") and L("请在网易 DD 里更新插件", "Please update it in NetEase DD")
        or L("打开更新器自动更新，或去 CurseForge / 新手盒子更新", "Open the GearInsight updater to update, or get it from CurseForge")))
end
-- 位面心跳带上我的版本 / 收心跳把对方的版本记在他的在线名单条目上
if LY then
    LY.AddFields(function(t) t.v = MY end)
    local prev = LY.handlers.H
    LY.handlers.H = function(t, s, ...)
        if prev then pcall(prev, t, s, ...) end
        local p = LY.peers[s]
        if p then p.v = type(t.v) == "string" and t.v or nil end
    end
end
if C_Timer then C_Timer.After(VN.WAIT, VN.Check) end

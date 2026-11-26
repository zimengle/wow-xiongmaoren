-- 任务配对（11-23 用户「采用类似换位面的方法，把任务组队也能自动串连」「好好设计下」）—— P1，HOLD，默认关
--   设计稿：quest_autogroup_design.md（用户「同意」三条推荐：信标挪 probe 文字腾内存 / 默认关 + 组队页横幅开启 / 区域只认「120 秒内看到目标怪」）
--   你在杀怪任务的目标区域里打怪，旁边正好有装了插件、开了「任务配对」、在同一区域打同一任务同一种怪的人 →
--   两人里只有一个人（按确定规则算出的「邀请方」）弹卡问要不要邀请；点了才邀请，对方也是点「加入」（或暴雪的「接受」）才进队。
-- ⛔ 用户硬约束：
--   1. 双方都已走到任务目标区域（120 秒内亲眼看到过目标怪：姓名板 / 鼠标指向 / 目标，位面模块 LY.seen 里记着）才配对；只接了任务的人不参与
--   2. 不强制组：不自动邀请、不自动接受、不自动退队，公会会员也一样。InviteUnit / AcceptGroup / LeaveParty 只在卡片按钮的点击里调
--      （QP.DoInvite / QP.DoAccept / QP.DoLeave，只有 QuestPairUI.lua 的按钮回调调它们；离线测试静态扫描）
--   3. 卡片说清楚：谁 / 等级职业 / 本公会否 / 任务 / 双方进度 / 距离 / 为什么推荐 / 组了会怎样 / 怎么拒
--   4. 只提醒杀怪目标（type == "monster" 且没完成）；收集 / 掉落物品 / 点东西 / 对话 / 探索不提醒；混合任务只看没完成的杀怪目标
--   5. 精英任务（标签精英 / 组队 / 团队，或建议人数 > 1）不论目标类型都提醒，标「精英 · 建议 N 人」并排前
--      （P1 区域判定只有「看到目标怪」：纯收集的精英任务看不到目标怪 → 不配对，宁可漏不误报）
-- 协议：沿用位面已经跑通的 GIFLY1（LY.AddFields 往现有心跳加 ag 字段 / LY.handlers 加 G、K 两种消息 / 点对点走插件密语），
--   GIFQM1 一个字节不改；老版本收到 ag / G / K：LY.Handle 只认识的字段才用、不认识的消息种类查不到处理函数就什么都不做
-- 防骚扰：同一个人 2 小时只提示 / 只邀请一次（存档墙钟，跨 /reload）；同时只 1 张卡、10 分钟最多 3 张；
--   战斗 / 副本 / 主城 / 死亡 / 已在别人队里 / 团队 / 换层进行中不处理
-- ⛔ 晚于主插件加载：ns = _G.GearInsightForever or ns；最后一个文件（QuestPairUI.lua）置就绪标记 ns._qpReady
local _, ns = ...; ns = _G.GearInsightForever or ns
local LY, LH = ns.Layer, ns.LayerHop
if not (LY and LH and LY.AddFields and LY.handlers) then return end   -- 位面模块不在：什么都不做（UI 文件也不会置就绪）
if not ns.QM and ns.LoadModule then pcall(ns.LoadModule, "group", true) end   -- 借信标的主城判断 / 码数换算 / 「已有队伍」名单

local QP = {}
ns.QP = QP
local L = function(cn, en) return ns.L(cn, en) end
local function now() return (GetTime and GetTime()) or 0 end
local function wall() return (time and time()) or 0 end
local function secret(v) return ns.Secret and ns.Secret(v) end
local function short(n) return type(n) == "string" and (n:match("^([^%-]+)") or n) or nil end
QP.Short = short

QP.SEEN_WIN = 120        -- 秒：这么久内亲眼看到过目标怪 = 在目标区域（判据 A）
QP.MAX_YD = 300          -- 码：两人都带坐标时最远多少
QP.MAX_LVL = 5           -- 等级差上限
QP.REASK = 7200          -- 秒：同一个人提示 / 邀请过之后这么久不再提示 / 邀请（墙钟，跨 /reload）
QP.CARD_LIVE = 60        -- 秒：卡片留多久
QP.REVERSE_AFTER = 45    -- 秒：邀请方的卡过期后再等这么久，另一边才可以反过来弹卡
QP.WIN, QP.WIN_MAX = 600, 3   -- 10 分钟最多 3 张卡
QP.SCAN_GAP = 5          -- 秒：多久匹配一次
QP.BEAT_GAP = 20         -- 秒：进 / 出目标区域补发心跳最短间隔
QP.INV_WAIT = 60         -- 秒：发出邀请后等结果多久
QP.HOP_WIN = 90          -- 秒：换层进行中（LH.pending）这么久内暂停
QP.POP_DELAY = 3         -- 秒：弹卡前最多随机等多久（两个邀请方同时盯上一个人时错开）
QP.VETO_WIN = 120        -- 秒：配对对象发来的邀请，这么久内位面的「自动接受」规则一票否决（公会会员也一律点了才进）
QP.ELITE_TAGS = { [1] = true, [62] = true }   -- 任务标签：组队 / 精英（Group）、团队（Raid）
QP.sid = string.format("%04x", math.random(0, 65535))   -- 本次登录随机编号：两边都是单人时小的那个邀请

QP.cards = {}        -- 最近弹卡时间（10 分钟最多 3 张）
QP.card = nil        -- 正在显示的卡 { kind = "out" / "in" / "done", ... }
QP.waiting = nil     -- 我发出的邀请 { name, full, n, t, qid, o }
QP.since = {}        -- [名字] = 我这边第一次匹配到他的时间（反向弹卡用）
QP.expect = {}       -- [名字] = 最近一次算出「该他邀请我」的时间（位面自动接受一票否决用）
QP.gotG = {}         -- [名字] = 收到他 G 的时间
QP.pair = nil        -- 这队是配对组起来的 { name, qid, o, elite }
QP.cur = nil         -- 我当前在区域里的目标（心跳 ag 带的那个）
QP.lastIn = nil
QP.beatAt = -1e9
QP.scanAt = 0
QP.popAt = nil

-- ---------- 存档 ----------
function QP.DB()
    ns.db.qp = ns.db.qp or {}
    return ns.db.qp
end
function QP.On() return QP.DB().on == true end
local function ck() local n = UnitName and UnitName("player"); return (type(n) == "string" and not secret(n)) and n or "?" end
-- 屏蔽名单：p = 提示 / 邀请过（到期墙钟，挡「再提示」）；b = 点了「2 小时别推」（到期墙钟，再挡他发来的邀请卡）
function QP.Mutes()
    local d = QP.DB()
    d.mute = type(d.mute) == "table" and d.mute or {}
    local m = d.mute[ck()]
    if type(m) ~= "table" then m = { p = {}, b = {} }; d.mute[ck()] = m end
    m.p, m.b = m.p or {}, m.b or {}
    return m
end
local function prune(t)
    local w, n = wall(), 0
    for k, e in pairs(t) do if e <= w then t[k] = nil else n = n + 1 end end
    if n > 100 then   -- 最多 100 条：先到期的先丢
        local list = {}
        for k, e in pairs(t) do list[#list + 1] = { k, e } end
        table.sort(list, function(a, b) return a[2] < b[2] end)
        for i = 1, n - 100 do t[list[i][1]] = nil end
    end
end
function QP.Mute(name, sec, block)
    local s = short(name)
    if not s then return end
    local m = QP.Mutes()
    local e = wall() + (sec or QP.REASK)
    if (m.p[s] or 0) < e then m.p[s] = e end
    if block and (m.b[s] or 0) < e then m.b[s] = e end
    prune(m.p); prune(m.b)
end
function QP.Muted(name) local e = QP.Mutes().p[short(name) or ""]; return e ~= nil and e > wall() end
function QP.Blocked(name) local e = QP.Mutes().b[short(name) or ""]; return e ~= nil and e > wall() end
function QP.ClearMutes() local d = QP.DB(); if type(d.mute) == "table" then d.mute[ck()] = nil end end
function QP.Log(line)
    local d = QP.DB()
    d.log = type(d.log) == "table" and d.log or {}
    if #d.log >= 30 then table.remove(d.log, 1) end
    d.log[#d.log + 1] = ((date and date("%m-%d %H:%M:%S")) or tostring(now())) .. " " .. tostring(line)
end

-- ---------- 我的任务目标 ----------
local function eliteOf(qid, sug)
    local tagID, isElite
    if C_QuestLog and C_QuestLog.GetQuestTagInfo then
        local ok, info = pcall(C_QuestLog.GetQuestTagInfo, qid)
        if ok and type(info) == "table" then tagID, isElite = tonumber(info.tagID), info.isElite == true end
    elseif GetQuestTagInfo then
        local ok, id = pcall(GetQuestTagInfo, qid)
        if ok then tagID = tonumber(id) end
    end
    sug = tonumber(sug) or 0
    if isElite or (tagID and QP.ELITE_TAGS[tagID]) or sug > 1 then return math.min(5, math.max(sug, 0)) end
    return nil
end
QP.EliteOf = eliteOf
local function nums(text)
    if type(text) ~= "string" or secret(text) then return nil end
    local a, b = text:match("(%d+)%s*/%s*(%d+)%s*$")
    return tonumber(a), tonumber(b)
end
-- 一个任务的目标：新接口 C_QuestLog.GetQuestObjectives；拿不到就用老接口 GetQuestLogLeaderBoard（第 2 个返回值是类型）
local function objectives(qid, logIndex)
    local out = {}
    if C_QuestLog and C_QuestLog.GetQuestObjectives then
        local ok, objs = pcall(C_QuestLog.GetQuestObjectives, qid)
        if ok and type(objs) == "table" and #objs > 0 then
            for j, o in ipairs(objs) do
                local a, b = nums(o.text)
                out[j] = { text = o.text, type = o.type, done = o.finished and true or false,
                    have = tonumber(o.numFulfilled) or a or 0, need = tonumber(o.numRequired) or b or 0 }
            end
            return out
        end
    end
    if logIndex and GetQuestLogLeaderBoard and GetNumQuestLeaderBoards then
        local okn, n = pcall(GetNumQuestLeaderBoards, logIndex)
        for j = 1, (okn and tonumber(n) or 0) do
            local ok, text, typ, fin = pcall(GetQuestLogLeaderBoard, j, logIndex)
            if ok then
                local a, b = nums(text)
                out[j] = { text = text, type = typ, done = fin and true or false, have = a or 0, need = b or 0 }
            end
        end
    end
    return out
end
QP.Objectives = objectives
-- 任务日志 → { [qid] = { qid, title, elite = 建议人数 / nil, objs = {…} } }
function QP.QuestLog()
    local out = {}
    local function add(qid, title, sug, idx)
        qid = tonumber(qid)
        if not qid or secret(qid) then return end
        out[qid] = { qid = qid, title = (type(title) == "string" and not secret(title)) and title or ("#" .. qid), elite = eliteOf(qid, sug), objs = objectives(qid, idx) }
    end
    if C_QuestLog and C_QuestLog.GetNumQuestLogEntries and C_QuestLog.GetInfo then
        local n = C_QuestLog.GetNumQuestLogEntries() or 0
        for i = 1, n do
            local ok, info = pcall(C_QuestLog.GetInfo, i)
            if ok and type(info) == "table" and not info.isHeader and info.questID then add(info.questID, info.title, info.suggestedGroup, i) end
        end
    elseif GetNumQuestLogEntries and GetQuestLogTitle then
        local n = GetNumQuestLogEntries() or 0
        for i = 1, n do
            local ok, title, _, sug, isHeader, _, _, _, qid = pcall(GetQuestLogTitle, i)
            if ok and not isHeader and qid then add(qid, title, sug, i) end
        end
    end
    return out
end

-- 这个怪名对应的 NPC 编号里，最近一次看到的时间（位面模块 LY.names / LY.seen）
local function seenNpc(mob)
    if not mob then return nil end
    local best, bt
    for npc, nm in pairs(LY.names) do
        if nm == mob then
            for _, t in pairs(LY.seen[npc] or {}) do
                if not bt or t > bt then best, bt = npc, t end
            end
        end
    end
    return best, bt
end
QP.SeenNpc = seenNpc

-- 候选目标（只取在目标区域里的）：{ qid, o, k, have, need, elite, title, mob, seenAt }
--   普通任务：没完成的 monster 目标，每个一条；精英任务：整个任务一条（进度 = 完成的目标数 / 目标总数），
--   区域靠它的任意一个 monster 目标的怪（P1 没有任务地图点判据：纯收集的精英任务不出）
function QP.Targets(log)
    local out, t = {}, now()
    for qid, q in pairs(log or QP.QuestLog()) do
        if q.elite then
            local left, done, best = 0, 0, nil
            for j, o in ipairs(q.objs) do
                if o.done then done = done + 1 else left = left + 1 end
                if o.type == "monster" then
                    local mob = LH.ObjectiveName(o.text)
                    local npc, at = seenNpc(mob)
                    if at and t - at <= QP.SEEN_WIN and (not best or at > best.seenAt) then best = { o = j, k = npc, mob = mob, seenAt = at } end
                end
            end
            if left > 0 and best then
                out[#out + 1] = { qid = qid, o = best.o, k = best.k, have = done, need = #q.objs, elite = q.elite, title = q.title, mob = best.mob, seenAt = best.seenAt }
            end
        else
            for j, o in ipairs(q.objs) do
                if o.type == "monster" and not o.done then
                    local mob = LH.ObjectiveName(o.text)
                    local npc, at = seenNpc(mob)
                    if at and t - at <= QP.SEEN_WIN then
                        out[#out + 1] = { qid = qid, o = j, k = npc, have = o.have, need = o.need, title = q.title, mob = mob, seenAt = at }
                    end
                end
            end
        end
    end
    -- 精英排前，再按最近看到目标怪
    table.sort(out, function(a, b)
        if (a.elite ~= nil) ~= (b.elite ~= nil) then return a.elite ~= nil end
        if a.seenAt ~= b.seenAt then return a.seenAt > b.seenAt end
        if a.qid ~= b.qid then return a.qid < b.qid end
        return a.o < b.o
    end)
    return out
end

-- ---------- 我的位置 / 队伍 ----------
function QP.MyPos()
    local m = LY.MyMap and LY.MyMap()
    if not m then return nil end
    local x, y
    if C_Map and C_Map.GetPlayerMapPosition then
        local ok, pos = pcall(C_Map.GetPlayerMapPosition, m, "player")
        if ok and pos and pos.GetXY then x, y = pos:GetXY() end
        if secret(x) or secret(y) then x, y = nil, nil end
    end
    return m, x, y
end
local function yards(m, x1, y1, x2, y2)
    if not (m and x1 and y1 and x2 and y2) then return nil end
    local b = ns.QM and ns.QM._b
    if b and b.yards then return b.yards(m, x1, y1, x2, y2) end
    return math.floor(math.sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2) * 3500 + 0.5), true
end
QP.Yards = yards
function QP.Cap(elite) return elite and math.min(5, math.max(elite, 2)) or 5 end
-- 我的角色：s 单人 / l 队长有空位 / m 队员 / f 队满 / p 有邀请待处理；团队 = nil（不处理）
function QP.Role(elite)
    if IsInRaid and IsInRaid() then return nil end
    if QP.card and QP.card.kind == "in" then return "p", 1 end
    if not (IsInGroup and IsInGroup()) then return "s", 1 end
    local n = (GetNumGroupMembers and GetNumGroupMembers()) or 1
    if n < 1 then n = 1 end
    if not (UnitIsGroupLeader and UnitIsGroupLeader("player")) then return "m", n end
    return (n < QP.Cap(elite)) and "l" or "f", n
end

-- ---------- 心跳字段 ag ----------
-- ag=<任务>.<目标序号>.<怪NPC>.<已杀>.<需要>.<x千分>.<y千分>.<队伍人数>.<角色>[.e<建议人数>].<sid>
function QP.EncodeAG(c, x, y, n, role)
    local parts = { c.qid, c.o or 0, c.k or 0, c.have or 0, c.need or 0,
        x and math.floor(x * 1000) or "", y and math.floor(y * 1000) or "", n or 1, role or "s" }
    if c.elite then parts[#parts + 1] = "e" .. (c.elite or 0) end
    parts[#parts + 1] = QP.sid
    return table.concat(parts, ".")
end
function QP.ParseAG(s)
    if type(s) ~= "string" or s == "" or #s > 80 then return nil end
    local f = {}
    for part in (s .. "."):gmatch("([^.]*)%.") do f[#f + 1] = part end
    if #f < 10 then return nil end
    local a = { qid = tonumber(f[1]), o = tonumber(f[2]) or 0, k = tonumber(f[3]) or 0, have = tonumber(f[4]) or 0, need = tonumber(f[5]) or 0,
        n = tonumber(f[8]) or 1, role = f[9] }
    local x, y = tonumber(f[6]), tonumber(f[7])
    if x and y then a.x, a.y = x / 1000, y / 1000 end
    local i = 10
    local e = f[i] and f[i]:match("^e(%d+)$")
    if e then a.elite = tonumber(e); i = i + 1 end
    a.sid = f[i]
    if not (a.qid and a.sid and a.role and a.role:match("^%a$")) then return nil end
    return a
end
LY.AddFields(function(t, scope)
    if not QP.On() or t.i then return end
    local c = QP.cur
    if not c then return end
    local role, n = QP.Role(c.elite)
    if not role then return end
    local m, x, y = QP.MyPos()
    local ag = QP.EncodeAG(c, x, y, n, role)
    -- 层还没认出来时心跳不带 m（位面字段）：另带一个 am = 我的地图，配对要「同一张地图」
    if m and t.m ~= m then t.am = m end
    -- 整条 ≤ 240：太长先从 t（看到的怪，LayerHop 那段）末尾一项一项去掉，还不够就这次不带 ag（不截断别的字段）
    t.ag = ag
    while #LY.Encode("H", t) > 240 do
        if type(t.t) == "string" and t.t:find(",", 1, true) then t.t = t.t:gsub(",[^,]*$", "")
        else t.ag, t.am = nil, nil; break end
    end
end)
-- 收心跳：存他的 ag（老版本不带 = nil）
do
    local prev = LY.handlers.H
    LY.handlers.H = function(t, s, via, sender)
        if prev then pcall(prev, t, s, via, sender) end
        local p = LY.peers[s]
        if p then p.ag = QP.ParseAG(t.ag); p.am = tonumber(t.am) end
    end
end

-- ---------- 能不能处理 ----------
local function inCity()
    local QM = ns.QM
    if QM and QM.CityPaused then local ok, v = pcall(QM.CityPaused); return ok and v end
    local CP = ns.CityPlates
    local ok, v = pcall(function() return CP and CP.InCity and CP.InCity() end)
    return ok and v
end
function QP.HopBusy() return LH.pending ~= nil and now() - (LH.pending.t or -1e9) < QP.HOP_WIN end
-- 为什么现在不处理（nil = 可以）
function QP.Paused()
    if not QP.On() then return "off" end
    if QP.pauseUntil and now() < QP.pauseUntil then return "pause" end
    if LY.InInstance() then return "instance" end
    if LY.InCombat() then return "combat" end
    if UnitIsDeadOrGhost and UnitIsDeadOrGhost("player") then return "dead" end
    if inCity() then return "city" end
    if IsInRaid and IsInRaid() then return "raid" end
    if QP.HopBusy() then return "hop" end
    return nil
end
local function busy(name)
    local QM = ns.QM
    return QM and QM.IsBusy and QM.IsBusy(name) or false
end
local function inMyGroup(name) return (UnitInParty and UnitInParty(name)) and true or false end

-- 一对能不能配：我的候选 c（自己表）和他的 a（心跳）。返回距离（码，可能 nil）/ 是否估算
function QP.Match(c, a, p, myMap, mx, my)
    if not (a and c and p) then return false, "noag" end
    if (p.am or p.m) ~= myMap or not myMap then return false, "map" end
    if a.qid ~= c.qid then return false, "quest" end
    if c.elite or a.elite then
        if not (c.elite and a.elite) then return false, "elite" end
        if a.have >= a.need and a.need > 0 then return false, "done" end
    else
        if a.o ~= c.o then return false, "obj" end
        if a.need > 0 and a.have >= a.need then return false, "done" end
    end
    if a.role ~= "s" and a.role ~= "l" then return false, "role" end
    local lv, plv = UnitLevel and UnitLevel("player"), p.lv
    if type(lv) == "number" and type(plv) == "number" and math.abs(lv - plv) > QP.MAX_LVL then return false, "level" end
    local yd, est
    if mx and my and a.x and a.y then
        yd, est = yards(myMap, mx, my, a.x, a.y)
        if yd and yd > QP.MAX_YD then return false, "far" end
    end
    return true, yd, est
end
-- 谁邀请：已经是队长有空位的那边；都单人 → sid 小的（一样再比名字）。返回 true = 我邀请
function QP.IInvite(myRole, mySid, myName, a, name)
    if myRole == "l" and a.role == "s" then return true end
    if myRole == "s" and a.role == "l" then return false end
    if myRole == "s" and a.role == "s" then
        if mySid ~= a.sid then return mySid < a.sid end
        return tostring(myName) < tostring(name)
    end
    return nil
end

-- ---------- 匹配一轮 ----------
local function recent(n)
    local t, c = now(), 0
    for i = #QP.cards, 1, -1 do if t - QP.cards[i] > QP.WIN then table.remove(QP.cards, i) else c = c + 1 end end
    return c
end
QP.RecentCards = recent
function QP.Scan()
    local t = now()
    local log = QP.QuestLog()
    local targets = (QP.Paused() == nil or QP.Paused() == "combat") and QP.Targets(log) or {}
    local cur = targets[1]
    QP.cur = cur
    QP.nTargets = #targets
    -- 进 / 出目标区域：补发一次心跳（模块自己 20 秒最多一次，内核还有 5 秒最短间隔）
    local key = cur and (cur.qid .. "." .. cur.o) or nil
    if key ~= QP.lastIn and t - QP.beatAt >= QP.BEAT_GAP then
        QP.lastIn, QP.beatAt = key, t
        pcall(LY.Beat, true)
    end
    pcall(QP.CheckDone, log)
    if QP.Paused() then return nil end
    if QP.waiting and t - QP.waiting.t > QP.INV_WAIT then
        QP.Log("邀请没回应 " .. tostring(QP.waiting.name)); QP.waiting = nil
    end
    if QP.card or QP.waiting or #targets == 0 then return nil end
    local myRole = QP.Role(cur.elite)
    if myRole ~= "s" and myRole ~= "l" then return nil end
    local myMap, mx, my = QP.MyPos()
    local me = ck()
    local best
    QP.near = 0
    for name, p in pairs(LY.peers) do
        local a = p.ag
        if a and t - (p.seen or 0) <= LY.EXPIRE and not inMyGroup(name) then
            for _, c in ipairs(targets) do
                local okm, yd, est = QP.Match(c, a, p, myMap, mx, my)
                if okm then
                    QP.near = QP.near + 1
                    QP.since[name] = QP.since[name] or t
                    local mine = QP.IInvite(myRole, QP.sid, me, a, name)
                    if mine == false then QP.expect[name] = t end
                    -- 反过来：该他邀请，但他那边过了「卡片 60 秒 + 45 秒」还没来邀请（他点了这次不了 / 没理 / 他那边 2 小时内提示过我）
                    if mine == false and t - QP.since[name] >= QP.CARD_LIVE + QP.REVERSE_AFTER and not QP.gotG[name] then mine = true end
                    if mine and not QP.Muted(name) and not busy(name) and p.inst ~= true then
                        local score = (c.elite and 0 or 1) * 100000 + (yd or 9999)
                        if not best or score < best.score then best = { name = name, full = p.full or name, p = p, a = a, c = c, yd = yd, est = est, score = score } end
                    end
                    break
                end
            end
        end
    end
    -- 过期的「第一次匹配到」清掉（他走了 / 不匹配了）
    for name, s in pairs(QP.since) do
        local p = LY.peers[name]
        if not p or not p.ag or t - (p.seen or 0) > LY.EXPIRE then QP.since[name] = nil end
        if t - s > 3600 then QP.since[name] = nil end
    end
    if not best then QP.popAt = nil; QP.pop = nil; return nil end
    if recent() >= QP.WIN_MAX then return nil end
    if (QP.DB().inviter == false) then return nil end   -- 子开关：我不当邀请方，只等别人来邀请
    -- 弹卡前随机等 0–3 秒（两个邀请方同时盯上同一个单人时错开；他一进别人的队 / 有邀请待处理，下一轮就不匹配了）
    if not (QP.pop and QP.pop.name == best.name) then
        QP.pop = best
        QP.popAt = t + math.random() * QP.POP_DELAY
        return nil
    end
    if t < (QP.popAt or 0) then return nil end
    QP.pop, QP.popAt = nil, nil
    return QP.ShowOut(best)
end

-- ---------- 卡片 ----------
local function cardShow(card)
    QP.card = card
    card.t, card.exp = now(), now() + QP.CARD_LIVE
    if card.kind ~= "done" then QP.cards[#QP.cards + 1] = now() end
    if ns.QPUI and ns.QPUI.Show then pcall(ns.QPUI.Show, card) end
    return card
end
function QP.ShowOut(b)
    local card = { kind = "out", name = short(b.name), full = b.full, qid = b.c.qid, o = b.c.o, k = b.c.k, title = b.c.title, mob = b.c.mob,
        elite = b.c.elite, mine = { b.c.have, b.c.need }, his = { b.a.have, b.a.need }, yd = b.yd, est = b.est,
        lv = b.p.lv, cl = b.p.cl, guild = (b.p.via and b.p.via.guild and now() - b.p.via.guild <= LY.EXPIRE) and true or false,
        hisRole = b.a.role, hisN = b.a.n }
    QP.Mute(card.name, QP.REASK)   -- 同一个人 2 小时只提示一次（不管点了什么）
    QP.Log("提示邀请 " .. card.name .. " q=" .. card.qid)
    return cardShow(card)
end
function QP.HideCard(why)
    local c = QP.card
    QP.card = nil
    if ns.QPUI and ns.QPUI.Hide then pcall(ns.QPUI.Hide) end
    if c and why then QP.Log("收卡 " .. tostring(c.kind) .. " " .. tostring(c.name) .. " " .. why) end
    if c and c.kind == "in" then pcall(LY.Beat, true) end   -- 角色 p 撤掉
    return c
end

local function send(full, kind, fields)
    local to = "WHISPER:" .. tostring(full)
    local msg = LY.Encode(kind, fields)
    if not (LY._rawSend and LY._rawSend(to, msg)) then LY.Queue(to, msg, true) end
    return msg
end
QP.Send = send

-- ⛔ 只许在卡片「邀请他」按钮的点击里调（硬件事件）
function QP.DoInvite(card)
    card = card or QP.card
    if not (card and card.kind == "out") then return false end
    QP.HideCard()
    if LY.InCombat() or QP.HopBusy() then ns.Print(L("任务配对：现在不能邀请（战斗中 / 换层中）", "Quest pairing: can't invite now (combat / layer hop)")); return false end
    local n = string.format("%04x", math.random(0, 65535))
    local cf = UnitClass and select(2, UnitClass("player")) or nil
    -- 先密语说明（直接发，不排队）再邀请：他那边先弹说明卡，邀请框到了一起看（照 LH.HelpInvite 11-22 的顺序）
    send(card.full, "G", { n = n, q = card.qid, o = card.o, k = card.k, p = card.mine[1] .. "/" .. card.mine[2], tp = card.his[1] .. "/" .. card.his[2],
        sz = select(2, QP.Role(card.elite)), lv = UnitLevel and UnitLevel("player") or nil, cl = cf, d = card.yd, e = card.elite })
    local fn = (C_PartyInfo and C_PartyInfo.InviteUnit) or InviteUnit
    local ok = fn and pcall(fn, card.full) or false
    QP.Mute(card.name, QP.REASK)   -- 发出一次邀请之后同一个人 2 小时内不再邀请
    QP.waiting = { name = card.name, full = card.full, n = n, t = now(), qid = card.qid, o = card.o, elite = card.elite }
    QP.Log("邀请 " .. card.name .. " ok=" .. tostring(ok))
    return ok
end
-- ⛔ 只许在说明卡「加入」按钮的点击里调
function QP.DoAccept(card)
    card = card or QP.card
    if not (card and card.kind == "in") then return false end
    local inv = QP.inv
    if not (inv and inv.from == card.name and now() - inv.t <= QP.INV_WAIT) then
        ns.Print(string.format(L("任务配对：%s 的组队邀请还没到（或已过期），等邀请框出来再点「加入」，或直接点暴雪邀请框的「接受」",
            "Quest pairing: %s's invite hasn't arrived (or expired) - wait for it, or click Accept on the game's invite box"), card.name))
        return false
    end
    QP.HideCard()
    local ok = AcceptGroup and pcall(AcceptGroup) or false
    if ok and StaticPopup_Hide then pcall(StaticPopup_Hide, "PARTY_INVITE") end
    QP.inv = nil
    send(card.full, "K", { n = card.n, r = "j" })
    QP.pair = { name = card.name, qid = card.qid, o = card.o, elite = card.elite }
    QP.Log("加入 " .. card.name .. " ok=" .. tostring(ok))
    return ok
end
-- ⛔ 只许在做完小卡「退队」按钮的点击里调
function QP.DoLeave(card)
    card = card or QP.card
    if not (card and card.kind == "done") then return false end
    QP.HideCard()
    local fn = (C_PartyInfo and C_PartyInfo.LeaveParty) or LeaveParty
    local ok = fn and pcall(fn) or false
    QP.pair = nil
    QP.Log("退队 ok=" .. tostring(ok))
    return ok
end
-- 其余按钮 / 超时：later 这次不了 / block 这个人 2 小时别推 / off 关掉任务配对 / no 不加入 / keep 继续一起 / never 以后别问 / timeout
function QP.Dismiss(card, how)
    card = card or QP.card
    if not card then return end
    QP.HideCard(how)
    if card.kind == "in" then
        local r = (how == "block" or how == "off") and "m" or ((how == "no") and "x" or nil)
        if r then send(card.full, "K", { n = card.n, r = r }) end
    end
    if how == "block" then QP.Mute(card.name, QP.REASK, true)
    elseif how == "off" then QP.SetOn(false)
    elseif how == "never" then QP.DB().askLeave = false
    elseif how == "keep" then QP.pair = nil end
end
function QP.Tick()
    local c = QP.card
    if c and now() >= (c.exp or 0) then QP.Dismiss(c, "timeout"); c = nil end
    -- 邀请卡开着时他有邀请待处理（角色 p，被别人先邀请了）/ 进了别的队 / 离开区域 → 收卡（同一个人 2 小时内照样不再提示）
    if c and c.kind == "out" then
        local p = LY.peers[c.name]
        local a = p and p.ag
        if not a or (a.role ~= "s" and a.role ~= "l") then
            QP.HideCard("taken")
            if LY.Flash then pcall(LY.Flash, string.format(L("任务配对：%s 正在被别人邀请 / 已经组队 / 离开了区域，卡片收起", "Quest pairing: %s is being invited by someone else / grouped / left the area"), c.name)) end
        end
    end
    if now() >= QP.scanAt then
        QP.scanAt = now() + QP.SCAN_GAP
        pcall(QP.Scan)
    elseif QP.popAt and now() >= QP.popAt then
        pcall(QP.Scan)
    end
end

-- ---------- 收消息 ----------
-- G：别人点了「邀请」。我没开 / 战斗 / 副本 / 已在队里 → 不弹卡；我屏蔽了他 → 回 K r=m
LY.handlers.G = function(t, s, via, sender)
    if not QP.On() then return end
    QP.gotG[s] = now()
    QP.expect[s] = now()
    local full = sender or s
    if QP.Blocked(s) then send(full, "K", { n = t.n, r = "m" }); QP.Log("挡掉 " .. s .. " 的邀请（2 小时别推）"); return end
    if LY.InInstance() or LY.InCombat() or (IsInGroup and IsInGroup()) then QP.Log("收到 " .. s .. " 的邀请，没弹（战斗 / 副本 / 已在队里）"); return end
    if QP.card and QP.card.kind ~= "out" then return end
    if QP.card then QP.HideCard("被邀请顶掉") end
    local qid, o = tonumber(t.q), tonumber(t.o) or 0
    local log = QP.QuestLog()
    local q = qid and log[qid]
    local mine, gone = nil, true
    if q then
        if q.elite then
            local done = 0
            for _, ob in ipairs(q.objs) do if ob.done then done = done + 1 end end
            mine = { done, #q.objs }
            gone = done >= #q.objs
        else
            local ob = q.objs[o]
            if ob then mine = { ob.have, ob.need }; gone = ob.done end
        end
        if not gone then
            gone = true
            for _, c in ipairs(QP.Targets(log)) do if c.qid == qid then gone = false; break end end
        end
    end
    local function pr(v) local a, b = tostring(v or ""):match("^(%d+)/(%d+)$"); return a and { tonumber(a), tonumber(b) } or nil end
    local p = LY.peers[s]
    local card = { kind = "in", name = s, full = full, n = t.n, qid = qid, o = o, title = q and q.title or ("#" .. tostring(t.q)),
        mob = q and q.objs[o] and LH.ObjectiveName(q.objs[o].text) or nil, elite = tonumber(t.e), mine = mine, his = pr(t.p),
        yd = tonumber(t.d), lv = tonumber(t.lv), cl = (type(t.cl) == "string" and t.cl:match("^%u+$")) and t.cl or nil, sz = tonumber(t.sz),
        guild = (p and p.via and p.via.guild and now() - p.via.guild <= LY.EXPIRE) and true or false, gone = gone }
    QP.Mute(s, QP.REASK)   -- 收到过他的邀请卡：我这边 2 小时内不再反过来提示他
    QP.Log("收到邀请 " .. s .. " q=" .. tostring(qid))
    cardShow(card)
    pcall(LY.Beat, true)   -- 角色 p（有邀请待处理）：别的邀请方看到就不弹了
end
-- K：对方对我的邀请的回执
LY.handlers.K = function(t, s)
    local w = QP.waiting
    if not (w and w.name == s and (t.n == nil or t.n == w.n)) then return end
    local r = t.r
    if r == "j" then
        QP.pair = { name = s, qid = w.qid, o = w.o, elite = w.elite }; QP.waiting = nil
    elseif r == "m" then QP.Mute(s, QP.REASK, true); QP.waiting = nil
    elseif r == "x" or r == "g" then QP.Mute(s, QP.REASK); QP.waiting = nil end
    QP.Log("回执 " .. s .. " r=" .. tostring(r))
end
-- 位面「自动接受」一票否决：配对对象（他发过 G / 我算出该他邀请我）的邀请，公会会员 / 官员也一律点了才进
--   排在规则表最前面（kind = "no" → LY.AcceptReason 直接返回 nil）；换层进行中不管（别挡换层帮手）
table.insert(LY.acceptRules, 1, function(s)
    if not QP.On() or QP.HopBusy() then return nil end
    local t = math.max(QP.gotG[s] or -1e9, QP.expect[s] or -1e9)
    if now() - t <= QP.VETO_WIN then return "quest-pair", "no" end
    return nil
end)

-- ---------- 做完：问要不要退队（点了才退）----------
function QP.CheckDone(log)
    local pr = QP.pair
    if not pr then return end
    if not (IsInGroup and IsInGroup()) then QP.pair = nil; return end
    if QP.DB().askLeave == false then return end
    local q = (log or QP.QuestLog())[pr.qid]
    local done = true
    if q then
        if pr.elite then for _, ob in ipairs(q.objs) do if not ob.done then done = false end end
        else
            local ob = q.objs[pr.o]
            done = (ob == nil) or ob.done
            if not done and ob.type ~= "monster" then done = true end
        end
    end
    if not done or QP.card or LY.InCombat() then return end
    QP.pair = nil
    cardShow({ kind = "done", name = pr.name, qid = pr.qid, title = q and q.title or ("#" .. pr.qid), elite = pr.elite })
end

-- ---------- 开关 ----------
function QP.SetOn(v)
    QP.DB().on = v and true or false
    if not v then
        if QP.card then QP.HideCard("off") end
        QP.cur, QP.waiting, QP.pop, QP.popAt = nil, nil, nil, nil
        pcall(LY.Beat, true)   -- 心跳里的 ag 撤掉
    end
    if ns.QM and ns.QM.QPBanner then pcall(ns.QM.QPBanner) end
end
function QP.Pause(sec) QP.pauseUntil = now() + (sec or 1800); if QP.card then QP.HideCard("pause") end end

-- ---------- 事件 ----------
local fmtCache = {}
local function fmtPat(fmt)
    if type(fmt) ~= "string" then return nil end
    local p = fmtCache[fmt]
    if not p then
        p = "^" .. fmt:gsub("([%(%)%.%+%-%*%?%[%]%^%$])", "%%%1"):gsub("%%s", "(.+)") .. "$"
        fmtCache[fmt] = p
    end
    return p
end
QP.FmtPat = fmtPat
function QP.OnSystem(msg)
    local w = QP.waiting
    if not w or type(msg) ~= "string" or secret(msg) then return end
    local who = msg:match(fmtPat(_G.ERR_DECLINE_GROUP_S) or "^$")
    if who and short(who) == w.name then QP.Mute(w.name, QP.REASK); QP.waiting = nil; QP.Log("拒绝 " .. w.name); return end
    who = msg:match(fmtPat(_G.ERR_ALREADY_IN_GROUP_S) or "^$")
    if who and short(who) == w.name then
        local QM = ns.QM
        if QM and QM.Busy then QM.Busy()[w.name] = wall() end   -- 标「忙」30 分钟（信标的「已有队伍」名单）
        QP.waiting = nil; QP.Log("已有队伍 " .. w.name)
    end
end
function QP.OnRoster()
    local w = QP.waiting
    if w and inMyGroup(w.name) then
        QP.pair = { name = w.name, qid = w.qid, o = w.o, elite = w.elite }
        QP.waiting = nil
        QP.Log("进队 " .. w.name)
    end
    if QP.card and QP.card.kind == "in" and IsInGroup and IsInGroup() then
        local c = QP.card
        QP.HideCard("已进队")
        if inMyGroup(c.name) then QP.pair = { name = c.name, qid = c.qid, o = c.o, elite = c.elite }; send(c.full, "K", { n = c.n, r = "j" }) end
    end
end
local ev = CreateFrame("Frame")
QP._ev = ev
for _, e in ipairs({ "PARTY_INVITE_REQUEST", "GROUP_ROSTER_UPDATE", "CHAT_MSG_SYSTEM", "PLAYER_REGEN_DISABLED" }) do
    local valid = not (C_EventUtils and C_EventUtils.IsEventValid) or C_EventUtils.IsEventValid(e)
    if valid then pcall(ev.RegisterEvent, ev, e) end
end
ev:SetScript("OnEvent", function(_, e, a1)
    if e == "PARTY_INVITE_REQUEST" then
        local s = short(a1)
        if s and not secret(s) then QP.inv = { from = s, t = now() } end
    elseif e == "GROUP_ROSTER_UPDATE" then pcall(QP.OnRoster)
    elseif e == "CHAT_MSG_SYSTEM" then pcall(QP.OnSystem, a1)
    elseif e == "PLAYER_REGEN_DISABLED" then
        if QP.card and QP.card.kind == "out" then QP.Dismiss(QP.card, "combat") end   -- 进战斗：邀请卡收起（同一个人 2 小时内照样不再提示）
    end
end)
local acc = 0
ev:SetScript("OnUpdate", function(_, el)
    acc = acc + (el or 0)
    if acc < 1 then return end
    acc = 0
    if QP.On() or QP.card then pcall(QP.Tick) end
end)

-- ---------- 状态 / 斜杠 ----------
local WHY = { off = { "已关", "off" }, pause = { "暂停中", "paused" }, instance = { "副本里不配对", "not in instances" }, combat = { "战斗中", "in combat" },
    dead = { "死亡中", "dead" }, city = { "主城里不配对", "not in capitals" }, raid = { "团队里不配对", "not in raids" }, hop = { "换层中", "layer hop in progress" } }
function QP.StatusText()
    if not QP.On() then return L("任务配对：关", "Quest pairing: off") end
    local why = QP.Paused()
    local c = QP.cur
    local s = L("任务配对：开", "Quest pairing: on")
    if why then return s .. " · " .. L(WHY[why][1], WHY[why][2]) end
    if not c then return s .. L(" · 还没到任何杀怪任务的目标区域（走到打怪的地方、看到目标怪才会配对）", " - not at any kill-quest area yet (pairs once you see the target mobs)") end
    local m = QP.Mutes()
    local nb = 0
    for _, e in pairs(m.p) do if e > wall() then nb = nb + 1 end end
    return s .. string.format(L(" · 你在【%s】目标区域 · 附近同任务插件用户 %d 人 · 2 小时内提示过 %d 人", " - at [%s] - %d addon users on it nearby - %d prompted in 2h"),
        c.title or "?", QP.near or 0, nb)
end
ns.ExtraSlash = ns.ExtraSlash or {}
ns.ExtraSlash.qp = function(rest)
    rest = rest or ""
    if rest == "on" or rest == "off" then
        QP.SetOn(rest == "on")
        ns.Print(rest == "on" and L("任务配对：已开启。在杀怪任务区域遇到同任务的插件用户时弹卡问你（不会自动邀请 / 自动进队）", "Quest pairing on: asks you when an addon user on the same kill quest is nearby (never auto-invites / auto-joins)")
            or L("任务配对：已关闭（/reload 后不再加载）", "Quest pairing off (not loaded after /reload)"))
    elseif rest == "clear" then
        QP.ClearMutes(); QP.since = {}
        ns.Print(L("任务配对：屏蔽名单已清空", "Quest pairing: mute list cleared"))
    elseif rest == "log" then
        local d = QP.DB().log or {}
        ns.Print(string.format(L("任务配对 · 最近记录（%d 条）", "Quest pairing - log (%d)"), #d))
        for i = math.max(1, #d - 14), #d do ns.Print("  " .. d[i]) end
    elseif rest == "probe" then
        QP.Probe()
    else
        ns.Print(QP.StatusText())
        ns.Print(L("用法：/gi qp on | off | probe | log | clear", "Usage: /gi qp on | off | probe | log | clear"))
    end
end
-- probe：只采集 / 显示（目标类型、精英标签、建议人数、任务地图点、频道），P1 不拿任务地图点做判定
function QP.Probe()
    local P = function(s) ns.Print("QP probe: " .. s) end
    local log = QP.QuestLog()
    local n = 0
    for qid, q in pairs(log) do
        n = n + 1
        if n <= 8 then
            local ty = {}
            for j, o in ipairs(q.objs) do ty[#ty + 1] = j .. ":" .. tostring(o.type) .. (o.done and "√" or "") .. " " .. tostring(o.have) .. "/" .. tostring(o.need) end
            local tag = "-"
            if C_QuestLog and C_QuestLog.GetQuestTagInfo then
                local ok, info = pcall(C_QuestLog.GetQuestTagInfo, qid)
                if ok and type(info) == "table" then tag = tostring(info.tagID) .. "/" .. tostring(info.tagName) .. "/elite=" .. tostring(info.isElite) end
            elseif GetQuestTagInfo then
                local ok, a, b = pcall(GetQuestTagInfo, qid)
                if ok then tag = tostring(a) .. "/" .. tostring(b) end
            end
            P(string.format("%d %s · tag %s · 精英 %s · 目标 %s", qid, q.title, tag, tostring(q.elite), table.concat(ty, " | ")))
        end
    end
    local m, x, y = QP.MyPos()
    local pts = "-"
    if m and C_QuestLog and C_QuestLog.GetQuestsOnMap then
        local ok, list = pcall(C_QuestLog.GetQuestsOnMap, m)
        pts = ok and type(list) == "table" and tostring(#list) or "err"
    end
    local pub = LY.PubChannel and LY.PubChannel()
    P(string.format("任务 %d · 地图 %s (%s,%s) · 任务地图点 %s · 公共频道 %s=%s · sid %s · 区域内目标 %d · 当前 %s · %s",
        n, tostring(m), x and string.format("%.3f", x) or "-", y and string.format("%.3f", y) or "-", pts, tostring(pub), tostring(pub and LY.ChanIndex and LY.ChanIndex(pub)),
        QP.sid, QP.nTargets or 0, QP.cur and (QP.cur.qid .. "." .. QP.cur.o .. " " .. tostring(QP.cur.mob)) or "-", tostring(QP.Paused() or "ok")))
    local np = 0
    for name, p in pairs(LY.peers) do
        if p.ag then np = np + 1; if np <= 5 then P(string.format("%s ag %d.%d %d/%d %s n=%d", name, p.ag.qid, p.ag.o, p.ag.have, p.ag.need, p.ag.role, p.ag.n)) end end
    end
    P("带 ag 的同图插件用户 " .. np .. " 人")
end

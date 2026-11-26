-- HOLD：队长分配 · 当前分配表 / 我的任务 / 按分配表提醒 / 队长汇总（设计稿 docs/forever/party-status-design.md 第 4 节）
--   PP.cur = 现在生效的分配表（nil = 没有 → 检查器和以前一模一样）。只在这支队伍里有效：离队就清；存一份在 ns.db.party.last（/reload 后 2 小时内接得上）
--   ① 给检查器：PP.Own() → 负责表 { [服务键] = { [队员名] = 负责人 } }, 只提醒负责人（设置 party.onlymine）
--   ② 我的任务：收到 / 变更时本地一行「XX 分配给你：耐力 → 2、3 队；神圣之灵 → 全队」；小面板底下一行「我的任务 2/3：…」
--   ③ 队长：负责人离队 / 掉线 60 秒 → 本地一行提示（⛔ 不自动改派：面板上点「按建议改派」才改、才下发）；
--      就位确认 / 进副本 / 点「检查」→ 一行汇总；「有人缺超过 2 分钟提醒我」默认关
--   ④ 圣骑士：PP.BlessFor(职业) 给 PallyBless.lua 的 PB.ClassPref 问（队长分的祝福压过自己设的；⛔ 不写 ns.db.pally；设置 party.accept 可关）
-- ⛔ 全部只在本地显示（B.Tell / ns.Print），没有任何聊天发言；不建框体、不建 OnUpdate
local _, ns = ...; ns = _G.GearInsightForever or ns
local PP = ns and ns.PartyPlan
local B = ns and ns.BuffCheck
if not (PP and B and PP.Sync) or PP.Set then return end

local S = PP.Sync
local BYK, short, ask = PP.BYK, PP.Short, PP.Ask
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function gt() return (GetTime and GetTime()) or 0 end
local function wall() return (time and time()) or 0 end
local ownCache, rosterDirty = nil, true
PP.gone = {}            -- [负责人] = "left" | "off"
local offSince, goneSaid, missSince, leadAt, leadDue = {}, {}, {}, -999, false

-- ---------- 我的条目 / 文字 ----------
function PP.MyEntries(plan)
    local out, me = {}, PP.Me()
    for _, e in ipairs(plan and plan.a or {}) do if e.who == me then out[#out + 1] = e end end
    return out
end
local function mineText(plan)
    local p = {}
    for _, e in ipairs(PP.MyEntries(plan)) do p[#p + 1] = PP.SvcName(e.s) .. " → " .. PP.ToText(e.to) end
    return table.concat(p, L("；", "; "))
end
function PP.MineText(plan)
    plan = plan or PP.cur
    local t = plan and mineText(plan) or ""
    if t == "" then return nil end
    return string.format(L("%s 分配给你：", "%s assigned you: "), plan.by or "?") .. t
end
-- 小面板底下那行：我的任务 2/3：耐力→2、3 队 √  神圣之灵 ×
function PP.MineLine(rows)
    local plan = PP.cur
    if not plan or not PP.Opt("mine") then return nil end
    local mine = PP.MyEntries(plan)
    if #mine == 0 then return nil end
    local me, done, p = PP.Me(), 0, {}
    for _, e in ipairs(mine) do
        local s, ok = BYK[e.s], true
        for _, row in ipairs(rows or {}) do
            if s and row.t == s.t then
                local w = row.who and row.who[me]
                if w and #w.miss > 0 then ok = false end
            end
        end
        if ok then done = done + 1 end
        p[#p + 1] = PP.SvcName(e.s) .. "→" .. PP.ToText(e.to) .. (ok and " |cff33ff66√|r" or " |cffff4d40×|r")
    end
    return string.format(L("|cff66ccff我的任务 %d/%d|r：", "|cff66ccffMy tasks %d/%d|r: "), done, #mine) .. table.concat(p, "  ")
end

-- ---------- 当前表 ----------
function PP.Set(plan, why)
    local before = PP.cur and mineText(PP.cur) or ""
    PP.cur, ownCache = plan, nil
    PP.gone, goneSaid, missSince = {}, {}, {}
    if type(ns.db) == "table" then PP.DB().last = { at = wall(), plan = PP.Copy(plan) } end
    local now = mineText(plan)
    if why ~= "restore" and now ~= before and plan.by ~= PP.Me() and PP.Opt("mine") then
        if now == "" then B.Tell(string.format(L("%s 改了分配：你现在没有任务", "%s changed assignments: nothing for you now"), plan.by or "?"))
        else B.Tell(PP.MineText(plan)) end
    end
    local PB = ns.PallyBless
    if PB and PB.Refresh then pcall(PB.Refresh); if PB.Broadcast then pcall(PB.Broadcast, true) end end
    if why ~= "restore" then pcall(B.Update, "plan") end
    local UI = ns.PartyUI
    if UI and UI.OnPlan then pcall(UI.OnPlan, why) end
    return plan
end
function PP.Clear()
    if not PP.cur and not PP.DB().last then return end
    PP.cur, ownCache = nil, nil
    PP.gone, goneSaid, missSince, offSince = {}, {}, {}, {}
    PP.DB().last = nil
    local PB = ns.PallyBless
    if PB and PB.Refresh then pcall(PB.Refresh) end
    local UI = ns.PartyUI
    if UI and UI.OnPlan then pcall(UI.OnPlan, "clear") end
end

-- ---------- 给检查器的负责表 ----------
function PP.Own(members)
    local plan = PP.cur
    if not plan then return nil end
    if not ownCache or rosterDirty then
        ownCache, rosterDirty = PP.Expand(plan, PP.Roster(members)), false
    end
    return ownCache, PP.Opt("onlymine")
end

-- ---------- 圣骑士：队长分给我的祝福（"M" / "W" / "K"；"0" = 这个职业不归我；nil = 没分配 / 我关了 → 按自己的设置）----------
function PP.BlessFor(c)
    local plan = PP.cur
    if not plan or not PP.Opt("accept") then return nil end
    local me, any, mine, fuzzy = PP.Me(), false, nil, false
    for _, e in ipairs(plan.a) do
        local s = BYK[e.s]
        if s and s.pb then
            any = true
            if e.who == me then
                if e.to == "*" then mine = mine or s.pb
                elseif e.to:sub(1, 2) == "c:" then
                    for x in e.to:sub(3):gmatch("[^,]+") do if x == c then mine = mine or s.pb end end
                else fuzzy = true end                      -- 按小队 / 点名分的：职业首选表达不了，这个职业按自己的设置
            end
        end
    end
    if not any then return nil end
    if mine then return mine end
    if fuzzy then return nil end
    return "0"
end

-- ---------- 队长：汇总 / 负责人走了 ----------
function PP.LeadText(rows)
    local parts, planned = {}, false
    for _, row in ipairs(rows or {}) do
        if row.planned then
            planned = true
            local p, n = {}, 0
            for who, r in pairs(row.who or {}) do
                if #r.miss > 0 then p[#p + 1] = who .. " " .. #r.miss; n = n + #r.miss end
            end
            table.sort(p)
            if n > 0 then parts[#parts + 1] = string.format(L("%s 缺 %d（%s）", "%s missing %d (%s)"), B.Name(row.t), n, table.concat(p, L("、", ", "))) end
        end
    end
    if not planned then return nil end
    if #parts == 0 then return L("分配检查：都加上了", "Assignments: all covered") end
    return L("分配检查：", "Assignments: ") .. table.concat(parts, L("；", "; "))
end
-- 这个负责人走了以后建议怎么改（⛔ 只算不生效，面板上点了才用）：他的条目全去掉；他管过的服务，没手改过的条目按剩下的人重新出建议
--   （这种服务里别人有手改条目 → 手改的留着、不再出建议，缺的那段队长自己补）
function PP.Reassign(name, plan, roster)
    plan = PP.Copy(plan or PP.cur)
    roster = roster or PP.Roster(B.members)
    local redo, manual, keep = {}, {}, {}
    for _, e in ipairs(plan.a) do if e.who == name then redo[e.s] = true end end
    for _, e in ipairs(plan.a) do
        if e.who ~= name then
            if not redo[e.s] then keep[#keep + 1] = e
            elseif e.m then keep[#keep + 1] = e; manual[e.s] = true end
        end
    end
    local left = { raid = roster.raid }
    for _, m in ipairs(roster) do if m.name ~= name then left[#left + 1] = m end end
    for _, e in ipairs(PP.Suggest(left)) do
        if redo[e.s] and not manual[e.s] then keep[#keep + 1] = e end
    end
    plan.a = keep
    return plan
end
function PP.Tick(rows, me, why, members)
    local plan = PP.cur
    if not plan then return end
    local roster = PP.Roster(members)
    local now = gt()
    local gone, fresh = {}, {}
    for _, e in ipairs(plan.a) do
        local m = PP.Find(roster, e.who)
        if not m then gone[e.who] = "left"
        elseif not m.online then
            offSince[e.who] = offSince[e.who] or now
            if now - offSince[e.who] >= 60 then gone[e.who] = "off" end
        else offSince[e.who] = nil end
    end
    for n in pairs(gone) do if not goneSaid[n] then goneSaid[n] = true; fresh[#fresh + 1] = n end end
    for n in pairs(goneSaid) do if not gone[n] then goneSaid[n] = nil end end
    PP.gone = gone
    local lead = PP.MayEdit(roster) and (roster.raid or plan.by == PP.Me())
    if lead and #fresh > 0 then
        table.sort(fresh)
        for _, n in ipairs(fresh) do
            local sv, seen = {}, {}
            for _, e in ipairs(plan.a) do if e.who == n and not seen[e.s] then seen[e.s] = true; sv[#sv + 1] = PP.SvcName(e.s) end end
            B.Tell(string.format(L("%s %s：%s 没人负责（/gi ps 里点「按建议改派」）", "%s %s: %s uncovered (/gi ps > Reassign)"), n, gone[n] == "left" and L("走了", "left") or L("掉线了", "is offline"), table.concat(sv, L("、", ", "))))
        end
        local UI = ns.PartyUI
        if UI and UI.OnPlan then pcall(UI.OnPlan, "gone") end
    end
    if not lead then return end
    if why == "ready" or leadDue then
        leadDue = false
        B.Tell(PP.LeadText(rows))
    elseif PP.Opt("lead") then
        local late = false
        for _, row in ipairs(rows) do
            if row.planned and #row.miss > 0 then
                missSince[row.t.k] = missSince[row.t.k] or now
                if now - missSince[row.t.k] >= 120 then late = true end
            else missSince[row.t.k] = nil end
        end
        if late and now - leadAt >= B.REPEAT then leadAt = now; B.Tell(PP.LeadText(rows)) end
    end
end
function PP.OnEvent(e)
    if e == "GROUP_ROSTER_UPDATE" then rosterDirty = true; S.Group()
    elseif e == "PLAYER_ENTERING_WORLD" then
        rosterDirty = true
        S.Group()
        local ok, inInst = pcall(IsInInstance or function() end)
        if ok and inInst and not (ns.Secret and ns.Secret(inInst)) then leadDue = true end
    end
end

-- ---------- 命令：/gi ps probe（探针）· /gi ps 检查（队长汇总）；别的交给面板 ----------
function PP.Probe()
    local tot, got = 0, 0
    for _, m in ipairs(B.members or B.Members()) do
        if not m.me then
            for _, a in ipairs(m.auras or {}) do
                tot = tot + 1
                if a.exp and a.exp > 0 then got = got + 1 end
            end
        end
    end
    ns.Print(string.format(L("探针 · 别人身上认得的 BUFF：%d 个，其中读得到到期时间 %d 个", "Probe · known buffs on others: %d, with readable expiry: %d"), tot, got))
    local st = S.stat
    ns.Print(string.format(L("探针 · 插件消息：队伍频道发出 %d · 密语发出 %d · 失败 %d · 收到别人 %d · 不认的 %d · 最近返回 %s · 收到自己的回声 %s · 队伍频道 %s",
        "Probe · addon msgs: group sent %d · whispers %d · failed %d · received %d · dropped %d · last result %s · own echo %s · group channel %s"),
        st.sent, st.whisper, st.fail, st.recv, st.drop, tostring(st.code or "-"), S.echo and L("有", "yes") or L("还没有", "not yet"),
        S.groupOk == false and L("不通（改逐个密）", "down (whispering)") or S.groupOk and L("通", "ok") or L("还没验出来", "unknown")))
    local n = 0
    for _ in pairs(PP.caps) do n = n + 1 end
    ns.Print(string.format(L("探针 · 报到过的队友 %d 个；现在的分配表：%s", "Probe · mates who said hello: %d; current plan: %s"), n,
        PP.cur and string.format("#%d %s（%d）", PP.cur.rev, PP.cur.by or "?", #PP.cur.a) or L("没有", "none")))
    S.Hello(true)
    ns.Print(L("探针 · 刚发了一条报到，几秒后再打一次 /gi ps probe 看「回声」和「最近返回」", "Probe · sent a hello; run /gi ps probe again in a few seconds"))
    return true
end
function PP.Slash(rest)
    if rest == "probe" or rest == "探针" then return PP.Probe() end
    if rest == "检查" or rest == "check" then
        pcall(B.Update, "check")
        ns.Print(PP.LeadText(B.rows) or L("还没有分配表（/gi ps 打开面板出一份）", "No assignments yet (/gi ps)"))
        return true
    end
    return false
end

-- ---------- 设置：加载后补进「要 BUFF」组（总开关在 _Group 的 BuffCheckHook.lua）----------
do
    local g, all = ns.SettingsGroup and ns.SettingsGroup("buffask"), ns._SettingsItems
    if g and all then
        for _, x in ipairs({
            { "suggest", "队长分配：我是队长时自动出分配建议", "Assignments: suggest a plan when I lead" },
            { "asst", "队长分配：团队助理也能改分配", "Assignments: assistants may edit" },
            { "mine", "队长分配：收到分配时提示我的任务", "Assignments: tell me my tasks when assigned" },
            { "onlymine", "队长分配：有分配表时只提醒我负责的人", "Assignments: with a plan, only remind me about my targets" },
            { "lead", "队长分配：有人缺超过 2 分钟提醒我（队长）", "Assignments: leader alert when something stays missing" },
            { "accept", "队长分配：队长分的祝福覆盖我自己的设置（只在这支队伍里）", "Assignments: leader's blessing plan overrides my own picks (this group only)" } }) do
            local id, k = "party." .. x[1], x[1]
            if not all[id] then
                local it = { type = "check", id = id, indent = 18, keys = "分配 队长 团长 做水 灵魂石 祝福 任务 就位 assign leader water task", group = g, text = L(x[2], x[3]),
                    get = function() return PP.Opt(k) end,
                    set = function(v)
                        PP.SetOpt(k, v)
                        ownCache = nil
                        local PB = ns.PallyBless
                        if k == "accept" and PB and PB.Refresh then pcall(PB.Refresh) end
                        pcall(B.Update, "set")
                    end }
                g.items[#g.items + 1] = it
                all[id] = it
            end
        end
    end
end

-- ---------- 加载时：接上 /reload 前的表（2 小时内、发表的人还在队里），报到，8 秒没表就要一份 ----------
do
    local last = type(ns.db) == "table" and type(ns.db.party) == "table" and ns.db.party.last
    if type(last) == "table" and type(last.plan) == "table" and type(last.plan.a) == "table" and ask(IsInGroup) and wall() - (tonumber(last.at) or 0) < 7200 then
        local ok = type(last.plan.rev) == "number"
        for _, e in ipairs(last.plan.a) do
            if not (type(e) == "table" and type(e.s) == "string" and type(e.who) == "string" and type(e.to) == "string") then ok = false end
        end
        local r = ok and PP.Roster(B.members)
        if ok and (last.plan.by == PP.Me() or PP.Find(r, last.plan.by)) then
            PP.seenRev = last.plan.rev
            PP.Set(PP.Copy(last.plan), "restore")
        end
    end
    S.Group()
end

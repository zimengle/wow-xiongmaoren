-- HOLD：队长分配 · 同步（设计稿 docs/forever/party-status-design.md 第 3 节）。插件消息前缀 GIFPS1（_BuffCheck 的桩注册、转进 PP.OnMsg）
--   H|v=1|dv=版本|c=职业|l=等级|cap=会的天赋 BUFF|rev=我手里的表号      进队 / 加载时报到
--   P|v=1|rev=12|i=2/5|tpl=MC|h=校验|d=…                               分配表，按条目边界切块，最后一块带校验
--   R|rev=我手里的表号                                                  要一份表（进队 8 秒还没表 / 收了一半 10 秒没收齐）
--   谁的表算数：团队里只认团长（助理要「助理也能改」开着）；5 人队谁都能发。表号大的赢；同号团长 > 助理 > 名字靠前
--   v 比我大 → 整条不认，只说一次；不认识的服务键 → 只有那一条显示「？（需要更新）」
--   发送：队伍频道，每秒 1 条（照 BisShare.lua 的 pump：限流 → 6 秒后重试，锁定 → 20 秒）；队伍频道不通 → 逐个密
--   同一张表 5 秒内不重发；R 同一个人 15 秒只理一次
-- ⛔ 这里只有插件消息（SendAddonMessage），没有任何聊天发言
local _, ns = ...; ns = _G.GearInsightForever or ns
local PP = ns and ns.PartyPlan
local B = ns and ns.BuffCheck
if not (PP and B) or PP.Sync then return end

local S = { GAP = 1, q = {}, inbox = {}, lastR = {}, sawP = {}, stat = { sent = 0, recv = 0, fail = 0, whisper = 0, drop = 0 } }
PP.Sync = S
local PREFIX = "GIFPS1"
local short, ask = PP.Short, PP.Ask
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function gt() return (GetTime and GetTime()) or 0 end
local function after(s, fn) if C_Timer and C_Timer.After then C_Timer.After(s, fn) end end
local function inGroup() return ask(IsInGroup) and true or false end
local function chan() return ask(IsInRaid) and "RAID" or "PARTY" end
local function roster() return PP.Roster(B.members) end

-- ---------- 发送队列 ----------
local lastSend, retryAt, waiting = -99, 0, false
local function rawSend(m)
    local fn = (C_ChatInfo and C_ChatInfo.SendAddonMessage) or SendAddonMessage
    if not fn then return false, "NoApi" end
    local ok, result = pcall(fn, PREFIX, m.t, m.c, m.to)
    local success = Enum and Enum.SendAddonMessageResult and Enum.SendAddonMessageResult.Success or 0
    local good = ok and (result == nil or result == true or result == success)
    local QM = ns.QM
    local name = (not ok) and "Error" or good and "Success" or ((QM and QM.CodeName and QM.CodeName(tonumber(result))) or tostring(result))
    return good, name
end
local function enqueue(t, c, to)
    for _, m in ipairs(S.q) do if m.t == t and m.c == c and m.to == to then return end end
    S.q[#S.q + 1] = { t = t, c = c, to = to }
end
local function whisperAll(t)
    local me = PP.Me()
    for _, m in ipairs(roster()) do
        if m.name ~= me and m.online then enqueue(t, "WHISPER", m.full or m.name) end
    end
end
local function toGroup(t)
    if S.groupOk == false then whisperAll(t) else enqueue(t, chan()) end
end
function S.Pump()
    waiting = false
    if #S.q == 0 then return end
    local now = gt()
    if now >= retryAt and now - lastSend >= S.GAP then
        local m = S.q[1]
        if (m.c == "PARTY" or m.c == "RAID") and not inGroup() then table.remove(S.q, 1)
        else
            local good, name = rawSend(m)
            lastSend = now
            S.stat.code = name
            if good then
                table.remove(S.q, 1)
                if m.c == "WHISPER" then S.stat.whisper = S.stat.whisper + 1 else S.stat.sent = S.stat.sent + 1 end
            else
                local QM = ns.QM
                local kind = (QM and QM.FailKind and QM.FailKind(name)) or "other"
                if kind == "throttle" then retryAt = now + 6
                elseif kind == "lock" then retryAt = now + 20
                else
                    table.remove(S.q, 1)
                    S.stat.fail = S.stat.fail + 1
                    if m.c ~= "WHISPER" then
                        if not S.echo then S.groupOk = false end   -- 队伍频道发不出去、也从没收到过自己的回声：以后逐个密
                        whisperAll(m.t)
                    end
                end
            end
        end
    end
    if #S.q > 0 and not waiting then waiting = true; after(S.GAP, S.Pump) end
end
local function send(t)
    toGroup(t)
    S.Pump()
end

-- ---------- 报到 / 要表 / 下发 ----------
function S.Hello(force)
    if not inGroup() then return false end
    local now = gt()
    if not force and S.helloAt and now - S.helloAt < 30 then return false end
    S.helloAt = now
    local cap = {}
    for _, s in ipairs(PP.SVC) do if s.talent and B.Knows(s.t) then cap[#cap + 1] = s.k end end
    local ok, _, cls = pcall(UnitClass or function() end, "player")
    local ver = (C_AddOns and C_AddOns.GetAddOnMetadata and ask(C_AddOns.GetAddOnMetadata, "GearInsight_Forever", "Version")) or (GetAddOnMetadata and ask(GetAddOnMetadata, "GearInsight_Forever", "Version")) or ""
    send(string.format("H|v=%d|dv=%s|c=%s|l=%d|cap=%s|rev=%d", PP.V, tostring(ver), ok and type(cls) == "string" and cls or "", tonumber(ask(UnitLevel, "player")) or 0, table.concat(cap, ","), PP.cur and PP.cur.rev or 0))
    return true
end
function S.Request()
    if not inGroup() then return false end
    local now = gt()
    if S.reqAt and now - S.reqAt < 15 then return false end
    S.reqAt = now
    send("R|rev=" .. (PP.cur and PP.cur.rev or 0))
    return true
end
function S.Push(plan)
    if not plan or not inGroup() then return false end
    local now = gt()
    if S.pushRev == plan.rev and S.pushAt and now - S.pushAt < 5 then return false end
    S.pushRev, S.pushAt = plan.rev, now
    local msgs = PP.Wire(plan)
    for _, m in ipairs(msgs) do toGroup(m) end
    S.Pump()
    return #msgs
end
-- 队长点「下发」：表号 +1、记成我发的、当场生效、发出去
function PP.Publish(draft)
    local r = roster()
    if not PP.MayEdit(r) then ns.Print(L("团队里只有团长 / 助理能下发分配", "Only the raid leader / assistants can send assignments")); return false end
    local plan = PP.Copy(draft)
    plan.rev = math.max(PP.cur and PP.cur.rev or 0, PP.seenRev or 0, draft.rev or 0) + 1
    plan.by = PP.Me()
    PP.seenRev = plan.rev
    PP.Set(plan, "mine")
    S.pushAt = nil
    return S.Push(plan)
end

-- ---------- 收 ----------
local function rank(r, name) local m = PP.Find(r, name); return m and m.rank or 0 end
-- 新表要不要顶掉手里的：表号大的赢；同号团长 > 助理 > 名字靠前
function PP.Offer(plan, r)
    local cur = PP.cur
    local take = not cur or plan.rev > cur.rev
    if not take and plan.rev == cur.rev and plan.by ~= cur.by then
        local a, b = rank(r, plan.by), rank(r, cur.by)
        take = a > b or (a == b and plan.by < cur.by)
    end
    if take then PP.Set(plan, "recv") end
    return take
end
local function onP(sender, f, r)
    if not PP.MayEdit(r, sender) then S.stat.drop = S.stat.drop + 1; return end
    local rev = tonumber(f.rev)
    local i, n = tostring(f.i or ""):match("^(%d+)/(%d+)$")
    i, n = tonumber(i), tonumber(n)
    if not (rev and i and n and i >= 1 and i <= n and n <= 60) then return end
    if rev > (PP.seenRev or 0) then PP.seenRev = rev end
    S.sawP[rev] = gt()
    local box = S.inbox[sender]
    if not box or box.rev ~= rev or box.n ~= n then
        box = { rev = rev, n = n, parts = {}, got = 0 }
        S.inbox[sender] = box
        after(10, function()                                   -- 10 秒还没收齐：要一份
            if S.inbox[sender] == box then S.inbox[sender] = nil; S.Request() end
        end)
    end
    if box.parts[i] == nil then box.got = box.got + 1 end
    box.parts[i] = f.d or ""
    if f.h then box.h = tonumber(f.h) end
    if f.tpl then box.tpl = f.tpl end
    if box.got < n then return end
    S.inbox[sender] = nil
    local d = table.concat(box.parts, ";")
    if box.h ~= PP.Sum(d) then S.Request(); return end
    PP.Offer({ v = PP.V, rev = rev, by = sender, tpl = box.tpl, a = PP.Entries(d) }, r)
end
local function onH(sender, f)
    local cap = {}
    for k in tostring(f.cap or ""):gmatch("[^,]+") do cap[k] = true end
    local theirs = tonumber(f.rev) or 0
    PP.caps[sender] = { cls = f.c, lv = tonumber(f.l), dv = f.dv, cap = cap, rev = theirs }
    local cur = PP.cur
    local mine = cur and cur.rev or 0
    if theirs > mine then S.Request()
    elseif cur and theirs < mine and cur.by == PP.Me() then S.Push(cur) end
end
local function onR(sender, f, r)
    local now = gt()
    if S.lastR[sender] and now - S.lastR[sender] < 15 then return end
    S.lastR[sender] = now
    local cur = PP.cur
    if not cur or cur.rev <= (tonumber(f.rev) or 0) then return end
    local me = PP.Me()
    if cur.by == me or rank(r, me) >= 2 then S.Push(cur); return end
    if not PP.MayEdit(r, me) then return end                  -- 团队里我不是团长 / 助理：我转发的别人也不认
    after(2 + (#me % 3), function()                            -- 发表的人没回：我手里有就代发（别人先发了就不发）
        if PP.cur == cur and (S.sawP[cur.rev] or 0) < now then S.Push(cur) end
    end)
end
function PP.OnMsg(text, _, sender)
    sender = short(sender)
    if type(sender) ~= "string" then return end
    if sender == PP.Me() then S.echo = true; return end
    local kind, f = PP.Parse(text)
    if not kind then return end
    S.stat.recv = S.stat.recv + 1
    if S.groupOk == nil then S.groupOk = true end
    if (tonumber(f.v) or 1) > PP.V then
        if not S.saidNew then S.saidNew = true; ns.Print(L("队友的分配表是新版格式，更新插件后才能看", "A group mate's assignments use a newer format; update to see them")) end
        return
    end
    local r = roster()
    if not PP.Find(r, sender) then return end                 -- 不在我队里的不理
    if kind == "P" then onP(sender, f, r)
    elseif kind == "H" then onH(sender, f)
    elseif kind == "R" then onR(sender, f, r) end
end

-- ---------- 进队 / 离队 ----------
local was = false
function S.Group()
    local now = inGroup()
    if now and not was then
        S.Hello(true)
        after(8, function() if not PP.cur and inGroup() then S.Request() end end)   -- 进队 8 秒还没表：要一份
    elseif not now and was then
        for i = #S.q, 1, -1 do S.q[i] = nil end
        S.inbox, S.lastR, S.sawP, S.groupOk, S.echo, S.reqAt, S.helloAt = {}, {}, {}, nil, nil, nil, nil
        PP.caps, PP.seenRev = {}, nil
        if PP.Clear then PP.Clear() end
    elseif now then
        S.Hello()
    end
    was = now
end

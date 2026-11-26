-- HOLD：队长分配 · 发到队伍（设计稿 docs/forever/party-status-design.md 第 5 节；11-25 用户「都按建议」第 5 条）
--   给没装插件的队友看的文字版：「【分配】王者：圣骑A→战士、盗贼｜力量：圣骑B→战士｜…」，一行 ≤ 240 字节、只在条目边界换行
--   ⛔ 第一下只出预览（面板底下），第二下「确认发送」才说话；一次点击最多 4 行、间隔 1.5 秒，多的要再点「继续发」
--   ⛔ 文字里不带插件名；战斗中 / 聊天被锁时不发；同样内容 30 秒内不重发；只发已经下发的那张表（和队友插件里的一致）
--   对外语言 ns.ChatL（跟「对外发言语言」设置走）；发送走 ns.BuffAsk.Send（_Group，进队就在）
local _, ns = ...; ns = _G.GearInsightForever or ns
local PP, UI = ns and ns.PartyPlan, ns and ns.PartyUI
if not (PP and UI) or UI.PostLines then return end
UI.POST_MAX, UI.POST_PER, UI.POST_GAP, UI.POST_AGAIN = 240, 4, 1.5, 30
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function C(zh, en) return ns.ChatL and ns.ChatL(zh, en) or zh end
local function gt() return (GetTime and GetTime()) or 0 end

function UI.PostLines(plan, max)
    max = max or UI.POST_MAX
    local tag, sep, comma = C("【分配】", "[Assign] "), C("｜", " | "), C("，", ", ")
    local order, by = {}, {}
    for _, e in ipairs(plan and plan.a or {}) do
        if PP.BYK[e.s] then
            if not by[e.s] then by[e.s] = {}; order[#order + 1] = e.s end
            by[e.s][#by[e.s] + 1] = e.who .. C("→", " > ") .. PP.ToText(e.to, true)
        end
    end
    local items = {}
    for _, k in ipairs(order) do
        local head = PP.SvcName(k, true) .. C("：", ": ")
        local cur
        for _, x in ipairs(by[k]) do                     -- 一种 BUFF 太长（团队里按小队分了很多段）：按负责人切成几项
            if cur and #tag + #cur + #comma + #x > max then items[#items + 1] = cur; cur = nil end
            cur = cur and (cur .. comma .. x) or (head .. x)
        end
        if cur then items[#items + 1] = cur end
    end
    local lines, cur = {}, nil
    for _, it in ipairs(items) do
        if cur and #cur + #sep + #it > max then lines[#lines + 1] = cur; cur = nil end
        cur = cur and (cur .. sep .. it) or (tag .. it)
    end
    if cur then lines[#lines + 1] = cur end
    return lines
end
function UI.PostLabel()
    local p = UI.post
    if not p then return L("发到队伍", "Post to group") end
    if p.at == 1 then return string.format(L("确认发送（%d 行）", "Confirm (%d lines)"), math.min(#p.lines, UI.POST_PER)) end
    return string.format(L("继续发（还有 %d 行）", "Continue (%d left)"), #p.lines - p.at + 1)
end
function UI.PostText()
    local p = UI.post
    if not p then return nil end
    local out = { "|cffffd91a" .. L("预览（再点一下才会发到队伍频道）：", "Preview (click again to post to group chat):") .. "|r" }
    for i = p.at, #p.lines do out[#out + 1] = p.lines[i] end
    return table.concat(out, "\n")
end
-- ⛔ 只由「发到队伍」按钮的点击调用
function UI.PostClick()
    if not UI.CanEdit() then return false end
    local BA = ns.BuffAsk
    if not (BA and BA.Send and BA.CanChat) then return false end
    if not UI.post then
        if UI.state ~= "pub" or not PP.cur then ns.Print(L("先点「下发」，再发到队伍（发的是已经下发的那张表）", "Send the plan first; posting uses the sent plan")); return false end
        local lines = UI.PostLines(PP.cur)
        if #lines == 0 then return false end
        local sig = table.concat(lines, "\n")
        if UI.postSig == sig and gt() - (UI.postAt or -99) < UI.POST_AGAIN then ns.Print(L("这份刚发过，等一会儿再发", "Just posted this; wait a moment")); return false end
        UI.post = { lines = lines, at = 1, sig = sig }
        UI.Refresh()
        return "preview"
    end
    if not BA.CanChat() then ns.Print(L("战斗中 / 聊天被锁，现在发不了", "Can't post in combat / chat lockdown")); return false end
    local p = UI.post
    if p.busy and gt() < p.busy then return false end           -- 上一批还在发
    local chan = PP.Ask(IsInRaid) and "RAID" or "PARTY"
    local n = math.min(UI.POST_PER, #p.lines - p.at + 1)
    for j = 1, n do
        local text = p.lines[p.at + j - 1]
        if j == 1 then BA.Send(text, chan)
        elseif C_Timer and C_Timer.After then C_Timer.After((j - 1) * UI.POST_GAP, function() BA.Send(text, chan) end) end
    end
    p.at = p.at + n
    p.busy = gt() + (n - 1) * UI.POST_GAP
    if p.at > #p.lines then UI.postSig, UI.postAt, UI.post = p.sig, gt(), nil end
    UI.Refresh()
    return n
end

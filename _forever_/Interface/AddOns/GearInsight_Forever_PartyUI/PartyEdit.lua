-- HOLD：队长分配 · 改一条（设计稿 docs/forever/party-status-design.md 第 5 节）：点负责人 / 给谁 → 小下拉菜单（内核 ns.PopMenu）
--   负责人：会这个 BUFF 的人（PP.Providers）；一个都认不出来时列同职业的人
--   给谁：全队 · 按职业（点一下加进去 / 再点去掉）· 团队里按小队（同上）。职业和小队不混写：换一种就从头选
--   加一条：先选服务，默认「第一个会的人 → 全队」
--   手改过的条目记 m = 1：再点「出建议」原样留着
-- ⛔ 只改草稿（UI.draft），不下发、不说话
local _, ns = ...; ns = _G.GearInsightForever or ns
local PP, UI, B = ns and ns.PartyPlan, ns and ns.PartyUI, ns and ns.BuffCheck
if not (PP and UI and B) or UI.PickWho then return end
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end

local function entry(i) return UI.CanEdit() and UI.draft and UI.draft.a[i] or nil end
local function changed(e) e.m = 1; UI.Dirty() end
function UI.WhoItems(e)
    local s, roster, items = PP.BYK[e.s], UI.Roster(), {}
    if not s then return items end
    local list = PP.Providers(s, roster)
    if #list == 0 then
        for _, m in ipairs(roster) do if m.cls == s.cls then list[#list + 1] = m end end
    end
    for _, m in ipairs(list) do
        items[#items + 1] = { text = (m.name == e.who and "|cff73ff73√|r " or "   ") .. m.name, fn = function() e.who = m.name; changed(e) end }
    end
    return items
end
-- 目标里加 / 去掉一项（kind = "c" / "g"）；去光了 = 全队
function UI.ToggleTo(to, kind, v)
    local k, list = tostring(to):match("^(%a):(.*)$")
    local out, had = {}, false
    if k == kind then
        for x in list:gmatch("[^,]+") do
            if x == v then had = true else out[#out + 1] = x end
        end
    end
    if not had then out[#out + 1] = v end
    if #out == 0 then return "*" end
    if kind == "g" then table.sort(out, function(a, b) return (tonumber(a) or 0) < (tonumber(b) or 0) end) end
    return kind .. ":" .. table.concat(out, ",")
end
function UI.ToItems(e)
    local roster, items = UI.Roster(), {}
    local s = PP.BYK[e.s]
    local function on(kind, v)
        if e.to == "*" then return false end
        if kind == "c" then return PP.Match(e.to, { cls = v, name = "" }) end
        return PP.Match(e.to, { g = v, name = "" })
    end
    items[#items + 1] = { text = (e.to == "*" and "|cff73ff73√|r " or "   ") .. L("全队", "Everyone"), fn = function() e.to = "*"; changed(e) end }
    local present, groups = {}, {}
    for _, m in ipairs(roster) do
        if m.cls then present[m.cls] = true end
        groups[m.g or 1] = true
    end
    for _, c in ipairs(PP.CLASSES) do
        if present[c] and (not s or B.Useful(s, c)) then
            items[#items + 1] = { text = (on("c", c) and "|cff73ff73√|r " or "   ") .. PP.ClsName(c), fn = function() e.to = UI.ToggleTo(e.to, "c", c); changed(e) end }
        end
    end
    if roster.raid then
        for g = 1, 8 do
            if groups[g] then
                items[#items + 1] = { text = (on("g", g) and "|cff73ff73√|r " or "   ") .. string.format(L("%d 队", "Group %d"), g), fn = function() e.to = UI.ToggleTo(e.to, "g", tostring(g)); changed(e) end }
            end
        end
    end
    return items
end
function UI.PickWho(anchor, i)
    local e = entry(i)
    if not (e and ns.PopMenu) then return end
    local items = UI.WhoItems(e)
    if #items == 0 then ns.Print(L("队里没有能给这个 BUFF 的人", "Nobody in the group can cast this")); return end
    ns.PopMenu(anchor, PP.SvcName(e.s) .. L("：谁负责", ": who"), items)
end
function UI.PickTo(anchor, i)
    local e = entry(i)
    if not (e and ns.PopMenu) then return end
    ns.PopMenu(anchor, PP.SvcName(e.s) .. L("：给谁（点一下加 / 再点去掉）", ": for whom (click to toggle)"), UI.ToItems(e))
end
function UI.AddItems()
    local roster, items = UI.Roster(), {}
    for _, s in ipairs(PP.SVC) do
        local p = PP.Providers(s, roster)
        if #p > 0 then
            items[#items + 1] = { text = PP.SvcName(s.k) .. " |cff9a9a9a" .. p[1].name .. "|r", fn = function()
                UI.draft.a[#UI.draft.a + 1] = { s = s.k, who = p[1].name, to = "*", m = 1 }
                UI.Dirty()
            end }
        end
    end
    return items
end
function UI.AddEntry(anchor)
    if not (UI.CanEdit() and ns.PopMenu) then return end
    local items = UI.AddItems()
    if #items == 0 then ns.Print(L("队里没有能给 BUFF 的职业", "Nobody in the group can cast group buffs")); return end
    ns.PopMenu(anchor, L("加一条：哪种 BUFF", "Add: which buff"), items)
end

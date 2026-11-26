-- HOLD：队长分配 · 大面板（设计稿 docs/forever/party-status-design.md 第 5 节，第 1 期）。按需子插件 GearInsight_Forever_PartyUI：点小面板「分配」/ /gi ps 才加载
--   队长（团队：团长 / 助理；5 人队：谁都行）：一行一条分配「服务 | 负责人 ▼ | 给谁 ▼ | 现在怎么样 | ×」，
--     [出建议]（手改过的留着）[加一条] [下发]（⛔ 点了才发给队友的插件）[发到队伍]（先预览、再点确认才说话）[检查]
--     负责人走了 / 掉线 → 顶上一行「XX 走了：… [按建议改派]」，⛔ 点了才改、改完当场下发
--   队员：同一张表只读，自己的条目标蓝
--   草稿状态：sug = 建议，未下发；dirty = 改过，未下发；pub = 已下发（和队友手里的一样）
-- ⛔ 普通框体（没有安全按钮），不建 OnUpdate；下发 = 插件消息；说话只在 PartyPost.lua 的确认按钮里
local _, ns = ...; ns = _G.GearInsightForever or ns
local PP = ns and ns.PartyPlan
local B = ns and ns.BuffCheck
if not (PP and B and PP.Set) or ns.PartyUI then return end

local UI = { ROWS = 14, rows = {} }
ns.PartyUI = UI
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local win
function UI.Roster() return PP.Roster(B.members) end
function UI.CanEdit() return PP.MayEdit(UI.Roster()) end

-- ---------- 草稿 ----------
function UI.Load()
    local r = UI.Roster()
    if PP.cur then UI.draft, UI.state = PP.Copy(PP.cur), "pub"
    elseif PP.MayEdit(r) and PP.Opt("suggest") then UI.draft, UI.state = { v = PP.V, rev = 0, a = PP.Suggest(r) }, "sug"
    else UI.draft, UI.state = { v = PP.V, rev = 0, a = {} }, "none" end
    UI.post = nil
end
function UI.Dirty() UI.state, UI.post = "dirty", nil; UI.Refresh() end
function UI.Suggest()
    if not UI.CanEdit() then return end
    UI.draft = PP.Resuggest(UI.draft, UI.Roster())
    UI.Dirty()
end
function UI.Publish()
    if not UI.CanEdit() then return end
    if PP.Publish(UI.draft) then
        UI.draft, UI.state = PP.Copy(PP.cur), "pub"
        ns.Print(string.format(L("分配已下发（第 %d 版，%d 条）", "Assignments sent (rev %d, %d entries)"), PP.cur.rev, #PP.cur.a))
    end
    UI.Refresh()
end
-- 负责人走了：按建议改派（⛔ 点了才改；改完当场下发）
function UI.Reassign()
    if not UI.CanEdit() then return end
    local d = UI.draft
    for n in pairs(PP.gone or {}) do d = PP.Reassign(n, d, UI.Roster()) end
    UI.draft = d
    UI.Publish()
end
function UI.OnPlan(why)
    if UI.state ~= "dirty" or why == "mine" then UI.Load() end
    UI.Refresh()
end

-- ---------- 一条现在怎么样 ----------
function UI.Status(e)
    local s = PP.BYK[e.s]
    if not s then return "|cffff9933" .. L("？（需要更新）", "? (update needed)") .. "|r" end
    local g = PP.gone and PP.gone[e.who]
    if g or not PP.Find(UI.Roster(), e.who) then
        return "|cffff4d40" .. L("没人负责", "uncovered") .. (g == "off" and L("（掉线）", " (offline)") or L("（不在队里）", " (left)")) .. "|r"
    end
    if UI.state ~= "pub" then return "|cff9a9a9a" .. L("未下发", "not sent") .. "|r" end
    for _, row in ipairs(B.rows or {}) do
        if row.t == s.t then
            local w = row.who and row.who[e.who]
            if w and #w.miss > 0 then return "|cffff4d40" .. string.format(L("缺 %d", "missing %d"), #w.miss) .. "|r" end
            if w and #w.soon > 0 then return "|cffffd91a" .. string.format(L("快到期 %d", "expiring %d"), #w.soon) .. "|r" end
            return "|cff73ff73" .. L("都有", "ok") .. "|r"
        end
    end
    return "|cff9a9a9a-|r"
end

-- ---------- 框体 ----------
local function button(parent, w, fn)
    local b = CreateFrame("Button", nil, parent)
    b:SetSize(w, 18); b.w = w
    b.bg = b:CreateTexture(nil, "BACKGROUND"); b.bg:SetAllPoints(b); b.bg:SetColorTexture(1, 1, 1, 0.07)
    b.hl = b:CreateTexture(nil, "HIGHLIGHT"); b.hl:SetAllPoints(b); b.hl:SetColorTexture(1, 0.82, 0, 0.18)
    b.fs = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    b.fs:SetPoint("LEFT", 3, 0); b.fs:SetPoint("RIGHT", -3, 0); b.fs:SetJustifyH("LEFT")
    if b.fs.SetWordWrap then b.fs:SetWordWrap(false) end
    b:SetScript("OnClick", fn)
    return b
end
UI.Button = button
local function text(parent, font)
    local f = parent:CreateFontString(nil, "OVERLAY", font or "GameFontHighlightSmall")
    f:SetJustifyH("LEFT")
    if f.SetWordWrap then f:SetWordWrap(false) end
    return f
end
local function row(i)
    local r = CreateFrame("Frame", nil, win)
    r:SetSize(540, 18)
    r:SetPoint("TOPLEFT", 8, -62 - (i - 1) * 19)
    r.svc = text(r); r.svc:SetPoint("LEFT", 0, 0); r.svc:SetWidth(70)
    r.who = button(r, 110, function(self) if UI.PickWho then UI.PickWho(self, i) end end); r.who:SetPoint("LEFT", 72, 0)
    r.to = button(r, 190, function(self) if UI.PickTo then UI.PickTo(self, i) end end); r.to:SetPoint("LEFT", 186, 0)
    r.st = text(r); r.st:SetPoint("LEFT", 382, 0); r.st:SetWidth(132)
    r.del = button(r, 18, function() if UI.CanEdit() and UI.draft.a[i] then table.remove(UI.draft.a, i); UI.Dirty() end end); r.del:SetPoint("LEFT", 518, 0)
    r.del.fs:SetText("|cffff4d40×|r")
    UI.rows[i] = r
    return r
end
local function build()
    win = CreateFrame("Frame", "GearInsightForeverPartyPlan", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
    win:SetSize(556, 200); win:SetFrameStrata("HIGH"); win:SetClampedToScreen(true); win:SetMovable(true); win:EnableMouse(true)
    if win.SetBackdrop then
        pcall(win.SetBackdrop, win, { bgFile = "Interface\\Buttons\\WHITE8x8", edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1 })
        win:SetBackdropColor(0.05, 0.06, 0.08, 0.95); win:SetBackdropBorderColor(1, 0.82, 0, 0.8)
    end
    win:SetPoint("CENTER", UIParent, "CENTER", 0, 80)
    if win.RegisterForDrag then win:RegisterForDrag("LeftButton") end
    win:SetScript("OnDragStart", function(self) self:StartMoving() end)
    win:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    UI.title = text(win, "GameFontNormal"); UI.title:SetPoint("TOPLEFT", 8, -7)
    UI.close = button(win, 18, function() win:Hide() end); UI.close:SetPoint("TOPRIGHT", -4, -4); UI.close.fs:SetText("|cffff4d40×|r")
    UI.info = text(win); UI.info:SetPoint("TOPLEFT", 8, -26); UI.info:SetWidth(540)
    UI.warn = text(win); UI.warn:SetPoint("TOPLEFT", 8, -43); UI.warn:SetWidth(430)
    UI.fix = button(win, 100, function() UI.Reassign() end); UI.fix:SetPoint("TOPRIGHT", -8, -41)
    UI.fix.fs:SetText(L("[按建议改派]", "[Reassign]"))
    for i = 1, UI.ROWS do row(i) end
    UI.empty = text(win); UI.empty:SetPoint("TOPLEFT", 8, -64); UI.empty:SetWidth(540)
    UI.bar = {}
    for i, x in ipairs({
        { 62, L("出建议", "Suggest"), function() UI.Suggest() end },
        { 62, L("加一条", "Add"), function(self) if UI.AddEntry then UI.AddEntry(self) end end },
        { 62, L("下发", "Send"), function() UI.Publish() end },
        { 150, L("发到队伍", "Post to group"), function() if UI.PostClick then UI.PostClick() end end },
        { 62, L("检查", "Check"), function() PP.Slash("检查"); UI.Refresh() end } }) do
        local b = button(win, x[1], x[3])
        b.fs:SetJustifyH("CENTER"); b.fs:SetText(x[2]); b.label = x[2]
        UI.bar[i] = b
    end
    UI.pre = text(win); UI.pre:SetWidth(540); UI.pre:SetJustifyV("TOP")
    if UI.pre.SetWordWrap then UI.pre:SetWordWrap(true) end
    win:Hide()
    UI.win = win
end
local STATE = { sug = { "建议，未下发", "suggestion, not sent" }, dirty = { "已改动，未下发", "edited, not sent" }, none = { "还没有分配表", "no assignments yet" } }
function UI.Refresh()
    if not win or not win:IsShown() then return end
    local d, edit, me = UI.draft, UI.CanEdit(), PP.Me()
    UI.title:SetText("|cff33ff99GI|r · " .. L("队伍分配", "Group assignments"))
    local st = STATE[UI.state]
    if UI.state == "pub" then UI.info:SetText(string.format(L("|cff73ff73已下发|r 第 %d 版 · %s", "|cff73ff73sent|r rev %d · %s"), d.rev or 0, d.by or "?"))
    else UI.info:SetText("|cffffd91a" .. L(st[1], st[2]) .. "|r" .. (edit and "" or L("（团队里只有团长 / 助理能改）", " (raid leader / assistants only)"))) end
    local gone = {}
    for n, k in pairs(PP.gone or {}) do gone[#gone + 1] = n .. (k == "off" and L(" 掉线", " offline") or L(" 走了", " left")) end
    table.sort(gone)
    if #gone > 0 then UI.warn:SetText("|cffff4d40" .. table.concat(gone, L("、", ", ")) .. L("：他负责的没人管了", ": their assignments are uncovered") .. "|r"); UI.warn:Show()
    else UI.warn:SetText(""); UI.warn:Hide() end
    if #gone > 0 and edit then UI.fix:Show() else UI.fix:Hide() end
    local n = math.min(#d.a, UI.ROWS)
    for i = 1, UI.ROWS do
        local r, e = UI.rows[i], d.a[i]
        if e and i <= n then
            local mine = e.who == me
            r.svc:SetText((mine and "|cff66ccff" or "") .. PP.SvcName(e.s) .. (mine and "|r" or ""))
            r.who.fs:SetText(e.who .. (edit and " |cff9a9a9a▼|r" or ""))
            r.to.fs:SetText(PP.ToText(e.to) .. (edit and " |cff9a9a9a▼|r" or "") .. (e.m and " |cff9a9a9a" .. L("(手改)", "(edited)") .. "|r" or ""))
            r.st:SetText(UI.Status(e))
            if edit then r.del:Show() else r.del:Hide() end
            r:Show()
        else r:Hide() end
    end
    if n == 0 then UI.empty:SetText(edit and L("还没有条目：点「出建议」按队伍职业自动分，或「加一条」自己加", "Nothing yet: Suggest builds a plan from the group, or Add one yourself") or L("队长还没下发分配", "No assignments from the leader yet")); UI.empty:Show()
    else UI.empty:SetText(#d.a > UI.ROWS and string.format(L("…还有 %d 条没显示", "…%d more not shown"), #d.a - UI.ROWS) or ""); UI.empty:Hide() end
    local y = -66 - math.max(n, 1) * 19
    local x = 8
    for i, b in ipairs(UI.bar) do
        b:ClearAllPoints(); b:SetPoint("TOPLEFT", x, y)
        x = x + b.w + 6
        if edit or i == 5 then b:Show() else b:Hide() end
    end
    if UI.PostLabel then UI.bar[4].fs:SetText(UI.PostLabel()) end
    local pre = UI.PostText and UI.PostText() or nil
    UI.pre:ClearAllPoints(); UI.pre:SetPoint("TOPLEFT", 8, y - 24)
    UI.pre:SetText(pre or "")
    local lines = 0
    if pre then for _ in pre:gmatch("\n") do lines = lines + 1 end; lines = lines + 2 end
    win:SetHeight(-y + 28 + lines * 26)
end
function UI.Toggle()
    if not win then build() end
    if win:IsShown() then win:Hide(); return false end
    pcall(B.Update, "panel")
    UI.Load()
    win:Show()
    UI.Refresh()
    return true
end

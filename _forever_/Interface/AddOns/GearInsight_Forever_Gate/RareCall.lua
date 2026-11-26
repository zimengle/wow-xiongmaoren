-- 发现稀有 · 弹框（11-24 用户「扫描到稀有后，弹窗，问是否发到工会里，报坐标，和问有没有人来」「装备列在弹窗内，并且可以TOOLTIPS看」）
--   内核 RareCallStub.lua 认稀有 + 防打扰，真要弹时才加载这个子插件（ns.ModLoad("gate")），这里定义 RC.Go / RC.Show / RC.Msg / RC.Send / RC.Slash（含 test）。
--   1.5.0 内核减肥（11-24）：「这次刷新问过没有 / 弹框还开着 / 10 分钟 3 次」和 /gi rarecall 的处理从内核 RareCallStub.lua 原样搬来（RC.Go / RC.Slash）
--   弹框：稀有名 + 等级 / 精英 · 地图 + 坐标 · 刷新时间 · 掉落逐件一行（图标 + 品质色名字 + 掉率；鼠标指着出物品提示，Shift+点击插进聊天框；
--     最多显示 8 行，多的滚轮翻 +「还有 N 件」）· [发到公会]（不在公会 = 灰「你不在公会」）[发到队伍]（在队伍里才有）[插旗] [不用了] · [这只以后不问]。
--   ⛔ 点了才发；话里不带插件名（网易DD）；走对外说话语言 ns.ChatL；物品提示用 SetItemByID（⛔ 不用 SetHyperlink：Auctionator 给它的装备走 ContinueOnItemLoad，
--     服务器没有的装备回调永远不来会卡价格；没有 SetItemByID 的客户端只显示物品名）
--   ⛔ 这里的文件都晚于主插件加载：文件头一律 ns = _G.GearInsightForever or ns
local _, ns = ...; ns = _G.GearInsightForever or ns
local RC = ns.RareCall
if not RC then return end
local L, CL = ns.L, ns.ChatL
local ROWS, W = 8, 400
local QC = { q1 = "ffffff", q2 = "1eff00", q3 = "0070dd", q4 = "a335ee", q5 = "ff8000" }
local function str(v) return type(v) == "string" and not ns.Secret(v) and v ~= "" and v or nil end
local function call(f, ...) local ok, v = pcall(f or error, ...); if ok and not ns.Secret(v) then return v end end

-- ---------- 话术：「燃烧平原 74.3,37.8 发现稀有【XXX】(60 精英)，掉[奥术护甲]等，有人来吗？」+ [地图标记位置] ----------
--   代表装备最多 2 件（物品链接）；超 255 字节先少带装备、再丢地图标记（地图标记跟要 BUFF 的开关 BuffAsk.PinOn）
function RC.Msg(d)
    local where = (d.cz and (d.cz .. " ") or "") .. string.format("%.1f,%.1f", d.x or 0, d.y or 0)
    local head = string.format(CL("%s 发现稀有【%s】(%s)", "Rare at %s: [%s] (%s)"), where, d.chatName, (d.lv or "??") .. (d.elite and CL(" 精英", " elite") or ""))
    local BA, PS, pin = ns.BuffAsk, ns.PvPShout, nil
    if d.m and PS and PS.PinLink and (BA and BA.PinOn and BA.PinOn()) then
        local ok, l = pcall(PS.PinLink, d.m, d.x / 100, d.y / 100)
        pin = ok and str(l) or nil
    end
    local its = {}
    for i = 1, math.min(2, #d.items) do
        local it = d.items[i]
        its[i] = str(ns.ItemLink and select(2, pcall(ns.ItemLink, it.id))) or CL(it.n or "?", it.nEn or it.n)
    end
    local s
    for _, p in ipairs({ pin or false, false }) do
        for k = #its, 0, -1 do
            s = head .. (k > 0 and (CL("，掉", ", drops ") .. table.concat(its, CL("、", ", "), 1, k) .. CL("等", " and more")) or "")
                .. CL("，有人来吗？", " - anyone coming?") .. (p and (" " .. p) or "")
            if #s <= 255 then return s end
        end
    end
    return PS and PS.Clip and PS.Clip(s) or s
end

local function chan(ch)
    if ch == "GUILD" then return call(IsInGuild) == true and ch or nil end
    return (call(IsInRaid) == true and "RAID") or (call(IsInGroup) == true and "PARTY") or nil
end
function RC.Send(ch)
    local f = RC.pop
    ch = chan(ch)
    if not (f and f.d) then return false end
    if not ch then ns.Print(L("没发出去：你不在公会 / 队伍里", "Not sent: you're not in that guild / group")); return false end
    local send = (C_ChatInfo and C_ChatInfo.SendChatMessage) or SendChatMessage
    local ok, err = pcall(send, RC.Msg(f.d), ch)
    f:Hide()
    if not ok then ns.Print(L("没发出去：", "Not sent: ") .. tostring(err)) end
    return ok
end

-- ---------- 弹框 ----------
local function rowEnter(row)
    local id = row.it and row.it.id
    if not id then return end
    GameTooltip:SetOwner(row, "ANCHOR_RIGHT")
    if GameTooltip.SetItemByID then pcall(GameTooltip.SetItemByID, GameTooltip, id) else GameTooltip:SetText(row.nm:GetText() or "") end
    GameTooltip:Show()
end
local function rowLeave() GameTooltip:Hide() end
local function rowClick(row)   -- Shift+点击：物品链接插进聊天框
    local id = row.it and row.it.id
    if not (id and ((IsModifiedClick and IsModifiedClick("CHATLINK")) or (IsShiftKeyDown and IsShiftKeyDown()))) then return end
    local link = ns.ItemLink and ns.ItemLink(id)
    if link and ChatEdit_InsertLink then ChatEdit_InsertLink(link) end
end
local function icon(id)
    local f = (C_Item and C_Item.GetItemIconByID) or GetItemIcon
    local ok, v = pcall(f or error, id)
    return ok and v or "Interface\\Icons\\INV_Misc_QuestionMark"
end

local function layout(f)
    local items = f.d.items
    local n = math.min(ROWS, #items)
    for i, row in ipairs(f.rows) do
        local it = i <= n and items[i + f.off] or nil
        row.it = it
        if it then
            row.ic:SetTexture(icon(it.id))
            row.nm:SetText("|cff" .. (QC[it.q] or "ffffff") .. ns.ItemNm(it) .. "|r")
            row.p:SetText(it.p and (ns.PctText and ns.PctText(it.p) or string.format("%g%%", it.p)) or "")
        end
        row:SetShown(it ~= nil)
    end
    local more = #items - ROWS
    f.more:SetText(#items == 0 and L("没有掉落数据", "No drop data")
        or more > 0 and string.format(L("还有 %d 件（鼠标滚轮翻看）", "%d more (scroll to see)"), more) or "")
    f.more:SetPoint("TOPLEFT", f.list, "TOPLEFT", 0, -n * 20 - 2)
    f:SetHeight(76 + n * 20 + ((#items == 0 or more > 0) and 16 or 0) + 74)
end

local function build()
    local f = CreateFrame("Frame", "GearInsightForeverRarePop", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
    f:SetSize(W, 220); f:SetPoint("TOP", 0, -180); f:SetFrameStrata("DIALOG"); f:SetClampedToScreen(true)
    if f.SetBackdrop then
        pcall(f.SetBackdrop, f, { bgFile = "Interface\\Buttons\\WHITE8x8", edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1 })
        f:SetBackdropColor(0.03, 0.035, 0.05, 0.94); f:SetBackdropBorderColor(0.85, 0.68, 0.25, 0.85)
    end
    f:EnableMouse(true); f:SetMovable(true); f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving); f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.title:SetPoint("TOPLEFT", 12, -12)
    f.title:SetText("|cff33ff99GearInsight|r · " .. L("发现稀有", "Rare spotted"))
    f.info = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    f.info:SetPoint("TOPLEFT", 12, -34); f.info:SetWidth(W - 24); f.info:SetJustifyH("LEFT")
    f.list = CreateFrame("Frame", nil, f)
    f.list:SetPoint("TOPLEFT", 12, -76); f.list:SetSize(W - 24, ROWS * 20)
    f.list:EnableMouseWheel(true)
    f.list:SetScript("OnMouseWheel", function(_, delta)
        f.off = math.max(0, math.min(#f.d.items - ROWS, f.off - (delta or 0)))
        layout(f)
    end)
    f.rows = {}
    for i = 1, ROWS do
        local row = CreateFrame("Button", nil, f.list)
        row:SetSize(W - 24, 20); row:SetPoint("TOPLEFT", 0, -(i - 1) * 20)
        local hl = row:CreateTexture(nil, "HIGHLIGHT"); hl:SetAllPoints(); hl:SetColorTexture(1, 0.82, 0, 0.10)
        row.ic = row:CreateTexture(nil, "ARTWORK"); row.ic:SetSize(18, 18); row.ic:SetPoint("LEFT")
        row.nm = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        row.nm:SetPoint("LEFT", 24, 0); row.nm:SetWidth(W - 110); row.nm:SetJustifyH("LEFT")
        row.p = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        row.p:SetPoint("RIGHT", -4, 0)
        row:SetScript("OnEnter", rowEnter)
        row:SetScript("OnLeave", rowLeave)
        row:SetScript("OnClick", rowClick)
        f.rows[i] = row
    end
    f.more = f.list:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    local function btn(k, cn, en, w, fn, ...)
        f[k] = ns.Button(f, L(cn, en), w, 24, fn)
        f[k]:SetPoint(...)
    end
    btn("guild", "发到公会", "Send to guild", 100, function() RC.Send("GUILD") end, "BOTTOMLEFT", 12, 40)
    btn("party", "发到队伍", "Send to group", 90, function() RC.Send("PARTY") end, "BOTTOMLEFT", 118, 40)
    local function hide() f:Hide() end
    btn("no", "不用了", "No thanks", 80, hide, "BOTTOMRIGHT", -12, 40)
    btn("pin", "插旗", "Map pin", 70, function()
        local d = f.d
        if d.m and ns.ShowOnMap then ns.ShowOnMap(d.m, { { d.x, d.y } }, d.name) end
    end, "BOTTOMRIGHT", -98, 40)
    btn("mute", "这只以后不问", "Don't ask for this one", 130, function()
        local d, db = f.d, RC.DB()
        f:Hide()
        db.mute = type(db.mute) == "table" and db.mute or {}
        db.mute[d.npc] = true
        ns.CloseHint("rareMute", string.format(L("「%s」以后不再问。找回：/gi rarecall reset", "Won't ask about %s again. Undo: /gi rarecall reset"), d.name))
    end, "BOTTOMLEFT", 12, 12)
    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetScript("OnClick", hide)
    close:SetPoint("TOPRIGHT", -2, -2)
    return f
end

-- info = { npc, name, level, cls }（内核 RC.Check 读的单位信息）。返回 true = 弹出来了
function RC.Show(info)
    local r
    for _, x in ipairs(ns.Data.rares or {}) do if x.npc == info.npc then r = x; break end end   -- ns.Data.rares 在 _Plan，读一次就按需加载
    r = r or { items = {} }
    local d = { npc = info.npc, items = r.items or {} }
    d.name = r.n and L(r.n, r.nEn or r.n) or str(info.name) or "?"
    d.chatName = r.n and CL(r.n, r.nEn or r.n) or d.name
    d.lv = (info.level or 0) > 0 and info.level or (r.lv and r.lv[1])
    if info.cls then d.elite = info.cls == "rareelite" or info.cls == "elite" or info.cls == "worldboss" else d.elite = r.rare == 2 end
    -- 位置：人就在稀有旁边 → 用自己的位置（比数据里的第一个刷新点准）；读不到就用数据的刷新点。x / y = 0–100
    local PS = ns.PvPShout
    local ok, m, x, y = pcall(PS and PS.Pos or error)
    if ok and m then d.m, d.x, d.y = m, x * 100, y * 100
    elseif (r.x or 0) > 0 then d.m, d.x, d.y = r.ui, r.x, r.y end
    local ok2, mi = pcall(C_Map and C_Map.GetMapInfo or error, d.m)
    d.zn = ok2 and type(mi) == "table" and str(mi.name) or (r.z and L(r.z, r.zEn or r.z)) or ""
    -- 发出去的地区名：客户端语言 = 对外语言才写客户端读到的名字（ns.ChatZone）；否则数据里就是这张图就用数据的中 / 英文名
    d.cz = ns.ChatZone(d.zn) or (r.z and d.m == r.ui and CL(r.z, r.zEn or r.z)) or nil
    local f = RC.pop or build()
    RC.pop, f.d, f.off = f, d, 0
    local rs = r.rs or 0
    f.info:SetText("|cffffd100" .. d.name .. "|r  " .. (d.lv or "??") .. L(" 级", "") .. (d.elite and L(" 稀有精英", " rare elite") or L(" 稀有", " rare"))
        .. "\n" .. d.zn .. (d.x and string.format(" %.1f, %.1f", d.x, d.y) or "")
        .. (rs >= 3600 and (L(" · 刷新约 ", " - respawn ~") .. string.format("%g", math.floor(rs / 360) / 10) .. L(" 小时", "h"))
            or rs >= 60 and (L(" · 刷新约 ", " - respawn ~") .. math.floor(rs / 60) .. L(" 分钟", "m")) or ""))
    local g = chan("GUILD") ~= nil
    f.guild:SetText(g and L("发到公会", "Send to guild") or L("你不在公会", "Not in a guild"))
    f.guild:SetEnabled(g)
    f.party:SetShown(chan("PARTY") ~= nil)
    layout(f)
    f:Show()
    local token = {}
    f.token = token
    C_Timer.After(60, function() if f.token == token then f:Hide() end end)   -- 60 秒没人理自动收起
    return true
end

-- 内核 RC.Check 认出来（稀有 / 活着 / 没设不问 / 野外 / 不在战斗）以后：同一只（这次刷新 key = NPC ID-GUID 末段）只弹一次；
--   弹框还开着不顶；10 分钟（600 秒）最多弹 3 次。返回 true = 弹出来了
local seen, recent = {}, {}
function RC.Go(unit, npc, key)
    if seen[key] or RC.pop and RC.pop:IsShown() then return false end
    local t, n = GetTime(), 0
    for k = #recent, 1, -1 do if t - recent[k] > 600 then table.remove(recent, k) else n = n + 1 end end
    if n >= 3 then return false end
    local ok, shown = pcall(RC.Show, { npc = npc, name = call(UnitName, unit), level = call(UnitLevel, unit), cls = call(UnitClassification, unit) })
    if not (ok and shown) then return false end
    seen[key] = true
    recent[#recent + 1] = t
    return true
end

-- /gi rarecall on|off|reset|test（reset = 恢复「这只以后不问」的；test = 挑掉落最多的一只稀有弹框看看，不记「问过」、不发任何话）
function RC.Slash(rest)
    if rest == "test" then
        local pick
        for _, r in ipairs(ns.Data.rares or {}) do if not pick or #(r.items or {}) > #pick.items then pick = r end end
        return pick ~= nil and RC.Show({ npc = pick.npc })
    end
    if rest == "reset" then RC.DB().mute = nil elseif rest == "on" or rest == "off" then RC.DB().on = rest == "on" end
    ns.Print("/gi rarecall on|off|reset|test: " .. tostring(RC.DB().on ~= false))
end

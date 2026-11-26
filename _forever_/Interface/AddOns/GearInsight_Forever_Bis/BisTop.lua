-- 60 级 BiS「前5」小面板 + 装备页 + 附魔详情（11-25 从 _Plan 的 PagePlan.lua 搬来：只给 60 级用，搬进按需加载的 _Bis，_Plan / 合并包少一截）
-- 用户截图「不要这样列出来，是旁边加个按钮是看前5，然后点击装备可以打开一个装备页，展示当前BOSS和掉落装备视图」：
--   「前5」= 这个小面板（图标 · 品质色名字 / 使用率 · 人数 · 来源；悬停物品提示，Shift 发聊天 / Ctrl 试穿，ESC 关）。
--   点装备 = 装备页：副本 → 掉落页定位到首领并高亮这件（ns.LootShowItem）；任务 → 副本任务链定位到那条任务（ns.DQOpenForItem）；
--   制造 → 专业页配方库定位到配方（ns.ProfOpenRecipe）；找不到 / 声望 / 野外 / 商人 → 这个面板换成「这件 + 来源说明」
--   11-26 任务奖励件不是副本任务 → 这个面板换成「这件 + 完整任务线」（showChain，数据 QuestChainData.lua）
--   11-25 附魔详情（BisPage.lua 点附魔小格）也用这一个面板：一个面板三种内容，⛔ 别再加框体
-- ⛔ 这里的文件都晚于主插件 / _Plan 加载：文件头一律 ns = _G.GearInsightForever or ns；_Plan 的局部函数经 ns.BisItemInfo / ns.BisCurItem /
--   ns.BisCuratedName / ns.BisStatText / ns.BisSrcText 拿（PagePlan.lua 导出）
local _, ns = ...; ns = _G.GearInsightForever or ns

local QCOLOR = { q1 = "ffffff", q2 = "1eff00", q3 = "0070dd", q4 = "a335ee", q5 = "ff8000" }
local CUR_KEYS = { head = "head", neck = "neck", shoulder = "shoulder", back = "back", chest = "chest", wrist = "wrist", hands = "hands",
    waist = "waist", legs = "legs", feet = "feet", finger1 = "finger", finger2 = "finger", trinket1 = "trinket", trinket2 = "trinket",
    main = "main", off = "off", ranged = "ranged" }
local SLOT_CN = { head = "头部", neck = "颈部", shoulder = "肩部", back = "背部", chest = "胸部", wrist = "手腕", hands = "手",
    waist = "腰部", legs = "腿部", feet = "脚", finger = "手指", trinket = "饰品", main = "武器", off = "副手", ranged = "远程" }
ns.BisCurKeys, ns.BisSlotCn, ns.BisQColor = CUR_KEYS, SLOT_CN, QCOLOR

local bisPop
local qcSF, qcChild, qcText   -- 任务线区（showChain 第一次用才建，挂在 bisPop 上）
local function tipHide() GameTooltip:Hide() end
-- 行上的自定义回调 / 数据用 rawget 取（框体表上没有的键别走元表）
local function rowEnter(self)
    local fn = rawget(self, "giEnter")
    if fn then return fn(self) end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    pcall(GameTooltip.SetItemByID, GameTooltip, self.id)
    GameTooltip:AddLine(ns.L("点击：打开装备页 · Shift + 点击：发到聊天框 · Ctrl + 点击：试穿", "Click: item page - Shift-click: link - Ctrl-click: try on"), 0.6, 0.6, 0.6, true)
    GameTooltip:Show()
end
local function rowClick(self)
    local fn = rawget(self, "giClick")
    if fn then return fn(self) end
    if not (ns.ItemModClick and ns.ItemModClick(self.id, self.nm)) then ns.BisOpenItem(self.id) end
end
-- rows = { { id 物品（物品行）| ic 图标, t 第一行, s 第二行, enter / click 自定义（附魔行）}… 最多 5 行 }；note = 底下的说明（nil = 不显示）
local function pop(title, rows, note)
    local f = bisPop
    if not f then
        local gp = ns.GearPage or {}
        f = CreateFrame("Frame", "GearInsightForeverBisTop", gp.page or UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
        f:SetSize(400, 214); f:SetFrameStrata("DIALOG"); f:EnableMouse(true); f:SetClampedToScreen(true)
        if f.SetBackdrop then
            f:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                edgeSize = 14, insets = { left = 3, right = 3, top = 3, bottom = 3 } })
            f:SetBackdropColor(0.04, 0.04, 0.07, 0.97)
        end
        f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        f.title:SetPoint("TOPLEFT", 12, -10); f.title:SetPoint("RIGHT", -30, 0); f.title:SetJustifyH("LEFT")
        local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
        close:SetPoint("TOPRIGHT", 0, 0); close:SetScript("OnClick", function() f:Hide() end)
        f.note = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        f.note:SetJustifyH("LEFT"); f.note:SetJustifyV("TOP"); if f.note.SetSpacing then f.note:SetSpacing(3) end
        f.rows = {}
        for i = 1, 5 do
            local r = CreateFrame("Button", nil, f)
            r:SetPoint("TOPLEFT", 10, -44 - (i - 1) * 32); r:SetPoint("RIGHT", -10, 0); r:SetHeight(30)
            r.ic = r:CreateTexture(nil, "ARTWORK"); r.ic:SetSize(26, 26); r.ic:SetPoint("LEFT"); r.ic:SetTexCoord(0.07, 0.93, 0.07, 0.93)
            r.t = r:CreateFontString(nil, "OVERLAY", "GameFontHighlight"); r.t:SetPoint("TOPLEFT", 32, -1)
            r.s = r:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall"); r.s:SetPoint("BOTTOMLEFT", 32, 1)
            for _, fs in ipairs({ r.t, r.s }) do fs:SetPoint("RIGHT", 0, 0); fs:SetWordWrap(false); fs:SetJustifyH("LEFT") end
            local hl = r:CreateTexture(nil, "HIGHLIGHT"); hl:SetAllPoints(); hl:SetColorTexture(1, 1, 1, 0.08)
            r:SetScript("OnEnter", rowEnter); r:SetScript("OnLeave", tipHide); r:SetScript("OnClick", rowClick)
            f.rows[i] = r
        end
        if UISpecialFrames then table.insert(UISpecialFrames, "GearInsightForeverBisTop") end
        bisPop = f
    end
    f.title:SetText(title)
    f:SetWidth(400)
    if qcSF then qcSF:Hide() end   -- 任务线区（showChain）只在任务线内容时显示
    local n = 0
    for i, r in ipairs(f.rows) do
        local e = rows[i]
        r:SetShown(e ~= nil)
        if e then
            n = i
            r.ic:SetTexture(e.ic or "Interface\\Icons\\inv_misc_questionmark")
            r.t:SetText(e.t or ""); r.s:SetText(e.s or "")
            r.id, r.nm = e.id, e.nm
            rawset(r, "giEnter", e.enter); rawset(r, "giClick", e.click); rawset(r, "giData", e.data)
        end
    end
    f.note:ClearAllPoints(); f.note:SetPoint("TOPLEFT", 14, -44 - n * 32 - 8); f.note:SetPoint("RIGHT", -14, 0)
    f.note:SetText(note or ""); f.note:SetShown(note ~= nil)
    -- 11-26 用户截图「UI」：说明有几行就留几行高（原来写死 70，长说明掉到框外）
    local nh = note and math.max(40, math.ceil((f.note.GetStringHeight and f.note:GetStringHeight()) or 0) + 26) or 14
    f:SetHeight(math.max(120, 44 + n * 32 + nh))
    f:Show()
    return f
end
ns.BisPop = pop
ns._BisPopFrame = function() return bisPop end   -- 测试用

-- 物品行（前 5 / 装备页共用）
local function itemRow(e, key)
    local it, info = ns.BisCurItem(ns.MyClass(), e, key), ns.BisItemInfo(e.id) or {}
    local ic = (it.i and it.i ~= "") and it.i or info.i
    local nm = ns.BisCuratedName(e)
    return { id = e.id, nm = nm,
        ic = (ic and ic ~= "") and ("Interface\\Icons\\" .. ic) or (C_Item and C_Item.GetItemIconByID and C_Item.GetItemIconByID(e.id)) or nil,
        t = "|cff" .. (QCOLOR[it.q or info.q] or "ffffff") .. (e.rank and (e.rank .. ". ") or "") .. nm .. "|r",
        s = (e.cnt and (ns.BisStatText(e) .. " · ") or "") .. ns.BisSrcText(info.how, info.s, info.sEn) }
end

-- 格子旁「前5」：b.slotKey = 槽位键，b.side = 文字在哪边（L = 图标左边 → 面板往右下角对齐）
function ns.BisShowTop(b)
    local gp = ns.GearPage or {}
    local key, ct = CUR_KEYS[b.slotKey or ""], gp.curTop
    local top = key and ct and ct[key]
    if not top or #top == 0 then return nil end
    local rows = {}
    for i, e in ipairs(top) do rows[i] = itemRow(e, key) end
    local f = pop(string.format(ns.L("%s · %d 级 BiS 前 %d（WCL 全球 %d 名%s实测）", "%s - Lv %d BiS top %d (WCL, %d %s players worldwide)"),
        ns.L(ns.TD(SLOT_CN[key]), key), ct.lv or 60, #top, ct.n or 0, ns.L(ct.zh or "", (ct.full or ""):match("/(.+)$") or "")), rows, nil)
    f:ClearAllPoints()
    if b.side == "L" then f:SetPoint("TOPRIGHT", b, "BOTTOMRIGHT", 0, -2) else f:SetPoint("TOPLEFT", b, "BOTTOMLEFT", 0, -2) end
    return f
end

-- 11-26 用户截图弗丁印记「任务：在梦中」：「点击都可以看到任务线才行」→ 任务奖励件（不是副本任务 / 副本任务里找不到）列完整任务线。
--   数据 QuestChainData.lua（scripts/gi_forever_bis_quest_chain.py，QuestieDB 沿前置任务追到头）：I 物品行「阵营:任务,任务,…|…」、Q 任务行，用到才拆。
local function qcLine(prefix)
    local d = ns.QuestChainData and ns.QuestChainData.d
    if type(d) ~= "string" then return nil end
    local p = string.find(d, "\n" .. prefix, 1, true)
    if not p then return nil end
    local q = string.find(d, "\n", p + 1, true) or (#d + 1)
    return (d:sub(p + 1 + #prefix, q - 1):gsub("\r", ""))
end
local function qcSplit(s, sep)
    local out, p = {}, 1
    while true do
        local q = string.find(s, sep, p, true)
        if not q then out[#out + 1] = s:sub(p); return out end
        out[#out + 1] = s:sub(p, q - 1); p = q + 1
    end
end
local qcC = {}
-- 物品 → { side = "" 两边一样 / "A" 联盟 / "H" 部落, { id 任务, lv 任务等级, req 需要等级, n 任务名, npc 找谁接, zone 地区 }… 按先后，最后一环奖励这件 }；没有 → nil
function ns.BisQuestChain(id)
    local c = qcC[id]
    if c ~= nil then return c or nil end
    local raw = id and qcLine("I" .. id .. "\t")
    local ref = raw and raw:match("^=(%d+)$")   -- 11-26 同一条任务线只存一次：「=物品」
    if ref then raw = qcLine("I" .. ref .. "\t") end
    local by, first = {}, nil
    for _, part in ipairs(raw and qcSplit(raw, "|") or {}) do
        local side, ids = part:match("^(%a?):(.+)$")
        if side then by[side] = ids; first = first or side end
    end
    local my = (UnitFactionGroup and UnitFactionGroup("player")) == "Horde" and "H" or "A"
    local side = (by[""] and "") or (by[my] and my) or first
    if side then
        c = { side = side }
        for _, qs in ipairs(qcSplit(by[side], ",")) do
            local f = qcSplit(qcLine("Q" .. qs .. "\t") or "", "\t")
            local function pick(i) local zh, en = f[i] or "", f[i + 1] or ""; return ns.L(zh, en ~= "" and en or zh) end
            c[#c + 1] = { id = tonumber(qs), lv = tonumber(f[1]) or 0, req = tonumber(f[2]) or 0, n = pick(3), npc = pick(5), zone = pick(7) }
        end
        if #c == 0 then c = nil end
    end
    qcC[id] = c or false
    return c
end
local function questDone(qid)
    local fn = (C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted) or IsQuestFlaggedCompleted
    if not fn then return false end
    local ok, r = pcall(fn, qid)
    return (ok and r) and true or false
end
local QC_LINE, QC_VIEW, QC_TOP = 15, 300, 82
local function chainWheel(self, d)
    local max = rawget(self, "giMax") or 0
    local v = (self:GetVerticalScroll() or 0) - d * QC_LINE * 3
    self:SetVerticalScroll(math.max(0, math.min(max, v)))
end
-- 同一个面板的第四种内容：这件 + 任务线（一行一环，做完的标灰打勾，最后一环标「奖励这件」；环数多可滚轮翻）
local function showChain(id, ch, info)
    local e, was = { id = id }, bisPop and bisPop:IsShown()
    local n = #ch
    local tag = ch.side == "A" and ns.L(" · 联盟", " - Alliance") or ch.side == "H" and ns.L(" · 部落", " - Horde") or ""
    local f = pop(ns.BisCuratedName(e) .. string.format(ns.L(" · 任务线（共 %d 环）", " - quest chain (%d steps)"), n) .. tag, { itemRow(e, nil) }, nil)
    if not qcSF then
        qcSF = CreateFrame("ScrollFrame", nil, f)
        qcChild = CreateFrame("Frame", nil, qcSF)
        qcSF:SetScrollChild(qcChild)
        qcText = qcChild:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        qcText:SetPoint("TOPLEFT", 0, 0); qcText:SetJustifyH("LEFT"); qcText:SetJustifyV("TOP")
        if qcText.SetSpacing then qcText:SetSpacing(3) end
        qcSF:EnableMouseWheel(true); qcSF:SetScript("OnMouseWheel", chainWheel)
    end
    local lines, done, cur = {}, 0, nil
    for i, q in ipairs(ch) do
        local t = i .. " · [" .. (q.lv > 0 and q.lv or "?") .. "] " .. (q.n ~= "" and q.n or ("#" .. q.id))
        if q.npc ~= "" then
            t = t .. ns.L(" · 接：", " - from ") .. q.npc .. (q.zone ~= "" and (ns.L("（", " (") .. q.zone .. ns.L("）", ")")) or "")
        elseif q.zone ~= "" then
            t = t .. " · " .. q.zone
        end
        local last = i == n and ns.L("  ← 奖励这件", "  <- rewards this") or ""
        if questDone(q.id) then
            done = done + 1
            lines[i] = "|TInterface\\RaidFrame\\ReadyCheck-Ready:12:12|t |cff808080" .. t .. last .. "|r"
        else
            cur = cur or i
            lines[i] = t .. (last ~= "" and ("|cffffd100" .. last .. "|r") or "")
        end
    end
    f:SetWidth(480)
    qcText:SetWidth(452); qcText:SetText(table.concat(lines, "\n"))
    local h = math.max(qcText:GetStringHeight() or 0, n * QC_LINE)
    local view = math.min(h, QC_VIEW)
    qcSF:ClearAllPoints(); qcSF:SetPoint("TOPLEFT", 14, -QC_TOP); qcSF:SetPoint("RIGHT", -14, 0); qcSF:SetHeight(view)
    qcChild:SetSize(452, h)
    rawset(qcSF, "giMax", h - view)
    qcSF:SetVerticalScroll(math.max(0, math.min(h - view, ((cur or 1) - 4) * h / n)))   -- 先滚到还没做的那一环附近
    qcSF:Show()
    local note = ns.L("来源：", "Source: ") .. ns.BisSrcText(info.how, info.s or "", info.sEn)
        .. (ch[1].req > 1 and string.format(ns.L(" · 第 1 环 %d 级可接", " - step 1 needs Lv %d"), ch[1].req) or "")
        .. (done > 0 and string.format(ns.L(" · 已完成 %d / %d 环", " - %d / %d done"), done, n) or "")
        .. (h > view and ns.L(" · 滚轮翻看全部", " - scroll for more") or "")
    f.note:ClearAllPoints(); f.note:SetPoint("TOPLEFT", 14, -QC_TOP - view - 8); f.note:SetPoint("RIGHT", -14, 0)
    f.note:SetText(note); f.note:Show()
    f:SetHeight(QC_TOP + view + 8 + 40)
    if not was then f:ClearAllPoints(); f:SetPoint("CENTER", (ns.GearPage or {}).page or UIParent, "CENTER", 0, 0) end
    return f
end
ns._BisChainFrame = function() return qcSF, qcText end   -- 测试用

-- 装备页：返回去了哪（测试用）loot / quest / recipe / questline（任务线面板）/ note
function ns.BisOpenItem(id)
    local info = ns.BisItemInfo(id) or {}
    local how, s = info.how, info.s or ""
    local went = (how == "drop" and ns.LootShowItem and ns.LootShowItem(id) and "loot")
        or (how == "quest" and ns.DQOpenForItem and ns.DQOpenForItem(id, (s:gsub("^任务：", ""))) and "quest")
    if not went and how == "craft" and ns.LoadModule then
        pcall(ns.LoadModule, "prof", true)
        went = ns.ProfOpenRecipe and ns.ProfOpenRecipe(id) and "recipe"
    end
    if went then
        if bisPop then bisPop:Hide() end
        return went
    end
    -- 不是副本任务（或副本任务里找不到）→ 完整任务线；数据里没有这条任务线才退回「这件 + 来源说明」
    local ch = how == "quest" and ns.BisQuestChain(id)
    if ch then showChain(id, ch, info); return "questline" end
    local e, was = { id = id }, bisPop and bisPop:IsShown()
    local f = pop(ns.L("装备页 · ", "Item - ") .. ns.BisCuratedName(e), { itemRow(e, nil) }, ns.L("来源：", "Source: ") .. ns.BisSrcText(how, s, info.sEn))
    if not was then f:ClearAllPoints(); f:SetPoint("CENTER", (ns.GearPage or {}).page or UIParent, "CENTER", 0, 0) end
    return "note"
end

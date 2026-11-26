-- 60 级 BiS 正式服样式纸娃娃（带附魔）——11-25 用户「能不能把60的BIS界面换成正式服的那种，有附魔各种的，展示」（「都按推荐」）
--   设计稿 bis60_retail_style_design.md §4：「推荐装备」页目标 60 级且有 BisData 时 _Plan 的 refreshGearPage 调 ns.Bis60Render(gp, 60)，
--   这块框体盖在老纸娃娃的位置上（第一次进 60 视图才建）；< 60 级 ns.Bis60Hide 收起、老纸娃娃照旧。
-- 每格三行：① 装备（品质色名 + 「前5」）② 热门度 · 来源（已毕业 / 身上的排第 N / 可升级）③ 附魔 + 状态色：
--   绿 已附（身上这格附的是本格前 3）· 黄 非热门（附了，但不在前 3）· 红 缺附魔（本格有 ≥10 人在用的附魔，你没附）· 灰 本格少有人附魔 / 这格无附魔
-- 顶部：专精下拉（本职业全部 WCL 专精 + 样本数，样本少标注）、汇总行（已毕业 N/格数 · 附魔 M/Z · 缺附魔 · 非热门）；底部数据来源行（悬停看口径）。
-- 附魔：悬停 = 客户端原生说明（SetSpellByID）+ 怎么获得 + 本格前 3；点击 = 附魔详情（复用「前5」面板 ns.BisPop）；Shift = 配方 / 卷轴链接进聊天；
--   拍卖行开着点击 = 直接搜卷轴 / 护甲片；商人卖的配方 = 详情里点一下插旗（ns.ShowOnMap）。物品提示一律 SetItemByID / SetInventoryItem（⛔ 不用 SetHyperlink，Auctionator 会卡价格）
-- 去掉衬衣 / 战袍格（60 BiS 不推外观）；主手 / 副手并进左列，远程放模型下方；行高 46。规则同老纸娃娃（ns.BisPicks = _Plan 的 applyCurated：
--   戒指 / 饰品第 2 格 = 第 2 名、主手双手不推副手、唯一装备顺延；不能双持 / 祖格装 / 猎人投掷在生成数据时已剔）
-- ⛔ 这里的文件都晚于主插件 / _Plan 加载：文件头一律 ns = _G.GearInsightForever or ns；最后置 ns._bisReady
local _, ns = ...; ns = _G.GearInsightForever or ns

local QC, CK, SC = ns.BisQColor, ns.BisCurKeys, ns.BisSlotCn
local ROW_H, ICON, ESZ, WSZ, COL_W, TOP_Y = 46, 34, 18, 16, 236, -16
local FONT = STANDARD_TEXT_FONT or "Fonts\\ARKai_T.ttf"
local LEFT = { { "head", "HeadSlot" }, { "neck", "NeckSlot" }, { "shoulder", "ShoulderSlot" }, { "back", "BackSlot" },
    { "chest", "ChestSlot" }, { "wrist", "WristSlot" }, { "main", "MainHandSlot" }, { "off", "SecondaryHandSlot" } }
local RIGHT = { { "hands", "HandsSlot" }, { "waist", "WaistSlot" }, { "legs", "LegsSlot" }, { "feet", "FeetSlot" },
    { "finger1", "Finger0Slot" }, { "finger2", "Finger1Slot" }, { "trinket1", "Trinket0Slot" }, { "trinket2", "Trinket1Slot" } }
local RANGED = { "ranged", "RangedSlot" }
local NO_ENCH = { waist = true, finger1 = true, finger2 = true, trinket1 = true, trinket2 = true }
local STATE_RGB = { ok = { 0.3, 0.95, 0.3 }, cold = { 1, 0.82, 0 }, miss = { 1, 0.25, 0.2 }, rare = { 0.4, 0.4, 0.4 }, none = { 0.25, 0.25, 0.25 } }
local PROF_ZH = { blacksmithing = { "锻造", "Blacksmithing" }, leatherworking = { "制皮", "Leatherworking" }, tailoring = { "裁缝", "Tailoring" },
    engineering = { "工程学", "Engineering" }, alchemy = { "炼金术", "Alchemy" }, enchanting = { "附魔", "Enchanting" }, cooking = { "烹饪", "Cooking" } }
local SPEC_EN = { ["野兽控制"] = "Beast Mastery" }

-- ---------- EnchantData：长字符串按行首前缀找（同 BisData），第一次用到某专精 / 某附魔才拆 ----------
local function eLine(prefix)
    local d = ns.EnchantData and ns.EnchantData.d
    if type(d) ~= "string" then return nil end
    local p = string.find(d, "\n" .. prefix, 1, true)
    if not p then return nil end
    local q = string.find(d, "\n", p + 1, true) or (#d + 1)
    return d:sub(p + 1 + #prefix, q - 1)
end
local function split(s)
    local out, p = {}, 1
    while true do
        local q = string.find(s, "\t", p, true)
        if not q then out[#out + 1] = s:sub(p); return out end
        out[#out + 1] = s:sub(p, q - 1); p = q + 1
    end
end
local spC, inC = {}, {}
-- 一个 WCL 专精 → { n, nAll, lo, [槽位键] = { k = 附了魔的人数, top = { { spell, n, pct, pctE, rank }… } } }
local function enchSpec(full)
    local c = spC[full]
    if c ~= nil then return c or nil end
    local raw = eLine("N\t" .. full .. "\t")
    if not raw then spC[full] = false; return nil end
    local f = split(raw)
    c = { n = tonumber(f[1]) or 0, nAll = tonumber(f[2]) or 0, lo = f[3] == "1" }
    for i = 4, #f do
        local key, k, body = string.match(f[i], "^(%a+)=(%d+):(.*)$")
        if key then
            local lst = {}
            k = tonumber(k) or 0
            for sp, n in string.gmatch(body, "(%d+),(%d+)") do
                n = tonumber(n)
                lst[#lst + 1] = { spell = tonumber(sp), n = n, pct = c.n > 0 and math.floor(n * 1000 / c.n + 0.5) / 10 or 0,
                    pctE = k > 0 and math.floor(n * 1000 / k + 0.5) / 10 or 0, rank = #lst + 1 }
            end
            c[key] = { k = k, top = lst }
        end
    end
    spC[full] = c
    return c
end
-- 附魔法术 → { spell, ench, func, trainer, eff, zh, recipe, scroll, kit, prof, how, s, sEn, vui, vx, vy, vfac }
local function enchInfo(spell)
    local c = inC[spell]
    if c then return c end
    local raw = spell and eLine("P" .. spell .. "\t")
    if not raw then return nil end
    local f = split(raw)
    local fl = f[2] or ""
    c = { spell = spell, ench = tonumber(f[1]) or 0, func = string.find(fl, "f", 1, true) ~= nil, trainer = string.find(fl, "t", 1, true) ~= nil,
        eff = f[3] or "", zh = f[4] or "", recipe = tonumber(f[5]), scroll = tonumber(f[6]), kit = tonumber(f[7]), prof = f[8] or "" }
    local r = tonumber(f[9]) and eLine("R" .. f[9] .. "\t")
    if r then local x = split(r); c.how, c.s, c.sEn = x[1], x[2] or "", x[3] or "" end
    local ui, x, y, fac = string.match(f[10] or "", "^(%d+),([%d.]+),([%d.]+),(%a*)$")
    if ui then c.vui, c.vx, c.vy, c.vfac = tonumber(ui), tonumber(x), tonumber(y), fac end
    inC[spell] = c
    return c
end
ns.BisEnchSpec, ns.BisEnchInfo = enchSpec, enchInfo   -- 测试 / 三端对拍用

local function itemName(id)
    if not id then return nil end
    local nm = (ns.ItemNameRaw and ns.ItemNameRaw(id)) or (C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(id)) or (GetItemInfo and GetItemInfo(id))
    if type(nm) ~= "string" or nm == "" then return nil end
    return ns.FromClient and ns.FromClient(nm) or nm
end
local function itemIcon(id)
    if not id then return nil end
    return (C_Item and C_Item.GetItemIconByID and C_Item.GetItemIconByID(id)) or (GetItemIcon and GetItemIcon(id)) or nil
end
-- 附魔名：客户端本地化名（ns.SpellNm：C_Spell.GetSpellName / GetSpellInfo，繁体照规矩转）优先，没有用数据里的中文名（DB2 SpellName zhCN）；⛔ 不用 WCL 的名字
local function enchName(e)
    local nm = ns.SpellNm and ns.SpellNm(e.spell, e.zh ~= "" and e.zh or nil, nil)
    if type(nm) == "string" and nm ~= "" and nm ~= "?" then return nm end
    return e.zh ~= "" and e.zh or ("#" .. e.spell)
end
local function spellIcon(id)
    if C_Spell and C_Spell.GetSpellTexture then local ok, t = pcall(C_Spell.GetSpellTexture, id); if ok and t then return t end end
    if GetSpellTexture then local ok, t = pcall(GetSpellTexture, id); if ok and t then return t end end
    return nil
end
local function enchIcon(e)
    return itemIcon(e.scroll) or itemIcon(e.recipe) or itemIcon(e.kit) or spellIcon(e.spell) or "Interface\\Icons\\INV_Enchant_FormulaGood_01"
end
local function pctTxt(p) return ((p == math.floor(p)) and tostring(math.floor(p)) or tostring(p)) .. "%" end
-- 怎么获得（一段话）：公式 + 来源 / 附魔训练师 / 专业制作 / 成品卷轴可交易
local function srcText(e)
    local s = ns.L(e.s or "", e.sEn or "")
    if (e.s or ""):find("待补", 1, true) then return s end   -- 来源没查到的别套「野外：」
    return ns.BisSrcText(e.how, e.s, e.sEn)
end
-- 弹框里每行第二行用的短说法（一行放得下）：最省事的那条路
local function howShort(e)
    if e.scroll then return ns.L("成品卷轴可交易，拍卖行能买", "Scroll is tradable (AH)") end
    if e.kit then return ns.L("成品可交易", "Tradable") end
    if e.trainer then return ns.L("附魔训练师可学", "Enchanting trainer") end
    if e.recipe then return ns.L("公式：", "Formula: ") .. srcText(e) end
    return ns.L("来源待补", "Source TBD")
end
local function howText(e)
    local nm, parts = enchName(e), {}
    if e.recipe then
        parts[#parts + 1] = ns.L("公式「", "Formula \"") .. (itemName(e.recipe) or nm) .. ns.L("」：", "\": ") .. srcText(e)
            .. (e.vui and ns.L("（点一下插旗）", " (click to pin)") or "")
    elseif e.trainer then
        parts[#parts + 1] = ns.L("附魔训练师可学", "Learned from an enchanting trainer")
    end
    if e.kit then
        local pz = PROF_ZH[e.prof]
        parts[#parts + 1] = (pz and (ns.L(pz[1], pz[2]) .. ns.L("制作「", " craft \"")) or ns.L("「", "\"")) .. (itemName(e.kit) or nm) .. ns.L("」", "\"")
            .. ((not pz and e.how) and (" · " .. srcText(e)) or "") .. ns.L("，可交易", ", tradable")
    end
    if e.scroll then parts[#parts + 1] = ns.L("成品卷轴「", "Scroll \"") .. (itemName(e.scroll) or nm) .. ns.L("」可交易（拍卖行能搜）", "\" is tradable (AH)") end
    if #parts == 0 then parts[1] = ns.L("来源待补", "Source TBD") end
    return table.concat(parts, ns.L("；", "; "))
end
ns._BisHowText = howText   -- 测试用

-- ---------- 身上 / 拍卖行 ----------
local function worn(inv)
    if not (GetInventorySlotInfo and GetInventoryItemLink) then return nil end
    local ok, slot = pcall(GetInventorySlotInfo, inv)
    if not ok or not slot then return nil end
    local link = GetInventoryItemLink("player", slot)
    if type(link) ~= "string" then return nil end
    local id, en = string.match(link, "item:(%d+):?(%-?%d*)")
    return { id = tonumber(id), ench = tonumber(en) or 0, slot = slot, link = link }
end
local function ahOpen()
    for _, n in ipairs({ "AuctionHouseFrame", "AuctionFrame" }) do
        local f = rawget(_G, n)
        if f and f.IsShown and f:IsShown() then return true end
    end
    return false
end
local function ahSearch(name)   -- ⛔ 只搜不买；有 Auctionator 走它的接口，否则用暴雪拍卖行的搜索框 + 搜索按钮
    if type(name) ~= "string" or name == "" or not ahOpen() then return false end
    local A = rawget(_G, "Auctionator")
    local api = type(A) == "table" and type(A.API) == "table" and A.API.v1
    if type(api) == "table" then
        local fn = api.MultiSearchExact or api.MultiSearch
        if fn and pcall(fn, "GearInsight", { name }) then return true end
    end
    local ah = rawget(_G, "AuctionHouseFrame")
    local bar = ah and ah.IsShown and ah:IsShown() and ah.SearchBar
    if bar and bar.SearchBox and bar.SearchButton then bar.SearchBox:SetText(name); bar.SearchButton:Click(); return true end
    local box, btn = rawget(_G, "BrowseName"), rawget(_G, "BrowseSearchButton")
    if box and btn then box:SetText(name); btn:Click(); return true end
    return false
end
ns._BisAHSearch = ahSearch

-- ---------- 专精：本职业全部 WCL 专精（BisData 的 S 行）+ 选中的 ----------
local function specList(cls)
    local d, out = ns.BisData and ns.BisData.d, {}
    if type(d) ~= "string" then return out end
    for ws, n, zh in string.gmatch(d, "\nS\t" .. cls .. "/(%a+)\t(%d+)\t([^\t]*)") do
        local es = enchSpec(cls .. "/" .. ws)
        out[#out + 1] = { ws = ws, full = cls .. "/" .. ws, n = tonumber(n), zh = zh, lo = es and es.lo or tonumber(n) < 30 }
    end
    return out
end
local function chosen(cls)
    local u = ns.db and ns.db.ui and ns.db.ui.bisWcl
    local ws = u and u[cls]
    if ws and ns.BisSpecRaw(cls .. "/" .. ws) then return cls .. "/" .. ws, false end
    local SG = ns.SpecGear
    local c = ns.PlanBisFor(cls, SG and SG.Available() and SG.Current(cls) or nil, 60)
    return c and c.full, true
end
local function setChosen(cls, ws)
    ns.db.ui = ns.db.ui or {}
    ns.db.ui.bisWcl = ns.db.ui.bisWcl or {}
    ns.db.ui.bisWcl[cls] = ws
end
ns._BisChosen, ns._BisSpecList = chosen, specList

-- ---------- 框体 ----------
local F, cells
local function tipHide() GameTooltip:Hide() end
local function fs(parent, tmpl, size)
    local s = parent:CreateFontString(nil, "OVERLAY", tmpl)
    s:SetWordWrap(false)
    if s.SetShadowOffset then s:SetShadowOffset(1, -1); s:SetShadowColor(0, 0, 0, 1) end
    if size and s.SetFont then pcall(s.SetFont, s, FONT, size, "") end
    return s
end
local function iconBtn(parent, sz)
    local b = CreateFrame("Button", nil, parent, BackdropTemplateMixin and "BackdropTemplate" or nil)
    b:SetSize(sz, sz)
    if b.SetBackdrop then
        b:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = sz >= 30 and 2 or 1,
            insets = { left = 1, right = 1, top = 1, bottom = 1 } })
        b:SetBackdropColor(0.06, 0.06, 0.09, 0.9)
    end
    b.icon = b:CreateTexture(nil, "ARTWORK"); b.icon:SetPoint("TOPLEFT", 2, -2); b.icon:SetPoint("BOTTOMRIGHT", -2, 2)
    b.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    if b.SetHighlightTexture then b:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD") end
    b:SetScript("OnLeave", tipHide)
    return b
end
-- 「前5」小按钮：⛔ 不用 ns.Button（套了扁平皮肤，一个十几 KB × 17 格）；按钮自带文字 + 一块底色
local function miniBtn(parent, text, onClick)
    local b = CreateFrame("Button", nil, parent)
    b:SetSize(30, 14)
    local bg = b:CreateTexture(nil, "BACKGROUND"); bg:SetAllPoints(); bg:SetColorTexture(0.25, 0.2, 0.05, 0.85)
    if b.SetNormalFontObject then b:SetNormalFontObject("GameFontNormalSmall") end
    if b.SetHighlightFontObject then b:SetHighlightFontObject("GameFontHighlightSmall") end
    b:SetText(text)
    b:SetScript("OnClick", onClick)
    return b
end
local function border(b, r, g, bb) if b.SetBackdropBorderColor then b:SetBackdropBorderColor(r, g, bb, 1) end end

local enchTip, enchClick, itemEnter, itemClick, wornEnter, wornClick
-- 一格：side = "R" 字在图标右边（左列）/ "L" 字在图标左边（右列）/ "C" 远程（图标居中，字在下面）
local function makeCell(key, inv, side)
    local c = { key = key, inv = inv, side = side, slotKey = key }
    c.worn = iconBtn(F, WSZ); c.bis = iconBtn(F, ICON); c.en = iconBtn(F, ESZ)
    c.l1, c.l2, c.l3 = fs(F, "GameFontNormalSmall", 11), fs(F, "GameFontDisableSmall", 10), fs(F, "GameFontDisableSmall", 10)
    c.hit = CreateFrame("Button", nil, F)         -- 第 1-2 行：同 BiS 图标（悬停 / 点击）
    c.ehit = CreateFrame("Button", nil, F)        -- 第 3 行：同附魔小格
    c.t5 = miniBtn(F, ns.L("前5", "Top5"), function() ns.BisShowTop(c.bis) end)
    c.bis.slotKey, c.bis.side, c.bis.cell = key, (side == "R") and "R" or "L", c
    for _, b in ipairs({ c.bis, c.hit }) do b.cell = c; b:SetScript("OnEnter", itemEnter); b:SetScript("OnClick", itemClick); b:SetScript("OnLeave", tipHide) end
    for _, b in ipairs({ c.en, c.ehit }) do
        b.cell = c; b:SetScript("OnEnter", enchTip); b:SetScript("OnClick", enchClick); b:SetScript("OnLeave", tipHide)
        if b.RegisterForClicks then b:RegisterForClicks("LeftButtonUp", "RightButtonUp") end
    end
    c.worn.cell = c; c.worn:SetScript("OnEnter", wornEnter); c.worn:SetScript("OnClick", wornClick)
    return c
end
local function placeCell(c, x, y)
    local tw = COL_W - WSZ - ICON - ESZ - 10
    for _, o in ipairs({ c.worn, c.bis, c.en, c.l1, c.l2, c.l3, c.hit, c.ehit, c.t5 }) do o:ClearAllPoints() end
    if c.side == "C" then   -- 远程：图标一排居中，三行字在下面
        c.worn:SetPoint("TOPLEFT", F, "TOPLEFT", x - 37, y - 9); c.bis:SetPoint("LEFT", c.worn, "RIGHT", 2, 0); c.en:SetPoint("LEFT", c.bis, "RIGHT", 2, 0)
        c.t5:SetPoint("LEFT", c.en, "RIGHT", 3, 0)
        for i, l in ipairs({ c.l1, c.l2, c.l3 }) do l:SetPoint("TOP", F, "TOPLEFT", x, y - 44 - (i - 1) * 13); l:SetWidth(COL_W - 70); l:SetJustifyH("CENTER") end
        c.hit:SetPoint("TOPLEFT", c.l1, "TOPLEFT"); c.hit:SetPoint("BOTTOMRIGHT", c.l2, "BOTTOMRIGHT")
        c.ehit:SetAllPoints(c.l3)
        return
    end
    local R = c.side == "R"
    local a, oa = R and "TOPLEFT" or "TOPRIGHT", R and "LEFT" or "RIGHT"
    local dir = R and 1 or -1
    c.worn:SetPoint(a, F, "TOPLEFT", x, y - 15)
    c.bis:SetPoint(a, F, "TOPLEFT", x + dir * (WSZ + 2), y - 6)
    c.en:SetPoint(a, F, "TOPLEFT", x + dir * (WSZ + ICON + 4), y - 6)
    local tx = x + dir * (WSZ + ICON + ESZ + 8)
    for i, l in ipairs({ c.l1, c.l2, c.l3 }) do
        l:SetPoint(a, F, "TOPLEFT", tx, y - 3 - (i - 1) * 14); l:SetWidth(tw); l:SetJustifyH(oa)
    end
    c.l1:SetWidth(tw - 34)
    c.t5:SetPoint(a, F, "TOPLEFT", tx + dir * (tw - 30), y - 2)
    c.hit:SetPoint(a, c.l1, a); c.hit:SetSize(tw - 34, 28)
    c.ehit:SetPoint(a, c.l3, a); c.ehit:SetSize(tw, 13)
end

local function build(gp)
    if F then return F end
    F = CreateFrame("Frame", nil, gp.page)
    F:SetPoint("TOPLEFT", 4, -72); F:SetSize(646, 396)
    local bg = F:CreateTexture(nil, "BACKGROUND", nil, -8); bg:SetAllPoints(); bg:SetColorTexture(0.03, 0.03, 0.05, 0.92)
    for _, e in ipairs({ { "TOPLEFT", "TOPRIGHT", nil, 1 }, { "BOTTOMLEFT", "BOTTOMRIGHT", nil, 1 }, { "TOPLEFT", "BOTTOMLEFT", 1, nil }, { "TOPRIGHT", "BOTTOMRIGHT", 1, nil } }) do
        local l = F:CreateTexture(nil, "BORDER"); l:SetPoint(e[1]); l:SetPoint(e[2]); l:SetColorTexture(1, 0.82, 0, 0.35)
        if e[3] then l:SetWidth(e[3]) else l:SetHeight(e[4]) end
    end
    -- 汇总行（悬停看每格明细）+ 数据来源行（悬停看口径）
    F.sum = fs(F, "GameFontHighlightSmall", 11); F.sum:SetPoint("TOPLEFT", 8, -2); F.sum:SetPoint("RIGHT", -8, 0); F.sum:SetJustifyH("LEFT")
    F.sumHit = CreateFrame("Frame", nil, F); F.sumHit:SetPoint("TOPLEFT", F.sum); F.sumHit:SetPoint("BOTTOMRIGHT", F.sum); F.sumHit:EnableMouse(true)
    F.sumHit:SetScript("OnLeave", tipHide)
    F.src = fs(F, "GameFontDisableSmall", 10); F.src:SetPoint("BOTTOM", -8, 2)
    F.srcI = F:CreateTexture(nil, "OVERLAY"); F.srcI:SetSize(13, 13); F.srcI:SetPoint("LEFT", F.src, "RIGHT", 3, 0)
    F.srcI:SetTexture("Interface\\FriendsFrame\\InformationIcon")
    F.srcHit = CreateFrame("Frame", nil, F); F.srcHit:SetPoint("TOPLEFT", F.src); F.srcHit:SetPoint("BOTTOMRIGHT", F.srcI); F.srcHit:EnableMouse(true)
    F.srcHit:SetScript("OnLeave", tipHide)
    F.srcHit:SetScript("OnEnter", function(self)
        local B, E = ns.BisData or {}, ns.EnchantData or {}
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:AddLine(ns.L("数据口径", "How these numbers are made"), 1, 0.82, 0)
        for _, t in ipairs({
            ns.L("来源：forever.warcraftlogs.com 60 级地下城日志（全球，", "Source: forever.warcraftlogs.com Lv60 dungeon logs (worldwide, ") .. (E.from or "?") .. " ~ " .. (E.to or B.date or "?") .. ns.L("，", ", ") .. (B.reports or 0) .. ns.L(" 份日志）", " reports)"),
            ns.L("合格角色：装备 ≥15 格、装等 ≥55、天赋 51 点；同名同服只取最新一份", "Qualified: 15+ slots, ilvl 55+, 51 talent points; one entry per character"),
            string.format(ns.L("只统计装等 ≥%d 的角色（全球合格角色装等中位数，取上半）：%d 人（共 %d 人）；某专精高装等不到 %d 人就用全部合格角色并标「样本少」",
                "Only characters at ilvl %d+ (the median, upper half): %d of %d; specs with fewer than %d such characters fall back to everyone (marked)"),
                E.hiIlvl or B.hiIlvl or 58, E.chars or B.chars or 0, E.charsAll or B.charsAll or 0, E.hiMin or 30),
            ns.L("热门度 = 本专精用这件 / 这个附魔的人 ÷ 本专精统计的人数（附魔悬停另写「附了魔的人里占多少」）", "Popularity = players of this spec using it / players of this spec counted"),
            string.format(ns.L("装备每格前 5（≥%d 人在穿，不够用人工清单 / 属性推算补）；附魔每格只列 ≥%d 人在用的前 %d 个", "Gear: top 5 per slot (%d+ players); enchants: top %d with %d+ players"),
                B.minN or 10, E.minN or 10, E.top or 3),
            ns.L("附魔名字 / 效果 / 怎么获得全部来自《无限》客户端数据（不用 WCL 给的正式服名字）；功能性附魔（坐骑 / 跑速 / 采集）照实统计，标「功能性」",
                "Enchant names / effects / sources come from the Forever client data; utility enchants (mount / run speed / gathering) are counted as-is and tagged"),
        }) do GameTooltip:AddLine(t, 1, 1, 1, true) end
        GameTooltip:Show()
    end)
    F.model = ns.PlanBuildModel and ns.PlanBuildModel(F)
    if F.model then F.model:SetPoint("TOPLEFT", 323 - 80, TOP_Y); F.model:SetPoint("BOTTOMRIGHT", F, "TOPLEFT", 323 + 80, TOP_Y - 6 * ROW_H + 8) end
    cells = {}
    for i, g in ipairs(LEFT) do local c = makeCell(g[1], g[2], "R"); placeCell(c, 4, TOP_Y - (i - 1) * ROW_H); cells[#cells + 1] = c end
    for i, g in ipairs(RIGHT) do local c = makeCell(g[1], g[2], "L"); placeCell(c, 642, TOP_Y - (i - 1) * ROW_H); cells[#cells + 1] = c end
    local rc = makeCell(RANGED[1], RANGED[2], "C"); placeCell(rc, 323, TOP_Y - 6 * ROW_H + 4); cells[#cells + 1] = rc
    -- 专精下拉（盖在老「天赋：自动」按钮的位置；那个按钮按插件天赋键挑，这里按 WCL 专精挑）
    F.spec = ns.Button(gp.page, "", 190, 22, function() ns._BisMenu() end)
    F.spec:SetPoint("TOPRIGHT", gp.page, "TOPRIGHT", -12, -46)
    F.spec:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
        GameTooltip:AddLine(ns.L("按哪个专精看 60 级 BiS", "Which spec's Lv60 BiS"), 1, 0.82, 0)
        GameTooltip:AddLine(ns.L("默认「自动」= 按你点数最多的那一系；点开可以换成本职业任何一个专精（括号里是统计的人数，样本少会标出来）",
            "Auto follows your most-invested tree; open to pick any spec of your class (sample size shown)"), 1, 1, 1, true)
        GameTooltip:Show()
    end)
    F.spec:SetScript("OnLeave", tipHide)
    F:Hide()
    return F
end
ns._BisFrame = function() return F, cells end   -- 测试用

-- 专精下拉菜单（自绘，⛔ 不用 UIDropDownMenu：会污染暴雪框体）
local menu
function ns._BisMenu()
    local gp, cls = ns.GearPage, ns.MyClass()
    if not menu then
        menu = CreateFrame("Frame", "GearInsightForeverBisSpec", gp.page, BackdropTemplateMixin and "BackdropTemplate" or nil)
        menu:SetFrameStrata("DIALOG"); menu:EnableMouse(true); menu:SetClampedToScreen(true)
        if menu.SetBackdrop then
            menu:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12,
                insets = { left = 3, right = 3, top = 3, bottom = 3 } })
            menu:SetBackdropColor(0.04, 0.04, 0.07, 0.97)
        end
        menu.rows = {}
        menu:Hide()   -- 新建的框体默认是显示的：不先藏，第一次点会被下面当成「已开着 → 收起」
        if UISpecialFrames then table.insert(UISpecialFrames, "GearInsightForeverBisSpec") end
    end
    if menu:IsShown() then menu:Hide(); return menu end
    local list = specList(cls)
    local cur, auto = chosen(cls)
    local items = { { ws = nil, t = ns.L("自动（按你点数最多的系）", "Auto (your main tree)"), on = auto } }
    for _, s in ipairs(list) do
        items[#items + 1] = { ws = s.ws, on = (not auto) and cur == s.full,
            t = ns.L(s.zh, SPEC_EN[s.zh] or s.ws) .. " · " .. s.n .. ns.L(" 人", "") .. (s.lo and ns.L("  |cffff8040样本少|r", "  |cffff8040small sample|r") or "") }
    end
    for i, it in ipairs(items) do
        local r = menu.rows[i]
        if not r then
            r = CreateFrame("Button", nil, menu); r:SetHeight(18); r:SetPoint("TOPLEFT", 6, -6 - (i - 1) * 18); r:SetPoint("RIGHT", -6, 0)
            r.t = r:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall"); r.t:SetPoint("LEFT", 4, 0); r.t:SetJustifyH("LEFT")
            local hl = r:CreateTexture(nil, "HIGHLIGHT"); hl:SetAllPoints(); hl:SetColorTexture(1, 1, 1, 0.1)
            menu.rows[i] = r
        end
        r.t:SetText((it.on and "|cff33ff99> |r" or "   ") .. it.t)
        r:SetScript("OnClick", function() setChosen(cls, it.ws); menu:Hide(); if ns.RefreshGearPage then ns.RefreshGearPage() end end)
        r:Show()
    end
    for i = #items + 1, #menu.rows do menu.rows[i]:Hide() end
    menu:SetSize(230, 12 + #items * 18)
    menu:ClearAllPoints(); menu:SetPoint("TOPRIGHT", F.spec, "BOTTOMRIGHT", 0, -2)
    menu:Show()
    return menu
end

-- ---------- 每格状态 ----------
-- 附魔状态：ok 已附（前 3 之一）/ cold 非热门 / miss 缺附魔 / rare 本格少有人附魔 / none 这格无附魔（或主手双手时的副手）
local function enchState(c)
    if NO_ENCH[c.key] or c.offTwo then return "none" end
    local top = c.es and c.es.top or {}
    local mine = c.w and c.w.ench or 0
    if mine > 0 then
        for i, e in ipairs(top) do
            local inf = enchInfo(e.spell)
            if inf and inf.ench == mine then return "ok", i end
        end
        return "cold"
    end
    if #top > 0 then return "miss" end
    return "rare"
end
ns._BisEnchState = enchState

local function fillCell(c, it, cur, es)
    local key = CK[c.key]
    c.it, c.top, c.es, c.w = it, cur and key and cur[key] or {}, es and es[c.key:gsub("%d$", "")] or nil, worn(c.inv)
    c.entry, c.cmp, c.eqRank = nil, nil, nil
    if it then for _, e in ipairs(c.top) do if e.id == it.id then c.entry = e end end end
    -- 物品：图标 + 品质色边框；和身上比
    if it then
        local info = ns.BisItemInfo(it.id) or {}
        local ic = (it.i and it.i ~= "") and ("Interface\\Icons\\" .. it.i) or ((info.i and info.i ~= "") and ("Interface\\Icons\\" .. info.i)) or itemIcon(it.id)
        c.bis.icon:SetTexture(ic or "Interface\\Icons\\inv_misc_questionmark"); c.bis.icon:SetDesaturated(false)
        local hex = QC[it.q or info.q] or "ffffff"
        border(c.bis, tonumber(hex:sub(1, 2), 16) / 255, tonumber(hex:sub(3, 4), 16) / 255, tonumber(hex:sub(5, 6), 16) / 255)
        if c.w and c.w.id == it.id then c.cmp = "worn"
        elseif c.w then
            for r, e in ipairs(c.top) do if e.id == c.w.id then c.eqRank = r end end
            c.cmp = c.eqRank and "inlist" or "up"
        end
        c.l1:SetText("|cff" .. hex .. ns.BisCuratedName({ id = it.id }) .. "|r")
        local pre = (c.cmp == "worn" and ("|cff66ff66" .. ns.L("已毕业", "done") .. "|r · "))
            or (c.cmp == "inlist" and ("|cffffd100" .. string.format(ns.L("身上的排第 %d", "yours #%d"), c.eqRank) .. "|r · "))
            or (c.cmp == "up" and ("|cff66ff66" .. ns.L("可升级", "upgrade") .. "|r · ")) or ""
        local pct = c.entry and (c.entry.cnt or 0) > 0 and ("|cffd8c79a" .. pctTxt(c.entry.pct) .. "|r · ") or ""
        c.l2:SetText(pre .. pct .. "|cff999999" .. ns.BisSrcText(info.how or it.how, info.s, info.sEn) .. "|r")
    else
        c.bis.icon:SetTexture("Interface\\PaperDoll\\UI-PaperDoll-Slot-" .. ((c.key == "off") and "SecondaryHand" or "Chest")); c.bis.icon:SetDesaturated(true)
        border(c.bis, 0.3, 0.3, 0.3)
        c.l1:SetText("|cff777777" .. ns.L(ns.TD(SC[key] or ""), c.key) .. "|r")
        c.l2:SetText(c.offTwo and ns.L("主手是双手武器", "Two-handed main hand") or ns.L("暂无推荐", "No pick yet"))
    end
    c.t5:SetShown(#c.top > 0 and it ~= nil)
    -- 身上那件
    if c.w then c.worn.icon:SetTexture(GetInventoryItemTexture and GetInventoryItemTexture("player", c.w.slot) or itemIcon(c.w.id)); c.worn:SetAlpha(1)
    else c.worn.icon:SetTexture("Interface\\PaperDoll\\UI-Backpack-EmptySlot"); c.worn:SetAlpha(0.5) end
    border(c.worn, 0.35, 0.35, 0.35)
    -- 附魔
    local st, rank = enchState(c)
    c.est, c.erank = st, rank
    local top1 = c.es and c.es.top[rank or 1]
    local inf = top1 and enchInfo(top1.spell)
    local rgb = STATE_RGB[st]
    border(c.en, rgb[1], rgb[2], rgb[3])
    c.en.icon:SetTexture(inf and enchIcon(inf) or "Interface\\Icons\\INV_Misc_QuestionMark"); c.en.icon:SetDesaturated(inf == nil)
    c.en:SetAlpha(st == "none" and 0.35 or 1)
    local nm = inf and (enchName(inf) .. " " .. pctTxt(top1.pct) .. (inf.func and ns.L(" |cff999999功能性|r", " |cff999999utility|r") or "")) or ""
    local t
    if st == "ok" then t = "|cff66ff66" .. ns.L("已附 ", "Enchanted ") .. "|r" .. nm .. ((rank or 1) > 1 and string.format(ns.L("（第 %d）", " (#%d)"), rank) or "")
    elseif st == "cold" then
        local t1 = c.es.top[1] and enchInfo(c.es.top[1].spell)
        t = "|cffffd100" .. ns.L("非热门", "Not popular") .. "|r" .. (t1 and (ns.L("（热门：", " (popular: ") .. enchName(t1) .. " " .. pctTxt(c.es.top[1].pct) .. ns.L("）", ")")) or "")
    elseif st == "miss" then t = "|cffff4040" .. ns.L("缺附魔：", "No enchant: ") .. "|r" .. nm
    elseif st == "rare" then t = "|cff888888" .. ns.L("本格少有人附魔", "Rarely enchanted") .. "|r"
    else t = "|cff666666" .. (c.offTwo and ns.L("（副手不用附魔）", "(no off hand)") or ns.L("（" .. ns.TD(SC[key] or "") .. "无附魔）", "(no enchants here)")) .. "|r" end
    c.l3:SetText(t)
end

-- ---------- 悬停 / 点击 ----------
itemEnter = function(self)
    local c = self.cell
    local it = c.it
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    if not it then
        GameTooltip:AddLine(ns.TD(SC[CK[c.key]] or ""), 1, 0.82, 0)
        GameTooltip:AddLine(c.offTwo and ns.L("推荐的主手是双手武器，副手用不上", "The main-hand pick is two-handed, so no off hand") or ns.L("这格暂无推荐", "No pick for this slot yet"), 0.8, 0.8, 0.8, true)
        GameTooltip:Show(); return
    end
    pcall(GameTooltip.SetItemByID, GameTooltip, it.id)
    if (GameTooltip:NumLines() or 0) == 0 then GameTooltip:AddLine(ns.BisCuratedName({ id = it.id })) end
    GameTooltip:AddLine(" ")
    local e, info = c.entry, ns.BisItemInfo(it.id) or {}
    GameTooltip:AddLine("|cff33ff99GI|r " .. string.format(ns.L("60 级 BiS 第 %d 名", "Lv60 BiS #%d"), e and e.rank or 1) .. (e and (" · " .. ns.BisStatText(e)) or ""), 1, 0.82, 0)
    GameTooltip:AddLine("|cff33ff99GI|r " .. ns.L("来源：", "Source: ") .. ns.BisSrcText(info.how or it.how, info.s, info.sEn), 1, 0.82, 0.4, true)
    if c.cmp == "worn" then GameTooltip:AddLine(ns.L("你已经穿着这件", "You're wearing this"), 0.4, 1, 0.4)
    elseif c.cmp == "inlist" then GameTooltip:AddLine(string.format(ns.L("你身上这件在前 5 里排第 %d", "What you wear is #%d in the top 5"), c.eqRank), 1, 0.82, 0)
    elseif c.cmp == "up" then GameTooltip:AddLine(ns.L("比你身上这格好（身上那件不在前 5 里）", "Upgrade (yours isn't in the top 5)"), 0.4, 1, 0.4) end
    GameTooltip:AddLine(ns.L("点击：打开装备页（掉落首领 / 任务链 / 配方）· 「前5」看这格前 5", "Click: item page - Top 5 button: this slot's top 5"), 0.6, 0.6, 0.6, true)
    GameTooltip:AddLine(ns.L("Shift + 点击：发到聊天框 · Ctrl + 点击：试穿", "Shift-click: link in chat - Ctrl-click: try on"), 0.6, 0.6, 0.6)
    GameTooltip:Show()
end
itemClick = function(self)
    local it = self.cell.it
    if not it then return end
    if ns.ItemModClick and ns.ItemModClick(it.id, ns.BisCuratedName({ id = it.id })) then return end
    ns.BisOpenItem(it.id)
end
wornEnter = function(self)
    local c = self.cell
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    if c.w and GameTooltip.SetInventoryItem then pcall(GameTooltip.SetInventoryItem, GameTooltip, "player", c.w.slot)
    else GameTooltip:AddLine(ns.L("身上这格是空的", "Nothing equipped here"), 0.8, 0.8, 0.8) end
    GameTooltip:AddLine(ns.L("你身上这格（Shift + 点击：发到聊天框）", "What you wear (Shift-click: link)"), 0.6, 0.6, 0.6)
    GameTooltip:Show()
end
wornClick = function(self)
    local c = self.cell
    if c.w and IsShiftKeyDown and IsShiftKeyDown() and ChatEdit_InsertLink then ChatEdit_InsertLink(c.w.link) end
end

-- 本格附魔前 3 的几行字（悬停 / 详情共用）
local function topLines(c)
    local out = {}
    for i, e in ipairs(c.es and c.es.top or {}) do
        local inf = enchInfo(e.spell)
        if inf then
            out[#out + 1] = string.format("%d. %s  %s" .. ns.L("（附了魔的人里 %s）", " (%s of enchanted)"), i, enchName(inf), pctTxt(e.pct), pctTxt(e.pctE))
                .. (inf.func and ns.L(" |cff999999功能性|r", " |cff999999utility|r") or "") .. ((c.est == "ok" and c.erank == i) and ns.L("  |cff66ff66你已附|r", "  |cff66ff66yours|r") or "")
        end
    end
    return out
end
local function curEnch(c, i)
    local e = c.es and c.es.top[i or c.show or c.erank or 1]
    return e and enchInfo(e.spell), e
end
enchTip = function(self, cc)   -- cc：详情面板某一行（看第 show 个附魔）；不给 = 这一格
    local c = cc or self.cell
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    local inf = curEnch(c)
    if inf then
        local ok = GameTooltip.SetSpellByID and pcall(GameTooltip.SetSpellByID, GameTooltip, inf.spell)
        if not ok or (GameTooltip:NumLines() or 0) == 0 then GameTooltip:AddLine(enchName(inf), 1, 1, 1); GameTooltip:AddLine(inf.eff, 0.9, 0.9, 0.9, true) end
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff33ff99GI|r " .. ns.L("怎么获得：", "How to get: ") .. howText(inf), 1, 0.82, 0.4, true)
        if inf.func then GameTooltip:AddLine(ns.L("功能性附魔（坐骑 / 跑速 / 采集），统计照实排", "Utility enchant (mount / run speed / gathering), ranked as-is"), 0.6, 0.6, 0.6, true) end
    else
        GameTooltip:AddLine(ns.L("附魔", "Enchant"), 1, 0.82, 0)
    end
    local spec = (ns.GearPage or {}).curTop or {}
    local ses = enchSpec(spec.full or "")
    if c.es and #c.es.top > 0 then
        GameTooltip:AddLine("|cff33ff99GI|r " .. string.format(ns.L("本格热门附魔（%s，%d 人统计，%d 人附了魔）", "Popular here (%s, %d players, %d enchanted)"),
            ns.L(spec.zh or "", (spec.full or ""):match("/(.+)$") or ""), ses and ses.n or 0, c.es.k), 1, 0.82, 0)
        for _, l in ipairs(topLines(c)) do GameTooltip:AddLine(l, 1, 1, 1) end
    end
    local st = c.est
    local mine = st == "ok" and ns.L("已附热门附魔", "popular enchant applied") or st == "cold" and ns.L("附了，但不在本格前 3", "enchanted, but not a top-3 pick")
        or st == "miss" and ns.L("没附魔", "not enchanted") or st == "rare" and ns.L("本格少有人附魔（没有一个附魔 ≥10 人在用）", "rarely enchanted (no enchant with 10+ players)")
        or ns.L("这格没有附魔", "no enchants for this slot")
    GameTooltip:AddLine(ns.L("你身上：", "Yours: ") .. mine, STATE_RGB[st][1], STATE_RGB[st][2], STATE_RGB[st][3], true)
    if inf then GameTooltip:AddLine(ns.L("点击：附魔详情（拍卖行开着 = 直接搜）· Shift + 点击：配方 / 卷轴发到聊天框", "Click: details (AH open = search) - Shift-click: link the formula / scroll"), 0.6, 0.6, 0.6, true) end
    GameTooltip:Show()
end
-- 一个附魔的「动作」：Shift = 链接；拍卖行开着 = 搜；商人配方 = 插旗；返回做了什么（测试用）
local function enchAct(inf)
    if not inf then return nil end
    local id = inf.scroll or inf.recipe or inf.kit
    if IsShiftKeyDown and IsShiftKeyDown() then
        if id and ns.ItemModClick then ns.ItemModClick(id, itemName(id) or enchName(inf)) end
        return "link"
    end
    if ahOpen() then
        local nm = itemName(inf.scroll) or itemName(inf.kit) or itemName(inf.recipe) or enchName(inf)
        ahSearch(nm)
        return "ah"
    end
    if inf.vui and ns.ShowOnMap then
        ns.ShowOnMap(inf.vui, { { inf.vx, inf.vy } }, ns.L("公式：", "Formula: ") .. enchName(inf))
        return "map"
    end
    return nil
end
ns._BisEnchAct = enchAct
local function detail(c)
    local spec = (ns.GearPage or {}).curTop or {}
    local es = enchSpec(spec.full or "")
    local rows, lines = {}, topLines(c)
    for i, e in ipairs(c.es and c.es.top or {}) do
        local inf = enchInfo(e.spell)
        if inf then
            rows[#rows + 1] = { ic = enchIcon(inf), t = lines[#rows + 1], s = inf.eff .. " · " .. howShort(inf), data = inf,
                enter = function(self) enchTip(self, { es = c.es, est = c.est, erank = c.erank, show = i, key = c.key }) end,
                click = function(self) enchAct(rawget(self, "giData")) end }
        end
    end
    local inf = curEnch(c, 1)
    -- 11-26 用户截图「UI」：说明分行（公式 / 成品各一行），操作提示灰字单独一行；框高跟着说明长（BisTop pop）
    local note = inf and ("|cffffd100" .. ns.L("第 1 名怎么获得", "How to get #1") .. "|r\n" .. (howText(inf):gsub(ns.L("；", "; "), "\n")) .. "\n|cff8c8c8c"
        .. ns.L("点一行：拍卖行开着直接搜 / 商人卖的公式插旗 · Shift + 点击发链接", "Click a row: search the AH (when open) / pin the vendor - Shift-click to link") .. "|r")
        or ns.L("本格少有人附魔：没有一个附魔 ≥10 人在用", "Rarely enchanted: no enchant with 10+ players")
    local f = ns.BisPop(string.format(ns.L("附魔 · %s（%s，%d 人）", "Enchants - %s (%s, %d players)"), ns.L(ns.TD(SC[CK[c.key]] or ""), c.key),
        ns.L(spec.zh or "", (spec.full or ""):match("/(.+)$") or ""), es and es.n or 0), rows, note)
    f:ClearAllPoints()
    if c.side == "L" then f:SetPoint("TOPRIGHT", c.en, "BOTTOMRIGHT", 0, -2) else f:SetPoint("TOPLEFT", c.en, "BOTTOMLEFT", 0, -2) end
    return f
end
ns._BisEnchDetail = detail
enchClick = function(self)
    local c = self.cell
    if c.est == "none" then return end
    local inf = curEnch(c)
    if (IsShiftKeyDown and IsShiftKeyDown()) or ahOpen() then return enchAct(inf) end
    return detail(c)
end

-- ---------- 汇总 ----------
local function summary(list)
    local n, done, z, ok, miss, cold = 0, 0, 0, 0, 0, 0
    for _, c in ipairs(list) do
        if c.it then n = n + 1; if c.cmp == "worn" then done = done + 1 end end
        if c.est ~= "none" and c.es and #c.es.top > 0 then z = z + 1 end
        if c.est == "ok" then ok = ok + 1 elseif c.est == "miss" then miss = miss + 1 elseif c.est == "cold" then cold = cold + 1 end
    end
    return n, done, z, ok, miss, cold
end
ns._BisSummary = summary

function ns.Bis60Render(gp, tgt)
    local cls = ns.MyClass()
    local full, auto = chosen(cls)
    local cur = full and ns.BisSpecRaw(full)
    if not cur or not gp or not gp.page then return false end
    build(gp)
    local es = enchSpec(full)
    gp.gearFrame:Hide(); if gp.specBtn then gp.specBtn:Hide() end
    F:Show(); F.spec:Show()
    local sub = rawget(gp.page, "_sub")   -- 页面标题旁的说明（ns.PageHeader 建的）：60 视图换成 GearInsight 品牌色标题，回 < 60 级还原
    if sub then
        if not rawget(F, "giSubOrig") then rawset(F, "giSubOrig", sub:GetText() or "") end
        sub:SetText("|cff33ff99GearInsight|r " .. ns.L("60 级 BiS：正式服样式（装备 + 附魔，WCL 高装等实测）", "Lv60 BiS: retail-style gear + enchants (WCL, high ilvl)"))
    end
    gp.curTop, gp.curLv, gp.curSpec, gp.curAlts = cur, tgt, nil, {}
    local picks = ns.BisPicks(cur, cls)
    local mainTwo = picks.main and (picks.main.two or (ns.BisItemInfo(picks.main.id) or {}).two)
    for _, c in ipairs(cells) do
        c.offTwo = (c.key == "off" and mainTwo and not picks.off) or nil
        fillCell(c, picks[c.key], cur, es)
    end
    local n, done, z, ok, miss, cold = summary(cells)
    F.sum:SetText("|cff33ff99GI|r " .. string.format(ns.L("已毕业 |cffffffff%d/%d|r 格 · 附魔 |cffffffff%d/%d|r", "Done |cffffffff%d/%d|r - enchants |cffffffff%d/%d|r"), done, n, ok, z)
        .. (miss > 0 and string.format(ns.L(" · |cffff4040缺附魔 %d 格|r", " · |cffff4040%d missing|r"), miss) or "")
        .. (cold > 0 and string.format(ns.L(" · |cffffd100附魔不是热门 %d 格|r", " · |cffffd100%d not popular|r"), cold) or "")
        .. ns.L("（悬停看明细）", " (hover)"))
    F.sumHit:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
        GameTooltip:AddLine(ns.L("每格对照（你身上 vs 60 级 BiS）", "Per slot (you vs Lv60 BiS)"), 1, 0.82, 0)
        for _, c in ipairs(cells) do
            if c.it or c.est ~= "none" then
                local g = c.cmp == "worn" and ns.L("|cff66ff66已毕业|r", "|cff66ff66done|r") or c.cmp == "inlist" and string.format(ns.L("|cffffd100前 5 第 %d|r", "|cffffd100#%d|r"), c.eqRank)
                    or c.it and ns.L("可升级", "upgrade") or "-"
                local e = c.est == "ok" and ns.L("|cff66ff66已附|r", "|cff66ff66ok|r") or c.est == "miss" and ns.L("|cffff4040缺附魔|r", "|cffff4040missing|r")
                    or c.est == "cold" and ns.L("|cffffd100非热门|r", "|cffffd100not popular|r") or c.est == "rare" and ns.L("|cff888888少有人附|r", "|cff888888rare|r") or ""
                GameTooltip:AddDoubleLine(ns.L(ns.TD(SC[CK[c.key]] or ""), c.key) .. (c.key:find("2", 1, true) and " 2" or ""), g .. (e ~= "" and (" · " .. e) or ""), 1, 1, 1, 1, 1, 1)
            end
        end
        GameTooltip:Show()
    end)
    local B, E = ns.BisData or {}, ns.EnchantData or {}
    F.src:SetText(string.format(ns.L("数据：WCL 无限 60 级地下城 · 装等 ≥%d · %s %d 人（全部合格 %d 人）· %d 份日志 · %s~%s",
        "Data: WCL Forever Lv60 dungeons - ilvl %d+ - %s %d players (of %d) - %d reports - %s~%s"),
        E.hiIlvl or B.hiIlvl or 58, ns.L(cur.zh, (cur.full or ""):match("/(.+)$") or ""), cur.n or 0, es and es.nAll or 0, B.reports or 0,
        (E.from or ""):sub(6), (E.to or B.date or ""):sub(6)) .. ((es and es.lo) and ns.L("  |cffff8040样本少：用了全部合格角色|r", "  |cffff8040small sample: all players|r") or ""))
    local sl = specList(cls)
    local me
    for _, s in ipairs(sl) do if s.full == full then me = s end end
    F.spec:SetText(ns.L("专精：", "Spec: ") .. ns.L(cur.zh or "", SPEC_EN[cur.zh] or (full:match("/(.+)$") or "")) .. " · " .. (cur.n or 0) .. ns.L(" 人", "")
        .. ((me and me.lo) and ns.L(" 少", " !") or "") .. (auto and ns.L("（自动）", " (auto)") or "") .. " ▼")
    if F.model then
        pcall(F.model.SetUnit, F.model, "player")
        if F.model.TryOn then
            if F.model.Dress then pcall(F.model.Dress, F.model) end
            for _, it in pairs(picks) do if type(it) == "table" and it.id then pcall(F.model.TryOn, F.model, "item:" .. it.id) end end
        end
    end
    return true
end

function ns.Bis60Hide(gp)
    if not F then return end
    F:Hide(); F.spec:Hide()
    if menu then menu:Hide() end
    local sub = gp and gp.page and rawget(gp.page, "_sub")
    if sub and rawget(F, "giSubOrig") then sub:SetText(rawget(F, "giSubOrig")) end
    if gp and gp.gearFrame then gp.gearFrame:Show() end
end

ns._bisReady = true

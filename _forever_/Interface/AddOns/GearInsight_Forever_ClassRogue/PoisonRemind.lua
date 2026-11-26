-- HOLD：盗贼毒药提醒（11-25 群友「老大把贼的毒药单独……提醒毒快没了……食物BUFF类 扯开来」）
--   原来：毒药挂在武器上算「临时附魔」，被内核 XpCheck.lua「药剂/武器油」（kit）那一项当成「武器油」一起算（练级 BUFF 检查器里），
--     到期提醒也跟食物 / 药剂一个节奏（剩 3 分钟才说），盗贼两把武器只看主手、副手没毒不管、背包毒药够不够也不管。
--   现在：毒药单独一类（这个文件，盗贼专属子插件 GearInsight_Forever_ClassRogue，只有盗贼登录才加载）：
--     ① 主手 / 副手各看一遍（GetWeaponEnchantInfo：有没有 / 剩余毫秒 / 剩余次数 / 附魔 ID），任一把没上毒 → 提醒；
--        剩余 < 5 分钟 或 剩余次数 < 20 → 「主手毒药快没了（剩 X 分 / Y 次）」（阈值可改；致残 / 解离这类没有次数的只看时间）
--     ② 背包里正在用的那种毒药（各等级合计）< 10 瓶 → 提醒补货（毒药商买材料用「毒药」技能做，或拍卖行）
--     ③ 战斗中不弹框：只在屏幕上方一行字 + 浮标变色，脱战后再在聊天框说；同一件事 5 分钟内不重复（在主城 / 旅店里没上毒只说一次）
--     ④ 进 5 人本 / 团本、就位确认（READY_CHECK）时汇总一次（剩不到 10 分钟也说）
--     ⑤ 浮标：主手 / 副手两个圆形毒药图标 + 剩余时间（GI 品牌标），够用 = 金边、快没了 = 黄、没上 = 红；右键永久关闭，「窗口与提醒」找回
--   内核 XpCheck.lua 一行不改：这里给 XC.Kit 包一层，P.Owns()（学会了毒药 / 武器上就是毒药）为真时「药剂/武器油」不再管武器那份 → 食物 BUFF 类不再含毒药，其余行为不变。
--   毒药数据：《无限》客户端 DB2 1.60.1.70790（ItemSparse / ItemXItemEffect → SpellEffect 360 / 54 → SpellItemEnchantment 的 ID / 次数 / 30 分钟），
--     「毒药」技能 2842（SpellName）；⛔ 不读任何第三方插件数据。
-- ⛔ 每个 API 都 pcall / 判空、保密值不碰；不注册 COMBAT_LOG_EVENT_UNFILTERED；不替玩家上毒（受保护操作，也不该替）；不发任何密语。
local _, ns = ...; ns = _G.GearInsightForever or ns
if not ns or select(2, UnitClass("player")) ~= "ROGUE" then return end

local P = {}
ns.PoisonRemind = P
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function none() end
local function secret(v) return v ~= nil and ns.Secret ~= nil and ns.Secret(v) end
local function clean(v) if v == nil or secret(v) then return nil end return v end
local function num(v) v = clean(v); return v ~= nil and tonumber(v) or nil end
local function now() return (GetTime and GetTime()) or 0 end
local function inCombat() local ok, v = pcall(InCombatLockdown or none); return ok and clean(v) and true or false end
P.clean, P.num = clean, num

-- ---------- 设置（存档 ns.db.poison）----------
P.DEF = { min = 5, charges = 20, stock = 10, gap = 5 }   -- 剩几分钟 / 剩几次 / 背包少于几瓶 / 同一件事隔几分钟再说
P.PRE_MIN = 10        -- 进副本 / 就位确认：剩不到 10 分钟也说一声
P.SKILL = 2842        -- 「毒药」技能（20 级盗贼毒药任务学会）
P.KEYS = "毒药 毒 poison 盗贼 贼 rogue"   -- 设置搜索词
function P.DB()
    if type(ns.db) ~= "table" then return {} end
    if type(ns.db.poison) ~= "table" then ns.db.poison = {} end
    return ns.db.poison
end
function P.On() return ns.db ~= nil and P.DB().on ~= false end
function P.OrbOn() return P.DB().orb ~= false end
function P.Always() return P.DB().always ~= false end
function P.Get(k)
    local v = tonumber(P.DB()[k])
    if v and v >= 0 then return v end
    return P.DEF[k]
end
function P.Set(k, v)
    v = tonumber(v)
    if v and v >= 0 and v ~= P.DEF[k] then P.DB()[k] = math.floor(v) else P.DB()[k] = nil end
    P.Check("set")
end

-- ---------- 毒药数据（物品:附魔:要求等级:类:中文名；DB2 1.60.1.70790 核对）----------
--   类：i 速效 / d 致命 / c 致残 / m 麻痹 / w 致伤 / x 其他（《无限》新加的解离 / 迟钝 / 萎缩 / 玄秘）
P.SRC = "6947:323:20:i:速效毒药;6949:324:28:i:速效毒药 II;6950:325:36:i:速效毒药 III;8926:623:44:i:速效毒药 IV;8927:624:52:i:速效毒药 V;8928:625:60:i:速效毒药 VI;"
    .. "2892:7:30:d:致命毒药;2893:8:38:d:致命毒药 II;8984:626:46:d:致命毒药 III;8985:627:54:d:致命毒药 IV;20844:2630:60:d:致命毒药 V;"
    .. "3775:22:20:c:致残毒药;3776:603:50:c:致残毒药 II;5237:35:24:m:麻痹毒药;6951:23:38:m:麻痹毒药 II;9186:643:52:m:麻痹毒药 III;"
    .. "10918:703:32:w:致伤毒药;10920:704:40:w:致伤毒药 II;10921:705:48:w:致伤毒药 III;10922:706:56:w:致伤毒药 IV;"
    .. "217345:7254:60:x:解离毒药;217346:7255:60:x:迟钝毒药;217347:7256:60:x:萎缩毒药;226374:7542:54:x:玄秘毒药 I;234444:7651:60:x:玄秘毒药 II"
P.FAM = { i = { "速效毒药", "Instant Poison", 132273 }, d = { "致命毒药", "Deadly Poison", 132290 }, c = { "致残毒药", "Crippling Poison", 132274 },
    m = { "麻痹毒药", "Mind-numbing Poison", 136066 }, w = { "致伤毒药", "Wound Poison", 134197 }, x = { "毒药", "Poison", 132108 } }
P.EN_X = { [217345] = "Sebacious Poison", [217346] = "Numbing Poison", [217347] = "Atrophic Poison", [226374] = "Occult Poison I", [234444] = "Occult Poison II" }
local list, byEnch
function P.Data()
    if not list then
        list, byEnch = {}, {}
        for item, ench, lv, fam, zh in P.SRC:gmatch("(%d+):(%d+):(%d+):(%a):([^;]+)") do
            local e = { item = tonumber(item), ench = tonumber(ench), lv = tonumber(lv), fam = fam, zh = zh }
            e.en = P.EN_X[e.item] or (P.FAM[fam][2] .. (zh:match("( [IVX]+)$") or ""))
            list[#list + 1] = e
            byEnch[e.ench] = e
        end
    end
    return list, byEnch
end
function P.ByEnch(id)
    id = num(id)
    if not id then return nil end
    local _, b = P.Data()
    return b[id]
end
function P.IsPoison(id) return P.ByEnch(id) ~= nil end
function P.Name(e)
    if not e then return L("毒药", "Poison") end
    return L(e.zh, e.en)
end
function P.FamName(f) local t = P.FAM[f or "x"] or P.FAM.x; return L(t[1], t[2]) end
function P.Icon(e) return (P.FAM[(e and e.fam) or "x"] or P.FAM.x)[3] end

-- ---------- 读状态 ----------
local function bagCount(id)
    local ok, n = pcall((C_Item and C_Item.GetItemCount) or GetItemCount or none, id)
    return (ok and num(n)) or 0
end
P.BagCount = bagCount
local function equipped(slot)
    local ok, id = pcall(GetInventoryItemID or none, "player", slot)
    return ok and num(id) or nil
end
-- 副手拿的是不是武器（盾 / 副手物品不算）；读不到类型 = 当武器
local function isWeapon(id)
    local f = (C_Item and C_Item.GetItemInfoInstant) or GetItemInfoInstant
    if not f then return true end
    local ok, _, _, _, _, _, cls = pcall(f, id)
    cls = ok and num(cls)
    if not cls then return true end
    return cls == 2
end
local function grab(...) return select("#", ...), { ... } end
-- → { mh = hand, oh = hand }（没拿武器的那只手 = nil）；整个读不到 = nil
--   hand：{ has = 有临时附魔, left = 剩余秒, ch = 剩余次数, ench = 附魔 ID, e = 毒药数据, unknown = 读到保密值 }
function P.Read()
    if not GetWeaponEnchantInfo then return nil end
    local n, r = grab(pcall(GetWeaponEnchantInfo))
    if not r[1] or n < 2 then return nil end
    local out = {}
    for i, key in ipairs({ "mh", "oh" }) do
        local slot = i == 1 and 16 or 17
        local id = equipped(slot)
        if id and (i == 1 or isWeapon(id)) then
            local b = (i - 1) * 4 + 2
            local has, exp, ch, ench = r[b], r[b + 1], r[b + 2], r[b + 3]
            local h = { slot = slot, item = id }
            if secret(has) or secret(exp) or secret(ch) or secret(ench) then
                h.unknown = true
            else
                h.has = has and true or false
                if h.has then
                    exp, ch = tonumber(exp), tonumber(ch)
                    h.left = (exp and exp > 0) and exp / 1000 or nil
                    h.ch = (ch and ch > 0) and ch or nil
                    h.ench = tonumber(ench)
                    h.e = h.ench and P.ByEnch(h.ench) or nil
                    h.other = h.ench ~= nil and h.ench > 0 and h.e == nil   -- 磨刀石 / 平衡石等别的临时附魔
                end
            end
            out[key] = h
        end
    end
    return out
end

-- 学会了毒药：「毒药」技能 / 背包里有毒药 / 武器上现在就是毒药
local function knowsSpell()
    for _, f in ipairs({ IsPlayerSpell or false, IsSpellKnown or false }) do
        if f then
            local ok, v = pcall(f, P.SKILL)
            if ok and clean(v) then return true end
        end
    end
    return false
end
local stockCache, stockAt = nil, -999
function P.Stock(force)
    if force or not stockCache or now() - stockAt > 60 then
        local t = { total = 0, fam = {}, best = {} }
        for _, e in ipairs((P.Data())) do
            local c = bagCount(e.item)
            if c > 0 then
                t.total = t.total + c
                t.fam[e.fam] = (t.fam[e.fam] or 0) + c
                if not t.best[e.fam] or e.lv > t.best[e.fam].lv then t.best[e.fam] = e end
            end
        end
        stockCache, stockAt = t, now()
    end
    return stockCache
end
function P.Knows(hands)
    if knowsSpell() then return true end
    if P.Stock().total > 0 then return true end
    hands = hands or P.Read()
    return hands ~= nil and ((hands.mh and hands.mh.e ~= nil) or (hands.oh and hands.oh.e ~= nil)) or false
end
-- 内核 XpCheck.lua 用：毒药归这里管 → 「药剂/武器油」不再算武器那份
function P.Owns()
    local ok, v = pcall(P.Knows)
    return ok and v and true or false
end

-- 拆分（「食物BUFF类 扯开来」）：内核 XpCheck.lua「药剂/武器油」（kit）原来把武器上的毒药当「武器油」算（剩 3 分钟才提醒、只看主手）→
--   学会毒药后武器那份归这里，「药剂/武器油」只剩药剂；没学毒药（20 级前用磨刀石）照旧。内核一行不改（省登录内存），在这里给 XC.Kit 包一层
local XC = ns.XpCheck
if XC and type(XC.Kit) == "function" and not XC._poisonWrap then
    local kit0 = XC.Kit
    XC._poisonWrap = kit0
    XC.Kit = function(got, lv)
        local out = kit0(got, lv)
        if type(out) == "table" and out.wp ~= nil and P.Owns() then out.wp = nil end
        return out
    end
end

-- 一只手的档：miss 没上毒 / low 快没了 / ok / other 别的临时附魔（不提醒）/ nil 读不到
function P.Level(h)
    if not h or h.unknown then return nil end
    if not h.has then return "miss" end
    if h.other then return "other" end
    if h.left and h.left < P.Get("min") * 60 then return "low" end
    if h.ch and h.ch < P.Get("charges") then return "low" end
    return "ok"
end
local RANK = { ok = 0, other = 0, stock = 1, low = 2, miss = 3 }
P.RANK = RANK

-- → { hands, knows, stock, lv = { mh, oh }, low = { 类 → 瓶数 }, worst }；不是盗贼 / 两手都没武器 → nil
function P.State()
    local hands = P.Read()
    if not hands or not (hands.mh or hands.oh) then return nil end
    local st = { hands = hands, knows = P.Knows(hands), stock = P.Stock(), lv = {}, low = {}, worst = 0 }
    local db = P.DB()
    db.last = type(db.last) == "table" and db.last or {}
    for _, k in ipairs({ "mh", "oh" }) do
        local h = hands[k]
        if h and h.e then db.last[k] = h.e.fam end   -- 记下这只手上次用的哪类（没上毒时说「包里还有 N 瓶」）
        local lv = h and P.Level(h)
        if lv == "miss" and not st.knows then lv = nil end   -- 还没学毒药：没上毒不算缺
        st.lv[k] = lv
        if lv and RANK[lv] > st.worst then st.worst = RANK[lv] end
    end
    if st.knows then
        -- 补货：两只手上（或上次）用的那几类，背包里各自合计
        local fams = {}
        for _, k in ipairs({ "mh", "oh" }) do
            local h = hands[k]
            local f = (h and h.e and h.e.fam) or (h and db.last[k]) or nil
            if f then fams[f] = true end
        end
        local th = P.Get("stock")
        for f in pairs(fams) do
            local c = st.stock.fam[f] or 0
            if th > 0 and c < th then st.low[f] = c; if st.worst < 1 then st.worst = 1 end end
        end
    end
    return st
end

-- ---------- 文案 ----------
local function fmtLeft(sec)
    if not sec then return nil end
    if sec >= 60 then return string.format(L("%d 分", "%d min"), math.floor(sec / 60 + 0.5)) end
    return string.format(L("%d 秒", "%d s"), math.floor(sec))
end
local function short(sec)
    if not sec then return nil end
    if sec >= 60 then return string.format("%dm", math.floor(sec / 60 + 0.5)) end
    return string.format("%ds", math.floor(sec))
end
P.FmtLeft = fmtLeft
local function handName(k) return k == "oh" and L("副手", "Off-hand") or L("主手", "Main-hand") end
P.HandName = handName
function P.LeftText(h)
    local t = {}
    if h.left then t[#t + 1] = fmtLeft(h.left) end
    if h.ch then t[#t + 1] = string.format(L("%d 次", "%d charges"), h.ch) end
    return table.concat(t, " / ")
end
P.HOW = function()
    return L("去毒药商（主城盗贼训练师附近）买材料，打开「毒药」技能自己做；或拍卖行搜「毒药」",
        "Buy reagents from a poison vendor (near rogue trainers in capitals) and craft them with your Poisons skill, or search the AH")
end
P.APPLY = function() return L("背包里右键毒药，再点武器（战斗中不能上）", "Right-click the poison in your bags, then click the weapon (not in combat)") end
-- → { { key, lv, text, top } }
function P.Issues(st)
    local out = {}
    if not st then return out end
    local db = P.DB()
    for _, k in ipairs({ "mh", "oh" }) do
        local lv, h = st.lv[k], st.hands[k]
        if lv == "miss" then
            local f = type(db.last) == "table" and db.last[k] or nil
            local have = f and st.stock.best[f]
            local tail
            if have then tail = string.format(L("（包里有%s ×%d：%s）", " (%s x%d in bags: %s)"), P.Name(have), st.stock.fam[f] or 0, P.APPLY())
            elseif st.stock.total > 0 then tail = L("（包里有毒药：", " (poison in bags: ") .. P.APPLY() .. L("）", ")")
            else tail = L("（包里没毒药了：", " (none in bags: ") .. P.HOW() .. L("）", ")") end
            out[#out + 1] = { key = k .. ":miss", lv = lv, text = string.format(L("%s没上毒药", "%s has no poison"), handName(k)) .. tail,
                top = string.format(L("%s没上毒药", "%s: no poison"), handName(k)) }
        elseif lv == "low" then
            local lt = P.LeftText(h)
            out[#out + 1] = { key = k .. ":low", lv = lv,
                text = string.format(L("%s毒药快没了（剩 %s）", "%s poison running out (%s left)"), handName(k), lt) .. L("：", ": ") .. P.APPLY(),
                top = string.format(L("%s毒药快没了（剩 %s）", "%s poison low (%s)"), handName(k), lt) }
        end
    end
    local th = P.Get("stock")
    for f, c in pairs(st.low) do
        local fn = P.FamName(f)
        out[#out + 1] = { key = "stock:" .. f, lv = "stock",
            text = L(string.format("%s只剩 %d 瓶了（少于 %d 瓶），该补货：", fn, c, th), string.format("Only %d %s left (under %d) - restock: ", c, fn, th)) .. P.HOW(),
            top = L(string.format("%s只剩 %d 瓶", fn, c), string.format("%s: %d left", fn, c)) }
    end
    return out
end

-- ---------- 提醒：聊天框 + 屏幕上方一行（战斗中只出一行字，脱战补说）----------
local told, pend = {}, {}
P._told, P._pend = told, pend
local function top(msg, lv)
    if UIErrorsFrame and UIErrorsFrame.AddMessage then
        pcall(UIErrorsFrame.AddMessage, UIErrorsFrame, msg, 1, (lv == "miss") and 0.25 or 0.82, 0.1)
    end
end
P.Top = top
local function say(it)
    ns.Print(it.text .. L("  |cff9a9a9a/gi 毒药 看详情；设置里搜「毒药」可改阈值 / 关掉|r", "  |cff9a9a9a/gi poison for details; search \"poison\" in Settings to change|r"))
    top(it.top, it.lv)
    if P.DB().sound and PlaySound then pcall(PlaySound, 8959) end
end
local function resting() local ok, v = pcall(IsResting or none); return ok and clean(v) and true or false end
function P.Check(why)
    if not ns.db then return end
    if not P.On() then P.Draw(nil); return end
    local st = P.State()
    P.Draw(st)
    if not st then return end
    local live, gap, t = {}, P.Get("gap") * 60, now()
    local fight = inCombat()
    for _, it in ipairs(P.Issues(st)) do
        live[it.key] = true
        local last = told[it.key]
        -- 在主城 / 旅店里没上毒：说一次就够（正在补）；其余隔 gap 再说
        local again = last and not (it.lv == "miss" and resting()) and gap > 0 and t - last >= gap
        if not last or again then
            if fight then
                if not pend[it.key] then pend[it.key] = true; top(it.top, it.lv) end
            else
                pend[it.key] = nil
                told[it.key] = t
                say(it)
            end
        end
    end
    for k in pairs(told) do if not live[k] then told[k] = nil end end
    for k in pairs(pend) do if not live[k] then pend[k] = nil end end
    return st
end

-- 进副本 / 就位确认：汇总一次（有问题，或剩不到 10 分钟）
function P.PreCheck(why)
    if not (ns.db and P.On()) then return false end
    local st = P.State()
    if not st or not st.knows then return false end
    local parts, bad = {}, false
    for _, k in ipairs({ "mh", "oh" }) do
        local h, lv = st.hands[k], st.lv[k]
        if h and lv then
            if lv == "miss" then parts[#parts + 1] = handName(k) .. L("没上毒", ": none"); bad = true
            elseif lv ~= "other" then
                parts[#parts + 1] = handName(k) .. " " .. P.Name(h.e) .. " " .. P.LeftText(h)
                if lv == "low" or (h.left and h.left < P.PRE_MIN * 60) then bad = true end
            end
        end
    end
    for f, c in pairs(st.low) do parts[#parts + 1] = string.format(L("%s只剩 %d 瓶", "%s: %d left"), P.FamName(f), c); bad = true end
    if not bad then return false end
    local head = why == "ready" and L("就位确认 · 毒药：", "Ready check - poisons: ") or L("进副本 · 毒药：", "Instance - poisons: ")
    ns.Print(head .. table.concat(parts, L("；", "; ")) .. L("  |cff9a9a9a开打前补一下|r", "  |cff9a9a9arefresh before the pull|r"))
    top(head .. table.concat(parts, L("；", "; ")), "low")
    return true
end

-- ---------- 浮标：主手 / 副手两个圆形毒药图标 + 剩余时间 ----------
local win
local ui = {}
P.ui = ui
local MASK = "Interface\\CharacterFrame\\TempPortraitAlphaMask"
local function circle(owner, tex)
    if not (tex.AddMaskTexture and owner.CreateMaskTexture) then return end
    local m = owner:CreateMaskTexture()
    if not m then return end
    m:SetTexture(MASK, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    m:SetAllPoints(tex)
    tex:AddMaskTexture(m)
end
local function savePos()
    if not win then return end
    local p, _, _, x, y = win:GetPoint()
    P.DB().pos = { p or "CENTER", x or 0, y or 0 }
end
function P.SetOn(v) P.DB().on = v and true or false; P.Check("set") end
function P.SetOrb(v) P.DB().orb = v and true or false; P.Check("set") end
function P.SetAlways(v) P.DB().always = v and true or false; P.Check("set") end
function P.ResetPos()
    P.DB().pos = nil
    if win then win:ClearAllPoints(); win:SetPoint("CENTER", UIParent, "CENTER", 120, -210) end
end
local function tip(self)
    if not GameTooltip then return end
    local st = P.State()
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:AddLine("|cff33ff99GearInsight|r · " .. L("盗贼毒药", "Rogue poisons"), 1, 0.82, 0)
    for _, k in ipairs({ "mh", "oh" }) do
        local h = st and st.hands[k]
        local lv = st and st.lv[k]
        if h then
            local txt
            if h.unknown then txt = L("读不到（战斗中 / 保密值）", "unreadable right now")
            elseif lv == "miss" or not h.has then txt = L("没上毒", "no poison")
            elseif lv == "other" then txt = L("别的临时附魔（不是毒药）", "another weapon buff (not a poison)")
            else txt = P.Name(h.e) .. "  " .. P.LeftText(h) end
            local r, g, b = 1, 1, 1
            if lv == "miss" then r, g, b = 1, 0.3, 0.25 elseif lv == "low" then r, g, b = 1, 0.82, 0 end
            GameTooltip:AddLine(handName(k) .. L("：", ": ") .. txt, r, g, b, true)
        end
    end
    if st then
        local s = {}
        for f, c in pairs(st.stock.fam) do s[#s + 1] = P.FamName(f) .. " ×" .. c end
        table.sort(s)
        GameTooltip:AddLine(L("背包：", "Bags: ") .. (s[1] and table.concat(s, L("、", ", ")) or L("没有毒药", "no poison")), 1, 1, 1, true)
    end
    GameTooltip:AddLine(string.format(L("提醒线：剩不到 %d 分钟 / %d 次变黄，没上毒变红；同类毒药少于 %d 瓶提醒补货",
        "Warn under %d min / %d charges (yellow), red when missing; restock under %d"), P.Get("min"), P.Get("charges"), P.Get("stock")), 0.75, 0.75, 0.75, true)
    GameTooltip:AddLine(L("左键：聊天框看详情  ·  右键：永久关闭浮标  ·  拖拽移动", "Left: details in chat  ·  Right: close for good  ·  Drag: move"), 0.25, 0.9, 0.35, true)
    GameTooltip:Show()
end
local function buildWin()
    local f = CreateFrame("Button", "GearInsightForeverPoisonOrb", UIParent)
    f:SetSize(84, 56); f:SetFrameStrata("MEDIUM"); f:SetClampedToScreen(true)
    local pos = P.DB().pos
    if type(pos) == "table" and pos[1] then f:SetPoint(pos[1], UIParent, pos[1], tonumber(pos[2]) or 0, tonumber(pos[3]) or 0)
    else f:SetPoint("CENTER", UIParent, "CENTER", 120, -210) end
    f:SetMovable(true)
    if f.RegisterForClicks then f:RegisterForClicks("LeftButtonUp", "RightButtonUp") end
    if f.RegisterForDrag then f:RegisterForDrag("LeftButton") end
    -- GI 品牌标：浮标上方一行小字
    ui.tag = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ui.tag:SetPoint("BOTTOM", f, "TOP", 0, -2)
    ui.tag:SetText("|cff33ff99GI|r " .. L("毒药", "Poison"))
    for i, k in ipairs({ "mh", "oh" }) do
        local s = {}
        local x = i == 1 and -21 or 21
        s.disc = f:CreateTexture(nil, "BACKGROUND", nil, 1)
        s.disc:SetSize(34, 34); s.disc:SetPoint("CENTER", f, "CENTER", x, 6); s.disc:SetColorTexture(0.06, 0.05, 0.04, 0.95)
        circle(f, s.disc)
        s.ic = f:CreateTexture(nil, "ARTWORK")
        s.ic:SetSize(28, 28); s.ic:SetPoint("CENTER", s.disc, "CENTER", 0, 0); s.ic:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        circle(f, s.ic)
        s.ring = f:CreateTexture(nil, "OVERLAY", nil, 1)
        s.ring:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
        s.ring:SetSize(65, 65); s.ring:SetPoint("TOPLEFT", s.disc, "TOPLEFT", -5, 5)
        s.hand = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        s.hand:SetPoint("TOPLEFT", s.disc, "TOPLEFT", -3, 3)
        s.hand:SetText(i == 1 and L("主", "M") or L("副", "O"))
        s.txt = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        s.txt:SetPoint("TOP", s.disc, "BOTTOM", 0, -1)
        for _, fs in ipairs({ s.hand, s.txt }) do
            local font, sz = fs:GetFont()
            if font then pcall(fs.SetFont, fs, font, math.max(11, tonumber(sz) or 11), "OUTLINE") end
        end
        ui[k] = s
    end
    f:SetScript("OnEnter", tip)
    f:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
    f:SetScript("OnClick", function(_, mb)
        if GameTooltip then GameTooltip:Hide() end
        if mb == "RightButton" then
            P.SetOrb(false)
            ns.Print(L("毒药浮标已永久关闭（聊天框提醒照旧）。找回：GI 菜单 → 窗口与提醒 → 毒药浮标，或 /gi 毒药 orb on",
                "Poison icon closed for good (chat alerts stay). Bring it back: GI menu > Windows & alerts > Poison icon, or /gi poison orb on"))
            return
        end
        P.Report()
    end)
    f:SetScript("OnDragStart", function(self) self:StartMoving() end)
    f:SetScript("OnDragStop", function(self) self:StopMovingOrSizing(); savePos() end)
    return f
end
-- 一只手的样子：够用 金边 · 快没了 黄 · 没上 红（图标变灰）· 别的附魔 / 读不到 灰；没拿武器 = 隐藏
local COLOR = { ok = { 1, 0.82, 0.35 }, low = { 1, 0.85, 0.1 }, miss = { 1, 0.2, 0.15 }, other = { 0.55, 0.55, 0.55 } }
P.COLOR = COLOR
local function drawHand(s, h, lv)
    local parts = { s.disc, s.ic, s.ring, s.hand, s.txt }
    if not h then for _, p in ipairs(parts) do p:Hide() end; return end
    for _, p in ipairs(parts) do p:Show() end
    local c = COLOR[lv or "other"] or COLOR.other
    s.ring:SetVertexColor(c[1], c[2], c[3])
    s.ic:SetTexture(P.Icon(h.e))
    if s.ic.SetDesaturated then s.ic:SetDesaturated(lv == "miss" or lv == "other" or lv == nil) end
    local t
    if h.unknown or lv == nil then t = "?"
    elseif lv == "miss" then t = L("没毒", "none")
    elseif lv == "other" then t = L("非毒", "other")
    elseif h.ch and h.ch < P.Get("charges") then t = string.format(L("%d次", "%dx"), h.ch)
    else t = short(h.left) or (h.ch and string.format(L("%d次", "%dx"), h.ch)) or "" end
    s.txt:SetText(t)
    s.txt:SetTextColor(c[1], c[2], c[3])
    s.state = lv
end
function P.Draw(st)
    local show = st and P.On() and P.OrbOn() and st.knows and (P.Always() or st.worst > 0)
    if not show then if win then win:Hide() end; return false end
    win = win or buildWin()
    P.win = win
    drawHand(ui.mh, st.hands.mh, st.lv.mh)
    drawHand(ui.oh, st.hands.oh, st.lv.oh)
    win:Show()
    return true
end

-- /gi 毒药：聊天框详情
function P.Report()
    local st = P.State()
    if not st then ns.Print(L("毒药：手上没拿武器（或读不到武器附魔）", "Poisons: no weapon equipped (or unreadable)")); return end
    for _, k in ipairs({ "mh", "oh" }) do
        local h, lv = st.hands[k], st.lv[k]
        if h then
            local txt
            if h.unknown then txt = L("读不到", "unreadable")
            elseif not h.has then txt = L("没上毒", "no poison")
            elseif lv == "other" then txt = L("别的临时附魔（不是毒药）", "another weapon buff")
            else txt = P.Name(h.e) .. "  " .. P.LeftText(h) .. ((lv == "low") and L("  |cffffd100快没了|r", "  |cffffd100low|r") or "") end
            ns.Print(handName(k) .. L("：", ": ") .. txt)
        end
    end
    local s = {}
    for f, c in pairs(st.stock.fam) do s[#s + 1] = P.FamName(f) .. " ×" .. c end
    table.sort(s)
    ns.Print(L("背包：", "Bags: ") .. (s[1] and table.concat(s, L("、", ", ")) or L("没有毒药", "no poison"))
        .. (next(st.low) and ("  |cffffd100" .. P.HOW() .. "|r") or ""))
    if not st.knows then ns.Print(L("还没学「毒药」（20 级盗贼毒药任务）", "You haven't learned Poisons yet (level 20 rogue quest)")) end
end

-- ---------- 事件 ----------
local ev = CreateFrame("Frame")
P.ev = ev
for _, e in ipairs({ "PLAYER_ENTERING_WORLD", "UNIT_INVENTORY_CHANGED", "PLAYER_EQUIPMENT_CHANGED", "BAG_UPDATE_DELAYED",
    "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED", "READY_CHECK", "LEARNED_SPELL_IN_TAB" }) do
    pcall(ev.RegisterEvent, ev, e)
end
local lastInst
local function instKey()
    local ok, inst, typ = pcall(IsInInstance or none)
    if not ok or secret(inst) or secret(typ) or not inst or not (typ == "party" or typ == "raid") then return nil end
    local ok2, name, _, _, _, _, _, _, id = pcall(GetInstanceInfo or none)
    id = ok2 and clean(id)
    return tostring(id or (ok2 and clean(name)) or "?")
end
function P.OnEvent(e, a1)
    if e == "UNIT_INVENTORY_CHANGED" and a1 ~= nil and a1 ~= "player" then return end
    if e == "BAG_UPDATE_DELAYED" or e == "LEARNED_SPELL_IN_TAB" then P.Stock(true) end
    if e == "PLAYER_ENTERING_WORLD" then
        P.Stock(true)
        local k = instKey()
        if k and k ~= lastInst then
            if C_Timer and C_Timer.After then C_Timer.After(3, function() pcall(P.PreCheck, "instance") end) else pcall(P.PreCheck, "instance") end
        end
        lastInst = k
    elseif e == "READY_CHECK" then
        pcall(P.PreCheck, "ready")
    end
    pcall(P.Check, e)
end
ev:SetScript("OnEvent", function(_, e, a1) P.OnEvent(e, a1) end)
-- 剩余时间 / 次数每 2 秒看一次（浮标数字 + 快没了的提醒）；一次只读一个接口 + 缓存的背包数
local acc = 0
ev:SetScript("OnUpdate", function(_, el)
    acc = acc + (el or 0)
    if acc < 2 then return end
    acc = 0
    pcall(P.Check, "tick")
end)

-- ---------- 命令：/gi 毒药 · /gi poison [on|off · orb on|off · min 5 · charges 20 · stock 10] ----------
ns.ExtraSlash = ns.ExtraSlash or {}
local function slash(rest)
    rest = (rest or ""):gsub("[A-Z]", function(c) return c:lower() end)
    local k, v = rest:match("^(%a+)%s*(%S*)")
    if k == "on" or k == "off" then
        P.SetOn(k == "on")
        ns.Print(k == "on" and L("盗贼毒药提醒：已开", "Poison reminder: on") or L("盗贼毒药提醒：已关", "Poison reminder: off"))
        return
    end
    if k == "orb" and (v == "on" or v == "off") then
        P.SetOrb(v == "on")
        ns.Print(v == "on" and L("毒药浮标：已开", "Poison icon: on") or L("毒药浮标：已关", "Poison icon: off"))
        return
    end
    if (k == "min" or k == "charges" or k == "stock" or k == "gap") and tonumber(v) then
        P.Set(k, v)
        ns.Print(string.format(L("毒药提醒：剩不到 %d 分钟 / %d 次提醒，同类少于 %d 瓶提醒补货，同一件事隔 %d 分钟再说",
            "Poisons: warn under %d min / %d charges, restock under %d, repeat every %d min"), P.Get("min"), P.Get("charges"), P.Get("stock"), P.Get("gap")))
        return
    end
    P.Report()
end
ns.ExtraSlash.poison = slash
ns.ExtraSlash["毒药"] = slash

-- ---------- 功能中心 / 设置（只有盗贼加载 → 只有盗贼看得到）----------
if ns.RegisterSettings then
    local function numItem(id, key, zh, en)
        return { type = "edit", id = id, w = 60, keys = P.KEYS, text = function() return L(zh, en) end,
            get = function() return tostring(P.Get(key)) end, set = function(v) P.Set(key, v) end }
    end
    ns.RegisterSettings({ key = "poison", order = 58.3, data = "general", avail = function() return ns.PoisonRemind ~= nil end,
        title = function() return L("盗贼毒药提醒", "Rogue poison reminder") end, short = function() return L("毒药", "Poisons") end,
        items = {
            { type = "check", id = "poison.on", keys = P.KEYS,
              text = function() return L("盗贼毒药提醒：主手 / 副手没上毒、快没了、背包毒药不够时提醒（战斗中不弹框）", "Rogue poisons: remind when a weapon has no poison, it's running out, or you're low on stock (no pop-ups in combat)") end,
              get = function() return P.On() end, set = function(v) P.SetOn(v) end },
            { type = "check", id = "poison.sound", x = 520, inline = true, keys = P.KEYS, text = function() return L("提醒音效", "Sound") end,
              get = function() return P.DB().sound == true end, set = function(v) P.DB().sound = v and true or nil end },
            { type = "check", id = "poison.orb", keys = P.KEYS, text = function() return L("显示毒药浮标（主手 / 副手图标 + 剩余时间）", "Show the poison icon (main / off-hand + time left)") end,
              get = function() return P.OrbOn() end, set = function(v) P.SetOrb(v) end },
            { type = "check", id = "poison.always", keys = P.KEYS, text = function() return L("毒药浮标一直显示（关掉 = 只在快没了 / 没上毒时出来）", "Always show the poison icon (off = only when low / missing)") end,
              get = function() return P.Always() end, set = function(v) P.SetAlways(v) end },
            numItem("poison.min", "min", "毒药剩几分钟提醒：", "Warn at minutes left:"),
            numItem("poison.charges", "charges", "毒药剩几次提醒：", "Warn at charges left:"),
            numItem("poison.stock", "stock", "背包毒药少于几瓶：", "Restock under (bottles):"),
            numItem("poison.gap", "gap", "同一提醒隔几分钟：", "Repeat every (min):"),
            { type = "note", indent = 26, text = function()
                  return string.format(L("默认剩 %d 分钟 / %d 次提醒、同类毒药少于 %d 瓶提醒补货；命令：/gi 毒药（详情）· /gi 毒药 min 5 · charges 20 · stock 10",
                      "Defaults: %d min / %d charges, restock under %d; /gi poison for details, /gi poison min 5 / charges 20 / stock 10"), P.DEF.min, P.DEF.charges, P.DEF.stock)
              end },
        } })
end
if ns.Feature then
    ns.Feature({ key = "poisonremind", cat = "class", zh = "盗贼毒药提醒", en = "Rogue poison reminder", class = "Rogue", sw = "poison.on", def = true,
        files = { "PoisonRemind.lua" },
        dzh = "主手 / 副手毒药没上、快没了、背包毒药不够时提醒；浮标显示剩余时间", den = "Reminds you when a weapon has no poison, it's running out, or you're low on stock" })
end
if ns.RegisterWindow then
    ns.RegisterWindow({ key = "poisonOrb", order = 55.5, title = function() return L("毒药浮标（盗贼）", "Poison icon (Rogue)") end,
        avail = function() return ns.PoisonRemind ~= nil end,
        state = function()
            if not P.On() then return L("毒药提醒已关", "Poison reminder is off") end
            if not P.OrbOn() then return L("已关闭", "Closed") end
            return P.Always() and L("开着（一直显示）", "On (always)") or L("开着（快没了 / 没上毒时出来）", "On (shows when low / missing)")
        end,
        actions = function()
            local on = P.On() and P.OrbOn()
            return {
                { text = on and L("关闭", "Hide") or L("打开", "Show"), fn = function()
                    if on then P.SetOrb(false) else P.DB().on = true; P.SetOrb(true) end
                end },
                { text = L("重置位置", "Reset position"), fn = function() P.ResetPos() end },
            }
        end })
end

-- 子插件在 PLAYER_LOGIN 才加载（进世界前），进世界事件会再跑；已经在世界里（/reload 后补加载）就补一次
if IsLoggedIn and IsLoggedIn() then pcall(P.Check, "load") end

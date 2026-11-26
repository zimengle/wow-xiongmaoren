-- HOLD：队长分配 · 服务目录 / 分配模型 / 自动建议（11-25 用户「有效帮助队长能够掌控并提醒所有应该加的BUFF，分配」）
--   设计稿 docs/forever/party-status-design.md（第 1 期：BUFF 分配闭环）。按需子插件 GearInsight_Forever_Party，由 _BuffCheck 末尾的桩加载：
--     收到第一条 GIFPS1 插件消息 / 我是队长或助理且在团队、副本里 / 点「分配」、/gi ps。没有分配表时检查器和以前一模一样。
--   ① 服务目录：检查器 B.TYPES 里的 7 种（耐力 / 智力 / 野性印记 / 神圣之灵 / 王者 / 力量 / 智慧），服务键 fort int motw spirit bless.kings bless.might bless.wis
--   ② 分配表 plan = { v = 1, rev, by, tpl, a = { { s = 服务键, who = 负责人, to = 目标写法, m = 1（手改过）}, … } }
--      目标写法：*（全队）· c:职业,…· g:小队号,…· n:名字,…· r:tank|healer|mana|melee
--      PP.Expand(plan, roster) → { [服务键] = { [队员名] = 负责人 } }（纯函数；更具体的写法优先：n > c / g / r > *）
--   ③ 自动建议 PP.Suggest(roster, flags)（纯函数）：圣骑士按名字排 #1 #2 #3 配王者 / 力量 / 智慧；
--      耐力 / 智力 / 野性印记 / 神圣之灵：5 人队给等级最高的一个人管全队；团队按小队切成连续几段，各管一段（尽量管自己所在的那段）
--      手改过的条目（m = 1）重新出建议时原样保留
-- ⛔ 状态都放这张表里的字段 / 局部变量，不往 ns / BA 加键（只多 ns.PartyPlan 一个，子插件加载后才有）；不建框体、不建 OnUpdate
local _, ns = ...; ns = _G.GearInsightForever or ns
local B = ns and ns.BuffCheck
if not B or ns.PartyPlan then return end

local PP = { V = 1, caps = {} }
ns.PartyPlan = PP
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function none() end
local function secret(v) return v ~= nil and ns.Secret ~= nil and ns.Secret(v) end
local function ask(f, ...)
    if type(f) ~= "function" then return nil end
    local ok, v = pcall(f, ...)
    if not ok or secret(v) then return nil end
    return v
end
local function short(n) return type(n) == "string" and (n:match("^([^%-]+)") or n) or n end
PP.Short, PP.Ask = short, ask
function PP.Me() return short(ask(UnitName, "player")) end

-- ---------- 设置（ns.db.party；nil = 默认）----------
function PP.DB()
    if type(ns.db) ~= "table" then return {} end
    if type(ns.db.party) ~= "table" then ns.db.party = {} end
    return ns.db.party
end
-- 默认开的项：存 false = 关；默认关的项（lead）：存 true = 开
function PP.Opt(k)
    local v = PP.DB()[k]
    if k == "lead" then return v == true end
    return v ~= false
end
function PP.SetOpt(k, on)
    local d = PP.DB()
    if k == "lead" then d[k] = on and true or nil
    elseif on then d[k] = nil else d[k] = false end
end

-- ---------- 服务目录 ----------
PP.SVC, PP.BYK = {}, {}
PP.CLASSES = { "WARRIOR", "ROGUE", "HUNTER", "MAGE", "WARLOCK", "PRIEST", "DRUID", "PALADIN", "SHAMAN" }
PP.CLS = { WARRIOR = { "战士", "Warrior" }, ROGUE = { "盗贼", "Rogue" }, HUNTER = { "猎人", "Hunter" }, MAGE = { "法师", "Mage" }, WARLOCK = { "术士", "Warlock" },
    PRIEST = { "牧师", "Priest" }, DRUID = { "德鲁伊", "Druid" }, PALADIN = { "圣骑士", "Paladin" }, SHAMAN = { "萨满", "Shaman" } }
do
    local byT = {}
    for _, t in ipairs(B.TYPES) do byT[t.k] = t end
    local function add(k, tk, sub, pb)
        local t = byT[tk]
        if not t then return end
        local x = t
        if sub then for _, s in ipairs(t.sub or {}) do if s.k == sub then x = s end end end
        local s = { k = k, t = t, sub = sub, pb = pb, cls = t.cls, lv = x.lv, mana = x.mana, melee = x.melee, cn = x.cn, en = x.en, talent = t.talent }
        PP.SVC[#PP.SVC + 1] = s
        PP.BYK[k] = s
    end
    add("fort", "fort"); add("int", "int"); add("motw", "motw"); add("spirit", "spirit")
    add("bless.kings", "bless", "kings", "K"); add("bless.might", "bless", "might", "M"); add("bless.wis", "bless", "wis", "W")
end
local BYK = PP.BYK
function PP.SvcName(k, chat)
    local s = BYK[k]
    if not s then return L("？（需要更新）", "? (update needed)") end
    if chat and ns.ChatL then return ns.ChatL(s.cn, s.en) end
    return L(s.cn, s.en)
end
function PP.ClsName(c, chat)
    local v = PP.CLS[c]
    if not v then return c or "?" end
    if chat and ns.ChatL then return ns.ChatL(v[1], v[2]) end
    return L(v[1], v[2])
end

-- ---------- 队伍名单：{ name, cls, lv, g（小队号）, rank（2 队长 / 1 助理 / 0）, online, me, role }，roster.raid ----------
function PP.Roster(members)
    members = members or B.Members()
    local raid = ask(IsInRaid) and true or false
    local info = {}
    if raid and GetRaidRosterInfo then
        for i = 1, 40 do
            local ok, n, rank, g = pcall(GetRaidRosterInfo, i)
            if ok and type(n) == "string" and not secret(n) and not secret(rank) and not secret(g) then info[n:match("^[^%- ]+") or n] = { rank = tonumber(rank) or 0, g = tonumber(g) or 1 } end
        end
    end
    local out = { raid = raid }
    for _, m in ipairs(members) do
        local n = short(m.name)
        local i = info[n]
        local r = { name = n, full = m.full or m.name, cls = m.cls, lv = m.lv or 0, online = m.online ~= false, me = m.me and true or false, g = i and i.g or 1 }
        if i then r.rank = i.rank else r.rank = ask(UnitIsGroupLeader, m.unit) and 2 or 0 end
        local role = UnitGroupRolesAssigned and ask(UnitGroupRolesAssigned, m.unit)
        if role == "TANK" or role == "HEALER" then r.role = role end
        out[#out + 1] = r
    end
    return out
end
function PP.Find(roster, name)
    for _, m in ipairs(roster) do if m.name == name then return m end end
end
-- 我能不能改 / 下发分配：团队 = 团长，助理要「助理也能改」开着；5 人队 = 谁都行（表号大的算数）
function PP.MayEdit(roster, name)
    local m = PP.Find(roster, name or PP.Me())
    if not m then return false end
    if not roster.raid then return true end
    return m.rank >= 2 or (m.rank == 1 and PP.Opt("asst"))
end

-- ---------- 目标写法 ----------
local function has(list, v)
    for x in list:gmatch("[^,]+") do if x == v then return true end end
    return false
end
function PP.Match(to, m)
    if to == "*" then return true end
    local kind, list = to:match("^(%a):(.*)$")
    if not kind then return false end
    if kind == "c" then return m.cls ~= nil and has(list, m.cls) end
    if kind == "g" then return has(list, tostring(m.g or 1)) end
    if kind == "n" then return has(list, m.name) end
    if kind == "r" then
        for r in list:gmatch("[^,]+") do
            if r == "mana" and m.cls and not B.NO_MANA[m.cls] then return true end
            if r == "melee" and m.cls and B.MELEE[m.cls] then return true end
            if r == "tank" and m.role == "TANK" then return true end
            if r == "healer" and m.role == "HEALER" then return true end
        end
    end
    return false
end
local PRI = { n = 3, c = 2, g = 2, r = 2 }
function PP.Expand(plan, roster)
    local out, pri = {}, {}
    for _, e in ipairs(plan and plan.a or {}) do
        local s = BYK[e.s]
        if s and type(e.to) == "string" and type(e.who) == "string" then
            local p = e.to == "*" and 1 or PRI[e.to:sub(1, 1)] or 0
            for _, m in ipairs(roster) do
                if B.Useful(s, m.cls) and PP.Match(e.to, m) then
                    local o, q = out[e.s], pri[e.s]
                    if not o then o, q = {}, {}; out[e.s], pri[e.s] = o, q end
                    if not o[m.name] or p > q[m.name] then o[m.name], q[m.name] = e.who, p end
                end
            end
        end
    end
    return out
end
-- 目标写法 → 给人看的字（chat = 发到队伍用对外语言）
function PP.ToText(to, chat)
    local function T(zh, en) if chat and ns.ChatL then return ns.ChatL(zh, en) end return L(zh, en) end
    if to == "*" then return T("全队", "all") end
    local kind, list = tostring(to):match("^(%a):(.*)$")
    if not kind then return tostring(to) end
    local p = {}
    for x in list:gmatch("[^,]+") do
        if kind == "c" then p[#p + 1] = PP.ClsName(x, chat)
        elseif kind == "r" then p[#p + 1] = ({ tank = T("坦克", "tanks"), healer = T("治疗", "healers"), mana = T("有蓝的", "mana users"), melee = T("近战", "melee") })[x] or x
        else p[#p + 1] = x end
    end
    local s = table.concat(p, T("、", "/"))
    if kind == "g" then return T(s .. " 队", "G" .. s) end
    return s
end

-- ---------- 谁能给 ----------
function PP.Can(s, m)
    if m.cls ~= s.cls or not m.online or (m.lv or 0) < s.lv then return false end
    if s.talent then
        local c = PP.caps[m.name]
        if c and c.cap then return c.cap[s.k] == true end              -- 他的插件报过会不会
        if m.me then return B.Knows(s.t) end
        return B.seenTalent[s.t.k] == true                              -- 没装插件的：这次组队看见过这个 BUFF 才算
    end
    return true
end
function PP.Providers(s, roster)
    local out = {}
    for _, m in ipairs(roster) do if PP.Can(s, m) then out[#out + 1] = m end end
    table.sort(out, function(a, b) return a.name < b.name end)
    return out
end

-- ---------- 自动建议 ----------
local GRP = { WARRIOR = "A", ROGUE = "A", MAGE = "B", WARLOCK = "B", PRIEST = "B", HUNTER = "C", DRUID = "C", PALADIN = "C", SHAMAN = "C" }
local function suggestBless(roster, out)
    local P = PP.Providers(BYK["bless.might"], roster)
    local n = #P
    if n == 0 then return end
    if n >= 2 and P[1].lv < 20 then
        for j = 2, n do if P[j].lv >= 20 then P[1], P[j] = P[j], P[1]; break end end   -- #1 不会王者：和后面会的换
    end
    local kings = n >= 2 and P[1].lv >= 20
    local acc = {}
    local function put(k, p, c)
        local key = k .. "\1" .. p.name
        if not acc[key] then acc[key] = {} end
        acc[key][#acc[key] + 1] = c
    end
    local present = {}
    for _, m in ipairs(roster) do if m.cls then present[m.cls] = true end end
    for _, c in ipairs(PP.CLASSES) do
        local g = present[c] and GRP[c]
        if g then
            local caster = P[1]                 -- 给力量 / 智慧的那个
            if kings then put("bless.kings", P[1], c); caster = P[2] end
            local gave
            if g == "A" then put("bless.might", caster, c); gave = "might"
            elseif caster.lv >= 14 then put("bless.wis", caster, c); gave = "wis"
            elseif g == "C" then put("bless.might", caster, c); gave = "might" end
            if g == "C" and gave == "wis" then
                local third = kings and P[3] or (not kings and P[2]) or nil   -- 混合职业：再多一个圣骑士就补力量
                if third then put("bless.might", third, c) end
            end
        end
    end
    for _, k in ipairs({ "bless.kings", "bless.might", "bless.wis" }) do
        for _, p in ipairs(P) do
            local cs = acc[k .. "\1" .. p.name]
            if cs then out[#out + 1] = { s = k, who = p.name, to = "c:" .. table.concat(cs, ",") } end
        end
    end
end
function PP.Suggest(roster, flags)
    local out = {}
    local raid = roster.raid
    if flags and flags.raid ~= nil then raid = flags.raid end
    for _, k in ipairs({ "fort", "int", "motw", "spirit" }) do
        local s = BYK[k]
        local prov = PP.Providers(s, roster)
        local groups, seen = {}, {}
        for _, m in ipairs(roster) do
            if B.Useful(s, m.cls) and not seen[m.g] then seen[m.g] = true; groups[#groups + 1] = m.g end
        end
        table.sort(groups)
        if #prov > 0 and #groups > 0 then
            if not raid then
                local best = prov[1]
                for _, p in ipairs(prov) do if p.lv > best.lv then best = p end end
                out[#out + 1] = { s = k, who = best.name, to = "*" }
            else
                local n = math.min(#prov, #groups)
                local base, extra, at, segs = math.floor(#groups / n), #groups % n, 1, {}
                for i = 1, n do
                    local size = base + (i <= extra and 1 or 0)
                    local seg = {}
                    for j = at, at + size - 1 do seg[#seg + 1] = groups[j] end
                    at = at + size
                    segs[i] = seg
                end
                local used = {}
                for _, seg in ipairs(segs) do                      -- 先各认自己所在的那段
                    for _, p in ipairs(prov) do
                        if not used[p.name] and not seg.who then
                            for _, g in ipairs(seg) do if g == p.g then seg.who = p.name; used[p.name] = true; break end end
                        end
                    end
                end
                for _, seg in ipairs(segs) do
                    if not seg.who then
                        for _, p in ipairs(prov) do if not used[p.name] then seg.who = p.name; used[p.name] = true; break end end
                    end
                    out[#out + 1] = { s = k, who = seg.who, to = n == 1 and "*" or ("g:" .. table.concat(seg, ",")) }
                end
            end
        end
    end
    suggestBless(roster, out)
    return out
end
-- 重新出建议：手改过的条目（m = 1）原样留着；这种服务有手改条目 → 这种服务不再出建议
function PP.Resuggest(plan, roster, flags)
    local keep, manual = {}, {}
    for _, e in ipairs(plan and plan.a or {}) do
        if e.m then keep[#keep + 1] = e; manual[e.s] = true end
    end
    for _, e in ipairs(PP.Suggest(roster, flags)) do
        if not manual[e.s] then keep[#keep + 1] = e end
    end
    local order = {}
    for i, s in ipairs(PP.SVC) do order[s.k] = i end
    for i, e in ipairs(keep) do e._i = i end
    table.sort(keep, function(a, b)
        local x, y = order[a.s] or 99, order[b.s] or 99
        if x ~= y then return x < y end
        return a._i < b._i
    end)
    for _, e in ipairs(keep) do e._i = nil end
    return { v = PP.V, rev = plan and plan.rev or 0, by = plan and plan.by, tpl = plan and plan.tpl, a = keep }
end
function PP.Copy(plan)
    local c = { v = plan.v or PP.V, rev = plan.rev or 0, by = plan.by, tpl = plan.tpl, a = {} }
    for i, e in ipairs(plan.a or {}) do c.a[i] = { s = e.s, who = e.who, to = e.to, m = e.m } end
    return c
end

-- ---------- 上线格式：P|v=1|rev=12|i=2/5|tpl=MC|h=校验|d=<服务键>><负责人>><目标>[>m];…（每条 ≤ 240 字节，只在条目边界切）----------
PP.MAX = 240
function PP.Sum(s)
    local h = 0
    for i = 1, #s do h = (h * 31 + s:byte(i)) % 65521 end
    return h
end
local function pieces(e, room)
    local one = e.s .. ">" .. e.who .. ">" .. e.to .. (e.m and ">m" or "")
    if #one <= room then return { one } end
    local kind, list = e.to:match("^(%a):(.*)$")
    if not kind then return { one } end
    local out, cur = {}, nil
    local head = e.s .. ">" .. e.who .. ">" .. kind .. ":"
    local tail = e.m and ">m" or ""
    for x in list:gmatch("[^,]+") do
        if cur and #head + #cur + 1 + #x + #tail > room then out[#out + 1] = head .. cur .. tail; cur = nil end
        cur = cur and (cur .. "," .. x) or x
    end
    if cur then out[#out + 1] = head .. cur .. tail end
    return out
end
function PP.Wire(plan, max)
    max = max or PP.MAX
    local tpl = plan.tpl and tostring(plan.tpl):gsub("[|;>=]", "") or nil
    local room = max - 46 - (tpl and (#tpl + 5) or 0)
    local items = {}
    for _, e in ipairs(plan.a or {}) do
        for _, p in ipairs(pieces(e, room)) do items[#items + 1] = p end
    end
    local chunks, cur = {}, nil
    for _, it in ipairs(items) do
        if cur and #cur + 1 + #it > room then chunks[#chunks + 1] = cur; cur = nil end
        cur = cur and (cur .. ";" .. it) or it
    end
    chunks[#chunks + 1] = cur or ""
    local sum = PP.Sum(table.concat(chunks, ";"))
    local out = {}
    for i, c in ipairs(chunks) do
        out[i] = string.format("P|v=%d|rev=%d|i=%d/%d%s%s|d=%s", PP.V, plan.rev or 0, i, #chunks, tpl and ("|tpl=" .. tpl) or "", i == #chunks and ("|h=" .. sum) or "", c)
    end
    return out
end
-- 一条消息 → 类型, 字段表（d = 正文）
function PP.Parse(text)
    if type(text) ~= "string" then return nil end
    local kind, rest = text:match("^(%a)|(.*)$")
    if not kind then return nil end
    local f = {}
    local head, d = rest:match("^(.-)|d=(.*)$")
    if not head then
        d = rest:match("^d=(.*)$")
        head = d and "" or rest
    end
    f.d = d
    for k, v in head:gmatch("([%a]+)=([^|]*)") do f[k] = v end
    return kind, f
end
-- 正文 → 条目表（不认识的服务键照收，面板上写「？（需要更新）」）
function PP.Entries(d)
    local a = {}
    for it in (d or ""):gmatch("[^;]+") do
        local s, who, to, m = it:match("^([^>]+)>([^>]+)>([^>]+)>?(m?)$")
        if s then
            local last = a[#a]
            local k1, l1 = to:match("^(%a):(.*)$")
            local k0 = last and last.to:match("^(%a):")
            if last and last.s == s and last.who == who and k1 and k0 == k1 and (last.m and "m" or "") == m then
                last.to = last.to .. "," .. l1            -- 发的时候因为太长切开的同一条：拼回去
            else
                a[#a + 1] = { s = s, who = who, to = to, m = m == "m" and 1 or nil }
            end
        end
    end
    return a
end

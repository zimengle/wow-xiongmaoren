-- HOLD：团队 / 小队 BUFF 检查器（11-25 用户「团本BUFF加小队BUFF检查器，系统性设计一下，目标是，队长或者队员都可以检查所有在队，可以加的BUFF，是否都加，到时间提醒，提前5分钟」）
--   设计稿 docs/forever/raid-buff-check-design.md。登录触发在组队信标 _Group 的 BuffCheckHook.lua（组队 / 进世界 / 脱战，开关开着、在队里、不在战斗才 LoadAddOn）。
--   ① 目录：队里有谁（职业 / 等级 / 在线）→ 这支队伍能给哪些 BUFF（耐力 / 智力 / 野性印记 / 祝福 / 神圣之灵 / 暗影防护（可选）/ 战斗怒吼（短，默认关））
--      法术 ID / 时长：开服客户端技能书 services/dashboard/static/data/forever/spellbook.json（1.60.1.70862）逐条核过；无限的祝福也是 1 小时；
--      单体王者 20217 = PallyBless.lua；神圣之灵 1 级 14752 是天赋（技能书没有，宏库 macros.json 同 id）
--   ② 每个人缺不缺 / 剩多久：读光环 expirationTime；读不到（保密值 / 0）→ 亲眼看到「没有 → 有」时记下起点，按满时长估（≈）；加载前就有的只写「有」
--      祝福：一个圣骑士只能给一个人一种 → 该有几种 = min(能给的圣骑士数, 这个职业用得上的种数)，身上种数不够 = 缺
--   ③ 提醒：快到期线 = min(设置分钟 × 60, 满时长 × 1/3)（默认 5 分钟）；只提醒「能给这种 BUFF 的人」（屏幕上方 + 聊天框本地，⛔ 不发言）；
--      有新人缺 / 新人快到期才说，没补 3 分钟后再说；战斗中攒着脱战说；死了不说；就位确认时我自己缺也说一句
--   ④ 面板：每种一行（缺几个 / 快到期几个 / 最短剩余 / 谁能给），左键 = /target 第一个该补的人（安全按钮，属性只脱战改），
--      右键菜单「队伍里说缺谁」「密 XX 要」（⛔ 点了才发、不带插件名）；全队灵魂石框显示着就贴在它下面
-- ⛔ 不建 OnUpdate；每个接口 pcall、保密值不碰；战斗中不显示 / 隐藏 / 挪框、不改安全属性
local _, ns = ...; ns = _G.GearInsightForever or ns
if not ns or ns.BuffCheck then return end

local B = { st = {}, said = {}, pend = {}, seenTalent = {} }
ns.BuffCheck = B
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function CL(zh, en) return ns.ChatL and ns.ChatL(zh, en) or L(zh, en) end
local function none() end
local function secret(v) return v ~= nil and ns.Secret ~= nil and ns.Secret(v) end
local function clean(v) if v == nil or secret(v) then return nil end return v end
local function num(v) v = clean(v); return v ~= nil and tonumber(v) or nil end
local function gt() return (GetTime and GetTime()) or 0 end
local function ask(f, ...)
    if type(f) ~= "function" then return nil end
    local ok, v = pcall(f, ...)
    if not ok then return nil end
    return clean(v)
end
-- 11-25 用户「名字 + 姓」：《无限》角色名是「名 姓」，UnitName 只回「名」，光名字密不到（「未找到名为…的在线玩家」）
--   → 密语对象用 GetUnitName(unit, true) 的全名（和信标 DC.FullName 同一个办法，去掉「-服务器」）；面板 / 分配表 / 记录的键照旧只用名
local function fullName(u)
    local n = ask(GetUnitName, u, true)
    return type(n) == "string" and n:match("^([^%-]+)") or ask(UnitName, u)
end
local function inCombat() return ask(InCombatLockdown) and true or false end
local function mmss(s)
    s = math.max(0, math.floor((tonumber(s) or 0) + 0.5))
    return string.format("%d:%02d", math.floor(s / 60), s % 60)
end
local function short(n) return type(n) == "string" and (n:match("^([^%-]+)") or n) or n end

-- ---------- 目录（来源见文件头）----------
--   cls = 谁能给；lv = 第一级的学习等级；dur = 满时长（秒）；ids = 各等级 + 团体版（任何一个在身上都算有）；durOf = 个别法术时长不同
--   mana = 只对有蓝的有用；melee = 只对近战 + 猎人有用；opt = "sit"（可选：只显示，默认不提醒）/ "short"（短 BUFF，默认整行不算）；talent = 天赋，看见过 / 我会才算能给
--   bless = 圣骑士祝福（一个圣骑士只能给一个人挂一种）：sub 各种祝福
B.NO_MANA = { WARRIOR = true, ROGUE = true, DEATHKNIGHT = true }
B.MELEE = { WARRIOR = true, ROGUE = true, DEATHKNIGHT = true, HUNTER = true }
B.TYPES = {
    { k = "fort", cls = "PRIEST", lv = 1, dur = 3600, cn = "耐力", en = "Fortitude",
      ids = { 1243, 1244, 1245, 2791, 10937, 10938, 21562, 21564 } },           -- 真言术：韧 1-6 级 / 坚韧祷言 1-2 级
    { k = "int", cls = "MAGE", lv = 1, dur = 3600, mana = true, cn = "智力", en = "Intellect",
      ids = { 1459, 1460, 1461, 10156, 10157, 23028 } },                        -- 奥术智慧 1-5 级 / 奥术光辉
    { k = "motw", cls = "DRUID", lv = 1, dur = 3600, cn = "野性印记", en = "Mark of the Wild",
      ids = { 1126, 5232, 6756, 5234, 8907, 9884, 9885, 21849, 21850 } },       -- 野性印记 1-7 级 / 野性赐福 1-2 级
    { k = "bless", cls = "PALADIN", lv = 4, dur = 3600, bless = true, cn = "祝福", en = "Blessings",
      sub = {
        { k = "might", lv = 4, melee = true, cn = "力量", en = "Might", ids = { 19740, 19834, 19835, 19836, 19837, 19838, 25291, 25782, 25916 } },
        { k = "wis", lv = 14, mana = true, cn = "智慧", en = "Wisdom", ids = { 19742, 19850, 19852, 19853, 19854, 25290, 25894, 25918 } },
        { k = "kings", lv = 20, cn = "王者", en = "Kings", ids = { 20217, 25898 } },
      } },
    { k = "spirit", cls = "PRIEST", lv = 30, dur = 3600, mana = true, talent = true, cn = "神圣之灵", en = "Divine Spirit",
      ids = { 14752, 14818, 14819, 27841, 27681 } },                            -- 神圣之灵 1-4 级 / 精神祷言
    { k = "shadow", cls = "PRIEST", lv = 30, dur = 600, opt = "sit", cn = "暗影防护", en = "Shadow Protection",
      ids = { 976, 10957, 10958, 27683 }, durOf = { [27683] = 1200 } },         -- 防护暗影 1-3 级（10 分钟）/ 暗影防护祷言（20 分钟）
    { k = "shout", cls = "WARRIOR", lv = 1, dur = 180, melee = true, opt = "short", cn = "战斗怒吼", en = "Battle Shout",
      ids = { 6673, 5242, 6192, 11549, 11550, 11551, 25289 } },
}
B.FRAC, B.REPEAT, B.THROTTLE, B.LOOP = 1 / 3, 180, 1, 5
local BYID, BYNAME = {}, {}   -- spellId → { t, sub }；客户端法术名 → 同（第一次用时填）
for _, t in ipairs(B.TYPES) do
    if t.sub then for _, s in ipairs(t.sub) do local v = { t, s }; for _, id in ipairs(s.ids) do BYID[id] = v end end
    else local v = { t }; for _, id in ipairs(t.ids) do BYID[id] = v end end
end
B.BYID = BYID
local namesDone = false
local function fillNames()
    if namesDone then return end
    namesDone = true
    for id, v in pairs(BYID) do
        local n
        if C_Spell and C_Spell.GetSpellName then n = ask(C_Spell.GetSpellName, id) end
        if (type(n) ~= "string" or n == "") and GetSpellInfo then n = ask(GetSpellInfo, id) end
        if type(n) == "string" and n ~= "" and not BYNAME[n] then BYNAME[n] = v end
    end
end
B.FillNames = fillNames
function B.Name(t) return L(t.cn, t.en) end

-- ---------- 设置（ns.db.buffCheck：off / show（nil 只在副本 · "always" · "never"）/ warn 分钟 / short / sit / nag = false 不提醒 / pos）----------
function B.DB()
    if type(ns.db) ~= "table" then return {} end
    if type(ns.db.buffCheck) ~= "table" then ns.db.buffCheck = {} end
    return ns.db.buffCheck
end
function B.On() return ns.db ~= nil and not B.DB().off end
function B.Warn()
    local v = tonumber(B.DB().warn)
    if v and v >= 0 then return v end
    return 5
end
function B.Counts(t)
    if t.opt == "short" then return B.DB().short == true end
    return true
end
function B.Nags(t)
    if B.DB().nag == false then return false end
    if t.opt == "sit" then return B.DB().sit == true end
    return true
end
-- 快到期线（秒）：min(设置分钟, 满时长 1/3)
function B.Lead(t, dur) return math.min(B.Warn() * 60, (dur or t.dur) * B.FRAC) end

-- ---------- 读队伍 ----------
function B.Units()
    local out, n = {}, num(ask(GetNumGroupMembers)) or 0
    if ask(IsInRaid) then
        for i = 1, math.min(n, 40) do out[#out + 1] = "raid" .. i end
    else
        out[1] = "player"
        for i = 1, 4 do out[#out + 1] = "party" .. i end
    end
    local list = {}
    for _, u in ipairs(out) do if u == "player" or ask(UnitExists, u) then list[#list + 1] = u end end
    return list
end
local function classOf(u) local ok, _, c = pcall(UnitClass or none, u); c = ok and clean(c); return type(c) == "string" and c or nil end
local function readable(u)
    if u == "player" then return true end
    for _, f in ipairs({ UnitIsConnected or false, UnitIsVisible or false }) do
        if f then
            local ok, v = pcall(f, u)
            if ok and not secret(v) and not v then return false end
        end
    end
    return true
end
local function auraAt(u, i)
    if C_UnitAuras and C_UnitAuras.GetAuraDataByIndex then
        local ok, a = pcall(C_UnitAuras.GetAuraDataByIndex, u, i, "HELPFUL")
        if not ok or a == nil then return nil end
        if secret(a) or type(a) ~= "table" then return "secret" end
        local name, sid = clean(a.name), num(a.spellId)
        if name == nil and sid == nil then return "secret" end
        return { name = name, sid = sid, exp = num(a.expirationTime), src = clean(a.sourceUnit) }
    end
    local f = UnitAura or UnitBuff
    if not f then return nil end
    local ok, name, _, _, _, _, exp, src, _, _, sid = pcall(f, u, i, UnitAura and "HELPFUL" or nil)
    if not ok then return nil end
    if secret(name) then return "secret" end
    if name == nil then return nil end
    return { name = name, sid = num(sid), exp = num(exp), src = clean(src) }
end
-- 这个人身上我们认得的 BUFF → 列表 { sid, name, exp }（只留目录里的）| "secret"（读不到）
--   11-25 用户实测「这里误判都要做一下」：这个客户端别人（有时连自己）的增益会读成加密值 / 整张空表（战斗中、刚进视野）
--   → 里面有一项加密、或者一个增益都没有 = 读不到，不是「缺」
function B.AurasOf(u)
    fillNames()
    local out, sawSecret, any = {}, false, false
    for i = 1, 40 do
        local a = auraAt(u, i)
        if a == nil then break end
        if a == "secret" then sawSecret = true
        else
            any = true
            if (a.sid and BYID[a.sid]) or (a.name and BYNAME[a.name]) then out[#out + 1] = a end
        end
    end
    if sawSecret or not any then return "secret" end
    return out
end
-- 一次扫描要的队员表：{ name, cls, lv, read, dead, me, auras }
--   误判防护（11-25）：B.snap[名字] = { first = 第一次读到的时刻, eff = 认下来的增益, gone = { [增益] = 第一次发现没了的时刻 }, ok }
--     战斗中不读：用脱战时认下来的那份（到期时间是绝对时刻，倒计时照走）；从没读到过 = 读不到
--     「没有」要隔 B.CONFIRM 秒读到两次才算：第一次读到这个人先不判；原来有、这次没读到的先留着，下次还没有才去掉；读到「有」当场认
--     B.wait = 还有没确认的 → Update 再排一次扫描
B.CONFIRM = 1
B.snap = {}
function B.Members()
    local list, fight, now = {}, inCombat(), gt()
    B.wait = nil
    for _, u in ipairs(B.Units()) do
        local n = ask(UnitName, u)
        if type(n) == "string" and n ~= "" then
            local m = { unit = u, name = n, cls = classOf(u), lv = num(ask(UnitLevel, u)) or 0, me = (u == "player") or (ask(UnitIsUnit, u, "player") and true) or false }
            m.online = u == "player" or ask(UnitIsConnected, u) ~= false
            local f = fullName(u)
            if f ~= n then m.full = f end   -- 「名 姓」：密语 / 逐个密下发用
            m.dead = ask(UnitIsDeadOrGhost, u) and true or false
            local s = B.snap[n]
            if fight then
                if s and s.ok then m.auras = s.eff end
            else
                local a = (m.dead or not readable(u)) and "secret" or B.AurasOf(u)
                if a ~= "secret" then
                    if not s then s = { first = now, eff = {}, gone = {} }; B.snap[n] = s end
                    local has = {}
                    for _, x in ipairs(a) do has[x.sid or x.name] = true end
                    for _, x in ipairs(s.eff) do
                        local k = x.sid or x.name
                        if not has[k] then
                            local g = s.gone[k] or now
                            if now - g < B.CONFIRM then s.gone[k] = g; a[#a + 1] = x; B.wait = true else s.gone[k] = nil end
                        end
                    end
                    for k in pairs(has) do s.gone[k] = nil end
                    s.eff, s.ok = a, now - s.first >= B.CONFIRM
                    if s.ok then m.auras = a else B.wait = true end
                end
            end
            m.read = m.auras ~= nil
            list[#list + 1] = m
        end
    end
    return list
end

-- ---------- 算（纯函数，离线测试直接喂 members）----------
local function useful(x, cls)
    if x.mana and cls and B.NO_MANA[cls] then return false end
    if x.melee and not (cls and B.MELEE[cls]) then return false end
    return true
end
B.Useful = useful
local function match(a)
    local v = (a.sid and BYID[a.sid]) or (a.name and BYNAME[a.name])
    return v and v[1], v and v[2]
end
-- 谁能给 t：同职业、在线、等级够；天赋（神圣之灵）= 我会 / 这次组队看见过
function B.Providers(t, members, knows)
    local out = {}
    if t.talent and not B.seenTalent[t.k] then
        local me
        for _, m in ipairs(members) do if m.me then me = m end end
        if not (me and me.cls == t.cls and knows and knows(t)) then return out end
    end
    for _, m in ipairs(members) do
        if m.cls == t.cls and m.online ~= false and (m.lv or 0) >= t.lv then out[#out + 1] = m end
    end
    return out
end
-- 记时：读得到 expirationTime 用它；读不到就用「亲眼看到没有 → 有」的起点估
local function leftOf(m, key, a, dur, now)
    local s = B.st[m.name]
    if not s then s = {}; B.st[m.name] = s end
    local r = s[key]
    if a then
        if not r then r = {}; s[key] = r end
        if r.miss then r.since, r.miss = now, nil end   -- 刚上
        if a.exp and a.exp > 0 then return a.exp - now, false end
        if r.since then return r.since + dur - now, true end
        return nil, false
    end
    if not r then r = {}; s[key] = r end
    r.miss, r.since = true, nil
    return nil, false
end
-- → rows：{ t, prov = {名字}, miss = {名字}, soon = {{name, left, approx}}, min, approx, far, need }
--   own（可选，队长分配 _Party 给的负责表 { [服务键] = { [队员名] = 负责人 } }；nil = 和没有分配功能时一模一样）：
--     这种 BUFF 在表里 → row.planned = true，row.who = { [负责人] = { miss = {名字}, soon = {{name, left, approx}} } }
local function whoRec(row, a)
    local w = row.who
    if not w then w = {}; row.who = w end
    local r = w[a]
    if not r then r = { miss = {}, soon = {} }; w[a] = r end
    return r
end
function B.Compute(members, now, knows, own)
    now = now or gt()
    for _, m in ipairs(members) do
        for _, a in ipairs(m.auras or {}) do
            local t = match(a)
            if t and t.talent then B.seenTalent[t.k] = true end
        end
    end
    local rows = {}
    for _, t in ipairs(B.TYPES) do
        if B.Counts(t) then
            local prov = B.Providers(t, members, knows)
            if #prov > 0 then
                local row = { t = t, prov = {}, miss = {}, soon = {}, far = 0, need = 0 }
                if own then
                    if t.bless then for _, s in ipairs(t.sub) do if own["bless." .. s.k] then row.planned = true end end
                    elseif own[t.k] then row.planned = true end
                end
                for _, p in ipairs(prov) do row.prov[#row.prov + 1] = p.name end
                local subs, maxLv = {}, 0
                if t.bless then
                    for _, p in ipairs(prov) do maxLv = math.max(maxLv, p.lv or 0) end
                    for _, s in ipairs(t.sub) do if maxLv >= s.lv then subs[#subs + 1] = s end end
                end
                for _, m in ipairs(members) do
                    local want = true
                    if t.bless then
                        local n = 0
                        for _, s in ipairs(subs) do if useful(s, m.cls) then n = n + 1 end end
                        want = math.min(#prov, n)
                        if want == 0 then want = false end
                    else
                        want = useful(t, m.cls)
                    end
                    if want and m.online ~= false and not m.dead then
                        row.need = row.need + 1
                        if not m.read then row.far = row.far + 1
                        else
                            local found, have, left, approx, mdur = {}, 0, nil, false, t.dur
                            for _, a in ipairs(m.auras or {}) do
                                local at, sub = match(a)
                                if at == t then
                                    local key = sub and sub.k or "x"
                                    if not found[key] then found[key] = a; have = have + 1 end
                                end
                            end
                            if t.bless then
                                for _, s in ipairs(t.sub) do
                                    local l, ap = leftOf(m, "bless." .. s.k, found[s.k], t.dur, now)
                                    if l and (not left or l < left) then left, approx = l, ap end
                                    local o = row.planned and own["bless." .. s.k]
                                    local a = o and o[short(m.name)]
                                    if a then
                                        if not found[s.k] then local r = whoRec(row, a); r.miss[#r.miss + 1] = m.name
                                        elseif l and l <= B.Lead(t, t.dur) then local r = whoRec(row, a); r.soon[#r.soon + 1] = { name = m.name, left = l, approx = ap } end
                                    end
                                end
                            else
                                local a = found.x
                                mdur = a and a.sid and t.durOf and t.durOf[a.sid] or t.dur
                                left, approx = leftOf(m, t.k, a, mdur, now)
                            end
                            local miss = (t.bless and have < want) or (not t.bless and have == 0)
                            local a = row.planned and not t.bless and own[t.k][short(m.name)]
                            if a then
                                if miss then local r = whoRec(row, a); r.miss[#r.miss + 1] = m.name
                                elseif left and left <= B.Lead(t, mdur) then local r = whoRec(row, a); r.soon[#r.soon + 1] = { name = m.name, left = left, approx = approx } end
                            end
                            if miss then row.miss[#row.miss + 1] = m.name
                            elseif left then
                                if left <= B.Lead(t, mdur) then row.soon[#row.soon + 1] = { name = m.name, left = left, approx = approx } end
                                if not row.min or left < row.min then row.min, row.approx = left, approx end
                            end
                        end
                    end
                end
                table.sort(row.soon, function(a, b) return a.left < b.left end)
                if row.who then for _, r in pairs(row.who) do table.sort(r.soon, function(a, b) return a.left < b.left end) end end
                if row.need > 0 then rows[#rows + 1] = row end
            end
        end
    end
    return rows
end
function B.Look(row)
    if #row.miss > 0 then return "miss" end
    if #row.soon > 0 then return "soon" end
    return "ok"
end
-- 该补的人：缺的在前，然后快到期的（剩得少的在前）
function B.Due(row)
    local out = {}
    for _, n in ipairs(row.miss) do out[#out + 1] = n end
    for _, s in ipairs(row.soon) do out[#out + 1] = s.name end
    return out
end

-- ---------- 提醒（只提醒能给的人；⛔ 只本地显示，不发言）----------
local function knowsSpell(t)
    for _, id in ipairs(t.ids or {}) do
        if ask(IsSpellKnown, id) or ask(IsPlayerSpell, id) then return true end
    end
    return false
end
B.Knows = knowsSpell
local function list3(names)
    local s = {}
    for i = 1, math.min(#names, 3) do s[i] = short(names[i]) end
    local txt = table.concat(s, L("、", ", "))
    if #names > 3 then txt = txt .. L(" 等", " +") .. (#names - 3) end
    return txt
end
-- 我能给的那几行里有没有该说的 → 一句话 | nil；me = 我（members 里那个）
--   own（可选）：有分配表、且这种 BUFF 在表里（row.planned）→ 只提醒负责人、只说他负责的那些人；别的行 / own = nil 照旧
function B.RemindText(rows, me, now, own)
    if not me or me.dead then return nil end
    now = now or gt()
    local parts = {}
    for _, row in ipairs(rows) do
        local t = row.t
        local mine = false
        local rmiss, rsoon, plan = row.miss, row.soon, false
        if own and row.planned then
            local w = row.who and row.who[short(me.name)]
            plan, mine = true, w ~= nil
            rmiss, rsoon = w and w.miss or {}, w and w.soon or {}
        else
            for _, n in ipairs(row.prov) do if n == me.name then mine = true end end
        end
        if plan and not mine then B.said[t.k] = nil end
        if mine and B.Nags(t) then
            local due = {}
            for _, n in ipairs(rmiss) do due[#due + 1] = n end
            for _, s in ipairs(rsoon) do due[#due + 1] = s.name end
            local last = B.said[t.k]
            local fresh = false
            if #due > 0 then
                local before = last and last.names or {}
                for _, n in ipairs(due) do if not before[n] then fresh = true end end
                if not fresh and last and now - last.at >= B.REPEAT then fresh = true end
            end
            if #due == 0 then B.said[t.k] = nil
            elseif fresh then
                local set = {}
                for _, n in ipairs(due) do set[n] = true end
                B.said[t.k] = { names = set, at = now }
                local p = (plan and L("你负责的", "your ") or "") .. B.Name(t)
                if #rmiss > 0 then p = p .. string.format(L(" 缺 %d（%s）", " missing %d (%s)"), #rmiss, list3(rmiss)) end
                if #rsoon > 0 then
                    local s = rsoon[1]
                    p = p .. string.format(L(" · 快到期 %d（%s %s%s）", " · expiring %d (%s %s%s)"), #rsoon, short(s.name), s.approx and "≈" or "", mmss(s.left))
                end
                parts[#parts + 1] = p
            end
        end
    end
    if #parts == 0 then return nil end
    return L("补 BUFF：", "Rebuff: ") .. table.concat(parts, L("；", "; "))
end
-- 就位确认：我自己缺什么（谁能给）
function B.SelfText(rows, me)
    if not me then return nil end
    local parts = {}
    for _, row in ipairs(rows) do
        for _, n in ipairs(row.miss) do
            if n == me.name then
                local giver = row.prov[1]
                parts[#parts + 1] = B.Name(row.t) .. (giver and giver ~= me.name and string.format(L("（%s 能给）", " (%s can)"), short(giver)) or "")
            end
        end
    end
    if #parts == 0 then return nil end
    return L("你缺：", "You're missing: ") .. table.concat(parts, L("、", ", "))
end
local function tell(msg)
    if not msg then return end
    if inCombat() then B.pend[#B.pend + 1] = msg; return end
    if UIErrorsFrame and UIErrorsFrame.AddMessage then pcall(UIErrorsFrame.AddMessage, UIErrorsFrame, msg, 1, 0.82, 0.1) end
    if ns.Print then ns.Print(msg) end
end
B.Tell = tell
function B.Flush()
    if #B.pend == 0 or inCombat() then return end
    local msg = table.concat(B.pend, L("；", "; "))
    for i = #B.pend, 1, -1 do B.pend[i] = nil end
    tell(msg)
end

-- ---------- 发话（⛔ 只在玩家点了菜单时；不带插件名）----------
function B.Send(text, chan, to)
    local BA = ns.BuffAsk
    if BA and BA.Send then return BA.Send(text, chan, to) end
    if inCombat() then return false end
    local send = (C_ChatInfo and C_ChatInfo.SendChatMessage) or SendChatMessage
    if not send then return false end
    return pcall(send, text, chan, nil, to)
end
-- 11-26 用户截图：快到期的说「快到期，还 N 分钟」，不说「缺」；两种都有 → 「缺X：甲；快到期（还 N 分钟）：乙」
local function dueText(row, max)
    local m, so, n = {}, {}, 0
    for _, x in ipairs(row.miss) do if n < max then n = n + 1; m[#m + 1] = short(x) end end
    for _, x in ipairs(row.soon) do if n < max then n = n + 1; so[#so + 1] = short(x.name) end end
    if n == 0 then return nil end
    local sep, nm, mt, st = CL("、", ", "), CL(row.t.cn, row.t.en)
    if #m > 0 then mt = string.format(CL("缺%s：%s", "Missing %s: %s"), nm, table.concat(m, sep)) end
    if #so > 0 then
        local left = row.soon[1].left or 0
        local mins = left < 60 and CL("不到 1 分钟", "under 1 min") or string.format(CL("还 %d 分钟", "%d min left"), math.floor(left / 60))
        st = string.format(mt and CL("快到期（%s）：%s", "expiring (%s): %s") or CL("%%s快到期，%s：%s", "%%s expiring, %s: %s"), mins, table.concat(so, sep))
        if not mt then st = string.format(st, nm) end
    end
    return mt and st and (mt .. CL("；", "; ") .. st) or mt or st
end
function B.MissText(row) return dueText(row, 8) end
function B.AskText(row)
    local d = dueText(row, 6)
    return d and string.format(CL("能帮忙补一下%s吗？%s", "Could you rebuff %s? %s"), CL(row.t.cn, row.t.en), d)
end
local function groupChan() return ask(IsInRaid) and "RAID" or "PARTY" end

-- ---------- 面板 ----------
B.COLOR = { ok = { 0.45, 1, 0.45 }, soon = { 1, 0.85, 0.1 }, miss = { 1, 0.3, 0.25 } }
B.ROWS = #B.TYPES
B.W = 230   -- 和全队灵魂石框同宽；贴在它下面时跟它的宽度
local function hex(c) return string.format("ff%02x%02x%02x", math.floor(c[1] * 255 + 0.5), math.floor(c[2] * 255 + 0.5), math.floor(c[3] * 255 + 0.5)) end
-- 11-26 用户截图「加上图标」：每行前面带技能图标（内嵌贴图，不多建控件；拿不到图标就不带）
function B.RowText(row)
    local c = B.COLOR[B.Look(row)]
    local s
    if #row.miss == 0 and #row.soon == 0 then
        s = L("全有", "all set") .. (row.min and ("  " .. (row.approx and "≈" or "") .. mmss(row.min)) or "")
    else
        local p = {}
        if #row.miss > 0 then p[#p + 1] = string.format(L("缺 %d", "missing %d"), #row.miss) end
        if #row.soon > 0 then p[#p + 1] = string.format(L("快到期 %d", "expiring %d"), #row.soon) end
        local m = row.soon[1] and row.soon[1].left or row.min
        if m then p[#p + 1] = (row.soon[1] and row.soon[1].approx and "≈" or "") .. mmss(m) end
        s = table.concat(p, " · ")
    end
    local far = row.far > 0 and string.format(L("  |cff9a9a9a读不到 %d|r", "  |cff9a9a9a%d out of range|r"), row.far) or ""
    local who = "|cff9a9a9a  ← " .. short(row.prov[1] or "") .. (#row.prov > 1 and ("+" .. (#row.prov - 1)) or "") .. "|r"
    -- 11-26 用户截图「加上图标」：行首带技能图标（内嵌贴图，不多建控件；拿不到就不带）
    local ok, tex = pcall((C_Spell and C_Spell.GetSpellTexture) or GetSpellTexture, (row.t.ids or row.t.sub[1].ids)[1])
    -- 11-26 用户截图「UI美化」：一行拆三栏（图标+名字 / 状态 / 谁给），面板按栏对齐；第一个返回值仍是整行
    local a, b = (ok and tex and ("|T" .. tex .. ":13:13:0:0:64:64:5:59:5:59|t ") or "") .. B.Name(row.t), "|c" .. hex(c) .. s .. "|r" .. far
    return a .. "  " .. b .. who, a, b, who
end
local win
local ui = { rows = {} }
B.ui = ui
B.manual = nil   -- /gi bc 手动开 / 收（本次登录）：nil = 按设置
function B.ShouldShow()
    if not B.On() or not ask(IsInGroup) then return false end
    if B.manual ~= nil then return B.manual end
    local s = B.DB().show
    if s == "never" then return false end
    if s == "always" then return true end
    local ok, inInst, kind = pcall(IsInInstance or none)
    return ok and clean(inInst) and (kind == "party" or kind == "raid") and true or false
end
local function savePos()
    if not win or B.attached then return end
    local p, _, _, x, y = win:GetPoint()
    B.DB().pos = { p or "CENTER", x or 0, y or 0 }
end
-- 右键菜单：row = 这一行的动作（说缺谁 / 密 XX 要）+ 提醒开关 +「设置…」；都不给 = 设置那一层（标题右键）
-- 开关只写一份：右键菜单和设置页（文件末尾）都用它。{ 设置 id 后缀, 库里的键, 中文, 英文 }
B.OPT = {
    { "nag", "nag", "该我补时提醒我（只本地显示）", "Remind me when I should rebuff (local only)" },
    { "always", "show", "出了副本也显示面板", "Show panel outside instances too" },
    { "short", "short", "也查战斗怒吼（短 BUFF）", "Also check Battle Shout (short)" },
    { "sit", "sit", "暗影防护到时间也提醒", "Remind for Shadow Protection too" },
}
function B.Opt(x)
    local v = B.DB()[x[2]]
    if x[1] == "nag" then return v ~= false end
    if x[1] == "always" then return v == "always" end
    return v == true
end
function B.SetOpt(x, v)
    local d = B.DB()
    if x[1] == "nag" then if v then d.nag = nil else d.nag = false end
    elseif x[1] == "always" then d.show = v and "always" or nil
    else d[x[2]] = v or nil end
    B.Update("set")
end
local function optItem(x)
    return { text = (B.Opt(x) and "|cff33ff66√|r " or "    ") .. L(x[3], x[4]), fn = function() B.SetOpt(x, not B.Opt(x)) end }
end
function B.MenuItems(row, brief)
    local items, d = {}, B.DB()
    if row then
        local mt = B.MissText(row)
        if mt then items[#items + 1] = { text = L("队伍里说缺谁：", "Say in group: ") .. "|cff9a9a9a" .. mt .. "|r", fn = function() B.Send(mt, groupChan()) end } end
        local at = B.AskText(row)
        if at then
            for i = 1, math.min(#row.prov, 3) do
                local p = row.prov[i]
                if p ~= ask(UnitName, "player") then items[#items + 1] = { text = string.format(L("密 %s 要", "Whisper %s"), short(p)), fn = function() local to = p; for _, m in ipairs(B.members or {}) do if m.name == p then to = m.full or p end end; B.Send(at, "WHISPER", to) end } end
            end
        end
    end
    if row or brief then
        items[#items + 1] = optItem(B.OPT[1])
        items[#items + 1] = { text = L("设置…", "Options…"), fn = function() B.Pop() end }
    else
        for _, x in ipairs(B.OPT) do items[#items + 1] = optItem(x) end
        items[#items + 1] = { text = string.format(L("提前 %d 分钟提醒（点一下换 3 / 5 / 10）", "Warn %d min early (click: 3 / 5 / 10)"), B.Warn()), fn = function()
            local w = B.Warn(); d.warn = (w < 5 and 5) or (w < 10 and 10) or 3; if d.warn == 5 then d.warn = nil end; B.Update("set") end }
        items[#items + 1] = { text = L("复位位置", "Reset position"), fn = function() d.pos = nil; if win and not inCombat() and not B.attached then win:ClearAllPoints(); win:SetPoint("CENTER", UIParent, "CENTER", -220, -60) end end }
        items[#items + 1] = { text = L("收起面板（/gi bc 再打开）", "Hide (/gi bc to show)"), fn = function() B.manual = false; B.Update("set") end }
    end
    return items, L("BUFF 检查", "Buff check") .. (row and (" · " .. B.Name(row.t)) or "")
end
-- 弹菜单：不盖面板 —— 贴在面板右边，右边放不下换左边；按 Esc / 点菜单和面板以外的地方关掉
function B.Pop(row, brief)
    if not ns.PopMenu or not win then return end
    local items, title = B.MenuItems(row, brief)
    local m = ns.PopMenu(win, title, items)
    if not m then return end
    local r, sw = win:GetRight(), UIParent and UIParent.GetWidth and UIParent:GetWidth()
    B.popLeft = type(r) == "number" and type(sw) == "number" and r + 218 > sw or false
    m:ClearAllPoints()
    if B.popLeft then m:SetPoint("TOPRIGHT", win, "TOPLEFT", -2, 0) else m:SetPoint("TOPLEFT", win, "TOPRIGHT", 2, 0) end
    if B.pop ~= m then
        B.pop = m
        GearInsightForeverPopMenu = m
        if type(UISpecialFrames) == "table" then table.insert(UISpecialFrames, "GearInsightForeverPopMenu") end
        pcall(B.ev.RegisterEvent, B.ev, "GLOBAL_MOUSE_DOWN")
    end
    return m
end
local function menu(self, mb)
    if mb == "RightButton" then B.Pop(rawget(self, "row")) end
end
local function rowButton(i)
    local b = CreateFrame("Button", "GearInsightForeverBuffCheckRow" .. i, win, "SecureActionButtonTemplate")
    b:SetHeight(16)
    if b.RegisterForClicks then b:RegisterForClicks("AnyDown") end
    b.hl = b:CreateTexture(nil, "HIGHLIGHT")
    b.hl:SetAllPoints(b); b.hl:SetColorTexture(1, 1, 1, 0.08)
    b.fs = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    b.fs:SetPoint("LEFT", 4, 0); b.fs:SetWidth(78); b.fs:SetJustifyH("LEFT")
    b.st = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    b.st:SetPoint("LEFT", 84, 0)
    b.who = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    b.who:SetPoint("LEFT", b.st, "RIGHT", 0, 0); b.who:SetPoint("RIGHT", -4, 0); b.who:SetJustifyH("RIGHT")
    for _, f in ipairs({ b.fs, b.st, b.who }) do if f.SetWordWrap then f:SetWordWrap(false) end end   -- 放不下就截掉，绝不折行压到下一行
    b:SetScript("PostClick", menu)
    ui.rows[i] = b
    return b
end
local function build()
    win = CreateFrame("Frame", "GearInsightForeverBuffCheck", UIParent)
    win:SetSize(B.W, 40); win:SetFrameStrata("MEDIUM"); win:SetClampedToScreen(true); win:SetMovable(true); win:EnableMouse(true)
    if win.RegisterForDrag then win:RegisterForDrag("LeftButton") end
    win:SetScript("OnDragStart", function(self) if not inCombat() and not B.attached then self:StartMoving() end end)
    win:SetScript("OnDragStop", function(self) self:StopMovingOrSizing(); savePos() end)
    win:SetScript("OnMouseUp", menu)
    -- 标题栏不再写「右键：…」（占宽度）：鼠标移上标题才提示
    win:SetScript("OnEnter", function(self)
        if not GameTooltip then return end
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:AddLine(L("右键标题：设置 · 右键某一行：说缺谁 / 密他要 · 左键：选中该补的人", "Right-click title: options · a row: announce / whisper · left-click: target"), 1, 1, 1)
        GameTooltip:Show()
    end)
    win:SetScript("OnLeave", GameTooltip_Hide)
    ui.bg = win:CreateTexture(nil, "BACKGROUND", nil, -2)
    ui.bg:SetAllPoints(win); ui.bg:SetColorTexture(0.04, 0.02, 0.06, 0.72)
    ui.tag = win:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ui.tag:SetPoint("TOPLEFT", 4, -3)
    ui.empty = win:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    ui.empty:SetPoint("TOPLEFT", 4, -18); ui.empty:SetPoint("RIGHT", -4, 0); ui.empty:SetJustifyH("LEFT")
    for i = 1, B.ROWS do rowButton(i) end
    -- 队长分配（_Party / _PartyUI，按需加载）：标题栏「分配」按钮；有分配表时底下多一行「我的任务」
    ui.assign = CreateFrame("Button", nil, win)
    ui.assign:SetSize(40, 14); ui.assign:SetPoint("TOPRIGHT", -2, -1)
    ui.assign.fs = ui.assign:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ui.assign.fs:SetAllPoints(ui.assign); ui.assign.fs:SetText("|cff66ccff[" .. L("分配", "Assign") .. "]|r")
    ui.assign:SetScript("OnClick", function() B.OpenAssign("") end)
    ui.mine = win:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    ui.mine:SetPoint("BOTTOMLEFT", 4, 3); ui.mine:SetPoint("RIGHT", -4, 0); ui.mine:SetJustifyH("LEFT")
    win:Hide()
    B.win = win
end
-- 全队灵魂石框显示着 → 贴在它下面；否则自己的位置
local function anchor()
    local SP = ns.SoulstoneParty
    local host = SP and SP.win
    local att = host ~= nil and host:IsShown() and true or false
    if att then local w = host:GetWidth(); win:SetWidth(type(w) == "number" and w > 0 and w or B.W) end
    if att == B.attached and rawget(win, "_placed") then return end
    win:ClearAllPoints()
    if att then win:SetPoint("TOPLEFT", host, "BOTTOMLEFT", 0, 0)
    else
        local pos = B.DB().pos
        if type(pos) == "table" and pos[1] then win:SetPoint(pos[1], UIParent, pos[1], tonumber(pos[2]) or 0, tonumber(pos[3]) or 0)
        else win:SetPoint("CENTER", UIParent, "CENTER", -220, -60) end
        win:SetWidth(B.W)
    end
    rawset(win, "_placed", true)
    B.attached = att
end
function B.Draw(rows)
    local fight = inCombat()
    if not B.ShouldShow() then
        if win and win:IsShown() and not fight then win:Hide() end
        return false
    end
    if not win then
        if fight then B.pendDraw = true; return false end
        build()
    end
    if not fight then anchor() end
    -- 贴在灵魂石框下面时不再重复写 GI（上面那块已经有了）
    ui.tag:SetText((B.attached and "|cff33ff99" or "|cff33ff99GI|r |cff33ff99") .. L("BUFF 检查", "Buff check") .. "|r" .. (fight and ("  |cffffd91a" .. L("战斗中 · 暂停检查", "in combat · paused") .. "|r") or ""))
    local n = math.min(#rows, B.ROWS)
    for i = 1, B.ROWS do
        local b, r = ui.rows[i], rows[i]
        if r and i <= n then
            local _, a, st, who = B.RowText(r)
            b.fs:SetText(a); b.st:SetText(st); b.who:SetText(who)
            b.row = r
            if not fight then
                b:ClearAllPoints(); b:SetPoint("TOPLEFT", win, "TOPLEFT", 0, -16 - (i - 1) * 16); b:SetPoint("RIGHT", win, "RIGHT", 0, 0)
                local due = B.Due(r)
                local m = due[1] and ("/target " .. short(due[1])) or ""
                if rawget(b, "_macro") ~= m then b:SetAttribute("type1", "macro"); b:SetAttribute("macrotext1", m); rawset(b, "_macro", m) end
                b:Show()
            end
        elseif not fight then
            b:Hide(); b.row = nil
        end
    end
    if #rows == 0 then ui.empty:SetText(L("队里没人能给常规 BUFF（牧师 / 法师 / 德鲁伊 / 圣骑士）", "Nobody here gives the usual buffs (priest / mage / druid / paladin)")); ui.empty:Show()
    else ui.empty:SetText(""); ui.empty:Hide() end
    local PP, mine = ns.PartyPlan, nil
    if PP and PP.MineLine then local ok, v = pcall(PP.MineLine, rows); mine = ok and v or nil end
    ui.mine:SetText(mine or "")
    if not fight then
        win:SetHeight(math.max(n, 1) * 16 + 20 + (mine and 14 or 0))
        win:Show()
        B.pendDraw = nil
    else
        B.pendDraw = true
    end
    return true
end

-- ---------- 刷新：事件合并 1 秒一次；组队期间每 5 秒一轮（跨过提醒线 / 倒计时）----------
local queued, looping = false, false
B.scans = 0
local function meOf(members) for _, m in ipairs(members) do if m.me then return m end end end
-- ---------- 队长分配的接收桩（设计稿 docs/forever/party-status-design.md 4.3）----------
--   _Party（分配模型 / 同步 / 我的任务）和 _PartyUI（大面板）都按需加载、都只试一次（没装 / HOLD 没进包 = 加载不上 = 检查器照旧）：
--     ① 收到第一条 GIFPS1 插件消息 ② 我是队长 / 助理且在团队或副本里 ③ 点「分配」/ /gi ps
local PS_PREFIX, triedParty, triedUI, wantParty = "GIFPS1", false, false, false
function B.LoadParty(withUI)
    local load = (C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn
    if not ns.PartyPlan and not triedParty and load then triedParty = true; pcall(load, "GearInsight_Forever_Party") end
    if withUI and ns.PartyPlan and not ns.PartyUI and not triedUI and load then triedUI = true; pcall(load, "GearInsight_Forever_PartyUI") end
    return ns.PartyPlan ~= nil
end
function B.LeadLoad()
    if triedParty or inCombat() then return end
    if not (ask(UnitIsGroupLeader, "player") or ask(UnitIsGroupAssistant, "player")) then return end
    local ok, inInst = pcall(IsInInstance or none)
    if ask(IsInRaid) or (ok and clean(inInst)) then B.LoadParty() end
end
function B.OpenAssign(rest)
    if inCombat() and not ns.PartyUI then ns.Print(L("战斗中打不开分配面板，脱战后再点", "Can't open assignments in combat")); return end
    B.LoadParty(true)
    rest = type(rest) == "string" and rest:gsub("^%s+", ""):gsub("%s+$", "") or ""
    local PP = ns.PartyPlan
    if PP and PP.Slash and PP.Slash(rest) then return end
    if ns.PartyUI and ns.PartyUI.Toggle then return ns.PartyUI.Toggle() end
    ns.Print(L("这个版本没带队长分配面板", "Assignments aren't in this build"))
end
function B.Update(why)
    if not B.On() or not ask(IsInGroup) then
        B.rows = {}
        B.Draw(B.rows)
        return nil
    end
    B.scans = B.scans + 1
    local members = B.Members()
    if not ns.PartyPlan then B.LeadLoad() end
    local PP, own, only = ns.PartyPlan, nil, nil
    if PP and PP.Own then local ok, a, b = pcall(PP.Own, members); if ok then own, only = a, b end end
    local rows = B.Compute(members, gt(), knowsSpell, own)
    B.rows, B.members = rows, members
    B.Draw(rows)
    local me = meOf(members)
    if not inCombat() then tell(B.RemindText(rows, me, nil, only and own or nil)) end
    if why == "ready" then tell(B.SelfText(rows, me)) end
    if PP and PP.Tick then pcall(PP.Tick, rows, me, why, members) end
    if B.wait then B.Queue() end
    B.Kick()
    return rows
end
local function loop()
    if not (B.On() and ask(IsInGroup)) then looping = false; return end
    pcall(B.Update, "tick")
    if C_Timer and C_Timer.After then C_Timer.After(B.LOOP, loop) else looping = false end
end
function B.Kick()
    if looping or not (C_Timer and C_Timer.After) then return false end
    looping = true
    C_Timer.After(B.LOOP, loop)
    return true
end
function B.Queue()
    if queued then return false end
    if not (C_Timer and C_Timer.After) then pcall(B.Update, "now"); return true end
    queued = true
    C_Timer.After(B.THROTTLE, function() queued = false; pcall(B.Update, "queue") end)
    return true
end
local function groupUnit(u) return type(u) == "string" and (u == "player" or u:find("^party%d") ~= nil or u:find("^raid%d") ~= nil) end
function B.OnEvent(e, a1, a2, a3, a4)
    if secret(a1) then return end
    if e == "CHAT_MSG_ADDON" then
        if a1 ~= PS_PREFIX or secret(a2) or secret(a4) then return end
        if not ns.PartyPlan then
            if inCombat() then wantParty = true; return end   -- 战斗中不加载：脱战后加载，_Party 自己会要一份表
            B.LoadParty()
        end
        local PP = ns.PartyPlan
        if PP and PP.OnMsg then PP.OnMsg(a2, a3, a4) end
        return
    end
    if e == "GLOBAL_MOUSE_DOWN" then
        local m = B.pop
        if m and m:IsShown() and not m:IsMouseOver() and not (win and win:IsMouseOver()) then m:Hide() end
        return
    end
    if e == "PLAYER_REGEN_ENABLED" and wantParty then wantParty = false; B.LoadParty() end
    local PP = ns.PartyPlan
    if PP and PP.OnEvent then pcall(PP.OnEvent, e, a1) end
    if e == "UNIT_AURA" then
        if groupUnit(a1) then B.Queue() end
    elseif e == "PLAYER_REGEN_ENABLED" then
        pcall(B.Update, "regen"); B.Flush()
    elseif e == "READY_CHECK" then
        pcall(B.Update, "ready")
    elseif e == "GROUP_ROSTER_UPDATE" then
        for n in pairs(B.st) do
            local live = false
            for _, u in ipairs(B.Units()) do if ask(UnitName, u) == n then live = true; break end end
            if not live then B.st[n], B.snap[n] = nil, nil end
        end
        if not ask(IsInGroup) then B.seenTalent, B.said, B.manual = {}, {}, nil end
        B.Queue()
    elseif e ~= "PLAYER_REGEN_DISABLED" then
        B.Queue()
    end
end
local ev = CreateFrame("Frame")
B.ev = ev
for _, e in ipairs({ "UNIT_AURA", "GROUP_ROSTER_UPDATE", "PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA", "PLAYER_REGEN_ENABLED", "READY_CHECK", "CHAT_MSG_ADDON" }) do pcall(ev.RegisterEvent, ev, e) end
ev:SetScript("OnEvent", function(_, e, a1, a2, a3, a4) pcall(B.OnEvent, e, a1, a2, a3, a4) end)
if C_ChatInfo and C_ChatInfo.RegisterAddonMessagePrefix then pcall(C_ChatInfo.RegisterAddonMessagePrefix, PS_PREFIX)
elseif RegisterAddonMessagePrefix then pcall(RegisterAddonMessagePrefix, PS_PREFIX) end

-- ---------- 命令：/gi bc（开 / 收面板）· /gi bc 提前 5 · /gi bc 显示 总是|副本|从不 ----------
function B.Slash(rest)
    rest = type(rest) == "string" and rest:gsub("^%s+", ""):gsub("%s+$", "") or ""
    local d = B.DB()
    local w = rest:match("^提前%s*(%d+)") or rest:match("^warn%s*(%d+)")
    if w then d.warn = tonumber(w); if d.warn == 5 then d.warn = nil end
        ns.Print(string.format(L("BUFF 检查：提前 %d 分钟提醒", "Buff check: warn %d min early"), B.Warn())); return B.Update("set") end
    local s = rest:match("^显示%s*(%S+)") or rest:match("^show%s*(%S+)")
    if s then
        d.show = ({ ["总是"] = "always", always = "always", ["从不"] = "never", never = "never" })[s]
        ns.Print(L("BUFF 检查：面板", "Buff check panel: ") .. (d.show == "always" and L("组队时总是显示", "always in group") or d.show == "never" and L("不自动显示（/gi bc 开）", "manual only (/gi bc)") or L("副本里组队时显示", "in instance groups")))
        return B.Update("set")
    end
    if not ask(IsInGroup) then ns.Print(L("BUFF 检查：不在队伍里", "Buff check: you're not in a group")); return end
    if B.DB().off then d.off = nil end
    B.manual = not (win and win:IsShown())
    return B.Update("slash")
end

if ns.ExtraSlash then
    ns.ExtraSlash.bc = B.Slash; ns.ExtraSlash["检查buff"] = B.Slash
    ns.ExtraSlash.ps = B.OpenAssign; ns.ExtraSlash["队伍"] = B.OpenAssign; ns.ExtraSlash["分配"] = B.OpenAssign   -- 队长分配（/gi ps probe = 探针）
end

-- 设置：加载后把细项补进「要 BUFF」组（总开关在 _Group 的 BuffCheckHook.lua，没加载也在）
do
    local g, all = ns.SettingsGroup and ns.SettingsGroup("buffask"), ns._SettingsItems
    if g and all then
        -- 每项只存自己的 4 个字段，一样的（type / indent / keys / group）放共用表里（省内存）
        local same = { __index = { type = "check", indent = 18, keys = "BUFF buff 检查 祝福 提醒", group = g } }
        for _, x in ipairs(B.OPT) do
            local id = "buffcheck." .. x[1]
            if not all[id] then
                local it = setmetatable({ id = id, text = L("BUFF 检查：", "Buff check: ") .. L(x[3], x[4]), get = function() return B.Opt(x) end, set = function(v) B.SetOpt(x, v) end }, same)
                g.items[#g.items + 1] = it
                all[id] = it
            end
        end
    end
end

if IsLoggedIn and IsLoggedIn() then pcall(B.Update, "load") end

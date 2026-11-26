-- HOLD：术士灵魂石追踪浮标（11-25 用户「做个UI来展示灵魂石绑定到谁身上，还多久，快到了高亮提醒」）
--   和 _Class 里的 Soulstone.lua（11-18「进本绑石头提醒」，HOLD）不是一回事：那个只在副本里的队伍中出小条、按全队光环扫「现在谁身上有我的石头」，
--     不记「我给谁上的」、出了队 / 下线 / 离开副本就什么都不知道。这里是「记账」：我（术士）每次用灵魂石都记下给了谁、什么时候，
--     按角色存档（墙钟），/reload、下线回来、对方出队都接着倒计时；能读到对方光环就以光环为准，读不到就按施法时间推算并标「推算」。
--   放在术士专属子插件 GearInsight_Forever_ClassWarlock（主插件 ClassStub.lua 只在术士登录时 LoadAddOn；非术士一个文件都不加载），文件头再挡一次。
-- ① 记录：UNIT_SPELLCAST_SENT（player）记施法目标名（castGUID 对上）→ UNIT_SPELLCAST_SUCCEEDED（player）法术是「灵魂石复活」→ 记一条
--     { 名字, 职业, 法术, 开始 / 到期墙钟 }；重新上石头覆盖旧记录。目标名拿不到 → 当前目标（友方玩家）→ 自己（没目标时物品默认给自己用）
-- ② 剩余：对方在队伍 / 团队里（或正是当前目标 / 焦点）且读得到 → 读他身上「灵魂石复活」光环（来源是我）的 expirationTime 为准（状态「有效」）；
--     读不到（太远 / 离线 / 保密值）→ 按施法时间推算（「推算」）；不在队伍 →「推算 · 对方不在队伍」
-- ③ 光环没了（见过光环之后，连续两次读到没有，且不在刚进世界的宽限里）：对方阵亡过 / 正阵亡 →「已使用」；快到期 →「已失效（到期）」；
--     其余 →「已失效（被取消 / 驱散）」；到了推算的到期时间 →「已失效（到期）」
-- ④ 物品冷却（30 分钟，五个等级共用一个冷却类别 831）：GetItemCooldown 读得到就用，读不到按我上次用石头的墙钟推算；背包里有没有灵魂石 / 碎片数
-- ⑤ 浮标（GI 品牌标）：灵魂石图标 + 名字（职业色）+ 剩余 mm:ss + 状态；剩余 < 提醒线（默认 5 分钟，可改）变黄并呼吸闪烁，< 1 分钟变红；
--     到期 / 已使用：屏幕上方一行字 + 聊天框一句（本地打印，⛔ 不发言），提示音可选（默认关）；战斗中只改颜色不弹字，脱战补说
--     左键 = 选中绑定对象（SecureActionButton 的 /target 宏，⛔ 不替玩家施法；属性只在脱战时改）；右键 = 菜单；拖动 = 挪位置（脱战）
--     隐藏浮标 ≠ 关功能（提醒照旧）；「窗口与提醒」里找回
-- ⑥ 数据（《无限》客户端 DB2 1.60.1.70790 核对；⛔ 不读任何第三方插件数据）：
--     物品 → 物品效果 → 法术：初级 5232 → 20707 · 次级 16892 → 20762 · 灵魂石 16893 → 20763 · 强效 16895 → 20764 · 特效 16896 → 20765
--     （ItemXItemEffect / ItemEffect：冷却 1800000 毫秒、类别 831）；五个法术名都是「灵魂石复活」/ Soulstone Resurrection（SpellName），
--     持续 DurationIndex 30 = 1800000 毫秒（SpellMisc / SpellDuration）；物品图标 134336 = INV_Misc_Orb_04；灵魂碎片 6265
--     运行时再用 GetItemSpell 读一遍物品上的法术名 / id 补进来（服务器改了 id 也认得）
-- ⛔ 不注册 COMBAT_LOG_EVENT_UNFILTERED；不建高频 OnUpdate（倒计时用 C_Timer 1 秒，只在有东西要走字时跑）；动画用 AnimationGroup；
--   每个接口 pcall / 判空，保密值不碰；战斗中不显示 / 隐藏 / 挪动浮标、不改安全属性（里面有安全按钮）
local _, ns = ...; ns = _G.GearInsightForever or ns
if not ns or select(2, UnitClass("player")) ~= "WARLOCK" then return end

local T = {}
ns.SoulstoneTrack = T
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function none() end
local function secret(v) return v ~= nil and ns.Secret ~= nil and ns.Secret(v) end
local function clean(v) if v == nil or secret(v) then return nil end return v end
local function num(v) v = clean(v); return v ~= nil and tonumber(v) or nil end
local function gt() return (GetTime and GetTime()) or 0 end
local function inCombat() local ok, v = pcall(InCombatLockdown or none); return ok and clean(v) and true or false end
-- 墙钟（秒）：/reload、下线回来照样接着算
local function wall()
    for _, f in ipairs({ GetServerTime or false, time or false }) do
        if f then
            local ok, v = pcall(f)
            v = ok and num(v)
            if v and v > 0 then return v end
        end
    end
    return 0
end
T.Wall = wall
local function ask(f, ...)
    if type(f) ~= "function" then return nil end
    local ok, v = pcall(f, ...)
    if not ok then return nil end
    return clean(v)
end
local function mmss(s)
    s = math.max(0, math.floor((tonumber(s) or 0) + 0.5))
    return string.format("%d:%02d", math.floor(s / 60), s % 60)
end
T.Fmt = mmss

-- ---------- 数据（来源见文件头 ⑥）----------
T.DUR = 1800          -- 灵魂石复活持续 30 分钟
T.CD = 1800           -- 物品冷却 30 分钟
T.CRIT = 60           -- 剩不到 1 分钟变红
T.GRACE = 5           -- 施法后 / 进世界后这么多秒内读不到光环不算「没了」
T.FINAL_SHOW = 300    -- 已使用 / 已失效在「只在有石头时显示」下再留 5 分钟
T.SHARD = 6265
T.ICON = "Interface\\Icons\\INV_Misc_Orb_04"
T.KEYS = "灵魂石 石头 绑石头 soulstone ss 术士 warlock"   -- 设置搜索词
T.ITEMS = {   -- { 物品, 法术（灵魂石复活）, 物品等级, 中文, 英文 }，高到低
    { 16896, 20765, 60, "特效灵魂石", "Major Soulstone" },
    { 16895, 20764, 50, "强效灵魂石", "Greater Soulstone" },
    { 16893, 20763, 40, "灵魂石", "Soulstone" },
    { 16892, 20762, 30, "次级灵魂石", "Lesser Soulstone" },
    { 5232, 20707, 18, "初级灵魂石", "Minor Soulstone" },
}
T.SPELL = {}
for _, it in ipairs(T.ITEMS) do T.SPELL[it[2]] = it end
T.NAMES = { ["灵魂石复活"] = true, ["Soulstone Resurrection"] = true }
T.CREATE = { 20757, 20756, 20755, 20752, 693 }   -- 制造灵魂石（学会任一 = 会做）
local learned = false
function T.LearnRuntime()
    if learned then return end
    local gis = (C_Item and C_Item.GetItemSpell) or GetItemSpell
    if type(gis) ~= "function" then learned = true; return end
    local got = false
    for _, it in ipairs(T.ITEMS) do
        local ok, n, id = pcall(gis, it[1])
        if ok then
            n, id = clean(n), num(id)
            if type(n) == "string" and n ~= "" then T.NAMES[n] = true; got = true end
            if id and not T.SPELL[id] then T.SPELL[id] = it end
        end
    end
    learned = got   -- 物品信息还没缓存（第一次读拿不到）→ 下次再读
end
function T.IsStoneSpell(id) id = num(id); return id ~= nil and T.SPELL[id] ~= nil end

-- ---------- 设置（ns.db.ssTrack；记录按角色 ssTrack.chars[角色-服务器]）----------
T.DEF = { warn = 5 }
function T.DB()
    if type(ns.db) ~= "table" then return {} end
    if type(ns.db.ssTrack) ~= "table" then ns.db.ssTrack = {} end
    return ns.db.ssTrack
end
function T.On() return ns.db ~= nil and T.DB().on ~= false end
function T.OrbOn() return T.DB().orb ~= false end
function T.Always() return T.DB().always ~= false end
function T.SoundOn() return T.DB().sound == true end
function T.Warn()
    local v = tonumber(T.DB().warn)
    if v and v >= 0 then return v end
    return T.DEF.warn
end
function T.SetWarn(v)
    v = tonumber(v)
    if v and v >= 0 and v <= 30 and math.floor(v) ~= T.DEF.warn then T.DB().warn = math.floor(v) else T.DB().warn = nil end
    T.Update("set")
end
local function charKey()
    if ns._CharKey then local ok, k = pcall(ns._CharKey); if ok and type(k) == "string" then return k end end
    return (ask(UnitName, "player") or "?") .. "-" .. (ask(GetRealmName) or "?")
end
function T.Char()
    local db = T.DB()
    if type(db.chars) ~= "table" then db.chars = {} end
    local k = charKey()
    if type(db.chars[k]) ~= "table" then db.chars[k] = {} end
    return db.chars[k]
end
function T.Rec() local r = T.Char().rec; return type(r) == "table" and r or nil end

-- ---------- 队伍 / 单位 ----------
local function nameOf(u)
    local n = ask(UnitName, u)
    return type(n) == "string" and n ~= "" and n or nil
end
local function base(n) return type(n) == "string" and (n:match("^([^%-]+)") or n) or nil end
T.Base = base
local function exists(u) if u == "player" then return true end; return ask(UnitExists, u) and true or false end
-- 队友 / 团员 unit 列表（含自己）
function T.Units()
    local out = { "player" }
    local n = num(ask(GetNumGroupMembers)) or 0
    if ask(IsInRaid) then
        for i = 1, math.min(n, 40) do out[#out + 1] = "raid" .. i end
    elseif ask(IsInGroup) or n > 0 then
        for i = 1, 4 do out[#out + 1] = "party" .. i end
    end
    return out
end
-- 名字 → unit, 在不在队伍里（当前目标 / 焦点也算「找得到」，但不算在队伍）
function T.FindUnit(name)
    local b = base(name)
    if not b then return nil, false end
    for _, u in ipairs(T.Units()) do
        if exists(u) and base(nameOf(u)) == b then return u, true end
    end
    for _, u in ipairs({ "target", "focus" }) do
        if exists(u) and ask(UnitIsPlayer, u) and base(nameOf(u)) == b then return u, false end
    end
    return nil, false
end
local function classOf(u)
    local ok, _, c = pcall(UnitClass or none, u)
    c = ok and clean(c)
    return type(c) == "string" and c or nil
end
local function dead(u) return ask(UnitIsDeadOrGhost, u) and true or false end
-- 读得到这个人的光环吗（离线 / 太远 = 读不到；接口不存在 = 当读得到）
local function readable(u)
    if u == "player" then return true end
    if UnitIsConnected then
        local ok, v = pcall(UnitIsConnected, u)
        if ok and not secret(v) and not v then return false end
    end
    if UnitIsVisible then
        local ok, v = pcall(UnitIsVisible, u)
        if ok and not secret(v) and not v then return false end
    end
    return true
end
local function isMe(u)
    if u == nil or u == "player" then return true end
    local ok, v = pcall(UnitIsUnit or none, u, "player")
    if not ok or secret(v) then return true end   -- 读不到来源 = 多半是我
    return v and true or false
end
-- 第 i 个增益 → { name, sid, src, exp } | "secret" | nil（到头了）
local function auraAt(u, i)
    if C_UnitAuras and C_UnitAuras.GetAuraDataByIndex then
        local ok, a = pcall(C_UnitAuras.GetAuraDataByIndex, u, i, "HELPFUL")
        if not ok or a == nil then return nil end
        if secret(a) or type(a) ~= "table" then return "secret" end
        local name, sid = clean(a.name), num(a.spellId)
        if name == nil and sid == nil then return "secret" end
        return { name = name, sid = sid, src = clean(a.sourceUnit), exp = num(a.expirationTime) }
    end
    local f = UnitAura or UnitBuff
    if not f then return nil end
    local ok, name, _, _, _, _, exp, src, _, _, sid = pcall(f, u, i, UnitAura and "HELPFUL" or nil)
    if not ok then return nil end
    if secret(name) then return "secret" end
    if name == nil then return nil end
    return { name = name, sid = num(sid), src = clean(src), exp = num(exp) }
end
-- 这个人身上我的灵魂石 → 光环表 | nil（没有）| "secret"（读不全）
function T.AuraOn(u)
    T.LearnRuntime()
    local sawSecret = false
    for i = 1, 40 do
        local a = auraAt(u, i)
        if a == nil then break end
        if a == "secret" then sawSecret = true
        elseif ((a.sid and T.SPELL[a.sid]) or (a.name and T.NAMES[a.name])) and isMe(a.src) then return a end
    end
    if sawSecret then return "secret" end
    return nil
end

-- ---------- 背包 / 冷却 / 会不会做 ----------
local function count(id) return num(ask((C_Item and C_Item.GetItemCount) or GetItemCount, id)) or 0 end
-- → 最好的一块（物品行）, 灵魂石总数, 碎片数
function T.Bag()
    local best, total = nil, 0
    for _, it in ipairs(T.ITEMS) do
        local c = count(it[1])
        if c > 0 then total = total + c; best = best or it end
    end
    return best, total, count(T.SHARD)
end
-- → 剩余秒（0 = 好了）, 来源（"item" 读物品冷却 / "calc" 按上次用石头推算）；都不知道 = nil
function T.Cooldown()
    local f = (C_Container and C_Container.GetItemCooldown) or GetItemCooldown
    local got = false
    if type(f) == "function" then
        for _, it in ipairs(T.ITEMS) do
            local ok, s, d = pcall(f, it[1])
            if ok and not secret(s) and not secret(d) then
                s, d = tonumber(s), tonumber(d)
                if s and d then
                    got = true
                    if s > 0 and d > 1.5 then   -- > 1.5 秒：排除公共冷却
                        local left = s + d - gt()
                        if left > 0 then return left, "item" end
                    end
                end
            end
        end
    end
    local c = T.Char()
    local left = tonumber(c.cdUntil) and (c.cdUntil - wall()) or nil
    if got then return 0, "item" end
    if left and left > 0 then return left, "calc" end
    if left then return 0, "calc" end
    return nil
end
local function knows(id)
    for _, f in ipairs({ IsPlayerSpell or false, IsSpellKnown or false }) do
        if f then
            local ok, v = pcall(f, id)
            if ok and clean(v) then return true end
        end
    end
    return false
end
-- 会做 / 包里有 / 有记录 = 这个术士用得上灵魂石（「一直显示」只在这时出浮标）
function T.Knows()
    if T.Rec() then return true end
    for _, id in ipairs(T.CREATE) do if knows(id) then return true end end
    local _, n = T.Bag()
    return n > 0
end

-- ---------- 记录 ----------
local sent = {}   -- castGUID → 目标名
T._sent = sent
function T.OnSent(target, guid, sid)
    if not T.IsStoneSpell(sid) then return end
    target = clean(target)
    local k = clean(guid) or "last"
    sent[k] = (type(target) == "string" and target ~= "") and target or false
    sent.last = sent[k]
end
-- 施法成功：给谁？→ SENT 的目标名 → 当前目标（友方玩家）→ 自己
local function castTarget(guid)
    local k = clean(guid)
    local n = (k and sent[k]) or sent.last
    for key in pairs(sent) do sent[key] = nil end
    if type(n) == "string" and n ~= "" then return n end
    if exists("target") and ask(UnitIsPlayer, "target") and ask(UnitIsFriend, "player", "target") then
        local tn = nameOf("target")
        if tn then return tn end
    end
    return nameOf("player")
end
function T.OnCast(guid, sid)
    sid = num(sid)
    if not T.IsStoneSpell(sid) then return false end
    local name = castTarget(guid)
    if not name then return false end
    local w = wall()
    local u = T.FindUnit(name)
    if not u and exists("target") and base(nameOf("target")) == base(name) then u = "target" end
    local it = T.SPELL[sid]
    local c = T.Char()
    c.rec = { name = name, cls = u and classOf(u) or nil, spell = sid, item = it and it[1] or nil,
        t0 = w, exp = w + T.DUR, st = "on", src = "calc" }
    c.cdUntil = w + T.CD
    T.miss, T.castAt = 0, gt()
    T.Update("cast")
    return true
end
T.WHY = {
    used = { "已使用", "Used" },
    expired = { "已失效（到期）", "Expired" },
    gone = { "已失效（被取消 / 驱散）", "Gone (cancelled / dispelled)" },
}
local pend = {}   -- 战斗中没说的提醒，脱战补说
T._pend = pend
local function top(msg)
    if UIErrorsFrame and UIErrorsFrame.AddMessage then pcall(UIErrorsFrame.AddMessage, UIErrorsFrame, msg, 1, 0.82, 0.1) end
end
T.Top = top
-- 提醒：屏幕上方一行 + 聊天框一句（⛔ 本地打印，不发任何聊天消息）；战斗中先存着
function T.Notify(msg)
    if inCombat() then pend[#pend + 1] = msg; return false end
    top(msg)
    if ns.Print then ns.Print(msg) end
    if T.SoundOn() and PlaySound then pcall(PlaySound, 8959) end
    return true
end
function T.Flush()
    if inCombat() or #pend == 0 then return 0 end
    local n = #pend
    local msg = pend[n]
    if n > 1 then msg = table.concat(pend, L("；", "; ")) end
    for i = n, 1, -1 do pend[i] = nil end
    T.Notify(msg)
    return n
end
local function bagHint()
    local best, _, shards = T.Bag()
    if best then return "" end
    return string.format(L("  包里没灵魂石了，记得做一块（碎片 %d）", "  No soulstone in your bags - make one (shards: %d)"), shards)
end
-- 记录结束：st = used / expired / gone；silent = 不喊（下线期间早就到期的）
function T.Finish(r, st, silent)
    if not r or r.st ~= "on" then return end
    r.st, r.endAt = st, wall()
    if silent then return end
    local who = r.name or "?"
    local msg
    if st == "used" then msg = string.format(L("%s 用掉了你的灵魂石（已使用）", "%s used your soulstone"), who)
    elseif st == "expired" then msg = string.format(L("%s 身上的灵魂石到期了（已失效）", "Soulstone on %s expired"), who)
    else msg = string.format(L("%s 身上的灵魂石没了（被取消 / 驱散，已失效）", "Soulstone on %s is gone (cancelled / dispelled)"), who) end
    T.Notify(msg .. bagHint())
    -- 11-25 用户「灵魂石没了弹窗问是否提醒」：弹框问要不要补（代码在按需加载的 GearInsight_Forever_SSPop；给自己的不问）
    if r.name and base(r.name) ~= base(nameOf("player")) and ns.SSPopLoad and ns.SSPopLoad() then
        local who, t0 = r.name, r.t0
        pcall(ns.SSGone, "me", { who = who, kind = st, key = "me:" .. who .. "@" .. tostring(t0), target = T.LeftClick,
            still = function() local x = T.Rec(); return x ~= nil and x.t0 == t0 and x.st ~= "on" end })
    end
end
ns.SSPopLoad = ns.SSPopLoad or function()
    if ns.SSGone then return true end
    if not (ns.db and ns.db.ssGonePop ~= false) then return false end
    pcall((C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn, "GearInsight_Forever_SSPop")
    return ns.SSGone ~= nil
end
function T.Clear() T.Char().rec = nil; T.Update("clear") end
-- 老的进本提醒（_Class 的 Soulstone.lua）问：这块石头归不归我喊（有生效中的记录 / 刚结束 1 分钟内）
function T.Owns()
    local r = T.Rec()
    if not (T.On() and r) then return false end
    if r.st == "on" then return true end
    return wall() - (tonumber(r.endAt) or 0) < 60
end

-- ---------- 算状态 ----------
-- → view { kind = none / aura（光环为准）/ calc（推算，far = 读不到）/ away（不在队伍，推算）/ used / expired / gone, left, unit, rec }
T.miss, T.castAt, T.graceUntil = 0, -1e9, 0
T.fresh = true   -- 这次加载后还没算过：下线 / 重载期间早就到期的不喊
function T.Eval()
    local fresh = T.fresh
    T.fresh = false
    local r = T.Rec()
    if not r then return { kind = "none" } end
    local w = wall()
    if r.st ~= "on" then return { kind = r.st, rec = r } end
    local exp = tonumber(r.exp) or (tonumber(r.t0) or w) + T.DUR
    local left = exp - w
    local u, inGrp = T.FindUnit(r.name)
    local v = { kind = "away", left = left, rec = r, unit = u, inGroup = inGrp }
    if u then
        if not r.cls then r.cls = classOf(u) end
        local a = "secret"
        if readable(u) then a = T.AuraOn(u) end
        if type(a) == "table" then
            r.seen, r.src, T.miss = true, "aura", 0
            if a.exp and a.exp > 0 then
                r.exp = w + (a.exp - gt())
                left = r.exp - w
            end
            if dead(u) then r.sawDead = true end
            v.kind, v.left = "aura", left
        elseif a == nil then
            -- 读得到、身上没有：见过光环 + 不在宽限里 + 连续两次 → 没了；没见过（光环 id 对不上 / 刚施法）→ 照推算走，不乱判
            local t = gt()
            if r.seen and t - T.castAt >= T.GRACE and t >= T.graceUntil then
                if T.miss == 0 then T.missAt = t end
                T.miss = T.miss + 1
                if T.miss >= 2 and t - (T.missAt or t) >= 1 then   -- 隔 ≥ 1 秒连续两次读到没有（防一瞬间的空数据）
                    T.miss = 0
                    -- 灵魂已释放（鬼魂）没用上 → 失效；阵亡过 / 正阵亡 → 用掉了；快到期 → 到期；其余 → 被取消 / 驱散
                    local st = "gone"
                    if ask(UnitIsGhost, u) then st = "gone"
                    elseif r.sawDead or dead(u) then st = "used"
                    elseif left <= 5 then st = "expired" end
                    T.Finish(r, st)
                    return { kind = st, rec = r }
                end
            end
            v.kind = "calc"
        else
            v.kind, v.far = "calc", true
        end
        r.src = v.kind == "aura" and "aura" or "calc"
    else
        r.src = "calc"
    end
    if left <= 0 then
        T.Finish(r, "expired", fresh and left < -60)
        return { kind = "expired", rec = r }
    end
    return v
end
function T.Look(v)
    if v.kind == "aura" or v.kind == "calc" or v.kind == "away" then
        if v.left <= T.CRIT then return "crit" end
        if v.left <= T.Warn() * 60 then return "warn" end
        return "ok"
    end
    if v.kind == "none" then return "idle" end
    return "done"
end
function T.StateText(v)
    local k = v.kind
    if k == "aura" then return L("有效", "Active") end
    if k == "calc" then return v.far and L("推算 · 太远读不到", "Estimated (out of range)") or L("推算", "Estimated") end
    if k == "away" then return L("推算 · 对方不在队伍", "Estimated (not in group)") end
    if k == "none" then return L("没绑", "Not bound") end
    local w = T.WHY[k]
    return w and L(w[1], w[2]) or tostring(k)
end
local function classColor(cls)
    local t = cls and RAID_CLASS_COLORS and RAID_CLASS_COLORS[cls]
    if type(t) == "table" and tonumber(t.r) then return t.r, t.g, t.b end
    return 1, 1, 1
end
local function hex(r, g, b) return string.format("ff%02x%02x%02x", math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5), math.floor(b * 255 + 0.5)) end
function T.NameText(r)
    if not r or not r.name then return L("灵魂石", "Soulstone") end
    return "|c" .. hex(classColor(r.cls)) .. r.name .. "|r"
end
function T.CdText()
    local cd, src = T.Cooldown()
    local s
    if cd == nil then s = L("冷却未知", "cooldown unknown")
    elseif cd > 0 then s = string.format(L("冷却 %s", "cooldown %s"), mmss(cd)) .. (src == "calc" and L("（推算）", " (est.)") or "")
    else s = L("|cff7fbf7f冷却好了|r", "|cff7fbf7fready|r") end
    local best, n, shards = T.Bag()
    local b
    if best then b = string.format(L("包里 %s ×%d", "bags: %s x%d"), L(best[4], best[5]), n)
    else b = string.format(L("|cffff9933包里没灵魂石|r（碎片 %d）", "|cffff9933no soulstone|r (shards %d)"), shards) end
    return s .. "  ·  " .. b
end

-- ---------- 浮标 ----------
local win
local ui = {}
T.ui = ui
T.COLOR = { ok = { 0.45, 1, 0.45 }, warn = { 1, 0.85, 0.1 }, crit = { 1, 0.2, 0.15 }, done = { 0.6, 0.6, 0.6 }, idle = { 0.75, 0.55, 1 } }
local MASK = "Interface\\CharacterFrame\\TempPortraitAlphaMask"
T.BTN = "GearInsightForeverSoulstoneTrackBtn"
local function circle(owner, tex)
    if not (tex.AddMaskTexture and owner.CreateMaskTexture) then return end
    local m = owner:CreateMaskTexture()
    if not m then return end
    m:SetTexture(MASK, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    m:SetAllPoints(tex)
    tex:AddMaskTexture(m)
end
local DEF_POS = { "CENTER", 200, -170 }
local function place(f)
    f:ClearAllPoints()
    local pos = T.DB().pos
    if type(pos) == "table" and pos[1] then f:SetPoint(pos[1], UIParent, pos[1], tonumber(pos[2]) or 0, tonumber(pos[3]) or 0)
    else f:SetPoint(DEF_POS[1], UIParent, DEF_POS[1], DEF_POS[2], DEF_POS[3]) end
end
local function savePos()
    if not win then return end
    local p, _, _, x, y = win:GetPoint()
    T.DB().pos = { p or "CENTER", x or 0, y or 0 }
end
function T.ResetPos()
    if inCombat() then return false end
    T.DB().pos = nil
    if win then place(win) end
    return true
end
-- 开 = 存 nil（默认开），关 = 存 false
local function flag(key, v) if v then T.DB()[key] = nil else T.DB()[key] = false end; T.Update("set") end
function T.SetOn(v) flag("on", v) end
function T.SetOrb(v) flag("orb", v) end
function T.SetAlways(v) flag("always", v) end
function T.SetSound(v) T.DB().sound = v and true or nil end

local function tip(self)
    if not GameTooltip then return end
    local v = T.view or T.Eval()
    local r = v.rec
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:AddLine("|cff33ff99GearInsight|r · " .. L("灵魂石追踪", "Soulstone tracker"), 1, 0.82, 0)
    if r then
        GameTooltip:AddLine(L("绑定：", "On: ") .. T.NameText(r), 1, 1, 1)
        local ago = math.max(0, wall() - (tonumber(r.t0) or wall()))
        local ok, hm = pcall(date or none, "%H:%M", r.t0)
        GameTooltip:AddLine(string.format(L("上石头：%s（%d 分钟前）", "Cast: %s (%d min ago)"), (ok and type(hm) == "string") and hm or "?", math.floor(ago / 60)), 1, 1, 1)
        if v.left then
            local how = v.kind == "aura" and L("读对方光环（实时）", "from their buff (live)") or L("按施法时间推算", "estimated from cast time")
            GameTooltip:AddLine(string.format(L("剩余：%s（%s）", "Left: %s (%s)"), mmss(v.left), how), 1, 1, 1)
        end
        local c = T.COLOR[T.Look(v)] or T.COLOR.done
        GameTooltip:AddLine(L("状态：", "Status: ") .. T.StateText(v), c[1], c[2], c[3])
    else
        GameTooltip:AddLine(L("还没给人上灵魂石（用了之后这里显示给了谁、剩多久）", "No soulstone out yet (cast one and it shows here)"), 1, 1, 1, true)
    end
    GameTooltip:AddLine(T.CdText(), 1, 1, 1, true)
    GameTooltip:AddLine(string.format(L("剩不到 %d 分钟变黄闪烁、1 分钟变红；到期 / 用掉时屏幕上方 + 聊天框提醒（只有你看得到）",
        "Yellow + pulse under %d min, red under 1 min; you get a local alert when it expires / is used"), T.Warn()), 0.75, 0.75, 0.75, true)
    local tn = r and r.name
    GameTooltip:AddLine(tn and string.format(L("左键：选中 %s（补石头用；插件不替你施法）  ·  右键：菜单  ·  拖动：移动", "Left: target %s (to re-stone; you cast it)  ·  Right: menu  ·  Drag: move"), tn)
        or L("右键：菜单  ·  拖动：移动", "Right: menu  ·  Drag: move"), 0.25, 0.9, 0.35, true)
    GameTooltip:Show()
end
T.Tip = tip

function T.MenuItems()
    local items = {
        { text = L("在聊天框看详情", "Details in chat"), fn = function() T.Report() end },
        { text = (T.Always() and L("|cff33ff66√|r 一直显示（点了改成只在有石头时）", "|cff33ff66√|r Always show (click: only with a stone out)")
            or L("    只在有石头时显示（点了改成一直显示）", "    Only with a stone out (click: always show)")), fn = function() T.SetAlways(not T.Always()) end },
        { text = (T.SoundOn() and "|cff33ff66√|r " or "    ") .. L("提示音", "Sound"), fn = function() T.SetSound(not T.SoundOn()) end },
        { text = L("清除这条记录", "Clear this record"), fn = function() T.Clear() end },
        { text = L("复位位置", "Reset position"), fn = function() T.ResetPos() end },
        { text = L("隐藏浮标（提醒照旧；窗口与提醒里找回）", "Hide the icon (alerts stay; restore in Windows & alerts)"), fn = function()
            T.SetOrb(false)
            ns.Print(L("灵魂石浮标已隐藏（到期 / 用掉的提醒照旧）。找回：GI 菜单 → 设置 → 窗口与提醒「灵魂石追踪浮标」，或 /gi 灵魂石追踪 orb on",
                "Soulstone icon hidden (alerts stay). Bring it back: GI menu > Settings > Windows & alerts, or /gi sst orb on"))
        end },
    }
    return items, "|cff33ff99GI|r · " .. L("灵魂石追踪", "Soulstone tracker")
end
function T.Menu(anchor)
    if not ns.PopMenu then return false end
    local items, title = T.MenuItems()
    ns.PopMenu(anchor or win, title, items)
    if GameTooltip then GameTooltip:Hide() end
    return true
end
-- 左键（安全按钮已经执行完 /target 之后）：只说一句，不施法
T.lastTell = -1e9
function T.LeftClick()
    local r = T.Rec()
    if not r or not r.name then T.Report(); return "report" end
    if gt() - T.lastTell < 8 then return "quiet" end   -- 按下就响 → 拖动时也会走到这里：8 秒内只说一次
    T.lastTell = gt()
    local _, inGrp = T.FindUnit(r.name)
    if not inGrp and not (exists("target") and base(nameOf("target")) == base(r.name)) then
        ns.Print(string.format(L("%s 不在队伍里，选不中；等他回来或走近再补石头", "%s isn't in your group - can't target them"), r.name))
        return "away"
    end
    local best = T.Bag()
    if best then ns.Print(string.format(L("已选中 %s：用背包里的%s给他补上（插件不能替你施法）", "Targeted %s: use your %s on them (the addon can't cast for you)"), r.name, L(best[4], best[5])))
    else ns.Print(string.format(L("已选中 %s，但包里没灵魂石：先做一块", "Targeted %s, but you have no soulstone - make one first"), r.name)) end
    return "target"
end
-- 安全属性：左键 = /target 绑定对象（⛔ 只在脱战时改；不施法）
T.attrWrites = 0
function T.SyncAttr()
    local b = ui.btn
    if not b or inCombat() then return false end
    local r = T.Rec()
    local macro = (r and r.name) and ("/target " .. base(r.name)) or nil
    if rawget(b, "_macro") == (macro or false) then return true end
    if macro then b:SetAttribute("type1", "macro"); b:SetAttribute("macrotext1", macro)
    else b:SetAttribute("type1", nil); b:SetAttribute("macrotext1", nil) end
    rawset(b, "_macro", macro or false)
    T.attrWrites = T.attrWrites + 1
    return true
end
local function newAG(region)
    if not (region and region.CreateAnimationGroup) then return nil end
    local ok, g = pcall(region.CreateAnimationGroup, region)
    return ok and g or nil
end
local function buildPulse(region)
    local g = newAG(region)
    if not g then return nil end
    local ok = pcall(function()
        local a = g:CreateAnimation("Alpha")
        if a.SetFromAlpha then a:SetFromAlpha(0.15); a:SetToAlpha(0.95) elseif a.SetChange then a:SetChange(0.8) end
        a:SetDuration(0.7)
        g:SetLooping("BOUNCE")
    end)
    return ok and g or nil
end
local function buildWin()
    local f = CreateFrame("Frame", "GearInsightForeverSoulstoneTrack", UIParent)
    f:SetSize(176, 50); f:SetFrameStrata("MEDIUM"); f:SetClampedToScreen(true)
    place(f)
    f:SetMovable(true)
    ui.tag = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ui.tag:SetPoint("BOTTOMLEFT", f, "TOPLEFT", 2, -2)
    ui.tag:SetText("|cff33ff99GI|r " .. L("灵魂石", "Soulstone"))
    ui.glow = f:CreateTexture(nil, "BACKGROUND", nil, 0)
    ui.glow:SetSize(46, 46); ui.glow:SetPoint("LEFT", f, "LEFT", -2, 0)
    ui.glow:SetTexture("Interface\\Buttons\\UI-ActionButton-Border"); ui.glow:SetBlendMode("ADD")
    ui.glow:SetAlpha(0)
    ui.disc = f:CreateTexture(nil, "BACKGROUND", nil, 1)
    ui.disc:SetSize(36, 36); ui.disc:SetPoint("LEFT", f, "LEFT", 3, 0); ui.disc:SetColorTexture(0.06, 0.03, 0.08, 0.95)
    circle(f, ui.disc)
    ui.ic = f:CreateTexture(nil, "ARTWORK")
    ui.ic:SetSize(30, 30); ui.ic:SetPoint("CENTER", ui.disc, "CENTER", 0, 0); ui.ic:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    ui.ic:SetTexture(T.ICON)
    circle(f, ui.ic)
    ui.ring = f:CreateTexture(nil, "OVERLAY", nil, 1)
    ui.ring:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    ui.ring:SetSize(68, 68); ui.ring:SetPoint("TOPLEFT", ui.disc, "TOPLEFT", -5, 5)
    ui.bg = f:CreateTexture(nil, "BACKGROUND", nil, -1)
    ui.bg:SetPoint("TOPLEFT", ui.disc, "TOPRIGHT", -4, -2); ui.bg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 6)
    ui.bg:SetColorTexture(0.04, 0.02, 0.06, 0.72)
    ui.name = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    ui.name:SetPoint("TOPLEFT", ui.disc, "TOPRIGHT", 4, 1); ui.name:SetPoint("RIGHT", f, "RIGHT", -4, 0); ui.name:SetJustifyH("LEFT")
    ui.time = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    ui.time:SetPoint("TOPLEFT", ui.name, "BOTTOMLEFT", 0, -1)
    ui.state = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    ui.state:SetPoint("LEFT", ui.time, "RIGHT", 5, 0); ui.state:SetPoint("RIGHT", f, "RIGHT", -4, 0); ui.state:SetJustifyH("LEFT")
    ui.sub = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    ui.sub:SetPoint("TOPLEFT", ui.time, "BOTTOMLEFT", 0, -1); ui.sub:SetPoint("RIGHT", f, "RIGHT", -4, 0); ui.sub:SetJustifyH("LEFT")
    for _, fs in ipairs({ ui.time, ui.state }) do
        local font, sz = fs:GetFont()
        if font then pcall(fs.SetFont, fs, font, math.max(11, tonumber(sz) or 11), "OUTLINE") end
    end
    ui.pulse = buildPulse(ui.glow)
    -- 整个浮标盖一层安全按钮：左键 /target（安全属性），右键菜单，拖动挪位置（战斗中不能挪：里面有安全按钮）
    local b = CreateFrame("Button", T.BTN, f, "SecureActionButtonTemplate")
    b:SetAllPoints(f)
    if b.RegisterForClicks then b:RegisterForClicks("AnyDown") end   -- 和仓库里其它安全按钮一样按下就响（游戏里验过的写法）
    if b.RegisterForDrag then b:RegisterForDrag("LeftButton") end
    b:SetScript("OnEnter", tip)
    b:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
    b:SetScript("PostClick", function(self, mb)
        if GameTooltip then GameTooltip:Hide() end
        if mb == "RightButton" then T.Menu(self) else T.LeftClick() end
    end)
    b:SetScript("OnDragStart", function() if not inCombat() then f:StartMoving() end end)
    b:SetScript("OnDragStop", function() f:StopMovingOrSizing(); savePos() end)
    ui.btn = b
    f:Hide()
    return f
end
function T.ShouldShow(v)
    if not (T.On() and T.OrbOn()) then return false end
    local k = v.kind
    if k == "aura" or k == "calc" or k == "away" then return true end
    if k ~= "none" and v.rec and wall() - (tonumber(v.rec.endAt) or 0) < T.FINAL_SHOW then return true end
    return T.Always() and T.Knows()
end
-- 换样子：颜色 + 呼吸（只在 warn / crit 播）
function T.Paint(v)
    if not win then return end
    local look = T.Look(v)
    local c = T.COLOR[look] or T.COLOR.done
    local r = v.rec
    ui.name:SetText(T.NameText(r))
    if v.left then ui.time:SetText(mmss(v.left))
    elseif look == "idle" then
        local cd = T.Cooldown()
        ui.time:SetText((cd and cd > 0) and mmss(cd) or L("可用", "Ready"))
    else ui.time:SetText("--:--") end
    ui.time:SetTextColor(c[1], c[2], c[3])
    ui.state:SetText(T.StateText(v))
    ui.state:SetTextColor(c[1], c[2], c[3])
    ui.sub:SetText(T.CdText())
    ui.ring:SetVertexColor(c[1], c[2], c[3])
    ui.glow:SetVertexColor(c[1], c[2], c[3])
    if ui.ic.SetDesaturated then ui.ic:SetDesaturated(look == "done") end
    local want = look == "warn" or look == "crit"
    if want ~= (T.pulsing or false) then
        T.pulsing = want or nil
        if want then
            ui.glow:SetAlpha(0.6)
            if ui.pulse then pcall(ui.pulse.Play, ui.pulse) end
        else
            if ui.pulse then pcall(ui.pulse.Stop, ui.pulse) end
            ui.glow:SetAlpha(0)
        end
    end
    T.look = look
end
-- ⛔ 战斗中不显示 / 隐藏浮标（里面有安全按钮），只改字和颜色；脱战补
function T.Draw(v)
    local want = T.ShouldShow(v)
    if inCombat() then
        T.pendDraw = true
        if win and win:IsShown() then T.Paint(v) end
        return want
    end
    T.pendDraw = nil
    if not want then
        if win and win:IsShown() then win:Hide() end
        if T.pulsing and ui.pulse then pcall(ui.pulse.Stop, ui.pulse) end
        T.pulsing = nil
        return false
    end
    win = win or buildWin()
    T.win = win
    T.SyncAttr()
    win:Show()
    T.Paint(v)
    return true
end

-- ---------- 刷新 / 倒计时（C_Timer 1 秒，只在有东西要走字时跑）----------
local ticking = false
function T.NeedTick()
    if not T.On() then return false end
    local v = T.view
    if v and (v.kind == "aura" or v.kind == "calc" or v.kind == "away") then return true end
    if win and win:IsShown() then
        -- 已使用 / 已失效：「只在有石头时显示」下留几分钟后收起（这段时间接着走）
        if v and v.rec and v.rec.st ~= "on" and wall() - (tonumber(v.rec.endAt) or 0) <= T.FINAL_SHOW + 2 then return true end
        local cd = T.Cooldown()
        return cd ~= nil and cd > 0
    end
    return false
end
local function loop()
    if not T.NeedTick() then ticking = false; return end
    pcall(T.Update, "tick")
    if C_Timer and C_Timer.After then C_Timer.After(1, loop) else ticking = false end
end
function T.Kick()
    if ticking or not (C_Timer and C_Timer.After) then return false end
    if not T.NeedTick() then return false end
    ticking = true
    C_Timer.After(1, loop)
    return true
end
function T.Ticking() return ticking end
function T.Update(why)
    if not ns.db then return nil end
    if not T.On() then
        T.view = { kind = "off" }
        if win and win:IsShown() and not inCombat() then win:Hide() end
        return T.view
    end
    local v = T.Eval()
    T.view = v
    T.Draw(v)
    if why ~= "tick" then T.Kick() end
    return v
end

-- /gi 灵魂石追踪：聊天框详情
function T.Report()
    local v = T.Update("report") or T.Eval()
    local r = v.rec
    if r then
        local tail = v.left and string.format(L("  剩 %s", "  %s left"), mmss(v.left)) or ""
        ns.Print(string.format(L("灵魂石：%s  %s%s", "Soulstone: %s  %s%s"), T.NameText(r), T.StateText(v), tail))
    else
        ns.Print(L("灵魂石：还没给人上（用了之后浮标显示给了谁、剩多久）", "Soulstone: none out yet"))
    end
    ns.Print(T.CdText() .. L("  |cff9a9a9a/gi 灵魂石追踪 on | off | orb on|off | always on|off | warn 5 | sound | clear | reset|r",
        "  |cff9a9a9a/gi sst on | off | orb on|off | always on|off | warn 5 | sound | clear | reset|r"))
end

-- ---------- 事件 ----------
local ev = CreateFrame("Frame")
T.ev = ev
T.EVENTS = { "PLAYER_ENTERING_WORLD", "UNIT_SPELLCAST_SENT", "UNIT_SPELLCAST_SUCCEEDED", "UNIT_AURA", "GROUP_ROSTER_UPDATE",
    "PLAYER_TARGET_CHANGED", "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED", "BAG_UPDATE_DELAYED", "BAG_UPDATE_COOLDOWN", "LEARNED_SPELL_IN_TAB" }
for _, e in ipairs(T.EVENTS) do pcall(ev.RegisterEvent, ev, e) end
local function groupUnit(u)
    return type(u) == "string" and (u == "player" or u == "target" or u == "focus" or u:find("^party%d") ~= nil or u:find("^raid%d") ~= nil)
end
function T.OnEvent(e, a1, a2, a3, a4)
    if secret(a1) then return end
    if e == "UNIT_SPELLCAST_SENT" then
        if a1 == "player" then T.OnSent(a2, a3, a4) end
        return
    elseif e == "UNIT_SPELLCAST_SUCCEEDED" then
        if a1 == "player" then T.OnCast(a2, a3) end
        return
    elseif e == "UNIT_AURA" then
        -- 只在有生效中的记录时看一眼（倒计时循环每秒也会读，这里只是让「没了」快一点）
        local r = T.Rec()
        if not (r and r.st == "on" and groupUnit(a1)) then return end
        if base(nameOf(a1)) ~= base(r.name) then return end
    elseif e == "PLAYER_ENTERING_WORLD" then
        T.graceUntil = gt() + T.GRACE
        T.miss = 0
    elseif e == "PLAYER_REGEN_ENABLED" then
        T.Update("regen")
        T.Flush()
        return
    end
    T.Update(e)
end
ev:SetScript("OnEvent", function(_, e, ...) pcall(T.OnEvent, e, ...) end)

-- ---------- 命令：/gi 灵魂石追踪 · /gi sst ----------
ns.ExtraSlash = ns.ExtraSlash or {}
local function slash(rest)
    rest = (rest or ""):gsub("[A-Z]", function(c) return c:lower() end)
    local k, v = rest:match("^(%a+)%s*(%S*)")
    if k == "on" or k == "off" then
        T.SetOn(k == "on")
        ns.Print(k == "on" and L("灵魂石追踪：已开", "Soulstone tracker: on") or L("灵魂石追踪：已关（浮标和提醒都没了）", "Soulstone tracker: off"))
    elseif k == "orb" and (v == "on" or v == "off") then
        T.SetOrb(v == "on")
        ns.Print(v == "on" and L("灵魂石浮标：显示", "Soulstone icon: shown") or L("灵魂石浮标：隐藏（提醒照旧）", "Soulstone icon: hidden (alerts stay)"))
    elseif k == "always" and (v == "on" or v == "off") then
        T.SetAlways(v == "on")
        ns.Print(v == "on" and L("灵魂石浮标：一直显示", "Soulstone icon: always") or L("灵魂石浮标：只在有石头时显示", "Soulstone icon: only with a stone out"))
    elseif k == "warn" and tonumber(v) then
        T.SetWarn(v)
        ns.Print(string.format(L("灵魂石剩不到 %d 分钟变黄闪烁（1 分钟变红）", "Soulstone turns yellow under %d min (red under 1)"), T.Warn()))
    elseif k == "sound" then
        T.SetSound(not T.SoundOn())
        ns.Print(T.SoundOn() and L("灵魂石提示音：开", "Soulstone sound: on") or L("灵魂石提示音：关", "Soulstone sound: off"))
    elseif k == "clear" then
        T.Clear(); ns.Print(L("灵魂石记录已清除", "Soulstone record cleared"))
    elseif k == "reset" then
        if T.ResetPos() then ns.Print(L("灵魂石浮标：位置已复位", "Soulstone icon position reset")) else ns.Print(L("战斗中不能挪，脱战后再试", "Can't move it in combat")) end
    else
        T.Report()
    end
end
ns.ExtraSlash.sst = slash
ns.ExtraSlash["灵魂石追踪"] = slash

-- ---------- 设置 / 功能中心 / 窗口与提醒（只有术士加载 → 只有术士看得到）----------
if ns.RegisterSettings then
    ns.RegisterSettings({ key = "sstrack", order = 58.4, data = "general", avail = function() return ns.SoulstoneTrack ~= nil end,
        title = function() return L("术士灵魂石追踪", "Warlock soulstone tracker") end, short = function() return L("灵魂石", "Soulstone") end,
        items = {
            { type = "check", id = "sstrack.on", keys = T.KEYS,
              text = function() return L("术士灵魂石追踪：记下灵魂石给了谁、剩多久，快到期高亮，到期 / 用掉时提醒（只有你看得到）", "Warlock soulstone tracker: who has your soulstone and for how long; highlight near expiry, local alert when it expires / is used") end,
              get = function() return T.On() end, set = function(v) T.SetOn(v) end },
            { type = "check", id = "sstrack.sound", x = 520, inline = true, keys = T.KEYS, text = function() return L("提示音", "Sound") end,
              get = function() return T.SoundOn() end, set = function(v) T.SetSound(v) end },
            { type = "check", id = "sstrack.pop", keys = T.KEYS, text = function() return L("灵魂石没了时弹框问要不要提醒（点了按钮才发话）", "When a soulstone is gone, pop up a prompt (sends only when you click)") end,
              get = function() return ns.db.ssGonePop ~= false end, set = function(v) if v then ns.db.ssGonePop = nil else ns.db.ssGonePop = false end end },
            { type = "check", id = "sstrack.orb", keys = T.KEYS, text = function() return L("显示灵魂石浮标（图标 + 名字 + 剩余时间）", "Show the soulstone icon (icon + name + time left)") end,
              get = function() return T.OrbOn() end, set = function(v) T.SetOrb(v) end },
            { type = "check", id = "sstrack.always", keys = T.KEYS, text = function() return L("浮标一直显示（关掉 = 只在有石头时出来）", "Always show the icon (off = only with a stone out)") end,
              get = function() return T.Always() end, set = function(v) T.SetAlways(v) end },
            { type = "edit", id = "sstrack.warn", w = 60, keys = T.KEYS, text = function() return L("剩几分钟开始变黄闪烁：", "Highlight at minutes left:") end,
              get = function() return tostring(T.Warn()) end, set = function(v) T.SetWarn(v) end },
            { type = "note", indent = 26, text = function()
                  return string.format(L("默认剩 %d 分钟变黄闪烁、1 分钟变红；命令：/gi 灵魂石追踪（详情）· /gi 灵魂石追踪 warn 5", "Default: yellow under %d min, red under 1 min; /gi sst for details, /gi sst warn 5"), T.DEF.warn)
              end },
        } })
end
if ns.Feature then
    ns.Feature({ key = "sstrack", cat = "class", zh = "术士灵魂石追踪", en = "Warlock soulstone tracker", class = "Warlock", sw = "sstrack.on", def = true,
        files = { "SoulstoneTrack.lua" },
        dzh = "灵魂石给了谁、还剩多久；快到期高亮，到期 / 用掉时提醒", den = "Who has your soulstone and for how long; highlight near expiry" })
end
if ns.RegisterWindow then
    ns.RegisterWindow({ key = "ssTrackOrb", order = 58.1, title = function() return L("灵魂石追踪浮标（术士）", "Soulstone tracker icon (Warlock)") end,
        avail = function() return ns.SoulstoneTrack ~= nil end,
        state = function()
            if not T.On() then return L("灵魂石追踪已关", "Tracker is off") end
            if not T.OrbOn() then return L("已隐藏（提醒照旧）", "Hidden (alerts stay)") end
            return T.Always() and L("开着（一直显示）", "On (always)") or L("开着（有石头时出来）", "On (with a stone out)")
        end,
        actions = function()
            local on = T.On() and T.OrbOn()
            return {
                { text = on and L("隐藏", "Hide") or L("显示", "Show"), fn = function()
                    if on then T.SetOrb(false) else T.DB().on = nil; T.SetOrb(true) end
                end },
                { text = L("重置位置", "Reset position"), fn = function() T.ResetPos() end },
            }
        end })
end

-- 子插件在 PLAYER_LOGIN 才加载（进世界前），进世界事件会再跑；已经在世界里（/reload 后补加载）就补一次
if IsLoggedIn and IsLoggedIn() then
    T.graceUntil = gt() + T.GRACE
    pcall(T.Update, "load")
end

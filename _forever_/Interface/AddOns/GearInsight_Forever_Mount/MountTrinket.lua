-- 上马自动换坐骑提速装备（11-20 起是「上马换胡萝卜」；11-24 升级 P1：饰品两格 / 手套 / 靴子 / 可选瘟疫之地套装，各格独立换）
--   来历：11-20 用户「上马自动换上，下马自动换下，屏幕弹出文字，快速消失」（截图 = 棍子上的胡萝卜 11122）
--        11-23「下马没换回来，搞个UI，可以随时开启关闭」→ 存档换装记录 + 屏幕开关图标
--        11-24 GI-350 / GI-351：开关只认 ns.db.mountTrinket；换回没换成要重试；战斗 / 读条 / 死亡排队；传送补做
--        11-24「术士，带卫兵队长，下马不换回来」：换装记录按角色存 ns.db.mtSwaps[角色-服务器]
--        11-24 升级（设计稿 mount_speed_design.md，用户「都按推荐」）：
--   ① 各格独立：饰品 13/14（胡萝卜 + 沙漠地区的沙漠玫瑰可同时占两格）、手套 10（骑乘附魔 930 / 冬泉谷的冬泉手套）、
--      靴子 8（秘银马刺附魔 464）、瘟疫之地骑手套装（披风 15 / 主手 16 / 戒指 11·12，凑够 2 件才换；默认关，右键菜单 / 设置里开）
--      每一格挑「背包里比现在穿的更快」的那件；下马逐格换回原来那件
--   ② 认附魔不认物品号：扫背包物品链接里的附魔号，按背包位置拿（同款两双靴子，一双马刺一双速度，分得清）；原装备按完整链接记、按链接找回
--   ③ 进出冬泉谷 / 瘟疫之地 / 沙漠地区（ZONE_CHANGED_NEW_AREA）骑着马也重新挑一遍：出了地区那一格换回原装
--   ④ 实测兜底：换上后读骑速（GetUnitSpeed 第 2 个返回值；12.0 引擎可能是秘密值 → pcall + 算术试探，读不到就跳过兜底、照常换）；
--      连读两次都没变快 = 这件对你无效（正义追击 / 公会骑乘加速这类「取最高」的加速把它盖了）→ 换回，按角色记进 ns.db.mtBad，以后不再换
--      「要实测」的（和坐骑同类的佐罗斯裹脚布 / 先锋骑手手套、沙漠地区范围没核实的沙漠玫瑰）读不到骑速时一律不换
--   ⑤ 一次只换一格（拿起 → 放进装备栏，0.6 秒后确认那一格是不是换成了），每格单独重试，最多 3 次；忙（战斗 / 读条 / 死亡 / 手上拿着东西）= 排队
--   ⑥ 图标：「+N%」（实测提速）/「已换 N 件」/「上马换 N 件」/「已关」/「脱战换回」；悬停逐格列已拥有 / 已失效 / 下马换回什么；
--      右键小菜单：换哪几格（饰品 / 手套 / 靴子 / 瘟疫套装）、立即换回全部、清掉「实测无效」、隐藏图标
--   ⛔ 不注册 COMBAT_LOG_EVENT_UNFILTERED；不建高频 OnUpdate（只有弹字淡出那 1.5 秒）；文件晚于主插件加载：ns = _G.GearInsightForever or ns
local _, ns = ...; ns = _G.GearInsightForever or ns
local L = function(cn, en) return ns.L(cn, en) end

local MT = { HOLD = 0.7, FADE = 0.8, t = 0, TRIES = 3, CHECK = 0.6, RECHECK = 1.0, RETRY = 0.9, EPS = 0.01, M_WAIT = 2, M_READS = 3 }
-- 11-24 用户「为啥没换胡萝卜」（骑着马面板 160%，存档 mtBad 里胡萝卜 11122 被记成「对你无效」，以后再也不换）：
--   实测兜底只给「要实测」的（ITEMS 里 m = true：沙漠玫瑰 / 先锋骑手手套 / 佐罗斯裹脚布）；核实过会叠加的固定加成（胡萝卜 / 秘银马刺 464 / 骑乘附魔 930 / 冬泉手套 / 瘟疫套装）永远不进 mtBad
--   要实测的：换上后至少等 M_WAIT 秒、连读 M_READS 次（间隔 1 秒）都和换之前一样才判无效；差在 EPS ~ 0.05 之间 = 读不准，不判；读回存档时把老 mtBad 里的固定加成清掉
ns.MountTrinket = MT
local CARROT = 11122
-- 地区（uiMapID + 区域名兜底；GetBestMapForUnit 有时给洞穴 / 大陆 → 往上找三层父地图）
local Z_WS = { 1452, "冬泉谷", "Winterspring", zh = "冬泉谷", en = "Winterspring" }
local Z_PL = { 1422, 1423, "西瘟疫之地", "东瘟疫之地", "Western Plaguelands", "Eastern Plaguelands", zh = "东西瘟疫之地", en = "the Plaguelands" }
-- ⚠️ 「沙漠地区」具体是哪几张图没核实：先认塔纳利斯（掉落地祖尔法拉克所在）/ 希利苏斯，且沙漠玫瑰是「要实测」的，读不到骑速就不换
local Z_DS = { 1446, 1451, "塔纳利斯", "希利苏斯", "Tanaris", "Silithus", zh = "沙漠地区（塔纳利斯 / 希利苏斯，未核实）", en = "desert zones (Tanaris / Silithus, unverified)" }
-- c = 哪一格（tr 饰品 / gl 手套 / ft 靴子 / pl 瘟疫套装）· p = 坐骑速度 % · z = 只在这些地区 · m = 要实测（和坐骑同类 / 范围未核实）· s = 套装件的装备栏
local ITEMS = {
    [CARROT] = { c = "tr", p = 3, n = { "棍子上的胡萝卜", "Carrot on a Stick" } },
    [274648] = { c = "tr", p = 7, z = Z_DS, m = true, n = { "沙漠玫瑰", "The Desert Rose" } },
    [284266] = { c = "gl", p = 6, z = Z_WS, n = { "冬泉豹皮衬里手套", "Wintersaber Hide Lined Gloves" } },
    [287010] = { c = "gl", p = 5, m = true, n = { "先锋骑手手套", "Outrider's Gloves" } },
    [282631] = { c = "ft", p = 5, m = true, n = { "佐罗斯裹脚布", "Xorothian Footwraps" } },
    [284100] = { c = "pl", s = 15, n = { "瘟疫之地骑手披风", "Rider of the Plaguelands cloak" } },
    [284101] = { c = "pl", s = 16, n = { "瘟疫之地骑手之剑", "Blade of Senseless Slaughter" } },
    [284102] = { c = "pl", s = 11, n = { "瘟疫之地骑手戒指", "Rider of the Plaguelands ring" } },
}
MT.ITEMS = ITEMS
local ENCH = { [464] = { c = "ft", p = 4, n = { "秘银马刺", "Mithril Spurs" } }, [930] = { c = "gl", p = 2, n = { "骑乘手套附魔", "Riding Skill enchant" } } }
MT.ENCH = ENCH
local CAT = { tr = { 13, 14 }, gl = { 10 }, ft = { 8 } }
local PL_SET = 5
local SLOTN = { [13] = { "饰品", "Trinket" }, [14] = { "饰品", "Trinket" }, [10] = { "手套", "Gloves" }, [8] = { "靴子", "Boots" },
    [15] = { "披风", "Cloak" }, [16] = { "主手", "Main hand" }, [11] = { "戒指", "Ring" }, [12] = { "戒指", "Ring" } }
local WATCH = { 8, 10, 11, 12, 13, 14, 15, 16 }

local function inv(slot) return GetInventoryItemID("player", slot) end
local function invLink(slot) return GetInventoryItemLink and GetInventoryItemLink("player", slot) or nil end
local function me() return (UnitName and UnitName("player") or "?") .. "-" .. (GetRealmName and GetRealmName() or "?") end
local function cfn(k)
    local C = rawget(_G, "C_Container")
    return (type(C) == "table" and C[k]) or rawget(_G, k)
end
local function idOf(x)
    if type(x) == "number" then return x end
    if type(x) == "string" then return tonumber(x:match("item:(%-?%d+)")) end
    return nil
end
local function enchOf(link) return type(link) == "string" and tonumber(link:match("item:%-?%d+:(%d+)") or "") or nil end
MT.idOf, MT.enchOf = idOf, enchOf
-- 物品信息（新客户端在 C_Item 下）→ pcall 的结果：ok, 名字, 链接, 品质, 物品等级, 需求等级, 类型, 子类型, 堆叠, 装备位置
local function itemInfo(id)
    local C = rawget(_G, "C_Item")
    local f = (type(C) == "table" and C.GetItemInfo) or rawget(_G, "GetItemInfo")
    if not f then return false end
    return pcall(f, id)
end
local function after(sec, fn) if C_Timer and C_Timer.After then C_Timer.After(sec, function() pcall(fn) end) end end
local function now() return (GetTime and GetTime()) or 0 end
local function mounted() return (IsMounted and IsMounted()) and true or false end

-- 那一格是什么物品：新接口 GetContainerItemID，没有就读 GetContainerItemInfo（新客户端返回表 .itemID）
local function slotID(bag, s)
    local f = cfn("GetContainerItemID")
    if f then return f(bag, s) end
    f = cfn("GetContainerItemInfo")
    local a = f and f(bag, s)
    if type(a) == "table" then return a.itemID end
    return nil
end
local function slotLink(bag, s)
    local f = cfn("GetContainerItemLink")
    local l = f and f(bag, s)
    if type(l) == "string" then return l end
    local id = slotID(bag, s)
    return id and ("item:" .. id) or nil   -- 没有链接接口：只认物品号（认不出附魔）
end
-- 装备绑定还没绑上的（冬泉手套 / 先锋骑手手套 / 佐罗斯裹脚布都是装绑）：换上会弹「装备后绑定」确认框 → 不换，悬停里提示先手动穿一次
local function unbound(bag, s)
    local f = cfn("GetContainerItemInfo")
    if not f then return false end
    local ok, a, _, _, _, _, _, _, _, _, _, b = pcall(f, bag, s)
    if not ok then return false end
    if type(a) == "table" then return a.isBound == false end
    return b == false
end
MT.slotID, MT.slotLink, MT.itemInfo, MT.me = slotID, slotLink, itemInfo, me   -- 11-24 委任徽章 MountCommission.lua 复用

function MT.Name(x)
    if type(x) == "string" then
        local n = x:match("|h%[(.-)%]|h")
        if n and n ~= "" then return n end
    end
    local id = idOf(x)
    local C = rawget(_G, "C_Item")
    local ok, n = pcall((type(C) == "table" and C.GetItemNameByID) or GetItemInfo, id)
    if ok and type(n) == "string" and n ~= "" then return n end
    local t = ITEMS[id]
    return t and L(t.n[1], t.n[2]) or ("#" .. tostring(id))
end

-- ---------- 存档（按角色）----------
-- 换装记录 ns.db.mtSwaps[角色] = { v = 2, [装备栏] = { 原装（完整链接 / 老记录是物品号 / false = 原来空着）, 换上的物品号 } }
--   老格式 { 槽位, 原饰品, 换上的 }（11-24 之前）读回时转成新格式
function MT.Rec()
    local t = ns.db and ns.db.mtSwaps
    local r = t and t[me()]
    if type(r) ~= "table" then return nil end
    if r.v ~= 2 then
        if type(r[1]) == "number" and r[3] then r = { v = 2, [r[1]] = { r[2] or false, r[3] } } else r = { v = 2 } end
        t[me()] = r
    end
    return r
end
function MT.SaveRec(r)
    if not ns.db then return end
    local t = ns.db.mtSwaps or {}
    if r and not MT.Any(r) then r = nil end
    t[me()] = r
    ns.db.mtSwaps = next(t) and t or nil
end
function MT.Any(r)
    for k in pairs(r or MT.Rec() or {}) do if type(k) == "number" then return true end end
    return false
end
function MT.SetSlot(slot, v)
    local r = MT.Rec() or { v = 2 }
    r[slot] = v
    MT.SaveRec(r)
end
-- 「实测无效」记录 ns.db.mtBad[角色] = { [物品号 / e附魔号 / 物品号@地区 / pl@地区] = true }
function MT.BadT(make)
    if not ns.db then return nil end
    local t = ns.db.mtBad
    if not t and make then t = {}; ns.db.mtBad = t end
    if t and not t[me()] and make then t[me()] = {} end
    return t and t[me()]
end
function MT.Bad(k) local t = MT.BadT(); return t ~= nil and k ~= nil and t[k] == true end
function MT.BadCount() local n = 0; for _ in pairs(MT.BadT() or {}) do n = n + 1 end; return n end
function MT.ClearBad()
    if ns.db and ns.db.mtBad then ns.db.mtBad[me()] = nil; if not next(ns.db.mtBad) then ns.db.mtBad = nil end end
end

-- 开关（主插件 MountStub.lua 管）/ 换装范围 ns.db.mtOpt[tr 饰品 / gl 手套 / ft 靴子 / pl 瘟疫之地套装]：nil = 默认（瘟疫套装要换主手剑，默认关；其余默认开）
function MT.Off() return ns.db ~= nil and ns.db.mountTrinket == false end
function MT.Opt(c)
    local v = ns.db and ns.db.mtOpt and ns.db.mtOpt[c]
    if v == nil then return c ~= "pl" end
    return v
end

-- ---------- 地区 / 骑速 ----------
function MT.Zone()
    local z = { ids = {} }
    local C = rawget(_G, "C_Map")
    if type(C) == "table" and C.GetBestMapForUnit then
        local ok, m = pcall(C.GetBestMapForUnit, "player")
        local n = 0
        while ok and type(m) == "number" and n < 4 do
            z.ids[m] = true; z.k = z.k or m; n = n + 1
            local ok2, info = false, nil
            if C.GetMapInfo then ok2, info = pcall(C.GetMapInfo, m) end
            m = ok2 and type(info) == "table" and info.parentMapID or nil
        end
    end
    for _, f in ipairs({ GetRealZoneText or false, GetZoneText or false }) do
        if f then
            local ok, s = pcall(f)
            if ok and type(s) == "string" and s ~= "" then z.ids[s] = true; z.k = z.k or s end
        end
    end
    z.k = tostring(z.k or "?")
    return z
end
local function inZone(zl, z)
    for _, k in ipairs(zl) do if z.ids[k] then return true end end
    return false
end
-- 当前骑速（码 / 秒）；读不到 / 秘密值 / 0 = nil
function MT.Speed()
    local f = rawget(_G, "GetUnitSpeed")
    if not f then return nil end
    local ok, _, run = pcall(f, "player")
    if not ok then return nil end
    local ok2, v = pcall(function() if run + 0 > 0 then return run + 0 end end)   -- 秘密值做算术 / 比较会报错 → 当读不到
    if ok2 then return v end
    return nil
end

-- ---------- 估值 ----------
-- 一件东西（物品号 + 链接）在当前情况下值多少坐骑速度 %；返回 值, 实测失败时要记的键
function MT.Val(id, link, z)
    if not id then return 0 end
    z = z or MT.zi or MT.Zone()
    local v, keys = 0, nil
    local it = ITEMS[id]
    if it and it.c == "pl" then
        local k = "pl@" .. z.k
        if MT.Opt("pl") and inZone(Z_PL, z) then return 1, nil end   -- 套装件单件不加速：在区域里 = 「有用」，换不换由 Plan 数件数
        return 0, nil
    end
    if it and MT.Opt(it.c) and (not it.z or inZone(it.z, z)) and (not it.m or z.spd) then
        local k = it.z and (id .. "@" .. z.k) or tostring(id)
        if not (it.m and MT.Bad(k)) then v = it.p; if it.m then keys = { k } end end   -- 只有「要实测」的才实测 / 认「无效」
    end
    local en = enchOf(link)
    local e = en and ENCH[en]
    if e and MT.Opt(e.c) then v = v + e.p end   -- 附魔是固定加成：不实测、不认「无效」
    return v, keys
end
local function catOf(id, link)
    local it = ITEMS[id]
    if it then return it.c end
    local e = ENCH[enchOf(link) or 0]
    return e and e.c
end

-- 背包里所有坐骑提速的东西 → { b, s, id, link, c }
function MT.Scan()
    local num = cfn("GetContainerNumSlots")
    local out = {}
    if not num then return out end
    for bag = 0, tonumber(NUM_BAG_SLOTS) or 4 do
        for s = 1, tonumber(num(bag)) or 0 do
            local id = slotID(bag, s)
            if id then
                local link = slotLink(bag, s)
                local c = catOf(id, link)
                if c then out[#out + 1] = { b = bag, s = s, id = id, link = link, c = c } end
            end
        end
    end
    return out
end
-- 背包里找原装：完整链接 → 同物品号同附魔 → 同物品号（链接里的等级字段会随升级变）
function MT.FindOrig(o)
    local num = cfn("GetContainerNumSlots")
    if not num then return nil end
    local id, en = idOf(o), enchOf(o)
    local best, bs, rank = nil, nil, 9
    for bag = 0, tonumber(NUM_BAG_SLOTS) or 4 do
        for s = 1, tonumber(num(bag)) or 0 do
            if slotID(bag, s) == id then
                local l = slotLink(bag, s)
                local r = (type(o) == "string" and l == o and 1) or ((en or 0) == (enchOf(l) or 0) and 2) or 3
                if r < rank then best, bs, rank = bag, s, r end
            end
        end
    end
    return best, bs
end
MT.Find = function(id) return MT.FindOrig(id) end
-- 普通背包里的一个空格（特殊背包放不进装备）→ bag, slot
function MT.FreeSlot()
    local num, free = cfn("GetContainerNumSlots"), cfn("GetContainerNumFreeSlots")
    if not num then return nil end
    for bag = 0, tonumber(NUM_BAG_SLOTS) or 4 do
        local fam = 0
        if free then fam = select(2, free(bag)) or 0 end
        if fam == 0 then
            for s = 1, tonumber(num(bag)) or 0 do
                if slotID(bag, s) == nil then return bag, s end
            end
        end
    end
end

-- 能不能穿（等级不够 / 装绑没绑 / 这次上线换失败过 3 次 = 跳过）
function MT.Usable(e)
    if MT.skip and MT.skip[e.link or e.id] then return false end
    if unbound(e.b, e.s) then return false end
    local ok, _, _, _, _, lv = itemInfo(e.id)
    if ok and type(lv) == "number" and UnitLevel and lv > (UnitLevel("player") or 0) then return false end
    return true
end

-- ---------- 规划：骑着马该怎么换 → { { slot, e = 背包里那件, keys, last } … }（换回原装的排前面：{ slot, back = true }）----------
function MT.Plan(zi)
    local z = zi or MT.Zone()
    z.spd = mounted() and MT.Speed() ~= nil
    MT.zi = z
    local bag, acts, rec = MT.Scan(), {}, MT.Rec() or {}
    local cur, got = {}, {}
    for _, sl in ipairs(WATCH) do cur[sl] = (MT.Val(inv(sl), invLink(sl), z)); got[inv(sl) or 0] = true end
    local cands = {}
    for _, e in ipairs(bag) do
        if e.c ~= "pl" then
            e.v, e.keys = MT.Val(e.id, e.link, z)
            if e.v > 0 and not (e.c == "tr" and got[e.id]) and MT.Usable(e) then cands[#cands + 1] = e end
        end
    end
    table.sort(cands, function(a, b) return a.v > b.v end)
    local plan = {}
    for _, e in ipairs(cands) do
        local tgt, tv
        for _, sl in ipairs(CAT[e.c]) do   -- 值最低的那格；一样低：空格优先（上饰品栏先），都有东西 = 下饰品栏 14
            local v = cur[sl]
            if not plan[sl] and not (MT.AC and MT.AC.Lock(sl)) and (not tgt or v < tv or (v == tv and inv(tgt) ~= nil)) then tgt, tv = sl, v end
        end
        if tgt and e.v > tv then
            plan[tgt] = { slot = tgt, e = e, keys = e.keys, m = true }
            cur[tgt] = e.v
        end
    end
    -- 瘟疫之地套装：在区域里、开着、身上 + 背包凑得够 2 件才换（先披风 / 戒指，主手剑最后）
    if MT.Val(284100, nil, z) > 0 then
        local have, pcs = 0, {}
        for _, sl in ipairs({ 15, 16, 11, 12 }) do if ITEMS[inv(sl) or 0] and ITEMS[inv(sl)].c == "pl" then have = have + 1 end end
        for _, e in ipairs(bag) do
            if e.c == "pl" and not got[e.id] and MT.Usable(e) then
                local sl = ITEMS[e.id].s
                if sl == 11 then sl = (inv(11) == nil and 11) or 12 end
                local ok, _, _, _, _, _, _, _, _, loc = itemInfo(e.id)
                if not (sl == 16 and ok and loc == "INVTYPE_2HWEAPON" and inv(17)) then   -- 双手剑 + 戴着副手：不换（换回时副手回不来）
                    pcs[#pcs + 1] = { slot = sl, e = e, w = (sl == 16 and 2 or 1) }
                end
            end
        end
        table.sort(pcs, function(a, b) return a.w < b.w end)
        local need = PL_SET - 3 - have   -- = 2 件套
        if need > 0 and #pcs >= need then
            for i = 1, need do
                local p = pcs[i]
                p.keys = nil   -- 套装 5% 是固定加成：不实测
                p.m = i == need
                plan[p.slot] = p
            end
        end
    end
    -- 换回：我们换上的、现在不值了（出了地区 / 实测无效 / 范围关掉）且没有更好的替上
    for _, sl in ipairs(WATCH) do
        local r = rec[sl]
        if r and not r.z and not plan[sl] and inv(sl) == r[2] and MT.Val(inv(sl), invLink(sl), z) <= 0 then acts[#acts + 1] = { slot = sl, back = true } end
    end
    for _, sl in ipairs(WATCH) do if plan[sl] then acts[#acts + 1] = plan[sl] end end
    return acts
end

function MT.Busy()
    if InCombatLockdown and InCombatLockdown() then return true end
    if UnitIsDeadOrGhost and UnitIsDeadOrGhost("player") then return true end
    if CursorHasItem and CursorHasItem() then return true end   -- 玩家手上拿着东西：别把它放错地方
    for _, f in ipairs({ UnitCastingInfo or false, UnitChannelInfo or false }) do   -- ⛔ 别放 nil：ipairs 遇到 nil 就停
        if f then
            local ok, v = pcall(function() return f("player") ~= nil end)   -- 12.0 引擎的秘密值只许判空，出错当没在读条
            if ok and v then return true end
        end
    end
    return false
end
-- 忙：过一会儿自己再看一眼（同一时间只排一个；不全靠事件，漏一个事件就一直戴着）
function MT.Later(sec)
    if MT.later then return end
    MT.later = true
    after(sec or 2, function() MT.later = nil; MT.wait = true; pcall(MT.Sync) end)
end

-- ---------- 屏幕中上方一行字，快速淡出 ----------
function MT.Fade(self, el)
    MT.t = MT.t + (tonumber(el) or 0)
    if MT.t >= MT.HOLD + MT.FADE then
        self:Hide()
    elseif MT.t > MT.HOLD then
        self:SetAlpha(1 - (MT.t - MT.HOLD) / MT.FADE)
    end
end
function MT.Say(msg)
    MT.msg = msg
    if not MT.tip then
        local t = CreateFrame("Frame", nil, UIParent)
        t:SetSize(760, 40)
        t:SetPoint("TOP", UIParent, "TOP", 0, -160)
        t:SetFrameStrata("HIGH")
        local fs = t:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        fs:SetPoint("CENTER")
        t:SetScript("OnUpdate", MT.Fade)
        MT.tip, MT.fs = t, fs
    end
    MT.fs:SetText("|cff33ff99" .. msg .. "|r")
    MT.t = 0
    MT.tip:SetAlpha(1)
    MT.tip:Show()
end
-- 一轮换完合成一行弹：「已换上 A、B；已换回 C」
function MT.Note(kind, s)
    MT.done = MT.done or {}
    local t = MT.done[kind] or {}
    MT.done[kind] = t
    t[#t + 1] = s
end
function MT.Flush()
    local d = MT.done
    MT.done = nil
    if not d then return end
    local parts = {}
    local sep = L("、", ", ")
    if d.on then parts[#parts + 1] = L("已换上 ", "Equipped ") .. table.concat(d.on, sep) end
    if d.back then parts[#parts + 1] = L("已换回 ", "Swapped back ") .. table.concat(d.back, sep) end
    if d.off then parts[#parts + 1] = L("已摘下 ", "Unequipped ") .. table.concat(d.off, sep) end
    for _, s in ipairs(d.msg or {}) do parts[#parts + 1] = s end
    if #parts > 0 then MT.Say(table.concat(parts, L("；", "; "))) end
end

-- ---------- 换一格（一次只一格）----------
-- 背包第几格 → 装备栏：拿起来放上去，原来那件落回这个背包格
local function put(b, s, slot)
    local pick = cfn("PickupContainerItem")
    if not (pick and PickupInventoryItem) then return false end
    pick(b, s)
    if CursorHasItem and not CursorHasItem() then return false end   -- 那一格锁着（刚换过 / 交易中）没拿起来：别去点装备栏（会把身上那件拿到手上）
    PickupInventoryItem(slot)
    if CursorHasItem and CursorHasItem() then pick(b, s) end   -- 没放上 / 换下来的还在手上：放回那个背包格
    if CursorHasItem and CursorHasItem() and ClearCursor then ClearCursor() end
    return true
end
local function tries(k)
    MT.tries = MT.tries or {}
    MT.tries[k] = (MT.tries[k] or 0) + 1
    return MT.tries[k]
end

-- 执行一步：back = 换回原装（原来空着 = 摘回背包）；否则换上 a.e
function MT.Do(a)
    local sl = a.slot
    local r = (MT.Rec() or {})[sl]
    if a.back then
        local o = r and r[1]
        local k = "b" .. sl
        if tries(k) > MT.TRIES then
            MT.Note("msg", L("没换回 ", "Could not swap back ") .. MT.Name(o or r[2]) .. L("，请手动换", " - please swap it manually"))
            MT.SetSlot(sl, nil)
            return false
        end
        if o then
            local b, s = MT.FindOrig(o)
            if not b then   -- 原装已经不在背包（卖了 / 进银行）：放弃
                if r.z then MT.Note("msg", MT.Name(o) .. L(" 不在背包里，委任徽章没换回", " is not in your bags - Commission left on")) end
                MT.SetSlot(sl, nil)
                return false
            end
            put(b, s, sl)
            MT.pend = { slot = sl, want = idOf(o), back = true, k = k, name = MT.Name(o), say = a.say }
        else
            local b, s = MT.FreeSlot()
            local pick = cfn("PickupContainerItem")
            if not (b and pick and PickupInventoryItem) then MT.SetSlot(sl, nil); return false end   -- 背包满：不摘
            PickupInventoryItem(sl)
            pick(b, s)
            if CursorHasItem and CursorHasItem() and ClearCursor then ClearCursor() end
            MT.pend = { slot = sl, want = nil, back = true, k = k, name = MT.Name(r and r[2]), off = true, say = a.say }
        end
        return true
    end
    local e = a.e
    local k = e.link or e.id
    if tries(k) > MT.TRIES then
        MT.skip = MT.skip or {}
        MT.skip[k] = true
        MT.Note("msg", L("没换上 ", "Could not equip ") .. MT.Name(e.link or e.id))
        if r and inv(sl) ~= r[2] then MT.SetSlot(sl, nil) end
        return false
    end
    if not MT.Any() then MT.base = MT.Speed() end   -- 这一轮第一件之前的骑速：图标「+N%」的基准
    local orig = r and r[1]
    if orig == nil then orig = invLink(sl) or inv(sl) or false end
    MT.SetSlot(sl, { orig, e.id, z = a.z })   -- 先记再换：换到一半 /reload 也换得回（z = "ad"：委任徽章那格，只由区域逻辑换回）
    local s0 = a.keys and a.m and MT.Speed()
    put(e.b, e.s, sl)
    MT.pend = { slot = sl, want = e.id, k = k, keys = a.keys, s0 = s0, name = MT.Name(e.link or e.id), z = a.z, say = a.say }
    return true
end

-- 确认上一步：那一格换成了没有；换上的读骑速比一比
function MT.Check(p)
    local sl = p.slot
    if inv(sl) ~= p.want then return false end   -- 没换成：记录留着，下一步按 tries 重试
    if MT.tries then MT.tries[p.k] = nil end
    if p.back then
        MT.SetSlot(sl, nil)
        MT.Note(p.say and "msg" or (p.off and "off" or "back"), p.say or p.name)
        if not MT.Any() then MT.base = nil end
        return true
    end
    if p.s0 and p.keys and mounted() then   -- 只有「要实测」的才有 keys
        p.el = p.el or MT.CHECK   -- 换上后过了多久（按排的定时累计，不读 GetTime）
        if p.el < MT.M_WAIT then p.el = p.el + MT.RECHECK; MT.pend = p; return nil end   -- 装备生效 / 骑速刷新有延迟：至少等 2 秒再读
        local s1 = MT.Speed()
        if s1 and math.abs(s1 - p.s0) <= MT.EPS then   -- 读得到、和换之前一样（变快 / 变慢 / 差 < 0.05 读不准 / 读不到 = 都不下结论）
            p.same = (p.same or 0) + 1
            if p.same < MT.M_READS then p.el = p.el + MT.RECHECK; MT.pend = p; return nil end   -- 连读 3 次（间隔 1 秒）都没变快才判
            local t = MT.BadT(true)
            for _, k in ipairs(p.keys) do t[k] = true end
            MT.Note("msg", p.name .. L(" 实测不加速（可能被正义追击 / 公会骑乘加速盖过），换回，以后不再换", " gave no speed (another speed bonus overrides it) - swapping back, won't use it again"))
            return true
        end
    end
    if p.z then   -- 委任徽章确认戴上了：之后那格不是它了 = 玩家自己摘的（换失败不算）
        local r = MT.Rec()
        if r and r[sl] then r[sl].w = true; MT.SaveRec(r) end
    end
    MT.Note(p.say and "msg" or "on", p.say or p.name)
    return true
end

-- 一直走到「没有要换的」为止：每步之间 0.6 秒（确认），没换成的那一格重试，最多 3 次
function MT.Step()
    MT.stepping = nil
    if MT.Busy() then if MT.AC then pcall(MT.AC.Want, true) end; MT.wait = true; MT.Later(); pcall(MT.BtnUpdate); return false end
    local p = MT.pend
    if p then
        MT.pend = nil
        local ok = MT.Check(p)
        if ok == nil then MT.stepping = true; after(MT.RECHECK, MT.Step); return true end
        if not ok and not p.retry then p.retry = true; MT.pend = p; MT.stepping = true; after(MT.RETRY, MT.Step); return true end   -- 异步：再等一会儿确认，还不是就重换
    end
    -- 玩家自己换过的那一格（不是我们换上的那件了）：不归我们管，清记录
    local r = MT.Rec()
    if r then
        for _, sl in ipairs(WATCH) do if r[sl] and inv(sl) ~= r[sl][2] then if MT.AC then MT.AC.Lost(r[sl]) end; r[sl] = nil end end
        MT.SaveRec(r)
    end
    local acts
    if mounted() and not MT.Off() and not MT.hold then
        acts = MT.Plan()
    else
        acts = {}
        for _, sl in ipairs(WATCH) do local x = (MT.Rec() or {})[sl]; if x and not x.z then acts[#acts + 1] = { slot = sl, back = true } end end   -- 委任徽章那格不跟着下马换回
    end
    if MT.AC then   -- 11-24 委任徽章（MountCommission.lua）：骑不骑马都做，排在最前面（先定徽章占哪格，胡萝卜再换另一格）
        local okA, ad = pcall(MT.AC.Acts)
        if okA then for i = #ad, 1, -1 do table.insert(acts, 1, ad[i]) end end
    end
    for _, a in ipairs(acts) do
        if MT.Do(a) then MT.stepping = true; after(MT.CHECK, MT.Step); return true end
    end
    MT.Flush()
    if not MT.Any() then MT.base = nil end
    pcall(MT.BtnUpdate)
    return false
end

-- 按现在骑没骑着补做；战斗中 / 读条 / 死亡 = 先不动（MT.wait 记着），等事件 / 2 秒后再来
--   只在上下马状态变了 / 有排队时才干活（UNIT_AURA 很频繁，骑着马时别每次都扫背包）
function MT.Sync()
    local m = mounted()
    if m == MT.was and not MT.wait then return false end
    if m ~= MT.was then MT.tries, MT.hold = nil, nil end   -- 上下马一次：重试次数 /「立即换回」清零
    if MT.Busy() then if MT.AC then pcall(MT.AC.Want, true) end; MT.wait = true; MT.Later(); pcall(MT.BtnUpdate); return false end
    MT.was, MT.wait = m, nil
    if MT.stepping then return false end   -- 正在一步步换：那条链自己会按新状态走
    return MT.Step()
end
-- 兼容老入口
function MT.Equip() if MT.Off() then return false end; MT.wait = true; return MT.Sync() end

-- ---------- 开关图标 ----------
-- 身上 + 背包里所有坐骑提速的东西（不看地区 / 开关）→ { id, link, c, slot = 戴在哪格（背包里 = nil）, b, s }
function MT.Owned()
    local out = MT.Scan()
    for _, sl in ipairs(WATCH) do
        local id = inv(sl)
        local c = id and catOf(id, invLink(sl))
        if c then out[#out + 1] = { id = id, link = invLink(sl), c = c, slot = sl } end
    end
    return out
end
function MT.HasAny() return #MT.Owned() > 0 end
MT.GUIDE_LV = 40   -- 一件都没有时：40 级（能骑马）以上才摆灰图标提示「去拿胡萝卜」
function MT.BtnDB() ns.db.mtBtn = ns.db.mtBtn or {}; return ns.db.mtBtn end
function MT.BtnIcon(owned)
    local best, bv = nil, -1
    for _, e in ipairs(owned or MT.Owned()) do
        local v = (ITEMS[e.id] and ITEMS[e.id].p or 0) + ((ENCH[enchOf(e.link) or 0] or {}).p or 0) + (e.id == CARROT and 100 or 0)
        if v > bv then best, bv = e.id, v end
    end
    local C = rawget(_G, "C_Item")
    local f = (type(C) == "table" and C.GetItemIconByID) or rawget(_G, "GetItemIcon")
    local ok, tex = false, nil
    if f then ok, tex = pcall(f, best or CARROT) end
    if ok and tex then return tex end
    return "Interface\\Icons\\INV_Misc_Food_54"
end
function MT.SwapCount() local n = 0; for k, x in pairs(MT.Rec() or {}) do if type(k) == "number" and not x.z then n = n + 1 end end; return n end   -- 不算委任徽章那格
-- 图标下的字
function MT.BtnText()
    if MT.wait and MT.Busy() and (MT.Any() or not MT.Off()) then   -- 排队中（关掉了但还没换回的也算）
        return "|cffffd200" .. ((mounted() and not MT.Off()) and L("脱战换上", "After combat") or L("脱战换回", "After combat")) .. "|r"
    end
    if MT.Off() then return "|cffff5555" .. L("已关", "Off") .. "|r" end
    local n = MT.SwapCount()
    if mounted() and n > 0 then
        local s = MT.Speed()
        if MT.base and s and s > MT.base + MT.EPS then
            return "|cff33ff99+" .. math.floor((s - MT.base) / (tonumber(BASE_MOVEMENT_SPEED) or 7) * 100 + 0.5) .. "%|r"
        end
        return "|cff33ff99" .. L("已换 ", "") .. n .. L(" 件", " swapped") .. "|r"
    end
    local ok, acts = pcall(MT.Plan)
    local k = 0
    for _, a in ipairs(ok and acts or {}) do if not a.back then k = k + 1 end end
    if k > 0 then return "|cff33ff99" .. L("上马换 ", "Mount: ") .. k .. L(" 件", "") .. "|r" end
    return "|cff33ff99" .. L("上马换", "Auto") .. "|r"
end
function MT.BtnUpdate()
    local b = MT.btn
    if not b or not ns.db then return end
    local owned = MT.Owned()
    local none = #owned == 0 and not MT.Any()
    if MT.BtnDB().hide or (none and ((UnitLevel and UnitLevel("player")) or 0) < MT.GUIDE_LV) then b:Hide(); return end
    local on = not MT.Off()
    if b.icon.SetDesaturated then b.icon:SetDesaturated(not on) end
    b.icon:SetAlpha(on and 1 or 0.55)
    b.icon:SetTexture(MT.BtnIcon(owned))
    if none then   -- 一件提速装备都没有：灰图标 + 短提示（悬停看怎么拿）
        if b.icon.SetDesaturated then b.icon:SetDesaturated(true) end
        b.icon:SetAlpha(0.55)
        local g = MT.GMissing()[1]
        b.txt:SetText("|cffaaaaaa" .. (g and L(g.short[1], g.short[2]) or L("上马换", "Auto")) .. "|r")
    else
        b.txt:SetText(MT.BtnText())
    end
    b:Show()
end
-- 开 / 关（v = nil 切换）：开着骑着马 = 当场换上；关掉时戴着我们换上的 = 当场换回
function MT.Toggle(v)
    if v == nil then v = MT.Off() end
    ns.SetFeature("mounttrinket", v and true or false)   -- 主插件 MountStub.lua 的 set 会当场补做（换上 / 换回）
    MT.BtnUpdate()
    MT.Say(v and L("上马自动换胡萝卜：开", "Mount trinket swap: on") or L("上马自动换胡萝卜：关", "Mount trinket swap: off"))
    return v
end

local CATN = { tr = { "饰品", "Trinket" }, gl = { "手套", "Gloves" }, ft = { "靴子", "Boots" }, pl = { "瘟疫套装", "Plague set" } }
-- ---------- 11-24 获取攻略（用户「骑乘的怎么获得都给个攻略提示」；数据 = 设计稿 mount_speed_design.md 物品表，没核实的写「来源未核实」）----------
--   rank = 性价比排序（商人直接买的胡萝卜排第一）；lv = 需求等级；way = { uiMapID, x, y, 地名, NPC }（有坐标才给「导航」）；
--   st = 和坐骑本身同一类「不与同类叠加」（可能被坐骑吃掉）；gift = 消耗品（不占装备格）
local GIFT = 271871
local GUIDE = {
    { id = CARROT, c = "tr", p = 3, lv = 0, rank = 1, short = { "去拿胡萝卜", "Get Carrot" },
        how = { "荆棘谷 藏宝海湾 商人 Rix Xizzix 直接买（4g67s）；或祖尔法拉克任务「加兹瑞拉」（任务在千针石林接）",
            "Buy from Rix Xizzix, Booty Bay, Stranglethorn (4g67s); or quest \"Gahz'rilla\" (Zul'Farrak, starts in Thousand Needles)" },
        way = { 1434, 28.5, 75.8, { "荆棘谷 藏宝海湾", "Booty Bay, Stranglethorn" }, "Rix Xizzix" } },
    { e = 464, c = "ft", p = 4, lv = 12, rank = 2, short = { "去买马刺", "Get Spurs" }, n = { "秘银马刺（靴子附魔）", "Mithril Spurs (boot attachment)" },
        how = { "锻造制作（物品 7969）：图纸 7989 世界掉落（祖尔法拉克 / 阿塔哈卡神庙 / 奥达曼 / 荆棘谷 / 辛特兰、钢质锁箱），锻造 210 学、215 用；成品能交易，拍卖行可买。附在靴子上（靴子要求等级 ≥12），和「速度」附魔抢同一个靴子附魔位",
            "Blacksmithing (item 7969): plans 7989 are a world drop (Zul'Farrak / Sunken Temple / Uldaman / Stranglethorn / Hinterlands, Steel Lockboxes), learn at 210, use at 215; tradeable, check the Auction House. Goes on boots (level 12+) and takes the same slot as the Speed enchant" } },
    { e = 930, c = "gl", p = 2, lv = 0, rank = 3, short = { "附骑乘手套", "Riding gloves" }, n = { "附魔手套 - 骑乘", "Enchant Gloves - Riding Skill" },
        how = { "附魔 250，公式 11226 世界掉落（阿塔哈卡神庙、费伍德、塔纳利斯等）；找有公式的附魔师附在手套上",
            "Enchanting 250, formula 11226 is a world drop (Sunken Temple, Felwood, Tanaris and more); ask an enchanter who has it" } },
    { id = 274648, c = "tr", p = 7, lv = 42, rank = 4, zone = { "只在沙漠地区", "desert zones only" },
        how = { "祖尔法拉克 布莱中士（Sergeant Bly）掉落，约 33%（拾取绑定）", "Drops from Sergeant Bly in Zul'Farrak, ~33% (BoP)" } },
    { id = 282631, c = "ft", p = 5, lv = 44, rank = 5, st = true,
        how = { "Shleipnarr 掉落，约 20%（布甲靴，装备绑定）", "Drops from Shleipnarr, ~20% (cloth boots, BoE)" } },
    { id = 287010, c = "gl", p = 5, lv = 39, rank = 6, st = true,
        how = { "新副本克罗多克要塞（Krol'dok Stronghold）小怪 Twilight Outrider 掉落，约 4–5%（皮甲手套，装备绑定）",
            "Twilight Outrider trash in Krol'dok Stronghold, ~4-5% (leather gloves, BoE)" } },
    { id = GIFT, c = "gift", p = 10, lv = 60, rank = 7, n = { "飞奔的礼物", "Gift of Galloping" },
        how = { "河林（Riverglades）商人 Mister Graphed，78.2, 51.9，150g；消耗品，骑速 +10% 持续 360 小时（下线也计时），和所有坐骑加速都叠加",
            "Mister Graphed, Riverglades (78.2, 51.9), 150g; consumable, +10% mount speed for 360 hours (keeps ticking offline), stacks with everything" } },
    { id = 284266, c = "gl", p = 6, lv = 54, rank = 8, zone = { "只在冬泉谷", "Winterspring only" },
        how = { "来源未核实（布甲手套，装备绑定）", "Source not verified (cloth gloves, BoE)" } },
    { id = 284101, c = "pl", p = 5, lv = 57, rank = 9, n = { "瘟疫之地骑手套装（2 件）", "Rider of the Plaguelands set (2 pieces)" }, zone = { "只在东西瘟疫之地", "Plaguelands only" },
        how = { "剑：Duke Ragereaver 掉落；披风 / 戒指来源未核实。凑 2 件生效（要在右键菜单里打开「换瘟疫之地骑手套装」）",
            "Sword: Duke Ragereaver; cloak / ring source not verified. Needs 2 pieces (turn the set on in the right-click menu)" } },
}
MT.GUIDE = GUIDE
local OK_TEX, NO_TEX = "|TInterface\\RaidFrame\\ReadyCheck-Ready:12|t", "|TInterface\\RaidFrame\\ReadyCheck-NotReady:12|t"
function MT.GName(g)
    if g.n then return L(g.n[1], g.n[2]) end
    return MT.Name(g.id)
end
-- 这一条已经有了没有（身上 / 背包；附魔看链接；套装任一件；礼物 = 背包里有或身上有这个光环）
function MT.GOwned(g, owned)
    if g.c == "gift" then
        if MT.FindOrig(g.id) then return true end
        local A = rawget(_G, "C_UnitAuras")
        if type(A) == "table" and A.GetPlayerAuraBySpellID then
            local ok, a = pcall(A.GetPlayerAuraBySpellID, 1289654)
            if ok and a then return true end
        end
        return false
    end
    for _, e in ipairs(owned or MT.Owned()) do
        if (g.e and enchOf(e.link) == g.e) or (g.id and e.id == g.id) or (g.c == "pl" and e.c == "pl") then return true end
    end
    return false
end
-- 一条攻略的说明行：名字 +N%（需求 N 级）· 只在哪 · 怎么拿 · 提醒
function MT.GLines(g)
    local head = MT.GName(g) .. "  +" .. g.p .. "%"
    if (g.lv or 0) > 1 then head = head .. string.format(L("（需要 %d 级）", " (level %d)"), g.lv) end
    if g.zone then head = head .. L("　", "  ") .. L(g.zone[1], g.zone[2]) end
    local out = { head, L(g.how[1], g.how[2]) }
    if g.way then out[#out + 1] = string.format(L("坐标：%s %.1f, %.1f（%s）", "Location: %s %.1f, %.1f (%s)"), L(g.way[4][1], g.way[4][2]), g.way[2], g.way[3], g.way[5]) end
    if g.st then
        out[#out + 1] = L("注意：和坐骑本身同一类（不与同类叠加），可能被坐骑速度吃掉；插件换上后会实测，没用就不换", "! Same type as the mount itself (doesn't stack) - may do nothing; the addon measures and skips it if so")
    elseif g.c ~= "gift" then
        out[#out + 1] = L("注意：有正义追击 / 公会骑乘加速（不与同类叠加）时可能没用；插件换上后会实测", "! May do nothing with Pursuit of Justice / guild Mount Up (don't stack); the addon measures it")
    end
    return out
end
-- 还没拥有的，按性价比排（等级差太多的不列）
function MT.GMissing(c)
    local owned, lv = MT.Owned(), (UnitLevel and UnitLevel("player")) or 60
    local out = {}
    for _, g in ipairs(GUIDE) do
        if (not c or g.c == c) and (g.lv or 0) <= lv + 10 and not MT.GOwned(g, owned) then out[#out + 1] = g end
    end
    table.sort(out, function(a, b) return a.rank < b.rank end)
    return out
end
-- 「导航」：复用主插件 ns.ShowOnMap（游戏地图标记 + 超级追踪 + TomTom），聊天框再给一行 /way 坐标
function MT.GNav(g)
    local w = g and g.way
    if not w then return false end
    if ns.ShowOnMap then pcall(ns.ShowOnMap, w[1], { { w[2], w[3] } }, w[5]) end
    ns.Print(string.format(L("%s：%s %.1f, %.1f（/way %.1f %.1f）", "%s: %s %.1f, %.1f (/way %.1f %.1f)"), MT.GName(g), L(w[4][1], w[4][2]), w[2], w[3], w[2], w[3]))
    return true
end
-- 一格的候选清单（右键菜单那一行悬停）：已拥有 ✓ / 没有 ✗ → 怎么获得
function MT.CatTip(owner, c)
    if c == "ad" then return end   -- 委任徽章那一行（规则写在设置 → 通用；省 _Mount 内存不另画提示）
    if not GameTooltip then return end
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:AddLine(L(CATN[c][1], CATN[c][2]) .. L("：能换的装备", ": gear for this slot"), 1, 0.82, 0)
    local owned = MT.Owned()
    for _, g in ipairs(GUIDE) do
        if g.c == c then
            local have = MT.GOwned(g, owned)
            local ls = MT.GLines(g)
            GameTooltip:AddLine((have and OK_TEX or NO_TEX) .. " " .. ls[1] .. (have and L("　已拥有", "  owned") or ""), have and 0.4 or 1, 1, have and 0.6 or 1, true)
            if not have then for i = 2, #ls do GameTooltip:AddLine("    " .. ls[i], 0.75, 0.75, 0.75, true) end end
        end
    end
    GameTooltip:Show()
end
-- 悬停提示的「已拥有 / 已失效」逐件说明
function MT.Lines()
    local z = MT.Zone()
    z.spd = mounted() and MT.Speed() ~= nil
    local have, bad, seen = {}, {}, {}
    for _, e in ipairs(MT.Owned()) do
        local key = (e.link or e.id) .. ":" .. (e.slot or "b")
        if not seen[key] then
            seen[key] = true
            local it, en = ITEMS[e.id], ENCH[enchOf(e.link) or 0]
            local p = ((it and it.p) or 0) + ((en and en.p) or 0)
            local s = L(CATN[e.c][1], CATN[e.c][2]) .. L("：", ": ") .. MT.Name(e.link or e.id)
            if en and not (it and it.p) then s = s .. L("（", " (") .. L(en.n[1], en.n[2]) .. L("）", ")") end
            if e.c == "pl" then s = s .. L("　凑 2 件：+5%", "  2 pieces: +5%") elseif p > 0 then s = s .. "　+" .. p .. "%" end
            if it and it.z then s = s .. L("　只在", "  only in ") .. L(it.z.zh, it.z.en) end
            if e.c == "pl" and not (it and it.z) then s = s .. L("　只在", "  only in ") .. L(Z_PL.zh, Z_PL.en) end
            local k = (it and it.c == "pl" and ("pl@" .. z.k)) or (it and it.z and (e.id .. "@" .. z.k)) or (it and it.p and tostring(e.id)) or (en and ("e" .. enchOf(e.link)))
            if MT.Bad(k) then
                bad[#bad + 1] = s .. L("　实测不加速（可能被正义追击 / 公会骑乘加速盖过），不再换", "  measured no gain (another speed bonus overrides it), not used")
            else
                if not MT.Opt(e.c) then s = s .. L("　（右键菜单里关着）", "  (off in the right-click menu)")
                elseif it and it.m and not z.spd then s = s .. L("　（要实测：骑着马、读得到骑速时才试）", "  (needs a speed reading while mounted)")
                elseif e.b and unbound(e.b, e.s) then s = s .. L("　（还没绑定：先手动穿一次）", "  (not bound yet - equip it once by hand)") end
                if e.slot then s = s .. L("　· 戴着", "  · worn") end
                have[#have + 1] = s
            end
        end
    end
    return have, bad
end
function MT.BtnTip(self)
    if not GameTooltip then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:AddLine("GearInsight · " .. L("上马换装", "Mount gear"), 0.2, 1, 0.6)   -- 插件统一标题（和背包按钮同色）
    if MT.Off() then
        GameTooltip:AddLine(L("已关：上马不换", "Off: no swap when mounting"), 1, 0.4, 0.4, true)
    else
        GameTooltip:AddLine(L("开着：上马换上提速装备，下马换回原装备", "On: speed gear while mounted, your own gear back on dismount"), 0.4, 1, 0.6, true)
    end
    local have, bad = MT.Lines()
    if #have > 0 then
        GameTooltip:AddLine(L("已拥有：", "You have:"), 1, 0.82, 0)
        for _, s in ipairs(have) do GameTooltip:AddLine("  " .. s, 1, 1, 1, true) end
    end
    if #bad > 0 then
        GameTooltip:AddLine(L("已失效：", "No effect for you:"), 1, 0.5, 0.3)
        for _, s in ipairs(bad) do GameTooltip:AddLine("  " .. s, 0.8, 0.8, 0.8, true) end
    end
    if MT.AC then
        local okA, s = pcall(MT.AC.TipLine)
        if okA and s then GameTooltip:AddLine(s, 0.4, 1, 0.6, true) end
    end
    local r = MT.Rec()
    if MT.SwapCount() > 0 then
        GameTooltip:AddLine(L("下马会换回：", "Will swap back to: "), 1, 0.82, 0)
        for _, sl in ipairs(WATCH) do
            local x = r[sl]
            if x and not x.z then
                GameTooltip:AddLine("  " .. L(SLOTN[sl][1], SLOTN[sl][2]) .. L("：", ": ") .. (x[1] and MT.Name(x[1]) or L("（摘回背包）", "(unequip)")), 1, 1, 1, true)
            end
        end
    end
    local miss = MT.GMissing()
    if #miss > 0 then
        GameTooltip:AddLine(L("还能获得：", "You could also get:"), 1, 0.82, 0)
        for i = 1, math.min(3, #miss) do
            local ls = MT.GLines(miss[i])
            GameTooltip:AddLine("  " .. NO_TEX .. " " .. ls[1], 1, 1, 1, true)
            GameTooltip:AddLine("      " .. ls[2], 0.75, 0.75, 0.75, true)
        end
        if #miss > 3 then GameTooltip:AddLine(L("  （右键菜单里每一格悬停看全部）", "  (hover a row in the right-click menu for all)"), 0.6, 0.6, 0.6, true) end
    end
    GameTooltip:AddLine(L("左键：开 / 关　按住左键拖：挪位置　右键：菜单（换哪几格 / 立即换回 / 隐藏图标）", "Left: on/off · Drag: move · Right-click: menu (which slots / swap back now / hide)"), 0.7, 0.7, 0.7, true)
    GameTooltip:Show()
end
function MT.BtnHide(hide)
    MT.BtnDB().hide = hide and true or nil
    if not hide then MT.Btn() end
    MT.BtnUpdate()
    if hide then
        ns.Print(L("胡萝卜开关图标已隐藏。找回：GI 菜单 → 设置 → 窗口与提醒「胡萝卜开关图标」点「显示」，或 /gi 上马饰品 图标",
            "Carrot icon hidden. Bring it back: GI menu > Settings > Windows & alerts > Carrot icon, or /gi mounttrinket icon"))
        ns.Print(L("（只收起图标，上马换胡萝卜照常；要关掉功能：设置 → 通用「上马自动换胡萝卜」取消勾选）",
            "(Only the icon is hidden - the swap stays on. To turn it off: Settings > General > Mount trinket swap)"))
    end
end
-- 立即换回全部（骑着马也换回，直到下次上 / 下马）
function MT.BackNow()
    MT.hold = true
    MT.wait = true
    return MT.Sync()
end
function MT.SetOpt(c, v)
    ns.db.mtOpt = ns.db.mtOpt or {}
    ns.db.mtOpt[c] = v and true or false
    MT.wait = true
    pcall(MT.Sync)
    pcall(MT.BtnUpdate)
    if ns.RefreshSettings then pcall(ns.RefreshSettings) end
end
MT.OPTS = { { "tr", "换饰品（胡萝卜 / 沙漠玫瑰）", "Trinkets (Carrot / Desert Rose)" }, { "gl", "换手套（骑乘附魔 / 冬泉手套）", "Gloves (Riding enchant / Winterspring)" },
    { "ft", "换靴子（秘银马刺）", "Boots (Mithril Spurs)" }, { "pl", "换瘟疫之地骑手套装（披风 / 主手 / 戒指）", "Plaguelands Rider set (cloak / main hand / ring)" } }
-- 设置 → 通用「上马自动换胡萝卜」组里追加四个勾选（内核只放总开关，省内核内存；子插件上马就加载）
function MT.RegOpts()
    local g = ns.SettingsGroup and ns.SettingsGroup("mounttrinket")
    if not (g and g.items) or g.mtOpts then return end
    g.mtOpts = true
    for i, o in ipairs(MT.OPTS) do
        local c = o[1]
        local txt = (i == 4) and { o[2]:gsub("）$", "，默认关）"), o[3] .. " (default off)" } or { o[2], o[3] }
        g.items[#g.items + 1] = { type = "check", id = "mounttrinket." .. c, indent = 18, keys = "坐骑 mount", group = g,
            text = function() return L(txt[1], txt[2]) end, get = function() return MT.Opt(c) end, set = function(v) MT.SetOpt(c, v) end }
    end
end
pcall(MT.RegOpts)
-- ---------- 11-24 右键菜单（用户看了截图「优化UI」）----------
--   自绘：标题行（图标 + 上马换装 + 当前加速 / 开关）+ 游戏自带红叉；上面「换哪些」四行真勾选框（整行可点、悬停高亮、右侧灰色小字 = 这一格的状态，
--   没有的那格文字变灰但仍可勾）；分隔线；「立即换回全部」「清掉『实测无效』记录」（不适用时灰掉、写原因，常驻不藏）；分隔线；最底下低调橙灰「隐藏图标」
--   位置：贴在图标旁边（优先右侧，放不下换左侧），让开图标和它下面的状态字；点菜单外面 / Esc / 红叉 关
MT.ROW_H, MT.PAD, MT.HEAD_H, MT.MENU_MINW = 22, 10, 28, 300
local CHK_UP, CHK_ON = "Interface\\Buttons\\UI-CheckBox-Up", "Interface\\Buttons\\UI-CheckBox-Check"
-- 一格的状态小字 + 有没有东西（没有 = 行文字变灰）
function MT.CatStatus(c)
    local z = MT.Zone()
    z.spd = mounted() and MT.Speed() ~= nil
    local own, bad, worn, n = nil, false, nil, 0
    local rec = MT.Rec() or {}
    for _, e in ipairs(MT.Owned()) do
        if e.c == c then
            n = n + 1
            local it, en = ITEMS[e.id], ENCH[enchOf(e.link) or 0]
            local k = (c == "pl" and ("pl@" .. z.k)) or (it and it.z and (e.id .. "@" .. z.k)) or (it and it.p and tostring(e.id)) or (en and ("e" .. enchOf(e.link)))
            if MT.Bad(k) then bad = true else own = own or e end
            if e.slot and rec[e.slot] then worn = e end
        end
    end
    if c == "pl" then
        if n == 0 then return L("背包里没有", "none in bags"), false end
        if bad and not own then return L("已失效", "no effect"), true end
        return string.format(L("有 %d / 3 件", "%d / 3 pieces"), n), true
    end
    if worn then return L("已换上 ", "on: ") .. MT.Name(worn.link or worn.id), true end
    if own then return MT.Name(own.link or own.id), true end
    if bad then return L("已失效", "no effect"), true end
    return L("背包里没有", "none in bags"), false
end
-- 标题右边：总加速 / 开关状态
function MT.HeadState()
    if MT.Off() then return "|cffff5555" .. L("已关", "Off") .. "|r" end
    local s = MT.Speed()
    if mounted() and MT.base and s and s > MT.base + MT.EPS then
        return "|cff33ff99+" .. math.floor((s - MT.base) / (tonumber(BASE_MOVEMENT_SPEED) or 7) * 100 + 0.5) .. "%|r"
    end
    local n = MT.SwapCount()
    if mounted() and n > 0 then return "|cff33ff99" .. L("已换 ", "") .. n .. L(" 件", " on") .. "|r" end
    return "|cff33ff99" .. L("开着", "On") .. "|r"
end
-- 菜单该放哪边：图标右边放得下（还要让开图标下面那行状态字）就放右边，否则左边。纯函数，测试直接调
function MT.MenuSide(iconL, iconR, iconW, txtW, menuW, screenW)
    local gap = math.max(6, ((txtW or 0) - (iconW or 0)) / 2 + 6)   -- 状态字比图标宽时往外伸出的那一截 + 6
    if (iconR or 0) + gap + menuW <= (screenW or 0) then return "right", gap end
    if (iconL or 0) - gap - menuW >= 0 then return "left", gap end
    return ((screenW or 0) - (iconR or 0) >= (iconL or 0)) and "right" or "left", gap
end
local function num(f, o) local ok, v = pcall(f, o); return ok and tonumber(v) or nil end
function MT.MenuRow(m, i)
    local r = m.rows[i]
    if r then return r end
    r = CreateFrame("Button", nil, m)
    r:SetHeight(MT.ROW_H)
    local hl = r:CreateTexture(nil, "HIGHLIGHT"); hl:SetAllPoints(); hl:SetColorTexture(1, 0.82, 0, 0.12)
    r.chk = r:CreateTexture(nil, "ARTWORK"); r.chk:SetSize(20, 20); r.chk:SetPoint("LEFT", 2, 0); r.chk:SetTexture(CHK_UP)
    r.tick = r:CreateTexture(nil, "OVERLAY"); r.tick:SetSize(20, 20); r.tick:SetPoint("CENTER", r.chk, "CENTER"); r.tick:SetTexture(CHK_ON)
    r.t = r:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall"); r.t:SetJustifyH("LEFT")
    r.s = r:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall"); r.s:SetPoint("RIGHT", -4, 0); r.s:SetJustifyH("RIGHT")
    r:SetScript("OnClick", function(self) if self.fn and self.on then pcall(self.fn) end end)
    r:SetScript("OnEnter", function(self) if self.cat then pcall(MT.CatTip, self, self.cat) end end)   -- 那一格能换什么、没有的怎么拿
    r:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
    m.rows[i] = r
    return r
end
function MT.MenuSep(m, i)
    local s = m.seps[i]
    if not s then s = m:CreateTexture(nil, "ARTWORK"); s:SetHeight(1); s:SetColorTexture(1, 1, 1, 0.15); m.seps[i] = s end
    return s
end
function MT.MenuBuild()
    local m = MT.menu
    if not m then
        m = CreateFrame("Frame", "GearInsightForeverMountMenu", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
        m:SetFrameStrata("FULLSCREEN_DIALOG"); m:SetClampedToScreen(true); m:EnableMouse(true)
        if m.SetBackdrop then
            m:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8x8", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12, insets = { left = 3, right = 3, top = 3, bottom = 3 } })
            m:SetBackdropColor(0.05, 0.05, 0.07, 0.96)
            m:SetBackdropBorderColor(0.2, 1, 0.6, 0.6)
        end
        m.ic = m:CreateTexture(nil, "ARTWORK"); m.ic:SetSize(18, 18); m.ic:SetPoint("TOPLEFT", MT.PAD, -6)
        m.title = m:CreateFontString(nil, "OVERLAY", "GameFontNormal"); m.title:SetPoint("LEFT", m.ic, "RIGHT", 6, 0)
        m.state = m:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall"); m.state:SetPoint("LEFT", m.title, "RIGHT", 8, 0)
        local close = CreateFrame("Button", nil, m, "UIPanelCloseButton"); close:SetSize(24, 24); close:SetPoint("TOPRIGHT", 1, 1)
        close:SetScript("OnClick", function() m:Hide() end)   -- 直接 Hide（原生红叉走 HideUIPanel，战斗中被拦）
        m.close = close
        m.rows, m.seps = {}, {}
        -- 点菜单外面关：只在开着时听全局鼠标按下（没有这个事件的客户端照样能 Esc / 红叉关）
        m:SetScript("OnShow", function(self) pcall(self.RegisterEvent, self, "GLOBAL_MOUSE_DOWN") end)
        m:SetScript("OnHide", function(self) pcall(self.UnregisterEvent, self, "GLOBAL_MOUSE_DOWN") end)
        m:SetScript("OnEvent", function(self)
            local over = function(f) local ok, v = pcall(f.IsMouseOver, f); return ok and v end
            if not over(self) and not (MT.btn and over(MT.btn)) then self:Hide() end
        end)
        if UISpecialFrames then table.insert(UISpecialFrames, "GearInsightForeverMountMenu") end   -- Esc 关
        MT.menu = m
    end
    m.ic:SetTexture(MT.BtnIcon())
    m.title:SetText("|cff33ff99GearInsight|r · " .. L("上马换装", "Mount gear"))   -- 一眼看出是 GI 插件
    m.state:SetText(MT.HeadState())
    -- 行内容：{ kind, text, status, on（勾选状态 / 能不能点）, dim（文字变灰）, fn, color }
    local list = {}
    for _, o in ipairs(MT.OPTS) do
        local c = o[1]
        local st, has = MT.CatStatus(c)
        list[#list + 1] = { kind = "opt", key = c, text = L(o[2], o[3]), status = st, checked = MT.Opt(c), dim = not has, fn = function() MT.SetOpt(c, not MT.Opt(c)); MT.MenuBuild() end }
    end
    if MT.AC then list[#list + 1] = { kind = "sep" }; list[#list + 1] = MT.AC.MenuRow() end   -- 11-24 瘟疫之地戴委任徽章（悬停看规则 / 去哪拿）
    list[#list + 1] = { kind = "sep" }
    for _, g in ipairs(MT.GMissing()) do   -- 还缺、有坐标的第一件：一行「导航」（地图插旗 + 聊天框 /way 坐标）
        if g.way then
            list[#list + 1] = { kind = "act", key = "nav", text = L("导航去拿：", "Go get: ") .. MT.GName(g), on = true, color = { 0.4, 0.8, 1 },
                status = string.format("%s %.1f, %.1f", L(g.way[4][1], g.way[4][2]), g.way[2], g.way[3]), fn = function() MT.GNav(g); m:Hide() end }
            break
        end
    end
    local any, nb = MT.SwapCount() > 0, MT.BadCount()   -- 委任徽章不算（立即换回全部不动它）
    list[#list + 1] = { kind = "act", key = "back", text = L("立即换回全部", "Swap everything back now"), on = any,
        status = any and string.format(L("%d 件", "%d"), MT.SwapCount()) or L("没有换上的", "nothing swapped"), fn = function() MT.BackNow(); m:Hide() end }
    list[#list + 1] = { kind = "act", key = "bad", text = L("清掉「实测无效」记录", "Forget 'no effect' marks"), on = nb > 0,
        status = nb > 0 and string.format(L("%d 件", "%d"), nb) or L("没有", "none"),
        fn = function() MT.ClearBad(); MT.wait = true; pcall(MT.Sync); pcall(MT.BtnUpdate); MT.MenuBuild() end }
    list[#list + 1] = { kind = "sep" }
    list[#list + 1] = { kind = "act", key = "hide", text = L("隐藏图标", "Hide icon"), on = true, color = { 0.85, 0.6, 0.35 },
        status = L("设置 → 窗口与提醒 找回", "Settings > Windows"), fn = function() m:Hide(); MT.BtnHide(true) end }
    for _, r in ipairs(m.rows) do r:Hide() end
    for _, s in ipairs(m.seps) do s:Hide() end
    local y, ri, si, w = -(MT.HEAD_H + 2), 0, 0, 0
    w = math.max(w, (num(m.title.GetStringWidth, m.title) or 60) + (num(m.state.GetStringWidth, m.state) or 40) + 18 + 8 + 30 + 60 + MT.PAD * 2)
    for _, it in ipairs(list) do
        if it.kind == "sep" then
            si = si + 1
            local s = MT.MenuSep(m, si)
            s:ClearAllPoints(); s:SetPoint("TOPLEFT", MT.PAD, y - 4); s:SetPoint("TOPRIGHT", -MT.PAD, y - 4); s:Show()
            y = y - 9
        else
            ri = ri + 1
            local r = MT.MenuRow(m, ri)
            r.kind, r.key, r.fn, r.on, r.cat = it.kind, it.key, it.fn, it.on ~= false, (it.kind == "opt" and it.key) or false
            r:ClearAllPoints(); r:SetPoint("TOPLEFT", MT.PAD - 4, y); r:SetPoint("TOPRIGHT", -(MT.PAD - 4), y)
            local opt = it.kind == "opt"
            r.chk:SetShown(opt); r.tick:SetShown(opt and it.checked and true or false)
            r.checked = (opt and it.checked) and true or false
            r.t:ClearAllPoints(); r.t:SetPoint("LEFT", opt and 26 or 6, 0)
            r.t:SetText(it.text); r.s:SetText(it.status or "")
            local cr, cg, cb = 1, 1, 1
            if it.color then cr, cg, cb = it.color[1], it.color[2], it.color[3] end
            if it.dim or it.on == false then cr, cg, cb = 0.55, 0.55, 0.55 end
            r.t:SetTextColor(cr, cg, cb)
            r.dim = (it.dim or it.on == false) and true or false
            if r.SetEnabled then r:SetEnabled(it.on ~= false) end
            r:Show()
            w = math.max(w, (opt and 26 or 6) + (num(r.t.GetStringWidth, r.t) or 0) + 16 + (num(r.s.GetStringWidth, r.s) or 0) + 8 + MT.PAD * 2)
            y = y - MT.ROW_H
        end
    end
    m.list = list
    m:SetSize(math.max(MT.MENU_MINW, math.ceil(w)), -y + MT.PAD - 2)
    return m
end
-- 摆在图标旁边（不盖图标和状态字）
function MT.MenuPlace(m, b)
    b = b or MT.btn
    m:ClearAllPoints()
    if not b then m:SetPoint("CENTER", UIParent, "CENTER"); return end
    local s = (num(b.GetEffectiveScale, b) or 1) / (num(m.GetEffectiveScale, m) or 1)
    local side, gap = MT.MenuSide(num(b.GetLeft, b), num(b.GetRight, b), num(b.GetWidth, b) or 34, num(b.txt.GetStringWidth, b.txt) or 70,
        (num(m.GetWidth, m) or MT.MENU_MINW) / s, num(UIParent.GetWidth, UIParent) or 1920)
    if side == "right" then m:SetPoint("TOPLEFT", b, "TOPRIGHT", gap, 0) else m:SetPoint("TOPRIGHT", b, "TOPLEFT", -gap, 0) end
    MT.menuAt = { side = side, gap = gap }
end
function MT.MenuToggle(b)
    if MT.menu and MT.menu:IsShown() then MT.menu:Hide(); return MT.menu end
    local m = MT.MenuBuild()
    MT.MenuPlace(m, b)
    m:Show()
    return m
end
-- 11-23 GI-340「误关之后无法打开」：右键防误点 → 11-24 改成菜单（右键 + 点「隐藏图标」= 两下才隐藏）；建菜单出错时退回「3 秒内右键两下」
MT.HIDE_CONFIRM = 3
function MT.BtnRight(anchor)
    if GameTooltip then GameTooltip:Hide() end
    if not MT.noMenu then
        local ok, m = pcall(MT.MenuToggle, anchor or MT.btn)
        if ok then return m end
    end
    local t = now()
    if MT.hideAsk and t - MT.hideAsk <= MT.HIDE_CONFIRM then
        MT.hideAsk = nil
        return MT.BtnHide(true)
    end
    MT.hideAsk = t
    MT.Say(L("再点一次右键 = 隐藏图标（误点不用管）", "Right-click again to hide the icon"))
end
if ns.RegisterWindow then
    ns.RegisterWindow({ key = "mtBtn", order = 33, title = function() return L("胡萝卜开关图标（上马换饰品）", "Carrot icon (mount trinket)") end,
        state = function()
            if not ns.db then return "" end
            if MT.BtnDB().hide then return L("已隐藏", "Hidden") end
            if not MT.HasAny() and ((UnitLevel and UnitLevel("player")) or 0) < MT.GUIDE_LV then return L("背包里没有坐骑提速装备（40 级起或有了才显示）", "No mount speed gear (shown from level 40)") end
            return L("显示中（左键开关、按住拖动）", "Shown (left-click on/off, drag to move)")
        end,
        actions = function()
            local hidden = ns.db and MT.BtnDB().hide
            local off = MT.Off()
            return {
                { text = hidden and L("显示", "Show") or L("隐藏", "Hide"), fn = function() MT.BtnHide(not hidden) end },
                { text = L("复位位置", "Reset position"), fn = function() MT.BtnReset() end },
                { text = off and L("打开功能", "Turn on") or L("关掉功能", "Turn off"), fn = function() MT.Toggle(off) end },   -- 11-24 ⑩ 图标隐藏 ≠ 功能关
            }
        end })
end
MT.BTN_X, MT.BTN_Y = 220, -120   -- 默认位置（屏幕中间偏右下，避开头像框 / 目标框）
-- 位置复原（/gi 上马饰品 图标 复位）
function MT.BtnReset()
    MT.BtnDB().pos, MT.BtnDB().hide = nil, nil
    MT.Btn()
    local b = MT.btn
    if b then b:ClearAllPoints(); b:SetPoint("CENTER", UIParent, "CENTER", MT.BTN_X, MT.BTN_Y) end
    MT.BtnUpdate()
end
function MT.Btn()
    if MT.btn then return MT.BtnUpdate() end
    local b = CreateFrame("Button", "GearInsightForeverCarrotBtn", UIParent)
    b:SetSize(34, 34)
    -- 11-23 用户截图「这个移动不了吗」：默认位置压在头像框底下（MEDIUM 层比头像框低，鼠标点到的是头像框）→ 提到 HIGH、换到屏幕中间偏右下
    b:SetFrameStrata("HIGH")
    if b.SetToplevel then b:SetToplevel(true) end
    if b.SetClampedToScreen then b:SetClampedToScreen(true) end
    b:SetMovable(true)
    b:RegisterForDrag("LeftButton")
    b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    local p = MT.BtnDB().pos
    if type(p) == "table" and p[1] then b:SetPoint(p[1], UIParent, p[2] or p[1], tonumber(p[3]) or 0, tonumber(p[4]) or 0)
    else b:SetPoint("CENTER", UIParent, "CENTER", MT.BTN_X, MT.BTN_Y) end
    local bd = b:CreateTexture(nil, "BACKGROUND")   -- GI 绿边（插件品牌色 33ff99）
    bd:SetPoint("TOPLEFT", -2, 2); bd:SetPoint("BOTTOMRIGHT", 2, -2)
    bd:SetColorTexture(0.2, 1, 0.6, 0.85)
    local ic = b:CreateTexture(nil, "ARTWORK")
    ic:SetAllPoints()
    local gi = b:CreateTexture(nil, "OVERLAY")   -- 右上角 GI logo（插件自带 media/logo，主界面同一张）
    gi:SetSize(14, 14); gi:SetPoint("CENTER", b, "TOPRIGHT", -1, -1)
    gi:SetTexture("Interface\\AddOns\\GearInsight_Forever\\media\\logo")
    b.border, b.logo = bd, gi
    ic:SetTexture(MT.BtnIcon())
    local txt = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    txt:SetPoint("TOP", b, "BOTTOM", 0, -1)
    b.icon, b.txt = ic, txt
    b:SetScript("OnDragStart", function(self) self:StartMoving() end)
    b:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local pt, _, rp, x, y = self:GetPoint()
        MT.BtnDB().pos = { pt, rp, x, y }
    end)
    b:SetScript("OnClick", function(self, btn) if btn == "RightButton" then MT.BtnRight(self) else MT.Toggle() end end)
    b:SetScript("OnEnter", MT.BtnTip)
    b:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
    MT.btn = b
    MT.BtnUpdate()
end

-- 读回存档里没换回的（骑着马 /reload / 下线过）：MT.Rec() 自己把老格式转成新格式
do
    local old = ns.db and ns.db.mtSwap   -- ⑪ 老版本那一份（不知道是哪个角色的）：这一格正戴着那件才认领
    if ns.db then ns.db.mtSwap = nil end
    if type(old) == "table" and old[1] and not MT.Any() and inv(old[1]) == old[3] then MT.SaveRec({ v = 2, [old[1]] = { old[2] or false, old[3] } }) end
    -- 11-24 角色键：服务器名读到空串时是「名字-」（如「枫叶海狸-」）。这次键里没有、但「名字-」/「名字-?」下有记录 → 认领过来，不丢换装 / 无效记录
    local nm = (UnitName and UnitName("player")) or "?"
    for _, tk in ipairs({ "mtSwaps", "mtBad" }) do
        local t = ns.db and ns.db[tk]
        if type(t) == "table" and t[me()] == nil then
            for _, alt in ipairs({ nm .. "-", nm .. "-?" }) do
                if alt ~= me() and t[alt] ~= nil then t[me()], t[alt] = t[alt], nil; break end
            end
        end
    end
    -- 11-24 胡萝卜误判无效（一次性迁移）：老存档 mtBad 里不是「要实测」那几件的（胡萝卜 11122 / e464 / e930 / 冬泉手套 / pl@…）全清掉
    local bt = ns.db and ns.db.mtBad
    if type(bt) == "table" then
        for ch, b in pairs(bt) do
            if type(b) == "table" then
                for k in pairs(b) do
                    local it = ITEMS[tonumber(tostring(k):match("^(%d+)") or "") or 0]
                    if not (it and it.m) then b[k] = nil end
                end
                if not next(b) then bt[ch] = nil end
            end
        end
        if not next(bt) then ns.db.mtBad = nil end
    end
    MT.Rec()
end
if ns.db then pcall(MT.Btn) end

local ev = CreateFrame("Frame")
for _, e in ipairs({ "PLAYER_MOUNT_DISPLAY_CHANGED", "PLAYER_REGEN_ENABLED", "PLAYER_ALIVE", "PLAYER_UNGHOST", "PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA", "BAG_UPDATE_DELAYED", "PLAYER_EQUIPMENT_CHANGED" }) do
    pcall(ev.RegisterEvent, ev, e)   -- ⛔ 容错注册：客户端没有的事件名会报错
end
for _, e in ipairs({ "UNIT_AURA", "UNIT_SPELLCAST_STOP", "UNIT_SPELLCAST_CHANNEL_STOP", "UNIT_SPELLCAST_INTERRUPTED" }) do
    pcall(ev.RegisterUnitEvent, ev, e, "player")
end
pcall(ev.RegisterEvent, ev, "COMPANION_UPDATE")
ev:SetScript("OnEvent", function(_, e)
    if e == "BAG_UPDATE_DELAYED" and MT.AC and not MT.stepping then   -- 委任徽章从银行取出来 / 刚拿到：在区域里就补戴
        local okW, w = pcall(MT.AC.Want)
        if okW and w then MT.wait = true; pcall(MT.Sync) end
    end
    if e == "BAG_UPDATE_DELAYED" or e == "PLAYER_EQUIPMENT_CHANGED" then if MT.btn then pcall(MT.BtnUpdate) else pcall(MT.Btn) end return end   -- 有没有提速装备变了：图标出 / 收
    -- 脱战 / 传送 / 进出副本 / 换地区（冬泉谷 / 瘟疫之地 / 沙漠）：不管上下马状态记没记错，都按现在补做一遍
    if e == "PLAYER_REGEN_ENABLED" or e == "PLAYER_ENTERING_WORLD" or e == "ZONE_CHANGED_NEW_AREA" then MT.wait = true end
    pcall(MT.Sync)
end)
MT.ev = ev   -- 测试用

-- /gi 上马饰品 [开|关] · /gi mounttrinket [on|off]：不带参数 = 切换（主插件 MountStub.lua 放的是占位：先加载本子插件再转过来）
ns.ExtraSlash = ns.ExtraSlash or {}
ns.ExtraSlash["上马饰品"] = function(rest, raw)
    local r, c = (rest or ""):gsub("%s", ""), (raw or ""):gsub("%s", "")   -- rest 已转小写；中文按原样（raw）认
    if r:find("reset", 1, true) or (raw or ""):find("复位", 1, true) then   -- 11-23 图标拖丢了 / 被挡住：回到默认位置
        MT.BtnReset()
        ns.Print(L("胡萝卜开关图标：已回到默认位置（屏幕中间偏右下），按住左键可以拖", "Carrot icon reset to the default position - drag with the left button"))
        return
    end
    if r == "icon" or (raw or ""):find("图标", 1, true) then   -- 11-23 开关图标隐藏 / 找回（中文按字面找：%s 在某些区域设置下会吃掉中文字节）
        MT.BtnHide(not MT.BtnDB().hide)
        if not MT.BtnDB().hide then ns.Print(L("胡萝卜开关图标：已显示（右键菜单里可隐藏）", "Carrot icon shown (hide it from the right-click menu)")) end
        return
    end
    local on = not MT.Off()
    local v = r == "on" or c == "开" or (r ~= "off" and c ~= "关" and not on)
    ns.SetFeature("mounttrinket", v)   -- 11-24 换上 / 换回都由 MountStub.lua 的 set 当场补做（战斗中 = 脱战后）
    on = not MT.Off()
    ns.Print(L("上马自动换饰品：", "Mount trinket swap: ") .. (on and L("开", "on") or L("关", "off"))
        .. L("（上马换上胡萝卜 / 马刺靴子 / 骑乘手套，下马换回原装备；屏幕上的图标左键也能开关、右键选换哪几格；设置 → 通用「上马自动换胡萝卜」）", " (Carrot / spur boots / riding gloves while mounted, your gear back on dismount; also the icon on screen - right-click picks slots; Settings > General > Mount trinket swap)"))
end
ns.ExtraSlash.mounttrinket = ns.ExtraSlash["上马饰品"]

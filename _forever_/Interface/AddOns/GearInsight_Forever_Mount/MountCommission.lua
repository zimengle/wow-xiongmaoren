-- 瘟疫之地自动戴银色黎明委任徽章（11-24 P1；用户「东西瘟疫野外打怪自动装备这个」+ GI-350「骑马引怪时戴的是胡萝卜，进战斗下马不会换回委任徽章」）
--   设计稿 argent_commission_design.md，用户 4 问「都按推荐」：① 徽章锁格（四张图里徽章那格不动，胡萝卜只换另一格）
--   ② 默认开，斯坦索姆 / 通灵学院（副本 329 / 289）里也戴 ③ 两格都是主动使用饰品 = 不换，只提示一次去设置里指定一格
--   ④ 内核桩 GearInsight_Forever/MountCommStub.lua：总开关常驻 + 换区 / 进世界时「50 级以上 + 背包有黎明饰品 + 在这四张图」才加载本子插件
--   ⛔ HOLD：本文件和内核 MountCommStub.lua 一起登记在各自的 _hold.txt，没在游戏里实测前不进发行包
--   规则：戴着委任徽章 12846 / 黎明之印 13209 / 黎明符文 19812（同一唯一分类，只能戴一件）天灾怪才掉天灾石
--   做法：进区（骑不骑马都行，不在战斗）戴上 → 出区 / 关掉换回原装；换装执行 / 忙排队 / 存档 / 弹字全用 MountTrinket.lua 那一套（同一个「调度员」排谁戴哪格）
--     存档 ns.db.mtSwaps[角色][13 或 14] = { 原装, 徽章物品号, z = "ad", w = true（确认戴上了） }；下马「全部换回」/ 上马换装都跳过 z = "ad" 那格
--   ⛔ _Mount 加载内存上限 180 KB（现 ~154）：这个文件要省（数据摊平、文字短、设置项共用函数）；不注册战斗日志；不建 OnUpdate
local _, ns = ...; ns = _G.GearInsightForever or ns
local MT = ns.MountTrinket
if not MT then return end
local L = function(cn, en) return ns.L(cn, en) end
local AC = {}
MT.AC = AC
-- 只导出 MountTrinket.lua / 测试要用的；其余是文件内局部（AC 表小 = 省内存）
local Worn, On, Opt, Where, Find, Pick, Once, Guide, Click, State
local skip, told, guided, clickAt   -- skip = 玩家摘了徽章的区域键（这次进区不再戴）· told = 这次进区已提示过的 · guided = 这次登录已在聊天框说过去哪拿
local AD = { [13209] = 1, [19812] = 1, [12846] = 2 }   -- 值小的优先：黎明之印 / 黎明符文有属性，其次委任徽章
local ZL = { 1422, 1423, "西瘟疫之地", "东瘟疫之地", "Western Plaguelands", "Eastern Plaguelands" }   -- 和 MountTrinket 的 Z_PL 同一套（MT.Zone 往上找父地图）
local INST = { [329] = { "斯坦索姆", "Stratholme" }, [289] = { "通灵学院", "Scholomance" } }   -- GetInstanceInfo 第 8 个返回值（Map.db2）
-- 去哪拿（Questie《无限》坐标）：{ 阵营, 委任任务, NPC 中, 英, 地图, x, y, 地名中, 英 }
--   ⚠️ 瑟伦霍夫公爵：经典在圣光之愿礼拜堂 81.4, 59.8，《无限》数据是 71.6, 50.1 → 待游戏里核对
AC.WAY = {
    { "Alliance", 5401, "银色黎明军官普尔哈特", "Officer Pureheart", 1422, 42.9, 83.6, "西瘟疫之地 冰风岗", "Chillwind Camp, W. Plaguelands" },
    { "Horde", 5405, "银色黎明军官加鲁什", "Officer Garush", 1420, 83.2, 68.5, "提瑞斯法林地 壁垒", "The Bulwark, Tirisfal" },
    { false, 5503, "尼古拉斯·瑟伦霍夫公爵", "Duke Zverenhoff", 1423, 71.6, 50.1, "东瘟疫之地", "E. Plaguelands" },
}
local function inv(sl) return GetInventoryItemID("player", sl) end
-- 身上戴着的黎明饰品 → 槽位
function Worn()
    for sl = 13, 14 do if AD[inv(sl) or 0] then return sl end end
end

-- 总开关 ns.db.mtComm（false = 关，nil = 默认开；内核 MountCommStub.lua 同一个键）
-- 选项 ns.db.mtCommOpt = { inst = false（副本里不戴）, guide = false（不提示去哪拿）, slot = 13 / 14（固定哪格） }
function On() return ns.db ~= nil and ns.db.mtComm ~= false end
function Opt(k)
    local v = ns.db and ns.db.mtCommOpt and ns.db.mtCommOpt[k]
    if k == "slot" then return v end
    return v ~= false
end
function AC.SetOpt(k, v)   -- k = "on" 是总开关
    if k == "on" then
        ns.db.mtComm = false
        if v then ns.db.mtComm = nil end
    else
        local o = ns.db.mtCommOpt or {}
        if v == true then v = nil end   -- 默认开的项：开 = 不存
        o[k] = v
        ns.db.mtCommOpt = next(o) and o or nil
    end
    MT.wait = true
    pcall(MT.Sync)
    pcall(MT.BtnUpdate)
    if ns.RefreshSettings then pcall(ns.RefreshSettings) end
end

-- 在不在生效地区 → 区域键（"pl" / "i329" / "i289"）, 地名
function Where()
    local ok, _, typ, _, _, _, _, _, iid = pcall(GetInstanceInfo)
    if ok and typ and typ ~= "none" then   -- 副本里只认斯坦索姆 / 通灵学院（纳克萨玛斯等不算：别让父地图回溯认成东瘟疫之地）
        local t = INST[iid]
        if t and Opt("inst") then return "i" .. iid, L(t[1], t[2]) end
        return nil
    end
    local z = MT.Zone()
    for _, k in ipairs(ZL) do if z.ids[k] then return "pl", L("瘟疫之地", "the Plaguelands") end end
end

-- 背包里最该戴的那件 → { b, s, id, link }（换失败 3 次的 / 等级不够的跳过）
function Find()
    local C = rawget(_G, "C_Container")
    local num = (type(C) == "table" and C.GetContainerNumSlots) or rawget(_G, "GetContainerNumSlots")
    local best
    for bag = 0, num and (tonumber(NUM_BAG_SLOTS) or 4) or -1 do
        for s = 1, tonumber(num(bag)) or 0 do
            local id = MT.slotID(bag, s)
            if AD[id or 0] and (not best or AD[id] < AD[best.id]) then
                local e = { b = bag, s = s, id = id, link = MT.slotLink(bag, s) }
                if MT.Usable(e) then best = e end
            end
        end
    end
    return best
end

-- 主动使用饰品（有「使用：」效果）
local function active(x)
    local C = rawget(_G, "C_Item")
    local f = (type(C) == "table" and C.GetItemSpell) or rawget(_G, "GetItemSpell")
    local ok, s = pcall(f, x)
    return x and ok and s ~= nil
end
-- 戴哪一格 → 槽位, 底下的原装（玩家自己的饰品；false = 原来空着）/ nil（两格都是主动饰品）
--   ⓪ 设置里指定的格 ① 空格（原来就空着）② 我们换上的提速饰品那格（底下是被动饰品；原装继承那格记录里的真饰品）
--   ③ 被动的那件（两件都被动 = 物品等级低的，一样低 = 下格）④ 两件都主动 = 不换
function Pick()
    local rec = MT.Rec() or {}
    local u, sp, a, lv = {}, {}, {}, {}
    for sl = 13, 14 do
        local r = rec[sl]
        if r and not r.z and inv(sl) == r[2] then u[sl], sp[sl] = r[1], true
        else u[sl] = (GetInventoryItemLink and GetInventoryItemLink("player", sl)) or inv(sl) or false end
        a[sl] = active(u[sl])
        local ok, _, _, _, l = MT.itemInfo(MT.idOf(u[sl]))
        lv[sl] = ok and tonumber(l) or 0
    end
    local fix = Opt("slot")
    if fix then return fix, u[fix] end
    for sl = 13, 14 do if not u[sl] then return sl, false end end
    for sl = 13, 14 do if sp[sl] and not a[sl] then return sl, u[sl] end end
    if a[13] and a[14] then return nil end
    local sl = (a[14] or (not a[13] and lv[13] < lv[14])) and 13 or 14
    return sl, u[sl]
end

-- 同一次进区每种提示只出一次（told = { k = 区域键, [种类] = true }）
function Once(key, kind)
    local t = told
    if not t or t.k ~= key then t = { k = key }; told = t end
    if t[kind] then return false end
    t[kind] = true
    return true
end

-- 这一步该做什么（MT.Step 排在上马换装前面）：不在区域 / 关掉 → 换回徽章那格；在区域、没戴黎明饰品 → 戴上
function AC.Acts()
    local out, rec = {}, MT.Rec() or {}
    local key, where
    if On() then key, where = Where() end
    if not key then skip, told = nil, nil end
    for sl = 13, 14 do
        local r = rec[sl]
        if r and r.z and not key and inv(sl) == r[2] then out[#out + 1] = { slot = sl, back = true } end   -- 弹「已换回 原装」/「已摘下 徽章」
    end
    if #out > 0 or not key then return out end
    if skip ~= key then skip = nil end
    if Worn() or skip then return out end
    local e = Find()
    if not e then pcall(Guide, key); return out end
    local sl, o = Pick()
    if not sl then
        if Once(key, "both") then MT.Note("msg", L("两格都是主动饰品，没自动戴委任徽章 —— 设置里指定一格", "Both trinkets have Use effects: pick a slot for the Commission in Settings")) end
        return out
    end
    out[1] = { slot = sl, e = e, z = "ad", say = L("已戴上 ", "Equipped ") .. MT.Name(e.link or e.id) .. L("（", " (") .. where
        .. (o and (L("，换下 ", ", replacing ") .. MT.Name(o)) or "") .. L("）", ")") }
    return out
end

-- 上马换胡萝卜不许动的格：我们戴上的徽章那格；在区域里玩家自己戴着的黎明饰品那格
function AC.Lock(sl)
    local r = (MT.Rec() or {})[sl]
    return (r and r.z) or (AD[inv(sl) or 0] and On() and Where() ~= nil) or false
end
-- 玩家自己把我们戴上（确认过）的徽章摘了：尊重玩家，这次进区不再自动戴
function AC.Lost(r)
    if r.z and r.w then skip = Where() end
end
-- 在区域里、背包有、没戴（BAG_UPDATE_DELAYED 从银行取出来时补做）；tell = 忙的时候调（战斗中进区：弹一次「脱战后戴上」）
function AC.Want(tell)
    local key, where = Where()
    local w = key and On() and not Worn() and skip ~= key and Find() ~= nil or false
    if w and tell and InCombatLockdown and InCombatLockdown() and Once(key, "busy") then MT.Say(L("进入", "Entered ") .. where .. L("：脱战后戴上委任徽章", ": Commission after combat")) end
    return w
end

-- 没有黎明饰品：去哪拿（每次进区一次；聊天框那几行每次登录最多一次）；在银行里 → 取出来
function Guide(key)
    if not Opt("guide") or not Once(key, "guide") then return false end
    local n = C_Item and C_Item.GetItemCount or GetItemCount or function() return 0 end   -- 11-25 《无限》没有全局 GetItemCount
    for id in pairs(AD) do
        if (n(id, true) or 0) > (n(id) or 0) then
            MT.Say(MT.Name(id) .. L(" 在银行里：取出来放背包就会自动戴", " is in your bank"))
            return true
        end
    end
    if guided then return false end   -- 聊天框那几行：每次登录 / 重载最多一次
    guided = true
    local fac = UnitFactionGroup and UnitFactionGroup("player")
    ns.Print(L("你没有银色黎明委任徽章：不戴它，瘟疫之地的天灾怪不掉天灾石（换银色黎明声望）。50 级可接，丢了找原 NPC 对话免费补：",
        "No Argent Dawn Commission: Scourge drop no Scourgestones without it. Quest at 50 (lost it? ask the NPC again):"))
    for i, g in ipairs(AC.WAY) do
        if not g[1] or g[1] == fac then ns.Print(string.format("  %s：%s %.1f, %.1f  |cff33ff99|Haddon:GIFAD:%d|h[%s]|h|r", L(g[3], g[4]), L(g[8], g[9]), g[6], g[7], i, L("在地图上标出", "Map"))) end
    end
    MT.Say(L("没有银色黎明委任徽章：天灾怪不掉天灾石（聊天框看去哪拿）", "No Argent Dawn Commission (see chat)"))
    return true
end
-- 点聊天里的 [在地图上标出]（同 TrainNow.lua：EventRegistry「SetItemRef」+ SetItemRef 后钩，0.3 秒内只认一次）→ MT.GNav（地图标记 + /way）
function Click(l)
    local g = AC.WAY[type(l) == "string" and tonumber(l:match("^addon:GIFAD:(%d)")) or 0]
    local t = GetTime and GetTime() or 0
    if not g or (t > 0 and t - (clickAt or -1) < 0.3) then return false end
    clickAt = t
    return MT.GNav({ n = { g[3], g[4] }, way = { g[5], g[6], g[7], { g[8], g[9] }, L(g[3], g[4]) } })
end
local function click(a, b) if not select(2, pcall(Click, a)) then pcall(Click, b) end end   -- SetItemRef(链接, …) / EventRegistry(主人, 链接)
if EventRegistry and EventRegistry.RegisterCallback then pcall(EventRegistry.RegisterCallback, EventRegistry, "SetItemRef", click, AC) end
if hooksecurefunc and SetItemRef then pcall(hooksecurefunc, "SetItemRef", click) end

-- 状态小字（右键菜单那一行 / 图标悬停）→ 文字, 有没有（没有 = 菜单那行变灰）
function State()
    local sl = Worn()
    if not On() then return L("已关", "Off"), true end
    if sl then return sl == 13 and L("已戴 · 上格", "on · top") or L("已戴 · 下格", "on · bottom"), true end
    if not Find() then return L("背包里没有", "none in bags"), false end
    return Where() and (skip and L("你摘下了，这次不戴", "removed") or L("脱战后戴", "after combat")) or L("不在区域", "not in zone"), true
end
-- 图标悬停一行；没戴、背包也没有 = 不出（低等级角色别看到）
function AC.TipLine()
    if Worn() or Find() then return L("委任徽章：", "Commission: ") .. State() end
end
function AC.MenuRow()
    local st, has = State()
    return { kind = "opt", key = "ad", text = L("瘟疫之地戴银色黎明委任徽章", "Commission in the Plaguelands"), status = st, checked = On(), dim = not has,
        fn = function() AC.SetOpt("on", not On()); pcall(MT.MenuBuild) end }
end

-- 设置 → 通用「上马自动换胡萝卜」组：总开关（内核 MountCommStub.lua 放的）挪到胡萝卜几项后面，再接子项（文件级 do 块：只跑一次，不留函数占内存）
do
    local g = ns.SettingsGroup and ns.SettingsGroup("mounttrinket")
    if g and g.items and not g.acOpts then
        g.acOpts = true
        local list = { false,
            { "inst", L("副本里也戴（斯坦索姆 / 通灵学院）", "Also in Stratholme / Scholomance") },
            { "guide", L("没有徽章时提示去哪拿", "Tell me where to get it") },
            { type = "button", id = "mounttrinket.ad.slot", w = 240, dyn = true,
              text = function() local v = Opt("slot"); return L("换哪一格：", "Slot: ") .. ((v == 13 and L("固定上格", "top")) or (v == 14 and L("固定下格", "bottom")) or L("自动（不换主动饰品）", "auto")) end,
              click = function() local v = Opt("slot"); AC.SetOpt("slot", (not v and 13) or (v == 13 and 14) or nil) end } }
        for i = #g.items, 1, -1 do if g.items[i].id == "mounttrinket.ad" then list[1] = table.remove(g.items, i) end end
        list[1] = list[1] or { type = "check", id = "mounttrinket.ad", text = L("瘟疫之地自动戴银色黎明委任徽章（天灾石）", "Auto-equip Argent Dawn Commission"),
            get = On, set = function(v) AC.SetOpt("on", v) end }
        for _, it in ipairs(list) do
            if it[1] then
                local k = it[1]
                it = { type = "check", id = "mounttrinket.ad." .. k, indent = 18, text = it[2], get = function() return Opt(k) end, set = function(v) AC.SetOpt(k, v and true or false) end }
            end
            it.group, it.keys = g, "委任 天灾石 银色黎明 黎明之印 黎明符文 commission scourgestone"
            g.items[#g.items + 1] = it
        end
    end
end

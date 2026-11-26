-- 上马自动换饰品的触发桩（11-20 用户「上马自动换上，下马自动换下，屏幕弹出文字，快速消失」，截图 = 棍子上的胡萝卜 11122）
--   换装逻辑、/gi 上马饰品 的真处理都在按需加载的 GearInsight_Forever_Mount / MountTrinket.lua（11-24 从 _Bag 拆出来）；这里只有：
--     功能开关（设置 → 功能 → 背包「上马换饰品」，默认开）· 换装范围（饰品 / 手套 / 靴子 / 瘟疫套装）· 命令占位 · 上马 / 有没换回的记录才加载子插件
--   ⛔ 内核只剩约 1 KB：不另建框体（离线一个框 ≈ 3 KB），借 BagStub.lua 的事件框（ns._BagStubEv）多挂两个事件 + 一个钩子；
--   ⛔ 物品表 / 附魔号 / 地区都在子插件里，内核不放（11-24 升级多槽位：内核只改触发条件，不再数胡萝卜）
--   ⛔ 不注册 COMBAT_LOG_EVENT_UNFILTERED；排在 BagStub.lua / Features.lua 后面；所有职业都有
local _, ns = ...
-- 存档 ns.db.mountTrinket（false = 关，nil = 默认开）
-- 11-24 GI-350「设置里找不到对应选项」：去掉 hold（原来 _Bag 不在 / 没就绪时功能页不出这一条）；设置 → 通用 常驻一组「上马自动换胡萝卜」（PageData.lua general 块）
--   GI-351「开关关了还是会换」：开关只有这一个存档键；所有入口（功能页勾选 / 设置 → 通用 / 屏幕图标 / 命令）都走这里的 set，
--   子插件已加载就当场按新开关补做（关掉时骑着马 = 当场换回；战斗中 = 脱战后换回）；子插件 MT.Equip 自己也直接读这个键（不靠功能登记）
local function mtGet() return ns.db.mountTrinket ~= false end
local function mtSet(v)
    if v then ns.db.mountTrinket = nil else ns.db.mountTrinket = false end
    local MT = ns.MountTrinket
    if MT then MT.wait = true; pcall(MT.Sync); pcall(MT.BtnUpdate) end
end
ns.Feature({ key = "mounttrinket", cat = "bag", zh = "上马换饰品", en = "Mount trinket swap", def = true, cfg = "mounttrinket",
    get = mtGet, set = mtSet,
    dzh = "上马换上提速装备，下马换回", den = "Speed gear while mounted" })
if ns.RegisterSettings then
    local function tt() return ns.L("上马自动换胡萝卜", "Mount trinket swap") end
    -- 11-24 换装范围（饰品 / 手套 / 靴子 / 瘟疫套装）四个勾选由子插件 MountTrinket.lua 加载时追加进这一组（内核放 4 项要 +4 KB）
    ns.RegisterSettings({ key = "mounttrinket", order = 25.5, data = "general", title = tt,
        items = { { type = "check", id = "mounttrinket.on", keys = "饰品 carrot trinket", text = tt, get = mtGet, set = mtSet } } })
end
-- 11-24 子插件 GearInsight_Forever_Mount：直接 LoadAddOn（和 _LayerUI 一样不走 LazyModule、不进 ModManifest，省内核内存）；
--   网易DD 包并进主文件夹时 ns.MountTrinket 登录就在。只试一次：没装 / 加载失败记成 false
-- 11-23 存档里记着没换回的（ns.db.mtSwap(s)）就加载（/reload 后下马也要换回）
-- 11-24 升级多槽位：不再数胡萝卜（提速装备认附魔，内核不放物品表）→ 上马就加载（开关关着也加载：子插件要摆图标让玩家点开，GI-340）
--   load(_, _, force)：事件钩子传进来的是 (框, 事件)，命令占位传 force = true（不管骑没骑马都加载）
--   ⛔ 11-24 只认「没有事件名」时的 force：事件钩子的第 3 个参数是事件自带的（UNIT_AURA 的 "player"、PLAYER_ENTERING_WORLD 的 isInitialLogin），
--      原来当成 force → 任何光环变化都加载子插件（不骑马也加载）
local function load(_, e, force)
    if ns.MountTrinket == nil and ns.db and ((force and not e) or ns.db.mtSwap or ns.db.mtSwaps or (IsMounted and IsMounted())) then
        ns.MountTrinket = false
        pcall((C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn, "GearInsight_Forever_Mount")   -- 加载完子插件 MountInit.lua 自己按现在骑没骑着补做一次
    end
    return ns.MountTrinket
end
local ev = ns._BagStubEv
if ev then
    ev:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
    pcall(ev.RegisterUnitEvent, ev, "UNIT_AURA", "player")   -- 上马 = 身上多一个光环：显示事件不来时兜底
    ev:HookScript("OnEvent", load)
end
-- 命令占位：先加载，再转给子插件的真处理函数（子插件加载时顶替这两个键）
ns.ExtraSlash = ns.ExtraSlash or {}
ns.ExtraSlash["上马饰品"] = function(rest, raw) if load(nil, nil, true) then return ns.ExtraSlash["上马饰品"](rest, raw) end end
ns.ExtraSlash.mounttrinket = ns.ExtraSlash["上马饰品"]

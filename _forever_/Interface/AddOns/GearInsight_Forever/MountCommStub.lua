-- 11-24 瘟疫之地自动戴银色黎明委任徽章的内核桩（HOLD，和 _Mount 的 MountCommission.lua 一起解除；HOLD = 这个文件不进包 = 什么都不做）
--   ① 设置 → 通用「上马自动换胡萝卜」组里加总开关（常驻可搜；子项在子插件 MountCommission.lua 加载时追加）
--   ② 换区 / 进世界时「开关开着 + 50 级以上 + 背包有黎明饰品（12846 委任徽章 / 13209 黎明之印 / 19812 黎明符文）+ 在西 / 东瘟疫之地（1422 / 1423）
--      或斯坦索姆 / 通灵学院（副本 329 / 289）」才加载 _Mount（子地图圣光之愿 / 冰风岗给的还是 1422 / 1423；洞穴图子插件里再往上找）
--   ⛔ 内核每个函数约 0.3 KB：不建框体（借 BagStub.lua 的 ns._BagStubEv）、取值 / 设值共用一个函数；排在 MountStub.lua 后面（用它的设置组）
local _, ns = ...
local ev, g = ns._BagStubEv, ns.SettingsGroup and ns.SettingsGroup("mounttrinket")
if not (ev and g) then return end
local function f(v)   -- 不带参数 = 取值；带 true / false = 设值（ns.db.mtComm：false = 关，nil = 默认开；子插件同一个键）
    if v == nil then return ns.db.mtComm ~= false end
    ns.db.mtComm = false
    if v then ns.db.mtComm = nil end
    local MT = ns.MountTrinket
    if MT then MT.wait = true; pcall(MT.Sync) end
end
g.items[#g.items + 1] = { type = "check", id = "mounttrinket.ad", group = g, get = f, set = f, keys = "黎明之印 黎明符文 commission scourgestone",
    text = ns.L("瘟疫之地自动戴银色黎明委任徽章（天灾石）", "Auto-equip Argent Dawn Commission in the Plaguelands (Scourgestones)") }
ev:RegisterEvent("ZONE_CHANGED_NEW_AREA")
ev:RegisterEvent("PLAYER_ENTERING_WORLD")
local n = C_Item and C_Item.GetItemCount or GetItemCount   -- 11-25 《无限》客户端没有全局 GetItemCount（报 nil，徽章从没自动戴过）→ 新接口优先
ev:HookScript("OnEvent", function(_, e)
    if (e == "ZONE_CHANGED_NEW_AREA" or e == "PLAYER_ENTERING_WORLD") and ns.MountTrinket == nil and ns.db and f() and UnitLevel("player") > 49
        and n and (n(12846) or 0) + (n(13209) or 0) + (n(19812) or 0) > 0 then
        local i, m = select(8, GetInstanceInfo()), C_Map and C_Map.GetBestMapForUnit("player")
        if i == 329 or i == 289 or m == 1422 or m == 1423 then ns.MountTrinket = false; pcall((C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn, "GearInsight_Forever_Mount") end
    end
end)

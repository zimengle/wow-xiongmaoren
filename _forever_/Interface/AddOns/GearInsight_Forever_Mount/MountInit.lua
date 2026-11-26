-- GearInsight_Forever_Mount 的最后一个文件：上马换装都加载完了，告诉主插件「可以用了」（ModStub.lua 的 ns.ModLoad 认这个标记）
-- 网易DD 包把这个子插件并进主文件夹（登录加载）时同样把标记置上（那时没有子插件文件夹）
local _, ns = ...; ns = _G.GearInsightForever or ns
ns._modReady = ns._modReady or {}
ns._modReady.mount = true
if ns.db and ns.MountTrinket then pcall(ns.MountTrinket.Sync) end   -- 按现在骑没骑着补做一次（内核触发桩只管加载）

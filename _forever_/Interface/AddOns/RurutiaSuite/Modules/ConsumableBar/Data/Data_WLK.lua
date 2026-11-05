-- 文件职责：预留 WLK Classic 消耗品动作条数据文件。
-- 负责：未来维护 WLK 数据；当前不注册数据集，避免错误回退到其他版本。

local _, ns = ...

-- Do not retain another client's catalogue factory and its constants.
if ns.Build and ns.Build.GetID and ns.Build.GetID() ~= "classic-wrath-legacy" then return end

local H = ns.ConsumableBarDataHelpers
local DATASETS = ns.ConsumableBarDataSets
local LOADERS = ns.ConsumableBarDataLoaders
if not (H and DATASETS and LOADERS) then return end

-- Intentionally empty. No WLK consumable bar data has been authored yet.
LOADERS[H.EXP_WLK] = function() return nil end

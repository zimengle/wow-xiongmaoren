-- 文件职责：定义 Retail 当前内容版本的纹章顺序、显示分级、默认差异和有界布局常量。
-- 不负责：读取 C_CurrencyInfo、解析 WorldMapFrame、创建 Frame 或注册事件。

local _, ns = ...

if ns.Build and ns.Build.HasModule and not ns.Build.HasModule("CurrencyBar") then return end

local DEFAULT_ENABLED = {
    [3446] = true,
    [3445] = true,
    [3444] = true,
    [3443] = true,
    [3442] = false,
}

ns.CurrencyBarData = {
    content = {
        client = "retail",
        interface = "12.1",
        season = 2,
        label = "至暗之夜第 2 赛季",
        verifiedAt = "2026-08-18",
    },
    defaultMaxLevel = 90,
    maxEntries = 5,
    currencies = {
        { currencyID = 3446, label = "神话", displayTier = 5 },
        { currencyID = 3445, label = "英雄", displayTier = 4 },
        { currencyID = 3444, label = "勇士", displayTier = 3 },
        { currencyID = 3443, label = "老兵", displayTier = 2 },
        { currencyID = 3442, label = "冒险者", displayTier = 1 },
    },
    defaultEnabledCurrencies = DEFAULT_ENABLED,
    displayTierColors = {
        [1] = { 0.62, 0.62, 0.62, 1 },
        [2] = { 0.12, 1.00, 0.12, 1 },
        [3] = { 0.00, 0.70, 1.00, 1 },
        [4] = { 0.64, 0.21, 0.93, 1 },
        [5] = { 1.00, 0.50, 0.00, 1 },
    },
    defaults = {
        enabled = true,
        attachment = "worldMap",
        alignment = "RIGHT",
        scale = 1,
    },
    layout = {
        height = 28,
        backgroundHeight = 20,
        padding = 5,
        iconSize = 18,
        iconCrop = 0.07,
        iconTextPadding = 1,
        nameQuantityPadding = 1,
        groupGap = 3,
        fontSize = 14,
        minScale = 0.75,
        maxScale = 1.50,
        defaultScale = 1,
        defaultOffsets = {
            RIGHT = { x = -32.3, y = -4.3 },
            LEFT = { x = 145, y = 6 },
        },
        anchorKeys = {
            RIGHT = "worldMapBottomRight",
            LEFT = "worldMapBottomLeft",
        },
    },
}

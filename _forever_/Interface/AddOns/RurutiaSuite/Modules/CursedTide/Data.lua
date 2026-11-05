-- 文件职责：定义诅咒狂潮已审计的地图/POI 白名单、差异默认与有界布局。
-- 不负责：固定 eventID、推测时刻表、NPC/航点坐标、读取 C_EventScheduler 或创建 Frame。

local _, ns = ...

if ns.Build and ns.Build.HasModule and not ns.Build.HasModule("CursedTide") then return end

local ACTIVITIES = {
    [8936] = { areaPoiID = 8936, name = "逼近的诱变者" },
    [8940] = { areaPoiID = 8940, name = "畸形的海兽" },
    [8939] = { areaPoiID = 8939, name = "姆噜咕尔大屠杀" },
    [8938] = { areaPoiID = 8938, name = "巢母之穴" },
    [8937] = { areaPoiID = 8937, name = "低语沼泽之围" },
}

ns.CursedTideData = {
    content = {
        key = "retail-12.1-cursed-tide",
        client = "retail",
        interface = "12.1",
        mapID = 2512,
        mapName = "盘卷蛇岛",
        verifiedAt = "2026-08-18",
        verifiedInputs = { "UiMap:2512", "AreaPOI:8936-8940" },
        pendingInputs = { "eventID", "schedule", "npcID", "waypointLiveValidation" },
        waypointSource = "retail:11a66cd83ae782359facdda91581d165c4dadc07:RurutiaSuite/Modules/CursedTide/Core.lua",
    },
    activitiesByPoi = ACTIVITIES,
    orderedPoiIDs = { 8936, 8940, 8939, 8938, 8937 },
    maxEntries = 10,
    maxFollowingRows = 4,
    activeFreshSeconds = 150,
    updateInterval = 1,
    defaults = {
        enabled = true,
        scale = 1,
        collapsed = true,
    },
    layout = {
        width = 247,
        cardWidth = 195,
        padding = 10,
        headerHeight = 44,
        rowHeight = 25,
        primaryRowHeight = 35,
        progressHeight = 4,
        minScale = 0.75,
        maxScale = 1.50,
        defaultPosition = { x = -6.8, y = 47 },
        positionAnchor = "worldMapTopLeft",
    },
}

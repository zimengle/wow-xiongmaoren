local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("RaidMarker")) then return end

local RAID_ICON_BASE = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_"

local Data = {
    markers = {
        { id = 1, icon = RAID_ICON_BASE .. "1", worldId = 5, textColor = "FFE400" },
        { id = 2, icon = RAID_ICON_BASE .. "2", worldId = 6, textColor = "FF7D0A" },
        { id = 3, icon = RAID_ICON_BASE .. "3", worldId = 3, textColor = "BE20F2" },
        { id = 4, icon = RAID_ICON_BASE .. "4", worldId = 2, textColor = "00FF00" },
        { id = 5, icon = RAID_ICON_BASE .. "5", worldId = 7, textColor = "DFEDF4" },
        { id = 6, icon = RAID_ICON_BASE .. "6", worldId = 1, textColor = "4C99FF" },
        { id = 7, icon = RAID_ICON_BASE .. "7", worldId = 4, textColor = "E53F38" },
        { id = 8, icon = RAID_ICON_BASE .. "8", worldId = 8, textColor = "FFFFFF" },
    },
    sideButtons = {
        {
            key = "pull",
            text = "倒数",
            side = "LEFT",
            order = 2,
        },
        {
            key = "reset",
            text = "重置",
            side = "LEFT",
            order = 1,
            macro1 = "/run ResetInstances()\n/p 副本已重置\n/ra 副本已重置",
        },
        {
            key = "clear",
            text = "清除",
            side = "RIGHT",
            order = 1,
        },
        {
            key = "ready",
            text = "就位",
            side = "RIGHT",
            order = 2,
            macro1 = "/readycheck",
            macro2 = "/run InitiateRolePoll()",
        },
    },
    position = {
        point = "TOP",
        relativePoint = "TOP",
        x = 0,
        y = -27,
    },
    defaults = {
        enabled = true,
        sideButtonsEnabled = true,
        alphaWithTarget = 0.9,
        alphaNoTarget = 0.3,
        markerSize = 22,
        sideButtonFontSize = 16,
        sideButtonXOffset = 5,
        sideButtonGap = 5,
        spacing = 2,
        disableWhenSimilarAddon = false,
        hideInPetBattle = true,
        hideWhenSolo = false,
        pullCountdown = 10,
        reverseOrder = false,
    },
    barLayout = {
        sideButtonWidth = 30,
        sideButtonHeight = 25,
        frameStrata = "MEDIUM",
        frameLevel = 0,
        moveOverlayInset = 5,
        moveOverlayFrameOffset = 50,
        sideButtonFontSize = 16,
    },
    settingsLayout = {
        pageId = "raidMarker",
        title = "标记栏",
        navigationOrder = 10,
        rowColumns = 2,
        controlHeight = 28,
    },
}

ns.RaidMarkerData = Data

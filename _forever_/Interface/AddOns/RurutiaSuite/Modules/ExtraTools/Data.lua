local _, ns = ...

local Data = {}

Data.APPLY_DELAY = 0.1
Data.RETAIL_DELAY = 0.2
Data.CELESTIAL_RETRY_DELAYS = { 0.05, 0.15, 0.35, 0.7 }
Data.MINIMAP_VOLUME_RETRY_DELAYS = { 0.05, 0.15, 0.35, 0.7 }

Data.CELESTIAL = {
    defaultX = 0,
    defaultY = -100,
    defaultWidth = 200,
    defaultHeight = 20,
    defaultFontSize = 15,
    minWidth = 120,
    maxWidth = 600,
    minHeight = 12,
    maxHeight = 48,
    minFontSize = 8,
    maxFontSize = 32,
}

Data.LFG = {
    defaultX = -55,
    defaultY = -185,
    nduiX = -81,
    nduiY = -175,
    elvuiX = -55,
    elvuiY = -185,
    defaultScale = 1,
    defaultAlpha = 1,
    buttonWidth = 38,
    buttonHeight = 18,
    buttonSpacing = 4,
    buttonFontSize = 15,
    buttonHoverFontSize = 16,
    buttons = {
        {
            key = "leave",
            label = "退队",
            color = { 0, 1, 0 },
            tooltip = "离开副本队伍",
            macro = "/run RurutiaSuite.LFGTools:RunLFGAction('leave')",
        },
        {
            key = "teleport",
            label = "传送",
            color = { 0, 1, 1 },
            tooltip = "传送出/进随机本",
            macro = "/run RurutiaSuite.LFGTools:RunLFGAction('teleport')",
        },
    },
}

-- Retail 旧版的 16:9 编辑模式布局字符串属于产品数据，不由 Build Adapter 生成。
Data.RETAIL_LAYOUT = "2 50 0 0 0 7 7 UIParent 0.0 2.0 -1 ##$$%/&%'%)$+$,$ 0 1 0 6 0 MainActionBar 0.0 4.0 -1 ##$$%/&%'%(#,$ 0 2 0 8 2 MultiBarBottomLeft 0.0 4.0 -1 ##$$%/&%'%(#,$ 0 3 0 5 5 UIParent 0.0 142.3 -1 #$$$%/&%'%(#,# 0 4 0 8 6 MultiBarRight -4.0 0.0 -1 #$$$%/&%'%(#,# 0 5 0 7 7 UIParent 320.0 2.0 -1 ##$%%/&%'%(#,# 0 6 0 0 6 PlayerFrame 20.0 14.0 -1 ##$%%/&%'%(#,# 0 7 0 1 1 UIParent -923.3 -562.0 -1 ##$'%/&$'%(#,# 0 10 0 6 0 MultiBarBottomRight 0.0 4.0 -1 ##$$&''% 0 11 0 7 7 UIParent -285.2 2.0 -1 ##$%&&'%,# 0 12 0 0 0 UIParent 675.6 -1066.4 -1 ##$$&('% 1 -1 0 4 4 UIParent 0.0 -394.0 -1 ##$#%$ 2 -1 0 1 1 UIParent 904.5 -2.0 -1 ##$#%( 3 0 0 0 0 UIParent 653.0 -695.0 -1 $#3# 3 1 0 0 0 UIParent 1163.0 -697.0 -1 %#3# 3 2 0 0 6 MultiBar6 -15.5 8.5 -1 %#&#3# 3 3 0 0 0 UIParent 1426.0 -378.0 -1 '$(#)#-k.=/#1#3#5$6.7-7$8( 3 4 0 0 0 UIParent 1426.0 -378.0 -1 ,$-=.1/#0#1#2(5#6(7-7$8( 3 5 0 2 2 UIParent -1442.0 -370.0 -1 &#*$3# 3 6 0 2 2 UIParent -1441.3 -369.5 -1 -S.-/#4$5#6(7-7$8( 3 7 0 0 6 FocusFrame 11.5 13.0 -1 3# 4 -1 0 4 4 UIParent 0.0 -340.0 -1 # 5 -1 0 1 1 UIParent 247.0 -458.0 -1 # 6 0 0 2 0 MinimapCluster 11.0 0.0 -1 ##$#%#&.(()( 6 1 0 2 8 BuffFrame -15.0 -4.0 -1 ##$#%#')(*))-$ 6 2 1 1 1 UIParent 0.0 -25.0 -1 ##$#%$&.(()(+#,-,$ 7 -1 0 1 1 UIParent -593.0 -178.0 -1 # 8 -1 0 6 6 UIParent 0.0 30.0 -1 #&$i%%&8 9 -1 0 1 1 UIParent -440.0 -858.0 -1 # 10 -1 1 0 0 UIParent 16.0 -116.0 -1 # 11 -1 0 5 5 UIParent -12.5 -87.2 -1 # 12 -1 0 4 4 UIParent 775.0 134.8 -1 ##$#%# 13 -1 0 1 1 UIParent 0.0 -2.0 -1 ##$#%#&& 14 -1 0 0 0 UIParent 1891.2 -1116.6 -1 ##$#%# 15 0 0 5 5 UIParent -746.0 533.8 -1 &- 15 1 0 0 6 MainStatusTrackingBarContainer 0.0 -4.0 -1 &- 16 -1 0 3 3 UIParent 506.0 457.1 -1 #( 17 -1 1 1 1 UIParent 0.0 -100.0 -1 ## 18 -1 0 1 1 UIParent -450.2 -29.4 -1 #) 19 -1 1 7 7 UIParent 0.0 0.0 -1 ## 20 0 0 1 7 UIParent 0.0 393.6 -1 ##$+%$&&'&(-($)#+$,$-# 20 1 0 4 4 UIParent 0.0 -280.0 -1 ##$,%$&*'&(-($)#+$,$-# 20 2 0 4 4 UIParent 0.0 -100.0 -1 ##$$%$&('((-($)#+$,$-$ 20 3 0 7 7 UIParent -180.5 469.1 -1 #$$$%#&)'#(-($)#*$+$,$-#.# 21 -1 0 1 1 UIParent 2.0 -878.0 -1 #$$$ 22 0 0 1 1 UIParent 320.0 -30.0 -1 #$$$%#&-'%(#)U*$+$,$-#.#/U0% 22 1 0 4 4 UIParent 0.0 80.0 -1 &('))U*#+$ 22 2 0 8 2 CriticalEncounterWarnings -0.2 4.6 -1 &('*)U*#+$ 22 3 0 1 1 UIParent 0.0 -350.8 -1 &-'))U*#+$ 23 -1 0 8 8 UIParent 0.0 57.2 -1 ##$#%$&#'C(#)U+$,$-$.(/#"

local function Copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    local key
    local child
    for key, child in pairs(value) do result[key] = Copy(child) end
    return result
end

function Data.SafeRound(value, fallback)
    value = tonumber(value) or fallback or 0
    return math.floor(value + 0.5)
end

function Data.ClampNumber(value, minimum, maximum, fallback)
    value = Data.SafeRound(value, fallback)
    if value < minimum then return minimum end
    if value > maximum then return maximum end
    return value
end

function Data.CreateDefaults(family)
    if family == "retail" then
        return {
            profile = {
                enabled = true,
                autoSellJunk = true,
                enableLeftHint = true,
                enableImportCopyButton = true,
                detailsNumberFix = false,
                bwHideDungeonNames = true,
                hideAddonCompartment = true,
                tinyInspectYellowSpamFix = true,
                tinyInspectPartyItemLevelWanted = true,
                tinyInspectRaidItemLevelWanted = false,
                ellesmereMinimapVolume = true,
                ellesmereTimerCompact = true,
                blizzardUI = { hideMicroMenu = true, hideBackpackButton = false, unlockWindowDrag = true },
            },
        }
    end

    return {
        profile = {
            enabled = true,
            autoSellJunk = true,
            fastLoot = true,
            blizzardUI = { hideMicroMenu = true, unlockWindowDrag = true },
            celestialBar = {
                x = Data.CELESTIAL.defaultX,
                y = Data.CELESTIAL.defaultY,
                simpleMode = true,
                width = Data.CELESTIAL.defaultWidth,
                height = Data.CELESTIAL.defaultHeight,
                fontSize = Data.CELESTIAL.defaultFontSize,
            },
            lfgTools = {
                enabled = true,
                showLeaveButton = true,
                showTeleportButton = true,
                x = Data.LFG.defaultX,
                y = Data.LFG.defaultY,
                nduiX = Data.LFG.nduiX,
                nduiY = Data.LFG.nduiY,
                elvuiX = Data.LFG.elvuiX,
                elvuiY = Data.LFG.elvuiY,
                useNDuiPosition = true,
                useElvUIPosition = true,
                scale = Data.LFG.defaultScale,
                alpha = Data.LFG.defaultAlpha,
            },
            elvuiUpdateBlocker = { enabled = true, blockPopup = true, blockChat = true },
        },
    }
end

function Data.CopyDefaults(family)
    return Copy(Data.CreateDefaults(family))
end

ns.ExtraToolsData = Data
ns.ExtraToolsLayout = Data.RETAIL_LAYOUT

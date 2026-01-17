
--https://github.com/tomrus88/BlizzardInterfaceCode
local CChatFilter=LibStub("AceAddon-3.0"):NewAddon(BFF_ADDON_NAME, "AceConsole-3.0","AceTimer-3.0")
local cfgreg = LibStub("AceConfigRegistry-3.0")

--插件加载完成
function CChatFilter:OnInitialize()
    self:RegisterChatCommand("bff", "OnCommand")
    bfwf_configs_init()
    bfwf_minimap_button_init()
    bfwf_chat_filter_init()
end

----------------------------------------------------------------------------------------
--  Auto Join
----------------------------------------------------------------------------------------
local function SwapChannel()
    local id1 = GetChannelName("综合")
    if id1 ~= 1 and id1 ~= 0 then
        C_ChatInfo.SwapChatChannelsByChannelIndex(id1, 1)
    end

    local id2 = GetChannelName("交易")
    if id2 ~= 2 and id2 ~= 0 then
        C_ChatInfo.SwapChatChannelsByChannelIndex(id2, 2)
    end

    local id3 = GetChannelName("本地防务")
    if id3 ~= 3 and id3 ~= 0 then
        C_ChatInfo.SwapChatChannelsByChannelIndex(id3, 3)
    end

    local id4 = GetChannelName("世界防务")
    if id4 ~= 4 and id4 ~= 0 then
        C_ChatInfo.SwapChatChannelsByChannelIndex(id4, 4)
    end

    local id5 = GetChannelName("寻求组队")
    if id5 ~= 5 and id5 ~= 0 then
        C_ChatInfo.SwapChatChannelsByChannelIndex(id5, 5)
    end

    local id6 = GetChannelName("大脚世界频道")
    if id6 ~= 6 and id6 ~= 0 then
        C_ChatInfo.SwapChatChannelsByChannelIndex(id6, 6)
    end
end

local BF = CreateFrame("FRAME") 
BF:RegisterEvent("PLAYER_ENTERING_WORLD")
BF:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
BF:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        if BFWC_Filter_SavedConfigs.bigfoot == true then
			C_Timer.After(2, JoinBigfoot)
        end
        shortChannels()
    elseif event == "CHAT_MSG_CHANNEL_NOTICE" then
        C_Timer.After(1, SwapChannel)
    end
end)

--用户登录完成
function CChatFilter:OnEnable()

    if BFWC_Filter_SavedConfigs.use_class_color then
        SetCVar("chatClassColorOverride", "0")
    end

    if not bfwf_g_data.myid then
        bfwf_g_data.myid,_ = UnitGUID('player')
    end

    bfwf_player.level = UnitLevel('player')

    if not BFWC_Filter_SavedConfigs.player then
        BFWC_Filter_SavedConfigs.player = {}
    end
    if bfwf_g_data.myid and not BFWC_Filter_SavedConfigs.player[bfwf_g_data.myid] then
        BFWC_Filter_SavedConfigs.player[bfwf_g_data.myid] = {}
    end

    self:OnLevelUp()

    if BFWC_Filter_SavedConfigs.show_drag_handle then
        bfwf_show_drag_handle()
    end
end

function CChatFilter:OnDisable()
    if self.timer then
        self:CancelTimer(self.timer)
        self.timer = nil
    end
end

function CChatFilter:OnCommand(input)
    bfwf_toggle_config_dialog()
end

bfwf_update_dungeons_filter = function()
    if BFWC_Filter_SavedConfigs.auto_filter_by_level then
        local lv = bfwf_player.level
        for _,d in ipairs(bfwf_dungeons) do
            if lv>=d.lmin and lv<= d.lmax then
                BFWC_Filter_SavedConfigs.dungeons[d.name] = true
            else
                BFWC_Filter_SavedConfigs.dungeons[d.name] = false
            end
        end
    end
end
function CChatFilter:OnLevelUp()
    last_level = bfwf_player.level
    bfwf_update_dungeons_filter()
end
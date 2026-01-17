
BFF_ADDON_NAME = 'CChatFilter'
BFWC_Filter_SavedConfigs = {
}
BFWC_Filter_SavedConfigs_G = {}

bfwf_big_foot_world_channel_joined = false

bfwf_dungeons = {
    {name='地狱火城墙(59 ~ 67)',num=5,lmin=59,lmax=67,sel=true,keys={'cq','城墙'}},
    {name='鲜血熔炉(60 ~ 68)',num=5,lmin=60,lmax=68,sel=true,keys={'xx','鲜血','熔炉'}},
    {name='破碎大厅(69 ~ 70)',num=5,lmin=69,lmax=70,sel=true,keys={'破碎'}},
    {name='法力陵墓(63 ~ 70)',num=5,lmin=63,lmax=70,sel=true,keys={'fl','法力'}},
    {name='奥金尼地穴(64 ~ 70)',num=5,lmin=64,lmax=70,sel=true,keys={'dx','ajn','奥金尼','地穴'}},
    {name='塞泰克大厅(66 ~ 70)',num=5,lmin=66,lmax=70,sel=true,keys={'stk','塞泰克'}},
    {name='暗影迷宫(69 ~ 70)',num=5,lmin=69,lmax=70,sel=true,keys={'mg','迷宫'}},
    {name='奴隶围栏(61 ~ 69)',num=5,lmin=61,lmax=69,sel=true,keys={'wl','围栏'}},
    {name='幽暗沼泽(62 ~ 70)',num=5,lmin=62,lmax=70,sel=true,keys={'zz','幽暗','幽暗沼泽'}},
    {name='蒸汽地窟(69 ~ 70)',num=5,lmin=69,lmax=70,sel=true,keys={'zq','蒸汽'}},
    {name='旧希尔布莱德丘陵(66 ~ 70)',num=5,lmin=66,lmax=70,sel=true,keys={'9sr','丘陵'}},
    {name='黑色沼泽(68 ~ 70)',num=5,lmin=68,lmax=70,sel=true,keys={'18m'}},
    {name='禁魔监狱(69 ~ 70)',num=5,lmin=69,lmax=70,sel=true,keys={'jy','监狱'}},
    {name='生态船(69 ~ 70)',num=5,lmin=69,lmax=70,sel=true,keys={'生态'}},
    {name='能源舰(68 ~ 70)',num=5,lmin=68,lmax=70,sel=true,keys={'ny','能源'}},
    {name='魔导师平台(69 ~ 70)',num=5,lmin=69,lmax=70,sel=true,keys={'mds','平台','魔导'}},

    {name='卡拉赞(团)',num=10,lmin=70,lmax=70,sel=false,keys={'klz','卡拉赞'}},
    {name='祖阿曼(团)',num=10,lmin=70,lmax=70,sel=false,keys={'zam','祖阿曼'}},
    {name='马瑟里顿的巢穴(团)',num=25,lmin=70,lmax=70,sel=false,keys={'msld','马瑟里顿'}},
    {name='格鲁尔的巢穴(团)',num=25,lmin=70,lmax=70,sel=false,keys={'gle','glr','格鲁尔'}},
    {name='毒蛇神殿(团)',num=25,lmin=70,lmax=70,sel=false,keys={'ds','毒蛇'}},
    {name='风暴要塞(团)',num=25,lmin=70,lmax=70,sel=false,keys={'fb','风暴','要塞'}},
    {name='海加尔峰(团)',num=25,lmin=70,lmax=70,sel=false,keys={'hs','海山','海加尔'}},
    {name='黑暗神殿(团)',num=25,lmin=70,lmax=70,sel=false,keys={'bt','黑暗'}},
    {name='太阳之井高地(团)',num=25,lmin=70,lmax=70,sel=false,keys={'sw','太阳井','太阳'}},
}

bfwf_player = {}

bfwf_configs_init = function() end
bfwf_update_minimap_icon = function() end
bfwf_minimap_button_init = function() end
bfwf_chat_filter_init = function() end
bfwf_toggle_bf_filter = function() end
bfwf_split_str = function() end
bfwf_toggle_config_dialog = function() end
bfwf_update_dungeons_filter = function() end
bfwf_update_icon = function()
    bfwf_update_minimap_icon()
end

bfwf_chat_team_log = {}

bfwf_g_data = {
    level = 0,
}

--玩家职业颜色缓存
bfwf_player_color = {}

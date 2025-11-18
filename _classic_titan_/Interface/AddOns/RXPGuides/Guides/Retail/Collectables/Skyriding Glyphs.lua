-- ============================
-- ==========   DF ============
-- ============================

--SEPERATOR
RXPGuides.RegisterGuide([[
#retail
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name 0
#displayname |cFFFCDC00巨龙时代|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#disabled


]])

--Waking Shores
RXPGuides.RegisterGuide([[
#retail
#version 3
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name a) 苏醒海岸符文
#displayname |cFF00CCFF1|r - 觉醒海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next b) 奥纳汉平原符文

step
    #completewith WakingShoreDragonGlyphs
    +欢迎阅读龙纹指南
    *This will guide you through all the Dragon Glyphs.
step
    #title Dragon Glyph: Skytop Observatory Rostrum
    >>使用 |T4640498:0|t[天际升腾] 一次
    .goto 2022,75.26,57.07
    .achievement 16575,2 >>拾取龙纹:天顶观测台讲台
step
    #completewith next
    .goto 2022,75.01,55.57,10 >>如果已解锁渡船, 请使用它
step
    #title Dragon Glyph: Skytop Observatory Tower
    >>如果你尚未解锁渡船, 请使用 |T4640498:0|t[ Skyward Ascend ]三次|cRXP_WARN_|r
    .goto 2022,75.26,57.07
    .achievement 16575,1 >>拾取龙纹:塔顶上方的观景塔
step
    #completewith next
    +从天空观景塔:直接滑翔下来就够了
    *From somewhere else: Use |T4640498:0|t[Skyward Ascend] 1-3 times from the base of the tower
step
    #title Dragon Glyph: Dragonheart Outpost
    .line 2022,75.26,57.07,69.18,46.23
    .goto 2022,69.18,46.23
    .achievement 16575,10 >>在塔楼上方后方的龙之心前哨处拾取龙之符文
step
    #completewith next
    +从龙心前哨站出发:沿箭头指示滑翔
    *From somewhere else: Use |T4640498:0|t[Skyward Ascend] 1-3 times from the base of the tower
step
    #title Dragon Glyph: Wingrest Embassy
    >>|cRXP_WARN_仅在必要时使用 |T4640498:0|t[天际崛起]|r
    .line 2022,73.58,37.09,30,0
    .goto 2022,74.94,37.50
    .achievement 16575,5 >>拾取龙之符文:位于破塔顶端的翼歇大使馆
step
    #title Dragon Glyph: Scalecracker Peak
    >>|cRXP_WARN_用掉你已收集的所有符文, 然后等待直到至少拥有3个维加尔充能|r
    >>尽可能频繁地使用 |T4640498:0|t[升空之翼], 但每次施放之间务必等待几秒
    >>你可能需要偶尔补充体力(地图上标记了一些合适的位置)
    .line 2022,74.94,37.50,73.21,20.51
    .goto 2022,72.96,22.67,0
    .goto 2022,74.09,22.00,0
    .goto 2022,72.87,26.31,0
    .goto 2022,72.85,21.06,0
    .goto 2022,73.21,20.51
    .achievement 16575,11 >>在大山顶上的鳞裂峰处拾取龙纹
step
    #completewith next
    +从石裂峰出发:只需滑翔, 全速滑翔时尽量保持最高高度
    *From somewhere else: Just fly there, wait for at least 3 vigor charges and use |T4640498:0|t[Skyward Ascend] to reach the tower
step
    #title Dragon Glyph: Life-Binder Observatory
    >>仅在需要时使用 |T4640498:0|t[天际升腾]
    .line 2022,21.91,51.41,52.60,17.12
    .goto 2022,52.60,17.12
    .achievement 16575,8 >>拾取龙符文:生命缚者观测站位于塔之上
step
    #completewith next
    +来自生命缚誓者天文台:只需滑翔, 全速滑翔时尽量保持最高高度
    *From somewhere else: Fly to the Obsidian Throne, wait form 4 vigor charges and use |T4640498:0|t[Skyward Ascend] to reach the tower
step
    #title Dragon Glyph: Obisidan Throne
    >>仅在需要飞上山时使用 |T4640498:0|t[天际升腾]
    >>你可能需要在途中休息一段时间等待精力恢复(地图上标记了一些合适的位置)
    .line 2022,73.21,20.51,21.91,51.41
    .goto 2022,26.42,53.52,0
    .goto 2022,27.52,48.74,0
    .goto 2022,30.02,47.88,0
    .goto 2022,21.91,51.41
    .achievement 16575,12 >>在山顶熔岩池上方的黑曜石王座处拾取龙文符:奥比萨登
step
    #completewith next
    +来自奥比西达王座:全速滑翔时尽量保持最高高度, 应该无需消耗任何精力
    *From somwhere else: Fly to the Obsidian Bulwark. Use |T4640498:0|t[Skyward Ascend] 1-3 times to reach the glyph
step
    #title Dragon Glyph: Obsidian Bulwark
    .line 2022,21.91,51.41,40.98,71.91
    .goto 2022,40.98,71.91
    .achievement 16575,6 >>在细长山峰顶端拾取龙纹:黑曜石壁垒
step
    #completewith next
    +来自黑曜石壁垒:使用 |T4640498:0|t[升空] 2-4次
    *From somewhere else: Fly to the Obsidian Bulwark and spam |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: The Overflowing Spring
    .line 2022,40.98,71.91,46.39,52.07
    .goto 2022,46.39,52.07
    .achievement 16575,7 >>拾取龙纹:山顶的涌泉
step
    #completewith next
    +来自涌泉:只需滑行至符文
    *From somewhere else: An easy way is to get to Ruby Life Pools and fly directly to the glyph
step
    #title Dragon Glyph: Crumbling Life Archway
    >>没必要使用任何精力值
    .line 2022,46.39,52.07,57.65,54.83
    .goto 2022,57.65,54.83
    .achievement 16575,9 >>拾取龙纹:在其中一个拱门下找到崩塌生命拱门
step
    #completewith next
    +来自摇摇欲坠的生命拱门:使用三次 |T4640498:0|t[Skyward Ascend] 应该足够了, 但如有需要可使用更多
    *From somewhere else: The easiest way is to get to Ruby Life Pools and fly up to the glyph
step
    #title Dragon Glyph: Ruby Life Pools Peaks
    .line 2022,57.65,54.83,54.43,74.22
    .goto 2022,54.43,74.22
    .achievement 16575,4 >>拾取龙符文:红宝石生命池位于大山之上的峰顶
step
    #completewith next
    +来自红宝石生命池峰:你无需使用任何活力充能
    *From somewhere else: An easy way is to get to Ruby Life Pools and fly directly to the glyph
step
    #title Dragon Glyph: Flashfrost Enclave
    >>|cRXP_WARN_用掉你已收集的所有符文, 然后等待至少获得3个维加尔充能|r
    .line 2022,54.43,74.22,58.09,78.58
    .goto 2022,58.09,78.58
    .achievement 16575,3 >>拾取龙符:Flashfrost飞地(位于据点入口上方)
step
    #completewith next
    +来自闪冻飞地:等待直至你至少拥有3个活力充能. 尽量保留至少一个活力充能
    *From somewhere else: The easiest way is to fly from Valdrakken
step
    #label WakingShoreDragonGlyphs
    #title Dragon Glyph: Rubyscale Outpost
    >>|cRXP_WARN_消耗掉你已收集的所有符文|r
    >>|T4640498:0|t[Skyward Ascend] 使用三次应该就足够了, 但如果需要, 可以多用几次
    .line 2022,58.09,78.58,48.82,86.64
    .goto 2022,51.01,82.30,45,0
    .goto 2022,48.82,86.64
    .achievement 16576,11 >>拾取龙纹符文:位于地面以上几码处的鲁布斯凯尔前哨
]])

--Ohn'ahran Plains
RXPGuides.RegisterGuide([[
#retail
#version 3
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name b) 奥纳汉平原符文
#displayname |cFF00CCFF2|r - 欧恩哈拉平原 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next c) 蓝色跨度符文

step
    #title Dragon Glyph: Mirewood Fen
    >>使用 |T4640498:0|t[天际升腾] 一次或两次
    .goto 2023,78.31,21.31
    .achievement 16576,12 >>在泥林沼泽地面上方几码处拾取龙文刻符
step
    #completewith next
    +来自米尔伍德沼泽:等待积攒3层活力. 尽可能频繁地使用|T4640498:0|t[天空升腾], 但每次施放之间务必间隔几秒钟
    +从其他地方:一个简单的方法是从瓦德拉肯飞过去
step
    #title Dragon Glyph: Rusza'thar Reach
    .line 2023,78.31,21.31,86.51,39.40
    .goto 2023,86.51,39.40
    .achievement 16576,9 >>拾取龙文:在鲁萨塔尔通道塔楼上方
step
    #completewith next
    +从鲁萨塔尔高地出发:全速滑翔时尽量保持高 altitude, 途中应能恢复至少 2 点活力. 抵达山脚后, 根据需要频繁使用 |T4640498:0|t[飞升天际] 以抵达山顶
    *From somewhere else: Fly to Maruukai, wait for 4 vigor charges and use |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: Ohn'ahran's Roost
    .line 2023,86.51,39.40,57.97,31.11
    .goto 2023,57.97,31.11
    .achievement 16576,1 >>在山顶雕像上方的奥纳兰栖息地拾取龙之铭文:奥纳兰的巢穴
step
    #completewith next
    +从奥纳兰的栖息地出发:全速滑翔时尽量保持最高高度, 途中可恢复全部耐力. 使用 |T4640498:0|t[天空升腾] 2-3次即可抵达顶部
    *From somewhere else: Get to the bottom of the mountain, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you're at the top
step
    #title Dragon Glyph: Nokhud Hold
    .line 2023,57.97,31.11,30.71,35.57
    .goto 2023,30.71,35.57
    .achievement 16576,2 >>拾取龙纹符文:诺库德据点, 位于山顶
step
    #completewith next
    +从诺克胡德据点出发:全速滑翔时尽量保持最高高度, 途中应能恢复全部精力
    *From somewhere else: Fly to the Shady Sanctuary. Wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you're at the top.
step
    #title Dragon Glyph: Emerald Gardens
    .line 2023,30.71,35.57,30.12,61.35
    .goto 2023,30.12,61.35
    .achievement 16576,3 >>拾取龙纹:翡翠花园, 位于阴暗庇护所之上
step
    #completewith next
    +来自翡翠花园:根据需要频繁使用 |T4640498:0|t[飞升天际]
    *From somewhere else: Get to the bottom of the mountain, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: The Eternal Kurgans
    >>|cRXP_WARN_ 使用掉你所有的符文印记|r
    .line 2023,30.12,61.35,29.44,75.72
    .goto 2023,29.44,75.72
    .achievement 16576,4 >>拾取龙纹:空中的永恒库尔干
step
    #completewith next
    +来自永恒库尔干:等待拥有3个活力充能后使用. 全速滑翔时尽量保持高空飞行. 仅在必要时使用 |T4640498:0|t[升空直上]
    *From somewhere else: Fly to Teerakai, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: Szar Skeleth
    .line 2023,29.44,75.72,44.61,64.57
    .goto 2023,44.61,64.57
    .achievement 16576,5 >>在塔顶拾取龙符:萨尔·斯克雷瑟
step
    #completewith next
    +来自萨尔·斯凯莱斯:如果活力值低于3点, 请等待恢复至3点. 使用 |T4640498:0|t[飞升天际] 2-3次以抵达符文位置
    *From somewhere else: Fly to Teerakai, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: Mirror of the Sky
    .line 2023,44.61,64.57,46.97,72.84
    .goto 2023,46.97,72.84
    .achievement 16576,6 >>在山上的空中拾取龙纹:天空之镜
step
    #completewith next
    +来自天空之镜:使用 2-3 次 |T4640498:0|t[朝天而升] 应足以抵达符文位置
    +从其他地方:飞往欧尼瑞喷泉, 等待2个活力充能后, 持续施放 |T4640498:0|t[天空升腾] 直到抵达符文位置
step
    #title Dragon Glyph: Ohn'iri Springs
    .line 2023,46.97,72.84,57.08,80.47
    .goto 2023,57.08,80.47
    .achievement 16576,7 >>在奥尼瑞斯泉上方的空中拾取龙文:奥尼瑞斯泉
step
    #completewith next
    +从 Ohn'iri Springs 出发:全速滑翔时尽量保持最高高度, 使用 |T4640498:0|t[飞升天际] 1-2 次以抵达符文位置
    *From somewhere else: Get to the Windsong Rise area, wait for 2-3 vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: Windsong Rise
    .line 2023,57.08,80.47,61.48,64.36
    .goto 2023,61.48,64.36
    .achievement 16576,10 >>拾取龙纹:风歌之升在空中
step
    #completewith next
    +来自风歌高地:滑翔时尽量保持最高高度并全速前进, 途中应能恢复大部分精力. 使用|T4640498:0|t[天空上升]技能2-3次通常足够, 必要时可多用几次
    *From somewhere else: Fly to the Cobalt Assembly, wait for 1-2 vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: Dragonsprings Summit
    .line 2023,61.48,64.36,84.57,77.79
    .goto 2023,84.57,77.79
    .achievement 16576,8 >>在小海上方的龙泉峰顶拾取龙之符文
]])

--Azure Span
RXPGuides.RegisterGuide([[
#retail
#version 3
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name c) 蓝色跨度符文
#displayname |cFF00CCFF3|r - 碧蓝林海 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next d) 塔尔德拉斯符文

step
    #title Dragon Glyph: Forkriver Crossing
    >>使用 |T4640498:0|t[天际升腾] 一次或两次
    .goto 2023,36.58,27.96
    .achievement 16577,11 >>在叉河渡口上方几码处拾取龙符文
step
    #completewith next
    +从 Forkriver 渡口出发:尽量减少使用活力充能次数
    *From somewhere else: Fly to the Cobalt Assembly and use |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: The Fallen Course
    .line 2024,36.58,27.96,56.81,16.12
    .goto 2024,56.81,16.12
    .achievement 16577,12 >>在地面以上几码处拾取龙纹:堕落之路
step
    #completewith next
    +来自堕落之路:全速滑翔时尽量保持最高高度, 途中可恢复1-2点耐力. 使用 |T4640498:0|t[飞升] 2-3次, 以维持足够高度
    *From somewhere else: Get to the bottom of the mountain, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you're at the top. It's possible that you have to recharge your vigor on the way up
step
    #title Dragon Glyph: Rhonin's Shield
    >>|cRXP_WARN_ 使用掉你所有的符文印记|r
    .line 2024,56.81,16.12,67.64,29.13
    .goto 2024,67.64,29.13
    .achievement 16577,9 >>在塔顶拾取龙纹符文:罗宁之盾
step
    .isQuestTurnedIn 70220
    #completewith next
    .goto 2024,71.97,35.37,15 >>飞入“岛屿之风”
step
    #title Dragon Glyph: Vakthros Range
    >>使用 |T4640498:0|t[天际升腾] 2-3次以抵达符文
    .line 2024,67.64,29.13,72.62,39.78
    .goto 2024,72.62,39.78
    .achievement 16577,10 >>拾取龙纹:冰冻海面上的瓦克索斯山脉
step
    #completewith next
    +从瓦克特罗斯山脉出发:尝试向下瞄准并全速飞行, 途中应该能恢复你的精力
    *From somewhere else: Follow the way to the glyph from Rhonin's Shield or Camp Nowhere and use |T4640498:0|t[Skyward Ascend] to reach the glyph. You may have to recharge your vigor occasionally
step
    #title Dragon Glyph: Lost Ruins
    .line 2024,72.62,39.78,70.58,46.26
    .goto 2024,70.58,46.26
    .achievement 16577,4 >>在塔顶拾取龙纹:失落遗迹
step
    #completewith next
    +来自失落遗迹:全速滑翔时尽量保持最高高度, 只有在真正需要时才使用 |T4640498:0|t[天空上升]
    *From somewhere else: Fly to Camp Nowhere and use |T4640498:0|t[Skyward Ascend] from the bottom of the tower to reach the glyph
step
    #title Dragon Glyph: Ruins of Karnthar
    .line 2024,70.58,46.26,68.64,60.26
    .goto 2024,68.64,60.26
    .achievement 16577,3 >>在破墙后方塔顶拾取龙文:卡恩萨废墟
step
    #completewith next
    +从卡恩萨废墟出发:尝试向下瞄准并全速飞行, 途中应能恢复精力
    *From somewhere else: Fly to Camp Nowhere, use |T4640498:0|t[Skyward Ascend] one time and fly down to the glyph
step
    #title Dragon Glyph: Imbu
    .line 2024,68.64,60.26,60.58,70.25
    .goto 2024,60.58,70.25
    .achievement 16577,7 >>拾取龙符文:在瀑布旁边的空中进行 imbuing. 你需要稍微向下瞄准一些
step
    #completewith next
    +来自 Imbu:使用 |T4640498:0|t[飞升] 技能前往符文位置. 使用该技能时, 请略微抬高瞄准角度
    *From somewhere else: Fly to Camp Nowhere, follow the way to the waypoint and spam |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: Zelthrak Outpost
    .line 2024,60.58,70.25,52.95,49.09
    .goto 2024,52.95,49.09
    .achievement 16577,8 >>拾取龙纹符文:泽尔特拉克前哨站, 位于大树半山腰处
step
    #completewith TheAzureSpanDragonGlyphAzureArchives
    +从任意位置:飞往碧蓝档案馆并按照后续步骤进行
step
    .isQuestTurnedIn 65852
    #completewith TheAzureSpanDragonGlyphAzureArchives
    .goto 2024,39.57,60.25,5 >>使用额外动作按钮
step
    .isQuestAvailable 65852
    #completewith TheAzureSpanDragonGlyphAzureArchives
    +|cRXP_WARN_在塔底等待, 直到你的精力恢复|r
    *Use |T4640498:0|t[Skyward Ascend] four times. You can let your vigor charges recharge on a lower plataeu if necessary
    .goto 2024,40.63,59.45,30,0
step
    #label TheAzureSpanDragonGlyphAzureArchives
    #title Dragon Glyph: Azure Archives
    >>当你到达塔顶时, 只需使用 |T4640498:0|t[飞升天际] 一次, 即可飞越符文
    .line 2024,52.95,49.09,40.63,59.45,39.30,63.12
    .goto 2024,39.30,63.12
    .achievement 16577,2 >>拾取龙纹符文:在奥术塔上方的空中, 蔚蓝档案库
step
    #completewith next
    +来自Azure档案:全速滑翔时尽量保持最高高度, 这样能恢复大部分耐力. 如果可能, 仅使用一次|T4640498:0|t[天空上升]
    *From somewhere else: Fly to the Three-Falls Lookout and then glide down to the glyph
step
    #title Dragon Glyph: Brackenhide Hollow
    .line 2024,39.30,63.12,10.40,35.89
    .goto 2024,10.40,35.89
    .achievement 16577,5 >>在空中拾取龙纹:蕨皮洞
step
    #completewith next
    +来自布雷肯海德洞穴:全速滑翔时尽量保持最高高度, 这样可以恢复大部分耐力. 使用 |T4640498:0|t[凌空上升] 3-5次, 施放技能时略微抬高瞄准角度
    *From somewhere else: Fly to the Three-Falls Lookout and then use |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: Creektooth Den
    .line 2024,10.40,35.89,26.74,31.67
    .goto 2024,26.74,31.67
    .achievement 16577,6 >>拾取龙符:溪齿巢穴位于树顶
step
    #completewith next
    +来自溪齿巢穴:在塔底等待, 直至所有维加尔充能恢复. 尽可能频繁地使用|T4640498:0|t[天空升腾], 但每次施法之间务必间隔2秒
    *From somewhere else: Fly to the Cobalt Assembly and use all your vigor charges to reach the glyph
step
    #title Dragon Glyph: Cobalt Assembly
    >>|cRXP_WARN_ 使用掉你所有的符文印记|r
    .line 2024,26.74,31.67,45.83,25.73
    .goto 2024,45.83,25.73
    .achievement 16577,1 >>拾取龙纹符:塔上方的钴合金组件
]])

--Thaldraszus
RXPGuides.RegisterGuide([[
#retail
#version 3
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name d) 塔尔德拉斯符文
#displayname |cFF00CCFF4|r - 索德拉苏斯 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next e) 禁忌之地符文

step
    #title Dragon Glyph: South Hold Gate
    >>使用|T4640498:0|t[天际升腾] 2-3次以抵达符文
    .goto 2025,35.5,85.5
    .achievement 16578,3 >>在塔顶的南要塞大门处拾取龙符文
step
    #completewith next
    +从任意位置:尽可能多地使用|T4640498:0|t[飞升天际]登上山顶. 你可能需要在某些点暂停以恢复精力
step
    #title Dragon Glyph: Stormshroud Peak
    .line 2025,35.5,85.5,46.0,73.0
    .goto 2025,46.0,73.0
    .achievement 16578,2 >>在山顶的风暴峰拾取龙文:风暴帷幕
step
    #completewith next
    +从风暴峰:只需滑翔而下就足够了
    *From somewhere else: Teleport to Alexstrasza in Valdrakken and fly up
step
    #title Dragon Glyph: Valdrakken
    --x .line 2025,46.0,73.0, 2112 58.7,38.1
    .goto 2112,58.7,38.1
    .achievement 16578,4 >>在塔顶拾取龙纹符文:瓦德拉肯
step
    #completewith next
    +从任意位置:只需滑翔下降即可
step
    #title Dragon Glyph: Gelikyr Overlook
    --x line from map to map
    .goto 2025,52.7,67.4
    .achievement 16578,11 >>拾取龙文:下桥上方的格利基尔高地
step
    #completewith next
    +从任意位置:使用|T4640498:0|t[天际跃升] 2-3次以抵达符文位置
step
    #title Dragon Glyph: Passage of Time
    .line 2025,52.7,67.4,55.6,72.1
    .goto 2025,55.6,72.1
    .achievement 16578,12 >>在拱门通道下拾取龙纹:时间之径
step
    #completewith next
    .goto 2025,57.46,66.55,50,0
    +从任何位置:飞入龙卷风以获得上升气流, 使用|T4640498:0|t[Skyward Ascend]技能四到五次即可抵达符文位置
step
    #title Dragon Glyph: Tyrhold
    .line 2025,55.6,72.1,61.5,56.6
    .goto 2025,61.5,56.6
    .achievement 16578,6 >>在飞行岩石上拾取龙之符文:泰尔霍德
step
    #completewith next
    +来自泰尔霍尔德:只需滑翔降落即可
    *From somewhere else: The easiest way is to start in Valdrakken from the top
step
    #title Dragon Glyph: Algeth'era
    .line 2025,61.5,56.6,49.8,40.2
    .goto 2025,49.8,40.2
    .achievement 16578,5 >>拾取塔顶的龙纹:Algeth'era
step
    #completewith next
    +从任意位置:使用|T4640498:0|t[Skyward Ascend] 四至五次. 你可能需要等待活力值充能完毕
step
    #title Dragon Glyph: Algeth'ar Academy
    .line 2025,49.8,40.2,62.4,40.4
    .goto 2025,62.4,40.4
    .achievement 16578,7 >>在穹顶塔楼顶部的阿尔格瑟拉学院拾取龙纹符文
step
    #completewith next
    +来自阿尔盖塔尔学院:只需滑翔降落就足够了
    *From somewhere else: The easiest way is to start in Valdrakken from the top and to glide down
step
    #title Dragon Glyph: Veiled Ossuary
    .line 2025,62.4,40.4,67.0,11.7
    .goto 2025,67.0,11.7
    .achievement 16578,8 >>在塔顶拾取龙符文:隐匿骨匣
step
    #completewith next
    +最佳选项:如果你的炉石在瓦德拉肯, 就使用它传送到那里, 然后前往阿莱克丝塔萨, 再使用 |T4640498:0|t[飞升天空] 飞行技能仅需3-4次即可抵达目的地
step
    #title Dragon Glyph: Vault of the Incarnates
    >>请注意这里使用Vigor的方式, 你需要消耗大量Vigor, 或者选择一条迂回的路径飞行
    >>滑翔以恢复活力, 并频繁使用 |T4640498:0|t[飞升]来获取高度
    .line 2025,67.0,11.7,72.4,51.7
    .goto 2025,72.4,51.7
    .achievement 16578,9 >>在化身地窖中拾取位于团队左侧空中的龙之雕文
step
    #completewith next
    +从任何位置:滑翔以恢复活力, 并尽可能多地使用|T4640498:0|t[飞升], 你可能需要在山崖上短暂休息
step
    #title Dragon Glyph: Thaldraszus Apex
    .line 2025,72.4,51.7,72.9,69.2
    .goto 2025,72.9,69.2
    .achievement 16578,10 >>拾取塔顶的龙纹:萨德拉祖斯之巅
step
    #completewith next
    +从塔德拉祖斯之巅出发:只需滑翔下降即可, 可使用“向前冲刺”来加速
    *From somewhere else: Fly to the Temporal Conflux and use |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: Temporal Conflux
    .line 2025,72.9,69.2,66.0,82.3
    .goto 2025,66.0,82.3
    .achievement 16578,1 >>拾取塔顶的龙纹:时空交汇
]])

--Forbidden Reach
RXPGuides.RegisterGuide([[
#retail
#version 3
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name e) 禁忌之地符文
#displayname |cFF00CCFF5|r - 禁忌离岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next f) 扎拉莱克洞穴符文

step
    #completewith next
    .hs >>如果你的炉石在瓦德拉肯, 就使用它
step
    >>如果你的任务日志中尚未出现此任务, 或你尚未完成它, 当你进入瓦尔德拉肯时, 该任务将会出现在你的任务日志中
    .accept 74381 >>接任务: |cRXP_WARN_隐世的传承|r
    .goto 2112,60.80,39.73
step
    #completewith next
    .cast 395219 >>传送至元素之座
    .goto 2112,61.93,32.2
    >>|cRXP_WARN_或者, 你也可以直接飞到瓦尔德拉肯塔楼顶端, 跳过这一步骤|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kurazidaia|r交谈
    >>|cRXP_WARN_您可以按ESC键跳过即将播放的过场动画|r.
    .isOnQuest 74381
    .goto 2112,61.03,26.07
    .skipgossip 201398,1
    .complete 74381,1 --1/1 Hear Kurazidaia's report
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kurazidaia|r交谈
    .goto 2112,61.03,26.07
    .turnin 74381 >>交任务: |cRXP_FRIENDLY_隐世的传承|r
    .accept 73076 >>接任务: |cRXP_WARN_再登离岛|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行大师Aluri|r交谈
    .goto 2112,44.05,67.90
    .skipgossip 2
    .complete 73076,1 --1/1 Speak with Flightmaster Aluri to fly to the Forbidden Reach (Optional)
    .timer 158, Forbidden Reach Flight Time
step
    #completewith next
    +使用 |T4640498:0|t[向上飞升] 升空, 并使用 |T2103880:0|t[向前冲刺] 加速前进
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Winglord's Perch
    >>|cRXP_WARN_ 使用掉你所有的符文印记|r
    .line 2151,35.86,59.11,18.3,13.2
    .goto 2151,18.3,13.2
    .achievement 17411,1 >>拾取隐藏在岛屿一座破旧小建筑内的龙符文:翼王栖木
step
    #completewith next
    +使用 |T4640498:0|t[向上飞升] 升空, 并使用 |T2103880:0|t[向前冲刺] 加速前进
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Caldera of the Menders
    >>|cRXP_WARN_ 使用掉你所有的符文印记|r
    .line 2151,18.3,13.2,37.73,30.58
    .goto 2151,37.73,30.58
    .achievement 17411,8 >>拾取龙之符文:修复者熔炉隐藏在一座破损建筑内
step
    #completewith next
    +要抵达天际之塔, 请频繁使用 |T4640498:0|t[升空跃迁]
    *To recharge Vigor, glide down to the nearest ground.
step
    #title Dragon Glyph: Froststone Peak
    .line 2151,37.73,30.58,62.51,32.35
    .goto 2151,62.51,32.35
    .achievement 17411,3 >>拾取龙符文:霜石峰, 隐藏在天空塔楼天花板下方
step
    #completewith next
    +使用 |T4640498:0|t[向上飞升] 升空, 并使用 |T2103880:0|t[向前冲刺] 加速前进
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Dragonskull Island
    .line 2151,62.51,32.35,79.45,32.63
    .goto 2151,79.45,32.63
    .achievement 17411,4 >>拾取龙符:隐藏在三棵树之间的龙骨岛
step
    #completewith next
    +要抵达山顶, 请频繁使用 |T4640498:0|t[升空飞跃]
    *To recharge Vigor, glide down to the nearest ground.
step
    #title Dragon Glyph: Stormsunder Mountain
    .line 2151,79.45,32.63,77.29,55.09
    .goto 2151,77.29,55.09
    .achievement 17411,5 >>拾取龙符:风暴山隐藏在山顶上
step
    #completewith next
    +使用 |T4640498:0|t[向上飞升] 升空, 并使用 |T2103880:0|t[向前冲刺] 加速前进
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Talonlord's Perch
    .line 2151,77.29,55.09,59.07,65.05
    .goto 2151,59.07,65.05
    .achievement 17411,7 >>拾取龙纹符文:藏于塔顶的爪王栖木
step
    #completewith next
    +要抵达雪山, 请频繁使用 |T4640498:0|t[升空飞跃]
    *To recharge Vigor, glide down to the nearest ground.
step
    #title Dragon Glyph: The Frosted Spine
    .line 2151,59.07,65.05,48.53,69.0
    .goto 2151,48.53,69.0
    .achievement 17411,6 >>拾取龙纹符文:位于雪山高处的霜脊
step
    #completewith next
    +使用 |T4640498:0|t[向上飞升] 升空, 并使用 |T2103880:0|t[向前冲刺] 加速前进
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Talon's Watch
    .line 2151,48.53,69.0,20.6,91.4
    .goto 2151,20.6,91.4
    .achievement 17411,2 >>拾取龙之符文:塔隆的守望, 隐藏在岛屿上塔楼底部
]])

--Zaralek Cavern
RXPGuides.RegisterGuide([[
#retail
#version 3
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name f) 扎拉莱克洞穴符文
#displayname |cFF00CCFF6|r - 查拉雷克洞窟 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next g) 翡翠梦境龙符文


step
    .zoneskip 2200
    +本指南要求您已解锁|cRXP_WARN_Zaralek Caverns|r
step
    .zone 2200 >>进入扎拉雷克洞穴|cRXP_WARN_通过萨德拉苏斯入口|r
step
    #completewith next
    +使用 |T4640498:0|t[升空] 来上升, 使用 |T2103880:0|t[疾冲] 来加速
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead|r.
step
    #title Dragon Glyph: The Throughway
    .line 2200,73.39,50.08,72.0,48.3
    .goto 2200,72.0,48.3
    .achievement 19306,6 >>拾取龙符文:洞穴天花板下方的通道
step
    #completewith next
    +使用 |T4640498:0|t[升空] 来上升, 使用 |T2103880:0|t[疾冲] 来加速
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead|r.
step
    #title Dragon Glyph: Loamm
    .line 2200,72.0,48.3,54.7,54.8
    .goto 2200,54.7,54.8
    .achievement 19306,3 >>拾取龙纹符文:位于洛安姆上方洞穴天花板下的洛安姆
step
    #completewith next
    +使用 |T4640498:0|t[升空] 来上升, 使用 |T2103880:0|t[疾冲] 来加速
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead|r.
step
    #title Dragon Glyph: Nal ks'kol
    .line 2200,54.7,54.8,62.7,70.3
    .goto 2200,62.7,70.3
    .achievement 19306,2 >>拾起龙符:纳尔·克斯科尔|cRXP_WARN_在洞穴天花板之下|r
step
    #completewith next
    +使用 |T4640498:0|t[升空] 来上升, 使用 |T2103880:0|t[疾冲] 来加速
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead|r.
step
    #title Dragon Glyph: Glimmerogg
    .line 2200,62.7,70.3,41.6,80.3
    .goto 2200,41.6,80.3
    .achievement 19306,1 >>拾取龙纹章:微光龙|cRXP_WARN_位于洞穴天花板下方, 靠近墙壁|r
step
    #completewith next
    +使用 |T4640498:0|t[升空] 来上升, 使用 |T2103880:0|t[疾冲] 来加速
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead|r.
step
    #title Dragon Glyph: Zaqali Caldera
    >>|cRXP_WARN_在达到10层“|T3163628:0|t屠龙者之视|r”前暂停
    .line 2200,41.6,80.3,30.4,45.2
    .goto 2200,30.4,45.2
    .achievement 19306,4 >>拾取龙之符文:扎卡利熔岩峡谷|cRXP_WARN_above a ledge|r
step
    #completewith next
    +使用 |T4640498:0|t[升空] 来 ascend, 并使用 |T2103880:0|t[疾冲] 来加速
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead|r.
step
    #title Dragon Glyph: Acidbite Ravine
    .line 2200,30.4,45.2,46.5,36.2
    .goto 2200,46.5,36.2
    .achievement 19306,7 >>拾取龙之符文:酸咬峡谷|cRXP_WARN_beneath the cave ceiling|r
step
    #completewith next
    +使用 |T4640498:0|t[升空] 来上升, 使用 |T2103880:0|t[疾冲] 来加速
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead|r.
step
    #title Dragon Glyph: Slitherdrake Roost
    .line 2200,46.5,36.2,55.2,27.8
    .goto 2200,55.2,27.8
    .achievement 19306,5 >>拾取龙符文:潜伏毒龙巢穴|cRXP_WARN_洞穴天花板下方, 隐藏在土状冰柱之间|r
step
    #completewith next
    +使用 |T4640498:0|t[升空] 来上升, 使用 |T2103880:0|t[疾冲] 来加速
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead|r.
step
    #title Dragon Glyph: Aberrus Approach
    .line 2200,55.2,27.8,48.0,4.4
    .goto 2200,48.0,4.4
    .achievement 19306,8 >>拾取龙之铭文:阿伯鲁斯入口后方|cRXP_WARN_在熔岩瀑布顶部|r
]])

--Emerald Dream
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name g) 翡翠梦境龙符文
#displayname |cFF00CCFF7|r - 翡翠梦境 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next h) 多恩岛符文


step
    .zoneskip 2200
    +本指南要求您已解锁|cRXP_WARN_翡翠梦境|r
step
    .goto 2112,62.70,57.33,-1
    .goto 2023,18.40,52.37,-1
    .zone 2200 >>进入翡翠梦境|cRXP_WARN_通过奥恩阿兰平原的传送门, 或瓦尔德拉肯银行上方的传送门|r
step
    #completewith DragonGlpyhsEmeraldDream
    +使用 |T4640498:0|t[升空] 来上升, 使用 |T2103880:0|t[疾冲] 来加速
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead|r.
step
    #title Dragon Glyph: Eye of Ysera
    .goto 2200,60.38,30.14
    .achievement 19306,1 >>拾取龙之铭文:伊瑟拉之眼|cRXP_WARN_|在漂浮岩石上的树木之间|r
step
    #title Dragon Glyph: Cinder Summit
    .line 2200,60.38,30.14,29.81,21.24
    .goto 2200,29.81,21.24
    .achievement 19306,4 >>拾取龙纹:烬峰
step
    #title Dragon Glyph: Furnace Coil
    .line 2200,29.81,21.24,21.22,26.74
    .goto 2200,21.22,26.74
    .achievement 19306,2 >>拾取龙符:熔炉线圈|cRXP_WARN_在山顶|r
step
    #title Dragon Glyph: Smoldering Copse
    .line 2200,21.22,26.74,33.81,45.56
    .goto 2200,33.81,45.56
    .achievement 19306,3 >>拾取龙符文:燃烧的树林|cRXP_WARN_在树梢顶端|r
step
    #title Dragon Glyph: Dreamsurge Basin
    .line 2200,33.81,45.56,45.51,45.82
    .goto 2200,45.51,45.82
    .achievement 19306,5 >>拾取龙纹符文:梦境涌动盆地|cRXP_WARN_在树顶|r
step
    #title Dragon Glyph: Amirdrassil
    .line 2200,45.51,45.82,49.96,64.30
    .goto 2200,49.96,64.30
    .achievement 19306,6 >>拾取龙纹:艾尔德雷德 |cRXP_WARN_in树顶|r
step
    #title Dragon Glyph: Wakeful Vista
    .line 2200,49.96,64.30,61.68,75.40
    .goto 2200,61.68,75.40
    .achievement 19306,8 >>拾取龙纹:清醒远景|cRXP_WARN_在树顶|r
step
    #label DragonGlpyhsEmeraldDream
    #title Dragon Glyph: Whorlwing Basin
    .line 2200,61.68,75.40,31.84,80.60
    .goto 2200,31.84,80.60
    .achievement 19306,7 >>拾取龙纹符文:漩涡盆地
]])

-- =============================
-- ==========   TWW ============
-- =============================

--SEPERATOR
RXPGuides.RegisterGuide([[
#retail
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name ga
#displayname |cFFFCDC00地心之战|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#disabled


]])

--Isle of the Dorn
RXPGuides.RegisterGuide([[
#version 1
#retail
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name h) 多恩岛符文
#displayname |cFF1EFF001|r - 多恩岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next i) 铃响深渊符文

step
    #completewith
    +欢迎阅读天行符文指南
    *This will guide you through all the 飞行滑翔符文.
step
    #title Skyriding Glyph: Storm's Watch
    .goto 2248,37.88,40.96
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,3 >>拾取天翔符文:风暴守望
step
    #title Skyriding: Thul Medran
    .goto 2248,47.78,26.71
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,6 >>拾取飞行坐骑:图尔·梅德兰
step
    #title Skyriding Glyph: Thunderhead Peak
    .goto 2248,56.21,17.86
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,7 >>拾取天空飞行符文:雷云峰顶
step
    #title Skyriding Glyph: The Three Shields
    .goto 2248,75.75,22.23
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,1 >>拾取天空骑术符文:三面盾牌
step
    #title Skyriding Glyph: 燧酿酒庄
    .goto 2248,78.22,42.76
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,8 >>拾取天空飞行符文:灰烬酿造酒坊
step
    #title Skyriding Glyph: Ironwold
    .goto 2248,71.91,47.22
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,10 >>拾取天空骑术符文:铁木林
step
    #title Skyriding Glyph: Mourning Rise
    .goto 2248,62.12,44.95
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,9 >>拾取天空骑术符文:哀悼之巅
step
    #title Skyriding Glyph: Sunken Shield
    .goto 2248,68.24,71.8
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,5 >>拾取天空骑乘符文:沉没之盾
step
    #title Skyriding Glyph: Dhar Durgaz
    .goto 2248,44.47,79.75
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,4 >>拾取天空飞行符文:达爾杜加茲
step
    #title Skyriding Glyph: Dhar Oztan
    .goto 2248,23.15,58.56
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40166,2 >>拾取天空飞行符文:达赫·奥兹坦
]])

--The Ringing Deeps
RXPGuides.RegisterGuide([[
#version 1
#retail
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name i) 铃响深渊符文
#displayname |cFF1EFF002|r - 喧鸣深窟 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next j) 万圣节符文


step
    #title Skyriding: The Stonevault Exterior
    .goto 2214,42.72,10.06
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40703,2 >>拾取任务物品:天空骑行——石vault外观
step
    #title Skyriding Glyph: Gundargaz
    .goto 2214,44.86,31.61
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40703,1 >>拾取天空飞行符文:冈达加兹
step
    #title Skyriding Glyph: Lost Mines
    .goto 2214,53.10,31.54
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40703,3 >>拾取天空骑术符文:失落矿井
step
    #title Skyriding Glyph: Chittering Den
    .goto 2214,65.30,34.52
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40703,4 >>拾取天空骑乘符文:叽喳巢穴
step
    #title Skyriding Glyph: The Rumbling Wastes
    .goto 2214,52.06,56.21
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40703,5 >>拾取天空骑乘符文:轰鸣荒原
step
    .goto 2214,58.77,66.06
    #title Skyriding Glyph: Taelloch Mine
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40703,8 >>拾取天空骑乘符文:塔洛奇矿井
step
    .goto 2214,59.73,94.94
    #title Skyriding Glyph: Abyssal Excavation
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40703,7 >>拾取天空骑乘符文:深渊挖掘
step
    #title Skyriding Glyph: The Living Grotto
    .goto 2214,45.10,66.16
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40703,6 >>拾取天空骑术符文:活体洞穴
step
    #title Skyriding Glyph: The Waterworks
    .goto 2214,42.30,51.67
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40703,9 >>拾取天空骑术符文:水厂
]])

--Hallowfall
RXPGuides.RegisterGuide([[
#version 1
#retail
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#name j) 万圣节符文
#displayname |cFF1EFF003|r - 陨圣峪 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next k) 阿兹-卡赫特符文

step
    #title Skyriding: The Fangs
    .goto 2215,62.86,51.79
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40704,1 >>拾取天行者:利齿
step
    #title Skyriding Glyph: Sina's Yearning
    .goto 2215,57.21,32.6
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40704,2 >>拾取飞行符文:西娜的渴望
step
    #title Skyriding Glyph: Sanguine Grasps
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .goto 2215,63.69,65.35
    .achievement 40704,3 >>拾取天行符文:血色之握
step
    #title Skyriding Glyph: Dunelle's Kindness
    .goto 2215,69.95,44.23
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40704,4 >>拾取天空骑术符文:杜奈尔的仁慈
step
    #title Skyriding Glyph: Bleak Sand
    .goto 2215,62.74,7.21
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40704,5 >>拾取天空骑乘符文:荒凉沙地
step
    #title Skyriding Glyph: Mereldar
    .goto 2215,43.33,52.77
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40704,6 >>拾取天空骑乘符文:梅瑞达
step
    #title Skyriding Glyph: Priory of the Sacred Flame
    .goto 2215,35.43,33.85
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40704,7 >>拾取天空骑术符文:圣火修道院
step
    #title Skyriding Glyph: Fortune's Fall
    .goto 2215,30.77,51.58
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40704,8 >>拾取天空骑术符文:命运之坠
step
    #title Skyriding Glyph: Velhan's Claim
    .goto 2215,45.77,12.34
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40704,9 >>拾取天空骑乘符文:维尔汉的领地
step
    #title Skyriding Glyph: Tenir's Ascent
    .goto 2215,57.64,64.67
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40704,10 >>拾取飞行符文:泰尼尔的升天
]])

--Azj-Kahet
RXPGuides.RegisterGuide([[
#version 1
#retail
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#displayname |cFF1EFF004|r - 艾基-卡赫特 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#name k) 阿兹-卡赫特符文
#next l) 卡雷什符文

step
    #title Skyriding: Trickling Abyss
    .goto 2255,70.54,25.16
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,10 >>拾取天行者:涓滴深渊
step
    #title Skyriding Glyph: Arathi's End
    .goto 2255,63.45,13.99
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,1 >>拾取天空飞行符文:阿拉希的终结
step
    #title Skyriding Glyph: Siegehold
    .goto 2255,46.69,21.27
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,2 >>拾取天空骑术符文:攻城要塞
step
    #title Skyriding Glyph: Ruptured Lake
    .goto 2255,25.18,40.64
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,3 >>拾取天空飞行符文:破裂湖
step
    #title Skyriding Glyph: Eye of Ansurek
    .goto 2255,42.94,57.14
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,4 >>拾取天空骑术符文:安苏雷克之眼
step
    #title Skyriding Glyph: Old Sacrificial Pit
    .goto 2213,13.14,33.69
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,5 >>拾取天空骑术符文:古老献祭坑
step
    #title Skyriding Glyph: Deepwalker Pass
    .goto 2255,58.58,89.79
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,6 >>拾取天空骑术符文:深渊行者通道
step
    #title Skyriding Glyph: The Maddening Deep
    .goto 2255,66.33,84.92
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,7 >>拾取天空骑乘符文:疯狂深渊
step
    #title Skyriding Glyph: Rak-Ush
    .goto 2255,73.19,84.13
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,8 >>拾取天空骑乘符文:拉克-乌什
step
    #title Skyriding Glyph: Untamed Valley
    .goto 2255,65.46,51.78
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,11 >>拾取天空骑术符文:狂野山谷
step
    #title Skyriding Glyph: 流丝区
    .goto 2255,57.66,57.38
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 40705,9 >>拾取天空飞行符文:丝质守卫
]])

--K'aresh Glyph Hunter
RXPGuides.RegisterGuide([[
#version 1
#retail
#group RestedXP 收藏品
#subgroup 飞行滑翔符文
#displayname |cFF1EFF005|r - 卡雷什 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#name l) 卡雷什符文
#next a) 苏醒海岸符文

step
    #title Skyriding: Tazavesh
    .goto 2472,55.12,67.55
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 42727,7 >>拾取任务物品:塔扎维什飞行坐骑
step
    #title Skyriding Glyph: Eco-Dome: Primus
    .goto 2371,46.38,58.38
    >>使用 |T4640490:0|t[向前冲刺] 获得速度提升, |T4640498:0|t[向上跃升]
    .achievement 42727,2 >>拾取天空骑乘符文:生态穹顶:普里姆斯
step
    #title Skyriding Glyph: Serrated Peaks
    .goto 2371,54.67,53.09
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 42727,5 >>拾取天空骑术符文:锯齿峰
step
    #title Skyriding Glyph: Castigaar
    .goto 2371,61,38.7
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 42727,1 >>拾取天空骑乘符文:卡斯蒂加尔
step
    #title Skyriding Glyph: North Sufaad
    .goto 2371,76.47,46.32
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 42727,4 >>拾取天空骑术符文:北苏法德
step
    #title |cFFFCDC00It sits at the highest part of the dome|r
    .goto 2371,74.05,32.52
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 42727,8 >>拾取天空骑术符文:绿洲
step
    #title |cFFFCDC00Above a Mountain Formation|r
    .goto 2371,54.71,23.48
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 42727,3 >>拾取天空骑术符文:拉阿库纳的裂隙
step
    #title |cFFFCDC00ontop of the reactor|r
    .goto 2371,43.9,17.04
    >>使用 |T4640490:0|t「冲锋向前」获得速度提升
    *Use |T4640498:0|t[Skyward Ascent] for an uplift.
    *Use |T4640489:0|t[Second Wind] to renew vigor charges.
    .achievement 42727,6 >>拾取天空骑术符文:暗影点
]])
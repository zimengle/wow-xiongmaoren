RXPGuides.RegisterGuide([[
#df
#name A1 觉醒海岸龙纹
#displayname Waking Shores Dragon Glyphs
#version 2
#groupweight 7
#group RestedXP 龙雕文
#next B1 奥纳兰平原龙雕文

step
    #completewith WakingShoreDragonGlyphs
    +欢迎阅读龙纹指南
    *This will guide you through all the Dragon Glyphs.
step
    #title Dragon Glyph: Skytop Observatory Rostrum
    >>使用 |T4640498:0|t[Skyward Ascend] 一次
    .goto 2022,75.26,57.07
    .achievement 16575,2 >>拾取龙纹：天空之顶天文台讲台
step
    #completewith next
    .goto 2022,75.01,55.57,10 >>如果已解锁，请使用渡轮
step
    #title Dragon Glyph: Skytop Observatory Tower
    >>使用 |T4640498:0|t[Skyward Ascend] 三次 |cRXP_WARN_如果你还没有解锁渡轮|r
    .goto 2022,75.26,57.07
    .achievement 16575,1 >>拾取龙纹：塔顶的观景塔
step
    #completewith next
    +从天空观景塔出发：滑翔下来就足够了。
    *From somewhere else: Use |T4640498:0|t[Skyward Ascend] 1-3 times from the base of the tower
step
    #title Dragon Glyph: Dragonheart Outpost
    .line 2022,75.26,57.07,69.18,46.23
    .goto 2022,69.18,46.23
    .achievement 16575,10 >>在塔楼上半部分的后方拾取龙之雕文：龙之心前哨
step
    #completewith next
    +从龙心前哨站出发：跟随箭头滑行
    *From somewhere else: Use |T4640498:0|t[Skyward Ascend] 1-3 times from the base of the tower
step
    #title Dragon Glyph: Wingrest Embassy
    >>|cRXP_WARN_仅在必要时使用 |T4640498:0|t[Skyward Ascend]|r
    .line 2022,73.58,37.09,30,0
    .goto 2022,74.94,37.50
    .achievement 16575,5 >>在一座破塔的顶部找到龙之符文：翼歇大使馆
step
    #title Dragon Glyph: Scalecracker Peak
    >>|cRXP_WARN_使用所有已经收集的雕文，并等到至少有 3 个活力充能|r
    >>尽可能多地使用 |T4640498:0|t[Skyward Ascend]，但每次施放之间务必等待几秒钟。
    >>您可能需要偶尔补充一下精力（地图上标记了一些好地点）。
    .line 2022,74.94,37.50,73.21,20.51
    .goto 2022,72.96,22.67,0
    .goto 2022,74.09,22.00,0
    .goto 2022,72.87,26.31,0
    .goto 2022,72.85,21.06,0
    .goto 2022,73.21,20.51
    .achievement 16575,11 >>在大山顶上拾取龙纹：鳞裂峰
step
    #completewith next
    +从 Scalecracker Peak 出发：只需滑翔即可。全速滑翔时尽量保持尽可能高的高度
    *From somewhere else: Just fly there, wait for at least 3 vigor charges and use |T4640498:0|t[Skyward Ascend] to reach the tower
step
    #title Dragon Glyph: Life-Binder Observatory
    >>仅在需要时使用 |T4640498:0|t[Skyward Ascend]
    .line 2022,21.91,51.41,52.60,17.12
    .goto 2022,52.60,17.12
    .achievement 16575,8 >>拿起龙符文：塔上方的生命束缚者观测站
step
    #completewith next
    +来自生命束缚者天文台：只需滑翔。全速滑翔时尽量保持尽可能高的高度
    *From somewhere else: Fly to the Obsidian Throne, wait form 4 vigor charges and use |T4640498:0|t[Skyward Ascend] to reach the tower
step
    #title Dragon Glyph: Obisidan Throne
    >>仅当您需要飞上山时才使用 |T4640498:0|t[Skyward Ascend]。
    >>您可能需要中途休息一段时间以等待活力（地图上标记了一些好地点）
    .line 2022,73.21,20.51,21.91,51.41
    .goto 2022,26.42,53.52,0
    .goto 2022,27.52,48.74,0
    .goto 2022,30.02,47.88,0
    .goto 2022,21.91,51.41
    .achievement 16575,12 >>在熔岩池上方的山顶上拾取龙雕文：黑曜石王座
step
    #completewith next
    +来自 Obisidan 王座：全速滑行时尽量保持尽可能高的高度。不需要使用任何活力
    *From somwhere else: Fly to the Obsidian Bulwark. Use |T4640498:0|t[Skyward Ascend] 1-3 times to reach the glyph
step
    #title Dragon Glyph: Obsidian Bulwark
    .line 2022,21.91,51.41,40.98,71.91
    .goto 2022,40.98,71.91
    .achievement 16575,6 >>在细山的顶部拾取龙纹：黑曜石壁垒
step
    #completewith next
    +来自黑曜石壁垒：使用 |T4640498:0|t[Skyward Ascend] 2-4 次。
    *From somewhere else: Fly to the Obsidian Bulwark and spam |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: The Overflowing Spring
    .line 2022,40.98,71.91,46.39,52.07
    .goto 2022,46.39,52.07
    .achievement 16575,7 >>在山顶拾取龙纹：涌泉
step
    #completewith next
    +来自 The Overflowing Spring：只需滑行到字形
    *From somewhere else: An easy way is to get to Ruby Life Pools and fly directly to the glyph
step
    #title Dragon Glyph: Crumbling Life Archway
    >>没必要用任何力气。
    .line 2022,46.39,52.07,57.65,54.83
    .goto 2022,57.65,54.83
    .achievement 16575,9 >>在其中一个拱门下拾取龙纹：摇摇欲坠的生命拱门
step
    #completewith next
    +来自摇摇欲坠的生命拱门：三次 |T4640498:0|t[Skyward Ascend] 应该足够了，但如果有必要，你可以使用更多
    *From somewhere else: The easiest way is to get to Ruby Life Pools and fly up to the glyph
step
    #title Dragon Glyph: Ruby Life Pools Peaks
    .line 2022,57.65,54.83,54.43,74.22
    .goto 2022,54.43,74.22
    .achievement 16575,4 >>拾取龙符文：红宝石生命池大山上方的山峰
step
    #completewith next
    +来自红宝石生命池峰：你不需要使用任何活力充能
    *From somewhere else: An easy way is to get to Ruby Life Pools and fly directly to the glyph
step
    #title Dragon Glyph: Flashfrost Enclave
    >>|cRXP_WARN_使用所有已经收集的雕文，然后等到你至少有 3 个活力充能|r
    .line 2022,54.43,74.22,58.09,78.58
    .goto 2022,58.09,78.58
    .achievement 16575,3 >>拾取飞地入口上方的龙纹：Flashfrost Enclave
step
    #completewith next
    +来自 Flashfrost Enclave：等到你至少有 3 个活力充能。尽量节省至少一个活力充能
    *From somewhere else: The easiest way is to fly from Valdrakken
step
    #label WakingShoreDragonGlyphs
    #title Dragon Glyph: Rubyscale Outpost
    >>|cRXP_WARN_使用所有已经收集的雕文|r
    >>|T4640498:0|t[Skyward Ascend] 使用三次就足够了，但如果有必要，你可以使用更多
    .line 2022,58.09,78.58,48.82,86.64
    .goto 2022,51.01,82.30,45,0
    .goto 2022,48.82,86.64
    .achievement 16576,11 >>拿起离地面几码远的龙雕文：红鳞前哨
]])

RXPGuides.RegisterGuide([[
#df
#name B1 奥纳兰平原龙雕文
#displayname Ohn'ahran Plains Dragon Glyphs
#version 2
#group RestedXP 龙雕文
#next C1 碧空龙纹

step
    #title Dragon Glyph: Mirewood Fen
    >>使用 |T4640498:0|t[Skyward Ascend] 一次或两次
    .goto 2023,78.31,21.31
    .achievement 16576,12 >>在离地面几码的地方拾取龙雕文：泥林沼泽
step
    #completewith next
    +来自沼泽沼泽：等待 3 次活力充能。尽可能多地使用 |T4640498:0|t[Skyward Ascend]，但每次施法之间都要等待几秒钟。
    +从其他地方：一个简单的方法是从 Valdrakken 飞往那里
step
    #title Dragon Glyph: Rusza'thar Reach
    .line 2023,78.31,21.31,86.51,39.40
    .goto 2023,86.51,39.40
    .achievement 16576,9 >>拾取龙雕文：鲁萨塔尔到达塔上方
step
    #completewith next
    +从鲁萨塔尔高地出发：全速滑行时尽量保持尽可能高的高度。途中您应该能够补充至少 2 点活力。到达山顶后，尽可能多地使用 |T4640498:0|t[Skyward Ascend] 到达山顶
    *From somewhere else: Fly to Maruukai, wait for 4 vigor charges and use |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: Ohn'ahran's Roost
    .line 2023,86.51,39.40,57.97,31.11
    .goto 2023,57.97,31.11
    .achievement 16576,1 >>在雕像上方的山顶上拾取龙雕文：奥纳兰的栖息地
step
    #completewith next
    +从 Ohn'ahran's Roost 出发：全速滑翔时尽量保持尽可能高的高度。您应该能够在途中补充所有活力。使用 |T4640498:0|t[Skyward Ascend] 2-3 次到达顶部
    *From somewhere else: Get to the bottom of the mountain, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you're at the top
step
    #title Dragon Glyph: Nokhud Hold
    .line 2023,57.97,31.11,30.71,35.57
    .goto 2023,30.71,35.57
    .achievement 16576,2 >>拾取龙之符文：山顶的 Nokhud Hold
step
    #completewith next
    +从 Nokhud Hold 出发：尽量在全速滑行时保持尽可能高的高度。你应该能够在途中补充所有活力
    *From somewhere else: Fly to the Shady Sanctuary. Wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you're at the top.
step
    #title Dragon Glyph: Emerald Gardens
    .line 2023,30.71,35.57,30.12,61.35
    .goto 2023,30.12,61.35
    .achievement 16576,3 >>拾取阴暗庇护所上方的龙雕文：翡翠花园
step
    #completewith next
    +来自翡翠花园：根据需要经常使用 |T4640498:0|t[Skyward Ascend]
    *From somewhere else: Get to the bottom of the mountain, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: The Eternal Kurgans
    >>|cRXP_WARN_用尽你所有的字形|r
    .line 2023,30.12,61.35,29.44,75.72
    .goto 2023,29.44,75.72
    .achievement 16576,4 >>拾取空中的龙纹：永恒的库尔干人
step
    #completewith next
    +来自永恒库尔干人：等到你有 3 个活力充能。全速滑行时尽量保持高度。只有在真正需要时才使用 |T4640498:0|t[Skyward Ascend]
    *From somewhere else: Fly to Teerakai, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: Szar Skeleth
    .line 2023,29.44,75.72,44.61,64.57
    .goto 2023,44.61,64.57
    .achievement 16576,5 >>在塔顶拾取龙雕文：Szar Skeleth
step
    #completewith next
    +来自 Szar Skeleth：如果活力值较低，请等待 3。使用 |T4640498:0|t[Skyward Ascend] 2-3 次即可到达雕文
    *From somewhere else: Fly to Teerakai, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: Mirror of the Sky
    .line 2023,44.61,64.57,46.97,72.84
    .goto 2023,46.97,72.84
    .achievement 16576,6 >>在山上的空中拾取龙纹：天空之镜
step
    #completewith next
    +来自天空之镜：使用 2-3 次 |T4640498:0|t[Skyward Ascend] 就足以获得雕文
    +从其他地方：飞往 Ohn'iri Springs，等待 2 个活力充能并发送 |T4640498:0|t[Skyward Ascend] 直到你到达雕文
step
    #title Dragon Glyph: Ohn'iri Springs
    .line 2023,46.97,72.84,57.08,80.47
    .goto 2023,57.08,80.47
    .achievement 16576,7 >>在 Ohn'iri Springs 上方的空中拾取龙雕文：Ohn'iri Springs
step
    #completewith next
    +从 Ohn'iri Springs 出发：全速滑行时尽量保持尽可能高的高度。使用 |T4640498:0|t[Skyward Ascends] 1-2 次到达雕文
    *From somewhere else: Get to the Windsong Rise area, wait for 2-3 vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: Windsong Rise
    .line 2023,57.08,80.47,61.48,64.36
    .goto 2023,61.48,64.36
    .achievement 16576,10 >>拾取龙纹：风之歌在空中崛起
step
    #completewith next
    +来自 Windsong Rise：全速滑行时尽量保持尽可能高的高度。你应该能够在途中补充大部分活力。2-3 次 |T4640498:0|t[Skyward Ascend] 应该足够，但如果有必要，你可以使用更多
    *From somewhere else: Fly to the Cobalt Assembly, wait for 1-2 vigor charges and spam |T4640498:0|t[Skyward Ascend] until you reach the glyph
step
    #title Dragon Glyph: Dragonsprings Summit
    .line 2023,61.48,64.36,84.57,77.79
    .goto 2023,84.57,77.79
    .achievement 16576,8 >>在小海上空拾取龙之符文：龙泉峰
]])

RXPGuides.RegisterGuide([[
#df
#name C1 碧空龙纹
#displayname Azure Span Dragon Glyphs
#version 2
#group RestedXP 龙雕文
#next D1 塔达祖斯龙雕文

step
    #title Dragon Glyph: Forkriver Crossing
    >>使用 |T4640498:0|t[Skyward Ascend] 一次或两次
    .goto 2023,36.58,27.96
    .achievement 16577,11 >>在离地面几码的地方拾取龙符文：叉河渡口
step
    #completewith next
    +从 Forkriver 渡口开始：尽量少用活力充能
    *From somewhere else: Fly to the Cobalt Assembly and use |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: The Fallen Course
    .line 2024,36.58,27.96,56.81,16.12
    .goto 2024,56.81,16.12
    .achievement 16577,12 >>在离地面几码的地方拾取龙纹：堕落之路
step
    #completewith next
    +来自堕落之路：全速滑行时尽量保持尽可能高的高度。您应该能够在途中补充 1-2 点活力。使用 |T4640498:0|t[Skyward Ascend] 2-3 次以保持足够高的高度
    *From somewhere else: Get to the bottom of the mountain, wait for your vigor charges and spam |T4640498:0|t[Skyward Ascend] until you're at the top. It's possible that you have to recharge your vigor on the way up
step
    #title Dragon Glyph: Rhonin's Shield
    >>|cRXP_WARN_用尽你所有的字形|r
    .line 2024,56.81,16.12,67.64,29.13
    .goto 2024,67.64,29.13
    .achievement 16577,9 >>在塔顶拾取龙纹：罗宁之盾
step
    .isQuestTurnedIn 70220
    #completewith next
    .goto 2024,71.97,35.37,15 >>飞向“岛之风”
step
    #title Dragon Glyph: Vakthros Range
    >>使用 |T4640498:0|t[Skyward Ascend] 2-3 次到达雕文
    .line 2024,67.64,29.13,72.62,39.78
    .goto 2024,72.62,39.78
    .achievement 16577,10 >>拾取龙纹：冰冻海面上的瓦克索斯山脉
step
    #completewith next
    +从瓦克罗斯射程开始：尝试通过向下瞄准全速飞行。你应该能够在途中恢复活力
    *From somewhere else: Follow the way to the glyph from Rhonin's Shield or Camp Nowhere and use |T4640498:0|t[Skyward Ascend] to reach the glyph. You may have to recharge your vigor occasionally
step
    #title Dragon Glyph: Lost Ruins
    .line 2024,72.62,39.78,70.58,46.26
    .goto 2024,70.58,46.26
    .achievement 16577,4 >>在塔顶拾取龙纹：失落的遗迹
step
    #completewith next
    +来自失落的遗迹：全速滑行时尽量保持尽可能高的高度。只有在真正需要时才使用 |T4640498:0|t[Skyward Ascend]
    *From somewhere else: Fly to Camp Nowhere and use |T4640498:0|t[Skyward Ascend] from the bottom of the tower to reach the glyph
step
    #title Dragon Glyph: Ruins of Karnthar
    .line 2024,70.58,46.26,68.64,60.26
    .goto 2024,68.64,60.26
    .achievement 16577,3 >>在破墙后面的塔顶拾取龙雕文：卡恩萨废墟
step
    #completewith next
    +从卡恩萨废墟出发：尝试向下瞄准，全速飞行。你应该可以在途中恢复活力
    *From somewhere else: Fly to Camp Nowhere, use |T4640498:0|t[Skyward Ascend] one time and fly down to the glyph
step
    #title Dragon Glyph: Imbu
    .line 2024,68.64,60.26,60.58,70.25
    .goto 2024,60.58,70.25
    .achievement 16577,7 >>捡起瀑布旁边空中的龙纹：Imbu。你必须瞄准下方一点
step
    #completewith next
    +来自 Imbu：垃圾邮件 |T4640498:0|t[Skyward Ascend] 到达雕文。使用技能时瞄准高一点
    *From somewhere else: Fly to Camp Nowhere, follow the way to the waypoint and spam |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: Zelthrak Outpost
    .line 2024,60.58,70.25,52.95,49.09
    .goto 2024,52.95,49.09
    .achievement 16577,8 >>在大树的半山腰上拾取龙雕文：泽尔斯拉克前哨站
step
    #completewith TheAzureSpanDragonGlyphAzureArchives
    +从任何地方：前往 Azure 档案库并按照后续步骤操作
step
    .isQuestTurnedIn 65852
    #completewith TheAzureSpanDragonGlyphAzureArchives
    .goto 2024,39.57,60.25,5 >>使用 ExtraActionButton
step
    .isQuestAvailable 65852
    #completewith TheAzureSpanDragonGlyphAzureArchives
    +|cRXP_WARN_在塔底等待，直到你的活力恢复|r
    *Use |T4640498:0|t[Skyward Ascend] four times. You can let your vigor charges recharge on a lower plataeu if necessary
    .goto 2024,40.63,59.45,30,0
step
    #label TheAzureSpanDragonGlyphAzureArchives
    #title Dragon Glyph: Azure Archives
    >>当你到达塔顶时，你只需使用 |T4640498:0|t[Skyward Ascend] 一次即可飞过雕文
    .line 2024,52.95,49.09,40.63,59.45,39.30,63.12
    .goto 2024,39.30,63.12
    .achievement 16577,2 >>在奥术塔上方的空中拾取龙纹：蔚蓝档案库
step
    #completewith next
    +来自 Azure 档案：全速滑行时尽量保持尽可能高的高度。你应该能够补充大部分活力。尽可能只使用一次 |T4640498:0|t[Skyward Ascend]
    *From somewhere else: Fly to the Three-Falls Lookout and then glide down to the glyph
step
    #title Dragon Glyph: Brackenhide Hollow
    .line 2024,39.30,63.12,10.40,35.89
    .goto 2024,10.40,35.89
    .achievement 16577,5 >>在空中拾取龙纹：蕨皮洞
step
    #completewith next
    +来自 Brackenhide Hollow：全速滑行时尽量保持尽可能高的高度。你应该能够补充大部分活力。使用 |T4640498:0|t[Skyward Ascend] 3-5 次。使用技能时瞄准稍高一点
    *From somewhere else: Fly to the Three-Falls Lookout and then use |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: Creektooth Den
    .line 2024,10.40,35.89,26.74,31.67
    .goto 2024,26.74,31.67
    .achievement 16577,6 >>在树顶拾取龙雕文：溪牙巢穴
step
    #completewith next
    +来自 Creektooth Den：在塔底等待，直到所有 vigar 充能完毕。尽可能多地使用 |T4640498:0|t[Skyward Ascend]，但每次施法之间都要等待 2 秒。
    *From somewhere else: Fly to the Cobalt Assembly and use all your vigor charges to reach the glyph
step
    #title Dragon Glyph: Cobalt Assembly
    >>|cRXP_WARN_用尽你所有的字形|r
    .line 2024,26.74,31.67,45.83,25.73
    .goto 2024,45.83,25.73
    .achievement 16577,1 >>拿起塔上方的龙纹：钴组件
]])

RXPGuides.RegisterGuide([[
#df
#name D1 塔达祖斯龙雕文
#displayname Thaldraszus Dragon Glyphs
#version 2
#group RestedXP 龙雕文
#next E1 禁地龙雕文

step
    #title Dragon Glyph: South Hold Gate
    >>使用|T4640498:0|t[Skyward Ascend] 2-3 次到达雕文
    .goto 2025,35.5,85.5
    .achievement 16578,3 >>在塔顶拾取龙符文：南要塞大门
step
    #completewith next
    +从任何地方：尽可能多地使用|T4640498:0|t[Skyward Ascend] 登上山顶。你可能需要在某些地方停下来补充体力
step
    #title Dragon Glyph: Stormshroud Peak
    .line 2025,35.5,85.5,46.0,73.0
    .goto 2025,46.0,73.0
    .achievement 16578,2 >>在山顶拾取龙雕文：风暴峰
step
    #completewith next
    +从风暴峰：滑翔下来就足够了
    *From somewhere else: Teleport to Alexstrasza in Valdrakken and fly up
step
    #title Dragon Glyph: Valdrakken
    --x .line 2025,46.0,73.0, 2112 58.7,38.1
    .goto 2112,58.7,38.1
    .achievement 16578,4 >>在塔顶拾取龙雕文：瓦德拉肯
step
    #completewith next
    +从任何地方：只需滑行即可
step
    #title Dragon Glyph: Gelikyr Overlook
    --x line from map to map
    .goto 2025,52.7,67.4
    .achievement 16578,11 >>拾取龙雕文：下桥上方的 Gelikyr Overlook
step
    #completewith next
    +从任何地方：使用|T4640498:0|t[Skyward Ascend] 2-3 次即可到达雕文
step
    #title Dragon Glyph: Passage of Time
    .line 2025,52.7,67.4,55.6,72.1
    .goto 2025,55.6,72.1
    .achievement 16578,12 >>在通道拱门下拾取龙纹：时间流逝
step
    #completewith next
    .goto 2025,57.46,66.55,50,0
    +从任何地方：飞过龙卷风以获得上升气流。使用|T4640498:0|t[Skyward Ascend]四到五次即可到达雕文
step
    #title Dragon Glyph: Tyrhold
    .line 2025,55.6,72.1,61.5,56.6
    .goto 2025,61.5,56.6
    .achievement 16578,6 >>在飞石上拾取龙之符文：泰尔霍德
step
    #completewith next
    +来自泰尔霍尔德：滑翔下来就够了
    *From somewhere else: The easiest way is to start in Valdrakken from the top
step
    #title Dragon Glyph: Algeth'era
    .line 2025,61.5,56.6,49.8,40.2
    .goto 2025,49.8,40.2
    .achievement 16578,5 >>拾取塔顶的龙纹：Algeth'era
step
    #completewith next
    +从任何地方：使用|T4640498:0|t[Skyward Ascend] 四到五次。你可能需要让你的活力充能
step
    #title Dragon Glyph: Algeth'ar Academy
    .line 2025,49.8,40.2,62.4,40.4
    .goto 2025,62.4,40.4
    .achievement 16578,7 >>在圆顶的塔顶上拾取龙纹：Algeth'era Academy
step
    #completewith next
    +来自 Algeth'ar 学院：滑翔下来就足够了
    *From somewhere else: The easiest way is to start in Valdrakken from the top and to glide down
step
    #title Dragon Glyph: Veiled Ossuary
    .line 2025,62.4,40.4,67.0,11.7
    .goto 2025,67.0,11.7
    .achievement 16578,8 >>在塔顶拾取龙符文：Veiled Ossuary
step
    #completewith next
    +最佳选择：如果你的炉石在瓦德拉肯，那么使用它，前往阿莱克丝塔萨，然后使用 |T4640498:0|t[Skyward Ascend] 飞到那里，只需 3-4 次
step
    #title Dragon Glyph: Vault of the Incarnates
    >>在这里，请小心使用你的活力，你会需要很多活力，或者选择一条间接的路径飞行。
    >>滑翔以补充活力并频繁使用 |T4640498:0|t[Skyward Ascend] 来获得高度
    .line 2025,67.0,11.7,72.4,51.7
    .goto 2025,72.4,51.7
    .achievement 16578,9 >>在团队左侧的空中拾取龙之雕文：化身地窖
step
    #completewith next
    +从任何地方：滑翔以补充活力并尽可能多地使用|T4640498:0|t[Skyward Ascend]，你可能不得不在山崖上休息一下
step
    #title Dragon Glyph: Thaldraszus Apex
    .line 2025,72.4,51.7,72.9,69.2
    .goto 2025,72.9,69.2
    .achievement 16578,10 >>拾取塔顶的龙纹：塔德拉祖斯之巅
step
    #completewith next
    +从塔德拉祖斯之巅 (Thaldraszus Apex) 出发：只需滑行而下即可。您可以使用“向前冲刺 (Surge Forward)”来加速。
    *From somewhere else: Fly to the Temporal Conflux and use |T4640498:0|t[Skyward Ascend] to reach the glyph
step
    #title Dragon Glyph: Temporal Conflux
    .line 2025,72.9,69.2,66.0,82.3
    .goto 2025,66.0,82.3
    .achievement 16578,1 >>拾取塔顶的龙纹：时空汇流
]])

RXPGuides.RegisterGuide([[
#df
#name E1 禁地龙雕文
#displayname Forbidden Reach Dragon Glyphs
#next F1 扎拉雷克洞穴龙雕文
#version 2
#group RestedXP 龙雕文

step
    #completewith next
    .hs >>如果你的炉石在 Valdrakken，就使用它
step
    >>如果你的任务日志中没有这个任务，或者你已完成它，那么当你进入 Valdrakken 时，这个任务就会出现在你的任务日志中
    .accept 74381 >>接任务: |cRXP_WARN_隐世的传承|r
    .goto 2112,60.80,39.73
step
    #completewith next
    .cast 395219 >>传送至龙王之座
    .goto 2112,61.93,32.2
    >>|cRXP_WARN_或者你也可以直接飞到 Valdrakken 塔顶，跳过这一步|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kurazidaia|r
    >>|cRXP_WARN_您可以使用 ESC 跳过即将播放的过场动画。|r
    .isOnQuest 74381
    .goto 2112,61.03,26.07
    .skipgossip 201398,1
    .complete 74381,1 --1/1 Hear Kurazidaia's report
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kurazidaia|r
    .goto 2112,61.03,26.07
    .turnin 74381 >>交任务: |cRXP_FRIENDLY_隐世的传承|r
    .accept 73076 >>接任务: |cRXP_WARN_再登离岛|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Flightmaster Aluri|r
    .goto 2112,44.05,67.90
    .skipgossip 2
    .complete 73076,1 --1/1 Speak with Flightmaster Aluri to fly to the Forbidden Reach (Optional)
    .timer 158, Forbidden Reach Flight Time
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|tSurge Forward 加速
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Winglord's Perch
    >>|cRXP_WARN_用尽你所有的字形|r
    .line 2151,35.86,59.11,18.3,13.2
    .goto 2151,18.3,13.2
    .achievement 17411,1 >>拾取隐藏在岛上一栋破旧小建筑内的龙符文：翼王栖木
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|tSurge Forward 加速
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Caldera of the Menders
    >>|cRXP_WARN_用尽你所有的字形|r
    .line 2151,18.3,13.2,37.73,30.58
    .goto 2151,37.73,30.58
    .achievement 17411,8 >>拾取藏在破损建筑内的龙之符文：修复者的火山口
step
    #completewith next
    +要到达天空之塔，请经常使用 |T4640498:0|t[Skyward Ascend]
    *To recharge Vigor, glide down to the nearest ground.
step
    #title Dragon Glyph: Froststone Peak
    .line 2151,37.73,30.58,62.51,32.35
    .goto 2151,62.51,32.35
    .achievement 17411,3 >>拾取隐藏在天空塔天花板下的龙雕文：霜石峰
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|tSurge Forward 加速
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Dragonskull Island
    .line 2151,62.51,32.35,79.45,32.63
    .goto 2151,79.45,32.63
    .achievement 17411,4 >>拾取隐藏在三棵树之间的龙雕文：龙骨岛
step
    #completewith next
    +要到达山上，请经常使用 |T4640498:0|t[Skyward Ascend]
    *To recharge Vigor, glide down to the nearest ground.
step
    #title Dragon Glyph: Stormsunder Mountain
    .line 2151,79.45,32.63,77.29,55.09
    .goto 2151,77.29,55.09
    .achievement 17411,5 >>拾取隐藏在山顶上的龙雕文：暴风之丘
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|tSurge Forward 加速
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Talonlord's Perch
    .line 2151,77.29,55.09,59.07,65.05
    .goto 2151,59.07,65.05
    .achievement 17411,7 >>拾取隐藏在塔顶的龙雕文：塔隆领主的栖木
step
    #completewith next
    +要到达雪山，请经常使用|T4640498:0|t[Skyward Ascend]
    *To recharge Vigor, glide down to the nearest ground.
step
    #title Dragon Glyph: The Frosted Spine
    .line 2151,59.07,65.05,48.53,69.0
    .goto 2151,48.53,69.0
    .achievement 17411,6 >>在雪山高处拾取龙纹：霜脊
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|tSurge Forward 加速
    *Be sure not to use up all your Vigor charges at once. If you need to recharge Vigor try gliding instead.
step
    #title Dragon Glyph: Talon's Watch
    .line 2151,48.53,69.0,20.6,91.4
    .goto 2151,20.6,91.4
    .achievement 17411,2 >>拾取隐藏在岛上塔底的龙之符文：塔隆的守望
]])

RXPGuides.RegisterGuide([[
#df
#name F1 扎拉雷克洞穴龙雕文
#displayname Zaralek Cavern Dragon Glyphs
#version 2
#group RestedXP 龙雕文


step
    .zoneskip 2200
    +本指南要求您解锁 |cFFfa9602Zaralek Caverns|r。
step
    .zone 2200 >>|cFFfa9602通过萨德拉祖斯 (Thaldraszus) 的入口进入扎拉雷克洞穴 (Zaralek Cavern)。|r
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|t[Surge Forward] 加速。
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead.|r
step
    #title Dragon Glyph: The Throughway
    .line 2200,73.39,50.08,72.0,48.3
    .goto 2200,72.0,48.3
    .achievement 19306,6 >>拾取龙符文：洞穴天花板下方的通道
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|t[Surge Forward] 加速。
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead.|r
step
    #title Dragon Glyph: Loamm
    .line 2200,72.0,48.3,54.7,54.8
    .goto 2200,54.7,54.8
    .achievement 19306,3 >>拾取 Loamm 上方洞穴天花板下的龙符文：Loamm
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|t[Surge Forward] 加速。
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead.|r
step
    #title Dragon Glyph: Nal ks'kol
    .line 2200,54.7,54.8,62.7,70.3
    .goto 2200,62.7,70.3
    .achievement 19306,2 >>拾取龙雕文：纳尔克斯科尔 |cFFfa9602在洞穴天花板下。|r
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|t[Surge Forward] 加速。
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead.|r
step
    #title Dragon Glyph: Glimmerogg
    .line 2200,62.7,70.3,41.6,80.3
    .goto 2200,41.6,80.3
    .achievement 19306,1 >>拿起龙符文：Glimmerogg |cFFfa9602在靠近墙壁的洞穴天花板下。|r
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|t[Surge Forward] 加速。
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead.|r
step
    #title Dragon Glyph: Zaqali Caldera
    >>|cRXP_WARN_在达到 10 层 |T3163628:0|t屠龙者的视线之前暂停|r
    .line 2200,41.6,80.3,30.4,45.2
    .goto 2200,30.4,45.2
    .achievement 19306,4 >>拾取龙雕文：扎卡利火山口 |cFFfa9602在壁架上方。|r
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|tSurge Forward 加速。
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead.|r
step
    #title Dragon Glyph: Acidbite Ravine
    .line 2200,30.4,45.2,46.5,36.2
    .goto 2200,46.5,36.2
    .achievement 19306,7 >>拾取洞穴天花板下的龙符文：Acidbite Ravine |cFFfa9602。|r
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|t[Surge Forward] 加速。
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead.|r
step
    #title Dragon Glyph: Slitherdrake Roost
    .line 2200,46.5,36.2,55.2,27.8
    .goto 2200,55.2,27.8
    .achievement 19306,5 >>拾取龙雕文：滑龙栖息处 |cFFfa9602位于洞穴天花板下方，隐藏在土质冰柱之间。|r
step
    #completewith next
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|t[Surge Forward] 加速。
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead.|r
step
    #title Dragon Glyph: Aberrus Approach
    .line 2200,55.2,27.8,48.0,4.4
    .goto 2200,48.0,4.4
    .achievement 19306,8 >>在团队副本后面的熔岩瀑布顶部 |cFFfa9602 处拾取龙之符文：阿伯鲁斯接近。|r
]])

RXPGuides.RegisterGuide([[
#df
#name G1 翡翠梦境龙纹
#displayname Emerald Dream Dragon Glyphs
#version 1
#group RestedXP 龙雕文


step
    .zoneskip 2200
    +本指南要求您解锁 |cFFfa9602Emerald Dream|r。
step
    .goto 2112,62.70,57.33,-1
    .goto 2023,18.40,52.37,-1
    .zone 2200 >>|cFFfa9602通过 Ohn'ahnran Planes 传送门或银行上方 Valdrakken 中的传送门进入翡翠梦境。|r
step
    #completewith DragonGlpyhsEmeraldDream
    +使用 |T4640498:0|t[Skyward Ascend] 上升并使用 |T2103880:0|t[Surge Forward] 加速。
    *|cRXP_WARN_Be sure not to use up all of your Vigor charges at once. If you need to recharge Vigor try gliding instead.|r
step
    #title Dragon Glyph: Eye of Ysera
    .goto 2200,60.38,30.14
    .achievement 19306,1 >>在漂浮的岩石上的树木之间拾取龙雕文：伊瑟拉之眼 |cRXP_WARN_。|r
step
    #title Dragon Glyph: Cinder Summit
    .line 2200,60.38,30.14,29.81,21.24
    .goto 2200,29.81,21.24
    .achievement 19306,4 >>拾取龙纹：灰烬峰
step
    #title Dragon Glyph: Furnace Coil
    .line 2200,29.81,21.24,21.22,26.74
    .goto 2200,21.22,26.74
    .achievement 19306,2 >>在山顶上拾取龙纹：熔炉线圈|cRXP_WARN_。|r
step
    #title Dragon Glyph: Smoldering Copse
    .line 2200,21.22,26.74,33.81,45.56
    .goto 2200,33.81,45.56
    .achievement 19306,3 >>拿起树枝顶端的龙纹：闷烧的树林 |cRXP_WARN_。|r
step
    #title Dragon Glyph: Dreamsurge Basin
    .line 2200,33.81,45.56,45.51,45.82
    .goto 2200,45.51,45.82
    .achievement 19306,5 >>在树梢上拾取龙纹：梦涌盆地|cRXP_WARN_。|r
step
    #title Dragon Glyph: Amirdrassil
    .line 2200,45.51,45.82,49.96,64.30
    .goto 2200,49.96,64.30
    .achievement 19306,6 >>在树梢上拾取龙纹：阿米尔达希尔 |cRXP_WARN_。|r
step
    #title Dragon Glyph: Wakeful Vista
    .line 2200,49.96,64.30,61.68,75.40
    .goto 2200,61.68,75.40
    .achievement 19306,8 >>在树梢上拾取龙纹：清醒远景 |cRXP_WARN_。|r
step
    #label DragonGlpyhsEmeraldDream
    #title Dragon Glyph: Whorlwing Basin
    .line 2200,61.68,75.40,31.84,80.60
    .goto 2200,31.84,80.60
    .achievement 19306,7 >>拾取龙纹：旋翼盆地
]])

RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP 同盟种族解锁
#groupweight 5
-- #subgroup 赞达拉巨魔
#name 1) 赞达拉巨魔任务线
#displayname 赞达拉巨魔

<< Horde !ZandalariTroll

step
    #completewith ZandalariTrollStartQuestline
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .isOnQuest 49930
    .isQuestAvailable 49930
    .goto 85,53.23,90.47,10,0
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 49930 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .target Ji Firepaw
step
    .isQuestAvailable 50242
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .accept 50242 >>接任务: |cRXP_WARN_选择盟友|r
    .target Ji Firepaw
step
    .isOnQuest 50242
    >>按任意顺序与横幅互动
    .goto 85,37.65,81.43
    .complete 50242,1 -- Learn more about the 至高岭牛头人
    .complete 50242,2 -- Learn more about the nightborne
    .complete 50242,3 -- Learn more about the 玛格汉兽人s
    .complete 50242,4 -- Learn more about the Zandalari trolls
    .complete 50242,5 -- Learn more about the Vulpera
step
    .isQuestComplete 50242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .goto 85,37.65,81.44
    .turnin 50242 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .target Ji Firepaw
step
    #label ZandalariTrollStartQuestline
    .goto 85,37.75,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .accept 53831 >>接任务: |cRXP_WARN_皇家盛典|r
    .target Ji Firepaw
step
    .isOnQuest 53831
    #completewith next
    .goto 85,53.40,90.43,10,0
    .goto 85,58.48,91.26
    .complete 53831,1 --1/1 Use the portal to Zuldazar (Optional)
step
    >>按照箭头
    .goto 1163,48.94,29.53
    .complete 53831,2 --1/1 Meet the Zandalari emissary
step
    .goto 1163,48.53,21.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Natal'hakata|r
    .turnin 53831 >>交任务: |cRXP_FRIENDLY_皇家盛典|r
    .accept 53823 >>接任务: |cRXP_WARN_女王随行|r
    .target Natal'hakata
step << !DemonHunter !Dracthyr
    #completewith next
    .noflyable 862
    .goto 1165,48.51,38.00,15,0
    .goto 1165,45.15,47.02,20,0
    .goto 1165,42.06,26.50,20 >>小心地跳下金字塔
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Talanji|r and |cRXP_FRIENDLY_High Prelate Rata|r
    .turnin 53823 >>交任务: |cRXP_FRIENDLY_女王随行|r
    .goto 1165,42.58,22.81
    .accept 53824 >>接任务: |cRXP_WARN_王者加冕|r
    .goto 1165,42.58,22.53
    .target Princess Talanji
    .target High Prelate Rata
step
    >>骑上 |cRXP_FRIENDLY_Ceremonial Warbeast|r
    .goto 1165,42.51,23.26
    .complete 53824,1 --1/1 Ride the Ceremonial Warbeast
    .timer 76,Ride RP
step
    >>等待RP
    .goto 1165,39.83,12.82
    .complete 53824,2 --1/1 Ride in procession with Talanji
step
    .goto 1165,40.28,12.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Prelate Rata|r
    .turnin 53824 >>交任务: |cRXP_FRIENDLY_王者加冕|r
    .timer 9,Zolani RP
    .target High Prelate Rata
step
    .goto 1165,40.28,12.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zolani|r
    .accept 53826 >>接任务: |cRXP_WARN_我们之间的煽动者|r
    .accept 54419 >>接任务: |cRXP_WARN_镇压暴乱|r
    .target Zolani
step
    #completewith next
    >>击败 |cRXP_ENEMY_Rioting Speakers|r
    .complete 54419,1 --12/12 Rioters subdued
    .mob Rioting Speaker
step
    >>跳下去。击败 |cRXP_ENEMY_Enforcer Malzon|r
    .goto 1165,36.72,10.43,12,0
    .goto 1165,37.29,10.46
    .complete 53826,1 --1/1 Enforcer Malzon confronted
    .mob Enforcer Malzon
step
    >>击败 |cRXP_ENEMY_Rioting Speakers|r 或与 |cRXP_ENEMY_Rioting Zocalo Druges|r 交谈
    .goto 1165,36.17,7.69,20,0
    .goto 1165,34.96,10.72,20,0
    .goto 1165,36.49,15.16,20,0
    .goto 1165,39.96,20.07,20,0
#loop
	.line 1165,36.17,7.69,34.96,10.72,36.49,15.16,39.96,20.07
	.goto 1165,36.17,7.69,22,0
	.goto 1165,34.96,10.72,22,0
	.goto 1165,36.49,15.16,22,0
	.goto 1165,39.96,20.07,22,0
    .skipgossip 147781,1
    .complete 54419,1 --12/12 Rioters subdued
    .mob Rioting Speaker
    .mob Rioting Zocalo Druges
step
    #completewith next
    .noflyable 862
    .goto 1165,42.61,22.91,12,0
    .goto 1165,41.41,18.05,12 >>返回
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Talanji|r, |cRXP_FRIENDLY_High Prelate Rata|r, and |cRXP_FRIENDLY_Zolani|r
    .turnin 53826 >>交任务: |cRXP_FRIENDLY_我们之间的煽动者|r
    .turnin 54419 >>交任务: |cRXP_FRIENDLY_镇压暴乱|r
    .accept 54301 >>接任务: |cRXP_WARN_塔兰吉的仁慈|r
    .goto 1165,40.51,11.91
    .accept 54925 >>接任务: |cRXP_WARN_[Heresy!]|r
    .goto 1165,40.17,11.91
    .accept 54300 >>接任务: |cRXP_WARN_违背信仰|r
    .goto 1165,40.49,12.41
    .target Princess Talanji
    .target High Prelate Rata
    .target Zolani
step
    #completewith ZandalariTrollHeresy
    >>击败 |cRXP_ENEMY_Furious Raptari Druids|r 和 |cRXP_ENEMY_Incensed Raptari Prelates|r
    .complete 54300,1 --12/12 Angered faithful subdued
    .mob Furious Raptari Druid
    .mob Incensed Rastari Prelate
step
    #completewith ZandalariTrollHeresy
    >>撤离 |cRXP_FRIENDLY_阿昆达的祭司|r
    .complete 54301,1 --10/10 Innocent bystanders evacuated
step
    #label ZandalariTrollHeresy
    >>杀死 |cRXP_ENEMY_Prelate Kaj'ra|r
    .groundgoto 1165,45.50,19.77,20,0
    .goto 1165,50.72,16.60,20,0
    .goto 1165,50.86,11.01,20,0
    .goto 1165,50.72,16.60,20,0
    .goto 1165,50.86,11.01,20,0
    .goto 1165,50.84,13.63
    .complete 54925,1 --1/1 Prelate Kaj'ra slain
    .mob Prelate Kaj'ra
step
    >>击败 |cRXP_ENEMY_Furious Raptari Druids|r 和 |cRXP_ENEMY_Incensed Raptari Prelates|r
    >>撤离 |cRXP_FRIENDLY_Priests|r
    .goto 1165,52.00,11.87,20,0
    .goto 1165,49.21,14.52,15,0
    .goto 1165,50.31,7.20,20,0
    .goto 1165,49.08,11.45,20,0
    .goto 1165,49.07,15.55,20,0
    .goto 1165,50.49,19.18,20,0
    .complete 54300,1 --12/12 Angered faithful subdued
    .complete 54301,1 --10/10 Innocent bystanders evacuated
    .mob Furious Raptari Druid
    .mob Incensed Rastari Prelate
    .target Priest of Akunda
    .target Priest of Krag'wa
    .target Raptari Druid
    .target Balina
step
    .groundgoto 1165,41.81,17.15,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Prelate Rata|r, |cRXP_FRIENDLY_Zolani|r, and |cRXP_FRIENDLY_Princess Talanji|r
    .turnin 54925 >>交任务: |cRXP_FRIENDLY_[Heresy!]|r
    .goto 1165,40.49,11.85
    .turnin 54300 >>交任务: |cRXP_FRIENDLY_违背信仰|r
    .goto 1165,40.43,11.95
    .turnin 54301 >>交任务: |cRXP_FRIENDLY_塔兰吉的仁慈|r
    .accept 53825 >>接任务: |cRXP_WARN_[The New Zanchuli Council]|r
    .goto 1165,40.56,11.97
    .target High Prelate Rata
    .target Zolani
    .target Princess Talanji
step
    #completewith next
    .goto 1167,46.53,40.27,10,0
    .goto 1167,37.33,24.93,10,0
    .goto 1167,45.02,15.53,10,0
    .goto 1166,56.09,44.27,20 >>进入金字塔
step
    >>按照箭头
    .goto 1166,61.24,38.93
    .complete 53825,1 --1/1 Meet the new Zanchuli Council
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wardruid Loti|r, |cRXP_FRIENDLY_Lashk|r, |cRXP_FRIENDLY_Jo'nok|r, |cRXP_FRIENDLY_General Rakera|r, and |cRXP_FRIENDLY_Hexlord Raal|r
    .complete 53825,2 --1/1 Greet Wardruid Loti
    .goto 1166,63.05,24.49
    .complete 53825,3 --1/1 Greet Lash
    .goto 1166,64.62,26.47
    .complete 53825,4 --1/1 Greet Jo'nok
    .goto 1166,67.02,31.67
    .complete 53825,5 --1/1 Greet General Rakera
    .goto 1166,68.44,34.00
    .complete 53825,5 --1/1 Greet Hexlord Raal
    .goto 1166,69.73,36.00
    .target Wardruid Loti
    .target Lashk
    .target Jo'nok, Bulwark of Torcall
    .target General Rakera
    .target Hexlord Raal
step
    .goto 1166,60.47,38.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Talanji|r
    .turnin 53825 >>交任务: |cRXP_FRIENDLY_[The New Zanchuli Council]|r
    .accept 53827 >>接任务: |cRXP_WARN_议会已经表态|r
    .timer 56,Blessing RP
    .target Princess Talanji
step
    >>等待RP
    .goto 1166,60.47,38.75
    .complete 53827,1 --1/1 Zanchuli blessing given
step
    >>杀死|cRXP_ENEMY_Widow's Eyes|r
    .goto 1166,60.47,38.75
    .complete 53827,2 --1/1 Survive the ambush
    .mob Widow's Eyes
step
    >>杀死|cRXP_ENEMY_Samara|r
    .goto 1166,65.16,33.13
    .complete 53827,3 --1/1 Samara slain
    .mob Samara
step
    .goto 1166,60.48,38.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Talanji|r
    .turnin 53827 >>交任务: |cRXP_FRIENDLY_议会已经表态|r
    .accept 53828 >>接任务: |cRXP_WARN_神灵的注视|r
    .target Princess Talanji
step
    #completewith ZandalariTrollGazeoftheLoa
    .goto 1166,65.29,68.73,10,0
    .goto 1166,78.84,85.80,10,0
    .goto 1165,44.57,14.38
    .zone 1165 >>按照箭头离开金字塔
step
    .goto 1165,44.57,14.38
    .complete 53828,1 --1/1 Follow Talanji
step
    #label ZandalariTrollGazeoftheLoa
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Talanji|r and |cRXP_FRIENDLY_Krag'wa the Huge|r
    .turnin 53828 >>交任务: |cRXP_FRIENDLY_神灵的注视|r
    .goto 1165,44.57,14.38
    .accept 54031 >>接任务: |cRXP_WARN_[Gaze of the Loa: Krag'wa]|r
    .goto 1165,44.21,14.92
    .target Princess Talanji
    .target Krag'wa the Huge
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krag'wa the Huge|r
    .complete 54031,1 --1/1 Speak to Krag'wa
    .goto 1165,44.21,14.92
    .skipgossip 146208,1
    .timer 15,RP
    .target Krag'wa the Huge
step
    >>只需使用 |T132307:0|t[Dash] (1) 逃离攻击您的青蛙，然后等待 |cRXP_FRIENDLY_Princess Talanji|r 击败所有青蛙即可
    .goto 1165,45.13,16.82
    .complete 54031,2 --1/1 Krag'wa's trial complete
step
    .goto 1165,44.25,14.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krag'wa the Huge|r
    .turnin 54031 >>交任务: |cRXP_FRIENDLY_[Gaze of the Loa: Krag'wa]|r
    .accept 54033 >>接任务: |cRXP_WARN_[Gaze of the Loa: Gonk]|r
    .target Krag'wa the Huge
step
    >>按照箭头向上到达金字塔
    .groundgoto 1165,46.06,16.17,15,0
    .goto 1165,46.30,12.28
    .complete 54033,1 --1/1 Follow Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gonk|r
    .goto 1165,46.51,12.02
    .skipgossip 146214,1
    .complete 54033,2 --1/1 Speak to Gonk
    .timer 44,Gonk RP
    .target Gonk
step
    .goto 1165,46.51,12.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gonk|r
    .turnin 54033 >>交任务: |cRXP_FRIENDLY_[Gaze of the Loa: Gonk]|r
    .accept 54032 >>接任务: |cRXP_WARN_[Gaze of the Loa: Pa'ku]|r
    .target Gonk
step
    >>按照箭头向上到达金字塔
    .goto 1165,44.70,9.09
    .complete 54032,1 --1/1 Follow Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pa'ku|r
    .goto 1165,44.58,8.89
    .skipgossip 146209,1
    .complete 54032,2 --1/1 Speak to Pa'ku
    .timer 44,Gonk RP
    .target Pa'ku
step
    >>躲避龙卷风并跑回|cRXP_FRIENDLY_Pa'ku|r
    .goto 1165,44.58,8.89
    .complete 54032,3 --1/1 Pa'ku's trial complete
step
    .goto 1165,44.58,8.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pa'ku|r
    .turnin 54032 >>交任务: |cRXP_FRIENDLY_[Gaze of the Loa: Pa'ku]|r
    .accept 54034 >>接任务: |cRXP_WARN_[Gaze of the Loa: Bwonsamdi]|r
    .target Pa'ku
step
    >>关注 |cRXP_FRIENDLY_Princess Talanji|r
    .goto 1165,43.63,7.41
    .complete 54034,1 --1/1 Follow Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_邦桑迪|r
    .goto 1165,43.29,6.88
    .skipgossip 146215,1
    .timer 51,Bwonsamdi RP
    .complete 54034,2 --1/1 Speak to Bwonsamdi
    .timer 25,Talanji RP
step
    .goto 1165,42.73,8.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Talanji|r
    .turnin 54034 >>交任务: |cRXP_FRIENDLY_[Gaze of the Loa: Bwonsamdi]|r
    .accept 53830 >>接任务: |cRXP_WARN_[Queen of the Zandalari]|r
    .target Princess Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Talanji|r. 按“ESC”跳过即将播放的过场动画
    .skipgossip 145359,1
    .goto 1165,42.73,8.73
    .complete 53830,1 --1/1 Witness Talanji's address
    .target Princess Talanji
step
    .goto 1165,42.41,9.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Queen Talanji|r
    .turnin 53830 >>交任务: |cRXP_FRIENDLY_[Queen of the Zandalari]|r
    .accept 53719 >>接任务: |cRXP_WARN_[Allegiance of the Zandalari]|r
    .target Queen Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_希尔瓦娜斯·风行者|r
    .goto 1165,41.41,10.62
    .complete 53719,1 --1/1 Talanji's invitation extended
    .target Lady Sylvanas Windrunner
step
    #completewith next
    .noflyable 862
    >>小心地跳下去
    .goto 1165,46.06,16.57,15,0
    .goto 1165,47.06,19.23,15,0
    .goto 1165,47.55,23.59,15,0
    .goto 1165,53.14,19.35
    .fly The Great Seal >>飞往 巨擘封印
step
    #completewith ZandalariTrollAllegianceoftheZandalari
    .noflyable 862
    .isQuestTurnedIn 47436
    .isOnQuest 53719
    .vehicle 131154 >>点击帕库图腾
    .goto 1165,51.37,40.95
step
    #completewith ZandalariTrollAllegianceoftheZandalari
    .noflyable 862
    .isQuestTurnedIn 47443
    .isOnQuest 53719
    .goto 1165,49.93,42.24,10,0
    .goto 1164,37.75,71.70,10,0
    .goto 1164,20.56,72.09,5 >>乘电梯前往 |cRXP_FRIENDLY_Queen Talanji|r
step
    #label ZandalariTrollAllegianceoftheZandalari
    .goto 1165,49.92,46.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待 RP。与 |cRXP_FRIENDLY_Lady Sylvanas Windrunner|r 交谈
    .turnin 53719 >>交任务: |cRXP_FRIENDLY_[Allegiance of the Zandalari]|r
    .target Lady Sylvanas Windrunner
step
    .isQuestTurnedIn 53719
    +恭喜！你已解锁赞达拉巨魔
]])
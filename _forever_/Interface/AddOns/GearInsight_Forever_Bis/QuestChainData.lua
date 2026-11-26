-- 自动生成：scripts/gi_forever_bis_quest_chain.py，⛔别手改
-- 无限 60 级 BiS 任务奖励件的完整任务线（11-26 用户「点击都可以看到任务线才行」）：QuestieDB（Forever）沿前置任务往前追到头，按先后排好。
-- d = 一个长字符串，每行一条：I 物品行（阵营:任务,任务,…，A 联盟 / H 部落 / 空 = 都一样，最后一个任务奖励这件；「=物品」= 任务线同那件）· Q 任务行（任务等级、需要等级、中文名、英文名、接任务中文 / 英文、地区中文 / 英文；英文同中文留空）
-- 插件 GearInsight_Forever_Bis/BisTop.lua 点任务奖励件时才按行拆（ns.BisQuestChain）；QuestieDB 里没有的任务不在这里（照旧只写来源）。
local _, ns = ...; ns = _G.GearInsightForever or ns
ns.QuestChainData = { date = "2026-11-26", items = 192, quests = 235,
  d = [==[

I7515	:1953,1954,1955,1956,1957,1958
I9533	:2768
I9534	=9533
I9623	H:2841
I10751	:3520,3527,4787,3528
I11124	:1446
I11904	:3844,3845,3908,3909,3912,3913,3914,3941,3942,4084,4005,3961,3962
I11962	:4201
I12082	:3441,3442,3443,3452,3453,3454,3462,3463,3481,4022,4024
I12083	=12082
I12543	A:3702,3701,4341,4361,4362,4363
I12544	H:3906,3981,3982,4001,4002,4003,4004
I12545	=12544
I12548	=12543
I13209	:5212,5213
I13243	:5251,5262,5263,5264,5265
I13246	=13243
I13249	=13243
I13958	H:4903
I13959	=13958
I13961	=13958
I13962	=13958
I13963	=13958
I13965	H:4903,4941,4974
I13966	=13965
I13968	=13965
I15107	:1799,4961,4976,4975
I15108	:1799,4961,4976,4964
I15411	:5542,5543,5544,5742,5781,5845,5846,5848,5861,5862,5944
I15413	=15411
I15421	=15411
I15787	:5083,5084,5085,5086,5087,5121
I15789	:974,980,4842
I15805	:5382,5515,5384
I15806	=15805
I16058	=15411
I17044	:5122,5125
I17045	=17044
I17705	A:7065|H:7064
I17774	:7067
I18420	A:7461,7462|H:7461,7877
I18421	=18420
I18424	=18420
I18467	:7502
I18468	:7500
I18469	:7504
I18470	:7506
I18471	:7505
I18472	:7501
I18491	A:7494,7488|H:7492,7489
I19106	H:7181|A:7202
I19107	=19106
I19108	=19106
I19120	H:7862
I19121	H:7861
I19159	=19121
I19289	:7929
I19491	:7981
I19812	=13209
I19982	:8233,8234,8235,8236
I19984	=19982
I19990	:8254,8255,8256,8257
I19992	:8151,8153,8231,8232
I20035	:8250,8251,8252,8253
I20037	=20035
I20082	=19990
I20083	=19992
I20134	H:7667,8258
I20255	=19982
I20369	H:8410,8412,8413
I20503	=20369
I20505	A:8415,8414,8416,8418
I20512	=20505
I20517	:8423,8424,8425
I20521	=20517
I20530	:8419,8421,8422
I20534	=20530
I20536	=20530
I20716	:8304,8309,8310,8314,8315,8381
I20717	:8304,8309,8310,8314,8315,8379
I21316	:8461
I21318	:8464
I21995	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8959|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,9022
I21997	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8951,8960,8961,8965,8986,8989,8994,8995,8996,8997,9006|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,8957,9032,8961,8965,8986,8989,8994,8995,8996,8998,9013
I21998	A:8905,8922,8921,8924,8925,8928,8977,8937|H:8913,8923,8921,8924,8925,8928,8978,8944
I21999	=21997
I22013	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8951,8960,8961,8965,8986,8989,8994,8995,8996,8997,9000|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,8957,9032,8961,8965,8986,8989,8994,8995,8996,8998,9008
I22060	=22013
I22061	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8952|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,9017
I22065	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8951,8960,8961,8965,8986,8989,8994,8995,8996,8997,9001|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,8957,9032,8961,8965,8986,8989,8994,8995,8996,8998,9014
I22066	A:8905,8922,8921,8924,8925,8928,8977,8932|H:8913,8923,8921,8924,8925,8928,8978,8939
I22074	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8951,8960,8961,8965,8986,8989,8994,8995,8996,8997,9005|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,8957,9032,8961,8965,8986,8989,8994,8995,8996,8998,9012
I22076	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8958|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,9021
I22077	A:8905,8922,8921,8924,8925,8928,8977,8936|H:8913,8923,8921,8924,8925,8928,8978,8943
I22083	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8951,8960,8961,8965,8986,8989,8994,8995,8996,8997,9003|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,8957,9032,8961,8965,8986,8989,8994,8995,8996,8998,9009
I22084	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8955|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,9019
I22089	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8951,8960,8961,8965,8986,8989,8994,8995,8996,8997,9002
I22096	H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,8957
I22097	H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,8957,9032,8961,8965,8986,8989,8994,8995,8996,8998,9011
I22099	H:8913,8923,8921,8924,8925,8928,8978,8942
I22102	=22097
I22109	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8951,8960,8961,8965,8986,8989,8994,8995,8996,8997,8999|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,8957,9032,8961,8965,8986,8989,8994,8995,8996,8998,9007
I22149	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949
I22150	=22149
I22272	:9063,9052,9051,9053
I22274	=22272
I22458	=22272
I226772	A:8905,8922,8921,8924,8925,8928,8977,8926|H:8913,8923,8921,8924,8925,8928,8978,8927
I226774	A:8905,8922,8921,8924,8925,8928,8977,8926,8929,8945,8946,8947,8948,8949,8950,9015,8951|H:8913,8923,8921,8924,8925,8928,8978,8927,8930,8945,8946,8947,8948,8949,8950,9015,8957
I226775	A:8905|H:8913
I226777	=226772
I226778	=226774
I226780	=226772
I226781	=226774
I226782	=226775
I226784	=226772
I226785	=226774
I226787	=226774
I226788	=226775
I226789	=226772
I226793	=226772
I226796	=226775
I226797	=226772
I226798	=226774
I226799	=226774
I226802	=226772
I226803	=226774
I226825	=22109
I226826	=226774
I226827	=226774
I226828	=226772
I226829	=22109
I226830	=226775
I226831	=226774
I226832	=226772
I226861	=226772
I226863	=226775
I226864	=226772
I226865	=226775
I226866	=226772
I226867	=226774
I226870	=226772
I226871	=226774
I226883	=226772
I226885	=226775
I226888	=226772
I226905	=226772
I226907	=226775
I226911	=226772
I226929	=226775
I226930	=226772
I226931	=226774
I226933	=226774
I226934	=226772
I226936	=226774
I226948	=226772
I226949	=226775
I226950	=226772
I226953	=226775
I226954	=226772
I226958	=226772
I226969	=226774
I226970	=226775
I226971	=226772
I226974	=226774
I226975	=226772
I226977	=226775
I226978	=226772
I226982	=226772
I226985	=226775
I226986	=226772
I226987	=226774
I226988	=226774
I226990	=226772
I226991	=226774
I227001	=226775
I227006	=226772
I227008	=226772
I227009	=226775
I227010	=226772
I227014	=226772
I227017	=226775
I227018	=226772
I227019	=226774
I227022	=226772
I263411	A:27,29,272,5061|H:26,28,30,31
I270115	=11124
I270117	=10751
I270124	=18491
I270125	=18491
I270225	=19120
I270275	A:2988,2989,2990,2991,2992,2993,2994
Q26	16	16	必修的课程	A Lesson to Learn	图拉克·符文图腾	Turak Runetotem	雷霆崖	Thunder Bluff
Q27	16	16	必修的课程	A Lesson to Learn	玛斯雷·驭熊者	Mathrengyl Bearwalker	达纳苏斯	Darnassus
Q28	16	16	湖中试炼	Trial of the Lake	德迪利特·星焰	Dendrite Starblaze	月光林地	Moonglade
Q29	16	16	湖中试炼	Trial of the Lake	德迪利特·星焰	Dendrite Starblaze	月光林地	Moonglade
Q30	16	16	海狮试炼	Trial of the Sea Lion	塔加里	Tajarri	月光林地	Moonglade
Q31	16	16	水栖形态	Aquatic Form	德迪利特·星焰	Dendrite Starblaze	月光林地	Moonglade
Q272	16	16	海狮试炼	Trial of the Sea Lion	塔加里	Tajarri	月光林地	Moonglade
Q974	55	51	究根问底	Finding the Source	克拉兰克	Krakle	安戈洛环形山	Un'Goro Crater
Q980	55	51	新的泉水	The New Springs	克拉兰克	Krakle	安戈洛环形山	Un'Goro Crater
Q1446	53	38	预言者迦玛兰	Jammal'an the Prophet	阿塔莱流放者	Atal'ai Exile	辛特兰	The Hinterlands
Q1799	40	35	宝珠碎片	Fragments of the Orb of Orahil	梅纳拉·沃伦德	Menara Voidrender	贫瘠之地	The Barrens
Q1953	40	35	返回沼泽	Return to the Marsh	安娜斯塔西娅·哈特威尔	Anastasia Hartwell	幽暗城	Undercity
Q1954	40	35	地狱火宝珠	The Infernal Orb	塔贝萨	Tabetha	尘泥沼泽	Dustwallow Marsh
Q1955	40	35	驱除魔鬼	The Exorcism	塔贝萨	Tabetha	尘泥沼泽	Dustwallow Marsh
Q1956	40	35	奥达曼的能量源	Power in Uldaman	塔贝萨	Tabetha	尘泥沼泽	Dustwallow Marsh
Q1957	40	35	法力怒灵	Mana Surges	塔贝萨	Tabetha	尘泥沼泽	Dustwallow Marsh
Q1958	40	35	苍穹之力	Celestial Power	塔贝萨	Tabetha	尘泥沼泽	Dustwallow Marsh
Q2768	47	40	探水棒	Divino-matic Rod	首席工程师沙克斯·比格维兹	Chief Engineer Bilgewhizzle	塔纳利斯	Tanaris
Q2841	35	25	设备之战	Rig Wars	诺格	Nogg	奥格瑞玛	Orgrimmar
Q2988	45	40	枯木巨魔的牢笼	Witherbark Cages	狮鹫管理员沙拉克·鹰斧	Gryphon Master Talonaxe	辛特兰	The Hinterlands
Q2989	48	40	祖尔祭坛	The Altar of Zul	狮鹫管理员沙拉克·鹰斧	Gryphon Master Talonaxe	辛特兰	The Hinterlands
Q2990	47	40	萨迪斯·格希德	Thadius Grimshade	狮鹫管理员沙拉克·鹰斧	Gryphon Master Talonaxe	辛特兰	The Hinterlands
Q2991	47	40	耐克鲁姆的徽章	Nekrum's Medallion	萨迪斯·格希德	Thadius Grimshade	诅咒之地	Blasted Lands
Q2992	47	40	占卜	The Divination	萨迪斯·格希德	Thadius Grimshade	诅咒之地	Blasted Lands
Q2993	47	40	返回辛特兰	Return to the Hinterlands	萨迪斯·格希德	Thadius Grimshade	诅咒之地	Blasted Lands
Q2994	53	40	拯救沙普比克	Saving Sharpbeak	狮鹫管理员沙拉克·鹰斧	Gryphon Master Talonaxe	辛特兰	The Hinterlands
Q3441	48	40	神圣的惩戒	Divine Retribution	卡拉然·温布雷	Kalaran Windblade	灼热峡谷	Searing Gorge
Q3442	48	40	无瑕之焰	The Flawless Flame	卡拉然·温布雷	Kalaran Windblade	灼热峡谷	Searing Gorge
Q3443	48	40	铸造火炬杆	Forging the Shaft	卡拉然·温布雷	Kalaran Windblade	灼热峡谷	Searing Gorge
Q3452	50	40	烈焰之盒	The Flame's Casing	卡拉然·温布雷	Kalaran Windblade	灼热峡谷	Searing Gorge
Q3453	50	40	惩戒火炬	The Torch of Retribution	卡拉然·温布雷	Kalaran Windblade	灼热峡谷	Searing Gorge
Q3454	50	40	惩戒火炬	The Torch of Retribution	卡拉然·温布雷	Kalaran Windblade	灼热峡谷	Searing Gorge
Q3462	50	40	侍卫玛特拉克	Squire Maltrake	卡拉然·温布雷	Kalaran Windblade	灼热峡谷	Searing Gorge
Q3463	52	40	烧掉它们！	Set Them Ablaze!	侍卫玛特拉克	Squire Maltrake	灼热峡谷	Searing Gorge
Q3481	50	40	打开箱子…	Trinkets...	龙	Hoard of the Black Dragonflight	灼热峡谷	Searing Gorge
Q3520	44	40	尖啸者的灵魂	Screecher Spirits	叶基亚	Yeh'kinya	塔纳利斯	Tanaris
Q3527	47	40	摩沙鲁的预言	The Prophecy of Mosh'aru	叶基亚	Yeh'kinya	塔纳利斯	Tanaris
Q3528	53	40	神灵哈卡	The God Hakkar	叶基亚	Yeh'kinya	塔纳利斯	Tanaris
Q3701	54	50	索瑞森废墟	The Smoldering Ruins of Thaurissan	皇家历史学家阿克瑟努斯	Royal Historian Archesonus	铁炉堡	Ironforge
Q3702	54	50	索瑞森废墟	The Smoldering Ruins of Thaurissan	皇家历史学家阿克瑟努斯	Royal Historian Archesonus	铁炉堡	Ironforge
Q3844	52	47	无人知晓的秘密	It's a Secret to Everybody	碎	A Wrecked Raft	安戈洛环形山	Un'Goro Crater
Q3845	52	47	无人知晓的秘密	It's a Secret to Everybody	背	A Small Pack	安戈洛环形山	Un'Goro Crater
Q3906	52	48	不和谐的烈焰	Disharmony of Flame	桑德哈特	Thunderheart	荒芜之地	Badlands
Q3908	52	47	无人知晓的秘密	It's a Secret to Everybody	林克	Linken	安戈洛环形山	Un'Goro Crater
Q3909	52	47	视灵药剂	The Videre Elixir	多诺瓦·雪山	Donova Snowden	冬泉谷	Winterspring
Q3912	52	47	墓地相见	Meet at the Grave	多诺瓦·雪山	Donova Snowden	冬泉谷	Winterspring
Q3913	52	47	寻找墓碑	A Grave Situation	加里杨	Gaeriyan	塔纳利斯	Tanaris
Q3914	52	47	林克的剑	Linken's Sword	显	A Conspicuous Gravestone	塔纳利斯	Tanaris
Q3941	52	47	侏儒的援助	A Gnome's Assistance	林克	Linken	安戈洛环形山	Un'Goro Crater
Q3942	54	47	林克的记忆	Linken's Memory	科琳	J.D. Collie	安戈洛环形山	Un'Goro Crater
Q3961	54	47	林克的冒险	Linken's Adventure	科琳	J.D. Collie	安戈洛环形山	Un'Goro Crater
Q3962	56	47	结伴而行	It's Dangerous to Go Alone	林克	Linken	安戈洛环形山	Un'Goro Crater
Q3981	52	48	指挥官哥沙克	Commander Gor'shak	神射手贾拉玛弗	Galamav the Marksman	荒芜之地	Badlands
Q3982	54	48	出了什么事？	What Is Going On?	指挥官哥沙克	Commander Gor'shak	黑石深渊	Blackrock Depths
Q4001	54	48	出了什么事？	What Is Going On?	指挥官哥沙克	Commander Gor'shak	黑石深渊	Blackrock Depths
Q4002	54	48	东部王国	The Eastern Kingdom	萨尔	Thrall	奥格瑞玛	Orgrimmar
Q4003	59	48	拯救公主	The Royal Rescue	萨尔	Thrall	奥格瑞玛	Orgrimmar
Q4004	60	48	拯救公主？	The Princess Saved?	铁炉堡公主茉艾拉·铜须	Princess Moira Bronzebeard	黑石深渊	Blackrock Depths
Q4005	54	47	亚奎门塔斯	Aquementas	艾瑞丹·蓝风	Eridan Bluewind	费伍德森林	Felwood
Q4022	54	52	烈焰精华	A Taste of Flame	塞勒斯·萨雷芬图斯	Cyrus Therepentous	燃烧平原	Burning Steppes
Q4024	58	52	烈焰精华	A Taste of Flame	塞勒斯·萨雷芬图斯	Cyrus Therepentous	燃烧平原	Burning Steppes
Q4084	55	47	银爪铁心	Silver Heart	艾瑞丹·蓝风	Eridan Bluewind	费伍德森林	Felwood
Q4201	54	50	爱情药水	The Love Potion	娜玛拉小姐	Mistress Nagmara	黑石深渊	Blackrock Depths
Q4341	59	50	卡兰·巨锤	Kharan Mighthammer	国王麦格尼·铜须	King Magni Bronzebeard	铁炉堡	Ironforge
Q4361	59	50	糟糕的消息	The Bearer of Bad News	卡兰·巨锤	Kharan Mighthammer	黑石深渊	Blackrock Depths
Q4362	59	50	王国的命运	The Fate of the Kingdom	国王麦格尼·铜须	King Magni Bronzebeard	铁炉堡	Ironforge
Q4363	59	50	语出惊人的公主	The Princess's Surprise	铁炉堡公主茉艾拉·铜须	Princess Moira Bronzebeard	黑石深渊	Blackrock Depths
Q4787	50	40	远古之卵	The Ancient Egg	叶基亚	Yeh'kinya	塔纳利斯	Tanaris
Q4842	56	51	奇怪的源头	Strange Sources	多诺瓦·雪山	Donova Snowden	冬泉谷	Winterspring
Q4903	60	55	高图斯的命令	Warlord's Command	军官高图斯	Warlord Goretooth	荒芜之地	Badlands
Q4941	60	55	伊崔格的智慧	Eitrigg's Wisdom	军官高图斯	Warlord Goretooth	荒芜之地	Badlands
Q4961	40	35	奥拉赫宝珠的净化	Cleansing of the Orb of Orahil	塔贝萨	Tabetha	尘泥沼泽	Dustwallow Marsh
Q4964	40	35	达奥拉赫宝珠	The Completed Orb of Dar'Orahil	梅纳拉·沃伦德	Menara Voidrender	贫瘠之地	The Barrens
Q4974	60	55	为部落而战！	For The Horde!	萨尔	Thrall	奥格瑞玛	Orgrimmar
Q4975	40	35	诺奥拉赫宝珠	The Completed Orb of Noh'Orahil	梅纳拉·沃伦德	Menara Voidrender	贫瘠之地	The Barrens
Q4976	40	35	归还净化过的宝珠	Returning the Cleansed Orb	塔贝萨	Tabetha	尘泥沼泽	Dustwallow Marsh
Q5061	16	16	水栖形态	Aquatic Form	德迪利特·星焰	Dendrite Starblaze	月光林地	Moonglade
Q5083	56	52	冬泉火酒	Winterfall Firewater	物品：的	Item: Empty Firewater Flask	冬泉谷	Winterspring
Q5084	56	52	堕落熊怪	Falling to Corruption	多诺瓦·雪山	Donova Snowden	冬泉谷	Winterspring
Q5085	56	52	神秘的粘液	Mystery Goo	木	Deadwood Cauldron	费伍德森林	Felwood
Q5086	56	52	剧毒之水	Toxic Horrors	多诺瓦·雪山	Donova Snowden	冬泉谷	Winterspring
Q5087	57	52	冬泉信使	Winterfall Runners	多诺瓦·雪山	Donova Snowden	冬泉谷	Winterspring
Q5121	59	52	冬泉酋长	High Chief Winterfall	多诺瓦·雪山	Donova Snowden	冬泉谷	Winterspring
Q5122	60	55	信仰奖章	The Medallion of Faith	奥里克斯	Aurius	斯坦索姆	Stratholme
Q5125	60	55	奥里克斯的清算	Aurius' Reckoning	奥里克斯	Aurius	斯坦索姆	Stratholme
Q5212	60	55	血肉不会撒谎	The Flesh Does Not Lie	贝蒂娜·比格辛克	Betina Bigglezink	东瘟疫之地	Eastern Plaguelands
Q5213	60	55	活跃的探子	The Active Agent	贝蒂娜·比格辛克	Betina Bigglezink	东瘟疫之地	Eastern Plaguelands
Q5251	60	55	档案管理员	The Archivist	尼古拉斯·瑟伦霍夫公爵	Duke Nicholas Zverenhoff	东瘟疫之地	Eastern Plaguelands
Q5262	60	55	可怕的真相	The Truth Comes Crashing Down	物品：纳	Item: Head of Balnazzar	斯坦索姆	Stratholme
Q5263	60	55	超越	Above and Beyond	尼古拉斯·瑟伦霍夫公爵	Duke Nicholas Zverenhoff	东瘟疫之地	Eastern Plaguelands
Q5264	60	55	玛克斯韦尔·泰罗索斯男爵	Lord Maxwell Tyrosus	尼古拉斯·瑟伦霍夫公爵	Duke Nicholas Zverenhoff	东瘟疫之地	Eastern Plaguelands
Q5265	60	55	银色黎明宝箱	The Argent Hold	玛克斯韦尔·泰罗索斯男爵	Lord Maxwell Tyrosus	东瘟疫之地	Eastern Plaguelands
Q5382	60	55	瑟尔林·卡斯迪诺夫教授	Doctor Theolen Krastinov, the Butcher	艾瓦·萨克霍夫	Eva Sarkhoff	西瘟疫之地	Western Plaguelands
Q5384	60	55	传令官基尔图诺斯	Kirtonos the Herald	艾瓦·萨克霍夫	Eva Sarkhoff	西瘟疫之地	Western Plaguelands
Q5515	60	55	卡斯迪诺夫的恐惧之袋	Krastinov's Bag of Horrors	艾瓦·萨克霍夫	Eva Sarkhoff	西瘟疫之地	Western Plaguelands
Q5542	56	52	恶魔之犬	Demon Dogs	提里奥·弗丁	Tirion Fordring	东瘟疫之地	Eastern Plaguelands
Q5543	56	52	血染的天空	Blood Tinged Skies	提里奥·弗丁	Tirion Fordring	东瘟疫之地	Eastern Plaguelands
Q5544	56	52	腐肉虫	Carrion Grubbage	提里奥·弗丁	Tirion Fordring	东瘟疫之地	Eastern Plaguelands
Q5742	56	52	救赎	Redemption	提里奥·弗丁	Tirion Fordring	东瘟疫之地	Eastern Plaguelands
Q5781	57	52	遗忘的记忆	Of Forgotten Memories	提里奥·弗丁	Tirion Fordring	东瘟疫之地	Eastern Plaguelands
Q5845	58	52	失落的荣耀	Of Lost Honor	提里奥·弗丁	Tirion Fordring	东瘟疫之地	Eastern Plaguelands
Q5846	58	52	爱与家庭	Of Love and Family	提里奥·弗丁	Tirion Fordring	东瘟疫之地	Eastern Plaguelands
Q5848	60	52	爱与家庭	Of Love and Family	画家瑞弗蕾	Artist Renfray	西瘟疫之地	Western Plaguelands
Q5861	60	52	寻找麦兰达	Find Myranda	提里奥·弗丁	Tirion Fordring	东瘟疫之地	Eastern Plaguelands
Q5862	60	52	血色幻象	Scarlet Subterfuge	巫女麦兰达	Myranda the Hag	西瘟疫之地	Western Plaguelands
Q5944	60	52	在梦中	In Dreams	大领主泰兰·弗丁	Highlord Taelan Fordring	西瘟疫之地	Western Plaguelands
Q7064	51	45	大地的污染	Corruption of Earth and Seed	瑟琳德拉	Selendra	凄凉之地	Desolace
Q7065	51	45	大地的污染	Corruption of Earth and Seed	守护者玛兰迪斯	Keeper Marandis	凄凉之地	Desolace
Q7067	48	39	贱民的指引	The Pariah's Instructions	半人马贱民	Centaur Pariah	凄凉之地	Desolace
Q7181	60	51	科尔拉克的传说	The Legend of Korrak	战争大师拉格隆德	Warmaster Laggrond	奥特兰克山脉 · 奥特兰克山谷部落入口	Alterac Mountains - AV Horde entrance
Q7202	60	51	血怒者科尔拉克	Korrak the Bloodrager	哈格丁中尉	Lieutenant Haggerdin	奥特兰克山脉 · 奥特兰克山谷联盟入口	Alterac Mountains - AV Alliance entrance
Q7461	60	56	伊莫塔尔的疯狂	The Madness Within	辛德拉古灵	Shen'dralar Ancient	厄运之槌	Dire Maul
Q7462	60	56	辛德拉的宝藏	The Treasure of the Shen'dralar	辛德拉古灵	Shen'dralar Ancient	厄运之槌	Dire Maul
Q7488	57	54	蕾瑟塔蒂丝的网	Lethtendris's Web	拉托尼库斯·月矛	Latronicus Moonspear	菲拉斯	Feralas
Q7489	57	54	蕾瑟塔蒂丝的网	Lethtendris's Web	塔罗·刺蹄	Talo Thornhoof	菲拉斯	Feralas
Q7492	57	54	莫沙彻营地	Camp Mojache	公告员高拉克	Warcaller Gorlach	奥格瑞玛	Orgrimmar
Q7494	57	54	羽月要塞	Feathermoon Stronghold	公告员古德曼	Crier Goodman	暴风城	Stormwind City
Q7500	60	54	奥法师的食谱	The Arcanist's Cookbook	物品：法	Item: The Arcanist's Cookbook	厄运之槌	Dire Maul
Q7501	60	54	圣光之力	The Light and How To Swing It	物品：光	Item: The Light and How to Swing It	厄运之槌	Dire Maul
Q7502	60	54	束缚之影	Harnessing Shadows	物品：缚	Item: Harnessing Shadows	厄运之槌	Dire Maul
Q7504	60	54	光明不会告诉你的事情	Holy Bologna: What the Light Won't Tell You	物品：明	Item: Holy Bologna: What the Light Won't Tell You	厄运之槌	Dire Maul
Q7505	60	54	你与冰霜震击	Frost Shock and You	物品：与	Item: Frost Shock and You	厄运之槌	Dire Maul
Q7506	60	54	翡翠梦境……	The Emerald Dream...	物品：翠	Item: The Emerald Dream	厄运之槌	Dire Maul
Q7667	60	58	收集材料	Material Assistance	萨格尼	Sagorne Creststrider	奥格瑞玛	Orgrimmar
Q7861	51	46	通缉：邪恶祭司海克斯和她的爪牙	Wanted: Vile Priestess Hexx and Her Minions	战	Call to Arms!	辛特兰	The Hinterlands
Q7862	51	46	职位空缺：恶齿村卫兵队长	Job Opening: Guard Captain of Revantusk Village	战	Call to Arms!	辛特兰	The Hinterlands
Q7877	60	56	辛德拉的宝藏	The Treasure of the Shen'dralar	辛德拉古灵	Shen'dralar Ancient	厄运之槌	Dire Maul
Q7929	55	1	暗月元素套牌	Darkmoon Elementals Deck	物品：素	Item: Elementals Deck		
Q7981	60	55	1200张奖券 - 暗月护符	1200 Tickets - Amulet of the Darkmoon	吉瓦斯·格里加特	Gelvas Grimegate	莫高雷	Mulgore
Q8151	52	50	猎人的护符	The Hunter's Charm	卡瑞·雷角	Kary Thunderhorn	雷霆崖	Thunder Bluff
Q8153	52	50	苔蹄快步者的鹿角	Courser Antlers	奥汀克	Ogtinc	艾萨拉	Azshara
Q8231	52	50	碎浪多头怪	Wavethrashing	奥汀克	Ogtinc	艾萨拉	Azshara
Q8232	52	50	神庙中的绿龙	The Green Drake	奥汀克	Ogtinc	艾萨拉	Azshara
Q8233	52	50	简单的要求	A Simple Request	奥莫克	Ormok	奥格瑞玛	Orgrimmar
Q8234	52	50	密封的蓝袋子	Sealed Azure Bag	乔拉齐·拉文霍德公爵	Lord Jorach Ravenholdt	奥特兰克山脉	Alterac Mountains
Q8235	52	50	密文碎片	Encoded Fragments	大法师克希雷姆	Archmage Xylem	艾萨拉	Azshara
Q8236	52	50	碧蓝钥匙	The Azure Key	大法师克希雷姆	Archmage Xylem	艾萨拉	Azshara
Q8250	52	50	法师的会见	Magecraft	瑟斯顿·科萨恩	Thurston Xane	雷霆崖	Thunder Bluff
Q8251	52	50	魔法的尘埃	Magic Dust	大法师克希雷姆	Archmage Xylem	艾萨拉	Azshara
Q8252	52	50	纳迦的珊瑚	The Siren's Coral	大法师克希雷姆	Archmage Xylem	艾萨拉	Azshara
Q8253	52	50	毁灭摩弗拉斯	Destroy Morphaz	大法师克希雷姆	Archmage Xylem	艾萨拉	Azshara
Q8254	52	50	塞纳里奥议会的求助	Cenarion Aid	高阶牧师劳瑞娜	High Priestess Laurena	暴风城	Stormwind City
Q8255	52	50	苔蹄快步者	Of Coursers We Know	奥汀克	Ogtinc	艾萨拉	Azshara
Q8256	52	50	亡灵的腐液	The Ichor of Undeath	奥汀克	Ogtinc	艾萨拉	Azshara
Q8257	52	50	摩弗拉斯之血	Blood of Morphaz	奥汀克	Ogtinc	艾萨拉	Azshara
Q8258	60	60	达克雷尔的威胁	The Darkreaver Menace	萨格尼	Sagorne Creststrider	奥格瑞玛	Orgrimmar
Q8304	60	60	亲爱的纳塔莉亚	Dearest Natalia	指挥官玛尔利斯	Commander Mar'alith	希利苏斯	Silithus
Q8309	60	58	追查雕文	Glyph Chasing	鲁特加尔·雕石	Rutgar Glyphshaper	希利苏斯	Silithus
Q8310	60	58	破译密码	Breaking the Code	弗兰卡·石桥	Frankal Stonebridge	希利苏斯	Silithus
Q8314	60	58	揭开秘密	Unraveling the Mystery	鲁特加尔·雕石	Rutgar Glyphshaper	希利苏斯	Silithus
Q8315	60	58	召唤	The Calling	地质学家拉克斯班	Geologist Larksbane	希利苏斯	Silithus
Q8379	60	58	军备物资	Armaments of War	地质学家拉克斯班	Geologist Larksbane	希利苏斯	Silithus
Q8381	60	58	军备物资	Armaments of War	地质学家拉克斯班	Geologist Larksbane	希利苏斯	Silithus
Q8410	50	50	元素掌握	Elemental Mastery	哈洛姆	Haromm	悲伤沼泽	Swamp of Sorrows
Q8412	52	50	灵魂图腾	Spirit Totem	捕风者巴斯拉	Bath'rah the Windwatcher	奥特兰克山脉	Alterac Mountains
Q8413	52	50	巫毒羽毛	Da Voodoo	捕风者巴斯拉	Bath'rah the Windwatcher	奥特兰克山脉	Alterac Mountains
Q8414	52	50	驱散邪恶	Dispelling Evil	指挥官阿什拉姆·瓦罗菲斯特	Commander Ashlam Valorfist	西瘟疫之地	Western Plaguelands
Q8415	52	50	冰风岗	Chillwind Point	格雷森·沙东布瑞克公爵	Lord Grayson Shadowbreaker	暴风城	Stormwind City
Q8416	52	50	惰性天灾石	Inert Scourgestones	高阶牧师赛尔丹尼斯	High Priest Thel'danis	西瘟疫之地	Western Plaguelands
Q8418	52	50	铸造力量之石	Forging the Mightstone	指挥官阿什拉姆·瓦罗菲斯特	Commander Ashlam Valorfist	西瘟疫之地	Western Plaguelands
Q8419	52	50	小鬼的要求	An Imp's Request	德米赛特·克劳斯	Demisette Cloyce	暴风城	Stormwind City
Q8421	52	50	奇怪的材料	The Wrong Stuff	伊普斯	Impsy	费伍德森林	Felwood
Q8422	52	50	巨魔的羽毛	Trolls of a Feather	伊普斯	Impsy	费伍德森林	Felwood
Q8423	52	50	战士的血脉	Warrior Kinship	部落英雄的灵魂	Fallen Hero of the Horde	悲伤沼泽	Swamp of Sorrows
Q8424	52	50	魔誓者之战	War on the Shadowsworn	部落英雄的灵魂	Fallen Hero of the Horde	悲伤沼泽	Swamp of Sorrows
Q8425	52	50	巫毒羽毛	Voodoo Feathers	部落英雄的灵魂	Fallen Hero of the Horde	悲伤沼泽	Swamp of Sorrows
Q8461	55	45	北方的死木熊怪	Deadwood of the North	纳菲恩	Nafien	费伍德森林	Felwood
Q8464	58	45	冬泉熊怪的活动	Winterfall Activity	萨尔法	Salfa	冬泉谷	Winterspring
Q8905	60	58	热心的建议	An Earnest Proposition	德莉亚娜	Deliana	铁炉堡	Ironforge
Q8913	60	58	热心的建议	An Earnest Proposition	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q8921	60	58	灵质提纯器	The Ectoplasmic Distiller	穆克斯·玛纳斯卡波	Mux Manascrambler	塔纳利斯	Tanaris
Q8922	60	58	超自然的设备	A Supernatural Device	德莉亚娜	Deliana	铁炉堡	Ironforge
Q8923	60	58	超自然的设备	A Supernatural Device	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q8924	60	58	猎取灵质	Hunting for Ectoplasm	穆克斯·玛纳斯卡波	Mux Manascrambler	塔纳利斯	Tanaris
Q8925	60	58	便携的能量源	A Portable Power Source	穆克斯·玛纳斯卡波	Mux Manascrambler	塔纳利斯	Tanaris
Q8926	60	58	小小的补偿	Just Compensation	德莉亚娜	Deliana	铁炉堡	Ironforge
Q8927	60	58	小小的补偿	Just Compensation	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q8928	60	58	小巧的商人	A Shifty Merchant	穆克斯·玛纳斯卡波	Mux Manascrambler	塔纳利斯	Tanaris
Q8929	60	58	寻找安泰恩	In Search of Anthion	德莉亚娜	Deliana	铁炉堡	Ironforge
Q8930	60	58	寻找安泰恩	In Search of Anthion	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q8932	60	58	小小的补偿	Just Compensation	德莉亚娜	Deliana	铁炉堡	Ironforge
Q8936	60	58	小小的补偿	Just Compensation	德莉亚娜	Deliana	铁炉堡	Ironforge
Q8937	60	58	小小的补偿	Just Compensation	德莉亚娜	Deliana	铁炉堡	Ironforge
Q8939	60	58	小小的补偿	Just Compensation	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q8942	60	58	小小的补偿	Just Compensation	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q8943	60	58	小小的补偿	Just Compensation	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q8944	60	58	小小的补偿	Just Compensation	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q8945	60	58	死人的请求	Dead Man's Plea	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q8946	60	58	生命的证据	Proof of Life	伊思达·哈尔蒙	Ysida Harmon	东瘟疫之地	Eastern Plaguelands
Q8947	60	58	安泰恩的奇怪请求	Anthion's Strange Request	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q8948	60	58	安泰恩的老朋友	Anthion's Old Friend	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q8949	60	58	法尔林的复仇	Falrin's Vendetta	法尔林·树影	Falrin Treeshaper	厄运之槌	Dire Maul
Q8950	60	58	旗帜上的附魔	The Instigator's Enchantment	法尔林·树影	Falrin Treeshaper	厄运之槌	Dire Maul
Q8951	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q8952	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q8955	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q8957	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q8958	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q8959	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q8960	60	58	伯德雷的不幸	Bodley's Unfortunate Fate	德莉亚娜	Deliana	铁炉堡	Ironforge
Q8961	60	58	烈焰之王	Three Kings of Flame	伯德雷	Bodley	黑石山	Blackrock Mountain
Q8965	60	58	重要的材料	Components of Importance	伯德雷	Bodley	黑石山	Blackrock Mountain
Q8977	60	58	向德莉亚娜回复	Return to Deliana	穆克斯·玛纳斯卡波	Mux Manascrambler	塔纳利斯	Tanaris
Q8978	60	58	向莫克瓦尔回复	Return to Mokvar	穆克斯·玛纳斯卡波	Mux Manascrambler	塔纳利斯	Tanaris
Q8986	60	58	更多重要的材料	More Components of Importance	伯德雷	Bodley	黑石山	Blackrock Mountain
Q8989	60	58	瓦塔拉克饰品的右瓣	The Right Piece of Lord Valthalak's Amulet	伯德雷	Bodley	黑石塔	Blackrock Spire
Q8994	60	58	最后的准备	Final Preparations	伯德雷	Bodley	黑石山	Blackrock Mountain
Q8995	60	58	瓦塔拉克公爵	Mea Culpa, Lord Valthalak	伯德雷	Bodley	黑石塔	Blackrock Spire
Q8996	60	58	向伯德雷回复	Return to Bodley	瓦塔拉克公爵之魂	Spirit of Lord Valthalak	黑石山	Blackrock Mountain
Q8997	60	58	回到起点	Back to the Beginning	伯德雷	Bodley	铁炉堡	Ironforge
Q8998	60	58	回到起点	Back to the Beginning	伯德雷	Bodley	奥格瑞玛	Orgrimmar
Q8999	60	58	最后的奖赏	Saving the Best for Last	德莉亚娜	Deliana	铁炉堡	Ironforge
Q9000	60	58	最后的奖赏	Saving the Best for Last	德莉亚娜	Deliana	铁炉堡	Ironforge
Q9001	60	58	最后的奖赏	Saving the Best for Last	德莉亚娜	Deliana	铁炉堡	Ironforge
Q9002	60	58	最后的奖赏	Saving the Best for Last	德莉亚娜	Deliana	铁炉堡	Ironforge
Q9003	60	58	最后的奖赏	Saving the Best for Last	德莉亚娜	Deliana	铁炉堡	Ironforge
Q9005	60	58	最后的奖赏	Saving the Best for Last	德莉亚娜	Deliana	铁炉堡	Ironforge
Q9006	60	58	最后的奖赏	Saving the Best for Last	德莉亚娜	Deliana	铁炉堡	Ironforge
Q9007	60	58	最后的奖赏	Saving the Best for Last	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q9008	60	58	最后的奖赏	Saving the Best for Last	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q9009	60	58	最后的奖赏	Saving the Best for Last	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q9011	60	58	最后的奖赏	Saving the Best for Last	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q9012	60	58	最后的奖赏	Saving the Best for Last	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q9013	60	58	最后的奖赏	Saving the Best for Last	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q9014	60	58	最后的奖赏	Saving the Best for Last	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q9015	60	58	挑战	The Challenge	法尔林·树影	Falrin Treeshaper	厄运之槌	Dire Maul
Q9017	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q9019	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q9021	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q9022	60	58	告别安泰恩	Anthion's Parting Words	安泰恩·哈尔蒙	Anthion Harmon	东瘟疫之地	Eastern Plaguelands
Q9032	60	58	伯德雷的不幸	Bodley's Unfortunate Fate	莫克瓦尔	Mokvar	奥格瑞玛	Orgrimmar
Q9051	52	50	毒性测试	Toxic Test	托尔瓦·寻路者	Torwa Pathfinder	安戈洛环形山	Un'Goro Crater
Q9052	52	50	血瓣毒药	Bloodpetal Poison	托尔瓦·寻路者	Torwa Pathfinder	安戈洛环形山	Un'Goro Crater
Q9053	52	50	更好的材料	A Better Ingredient	托尔瓦·寻路者	Torwa Pathfinder	安戈洛环形山	Un'Goro Crater
Q9063	52	50	托尔瓦·寻路者	Torwa Pathfinder	图拉克·符文图腾	Turak Runetotem	雷霆崖	Thunder Bluff
]==] }

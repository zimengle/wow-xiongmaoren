local H = HuZhuLayer

-- 切线成功后的祝福语（魔兽 / 华人习惯），随机一条（综合频道用）
H.THANKS_BLESSINGS = {
  "祝你天天发财",
  "祝你欧气满满",
  "祝你刀刀暴击",
  "祝你副本速通",
  "祝你收获满满",
  "祝你财源广进",
  "祝你万事顺意",
  "祝你夜夜安稳",
  "祝你一路绿灯",
  "祝你爆率拉满",
  "祝你装等飞升",
  "祝你金币满包",
  "祝你组队全是靠谱人",
  "祝你野外从不暗伤",
  "祝你任务一条龙",
  "祝你坐骑早到手",
  "祝你专业全满级",
  "祝你声望刷得快",
  "祝你团本首通顺利",
  "祝你硬核长命百岁",
  "祝你今天红包雨",
  "祝你事事都开心",
  "祝你出门遇贵人",
  "祝你回家躺平香",
  "祝你肝得开心不亏",
  "祝你队友都给力",
  "祝你拍卖行大赚",
  "祝你世界BOSS必出",
  "祝你稀有当场撞见",
  "祝你矿草随手采",
  "祝你附魔出极品",
  "祝你锻造出神器",
  "祝你钓鱼竿竿有鱼",
  "祝你烹饪顿顿香",
  "祝你炼金瓶瓶猛",
  "祝你工程不炸膛",
  "祝你制皮出好装",
  "祝你裁缝出披风",
  "祝你珠宝闪瞎眼",
  "祝你铭文出神符",
  "祝你考古挖到宝",
  "祝你战场连胜",
  "祝你荣誉点狂涨",
  "祝你今天不排队",
  "祝你飞行点全开",
  "祝你地图全点亮",
  "祝你成就点满满",
  "祝你传说早入手",
  "祝你紫装当白菜",
  "祝你金币花不完",
  "祝你心情像晴天",
  "祝你上线就好运",
  "祝你下线也安康",
  "祝你家人都平安",
  "祝你工作生活双丰收",
  "祝你玩游戏不生气",
  "祝你遇到都是好人",
  "祝你位面永远不卡",
  "祝你延迟稳如老狗",
  "祝你从不掉线",
  "大吉大利，今晚吃鸡（怪）",
  "好人一生平安",
  "谢谢老板，发发发",
  "积善成德，欧气附体",
  "愿艾泽拉斯眷顾你",
  "光明与你同在",
  "部落／联盟都祝你发财",
  "今天宜切位面，宜暴富",
  "感谢侠义，福泽八方",
  "仗义相助，必有厚报",
  "好人品，好欧气",
  "祝你刀刀烈火，刀刀见面",
  "祝你拉怪不空，输出不炸",
  "祝你治疗蓝用不完",
  "祝你坦克稳如泰山",
  "祝你DPS榜常青",
  "祝你随机本出好货",
  "祝你世界掉落砸脸上",
  "祝你邮箱装满金币",
  "祝你公会人丁兴旺",
  "祝你好友都在线",
  "祝你今天处处顺利",
  "祝你笑口常开",
  "祝你平安喜乐",
  "祝你岁岁如意",
  "祝你龙马精神",
  "祝你步步高升",
  "吉祥如意，财源滚滚",
  "好运常在，暴击常来",
}

-- 队伍问候/感谢：职业称呼大池（避免总喊同一个）
H.PARTY_TITLES = {
  WARRIOR = {
    "战爷", "战士大哥", "战士大大", "猛男", "冲锋侠", "战神", "板甲大哥", "砍王",
    "战友", "战士老板", "战爹", "战士侠士", "战士兄弟", "战士姐", "战士小姐姐",
    "战士大佬", "战士大神", "战士大恩人", "战士好汉", "战士贵人", "战士神仙",
    "战士朋友", "战士队友", "战士热心人", "战士靠谱人", "战士大好人",
  },
  PALADIN = {
    "骑爷", "圣骑大大", "圣骑大哥", "圣骑老板", "光头", "灯泡", "圣光侠", "祝福哥",
    "骑士大大", "骑士大哥", "骑士老板", "圣骑爹", "圣骑姐", "圣骑小姐姐",
    "圣骑大佬", "圣骑大神", "圣光大哥", "骑友", "骑士侠士", "骑士贵人",
    "骑士神仙", "圣骑恩人", "圣骑朋友", "圣骑队友", "圣骑热心人", "圣骑靠谱人",
  },
  HUNTER = {
    "猎爷", "猎人大大", "猎人大哥", "猎人老板", "猎爹", "箭神", "宠物哥",
    "猎人姐", "猎人小姐姐", "猎人兄弟", "猎人大佬", "猎人大神", "猎人贵人",
    "猎人神仙", "猎人恩人", "猎友", "远程大哥", "弓箭手", "枪械哥",
    "猎人侠士", "猎人好汉", "猎人朋友", "猎人队友", "猎人热心人", "猎人靠谱人",
  },
  ROGUE = {
    "贼爷", "盗贼大大", "盗贼大哥", "贼哥", "贼爹", "潜行者", "匕首哥",
    "锁王", "开锁侠", "贼姐", "贼小姐姐", "盗贼老板", "盗贼大佬", "盗贼大神",
    "盗贼贵人", "盗贼神仙", "盗贼恩人", "贼友", "闷棍侠", "盗贼兄弟",
    "盗贼侠士", "盗贼好汉", "盗贼朋友", "盗贼队友", "盗贼热心人", "盗贼靠谱人",
  },
  PRIEST = {
    "牧爷", "牧师大大", "牧师大哥", "牧师老板", "牧师姐", "牧师小姐姐", "牧师爹",
    "牧师大佬", "牧师大神", "牧师贵人", "牧师神仙", "牧师恩人", "牧友",
    "牧师侠士", "牧师兄弟", "牧师好汉", "牧师朋友", "牧师队友", "牧师热心人",
    "牧师靠谱人", "牧师大好人", "牧师及时雨", "牧师贵人啊", "白衣大哥", "白衣大大",
  },
  DEATHKNIGHT = {
    "死骑大大", "死骑大哥", "死骑老板", "死骑爷", "死骑爹", "符文哥",
    "死骑姐", "死骑小姐姐", "死骑大佬", "死骑大神", "死骑贵人", "死骑神仙",
    "死骑恩人", "死骑友", "亡灵骑士", "死骑侠士", "死骑兄弟", "死骑好汉",
    "死骑大恩人", "死骑朋友", "死骑队友", "死骑热心人", "死骑靠谱人",
  },
  SHAMAN = {
    "萨爷", "萨满大大", "萨满大哥", "萨满老板", "图腾哥", "萨满爹", "萨满姐",
    "萨满小姐姐", "萨满大佬", "萨满大神", "萨满贵人", "萨满神仙", "萨满恩人",
    "萨友", "萨满侠士", "萨满兄弟", "萨满好汉", "萨满大恩人", "萨满朋友",
    "萨满队友", "萨满热心人", "萨满靠谱人", "萨满大好人", "萨满及时雨",
  },
  MAGE = {
    "法爷", "法神", "法师大大", "法师大哥", "法师老板", "法爹", "法师姐",
    "法师小姐姐", "法师大佬", "法师大神", "法师贵人", "法师神仙", "法师恩人",
    "法友", "传送侠", "造水哥", "法师侠士", "法师兄弟", "法师好汉",
    "法师大恩人", "法师朋友", "法师队友", "法师热心人", "法师靠谱人", "法师大好人",
  },
  WARLOCK = {
    "术爷", "术士大大", "术士大哥", "术士老板", "术爹", "疼惜", "术士姐",
    "术士小姐姐", "术士大佬", "术士大神", "术士贵人", "术士神仙", "术士恩人",
    "术友", "召唤侠", "灵魂石哥", "术士侠士", "术士兄弟", "术士好汉",
    "术士大恩人", "术士朋友", "术士队友", "术士热心人", "术士靠谱人",
  },
  MONK = {
    "武僧大大", "武僧大哥", "武僧老板", "武僧爷", "武僧姐", "武僧小姐姐",
    "武僧大佬", "武僧大神", "武僧贵人", "武僧神仙", "武僧恩人", "武僧友",
    "武僧侠士", "武僧兄弟", "武僧好汉", "武僧爹", "武僧大恩人", "武僧朋友",
    "武僧队友", "武僧热心人", "武僧靠谱人", "武僧大好人",
  },
  DRUID = {
    "德爷", "德鲁伊大大", "德鲁伊大哥", "德鲁伊老板", "德爹", "德鲁伊姐",
    "德鲁伊小姐姐", "德鲁伊大佬", "德鲁伊大神", "德鲁伊贵人", "德鲁伊神仙",
    "德鲁伊恩人", "德友", "变身侠", "德鲁伊侠士", "德鲁伊兄弟", "德鲁伊好汉",
    "德鲁伊大恩人", "德鲁伊朋友", "德鲁伊队友", "德鲁伊热心人", "德鲁伊靠谱人",
    "德鲁伊大好人",
  },
  DEMONHUNTER = {
    "DH大大", "恶魔猎手", "DH大哥", "DH老板", "DH爷", "DH姐", "DH小姐姐",
    "DH大佬", "DH大神", "DH贵人", "DH神仙", "DH恩人", "DH友", "DH侠士",
    "DH兄弟", "DH好汉", "DH爹", "DH大恩人", "DH朋友", "DH队友", "DH热心人",
    "DH靠谱人",
  },
  EVOKER = {
    "唤魔师大大", "唤魔师大哥", "唤魔师老板", "龙裔", "唤魔师姐", "唤魔师小姐姐",
    "唤魔师大佬", "唤魔师大神", "唤魔师贵人", "唤魔师神仙", "唤魔师恩人",
    "唤魔友", "唤魔侠士", "唤魔师兄弟", "唤魔师好汉", "唤魔师爹",
    "唤魔师大恩人", "唤魔师朋友", "唤魔师队友", "唤魔师热心人", "唤魔师靠谱人",
  },
  UNKNOWN = {
    "老板", "大哥", "大大", "侠士", "贵人", "恩人", "大佬", "大神", "神仙",
    "兄弟", "姐", "小姐姐", "好汉", "朋友", "队友", "互助侠", "仗义人",
    "热心人", "靠谱人", "大好人", "活菩萨", "及时雨", "救命恩人", "位面贵人",
  },
}

-- 进队问候话术（{title}=职业称呼）；不提「一定切成功」
H.PARTY_GREET_LINES = {
  "{title}好，求切位面进队啦，多谢帮忙！",
  "{title}，麻烦你了，挂一下线谢啦！",
  "嗨{title}，互助切位面，谢谢邀请！",
  "{title}大大好，进队了，辛苦！",
  "老板{title}，求切位面成功进队，谢了！",
  "{title}侠士，叨扰了，多谢仗义！",
  "{title}，进来啦，先谢为敬！",
  "有劳{title}，挂个队，马上不打扰！",
  "{title}好呀，求切位面挂线，感谢！",
  "{title}，你人真好，进队谢了！",
  "打扰{title}了，互助一把，谢谢！",
  "{title}大哥，进队了，麻烦照看下！",
  "{title}，求切位面蹭一下，谢啦！",
  "幸会{title}，互助切面，感恩！",
  "{title}贵人，进队咯，多谢拉一把！",
  "{title}，来了来了，先当一次复读机谢你！",
  "嘿{title}，求切位面进队，你是大好人！",
  "{title}老板好，挂线不闹腾，谢！",
  "{title}，叨扰片刻，感谢相助！",
  "进队啦{title}，互助走起，谢谢！",
  "{title}大大，求切位面挂上了，感恩！",
  "{title}，辛苦点帮助，我进来了！",
  "谢{title}邀请，求切位面进队报到！",
  "{title}侠，进队了，你莫嫌烦哈！",
  "{title}，互助切位面，人美心善！",
  "好的{title}，我进来了，先谢！",
  "{title}大佬，求切位面蹭队，谢谢照顾！",
  "{title}，有你真好，进队感谢！",
  "来了{title}，挂一下就走，谢啦！",
  "{title}恩人，进队了，叨扰短时！",
  "{title}好，求切位面队报到，感谢仗义！",
  "麻烦{title}几分钟，互助谢了！",
  "{title}，进组成功，先鞠一躬（字面）！",
  "哇{title}，秒邀啊，进队谢了！",
  "{title}神仙，求切位面进队，沾沾欧气！",
  "{title}，我是来求切位面的，进来谢帮忙！",
  "报到{title}，互助挂线，多谢多谢！",
  "{title}兄弟，进队了，谢你出手！",
  "{title}姐，进队啦，谢谢帮助！",
  "{title}，短挂一下，感激不尽！",
  "求切位面进队：{title}好，感谢！",
  "{title}大神，蹭个队，先谢为敬！",
  "{title}，互助插件牵线，幸会谢邀！",
  "进了进了，{title}辛苦，谢！",
  "{title}好汉，求切位面挂上，谢你仗义！",
  "{title}，我不抢怪不吵麦，只谢你！",
  "嗨呀{title}，进来了，感谢拉我！",
  "{title}及时雨，进队谢救命之恩！",
  "{title}，求切位面队打卡，谢谢老板！",
  "挂线中，{title}好，先谢过！",
  "{title}活菩萨，进队了，感恩！",
  "{title}，互助一切，进队报喜（报谢）！",
  "嘿咻，进队成功，谢{title}！",
  "{title}靠谱，进来了，麻烦你了！",
  "{title}，我安静挂机感，谢帮忙！",
  "求切位面抵达，{title}好，多谢！",
  "{title}大好人，进队先谢三连！",
  "{title}，队伍见，感谢相助！",
  "进队打卡：谢{title}的帮助！",
  "{title}，叨扰你的位面，先谢！",
}

-- 即将离队前的感谢话术（谢的是「帮忙」，不绑切成不成功）
H.PARTY_THANKS_LINES = {
  "{title}，谢了，我先离队，互助万岁！",
  "感谢{title}仗义，先走一步！",
  "{title}，帮忙辛苦了，拜了个拜！",
  "谢{title}，叨扰结束，我溜了！",
  "{title}大大，感谢帮助，后会有期！",
  "有劳{title}，谢谢，我离队啦！",
  "{title}，互助谢过，祝你刀刀暴击！",
  "谢老板{title}，我撤了，好人平安！",
  "{title}侠士，感恩，先离不打扰！",
  "{title}，帮大忙了，谢谢谢谢！",
  "走了走了，{title}辛苦，谢啦！",
  "{title}贵人，感谢拉一把，拜拜！",
  "谢{title}邀请帮忙，我先溜！",
  "{title}，叨扰完毕，感谢相助！",
  "互助切面谢{title}，我离队了！",
  "{title}大佬，谢了，祝你欧气满满！",
  "{title}，你人真好，感谢，先走！",
  "拜了{title}，谢谢帮助，下回见！",
  "{title}恩人，谢过，我不打扰了！",
  "{title}，辛苦点帮助，我撤啦！",
  "感谢{title}，位面互助走起，溜！",
  "{title}神仙，谢了，祝你天天发财！",
  "{title}，帮忙记心里，先离队！",
  "谢了哈{title}，我先走，保重！",
  "{title}大哥，感谢，离队不送（我自己走）！",
  "{title}，仗义相助谢了，拜拜！",
  "先走一步，{title}谢谢你！",
  "{title}好汉，互助谢过，我撤！",
  "{title}，短挂结束，感谢全程！",
  "离队前复读：谢{title}！",
  "{title}大神，感谢出手，后会有期！",
  "{title}，帮了就是帮了，谢谢，走了！",
  "谢{title}热心，我离队去了！",
  "{title}及时雨，感恩，拜！",
  "{title}，叨扰结束，祝你爆率拉满！",
  "走啦{title}，谢谢你的帮助！",
  "{title}活菩萨，谢了，我溜！",
  "{title}，互助人情记一笔，先离！",
  "感谢{title}老板，离队告辞！",
  "{title}，谢邀请谢帮助，拜拜！",
  "我撤了，{title}辛苦，感谢！",
  "{title}兄弟，谢了，下次互助见！",
  "{title}姐，谢谢帮助，我先走！",
  "{title}，帮忙不小，离队致谢！",
  "谢过{title}，位面见（或许再见）！",
  "{title}靠谱人，感谢，溜了！",
  "{title}，祝你万事顺意，我离队！",
  "离队谢{title}：好人一生平安！",
  "{title}大好人，感谢，先走一步！",
  "{title}，这次互助谢你，拜拜！",
  "叨扰到此，谢{title}，我走了！",
  "{title}，感谢挂队，离队不扰！",
  "谢了{title}，插件牵线人也暖！",
  "{title}，帮一把就是情，谢，撤！",
  "先溜为敬，{title}谢谢你！",
  "{title}，感谢你点帮助，离队啦！",
  "拜谢{title}，我离队，祝你开心！",
  "{title}，互助完毕致谢，走起！",
  "谢谢{title}的时间，我离队了！",
  "{title}，再谢一句：多谢帮忙！",
}

function H:PickThanksBlessing()
  local list = self.THANKS_BLESSINGS
  if not list or #list == 0 then
    return "祝你天天发财"
  end
  return list[math.random(1, #list)]
end

-- 大池随机：尽量避开最近用过的若干条，减少复读感
function H:PickFromPool(list, recentKey, avoidN)
  if not list or #list == 0 then
    return nil
  end
  avoidN = math.min(avoidN or 12, math.max(0, #list - 1))
  self._pickRecent = self._pickRecent or {}
  local recent = self._pickRecent[recentKey]
  if type(recent) ~= "table" then
    recent = {}
    self._pickRecent[recentKey] = recent
  end
  local banned = {}
  for i = 1, #recent do
    banned[recent[i]] = true
  end
  local candidates = {}
  for i = 1, #list do
    if not banned[i] then
      candidates[#candidates + 1] = i
    end
  end
  if #candidates == 0 then
    for i = 1, #list do
      candidates[i] = i
    end
  end
  local idx = candidates[math.random(1, #candidates)]
  recent[#recent + 1] = idx
  while #recent > avoidN do
    table.remove(recent, 1)
  end
  return list[idx], idx
end

function H:NormalizeClassFile(classFile)
  if type(classFile) ~= "string" or classFile == "" then
    return "UNKNOWN"
  end
  classFile = string.upper(classFile)
  if self.PARTY_TITLES[classFile] then
    return classFile
  end
  return "UNKNOWN"
end

function H:PickClassTitle(classFile)
  classFile = self:NormalizeClassFile(classFile)
  local list = self.PARTY_TITLES[classFile] or self.PARTY_TITLES.UNKNOWN
  local title = self:PickFromPool(list, "title:" .. classFile, 10)
  if not title or title == "" then
    title = "老板"
  end
  return title
end

function H:FillPartyTemplate(tpl, title)
  if not tpl then
    return ""
  end
  title = title or "老板"
  return (tostring(tpl):gsub("{title}", title))
end

function H:PickPartyGreetLine(classFile)
  local title = self:PickClassTitle(classFile)
  local tpl = self:PickFromPool(self.PARTY_GREET_LINES, "greet", 16)
  if not tpl then
    tpl = "{title}好，求切位面进队啦，多谢帮忙！"
  end
  return self:FillPartyTemplate(tpl, title), title
end

function H:PickPartyThanksLine(classFile)
  local title = self:PickClassTitle(classFile)
  local tpl = self:PickFromPool(self.PARTY_THANKS_LINES, "thanks", 16)
  if not tpl then
    tpl = "{title}，谢了，我先离队，互助万岁！"
  end
  return self:FillPartyTemplate(tpl, title), title
end

function H:FindGeneralChannelId()
  local prefer = {
    ["综合"] = 1,
    ["General"] = 2,
    ["一般"] = 3,
  }
  local function blocked(id)
    if self.IsOurDiscoveryChannel and self:IsOurDiscoveryChannel(id) then
      return true
    end
    if self.IsMutedMeshChannel and self:IsMutedMeshChannel(id) then
      return true
    end
    return false
  end
  local function rankOf(name)
    if type(name) ~= "string" then
      return nil
    end
    local rank = prefer[name]
    if not rank and (name:find("综合", 1, true) or name:lower():find("general", 1, true) or name:find("一般", 1, true)) then
      rank = 4
    end
    return rank
  end
  local bestId, bestRank
  if GetChannelList then
    local list = { GetChannelList() }
    for i = 1, #list do
      local id = list[i]
      local name = list[i + 1]
      local rank = type(id) == "number" and rankOf(name) or nil
      if rank and id > 0 and not blocked(id) and (not bestRank or rank < bestRank) then
        bestId, bestRank = id, rank
      end
    end
  end
  if bestId then
    return bestId
  end
  for _, name in ipairs({ "综合", "General", "一般" }) do
    local id = GetChannelName(name)
    if type(id) == "number" and id > 0 and not blocked(id) then
      return id
    end
  end
  return nil
end

function H:EnsureGeneralClickFlush()
  if self._generalClickHooked or not WorldFrame or not WorldFrame.HookScript then
    return
  end
  self._generalClickHooked = true
  WorldFrame:HookScript("OnMouseDown", function()
    if not H._pendingGeneral then
      return
    end
    if H.RunPlayerClick then
      H:RunPlayerClick(function()
        H:FlushPendingGeneralChat()
      end)
    end
  end)
end

function H:FlushPendingGeneralChat()
  self._pendingGeneral = nil
end

function H:SendGeneralChat()
  -- 2026-11-06：切成功不再往综合发言。
  self._pendingGeneral = nil
  return false
end

function H:SendPartyChat(msg)
  if not msg or msg == "" then
    return false
  end
  if not IsInGroup() then
    return false
  end
  -- 小队用 PARTY；若误进团队则走 RAID（求切场景几乎总是小队）
  local chatType = "PARTY"
  if IsInRaid and IsInRaid() then
    chatType = "RAID"
  end
  local ok = pcall(function()
    SendChatMessage(msg, chatType)
  end)
  return ok and true or false
end

function H:PartyChatEnabled()
  if not self.db then
    return true
  end
  if self.db.partyChat == false then
    return false
  end
  return true
end

-- 在队伍单位里定位帮助方，读取职业（英文 classFile）
function H:FindGroupUnitForPlayer(fullName)
  if not fullName or not IsInGroup() then
    return nil
  end
  local function unitMatches(unit)
    local uname = self:GetUnitCharacterName(unit)
    if not uname then
      return false
    end
    if self:IsSamePlayer(uname, fullName) then
      return true
    end
    local peer = self.db and self.db.peers and self.db.peers[self:ResolvePeerKey(fullName) or ""]
    if peer and peer.replyAs and self:IsSamePlayer(uname, peer.replyAs) then
      return true
    end
    local reply = self:WhisperTarget(fullName)
    if reply and self:IsSamePlayer(uname, reply) then
      return true
    end
    return false
  end
  if IsInRaid and IsInRaid() then
    local n = GetNumGroupMembers() or 0
    for i = 1, n do
      if unitMatches("raid" .. i) then
        return "raid" .. i
      end
    end
  else
    for i = 1, 4 do
      local unit = "party" .. i
      if unitMatches(unit) then
        return unit
      end
    end
  end
  return nil
end

function H:GetHelperClassFile(helperName)
  local unit = self:FindGroupUnitForPlayer(helperName)
  if unit then
    local _, classFile = UnitClass(unit)
    return self:NormalizeClassFile(classFile)
  end
  return "UNKNOWN"
end

function H:ClearPartyHopSession()
  self._partyHop = nil
end

-- 求切进队后开启会话：无论位面是否切成功，都问候、离队前都感谢
function H:BeginPartyHopSession(helperName, matched)
  if not helperName then
    self:ClearPartyHopSession()
    return
  end
  local classFile = self:GetHelperClassFile(helperName)
  self._partyHop = {
    helperName = helperName,
    classFile = classFile,
    matched = matched and true or false,
    greeted = false,
    thanked = false,
    at = self:Now(),
  }
end

function H:AnnouncePartyGreet()
  local sess = self._partyHop
  if not sess or sess.greeted then
    return false
  end
  if not self:PartyChatEnabled() then
    sess.greeted = true
    return false
  end
  if not IsInGroup() then
    return false
  end
  -- 进队对象对不上则不问候（避免对错人）
  if sess.helperName and not self:GroupHasPlayer(sess.helperName) then
    return false
  end
  -- 刷新职业（刚进队时有时需等一拍）
  sess.classFile = self:GetHelperClassFile(sess.helperName)
  local msg = self:PickPartyGreetLine(sess.classFile)
  if self:SendPartyChat(msg) then
    sess.greeted = true
    return true
  end
  return false
end

function H:AnnouncePartyThanksBeforeLeave()
  local sess = self._partyHop
  if not sess or sess.thanked then
    return false
  end
  if not self:PartyChatEnabled() then
    sess.thanked = true
    return false
  end
  if not IsInGroup() then
    return false
  end
  if sess.helperName and not self:GroupHasPlayer(sess.helperName) then
    -- 队里已经不是帮助方：仍发一句通用感谢（谢的是这段互助）
  end
  sess.classFile = self:GetHelperClassFile(sess.helperName) or sess.classFile
  local msg = self:PickPartyThanksLine(sess.classFile)
  if self:SendPartyChat(msg) then
    sess.thanked = true
    return true
  end
  return false
end

-- 综合线：仅当前角色当天第一次切面成功才发可见致谢（与互助频「绝对不发言」分开）
function H:AnnounceHopThanks(helperName, targetRaw)
  targetRaw = tonumber(targetRaw)
  if not targetRaw or not self.db then
    return
  end
  local today = date("%Y-%m-%d")
  local char = self:CharBag()
  if char and char.thanksDay == today then
    return
  end
  if (not char) and self.db.thanksDay == today then
    return
  end
  local key = tostring(targetRaw) .. "|" .. tostring(helperName or "")
  if self._thanksKey == key and (self:Now() - (self._thanksAt or 0)) < 30 then
    return
  end
  self._thanksKey = key
  self._thanksAt = self:Now()

  local who = self:ShortName(helperName)
  if not who or who == "" or who == "?" then
    who = "侠士"
  end
  local num = self:LabelNum(targetRaw)
  local bless = self:PickThanksBlessing()
  local msg = string.format(
    "[互助切位面]感谢 %s 让我成功切换到了位面 #%s，%s",
    who,
    tostring(num),
    bless
  )
  if self:SendGeneralChat(msg) then
    if char then
      char.thanksDay = today
    else
      self.db.thanksDay = today
    end
  end
end

function H:ShouldThanksBeforeLeave()
  if not self.anchoredHop then
    return false
  end
  local sess = self._partyHop
  if not sess or sess.thanked then
    return false
  end
  if not IsInGroup() then
    return false
  end
  return true
end

-- 先发队聊感谢，再真正离队（拦截系统离队入口）
-- which: "plain"=LeaveParty / "c"=C_PartyInfo.LeaveParty / nil=自动挑可用的
function H:LeavePartyAfterThanks(which)
  if self._leaveThanksPending then
    return
  end
  local function rawLeave()
    if which == "c" and self._origCLeaveParty then
      self._origCLeaveParty()
    elseif which == "plain" and self._origLeaveParty then
      self._origLeaveParty()
    elseif self._origCLeaveParty then
      self._origCLeaveParty()
    elseif self._origLeaveParty then
      self._origLeaveParty()
    elseif C_PartyInfo and C_PartyInfo.LeaveParty then
      C_PartyInfo.LeaveParty()
    elseif LeaveParty then
      -- 已被我们替换时不要递归；无 orig 则尽力
      if self._origLeaveParty then
        self._origLeaveParty()
      end
    end
  end
  local function doLeave()
    self._leaveThanksPending = false
    self.anchoredHop = false
    if self._partyHop then
      self._partyHop.thanked = true
    end
    pcall(rawLeave)
  end
  if self:ShouldThanksBeforeLeave() then
    self._leaveThanksPending = true
    self:AnnouncePartyThanksBeforeLeave()
    C_Timer.After(0.45, doLeave)
    return
  end
  doLeave()
end

function H:HookLeavePartyForThanks()
  if self._leaveHooked then
    return
  end
  self._leaveHooked = true

  if type(LeaveParty) == "function" and not self._origLeaveParty then
    self._origLeaveParty = LeaveParty
    LeaveParty = function(...)
      if H:ShouldThanksBeforeLeave() then
        H:LeavePartyAfterThanks("plain")
        return
      end
      return H._origLeaveParty(...)
    end
  end

  if C_PartyInfo and type(C_PartyInfo.LeaveParty) == "function" and not self._origCLeaveParty then
    self._origCLeaveParty = C_PartyInfo.LeaveParty
    C_PartyInfo.LeaveParty = function(...)
      if H:ShouldThanksBeforeLeave() then
        H:LeavePartyAfterThanks("c")
        return
      end
      return H._origCLeaveParty(...)
    end
  end
end

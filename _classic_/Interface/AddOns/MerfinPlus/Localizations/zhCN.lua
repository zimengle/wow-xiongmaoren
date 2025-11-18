-- enUS.lua (load first)
Merfin = Merfin or {}
Merfin.Localizations = Merfin.Localizations or {}

Merfin.Localizations.zhCN = {

  -- Dummy Auras
  ['BIG BANG'] = '大爆炸',
  ['BIG BANG INC.'] = '即将大爆炸',
  ['DEPORTATION ON %s'] = '驱逐 %s',
  ['%s Huge Tariffs » %s %s'] = '%s 巨额罚款 » %s %s',
  ['Dummy Bar'] = '测试计时条',
  ['Regular Cooldown Bar'] = '常规冷却条',
  ['Special #1 Cooldown Bar'] = '特殊#1冷却条',
  ['Special #2 Cooldown Bar'] = '特殊#2冷却条',
  ['Special #3 Cooldown Bar'] = '特殊#3冷却条',
  ['Special #4 Cooldown Bar'] = '特殊#4冷却条',
  ['Emphasized Cooldown Bar'] = '高亮冷却条',
  ['Ready'] = '准备', -- Cooldown

  -- Default replicas
  -- e.g. "Crush Soon" or "Blade Tempest Soon", %s is the mechanic name
  -- You can change the placement of %s if it's more convenient in your language
  ['%s soon'] = '即将 %s ',
  ['GTFO'] = '@cffff8b17走开@r [%s]',
  ['%s Removed'] = '%s 移除', -- f.e. "Shield removed" on Lei Shi

  -- Flow / Timing
  ['AOE Soon'] = '准备AOE',
  ['Adds Incoming'] = '小怪刷新',
  ['Boss Arrival'] = 'BOSS刷新',
  ['Flight'] = '飞行',
  ['INC.'] = '即将到来',
  ['Phase'] = '阶段',
  ['Phase 1'] = '1阶段',
  ['Phase 2'] = '2阶段',
  ['Phase 3'] = '3阶段',
  ['Phase 4'] = '4阶段',
  ['Platform'] = '平台',
  ['Platform 2'] = '2平台',
  ['Platform 3'] = '3平台',
  ['Debuffs Soon'] = '准备Debuffs',

  -- Movement
  ['Behind'] = '背后',
  ['Dodge'] = '回避',
  ['Dodge to Left'] = '向左回避',
  ['Dodge to Right'] = '向右回避',
  ['Forward'] = '向前',
  ['Frontal'] = '头前',
  ['Hide'] = '躲藏',
  ['Inside'] = '进场',
  ['Left'] = '左',
  ['Move'] = '移动',
  ['Move Out'] = '跑开',
  ['Out'] = '出',
  ['Right'] = '右',
  ['Back'] = 'Back',
  ['Spread Out'] = '分散',
  ['Stack'] = '分摊',
  ['Stack On Me'] = '找我分摊',
  ['Stay Away'] = '远离人群',
  ['Prepare to Dodge'] = '准备躲避',

  -- Actions
  ['Auto-Attack'] = '自动攻击',
  ['Be Aware'] = '注意',
  ['Focus Target'] = '焦点目标',
  ['Interrupt Now'] = '现在打断',
  ['Prepare to stack'] = '准备分摊',
  ['Soak the Cast'] = '分摊法术',
  ['Stop Attack'] = '停止攻击',
  ['Stop Attack Soon'] = '即将停止攻击',
  ['Swap In'] = '换入',
  ['Swap Out'] = '换出',
  ['Switch Target'] = '切换目标',
  ['Switch Targets'] = '切换目标',
  ['Take the Add'] = '接小怪',
  ['Target'] = '目标',
  ['You are next'] = '下一个是你',
  ['Put Pet on %s Passive'] = '将宠物 %s 设置被动',
  ['Burst the boss'] = '正面',

  -- Player Status (Debuffs)
  ['DoT'] = 'DoT',
  ['Feared'] = '恐惧',
  ['Fixated'] = '被锁定',
  ['Silenced'] = '沉默',
  ['Stunned'] = '眩晕',
  ['Targetted'] = '目标是你',
  ['Trapped'] = '被困',

  -- Buffs / Utility
  ['Mana Regen'] = '回蓝',
  ['Move Speed'] = '移速',
  ['Protected'] = '保护',
  ['Reflect'] = '反射',

  -- Damage / Healing / Output
  ['AOE'] = 'AOE',
  ['Boss Dmg'] = 'Boss 伤害',
  ['Damage'] = '伤害',
  ['Damage Done'] = '伤害输出',
  ['Dmg Done'] = '伤害输出',
  ['Dmg Tkn'] = '承伤',
  ['Dmg/Heal'] = '伤害/治疗',
  ['Heal Tkn'] = '受到治疗',
  ['Heal to Full'] = '奶满',
  ['Healing Done'] = '治疗量',

  -- Entities
  ['Add'] = '小怪',
  ['Adds'] = '小怪群',
  ['Entrance'] = '入口',

  -- MSV: Trash
  ['Doors will be broken down'] = '打破大门(战斗开场)',
  ['Frontal & Knockback'] = '头前与击退',
  ['Mobs active - East |cffffff80(1/4)|r'] = '大怪激活-东 |cffffff80(1/4)|r',
  ['Mobs active - North |cffffff80(3/4)|r'] = '大怪激活-北 |cffffff80(3/4)|r',
  ['Mobs active - South |cffffff80(4/4)|r'] = '大怪激活-南|cffffff80(4/4)|r',
  ['Mobs active - West |cffffff80(2/4)|r'] = '大怪激活-西 |cffffff80(2/4)|r',

  -- MSV: The Stone Guard
  ['Amethyst'] = '紫晶',
  ['Cobalt'] = '蓝晶',
  ['Jade'] = '青玉',
  ['Jasper'] = '红玉',
  ['Linked with %s'] = '与 %s 连线',
  ['Neutralize Traps'] = '接触陷阱',
  ['Overload Soon'] = '即将过载',
  ['Painters Leaderboard'] = '搬砖排行榜',
  ['SNAP'] = '拉断',
  ['Snap the chains'] = '挣脱锁链',

  -- MSV: Feng
  ['Arcane Phase'] = '奥术(杖)阶段',
  ['Barrier'] = '屏障',
  ['DEBUFFS INC.'] = '即将debuff.',
  ['Flame Phase'] = '火焰(拳)阶段',
  ['Lightning Phase'] = '闪电(矛)阶段',
  ['Shadow Phase'] = '暗影(盾)阶段',
  ['Shroud'] = '反射罩',

  -- MSV: Gara'jal
  ['Shadowy Attack'] = '暗影攻击',
  ['Adds Count'] = '小怪计数',
  ['Kill Severers'] = '击杀灵魂撕裂者(大怪)', -- https://www.wowhead.com/mop-classic/spell=116278/soul-sever
  ['Shared Damage'] = '复制伤害', -- https://www.wowhead.com/mop-classic/spell=122151/voodoo-doll
  ['Stats'] = '属性',                 -- https://www.wowhead.com/mop-classic/spell=117549/spiritual-innervation

  -- MSV: The Spirit Kings
  ['Kite Skull'] = '风筝骷髅',
  ['Pinned'] = '被钉住', -- https://www.wowhead.com/mop-classic/spell=118135/pinned-down

  -- Elegon
  ['Cant Soak'] = '不能分摊', -- https://www.wowhead.com/mop-classic/spell=132226/destabilized
  ['Focus Charges'] = '注意充能', -- Energy Charges
  ['Falling Floor'] = '地板崩塌',
  ['Gossip Available'] = '对话可用',
  ['YOURE NEXT TO SOAK'] = '你是下一个分摊',

  -- Will of Emperor
  ['Prepare to Root'] = '准备定身（缠绕）',
  ['Building Up'] = '能量积聚（平砍阶段）', -- Energy goes to full
  ['Courage'] = '勇气',
  ['Dodge Combo'] = '跳舞阶段',
  ['Jan-xi'] = '剑曦',
  ['Qin-xi'] = '秦希',
  ['Rage'] = '狂怒',
  ['Strength'] = '力量',
  ['Bonus Attack'] = '额外攻击',

  -- HoF: Trash
  ['Extended CDs'] = '延长技能CD', -- Last Boss Room https://www.wowhead.com/spell=125907/cry-havoc

  -- HoF: Zor'lok
  ['Echo'] = '回响分身', -- Boss Clone Name without postfix
  ['Melee Boss'] = '近战boss', -- https://www.wowhead.com/mop-classic/spell=132236/song-of-the-empress
  ['Mind Control'] = '心控', -- https://www.wowhead.com/spell=122740/convert
  ['Mind Control Soon'] = '即将心控', -- https://www.wowhead.com/spell=122740/convert
  ['Prepare to hide'] = '准备躲藏', -- https://www.wowhead.com/spell=122713/force-and-verve
  ['Sonic Rings Soon'] = '即将音波', -- https://www.wowhead.com/spell=127834/attenuation

  -- HoF: Tayak
  ['Gone with the Wind'] = '风暴释放', -- Start of Phase 2, when you're getting carried by Winds

  -- HoF: Garalon
  ['Catch Pheromones'] = '接信息素',

  -- HoF: Mel'jarak
  ['Adds Respawn Soon'] = '小怪即将重生',
  ['Cant Hit Prisons'] = '无法攻击监牢', -- https://www.wowhead.com/mop-classic/spell=122055/residue
  ['Dodge Blade'] = '躲回旋之刃', -- https://www.wowhead.com/spell=91294/whirling-blade
  ['Right Click Me'] = '右键点我', -- https://www.wowhead.com/mop-classic/spell=121885/amber-prison

  -- HoF: Unsok
  ['Cross Globules'] = '合并宝珠', -- https://www.wowhead.com/mop-classic/spell=125502/amber-beacon
  ['Press %d'] = '按 %d', -- Press 1, Press 2 etc.
  ['Player Explosion'] = '玩家炸团', -- Explosion in Monstrocity

  -- HoF: Shekzeer
  ['Buff Players'] = '增益玩家', -- https://www.wowhead.com/mop-classic/spell=124821/poison-drenched-armor
  ['Come Get The Buff'] = '来拿增益', -- https://www.wowhead.com/mop-classic/spell=124821/poison-drenched-armor
  ['Combine Resins'] = '聚集树脂', -- https://www.wowhead.com/mop-classic/spell=124097/sticky-resin
  ['Explosion Soon'] = '即将爆炸', -- Dissonance Field @ 10% health
  ['Get Buff On Tank'] = '靠近坦克获得增益', -- https://www.wowhead.com/mop-classic/spell=124827/poison-fumes
  ['Fears Soon'] = '即将恐惧',

  -- ToES: Protectors
  ['Your Group: Swap in'] = '你的队伍：换入',
  ['Your Group: Swap Out'] = '你的队伍：换出',

  -- ToES: Tsulong
  ['YOURE NEXT TO TAKE |cffffff40LIGHT|r'] = '你下一个接 |cffffff40光|r', -- https://www.wowhead.com/mop-classic/spell=123716/the-light-of-day
  ['Drop Stacks'] = '消除层数',

  -- ToES: Lei Shi
  ['Special Ability'] = '特殊技能',

  -- ToES: Sha of Fear
  ['Forms a Wall'] = '形成光墙', -- https://www.wowhead.com/mop-classic/spell=117866/champion-of-the-light
  ['Left Platform'] = '左侧平台',
  ['Middle Platform'] = '中间平台',
  ['Move to %d'] = '移动到 %d',
  ['Right Platform'] = '右侧平台',
  ['Start in %d'] = '起始于 %d', -- Position on Sha Sector Helper
  ['Random Ability (1 of 3)'] = 'R随机技能 (3选1)',
}
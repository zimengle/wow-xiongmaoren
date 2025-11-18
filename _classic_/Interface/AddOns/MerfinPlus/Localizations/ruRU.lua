-- enUS.lua (load first)
Merfin = Merfin or {}
Merfin.Localizations = Merfin.Localizations or {}

Merfin.Localizations.ruRU = { 

  -- Dummy Auras
  ['BIG BANG'] = 'БОЛЬШОЙ ВЗРЫВ',
  ['BIG BANG INC.'] = 'СКОРО БОЛЬШОЙ ВЗРЫВ',
  ['DEPORTATION ON %s'] = 'ДЕПОРТАЦИЯ НА %s',
  ['%s Huge Tariffs » %s %s'] = '%s Пакет Санкций » %s %s',
  ['Dummy Bar'] = 'Тестовый Бар',
  ['Regular Cooldown Bar'] = 'Обычный Кулдаун',
  ['Special #1 Cooldown Bar'] = 'Специальный #1 Кулдаун',
  ['Special #2 Cooldown Bar'] = 'Специальный #2 Кулдаун',
  ['Special #3 Cooldown Bar'] = 'Специальный #3 Кулдаун',
  ['Special #4 Cooldown Bar'] = 'Специальный #4 Кулдаун',
  ['Emphasized Cooldown Bar'] = 'Увеличенный Кулдаун',
  ['Ready'] = 'Ready', -- Cooldown

  -- Default replicas
  -- e.g. "Crush Soon" or "Blade Tempest Soon", %s is the mechanic name
  -- You can change the placement of %s if it's more convenient in your language
  ['%s soon'] = '%s скоро',
  ['GTFO'] = '@cffff8b17ВЫЙДИ@r [%s]',
  ['%s Removed'] = '%s снят', -- f.e. "Shield removed" on Lei Shi

  -- Flow / Timing
  ['AOE Soon'] = 'Скоро АоЕ',
  ['Adds Incoming'] = 'Скоро адды',
  ['Boss Arrival'] = 'Появление босса',
  ['Flight'] = 'Полёт',
  ['INC.'] = 'СКОРО',
  ['Phase'] = 'Фаза',
  ['Phase 1'] = 'Фаза 1',
  ['Phase 2'] = 'Фаза 2',
  ['Phase 3'] = 'Фаза 3',
  ['Phase 4'] = 'Фаза 4',
  ['Platform'] = 'Платформа',
  ['Debuffs Soon'] = 'Скоро Дебаффы',

  -- Movement
  ['Behind'] = 'Назад',
  ['Dodge'] = 'Увернись',
  ['Dodge to Left'] = 'Доджи влево',
  ['Dodge to Right'] = 'Доджи вправо',
  ['Forward'] = 'Вперед',
  ['Frontal'] = 'Фронтальная атака',
  ['Hide'] = 'Спрячься',
  ['Inside'] = 'Внутрь',
  ['Left'] = 'Лево',
  ['Back'] = 'Назад',
  ['Move'] = 'Двигайся',
  ['Move Out'] = 'Выбеги',
  ['Out'] = 'Выбеги',
  ['Right'] = 'Право',
  ['Spread Out'] = 'Разойдись',
  ['Stack'] = 'Застакайся',
  ['Stack On Me'] = 'Застакайтесь на мне',
  ['Stay Away'] = 'Держись подальше',
  ['Prepare to Dodge'] = 'Prepare to Dodge',

  -- Actions
  ['Auto-Attack'] = 'Автоатака',
  ['Be Aware'] = 'Будь внимательен',
  ['Focus Target'] = 'Фокус-цель',
  ['Interrupt Now'] = 'Прерви сейчас',
  ['Prepare to stack'] = 'Будь готов застакаться',
  ['Soak the Cast'] = 'Прими на себя заклинание',
  ['Stop Attack'] = 'Прекрати атаку',
  ['Stop Attack Soon'] = 'Прекрати атаку скоро',
  ['Swap In'] = 'Заходи',
  ['Swap Out'] = 'Выходи',
  ['Switch Target'] = 'Смени цель',
  ['Switch Targets'] = 'Смени цель',
  ['Take the Add'] = 'Заберите адда',
  ['Target'] = 'Цель',
  ['You are next'] = 'Ты следующий',
  ['Put Pet on %s Passive'] = 'Поставь Пета на %s Пассивный',
  ['Burst the boss'] = 'Бурсти босса',

  -- Player Status (Debuffs)
  ['DoT'] = 'ДОТ',
  ['Feared'] = 'Страх',
  ['Fixated'] = 'Фиксирован',
  ['Silenced'] = 'Немота',
  ['Stunned'] = 'Оглушен',
  ['Targetted'] = 'Преследует',
  ['Trapped'] = 'В ловушке',

  -- Buffs / Utility
  ['Mana Regen'] = '+Мана Реген',
  ['Move Speed'] = '-Мувспид',
  ['Protected'] = 'Защищён',
  ['Reflect'] = 'Отражение',

  -- Damage / Healing / Output
  ['AOE'] = 'АОЕ',
  ['Boss Dmg'] = 'Урон боссу',
  ['Damage'] = 'Урон',
  ['Damage Done'] = 'Урон',
  ['Dmg Done'] = 'Урон',
  ['Dmg Tkn'] = 'Получ. урон',
  ['Dmg/Heal'] = 'Урон/Исц.',
  ['Heal Tkn'] = '-Хил',
  ['Heal to Full'] = 'Исцелись на фулл',
  ['Healing Done'] = 'Исцеление',

  -- Entities
  ['Add'] = 'Адд',
  ['Adds'] = 'Адды',
  ['Entrance'] = 'Вход',

  -- MSV: Trash
  ['Doors will be broken down'] = 'Двери будут проломлены',
  ['Frontal & Knockback'] = 'Фронтал + отбрасывание',
  ['Mobs active - East |cffffff80(1/4)|r'] = 'Активные мобы — Восток |cffffff80(1/4)|r',
  ['Mobs active - North |cffffff80(3/4)|r'] = 'Активные мобы — Север |cffffff80(3/4)|r',
  ['Mobs active - South |cffffff80(4/4)|r'] = 'Активные мобы — Юг |cffffff80(4/4)|r',
  ['Mobs active - West |cffffff80(2/4)|r'] = 'Активные мобы — Запад |cffffff80(2/4)|r',

  -- MSV: The Stone Guard
  ['Amethyst'] = 'Аметист',
  ['Cobalt'] = 'Кобальт',
  ['Jade'] = 'Нефрит',
  ['Jasper'] = 'Яшма',
  ['Linked with %s'] = 'Связан с %s',
  ['Neutralize Traps'] = 'Обезвредьте ловушки',
  ['Overload Soon'] = 'Скоро перегрузка',
  ['Painters Leaderboard'] = 'Таблица маляров',
  ['SNAP'] = 'СЛОМАТЬ',
  ['Snap the chains'] = 'Сломайте цепи',

  -- MSV: Feng
  ['Arcane Phase'] = 'Фаза тайной магии',
  ['Barrier'] = 'Щит',
  ['DEBUFFS INC.'] = 'ДЕБАФЫ СКОРО',
  ['Flame Phase'] = 'Огненная фаза',
  ['Lightning Phase'] = 'Фаза молний',
  ['Shadow Phase'] = 'Теневая фаза',
  ['Shroud'] = 'Покров',

  -- MSV: Gara'jal
  ['Shadowy Attack'] = 'Теневая атака',
  ['Adds Count'] = 'Счётчик аддов',
  ['Kill Severers'] = 'Убейте терзателей',  -- https://www.wowhead.com/mop-classic/spell=116278/soul-sever
  ['Shared Damage'] = 'Раздел. урон',       -- https://www.wowhead.com/mop-classic/spell=122151/voodoo-doll
  ['Stats'] = 'Статы',                      -- https://www.wowhead.com/mop-classic/spell=117549/spiritual-innervation

  -- MSV: The Spirit Kings
  ['Kite Skull'] = 'Кайти Череп',
  ['Pinned'] = 'Пригвож.',

  -- Elegon
  ['Cant Soak'] = 'Нельзя впитывать', -- https://www.wowhead.com/mop-classic/spell=132226/destabilized
  ['Focus Charges'] = 'Фокус по зарядам', -- Energy Charges
  ['Falling Floor'] = 'Пол пропадет',
  ['Gossip Available'] = 'Доступен диалог',
  ['YOURE NEXT TO SOAK'] = 'ТЫ СЛЕДУЮЩИЙ ВПИТЫВАТЬ',

  -- Will of Emperor
  ['Prepare to Root'] = 'Будь Готов Рутать',
  ['Building Up'] = 'Нарастание',
  ['Courage'] = 'Смелость',
  ['Dodge Combo'] = 'Танцуй',
  ['Jan-xi'] = 'Янь-си',
  ['Qin-xi'] = 'Цинь-си',
  ['Rage'] = 'Ярость',
  ['Strength'] = 'Сила',
  ['Bonus Attack'] = 'Бонус атака',

  -- HoF: Trash
  ['Extended CDs'] = 'Продлённые КД', -- Last Boss Room https://www.wowhead.com/spell=125907/cry-havoc

  -- HoF: Zor'lok
  ['Echo'] = 'Эхо', -- Boss Clone Name without postfix
  ['Melee Boss'] = 'Босс в ближнем бою', -- https://www.wowhead.com/mop-classic/spell=132236/song-of-the-empress
  ['Mind Control'] = 'Скоро Контроль Разума', -- https://www.wowhead.com/spell=122740/convert
  ['Mind Control Soon'] = 'Скоро Контроль Разума', -- https://www.wowhead.com/spell=122740/convert
  ['Prepare to hide'] = 'Скоро прятаться', -- https://www.wowhead.com/spell=122713/force-and-verve
  ['Sonic Rings Soon'] = 'Скоро Эхо', -- https://www.wowhead.com/spell=127834/attenuation

  -- HoF: Tayak
  ['Gone with the Wind'] = 'Унесенные Ветром', -- Start of Phase 2, when you're getting carried by Winds

  -- HoF: Garalon
  ['Catch Pheromones'] = 'Поймай Феромоны',

  -- HoF: Mel'jarak
  ['Adds Respawn Soon'] = 'Скоро возрождаются адды',
  ['Cant Hit Prisons'] = 'Не могу ПКМ', -- https://www.wowhead.com/mop-classic/spell=122055/residue
  ['Dodge Blade'] = 'Увернитесь от клинка', -- https://www.wowhead.com/spell=91294/whirling-blade
  ['Right Click Me'] = 'Кликните ПКМ по мне', -- https://www.wowhead.com/mop-classic/spell=121885/amber-prison

  -- HoF: Unsok
  ['Cross Globules'] = 'Сведи Слизней', -- https://www.wowhead.com/mop-classic/spell=125502/amber-beacon
  ['Press %d'] = 'Нажми %d', -- Press 1, Press 2 etc.
  ['Press %s'] = 'Нажми %s', -- Press 'Q', Press 'E' etc. (if AB binds start with string binds)
  ['Player Explosion'] = 'Взрыв Игрока', -- Explosion in Monstrocity

  -- HoF: Shekzeer
  ['Buff Players'] = 'Баффай игроков', -- https://www.wowhead.com/mop-classic/spell=124821/poison-drenched-armor
  ['Come Get The Buff'] = 'Забери бафф', -- https://www.wowhead.com/mop-classic/spell=124821/poison-drenched-armor
  ['Combine Resins'] = 'Соединяй Смолы', -- https://www.wowhead.com/mop-classic/spell=124097/sticky-resin
  ['Explosion Soon'] = 'Скоро взрыв', -- Dissonance Field @ 10% health
  ['Get Buff On Tank'] = 'Возьми бафф у Танка', -- https://www.wowhead.com/mop-classic/spell=124827/poison-fumes
  ['Fears Soon'] = 'Скоро Фиры',

  -- ToES: Protectors
  ['Your Group: Swap in'] = 'Твоя группа: соакай',
  ['Your Group: Swap Out'] = 'Твоя группа: выходи',

  -- ToES: Tsulong
  ['YOURE NEXT TO TAKE |cffffff40LIGHT|r'] = 'ТЫ СЛЕДУЮЩИЙ ВЗЯТЬ |cffffff40СВЕТ|r',-- https://www.wowhead.com/mop-classic/spell=123716/the-light-of-day
  ['Drop Stacks'] = 'Сбрось Стаки',

  -- ToES: Lei Shi
  ['Special Ability'] = 'Особая способность',

  -- ToES: Sha of Fear
  ['Forms a Wall'] = 'Форм. стену', -- https://www.wowhead.com/mop-classic/spell=117866/champion-of-the-light
  ['Left Platform'] = 'Левая платформа',
  ['Middle Platform'] = 'Центр. платформа',
  ['Move to %d'] = 'Перейди на %d',
  ['Right Platform'] = 'Правая платформа',
  ['Start in %d'] = 'Начни в %d',
  ['Random Ability (1 of 3)'] = 'Случайная абилка',
}
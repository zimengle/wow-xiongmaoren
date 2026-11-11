-- Lueur : 简体中文文本
-- 这是后备语言之外的正式本地化：某语言缺失的文本会以英文显示，而语言在此没有对应
-- 文件的客户端会收到英文。

local _, ns = ...

local L = {}
ns.LOCALES.zhCN = L

L.LANGUAGE_NAME = "简体中文"   -- 该语言自称的名称：菜单以此显示它
L.PREFIX = "|cffffd200Lueur|r: "
L.YES = "是"
L.NO = "否"
L.SETTING = "%s：%s"          -- 一个设置及其值
L.FORMAT_PERCENT = "%d%%"
L.FORMAT_RANGE = "%d 码"
L.CONFIRM = "确定？"       -- 等待第二次操作的按钮上

-- 各语言专属的命令词 -> 命令的英文名。英文名在各处都通用；重音符号可有可无。
L.COMMANDS = {}

---------------------------------------------------------------------------
-- 类别、状态、效果
---------------------------------------------------------------------------

L.CATEGORY_ORE = "矿石"
L.CATEGORY_ORE_TIP = "矿脉与矿点。"
L.CATEGORY_HERB = "草药"
L.CATEGORY_HERB_TIP = "你可以采集的植物。"
L.CATEGORY_QUEST = "任务"
L.CATEGORY_QUEST_TIP = "与你当前某个任务相关的物体。"
L.CATEGORY_CHEST = "宝箱"
L.CATEGORY_CHEST_TIP = "你可以开启的箱子、板条箱及其他容器。"
L.CATEGORY_BOBBER = "钓鱼浮漂"
L.CATEGORY_BOBBER_TIP = "你鱼线上的浮漂。"
L.CATEGORY_OTHER = "其他物体"
L.CATEGORY_OTHER_TIP = "日常物体：门、邮箱、拉杆……"

-- 诊断语句中物体的类别
L.NAME_ORE = "矿石"
L.NAME_HERB = "草药"
L.NAME_QUEST = "任务"
L.NAME_CHEST = "宝箱"
L.NAME_BOBBER = "浮漂"
L.NAME_OTHER = "其他"
L.NAME_NONE = "无"

-- 预览为各类别展示的示例物体
L.SAMPLE_ORE = "铜矿脉"
L.SAMPLE_HERB = "宁神花"
L.SAMPLE_QUEST = "补给箱"
L.SAMPLE_CHEST = "破旧的箱子"
L.SAMPLE_BOBBER = "钓鱼浮漂"
L.SAMPLE_OTHER = "邮箱"

L.STATE_FAR = "超出范围"
L.STATE_READY = "已进入范围"
L.STATE_LOCKED = "不可用"

L.EFFECT_AURA = "光环"
L.EFFECT_AURA_TIP = "一圈柔光，带细环、彗星与萤火。"
L.EFFECT_RETICLE = "准星"
L.EFFECT_RETICLE_TIP = "清晰的环与彗星，叠在较暗的光晕上。"
L.EFFECT_SUBTLE = "微光"
L.EFFECT_SUBTLE_TIP = "柔和的光晕，无环也无彗星。"
L.EFFECT_SIGIL = "符印"
L.EFFECT_SIGIL_TIP = "一圈符文缓缓环绕物体旋转。"
L.EFFECT_BRACKETS = "括弧"
L.EFFECT_BRACKETS_TIP = "四个角框住物体，进入范围后锁定。"
L.EFFECT_BEAM = "光柱"
L.EFFECT_BEAM_TIP = "一道光柱从物体升起，火花沿柱上飘。"
L.EFFECT_BEACON = "信标"
L.EFFECT_BEACON_TIP = "一颗水晶悬浮在物体上方，由一缕光丝相连。"
L.EFFECT_ORBIT = "环绕"
L.EFFECT_ORBIT_TIP = "光点环绕物体，拖出尾光。"
L.EFFECT_RIPPLE = "涟漪"
L.EFFECT_RIPPLE_TIP = "涟漪在物体四周的地面扩散开来。"
L.EFFECT_SPARKLE = "闪烁"
L.EFFECT_SPARKLE_TIP = "微光在物体四周闪烁，完全没有圆环。"

---------------------------------------------------------------------------
-- 菜单
---------------------------------------------------------------------------

L.HEADER_SILHOUETTE = "身后效果"
L.HEADER_OBJECTS = "高亮物体"
L.HEADER_HIDE = "隐藏效果"
L.HEADER_DETECTION = "探测"
L.HEADER_GENERAL = "通用"
L.SETTINGS = "设置"

L.SCOPE_ALL = "全部"
L.SCOPE_ALL_TIP = "你所设置的会应用到每个类别。原本有独立设置值的类别将失去该值。"
L.SCOPE_ONE_TIP = "你所设置的仅应用到此类别，无论其他类别如何变化都会保留。"
L.EFFECT = "效果"
L.EFFECT_TIP = "光的形状。"
L.LOOK_OF_ALL = "全部物体的外观"
L.LOOK_OF = "外观：%s"
L.OF_CATEGORY = "%s（%s）"     -- 一个设置，以及它刚刚为之改动的类别
L.SHARED = "与全部物体相同"
L.SHARED_TIP = "取消此类别独立的效果与外观：改用全部物体的设置。"

L.SIZE = "大小"
L.SIZE_TIP = "效果的尺寸。"
L.INTENSITY = "强度"
L.INTENSITY_TIP = "效果的亮度。"
L.OFFSET = "垂直偏移"
L.OFFSET_TIP = "将效果沿物体名牌上下移动。预览会显示落点。"
L.FADE = "随名牌淡出"
L.FADE_TIP = "效果随物体的名牌一起淡出，例如被景物遮挡时。"

L.SILHOUETTE = "从我角色身后穿过"
L.SILHOUETTE_TIP = "效果在角色周围被裁剪掉，使其看似从身后穿过，而非盖在身上。"
L.ZONE_SIZE = "裁剪大小"
L.ZONE_SIZE_TIP = "若效果咬进角色身体则调大；若效果离得太远则调小。每个角色各自保存。"
L.ZONE_HEIGHT = "裁剪高度"
L.ZONE_HEIGHT_TIP = "将裁剪区上下移动。每个角色各自保存。"
L.ZONE_SHOW = "显示裁剪区"
L.ZONE_SHOW_TIP = "以红色描出裁剪区：它应当贴合你的角色。关闭此窗口即消失。"

L.SHOW_NAME = "显示名称"
L.SHOW_NAME_TIP = "在物体上方写出其名称，取代游戏自带的名称。"
L.SHOW_ICON = "显示图标"
L.SHOW_ICON_TIP = "在物体上方显示其交互图标，取代游戏绘制的图标。"
L.TEXT_SIZE = "文字大小"
L.TEXT_SIZE_TIP = "物体上方所写名称的大小，相对于游戏自带文字。"
L.FONT = "字体"
L.FONT_TIP = "物体上方所写名称的字体。"
L.FONT_GAME = "游戏字体"
L.COLOR = "颜色"
L.COLOR_TIP = "这些物体上效果的颜色。"
L.TIP_COLOR_SET = "左键：选择颜色"
L.TIP_COLOR_RESET = "右键：恢复原始颜色"
L.IGNORED = "已忽略的物体：%d"
L.IGNORED_TIP = "无论属于哪个类别、永远不显示效果的物体。/lueur ignore list 列出它们，/lueur ignore clear 全部遗忘。"
L.IGNORE_TARGET = "忽略当前目标"
L.IGNORE_TARGET_TIP = "忽略你正面向的物体，或取消忽略。"

L.HIDE_COMBAT = "战斗中"
L.HIDE_COMBAT_TIP = "战斗时不显示效果。"
L.HIDE_INSTANCE = "副本中"
L.HIDE_INSTANCE_TIP = "地下城、团队副本与战场中不显示效果。"
L.HIDE_LOCKED = "对我不可用的物体上"
L.HIDE_LOCKED_TIP = "当游戏暂时拒绝某物体时（技能不足、物体锁定……）效果熄灭。游戏只在你进入范围后才说明原因。"
L.HIDE_UNTRAINED = "未学相应专业的草药与矿石"
L.HIDE_UNTRAINED_TIP = "若本角色未学草药学，则不显示草药效果；未学采矿，则不显示矿石效果。"

L.RANGE = "范围"
L.RANGE_TIP = "游戏可拾取并高亮物体的最远距离。"
L.DIRECTION = "方向"
L.DIRECTION_TIP = "游戏寻找可拾取物体的方位。"
L.ARC_0 = "正前方"
L.ARC_0_TIP = "仅限正前方的物体。"
L.ARC_1 = "前方"
L.ARC_1_TIP = "你前方的任意物体。"
L.ARC_2 = "四面八方"
L.ARC_2_TIP = "各个方向，甚至身后。"
L.EXCLUSIVE = "仅显示高亮目标"
L.EXCLUSIVE_TIP = "游戏不再标出未获效果的交互目标：NPC、邮箱……取消勾选则会为每个目标显示名称与图标。"

L.KEY = "交互按键"
L.KEY_TIP = "物体进入范围后，用于拾取、采集或使用的按键。这是游戏自带的交互键：也适用于 NPC，并可在游戏按键绑定中修改。"
L.KEY_NONE = "未绑定"
L.KEY_LISTEN = "请按一个键"
L.KEY_LISTEN_TIP = "按下要使用的按键、鼠标按钮或滚轮方向。Esc 取消。"
L.KEY_TAKEN = "%s 已被“%s”占用。再次按下将其改作交互键，或另按一键。"
L.TIP_KEY_SET = "左键：选择按键"
L.TIP_KEY_CLEAR = "右键：移除按键"

L.LANGUAGE = "语言"
L.LANGUAGE_TIP = "Lueur 文字与命令的语言。"
L.LANGUAGE_AUTO = "自动"
L.LANGUAGE_AUTO_TIP = "跟随游戏的语言。"

L.ENABLE = "启用 Lueur"
L.ENABLE_TIP = "关闭时，Lueur 将你原有的目标设置交还游戏。"
L.MINIMAP = "小地图按钮"
L.MINIMAP_TIP = "在小地图边缘显示 Lueur 的按钮。"
L.DEBUG = "聊天框诊断"
L.DEBUG_TIP = "在聊天框中描述每个被锁定的物体以及 Lueur 对它的处理。"

-- 小地图页面
L.NODES_PAGE = "小地图上的草药与矿石"
L.HEADER_NODES = "小地图图标"
L.HEADER_SWITCH = "双采集专业"
L.NODE_HERBS = "草药图标"
L.NODE_HERBS_TIP = "追踪显示在小地图上的每株草药，以其自身图标显示，而非普通圆点。"
L.NODE_ORE = "矿石图标"
L.NODE_ORE_TIP = "追踪显示在小地图上的每个矿脉，以其矿石图标显示，而非普通圆点。"
L.NODE_SIZE = "图标大小"
L.NODE_SIZE_TIP = "小地图上图标的尺寸。"
L.NODE_SWITCH = "交替两种追踪"
L.NODE_SWITCH_TIP = "游戏只显示“寻找草药”或“寻找矿石”的圆点，从不同时显示。Lueur 在你移动足够远时自动开启另一种，并在小地图上同时保留两类图标。每个角色各自保存。"
L.NODE_SWITCH_YARDS = "切换间距"
L.NODE_SWITCH_YARDS_TIP = "你行进多远后 Lueur 开启另一种追踪。"

L.PREVIEW = "预览"
L.PREVIEW_STOP = "关闭预览"
L.PREVIEW_TIP = "打开一个窗口，在 3D 物体上展示各状态下的效果。此处改动即时生效。"
L.PREVIEW_NO_MODEL = "此客户端不支持 3D 模型"
L.PREVIEW_HINT = "拖拽：旋转 · 右键拖拽：移动 · 滚轮：缩放"
L.DEFAULTS = "恢复默认"
L.DEFAULTS_TIP = "将效果与探测设置恢复为初始值。再次点击确认。"
L.FOOTER = "Lueur %s · /lueur help：全部命令"

L.OPTIONS_NOTE = "让你在靠近矿脉、草药、任务物体与宝箱时使其发光。"
L.OPTIONS_OPEN = "打开 Lueur 设置"

L.TIP_ENABLED = "已启用"
L.TIP_DISABLED = "已禁用"
L.TIP_LEFT_CLICK = "左键：打开设置"
L.TIP_RIGHT_CLICK = "右键：启用或禁用"
L.TIP_DRAG = "拖拽：移动此按钮"

---------------------------------------------------------------------------
-- 命令消息
---------------------------------------------------------------------------

L.MSG_ENABLED = "已启用。"
L.MSG_DISABLED = "已禁用，已恢复你的原始设置。"
L.MSG_RESTART = "请完全重启游戏以完成 Lueur 的更新。"
L.MSG_EXCLUSIVE_ON = "游戏不再标出未获效果的目标。"
L.MSG_EXCLUSIVE_OFF = "游戏显示每个交互目标的名称与图标（NPC、世界物体……）。"
L.MSG_SILHOUETTE_ON = "效果从你角色身后穿过。"
L.MSG_SILHOUETTE_OFF = "效果覆盖你的角色。"
L.MSG_CUTOUT_UNAVAILABLE = "裁剪不可用：%s。"
L.MSG_ZONE_SHOWN = "裁剪区以红色描出：它应当贴合你的角色。"
L.MSG_ZONE_HIDDEN = "已隐藏裁剪区描边。"
L.MSG_SILHOUETTE_VALUES = "剪影：大小 %d%%，高度 %d%%"
L.MSG_SILHOUETTE_USAGE = "用法：/lueur silhouette | show | <大小 {bodyScale}> [高度 {bodyShift}]"
L.MSG_EFFECTS = "可用效果：%s（当前：%s）"
L.MSG_FONTS = "可用字体：%s（当前：%s）"
L.MSG_COLOR = "%s：颜色 %s"
L.MSG_NO_PICKER = "此客户端无颜色选择器：请输入 /lueur color <类别> <rrggbb>。"
L.MSG_SHARED = "%s：恢复为全部物体的效果与外观。"
L.MSG_HIDE_COMBAT = "战斗中隐藏效果：%s"
L.MSG_HIDE_INSTANCE = "副本中隐藏效果：%s"
L.MSG_HIDE_LOCKED = "对你不可用的物体上隐藏效果：%s"
L.MSG_HIDE_UNTRAINED = "对未学专业的草药与矿石隐藏效果：%s"
L.MSG_IGNORED = "%s 将不再获得效果。"
L.MSG_UNIGNORED = "%s 已不再被忽略。"
L.MSG_IGNORE_NO_TARGET = "你面前没有可忽略的物体。"
L.MSG_IGNORE_LIST = "已忽略的物体：%s"
L.MSG_IGNORE_EMPTY = "没有忽略任何物体。"
L.MSG_RANGE = "范围：%d 码"
L.MSG_RANGE_COMBAT = "范围：%d 码，离开战斗后生效。"
L.MSG_RANGE_CLIENT = "范围：请求 %d 码，客户端保留 %s。"
L.MSG_KEY_COMBAT = "战斗中无法更改按键绑定。"
L.MSG_KEY_REFUSED = "游戏拒绝了按键“%s”。"
L.MSG_KEY_REPLACED = "%s 不再触发“%s”。"
L.MSG_NODES_UNAVAILABLE = "小地图图标不可用：%s。"

L.FAIL_NO_MASK = "此客户端不支持遮罩"
L.FAIL_MASK_TEXTURE = "未找到遮罩纹理（请完全重启游戏）"
L.FAIL_MASK_REFUSED = "客户端拒绝了遮罩"
L.FAIL_NO_SCAN = "此客户端不允许插件读取小地图圆点"
L.FAIL_SCAN_ERROR = "游戏拒绝了小地图扫描（/lueur scan 说明原因）"

L.STATUS_CLIENT = "客户端 %s（%s），语言 %s；Lueur 文字：%s。当前生效的值："
L.STATUS_CVAR_UNKNOWN = "此客户端未知"
L.STATUS_CVAR_DEFAULT = "（默认 %s）"
L.STATUS_EXPECTED = "Lueur 期望：范围 %d，弧度 %d"
L.STATUS_GATE = "仅标出高亮目标：%s | 当前原生显示：%s"
L.GATE_OPEN = "开启"
L.GATE_CLOSED = "关闭"
L.STATUS_SILHOUETTE = "效果位于角色身后：%s"
L.STATUS_UNAVAILABLE = "不可用，%s"
L.STATUS_DIRECT = "目标直接来自“softinteract”：%s"
L.STATUS_NOT_YET = "尚未出现"
L.STATUS_RANGE_API = "可读取交互范围：%s"
L.STATUS_LINE = "鱼线已抛出：%s | 引导中：%s"
L.STATUS_NODES = "小地图图标：%s"
L.STATUS_NODES_SHOWN = "草药 %s，矿石 %s，交替追踪 %s"
L.STATUS_HIDE = "战斗中隐藏：%s | 副本中：%s | 不可用物体上：%s | 当前暂停：%s"
L.STATUS_TRAINED = "对未学专业的草药与矿石不显示效果：%s | 草药学：%s，采矿：%s"
L.STATUS_OBJECTS = "本角色显示的类别：%s | 已忽略物体：%d"
L.STATUS_OWN = "拥有独立设置的类别：%s"
L.STATUS_EFFECT = "效果：%s | 纹理：%s"
L.STATUS_KEY = "交互按键：%s"
L.TEXTURES_PENDING = "尚未加载"
L.TEXTURES_MISSING = "缺失，显示兜底效果（请完全重启游戏）"
L.TEXTURES_LOADED = "已加载"

L.OBJECTIVES_HEADER = "%d 个进行中的任务目标："
L.OBJECTIVES_NOT_ITEM = "  （不是物体：仅与完整名称比较）"
L.OBJECTIVES_LEARNED = "从提示栏学到：%s（%s）"

-- /lueur scan
L.SCAN_HEADER = "小地图扫描：%s"
L.SCAN_READY = "可用"
L.SCAN_TRACKING = "采集追踪：%s"
L.SCAN_SKILL = "读取到的技能：草药学 %s，采矿 %s"
L.SCAN_VIEW = "小地图半径：%s 码 | 随你转动：%s | 已知地图位置：%s | 圆点响应范围 %s 单位内"
L.SCAN_TWICE = "两枚圆点重叠处写了两次的名称：%s"
L.SCAN_PLACED = "图标：精确放置 %d，成簇 %d，粗略 %d，保留自关闭的追踪 %d，未再次找到 %d | 上次扫描：%d 个点，用时 %.2f 秒，细看 %d 个簇"
L.SCAN_NODE = "%s：%s，在 %s 单位内响应，距小地图中心（%+.0f，%+.0f）"
L.SCAN_HOW_EXACT = "精确放置"
L.SCAN_HOW_CLUSTER = "成簇"
L.SCAN_HOW_ROUGH = "粗略"
L.SCAN_HOW_HELD = "保留自关闭的追踪"
L.SCAN_HOW_MISSED = "未再次找到"
L.SCAN_FOUND = "上次扫描读取到 %d 个名称，%d 个图标："
L.SCAN_NOT_NODE = "既不是 Lueur 认识的草药也不是矿脉"
L.SCAN_NEEDS = "，需要 %d"
L.SCAN_CAVE = "，在洞穴中"
L.SCAN_VIGNETTES = "游戏列出的标记：%s"
L.SCAN_DATA = "指针下圆点的数据，除文字外：%s"
L.SCAN_POINTER = "指针下：%s"
L.SCAN_ZONE = "游戏在指针周围为 %s 命名的区域，尝试了 %s：%d 个点，%d × %d 单位，中心距指针（%+.1f，%+.1f），在 %d 个点处写了两次名称"
L.SCAN_ZONE_COLUMNS = "逐列"
L.SCAN_ZONE_ROWS = "逐行"
L.SCAN_ZONE_LINES = "其行自上而下（高度：左..右）：%s"
L.SCAN_NOTHING = "无（将指针放在小地图圆点上，再次输入该命令）"

---------------------------------------------------------------------------
-- 诊断（/lueur debug）
---------------------------------------------------------------------------

L.DEBUG_NO_TARGET = "已无交互目标"
L.DEBUG_PAUSED = "已暂停（战斗或副本）"
L.DEBUG_LINE_OUT = "鱼线已抛出：请求 %d 码，客户端保留 %s"
L.DEBUG_LINE_IN = "鱼线已收起：请求 %d 码，客户端保留 %s"
L.DEBUG_IGNORED = "%s 已忽略（不是世界物体）"
L.DEBUG_SKIPPED = "%s 已忽略（在你的忽略列表中）"
L.DEBUG_HIDDEN = "%s → %s，无效果（类别隐藏或未知）"
L.DEBUG_UNTRAINED = "%s → %s，无效果（本角色未学相应专业）"
L.DEBUG_NO_PLATE = "%s → %s，已探测到但没有名牌：无法显示效果"
L.DEBUG_SHOWN = "%s → %s，%s"
L.DEBUG_CURSOR = "指针：%s"
L.DEBUG_VIA = "目标：%s"
L.VIA_DIRECT = "直接"
L.VIA_SWEEP = "扫描"
L.DEBUG_RANGE = "在交互范围内：%s"
L.DEBUG_OBJECT = "物体 ID：%s"
L.DEBUG_FISHING = "钓鱼：%s"
L.DEBUG_QUEST = "与任务相关：%s"
L.DEBUG_MATCH = "通过以下方式关联到目标：%s（%d 个进行中的目标）"
L.MATCH_NONE = "无"
L.MATCH_CURSOR = "无，其指针说明了它是什么"
L.MATCH_TOOLTIP = "其提示栏"
L.MATCH_NAME = "其名称"
L.MATCH_WORD = "词语“%s”"
L.MATCH_LOOT = "其战利品，此前已取走"
L.DEBUG_CHEST = "已知为容器，通过：%s"
L.DEBUG_SECRET = "隐藏身份：%s"
L.DEBUG_BEHIND = "位于摄像机后方：%s"

---------------------------------------------------------------------------
-- 帮助（/lueur help）。{设置}：其取值范围；{设置=}：其默认值
---------------------------------------------------------------------------

L.HELP_HEADER = "命令："
L.HELP = {
	"/lueur — 打开或关闭设置窗口（等同于点击小地图按钮）",
	"/lueur minimap — 显示或隐藏小地图按钮",
	"/lueur on | off — 启用或禁用 Lueur（off 恢复你的设置）",
	"/lueur preview — 打开或关闭预览窗口，在 3D 物体上展示效果",
	"/lueur effect [类别] <名称> — 将效果赋予所有类别，或其中某一类（ore 矿石、herb 草药、quest 任务、chest 宝箱、bobber 浮漂、other 其他）；不加名称则列出它们",
	"/lueur color <类别> <rrggbb> | default — 某类别效果的颜色；不加颜色则显示它",
	"/lueur shared <类别> — 让某类别恢复为全部物体的效果与外观",
	"/lueur size [类别] <{size}> — 效果大小（默认 {size=}）",
	"/lueur intensity [类别] <{intensity}> — 效果亮度，以 % 计（默认 {intensity=}）",
	"/lueur offset [类别] <{offsetY}> — 效果的垂直偏移（默认 {offsetY=}）",
	"/lueur fade [类别] — 效果是否随名牌淡出（被景物遮挡的物体）",
	"/lueur name | icon [类别] — 物体的名称或图标是否显示在上方；text [类别] <{textSize}> 设置名称大小，以 % 计（默认 {textSize=}）",
	"/lueur font [类别] <名称> | default — 物体名称的字体；不加名称则列出它们",
	"/lueur silhouette [类别] — 效果是否从你角色身后穿过而非盖在身上",
	"/lueur silhouette show | <大小 %> [高度 %] — 显示并调整裁剪区",
	"/lueur range <{range}> — 游戏拾取物体的最远距离，以码计（默认 {range=}）",
	"/lueur arc <{arc}> — 0 正前方，1 前方，2 四面八方（默认 {arc=}）",
	"/lueur exclusive — 游戏是否仅标出获得效果的那些目标",
	"/lueur combat | instance | unavailable | profession — 效果是否在战斗中、副本中、对你不可用的物体上、未学专业的草药与矿石上隐藏",
	"/lueur key <按键> | none — 绑定拾取高亮物体的按键（F、SHIFT-E、BUTTON4……）；不加按键则显示它",
	"/lueur ore | herb | quest | chest | bobber | other — 显示或隐藏某类别，对本角色生效",
	"/lueur nodes [ore | herb] — 显示或隐藏小地图上草药与矿脉的图标；nodes size <{nodeSize}> 设置其大小（默认 {nodeSize=}）",
	"/lueur switch [<{nodeSwitchYards}>] — 若同时拥有双采集专业：随移动交替“寻找草药”与“寻找矿石”；数字设置交替间距，以码计（默认 {nodeSwitchYards=}）",
	"/lueur scan — 显示上次小地图扫描读取到的内容，以及 Lueur 的处理结果",
	"/lueur ignore — 忽略你正面向的物体，或取消忽略；ignore list、ignore clear、ignore <名称>",
	"/lueur language <auto | de | en | es | fr | zh> — Lueur 文字与命令的语言",
	"/lueur debug — 描述每个被锁定的物体以及 Lueur 对它的处理",
	"/lueur objectives — 列出用于比较物体名称的任务目标",
	"/lueur status — 显示客户端实际生效的值",
	"/lueur help — 显示此列表",
}

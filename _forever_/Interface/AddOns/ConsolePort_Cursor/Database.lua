local _, Data, env = CPAPI.LinkEnv(...)
local MODID_SELECT = { SHIFT = SHIFT_KEY_TEXT, CTRL = CTRL_KEY_TEXT, ALT = ALT_KEY_TEXT, [0] = NONE };

---------------------------------------------------------------
-- Add variables to config
---------------------------------------------------------------
ConsolePort:AddVariables({
	_('Interface Cursor', INTERFACE_LABEL, 2);
	UIenablePopups = _{Data.Bool(true);
		name = '启用弹窗';
		desc = '允许光标与弹窗和静态对话框交互并显示偏好。';
		advd = true;
	};
	UIenableGroupLoot = _{Data.Bool(true);
		name = '启用团队战利品';
		desc = '允许光标与团队战利品框体交互并显示偏好。';
		advd = true;
	};
	UIpointerAnimation = _{Data.Bool(true);
		name = '启用动画';
		desc = '指针箭头沿移动方向旋转。';
		advd = true;
	};
	UIpointerSound = _{Data.Bool(true);
		name = '启用音效';
		desc = '指针箭头到达目标时播放音效。';
		advd = true;
	};
	UIpointerDefaultIcon = _{Data.Bool(true);
		name = '显示默认按键';
		desc = '显示默认的鼠标操作按键。';
		advd = true;
	};
	UIaccessUnlimited = _{Data.Bool(false);
		name = '无限模式';
		desc = '允许光标与整个界面交互，而不仅仅是面板。';
		note = '与需求模式相结合，实现完全的光标控制。';
		advd = true;
	};
	UIalgoOptimize = _{Data.Bool(true);
		name = '优化算法';
		desc = '使用优化的寻路算法进行光标移动。';
		note = '禁用此功能可能会导致打开许多面板时性能变差。';
		advd = true;
	};
	UIshowOnDemand = _{Data.Bool(false);
		name = '需求模式';
		desc = '光标按需出现，而不是在面板出现时响应出现。';
		note = '需要切换界面光标绑定按键才能使用光标。';
		advd = true;
	};
	UIholdRepeatDisable = _{Data.Bool(false);
		name = '禁用重复移动';
		desc = '禁用重复的光标移动 - 每次点击只会移动光标一次。';
	};
	UIholdRepeatDelay = _{Data.Number(.125, 0.025);
		name = '重复移动延迟';
		desc = '按住一个方向时，重复移动的延迟时间，单位为秒。';
		deps = { UIholdRepeatDisable = false };
		advd = true;
	};
	UIholdRepeatDelayFirst = _{Data.Number(.125, 0.025);
		name = '重复移动第一次延迟';
		desc = '按住一个方向时，第一次响应重复移动的延迟时间，单位为秒。';
		deps = { UIholdRepeatDisable = false };
		advd = true;
	};
	UIleaveCombatDelay = _{Data.Number(0.5, 0.1);
		name = '重启延迟';
		desc = '在离开战斗后重新激活界面光标的延迟时间，单位为秒。';
		note = '如果你死亡，延迟时间会加倍。';
		advd = true;
	};
	UIpointerSize = _{Data.Number(22, 2, true);
		name = '指针尺寸';
		desc = '指针箭头的尺寸，单位为像素。';
		advd = true;
	};
	UIpointerOffset = _{Data.Number(-2, 1);
		name = '指针偏移';
		desc = '指针箭头与所选节点中心的偏移量，单位为像素。';
		advd = true;
	};
	UItravelTime = _{Data.Range(4, 1, 1, 10);
		name = '移动时间';
		desc = '光标从一个节点移动到另一个节点所需的时间。';
		note = '数值越高速度越慢。';
		advd = true;
	};
	UICursorLeftClick = _{Data.Button('PAD1');
		name = KEY_BUTTON1;
		desc = '用于复制鼠标左键点击的按键。这是主要的界面操作动作。';
		note = '在长按时，可以通过点击方向键来模拟拖动操作。';
	};
	UICursorRightClick = _{Data.Button('PAD3');
		name = KEY_BUTTON2;
		desc = '用于复制鼠标右键点击的按键。这是次要的界面操作动作。';
		note = '这个按键是直接从你的背包中使用或出售物品所必需的。';
	};
	UICursorSpecial = _{Data.Button('PAD4');
		name = '特殊按键';
		desc = '用于处理特殊动作的按键，例如将物品添加到多功能法环。';
	};
	UICursorCancel = _{Data.Button('PAD2');
		name = '取消按键';
		desc = '用于处理取消操作的按键，如退出菜单。';
	};
	UImodifierCommands = _{Data.Map('SHIFT', MODID_SELECT);
		name = '控制键';
		desc = '设置用来修改操作的控制键。';
		note = '控制键可以和方向键一起用来滚动。';
	};
	UImodifierNudge = _{Data.Map('CTRL', MODID_SELECT);
		name = '微调控制键';
		desc = '用于微调光标的控制键。';
		note = '该控制键可配合方向键以较慢的速度移动光标。';
	};
})

---------------------------------------------------------------
-- Standalone frame stack
---------------------------------------------------------------
-- This list aims to contain all the frames, popups, panels
-- that are not caught by frame managers (e.g. UIPanelWindows),
-- and exist within the FrameXML code in some shape or form. 

env.StandaloneFrameStack = {
	'ContainerFrameCombinedBags';
	'CovenantPreviewFrame';
	'EngravingFrame';
	'EquipmentFlyoutFrame';
	'LFGDungeonReadyPopup';
	'OpenMailFrame';
	'PetBattleFrame';
	'ReadyCheckFrame';
	'SplashFrame';
	'StackSplitFrame';
	'UIWidgetCenterDisplayFrame';
};

env.UnlimitedFrameStack = {
	UIParent;
	DropDownList1;
	DropDownList2;
};

env.StaticPopupStack = {};
env.GroupLootStack   = {};

for i=1, (NUM_CONTAINER_FRAMES   or 13) do tinsert(env.StandaloneFrameStack, 'ContainerFrame'..i) end
for i=1, (NUM_GROUP_LOOT_FRAMES  or 4)  do tinsert(env.GroupLootStack,       'GroupLootFrame'..i) end
for i=1, (STATICPOPUP_NUMDIALOGS or 4)  do tinsert(env.StaticPopupStack,     'StaticPopup'..i)    end

---------------------------------------------------------------
-- Frame management resources
---------------------------------------------------------------

-- Managers are periodically scanned by the frame stack handler
-- to add new frames to the registry. The table is associative
-- if the value is true, and indexed if the value is false.
env.FrameManagers = { -- table, isAssociative
	[UIPanelWindows]  = true;
	[UISpecialFrames] = false;
	[UIMenus]         = false;
};

-- Pipelines are hooked by the frame stack handler to add new
-- frames to the registry as they pass through the pipeline.
-- Global references are hooked by name, and methods are hooked
-- by name and method name.
env.FramePipelines = { -- global ref, bool or method
	ShowUIPanel             = false;
	StaticPopupSpecial_Show = false;
	HelpTipTemplateMixin    = 'Init';
};

---------------------------------------------------------------
-- Node management resources
---------------------------------------------------------------
-- Deferred Blizzard addon hooks; pcall-wrapped so one bad hook
-- does not take the rest of the load callback with it.
function env.OnAddonLoaded(addOn, script)
	EventUtil.ContinueOnAddOnLoaded(addOn, GenerateClosure(pcall, script))
end

env.Node = LibStub('ConsolePortNode');

env.IsClickableType = {
	Button      = true;
	CheckButton = true;
	EditBox     = true;
};

env.DropdownReplacementMacro = {
	SET_FOCUS   = '/focus %s';
	CLEAR_FOCUS = '/clearfocus';
	PET_DISMISS = '/petdismiss';
};

env.Attributes = {
	IgnoreNode   = 'nodeignore';       -- Bool, ignore this node completely.
	IgnoreDrag   = 'nodeignoredrag';   -- Bool, ignore dragging simulation.
	IgnoreMime   = 'nodeignoremime';   -- Bool, ignore miming of this node.
	IgnoreScroll = 'nodeignorescroll'; -- Bool, ignore super scrolling.
	PassThrough  = 'nodepass';         -- Bool, pass through the node, consider children.
	Singleton    = 'nodesingleton';    -- Bool, include node, ignore children.
	Priority     = 'nodepriority';     -- Number, priority in arbitrary selection.
	SpecialClick = 'nodespecialclick'; -- Function, special click handler.
	CancelClick  = 'nodecancelclick';  -- Function, cancel click handler.
	DisableHooks = 'nohooks';          -- Bool, disable hooks for this node.
};

---------------------------------------------------------------
-- Unavoidable taint error messages
---------------------------------------------------------------
env.ForbiddenActions = CPAPI.Proxy({
	['FocusUnit()'] = ([[
		当界面光标处于激活状态时，无法可靠地从单位下拉菜单中设置焦点。

		请使用其他方法来设置焦点，例如使用 %s 绑定、/focus 宏或团队光标。
	]]):format(BLUE_FONT_COLOR:WrapTextInColorCode(BINDING_NAME_FOCUSTARGET));
	['ClearFocus()'] = ([[
		当界面光标处于激活状态时，无法可靠地从单位下拉菜单中清除焦点。

		请使用其他方法来清除焦点，例如使用 %s 绑定、/focus 宏或团队光标。
	]]):format(BLUE_FONT_COLOR:WrapTextInColorCode(BINDING_NAME_FOCUSTARGET));
	['CastSpellByID()'] = [[
		当界面光标处于激活状态时，一些操作可能无法可靠地执行。
		你似乎尝试从受到界面光标影响的来源施放一个法术。

		请使用其他方法来施放这个法术，比如使用宏或你的动作条。
	]];
}, function()
	return [[
		当界面光标处于激活状态时，一些操作可能无法可靠地执行。
		你似乎尝试执行了一个被光标污染而被阻止的操作。

		你也许可以忽略此消息，但如果你的界面没有正常工作，可能需要重新加载。
	]];
end);
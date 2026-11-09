local _, Data, env, db, name = CPAPI.LinkEnv(...);
---------------------------------------------------------------
LibStub('RelaTable')(name, env);
---------------------------------------------------------------

env.QMenuID = CreateCounter();
env.ActionButton  = LibStub('ConsolePortActionButton');

function env:GetTooltipPromptForClick(clickID, text)
	local device = db.Gamepad.Active;
	local btnID = db('QMenu'..clickID)
	if device and btnID then
		return device:GetTooltipButtonPrompt(btnID, text)
	end
end

function env:AddQMenuFactory(collectionID, factory)
	self:RegisterSafeCallback('QMenu.Loaded', function(QMenu)
		if db(collectionID) then return factory(QMenu) end
		db:RegisterSafeCallback('Settings/'..collectionID, function()
			if db(collectionID) then
				db:UnregisterCallback('Settings/'..collectionID, self)
				factory(QMenu)
			end
		end, self)
	end)
end

---------------------------------------------------------------
ConsolePort:AddVariables({
---------------------------------------------------------------
	_(ACCESSIBILITY_LABEL, INTERFACE_LABEL);
	showAbilityBriefing = _{Data.Bool(true);
		name = '显示技能简介';
		desc = '为新获得的技能显示简要说明。';
	};
	useCustomLootFrame = _{Data.Bool(true);
		name = '使用自定义拾取框';
		desc = '将默认的拾取框替换为一个针对手柄优化的自定义版本。';
		list = LOOT;
	};
	useGlobalLootTooltip = _{Data.Bool(false);
		name = '使用全局拾取提示';
		desc = '使用全局游戏提示来显示拾取信息，允许其他插件添加信息到可拾取物品。';
		list = LOOT;
	};
	_('快捷菜单', INTERFACE_LABEL);
	QMenuLeftButton = _{Data.Button('PAD1');
		name = table.concat({ACCEPT, PRIMARY, KEY_BUTTON1}, ' | ');
		desc = '主要确认按钮，用于确认或使用快速菜单操作。';
	};
	QMenuRightButton = _{Data.Button('PAD3');
		name = table.concat({ACCEPT, SECONDARY, KEY_BUTTON2}, ' | ');
		desc = '次要确认按钮，用于确认或使用快速菜单操作。';
	};
	QMenuMiddleButton = _{Data.Button('PAD4');
		name = table.concat({SPECIAL, KEY_BUTTON3}, ' | ');
		desc = '上下文操作按钮，用于添加物品到法环或传递拾取。';
	};
	QMenuCancelButton = _{Data.Button('PAD2');
		name = CANCEL;
		desc = '取消或退出快速菜单的按钮。';
		note = '快速菜单绑定也可以用于关闭菜单。';
	};
	QMenuCollectionBuffs = _{Data.Bool(true);
		name = SHOW_BUFFS or '显示Buff';
		desc = '在快速菜单中显示当前激活的Buff。';
		list = SETTING_GROUP_GAMEPLAY;
	};
	QMenuCollectionDebuffs = _{Data.Bool(true);
		name = SHOW_DEBUFFS or '显示Debuff';
		desc = '在快速菜单中显示当前激活的Debuff。';
		list = SETTING_GROUP_GAMEPLAY;
	};
	QMenuCollectionGroupLoot = _{Data.Bool(true);
		name = LOOT;
		desc = '在快速菜单中显示团队战利品掷骰，允许你在战斗中使用手柄按钮进行物品掷骰。';
		list = SETTING_GROUP_GAMEPLAY;
		hide = CPAPI.IsRetailVersion;
	};
	QMenuCollectionPet = _{Data.Bool(true);
		name = PET;
		desc = '在快捷菜单中显示宠物动作条。';
		list = SETTING_GROUP_GAMEPLAY;
	};
	QMenuCollectionPing = _{Data.Bool(true);
		name = PING_SYSTEM_LABEL or 'Ping';
		desc = '在快捷菜单中显示标记命令。';
		list = SETTING_GROUP_GAMEPLAY;
		hide = not CPAPI.IsModernVersion;
	};
})
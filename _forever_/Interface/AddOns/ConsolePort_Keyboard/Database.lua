local _, Data, env = CPAPI.LinkEnv(...)

---------------------------------------------------------------
-- Attributes
---------------------------------------------------------------

env.Attributes = {
	HideKeyboard = 'hidekeyboard';    -- The keyboard does not show for this frame.
	ModuleName   = '键盘';        -- The name of the module in the listing (unlocalized).
	HeaderName   = INTERFACE_LABEL;   -- The name of the header in the listing (localized).
};

---------------------------------------------------------------
-- Variables
---------------------------------------------------------------
ConsolePort:AddVariables({
	_(env.Attributes.ModuleName, env.Attributes.HeaderName, 2);
	keyboardAlwaysShow = _{Data.Bool(false);
		name = '始终显示';
		desc = '键盘是否始终显示，或仅在手柄激活时显示。';
	};
	keyboardScale = _{Data.Range(1, 0.05, 0.5, 2);
		name = '缩放';
		desc = '键盘的缩放比例。';
	};
	keyboardSpaceButton = _{Data.Button('PAD1');
		name = '空格';
		desc = '触发空格指令的按键。';
	};
	keyboardEnterButton = _{Data.Button('PAD2');
		name = '回车';
		desc = '触发回车指令的按键。';
	};
	keyboardEraseButton = _{Data.Button('PAD3');
		name = '退格';
		desc = '触发退格指令的按键。';
	};
	keyboardEscapeButton = _{Data.Button('PAD4');
		name = 'ESC';
		desc = '触发 ESC 指令的按键。';
	};
	keyboardMoveLeftButton = _{Data.Button('PADDLEFT');
		name = '左移';
		desc = '向左移动光标的按键。';
	};
	keyboardMoveRightButton = _{Data.Button('PADDRIGHT');
		name = '右移';
		desc = '向右移动光标的按键。';
	};
	keyboardNextWordButton = _{Data.Button('PADDDOWN');
		name = '下一个词';
		desc = '选择下一个建议单词的按键。';
	};
	keyboardPrevWordButton = _{Data.Button('PADDUP');
		name = '上一个词';
		desc = '选择上一个建议单词的按键。';
	};
	keyboardAutoCorrButton = _{Data.Button('PADRSHOULDER');
		name = '单词补全';
		desc = '插入建议单词的按键。';
	};
	keyboardDictPattern = _{Data.String("[%a][%w']*[%w]+");
		name = '字典匹配模式';
		desc = '用于匹配字词的 Lua 模式，以便查询字典。';
		advd = true;
	};
	keyboardDictAlphabet = _{Data.String('abcdefghijklmnopqrstuvwxyz');
		name = '字典匹配字母';
		desc = '用于字典建议和文字处理的字母。';
		advd = true;
	};
})

---------------------------------------------------------------
-- Default data
---------------------------------------------------------------
function _(t) return ([[|TInterface\%s:0|t]]):format(t) end;

env.DefaultLayout = {
	{
		{"a", "A", "1", "/s "},
		{"b", "B", "2", "/p "},
		{"c", "C", "3", "/i "},
		{"d", "D", "4", "/g "},
	};
	{
		{"e", "E", "5", "/y "},
		{"f", "F", "6", "/w "},
		{"g", "G", "7", "/e "},
		{"h", "H", "8", "/r "},
	};
	{
		{"i", "I", "9", "/raid "},
		{"j", "J", "<", "/readycheck "},
		{"k", "K", "0", "/rw "},
		{"l", "L", ">", "%T "},
	};
	{
		{"m", "M", "@", "^"},
		{"n", "N", "&", "#"},
		{"o", "O", "$", "€"},
		{"p", "P", "%", "£"},
	};
	{
		{"q", "Q", "/", "½"},
		{"r", "R", "(", "["},
		{"s", "S", "\\", "\|"},
		{"t", "T", ")", "]"},
	};
	{
		{"u", "U", "+", "§"},
		{"v", "V", "*", "{"},
		{"w", "W", "=", "¿"},
		{"x", "X", "/", "}"},
	};
	{
		{"y", "Y", "{rt1}", "{rt1}"},
		{"z", "Z", "{rt2}", "{rt2}"},
		{"\"", "'", "{rt3}", "{rt3}"},
		{"-", "_", "{rt4}", "{rt4}"},
	};
	{
		{"!", "!", "{rt5}", "{rt5}"},
		{".", ":", "{rt6}", "{rt6}"},
		{",", ";", "{rt7}", "{rt7}"},
		{"?", "?", "{rt8}", "{rt8}"},
	};
};

env.Cmd = {
	Space  = '{cmd1}';
	Enter  = '{cmd2}';
	Erase  = '{cmd3}';
	Escape = '{cmd4}';
};

-- Each key set draws four characters as a diamond, top first and clockwise,
-- matching the face buttons; the button pressed decides which one is typed.
env.StrokeButtons = { 'PAD4', 'PAD2', 'PAD1', 'PAD3' };
env.StrokeIndex   = tInvert(env.StrokeButtons);

env.DefaultMarkers = {
	['{rt1}']          = _ [[TARGETINGFRAME\UI-RaidTargetingIcon_1]];
	['{rt2}']          = _ [[TARGETINGFRAME\UI-RaidTargetingIcon_2]];
	['{rt3}']          = _ [[TARGETINGFRAME\UI-RaidTargetingIcon_3]];
	['{rt4}']          = _ [[TARGETINGFRAME\UI-RaidTargetingIcon_4]];
	['{rt5}']          = _ [[TARGETINGFRAME\UI-RaidTargetingIcon_5]];
	['{rt6}']          = _ [[TARGETINGFRAME\UI-RaidTargetingIcon_6]];
	['{rt7}']          = _ [[TARGETINGFRAME\UI-RaidTargetingIcon_7]];
	['{rt8}']          = _ [[TARGETINGFRAME\UI-RaidTargetingIcon_8]];

	[env.Cmd.Space]    = _ [[AddOns\ConsolePort_Keyboard\Assets\IconSpace.tga]];
	[env.Cmd.Erase]    = _ [[AddOns\ConsolePort_Keyboard\Assets\IconEraser.tga]];
	[env.Cmd.Enter]    = _ [[RAIDFRAME\ReadyCheck-Ready]];
	[env.Cmd.Escape]   = _ [[RAIDFRAME\ReadyCheck-NotReady]];

	['/rw ']           = _ [[DialogFrame\UI-Dialog-Icon-AlertNew]];
	['/raid ']         = _ [[Scenarios\ScenarioIcon-Boss]];
	['/readycheck ']   = _ [[RAIDFRAME\ReadyCheck-Waiting]];
	['/attacktarget '] = _ [[CURSOR\Attack]];

	['%T ']            = _ [[MINIMAP\TRACKING\Target]];
	['%T']             = _ [[MINIMAP\TRACKING\Target]];
	['%F ']            = _ [[MINIMAP\TRACKING\Focus]];
	['%F']             = _ [[MINIMAP\TRACKING\Focus]];

	['/s ']            = '/s';
	['/p ']            = '/p';
	['/i ']            = '/i';
	['/g ']            = '/g';
	['/y ']            = '/y';
	['/w ']            = '/w';
	['/e ']            = '/e';
	['/r ']            = '/r';
};

---------------------------------------------------------------
-- Helpers
---------------------------------------------------------------
local NUM_STATES = 8;

function env:GetDefaultLayout()
	local layout = {};
	for i, set in ipairs(self.DefaultLayout) do
		layout[i] = {};
		for j, keys in ipairs(set) do
			layout[i][j] = {};
			for k = 1, NUM_STATES do
				layout[i][j][k] = keys[k] or '';
			end
		end
	end
	return layout;
end

function env:ValidateLayout(layout, default)
	default = default or self:GetDefaultLayout();
	-- Dynamically composed sets are not supported anymore,
	-- so if a user has customized their layout to have more
	-- sets (8+) or variable keys (not 4) then reset the layout.
	if #layout > #default then
		return false;
	end
	for i, set in ipairs(layout) do
		if #set ~= #default[i] then
			return false;
		end
		for j, keys in ipairs(set) do
			if #keys ~= #default[i][j] then
				return false;
			end
		end
	end
	return true;
end

function env:GetText(text)
	return self.Markers[text] or text;
end

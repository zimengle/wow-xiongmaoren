-- ===================================================================
-- 帐篷助手 TentWhisper 1.0
-- 只做四件事：
--   1) 选中帐篷（target）后读出放置者名字，窗口自动弹出
--   2) 点一下发密语求组
--   3) 点一下把帐篷主直接邀请进自己的队伍（可开关的自动接受是另一回事）
--   4) 自动接受「刚密语过的人」在 5 分钟内发来的组队邀请
--   唤出窗口双保险：选中帐篷自动弹出 + 左键点击帐篷也能弹出。
--   小地图图标：左键手动开关窗口，可拖动。
-- ===================================================================
local addonName, ns = ...
WoWBridgeNS = WoWBridgeNS or {}
WoWBridgeNS[addonName] = ns

local WB = (WoWBridge and WoWBridge.Bind and WoWBridge.Bind(addonName)) or {
	Emit = function() end,
	Expose = function() end,
}
ns.WB = WB

local function Print(...)
	print("|cff6fd3c7帐篷助手|r", ...)
end
ns.Print = Print

local DEFAULT_TEXT = "大哥求组，蹭个帐篷谢谢。"

local function DB()
	_G.TentWhisperDB = _G.TentWhisperDB or {}
	ns.db = _G.TentWhisperDB
	local d = ns.db
		if d.textVersion ~= 2 then
		d.text, d.textVersion = DEFAULT_TEXT, 2
	end
	if not d.text or d.text == "" then d.text = DEFAULT_TEXT end
	if d.autoAccept == nil then d.autoAccept = true end   -- 默认开，窗口里可关
	return d
end

local function Now()
	if type(GetServerTime) == "function" then return GetServerTime() end
	if type(time) == "function" then return time() end
	return 0
end

local T = ns.state
if not T then
	T = { lines = {}, lastWhisperAt = -9999, lastInviteAt = -9999 }
end
if T.version ~= 5 then
	T.version = 5
	T.autoShownFor = nil           
	T.lastTargetKey = nil
	T.lastClickAt = nil
	T.clickShows = 0
	T.confirmDeadline = nil        
	T.inviteDeadline = nil
end
ns.state = T

local function CanRead(v)
	return type(v) == "string"
		and (type(canaccessvalue) ~= "function" or canaccessvalue(v))
end

-- Lua 5.1 字符类按字节算，pattern 里写全角标点会切坏 UTF-8，先统一换成半角
local function NormPunct(s)
	return (tostring(s):gsub("：", ":"):gsub("，", ",")
		:gsub("、", ","):gsub("·", ","))
end

local function SafeName(s)
	return (tostring(s or ""):gsub("%c", ""):match("^%s*(.-)%s*$"))
end

-- 名字只清首尾/装饰符；中间空格是两段式中文名的一部分，绝不能删
local function CleanOwner(s)
	if not CanRead(s) then return nil end
	local n = NormPunct(s):gsub("%c", ""):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
	n = n:match("^%s*(.-)%s*$") or ""
	n = n:gsub("^<+%s*", ""):gsub("%s*>+$", "")
	n = n:gsub("[,:%s%.]+$", "")
	n = n:match("^%s*(.-)%s*$") or ""
	if n == "" or n:find("帐篷") or n:find("冒险者") then return nil end
	if #n > 72 then return nil end
	return n
end

-- 只认「放置 / 所有 / 由」这类归属行，别把公会名、说明文字误当玩家名
local function OwnerFromLine(line)
	if not CanRead(line) then return nil end
	local s = NormPunct(tostring(line)):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
	s = s:match("^%s*(.-)%s*$") or ""
	if not (s:find("放%s*置") or s:find("所%s*有%s*者") or s:find("^<%s*由")) then
		return nil
	end
	s = s:gsub("^<%s*", ""):gsub("%s*>$", "")
	s = s:gsub("^由%s*", "")
	s = s:gsub("^放%s*置%s*者[%s:]+%s*", "")
	s = s:gsub("^所%s*有%s*者[%s:]+%s*", "")
	s = s:gsub("[,]?%s*放%s*置%s*$", "")
	s = s:gsub("%s*的%s*$", "")
	return CleanOwner(s)
end
ns.OwnerFromLine = OwnerFromLine

-- 只读「当前选中目标」的 tooltip，不再碰 mouseover
local function ReadTargetLines()
	local out = {}
	if type(C_TooltipInfo) == "table" and type(C_TooltipInfo.GetUnit) == "function" then
		local ok, data = pcall(C_TooltipInfo.GetUnit, "target")
		if ok and type(data) == "table" and type(data.lines) == "table" then
			for _, ln in ipairs(data.lines) do
				if type(ln) == "table" then
					if CanRead(ln.leftText) then out[#out + 1] = ln.leftText end
					if CanRead(ln.rightText) then out[#out + 1] = ln.rightText end
				end
			end
		end
	end
	-- 数据 API 没给出归属行时，再读一次可见 GameTooltip 的行补上
	-- （个别 GameObject 的归属行只在可见 tooltip 里出现）
	local hasOwner = false
	for _, ln in ipairs(out) do
		if OwnerFromLine(ln) then hasOwner = true break end
	end
	if not hasOwner and GameTooltip and GameTooltip.NumLines then
		local ok, n = pcall(GameTooltip.NumLines, GameTooltip)
		if ok then
			for i = 1, (tonumber(n) or 0) do
				local fs = _G["GameTooltipTextLeft" .. i]
				if fs and fs.GetText then
					local ok2, txt = pcall(fs.GetText, fs)
					if ok2 and CanRead(txt) then
						local dup = false
						for _, old in ipairs(out) do if old == txt then dup = true break end end
						if not dup then out[#out + 1] = txt end
					end
				end
			end
		end
	end
	return out
end

-- 前向声明：BuildUI / 小地图按钮在前面用到，实体在后面赋值
local UpdateUI, HideWindow, ShowByClick, CurrentTargetKey, TryAutoShow

local function ScanTarget()
	if not UnitExists("target") then return end
	local un = UnitName("target")
	T.unitName = CanRead(un) and un or nil
	T.lines = ReadTargetLines()

	local owner
	if type(UnitIsPlayer) == "function" and UnitIsPlayer("target") and T.unitName then
		-- 直接选中的就是玩家本人：名字就是玩家名
		owner, T.ownerRaw = CleanOwner(T.unitName), "直接选中玩家：" .. T.unitName
	else
		for _, ln in ipairs(T.lines) do
			owner = OwnerFromLine(ln)
			if owner then T.ownerRaw = ln break end
		end
	end
	if owner then
		local changed = (owner ~= T.owner)
		T.owner, T.lastAt = owner, Now()
		if changed then
			WB:Emit("tent.owner", { name = owner, raw = T.ownerRaw, unit = T.unitName })
		end
	end
	UpdateUI()
end
ns.ScanTarget = ScanTarget

-- 预填兜底：插件写进聊天框的文字首次回车会被吞，
-- 必须玩家 Ctrl+C -> Ctrl+V -> 回车 才算自己打的字
local function PrefillCommand(cmd)
	local ok = pcall(ChatFrame_OpenChat, cmd)
	local eb = (ChatEdit_GetActiveWindow and ChatEdit_GetActiveWindow()) or ChatFrame1EditBox
	if not eb then
		Print("聊天输入框不可用，请手动输入：", cmd)
		return false
	end
	if not ok or eb:GetText() ~= cmd then
		eb:SetText(cmd)
		eb:Show()
		eb:SetFocus()
	end
	if eb.HighlightText then pcall(eb.HighlightText, eb) end
	Print("已填入并全选：|cff88ff88" .. cmd .. "|r -> Ctrl+C / Ctrl+V / 回车 发送")
	return true
end
ns.PrefillCommand = PrefillCommand

local function PrefillWhisper(name, text)
	return PrefillCommand("/w " .. name .. " " .. text)
end
ns.PrefillWhisper = PrefillWhisper

-- /inv 是 SLASH_INVITE1（/invite、/邀请 指向同一个 handler），名字原样拼接
local function InviteCommand(name)
	return "/inv " .. name
end
ns.InviteCommand = InviteCommand

local function TentFallback(reason)
	if not T.confirmDeadline then return end
	T.confirmDeadline = nil
	if not T.lastWhisperTo then return end
	Print("|cffffcc66" .. reason .. "|r，已改为预填命令兜底：")
	PrefillWhisper(T.lastWhisperTo, T.lastText or DB().text)
	WB:Emit("tent.fallback", { reason = reason, name = T.lastWhisperTo })
end

local function SendWhisper(text)
	-- 点按钮时按当前选中的目标重读一次名字，避免拿几小时前记下的人误发
	if UnitExists("target") then ScanTarget() end
	local name = T.owner
	if not name or name == "" then
		Print("|cffffcc66还没读到帐篷主人|r：请先选中帐篷；/tw dump 可看目标原始信息")
		return false
	end
	text = (text and text ~= "") and text or DB().text
	local now = Now()
	if now - T.lastAt > 300 then
		Print("|cffffcc66这个玩家名是 5 分钟前读到的|r，请重新选中帐篷再发，避免误打扰")
		return false
	end
	if T.lastWhisperTo == name and (now - T.lastWhisperAt) < 12 then
		Print("12 秒内刚密语过 |cffffff00" .. name .. "|r，先等一下")
		return false
	end
	T.lastWhisperTo, T.lastWhisperAt = name, now
	T.lastText = text
	T.confirmDeadline = now + 3

	local ok, err = false, "没有密语 API"
	if type(C_ChatInfo) == "table" and type(C_ChatInfo.SendChatMessage) == "function" then
		ok, err = pcall(C_ChatInfo.SendChatMessage, text, "WHISPER", nil, name)
	elseif type(SendChatMessage) == "function" then
		ok, err = pcall(SendChatMessage, text, "WHISPER", nil, name)
	end
	if not ok then
		T.confirmDeadline = nil
		Print("|cffff8888插件直发密语被拦|r（" .. tostring(err) .. "），已改为预填：")
		PrefillWhisper(name, text)
		WB:Emit("tent.blocked", { name = name, err = tostring(err) })
		return false
	end
	Print("已尝试密语 |cff88ff88" .. name .. "|r：" .. text .. "（等他邀请，会自动接受）")
	WB:Emit("tent.whisper", { name = name, text = text })
	-- 没收到 CHAT_MSG_WHISPER_INFORM（静默被拦）就自动降级
	C_Timer.After(3, function()
		if T.confirmDeadline and Now() >= T.confirmDeadline - 0.2 then
			TentFallback("没收到密语回执，可能被安全策略静默拦下")
		end
	end)
	return true
end
ns.SendWhisper = SendWhisper

-- ===================================================================
-- 邀请大哥：把帐篷主直接拉进队伍（真实点击里同步调用，被拦则降级预填 /inv）
-- ===================================================================
local function InviteOwner()
	if UnitExists("target") then ScanTarget() end
	local name = T.owner
	if not name or name == "" then
		Print("|cffffcc66还没读到帐篷主人|r：请先选中帐篷；/tw dump 看原始信息")
		return false
	end
	local now = Now()
	if now - T.lastAt > 300 then
		Print("|cffffcc66这个玩家名是 5 分钟前读到的|r，请重新选中帐篷再邀请，避免误打扰")
		return false
	end
	if T.lastInviteTo == name and (now - T.lastInviteAt) < 12 then
		Print("12 秒内刚邀请过 |cffffff00" .. name .. "|r，先等一下，避免重复打扰")
		return false
	end
	if type(C_PartyInfo) == "table" and type(C_PartyInfo.CanInvite) == "function" then
		local okCan, can = pcall(C_PartyInfo.CanInvite)
		if okCan and can == false then
			Print("|cffffcc66提示|r：当前队伍里你可能不是队长，邀请可能被游戏拒绝")
		end
	end
	T.lastInviteTo, T.lastInviteAt = name, now
	T.inviteDeadline, T.inviteConfirmed, T.inviteFailed = now + 3, false, false

	local ok, err = false, "没有组队邀请 API"
	if type(C_PartyInfo) == "table" and type(C_PartyInfo.InviteUnit) == "function" then
		ok, err = pcall(C_PartyInfo.InviteUnit, name)
	end
	if not ok then
		T.inviteDeadline = nil
		Print("|cffff8888插件直发邀请被拦|r（" .. tostring(err) .. "），已改为预填：")
		PrefillCommand(InviteCommand(name))
		WB:Emit("tent.invite.blocked", { name = name, err = tostring(err) })
		return false
	end
	Print("已尝试邀请 |cff88ff88" .. name .. "|r 加入队伍")
	WB:Emit("tent.invite", { name = name })
	-- 3 秒内没看到邀请相关系统消息 => 可能被静默拦，给出可执行的兜底
	C_Timer.After(3, function()
		if not T.inviteDeadline or T.inviteConfirmed or T.inviteFailed then return end
		T.inviteDeadline = nil
		Print("|cffffcc66没看到邀请回执|r，命令已填好；"
			.. "|cffff8800若对方其实已收到邀请，请按 ESC 清掉聊天框，别再发一次|r")
		PrefillCommand(InviteCommand(name))
		WB:Emit("tent.invite.fallback", { name = name })
	end)
	return true
end
ns.InviteOwner = InviteOwner

-- 只自动接受「刚密语过的人」在 5 分钟内发来的组队邀请，别变成谁都能拉你进队
local function TryAcceptInvite(inviter)
	if not DB().autoAccept then return end
	if not T.lastWhisperTo or not CanRead(inviter) then return end
	local function base(n) return (tostring(n):match("^([^%-]+)")) or tostring(n) end
	if base(inviter) ~= base(T.lastWhisperTo) then return end
	if Now() - T.lastWhisperAt > 300 then return end
	local ok, err = pcall(AcceptGroup)
	if ok then
		Print("|cff88ff66已自动接受|r " .. tostring(inviter) .. " 的组队邀请")
		WB:Emit("tent.accepted", { name = inviter })
	else
		Print("自动接受被拦（" .. tostring(err) .. "），请手动点弹窗里的「接受」")
	end
end
ns.TryAcceptInvite = TryAcceptInvite

-- ===================================================================
-- 极简窗口：名字 + 话术 + 一个按钮
-- ===================================================================
local ui

local function Btn(parent, name, w, h, text)
	local b = CreateFrame("Button", name, parent)
	b:SetSize(w, h)
	b:SetNormalFontObject("GameFontNormalSmall")
	b:SetText(text)
	local nb = b:CreateTexture(nil, "BACKGROUND")
	nb:SetAllPoints(b)
	nb:SetColorTexture(0.08, 0.28, 0.30, 1)
	local hb = b:CreateTexture(nil, "HIGHLIGHT")
	hb:SetAllPoints(b)
	hb:SetColorTexture(1, 1, 1, 0.22)
	b:SetScript("OnEnter", function() nb:SetColorTexture(0.13, 0.44, 0.46, 1) end)
	b:SetScript("OnLeave", function() nb:SetColorTexture(0.08, 0.28, 0.30, 1) end)
	return b
end

local function BuildUI()
	-- 热加载会重跑文件：同名 frame 可能复用旧的隐藏窗口，所以旧的先藏好再用匿名 frame 重建
	local old = _G.TentWhisperFrame
	if old then
		old:Hide()
		for _, k in ipairs({ "OnUpdate", "OnMouseDown", "OnMouseUp", "OnHide" }) do
			old:SetScript(k, nil)
		end
	end
	ui = CreateFrame("Frame", nil, UIParent)
	ns.ui = ui
	_G.TentWhisperFrame = ui
	ui:SetSize(372, 214)
	ui:SetPoint("CENTER", UIParent, "CENTER", 0, 60)
	ui:SetFrameStrata("HIGH")
	ui:SetMovable(true)
	ui:EnableMouse(true)
	ui:SetClampedToScreen(true)

	local bg = ui:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints(ui)
	bg:SetColorTexture(0.02, 0.06, 0.08, 0.94)
	local edge = ui:CreateTexture(nil, "BACKGROUND")
	edge:SetPoint("TOPLEFT", -1, 1)
	edge:SetPoint("BOTTOMRIGHT", 1, -1)
	edge:SetColorTexture(0.20, 0.55, 0.58, 1)
	edge:SetDrawLayer("BACKGROUND", -1)

	-- 手动拖动（StartMoving 在本机会 ADDON_ACTION_BLOCKED）
	ui:SetScript("OnMouseDown", function(self, button)
		if button ~= "LeftButton" then return end
		local scale = self:GetEffectiveScale()
		local cx, cy = GetCursorPosition()
		self.dragdx = cx / scale - self:GetLeft()
		self.dragdy = cy / scale - self:GetBottom()
		self.dragging = true
	end)
	ui:SetScript("OnMouseUp", function(self) self.dragging = false end)
	ui:SetScript("OnHide", function(self) self.dragging = false end)
	ui:SetScript("OnUpdate", function(self)
		if not self.dragging then return end
		local scale = self:GetEffectiveScale()
		local cx, cy = GetCursorPosition()
		self:ClearAllPoints()
		self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",
			cx / scale - self.dragdx, cy / scale - self.dragdy)
	end)

	local title = ui:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	title:SetPoint("TOP", ui, "TOP", 0, -9)
	title:SetText("帐篷助手")

	local closeBtn = Btn(ui, nil, 22, 22, "X")
	closeBtn:SetPoint("TOPRIGHT", ui, "TOPRIGHT", -6, -6)
	closeBtn:SetScript("OnClick", function() HideWindow() end)

	local nameText = ui:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	nameText:SetPoint("TOPLEFT", ui, "TOPLEFT", 14, -36)
	nameText:SetWidth(340)
	nameText:SetJustifyH("LEFT")
	ui.nameText = nameText

	local sourceText = ui:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	sourceText:SetPoint("TOPLEFT", ui, "TOPLEFT", 14, -62)
	sourceText:SetWidth(340)
	sourceText:SetJustifyH("LEFT")
	ui.sourceText = sourceText

	local editLabel = ui:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	editLabel:SetPoint("TOPLEFT", ui, "TOPLEFT", 14, -94)
	editLabel:SetText("话术")

	local edit = CreateFrame("EditBox", nil, ui)
	edit:SetSize(298, 24)
	edit:SetPoint("TOPLEFT", ui, "TOPLEFT", 56, -88)
	edit:SetFontObject("GameFontHighlightSmall")
	edit:SetAutoFocus(false)
	edit:SetTextInsets(6, 6, 0, 0)
	edit:EnableMouse(true)
	local ebg = edit:CreateTexture(nil, "BACKGROUND")
	ebg:SetAllPoints(edit)
	ebg:SetColorTexture(0.01, 0.03, 0.04, 1)
	local eedge = edit:CreateTexture(nil, "BACKGROUND")
	eedge:SetPoint("TOPLEFT", -1, 1)
	eedge:SetPoint("BOTTOMRIGHT", 1, -1)
	eedge:SetColorTexture(0.32, 0.52, 0.54, 1)
	eedge:SetDrawLayer("BACKGROUND", -1)
	edit:SetText(DB().text)
	edit:SetScript("OnMouseDown", function(self) self:SetFocus() end)
	edit:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
	edit:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
	edit:SetScript("OnEditFocusLost", function(self) DB().text = self:GetText() end)
	ui.edit = edit

	-- 沿用旧全局名：万一之前绑过 SetBindingClick 到这个名字，按键仍指向正确按钮
	local sendBtn = Btn(ui, nil, 160, 26, "密语求组")
	sendBtn:SetPoint("TOPLEFT", ui, "TOPLEFT", 14, -124)
	sendBtn:RegisterForClicks("AnyUp")
	_G.TentWhisperSendBtn = sendBtn
	sendBtn:SetScript("OnClick", function() SendWhisper(ui.edit:GetText()) end)
	ui.sendBtn = sendBtn

	local acceptBtn = Btn(ui, nil, 140, 26, "自动接受:开")
	acceptBtn:SetPoint("LEFT", sendBtn, "RIGHT", 8, 0)
	acceptBtn:SetScript("OnClick", function()
		local d = DB()
		d.autoAccept = not d.autoAccept
		Print("自动接受组队邀请 =", d.autoAccept and "开" or "关",
			"（只接受 5 分钟内密语过的人）")
		UpdateUI()
	end)
	ui.acceptBtn = acceptBtn

	local inviteBtn = Btn(ui, nil, 160, 26, "邀请大哥")
	inviteBtn:SetPoint("TOPLEFT", ui, "TOPLEFT", 14, -158)
	inviteBtn:RegisterForClicks("AnyUp")
	inviteBtn:SetScript("OnClick", function() InviteOwner() end)
	ui.inviteBtn = inviteBtn

	local inviteHint = ui:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	inviteHint:SetPoint("LEFT", inviteBtn, "RIGHT", 8, 0)
	inviteHint:SetWidth(180)
	inviteHint:SetJustifyH("LEFT")
	inviteHint:SetText("|cff9fb8b8直接拉帐篷主进队伍|r")

	local hint = ui:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	hint:SetPoint("TOPLEFT", ui, "TOPLEFT", 14, -190)
	hint:SetWidth(344)
	hint:SetJustifyH("LEFT")
	ui.hint = hint
	ui:Hide()          -- 平时收起，选中帐篷时由 TryAutoShow 弹出
end

UpdateUI = function()
	if not ui then return end
	ui.nameText:SetText(T.owner and ("|cff88ffcc" .. T.owner .. "|r")
		or "|cff888888（选中帐篷后自动读取）|r")
	ui.sourceText:SetText("|cff9fb8b8" .. (T.ownerRaw or "目标：选中帐篷，或选中玩家本人") .. "|r")
	local on = DB().autoAccept
	if ui.acceptBtn then
		ui.acceptBtn:SetText(on and "|cff88ff66自动接受:开|r" or "|cff888888自动接受:关|r")
	end
	if not on then
		ui.hint:SetText("|cffff8888自动接受已关，收到邀请请手动点弹窗|r")
	elseif T.lastWhisperTo and (Now() - T.lastWhisperAt) <= 300 then
		ui.hint:SetText("|cff88ffaa已密语 " .. T.lastWhisperTo .. "，等他邀请 → 自动接受|r")
	else
		ui.hint:SetText("|cff9fd8c0自动接受：开（仅 5 分钟内密语过的人）|r")
	end
end
ns.UpdateUI = UpdateUI

-- ===================================================================
-- 唤出窗口：自动弹出 + 鼠标点击双保险 + 小地图图标
-- ===================================================================
CurrentTargetKey = function()
	if not UnitExists("target") then return nil end
	if type(UnitGUID) == "function" then
		local g = UnitGUID("target")
		if type(g) == "string" and g ~= ""
			and (type(canaccessvalue) ~= "function" or canaccessvalue(g)) then
			return g
		end
	end
	-- GUID 在受限状态可能是机密值，名字也可能晚到；但绝不能返回「无目标」，
	-- 否则 OnTargetChanged 会误判并跳过 tooltip 延迟重扫（弹不出来的真根因）
	if type(UnitName) == "function" then
		local un = UnitName("target")
		if type(un) == "string" and un ~= ""
			and (type(canaccessvalue) ~= "function" or canaccessvalue(un)) then
			return "name:" .. un
		end
	end
	return "target:pending"
end
ns.CurrentTargetKey = CurrentTargetKey

-- 判据放宽：只要目标名带「帐/篷」、tooltip 有归属行、或目标是 GameObject 就算。
-- 旧版要求先解析出 T.owner，但 GameObject 的归属行常常比 PLAYER_TARGET_CHANGED 晚到，
-- 那一瞬间判成 false -> 窗口永远不弹，这正是「有时候弹不出来」的主因之一。
local function LooksLikeTent()
	local un = T.unitName
	if type(un) == "string" and (un:find("帐", 1, true) or un:find("篷", 1, true)) then
		return true
	end
	if OwnerFromLine(T.ownerRaw) then return true end
	if type(UnitIsGameObject) == "function" and UnitIsGameObject("target") then return true end
	return false
end
local function IsTentTarget()
	if not UnitExists("target") then return false end
	if type(UnitIsPlayer) == "function" and UnitIsPlayer("target") then return false end
	return LooksLikeTent()
end
ns.IsTentTarget = IsTentTarget

-- 只在「用户主动关掉窗口且目标没换」时不再弹。切到别的目标后判重会清空，
-- 所以同一个帐篷切走再切回来照样会弹（旧版 autoShownFor 会永久卡死）。
TryAutoShow = function()
	local frame = ns.ui
	if not frame or not IsTentTarget() then return false end
	local key = CurrentTargetKey()
	if frame:IsShown() then
		T.autoShownFor = key
		return false
	end
	if T.autoShownFor == key then return false end
	frame:Show()
	T.autoShownFor = key
	WB:Emit("tent.autoshow", { name = T.owner, unit = T.unitName })
	return true
end
ns.TryAutoShow = TryAutoShow

-- 所有手动关闭入口统一走这里：记住当前目标，避免刚关掉又被自动弹出打脸
HideWindow = function()
	if ns.ui then ns.ui:Hide() end
	T.autoShownFor = CurrentTargetKey()
	-- 刚点 X 关掉的两秒内，别被紧接着的一次点击又弹回来
	T.manualHideAt = (type(GetTime) == "function" and GetTime()) or 0
end
ns.HideWindow = HideWindow

-- 左键点帐篷把窗口叫出来，作为自动弹出万一失灵时的第二保险。
-- 必须像帐篷才弹（平时点怪、点地面不打扰）；右键完全不处理，也不影响转视角。
ShowByClick = function(button)
	if button ~= "LeftButton" then return false end
	local frame = ns.ui
	if not frame then return false end
	if T.manualHideAt and type(GetTime) == "function"
		and (GetTime() - T.manualHideAt) < 2 then return false end
	if not UnitExists("target") then return false end
	if type(UnitIsPlayer) == "function" and UnitIsPlayer("target") then return false end
	if not LooksLikeTent() then return false end
	ScanTarget()
	frame:Show()
	T.autoShownFor = CurrentTargetKey()
	T.clickShows = (T.clickShows or 0) + 1
	WB:Emit("tent.clickshow", { button = button, name = T.owner, unit = T.unitName })
	return true
end
ns.ShowByClick = ShowByClick

local function OnTargetChanged()
	-- 目标清空时把上一次的名字也清干净，别让窗口留着旧帐篷主导致误发
	if not UnitExists("target") then
		T.lastTargetKey, T.autoShownFor = nil, nil
		T.owner, T.ownerRaw, T.unitName, T.lines = nil, nil, nil, {}
		UpdateUI()
		return
	end
	local key = CurrentTargetKey()
	if key ~= T.lastTargetKey then
		T.lastTargetKey = key
		T.autoShownFor = nil                 -- 换了目标，允许重新弹
		T.owner, T.ownerRaw = nil, nil       -- 别把上一个帐篷主的名字留着误判/误发
	end
	ScanTarget()
	TryAutoShow()
	-- tooltip 归属行可能比 PLAYER_TARGET_CHANGED 晚到，安排三次重扫补名字+补弹窗。
	-- 只判断「还选中着目标」，不比较 key：GUID 从读不到变读得到时 key 会变，
	-- 那种情况恰恰是最需要重扫的，比较 key 反而会把它跳过。
	if type(C_Timer) == "table" then
		for _, delay in ipairs({ 0.2, 0.6, 1.4 }) do
			C_Timer.After(delay, function()
				if not UnitExists("target") then return end
				if ns.ui and ns.ui:IsShown() and T.owner then return end
				ScanTarget()
				TryAutoShow()
			end)
		end
	end
end
ns.OnTargetChanged = OnTargetChanged

-- ===================================================================
-- 世界鼠标左键：点帐篷唤出窗口（右键完全不参与，不影响转视角）
-- ===================================================================
-- 两条通道互为保险：WorldFrame 的 OnMouseDown 钩子是主路径；
-- 万一这台客户端不把脚本事件派发给 WorldFrame，轻量轮询会顶上。
-- 两者都调 ns.OnWorldMouseDown（挂 ns 上，热加载后逻辑自动换新，不会累积钩子）。
ns.OnWorldMouseDown = function(button)
	if button ~= "LeftButton" then return end
	local t = (type(GetTime) == "function" and GetTime()) or 0
	if T.lastClickAt and (t - T.lastClickAt) < 0.35 then return end
	T.lastClickAt = t
	local sx, sy = GetCursorPosition()
	local scale = (UIParent and UIParent.GetEffectiveScale
		and UIParent:GetEffectiveScale()) or 1
	local lim = 40 * scale
	-- 左键延后一点，等 PLAYER_TARGET_CHANGED 把目标名更新好再判「是不是帐篷」；
	-- 同时用位移过滤掉按住左键转视角（阈值放宽，别把普通点击误杀）
	C_Timer.After(0.12, function()
		local cx, cy = GetCursorPosition()
		local dx, dy = cx - sx, cy - sy
		if dx * dx + dy * dy > lim * lim then return end
		ShowByClick(button)
	end)
end

if WorldFrame and type(WorldFrame.HookScript) == "function" and not ns.worldHooked then
	local ok = pcall(WorldFrame.HookScript, WorldFrame, "OnMouseDown", function(_, button)
		ns.worldHookFired = true
		if ns.OnWorldMouseDown then pcall(ns.OnWorldMouseDown, button) end
	end)
	ns.worldHooked = (ok ~= false)
end
-- 热加载：旧版轮询里带右键检测，先取消再按新版重建
if ns.clickTicker and ns.clickTickerVersion ~= 5 then
	pcall(function()
		if ns.clickTicker.Cancel then ns.clickTicker:Cancel() end
	end)
	ns.clickTicker = nil
end
if not ns.clickTicker and WorldFrame and type(C_Timer) == "table"
	and type(C_Timer.NewTicker) == "function"
	and type(IsMouseButtonDown) == "function" then
	local prevL = false
	ns.clickTicker = C_Timer.NewTicker(0.12, function()
		if ns.worldHookFired then return end      -- 钩子已证实可用，轮询让位
		local l = IsMouseButtonDown("LeftButton")
		if l and not prevL then
			if not WorldFrame.IsMouseOver or WorldFrame:IsMouseOver() then
				pcall(ns.OnWorldMouseDown, "LeftButton")
			end
		end
		prevL = l
	end)
	ns.clickTickerVersion = 5
end

local function BuildMinimapButton()
	-- 热加载：旧图标可能还挂着 1.0 的「右键立即密语」脚本，先摘干净
	local old = ns.minimapButton
	if old then
		old:Hide()
		for _, k in ipairs({ "OnClick", "OnEnter", "OnLeave",
			"OnDragStart", "OnDragStop", "OnUpdate" }) do
			old:SetScript(k, nil)
		end
		ns.minimapButton = nil
	end
	if not Minimap then return end

	local mb = CreateFrame("Button", nil, Minimap)
	ns.minimapButton = mb
	mb:SetFrameStrata("MEDIUM")
	mb:SetFrameLevel(8)
	mb:SetSize(31, 31)
	mb:RegisterForClicks("AnyUp")
	mb:RegisterForDrag("LeftButton")
	mb:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
	local border = mb:CreateTexture(nil, "OVERLAY")
	border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
	border:SetSize(54, 54)
	border:SetPoint("TOPLEFT", mb)
	-- 纯色 + 「帐」字，不依赖任何可能不存在的图标纹理
	local icon = mb:CreateTexture(nil, "BACKGROUND")
	icon:SetColorTexture(0.05, 0.42, 0.46, 1)
	icon:SetSize(20, 20)
	icon:SetPoint("TOPLEFT", mb, "TOPLEFT", 6, -5)
	local glyph = mb:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	glyph:SetPoint("CENTER", mb, "CENTER", 0, 0)
	glyph:SetText("帐")
	glyph:SetTextColor(1, 1, 1)

	local function PlaceAtAngle(self, rad)
		local w = (Minimap:GetWidth() / 2) + 6
		self:ClearAllPoints()
		self:SetPoint("CENTER", Minimap, "CENTER", math.cos(rad) * w, math.sin(rad) * w)
	end
	local function UpdatePos(self)
		local mx, my = Minimap:GetCenter()
		local scale = Minimap:GetEffectiveScale()
		local px, py = GetCursorPosition()
		px, py = px / scale, py / scale
		PlaceAtAngle(self, math.atan2(py - my, px - mx))
	end
	mb:SetScript("OnDragStart", function(self)
		self:LockHighlight()
		self:SetScript("OnUpdate", UpdatePos)
	end)
	mb:SetScript("OnDragStop", function(self)
		self:UnlockHighlight()
		self:SetScript("OnUpdate", nil)
		local mx, my = Minimap:GetCenter()
		local bx, by = self:GetCenter()
		DB().minimapAngle = math.atan2(by - my, bx - mx)
	end)
	local saved = DB().minimapAngle
	if saved then PlaceAtAngle(mb, saved)
	else PlaceAtAngle(mb, math.rad(135)) end   -- 默认左上 10 点方向；别用 (62,42) 那种落在地图内部的偏移

	-- 只做开关窗口，右键不发任何东西（避免 1.0 那种误发密语）
	mb:SetScript("OnClick", function(_, button)
		if button ~= "LeftButton" then return end
		if ui:IsShown() then HideWindow() else ui:Show() end
	end)
	mb:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
		GameTooltip:SetText("帐篷助手")
		GameTooltip:AddLine("帐篷主：" .. (T.owner or "（选中帐篷后自动显示）"), 0.6, 1, 0.9)
		GameTooltip:AddLine("左键：打开 / 关闭窗口", 1, 1, 1)
		GameTooltip:AddLine("选中帐篷时窗口自动弹出", 0.7, 0.7, 0.7)
		GameTooltip:AddLine("左键点帐篷：也能唤出窗口", 0.7, 0.7, 0.7)
		GameTooltip:AddLine("拖动：移动图标", 0.7, 0.7, 0.7)
		GameTooltip:Show()
	end)
	mb:SetScript("OnLeave", function() GameTooltip:Hide() end)
	mb:Show()
end
ns.BuildMinimapButton = BuildMinimapButton

-- ===================================================================
-- 事件
-- ===================================================================
local events = ns.events or CreateFrame("Frame")
ns.events = events
events:UnregisterAllEvents()
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_TARGET_CHANGED")
events:RegisterEvent("PARTY_INVITE_REQUEST")
events:RegisterEvent("CHAT_MSG_WHISPER_INFORM")
events:RegisterEvent("CHAT_MSG_SYSTEM")
events:RegisterEvent("ADDON_ACTION_FORBIDDEN")
events:RegisterEvent("ADDON_ACTION_BLOCKED")
events:SetScript("OnEvent", function(_, event, arg1, arg2)
	if event == "ADDON_LOADED" and arg1 == addonName then
		DB()
		UpdateUI()
	elseif event == "PLAYER_TARGET_CHANGED" then
		OnTargetChanged()
	elseif event == "PARTY_INVITE_REQUEST" then
		TryAcceptInvite(arg1)
	elseif event == "CHAT_MSG_WHISPER_INFORM" then
		T.confirmDeadline = nil       -- 密语确实发出去了，不用降级
	elseif event == "CHAT_MSG_SYSTEM" then
		-- 邀请发出后系统会播一条含「邀请」/名字的消息，看到就不再降级预填
		if T.inviteDeadline and CanRead(arg1) then
			local m = tostring(arg1)
			if m:find("邀请", 1, true)
				or (T.lastInviteTo and m:find(T.lastInviteTo, 1, true)) then
				T.inviteConfirmed, T.inviteDeadline = true, nil
			end
		end
	elseif event == "ADDON_ACTION_FORBIDDEN" or event == "ADDON_ACTION_BLOCKED" then
		-- 只在确实涉及本插件时降级，避免跟着旧 EasyGuildInvite 的 FORBIDDEN 刷屏
		local a1, a2 = tostring(arg1), tostring(arg2)
		local mine = a1:find(addonName, 1, true) or a2:find(addonName, 1, true)
		if mine and T.confirmDeadline then
			TentFallback("密语被安全策略拦截")
		end
		if mine and T.inviteDeadline and T.lastInviteTo then
			T.inviteDeadline, T.inviteFailed = nil, true
			Print("|cffff8888邀请被安全策略拦截|r，已改为预填：")
			PrefillCommand(InviteCommand(T.lastInviteTo))
		end
	end
end)

-- ===================================================================
-- 斜杠命令（只做开关 / 排障 / 手动兜底，绝不从命令行发密语）
-- ===================================================================
SLASH_TENTWHISPER1 = "/tw"
SLASH_TENTWHISPER2 = "/tent"
SlashCmdList["TENTWHISPER"] = function(msg)
	msg = tostring(msg or ""):match("^%s*(.-)%s*$") or ""
	local cmd, arg = msg:match("^(%S+)%s*(.-)%s*$")
	cmd = cmd or ""
	if cmd == "dump" then
		Print("=== 当前选中目标 ===")
		Print("  unitName =", tostring(T.unitName), "| 记住的帐篷主 =", tostring(T.owner))
		for i, ln in ipairs(T.lines) do
			Print(string.format("  行%d: %s", i, tostring(ln)))
		end
		if #T.lines == 0 then Print("  （没有 tooltip 行：请先选中帐篷再敲 /tw dump）") end
	elseif cmd == "name" and arg and arg ~= "" then
		local n = CleanOwner(arg)
		if not n or n == "" then n = SafeName(arg) end
		T.owner, T.ownerRaw, T.lastAt = (n ~= "" and n or nil), "手动指定", Now()
		Print("已手动指定玩家：|cff88ff88" .. tostring(T.owner) .. "|r")
		UpdateUI()
	elseif cmd == "inv" then
		-- 只预填、不直调：万一 C_PartyInfo.InviteUnit 被判受保护弹窗，用这条最稳
		if not T.owner then Print("还没读到帐篷主人，请先选中帐篷") return end
		PrefillCommand(InviteCommand(T.owner))
	elseif cmd == "" then
		if ui:IsShown() then HideWindow() else ui:Show() end
	elseif cmd == "show" then
		ui:Show()
	else
		Print("用法：/tw 开关窗口 | /tw show 强制唤出 | /tw dump 看目标原始信息")
		Print("      /tw name <名字> 手动指定 | /tw inv 只预填 /inv（不直调，最稳）")
		Print("      左键点击帐篷也能唤出窗口（/tw show 强制唤出）")
	end
end

-- ===================================================================
-- 给无限工坊 Agent 用的入口（纯读取/解析，不发聊天、不发邀请）
-- ===================================================================
WB:Expose("tent.status", function()
	return {
		owner = T.owner, ownerRaw = T.ownerRaw, unitName = T.unitName,
		lines = T.lines, text = DB().text, autoAccept = DB().autoAccept,
		lastWhisperTo = T.lastWhisperTo, lastInviteTo = T.lastInviteTo,
		minimapAngle = DB().minimapAngle, windowShown = ui and ui:IsShown(),
		autoShownFor = T.autoShownFor, lastTargetKey = T.lastTargetKey,
		isTent = IsTentTarget(), clickShows = T.clickShows or 0,
		worldHooked = ns.worldHooked, worldHookFired = ns.worldHookFired,
		clickTicker = ns.clickTicker ~= nil,
	}
end, "帐篷助手当前状态")

WB:Expose("tent.parse", function(args)
	local line = args and args.line
	return { line = line, owner = OwnerFromLine(line) }
end, "只测试归属行的名字解析，不做任何游戏动作：args.line")

WB:Expose("tent.invitecmd", function(args)
	local name = (args and args.name) or T.owner
	return { name = name, cmd = name and InviteCommand(name) or nil }
end, "只拼接 /inv 命令字符串，绝不做任何游戏动作：args.name 可省略")

-- ===================================================================
-- 热加载约定
-- ===================================================================
function ns.OnUnload()
	ns.wasShown = ui and ui:IsShown()
	if ui then ui:Hide() end
	if ns.minimapButton then ns.minimapButton:Hide() end
	return { db = ns.db }
end

function ns.OnReload(state)
	ns.db = (state and state.db) or _G.TentWhisperDB
	DB()
	if ns.wasShown and ui then ui:Show() end
	UpdateUI()
	TryAutoShow()
end

BuildUI()
DB()
BuildMinimapButton()
OnTargetChanged()          -- 扫一次 + 弹出 + 安排 tooltip 延迟重扫
UpdateUI()

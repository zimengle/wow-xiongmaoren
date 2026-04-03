--[[
LibExtraTip (Main)

LibExtraTip is a library of API functions for manipulating additional information into GameTooltips by either adding information to the bottom of existing tooltips (embedded mode) or by adding information to an extra "attached" tooltip construct which is placed to the bottom of the existing tooltip.

LibExtraTip is composed of multiple files:
LibExtraTipStartup.lua - startup checks and lib setup
LibExtraTipHandler_DataProc.lua - only one of the Handler files will load, depending on available Client APIs
LibExtraTipHandler_HookSet.lua
LibExtraTip.lua - main code file
LibMoneyFrame.lua - routines for handling display of money values
Load.xml - loads the lua files in the above order

Copyright (C) 2008-2024, by the respective below authors.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

@author Matt Richard (Tem)
@author Ken Allan <ken@norganna.org>
@author brykrys
@libname LibExtraTip
@version 1. see LibExtraTipStartup.lua for minor version
--]]

local lib = LibStub("LibExtraTip-1")
if not lib then return end
local private = lib.private
if not private then return end
local status, versions = private.status, private.versions
if not (status and versions) then return end

local LOAD_NEW = 5
local LOAD_START = 10
local LOAD_FAIL = 15
local LOAD_COMPLETE = 20

local ACTIVATE_START = 45
local ACTIVATE_FAIL = 50
local ACTIVATE_COMPLETE = 55

local DEACTIVATED = 99

if status.filetrackerMain ~= LOAD_NEW then return end
status.filetrackerMain = LOAD_START

local LIBSTRING = versions.LIBNAME.."_"..versions.MAJOR.."_"..versions.MINOR
local ExtraTipClass
local issecretvalue = issecretvalue or function() end

local defaultEnable = {
	SetAuctionItem = true,
	SetAuctionSellItem = true,
	SetBagItem = true,
	SetBuybackItem = true,
	SetGuildBankItem = true,
	SetInboxItem = true,
	SetInventoryItem = true,
	SetLootItem = true,
	SetLootRollItem = true,
	SetMerchantItem = true,
	SetQuestItem = true,
	SetQuestLogItem = true,
	SetSendMailItem = true,
	SetTradePlayerItem = true,
	SetTradeTargetItem = true,
	SetRecipeReagentItem = true,
	SetRecipeResultItem = true,
	SetTradeSkillItem = true,
	SetCraftItem = true,
	SetHyperlink = true,
	SetHyperlinkAndCount = true,
	SetBattlePet = true,
	SetBattlePetAndCount = true,
	SetItemKey = true,
}

local alwaysEnable = {
	extrashow = true,
	extrahide = true,
}

local iconpath = "Interface\\MoneyFrame\\UI-"
local goldicon = "%.0f|T"..iconpath.."GoldIcon:0|t"
local silvericon = "%s|T"..iconpath.."SilverIcon:0|t"
local coppericon = "%s|T"..iconpath.."CopperIcon:0|t"

local function SafeSetHyperlink(tooltip, link)
	if not tooltip or not link or type(link) ~= "string" then return false end
	if issecretvalue and issecretvalue(link) then return false end

	local validTypes = {
		item = true,
		spell = true,
		achievement = true,
		currency = true,
		quest = true,
		battlepet = true,
		enchant = true,
	}

	local linkType = link:match("^(%w+):")
	if not linkType or not validTypes[linkType] then return false end

	local success = pcall(function()
		tooltip:SetHyperlink(link)
	end)
	return success
end

local function ProcessCallbacks(reg, tiptype, tooltip, ...)
	if not reg then return end

	local event = reg.additional.event or "Unknown"
	local default = defaultEnable[event]

	if lib.sortedCallbacks and #lib.sortedCallbacks > 0 then
		for i,options in ipairs(lib.sortedCallbacks) do
			if options.type == tiptype then
				local enable = default
				if options.allevents or alwaysEnable[tiptype] then
					enable = true
				elseif options.enable and options.enable[event] ~= nil then
					enable = options.enable[event]
				end
				if enable then
					options.callback(tooltip, ...)
				end
			end
		end
	end
end

function private.GetRegistry(tooltip)
	return lib.tooltipRegistry[tooltip]
end

function private.ProcessItem(tooltip, reg)
	local self = lib
	local additional = reg.additional
	local item = additional.item
	local name, quantity, link, quality = additional.name, additional.quantity, additional.link, additional.quality

	if not name or not link then return end
	if issecretvalue and issecretvalue(link) then return end
	if not self.sortedCallbacks or #self.sortedCallbacks == 0 then return end

	reg.hasItem = true
	local extraTip = private.GetFreeExtraTipObject()
	reg.extraTip = extraTip
	extraTip:Attach(tooltip)
	local qcol = ITEM_QUALITY_COLORS[quality] or ITEM_QUALITY_COLORS[1]
	extraTip:AddLine(name, qcol.r, qcol.g, qcol.b)

	ProcessCallbacks(reg, "item", tooltip, item, quantity, name, link, quality)
	tooltip:Show()
	if reg.extraTipUsed then
		extraTip:Show()
		ProcessCallbacks(reg, "extrashow", tooltip, extraTip)
	end
end

function private.ProcessSpell(tooltip, reg)
	local self = lib
	local additional = reg.additional
	local name, spellID = additional.name, additional.spellID
	local category = additional.category
	local link = additional.link or additional.eventLink or additional.spellLink

	if not name then return end
	if not self.sortedCallbacks or #self.sortedCallbacks == 0 then return end

	reg.hasItem = true
	local extraTip = private.GetFreeExtraTipObject()
	reg.extraTip = extraTip
	extraTip:Attach(tooltip)
	extraTip:AddLine(name, 1, 0.8, 0)

	ProcessCallbacks(reg, "spell", tooltip, link, name, category, spellID)
	tooltip:Show()
	if reg.extraTipUsed then
		extraTip:Show()
		ProcessCallbacks(reg, "extrashow", tooltip, extraTip)
	end
end

function private.ProcessUnit(tooltip, reg)
	local self = lib
	local additional = reg.additional
	local name, unitId = additional.name, additional.unitId

	if tooltip:IsAnchoringRestricted() then return end
	if not name or not self.sortedCallbacks or #self.sortedCallbacks == 0 then return end

	reg.hasItem = true
	local extraTip = private.GetFreeExtraTipObject()
	reg.extraTip = extraTip
	extraTip:Attach(tooltip)
	extraTip:AddLine(name, 0.8, 0.8, 0.8)

	ProcessCallbacks(reg, "unit", tooltip, name, unitId)
	tooltip:Show()
	if reg.extraTipUsed then
		extraTip:Show()
		ProcessCallbacks(reg, "extrashow", tooltip, extraTip)
	end
end

function private.OnCleared(tooltip)
	local reg = lib.tooltipRegistry[tooltip]
	if not reg then return end
	if reg.ignoreOnCleared then return end
	tooltip:SetFrameLevel(1)

	reg.extraTipUsed = nil
	reg.hasItem = nil
	wipe(reg.additional)
	local extraTip = reg.extraTip
	if extraTip then
		reg.extraTip = nil
		extraTip:Release()
		extraTip:ClearLines()
		extraTip:SetHeight(0)
		extraTip:SetWidth(0)
		extraTip:Hide()
		ProcessCallbacks(reg, "extrahide", tooltip, extraTip)
		tinsert(lib.extraTippool, extraTip)
	end
end

function private.OnSetBattlePet(tooltip, data)
	local reg = lib.tooltipRegistry[tooltip]
	if not reg then return end

	if reg.hasItem then
		private.OnCleared(tooltip)
	end
	if lib.sortedCallbacks and #lib.sortedCallbacks > 0 then
		local speciesID = data.speciesID
		local level = data.level
		local breedQuality = data.breedQuality
		local maxHealth = data.maxHealth
		local power = data.power
		local speed = data.speed
		local battlePetID = data.battlePetID or "0x0000000000000000"
		local name = data.name
		local customName = data.customName
		local petType = data.petType
		local colcode, r, g, b

		if breedQuality == -1 then
			colcode = NORMAL_FONT_COLOR_CODE
			r, g, b = NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b
		else
			local coltable = ITEM_QUALITY_COLORS[breedQuality] or ITEM_QUALITY_COLORS[0]
			colcode = coltable.hex
			r, g, b = coltable.r, coltable.g, coltable.b
		end

		local additional = reg.additional
		local quantity = additional.quantity or 1
		local link = additional.eventLink
		if not link then
			link = format("%s|Hbattlepet:%d:%d:%d:%d:%d:%d:%s|h[%s]|h|r", colcode, speciesID, level, breedQuality, maxHealth, power, speed, battlePetID, customName or name)
		end

		reg.hasItem = true
		local extraTip = private.GetFreeExtraTipObject()
		reg.extraTip = extraTip
		extraTip:Attach(tooltip)
		extraTip:AddLine(name, r, g, b)

		additional.name = name
		additional.link = link
		additional.speciesID = speciesID
		additional.quality = breedQuality
		additional.quantity = quantity
		additional.level = level
		additional.customName = customName
		additional.petType = petType
		additional.maxHealth = maxHealth
		additional.power = power
		additional.speed = speed
		additional.battlePetID = battlePetID
		additional.event = additional.event or "SetBattlePet"

		ProcessCallbacks(reg, "battlepet", tooltip, link, quantity, name, speciesID, breedQuality, level)
		if reg.extraTipUsed then
			reg.extraTip:Show()
			ProcessCallbacks(reg, "extrashow", tooltip, reg.extraTip)
		end
	end
end

function private.OnResize(tooltip,w,h)
	local reg = lib.tooltipRegistry[tooltip]
	if not reg then return end
	local extraTip = reg.extraTip
	if extraTip then extraTip:MatchSize() end
end

function private.OnShowCalled(tooltip)
	local reg = lib.tooltipRegistry[tooltip]
	if not reg then return end
	local extraTip = reg.extraTip
	if extraTip then extraTip:MatchSize() end
end

function private.GetFreeExtraTipObject()
	if not lib.extraTippool then lib.extraTippool = {} end
	return tremove(lib.extraTippool) or ExtraTipClass:new()
end

local HOOKSTORE_VERSION = "D"
if not lib.hookStore or lib.hookStore.version ~= HOOKSTORE_VERSION then
	lib.hookStore = {version = HOOKSTORE_VERSION}
end

function private.HookMethod(tip, method, prehook, posthook)
	if not lib.hookStore[tip] then lib.hookStore[tip] = {} end
	local control = lib.hookStore[tip][method]
	if control then
		if prehook or posthook then
			control[1] = prehook or control[1] or false
			control[2] = posthook or control[2] or false
		else
			control[1] = false
			control[2] = false
		end
		return
	end
	local orig = tip[method]
	if not orig then return end
	control = {prehook or false, posthook or false}
	lib.hookStore[tip][method] = control
	local stub = function(...)
		local hook
		hook = control[1]
		if hook then hook(...) end
		local a,b,c,d,e,f,g,h,i,j,k = orig(...)
		hook = control[2]
		if hook then hook(...) end
		return a,b,c,d,e,f,g,h,i,j,k
	end
	tip[method] = stub
end

function private.HookMethodSecure(tip, method, posthook)
	if not lib.hookStore[tip] then lib.hookStore[tip] = {} end
	local methodkey = "#"..method
	local control = lib.hookStore[tip][methodkey]
	if control then
		control[1] = posthook
		return
	end
	if not tip[method] then return end
	control = {posthook}
	lib.hookStore[tip][methodkey] = control
	local stub = function(...)
		local hook = control[1]
		if hook then hook(...) end
	end
	hooksecurefunc(tip, method, stub)
end

function private.HookScriptBasic(tip, script, prehook)
	if not lib.hookStore[tip] then lib.hookStore[tip] = {} end
	local control
	control = lib.hookStore[tip][script]
	if control then
		control[1] = prehook
		return
	end
	local orig = tip:GetScript(script)
	control = {prehook}
	lib.hookStore[tip][script] = control
	local stub = function(...)
		local h = control[1]
		if h then h(...) end
		if orig then orig(...) end
	end
	tip:SetScript(script, stub)
end

function private.HookScriptSecure(tip, script, posthook)
	if not tip:HasScript(script) then return end
	if not lib.hookStore[tip] then lib.hookStore[tip] = {} end
	local scriptkey = "#"..script
	local control = lib.hookStore[tip][scriptkey]
	if control then
		control[1] = posthook
		return
	end
	control = {posthook}
	lib.hookStore[tip][scriptkey] = control
	local stub = function(...)
		local h = control[1]
		if h then h(...) end
	end
	tip:HookScript(script, stub)
end

function private.HookGlobalSecure(func, posthook)
	local orig = _G[func]
	if type(orig) ~= "function" then return end
	if not lib.hookStore.global then lib.hookStore.global = {} end
	local control = lib.hookStore.global[func]
	if control then
		control[1] = posthook
		return
	end
	control = {posthook}
	lib.hookStore.global[func] = control
	local stub = function(...)
		local hook = control[1]
		if hook then hook(...) end
	end
	hooksecurefunc(func, stub)
end

function private.HookDataProcessor(datatype, posthook)
	if not lib.hookStore.tooltipdata then lib.hookStore.tooltipdata = {} end
	local control = lib.hookStore.tooltipdata[datatype]
	if control then
		control[1] = posthook
		return
	end
	control = {posthook}
	lib.hookStore.tooltipdata[datatype] = control
	local stub = function(...)
		local hook = control[1]
		if hook then hook(...) end
	end
	TooltipDataProcessor.AddTooltipPostCall(datatype, stub)
end

function lib:RegisterTooltip(tooltip)
	if not lib:IsActive() then return nil, "Library Inactive" end
	if not tooltip or type(tooltip) ~= "table" or type(tooltip.GetObjectType) ~= "function" then return nil, "Invalid Tooltip" end

	if not self.tooltipRegistry[tooltip] then
		local reg = {}
		local success, text = private.RegisterTooltipHandler(tooltip, reg)
		if not success then return nil, text end
		self.tooltipRegistry[tooltip] = reg
		reg.additional = {}
		return true, true
	end
	return true
end

function lib:IsRegistered(tooltip)
	if not self.tooltipRegistry or not self.tooltipRegistry[tooltip] then return end
	return true
end

function lib:GetExtraTip(tooltip)
	if not self.tooltipRegistry then return end
	local reg = self.tooltipRegistry[tooltip]
	if reg then return reg.extraTip end
end

local sortFunc
function lib:AddCallback(options,priority)
	if not options then return end
	local otype = type(options)
	if otype == "function" then
		options = {type = "item", callback = options}
	elseif otype == "table" then
		if type(options.type) ~= "string" or type(options.callback) ~= "function" then return end
		local copyoptions = {type = options.type, callback = options.callback}
		if options.allevents == true then
			copyoptions.allevents = true
		elseif type(options.enable) == "table" then
			copyoptions.enable = options.enable
		end
		options = copyoptions
	else
		return
	end

	if not sortFunc then
		local callbacks = self.callbacks or {}
		self.callbacks = callbacks
		self.sortedCallbacks = {}
		sortFunc = function(a,b) return callbacks[a] < callbacks[b] end
	end

	self.callbacks[options] = priority or 200
	tinsert(self.sortedCallbacks,options)
	sort(self.sortedCallbacks,sortFunc)
end

function lib:RemoveCallback(callback)
	if not (callback and self.callbacks) then return end
	if not self.callbacks[callback] then
		for options, priority in pairs(self.callbacks) do
			if options.callback == callback then callback = options break end
		end
		if not self.callbacks[callback] then return end
	end
	self.callbacks[callback] = nil
	for index,options in ipairs(self.sortedCallbacks) do
		if options == callback then tremove(self.sortedCallbacks, index) return true end
	end
end

function lib:SetEmbedMode(flag)
	self.embedMode = flag and true or false
end

function lib:AddLine(tooltip, text, r, g, b, embed, wrap)
	local reg = self.tooltipRegistry[tooltip]
	if not reg then return end

	if reg.NoColumns then
		embed = false
	else
		if r and not g then embed = r r = nil end
		if embed == nil then embed = self.embedMode end
	end
	if not embed then
		reg.extraTip:AddLine(text, r, g, b, wrap)
		reg.extraTipUsed = true
	else
		tooltip:AddLine(text, r, g, b, wrap)
	end
end

function lib:AddDoubleLine(tooltip,textLeft,textRight,lr,lg,lb,rr,rg,rb,embed)
	local reg = self.tooltipRegistry[tooltip]
	if not reg then return end

	if reg.NoColumns then
		embed = false
	else
		if lr and not lg and not rr then embed = lr lr = nil end
		if lr and lg and rr and not rg then embed = rr rr = nil end
		if embed == nil then embed = self.embedMode end
	end
	if not embed then
		reg.extraTip:AddDoubleLine(textLeft,textRight,lr,lg,lb,rr,rg,rb)
		reg.extraTipUsed = true
	else
		tooltip:AddDoubleLine(textLeft,textRight,lr,lg,lb,rr,rg,rb)
	end
end

function lib:GetMoneyText(money, concise)
	local g = floor(money / 10000)
	local s = floor(money % 10000 / 100)
	local c = floor(money % 100)
	local colorBlindEnabled = GetCVar("colorblindMode") == "1"
	local moneyText = ""
	local sep, fmt = "", "%d"

	if g > 0 then
		if colorBlindEnabled then
			moneyText = format("%.0f",g)..GOLD_AMOUNT_SYMBOL
		else
			moneyText = goldicon:format(g)
		end
		sep, fmt = " ", "%02d"
	end

	if s > 0 or (money >= 10000 and ((concise and c > 0) or not concise)) then
		if colorBlindEnabled then
			moneyText = moneyText..sep..format(fmt,s)..SILVER_AMOUNT_SYMBOL
		else
			moneyText = moneyText..sep..silvericon:format(fmt):format(s)
		end
		sep, fmt = " ", "%02d"
	end

	if not concise or c > 0 or money < 100 then
		if colorBlindEnabled then
			moneyText = moneyText..sep..format(fmt,c)..COPPER_AMOUNT_SYMBOL
		else
			moneyText = moneyText..sep..coppericon:format(fmt):format(c)
		end
	end

	return moneyText
end

function lib:AddMoneyLine(tooltip,text,money,r,g,b,embed,concise)
	local reg = self.tooltipRegistry[tooltip]
	if not reg then return end

	if reg.NoColumns then
		embed = false
	else
		if r and not g then embed = r r = nil end
		if embed == nil then embed = self.embedMode end
	end

	local moneyText = self:GetMoneyText(money, concise)

	if not embed then
		reg.extraTip:AddDoubleLine(text,moneyText,r,g,b,1,1,1)
		reg.extraTipUsed = true
	else
		tooltip:AddDoubleLine(text,moneyText,r,g,b,1,1,1)
	end
end

-- ✅ 修复完成：安全版 SetHyperlinkAndCount
function lib:SetHyperlinkAndCount(tooltip, link, quantity, detail)
	local reg = self.tooltipRegistry[tooltip]
	if not reg or reg.NoColumns then return end
	if not link or type(link) ~= "string" then return end

	private.OnCleared(tooltip)
	local additional = reg.additional
	additional.quantity = quantity
	additional.event = "SetHyperlinkAndCount"
	additional.eventLink = link
	if detail then for k,v in pairs(detail) do reg.additional[k] = v end end

	reg.ignoreOnCleared = true
	reg.ignoreSetHyperlink = true

	-- 安全调用
	SafeSetHyperlink(tooltip, link)

	reg.ignoreSetHyperlink = nil
	reg.ignoreOnCleared = nil
	return true
end

local BATTLE_PET_TOOLTIP = {}
function lib:SetBattlePetAndCount(tooltip, link, quantity, detail)
	if not link then return end
	local reg = lib.tooltipRegistry[tooltip]
	if not reg or not reg.NoColumns then return end
	local head, speciesID, level, breedQuality, maxHealth, power, speed, tail = strsplit(":", link)
	if not tail or head:sub(-9) ~= "battlepet" then return end
	speciesID = tonumber(speciesID)
	if not speciesID or speciesID < 1 then return end
	local name, icon, petType = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
	if not name then return end

	BATTLE_PET_TOOLTIP.speciesID = speciesID
	BATTLE_PET_TOOLTIP.name = name
	BATTLE_PET_TOOLTIP.level = tonumber(level)
	BATTLE_PET_TOOLTIP.breedQuality = tonumber(breedQuality)
	BATTLE_PET_TOOLTIP.petType = petType
	BATTLE_PET_TOOLTIP.maxHealth = tonumber(maxHealth)
	BATTLE_PET_TOOLTIP.power = tonumber(power)
	BATTLE_PET_TOOLTIP.speed = tonumber(speed)
	local customName = strmatch(tail, "%[(.+)%]")
	BATTLE_PET_TOOLTIP.customName = (customName ~= BATTLE_PET_TOOLTIP.name) and customName or nil

	private.OnCleared(tooltip)
	local additional = reg.additional
	additional.quantity = quantity
	additional.event = "SetBattlePetAndCount"
	additional.eventLink = link
	if detail then for k,v in pairs(detail) do additional[k] = v end end

	reg.ignoreOnCleared = true
	BattlePetTooltipTemplate_SetBattlePet(tooltip, BATTLE_PET_TOOLTIP)

	local owned = C_PetJournal.GetOwnedBattlePetString(speciesID)
	tooltip.Owned:SetText(owned)
	if owned == nil then
		if tooltip.Delimiter then
			tooltip:SetSize(260,150)
			tooltip.Delimiter:ClearAllPoints()
			tooltip.Delimiter:SetPoint("TOPLEFT",tooltip.SpeedTexture,"BOTTOMLEFT",-6,-5)
		else
			tooltip:SetSize(260,122)
		end
	else
		if tooltip.Delimiter then
			tooltip:SetSize(260,164)
			tooltip.Delimiter:ClearAllPoints()
			tooltip.Delimiter:SetPoint("TOPLEFT",tooltip.SpeedTexture,"BOTTOMLEFT",-6,-19)
		else
			tooltip:SetSize(260,136)
		end
	end

	tooltip:Show()
	reg.ignoreOnCleared = nil
	return true
end

function lib:GetTooltipAdditional(tooltip)
	local reg = self.tooltipRegistry[tooltip]
	if reg then return reg.additional end
	return nil
end

function lib:IsActive()
	if status.filetrackerMain == ACTIVATE_COMPLETE and status.filetrackerHandler == ACTIVATE_COMPLETE then
		return true
	end
end

function lib:Deactivate()
	status.filetrackerMain = DEACTIVATED

	for tooltip, tiptable in pairs(lib.hookStore) do
		if tooltip ~= "version" then
			for method, control in pairs(tiptable) do wipe(control) end
		end
	end

	if self.tooltipRegistry then
		for _, reg in pairs(self.tooltipRegistry) do
			local tip = reg.extraTip
			if tip then tip:Hide() tip:Release() end
			reg.extraTip = nil
			reg.extraTipUsed = nil
		end
	end
	self.extraTippool = nil
	private.DeactivateHandler()
end

function lib:Activate()
	if private.startup then private.startup.ActivateMain() end
end

function private.startup.ActivateMain()
	local startup = private.startup
	private.startup = nil
	if status.filetrackerMain == LOAD_COMPLETE then
		status.filetrackerMain = ACTIVATE_START
	else
		return
	end

	local oldreg = lib.tooltipRegistry
	lib.tooltipRegistry = {}

	if not startup.ActivateHandler or not startup.ActivateHandler(startup) then
		status.filetrackerMain = ACTIVATE_FAIL
		return
	end

	if status.filetrackerMain == ACTIVATE_START then
		status.filetrackerMain = ACTIVATE_COMPLETE
	else
		return
	end

	if oldreg then for tooltip in pairs(oldreg) do lib:RegisterTooltip(tooltip) end end
	local oldcallbacks = lib.callbacks
	if oldcallbacks then
		lib.callbacks = nil
		for options, priority in pairs(oldcallbacks) do lib:AddCallback(options, priority) end
	end
end

do
	local methods = {"InitLines","Attach","Show","MatchSize","Release","SetParentClamp"}
	local scripts = {"OnShow","OnHide","OnSizeChanged"}
	local numTips = 0
	local class = {}
	ExtraTipClass = class

	local addLine,addDoubleLine,show = GameTooltip.AddLine,GameTooltip.AddDoubleLine,GameTooltip.Show

	local line_mt = {
		__index = function(t,k)
			local v = _G[t.name..k]
			rawset(t,k,v)
			return v
		end
	}

	function class:new()
		local n = numTips + 1
		numTips = n
		local o = CreateFrame("GameTooltip",LIBSTRING.."Tooltip"..n,UIParent,"GameTooltipTemplate")
		o:SetClampedToScreen(false)

		for _,m in ipairs(methods) do o[m] = self[m] end
		for _,s in ipairs(scripts) do o:SetScript(s, self[s]) end

		o.LibExtraTipLeft = setmetatable({name = o:GetName().."TextLeft"}, line_mt)
		o.LibExtraTipRight = setmetatable({name = o:GetName().."TextRight"}, line_mt)
		return o
	end

	local pointsRight = {"TOPRIGHT", "BOTTOMRIGHT"}
	local pointsCentre = {"TOP", "BOTTOM"}
	local pointsLeft = {"TOPLEFT", "BOTTOMLEFT"}
	local attachPointsLookup = {
		TOPLEFT = pointsLeft, TOPRIGHT = pointsRight,
		BOTTOMLEFT = pointsLeft, BOTTOMRIGHT = pointsRight,
		TOP = pointsCentre, BOTTOM = pointsCentre,
		LEFT = pointsLeft, RIGHT = pointsRight, CENTER = pointsCentre,
	}

	function class:Attach(tooltip)
		if self.parent then self:SetParentClamp(0) end
		self.parent = tooltip
		self:SetParent(tooltip)
		self:SetOwner(tooltip,"ANCHOR_NONE")
		local parentPoint = tooltip:GetPoint(1)
		local attach = issecretvalue(parentPoint) and pointsCentre or attachPointsLookup[parentPoint] or pointsCentre
		self:SetPoint(attach[1], tooltip, attach[2])
	end

	function class:Release()
		if self.parent then self:SetParentClamp(0) end
		self.parent = nil
		self:SetParent(nil)
		self:ClearAllPoints()
		self.inMatchSize = nil
	end

	function class:InitLines()
		local nlines = self:NumLines()
		local changedLines = self.changedLines or 0
		if changedLines < nlines then
			for i = changedLines+1, nlines do
				local left, right = self.LibExtraTipLeft[i], self.LibExtraTipRight[i]
				local font = i == 1 and GameFontNormal or GameFontNormalSmall
				local r,g,b,a = left:GetTextColor()
				left:SetFontObject(font) left:SetTextColor(r,g,b,a)
				r,g,b,a = right:GetTextColor()
				right:SetFontObject(font) right:SetTextColor(r,g,b,a)
			end
			self.changedLines = nlines
			return true
		end
	end

	function class:SetParentClamp(h)
		local p = self.parent
		if not p then return end
		local l,r,t,b = p:GetClampRectInsets()
		p:SetClampRectInsets(l,r,t,-h)
	end

	function class:OnShow() self:SetParentClamp(self:GetHeight()) self:MatchSize() end
	function class:OnSizeChanged(w,h) self:SetParentClamp(h) self:MatchSize() end
	function class:OnHide() self:SetParentClamp(0) end

	local function fixRight(tooltip, width)
		local lefts = tooltip.LibExtraTipLeft or setmetatable({name = tooltip:GetName().."TextLeft"}, line_mt)
		local rights = tooltip.LibExtraTipRight or setmetatable({name = tooltip:GetName().."TextRight"}, line_mt)
		tooltip.LibExtraTipLeft = lefts
		tooltip.LibExtraTipRight = rights
		local xofs = width - tooltip:GetPadding() - 20.5
		for i = 1, tooltip:NumLines() do
			local l, r = lefts[i], rights[i]
			if l and r then r:ClearAllPoints() r:SetPoint("RIGHT", l, "LEFT", xofs, 0) end
		end
	end

	function class:MatchSize()
		if self.inMatchSize then return end
		local p = self.parent
		if not p then return end
		local reg = lib.tooltipRegistry[p]
		if not reg or not reg.extraTipUsed then return end
		if p.IsAnchoringSecret and (p:IsAnchoringSecret() or self:IsAnchoringSecret()) then return end

		self.inMatchSize = true
		local pw, w = p:GetWidth(), self:GetWidth()
		local d = pw - w
		if d > .5 then
			self:SetWidth(pw)
			fixRight(self, pw)
		elseif d < -.5 and not reg.NoColumns then
			p:SetWidth(w)
			fixRight(p, w)
			p:GetWidth()
		end
		self.inMatchSize = nil
	end

	function class:Show()
		show(self)
		if self:InitLines() then show(self) end
		self:MatchSize()
	end
end

if status.filetrackerMain == LOAD_START then
	status.filetrackerMain = LOAD_COMPLETE
end

lib:SetEmbedMode(lib.embedMode)
lib:Activate()

-- 快跑兄弟修复 LibExtraTip 在处理非法/残缺/加密链接时，调用 SetHyperlink 导致的 Unknown link type 报错。
-- 快跑兄弟修复 SetHyperlinkAndCount 中的危险调用 2026.03.26
local addonName, addonTable = ...;
local L=addonTable.locale
local Locale= GetLocale()
local EnableAddOn=EnableAddOn or C_AddOns and C_AddOns.EnableAddOn
-----
local Create=addonTable.Create
local PIGFrame=Create.PIGFrame
local PIGButton=Create.PIGButton
local PIGOptionsList=Create.PIGOptionsList
local PIGFontString=Create.PIGFontString
local PIGSetFont=Create.PIGSetFont
local Data=addonTable.Data
--------
local extname ={"Tardis","GDKP","Farm"}
L.addnames ={addonName}
for i=1,#extname do
	L.addnames[i+1] =addonName.."_"..extname[i]
end
local addData={
	[L.addnames[1]]={
		open=true,
	},
	[L.addnames[2]]={
		open=true,
	},
	[L.addnames[3]]={
		open=true,
	},
	[L.addnames[4]]={
		open=true,
	},
}
if Locale == "zhCN" or Locale == "zhTW" then
	local DOWN_url1 = "网易DD(dd.163.com)|cff00FFFF插件库|r搜索"
	local DOWN_url2 = "新手盒子(wclbox.com)|cff00FFFF插件库|r搜索"
	local DOWN_url3 = "新手盒子(wclbox.com)|cffFF00FF配置分享改为按标题&作者搜索"
	for i=1,#L.addnames-1 do
		addData[L.addnames[i]].down_1 = DOWN_url1
		addData[L.addnames[i]].down_2 = DOWN_url2
	end
	addData[L.addnames[4]].down_1 = DOWN_url1
	addData[L.addnames[4]].down_2 = DOWN_url3
	if Locale == "zhCN" then
		addData[L.addnames[1]].nameLocale="工具箱"
		addData[L.addnames[1]].tooltip="工具合集。整合很多小功能，可以极大减少你的插件数量"
		addData[L.addnames[2]].nameLocale="汇合石"
		addData[L.addnames[2]].tooltip="组队增强，查找队伍或车头/找队员/换位面/便捷喊话（智能邀请回复）"
		addData[L.addnames[3]].nameLocale="金团助手"
		addData[L.addnames[3]].tooltip="拾取记录，快速拍卖/出价，补助/罚款记录，分G助手等"
		addData[L.addnames[4]].nameLocale="带本助手"
		addData[L.addnames[4]].tooltip="伐木/带本日志"
	elseif Locale == "zhTW" then
		addData[L.addnames[1]].nameLocale="工具箱"
		addData[L.addnames[1]].tooltip="工具合集。整合很多小功能，可以極大減少你的插件數量"
		addData[L.addnames[2]].nameLocale="匯合石"
		addData[L.addnames[2]].tooltip="組隊增強，查找隊伍或車頭/找隊員/換位面/便捷喊話（智能邀請回復）"
		addData[L.addnames[3]].nameLocale="金團助手"
		addData[L.addnames[3]].tooltip="拾取記錄，快速拍賣/出價，補助/罰款記錄，分G助手等"
		addData[L.addnames[4]].nameLocale="帶本助手"
		addData[L.addnames[4]].tooltip="伐木/帶本日誌"
	end
else
	local DOWN_url1 = "CurseForge app Search"
	local DOWN_url2 = "Wago Add Search"
	local DOWN_url3 = "----"
	addData[L.addnames[1]].nameLocale="Toolbox"
	addData[L.addnames[1]].tooltip="A toolbox. Integrating many small features can greatly reduce the number of plug-ins you have"
	addData[L.addnames[2]].nameLocale="Tardis-Rally"
	addData[L.addnames[2]].tooltip="Invite enhancement"
	addData[L.addnames[3]].nameLocale="GDKP"
	addData[L.addnames[3]].tooltip="GDKP Assistant"
	addData[L.addnames[4]].nameLocale="Farm"
	addData[L.addnames[4]].tooltip="Dungeon adventure log"
	for i=1,#L.addnames-1 do
		addData[L.addnames[i]].down_1 = DOWN_url1
		addData[L.addnames[i]].down_2 = DOWN_url2
	end
	addData[L.addnames[4]].down_1 = DOWN_url3
	addData[L.addnames[4]].down_2 = DOWN_url3
end
L.ExtList = {}
for i=1,#L.addnames do
	local addname=L.addnames[i]
	L.ExtList[addname]={
		["open"]=addData[addname].open,
		["nameLocale"]=addData[addname].nameLocale,
		["nameLocaleAll"]=addonName..addData[addname].nameLocale,
		["tooltip"]=addData[addname].tooltip,
		["down_1"] = addData[addname].down_1,
		["down_2"] = addData[addname].down_2,
	}
end
---addext
local function addEditBox1(fuji,PointU,addname,downurl)
	if downurl then
		local T1= PIGFontString(fuji,{"LEFT",PointU,"RIGHT",4,0},downurl,"OUTLINE")
		T1:SetTextColor(1, 1, 1, 1);
		if fuji.down then
			T1:SetPoint("TOPLEFT",fuji.down,"BOTTOMLEFT",0,-4);
		end
		fuji.down=T1
		local T2E = CreateFrame("EditBox", nil, fuji, "InputBoxInstructionsTemplate");
		T2E:SetSize(120,20);
		T2E:SetPoint("LEFT",T1,"RIGHT",4,0);
		PIGSetFont(T2E, 14, "OUTLINE");
		T2E:SetAutoFocus(false);
		T2E:SetTextColor(0, 1, 1, 1);
		T2E.tips = PIGFontString(T2E,{"LEFT",T2E,"RIGHT",0,0},nil,"OUTLINE")
		T2E.tips:SetTextColor(1, 0, 0, 1);
		T2E:SetScript("OnEditFocusGained", function(self) self:HighlightText() end);
		T2E:SetScript("OnEscapePressed", function(self) self:SetTextpig() self:ClearFocus() end);
		T2E:SetScript("OnEditFocusLost", function(self) self:SetTextpig() end);
		T2E:SetScript("OnEnterPressed", function(self) self:SetTextpig() end);
		function T2E:SetTextpig()
			self:SetText(addname);
			self.tips:SetText("");
		end
		T2E:SetTextpig()
	end
end
local function add_extLsitFrame(ly,fuFrame,addname,adddata)
	if fuFrame.errorUI then return end
	local addnameF=PIGFrame(fuFrame,nil,{1,14})
	fuFrame.errorUI=addnameF
	addnameF:SetPoint("TOPLEFT",fuFrame,"TOPLEFT",20,-60);
	addnameF.addnameT = PIGFontString(addnameF,{"LEFT",addnameF,"RIGHT",0,0},"|cff00FFFF"..adddata.nameLocaleAll.."|r","OUTLINE",16)
	addnameF.err = PIGFontString(addnameF,{"LEFT", addnameF.addnameT, "RIGHT", 10,0},"","OUTLINE",18);
	addnameF.err:SetTextColor(1, 0, 0, 1);
	addnameF.Reloadbut = PIGButton(addnameF,{"LEFT", addnameF.err, "RIGHT", 0,0},{100,22},ENABLE);
	addnameF.Reloadbut:SetScript("OnClick", function ()
		EnableAddOn(addname)
		ReloadUI();
	end)
	addnameF.tooltip = PIGFontString(addnameF,{"TOPLEFT", addnameF.addnameT, "BOTTOMLEFT", 0,-6},L["ABOUT_FUNC"]..adddata.tooltip,"OUTLINE");
	addnameF.tooltip:SetTextColor(0, 1, 0, 1);
	addnameF.GetUrlTitle= PIGFontString(addnameF,{"TOPLEFT",addnameF.tooltip,"BOTTOMLEFT",0,-6},L["ABOUT_GETURL"],"OUTLINE")
	addnameF.GetUrlTitle:SetTextColor(1, 1, 1, 1);
	if ly=="open" then
		addnameF.Reloadbut:Hide()
		local T1= PIGFontString(addnameF,{"LEFT",addnameF.GetUrlTitle,"RIGHT",4,0},L["LIB_STOPMAINT"],"OUTLINE")
		T1:SetTextColor(1, 0, 0, 1);
	elseif ly=="error" then
		addEditBox1(addnameF,addnameF.GetUrlTitle,addname,adddata.down_1)
		addEditBox1(addnameF,addnameF.GetUrlTitle,addname,adddata.down_2)
		addnameF.Reloadbut:Hide()
		local loadable,reason=select(4, PIGGetAddOnInfo(addname))
		if loadable then
			if not PIGIsAddOnLoaded(addname) then
				addnameF.err:SetText(L["LIB_NOTENABLED"]);
				addnameF.Reloadbut:Show()
			end
		else
			if reason=="MISSING" then
				addnameF.err:SetText(L["LIB_NOTINST"]);
			elseif reason=="DISABLED" then
				addnameF.err:SetText(L["LIB_NOTENABLED"]);
				addnameF.Reloadbut:Show()
			else
				addnameF.err:SetText(reason);
			end
		end
	end
	--if ly=="About" then addnameF.UpdateF:SetPoint("TOPLEFT",addnameF.tooltip,"BOTTOMLEFT",0,0);end
	-- addnameF.UpdateF:Hide()
	-- if ly=="About" then
	-- 	addnameF.err:Hide()
	-- 	addnameF.UpdateF:Show()
	-- else
	return addnameF
end
for ExtID=2,4 do
	local addname=L.addnames[ExtID]
	local adddata=L.ExtList[addname]
	local fuFrame,fuFrameBut = PIGOptionsList(adddata.nameLocale,"EXT")
	Data.Ext[addname]={fuFrame,fuFrameBut,adddata}
	function fuFrame.IsOpenUpdate(add_name)
		if not L.ExtList[add_name].open then
			add_extLsitFrame("open",fuFrame,add_name,L.ExtList[add_name])
		elseif not PIGIsAddOnLoaded(add_name) then
			add_extLsitFrame("error",fuFrame,add_name,L.ExtList[add_name])
		end
	end
	fuFrame:HookScript("OnShow", function (self)
		if self.IsOpenUpdate then self.IsOpenUpdate(addname) end
	end);
end

--About
-- local topV = 10
-- Create.add_extLsitAboutFrame=function(ly,fuFrame,YY)
-- 	for i=0,3 do
-- 		local NewtopV = topV
-- 		if i==0 then
-- 			NewtopV=YY-topV
-- 		else
-- 			NewtopV=YY-88*i-topV
-- 		end
-- 		add_extLsitFrame("About",fuFrame,i,NewtopV)
-- 	end
-- end
local _, addonTable = ...;
local FramePlusfun=addonTable.FramePlusfun
function FramePlusfun.Spell()
	if not PIGA["FramePlus"]["SpellOpen"] then return end
	--if NDui then return end
	if PIG_MaxTocversion(60000,true) then return end
	----
	local Data=addonTable.Data
	local Create=addonTable.Create
	local PIGFrame=Create.PIGFrame
	local PIGButton=Create.PIGButton
	local PIGFontString=Create.PIGFontString
	local GetSpecialization = GetSpecialization or C_SpecializationInfo and C_SpecializationInfo.GetSpecialization
	local GetSpecializationInfo = GetSpecializationInfo or C_SpecializationInfo and C_SpecializationInfo.GetSpecializationInfo
	------
	if ShowAllSpellRanksCheckbox then
		ShowAllSpellRanksCheckbox:SetPoint("TOPLEFT",SpellBookFrame,"TOPLEFT",72,-32);
	end
	local iconxx={237553,294475}
	local function add_butF(id,gnname,tooltip,errtooltip)
		local but = CreateFrame("CheckButton",nil, SpellBookFrame, "SpellBookSkillLineTabTemplate");
		but:SetNormalTexture(iconxx[id+1]);
		but.tooltip = gnname;
		if PIG_MaxTocversion(50000) then
			but:SetPoint("BOTTOMLEFT",SpellBookFrame,"BOTTOMRIGHT",-31,90+(id*50))
		else
			but:SetPoint("BOTTOMLEFT",SpellBookFrame,"BOTTOMRIGHT",0,70+(id*50))
		end
		if NDui or ElvUI then
			local regions = {but:GetRegions()}
			for k,v in pairs(regions) do
				v:SetTexCoord(0.1,0.9,0.1,0.9)
				if v:GetTexture()==136831 then v:Hide() end
			end
		end
		but:Show()

		local fui =PIGFrame(SpellBookFrame,{"TOPLEFT",SpellBookFrame,"TOPRIGHT",8,-14},nil,nil,nil,nil,{["ElvUI"]={0,0,0,0},["NDui"]={0,0,0,0}})
		fui:SetPoint("BOTTOMLEFT", SpellBookFrame, "BOTTOMRIGHT", 8, 74);
		if PIG_MaxTocversion(50000,true) then
			fui:SetPoint("TOPLEFT",SpellBookFrame,"TOPRIGHT",39,0);
			fui:SetPoint("BOTTOMLEFT", SpellBookFrame, "BOTTOMRIGHT", 39, 0);
		end
		fui:SetWidth(384)
		fui:PIGSetBackdrop()
		fui:Hide()
		fui:PIGClose()
		fui.biaotiT = PIGFontString(fui,{"TOPLEFT",fui,"TOPLEFT",6,-6},tooltip)
		fui.biaotiT1 = PIGFontString(fui,{"LEFT",fui.biaotiT,"RIGHT",2,0})
		fui.biaotiT1:SetTextColor(0, 1, 0, 1)
		fui.error = PIGFontString(fui,{"CENTER",fui,"CENTER",0,0})
		fui.butlist={}
		fui:SetScript("OnHide", function() but:SetChecked(false) if fui.hideui then fui.hideui() end end)
		fui:SetScript("OnShow", function() but:SetChecked(true) end)
		but:SetScript("OnClick", function (self)
			if fui:IsShown() then
				fui:Hide()
			else
				fui:Show()
			end
		end)
		return fui
	end
	local weituochuF=add_butF(0,"未使用","以下技能尚未拖动到动作条内")
	local weixuexiF=add_butF(1,"未学习","以下技能尚未学习")
	---
	PIGA["FramePlus"]["Spell"]=PIGA["FramePlus"]["Spell"] or {}
	local className, classFilename, classId = UnitClass("player")
	PIGA["FramePlus"]["Spell"][classFilename]=PIGA["FramePlus"]["Spell"][classFilename] or {}
	local function IsActionInfoX(spid)
		for actionID = 1, 120 do
			local actionType, id, subType = GetActionInfo(actionID)
			if actionType then
				if actionType=="spell" then
					if id==spid then return true end
				elseif actionType=="macro" then
					local lActionText = GetActionText(actionID);
					local hongSpellID = GetMacroSpell(id)
					if hongSpellID and hongSpellID==spid then return true end
				end
			end
		end
		local numForms = GetNumShapeshiftForms();
		for i=1, numForms do
			local icon, active, castable, spellID =GetShapeshiftFormInfo(i)
			if spellID and spellID==spid then return true end
		end
		return false
	end
	local function GetSpellData(ly)
		local yixueSpellList = {}
		if PIG_MaxTocversion(40000) then
			if ly=="no" then
				yixueSpellList=PIGA["FramePlus"]["Spell"][classFilename]
			else
				local oldVar = GetCVar("ShowAllSpellRanks")
				if oldVar=="1" then
					ShowAllSpellRanksCheckbox:Click()
					weituochuF.hideui=function()
						ShowAllSpellRanksCheckbox:Click()
					end
				else
					weituochuF.hideui=nil
				end
				local numTabs = GetNumSpellTabs()
				for i=1,numTabs do
					local name, texture, tabOffset, numEntries = GetSpellTabInfo(i)
					for slot=tabOffset + 1, tabOffset + numEntries do
						local spellName, spellSubName, spellID = GetSpellBookItemName(slot, BOOKTYPE_SPELL)
						if spellID and IsPlayerSpell(spellID) then
							local isPassive = IsPassiveSpell(slot, BOOKTYPE_SPELL)
							if not isPassive then
							   	--if spellName~="分解" and spellName~="基础营火" and spellName~="寻找矿物" and spellName~="寻找草药" and spellName~="熔炼" then	
									--if spellSubName~="战斗宠物" and spellSubName~="公会福利" and spellSubName~="初级" and spellSubName~="中级" and spellSubName~="高级" and spellSubName~="专家级" and spellSubName~="大师级" and spellSubName~="宗师级" then
										--print(spellID,spellName,spellSubName)
										if not IsActionInfoX(spellID) then
											table.insert(yixueSpellList,slot)
										end
									--end
								--end
							end
						end
					end
				end
			end
		else
			local numTabs = 2--GetNumSpellTabs()
			for i=1,numTabs do
				local name, texture, tabOffset, numEntries = GetSpellTabInfo(i)
				for slot=tabOffset + 1, tabOffset + numEntries do
					local spellType, spellID = GetSpellBookItemInfo(slot, BOOKTYPE_SPELL)
					if spellID then
						if ly=="no" then
							if spellType=="FUTURESPELL" then
								local texture = GetSpellTexture(slot, SpellBookFrame.bookType);
								local texture = texture or 134400
								local levelLearned = C_Spell.GetSpellLevelLearned(spellID)
								local levelLearned = levelLearned or 1
								local spellName, spellSubName = GetSpellBookItemName(slot, BOOKTYPE_SPELL)
								local spmamex = spellSubName and spellSubName~="" and spellName.."("..spellSubName..")" or spellName
								table.insert(yixueSpellList,{spellID,texture,levelLearned,spmamex})
							end
						else
							if IsPlayerSpell(spellID) and spellType=="SPELL" then
								local isPassive = IsPassiveSpell(slot, BOOKTYPE_SPELL)
								if not isPassive then
									--local spellName, spellSubName = GetSpellBookItemName(slot, BOOKTYPE_SPELL)
									--if spellSubName~="战斗宠物" and spellSubName~="公会福利" then
										--print(spellName,spellSubName)
										if not IsActionInfoX(spellID) then
											table.insert(yixueSpellList,slot)
										end
									--end
								end
							end
						end
					end
				end
			end
		end
		if ly=="no" and yixueSpellList then
			table.sort(yixueSpellList, function(a, b)
			    local aNum = tonumber(a[3])
			    local bNum = tonumber(b[3])
			    return aNum < bNum
			end)
		end
		return yixueSpellList
	end

	---====
	local butmaxnum,butname=70,"PIG_SpellBookNoList"
	for i=1,butmaxnum do
		local spellbut = CreateFrame("CheckButton", "PIG_SpellBookNoList"..i, weituochuF);--, "SpellButtonTemplate"
		weituochuF.butlist[i]=spellbut
		if i==1 then
			spellbut:SetPoint("TOPLEFT",weituochuF,"TOPLEFT",14,-30);
		else
			if (i - 1) % 7 == 0 then
				spellbut:SetPoint("TOP",weituochuF.butlist[i-7],"BOTTOM",0,-12);
			else
				spellbut:SetPoint("LEFT",weituochuF.butlist[i-1],"RIGHT",16,0);
			end
		end
		spellbut:SetSize(37,37);
		spellbut.iconTexture = spellbut:CreateTexture();
		spellbut.iconTexture:SetAllPoints(spellbut)
;
		function spellbut:UpdateButton()
			if self.TextBackground then self.TextBackground:ClearAllPoints();end
			if self.TextBackground2 then self.TextBackground2:ClearAllPoints();end
			local texture = GetSpellTexture(self.slot, SpellBookFrame.bookType);
			if texture then
				spellbut.iconTexture:SetTexture(texture);
				self:Show();
			end
		end
		spellbut:SetScript("OnEvent",nil)
		spellbut:SetScript("OnEnter",function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
			GameTooltip:SetSpellBookItem(self.slot, SpellBookFrame.bookType)
			GameTooltip:Show();
		end)
		spellbut:SetScript("OnLeave", function ()
			GameTooltip:ClearLines();
			GameTooltip:Hide() 
		end);
		spellbut:SetScript("OnMouseDown",function(self)
			if InCombatLockdown() then
				PIG_OptionsUI:ErrorMsg(ERR_NOT_IN_COMBAT)
				return
			end
			local slotType = GetSpellBookItemInfo(self.slot, SpellBookFrame.bookType);
			local slot = self.slot
			if (not slot or slot > MAX_SPELLS or not self.iconTexture:IsShown() or (slotType == "FUTURESPELL")) then
				return;
			end
			self:SetChecked(false);
			PickupSpellBookItem(slot, SpellBookFrame.bookType);
		end)
	end
	function weituochuF:UpdateShowList()
		weixuexiF:Hide();
		self.error:SetText("没有未使用技能")
		for i=1,butmaxnum do
			self.butlist[i]:Hide();
		end
		local SpellData=GetSpellData()
		for i=1,#SpellData do
			self.error:SetText("")
			self.butlist[i].slot=SpellData[i]
			self.butlist[i]:UpdateButton()
		end
		self:Show()
	end
	weituochuF:HookScript("OnShow", function(self)
		self:UpdateShowList()
	end)
	weituochuF:RegisterEvent("ACTIONBAR_SLOT_CHANGED");
	weituochuF:SetScript("OnEvent", function(self,event,arg1)
		if not self:IsShown() then return end
		self:UpdateShowList()
	end)

	--========
	local hangmaxnum,hangeH,scrlwww=24,20.6,weixuexiF:GetWidth()-21
	if PIG_MaxTocversion(50000) then
		hangmaxnum=19
	end
	local ScrollFF=Create.PIGScrollFrame_old(weixuexiF,{4,-26,-18,4})
	ScrollFF:HookScript("OnVerticalScroll", function(self, offset)
	    FauxScrollFrame_OnVerticalScroll(self, offset, hangeH, weixuexiF.UpdateShowList)
	end)
	for i=1,hangmaxnum do
		local spellbut = PIGFrame(weixuexiF,nil,{scrlwww,hangeH})
		weixuexiF.butlist[i]=spellbut
		spellbut:PIGSetBackdrop(0.6)
		if i==1 then
			spellbut:SetPoint("TOPLEFT",weixuexiF,"TOPLEFT",4,-26);
		else
			spellbut:SetPoint("TOPLEFT",weixuexiF.butlist[i-1],"BOTTOMLEFT",0,0);
		end
		spellbut.ok = PIGFontString(spellbut,{"LEFT",spellbut,"LEFT",2,0})
		spellbut.icon = spellbut:CreateTexture();
		spellbut.icon:SetSize(hangeH,hangeH);
		spellbut.icon:SetPoint("LEFT", 98, 0);
		spellbut.name = PIGFontString(spellbut,{"LEFT",spellbut.icon,"RIGHT",1,0},"")
		spellbut.levelLearned = PIGFontString(spellbut,{"RIGHT",spellbut.icon,"LEFT",-1,0},"")
		spellbut.levelLearned:SetWidth(30);
		spellbut.levelLearned:SetJustifyH("RIGHT")	
		function spellbut:UpdateButton(Data,leveldq)
			spellbut.spellID=Data[1]
			spellbut.tisptxt=Data[4]
			spellbut.tisptxt1=Data[5]
			spellbut.icon:SetTexture(Data[2]);
			spellbut.levelLearned:SetText("lv"..Data[3])
			if PIG_MaxTocversion(40000) then
				spellbut.name:SetText(Data[4].." |cff808080"..GetMoneyString(Data[6] or 0).."|r")
			else
				spellbut.name:SetText(Data[4])
			end
			if leveldq>=Data[3] then
				spellbut.ok:SetText("可学习")
				spellbut.ok:SetTextColor(0, 1, 0, 1)
				spellbut.levelLearned:SetTextColor(0, 1, 0, 1)
				spellbut.name:SetTextColor(0, 1, 0, 1)
			else
				if (Data[3]-leveldq)<2 then
					spellbut.ok:SetText("下级可学")
					spellbut.ok:SetTextColor(1, 1, 0, 1)
					spellbut.levelLearned:SetTextColor(1, 1, 0, 1)
					spellbut.name:SetTextColor(1, 1, 0, 1)
				elseif (Data[3]-leveldq)<3 then
					spellbut.ok:SetText("")
					spellbut.ok:SetTextColor(1, 0.686, 0.37647)
					spellbut.levelLearned:SetTextColor(1, 0.686, 0.37647)
					spellbut.name:SetTextColor(1, 0.686, 0.37647)
				elseif (Data[3]-leveldq)<4 then
					spellbut.ok:SetText("")
					spellbut.ok:SetTextColor(1, 0.5, 0.3137)
					spellbut.levelLearned:SetTextColor(1, 0.5, 0.3137)
					spellbut.name:SetTextColor(1, 0.5, 0.3137)
				else
					spellbut.ok:SetText("")
					spellbut.ok:SetTextColor(1, 0, 0, 1)
					spellbut.levelLearned:SetTextColor(1, 0, 0, 1)
					spellbut.name:SetTextColor(1, 0, 0, 1)
				end
			end
			self:Show();	
		end
		spellbut:SetScript("OnEnter",function(self)
			if not self.spellID and not self.tisptxt then return end
			GameTooltip:SetOwner(self, "ANCHOR_LEFT");
			if self.tisptxt then
				GameTooltip:AddLine("|cffFFFFFF"..self.tisptxt.."|r")
				GameTooltip:AddLine(self.tisptxt1, nil, nil, nil, true)
			else
				GameTooltip:SetHyperlink("spell:"..self.spellID)
			end
			GameTooltip:Show();
		end)
		spellbut:SetScript("OnLeave", function ()
			GameTooltip:ClearLines();
			GameTooltip:Hide() 
		end);
	end
	weixuexiF.allhuafei=0
	weixuexiF.NewData={}
	function weixuexiF:UpdateShowList()
		weituochuF:Hide();
		for i=1,hangmaxnum do
			weixuexiF.butlist[i]:Hide();
		end
		local SpellData=GetSpellData("no")
		if #SpellData==0 then weixuexiF.error:SetText("请先拜访你的"..MINIMAP_TRACKING_TRAINER_CLASS) weixuexiF:Show() return end
		local level = UnitLevel("player")
		local TotalNum = #SpellData
		if PIG_MaxTocversion(40000) and TotalNum>0 then
			weixuexiF.error:SetText("")
			weixuexiF.allhuafei=0
			wipe(weixuexiF.NewData)
			for i=1,TotalNum do
				local addokxsdd
				local name, subtext, icon, castTime, minRange, maxRange, spellID = GetSpellInfo(SpellData[i][4])
	    		if name then
	    			local subtext = C_Spell.GetSpellSubtext(spellID)
	    			if subtext then
		    			if name.."("..subtext..")"==SpellData[i][4] then
		    				addokxsdd=true
		    			end
		    		end
	    		end
	    		if not addokxsdd then
	    			table.insert(weixuexiF.NewData,SpellData[i])
					if level>=SpellData[i][3] and SpellData[i][6] then
						weixuexiF.allhuafei=weixuexiF.allhuafei+SpellData[i][6]
					end
				end
			end
			weixuexiF.biaotiT1:SetText("(可学总"..COSTS_LABEL..GetMoneyString(weixuexiF.allhuafei)..")")
		else
			weixuexiF.error:SetText("没有未学技能")
		end
		local TotalNum = #weixuexiF.NewData
	    local offset = ScrollFF:GetScrollFrameOffset(TotalNum, hangmaxnum, hangeH)
	   	for i = 1, hangmaxnum do
	        local dataIndex = i + offset
	        if weixuexiF.NewData[dataIndex] then
				weixuexiF.butlist[i]:UpdateButton(weixuexiF.NewData[dataIndex],level)
			end
		end
		weixuexiF:Show()
	end
	weixuexiF:HookScript("OnShow", function(self)
		self:UpdateShowList()
	end)
	if PIG_MaxTocversion(40000) then
		if #PIGA["FramePlus"]["Spell"][classFilename]>10 then return end
		weixuexiF:RegisterEvent("PLAYER_ENTERING_WORLD");
		weixuexiF:SetScript("OnEvent", function(self, event)
			if event == "PLAYER_ENTERING_WORLD" then
				self:RegisterEvent("TRAINER_UPDATE");
				self:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
		    elseif event == "UPDATE_MOUSEOVER_UNIT" then
		    	if UnitExists('mouseover') then
					local tooltipText = GameTooltipTextLeft2:GetText()
					if tooltipText and string.find(tooltipText:lower(), className..TUTORIAL_TITLE14) then
					    self.kaishiOK=true
					    local pname =UnitName("mouseover")
					    self.kaishipname=pname
					    if self.kaiTicker then self.kaiTicker:Cancel() end
					    self.kaiTicker=C_Timer.NewTimer(10,function()
					    	self.kaishiOK=nil
						end)
					end
				end
			elseif event == "TRAINER_UPDATE" and self.kaishiOK then
				local pname =UnitName("npc")
				if self.kaishipname~=pname then return end
				C_Timer.After(0.2,function()
					if GetTrainerServiceTypeFilter("available")==false then return end
					if GetTrainerServiceTypeFilter("unavailable")==false then return end
					wipe(PIGA["FramePlus"]["Spell"][classFilename])
					local numTrainerServices = GetNumTrainerServices();
					for index=1,numTrainerServices do
						local serviceName, serviceSubText, serviceType, isExpanded = GetTrainerServiceInfo(index);
						if ( serviceType ~= "header" ) then
							--local link = GetTrainerServiceItemLink(index)
							local texture = GetTrainerServiceIcon(index)
							local texture = texture or 134400
							local reqLevel = GetTrainerServiceLevelReq(index);
							local levelLearned = levelLearned or 1
							local spmamex = serviceSubText and serviceSubText~="" and serviceName.."("..serviceSubText..")" or serviceName
							local serviceCost, talentCost, professionCost = GetTrainerServiceCost(index)
							local serviceDescription = GetTrainerServiceDescription(index)
							table.insert(PIGA["FramePlus"]["Spell"][classFilename],{nil,texture,reqLevel,spmamex,serviceDescription,serviceCost})
						end
					end
					if #PIGA["FramePlus"]["Spell"][classFilename]>10 then
						self:UnregisterEvent("TRAINER_UPDATE");
						self:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
					end
				end)
		    end
		end)
	end
end
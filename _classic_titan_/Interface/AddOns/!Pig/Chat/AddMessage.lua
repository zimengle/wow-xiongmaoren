local addonName, addonTable = ...;
local L=addonTable.locale
local Data=addonTable.Data
local Fun=addonTable.Fun
local ReplaceEmoji=Fun.ReplaceEmoji
local _Get_GEM_EMPTY_SOCKET=Fun._Get_GEM_EMPTY_SOCKET
local _GetTooltipLevel=Fun._GetTooltipLevel
local FasongYCqingqiu=Fun.FasongYCqingqiu
local GetRaceClassTXT=Fun.GetRaceClassTXT
--------------
local QuickChatfun = addonTable.QuickChatfun
local find = _G.string.find
local gsub = _G.string.gsub
local match = _G.string.match
local gmatch=_G.string.gmatch
local GetItemInfoInstant=GetItemInfoInstant or C_Item and C_Item.GetItemInfoInstant
local GetItemStats=GetItemStats or C_Item and C_Item.GetItemStats

--修复点击密语
-- PIG_OptionsUI.Plus_chat = PIGCheckbutton(PIG_OptionsUI,{"BOTTOMRIGHT", PIG_OptionsUI, "TOPRIGHT", -340, 2},{"修复聊天框点击密语","修复聊天框点击密语无效问题"})
-- PIG_OptionsUI.Plus_chat:SetScript("OnClick", function (self)
-- 	if self:GetChecked() then
-- 		PIGA["Chat"]["Plus_chat"]=true;
-- 	else
-- 		PIGA["Chat"]["Plus_chat"]=false;
-- 	end
-- 	PIG_OptionsUI.Plus_chat:Plus_chat_xifu()
-- end);
-- PIG_OptionsUI.Plus_chat:HookScript("OnShow", function(self)
-- 	self:SetChecked(PIGA["Chat"]["Plus_chat"])
-- end)
-- function PIG_OptionsUI.Plus_chat:Plus_chat_xifu()
-- 	if PIGA["Chat"]["Plus_chat"]==nil then PIGA["Chat"]["Plus_chat"] = true end
-- 	if PIGA["Chat"]["Plus_chat"] then
-- 		local old_ChatFrame_SendTell=PIGSendTell
-- 		ChatFrame_SendTell=function(name, chatFrame,pig)
-- 			local name1,server2 = strsplit("-",name, 2)
-- 			if PIG_OptionsUI.Realm==server2 then
-- 				name = name1
-- 			end
-- 			local editBox = ChatEdit_ChooseBoxForSend(chatFrame);	
-- 			if ( editBox ~= ChatEdit_GetActiveWindow() ) then
-- 				ChatFrame_OpenChat(SLASH_WHISPER1.." "..name.." ", chatFrame);
-- 			else
-- 				editBox:SetText(SLASH_WHISPER1.." "..name.." ");
-- 			end
-- 			ChatEdit_ParseText(editBox, 0);
-- 		end
-- 	end
-- end
--处理非当前本地语言乱码
-- local function PIGPlusxiufuluanma(text)
-- 	local text = text:gsub(":(.-)%-(.-):(.-)%-(.-)|h%[", ":%1:%3|h%[")
-- 	return text
-- end
---
function QuickChatfun.PIGMessage()
	local chatONOFF = {
		jingjian=PIGA["Chat"]["jingjian"],
		FastCopy=PIGA["Chat"]["FastCopy"],
		ShowZb=PIGA["Chat"]["ShowZb"],
		ShowLinkIcon=PIGA["Chat"]["ShowLinkIcon"],
		ShowLinkLV=PIGA["Chat"]["ShowLinkLV"],
		ShowLinkSlots=PIGA["Chat"]["ShowLinkSlots"],
	}
	QuickChatfun.chatONOFF=chatONOFF
	--
	local Get_itemF = CreateFrame("Frame")
	Get_itemF.textMsgFrame={}
	Get_itemF.textAllIDs={}
	local PlayerGUIDs = {}
	local PlayerMsgList = {}
	local MsgIdQueue = {}
	local function MsgReplaceEmoji(self,event,arg1,...)
		local _,_,_,arg5,_,_,_,_,_,arg11,arg12=...
		if arg5 and arg12 then
			PlayerGUIDs[arg5]=arg12
			C_Timer.After(3,function()
				PlayerGUIDs[arg5]=nil
			end)
		end
		return false, ReplaceEmoji(arg1),...
	end
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", MsgReplaceEmoji)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_COMMUNITIES_CHANNEL", MsgReplaceEmoji)

	--远程观察图标
	local ClassColor=Data.ClassColor
	local function GetGemList(linkx)
		local baoshiinfo = {}
	    local statsg = GetItemStats(linkx)
	    if statsg then
		    for key, num in pairs(statsg) do
		        if (key:match("EMPTY_SOCKET_")) then
		            for i = 1, num do
		           		table.insert(baoshiinfo, key)
		            end
		        end
		    end
		end
		return baoshiinfo
	end
	---精简频道名
	local JJM = L["CHAT_QUKBUTNAME"]
	local JXname = L["CHAT_JXNAME"]
	local function ChatPindaoName(text)
		if chatONOFF.jingjian then
			if GetLocale() == "zhCN" or GetLocale() == "zhTW" then
				local text=text:gsub(" (|Hplayer:.+)", "%1")
				local text=text:gsub("|h%["..SPELL_TARGET_TYPE11_DESC.."%]|h", "|h%["..JJM[3].."%]|h")--队伍
				local text=text:gsub("|h%["..GUILD.."%]|h", "|h%["..JJM[4].."%]|h")--公會
				local text=text:gsub("|h%["..CHAT_MSG_RAID.."%]|h", "|h%["..JJM[5].."%]|h")--团队
				local text=text:gsub("%["..CHAT_MSG_RAID_WARNING.."%]", "%["..JJM[6].."%]")--團隊通告
				local text=text:gsub("|h%["..CHAT_MSG_RAID_LEADER.."%]|h", "|h%["..JXname[2].."%]|h")--团队领袖
				local text=text:gsub("|h%["..CHAT_MSG_BATTLEGROUND.."%]|h", "|h%["..JJM[7].."%]|h")--戰場
				local text=text:gsub("|h%["..INSTANCE_CHAT.."%]|h", "|h%["..JJM[7].."%]|h")--副本
				local text=text:gsub("|h%["..INSTANCE_CHAT_LEADER.."%]|h", "|h%["..JXname[3].."%]|h")--副本向导
				--xuhao
				local text=text:gsub("|h%[(%d+)%. "..GENERAL.."(.-)%]|h", "|h%[%1%."..JJM[8].."%]|h")--综合
				local text=text:gsub("|h%[(%d+)%. "..LOOK_FOR_GROUP.."%]|h", "|h%[%1%."..JJM[10].."%]|h")--寻求组队
				local text=text:gsub("|h%[(%d+)%. 大脚世界频道%]|h", "|h%[%1%."..JJM[11].."%]|h")
				local text=text:gsub("|h%[(%d+)%. PIG%]|h", "|h%[%.PIG%]|h")
				if GetLocale() == "zhCN" then
					local text=text:gsub("(|Hplayer:.-|h)说", "%[说%]%1")
					local text=text:gsub("(|Hplayer:.-|h)喊道", "%[喊%]%1")
					local text=text:gsub("|h%[队长%]|h", "|h%["..JXname[1].."%]|h")--队长
					local text=text:gsub("|h%[小队%]|h", "|h%["..JJM[3].."%]|h")--小队
					--xuhao
					local text=text:gsub("|h%[(%d+)%. "..TRADE.." %- 城市%]|h", "|h%[%1%.交%]|h")
					if PIG_MaxTocversion(100000,true) then
						local text=text:gsub("|h%[(%d+)%. "..TRADE.." %(服务%) %- 城市%]|h", "|h%[%1%.服%]|h")
						local text=text:gsub("|h%[(%d+)%. 新手聊天%]|h", "|h%[%1%.新%]|h")
						return text
					end
					return text
				elseif GetLocale() == "zhTW" then
					local text=text:gsub("(|Hplayer:.-|h)說", "%[說%]%1")
					local text=text:gsub("(|Hplayer:.-|h)喊道", "%[喊%]%1")
					local text=text:gsub("|h%[隊長%]|h", "|h%["..JXname[1].."%]|h")--队长
					local text=text:gsub("|h%[小隊%]|h", "|h%["..JJM[3].."%]|h")--小队
					--xuhao
					local text=text:gsub("|h%[(%d+)%. "..TRADE.." %- 城鎮%]|h", "|h%[%1%.交%]|h")
					if PIG_MaxTocversion(100000,true) then
						local text=text:gsub("|h%[(%d+)%. "..TRADE.." %(服務%) %- 城鎮%]|h", "|h%[%1%.服%]|h")
						local text=text:gsub("|h%[(%d+)%. 新手聊天%]|h", "|h%[%1%.新%]|h")
						return text
					end
					return text
				end
				return text
			end
			return text
		end
		return text
	end
	local GetColorKey=Fun.PIGGetColorKey
	local function escape_dash(s)
	    return s:gsub("-", "%%-")
	end
	local left,right,top,bottom=0.08*500+5,0.92*500-5,0*500+5,0.95*500-5
	local function MsgFastCopyShowZb(GUID,newText,tiqu)
		if not tiqu and chatONOFF.FastCopy then
			local Copyicon ="|Tinterface/buttons/ui-guildbutton-publicnote-up.blp:0:0:0:0:500:500:"..left..":"..right..":"..top..":"..bottom.."|t"
			if Copyicon~="" then
				newText=newText:gsub("(|Hplayer:(.-)|h%[.-%]|h)", "|Hgarrmission:-999:%2|h"..Copyicon.."|h%1")
			end
		end
		if chatONOFF.ShowZb then
			local _, _, _, englishRace, sex = GetPlayerInfoByGUID(GUID)
			local raceX = GetRaceClassTXT(0,500,englishRace,sex)
			if raceX~="" then
				newText=newText:gsub("(|Hplayer:(.-)|h%[.-%]|h)", "|Hgarrmission:-998:%2|h"..raceX.."|h%1")
			end
		end
		return newText
	end
	QuickChatfun.MsgFastCopyShowZb=MsgFastCopyShowZb
	local function ShowZb_Link_Icon(text)
		newText=ChatPindaoName(text)
		if chatONOFF.FastCopy or chatONOFF.ShowZb then
			local namexShowZb
			if GetCVar("chatClassColorOverride")=="0" then
				namexShowZb = newText:match("%[|cff%w%w%w%w%w%w(.-)|r%]")
			else
				namexShowZb = newText:match("%[.-%].-%[(.-)%]")
			end
			if namexShowZb and PlayerGUIDs[namexShowZb] then
				newText=MsgFastCopyShowZb(PlayerGUIDs[namexShowZb],newText)
			end
		end
		if chatONOFF.ShowLinkIcon or chatONOFF.ShowLinkLV or chatONOFF.ShowLinkSlots then
			if Get_itemF.textAllIDs[text] then
				local tihuanidlist = {}
				for word,level in pairs(Get_itemF.textAllIDs[text]) do
					tihuanidlist[word] = {}
					if chatONOFF.ShowLinkIcon then
						tihuanidlist[word]["icon"]=GetItemIcon(word)
					end
					if chatONOFF.ShowLinkLV then
						tihuanidlist[word]["LV"]=level or 1
					end
					if chatONOFF.ShowLinkSlots then
						local itemID, itemType, itemSubType, itemEquipLoc = GetItemInfoInstant(word)
						if _G[itemEquipLoc] then
							tihuanidlist[word]["Slots"]=itemSubType.."-".._G[itemEquipLoc]
						end
					end
					if chatONOFF.ShowLinkGem then
					    tihuanidlist[word]["Gem"]=GetGemList(word)
					end
				end
				for word,data in pairs(tihuanidlist) do
					if chatONOFF.ShowLinkIcon then
						newText=newText:gsub("(|"..GetColorKey().."|"..word.."|h)","|T"..data.icon..":0|t%1");
					end
					if chatONOFF.ShowLinkLV or chatONOFF.ShowLinkSlots then
						local newtxtmsg = ""
						if chatONOFF.ShowLinkLV then			
							newtxtmsg=newtxtmsg..data.LV
						end
						if chatONOFF.ShowLinkSlots and data.Slots then
							newtxtmsg=newtxtmsg..data.Slots
						end
						if text:match("Player") then
							newText=newText:gsub("(|"..GetColorKey().."|"..escape_dash(word).."|h%[)(.-%]|h|r)","%1("..newtxtmsg..")%2");
						else
							newText=newText:gsub("(|"..GetColorKey().."|"..word.."|h%[)(.-%]|h|r)","%1("..newtxtmsg..")%2");
						end
						if chatONOFF.ShowLinkGem and #data.Gem>0 then
							local GemTxt = ""
							for ixx=1,#data.Gem do
								GemTxt=GemTxt.."|T".._Get_GEM_EMPTY_SOCKET(data.Gem[ixx])..":0|t"
							end
							newText=newText:gsub("(|"..GetColorKey().."|"..word.."|h%[.-%]|h|r)","%1"..GemTxt);
						end
					end
				end
			end
		end
		return newText
	end

	hooksecurefunc("SetItemRef", function(text,link, button, chatFrame)
		if not chatONOFF.ShowZb and not chatONOFF.FastCopy then return end
		if ( strsub(text, 1, 11) ~= "garrmission" ) then return end
		local _, linktpye, playerName, lineID, chatType = strsplit(":", text)
		if PIG_MaxTocversion() then
			local name,server = strsplit("-",playerName, 2)
			if PIG_OptionsUI.Realm==server then
				playerName = name
			end
		end
		--print(linktpye, playerName, lineID)
		if linktpye=="-999" then
			local editBoxXX = ChatEdit_ChooseBoxForSend()
	        local hasText = (editBoxXX:GetText() ~= "")
	        ChatEdit_ActivateChat(editBoxXX)
			if button=="LeftButton" then
				editBoxXX:Insert(playerName)
				if (not hasText) then editBoxXX:HighlightText() end
			else
				local lineID=tonumber(lineID)
				if PlayerMsgList[lineID] then
					editBoxXX:Insert(PlayerMsgList[lineID])
					if (not hasText) then editBoxXX:HighlightText() end
				end
			end
		elseif linktpye=="-998" then
			if button=="LeftButton" then
				FasongYCqingqiu(playerName)
			else
				C_FriendList.SendWho('n-"'..playerName..'"')
			end
		elseif linktpye=="-997" then
			QuickChatfun.TabButUI.Keyword.ClickShowTab("AddIgnore",playerName)
		end
	end)

	local function GetMsgItemLists(text,msninfo,frame,extd)
		Get_itemF.textMsgFrame[text]={msninfo,frame,extd}
		Get_itemF.textAllIDs[text]={}
		for word in text:gmatch("|(Hitem:.-)|h") do
			Get_itemF.textAllIDs[text][word]=0
			_GetTooltipLevel("link",{word},function(ItemLevel)
				if ItemLevel<2 then
					Get_itemF.textAllIDs[text][word]=""
				else
    				Get_itemF.textAllIDs[text][word]=ItemLevel
    			end
    		end)
		end
	end
	local function SetMsgItemLists(text)
    	for word,level in pairs(Get_itemF.textAllIDs[text]) do
    		if level==0 then
    			return
    		end
    	end
    	Get_itemF.textMsgFrame[text][1](Get_itemF.textMsgFrame[text][2],ShowZb_Link_Icon(text),unpack(Get_itemF.textMsgFrame[text][3]))
    	Get_itemF.textAllIDs[text] = nil
	    Get_itemF.textMsgFrame[text] = nil
	end
	---
	Get_itemF:RegisterEvent("GET_ITEM_INFO_RECEIVED")
	Get_itemF:RegisterEvent("CHAT_MSG_CHANNEL");
	Get_itemF:RegisterEvent("CHAT_MSG_SAY")
	Get_itemF:RegisterEvent("CHAT_MSG_YELL")
	Get_itemF:RegisterEvent("CHAT_MSG_WHISPER")
	Get_itemF:RegisterEvent("CHAT_MSG_WHISPER_INFORM")
	--Get_itemF:RegisterEvent("CHAT_MSG_BN_WHISPER")
	Get_itemF:RegisterEvent("CHAT_MSG_RAID")
	Get_itemF:RegisterEvent("CHAT_MSG_RAID_LEADER")
	Get_itemF:RegisterEvent("CHAT_MSG_RAID_WARNING")
	Get_itemF:RegisterEvent("CHAT_MSG_PARTY")
	Get_itemF:RegisterEvent("CHAT_MSG_PARTY_LEADER")
	Get_itemF:RegisterEvent("CHAT_MSG_GUILD")
	Get_itemF:RegisterEvent("CHAT_MSG_OFFICER")
	Get_itemF:SetScript("OnEvent", function(self, event, ...)
		if event=="GET_ITEM_INFO_RECEIVED" then
		    for text,list in pairs(self.textAllIDs) do
		   		SetMsgItemLists(text)
		    end
		else
			local arg1,_,_,_,arg5,_,_,_,_,_,arg11,arg12=...
			if arg5 and arg12 then
				PlayerMsgList[arg11]=arg1
				table.insert(MsgIdQueue,1,arg11)
			end
		end
	end)
	function DelPlayerMsgList()
		for i=#MsgIdQueue,101,-1 do
			PlayerMsgList[MsgIdQueue[i]]=nil
			table.remove(MsgIdQueue,i)
		end
		C_Timer.After(10,DelPlayerMsgList)
	end
	DelPlayerMsgList()
	
	---
	Get_itemF.oldAddMessage={}
	local function jiluoldmsgfun()
		for i = 1, NUM_CHAT_WINDOWS do
			if ( i ~= 2 and i~=3 ) then
				local chatFrame = _G["ChatFrame"..i]
				Get_itemF.oldAddMessage[chatFrame]=chatFrame.AddMessage
			end
		end
	end
	jiluoldmsgfun()
	local function NewAddMessage(msninfo,frame, text, ...)
		--print(text, ...)
		--local text=text:gsub("|cff%w%w%w%w%w%w|Hmount:.-|h%[","");				
		--if i==1 then table.insert(PIGA["xxxxxx"],text) end
		--PIG_ChatFrameKeyWord:AddMessage(...);
		-- local newTextxx = link:gsub("|", "||")
		-- print(newTextxx)
		if text and text~="" and text:match("player") then
			if text:match("Hitem:") and chatONOFF.ShowLinkLV then
				GetMsgItemLists(text,msninfo,frame,{...})
				return SetMsgItemLists(text)
			end
			return msninfo(frame, ShowZb_Link_Icon(text), ...)
		end
		return msninfo(frame, text, ...)
	end
	local function zhuchetihuanE(oldx)
		for i = 1, NUM_CHAT_WINDOWS do
			if ( i ~= 2 and i~=3 ) then
				local chatFrame = _G["ChatFrame"..i]
				local msninfo = Get_itemF.oldAddMessage[chatFrame]
				if oldx then
					chatFrame.AddMessage = function(frame, text, ...)
						NewAddMessage(msninfo,frame, text, ...)
					end
				else
					chatFrame.AddMessage = function(frame, text, ...)
						if PIGisSecret(text) then return msninfo(frame, text, ...) end
						NewAddMessage(msninfo,frame, text, ...)
					end
				end
			end
		end
	end
	zhuchetihuanE(PIG_MaxTocversion())
end
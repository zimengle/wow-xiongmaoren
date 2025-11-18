local _, namespace = ...
local addon = namespace.addon

local function GetElvUISkin()
	local ElvUI = _G["ElvUI"]
	if not ElvUI then return end
	
	local E = unpack(ElvUI)
	if not E or not E.GetModule then return end
	
	local S = E:GetModule('Skins')
	if not S or not S.HandleFrame or not S.HandleButton or not S.HandleScrollBar then return end
	
	return S, E
end

local function SkinCopyPasteFrame(frame)
	if frame.nduiStyled then return end
	
	local S, E = GetElvUISkin()
	if not S then return end
	
	if frame.elvuiStyled then return end
	frame.elvuiStyled = true
	
	S:HandleFrame(frame, true)
	
	local children = { frame:GetChildren() }
	for _, child in next, children do
		if child:IsObjectType("Button") then
			local text = child:GetText()
			if text == OKAY or text == "" then
				S:HandleButton(child)
				child:ClearAllPoints()
				child:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
			end
		end
	end
	
	for _, child in next, children do
		if child:IsObjectType("ScrollFrame") then
			if child.ScrollBar then
				if child.ScrollBar.GetThumbTexture then
					S:HandleScrollBar(child.ScrollBar)
				elseif child.ScrollBar.GetThumb and S.HandleTrimScrollBar then
					S:HandleTrimScrollBar(child.ScrollBar)
				else
					S:HandleScrollBar(child.ScrollBar)
				end
			end
			
			local scrollChild = child:GetScrollChild()
			if scrollChild and scrollChild:IsObjectType("EditBox") then
				S:HandleEditBox(scrollChild)
			end
		elseif child:IsObjectType("EditBox") then
			S:HandleEditBox(child)
		end
	end
end

local function HookLibCopyPaste()
	local LibCopyPaste = LibStub("LibCopyPaste-1.0", true)
	if not LibCopyPaste then return end
	
	local originalCopy = LibCopyPaste.Copy
	local originalPaste = LibCopyPaste.Paste
	
	LibCopyPaste.Copy = function(self, title, text, options)
		originalCopy(self, title, text, options)
		
		C_Timer.After(0.1, function()
			local frame = EnumerateFrames(nil)
			while frame do
				if frame:GetFrameStrata() == "DIALOG" and frame:IsShown() then
					local regions = { frame:GetRegions() }
					local hasTitle = false
					local hasEditBox = false
					
					for _, region in next, regions do
						if region:IsObjectType("FontString") then
							local text = region:GetText()
							if text and text ~= "" then
								hasTitle = true
							end
						end
					end
					
					local children = { frame:GetChildren() }
					for _, child in next, children do
						if child:IsObjectType("EditBox") or 
						   (child:IsObjectType("ScrollFrame") and child:GetScrollChild() and child:GetScrollChild():IsObjectType("EditBox")) then
							hasEditBox = true
							break
						end
					end
					
					if hasTitle and hasEditBox and not frame.nduiStyled and not frame.elvuiStyled then
						SkinCopyPasteFrame(frame)
						break
					end
				end
				frame = EnumerateFrames(frame)
			end
		end)
	end
	
	LibCopyPaste.Paste = function(self, title, callback, options)
		originalPaste(self, title, callback, options)
		
		C_Timer.After(0.1, function()
			local frame = EnumerateFrames(nil)
			while frame do
				if frame:GetFrameStrata() == "DIALOG" and frame:IsShown() then
					local regions = { frame:GetRegions() }
					local hasTitle = false
					local hasEditBox = false
					
					for _, region in next, regions do
						if region:IsObjectType("FontString") then
							local text = region:GetText()
							if text and text ~= "" then
								hasTitle = true
							end
						end
					end
					
					local children = { frame:GetChildren() }
					for _, child in next, children do
						if child:IsObjectType("EditBox") or 
						   (child:IsObjectType("ScrollFrame") and child:GetScrollChild() and child:GetScrollChild():IsObjectType("EditBox")) then
							hasEditBox = true
							break
						end
					end
					
					if hasTitle and hasEditBox and not frame.nduiStyled and not frame.elvuiStyled then
						SkinCopyPasteFrame(frame)
						break
					end
				end
				frame = EnumerateFrames(frame)
			end
		end)
	end
end


local function Init()
	if IsAddOnLoaded("ElvUI") and not IsAddOnLoaded("NDui") then
		C_Timer.After(0.1, function()
			if LibStub("LibCopyPaste-1.0", true) then
				HookLibCopyPaste()
			end
		end)
	else
		local frame = CreateFrame("Frame")
		frame:RegisterEvent("ADDON_LOADED")
		frame:SetScript("OnEvent", function(self, event, addonName)
			if addonName == "ElvUI" then
				if not IsAddOnLoaded("NDui") then
					C_Timer.After(0.1, function()
						if LibStub("LibCopyPaste-1.0", true) then
							HookLibCopyPaste()
						end
					end)
				end
				self:UnregisterEvent("ADDON_LOADED")
			end
		end)
	end
end

Init()


local _, namespace = ...
local addon = namespace.addon

local function GetNDuiSkin()
	local NDui = _G["NDui"]
	if not NDui then return end
	
	local B, C, L, DB = unpack(NDui)
	if not B or not B.SetBD or not B.Reskin then return end
	
	return B, C, DB
end

local function SkinCopyPasteFrame(frame)
	local B, C, DB = GetNDuiSkin()
	if not B then return end
	
	if frame.nduiStyled then return end
	frame.nduiStyled = true
	
	B.StripTextures(frame)
	B.SetBD(frame)
	
	local children = { frame:GetChildren() }
	for _, child in next, children do
		if child:IsObjectType("Button") then
			local text = child:GetText()
			if text == OKAY or text == "" then
				B.Reskin(child)
				child:ClearAllPoints()
				child:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
			end
		end
	end
	
	for _, child in next, children do
		if child:IsObjectType("ScrollFrame") then
			if child.ScrollBar then
				if child.ScrollBar.GetThumbTexture then
					B.ReskinScroll(child.ScrollBar)
				elseif child.ScrollBar.GetThumb then
					B.ReskinTrimScroll(child.ScrollBar)
				end
			end
			
			local scrollChild = child:GetScrollChild()
			if scrollChild and scrollChild:IsObjectType("EditBox") then
				B.StripTextures(scrollChild)
				B.CreateBDFrame(scrollChild, .25)
			end
		elseif child:IsObjectType("EditBox") then
			B.StripTextures(child)
			B.CreateBDFrame(child, .25)
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
					
					if hasTitle and hasEditBox and not frame.nduiStyled then
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
					
					if hasTitle and hasEditBox and not frame.nduiStyled then
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
	if IsAddOnLoaded("NDui") then
		C_Timer.After(0.1, function()
			if LibStub("LibCopyPaste-1.0", true) then
				HookLibCopyPaste()
			end
		end)
	else
		local frame = CreateFrame("Frame")
		frame:RegisterEvent("ADDON_LOADED")
		frame:SetScript("OnEvent", function(self, event, addonName)
			if addonName == "NDui" then
				C_Timer.After(0.1, function()
					if LibStub("LibCopyPaste-1.0", true) then
						HookLibCopyPaste()
					end
				end)
				self:UnregisterEvent("ADDON_LOADED")
			end
		end)
	end
end

Init()


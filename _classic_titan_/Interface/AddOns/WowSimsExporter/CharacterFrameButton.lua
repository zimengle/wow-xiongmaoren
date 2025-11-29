local addonName, Env = ...

local WowSimsExporter = LibStub("AceAddon-3.0"):GetAddon("WowSimsExporter")

local button

local function CreateCharacterFrameButton()
    if button then return end

    button = CreateFrame("Button", "WowSimsExporterCharacterButton", CharacterFrame, "UIPanelButtonTemplate")
    button:SetText("WSE")
    
    local systemFont = GameFontNormal
    local systemFontSize = select(2, systemFont:GetFont()) or 13
    local buttonFontSize = math.floor(systemFontSize * 0.9)
    button:GetFontString():SetFont(select(1, systemFont:GetFont()), buttonFontSize, select(3, systemFont:GetFont()))
    
    local function SetButtonSizeAndPosition()
        local NDui = _G.NDui
        local ElvUI = _G.ElvUI
        local isNDui = NDui and type(NDui) == "table" and NDui[1] and NDui[1].Reskin
        local isElvUI = ElvUI and type(ElvUI) == "table" and ElvUI[1] and ElvUI[1].GetModule
        
        if isNDui then
            button:SetSize(54, 28)
            button:SetPoint("TOPRIGHT", CharacterFrame, "BOTTOMRIGHT", -35, 72)
        elseif isElvUI then
            button:SetSize(50, 28)
            button:SetPoint("TOPRIGHT", CharacterFrame, "BOTTOMRIGHT", -32, 75)
        else
            button:SetSize(48, 26)
            button:SetPoint("TOPRIGHT", CharacterFrame, "BOTTOMRIGHT", -32, 78)
        end
    end
    
    SetButtonSizeAndPosition()
    
    button:SetScript("OnClick", function()
        WowSimsExporter:OpenWindow()
    end)

    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(Env.L["Open Exporter Window"] or "Open Exporter Window")
        GameTooltip:AddLine(Env.L["Opens the exporter window"] or "Opens the exporter window", 1, 1, 1, true)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    button:SetFrameLevel(CharacterFrame:GetFrameLevel() + 2)
    
    local function ApplySkin()
        if button.IsSkinned then return end
        
        local NDui = _G.NDui
        if NDui and type(NDui) == "table" and NDui[1] then
            local B = NDui[1]
            if B and type(B) == "table" and B.Reskin then
                pcall(function() 
                    B.Reskin(button)
                    if button.__bg then
                        button.__bg:Show()
                        local C = NDui[2]
                        if C and C.db and C.db.Skins and C.db.Skins.SkinAlpha then
                            if button.__bg.SetBackdropColor then
                                button.__bg:SetBackdropColor(0, 0, 0, C.db.Skins.SkinAlpha)
                            end
                        end
                    end
                    if button:GetFontString() then
                        button:GetFontString():Show()
                    end
                end)
                return
            end
        end
        
        local ElvUI = _G.ElvUI
        if ElvUI and type(ElvUI) == "table" and ElvUI[1] then
            local E = ElvUI[1]
            if E and type(E) == "table" and E.GetModule then
                local ok, S = pcall(function() return E:GetModule("Skins") end)
                if ok and S and type(S) == "table" and S.HandleButton then
                    pcall(function() S:HandleButton(button) end)
                end
            end
        end
    end
    
    local function TryApplySkin()
        local NDui = _G.NDui
        if NDui and type(NDui) == "table" and NDui[1] then
            local B = NDui[1]
            if B and type(B) == "table" and B.Reskin and B.CreateBDFrame then
                ApplySkin()
                return true
            end
        end
        
        local ElvUI = _G.ElvUI
        if ElvUI and type(ElvUI) == "table" and ElvUI[1] then
            local E = ElvUI[1]
            if E and type(E) == "table" and E.GetModule then
                local ok, S = pcall(function() return E:GetModule("Skins") end)
                if ok and S and type(S) == "table" and S.HandleButton then
                    ApplySkin()
                    return true
                end
            end
        end
        return false
    end
    
    if IsAddOnLoaded("NDui") or IsAddOnLoaded("NDui_Plus") or IsAddOnLoaded("ElvUI") then
        if not TryApplySkin() then
            C_Timer.After(0.5, function()
                TryApplySkin()
                SetButtonSizeAndPosition()
            end)
        else
            SetButtonSizeAndPosition()
        end
    else
        local skinFrame = CreateFrame("Frame")
        skinFrame:RegisterEvent("ADDON_LOADED")
        skinFrame:SetScript("OnEvent", function(self, event, loadedAddonName)
            if (loadedAddonName == "NDui" or loadedAddonName == "NDui_Plus" or loadedAddonName == "ElvUI") then
                C_Timer.After(0.1, function()
                    TryApplySkin()
                    SetButtonSizeAndPosition()
                end)
                if button.IsSkinned then
                    self:UnregisterEvent("ADDON_LOADED")
                end
            end
        end)
    end

    CharacterFrame:HookScript("OnShow", function()
        button:Show()
    end)
    CharacterFrame:HookScript("OnHide", function()
        button:Hide()
    end)

    if CharacterFrame:IsShown() then
        button:Show()
    else
        button:Hide()
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, loadedAddonName)
    if event == "ADDON_LOADED" and loadedAddonName == addonName then
    elseif event == "PLAYER_LOGIN" then
        if CharacterFrame then
            CreateCharacterFrameButton()
            self:UnregisterAllEvents()
        else
            C_Timer.After(0.5, function()
                if CharacterFrame then
                    CreateCharacterFrameButton()
                    frame:UnregisterAllEvents()
                end
            end)
        end
    end
end)


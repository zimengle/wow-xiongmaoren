local _, ns = ...

local Definition = {
    databaseName = "VersionDisplay",
    defaultEnabled = true,
    defaults = {
        profile = {
            enabled = true,
            text = "",
            fontSize = 15,
            xOffset = 5,
            yOffset = 24,
        },
    },
}

local function GetFontPath()
    if type(ns.GetInterfaceFontPath) == "function" then
        return ns:GetInterfaceFontPath()
    end
    return "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
end

local function NormalizeProfile(profile)
    if profile.enabled == nil then
        profile.enabled = true
    else
        profile.enabled = profile.enabled and true or false
    end
    profile.text = type(profile.text) == "string" and profile.text or ""
    profile.fontSize = tonumber(profile.fontSize) or 15
    profile.xOffset = tonumber(profile.xOffset) or 5
    profile.yOffset = tonumber(profile.yOffset) or 24
end

local function SyncRootModuleSetting(module)
    if ns.Assembly and type(ns.Assembly.SyncModuleConfigured) == "function" then
        ns.Assembly:SyncModuleConfigured("VersionDisplay", module.db.profile.enabled and true or false)
    end
end

local function OnPlayerEnteringWorld(module)
    module:CreateVersionFrame()
end

local function OnCharacterAddonLoaded(module)
    if _G.CharacterFrame then
        module:CreateVersionFrame()
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function Definition:Initialize()
    NormalizeProfile(self.db.profile)
    SyncRootModuleSetting(self)
end

function Definition:ProfileChanged()
    NormalizeProfile(self.db.profile)
    SyncRootModuleSetting(self)
    self:UpdateLayout()
end

function Definition:Enable()
    if not self.db.profile.enabled then
        return
    end
    self:CreateVersionFrame()
    self:RegisterEvent("PLAYER_ENTERING_WORLD", OnPlayerEnteringWorld)
end

function Definition:Disable()
    if self.frame and type(self.frame.Hide) == "function" then
        self.frame:Hide()
    end
end

function Definition:CreateVersionFrame()
    if self.frame then
        self:OwnFrame(self.frame, nil, "VersionDisplay")
        self.frame:Show()
        self:UpdateLayout()
        return self.frame
    end

    local characterFrame = _G.CharacterFrame
    if not characterFrame then
        self:RegisterEvent("ADDON_LOADED", OnCharacterAddonLoaded)
        return nil
    end

    if type(_G.CreateFrame) ~= "function" then
        return nil
    end
    local frame = self:CreateFrame("Frame", nil, characterFrame, nil, nil, "VersionDisplay")
    frame:SetFrameStrata("HIGH")
    frame:SetSize(400, 30)

    local text = frame:CreateFontString(nil, "OVERLAY")
    text:SetFont(GetFontPath(), self.db.profile.fontSize, "OUTLINE")
    text:SetText(self.db.profile.text)
    text:SetPoint("LEFT", frame, "LEFT", 0, 0)
    text:SetTextColor(1, 1, 1, 1)
    text:SetShadowColor(0, 0, 0, 1)
    text:SetShadowOffset(1, -1)

    frame.text = text
    self.frame = frame
    self:UpdateLayout()
    return frame
end

function Definition:UpdateLayout()
    if not self.frame then return false end
    local profile = self.db.profile
    self.frame:ClearAllPoints()
    self.frame:SetPoint(
        "TOPLEFT",
        _G.CharacterFrame,
        "TOPLEFT",
        profile.xOffset,
        profile.yOffset
    )
    self.frame.text:SetText(profile.text)
    self.frame.text:SetFont(GetFontPath(), profile.fontSize, "OUTLINE")
    return true
end

function Definition:SetEnabled(value)
    value = value and true or false
    self.db.profile.enabled = value
    if ns.Assembly and type(ns.Assembly.SetModuleEnabled) == "function" then
        ns.Assembly:SetModuleEnabled("VersionDisplay", value)
    end
    return value
end

function Definition:SetVersionText(text)
    text = type(text) == "string" and text or ""
    self.db.profile.text = text
    self:UpdateLayout()
    if type(ns.Print) == "function" then
        ns.Print("版本号已更新为: " .. text)
    end
    return text
end

function Definition:SetFontSize(value)
    value = tonumber(value)
    if not value or value < 8 or value > 32 then
        return false
    end
    self.db.profile.fontSize = value
    self:UpdateLayout()
    return true
end

function Definition:SetOffsets(xOffset, yOffset)
    xOffset = tonumber(xOffset)
    yOffset = tonumber(yOffset)
    if not xOffset or not yOffset then
        return false
    end
    self.db.profile.xOffset = xOffset
    self.db.profile.yOffset = yOffset
    self:UpdateLayout()
    return true
end

function Definition:ShowEditDialog()
    if type(_G.StaticPopupDialogs) ~= "table" or type(_G.StaticPopup_Show) ~= "function" then
        return false
    end

    local popupKey = "RURUTIA_SET_VERSION"
    local function GetEditBox(dialog)
        if not dialog then return nil end
        if dialog.EditBox then return dialog.EditBox end
        if dialog.editBox then return dialog.editBox end
        if type(dialog.GetEditBox) == "function" then return dialog:GetEditBox() end
        return nil
    end
    if _G.StaticPopupDialogs[popupKey] == nil then
        _G.StaticPopupDialogs[popupKey] = {
            text = "请输入版本号显示文本：",
            button1 = _G.ACCEPT,
            button2 = _G.CANCEL,
            hasEditBox = true,
            maxLetters = 100,
            editBoxWidth = 350,
            OnShow = function(dialog)
                local module = ns.Runtime and ns.Runtime:GetModule("VersionDisplay") or nil
                local text = module and module.db and module.db.profile.text or ""
                local editBox = GetEditBox(dialog)
                if not editBox then return end
                editBox:SetText(text)
                editBox:SetFocus()
            end,
            OnAccept = function(dialog)
                local module = ns.Runtime and ns.Runtime:GetModule("VersionDisplay") or nil
                local editBox = GetEditBox(dialog)
                if module and editBox then
                    module:SetVersionText(editBox:GetText())
                end
            end,
            EditBoxOnEnterPressed = function(editBox)
                editBox:GetParent().button1:Click()
            end,
            EditBoxOnEscapePressed = function(editBox)
                editBox:GetParent():Hide()
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
    end

    _G.StaticPopup_Show(popupKey)
    return true
end

ns.RegisterModule("VersionDisplay", Definition)

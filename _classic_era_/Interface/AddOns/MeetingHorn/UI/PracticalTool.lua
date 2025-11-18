-- Recent.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 11/4/2020, 10:41:15 AM
--
---@type ns
local ns = select(2, ...)

local L = ns.L

local PracticalTool = ns.Addon:NewClass('UI.PracticalTool', 'Frame')
LibStub:GetLibrary('AceEvent-3.0'):Embed(PracticalTool)

function CreateImageTextModule(parent, imagePath, text, onClick)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(100, 100)

    local image = frame:CreateTexture(nil, "ARTWORK")
    image:SetTexture(imagePath)
    image:SetSize(64, 64)
    image:SetPoint("CENTER", frame, "CENTER", 0, 10)

    local textLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    textLabel:SetText(text)
    textLabel:SetPoint("BOTTOM", frame, "BOTTOM", 0, 0)
    textLabel:SetTextColor(1, 0.82, 0, 1)

    frame:EnableMouse(true)
    frame:SetScript("OnMouseDown", onClick)

    frame:SetScript("OnEnter", function(self)
        image:SetVertexColor(1, 1, 1, 0.8)
        textLabel:SetTextColor(1, 1, 1, 1)
    end)

    frame:SetScript("OnLeave", function(self)
        image:SetVertexColor(1, 1, 1, 1)
        textLabel:SetTextColor(1, 0.82, 0, 1)
    end)

    return frame
end

function PracticalTool:Constructor()
    self.Toolbar = CreateFrame("Frame", nil, self, "InsetFrameTemplate")
    self.Toolbar:SetPoint("TOPLEFT", self, "TOPLEFT", 2, -25)
    self.Toolbar:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -6, 230)

    local TocPricesModule = CreateImageTextModule(self.Toolbar, "Interface/AddOns/MeetingHorn/Media/PracticalTool/iocn1", "TOC物价", function()
        self:OnTocPricesModuleClick()
    end )
    TocPricesModule:SetPoint("LEFT", self.Toolbar, "LEFT", 10, 0)

    local TaskGuideModule = CreateImageTextModule(self.Toolbar, "Interface/AddOns/MeetingHorn/Media/PracticalTool/iocn2", "任务指引",  function()
        self:OnTaskGuideModuleClick()
    end)
    TaskGuideModule:SetPoint("LEFT", TocPricesModule, "RIGHT", 10, 0)

    local CustomsModule = CreateImageTextModule(self.Toolbar, "Interface/AddOns/MeetingHorn/Media/PracticalTool/iocn3", "副本攻略", function()
        self:OnCustomsModuleClick()
    end)
    CustomsModule:SetPoint("LEFT", TaskGuideModule, "RIGHT", 10, 0)

    local RoleReportModule = CreateImageTextModule(self.Toolbar, "Interface/AddOns/MeetingHorn/Media/PracticalTool/iocn4", "角色周报", function()
        self:OnRoleReportModuleClick()
    end)
    RoleReportModule:SetPoint("LEFT", CustomsModule, "RIGHT", 10, 0)

    local InnateViewerModule = CreateImageTextModule(self.Toolbar, "Interface/AddOns/MeetingHorn/Media/PracticalTool/iocn5", "天赋装备", function()
        self:OnInnateViewerModuleClick()
    end)
    InnateViewerModule:SetPoint("LEFT", RoleReportModule, "RIGHT", 10, 0)

    local PalmtopModule = CreateImageTextModule(self.Toolbar, "Interface/AddOns/MeetingHorn/Media/PracticalTool/iocn6", "掌上集结号", function()
        self:OnPalmtopModuleClick()
    end)
    PalmtopModule:SetPoint("LEFT", InnateViewerModule, "RIGHT", 10, 0)

    self.Present = CreateFrame("Frame", nil, self, "InsetFrameTemplate")
    self.Present:SetPoint("TOPLEFT", self.Toolbar, "BOTTOMLEFT", 2, -2)
    self.Present:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -345, 6)

    self.PresentTitle = self.Present:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    self.PresentTitle:SetPoint("TOPLEFT", 16, -10)
    self.PresentTitle:SetText(L.TOC_PRICES_TITLE)

    self.PresentText = self.Present:CreateFontString(nil, "ARTWORK", "GameFontHighlightLeft")
    self.PresentText:SetPoint("TOPLEFT", self.PresentTitle, "BOTTOMLEFT", 0, -10)
    self.PresentText:SetText(L.TOC_PRICES)

    self.QRCodeExhibition = CreateFrame("Frame", nil, self, "InsetFrameTemplate")
    self.QRCodeExhibition:SetPoint("TOPLEFT", self.Present, "TOPRIGHT", 2, -2)
    self.QRCodeExhibition:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -6, 6)

    local FontString = self.QRCodeExhibition:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    FontString:SetText("扫码立即使用")
    FontString:SetPoint("TOP", 0, -8)

    self.VXQRCode = CreateFrame("Button", nil, self.QRCodeExhibition)
    self.VXQRCode:SetSize(152, 152)
    self.VXQRCode:SetPoint("TOPLEFT", self.QRCodeExhibition, "TOPLEFT", 13, -35)

    self.VXQRCodeBannerBackground = self.VXQRCode:CreateTexture(nil, "BACKGROUND")
    self.VXQRCodeBannerBackground:SetAllPoints(self.VXQRCode)
    self.VXQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\PresentDSQECode")
    self.VXQRCode:Hide()

    self.VXFontString = self.QRCodeExhibition:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    self.VXFontString:SetText("微信扫码")
    self.VXFontString:SetPoint("TOP", self.VXQRCode, "BOTTOM", 0, -8)
    self.VXFontString:Hide()

    self.DSQRCode = CreateFrame("Frame", nil, self.QRCodeExhibition)
    self.DSQRCode:SetSize(152, 152)
    self.DSQRCode:SetPoint("TOP", self.QRCodeExhibition, "TOP", 0, -35)

    self.DSQRCodeBannerBackground = self.DSQRCode:CreateTexture(nil, "BACKGROUND")
    self.DSQRCodeBannerBackground:SetAllPoints(self.DSQRCode)
    self.DSQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\PresentDSQECode")

    local DSFontString = self.QRCodeExhibition:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    DSFontString:SetText("大神扫码")
    DSFontString:SetPoint("TOP", self.DSQRCode, "BOTTOM", 0, -8)

end

function PracticalTool:HideVXQEcode()
    self.DSQRCode:ClearAllPoints()
    self.DSQRCode:SetPoint("TOP", self.QRCodeExhibition, "TOP", 0, -35)
    self.VXQRCode:Hide()
    self.VXFontString:Hide()
end

function PracticalTool:ShowVXQEcode()
    self.DSQRCode:ClearAllPoints()
    self.DSQRCode:SetPoint("TOPLEFT", self.VXQRCode, "TOPRIGHT", 10, 0)
    self.VXQRCode:Show()
    self.VXFontString:Show()
end

function PracticalTool:OnTocPricesModuleClick()
    self:HideVXQEcode()
    self.DSQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\PresentDSQECode")
    self.PresentTitle:SetText(L.TOC_PRICES_TITLE)
    self.PresentText:SetText(L.TOC_PRICES)
end

function PracticalTool:OnTaskGuideModuleClick()
    self:ShowVXQEcode()
    self.VXQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\TaskGuideVXQECode")
    self.DSQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\TaskGuideDSQECode")
    self.PresentTitle:SetText(L.TASK_GUIDE_TITLE)
    self.PresentText:SetText(L.TASK_GUIDE)
end

function PracticalTool:OnCustomsModuleClick()
    self:HideVXQEcode()
    self.DSQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\CustomsDSQECode")
    self.PresentTitle:SetText(L.CUSTOMS_TITLE)
    self.PresentText:SetText(L.CUSTOMS)
end

function PracticalTool:OnRoleReportModuleClick()
    self:HideVXQEcode()
    self.DSQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\RoleReportDSQECode")
    self.PresentTitle:SetText(L.ROLE_REPORT_TITLE)
    self.PresentText:SetText(L.ROLE_REPORT)
end

function PracticalTool:OnInnateViewerModuleClick()
    self:HideVXQEcode()
    self.DSQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\InnateViewerDSQECode")
    self.PresentTitle:SetText(L.INNATE_VIEWER_TITLE)
    self.PresentText:SetText(L.INNATE_VIEWER)
end

function PracticalTool:OnPalmtopModuleClick()
    self:ShowVXQEcode()
    self.VXQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\PalmtopVXQECode")
    self.DSQRCodeBannerBackground:SetTexture("Interface\\AddOns\\MeetingHorn\\Media\\PracticalTool\\PalmtopDSQECode")
    self.PresentTitle:SetText(L.PALMTOP_TITLE)
    self.PresentText:SetText(L.PALMTOP)
end


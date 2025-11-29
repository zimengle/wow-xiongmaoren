local Env = select(2, ...)

local AceGUI = LibStub("AceGUI-3.0")

local UI = {}

local _frame
local _jsonbox
local _outputGenerator
local _outputGeneratorBags

local function OnClose(frame)
    AceGUI:Release(frame)
    _frame = nil
    _jsonbox = nil
end

local function CreateCopyDialog(text)
    local frame = AceGUI:Create("Frame")
    frame:SetTitle(Env.L["WSE Copy Dialog"] or "WSE Copy Dialog")
    frame:SetStatusText(Env.L["Use CTRL+C to copy link"] or "Use CTRL+C to copy link")
    frame:SetLayout("Flow")
    frame:SetWidth(400)
    frame:SetHeight(100)
    frame:SetCallback("OnClose", function(widget)
        AceGUI:Release(widget)
    end)

    local editbox = AceGUI:Create("EditBox")
    editbox:SetText(text)
    editbox:SetFullWidth(true)
    editbox:DisableButton(true)
    editbox:SetFocus()
    editbox:HighlightText()
    frame:AddChild(editbox)
end

function UI:IsWindowShown()
    return _frame and _frame.frame and _frame.frame:IsShown()
end

function UI:ToggleMainWindow(classIsSupported, simLink)
    if self:IsWindowShown() then
        if _frame then
            _frame:Hide()
        end
    else
        self:CreateMainWindow(classIsSupported, simLink)
    end
end
function UI:CreateMainWindow(classIsSupported, simLink)
    if _frame then
        _frame:Show()
        return
    end

    local frame = AceGUI:Create("Frame")
    frame:SetCallback("OnClose", OnClose)
    frame:SetTitle((Env.L["WowSimsExporter V"] or "WowSimsExporter V") .. Env.VERSION .. "")
    frame:SetStatusText(Env.L["Click 'Generate Data' to generate exportable data"] or "Click 'Generate Data' to generate exportable data")
    frame:SetLayout("Flow")
    _frame = frame

    local frameObj = frame.frame
    if frameObj then
        frameObj:EnableKeyboard(true)
        frameObj:SetScript("OnKeyDown", function(self, key)
            if key == "ESCAPE" then
                frame:Hide()
                return true
            end
            if not InCombatLockdown() then
                self:SetPropagateKeyboardInput(true)
            end
        end)
        local frameName = frameObj:GetName()
        if frameName and _G.UISpecialFrames then
            local alreadyAdded = false
            for _, name in ipairs(_G.UISpecialFrames) do
                if name == frameName then
                    alreadyAdded = true
                    break
                end
            end
            if not alreadyAdded then
                table.insert(_G.UISpecialFrames, frameName)
            end
        end
    end

    local icon = AceGUI:Create("Icon")
    icon:SetImage("Interface\\AddOns\\wowsimsexporter\\Skins\\wowsims.tga")
    icon:SetImageSize(32, 32)
    icon:SetFullWidth(true)
    frame:AddChild(icon)

    local label = AceGUI:Create("Label")
    label:SetFullWidth(true)
    frame:AddChild(label)

    if not classIsSupported then
        label:SetText((Env.L["Your characters class is currently unsupported. The supported classes are currently:\n"] or "Your characters class is currently unsupported. The supported classes are currently:\n") ..
            table.concat(Env.supportedClasses, "\n"))
        return
    end

    label:SetText(Env.L["To upload your character to the simuator, click on the url below that leads to the simuator website.\n\nYou will find an Import button on the top right of the simulator named \"Import\". Click that and select the \"Addon\" tab, paste the data\ninto the provided box and click \"Import\"\n\n"] or [[

To upload your character to the simuator, click on the url below that leads to the simuator website.

You will find an Import button on the top right of the simulator named "Import". Click that and select the "Addon" tab, paste the data
into the provided box and click "Import"

]])

    if simLink then
        local ilabel = AceGUI:Create("InteractiveLabel")
        ilabel:SetText((Env.L["Click to copy: "] or "Click to copy: ") .. simLink .. "\r\n")
        ilabel:SetFullWidth(true)
        ilabel:SetCallback("OnClick", function()
            CreateCopyDialog(simLink)
        end)
        frame:AddChild(ilabel)
    end

    local button = AceGUI:Create("Button")
    button:SetText(Env.L["Generate Data (Equipped Only)"] or "Generate Data (Equipped Only)")
    button:SetWidth(300)
    button:SetCallback("OnClick", function()
        if _outputGenerator then
            UI:SetOutput(_outputGenerator())
        end
    end)
    frame:AddChild(button)

    local extraButton = AceGUI:Create("Button")
    extraButton:SetText(Env.L["Batch: Export Bag Items"] or "Batch: Export Bag Items")
    extraButton:SetWidth(300)
    extraButton:SetCallback("OnClick", function()
        if _outputGeneratorBags then
            UI:SetOutput(_outputGeneratorBags())
        end
    end)
    frame:AddChild(extraButton)

    local jsonbox = AceGUI:Create("MultiLineEditBox")
    jsonbox:SetLabel(Env.L["Copy and paste into the websites importer!"] or "Copy and paste into the websites importer!")
    jsonbox:SetFullWidth(true)
    jsonbox:SetFullHeight(true)
    jsonbox:DisableButton(true)
    frame:AddChild(jsonbox)

    _jsonbox = jsonbox
end

---Sets string in textbox.
---@param outputString string
function UI:SetOutput(outputString)
    if not _frame or not _jsonbox then return end
    _jsonbox:SetText(outputString)
    _jsonbox:HighlightText()
    _jsonbox:SetFocus()
    _frame:SetStatusText(Env.L["Data Generated!"] or "Data Generated!")
end

---Set the function that is used to get the output value when
---pressing the character export button.
---@param func fun():string
function UI:SetOutputGenerator(func)
    _outputGenerator = func
end

---Set the function that is used to get the output value when
---pressing the bag items export button.
---@param func fun():string
function UI:SetOutputGeneratorBags(func)
    _outputGeneratorBags = func
end

Env.UI = UI

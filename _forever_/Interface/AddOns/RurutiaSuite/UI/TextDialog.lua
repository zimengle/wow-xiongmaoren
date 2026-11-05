local _, RS = ...
local UI = RS.UI
local TextDialog = {}
TextDialog.__index = TextDialog
local serial = 0

function TextDialog:New(page)
    local dialog = setmetatable({ page = page, visible = false }, self)
    local context = page.context
    local function Create(kind, parent, options)
        return assert(context:Create(kind, parent, options))
    end
    serial = serial + 1
    dialog.name = "RurutiaSuiteTextDialog" .. serial
    dialog.shade = Create("frame", UIParent, {
        hidden = true, backgroundToken = "color.transparent", noBorder = true,
        frameStrata = "FULLSCREEN_DIALOG", frameLevel = 200,
    })
    dialog.shade.frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0)
    dialog.shade.frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
    dialog.popup = Create("popup", dialog.shade, {
        name = dialog.name, width = 560, height = 360,
        backgroundToken = "color.dialog.background", borderToken = "color.border.strong",
        frameStrata = "FULLSCREEN_DIALOG", frameLevel = 201,
        point = "CENTER", relativeTo = UIParent, clampedToScreen = true,
    })
    dialog.popup.frame:EnableMouse(true)
    dialog.title = Create("label", dialog.popup, {
        fontKey = "heading", labelFill = true, height = 28, justifyH = "LEFT",
    })
    dialog.title.frame:SetPoint("TOPLEFT", dialog.popup.frame, "TOPLEFT", 18, -14)
    dialog.title.frame:SetPoint("TOPRIGHT", dialog.popup.frame, "TOPRIGHT", -18, -14)
    dialog.message = Create("label", dialog.popup, {
        labelFill = true, height = 44, justifyH = "LEFT", justifyV = "TOP",
        wordWrap = true, nonSpaceWrap = true,
    })
    dialog.message.frame:SetPoint("TOPLEFT", dialog.popup.frame, "TOPLEFT", 18, -48)
    dialog.message.frame:SetPoint("TOPRIGHT", dialog.popup.frame, "TOPRIGHT", -18, -48)
    dialog.scroll = Create("scroll", dialog.popup, { contentHeight = 210, contentWidth = 490 })
    dialog.scroll.frame:SetPoint("TOPLEFT", dialog.popup.frame, "TOPLEFT", 18, -96)
    dialog.scroll.frame:SetPoint("BOTTOMRIGHT", dialog.popup.frame, "BOTTOMRIGHT", -26, 58)
    dialog.input = Create("editbox", dialog.scroll.frame, {
        multiline = true, autoFocus = false, justifyV = "TOP", wordWrap = true,
        nonSpaceWrap = true, width = 490, height = 200,
        textInsets = { 8, 8, 8, 8 },
        onChange = function() dialog:RefreshInput() end,
    })
    -- Use the EditBox itself as the scroll child (as in NDui Chatcopy),
    -- keeping native caret/selection and mouse coordinates on the same object.
    dialog.scroll:GetContent():Hide()
    dialog.scroll.content = dialog.input.frame
    dialog.scroll.frame:SetScrollChild(dialog.input.frame)
    dialog.input.frame:SetPoint("TOPLEFT", dialog.scroll.frame, "TOPLEFT", 0, 0)
    dialog.input.frame:SetFrameStrata("FULLSCREEN_DIALOG")
    dialog.input.frame:SetFrameLevel(dialog.scroll.frame:GetFrameLevel() + 1)
    dialog.input.frame:EnableMouse(true)
    dialog.scroll.frame:HookScript("OnVerticalScroll", function() dialog:RefreshHitRect() end)
    dialog.scroll.frame:HookScript("OnSizeChanged", function() dialog:RefreshHitRect() end)
    dialog.input.frame:SetScript("OnEscapePressed", function() dialog:Hide() end)
    -- Preserve native selection and manual scrolling. Cursor notifications also
    -- occur while scrolling; forcing the caret into view fights the scrollbar.
    dialog.selectAll = Create("button", dialog.popup, {
        text = "全选", width = 100, height = 30,
        onAction = function() dialog.input:SetFocus(); dialog.input:HighlightText() end,
    })
    dialog.selectAll.frame:SetPoint("BOTTOMLEFT", dialog.popup.frame, "BOTTOMLEFT", 18, 16)
    dialog.confirm = Create("button", dialog.popup, {
        text = "导入", width = 100, height = 30,
        onAction = function() return dialog:Confirm() end,
    })
    dialog.confirm.frame:SetPoint("BOTTOMRIGHT", dialog.popup.frame, "BOTTOMRIGHT", -130, 16)
    dialog.close = Create("button", dialog.popup, {
        text = "关闭", width = 100, height = 30, onAction = function() dialog:Hide() end,
    })
    dialog.close.frame:SetPoint("BOTTOMRIGHT", dialog.popup.frame, "BOTTOMRIGHT", -18, 16)
    dialog.popup:SetOnHide(function() dialog:Hide() end)
    _G.UISpecialFrames = _G.UISpecialFrames or {}
    table.insert(_G.UISpecialFrames, dialog.name)
    return dialog
end

function TextDialog:RefreshHitRect()
    local input, scroll = self.input.frame, self.scroll.frame
    if not input.SetHitRectInsets then return end
    local offset = scroll.GetVerticalScroll and scroll:GetVerticalScroll() or 0
    local viewport = scroll:GetHeight()
    input:SetHitRectInsets(0, 0, math.max(0, offset),
        math.max(0, input:GetHeight() - offset - viewport))
end

function TextDialog:RefreshInput()
    if not self.options then return end
    local input = self.input.frame
    local lines = input.GetNumLines and input:GetNumLines() or 1
    local _, fontSize = self.page.system.theme:ResolveFont("body")
    local height = math.max(self.inputHeight or 180, lines * ((fontSize or 17) + 2) + 16)
    input:SetHeight(height)
    self.scroll:SetContentSize(self.inputWidth or 490, height)
    self:RefreshHitRect()
    self.confirm:SetEnabled(not self.submitting and type(self.options.onConfirm) == "function"
        and (self.input:GetText() or ""):find("%S") ~= nil)
end

function TextDialog:Show(options)
    self.options = options or {}
    self.shade.frame:EnableMouse(self.options.modal ~= false)
    self.visible = true
    local screenWidth = UIParent and UIParent.GetWidth and UIParent:GetWidth() or 800
    local screenHeight = UIParent and UIParent.GetHeight and UIParent:GetHeight() or 600
    local width = math.min(tonumber(self.options.width) or 560, screenWidth - 40)
    local height = math.min(tonumber(self.options.height) or 360, screenHeight - 40)
    self.popup.frame:SetSize(width, height)
    self.inputWidth, self.inputHeight = math.max(100, width - 58), math.max(60, height - 154)
    self.input.frame:SetWidth(self.inputWidth)
    self.title:SetText(self.options.title or "配置字符串")
    self.message:SetText(self.options.description or "")
    self.message.options.textToken = "color.text.normal"
    self.message:RefreshTheme()
    if self.input.frame.SetMaxLetters then self.input.frame:SetMaxLetters(self.options.maxLetters or 524288) end
    self.input:SetValue(self.options.value or "", true)
    self.confirm:SetText(self.options.confirmLabel or "导入")
    self.confirm:SetVisible(type(self.options.onConfirm) == "function")
    self:RefreshInput()
    if self.scroll.frame.SetVerticalScroll then self.scroll.frame:SetVerticalScroll(0) end
    self.shade:SetVisible(true)
    self.popup:SetVisible(true)
    if self.options.mode == "view" and not self.options.selectAll then
        self.input:ClearFocus()
    else
        self.input:SetFocus()
    end
    if self.options.selectAll then
        self.input:HighlightText()
    else
        self.input:HighlightText(0, 0)
        if self.input.frame.SetCursorPosition then self.input.frame:SetCursorPosition(0) end
    end
    return self
end

function TextDialog:Confirm()
    if not self.visible or self.submitting or not self.confirm.enabled then return false end
    self.submitting = true
    self:RefreshInput()
    local invoked, ok, message = pcall(self.options.onConfirm, self.input:GetText() or "")
    self.submitting = false
    if not invoked then ok, message = false, "操作失败，请重试。" end
    if ok then self:Hide(); return true end
    self.message.options.textToken = "color.text.normal"
    self.message:SetText(message or "操作失败，请检查字符串。")
    self.message:RefreshTheme()
    self:RefreshInput()
    return false
end

function TextDialog:Hide()
    if not self.visible then return end
    self.visible = false
    self.input:ClearFocus()
    self.options = nil
    self.input:SetValue("", true)
    self.popup:SetVisible(false)
    self.shade:SetVisible(false)
end

function TextDialog:Release()
    self:Hide()
    self.input.frame:SetScript("OnCursorChanged", nil)
    self.input.frame:SetScript("OnEscapePressed", nil)
    self.popup:SetOnHide(nil)
    for index = #(_G.UISpecialFrames or {}), 1, -1 do
        if _G.UISpecialFrames[index] == self.name then table.remove(_G.UISpecialFrames, index) end
    end
end

UI.TextDialog = TextDialog

-- Chat copy deliberately uses native controls. Keep the EditBox free of
-- Components/TextDialog templates, typography and cursor/selection callbacks.
function UI:CreateNativeCopyDialog(owner, options)
    options = options or {}
    local parent = options.parent or UIParent
    local name = assert(options.name, "Native copy dialog needs a unique name")
    local dialog = { frames = {} }
    local function Create(kind, name, parent, template)
        local frame = owner:CreateFrame(kind, name, parent, template)
        dialog.frames[#dialog.frames + 1] = frame
        return frame
    end
    local backdrop = { bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1 }
    local frame = Create("Frame", name, parent, "BackdropTemplate")
    dialog.frame = frame
    frame:Hide()
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetFrameLevel(100)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function() frame:StartMoving() end)
    frame:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
    frame:SetBackdrop(backdrop)
    frame:SetBackdropColor(0.055, 0.045, 0.065, 0.98)
    frame:SetBackdropBorderColor(0, 0, 0, 1)

    local font = STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"
    local title = frame:CreateFontString(nil, "OVERLAY")
    title:SetFont(font, 19, "OUTLINE")
    title:SetPoint("TOPLEFT", frame, "TOPLEFT", 18, -18)
    title:SetText(options.title or "复制内容")
    local message = frame:CreateFontString(nil, "OVERLAY")
    message:SetFont(font, 17, "OUTLINE")
    message:SetPoint("TOPLEFT", frame, "TOPLEFT", 18, -50)
    message:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -18, -50)
    message:SetJustifyH("LEFT")
    dialog.message = message

    local background = frame:CreateTexture(nil, "BACKGROUND")
    background:SetColorTexture(0.30, 0.30, 0.30, 0.35)
    background:SetPoint("TOPLEFT", frame, "TOPLEFT", 18, -88)
    background:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -32, 54)
    local scroll = Create("ScrollFrame", name .. "Scroll", frame, "UIPanelScrollFrameTemplate")
    dialog.scroll = scroll
    scroll:SetPoint("TOPLEFT", frame, "TOPLEFT", 24, -96)
    scroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -40, 62)

    -- Native chat-copy structure: untemplated EditBox, created
    -- under the window and assigned directly as the ScrollFrame's child.
    local input = Create("EditBox", nil, frame)
    dialog.input = input
    input:SetMultiLine(true)
    input:EnableMouse(true)
    input:SetAutoFocus(false)
    if ChatFontNormal then
        input:SetFontObject(ChatFontNormal)
    else
        input:SetFont(font, 17, "")
    end
    input:SetScript("OnEscapePressed", function() dialog:Hide() end)
    scroll:SetScrollChild(input)
    local function UpdateHitRect(_, offset)
        if input.SetHitRectInsets then
            input:SetHitRectInsets(0, 0, offset, input:GetHeight() - offset - scroll:GetHeight())
        end
    end
    scroll:HookScript("OnVerticalScroll", UpdateHitRect)

    local function Button(text, point, x, action)
        local button = Create("Button", nil, frame, "BackdropTemplate")
        button:SetSize(100, 30)
        button:SetPoint(point, frame, point, x, 16)
        button:SetBackdrop(backdrop)
        button:SetBackdropColor(0.11, 0.10, 0.12, 1)
        button:SetBackdropBorderColor(0, 0, 0, 1)
        local label = button:CreateFontString(nil, "OVERLAY")
        label:SetFont(font, 17, "OUTLINE")
        label:SetPoint("CENTER")
        label:SetText(text)
        button:SetScript("OnClick", action)
        button:SetScript("OnEnter", function() button:SetBackdropColor(0.20, 0.18, 0.21, 1) end)
        button:SetScript("OnLeave", function() button:SetBackdropColor(0.11, 0.10, 0.12, 1) end)
        return button
    end
    dialog.selectAll = Button("全选", "BOTTOMLEFT", 18, function()
        input:SetFocus()
        input:HighlightText()
    end)
    dialog.close = Button("关闭", "BOTTOMRIGHT", -18, function() dialog:Hide() end)
    frame:SetScript("OnHide", function()
        frame:StopMovingOrSizing()
        dialog.visible = false
        input:ClearFocus()
        input:SetText("")
        for _, child in ipairs(dialog.frames) do owner:ReleaseFrame(child) end
        if options.onHide then options.onHide() end
    end)
    function dialog:Hide() frame:Hide() end
    function dialog:Show(text, description, caption, requestedWidth, requestedHeight)
        local width = math.min(requestedWidth or 800, parent:GetWidth() - 40)
        local height = math.min(requestedHeight or 520, parent:GetHeight() - 40)
        title:SetText(caption or options.title or "复制内容")
        frame:SetSize(width, height)
        input:SetWidth(width - 80) -- reserve the in-frame RS scrollbar gutter
        input:SetHeight(height - 158)
        input:SetMaxLetters(math.max(524288, #text + 1))
        for _, child in ipairs(self.frames) do
            owner:OwnFrame(child, nil, "Native copy dialog")
            if child ~= frame then child:Show() end
        end
        frame:Show()
        self.visible = true
        message:SetText(description)
        if input.SetTextColor then input:SetTextColor(1, 1, 1) end
        input:SetText(text)
        if UI.SkinNativeScrollFrame then UI:SkinNativeScrollFrame(scroll) end
        if scroll.SetVerticalScroll then scroll:SetVerticalScroll(0) end
        UpdateHitRect(scroll, 0)
        input:SetFocus()
        input:HighlightText(0, 0)
        if input.SetCursorPosition then input:SetCursorPosition(0) end
    end
    _G.UISpecialFrames = _G.UISpecialFrames or {}
    table.insert(_G.UISpecialFrames, name)
    return dialog
end


-- One reusable capture dialog per settings page. Input/event capture exists only while shown.
local KeyBindingDialog = {}
KeyBindingDialog.__index = KeyBindingDialog
function KeyBindingDialog:New(page)
    local dialog = setmetatable({ page = page }, self)
    local function Create(kind, parent, options)
        local parentFrame = parent.frame or parent
        options.frameStrata = "FULLSCREEN_DIALOG"
        options.frameLevel = options.frameLevel or (parentFrame:GetFrameLevel() + 1)
        return assert(page.context:Create(kind, parent, options))
    end
    dialog.shade = Create("frame", UIParent, { hidden=true, noBorder=true,
        backgroundToken="color.transparent", frameStrata="FULLSCREEN_DIALOG", frameLevel=210 })
    dialog.shade.frame:SetAllPoints(UIParent)
    dialog.shade.frame:EnableMouse(true)
    dialog.popup = Create("popup", dialog.shade, { width=560, height=290,
        backgroundToken="color.dialog.background", borderToken="color.border.strong",
        frameStrata="FULLSCREEN_DIALOG", frameLevel=211, point="CENTER", relativeTo=UIParent, movable=true })
    dialog.popup.frame:EnableMouse(true)
    dialog.title = Create("label", dialog.popup, { text="设置按键", fontKey="heading", width=500, height=28 })
    dialog.title.frame:SetPoint("TOPLEFT",dialog.popup.frame,"TOPLEFT",18,-16)
    dialog.message = Create("label",dialog.popup,{text="输入焦点快捷键。",width=520,height=42,wordWrap=true})
    dialog.message.frame:SetPoint("TOPLEFT",dialog.popup.frame,"TOPLEFT",18,-58)
    dialog.capture = Create("frame",dialog.popup,{width=524,height=90,backgroundToken="color.control.background",borderToken="color.accent"})
    dialog.capture.frame:SetPoint("TOPLEFT",dialog.popup.frame,"TOPLEFT",18,-106)
    dialog.value = Create("label",dialog.capture,{fontKey="heading",width=500,height=80,justifyH="CENTER"})
    dialog.value.frame:SetPoint("CENTER",dialog.capture.frame,"CENTER",0,0)
    dialog.hint = Create("label",dialog.popup,{text="Esc 取消",width=524,height=36,wordWrap=true,textToken="color.text.muted"})
    dialog.hint.frame:SetPoint("TOPLEFT",dialog.popup.frame,"TOPLEFT",18,-198)
    dialog.save = Create("button",dialog.popup,{text="保存",width=110,height=32,onAction=function() return dialog:Save() end})
    dialog.save.frame:SetPoint("BOTTOMRIGHT",dialog.popup.frame,"BOTTOMRIGHT",-138,16)
    dialog.clear = Create("button",dialog.popup,{text="清除",width=110,height=32,onAction=function() dialog:Clear() end})
    dialog.clear.frame:SetPoint("BOTTOMLEFT",dialog.popup.frame,"BOTTOMLEFT",18,16)
    dialog.cancel = Create("button",dialog.popup,{text="取消",width=110,height=32,onAction=function() dialog:Hide() end})
    dialog.cancel.frame:SetPoint("BOTTOMRIGHT",dialog.popup.frame,"BOTTOMRIGHT",-18,16)
    dialog.capture.frame:EnableMouse(true)
    dialog.capture.frame:EnableMouseWheel(true)
    dialog.capture.frame:SetScript("OnMouseDown",function(_,button) dialog:CaptureMouse(button) end)
    dialog.capture.frame:SetScript("OnMouseWheel",function(_,delta) dialog:Capture(delta>0 and "MOUSEWHEELUP" or "MOUSEWHEELDOWN") end)
    -- Only the capture area records mouse bindings; the title/background can drag.
    for _, component in ipairs({dialog.title, dialog.message, dialog.value, dialog.hint}) do
        component.frame:EnableMouse(false)
    end
    dialog.popup:SetOnHide(function() dialog:Hide() end)
    return dialog
end
function KeyBindingDialog:Show(options)
    if InCombatLockdown and InCombatLockdown() then return nil,"combat" end
    self.options,self.visible,self.pending,self.confirmConflict=options,true,options.value or "",nil
    self:RefreshValue()
    self.hint:SetText("Esc 取消")
    local frame=self.popup.frame
    frame:SetScript("OnKeyDown",function(_,key)
        if key=="ESCAPE" then self:Hide() else self:Capture(key) end
    end)
    frame:SetScript("OnEvent",function() self:Hide() end)
    frame:RegisterEvent("PLAYER_REGEN_DISABLED")
    frame:EnableKeyboard(true)
    if frame.SetPropagateKeyboardInput then frame:SetPropagateKeyboardInput(false) end
    self.shade.frame:EnableMouse(true)
    self.shade:SetVisible(true);self.popup:SetVisible(true)
    return self
end
function KeyBindingDialog:RefreshValue()
    local accent = self.page.system.theme:Get("color.accent")
    local r,g,b = accent[1],accent[2],accent[3]
    local text = self.pending == "" and "未设置" or self.options.format(self.pending)
    self.value:SetText(string.format("|cff%02x%02x%02x%s|r", math.floor(r*255), math.floor(g*255), math.floor(b*255), text))
    local path,size,flags = self.page.system.theme:ResolveFont("heading")
    self.value.label:SetFont(path,size+3,flags)
end
function KeyBindingDialog:Clear()
    if not self.visible then return end
    self.pending,self.confirmConflict,self.conflict="",nil,nil
    self:RefreshValue();self.hint:SetText("保存后清除焦点快捷键。Esc 取消")
end
function KeyBindingDialog:CaptureMouse(button)
    local keys={LeftButton="BUTTON1",RightButton="BUTTON2",MiddleButton="BUTTON3"}
    self:Capture(keys[button] or (button and button:upper()))
end
function KeyBindingDialog:Capture(key)
    if not self.visible or not key then return end
    if key=="LSHIFT" or key=="RSHIFT" or key=="LCTRL" or key=="RCTRL" or key=="LALT" or key=="RALT" then return end
    local prefix=""
    if IsAltKeyDown and IsAltKeyDown() then prefix=prefix.."ALT-" end
    if IsControlKeyDown and IsControlKeyDown() then prefix=prefix.."CTRL-" end
    if IsShiftKeyDown and IsShiftKeyDown() then prefix=prefix.."SHIFT-" end
    local binding=self.options.normalize(prefix..key)
    if not binding then self.hint:SetText("不支持此按键，请重新输入。");return end
    self.pending,self.confirmConflict=binding,nil
    self:RefreshValue()
    local action=GetBindingAction and GetBindingAction(binding) or ""
    self.conflict=action~="" and action or nil
    self.hint:SetText(self.conflict and ("已用于："..tostring(_G["BINDING_NAME_"..action] or action)) or "Esc 取消")
end
function KeyBindingDialog:Save()
    if not self.visible then return false end
    if InCombatLockdown and InCombatLockdown() then self:Hide();return false end
    if self.pending~="" and self.conflict and not self.confirmConflict then
        self.confirmConflict=true;self.hint:SetText("此按键已有用途，再次点击保存确认接管。");return false
    end
    local ok,reason=self.options.onConfirm(self.pending)
    if ok then self:Hide();return true end
    self.hint:SetText(reason or "保存失败，请重试。");return false
end
function KeyBindingDialog:Hide()
    if not self.visible then return end
    self.visible=false
    local frame=self.popup.frame
    frame:EnableKeyboard(false);frame:UnregisterEvent("PLAYER_REGEN_DISABLED")
    frame:SetScript("OnKeyDown",nil);frame:SetScript("OnEvent",nil)
    self.options,self.conflict,self.confirmConflict=nil,nil,nil
    self.popup.frame:StopMovingOrSizing()
    self.shade.frame:EnableMouse(false)
    self.popup:SetVisible(false);self.shade:SetVisible(false)
end
function KeyBindingDialog:Release() self:Hide();self.popup:SetOnHide(nil) end
UI.KeyBindingDialog=KeyBindingDialog

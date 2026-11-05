local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("AddonProfile")) then return end

-- Retail's legacy AddonProfile UI is pinned by the regression harness at
-- 82e54e59e2bd5acbc8b1ceb430bac393a9aca4b5 / blob
-- 51fb9fea1efce25f074734218883c7146102af66.  This file preserves its user
-- workflows using RS.UI; AceGUI and StaticPopup are deliberately not runtime
-- dependencies.
local UI = {
    pageId = "addonprofile",
    registered = false,
    selectedId = nil,
    checklistId = nil,
    checklistSet = {},
    exportOnlyCustom = true,
    importOverwriteSameName = true,
}

local function Trim(value)
    return tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", "")
end

local function CopySet(list)
    local result = {}
    local _, name
    for _, name in ipairs(list or {}) do
        if type(name) == "string" and name ~= "" then result[name] = true end
    end
    return result
end

local function SortedList(set)
    local result, name = {}, nil
    for name in pairs(set or {}) do result[#result + 1] = name end
    table.sort(result, function(left, right) return left:lower() < right:lower() end)
    return result
end

local function Add(context, bucket, controls, kind, key, parent, options)
    local control, reason = context:Create(kind, parent, options)
    if not control then error("Unable to create AddonProfile control " .. key .. ": " .. tostring(reason), 2) end
    if controls and key then controls[key] = control end
    if bucket then bucket[#bucket + 1] = control end
    return control
end

local function SetAnchor(control, point, relative, relativePoint, x, y)
    control.frame:ClearAllPoints()
    control.frame:SetPoint(point, relative.frame or relative, relativePoint or point, x or 0, y or 0)
end

local function BuildProfileChoices(module)
    local values, order = {}, {}
    local _, profile
    for _, profile in ipairs(module:ListProfiles()) do
        values[profile.id] = profile.displayName or profile.name or profile.id
        order[#order + 1] = profile.id
    end
    return values, order
end

local function BuildManifestText(module, id)
    local profile = module:GetProfile(id)
    if not profile then return "预设不存在" end
    local lines = { "「" .. module:GetProfileDisplayName(profile) .. "」插件清单" }
    local _, addon
    for _, addon in ipairs(profile.whitelist or {}) do
        local remark = ns.AddonProfileData.AddonRemarks[addon]
        lines[#lines + 1] = remark and (addon .. " - " .. remark) or addon
    end
    if #lines == 1 then lines[#lines + 1] = "（清单为空）" end
    return table.concat(lines, "\n")
end

local function GetTopBar()
    if not (ns.Runtime and type(ns.Runtime.GetModule) == "function") then return nil end
    return ns.Runtime:GetModule("TopBar")
end

local function RefreshTopBar(method, argument)
    local resolved, topBar = pcall(GetTopBar)
    if not resolved then return false end
    if topBar and type(topBar[method]) == "function" then
        local ok = pcall(topBar[method], topBar, argument)
        return ok
    end
    return false
end

local function HideOtherDialogs(context, exceptKey)
    local dialogs = context.addonProfileDialogs
    if not dialogs then return end
    local key, dialog
    for key, dialog in pairs(dialogs) do
        if key ~= exceptKey and key ~= "confirm" then dialog:SetVisible(false) end
    end
end

local function BuildAddonNames(module)
    local names, name = {}, nil
    for name in pairs(ns.AddonProfileData.ProtectedAddons or {}) do names[name] = true end
    local _, profile
    for _, profile in ipairs(module:ListProfiles({ includeHidden = true })) do
        local _, addon
        for _, addon in ipairs(profile.whitelist or {}) do names[addon] = true end
    end
    local adapter = module.adapter
    if adapter and type(adapter.GetNumAddOns) == "function" and type(adapter.GetAddOnName) == "function" then
        local index
        for index = 1, adapter:GetNumAddOns() do
            name = adapter:GetAddOnName(index)
            if type(name) == "string" and name ~= "" then names[name] = true end
        end
    end
    return SortedList(names)
end

function UI:GetSelectedID(module)
    local profile = module:GetProfileDB()
    local id = self.selectedId or profile.currentId
    if module:GetProfile(id) then return id end
    local profiles = module:ListProfiles()
    return profiles[1] and profiles[1].id or nil
end

function UI:EnsureDialog(context, key, width, height)
    context.addonProfileDialogs = context.addonProfileDialogs or {}
    local dialog = context.addonProfileDialogs[key]
    if dialog then return dialog, false end
    dialog = assert(context:Create("popup", UIParent, {
        width = width,
        height = height,
        point = "CENTER",
        relativeTo = UIParent,
        relativePoint = "CENTER",
        hidden = true,
        backgroundToken = "color.window.background",
        frameStrata = "FULLSCREEN_DIALOG",
        frameLevel = key == "confirm" and 130 or 120,
        topLevel = true,
        movable = true,
        clampedToScreen = true,
    }))
    dialog:SetOnHide(function(owner)
        if owner.edit then owner.edit:ClearFocus() end
        owner.pendingAction = nil
        local returnPage = owner.returnToMainPage
        owner.returnToMainPage = nil
        local system = context.registry and context.registry.system
        if returnPage and system and type(system.OpenMain) == "function" then
            system:OpenMain(returnPage)
        end
    end)
    context.addonProfileDialogs[key] = dialog
    return dialog, true
end

function UI:EnsureManifestDialog(context)
    local dialog, isNew = self:EnsureDialog(context, "manifest", 560, 560)
    if not isNew then return dialog end
    dialog.title = Add(context, nil, nil, "label", "manifestTitle", dialog, {
        text = "插件清单", width = 512, height = 32, labelFill = true,
        justifyH = "CENTER", justifyV = "MIDDLE", fontKey = "heading",
    })
    SetAnchor(dialog.title, "TOPLEFT", dialog, "TOPLEFT", 24, -18)
    dialog.scroll = Add(context, nil, nil, "scroll", "manifestScroll", dialog, {
        width = 512, height = 440, contentWidth = 488, contentHeight = 1,
    })
    SetAnchor(dialog.scroll, "TOPLEFT", dialog, "TOPLEFT", 24, -58)
    dialog.body = Add(context, nil, nil, "label", "manifestBody", dialog.scroll:GetContent(), {
        text = "", width = 480, height = 1, labelFill = true, justifyH = "LEFT",
        justifyV = "TOP", wordWrap = true, nonSpaceWrap = true,
        textInsets = { 4, 4, 4, 4 }, autoHeight = true, minHeight = 1, heightPadding = 8,
    })
    SetAnchor(dialog.body, "TOPLEFT", dialog.scroll:GetContent(), "TOPLEFT", 0, 0)
    dialog.close = Add(context, nil, nil, "button", "manifestClose", dialog, {
        text = "关闭", width = 140, height = 34,
        onAction = function() dialog:SetVisible(false) end,
    })
    SetAnchor(dialog.close, "BOTTOM", dialog, "BOTTOM", 0, 16)
    return dialog
end

function UI:ShowManifest(context, module)
    HideOtherDialogs(context, "manifest")
    local dialog = self:EnsureManifestDialog(context)
    local id = self:GetSelectedID(module)
    dialog.title:SetText("插件清单 · " .. (id and module:GetProfileDisplayName(id) or "未选择"))
    dialog.body:SetText(BuildManifestText(module, id))
    local height = dialog.body:FitTextHeight(1, 8) or 1
    dialog.scroll:SetContentSize(488, height)
    dialog:SetVisible(true)
    return dialog
end

local function CreateTransferInput(context, dialog, prefix)
    dialog.scroll = Add(context, nil, nil, "scroll", prefix .. "Scroll", dialog, {
        width = 512, height = 180, contentWidth = 488, contentHeight = 180,
    })
    SetAnchor(dialog.scroll, "TOPLEFT", dialog, "TOPLEFT", 24, -58)
    dialog.edit = Add(context, nil, nil, "editbox", prefix .. "Edit", dialog.scroll.frame, {
        width = 488, height = 180, value = "", multiline = true, autoFocus = false,
        selectAllOnFocus = prefix == "export", justifyH = "LEFT", justifyV = "TOP",
        wordWrap = true, textInsets = { 8, 8, 8, 8 },
    })
    -- The EditBox itself is the scroll child; keep text and native selection
    -- in one coordinate system, with hit testing limited to the viewport.
    dialog.scroll:GetContent():Hide()
    dialog.scroll.content = dialog.edit.frame
    dialog.scroll.frame:SetScrollChild(dialog.edit.frame)
    SetAnchor(dialog.edit, "TOPLEFT", dialog.scroll, "TOPLEFT", 0, 0)
    function dialog:RefreshExportHitRect()
        local input, scroll = self.edit.frame, self.scroll.frame
        if not input.SetHitRectInsets then return end
        local offset = scroll.GetVerticalScroll and scroll:GetVerticalScroll() or 0
        input:SetHitRectInsets(0, 0, math.max(0, offset),
            math.max(0, input:GetHeight() - offset - scroll:GetHeight()))
    end
    function dialog:RefreshExportText()
        local input = self.edit.frame
        local lines = input.GetNumLines and input:GetNumLines() or 1
        local size
        if input.GetFont then local _; _, size = input:GetFont() end
        self.scroll:SetContentSize(488, math.max(180, lines * ((size or 17) + 2) + 16))
        self:RefreshExportHitRect()
    end
    dialog.edit.frame:HookScript("OnTextChanged", function() dialog:RefreshExportText() end)
    dialog.scroll.frame:HookScript("OnVerticalScroll", function() dialog:RefreshExportHitRect() end)
end

function UI:EnsureExportDialog(context, module)
    local dialog, isNew = self:EnsureDialog(context, "export", 560, 340)
    if not isNew then return dialog end
    dialog.title = Add(context, nil, nil, "label", "exportTitle", dialog, {
        text = "导出插件管理预设", width = 512, height = 32, labelFill = true,
        justifyH = "CENTER", justifyV = "MIDDLE", fontKey = "heading",
    })
    SetAnchor(dialog.title, "TOPLEFT", dialog, "TOPLEFT", 24, -18)
    CreateTransferInput(context, dialog, "export")
    dialog.onlyCustom = Add(context, nil, nil, "checkbox", "exportOnlyCustom", dialog, {
        text = "仅导出自定义方案", width = 240, height = 28, value = self.exportOnlyCustom,
        tooltip = "开启后仅导出自定义方案，不包含内置方案。",
        labelFill = true, justifyH = "LEFT", textInsets = { 26, 4, 0, 0 },
        onChange = function(_, value)
            UI.exportOnlyCustom = value and true or false
            local text, reason = module:ExportBundleString({ includeOnlyCustom = UI.exportOnlyCustom })
            dialog.edit:SetValue(text or ("导出失败：" .. tostring(reason)), true)
            dialog:RefreshExportText()
            dialog.scroll.frame:SetVerticalScroll(0)
            dialog.edit:SetFocus()
            dialog.edit:HighlightText()
        end,
    })
    SetAnchor(dialog.onlyCustom, "TOPLEFT", dialog, "TOPLEFT", 24, -246)
    dialog.hint = Add(context, nil, nil, "label", "exportHint", dialog, {
        text = "Ctrl+A 全选，Ctrl+C 复制", width = 240, height = 28,
        labelFill = true, justifyH = "LEFT", justifyV = "MIDDLE",
    })
    SetAnchor(dialog.hint, "TOPRIGHT", dialog, "TOPRIGHT", -24, -246)
    dialog.close = Add(context, nil, nil, "button", "exportClose", dialog, {
        text = "关闭", width = 140, height = 34,
        onAction = function() dialog:SetVisible(false) end,
    })
    SetAnchor(dialog.close, "BOTTOM", dialog, "BOTTOM", 0, 16)
    return dialog
end

function UI:ShowExport(context, module)
    HideOtherDialogs(context, "export")
    local dialog = self:EnsureExportDialog(context, module)
    local text, reason = module:ExportBundleString({ includeOnlyCustom = self.exportOnlyCustom })
    dialog.onlyCustom:SetValue(self.exportOnlyCustom, true)
    dialog.edit:SetValue(text or ("导出失败：" .. tostring(reason)), true)
    dialog:SetVisible(true)
    dialog:RefreshExportText()
    dialog.scroll.frame:SetVerticalScroll(0)
    dialog.edit:SetFocus()
    dialog.edit:HighlightText()
    return text, reason, dialog
end

function UI:ConfirmImport(context, module, dialog)
    local text = Trim(dialog.edit:GetValue())
    local ok, reason
    if text:sub(1, 8) == "!RSAP:2:" then
        ok, reason = module:ImportBundleString(text, {
            overwriteSameName = self.importOverwriteSameName,
            includeOverrides = true,
        })
    else
        ok = module:ImportProfileString(text)
        if not ok then reason = "字符串内容无效" end
    end
    if not ok then
        dialog.status:SetText("导入失败：" .. tostring(reason or "未知错误"))
        return false, reason
    end
    dialog.status:SetText("导入成功")
    self:Refresh(context, module)
    RefreshTopBar("RefreshAddonProfileButton")
    dialog:SetVisible(false)
    return true
end

function UI:EnsureImportDialog(context, module)
    local dialog, isNew = self:EnsureDialog(context, "import", 560, 370)
    if not isNew then return dialog end
    dialog.title = Add(context, nil, nil, "label", "importTitle", dialog, {
        text = "导入插件管理预设", width = 512, height = 32, labelFill = true,
        justifyH = "CENTER", justifyV = "MIDDLE", fontKey = "heading",
    })
    SetAnchor(dialog.title, "TOPLEFT", dialog, "TOPLEFT", 24, -18)
    CreateTransferInput(context, dialog, "import")
    dialog.overwrite = Add(context, nil, nil, "checkbox", "importOverwrite", dialog, {
        text = "覆盖同名方案", width = 250, height = 28,
        tooltip = "导入时用分享内容覆盖已有的同名自定义方案。",
        value = self.importOverwriteSameName, labelFill = true, justifyH = "LEFT",
        textInsets = { 26, 4, 0, 0 },
        onChange = function(_, value) UI.importOverwriteSameName = value and true or false end,
    })
    SetAnchor(dialog.overwrite, "TOPLEFT", dialog, "TOPLEFT", 24, -246)
    dialog.status = Add(context, nil, nil, "label", "importStatus", dialog, {
        text = "粘贴 !RSAP:1: 或 !RSAP:2: 分享字符串", width = 250, height = 28,
        labelFill = true, justifyH = "RIGHT", justifyV = "MIDDLE",
    })
    SetAnchor(dialog.status, "TOPRIGHT", dialog, "TOPRIGHT", -24, -246)
    dialog.confirm = Add(context, nil, nil, "button", "importConfirm", dialog, {
        text = "导入", width = 140, height = 34,
        onAction = function() UI:ConfirmImport(context, module, dialog) end,
    })
    SetAnchor(dialog.confirm, "BOTTOM", dialog, "BOTTOM", -76, 16)
    dialog.cancel = Add(context, nil, nil, "button", "importCancel", dialog, {
        text = "取消", width = 140, height = 34,
        onAction = function() dialog:SetVisible(false) end,
    })
    SetAnchor(dialog.cancel, "BOTTOM", dialog, "BOTTOM", 76, 16)
    return dialog
end

function UI:ShowImport(context, module)
    HideOtherDialogs(context, "import")
    local dialog = self:EnsureImportDialog(context, module)
    dialog.edit:SetValue("", true)
    dialog.overwrite:SetValue(self.importOverwriteSameName, true)
    dialog.status:SetText("粘贴 !RSAP:1: 或 !RSAP:2: 分享字符串")
    dialog:SetVisible(true)
    dialog:RefreshExportText()
    dialog.scroll.frame:SetVerticalScroll(0)
    dialog.edit:SetFocus()
    return dialog
end

function UI:EnsureConfirmDialog(context)
    local dialog, isNew = self:EnsureDialog(context, "confirm", 430, 180)
    if not isNew then return dialog end
    dialog.message = Add(context, nil, nil, "label", "confirmMessage", dialog, {
        text = "", width = 382, height = 80, labelFill = true,
        justifyH = "CENTER", justifyV = "MIDDLE", wordWrap = true,
    })
    SetAnchor(dialog.message, "TOPLEFT", dialog, "TOPLEFT", 24, -24)
    dialog.accept = Add(context, nil, nil, "button", "confirmAccept", dialog, {
        text = "确认", width = 130, height = 34,
        onAction = function()
            local action = dialog.pendingAction
            dialog.pendingAction = nil
            dialog:SetVisible(false)
            if action then action() end
        end,
    })
    SetAnchor(dialog.accept, "BOTTOM", dialog, "BOTTOM", -70, 18)
    dialog.cancel = Add(context, nil, nil, "button", "confirmCancel", dialog, {
        text = "取消", width = 130, height = 34,
        onAction = function() dialog:SetVisible(false) end,
    })
    SetAnchor(dialog.cancel, "BOTTOM", dialog, "BOTTOM", 70, 18)
    return dialog
end

function UI:ShowConfirm(context, text, action, acceptText)
    local dialog = self:EnsureConfirmDialog(context)
    dialog.accept:SetText(acceptText or "确认")
    dialog.message:SetText(text)
    dialog.pendingAction = action
    if dialog.frame.Raise then dialog.frame:Raise() end
    dialog:SetVisible(true)
    return dialog
end

function UI:LeaveChecklist(context, action)
    local dialog = context.addonProfileDialogs and context.addonProfileDialogs.checklist
    if dialog and dialog.dirty then
        self:ShowConfirm(context, "当前清单有未保存修改，是否放弃修改？", function()
            dialog.dirty = false
            action()
        end, "放弃修改")
        return false
    end
    action()
    return true
end

function UI:ApplyChecklist(context, module, anchor)
    local dialog = context.addonProfileDialogs.checklist
    local id = self.checklistId
    local function Apply(save)
        if module.adapter:IsInCombat() then
            module:Print("|cffff0000战斗中不能切换插件预设，请脱战后重试。|r")
            return
        end
        if save then
            if not module:UpdateWhitelist(id, SortedList(UI.checklistSet)) then return end
            dialog.dirty = false
            UI:UpdateChecklistTitle(dialog, module)
        end
        if module:Apply(id, anchor) then
            UI.selectedId = id
            RefreshTopBar("RefreshAddonProfileButton")
            UI:Refresh(context, module)
        end
    end
    if dialog.dirty then
        self:ShowConfirm(context, "清单有未保存修改，保存后应用此方案？", function() Apply(true) end, "保存并应用")
    else Apply(false) end
end

function UI:RequestApply(module, id, anchor)
    local context = self.checklistContext
    local dialog = context and context.addonProfileDialogs and context.addonProfileDialogs.checklist
    if dialog and dialog.dirty then
        if id == self.checklistId then
            self:ApplyChecklist(context, module, anchor)
        else
            self:ShowConfirm(context, "清单有未保存修改，放弃修改并切换方案？", function()
                if module:Apply(id, anchor) then
                    UI:RefreshChecklist(context, module, UI.checklistId, true)
                    RefreshTopBar("RefreshAddonProfileButton")
                    UI:Refresh(context, module)
                end
            end, "放弃并切换")
        end
        return false, "confirmation-required"
    end
    return module:Apply(id, anchor)
end

function UI:RestoreBuiltins(context, module)
    self:ShowConfirm(context, "恢复全部内置方案的默认清单，并放弃内置方案未保存的修改？自定义方案会保留。", function()
        module:RestoreAllBuiltins()
        local profile = module:GetProfile(UI.checklistId)
        if profile and profile.builtin and context.addonProfileDialogs.checklist then
            UI:RefreshChecklist(context, module, profile.id, true)
        end
        UI:Refresh(context, module)
    end)
end

function UI:RestoreCurrent(context, module, id)
    local function Restore()
        module:RestoreBuiltin(id)
        if UI.checklistId == id and context.addonProfileDialogs and context.addonProfileDialogs.checklist then
            UI:RefreshChecklist(context, module, id, true)
        end
        UI:Refresh(context, module)
    end
    if self.checklistId == id then self:LeaveChecklist(context, Restore)
    else Restore() end
end

function UI:UpdateChecklistTitle(dialog, module)
    local profile = module:GetProfile(self.checklistId)
    local title = profile and module:GetProfileDisplayName(profile) or "未选择"
    dialog.title:SetText("编辑插件清单 · " .. title .. (dialog.dirty and " · 未保存" or ""))
end

local CHECKLIST_ROW_STEP = 26
local CHECKLIST_POOL_SIZE = 20 -- 450px viewport plus partial rows and a buffer.

function UI:BindChecklistItems(dialog)
    local offset = tonumber(dialog.scroll.frame:GetVerticalScroll()) or 0
    local first = math.max(1, math.floor(offset / CHECKLIST_ROW_STEP) + 1)
    for name in pairs(dialog.items) do dialog.items[name] = nil end
    for index, item in ipairs(dialog.itemOrder) do
        local position = first + index - 1
        local name = dialog.addonNames[position]
        if item.addonName ~= name or item.profileId ~= self.checklistId then
            item.bindingGeneration = (item.bindingGeneration or 0) + 1
            local tooltip = _G.GameTooltip
            if tooltip and tooltip.GetOwner and tooltip:GetOwner() == item.frame then tooltip:Hide() end
        end
        item.addonName, item.profileId = name, self.checklistId
        if name then
            local remark = ns.AddonProfileData.AddonRemarks[name]
            item.options.tooltip = remark
                and (remark .. "\n勾选后将该插件纳入当前方案的插件清单。")
                or "勾选后将该插件纳入当前方案的插件清单。"
            item:SetText(name)
            item:SetValue(self.checklistSet[name] == true, true)
            SetAnchor(item, "TOPLEFT", dialog.scroll:GetContent(), "TOPLEFT", 4,
                -4 - (position - 1) * CHECKLIST_ROW_STEP)
            item:SetVisible(true)
            dialog.items[name] = item
        else
            item:SetVisible(false)
        end
    end
end

function UI:EnsureChecklistItems(context, dialog, module)
    dialog.addonNames = BuildAddonNames(module)
    if not dialog.scrollBound then
        dialog.scrollBound = true
        dialog.scroll.frame:HookScript("OnVerticalScroll", function()
            UI:BindChecklistItems(dialog)
        end)
    end
    while #dialog.itemOrder < math.min(CHECKLIST_POOL_SIZE, #dialog.addonNames) do
        local item = Add(context, dialog.itemOrder, nil, "checkbox", nil,
            dialog.scroll:GetContent(), {
                width = 520, height = 24, value = false, labelFill = true,
                justifyH = "LEFT", justifyV = "MIDDLE", textInsets = { 26, 4, 0, 0 },
                onChange = function(control, value)
                    local name = control.addonName
                    if not name then return end
                    UI.checklistSet[name] = value and true or nil
                    dialog.dirty = true
                    UI:UpdateChecklistTitle(dialog, module)
                end,
            })
        local click = item.frame:GetScript("OnClick")
        item.frame:HookScript("OnMouseDown", function()
            item.pressedGeneration = item.bindingGeneration
        end)
        item.frame:HookScript("OnHide", function()
            if item.pressedGeneration then item.pressedGeneration = -1 end
        end)
        item.frame:SetScript("OnClick", function(frame, button)
            local generation = item.pressedGeneration
            item.pressedGeneration = nil
            if not item.addonName or (generation and generation ~= item.bindingGeneration) then
                item:SetValue(UI.checklistSet[item.addonName] == true, true)
                return
            end
            click(frame, button)
        end)
    end
    local height = math.max(1, #dialog.addonNames * CHECKLIST_ROW_STEP + 6)
    dialog.scroll:SetContentSize(528, height)
    local frame = dialog.scroll.frame
    local maximum = math.max(0, height - frame:GetHeight())
    if frame:GetVerticalScroll() > maximum then frame:SetVerticalScroll(maximum) end
    self:BindChecklistItems(dialog)
end

function UI:RefreshChecklist(context, module, id, reloadValues)
    local dialog = self:EnsureChecklistDialog(context, module)
    id = id or self.checklistId or self:GetSelectedID(module)
    if not module:GetProfile(id) then id = self:GetSelectedID(module) end
    if reloadValues ~= false or id ~= self.checklistId then
        self.checklistSet = CopySet(module:GetProfile(id) and module:GetProfile(id).whitelist or {})
        dialog.dirty = false
    end
    self.checklistId = id
    local profile = module:GetProfile(id)
    local values, order = BuildProfileChoices(module)
    dialog.profile.options.options, dialog.profile.options.order = values, order
    dialog.profile:SetValue(id, true)
    dialog.name:SetValue(profile and profile.name or "", true)
    dialog.rename:SetEnabled(profile and not profile.builtin)
    dialog.delete:SetEnabled(profile and not profile.builtin)
    dialog.restore:SetEnabled(profile and profile.builtin)
    self:EnsureChecklistItems(context, dialog, module)
    self:UpdateChecklistTitle(dialog, module)
    return dialog
end

function UI:EnsureChecklistDialog(context, module)
    self.checklistContext = context
    local dialog, isNew = self:EnsureDialog(context, "checklist", 600, 650)
    if not isNew then return dialog end
    dialog.items, dialog.itemOrder, dialog.dirty = {}, {}, false
    dialog.title = Add(context, nil, nil, "label", "checklistTitle", dialog, {
        text = "编辑插件清单", width = 552, height = 32, labelFill = true,
        justifyH = "CENTER", justifyV = "MIDDLE", fontKey = "heading",
    })
    SetAnchor(dialog.title, "TOPLEFT", dialog, "TOPLEFT", 24, -12)
    dialog.profile = Add(context, nil, nil, "dropdown", "checklistProfile", dialog, {
        text = "预设", width = 228, height = 30, options = {}, order = {},
        onChange = function(_, value)
            dialog.profile:SetValue(UI.checklistId, true)
            if value == UI.checklistId then return end
            UI:LeaveChecklist(context, function() UI:RefreshChecklist(context, module, value, true) end)
        end,
    })
    SetAnchor(dialog.profile, "TOPLEFT", dialog, "TOPLEFT", 24, -50)
    dialog.copy = Add(context, nil, nil, "button", "checklistCopy", dialog, {
        text = "复制方案", width = 140, height = 30,
        onAction = function()
            UI:LeaveChecklist(context, function()
                local profile = module:GetProfile(UI.checklistId)
                if not profile then return end
                local name = (profile.name or "预设") .. "2"
                if module.MakeUniqueImportedName then name = module:MakeUniqueImportedName(name) end
                local id = module:CreateCopy(profile.id, name)
                if id then
                    UI.selectedId, UI.checklistId = id, id
                    UI:Refresh(context, module)
                    UI:RefreshChecklist(context, module, id, true)
                end
            end)
        end,
    })
    SetAnchor(dialog.copy, "TOPLEFT", dialog, "TOPLEFT", 264, -50)
    dialog.delete = Add(context, nil, nil, "button", "checklistDelete", dialog, {
        text = "删除方案", width = 140, height = 30,
        onAction = function()
            local profile = module:GetProfile(UI.checklistId)
            if not profile or profile.builtin then return end
            UI:ShowConfirm(context, "确定删除预设「" .. tostring(profile.name) .. "」吗？", function()
                if module:Delete(profile.id) then
                    UI.selectedId, UI.checklistId = nil, nil
                    local nextId = UI:GetSelectedID(module)
                    UI.selectedId, UI.checklistId = nextId, nextId
                    UI:Refresh(context, module)
                    UI:RefreshChecklist(context, module, nextId, true)
                    RefreshTopBar("RefreshAddonProfileButton")
                end
            end)
        end,
    })
    SetAnchor(dialog.delete, "TOPRIGHT", dialog, "TOPRIGHT", -24, -50)
    dialog.name = Add(context, nil, nil, "editbox", "checklistName", dialog, {
        width = 228, height = 30, value = "", autoFocus = false,
        selectAllOnFocus = true, justifyH = "LEFT", textInsets = { 8, 8, 0, 0 },
    })
    SetAnchor(dialog.name, "TOPLEFT", dialog, "TOPLEFT", 24, -86)
    dialog.create = Add(context, nil, nil, "button", "checklistCreate", dialog, {
        text = "新建方案", width = 140, height = 30,
        onAction = function()
            local name = Trim(dialog.name:GetValue())
            if name == "" or (module._NameExists and module:_NameExists(name)) then return end
            UI:LeaveChecklist(context, function()
                local id = module:CreateCustom(name, UI.checklistId)
                UI.selectedId, UI.checklistId = id, id
                UI:Refresh(context, module)
                UI:RefreshChecklist(context, module, id, true)
            end)
        end,
    })
    SetAnchor(dialog.create, "TOPLEFT", dialog, "TOPLEFT", 264, -86)
    dialog.rename = Add(context, nil, nil, "button", "checklistRename", dialog, {
        text = "重命名", width = 140, height = 30,
        onAction = function()
            local profile, name = module:GetProfile(UI.checklistId), Trim(dialog.name:GetValue())
            if not profile or profile.builtin or name == "" then return end
            if name ~= profile.name and module._NameExists and module:_NameExists(name) then return end
            if module:Rename(profile.id, name) then
                UI:Refresh(context, module)
                UI:RefreshChecklist(context, module, profile.id, false)
                RefreshTopBar("RefreshAddonProfileButton")
            end
        end,
    })
    SetAnchor(dialog.rename, "TOPRIGHT", dialog, "TOPRIGHT", -24, -86)
    dialog.scroll = Add(context, nil, nil, "scroll", "checklistScroll", dialog, {
        width = 552, height = 450, contentWidth = 528, contentHeight = 1,
    })
    SetAnchor(dialog.scroll, "TOPLEFT", dialog, "TOPLEFT", 24, -122)
    dialog.save = Add(context, nil, nil, "button", "checklistSave", dialog, {
        text = "保存方案", width = 128, height = 34,
        onAction = function()
            if module:UpdateWhitelist(UI.checklistId, SortedList(UI.checklistSet)) then
                dialog.dirty = false
                UI:Refresh(context, module)
                UI:RefreshChecklist(context, module, UI.checklistId, true)
            end
        end,
    })
    SetAnchor(dialog.save, "BOTTOMLEFT", dialog, "BOTTOMLEFT", 24, 16)
    dialog.apply = Add(context, nil, nil, "button", "checklistApply", dialog, {
        text = "应用并重载", width = 128, height = 34,
        onAction = function(widget)
            UI:ApplyChecklist(context, module, widget:GetFrame())
        end,
    })
    SetAnchor(dialog.apply, "BOTTOMLEFT", dialog, "BOTTOMLEFT", 164, 16)
    dialog.restore = Add(context, nil, nil, "button", "checklistRestore", dialog, {
        text = "恢复当前", width = 128, height = 34,
        onAction = function()
            UI:RestoreCurrent(context, module, UI.checklistId)
        end,
    })
    SetAnchor(dialog.restore, "BOTTOMLEFT", dialog, "BOTTOMLEFT", 304, 16)
    dialog.close = Add(context, nil, nil, "button", "checklistClose", dialog, {
        text = "关闭", width = 128, height = 34,
        onAction = function()
            UI:LeaveChecklist(context, function() dialog:SetVisible(false) end)
        end,
    })
    SetAnchor(dialog.close, "BOTTOMRIGHT", dialog, "BOTTOMRIGHT", -24, 16)
    return dialog
end

function UI:ShowChecklist(context, module)
    HideOtherDialogs(context, "checklist")
    local previous = context.addonProfileDialogs and context.addonProfileDialogs.checklist
    local dirty = previous and previous.dirty
    local dialog = self:RefreshChecklist(context, module,
        dirty and self.checklistId or self:GetSelectedID(module), not dirty)
    local system = context.registry and context.registry.system
    local returnToMain = system and system.mainWindow
        and system.mainWindow:IsOpen() and true or false
    if returnToMain then system:CloseMain() end
    dialog.returnToMainPage = returnToMain and self.pageId or nil
    dialog:SetVisible(true)
    return dialog
end

local function BuildLegacyPage(context, module)
    local controls, children = {}, {}
    local root = context:GetRoot()
    local scroll = Add(context, nil, controls, "scroll", "pageScroll", root, {
        contentWidth = 500, contentHeight = 1,
    })
    scroll.frame:SetPoint("TOPLEFT", root.frame, "TOPLEFT", 0, 0)
    scroll.frame:SetPoint("BOTTOMRIGHT", root.frame, "BOTTOMRIGHT", 0, 0)
    local parent = scroll:GetContent()
    local profile = module:GetProfileDB()
    local values, order = BuildProfileChoices(module)
    local selected = UI:GetSelectedID(module)

    Add(context, children, controls, "label", "title", parent, {
        text = "插件管理", height = 30, labelFill = true,
        justifyH = "LEFT", justifyV = "MIDDLE", fontKey = "heading",
    })
    Add(context, children, controls, "checkbox", "enabled", parent, {
        text = "启用预设管理", height = 28, value = profile.enabled,
        tooltip = "启用后可保存、切换和应用不同的插件启停方案。",
        labelFill = true, justifyH = "LEFT", textInsets = { 26, 4, 0, 0 },
        onChange = function(_, value)
            module:GetProfileDB().enabled = value and true or false
            RefreshTopBar("RequestStateRefresh", 0)
        end,
    })
    Add(context, children, controls, "checkbox", "showSwitchButton", parent, {
        text = "启用切换按钮", height = 28, value = profile.showSwitchButton,
        tooltip = "在 TopBar 显示插件方案切换按钮，便于快速更换当前方案。",
        labelFill = true, justifyH = "LEFT", textInsets = { 26, 4, 0, 0 },
        onChange = function(_, value)
            module:GetProfileDB().showSwitchButton = value and true or false
            RefreshTopBar("RequestStateRefresh", 0)
        end,
    })
    Add(context, children, controls, "checkbox", "strict", parent, {
        text = "严格白名单", height = 28,
        tooltip = "应用方案时停用所有未列入插件清单的插件。",
        value = profile.strictWhitelist, labelFill = true, justifyH = "LEFT",
        textInsets = { 26, 4, 0, 0 },
        onChange = function(_, value) module:GetProfileDB().strictWhitelist = value and true or false end,
    })
    Add(context, children, controls, "label", "status", parent, {
        text = module:GetStatusText(), height = 44, labelFill = true,
        justifyH = "LEFT", justifyV = "MIDDLE",
    })
    Add(context, children, controls, "label", "profileLabel", parent, {
        text = "选择预设", height = 22, labelFill = true,
        justifyH = "LEFT", justifyV = "MIDDLE",
    })
    Add(context, children, controls, "dropdown", "profile", parent, {
        text = "预设", height = 30, options = values, order = order, value = selected,
        onChange = function(_, value) UI.selectedId = value end,
    })
    Add(context, children, controls, "button", "apply", parent, {
        text = "应用并重载", height = 32,
        onAction = function(widget)
            if module:RequestApply(UI:GetSelectedID(module), widget:GetFrame()) then
                RefreshTopBar("RefreshAddonProfileButton")
                UI:Refresh(context, module)
            end
        end,
    })
    Add(context, children, controls, "button", "checklist", parent, {
        text = "编辑插件清单", height = 32,
        onAction = function() UI:ShowChecklist(context, module) end,
    })
    Add(context, children, controls, "button", "manifest", parent, {
        text = "查看清单文本", height = 32,
        onAction = function() UI:ShowManifest(context, module) end,
    })
    Add(context, children, controls, "button", "export", parent, {
        text = "导出方案", height = 32,
        onAction = function() UI:ShowExport(context, module) end,
    })
    Add(context, children, controls, "button", "import", parent, {
        text = "导入方案", height = 32,
        onAction = function() UI:ShowImport(context, module) end,
    })
    Add(context, children, controls, "button", "restore", parent, {
        text = "恢复预设", height = 32,
        onAction = function()
            UI:RestoreCurrent(context, module, UI:GetSelectedID(module))
        end,
    })
    Add(context, children, controls, "button", "restoreBuiltins", parent, {
        text = "重置内置", height = 32,
        onAction = function() UI:RestoreBuiltins(context, module) end,
    })
    Add(context, children, controls, "button", "resetAll", parent, {
        text = "全部重置", height = 32,
        onAction = function()
            UI:ShowConfirm(context, "确定重置所有内置方案并清理全部自定义方案？", function()
                module:ResetAllProfilesToDefault()
                UI.selectedId, UI.checklistId = nil, nil
                UI:Refresh(context, module)
                RefreshTopBar("RefreshAddonProfileButton")
            end)
        end,
    })
    context:ApplyLayout("vertical", parent, children, { padding = 12, spacing = 7, autoHeight = true })
    scroll:SetContentSize(500, parent:GetHeight())
    context.addonProfileControls = controls
    return { children = { scroll }, controls = controls }
end

local function AddSetting(controls, row, method, key, options)
    local _, component, reason = row[method](row, key, options)
    if not component then
        error("Unable to create AddonProfile setting " .. key .. ": " .. tostring(reason), 2)
    end
    controls[key] = component
    return component
end

local function BuildPage(context, module)
    local page, reason = ns.UI:CreateSettingsPage(context, {
        id = UI.pageId,
        responsive = true,
        bottomPadding = 34,
    })
    if not page then error(reason, 2) end

    local controls = {}
    local profile = module:GetProfileDB()
    local values, order = BuildProfileChoices(module)
    local selected = UI:GetSelectedID(module)

    local general = page:Section("启用与切换")
    local toggles = general:QuadRow()
    AddSetting(controls, toggles, "Checkbox", "enabled", {
        text = "启用预设管理",
        tooltip = "启用后可保存、切换和应用不同的插件启停方案。",
        value = profile.enabled,
        onChange = function(_, value)
            module:GetProfileDB().enabled = value and true or false
            RefreshTopBar("RequestStateRefresh", 0)
        end,
    })
    AddSetting(controls, toggles, "Checkbox", "showSwitchButton", {
        text = "启用切换按钮",
        tooltip = "在 TopBar 显示插件方案切换按钮，便于快速更换当前方案。",
        value = profile.showSwitchButton,
        onChange = function(_, value)
            module:GetProfileDB().showSwitchButton = value and true or false
            RefreshTopBar("RequestStateRefresh", 0)
        end,
    })
    AddSetting(controls, toggles, "Checkbox", "strict", {
        text = "严格白名单",
        tooltip = "应用方案时停用所有未列入插件清单的插件。",
        value = profile.strictWhitelist,
        onChange = function(_, value)
            module:GetProfileDB().strictWhitelist = value and true or false
        end,
    })

    local presets = page:Section("当前插件组合", {
        description = "选择并应用插件组合；应用后确认重载，新的组合才会生效。",
    })
    -- Refresh owns status updates, including button actions and profile changes.
    controls.status = assert(presets:Description("", { minHeight = 44 }))
    local picker = presets:FieldRow()
    AddSetting(controls, picker, "Dropdown", "profile", {
        text = "选择预设",
        options = values,
        order = order,
        value = selected,
        onChange = function(_, value) UI.selectedId = value end,
    })
    local primaryActions = presets:ActionRow({ columns = 4 })
    AddSetting(controls, primaryActions, "Button", "apply", {
        text = "应用并重载",
        onAction = function(widget)
            if module:RequestApply(UI:GetSelectedID(module), widget:GetFrame()) then
                RefreshTopBar("RefreshAddonProfileButton")
                UI:Refresh(context, module)
            end
        end,
    })
    AddSetting(controls, primaryActions, "Button", "checklist", {
        text = "编辑插件清单",
        onAction = function() UI:ShowChecklist(context, module) end,
    })
    AddSetting(controls, primaryActions, "Button", "manifest", {
        text = "查看清单文本",
        onAction = function() UI:ShowManifest(context, module) end,
    })

    local sharing = page:Section("方案工具")
    local shareActions = sharing:ActionRow({ columns = 4 })
    AddSetting(controls, shareActions, "Button", "export", {
        text = "导出方案",
        onAction = function() UI:ShowExport(context, module) end,
    })
    AddSetting(controls, shareActions, "Button", "import", {
        text = "导入方案",
        onAction = function() UI:ShowImport(context, module) end,
    })
    local maintenance = sharing:ActionRow({ columns = 4 })
    AddSetting(controls, maintenance, "Button", "restoreBuiltins", {
        text = "重置内置",
        tooltip = "恢复全部内置方案的默认清单，保留自定义方案。",
        onAction = function() UI:RestoreBuiltins(context, module) end,
    })
    AddSetting(controls, maintenance, "Button", "restore", {
        text = "恢复预设",
        onAction = function()
            UI:RestoreCurrent(context, module, UI:GetSelectedID(module))
        end,
    })
    AddSetting(controls, maintenance, "Button", "resetAll", {
        text = "全部重置",
        onAction = function()
            UI:ShowConfirm(context, "确定重置所有内置方案并清理全部自定义方案？", function()
                module:ResetAllProfilesToDefault()
                UI.selectedId, UI.checklistId = nil, nil
                UI:Refresh(context, module)
                RefreshTopBar("RefreshAddonProfileButton")
            end)
        end,
    })

    page:Finish()
    context.addonProfileControls = controls
    context.addonProfilePage = page
    return page
end

function UI:Refresh(context, module)
    local controls = context and context.addonProfileControls
    if not controls then return false end
    local profile = module:GetProfileDB()
    local values, order = BuildProfileChoices(module)
    local selected = self:GetSelectedID(module)
    self.selectedId = selected
    controls.enabled:SetValue(profile.enabled, true)
    controls.showSwitchButton:SetValue(profile.showSwitchButton, true)
    controls.strict:SetValue(profile.strictWhitelist, true)
    controls.status:SetText(module:GetStatusText())
    controls.profile.options.options, controls.profile.options.order = values, order
    controls.profile:SetValue(selected, true)
    local selectedProfile = module:GetProfile(selected)
    controls.restore:SetEnabled(selectedProfile and selectedProfile.builtin)
    return true
end

function UI:ProfileChanged(module)
    self.selectedId = nil
    self.checklistId = nil
    self.checklistSet = {}

    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    local pages = system and system.pages
    local context = pages and type(pages.GetPage) == "function"
        and pages:GetPage(self.pageId) or nil
    if not context then return true end

    local clean = true
    local dialogs = context.addonProfileDialogs
    if dialogs then
        local _, dialog
        for _, dialog in pairs(dialogs) do
            dialog.pendingAction = nil
            dialog.dirty = false
            local ok = pcall(dialog.SetVisible, dialog, false)
            if not ok then clean = false end
        end
    end
    if context.addonProfileControls then
        local ok, refreshed = pcall(self.Refresh, self, context, module)
        if not ok or refreshed == false then clean = false end
    end
    return clean
end

function UI:Register(module)
    if self.registered then return true end
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, {
        title = "插件管理",
        description = "管理插件启用状态、预设组合和方案导入导出。",
        group = "pinned",
        navigationOrder = 30,
        searchKeywords = { "管理工具", "插件", "插件管理", "预设", "方案", "白名单", "导入", "导出" },
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfileDB()
                out.available = true
                out.enabled = profile ~= nil and profile.enabled == true
                out.mutable = true
                out.active = out.enabled and module:IsEnabled()
                out.pending = false
                out.reason = nil
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                local profile = module:GetProfileDB()
                if not profile then return false, "插件管理配置不可用" end
                profile.enabled = desired
                RefreshTopBar("RequestStateRefresh", 0)
                return profile.enabled == desired
            end,
        },
        build = function(context) return BuildPage(context, module) end,
        onShow = function(context) return UI:Refresh(context, module) end,
        onRefresh = function(context) return UI:Refresh(context, module) end,
        onHide = function(context)
            local dialogs = context.addonProfileDialogs
            if dialogs then
                local _, dialog
                for _, dialog in pairs(dialogs) do dialog:SetVisible(false) end
            end
        end,
    }) and true or false
    return self.registered
end

ns.AddonProfileUI = UI

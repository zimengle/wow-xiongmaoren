local _, ns = ...

local Policy = {
    CANONICAL_LAYOUT_NAME = "露露",
    DEFAULT_SIDE = ns.ProductManifest and ns.ProductManifest:Check("infinitePreset") and "left" or "right",
    DEFAULT_CANVAS_MODE = "safe16x9",
}
ns.LayoutPolicy = Policy

local VALID_SIDES = { left = true, middle = true, right = true }
local VALID_CANVAS_MODES = { screen = true, safe16x9 = true }

function Policy:NormalizeSide(value)
    return VALID_SIDES[value] and value or self.DEFAULT_SIDE
end

function Policy:NormalizeCanvasMode(value)
    return VALID_CANVAS_MODES[value] and value or self.DEFAULT_CANVAS_MODE
end

function Policy:ShouldImport(layoutExists, explicitReset)
    if layoutExists == nil then return false, "layout-state-unknown" end
    if explicitReset == true then return true end
    return layoutExists == false
end

function Policy:ShouldActivate(layoutExists)
    return layoutExists == true
end

-- Read only. Never clear Blizzard's flags or save/discard a user's changes.
function Policy:GetEditModeBlockReason(manager)
    if type(manager) ~= "table" then return nil end
    if type(manager.IsEditModeActive) == "function" and manager:IsEditModeActive() then return "edit-mode-active" end
    if type(manager.IsEditModeLocked) == "function" and manager:IsEditModeLocked() then return "edit-mode-locked" end
    if type(manager.HasActiveChanges) == "function" and manager:HasActiveChanges() then return "edit-mode-unsaved-changes" end
    if manager.layoutApplyInProgress then return "edit-mode-applying-layout" end
    local dialog = _G.EditModeUnsavedChangesDialog
    if type(dialog) == "table" and type(dialog.HasPendingSelectedLayout) == "function"
        and dialog:HasPendingSelectedLayout() then return "edit-mode-pending-layout" end
end

local BLOCK_MESSAGES = {
    ["edit-mode-active"] = "暴雪编辑模式仍在编辑中。请先保存或取消修改并退出编辑模式，再导入。",
    ["edit-mode-locked"] = "暴雪编辑模式被临时锁定。请返回编辑模式，保存或取消修改并退出，再导入。",
    ["edit-mode-unsaved-changes"] = "暴雪编辑模式有未保存修改。请打开编辑模式确认并保存或取消修改，退出后再导入。",
    ["edit-mode-applying-layout"] = "暴雪正在应用布局。请等待完成后再导入；若持续出现，请保留此原因反馈。",
    ["edit-mode-pending-layout"] = "暴雪编辑模式正在等待确认布局切换。请先处理确认窗口，再导入。",
}

function Policy:GetEditModeBlockMessage(reason)
    return BLOCK_MESSAGES[reason]
end

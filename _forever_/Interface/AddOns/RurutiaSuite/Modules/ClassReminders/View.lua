-- 文件职责：按需创建职业提示行，框体所有权属于调用模块。
-- 边界：按客户端能力装配；配置沿用旧namespace，运行资源由新版Runtime管理。
local _, ns = ...
if not ns.Build.HasModule("ClassReminders") then return end
local View = {}
local function Hide(frame) frame:Hide() end
function View:Row(module, key, order, icons)
    module.rows = module.rows or {}
    local row = module.rows[key]
    if not row then
        row = module:CreateFrame("Frame", nil, UIParent, nil, Hide, key)
        row:SetFrameStrata("DIALOG")
        row:EnableMouse(false)
        row.text = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        row.text:SetPoint("CENTER")
        if icons then
            row.left = row:CreateTexture(nil, "ARTWORK")
            row.right = row:CreateTexture(nil, "ARTWORK")
            row.left:SetPoint("RIGHT", row.text, "LEFT", -8, 0)
            row.right:SetPoint("LEFT", row.text, "RIGHT", 8, 0)
            row.left:SetTexCoord(0.07, 0.93, 0.07, 0.93)
            row.right:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        end
        row:Hide()
        module.rows[key] = row
    elseif not module.rowsOwned then module:OwnFrame(row, Hide, key) end
    ns.CenterTextGroup:Register(key, row, order)
    return row
end
function View:RenderRow(module, key, order, text, first, last)
    if not first then self:Hide(module, key); return end
    local row = self:Row(module, key, order, true)
    local size = ns.CenterTextGroup.db.profile.fontSize
    row.text:SetText(text)
    ns.CenterTextGroup:ApplyTextStyle(row.text, size)
    row.left:SetSize(size, size); row.right:SetSize(size, size)
    row.left:SetTexture(module.adapter:GetTexture(first)); row.right:SetTexture(module.adapter:GetTexture(last or first))
    row:SetSize(row.text:GetStringWidth() + size * 2 + 16, math.max(size, row.text:GetStringHeight()))
    row:Show()
    ns.CenterTextGroup:QueueLayout()
end
function View:Feast(module, text)
    local row = self:Row(module, "class.feast", 25, false)
    if text then row.text:SetText(text) end
    ns.CenterTextGroup:ApplyTextStyle(row.text, ns.CenterTextGroup.db.profile.fontSize + 4)
    row:SetSize(row.text:GetStringWidth(), row.text:GetStringHeight())
    row:Show(); ns.CenterTextGroup:QueueLayout()
end
function View:Hide(module, key)
    local row = module.rows and module.rows[key]
    if row then row:Hide(); ns.CenterTextGroup:QueueLayout() end
end
function View:Release(module)
    for key, row in pairs(module.rows or {}) do
        ns.CenterTextGroup:Unregister(key)
        module:ReleaseFrame(row)
    end
    module.rowsOwned = false
end
ns.ClassReminderView = View

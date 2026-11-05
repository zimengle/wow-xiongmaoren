local _, ns = ...

-- The installer owns this detached view. Never mutate EditModeManagerFrame or
-- invoke its UI import/save/rename/delete methods from addon execution.
local Storage = {}
ns.EditModeStorage = Storage

local function Copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    for key, item in pairs(value) do result[key] = Copy(item) end
    return result
end

function Storage:Open()
    local api, native = _G.C_EditMode, _G.EditModeManagerFrame
    local meta = _G.Enum and _G.Enum.EditModePresetLayoutsMeta
    if type(api) ~= "table" or type(api.GetLayouts) ~= "function"
        or type(api.SaveLayouts) ~= "function" or type(native) ~= "table"
        or type(native.GetLayouts) ~= "function" or not meta then
        return nil, "edit-mode-manager-not-ready"
    end
    local view = {}
    function view:GetLayouts()
        local saved = api.GetLayouts()
        if type(saved) ~= "table" or type(saved.layouts) ~= "table"
            or type(saved.activeLayout) ~= "number" then error("layout-state-unknown") end
        local full = Copy(saved)
        full.layouts = {}
        local presets = native:GetLayouts()
        for index = 1, meta.NumValues do
            if type(presets[index]) ~= "table" then error("preset-layouts-not-ready") end
            full.layouts[index] = Copy(presets[index])
        end
        for _, layout in ipairs(saved.layouts) do full.layouts[#full.layouts + 1] = Copy(layout) end
        self.layoutInfo = full
        return full.layouts
    end
    local function Save(self)
        if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then error("combat") end
        api.SaveLayouts(Copy(self.layoutInfo))
        self:GetLayouts()
    end
    function view:ImportLayout(info, layoutType, name)
        local layouts = self:GetLayouts()
        local index = meta.NumValues + 1
        for i, layout in ipairs(layouts) do
            if layout.layoutType <= layoutType then index = i + 1 end
        end
        local incoming = Copy(info)
        incoming.layoutType, incoming.layoutName = layoutType, name
        table.insert(layouts, index, incoming)
        if self.layoutInfo.activeLayout >= index then self.layoutInfo.activeLayout = self.layoutInfo.activeLayout + 1 end
        Save(self)
    end
    function view:RenameLayout(index, name)
        local layouts = self:GetLayouts()
        if index <= meta.NumValues or not layouts[index] then error("invalid-layout-index") end
        layouts[index].layoutName = name
        Save(self)
    end
    function view:DeleteLayout(index)
        local layouts = self:GetLayouts()
        if index <= meta.NumValues or not layouts[index] then error("invalid-layout-index") end
        table.remove(layouts, index)
        local active = self.layoutInfo.activeLayout
        self.layoutInfo.activeLayout = active == index and 1 or (active > index and active - 1 or active)
        Save(self)
    end
    for _, name in ipairs({ "IsEditModeActive", "IsEditModeLocked", "HasActiveChanges" }) do
        local method = name
        view[method] = function()
            return type(native[method]) == "function" and native[method](native) or false
        end
    end
    view.layoutApplyInProgress = native.layoutApplyInProgress
    local ok = pcall(view.GetLayouts, view)
    if not ok then return nil, "layout-state-unknown" end
    return view
end

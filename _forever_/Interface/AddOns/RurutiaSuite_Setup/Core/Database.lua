local _, ns = ...

local Database = {}
ns.Database = Database
local SAVED_VARIABLE_NAME = "RurutiaSuiteSetupDB"

local function NormalizeGlobal(global)
    local schemaVersion = rawget(global, "schemaVersion")
    if schemaVersion ~= nil and schemaVersion ~= 2 then
        return false, "unsupported RurutiaSuite_Setup database schema"
    end

    global.schemaVersion = 2
    local layout = rawget(global, "layout")
    if layout == nil then
        layout = {}
        rawset(global, "layout", layout)
    elseif type(layout) ~= "table" then
        return false, "RurutiaSuite_Setup layout database is corrupt"
    end
    layout.editModeLayoutName = ns.LayoutPolicy.CANONICAL_LAYOUT_NAME
    layout.side = ns.LayoutPolicy:NormalizeSide(layout.side)
    layout.canvasMode = ns.LayoutPolicy:NormalizeCanvasMode(layout.canvasMode)

    -- transaction/calibration belonged to the retired responsive-layout experiment.
    -- They are intentionally absent from current defaults and normalization: existing
    -- values remain unknown legacy data and must survive save/reload untouched.
    for _, key in ipairs({ "automation", "automationState", "gameMenu", "health", "migration" }) do
        local value = rawget(global, key)
        if value == nil then
            -- 通过宿主 DB 的 __index 物化子表，保留嵌套 defaults 和稀疏保存合同。
            value = global[key]
        elseif type(value) ~= "table" then
            return false, "RurutiaSuite_Setup " .. key .. " database is corrupt"
        end
        if type(value) ~= "table" then
            return false, "RurutiaSuite_Setup " .. key .. " database is unavailable"
        end
    end
    return true
end

function Database:Open(handle)
    if type(handle) ~= "table" or type(handle.OpenDatabase) ~= "function" then
        return nil, "RurutiaSuite extension database service is unavailable"
    end
    local db, reason = handle:OpenDatabase(SAVED_VARIABLE_NAME, ns.Defaults, {
        defaultProfile = "Default",
    })
    if not db then return nil, reason end
    if db.root ~= _G[SAVED_VARIABLE_NAME] then
        return nil, "RurutiaSuite_Setup SavedVariables root is stale"
    end
    local normalized, normalizeReason = NormalizeGlobal(db.global)
    if not normalized then return nil, normalizeReason end
    ns.DB = db
    return db
end

function Database:PrepareForSave()
    if not ns.DB then return true end
    if ns.DB.root ~= _G[SAVED_VARIABLE_NAME] then
        return false, "RurutiaSuite_Setup SavedVariables root is stale"
    end
    if type(ns.DB.PrepareForSave) ~= "function" then
        return false, "RurutiaSuite database save method is unavailable"
    end
    local ok, saved, reason = pcall(ns.DB.PrepareForSave, ns.DB)
    if not ok then return false, tostring(saved) end
    if saved == false then return false, tostring(reason or "unable to prepare RSS database for save") end
    return saved ~= nil and true or false, reason
end

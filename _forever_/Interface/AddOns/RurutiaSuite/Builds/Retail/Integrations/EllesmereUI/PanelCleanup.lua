-- 文件职责：探测 EUI 面板记录版本与结构，隔离第三方配置读写；不持有事务、DB 或 UI。
local _, ns = ...
if not (ns.Build.IsFamily("retail") or (ns.Build.GetID and ns.Build.GetID() == "classic-infinite")) or not ns.Build.SupportsIntegration("ellesmereui") then return end
local Adapter = {}

function Adapter:GetProvider()
    if not (C_AddOns and type(C_AddOns.IsAddOnLoaded) == "function"
        and type(C_AddOns.GetAddOnMetadata) == "function") then return nil, "插件接口不可用。" end
    if not C_AddOns.IsAddOnLoaded("EllesmereUI") or not C_AddOns.IsAddOnLoaded("EllesmereUIQoL") then
        return nil, "EllesmereUI 或体验优化模块尚未加载。"
    end
    local core = C_AddOns.GetAddOnMetadata("EllesmereUI", "Version")
    local qol = C_AddOns.GetAddOnMetadata("EllesmereUIQoL", "Version")
    if not core or core ~= qol then return nil, "EllesmereUI 核心与体验优化版本不一致。" end
    if type(_G.EllesmereUI) ~= "table" or type(_G.EllesmereUI._ResetShifterPositions) ~= "function" then
        return nil, "EllesmereUI 面板移动接口不完整。"
    end
    local root = _G.EllesmereUIDB
    if type(root) ~= "table" then return nil, "EllesmereUI 配置当前不可用。" end
    for _, field in ipairs({"shifterPositions", "shifterScales"}) do
        local records = root[field]
        if records ~= nil and type(records) ~= "table" then return nil, "面板记录结构不兼容。" end
        for id, value in pairs(records or {}) do
            if type(id) ~= "string" then return nil, "面板记录包含无效窗口 ID。" end
            if field == "shifterPositions" and type(value) ~= "table" then return nil, "面板位置记录不兼容。" end
            if field == "shifterScales" and (type(value) ~= "number" or value ~= value or value <= 0 or value == math.huge) then
                return nil, "面板缩放记录不兼容。"
            end
        end
    end
    return root
end


function Adapter:ReadRecords(root)
    return root.shifterPositions, root.shifterScales
end

function Adapter:RemoveRecord(root, id)
    if root.shifterPositions then root.shifterPositions[id] = nil end
    if root.shifterScales then root.shifterScales[id] = nil end
end

function Adapter:RestoreRecords(root, positions, scales)
    root.shifterPositions, root.shifterScales = positions, scales
end

ns.EUIPanelCleanupAdapter = Adapter

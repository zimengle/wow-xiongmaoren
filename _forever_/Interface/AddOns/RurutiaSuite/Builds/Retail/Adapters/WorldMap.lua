-- 文件职责：提供 Retail 大地图挂载点与显隐订阅的单一窄服务。
-- 不负责：任何业务状态、货币/活动数据、Frame 创建或轮询。

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")) then return end

local Service = {}

function Service:Resolve()
    local frame = _G.WorldMapFrame
    if not frame then return nil, nil end
    return frame, frame.ScrollContainer or frame
end

function Service:IsAvailable()
    local frame, anchor = self:Resolve()
    return frame ~= nil and anchor ~= nil
end

function Service:IsVisible()
    local frame = self:Resolve()
    return frame ~= nil and type(frame.IsShown) == "function" and frame:IsShown() or false
end

function Service:Subscribe(owner, callback)
    if type(owner) ~= "table" or type(owner.HookFrameScript) ~= "function"
        or type(callback) ~= "function" then return nil, "invalid_subscription" end
    local frame = self:Resolve()
    if not frame then return nil, "world_map_unavailable" end
    local tokens = {
        owner:HookFrameScript(frame, "OnShow", function() callback(true) end, "WorldMap:OnShow"),
        owner:HookFrameScript(frame, "OnHide", function() callback(false) end, "WorldMap:OnHide"),
    }
    return tokens
end

function Service:SubscribeState(owner, callback)
    local tokens, reason = self:Subscribe(owner, callback)
    if not tokens then return nil, reason end
    local frame = self:Resolve()
    if type(owner.HookSecureFunction) ~= "function" or type(frame.OnMapChanged) ~= "function" then
        return tokens
    end
    tokens[#tokens + 1] = owner:HookSecureFunction(
        frame,
        "OnMapChanged",
        function() callback(self:IsVisible()) end,
        "WorldMap:OnMapChanged"
    )
    return tokens
end

-- Runtime Hook broker 对同一 Frame/script 只安装一个物理 HookScript；
-- 最后一个 owner 退出后 wrapper 只执行长度为 0 的常量级检查。
ns.WorldMapAttachment = Service

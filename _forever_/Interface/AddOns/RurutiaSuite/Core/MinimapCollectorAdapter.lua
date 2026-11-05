-- Third-party collector boundaries. No third-party settings are ever written.
local _, ns = ...
local Adapter = {}
ns.MinimapCollectorAdapter = Adapter

local function Loaded(name)
    local check = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(check) == "function" and check(name) or false
end

local function WindModule()
    local wind = type(_G.WindTools) == "table" and _G.WindTools[1]
    if wind and type(wind.GetModule) == "function" then
        local ok, module = pcall(wind.GetModule, wind, "MinimapButtons", true)
        if ok then return module end
    end
end

function Adapter:Library()
    return _G.LibStub and _G.LibStub("LibDBIcon-1.0", true)
end

function Adapter:InCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown()
end

-- A hidden collector is still an owner. Configuration alone must not free
-- buttons retained by implementations whose switch requires a reload.
function Adapter:GetBlocker()
    local reasons = {}
    local function Add(reason) reasons[#reasons + 1] = reason end
    local pigButton = _G.PIG_MiniMapBut
    if Loaded("!Pig") or pigButton then
        local map = type(_G.PIGA) == "table" and _G.PIGA.Map
        local box = pigButton and pigButton.Box
        if box and type(box.GetNumChildren) == "function" and box:GetNumChildren() > 0 then
            Add("PIG 收纳框仍占用按钮；请关闭其收纳并 /reload。")
        elseif type(map) ~= "table" then
            Add("PIG 收纳设置尚未就绪，暂不接管。")
        elseif map.MinimapBut and map.MiniButShouNa_YN == 1 then
            Add("PIG 已开启小地图按钮收纳；请关闭其收纳并 /reload。")
        end
    end
    if _G.MBB_MinimapButtonFrame and type(_G.MBB_Buttons) == "table" then
        Add("MBB 正在收纳；请停用 MBB 并 /reload。")
    elseif Loaded("MBB") then
        Add("MBB 状态无法确认；请停用后 /reload，再启用 RS 收纳。")
    end
    local hb = _G.HidingBarAddon
    if hb then
        if not hb.pConfig then Add("HidingBar 尚未就绪，暂不接管。")
        elseif hb.pConfig.grabMinimap or (hb.minimapButtons and next(hb.minimapButtons)) then
            Add("HidingBar 正在收纳；请关闭其小地图按钮收集并 /reload。")
        end
    elseif Loaded("HidingBar") then
        Add("HidingBar 状态无法确认，暂不接管。")
    end
    local emm = _G._EMM_DB
    if emm and emm.profile and emm.profile.minimap then
        if emm.profile.minimap.enabled then
            Add("EllesmereUI 小地图模块正在管理插件按钮；请关闭该模块并 /reload。")
        end
    elseif Loaded("EllesmereUIMinimap") then
        Add("EllesmereUI 小地图模块状态无法确认，暂不接管。")
    end
    if _G.RecycleBinFrame then
        Add("NDui 小地图回收站已建立；请关闭「显示回收站」并 /reload。")
    elseif Loaded("NDui") then
        local account, profile = _G.NDuiADB, _G.NDuiDB
        local player = type(_G.UnitName) == "function" and _G.UnitName("player")
        local realm = type(_G.GetRealmName) == "function" and _G.GetRealmName()
        local key = player and realm and (player .. "-" .. realm)
        local index = key and account and account.ProfileIndex and account.ProfileIndex[key]
        if tonumber(index) and tonumber(index) > 1 then
            profile = _G.NDuiPDB and _G.NDuiPDB[tonumber(index) - 1]
        end
        local map = profile and profile.Map
        if not map then Add("NDui 回收站设置尚未就绪，暂不接管。")
        elseif map.ShowRecycleBin and not map.DisableMinimap then
            Add("NDui 已开启小地图回收站；请关闭「显示回收站」并 /reload。")
        end
    end
    -- ElvUI itself only styles system icons; its presence is not a conflict.
    local engine = type(_G.ElvUI) == "table" and _G.ElvUI[1]
    local wt = engine and engine.private and engine.private.WT
    local setting = wt and wt.maps and wt.maps.minimapButtons
    local wind = WindModule()
    if wind and wind.bar then
        Add("WindTools 收纳栏已接管按钮；请关闭其小地图按钮功能并 /reload。")
    elseif setting and setting.enable and not (wind and wind.StopRunning) then
        Add("WindTools 小地图按钮收纳已开启；请在地图设置中关闭并 /reload。")
    elseif Loaded("ElvUI_WindTools") and not setting then
        Add("WindTools 收纳状态无法确认，暂不接管。")
    end
    return #reasons > 0 and table.concat(reasons, "\n") or nil
end

function Adapter:IsSafe(frame, restoring)
    if not frame or type(frame.GetParent) ~= "function" then return false end
    local current = frame
    for _ = 1, 16 do
        if not current then return true end
        -- UIParent is the common root, not a target we modify. Its protected
        -- descendants do not disqualify otherwise ordinary addon buttons.
        if current == _G.UIParent and current ~= frame then return true end
        if current.IsForbidden and current:IsForbidden() then return false end
        -- Container protection is not inherited by an ordinary child. Never
        -- modify the map container; continue checking the button itself.
        if current ~= frame and self:IsMinimapParent(current) then return true end
        if current.IsProtected and current:IsProtected() and not (restoring and not self:InCombat()) then return false end
        current = current.GetParent and current:GetParent()
    end
    return false
end

-- Only inspect the minimap's direct children, never the world/map pin tree.
local systemButtons = {
    MinimapZoomIn=true, MinimapZoomOut=true, MinimapBackdrop=true,
    MinimapCluster=true, Minimap=true, GameTimeFrame=true,
    ExpansionLandingPageMinimapButton=true, AddonCompartmentFrame=true,
    PlumberLandingPageMinimapButton=true,
    -- NDui's full-map input layer owns tracking-menu clicks and zoom, not an addon launcher.
    NDui_MinimapClicker=true,
}
local function IsMapPin(name)
    return name and (name:match("Pin%d*$") or name:match("^HandyNotes")
        or name:match("^TomTom") or name:match("^HereBeDragons")
        or name:match("^Questie") or name:match("^GatherMate")
        or name:match("^[Pp]in"))
end

function Adapter:IsMinimapParent(parent)
    return parent ~= nil and (parent == _G.Minimap or parent == _G.MinimapBackdrop
        or parent == _G.MinimapCluster)
end

function Adapter:CanCollect(button, ownPanel, collectExpansion)
    if not self:IsSafe(button) or button == _G.LibDBIcon10_RurutiaSuite then return false end
    local name = button.GetName and button:GetName()
    -- Titan's native tracking entry must remain attached to the minimap.
    if (name == "MiniMapTracking" or name == "MiniMapTrackingButton")
        and ns.Build and ns.Build.GetID() == "classic-titan" then return false end
    if name and systemButtons[name]
        and not (name == "ExpansionLandingPageMinimapButton" and collectExpansion == true) then return false end
    return self:IsMinimapParent(button:GetParent()) or (ownPanel ~= nil and button:GetParent() == ownPanel)
end

function Adapter:Candidates(panel, collectExpansion)
    local entries, seen = {}, {}
    local lib = self:Library()
    if lib and type(lib.GetButtonList) == "function" and type(lib.GetMinimapButton) == "function" then
        for _, name in ipairs(lib:GetButtonList()) do
            local button = lib:GetMinimapButton(name)
            if button then entries[name], seen[button] = button, true end
        end
    end
    local function AddChildren(parent)
        if not parent or type(parent.GetChildren) ~= "function" then return end
        -- Enumeration is read-only; protection forbids mutation, not discovery.
        if parent.IsForbidden and parent:IsForbidden() then return end
        if not self:IsMinimapParent(parent) and not self:IsSafe(parent) then return end
        for _, button in ipairs({ parent:GetChildren() }) do
            if not seen[button] and self:CanCollect(button, panel, collectExpansion) then
                local name = button.GetName and button:GetName()
                local clickable = name and name:match("^LibDBIcon10_")
                    or button.IsObjectType and button:IsObjectType("Button")
                    or (button.GetScript and (button:GetScript("OnMouseDown") or button:GetScript("OnMouseUp")))
                -- Anonymous overlays and Blizzard map pins are not addon launchers.
                if name and not IsMapPin(name) and clickable
                    and button:GetWidth() >= 16 and button:GetHeight() >= 16 then
                    entries["frame:" .. name], seen[button] = button, true
                end
            end
        end
    end
    AddChildren(_G.Minimap)
    AddChildren(_G.MinimapBackdrop)
    AddChildren(_G.MinimapCluster)
    AddChildren(panel)
    return entries
end

function Adapter:Observe(module, callback)
    module.providerHooks = module.providerHooks or {}
    local function Hook(target, method, handler)
        if target and type(target[method]) == "function" then
            local key = tostring(target) .. ":" .. method
            if not module.providerHooks[key] then
                module.providerHooks[key] = module:HookSecureFunction(target, method, handler or callback)
            end
        end
    end
    Hook(_G, "_EMM_ApplyMinimap")
    Hook(_G, "_EMM_FullRebuildMinimap")
    Hook(_G, "MBB_AddButton")
    Hook(_G, "MBB_RestoreButton")
    Hook(_G.HidingBarAddon, "addButtons")
    Hook(_G.HidingBarAddon, "setProfile")
    -- PIG updates this public box method when switching collector modes.
    -- Queue through the existing Runtime owner; no polling or PIG settings writes.
    Hook(_G.PIG_MiniMapBut and _G.PIG_MiniMapBut.Box, "UpdateMiniMapButBox_3")
    local pigOptions = _G.PIG_OptionsUI
    if pigOptions and not module.providerHooks[pigOptions] then
        module.providerHooks[pigOptions] = module:HookFrameScript(pigOptions, "OnHide", callback, "PIG collector settings")
    end
    local engine = type(_G.ElvUI) == "table" and _G.ElvUI[1]
    Hook(engine, "UpdateAll")
    local wind = WindModule()
    Hook(wind, "Initialize")
    Hook(wind, "UpdateLayout")
    Hook(wind, "SkinMinimapButtons")
    local lib = self:Library()
    Hook(lib, "Show")
    Hook(lib, "Hide")
    Hook(lib, "Refresh")
    local function DragChanged(owner, library, name)
        local button = library:GetMinimapButton(name)
        local saved = button and owner.owned[button]
        if saved and self:IsSafe(button) then
            saved.dragStart, saved.dragStop = button:GetScript("OnDragStart"), button:GetScript("OnDragStop")
        end
        callback(owner)
    end
    Hook(lib, "Lock", DragChanged)
    Hook(lib, "Unlock", DragChanged)
end

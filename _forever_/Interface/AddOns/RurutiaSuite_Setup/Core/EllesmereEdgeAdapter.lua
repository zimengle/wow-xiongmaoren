local _, ns = ...

-- EUI integration boundary: read registered geometry, use provider-owned
-- position writers, and restore shared table identities on failure. No EUI
-- implementation is copied here; these callbacks remain owned by EUI.
local Adapter = {}
ns.EllesmereEdgeAdapter = Adapter
local ROOTS = { "MainBar", "EDB_7", "EDB_5", "ECHAT_MainChat", "EBS_Minimap", "Bar4", "PAB_Debuffs" }
local EXPECTED = { Bar2="MainBar", Bar3="Bar2", Bar6="Bar2", StanceBar="Bar3",
    ERB_CastBar="Bar3", Bar5="Bar4", PAB_Buffs="EBS_Minimap", EUI_FPS="EBS_Minimap",
    EDM_Win1="EDB_5", EDM_Win2="EDM_Win1", EDM_Win3="EDM_Win2", EMT_MythicTimer="EDM_Win3" }
-- EUI bags are not unlock roots. They persist TOPLEFT/BOTTOMLEFT canvas
-- pixels, so scale changes drift them. Snap to BOTTOMRIGHT like chat.
local BAG_POS = { point="BOTTOMRIGHT", relativePoint="BOTTOMRIGHT", x=0, y=0 }

local function BagsSlot(profile)
    local bags = profile and profile.addons and profile.addons.EllesmereUIBags
    return type(bags) == "table" and bags or nil
end

local function BagsAligned(pos)
    local finite = ns.EllesmereEdgeGeometry.Finite
    return type(pos) == "table" and pos.point == BAG_POS.point
        and (pos.relativePoint == BAG_POS.relativePoint or pos.relPoint == BAG_POS.relativePoint)
        and finite(pos.x) and finite(pos.y) and pos.x == BAG_POS.x and pos.y == BAG_POS.y
end

local function ApplyBagsFrame(pos)
    local frame = _G.EUI_Bags
    if not (frame and type(frame.ClearAllPoints) == "function" and type(frame.SetPoint) == "function") then
        return
    end
    frame:ClearAllPoints()
    if type(pos) == "table" and pos.point then
        frame:SetPoint(pos.point, _G.UIParent, pos.relativePoint or pos.relPoint or pos.point, pos.x or 0, pos.y or 0)
    else
        frame:SetPoint("BOTTOMRIGHT", _G.UIParent, "BOTTOMRIGHT", -50, 50)
    end
end

local function SnapBags(profile)
    local bags = BagsSlot(profile)
    if not bags then return end
    bags.bagsPosition = { point=BAG_POS.point, relativePoint=BAG_POS.relativePoint,
        x=BAG_POS.x, y=BAG_POS.y }
    ApplyBagsFrame(bags.bagsPosition)
end

function Adapter.Copy(v, seen)
    if type(v) ~= "table" then return v end
    seen = seen or {}; if seen[v] then return seen[v] end
    local out = {}; seen[v] = out
    for k, x in pairs(v) do out[k] = Adapter.Copy(x, seen) end
    return out
end

function Adapter.Equal(a, b, seen)
    if type(a) ~= type(b) then return false end
    if type(a) ~= "table" then return a == b end
    seen = seen or {}; if seen[a] == b then return true end; seen[a] = b
    for k, v in pairs(a) do if not Adapter.Equal(v, b[k], seen) then return false end end
    for k in pairs(b) do if a[k] == nil then return false end end
    return true
end

function Adapter.DiffPath(a, b, path)
    path = path or ""
    if type(a) ~= type(b) then return path ~= "" and path or "<root>" end
    if type(a) ~= "table" then
        if a ~= b then return path ~= "" and path or "<root>" end
        return nil
    end
    for k, v in pairs(a) do
        local p = path == "" and tostring(k) or (path .. "." .. tostring(k))
        if b[k] == nil then return p end
        local d = Adapter.DiffPath(v, b[k], p)
        if d then return d end
    end
    for k in pairs(b) do
        if a[k] == nil then return path == "" and tostring(k) or (path .. "." .. tostring(k)) end
    end
end

-- Retain all surviving table identities, including module DB references.
function Adapter.Restore(dst, src)
    for k in pairs(dst) do if src[k] == nil then dst[k] = nil end end
    for k, v in pairs(src) do
        if type(v) == "table" then
            if type(dst[k]) ~= "table" then dst[k] = {} end
            Adapter.Restore(dst[k], v)
        else dst[k] = v end
    end
end

local function Require(ok, reason)
    if not ok then error(reason, 0) end
end

local function Combat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown()
end
Adapter.InCombat = Combat

function Adapter:Guard()
    Require(not Combat(), "战斗中不能修正布局")
    local api, db = _G.EllesmereUI, _G.EllesmereUIDB
    Require(type(api) == "table" and type(db) == "table" and type(db.profiles) == "table", "EUI未就绪")
    Require(type(api.GetActiveProfileName) == "function" and type(api.IsUnlockModeActive) == "function"
        and type(api.SpecOverrides_EditSessionActive) == "function"
        and type(api.ReapplyAllUnlockAnchorsForced) == "function"
        and type(api.ReapplyOwnAnchor) == "function"
        and type(api.ApplyCenterPosition) == "function", "EUI位置接口不兼容")
    Require(not api.IsUnlockModeActive() and not api.SpecOverrides_EditSessionActive(), "请先退出EUI布局编辑")
    Require(not api._specProfileSwitching and not api._abAnchorSuppressed, "布局正在刷新，请稍后再试")
    local name = api.GetActiveProfileName()
    Require(name == "露露-左布局" or name == "露露-右布局" or name == "露露-中布局",
        "请先切换露露左、中或右布局")
    local profile = db.profiles[name]
    Require(type(profile) == "table" and type(profile.addons) == "table", "当前布局数据未就绪")
    -- A complete layer fork can own different sizes and growth directions.
    -- Never apply the active spec's geometry to an inactive fork. Current Lulu
    -- left/right designs have none; unknown forks require a dedicated adapter.
    for _, key in ipairs({"specUnlockOverrides", "condUnlockOverrides"}) do
        local store = profile[key]
        Require(store == nil or (type(store) == "table" and not store.baselineLayout
            and (store.layouts == nil or type(store.layouts) == "table" and next(store.layouts) == nil)),
            "存在独立专精或条件位置层，暂不能安全修正")
    end
    return api, db, profile, name
end

local function Measure(element, key, parentScale)
    Require(type(element) == "table" and type(element.getFrame) == "function", "元素未注册：" .. key)
    local frame = element.getFrame(key)
    Require(frame and type(frame.GetEffectiveScale) == "function", "元素尚未创建：" .. key)
    Require(not (frame.IsForbidden and frame:IsForbidden()), "元素禁止访问：" .. key)
    Require(type(element.getSize) == "function", "元素公开尺寸接口不可用：" .. key)
    local w, h = element.getSize(key)
    local scale = frame:GetEffectiveScale()
    local finite = ns.EllesmereEdgeGeometry.Finite
    Require(finite(w) and finite(h) and finite(scale) and w > 0 and h > 0 and scale > 0,
        "元素尺寸尚未稳定：" .. key)
    return { width=w*scale/parentScale, height=h*scale/parentScale, ratio=scale/parentScale }
end

function Adapter:Capture()
    local api, db, profile, name = self:Guard()
    local parent = _G.UIParent
    Require(parent and type(parent.GetEffectiveScale) == "function", "画布未就绪")
    local canvas = { width=parent:GetWidth(), height=parent:GetHeight(), scale=parent:GetEffectiveScale() }
    local finite = ns.EllesmereEdgeGeometry.Finite
    Require(finite(canvas.scale) and canvas.scale > 0, "画布缩放无效")
    local registry = api._unlockRegisteredElements
    Require(type(registry) == "table", "EUI元素注册表未就绪")
    local anchors = db.unlockAnchors
    Require(type(anchors) == "table", "EUI锚点未就绪")
    local elements, roots = {}, {}
    for _, key in ipairs(ROOTS) do roots[#roots+1] = key end
    -- Toasts are transient overlays, but EUI registers their saved position
    -- even while hidden. No frame creation or visibility changes belong here.
    if registry.ECHAT_BNToast then roots[#roots+1] = "ECHAT_BNToast" end
    -- EUI forbids QueueStatus anchor chains. Map companions persist
    -- independent ActionBars positions, including hidden XP/Rep bars.
    local barPositions = profile.addons.EllesmereUIActionBars
        and profile.addons.EllesmereUIActionBars.barPositions
    for _, key in ipairs({"QueueStatus", "XPBar", "RepBar"}) do
        if barPositions and barPositions[key] then roots[#roots+1] = key end
    end
    local side = name=="露露-左布局" and "left" or name=="露露-中布局" and "middle" or "right"
    local expected = self.Copy(EXPECTED)
    local meters = profile.addons.EllesmereUIDamageMeters
    if meters and meters.dm and meters.dm.windowCount == 2 then
        expected.EDM_Win3 = nil
        expected.EMT_MythicTimer = "EDM_Win2"
        if anchors.EMT_MythicTimer == nil then expected.EMT_MythicTimer = nil end
    end
    -- Forever's owner profiles can end the meter chain at window 2. An
    -- unlinked third window/timer remains independent and must not be moved
    -- or given a new anchor. Existing links still obey the normal contract.
    if ns.ProductManifest and ns.ProductManifest:Check("infinitePreset") then
        for _, key in ipairs({"EDM_Win3", "EMT_MythicTimer"}) do
            if anchors[key] == nil then expected[key] = nil end
        end
    end
    if side == "middle" then
        for _, key in ipairs({"Bar2","Bar3","Bar6","StanceBar","ERB_CastBar"}) do expected[key]=nil end
        for _, key in ipairs({"Bar2","Bar3","Bar6","StanceBar"}) do
            local e = registry[key]
            if e and not (e.isHidden and e.isHidden(key)) then roots[#roots+1]=key end
        end
    end
    if side == "left" or side == "middle" then roots[#roots+1] = "RF_RaidFrames" end
    for _, key in ipairs(roots) do
        local e = registry[key]
        Require(not anchors[key], "贴边根节点被其他锚点接管：" .. key)
        Require(not (e and e.isAnchored and e.isAnchored(key)), "模块接管了位置：" .. key)
        Require(e and type(e.savePosition) == "function" and type(e.loadPosition) == "function"
            and type(e.applyPosition) == "function", "位置保存接口不可用：" .. key)
        elements[key] = Measure(e, key, canvas.scale)
    end
    -- Single-storage is required: writing an unrelated module DB would look
    -- correct on screen but would neither persist nor roll back this Profile.
    Require(api.Lite and type(api.Lite.GetAddon) == "function", "EUI模块存储接口未就绪")
    for _, folder in ipairs({"EllesmereUIActionBars", "EllesmereUIDataBars", "EllesmereUIChat",
        "EllesmereUIMinimap", "EllesmereUIUnitFrames", "EllesmereUIRaidFrames"}) do
        local addon = api.Lite.GetAddon(folder, true)
        -- Chat owns a Lite DB but does not register a Lite addon instance.
        -- Its exported DB is the same object used by ECHAT position callbacks.
        local moduleDB = addon and addon.db
        if folder == "EllesmereUIChat" and not addon then
            moduleDB = _G._ECHAT_DB
            Require(type(moduleDB) == "table" and moduleDB.folder == folder,
                "聊天模块存储接口未就绪")
        end
        -- UnitFrames registers an addon, but keeps its DB on the exported
        -- module namespace used by PlayerAuraBars, not on addon.db.
        if folder == "EllesmereUIUnitFrames" then
            local module = api._ModuleNS and api._ModuleNS[folder]
            moduleDB = module and module.db
            Require(type(moduleDB) == "table" and moduleDB.folder == folder,
                "单位框体模块存储接口未就绪")
        end
        Require(type(moduleDB) == "table" and type(moduleDB.profile) == "table"
            and moduleDB.profile == profile.addons[folder],
            "模块与当前配置档不同步：" .. folder)
    end
    local bags = BagsSlot(profile)
    if bags then
        local bagsDB = api._bagsDB
        if type(bagsDB) == "table" then
            Require(bagsDB.profile == bags, "模块与当前配置档不同步：EllesmereUIBags")
        end
    end
    local bars = profile.addons.EllesmereUIDataBars
    Require(bars and type(bars.bars) == "table", "信息条数据缺失")
    for _, id in ipairs({5,7}) do
        local count = 0
        for _, bar in pairs(bars.bars) do
            if bar.id == id then
                count = count+1
                Require(bar.orientation == "H" and bar.lengthMode ~= "full"
                    and (bar.snapEdge == nil or bar.snapEdge == "none"), "信息条处于其他布局模式")
            end
        end
        Require(count == 1, "信息条ID缺失或重复")
    end
    for child, target in pairs(expected) do
        Require(type(anchors[child]) == "table" and anchors[child].target == target,
            "布局关联不匹配：" .. child .. " → " .. target)
    end
    -- Validate anchor and size dependencies, not just positional links.
    local maps = {anchors, db.unlockWidthMatch or {}, db.unlockHeightMatch or {}}
    local visiting, done = {}, {}
    local function visit(key)
        Require(not visiting[key], "布局依赖循环：" .. key)
        if done[key] then return end
        Require(type(registry[key]) == "table", "布局依赖未注册：" .. key)
        visiting[key] = true
        for i, map in ipairs(maps) do
            local target = map[key]
            if i == 1 and target then target = target.target end
            if target then Require(type(target) == "string", "布局依赖格式无效"); visit(target) end
        end
        visiting[key], done[key] = nil, true
    end
    for _, key in ipairs(roots) do visit(key) end
    for key in pairs(expected) do visit(key) end
    -- Hidden followers are owned by EUI and must not be forced visible. Aura
    -- rects may be secret; only non-aura, currently visible followers are read.
    local followers = {}
    for key in pairs(expected) do
        local e = registry[key]
        local frame = e.getFrame and e.getFrame(key)
        if key ~= "PAB_Buffs" and frame and frame.IsShown and frame:IsShown() then
            followers[key] = Measure(e,key,canvas.scale)
        end
    end
    -- Minimap's module apply callback does not reposition an already active
    -- map. Retain its actual center for rollback, including old corner anchors.
    local mapFrame = registry.EBS_Minimap.getFrame("EBS_Minimap")
    local mapRatio = elements.EBS_Minimap.ratio
    local mx, my = mapFrame:GetLeft(), mapFrame:GetBottom()
    local mw, mh = mapFrame:GetWidth(), mapFrame:GetHeight()
    Require(finite(mx) and finite(my) and finite(mw) and finite(mh), "小地图位置尚未稳定")
    local mapCenter = { point="CENTER", relPoint="CENTER",
        x=(mx+mw/2)*mapRatio-canvas.width/2,
        y=(my+mh/2)*mapRatio-canvas.height/2 }
    local spec = type(_G.GetSpecialization) == "function" and _G.GetSpecialization() or nil
    local positions = {}
    for _, key in ipairs(roots) do positions[key] = self.Copy(registry[key].loadPosition(key)) end
    return { api=api, db=db, profile=profile, name=name, side=side,
        registry=registry, spec=spec, canvas=canvas, mapCenter=mapCenter, elements=elements, roots=roots, positions=positions, followers=followers,
        before=self.Copy(profile), anchors=self.Copy(anchors),
        widthMatch=self.Copy(db.unlockWidthMatch), heightMatch=self.Copy(db.unlockHeightMatch) }
end

function Adapter:Same(a, b)
    return a.profile == b.profile and a.name == b.name and a.registry == b.registry and a.spec == b.spec
        and self.Equal(a.before,b.before) and self.Equal(a.canvas,b.canvas)
        and self.Equal(a.elements,b.elements) and self.Equal(a.positions,b.positions)
        and self.Equal(a.mapCenter,b.mapCenter)
        and self.Equal(a.followers,b.followers)
        and self.Equal(a.anchors,b.anchors) and self.Equal(a.widthMatch,b.widthMatch)
        and self.Equal(a.heightMatch,b.heightMatch)
end

local function GuardOwner(adapter, state)
    local api, db, profile, name = adapter:Guard()
    Require(api == state.api and db == state.db and profile == state.profile and name == state.name,
        "执行期间活动布局已变化")
end

-- Forced reapply skips action bars whose grow direction is not CENTER.
-- Re-anchor those followers from the live parent after roots have moved.
local FOLLOW_REAPPLY = { "Bar2", "Bar5", "Bar3", "Bar6" }
local FOLLOW_LAYOUT = { "Bar2", "Bar5", "Bar3", "Bar6", "StanceBar" }

local function ReapplySkippedBars(state)
    for _, key in ipairs(FOLLOW_REAPPLY) do
        state.api.ReapplyOwnAnchor(key)
    end
end

function Adapter:EnsureFollowersFit(state, boxes)
    if state.side == "middle" then return end
    local bar6, main = state.followers.Bar6, boxes.MainBar
    if not (bar6 and main) then return end
    local off, ai = 0, state.anchors and state.anchors.Bar6
    if type(ai) == "table" and type(ai.edgeOffX) == "number" then off = ai.edgeOffX end
    local left = main.left + main.width + off
    local tolerance = 1.5 / state.canvas.scale
    Require(left >= -tolerance and left + bar6.width <= state.canvas.width + tolerance,
        "画布容纳不下：Bar6")
end

function Adapter:Write(state, targets)
    for _, p in ipairs(targets) do
        GuardOwner(self,state)
        local e = state.registry[p.key]
        if p.key=="RF_RaidFrames" then
            -- Tell EUI these are live-tier center coordinates; its writer owns
            -- conversion to the base footprint and preserves tier overrides.
            local x, y = p.x, p.y
            if state.side=="left" then
                local size, canvas = state.elements[p.key], state.canvas
                -- Geometry expresses the left layout as TOPLEFT/TOPLEFT. EUI's
                -- tier rebase accepts a live CENTER/CENTER, in element units.
                local bottom = math.floor((canvas.height-size.height)*canvas.scale+0.5)/canvas.scale
                x = (size.width-canvas.width)/2/size.ratio
                y = (bottom+size.height/2-canvas.height/2)/size.ratio
            end
            e.savePosition(p.key,"CENTER","CENTER",x,y,"TOPLEFT","TOPLEFT")
        else
            e.savePosition(p.key,p.point,p.relPoint,p.x,p.y)
        end
        GuardOwner(self,state)
        e.applyPosition(p.key)
        if p.key == "EBS_Minimap" then
            GuardOwner(self,state)
            local ratio = state.elements[p.key].ratio
            Require(state.api.ApplyCenterPosition(p.key, {point="CENTER",relPoint="CENTER",
                x=p.x*ratio,y=p.y*ratio}), "小地图位置应用失败")
        end
    end
    GuardOwner(self,state)
    ReapplySkippedBars(state)
    GuardOwner(self,state)
    state.api.ReapplyAllUnlockAnchorsForced()
    GuardOwner(self,state)
    SnapBags(state.profile)
end

local function WithoutPositions(adapter, profile, side, elements)
    local copy = adapter.Copy(profile)
    local a = copy.addons
    -- Drop the whole position record. EUI savePos may replace CENTER with a
    -- growth edge and attach tgt*/refX follow baselines on the same table.
    local function mask(t, key)
        if type(t) == "table" then t[key] = nil end
    end
    local bp = a.EllesmereUIActionBars and a.EllesmereUIActionBars.barPositions
    mask(bp, "MainBar")
    mask(bp, "Bar4")
    if elements.QueueStatus then mask(bp, "QueueStatus") end
    if elements.XPBar then mask(bp, "XPBar") end
    if elements.RepBar then mask(bp, "RepBar") end
    for _, key in ipairs(FOLLOW_LAYOUT) do mask(bp, key) end
    for _, bar in pairs(a.EllesmereUIDataBars.bars) do
        if bar.id==5 or bar.id==7 then mask(bar,"savedPos") end
    end
    local chat = a.EllesmereUIChat and a.EllesmereUIChat.chat
    mask(chat, "chatPosition")
    if elements.ECHAT_BNToast then mask(chat, "toastPosition") end
    if type(chat) == "table" then chat._chatPosOwnership = nil end
    mask(a.EllesmereUIMinimap.minimap,"position")
    mask(a.EllesmereUIUnitFrames.playerAuraBars,"debuffsPos")
    if side=="left" or side=="middle" then mask(a.EllesmereUIRaidFrames,"unlockPos") end
    if type(a.EllesmereUIBags) == "table" then a.EllesmereUIBags.bagsPosition = nil end
    -- Height/width match may rewrite follower button sizes when parents move.
    local settings = a.EllesmereUIActionBars and a.EllesmereUIActionBars.bars
    if type(settings) == "table" then
        for _, key in ipairs(FOLLOW_LAYOUT) do
            local s = settings[key]
            if type(s) == "table" then
                s.buttonWidth, s.buttonHeight = nil, nil
                s._matchExtraPixels, s._matchExtraPixelsH, s._matchExtraPixelsW = nil, nil, nil
            end
        end
    end
    return copy
end

function Adapter:Verify(state, boxes)
    GuardOwner(self,state)
    local tolerance = 1.5/state.canvas.scale
    for key, box in pairs(boxes) do
        local e = state.registry[key]
        local frame = e.getFrame(key)
        local ratio = frame:GetEffectiveScale()/state.canvas.scale
        local w, h = e.getSize(key)
        local finite = ns.EllesmereEdgeGeometry.Finite
        Require(finite(w) and finite(h) and finite(ratio), "元素尺寸不可回读：" .. key)
        if key == "ECHAT_BNToast" then
            local pos = e.loadPosition(key)
            Require(pos and pos.point=="BOTTOMLEFT" and pos.relPoint=="BOTTOMLEFT"
                and finite(pos.x) and finite(pos.y)
                and math.abs(pos.x*ratio-box.left)<=tolerance
                and math.abs(pos.y*ratio-box.bottom)<=tolerance,
                "战网弹窗保存位置回读不一致")
            if frame.IsShown and frame:IsShown() then
                local x, y = frame:GetLeft(), frame:GetBottom()
                Require(finite(x) and finite(y) and math.abs(x*ratio-box.left)<=tolerance
                    and math.abs(y*ratio-box.bottom)<=tolerance, "战网弹窗位置回读不一致")
            end
        elseif key ~= "PAB_Debuffs" then
            local x, y = frame:GetLeft(), frame:GetBottom()
            Require(finite(x) and finite(y), "位置暂不可回读：" .. key)
            if key == "EBS_Minimap" then
                -- Rectangular maps crop a square canvas about its center.
                -- getSize describes the visible layout, not the raw frame.
                x = x + (frame:GetWidth()-w)/2
                y = y + (frame:GetHeight()-h)/2
            end
            Require(math.abs(x*ratio-box.left)<=tolerance and math.abs(y*ratio-box.bottom)<=tolerance,
                "位置回读不一致：" .. key)
        else
            -- Aura container rects may be secret. Never inspect/compare them.
            local pos = e.loadPosition(key)
            Require(pos and pos.point == "CENTER" and pos.relPoint == "CENTER"
                and finite(pos.x) and finite(pos.y)
                and math.abs(pos.x*ratio+state.canvas.width/2-(box.left+box.width/2))<=tolerance
                and math.abs(pos.y*ratio+state.canvas.height/2-(box.bottom+box.height/2))<=tolerance,
                "减益保存坐标回读不一致")
        end
        Require(math.abs(w*ratio-box.width)<=tolerance and math.abs(h*ratio-box.height)<=tolerance,
            "尺寸发生变化：" .. key)
    end
    for key in pairs(state.followers) do
        local e = state.registry[key]
        local frame = e.getFrame(key)
        local size = Measure(e,key,state.canvas.scale)
        local x,y = frame:GetLeft(),frame:GetBottom()
        local finite = ns.EllesmereEdgeGeometry.Finite
        Require(finite(x) and finite(y), "关联元素位置不可回读：" .. key)
        x,y = x*size.ratio,y*size.ratio
        Require(x >= -tolerance and y >= -tolerance
            and x+size.width <= state.canvas.width+tolerance
            and y+size.height <= state.canvas.height+tolerance, "关联元素超出画布：" .. key)
    end
    Require(self.Equal(state.anchors,state.db.unlockAnchors)
        and self.Equal(state.widthMatch,state.db.unlockWidthMatch)
        and self.Equal(state.heightMatch,state.db.unlockHeightMatch), "EUI依赖关系意外变化")
    local bags = BagsSlot(state.profile)
    if bags then
        Require(BagsAligned(bags.bagsPosition), "背包位置回读不一致")
    end
    local left = WithoutPositions(self,state.before,state.side,state.elements)
    local right = WithoutPositions(self,state.profile,state.side,state.elements)
    if not self.Equal(left, right) then
        error("位置以外的配置意外变化：" .. (self.DiffPath(left, right) or "?"), 0)
    end
end

function Adapter:Rollback(state)
    Require(not Combat(), "恢复待完成：退出战斗后再点撤销")
    Require(state.db.profiles[state.name] == state.profile
        and state.api.GetActiveProfileName() == state.name, "恢复失败：当前布局已变化")
    self.Restore(state.profile,state.before)
    self.Restore(state.db.unlockAnchors,state.anchors)
    for _, field in ipairs({"unlockWidthMatch","unlockHeightMatch"}) do
        local original
        if field=="unlockWidthMatch" then original=state.widthMatch else original=state.heightMatch end
        if original == nil then state.db[field]=nil
        else
            if type(state.db[field]) ~= "table" then state.db[field]={} end
            self.Restore(state.db[field],original)
        end
    end
    for _, key in ipairs(state.roots) do state.registry[key].applyPosition(key) end
    Require(state.api.ApplyCenterPosition("EBS_Minimap",state.mapCenter), "小地图恢复位置失败")
    ReapplySkippedBars(state)
    state.api.ReapplyAllUnlockAnchorsForced()
    local bags = BagsSlot(state.profile)
    ApplyBagsFrame(bags and bags.bagsPosition)
    Require(self.Equal(state.profile,state.before), "恢复回读不一致")
end

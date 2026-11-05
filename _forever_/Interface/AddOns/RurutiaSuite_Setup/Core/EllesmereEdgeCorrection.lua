local _, ns = ...

-- Explicit, in-place EUI transaction. Planning is read-only; the private plan
-- prevents callers from editing the approved targets. No background work.
local Engine = {}
ns.EllesmereEdgeCorrection = Engine
local pending, undo, busy

local function SaveUndoLinks(adapter, state)
    undo.anchors = adapter.Copy(state.db.unlockAnchors)
    undo.widthMatch = adapter.Copy(state.db.unlockWidthMatch)
    undo.heightMatch = adapter.Copy(state.db.unlockHeightMatch)
end

function Engine:Plan()
    if busy then return nil, "边缘修正正在执行" end
    if undo and undo.recovery then return nil, "请先撤销尚未恢复的边缘修正" end
    local adapter = ns.EllesmereEdgeAdapter
    local ok, state = pcall(adapter.Capture, adapter)
    if not ok then return nil, tostring(state) end
    local targets, boxes = ns.EllesmereEdgeGeometry:Plan(state.canvas,state.elements,state.side)
    if not targets then return nil, boxes end
    local fit, fitReason = pcall(adapter.EnsureFollowersFit, adapter, state, boxes)
    if not fit then return nil, tostring(fitReason) end
    local preview = { profile=state.name, side=state.side, targets=adapter.Copy(targets),
        width=state.canvas.width, height=state.canvas.height }
    pending = { token=preview, state=state, targets=targets, boxes=boxes }
    return preview
end

function Engine:Apply(preview)
    if busy then return nil, "边缘修正正在执行" end
    if not pending or pending.token ~= preview then return nil, "预览已失效，请重新计算" end
    local plan, adapter = pending, ns.EllesmereEdgeAdapter
    pending = nil
    local ok, now = pcall(adapter.Capture,adapter)
    if not ok then return nil, tostring(now) end
    if not adapter:Same(plan.state,now) then return nil, "布局或画布已变化，请重新预览" end
    -- A repeated click on an already aligned layout performs no writes and
    -- retains the previous useful undo, rather than replacing it with a no-op.
    if pcall(adapter.Verify,adapter,now,plan.boxes) then
        return {status="unchanged",changed=false,profile=now.name,reloadRequired=false}
    end
    busy = true
    -- Keep recovery even if applying or rollback fails. Never create a Profile.
    undo = { before=now, canvas=adapter.Copy(now.canvas) }
    local written, reason = pcall(function()
        adapter:Write(now,plan.targets)
        adapter:Verify(now,plan.boxes)
    end)
    if not written then
        local restored, restoreReason = pcall(adapter.Rollback,adapter,now)
        busy = false
        if restored then undo=nil; return nil, tostring(reason) .. "；已恢复原布局" end
        undo.recovery = true
        SaveUndoLinks(adapter,now)
        return nil, tostring(reason) .. "；" .. tostring(restoreReason)
    end
    local changed = not adapter.Equal(now.before,now.profile)
    undo.after = adapter.Copy(now.profile)
    SaveUndoLinks(adapter,now)
    busy = false
    return { status="applied", changed=changed, profile=now.name, reloadRequired=false }
end

function Engine:Undo()
    if busy or not undo then return nil, "没有可撤销的边缘修正" end
    local adapter, saved = ns.EllesmereEdgeAdapter, undo
    local ok, now = pcall(adapter.Capture,adapter)
    if not ok then return nil, tostring(now) end
    if now.profile ~= saved.before.profile or not adapter.Equal(now.canvas,saved.canvas)
        or not adapter.Equal(now.anchors,saved.anchors)
        or not adapter.Equal(now.widthMatch,saved.widthMatch)
        or not adapter.Equal(now.heightMatch,saved.heightMatch)
        or not saved.recovery and not adapter.Equal(now.before,saved.after) then
        return nil, "布局或画布已变化，不能撤销旧操作"
    end
    busy = true
    local restored, reason = pcall(adapter.Rollback,adapter,saved.before)
    busy = false
    if not restored then return nil, tostring(reason) end
    undo = nil
    return { changed=true, status="undone", reloadRequired=false }
end

function Engine:ClearHistory(keepUndo)
    if busy or undo and undo.recovery then return false, "请先完成上次贴边恢复" end
    pending=nil
    if not keepUndo then undo=nil end
    return true
end

function Engine:RecalculateCurrentSide()
    local plan, reason = self:Plan()
    if not plan then return nil, reason end
    return self:Apply(plan)
end

function Engine:Describe(preview)
    local rows = { "直接修正“" .. preview.profile .. "”：", "",
        "主动作条居中贴底，关联动作条跟随。",
        "左下信息条贴边，聊天框保留上方间距。",
        "战网通知对齐聊天框左边，并移到聊天框上方。",
        "小地图贴右上，增益跟随、减益重新定位。",
        "经验条贴齐小地图底边和屏幕右边，声望条与经验条重叠。",
        "背包贴齐屏幕右下角。",
        "右侧动作条贴边。",
        "右下信息条贴边，伤害统计和计时器跟随。" }
    if preview.side == "left" then rows[#rows+1] = "团队框架贴左上角。"
    elseif preview.side == "middle" then rows[#rows+1] = "中布局底部动作条和团队框架保留独立排列。" end
    rows[#rows+1] = "\n字号与尺寸保持不变；可撤销本次修改。"
    return table.concat(rows,"\n")
end

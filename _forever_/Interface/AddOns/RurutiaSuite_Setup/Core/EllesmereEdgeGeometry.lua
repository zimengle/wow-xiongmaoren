local _, ns = ...

-- Pure layout rules for Lulu's three layouts. All rectangles use UIParent units;
-- no display presets, frame operations or persistent state belong here.
local Geometry = {}
ns.EllesmereEdgeGeometry = Geometry

local function Finite(v)
    if type(_G.issecretvalue) == "function" and _G.issecretvalue(v) then return false end
    return type(v) == "number" and v == v and v > -math.huge and v < math.huge
end
Geometry.Finite = Finite

-- Design distances are EUI element units, converted by the adapter's measured
-- scale ratio. These are layout relationships, never resolution-specific XYs.
Geometry.RULES = { chatGap = 8, toastChatGap = 74, rightBarTop = 205, debuffX = -291.25, debuffY = -106,
    mapCompanions = { queueCenterRight=37, queueCenterBottom=14.75,
        xpRight=0, xpGap=0, barGap=2 },
    middle = { pairGap=5.25, pairCenter=1.125, bar3CenterX=553.125, bar3CenterY=110.25,
        bar6Left=445.5, bar6CenterY=36, stackGap=3, stanceLeft=-434.25, stanceCenterY=52.875,
        raidCenterX=10.5, raidCenterY=173.25 } }

function Geometry:Plan(canvas, elements, side)
    local w, h, scale = canvas.width, canvas.height, canvas.scale
    if not Finite(w) or not Finite(h) or not Finite(scale) or w <= 0 or h <= 0 or scale <= 0 then
        return nil, "无法读取有效画布"
    end
    local targets, boxes = {}, {}
    local function place(key, left, bottom, corner)
        local e = elements[key]
        if not e then return false, "元素未就绪：" .. key end
        -- Round outside edges once in physical pixels, then convert back.
        left = math.floor(left * scale + 0.5) / scale
        bottom = math.floor(bottom * scale + 0.5) / scale
        local tolerance = 1 / scale
        if left < -tolerance or bottom < -tolerance
            or left + e.width > w + tolerance or bottom + e.height > h + tolerance then
            return false, "画布容纳不下：" .. key
        end
        local p = { key = key, point = "CENTER", relPoint = "CENTER",
            x = (left + e.width / 2 - w / 2) / e.ratio,
            y = (bottom + e.height / 2 - h / 2) / e.ratio }
        if corner == "bottomleft" then
            -- EUI chat persists BOTTOMLEFT so scale/canvas changes keep the
            -- left edge and info-bar gap instead of a stale center offset.
            p.point, p.relPoint, p.x, p.y = "BOTTOMLEFT", "BOTTOMLEFT", left / e.ratio, bottom / e.ratio
        elseif corner == true or corner == "topleft" then
            p.point, p.relPoint, p.x, p.y = "TOPLEFT", "TOPLEFT", 0, 0
        elseif corner == "left" then
            p.point, p.relPoint, p.x = "LEFT", "LEFT", 0
        end
        targets[#targets + 1] = p
        boxes[key] = { left = left, bottom = bottom, width = e.width, height = e.height }
        return true
    end
    local function at(key, left, bottom, corner)
        local ok, reason = place(key, left, bottom, corner)
        if not ok then error(reason, 0) end
    end
    local ok, reason = pcall(function()
        local main, left, right, chat, map, bar, debuff = elements.MainBar, elements.EDB_7,
            elements.EDB_5, elements.ECHAT_MainChat, elements.EBS_Minimap, elements.Bar4, elements.PAB_Debuffs
        if not (main and left and right and chat and map and bar and debuff) then
            error("必要元素未就绪", 0)
        end
        if side=="middle" then
            local rule, second = self.RULES.middle, elements.Bar2
            local pairWidth = main.width + (second and second.width + rule.pairGap*main.ratio or 0)
            local pairLeft = w/2 + rule.pairCenter*main.ratio - pairWidth/2
            at("MainBar", pairLeft, 0)
            if second then at("Bar2", pairLeft+main.width+rule.pairGap*main.ratio,0) end
            -- Bar6 may be lifted above the data bar and can have multiple rows.
            -- Place it first; Bar3 follows its measured top instead of retaining
            -- a fixed center that could now intersect the lower bar.
            for _, key in ipairs({"Bar6","Bar3","StanceBar"}) do
                local e=elements[key]
                if e then
                    local x,y
                    if key=="Bar3" then
                        local lower = boxes.Bar6
                        if lower then
                            x=lower.left+(lower.width-e.width)/2
                            y=lower.bottom+lower.height+rule.stackGap*e.ratio
                        else
                            x=w/2+rule.bar3CenterX*e.ratio-e.width/2
                            y=rule.bar3CenterY*e.ratio-e.height/2
                        end
                    elseif key=="Bar6" then
                        x=w/2+rule.bar6Left*e.ratio
                        y=math.max(rule.bar6CenterY*e.ratio-e.height/2,right.height+2*e.ratio)
                    else x=w/2+rule.stanceLeft*e.ratio; y=rule.stanceCenterY*e.ratio-e.height/2 end
                    at(key,x,y)
                end
            end
            local raid=elements.RF_RaidFrames
            if not raid then error("团队框架未就绪",0) end
            at("RF_RaidFrames",w/2+rule.raidCenterX*raid.ratio-raid.width/2,
                rule.raidCenterY*raid.ratio-raid.height/2)
        else
            at("MainBar", (w - main.width) / 2, 0)
        end
        at("EDB_7", 0, 0)
        at("EDB_5", w - right.width, 0)
        at("ECHAT_MainChat", 0, left.height + self.RULES.chatGap * chat.ratio, "bottomleft")
        local toast = elements.ECHAT_BNToast
        if toast then
            -- Reserve the space above chat for Lulu's channel buttons/tabs.
            -- Use chat units for the gap, then persist in toast units from
            -- BOTTOMLEFT so viewport height cannot move it away from chat.
            local chatBox = boxes.ECHAT_MainChat
            at("ECHAT_BNToast", chatBox.left,
                chatBox.bottom + chatBox.height + self.RULES.toastChatGap * chat.ratio, "bottomleft")
        end
        at("EBS_Minimap", w - map.width, h - map.height)
        local companions, mapBox = self.RULES.mapCompanions, boxes.EBS_Minimap
        local queue, xp, rep = elements.QueueStatus, elements.XPBar, elements.RepBar
        if queue then
            if queue.width > map.width or queue.height > map.height then
                error("小地图容纳不下队列状态",0)
            end
            -- Center offsets come from the JL right layout. Clamp only this
            -- child inside its map when a different queue-button size is used.
            local cx = math.max(mapBox.left+queue.width/2,
                w-math.max(companions.queueCenterRight*map.ratio,queue.width/2))
            local cy = math.min(h-queue.height/2,
                mapBox.bottom+math.max(companions.queueCenterBottom*map.ratio,queue.height/2))
            at("QueueStatus",cx-queue.width/2,cy-queue.height/2)
        end
        local function placeMapBar(key, e)
            -- Right edge on the screen, top edge on the minimap bottom.
            at(key, w-companions.xpRight*e.ratio-e.width,
                mapBox.bottom-companions.xpGap*e.ratio-e.height)
        end
        if xp then placeMapBar("XPBar", xp) end
        if rep then placeMapBar("RepBar", rep) end
        local barTop = h-self.RULES.rightBarTop*bar.ratio
        local mapBar = boxes.XPBar or boxes.RepBar
        if mapBar and mapBar.left+mapBar.width > w-bar.width then
            barTop=math.min(barTop,mapBar.bottom-companions.barGap*bar.ratio)
        end
        at("Bar4", w - bar.width, barTop - bar.height)
        at("PAB_Debuffs", w - map.width / 2 + self.RULES.debuffX * map.ratio - debuff.width / 2,
            h - map.height / 2 + self.RULES.debuffY * map.ratio - debuff.height / 2)
        if side == "left" then
            local raid = elements.RF_RaidFrames
            if not raid then error("团队框架未就绪", 0) end
            at("RF_RaidFrames", 0, h - raid.height, true)
        end
        -- Independently owned roots must not overlap. Debuffs are exempt: their
        -- mover bounds may include empty icon slots intentionally near the map.
        for a, x in pairs(boxes) do
            for b, y in pairs(boxes) do
                local mapChild = (a=="EBS_Minimap" and b=="QueueStatus")
                    or (b=="EBS_Minimap" and a=="QueueStatus")
                    or (a=="XPBar" and b=="RepBar")
                    or (a=="RepBar" and b=="XPBar")
                if a < b and not mapChild and a ~= "PAB_Debuffs" and b ~= "PAB_Debuffs"
                    and a ~= "ECHAT_BNToast" and b ~= "ECHAT_BNToast"
                    and math.min(x.left+x.width,y.left+y.width)-math.max(x.left,y.left) > 1/scale
                    and math.min(x.bottom+x.height,y.bottom+y.height)-math.max(x.bottom,y.bottom) > 1/scale then
                    error("布局空间不足：" .. a .. " / " .. b, 0)
                end
            end
        end
    end)
    if not ok then return nil, tostring(reason) end
    return targets, boxes
end

-- 任务配对 · 卡片（11-23，HOLD）：邀请方卡 / 被邀请方说明卡 / 做完小卡，屏幕上方（和位面求助框同一种外观），同一时间只有 1 张
--   ⛔ 「邀请他 / 加入 / 退队」三个按钮是唯一调 QP.DoInvite / QP.DoAccept / QP.DoLeave 的地方（离线测试静态扫描）
--   卡片要讲清楚：谁 / 等级职业 / 本公会否 / 任务 / 双方进度 / 距离 / 为什么推荐 / 组了会怎样 / 怎么拒（这次不了 / 2 小时别推 / 关掉功能）
--   本文件最后置就绪标记 ns._qpReady（UI.lua 的 MODS.qp.ready 认它）
local _, ns = ...; ns = _G.GearInsightForever or ns
local QP = ns.QP
if not QP then return end
local UI = {}
ns.QPUI = UI
local L = function(cn, en) return ns.L(cn, en) end
local GOLD, DIM, R = "|cffffd100", "|cff9d9d9d", "|r"
local function now() return (GetTime and GetTime()) or 0 end

local function clsName(cl)
    local t = _G.LOCALIZED_CLASS_NAMES_MALE
    return (cl and t and t[cl]) or cl or L("职业未知", "class ?")
end
local function who(c)
    local lv = c.lv and string.format(L("%d 级", "Lv %d"), c.lv) or L("等级未知", "Lv ?")
    return string.format("%s%s%s（%s %s · %s）", GOLD, c.name or "?", R, lv, clsName(c.cl),
        c.guild and L("同公会", "same guild") or L("非本公会", "not in your guild"))
end
local function prog(v, elite)
    if not v then return "?" end
    return tostring(v[1] or "?") .. "/" .. tostring(v[2] or "?") .. (elite and L(" 目标", " objectives") or "")
end
local function dist(c)
    if not c.yd then return L("距离未知（同一张地图）", "distance unknown (same map)") end
    return string.format(L("距离约 %d 码", "about %d yd away"), c.yd)
end
local function eliteTag(c)
    if not c.elite then return "" end
    return "|cffffb000[" .. (c.elite > 1 and string.format(L("精英 · 建议 %d 人", "Elite - %d players suggested"), c.elite)
        or L("精英 · 建议组队", "Elite - group suggested")) .. "]|r "
end

-- 卡片内容 → 标题、正文行、按钮 { 文字, 宽, 回调 }
function UI.Content(c)
    local q = "【" .. tostring(c.title or "?") .. "】"
    local mob = c.mob and ("「" .. c.mob .. "」") or ""
    if c.kind == "out" then
        local lines = {
            c.elite and string.format(L("%s 也在做%s（精英任务）", "%s is also on %s (elite quest)"), who(c), q)
                or string.format(L("%s 也在杀%s的%s", "%s is also killing %s for %s"), who(c), mob, q),
            string.format(L("进度：你 %s · 他 %s · %s", "Progress: you %s - them %s - %s"), prog(c.mine, c.elite), prog(c.his, c.elite), dist(c)),
            c.elite and string.format(L("为什么推荐：这是精英任务，%s；你们都在这个任务的目标区域", "Why: elite quest, %s; you're both at the quest area"),
                (c.elite > 1) and string.format(L("建议 %d 人一起做", "%d players suggested"), c.elite) or L("建议组队", "grouping suggested"))
                or L("为什么推荐：你们都在这个任务的目标区域，组队后每只怪的击杀都算两人的", "Why: you're both at this quest's area; in a group every kill counts for both"),
            L("组了以后：你当队长；他进队后会被传到你这一层；做完会问你要不要退队，不会自动散",
                "If you group: you lead; they move to your layer when they join; you'll be asked about leaving when done - nothing auto-disbands"),
            DIM .. L("点了「邀请他」才会邀请；不点什么都不发生。同一个人 2 小时内只提示一次", "Nothing happens unless you click Invite. Each player is suggested at most once per 2 hours") .. R,
        }
        return L("任务配对 · ", "Quest pairing - ") .. eliteTag(c) .. L("同区域同任务", "same quest, same area"), lines, {
            { L("邀请他", "Invite"), 90, function() QP.DoInvite(c) end },
            { L("这次不了", "Not now"), 90, function() QP.Dismiss(c, "later") end },
            { L("这个人 2 小时别推", "Not this player (2h)"), 150, function() QP.Dismiss(c, "block") end },
            { L("关掉任务配对", "Turn off pairing"), 120, function() QP.Dismiss(c, "off") end },
        }
    elseif c.kind == "in" then
        local lines = {
            string.format(L("进度：你 %s · 他 %s · %s · %s", "Progress: you %s - them %s - %s - %s"), prog(c.mine, c.elite), prog(c.his, c.elite), dist(c), who(c)),
            L("组了以后：他当队长，你会被传到他那一层（附近的人和怪可能变）；做完会问你要不要退队，随时可以自己退（头像右键 → 离开队伍）",
                "If you join: they lead and you move to their layer (nearby players / mobs may change); you'll be asked about leaving when done, and can leave any time (right-click your portrait)"),
            L("点「加入」或暴雪邀请框的「接受」才进队；点「不加入」后，暴雪的邀请框留给你自己点「拒绝」（或等它过期）",
                "Only Join (or the game's Accept) puts you in the group; after Don't join, decline the game's invite box yourself (or let it expire)"),
        }
        if c.gone then table.insert(lines, 2, "|cffff8040" .. L("你已经离开这个任务的目标区域 / 已经做完了，可以不加入", "You've left this quest's area / finished it - feel free to say no") .. R) end
        return string.format(L("任务配对 · %s邀请你一起打%s%s", "Quest pairing - %s invites you to %s %s"), eliteTag(c) .. (c.name or "?"), q, mob), lines, {
            { L("加入", "Join"), 90, function() QP.DoAccept(c) end },
            { L("不加入", "Don't join"), 90, function() QP.Dismiss(c, "no") end },
            { L("这个人 2 小时别推", "Not this player (2h)"), 150, function() QP.Dismiss(c, "block") end },
            { L("关掉任务配对", "Turn off pairing"), 120, function() QP.Dismiss(c, "off") end },
        }
    end
    return L("任务配对 · ", "Quest pairing - ") .. q .. (c.elite and L("目标完成了", "objectives done") or L("击杀目标完成了", "kill objective done")), {
        string.format(L("这队是和 %s 配对组起来的。要退队吗？点了才退，不点就一直留在队里", "You grouped with %s via pairing. Leave the group? Only if you click"), c.name or "?"),
    }, {
        { L("退队", "Leave group"), 90, function() QP.DoLeave(c) end },
        { L("继续一起", "Stay together"), 90, function() QP.Dismiss(c, "keep") end },
        { L("以后别问", "Don't ask again"), 100, function() QP.Dismiss(c, "never") end },
    }
end

local f
local function build()
    f = CreateFrame("Frame", nil, UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
    f:SetSize(600, 150); f:SetPoint("TOP", UIParent, "TOP", 0, -120); f:SetFrameStrata("DIALOG")
    if f.SetBackdrop then
        f:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8x8", edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1 })
        f:SetBackdropColor(0.04, 0.06, 0.1, 0.95); f:SetBackdropBorderColor(1, 0.82, 0.2, 0.9)
    end
    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.title:SetPoint("TOPLEFT", 12, -10); f.title:SetWidth(540); f.title:SetJustifyH("LEFT")
    f.text = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    f.text:SetPoint("TOPLEFT", 12, -30); f.text:SetWidth(576); f.text:SetJustifyH("LEFT")
    f.close = ns.Button(f, "×", 22, 20, function() if QP.card then QP.Dismiss(QP.card, f.kind == "done" and "keep" or (f.kind == "in" and "no" or "later")) end end)
    f.close:SetPoint("TOPRIGHT", -4, -4)
    f.btns = {}
    f.left = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    f.left:SetPoint("BOTTOMRIGHT", -12, 14)
    f:SetScript("OnUpdate", function(self)
        local c = QP.card
        if not c then self:Hide(); return end
        local left = math.max(0, math.ceil((c.exp or 0) - now()))
        self.left:SetText(string.format(L("还剩 %d 秒", "%ds left"), left))
    end)
    f:Hide()
    return f
end
UI._frame = function() return f end

function UI.Show(c)
    if not f then build() end
    local title, lines, btns = UI.Content(c)
    f.kind = c.kind
    f.title:SetText(title)
    f.text:SetText(table.concat(lines, "\n"))
    for _, b in ipairs(f.btns) do b:Hide() end
    local x = 12
    for i, spec in ipairs(btns) do
        local b = f.btns[i]
        if not b then b = ns.Button(f, "", 90, 22, nil); f.btns[i] = b end
        b:SetText(spec[1]); b:SetWidth(spec[2])
        b:SetScript("OnClick", spec[3])
        b:ClearAllPoints(); b:SetPoint("BOTTOMLEFT", x, 10)
        x = x + spec[2] + 6
        b:Show()
    end
    local h = f.text.GetStringHeight and f.text:GetStringHeight()
    f:SetHeight(math.max(110, 30 + ((type(h) == "number" and h > 0) and h or (#lines * 14)) + 44))
    f.card = c
    f:Show()
end
function UI.Hide() if f then f.card = nil; f:Hide() end end

-- 窗口与提醒：能永久关（11-17「弹出的东西都要能永久关」）。关着时本子插件登录不加载，条目也就不在 → 横幅 / /gi qp on 重开
if ns.RegisterWindow then ns.RegisterWindow({ key = "questPair", order = 64, title = function() return L("任务配对弹框", "Quest pairing cards") end,
    state = function() return QP.StatusText() end,
    actions = function()
        local on = QP.On()
        return { { text = on and L("关闭", "Turn off") or L("打开", "Turn on"), fn = function() QP.SetOn(not on) end } }
    end }) end

if ns.QM and ns.QM.QPBanner then pcall(ns.QM.QPBanner) end
ns._qpReady = true

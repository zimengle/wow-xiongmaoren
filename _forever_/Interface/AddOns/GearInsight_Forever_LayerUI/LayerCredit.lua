-- 位面「互助额度」（11-21 用户「增加位面切换概率，是不是帮助别人才能获得 额度」「然后gearinsight工会的，可以不受这个限制」，HOLD）
--   规则（数值依据见下面常量注释）：
--   · 向「公会外」（同图公共频道）的人求换层要额度；本公会内互相拉不要、不扣；GearInsight 公会成员不要、不扣（LY.InGIGuild，同 1.3.0「Gearinsight 公会位面三项默认开」）
--   · 每人每天送 FREE 次（11-21 用户「不送」→ 0）；帮别人拉成一次（对方回执「到了」）+1，攒下的最多 MAX 次，IDLE（3 天）没动就清空
--   · 只在真被「公会外的人」拉过去时才扣 1（先扣当天赠送的，再扣攒下的）；没人拉 / 被公会会员拉 = 不扣
--   · 额度用完：「我想换一层」自动改成只找公会会员（不在公会 = 不发，说清楚怎么攒）；公会外玩家那块的「过去」灰掉写原因
--   · 「增加切换概率」：求助消息带上自己累计帮过几次（hn），帮手弹框写「他帮过别人 N 次」、正弹着的帮得多的不被后来的顶掉（主插件 LayerHop.lua）；
--     自己帮得多，一轮自动换人最多请的人数从 3 位加到 4 / 5 位（LH.CHAIN_MAX）
--   ⛔ 隐私：只存自己的计数（存档 layer.cr = { d 日期, u 今天用了几次赠送, b 攒下的, n 累计帮过 }），不存别人的档、不收集额外数据；hn 是客户端自报，不做反作弊
--   ⛔ 主插件只留最小钩子：LayerHop.lua 的 LH.gOnly（只发公会）、D 回执里 +1、R 里读 hn、弹框显示 / 优先；PageLayer.lua 的 okMsg / askWho 两处。
--     这个文件 HOLD 剔掉时：没人设 gOnly、R 不带 hn → 钩子全不生效，只剩存档里一个帮人计数在涨（攒着，上线这功能时直接能用）
local _, ns = ...; ns = _G.GearInsightForever or ns
local LY, LH = ns.Layer, ns.LayerHop
if not (LY and LH) then return end
local LC = {}
ns.LayerCredit = LC
local function L(cn, en) return ns.L(cn, en) end
local function now() return (GetTime and GetTime()) or 0 end

LC.FREE = 0       -- 每天送几次：11-21 用户「不送」→ 0，额度只能帮别人拉来攒（原定 3；算法照样支持 >0）
LC.MAX = 5        -- 攒下的上限：11-21 用户「最多攒5次，3天不用清空」（原定 10）
LC.IDLE = 3 * 86400   -- 攒下的额度 3 天没动（没帮人也没用掉）就清空
LC.BASE_CHAIN = 3 -- 和 LayerHop.lua LH.CHAIN_MAX 原值一样
LC.CHAIN = { { 20, 5 }, { 5, 4 } }   -- 累计帮过 ≥20 次：一轮最多请 5 位；≥5 次：4 位（每多一位最多多等 30 秒，也多打扰一个人 → 用帮人换）

local function today() return (date and date("%Y-%m-%d")) or "?" end
-- 自己的计数（跨天清零当天用掉的赠送；攒下的夹到上限）
function LC.State()
    local d = LY.DB()
    local c = type(d.cr) == "table" and d.cr or {}
    d.cr = c
    local td = today()
    if c.d ~= td then c.d, c.u = td, 0 end
    c.u = tonumber(c.u) or 0
    c.b = math.max(0, math.min(LC.MAX, tonumber(c.b) or 0))
    c.n = math.max(0, tonumber(c.n) or 0)
    -- 3 天不用清空：攒下的 / 累计帮过 有变化（帮人 +1 在主插件 LayerHop.lua 里加，这里看到变化才记时间，只会算得更宽）就重新计时
    local t = (time and time()) or 0
    if c.lb ~= c.b or c.ln ~= c.n or not c.t then c.t, c.lb, c.ln = t, c.b, c.n end
    if c.b > 0 and t - c.t >= LC.IDLE then c.b, c.lb, c.t = 0, 0, t end
    return c
end
-- 还剩几次（赠送剩余 + 攒下的）, 赠送剩余, 攒下的, 累计帮过
function LC.Left()
    local c = LC.State()
    local free = math.max(0, LC.FREE - c.u)
    return free + c.b, free, c.b, c.n
end
-- GearInsight 公会成员：不扣、不限（公会名还没读到 = 先按普通人算）
-- 11-21 用户「我想测试下别的工会的互助次数」：/run GearInsightForever.db.layer.asOther=true 假装不在 Gearinsight 公会（=nil 恢复）
function LC.Unlimited()
    if ns.db and ns.db.layer and ns.db.layer.asOther then return false end
    return LY.InGIGuild and LY.InGIGuild() == true or false
end
-- 公会外的额度用完了（GearInsight 公会成员永远 false）
function LC.Blocked() return not LC.Unlimited() and LC.Left() <= 0 end
function LC.ChainMax()
    local n = LC.State().n
    for _, r in ipairs(LC.CHAIN) do if n >= r[1] then return r[2] end end
    return LC.BASE_CHAIN
end
local function syncChain() LH.CHAIN_MAX = LC.ChainMax() end

-- 拉我的人是不是本公会的（公会名单会阶 / 公会心跳还新鲜）
function LC.IsGuildmate(who)
    if type(who) ~= "string" or (ns.Secret and ns.Secret(who)) or who == "" then return false end
    local s = LY.Short(who)
    local LG = ns.LayerGuild
    if LG and type(LG.ranks) == "table" then
        if LG.ranks[s] ~= nil then return true end
        for k in pairs(LG.ranks) do if LH.SameName(k, s) then return true end end
    end
    local pe = LH.PeerByName(s)
    local g = pe and pe.via and pe.via.guild
    return (g and now() - g <= LY.EXPIRE) and true or false
end

-- 扣 1：先扣当天赠送的，再扣攒下的
function LC.Spend()
    if LC.Unlimited() then return false end
    local c = LC.State()
    if c.u < LC.FREE then c.u = c.u + 1 elseif c.b > 0 then c.b = c.b - 1 else return false end
    return true
end

function LC.Text(kind)
    local left, free, bank = LC.Left()
    if kind == "gonly" then
        return L("没有公会外换层额度：这次只向公会会员求助（公会内互拉不扣额度）。想找公会外的人：先帮别人拉一次 +1",
            "No out-of-guild layer credits: asked guildmates only this time. Help someone move first (+1) to ask outside your guild")
    elseif kind == "none" then
        return L("没有公会外换层额度，你又没在公会里，这次没发求助。办法：① 去帮别人：位面页勾着「我愿意帮…换层」，别人求你时点「邀请」，拉成一次 +1；② 加入公会，公会内互拉不限（Gearinsight 公会成员不限）",
            "No out-of-guild layer credits and you're not in a guild - nothing sent. Help someone move (+1) or join a guild (guildmates are free)")
    elseif kind == "card" then
        return L("没有公会外换层额度：这块是公会外的玩家，要额度才能请。帮别人拉一次 +1（别人求你时点「邀请」）；上面公会会员那块不扣额度",
            "No out-of-guild credits: these players aren't in your guild. Help someone move (+1); guildmates above are free")
    elseif kind == "spent" then
        return string.format(L("用掉 1 次公会外换层额度（还剩 %d 次）", "Used 1 out-of-guild layer credit (%d left)"), left)
    end
    return ""
end

-- ---------- 包住 LayerHop 的几个入口（只包我们自己的函数表字段，不碰暴雪全局）----------
-- 「我想换一层」/「换过去」：同时发公会 + 同图公共频道。公共频道关着 = 本来就只找公会，不要额度
-- 原样返回（返回值个数不变）；成功就把这一轮记成「发过公会外」，要是被公会外的人拉过去，收尾时扣 1（LH.Finish）
local function tag(ok, ...)
    if ok and LH.round then LH.round.cr = true end
    return ok, ...
end
LH._crReq0 = LH._crReq0 or LH.Request
LH.Request = function(z)
    syncChain()
    local d = LY.DB()
    if not (d.pub and d.on) or LC.Unlimited() then return LH._crReq0(z) end
    if LC.Left() > 0 then return tag(LH._crReq0(z)) end
    if IsInGuild and IsInGuild() then
        LH.gOnly = true
        local ok, why, txt = LH._crReq0(z)
        LH.gOnly = nil
        if ok then return true, nil, LC.Text("gonly") end
        return ok, why, txt
    end
    return false, "nocredit", LC.Text("none")
end
-- 「过去」：公会外玩家那块（LayerPub.lua，名单带 byRecent 标记）要额度；公会会员那块 / 别的图的公会会员不要
LH._crAsk0 = LH._crAsk0 or LH.AskChain
LH.AskChain = function(list, far, z)
    syncChain()
    local pub = (type(list) == "table" and rawget(list, "byRecent")) or (type(far) == "table" and rawget(far, "byRecent"))
    if not pub or LC.Unlimited() then return LH._crAsk0(list, far, z) end
    if LC.Left() <= 0 then return nil, "nocredit", LC.Text("card") end
    return tag(LH._crAsk0(list, far, z))
end
-- 一轮换好了（主插件 receipt / 手动接了邀请都走这里，一轮只一次）：这轮发过公会外、拉我的人不是本公会的 → 扣 1
LH._crFin0 = LH._crFin0 or LH.Finish
LH.Finish = function(ok, who)
    local r = LH.round
    if ok and r and not r.done and r.cr and not LC.IsGuildmate(who) and LC.Spend() then
        local text = LC.Text("spent")
        ns.Print(text)
        LC.last = { t = now(), who = who }
    end
    return LH._crFin0(ok, who)
end
-- 求助消息 R 带上自己累计帮过几次（hn，帮手弹框显示 / 优先；老版本帮手不认这个字段，忽略）
LY._crEnc0 = LY._crEnc0 or LY.Encode
LY.Encode = function(kind, t)
    if kind == "R" and type(t) == "table" and t.hn == nil then t.hn = math.min(999, LC.State().n) end
    return LY._crEnc0(kind, t)
end

-- ---------- 位面页：「我想换一层」下面一行额度说明（鼠标悬停看完整规则）----------
-- 11-21 用户「UI，更明显点」：原来两行小字没底色、第二行折行压到下面标题 → 改成带边框的卡片 + 右侧大号剩余次数，块高按三行留足
local CARD_W, BOX_H, BOX_IN = 596, 66, 58
local BD = { bgFile = "Interface\\Buttons\\WHITE8x8", edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1 }
function LC.Tip()
    local _, free, bank, n = LC.Left()
    return table.concat({
        L("互助额度：帮别人换层攒，向公会外的人求换层用", "Help credits: earn by helping, spend when asking outside your guild"),
        string.format(L("· 帮别人拉成一次 +1（别人求你时点「邀请」，或公会会员求助自动拉），最多攒 %d 次，现在 %d；3 天没帮人也没用就清空", "- +1 each time you pull someone over (max %d saved, now %d); cleared after 3 idle days"), LC.MAX, bank),
        L("· 只在真被公会外的人拉过去时扣 1；没人拉、被公会会员拉都不扣", "- Only charged when someone outside your guild actually moves you"),
        L("· 本公会内互相拉：不限、不扣", "- Guildmates: unlimited, free"),
        L("· Gearinsight 公会成员：不限、不扣", "- Gearinsight guild members: unlimited"),
        string.format(L("· 你累计帮过别人 %d 次：求助时对方会看到；帮过 5 次一轮自动换人最多请 4 位，20 次 5 位（现在 %d 位）", "- You've helped %d times (shown to helpers); 5+ = up to 4 asks per round, 20+ = 5 (now %d)"), n, LC.ChainMax()),
        L("· 没有额度时：「我想换一层」只找公会会员", "- Out of credits: \"Switch layer\" asks guildmates only"),
    }, "\n")
end
-- 插一行到「我想换一层」和「XX 的位面」标题之间：标题和公会卡片整体下移 BOX_H（PageLayer.lua 每次刷新从 p.cardsY 往下排）
function LC.Mount(p)
    if not p or rawget(p, "crBox") or not (p.body and p.gHd and p.cardsY) then return end
    local y = p.cardsY + 20   -- PageLayer.lua：gHd 在 y，cardsY = y - 20
    local f = CreateFrame("Frame", nil, p.body, BackdropTemplateMixin and "BackdropTemplate" or nil)
    f:SetSize(CARD_W, BOX_IN)
    f:SetPoint("TOPLEFT", p.body, "TOPLEFT", 12, y + 2)
    if f.SetBackdrop then pcall(f.SetBackdrop, f, BD) end
    f.bar = f:CreateTexture(nil, "ARTWORK"); f.bar:SetPoint("TOPLEFT", 1, -1); f.bar:SetPoint("BOTTOMLEFT", 1, 1); f.bar:SetWidth(4)
    local tw = CARD_W - 120
    f.a = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight"); f.a:SetPoint("TOPLEFT", 14, -8); f.a:SetWidth(tw); f.a:SetJustifyH("LEFT")
    f.b = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall"); f.b:SetPoint("TOPLEFT", 14, -28); f.b:SetWidth(tw); f.b:SetJustifyH("LEFT")
    f.n = f:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge"); f.n:SetPoint("RIGHT", f, "RIGHT", -44, 4); f.n:SetJustifyH("RIGHT")
    f.u = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall"); f.u:SetPoint("LEFT", f.n, "RIGHT", 4, -2)
    f.h = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall"); f.h:SetPoint("TOPRIGHT", f, "BOTTOMRIGHT", -12, 16)
    if f.EnableMouse then f:EnableMouse(true) end
    f:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(LC.Tip(), 1, 1, 1, 1, true)
        GameTooltip:Show()
    end)
    f:SetScript("OnLeave", function() GameTooltip:Hide() end)
    p.crBox = f
    p.gHd:ClearAllPoints(); p.gHd:SetPoint("TOPLEFT", p.body, "TOPLEFT", 12, y - BOX_H)
    p.cardsY = p.cardsY - BOX_H
end
-- 两行字：今天还剩几次 / 怎么攒（LayerPub.lua 的 LP.Refresh 每次刷新调）
function LC.Lines()
    if LC.Unlimited() then
        return "|cff33ff66" .. L("互助额度：你在 Gearinsight 公会，换层不限次数、不扣额度", "Help credits: Gearinsight guild member - unlimited") .. "|r",
            string.format(L("你累计帮过别人 %d 次（求助时对方会看到）· 帮别人拉一次照样记一笔", "You've helped others %d times (shown when you ask)"), LC.State().n)
    end
    local left, free, bank, n = LC.Left()
    local a
    if left > 0 then
        a = string.format(L("公会外换层额度：还剩 |cffffd100%d|r 次（最多攒 %d 次，3 天不用清空）", "Out-of-guild layer credits: |cffffd100%d|r left (max %d, cleared after 3 idle days)"), left, LC.MAX)
    else
        a = "|cffff7766" .. L("没有公会外换层额度：「我想换一层」只找公会会员；帮别人拉一次 +1", "No out-of-guild credits: \"Switch layer\" asks guildmates only; help someone move (+1)") .. "|r"
    end
    local b = string.format(L("怎么攒：帮别人拉一次 +1 · 本公会内互拉不扣 · Gearinsight 公会不限\n你帮过别人 %d 次，一轮最多请 %d 位 · 鼠标指这里看完整规则",
        "Earn: +1 per pull - guildmates free - Gearinsight guild unlimited\nYou've helped %d, up to %d asks per round - hover for rules"), n, LC.ChainMax())
    return a, b
end
function LC.Paint(p)
    if not p then return end
    LC.Mount(p)
    local f = rawget(p, "crBox")
    if not f then return end
    syncChain()
    local d = LY.DB()
    if not d.on then f:Hide(); return end
    local a, b = LC.Lines()
    f.a:SetText(ns.EnSafe and ns.EnSafe(a) or a)
    f.b:SetText(ns.EnSafe and ns.EnSafe(b) or b)
    -- 右侧大号：剩几次（不限 = 绿，用完 = 红，其余金色）；左边竖条 / 边框同色
    local col, num, unit
    if LC.Unlimited() then col, num, unit = { 0.2, 1, 0.4 }, L("不限", "∞"), ""
    else
        local left = LC.Left()
        col = left > 0 and { 1, 0.82, 0 } or { 1, 0.4, 0.35 }
        num, unit = tostring(left), L("次", "left")
    end
    f.n:SetText(num); f.n:SetTextColor(col[1], col[2], col[3]); f.u:SetText(unit)
    f.h:SetText(L("公会外还能换", "outside guild"))
    f.bar:SetColorTexture(col[1], col[2], col[3], 1)
    if f.SetBackdropColor then
        f:SetBackdropColor(col[1] * 0.14, col[2] * 0.14, col[3] * 0.14, 0.92); f:SetBackdropBorderColor(col[1], col[2], col[3], 0.75)
    end
    f:Show()
end

-- 子插件是位面页第一次刷新时才加载的（PageLayer.lua refreshView 开头）：这时页面已建好、公会卡片还没排 → 现在就插行，这一次刷新就排对
do
    local LG = ns.LayerGuild
    if LG and LG.page then pcall(LC.Mount, LG.page) end
end

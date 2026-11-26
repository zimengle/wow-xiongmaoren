-- HOLD：队长视图「全队灵魂石」（11-25 用户「我作为队长也要能看啊」）
--   谁能看：我是队长 / 团长 / 团队助理（UnitIsGroupLeader / UnitIsGroupAssistant），不论职业；设置「不是队长也显示」（ssParty.mode = "all"）打开后谁都能看；
--     ssParty.mode = "off" = 关。触发在组队信标 _Group 的 BuffAsk.lua（文件在包里才挂：ns.ModHas("mage", "SoulstoneParty.lua")）：
--     进队 / 换队长 / 进世界 / 脱战时，条件满足就 ns.LoadModule("mage") 静默加载本子插件（法师吃喝 _GroupMage，非法师本来多半也登录加载）
--   内容：扫队伍 / 团队全部成员身上的「灵魂石复活」光环（任何术士上的，20707 / 20762 / 20763 / 20764 / 20765 + 名字兜底），每人一行：
--     名字（职业色）+ 剩余 mm:ss + 谁上的（光环来源读得到就写术士名）+ 状态（有效 / 已使用：死过 / 已失效 / 读不到：太远）；
--     读得到光环但读不到剩余（12.0 保密值 / 返回 0）→ 写「有石头」不写时间；没人有 →「全队没有灵魂石」+ 队里几个术士（找谁要）
--   快到期：< 提醒线（和术士灵魂石追踪同一个设置 ssTrack.warn，默认 5 分钟）黄 + 呼吸（AnimationGroup），< 1 分钟红；
--     到期 / 用掉：屏幕上方一行 + 聊天框本地一句（⛔ 不发言）；战斗中只变色，脱战补说；我自己上的石头且术士追踪记着（ns.SoulstoneTrack.Owns）→ 归它喊，这里不重复
--   点某一行 = 安全按钮 /target 这个人（⛔ 属性只在脱战时改；不施法）
--   术士且是队长：术士浮标（_ClassWarlock）显示着 → 全队列表贴在浮标下面当一个框（不另起 GI 标题、不单独拖）；浮标没显示 → 自己一个小框
--   刷新：UNIT_AURA（队伍 / 团队单位）+ GROUP_ROSTER_UPDATE 等 → 合并成 ≥ 0.5 秒一次（C_Timer）；倒计时 C_Timer 每秒、没东西走字就停
-- ⛔ 不建 OnUpdate；不注册 COMBAT_LOG_EVENT_UNFILTERED；每个接口 pcall、保密值不碰；战斗中不显示 / 隐藏 / 挪框、不改安全属性
local _, ns = ...; ns = _G.GearInsightForever or ns
if not ns then return end

local P = { st = {} }
ns.SoulstoneParty = P
local function L(zh, en) return ns.L and ns.L(zh, en) or zh end
local function none() end
local function secret(v) return v ~= nil and ns.Secret ~= nil and ns.Secret(v) end
local function clean(v) if v == nil or secret(v) then return nil end return v end
local function num(v) v = clean(v); return v ~= nil and tonumber(v) or nil end
local function gt() return (GetTime and GetTime()) or 0 end
local function inCombat() local ok, v = pcall(InCombatLockdown or none); return ok and clean(v) and true or false end
local function ask(f, ...)
    if type(f) ~= "function" then return nil end
    local ok, v = pcall(f, ...)
    if not ok then return nil end
    return clean(v)
end
local function mmss(s)
    s = math.max(0, math.floor((tonumber(s) or 0) + 0.5))
    return string.format("%d:%02d", math.floor(s / 60), s % 60)
end

P.SPELL = { [20707] = true, [20762] = true, [20763] = true, [20764] = true, [20765] = true }   -- DB2 1.60.1.70790 核对（同 SoulstoneTrack.lua）
P.NAMES = { ["灵魂石复活"] = true, ["Soulstone Resurrection"] = true }
P.CRIT, P.FINAL_SHOW, P.THROTTLE, P.ROWS = 60, 300, 0.5, 8
P.ICON = "Interface\\Icons\\INV_Misc_Orb_04"

-- ---------- 设置（ns.db.ssParty：mode nil = 队长 / 助理才显示（默认）、"all" = 不是队长也显示、"off" = 关；pos；阈值和术士追踪共用 ssTrack.warn）----------
function P.DB()
    if type(ns.db) ~= "table" then return {} end
    if type(ns.db.ssParty) ~= "table" then ns.db.ssParty = {} end
    return ns.db.ssParty
end
function P.Mode() return P.DB().mode end
function P.Warn()
    local t = type(ns.db) == "table" and ns.db.ssTrack
    local v = type(t) == "table" and tonumber(t.warn) or nil
    if v and v >= 0 then return v end
    return 5
end
function P.Leader() return (ask(UnitIsGroupLeader, "player") or ask(UnitIsGroupAssistant, "player")) and true or false end
function P.Want()
    if not ns.db or not ask(IsInGroup) then return false end
    local m = P.Mode()
    if m == "off" then return false end
    return m == "all" or P.Leader()
end

-- ---------- 扫队伍 ----------
function P.Units()
    local out, n = {}, num(ask(GetNumGroupMembers)) or 0
    if ask(IsInRaid) then
        for i = 1, math.min(n, 40) do out[#out + 1] = "raid" .. i end
    else
        out[1] = "player"
        for i = 1, 4 do out[#out + 1] = "party" .. i end
    end
    local list = {}
    for _, u in ipairs(out) do if u == "player" or ask(UnitExists, u) then list[#list + 1] = u end end
    return list
end
local function nameOf(u) local n = ask(UnitName, u); return type(n) == "string" and n ~= "" and n or nil end
local function classOf(u) local ok, _, c = pcall(UnitClass or none, u); c = ok and clean(c); return type(c) == "string" and c or nil end
local function readable(u)
    if u == "player" then return true end
    for _, f in ipairs({ UnitIsConnected or false, UnitIsVisible or false }) do
        if f then
            local ok, v = pcall(f, u)
            if ok and not secret(v) and not v then return false end
        end
    end
    return true
end
-- 第 i 个增益 → { name, sid, src, exp } | "secret" | nil（到头）
local function auraAt(u, i)
    if C_UnitAuras and C_UnitAuras.GetAuraDataByIndex then
        local ok, a = pcall(C_UnitAuras.GetAuraDataByIndex, u, i, "HELPFUL")
        if not ok or a == nil then return nil end
        if secret(a) or type(a) ~= "table" then return "secret" end
        local name, sid = clean(a.name), num(a.spellId)
        if name == nil and sid == nil then return "secret" end
        return { name = name, sid = sid, src = clean(a.sourceUnit), exp = num(a.expirationTime) }
    end
    local f = UnitAura or UnitBuff
    if not f then return nil end
    local ok, name, _, _, _, _, exp, src, _, _, sid = pcall(f, u, i, UnitAura and "HELPFUL" or nil)
    if not ok then return nil end
    if secret(name) then return "secret" end
    if name == nil then return nil end
    return { name = name, sid = num(sid), src = clean(src), exp = num(exp) }
end
-- 这个人身上的灵魂石 → 光环表 | nil | "secret"（读不全）
function P.StoneOn(u)
    local sawSecret, got = false, 0
    for i = 1, 40 do
        local a = auraAt(u, i)
        if a == nil then break end
        if a == "secret" then sawSecret = true
        elseif (a.sid and P.SPELL[a.sid]) or (a.name and P.NAMES[a.name]) then return a
        else got = got + 1 end
    end
    -- 一个增益都没读到 = 当读不到（战斗中 / 刚进视野时别人的增益表会整张空着），不算「没了」
    if sawSecret then return "secret" end
    return got == 0 and "secret" or nil, got == 0
end
local function isMe(u)
    if u == nil then return false end
    if u == "player" then return true end
    return ask(UnitIsUnit, u, "player") and true or false
end
local function tell(msg)
    if inCombat() then P.pend[#P.pend + 1] = msg; return end
    if UIErrorsFrame and UIErrorsFrame.AddMessage then pcall(UIErrorsFrame.AddMessage, UIErrorsFrame, msg, 1, 0.82, 0.1) end
    if ns.Print then ns.Print(msg) end
end
P.pend = {}
P.Tell = tell
-- 我自己上的石头、术士追踪记着 → 它喊
local function trackOwns(rec)
    local TR = ns.SoulstoneTrack
    return rec.mine and TR and TR.Owns and TR.Owns() and true or false
end
-- 扫一遍 → rows（有石头 / 刚结束的人）, warlocks（队里术士名单）
--   P.st[名字] = { seen, sawDead, mine, src, cls, exp(GetTime), endKind, endAt }
function P.Scan()
    local rows, locks, live, t, gone = {}, {}, {}, gt(), {}
    for _, u in ipairs(P.Units()) do
        local n = nameOf(u)
        if n then
            live[n] = true
            local cls = classOf(u)
            if cls == "WARLOCK" then locks[#locks + 1] = n end
            local s = P.st[n]
            local dead = ask(UnitIsDeadOrGhost, u) and true or false
            if not readable(u) then
                if s and s.seen and not s.endKind then rows[#rows + 1] = { unit = u, name = n, cls = cls, kind = "far", src = s.src, left = s.exp and (s.exp - t) or nil } end
            else
                local a, empty = P.StoneOn(u)
                if empty and (dead or (s and s.sawDead)) then a = nil end   -- 死了增益本来就清空：照常判「用掉了」
                if type(a) == "table" then
                    s = s or {}
                    P.st[n] = s
                    if s.endKind then s.endKind, s.sawDead, s.endAt = nil, nil, nil end   -- 又上了一块（「没了」弹框的 still 跟着失效）
                    s.seen, s.cls, s.miss = true, cls, 0
                    s.mine = isMe(a.src)
                    if s.mine then s.src = nameOf("player") elseif a.src then s.src = nameOf(a.src) else s.src = nil end   -- 来源读不到（保密值）= 不写
                    s.exp = (a.exp and a.exp > 0) and a.exp or nil
                    if dead then s.sawDead = true end
                    rows[#rows + 1] = { unit = u, name = n, cls = cls, kind = "on", src = s.src, left = s.exp and (s.exp - t) or nil, mine = s.mine }
                elseif a == "secret" then   -- 人在跟前、增益读不出来（战斗中常见）：倒计时照走，不说「太远」
                    if s and s.seen and not s.endKind then rows[#rows + 1] = { unit = u, name = n, cls = cls, kind = "far", near = true, src = s.src, left = s.exp and (s.exp - t) or nil } end
                elseif s and s.seen and not s.endKind then
                    -- 读得到、没了：隔 ≥ 1 秒连续两次才算（防一瞬间空数据）
                    local left0 = s.exp and (s.exp - t) or nil
                    -- 战斗中石头只会因为死了用掉、或到期才没；别的「没了」一律当读数不可靠，等脱战再判
                    if inCombat() and not dead and not s.sawDead and not (left0 and left0 <= 5) then s.miss = -1 end
                    if (s.miss or 0) == 0 then s.missAt = t end
                    s.miss = (s.miss or 0) + 1
                    if s.miss >= 2 and t - (s.missAt or t) >= 1 then
                        local left = s.exp and (s.exp - t) or nil
                        local k = (s.sawDead or dead) and "used" or ((left and left <= 5) and "expired") or "gone"
                        s.endKind, s.endAt = k, t
                        if not trackOwns(s) then
                            local w = k == "used" and L("%s 用掉了灵魂石（已使用：死过）", "%s used their soulstone")
                                or k == "expired" and L("%s 身上的灵魂石到期了（已失效）", "Soulstone on %s expired")
                                or L("%s 身上的灵魂石没了（已失效）", "Soulstone on %s is gone")
                            tell(string.format(w, n))
                            gone[#gone + 1] = n
                        end
                    else
                        rows[#rows + 1] = { unit = u, name = n, cls = cls, kind = "on", src = s.src, left = s.exp and (s.exp - t) or nil }
                    end
                end
                if s and s.endKind and t - (s.endAt or t) < P.FINAL_SHOW then rows[#rows + 1] = { unit = u, name = n, cls = cls, kind = s.endKind, src = s.src } end
            end
        end
    end
    for n in pairs(P.st) do if not live[n] then P.st[n] = nil end end   -- 出队的人不再管
    for _, n in ipairs(gone) do pcall(P.PopGone, n, locks) end   -- 术士名单扫全了再弹
    table.sort(rows, function(a, b)
        local x, y = (a.kind == "on" or a.kind == "far") and 0 or 1, (b.kind == "on" or b.kind == "far") and 0 or 1
        if x ~= y then return x < y end
        return (a.left or 1e9) < (b.left or 1e9)
    end)
    return rows, locks
end
function P.Look(r)
    if r.kind ~= "on" and r.kind ~= "far" then return "done" end
    if not r.left then return "ok" end
    if r.left <= P.CRIT then return "crit" end
    if r.left <= P.Warn() * 60 then return "warn" end
    return "ok"
end
P.COLOR = { ok = { 0.45, 1, 0.45 }, warn = { 1, 0.85, 0.1 }, crit = { 1, 0.2, 0.15 }, done = { 0.6, 0.6, 0.6 } }
local function hex(c) return string.format("ff%02x%02x%02x", math.floor(c[1] * 255 + 0.5), math.floor(c[2] * 255 + 0.5), math.floor(c[3] * 255 + 0.5)) end
local function cname(n, cls)
    local t = cls and RAID_CLASS_COLORS and RAID_CLASS_COLORS[cls]
    if type(t) == "table" and tonumber(t.r) then return "|c" .. hex({ t.r, t.g, t.b }) .. n .. "|r" end
    return n
end
-- 11-26 用户截图「加上图标」：每行前面带技能图标（内嵌贴图，不多建控件；拿不到图标就不带）
local ICONS = {}
function P.Icon(id)
    local v = ICONS[id]
    if v == nil then
        local f = (C_Spell and C_Spell.GetSpellTexture) or GetSpellTexture
        local ok, tex = pcall(f, id)
        v = ok and tex and ("|T" .. tostring(tex) .. ":13:13:0:0:64:64:5:59:5:59|t ") or ""
        ICONS[id] = v
    end
    return v
end
function P.RowText(r)
    local c = P.COLOR[P.Look(r)]
    local t
    -- 11-25 用户截图「UI」：没有剩余时间的行不再占一段「--:--」（一行放不下折成两行，压到标题和下一行）
    if r.kind == "on" or r.kind == "far" then t = (r.left and r.left > 0 and mmss(r.left) or L("有石头", "has one")) .. "  " else t = "" end
    local st = ({ on = L("有效", "Active"), far = r.near and (inCombat() and L("战斗中读不到，按上次的算", "Unreadable in combat") or L("暂时读不到，按上次的算", "Unreadable for now")) or L("读不到：太远", "Out of range"), used = L("已使用：死过", "Used (died)"),
        expired = L("已失效（到期）", "Expired"), gone = L("已失效", "Gone") })[r.kind] or ""
    local src = r.src and ("  · " .. r.src) or ""
    if not r.mine and P.Look(r) ~= "ok" then src = src .. " |cff66ccff" .. L("[提醒]", "[remind]") .. "|r|cff9a9a9a" end
    return P.Icon(20707) .. cname(r.name, r.cls) .. "  |c" .. hex(c) .. t .. st .. "|r|cff9a9a9a" .. src .. "|r"
end
function P.EmptyText(locks)
    if #locks == 0 then return L("全队没有灵魂石 · 队里没有术士", "Nobody has a soulstone - no warlock in the group") end
    -- 11-25 用户截图「队里有 1 个术士：XX（找他们要）」：只有 1 个术士时单数说法（不用带性别的「他 / 她」）
    if #locks == 1 then return string.format(L("全队没有灵魂石 · 队里有 1 个术士：%s（可以找这位术士要）", "Nobody has a soulstone - 1 warlock: %s (ask this warlock)"), locks[1]) end
    return string.format(L("全队没有灵魂石 · 队里有 %d 个术士：%s（可以找他们要）", "Nobody has a soulstone - %d warlocks: %s (ask one of them)"), #locks, table.concat(locks, L("、", ", ")))
end

-- 灵魂石没了弹框（11-25 用户「灵魂石没了弹窗问是否提醒」）：代码在按需加载的 GearInsight_Forever_SSPop（第一次要弹时才 LoadAddOn；_GroupMage 内存没余量）
ns.SSPopLoad = ns.SSPopLoad or function()
    if ns.SSGone then return true end
    if not (ns.db and ns.db.ssGonePop ~= false) then return false end
    pcall((C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn, "GearInsight_Forever_SSPop")
    return ns.SSGone ~= nil
end
function P.PopGone(n, locks)
    local s = P.st[n]
    if not (s and ns.SSPopLoad()) then return end
    local at = s.endAt
    ns.SSGone("party", { who = n, kind = s.endKind, src = s.src, locks = locks, key = n .. "@" .. tostring(at),
        still = function() local x = P.st[n]; return x ~= nil and x.endAt == at end })
end

-- ---------- 框 ----------
local win
local ui = { rows = {} }
P.ui = ui
local function savePos()
    if not win or P.attached then return end
    local p, _, _, x, y = win:GetPoint()
    P.DB().pos = { p or "CENTER", x or 0, y or 0 }
end
local function newPulse(tex)
    if not (tex and tex.CreateAnimationGroup) then return nil end
    local ok, g = pcall(tex.CreateAnimationGroup, tex)
    if not ok or not g then return nil end
    pcall(function()
        local a = g:CreateAnimation("Alpha")
        if a.SetFromAlpha then a:SetFromAlpha(0.1); a:SetToAlpha(0.6) end
        a:SetDuration(0.7)
        g:SetLooping("BOUNCE")
    end)
    return g
end
function P.MenuItems()
    return {
        { text = (P.Mode() == "all" and "|cff33ff66√|r " or "    ") .. L("不是队长也显示", "Show even when not leader"), fn = function()
            P.DB().mode = (P.Mode() ~= "all") and "all" or nil; P.Update("set") end },
        { text = L("复位位置", "Reset position"), fn = function() P.DB().pos = nil; if win and not inCombat() and not P.attached then win:ClearAllPoints(); win:SetPoint("CENTER", UIParent, "CENTER", 200, -60) end end },
        { text = L("关闭全队灵魂石（设置里搜「灵魂石」打开）", "Turn off (search \"soulstone\" in Settings to re-enable)"), fn = function() P.DB().mode = "off"; P.Update("set") end },
    }, "|cff33ff99GI|r · " .. L("全队灵魂石", "Party soulstones")
end
local lastLocks
-- 左键点快到期 / 已失效的那一行：私聊上石头的术士「给谁补灵魂石」（话在按需加载的 _SSPop：G.Soon；点了才发）
local function remind(b, say)
    local r = rawget(b, "row")
    if not r or (r.mine and not say) or P.Look(r) == "ok" then return end
    if not ns.SSGone then pcall((C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn, "GearInsight_Forever_SSPop") end
    if ns.SSGone then pcall(ns.SSGone, "soon", { who = r.name, src = r.src, say = say, left = (r.kind == "on" or r.kind == "far") and r.left or nil, locks = lastLocks or {} }) end
end
local function menu(self, mb)
    if mb == "RightButton" and ns.PopMenu then local items, title = P.MenuItems(); ns.PopMenu(self, title, items)
    elseif mb == "LeftButton" then remind(self, IsShiftKeyDown()) end   -- 11-26 Shift + 左键 = 队伍里通报（_GroupMage 内存贴线，菜单项放不下）
end
local function rowButton(i)
    local b = CreateFrame("Button", "GearInsightForeverSSPartyRow" .. i, win, "SecureActionButtonTemplate")
    b:SetHeight(16)
    if b.RegisterForClicks then b:RegisterForClicks("AnyDown") end
    b.glow = b:CreateTexture(nil, "BACKGROUND")
    b.glow:SetAllPoints(b); b.glow:SetColorTexture(1, 1, 1, 1); b.glow:SetAlpha(0)
    b.pulse = newPulse(b.glow)
    b.fs = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    b.fs:SetPoint("LEFT", 4, 0); b.fs:SetPoint("RIGHT", -4, 0); b.fs:SetJustifyH("LEFT")
    if b.fs.SetWordWrap then b.fs:SetWordWrap(false) end   -- 一行一个人：放不下就截掉，绝不折行
    b:SetScript("PostClick", menu)
    ui.rows[i] = b
    return b
end
local function build()
    win = CreateFrame("Frame", "GearInsightForeverSSParty", UIParent)
    win:SetSize(230, 40); win:SetFrameStrata("MEDIUM"); win:SetClampedToScreen(true); win:SetMovable(true); win:EnableMouse(true)
    if win.RegisterForDrag then win:RegisterForDrag("LeftButton") end
    win:SetScript("OnDragStart", function(self) if not inCombat() and not P.attached then self:StartMoving() end end)
    win:SetScript("OnDragStop", function(self) self:StopMovingOrSizing(); savePos() end)
    win:SetScript("OnMouseUp", menu)
    ui.bg = win:CreateTexture(nil, "BACKGROUND", nil, -2)
    ui.bg:SetAllPoints(win); ui.bg:SetColorTexture(0.04, 0.02, 0.06, 0.72)
    ui.tag = win:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ui.tag:SetPoint("TOPLEFT", 4, -3); ui.tag:SetText("|cff33ff99GI|r " .. L("全队灵魂石", "Party soulstones"))
    ui.empty = win:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    ui.empty:SetPoint("TOPLEFT", 4, -18); ui.empty:SetPoint("RIGHT", -4, 0); ui.empty:SetJustifyH("LEFT")
    ui.more = win:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    for i = 1, P.ROWS do rowButton(i) end
    win:Hide()
    P.win = win
end
-- 贴在术士浮标下面（术士且浮标显示着）还是自己一个框
local function anchor()
    local TR = ns.SoulstoneTrack
    local host = TR and TR.win
    local att = host ~= nil and host:IsShown() and true or false
    if att == P.attached and rawget(win, "_placed") then return end
    win:ClearAllPoints()
    if att then win:SetPoint("TOPLEFT", host, "BOTTOMLEFT", 0, -2)
    else
        local pos = P.DB().pos
        if type(pos) == "table" and pos[1] then win:SetPoint(pos[1], UIParent, pos[1], tonumber(pos[2]) or 0, tonumber(pos[3]) or 0)
        else win:SetPoint("CENTER", UIParent, "CENTER", 200, -60) end
    end
    rawset(win, "_placed", true)
    P.attached = att
end
function P.Draw(rows, locks)
    lastLocks = locks
    local want = P.Want()
    local fight = inCombat()
    if not want then
        if win and win:IsShown() and not fight then win:Hide() end
        return false
    end
    if not win then
        if fight then P.pendDraw = true; return false end
        build()
    end
    if not fight then anchor() end
    if P.attached then ui.tag:SetText("") else ui.tag:SetText("|cff33ff99GI|r " .. L("全队灵魂石", "Party soulstones")) end
    local top = P.attached and -2 or -16
    local n = math.min(#rows, P.ROWS)
    for i = 1, P.ROWS do
        local b, r = ui.rows[i], rows[i]
        if r and i <= n then
            b.fs:SetText(P.RowText(r))
            local look = P.Look(r)
            local c = P.COLOR[look]
            b.glow:SetVertexColor(c[1], c[2], c[3])
            local pulse = look == "warn" or look == "crit"
            if pulse ~= (rawget(b, "pulsing") or false) then
                b.pulsing = pulse or nil
                if pulse then b.glow:SetAlpha(0.35); if b.pulse then pcall(b.pulse.Play, b.pulse) end
                else if b.pulse then pcall(b.pulse.Stop, b.pulse) end; b.glow:SetAlpha(0) end
            end
            b.look, b.name = look, r.name
            rawset(b, "row", r)
            if not fight then
                b:ClearAllPoints(); b:SetPoint("TOPLEFT", win, "TOPLEFT", 0, top - (i - 1) * 16); b:SetPoint("RIGHT", win, "RIGHT", 0, 0)
                local m = "/target " .. (r.name:match("^([^%-]+)") or r.name)
                if rawget(b, "_macro") ~= m then b:SetAttribute("type1", "macro"); b:SetAttribute("macrotext1", m); rawset(b, "_macro", m) end
                b:Show()
            end
        elseif not fight then
            b:Hide(); b.name, b.look = nil, nil
            if rawget(b, "pulsing") and b.pulse then pcall(b.pulse.Stop, b.pulse) end
            b.pulsing = nil
        end
    end
    if n == 0 then ui.empty:SetText(P.EmptyText(locks)); ui.empty:Show() else ui.empty:SetText(""); ui.empty:Hide() end
    if #rows > P.ROWS then ui.more:SetText(string.format(L("还有 %d 人", "+%d more"), #rows - P.ROWS)) else ui.more:SetText("") end
    -- 11-25 用户截图：「全队没有灵魂石 · 队里有 1 个术士：XX（…）」折成两行，第二行压在下面贴着的 BUFF 检查标题上 → 框高按文字实际高度算；
    --   战斗中改不了框高（挂着安全按钮）→ 这时不折行（一行放不下的截掉），脱战再按实际高度重排
    if ui.empty.SetWordWrap then ui.empty:SetWordWrap(not fight) end
    if not fight then
        local body = math.max(n, 1) * 16
        if n == 0 and ui.empty.GetStringHeight then body = math.max(body, math.ceil(tonumber(ui.empty:GetStringHeight()) or 0) + 2) end
        local h = body + (P.attached and 4 or 20) + (#rows > P.ROWS and 12 or 0)
        win:SetHeight(h)
        ui.more:ClearAllPoints(); ui.more:SetPoint("BOTTOMLEFT", 4, 2)
        win:Show()
        P.pendDraw = nil
    else
        P.pendDraw = true
    end
    return true
end

-- ---------- 刷新：事件合并 ≥ 0.5 秒一次；倒计时每秒（只在有人有剩余时间时）----------
local queued, ticking = false, false
P.scans = 0
function P.Update(why)
    if not P.Want() then
        P.rows, P.locks = {}, {}
        P.Draw(P.rows, P.locks)
        return nil
    end
    P.scans = P.scans + 1
    local rows, locks = P.Scan()
    P.rows, P.locks = rows, locks
    P.Draw(rows, locks)
    P.Kick()
    return rows, locks
end
function P.NeedTick()
    if not (win and win:IsShown()) then return false end
    for _, r in ipairs(P.rows or {}) do
        if r.left or r.kind == "used" or r.kind == "expired" or r.kind == "gone" then return true end
    end
    return false
end
local function loop()
    if not P.NeedTick() then ticking = false; return end
    pcall(P.Update, "tick")
    if C_Timer and C_Timer.After then C_Timer.After(1, loop) else ticking = false end
end
function P.Kick()
    if ticking or not (C_Timer and C_Timer.After) or not P.NeedTick() then return false end
    ticking = true
    C_Timer.After(1, loop)
    return true
end
function P.Ticking() return ticking end
-- 事件进来先排队，0.5 秒后合并跑一次
function P.Queue()
    if queued then return false end
    if not (C_Timer and C_Timer.After) then pcall(P.Update, "now"); return true end
    queued = true
    C_Timer.After(P.THROTTLE, function() queued = false; pcall(P.Update, "queue") end)
    return true
end
function P.Queued() return queued end
local function groupUnit(u) return type(u) == "string" and (u == "player" or u:find("^party%d") ~= nil or u:find("^raid%d") ~= nil) end
function P.OnEvent(e, a1)
    if secret(a1) then return end
    if e == "UNIT_AURA" then
        if not groupUnit(a1) or not P.Want() then return end
    elseif e == "PLAYER_REGEN_ENABLED" then
        pcall(P.Update, "regen")
        if ns.SSGonePop then pcall(ns.SSGonePop.Flush) end
        if #P.pend > 0 then
            local msg = table.concat(P.pend, L("；", "; "))
            for i = #P.pend, 1, -1 do P.pend[i] = nil end
            tell(msg)
        end
        return
    end
    P.Queue()
end
-- 事件借组队信标的框体（BuffAsk.lua：UNIT_AURA / 队伍变动 / 换队长 / 进世界 / 脱战都转给 P.OnEvent；不另建框体，省内存）；没有信标才自己建
local BA = ns.BuffAsk
if BA and BA.ev and BA.SyncEvents then
    P.ev = BA.ev
    pcall(BA.SyncEvents)
else
    local ev = CreateFrame("Frame")
    P.ev = ev
    for _, e in ipairs({ "UNIT_AURA", "GROUP_ROSTER_UPDATE", "PARTY_LEADER_CHANGED", "PLAYER_ENTERING_WORLD", "PLAYER_REGEN_ENABLED" }) do pcall(ev.RegisterEvent, ev, e) end
    ev:SetScript("OnEvent", function(_, e, a1) pcall(P.OnEvent, e, a1) end)
end

-- 开关在组队信标 BuffAsk.lua（「要 BUFF」设置组末尾：ssparty.on / ssparty.all）；提醒线和术士灵魂石追踪共用 ssTrack.warn（术士设置里改）
if IsLoggedIn and IsLoggedIn() then pcall(P.Update, "load") end

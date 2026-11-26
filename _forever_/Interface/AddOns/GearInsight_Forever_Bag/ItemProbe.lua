-- /gi itemprobe：物品信息 / 聊天框接口探针（10-18，开发诊断命令；11-24 1.5.1 内核减肥从主插件 Perf.lua 原样搬来）
--   登录不加载：主插件 BagStub.lua 登记 /gi itemprobe 命令占位，第一次敲才加载本子插件（网易DD 包并进主文件夹 = 登录就在，直接登记）
--   ⛔ 本文件晚于主插件加载：ns = _G.GearInsightForever or ns；ns.Perf 由主插件 Perf.lua 建（没有就自己建一张，命令照样能用）
local _, ns = ...; ns = _G.GearInsightForever or ns
local Perf = ns.Perf or {}
ns.Perf = Perf
ns.ExtraSlash = ns.ExtraSlash or {}

-- ---------- /gi itemprobe：物品信息 / 聊天框接口探针（10-18 用户「shift还不行」+ 截图：同一件装备一会儿原生提示一会儿「正在读取」）----------
--   记：① 各接口在不在 ② 「推荐装备」页前 6 件（或 /gi itemprobe 物品ID …）现在能拿到什么 ③ 向服务器要数据、5 秒后再看一遍 + 收到了哪些事件
--   结果打聊天框（GIITEM1 开头）并存 ns.db.itemProbe，/reload 后看存档
local function has(v) return v ~= nil and (type(v) ~= "table" or next(v) ~= nil) and "Y" or "-" end
local function itemState(id)
    local function try(f, ...) if type(f) ~= "function" then return "无" end local r = { pcall(f, ...) } if not r[1] then return "错" end return r end
    local out = {}
    local r = try(C_Item and C_Item.GetItemInfo, id); out[#out + 1] = "C_Item.Info=" .. (type(r) == "table" and tostring(r[2] ~= nil and r[3] or r[2]) or r)
    r = try(GetItemInfo, id); out[#out + 1] = "GetItemInfo=" .. (type(r) == "table" and tostring(r[3] or r[2]) or r)
    r = try(C_Item and C_Item.IsItemDataCachedByID, id); out[#out + 1] = "cached=" .. (type(r) == "table" and tostring(r[2]) or r)
    r = try(C_Item and C_Item.DoesItemExistByID, id); out[#out + 1] = "exists=" .. (type(r) == "table" and tostring(r[2]) or r)
    r = try((C_Item and C_Item.GetItemInfoInstant) or GetItemInfoInstant, id); out[#out + 1] = "instant=" .. (type(r) == "table" and tostring(r[2]) or r)
    if C_TooltipInfo and C_TooltipInfo.GetItemByID then
        local ok, d = pcall(C_TooltipInfo.GetItemByID, id)
        out[#out + 1] = "tipInfo=" .. (ok and type(d) == "table" and ((d.lines and #d.lines or 0) .. "行," .. (d.hyperlink and "有链接" or "无链接")) or "空")
    end
    if GameTooltip and GameTooltip.SetItemByID then
        GameTooltip:SetOwner(UIParent, "ANCHOR_NONE")
        local ok = pcall(GameTooltip.SetItemByID, GameTooltip, id)
        local first = _G.GameTooltipTextLeft1 and _G.GameTooltipTextLeft1:GetText()
        out[#out + 1] = "SetItemByID=" .. tostring(ok) .. "," .. (GameTooltip.NumLines and GameTooltip:NumLines() or "?") .. "行," .. tostring(first)
        GameTooltip:Hide()
    end
    return table.concat(out, " ")
end
function Perf.ItemProbe(args)
    local ids = {}
    for x in tostring(args or ""):gmatch("%d+") do ids[#ids + 1] = tonumber(x) end
    -- 没给编号 = 取「推荐装备」页上现有的几件（那一页在按需加载的子插件里，没打开过就没有，下面会提示用法）
    if #ids == 0 and ns.GearPage and ns.GearPage.gearBtns then
        local seen = {}
        for _, b in pairs(ns.GearPage.gearBtns) do
            local it = rawget(b, "it")
            if type(it) == "table" and it.id and not seen[it.id] and #ids < 6 then seen[it.id] = true; ids[#ids + 1] = it.id end
        end
    end
    if #ids == 0 then ids = { 6948, 2589 } end   -- 炉石、亚麻布：一定存在的物品做对照
    local out = {}
    local function add(x) out[#out + 1] = x end
    add("api C_Item.GetItemInfo=" .. has(C_Item and C_Item.GetItemInfo) .. " GetItemInfo=" .. has(GetItemInfo)
        .. " Request=" .. has(C_Item and C_Item.RequestLoadItemDataByID) .. " C_TooltipInfo=" .. has(C_TooltipInfo and C_TooltipInfo.GetItemByID)
        .. " Handle=" .. has(HandleModifiedItemClick) .. " InsertLink=" .. has(ChatEdit_InsertLink) .. " OpenChat=" .. has(ChatFrame_OpenChat)
        .. " ActiveWin=" .. has(ChatEdit_GetActiveWindow) .. " ChatFrameUtil=" .. has(ChatFrameUtil) .. " EditBox1=" .. has(_G.ChatFrame1EditBox)
        .. " DressUp=" .. has(DressUpItemLink))
    if type(ChatFrameUtil) == "table" then
        local ks = {}
        for k, v in pairs(ChatFrameUtil) do if type(v) == "function" and (k:find("Link") or k:find("Open") or k:find("Active") or k:find("Insert")) then ks[#ks + 1] = k end end
        table.sort(ks); add("ChatFrameUtil: " .. table.concat(ks, ","))
    end
    for _, id in ipairs(ids) do add("now #" .. id .. " " .. itemState(id)) end
    local got = {}
    local f = CreateFrame("Frame")
    for _, e in ipairs({ "GET_ITEM_INFO_RECEIVED", "ITEM_DATA_LOAD_RESULT" }) do pcall(f.RegisterEvent, f, e) end
    f:SetScript("OnEvent", function(_, e, a1, a2) got[#got + 1] = e .. ":" .. tostring(a1) .. ":" .. tostring(a2) end)
    for _, id in ipairs(ids) do if C_Item and C_Item.RequestLoadItemDataByID then pcall(C_Item.RequestLoadItemDataByID, id) end end
    ns.Print(ns.L("物品接口探针：已向服务器要数据，5 秒后出结果", "Item probe: requested data, results in 5 s"))
    C_Timer.After(5, function()
        f:UnregisterAllEvents()
        for _, id in ipairs(ids) do add("5s #" .. id .. " " .. itemState(id)) end
        add("events " .. (#got > 0 and table.concat(got, " ", 1, math.min(#got, 20)) or "无"))
        ns.db.itemProbe = out
        for _, x in ipairs(out) do ns.Print("|cff888888GIITEM1|r " .. x) end
        ns.Print(ns.L("物品接口探针完成：/reload 写进存档后告诉我", "Item probe done: /reload to save"))
    end)
end

-- /gi itemprobe all：「推荐装备」全部候选（9 职业去重约 1500 件）挨个向服务器要数据，记下服务器回「不存在」的
--   10-18 实测：黑石深渊几件经典装备客户端物品表里有，但服务器 ITEM_DATA_LOAD_RESULT 回 false → 推荐了游戏里拿不到的装备。
--   名单存 ns.db.itemExist（/reload 后导出给生成脚本，三端一起排除）；已经缓存的不重复要
function Perf.ItemExistAll()
    if Perf.existRun then ns.Print(ns.L("正在查，等它结束", "Already running")); return end
    if not (C_Item and C_Item.RequestLoadItemDataByID) then ns.Print(ns.L("这个客户端没有请求物品数据的接口", "No item request API")); return end
    local ids, seen = {}, {}
    local function add(id) id = tonumber(id); if id and not seen[id] then seen[id] = true; ids[#ids + 1] = id end end
    -- 11-12 第 3 期：装备候选 / 掉落表在按需加载的 GearInsight_Forever_Plan，查之前先加载上（这是玩家手动敲的诊断命令）
    if ns.PlanLoad and not ns.PlanLoad() then ns.Print(ns.L("升级 / 装备数据没加载上，查不了", "Leveling / gear data couldn't be loaded")); return end
    for _, lst in pairs((ns.Data and ns.Data.gear) or {}) do
        for _, it in ipairs(lst) do add(it.id) end
    end
    -- 10-18 掉落页的全部物品也查（图纸 / 配方 / 任务物品），顺便记下游戏里的官方中文名和提示文字（新物品没有中文名）
    for _, d in ipairs((ns.Data and ns.Data.loot and ns.Data.loot.dungeons) or {}) do
        for _, grp in ipairs({ d.bosses or {}, d.rares or {} }) do
            for _, b in ipairs(grp) do for _, it in ipairs(b.items or {}) do add(it.id) end end
        end
    end
    table.sort(ids)
    local res, i, okN = {}, 0, 0
    local f = Perf.existFrame or CreateFrame("Frame")
    Perf.existFrame = f
    for _, e in ipairs({ "ITEM_DATA_LOAD_RESULT" }) do pcall(f.RegisterEvent, f, e) end
    f:SetScript("OnEvent", function(_, _, id, ok) id = tonumber(id); if id and seen[id] and res[id] == nil then res[id] = ok and true or false end end)
    local acc, doneAt = 0, nil
    Perf.existRun = true
    ns.Print(string.format(ns.L("开始查 %d 件物品（推荐候选 + 掉落页全部）在服务器上存不存在，约 %d 秒，期间别 /reload", "Checking %d items (gear picks + all drops) on the server, ~%ds; don't /reload"), #ids, math.ceil(#ids / 100) + 10))
    f:SetScript("OnUpdate", function(_, el)
        acc = acc + (el or 0)
        if i < #ids then
            if acc < 0.1 then return end
            acc = 0
            for _ = 1, 10 do
                i = i + 1
                local id = ids[i]
                if not id then break end
                local cached = C_Item.IsItemDataCachedByID and select(2, pcall(C_Item.IsItemDataCachedByID, id))
                if cached == true then res[id] = true else pcall(C_Item.RequestLoadItemDataByID, id) end
            end
            if i >= #ids then doneAt = GetTime() + 10 end
            return
        end
        if GetTime() < (doneAt or 0) then return end
        f:SetScript("OnUpdate", nil); f:UnregisterAllEvents(); Perf.existRun = nil
        local bad, none, okIds = {}, {}, {}
        for _, id in ipairs(ids) do
            if res[id] == true then okN = okN + 1; okIds[#okIds + 1] = id   -- 10-18 推荐只用「确认掉过 / 服务器有」→ 存在的也要记
            elseif res[id] == false then bad[#bad + 1] = id
            else none[#none + 1] = id end
        end
        -- 服务器有的：记游戏里的物品名 + 鼠标提示每行文字（去掉颜色码）→ scripts/gi_forever_item_exist_import.py 导出给掉落数据补中文
        local zh = {}
        local function clean(t) return type(t) == "string" and (t:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|T.-|t", "")) or nil end
        for _, id in ipairs(okIds) do
            local name
            if C_Item.GetItemInfo then
                local okI, nm = pcall(C_Item.GetItemInfo, id)
                if okI then name = nm end
            end
            local lines = {}
            if C_TooltipInfo and C_TooltipInfo.GetItemByID then
                local okT, d = pcall(C_TooltipInfo.GetItemByID, id)
                if okT and type(d) == "table" then
                    for _, ln in ipairs(d.lines or {}) do
                        local l, r = clean(ln.leftText), clean(ln.rightText)
                        if l and l ~= "" then lines[#lines + 1] = (r and r ~= "") and (l .. "	" .. r) or l end
                    end
                end
            end
            if (type(name) == "string" and name ~= "") or #lines > 0 then zh[id] = { n = name, l = lines } end
        end
        ns.db.itemExist = { at = date and date("%m-%d %H:%M:%S") or "", total = #ids, ok = okN, okIds = okIds, bad = bad, none = none, zh = zh }
        ns.Print(string.format("|cff888888GIITEM2|r " .. ns.L("共 %d 件：服务器有 %d 件，回「不存在」%d 件，没回应 %d 件。/reload 写进存档后告诉我",
            "%d items: %d exist, %d missing, %d no reply. /reload to save"), #ids, okN, #bad, #none))
    end)
end
ns.ExtraSlash.itemprobe = function(rest)
    if rest == "all" then Perf.ItemExistAll() else Perf.ItemProbe(rest) end
end

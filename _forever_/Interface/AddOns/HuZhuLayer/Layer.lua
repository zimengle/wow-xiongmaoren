local H = HuZhuLayer

H.currentRawLayer = nil
H.layerOrder = {}
H.layerLabels = {}

local function splitGuid(guid)
  if not H:IsReadableGuid(guid) then
    return nil
  end
  local ok, parts = pcall(function()
    return { strsplit("-", guid) }
  end)
  if not ok or type(parts) ~= "table" or parts[1] == nil then
    return nil
  end
  return parts
end

function H:ExtractRawLayer(guid)
  local parts = splitGuid(guid)
  if not parts then
    return nil
  end
  -- kind / tonumber / 数值比较在 secret 未解密时会炸；整段 pcall，失败则本轮跳过
  -- 只认 Creature/Vehicle：GameObject 的 zoneUID 常和分片无关，划过会乱跳号
  local ok, zoneUID = pcall(function()
    local kind = parts[1]
    if kind ~= "Creature" and kind ~= "Vehicle" then
      return nil
    end
    local z = tonumber(parts[5])
    if z == nil or z <= 0 then
      return nil
    end
    return z
  end)
  if ok then
    return zoneUID
  end
  return nil
end

-- 仅保证名单里有这条线，不刷新 last（列表刷新不得给过期线续命）
function H:EnsureSeenLayer(raw)
  if not raw or not self.db then
    return
  end
  raw = tonumber(raw)
  if not raw then
    return
  end
  local key = tostring(raw)
  if not self.db.seenLayers[key] then
    self.db.seenLayers[key] = { first = self:WallNow(), last = 0 }
    table.insert(self.layerOrder, raw)
    table.sort(self.layerOrder, function(a, b)
      return (tonumber(a) or 0) < (tonumber(b) or 0)
    end)
  end
end

-- 真实见到/同伴报到：刷新 last（墙钟）
function H:RememberRawLayer(raw)
  if not raw or not self.db then
    return
  end
  raw = tonumber(raw)
  if not raw then
    return
  end
  local key = tostring(raw)
  local now = self:WallNow()
  if not self.db.seenLayers[key] then
    self.db.seenLayers[key] = { first = now, last = now }
    table.insert(self.layerOrder, raw)
    table.sort(self.layerOrder, function(a, b)
      return (tonumber(a) or 0) < (tonumber(b) or 0)
    end)
  else
    self.db.seenLayers[key].last = now
  end
end

-- 表键可能是 number 或 "123" 字符串（AceDB / 存档混用）
local function nwbTblGet(t, k)
  if type(t) ~= "table" or k == nil then
    return nil
  end
  local v = t[k]
  if v ~= nil then
    return v
  end
  local n = tonumber(k)
  if n ~= nil then
    v = t[n]
    if v ~= nil then
      return v
    end
    v = t[tostring(n)]
    if v ~= nil then
      return v
    end
  else
    v = t[tostring(k)]
    if v ~= nil then
      return v
    end
  end
  return nil
end

local function nwbTableNonEmpty(t)
  return type(t) == "table" and next(t) ~= nil
end

local function nwbSortedLayerKeys(layers)
  local keys = {}
  if type(layers) ~= "table" then
    return keys
  end
  for k in pairs(layers) do
    local nk = tonumber(k)
    if nk then
      table.insert(keys, nk)
    end
  end
  table.sort(keys)
  return keys
end

local function nwbIsLayerRecord(v)
  return type(v) == "table"
    and (type(v.layerMap) == "table" or v.GUID or v.lastSeenNPC or v.created or v.spawn or v.npcID)
end

local function nwbCurrentWorldMap()
  if type(_G.NWB_GetCurrentWorldMapID) ~= "function" then
    return nil
  end
  local ok, id = pcall(_G.NWB_GetCurrentWorldMapID)
  if not ok then
    return nil
  end
  return tonumber(id)
end

-- 3.49 起层表先按世界分柜：世界 → 层号 → 记录。摊成旧形状（层号 → 记录）后面才能排成位面一、二。
-- 旧的扁表（层号上直接有记录）原样返回。人在艾泽拉斯就只用艾泽拉斯那一柜，外域、诺森德、潘达利亚各用各的。
local function nwbFlattenLayers(layers)
  if type(layers) ~= "table" then
    return nil
  end
  for _, v in pairs(layers) do
    if nwbIsLayerRecord(v) then
      return layers
    end
  end
  local want = nwbCurrentWorldMap()
  local exact, exactN = nil, 0
  local loose, looseN = nil, 0
  for _, storage in pairs(layers) do
    if type(storage) == "table" then
      local flat, n, world = {}, 0, nil
      for layer, rec in pairs(storage) do
        local id = tonumber(layer)
        if id and nwbIsLayerRecord(rec) then
          flat[id] = rec
          n = n + 1
          world = tonumber(rec.worldMapID) or world
        end
      end
      if n > 0 then
        if want and world == want and n > exactN then
          exact, exactN = flat, n
        elseif (not want or not world) and n > looseN then
          loose, looseN = flat, n
        end
      end
    end
  end
  return exact or loose
end

-- Nova World Buffs 运行时对象（AceAddon）；可能没有全局 _G.NWB
function H:GetNWB()
  local nwb = _G.NWB
  if type(nwb) == "table" and (nwb.GetLayerNum or (nwb.data and nwb.data.layers) or nwb.db) then
    return nwb
  end
  local LS = _G.LibStub
  if type(LS) == "function" then
    local ace = LS("AceAddon-3.0", true)
    if ace and type(ace.GetAddon) == "function" then
      local ok, add = pcall(function()
        return ace:GetAddon("NovaWorldBuffs", true)
      end)
      if ok and type(add) == "table" then
        return add
      end
    end
  end
  return nil
end

-- 从轻歌花公开口 / 存档收集一份非空 layers（不做缓存）。
-- 3.49 用 NWB_GetLayerData()，内部对象已经拿不到。
function H:BuildNWBLayersTable()
  local best, bestN = nil, 0
  local function consider(layers)
    local flat = nwbFlattenLayers(layers)
    if not nwbTableNonEmpty(flat) then
      return
    end
    local n = 0
    for _ in pairs(flat) do
      n = n + 1
    end
    if n > bestN then
      best, bestN = flat, n
    end
  end

  if not (self.IsForeverClient and self:IsForeverClient())
    and type(_G.NWB_GetLayerData) == "function" then
    local ok, data = pcall(_G.NWB_GetLayerData)
    if ok then
      consider(data)
      if best then
        return best
      end
    end
  end

  local nwb = self:GetNWB()
  if nwb then
    if nwb.data then
      consider(nwb.data.layers)
    end
    local db = nwb.db
    if type(db) == "table" and type(db.global) == "table" then
      local realm = nwb.realm
      if not realm then
        pcall(function()
          realm = GetRealmName()
        end)
      end
      local fac = nwb.faction
      if not fac then
        pcall(function()
          fac = UnitFactionGroup("player")
        end)
      end
      local realmTbl = realm and nwbTblGet(db.global, realm) or nil
      if type(realmTbl) == "table" and fac then
        local facTbl = nwbTblGet(realmTbl, fac)
        if type(facTbl) == "table" then
          consider(facTbl.layers)
        end
      end
    end
  end

  local sv = _G.NWBdatabase
  if type(sv) == "table" and type(sv.global) == "table" then
    local faction = nil
    pcall(function()
      faction = UnitFactionGroup("player")
    end)
    local realm = nil
    pcall(function()
      realm = GetRealmName()
    end)
    if nwb and nwb.realm then
      realm = nwb.realm
    end
    local function layersFromRealm(realmTbl)
      if type(realmTbl) ~= "table" then
        return nil
      end
      if faction then
        local facTbl = nwbTblGet(realmTbl, faction)
        if type(facTbl) == "table" and nwbTableNonEmpty(facTbl.layers) then
          return facTbl.layers
        end
      end
      for _, fac in ipairs({ "Horde", "Alliance" }) do
        local facTbl = nwbTblGet(realmTbl, fac)
        if type(facTbl) == "table" and nwbTableNonEmpty(facTbl.layers) then
          return facTbl.layers
        end
      end
      return nil
    end
    if realm then
      consider(layersFromRealm(nwbTblGet(sv.global, realm)))
    end
    for _, realmTbl in pairs(sv.global) do
      consider(layersFromRealm(realmTbl))
    end
  end

  return best
end

-- 短缓存：刷新名单时同一帧会查几百次，不能每次扫整份存档
function H:GetNwbLayerCache()
  local world = nwbCurrentWorldMap() or 0
  local c = self._nwbLayerCache
  local now = GetTime()
  if c and c.world == world and (now - (c.builtAt or 0)) < 3 then
    return c
  end
  local layers = self:BuildNWBLayersTable()
  local keys = nwbSortedLayerKeys(layers)
  local rawToNum = {}
  for i, layerZoneID in ipairs(keys) do
    rawToNum[layerZoneID] = i
    local layerData = nwbTblGet(layers, layerZoneID)
    local lm = layerData and layerData.layerMap
    if type(lm) == "table" then
      for zid in pairs(lm) do
        local n = tonumber(zid)
        if n and n > 0 then
          rawToNum[n] = i
        end
      end
    end
  end
  c = {
    builtAt = now,
    world = world,
    layers = layers,
    keys = keys,
    rawToNum = rawToNum,
  }
  self._nwbLayerCache = c
  return c
end

function H:GetNWBLayersTable()
  return self:GetNwbLayerCache().layers
end

-- Nova World Buffs 的 Layer 序号（与轻歌花 / 小地图一致）
function H:NwbLayerNumDirect(raw)
  raw = tonumber(raw)
  if not raw or raw <= 0 then
    return nil
  end

  -- 有人报来真的 NWB 表时，全体用这一张，和报出的人看齐
  if self._bookSrc == "N" and self._bookMap and self._bookMap[raw] then
    return self._bookMap[raw]
  end

  local c = self:GetNwbLayerCache()
  local n = c.rawToNum[raw]
  if n then
    return n
  end

  local nwb = self:GetNWB()
  if nwb and type(nwb.GetLayerNum) == "function" then
    local ok, gn = pcall(function()
      return nwb:GetLayerNum(raw)
    end)
    gn = ok and tonumber(gn) or nil
    if gn and gn > 0 then
      c.rawToNum[raw] = gn
      return gn
    end
  end

  -- 小地图层号只认「这个 UID 就是 NWB 记下的当前层」。
  -- 禁止：求切后小地图还停在「四」，就把新 UID 写进对照表当成第四层。
  local cur = tonumber(_G.NWB_CurrentLayer)
  if (not cur or cur < 1) and nwb then
    cur = tonumber(nwb.currentLayer) or tonumber(nwb.lastKnownLayer)
  end
  if cur and cur > 0 and tonumber(_G.NWB_CurrentLayerZoneID) == raw then
    c.rawToNum[raw] = cur
    return cur
  end
  if cur and cur > 0 and nwb then
    if tonumber(nwb.lastKnownLayerID) == raw
      or tonumber(nwb.lastKnownLayerMapID) == raw
      or tonumber(nwb.currentZoneID) == raw
      or tonumber(nwb.currentZoneIDStrict) == raw then
      c.rawToNum[raw] = cur
      return cur
    end
  end

  -- 轻歌花 3.49 在的时候，只认它的表。不要再用我们自己抄的那套去补号。
  if type(_G.NWB_GetLayerData) ~= "function" and self.NwbCopyGetLayerNum then
    local cn = self:NwbCopyGetLayerNum(raw)
    if cn and cn > 0 then
      return cn
    end
  end
  if self.BookLayerNum then
    local bn = self:BookLayerNum(raw)
    if bn and bn > 0 then
      return bn
    end
  end

  return nil
end

-- 轻歌花表没有这个号时：主城号排成 1/2/3，野外号挂到对应主城（和 NWB layerMap 同一套）
function H:BookLayerNum(raw)
  raw = tonumber(raw)
  if not raw or raw <= 0 then
    return nil
  end
  if self._bookMap and self._bookMap[raw] then
    return self._bookMap[raw]
  end
  if not self.LayerBook then
    return nil
  end
  local book = self:LayerBook()
  if not book then
    return nil
  end
  local keys = {}
  for id in pairs(book.cap or {}) do
    local n = tonumber(id)
    if n and n > 0 then
      keys[#keys + 1] = n
    end
  end
  table.sort(keys)
  for i, id in ipairs(keys) do
    if id == raw then
      return i
    end
  end
  local w = book.wild and book.wild[tostring(raw)]
  local cap = type(w) == "table" and tonumber(w.cap) or nil
  if cap then
    for i, id in ipairs(keys) do
      if id == cap then
        return i
      end
    end
  end
  return nil
end

function H:NwbLayerNum(raw)
  raw = tonumber(raw)
  if not raw or raw <= 0 then
    return nil
  end
  -- 经典60才排成位面一、二。其余版本和无限一样，不把编号收成一二。
  if not (self.UsesNwbLayerRank and self:UsesNwbLayerRank()) then
    return nil
  end
  local n = self:NwbLayerNumDirect(raw)
  if n and n > 0 then
    if tonumber(self.currentRawLayer) == raw then
      self._heldLayerNum = n
    end
    return n
  end
  -- 走出主城、野外号还没挂上时，先留在刚才那一层，不退回没编号的房间
  if tonumber(self.currentRawLayer) == raw then
    local held = tonumber(self._heldLayerNum)
    if held and held > 0 then
      if self.TraceIfChanged then
        self:TraceIfChanged("hold", "野外还没对上，先留在位面 " .. tostring(held))
      end
      return held
    end
  end
  return nil
end

-- 同一 NWB 位面？（主城号 11492 与野外号 33968 算同一面）
function H:SameNwbLayer(rawA, rawB)
  rawA, rawB = tonumber(rawA), tonumber(rawB)
  if not rawA or not rawB then
    return false
  end
  if rawA == rawB then
    return true
  end
  local c = self:GetNwbLayerCache()
  local na = c.rawToNum[rawA] or self:NwbLayerNum(rawA)
  local nb = c.rawToNum[rawB] or self:NwbLayerNum(rawB)
  return na ~= nil and nb ~= nil and na == nb
end

-- 位面 N 里、当前这张图对应的那些小位面号（NWB layerMap：zoneUID → 地图号；主城号就是主城里的那一份）
function H:LayerRawsForMap(targetRaw, mapId)
  local set = {}
  targetRaw = tonumber(targetRaw)
  mapId = tonumber(mapId)
  if not targetRaw or not mapId or mapId <= 0 then
    return set
  end
  local n = self:NwbLayerNum(targetRaw)
  if not n then
    return set
  end
  local keys, layers
  if self.GetNwbLayerCache then
    local c = self:GetNwbLayerCache()
    keys = c.keys
    layers = c.layers
  end
  if (not keys or #keys == 0) and self._bookKeys then
    keys = self._bookKeys
  end
  local cap = keys and tonumber(keys[n])
  local row = nil
  if cap and type(layers) == "table" then
    row = layers[cap] or layers[tostring(cap)]
  end
  local canon = self.CanonMapId and self:CanonMapId(mapId) or 0
  local function mapMatches(m)
    m = tonumber(m)
    if not m then
      return false
    end
    if m == mapId then
      return true
    end
    return canon > 0 and self.CanonMapId and self:CanonMapId(m) == canon
  end
  local lm = row and row.layerMap
  if type(lm) == "table" then
    for zid, zmap in pairs(lm) do
      local z = tonumber(zid)
      if z and z > 0 and mapMatches(zmap) then
        set[z] = true
      end
    end
  end
  if cap and self.CapitalMapIds then
    local caps = self:CapitalMapIds()
    if type(caps) == "table" and (caps[mapId] or (canon > 0 and caps[canon])) then
      set[cap] = true
    end
  end
  if cap and self.LayerBook then
    local book = self:LayerBook()
    local wild = book and book.wild
    if type(wild) == "table" then
      for id, w in pairs(wild) do
        local z = tonumber(id)
        if z and type(w) == "table" and tonumber(w.cap) == cap and mapMatches(w.map) then
          set[z] = true
        end
      end
    end
  end
  return set
end

-- 求切：对方必须报在「目标位面里、自己这张图的那些小位面」上。对照表还没标这张图时，退回整层+同图。
function H:PeerMatchesHopTarget(peer, targetRaw)
  if not peer then
    return false
  end
  targetRaw = tonumber(targetRaw)
  local raw = tonumber(peer.raw)
  if not targetRaw or not raw then
    return false
  end
  local base = self:MyMapId()
  local allow = tonumber(self._hopAllowMap)
  if allow and allow > 0 then
    base = allow
  end
  if self.RequiresSameMapForHop and self:RequiresSameMapForHop() then
    if not (self.SameHoppableMap and self:SameHoppableMap(base, peer.map)) then
      return false
    end
  end
  local set = self:LayerRawsForMap(targetRaw, base)
  if set and next(set) then
    if set[raw] then
      return true
    end
    if self.RequiresSameMapForHop and self:RequiresSameMapForHop() then
      return false
    end
  end
  return self:SameNwbLayer(raw, targetRaw)
end

function H:PeerIsHzl(peer)
  if not peer then
    return false
  end
  if peer.hzl then
    return true
  end
  return not peer.pig
end

-- 列表/求切用的代表号：有 NWB 时用该层主城 zoneUID
function H:NwbCanonicalRaw(raw)
  raw = tonumber(raw)
  if not raw then
    return nil
  end
  local n = self:NwbLayerNum(raw)
  if not n then
    return raw
  end
  local keys
  if self._bookSrc == "N" and self._bookKeys and #self._bookKeys > 0 then
    keys = self._bookKeys
  else
    keys = self:GetNwbLayerCache().keys
    if (not keys or #keys == 0) and self._bookKeys and #self._bookKeys > 0 then
      keys = self._bookKeys
    end
  end
  return (keys and keys[n]) or raw
end

-- /hzl nwb：看清有没有连上 NWB、当前长号对应第几层
function H:NwbDebugPrint()
  local nwb = self:GetNWB()
  local layers = self:GetNWBLayersTable()
  local keys = nwbSortedLayerKeys(layers)
  local raw = tonumber(self.currentRawLayer)
  local mapped = raw and self:NwbLayerNum(raw) or nil
  local canon = raw and self:NwbCanonicalRaw(raw) or nil
  self:Print(
    string.format(
      "NWB插件=%s 对照表=%d条(%s) 当前长号=%s → 位面%s(代表%s) | NWB_CurrentLayer=%s",
      nwb and "已找到" or "未找到",
      #keys,
      #keys > 0 and table.concat(keys, ",") or "-",
      raw and tostring(raw) or "?",
      mapped and tostring(mapped) or "(仍用长号)",
      canon and tostring(canon) or "?",
      tostring(_G.NWB_CurrentLayer or "?")
    )
  )
end

-- 我们排的 1、2、3 给人看时写成 一、二、三；系统长编号仍用阿拉伯数字
function H:LayerIndexZh(n)
  n = tonumber(n)
  if not n or n < 1 then
    return nil
  end
  n = math.floor(n)
  local digits = { "一", "二", "三", "四", "五", "六", "七", "八", "九" }
  if n <= 9 then
    return digits[n]
  end
  if n == 10 then
    return "十"
  end
  if n < 20 then
    return "十" .. digits[n - 10]
  end
  if n < 100 then
    local tens = math.floor(n / 10)
    local ones = n % 10
    local s = digits[tens] .. "十"
    if ones > 0 then
      s = s .. digits[ones]
    end
    return s
  end
  return tostring(n)
end

-- 展示：有排号时「位面一」；对不上时仍是系统长编号
function H:LabelForRaw(raw)
  raw = tonumber(raw)
  if not raw then
    return "?"
  end
  if not (self.UsesNwbLayerRank and self:UsesNwbLayerRank()) then
    return "位面" .. tostring(raw)
  end
  local nwb = self:NwbLayerNum(raw)
  local zh = nwb and self:LayerIndexZh(nwb)
  if zh then
    return "位面" .. zh
  end
  return "位面 " .. tostring(raw)
end

function H:LabelNum(raw)
  raw = tonumber(raw)
  if not raw then
    return "?"
  end
  local nwb = self:NwbLayerNum(raw)
  local zh = nwb and self:LayerIndexZh(nwb)
  if zh then
    return zh
  end
  return tostring(raw)
end

-- 当前角色完整 GUID（位面到访时间按角色分桶）
function H:MyVisitCharKey()
  local guid = UnitGUID("player")
  if self:IsReadableGuid(guid) then
    return guid
  end
  return nil
end

-- 记录「我本人」到过该位面的时间（墙钟；按角色 GUID 分开存）
function H:MarkMyLayerVisit(raw)
  raw = tonumber(raw)
  local char = self:MyVisitCharKey()
  if not raw or not self.db or not char then
    return
  end
  self.db.myVisits = self.db.myVisits or {}
  self.db.myVisits[char] = self.db.myVisits[char] or {}
  self.db.myVisits[char][tostring(raw)] = self:WallNow()
  -- 仍记进 seenLayers 供列表认出该线；不再写账号共用的 myLast
  self.db.seenLayers[tostring(raw)] = self.db.seenLayers[tostring(raw)] or {}
end

-- 一点求切就开始倒计时，防止连点。自己走路换层不算。
H.LAYER_HOP_COOLDOWN = 60

-- 当前角色上次待在该位面的墙钟；人还在这一层、或从未到过，返回 nil
function H:MyLayerVisitStamp(raw)
  raw = tonumber(raw)
  local char = self:MyVisitCharKey()
  if not raw or not char or self:SameNwbLayer(raw, self.currentRawLayer) then
    return nil
  end
  local bag = self.db and self.db.myVisits and self.db.myVisits[char]
  if type(bag) ~= "table" then
    return nil
  end
  -- 主城号 / 野外长号可能分开记过，取同一层里最近一次
  local myLast = 0
  for k, ts in pairs(bag) do
    if self:SameNwbLayer(tonumber(k), raw) then
      ts = tonumber(ts) or 0
      if ts > myLast then
        myLast = ts
      end
    end
  end
  if not self:IsWallStamp(myLast) then
    return nil
  end
  return myLast
end

-- 求切离开该层的墙钟；人还在这一层、或不是求切离开，返回 nil
function H:MyLayerHopLeaveStamp(raw)
  raw = tonumber(raw)
  local char = self:MyVisitCharKey()
  if not raw or not char or self:SameNwbLayer(raw, self.currentRawLayer) then
    return nil
  end
  local bag = self.db and self.db.hopLeaves and self.db.hopLeaves[char]
  if type(bag) ~= "table" then
    return nil
  end
  local myLast = 0
  for k, ts in pairs(bag) do
    if self:SameNwbLayer(tonumber(k), raw) then
      ts = tonumber(ts) or 0
      if ts > myLast then
        myLast = ts
      end
    end
  end
  if not self:IsWallStamp(myLast) then
    return nil
  end
  return myLast
end

function H:ArmHopCooldown(raw)
  self:MarkHopLeave(raw)
  if self.ScheduleRefreshUI then
    self:ScheduleRefreshUI(0.05)
  elseif self.RefreshUI then
    self:RefreshUI()
  end
end

function H:MarkHopLeave(raw)
  raw = tonumber(raw)
  local char = self:MyVisitCharKey()
  if not raw or not self.db or not char then
    return
  end
  self.db.hopLeaves = self.db.hopLeaves or {}
  self.db.hopLeaves[char] = self.db.hopLeaves[char] or {}
  self.db.hopLeaves[char][tostring(raw)] = self:WallNow()
end

-- 求切还要等多少秒；已过冷却或不是求切离开返回 nil
function H:MyLayerCooldownLeft(raw)
  local myLast = self:MyLayerHopLeaveStamp(raw)
  if not myLast then
    return nil
  end
  if myLast <= (tonumber(self._hopCooldownFloor) or 0) then
    return nil
  end
  local left = (self.LAYER_HOP_COOLDOWN or 60) - (self:WallNow() - myLast)
  if left <= 0 then
    return nil
  end
  return math.ceil(left)
end

function H:FormatHopCooldown(seconds)
  seconds = tonumber(seconds) or 0
  if seconds < 0 then
    seconds = 0
  end
  seconds = math.floor(seconds)
  local m = math.floor(seconds / 60)
  local s = seconds % 60
  return string.format("%d:%02d", m, s)
end

function H:ClearLayerHopCooldowns()
  -- 只取消倒计时。左边「你几分钟前」仍留着。
  self._hopCooldownFloor = self:WallNow()
end

-- 当前角色离开该位面多少分钟；从未到过返回 nil（不读别的角色 / 旧账号共用 myLast）
function H:MyLayerMinutesAgo(raw)
  local myLast = self:MyLayerVisitStamp(raw)
  if not myLast then
    return nil
  end
  local mins = math.floor((self:WallNow() - myLast) / 60)
  if mins < 0 then
    return nil
  end
  if mins < 1 then
    mins = 1
  end
  return mins
end

-- 列表状态列：只描述自己 —— 当前 / X分钟前；没去过留空
function H:MyLayerStatusText(raw)
  raw = tonumber(raw)
  if not raw then
    return ""
  end
  if self.LayerUnreliable and self:LayerUnreliable() then
    return ""
  end
  if self:SameNwbLayer(raw, self.currentRawLayer) then
    return "|cff66e673你在此位面|r"
  end
  local mins = self:MyLayerMinutesAgo(raw)
  if not mins or mins > 99 then
    return ""
  end
  return "你" .. tostring(mins) .. "分钟前"
end

-- 小地图正在显示的层。3.48 起轻歌花不再让别的插件翻它内部的表，
-- 只留 NWB_CurrentLayer（第几层）和 NWB_CurrentLayerZoneID（这一层在本地图的编号）。
-- 轻歌花只在怀旧服。无限服认层不读它。
function H:NwbLiveZoneId()
  if self.IsForeverClient and self:IsForeverClient() then
    return nil
  end
  local zid = tonumber(_G.NWB_CurrentLayerZoneID)
  if zid and zid > 0 then
    return zid
  end
  local nwb = self:GetNWB()
  local num = tonumber(_G.NWB_CurrentLayer)
  if (not num or num < 1) and nwb then
    num = tonumber(nwb.currentLayer)
  end
  if not num or num < 1 then
    return nil
  end
  local keys = self:GetNwbLayerCache().keys
  if keys and keys[num] then
    return tonumber(keys[num])
  end
  return nil
end

function H:HookNwbLayerUpdated()
  if self.IsForeverClient and self:IsForeverClient() then
    return
  end
  if self._nwbLayerHooked or type(_G.NWB_LayerUpdated) ~= "function" then
    return
  end
  self._nwbLayerHooked = true
  local prev = _G.NWB_LayerUpdated
  _G.NWB_LayerUpdated = function()
    if type(prev) == "function" then
      pcall(prev)
    end
    H._nwbLayerCache = nil
    local zid = tonumber(_G.NWB_CurrentLayerZoneID)
    if zid and zid > 0 and H.SetCurrentLayer then
      H:SetCurrentLayer(zid)
    end
  end
end

-- 接别人的求切之前用：不拿上次报出去的号。
-- 现场怪已经换层，或小地图层号变了而身边又凑不齐 2 只旧层的怪，都算上报过期。
function H:ReadOwnLayerForAccept()
  local votes = self:CollectLayerVotes() or {}
  local cur = tonumber(self.currentRawLayer)
  local curN, best, bestN = 0, nil, 0
  for raw, n in pairs(votes) do
    raw = tonumber(raw)
    n = tonumber(n) or 0
    if raw and n > 0 then
      if cur and self:SameNwbLayer(raw, cur) then
        curN = curN + n
      elseif n > bestN then
        best, bestN = raw, n
      end
    end
  end

  -- 还没认过线：看到 1 只也先认。已经认过线：至少 2 只新层、旧层 0 只，才算换过了。
  -- 单独 1 只别的层不算，避免鼠标扫过一只怪就把人接到错层。
  if not cur and best and bestN >= 1 then
    self:SetCurrentLayer(best)
    return best
  end
  if best and bestN >= 2 and curN == 0 then
    if not self:SameNwbLayer(best, cur) then
      self:SetCurrentLayer(best)
    end
    return best
  end

  local nwbRaw = self:NwbLiveZoneId()
  if nwbRaw and cur and not self:SameNwbLayer(nwbRaw, cur) and curN < 2 then
    self:SetCurrentLayer(nwbRaw)
    return nwbRaw
  end
  if nwbRaw and not cur then
    self:SetCurrentLayer(nwbRaw)
    return nwbRaw
  end

  if cur and curN >= 1 then
    return cur
  end
  if cur then
    return cur
  end
  return nil
end

function H:SetCurrentLayer(raw)
  if not raw then
    return
  end
  raw = tonumber(raw) or raw
  local prev = tonumber(self.currentRawLayer)
  -- 号没变就别重画图标、别写访问时间，否则定时扫每秒都卡一下
  if prev and prev == tonumber(raw) then
    local now = self:WallNow()
    if (self._sameLayerTouchAt or 0) + 30 <= now then
      self._sameLayerTouchAt = now
      self:RememberRawLayer(raw)
      self:MarkMyLayerVisit(raw)
    end
    return
  end
  self:RememberRawLayer(raw)
  self:MarkMyLayerVisit(raw)
  -- 换了黄字层：马上改持有层号。否则野外号暂时对不上时，图标右下角还会挂着旧的「四」
  if prev and not self:SameNwbLayer(prev, raw) then
    local n = self:NwbLayerNumDirect(raw)
    self._heldLayerNum = (n and n > 0) and n or nil
  end
  self.currentRawLayer = raw
  if self.RetailNoteCurrent then
    pcall(function()
      H:RetailNoteCurrent(raw)
    end)
  end
  self:UpdateLayerIcon()
  -- 无限互助短码：第一次认出、或换到不同位面时发（不跟 90 秒心跳）
  local layerAnnounce = false
  if not prev then
    layerAnnounce = true
  elseif prev ~= raw and not self:SameNwbLayer(prev, raw) then
    layerAnnounce = true
  end
  if prev and prev ~= raw then
    -- 只有求切换层才记下离开时间；自己走路换层不倒计时
    if (self.poll or self:IsHopConfirming()) and not self:SameNwbLayer(prev, raw) then
      self:MarkHopLeave(prev)
    end
    if self.HopLog then
      local aim = (self.poll and self.poll.targetRaw) or self._hopConfirmTarget
      local aiming = aim and self:SameNwbLayer(aim, raw)
      self:HopLog("layer", {
        from = prev,
        to = raw,
        who = (self.poll and self.poll.expectedHost) or self._hopConfirmHelper or nil,
        ok = aiming or nil,
        why = (aiming and "换线命中求切目标" or "位面号变化")
          .. " "
          .. (self.LabelForRaw and self:LabelForRaw(raw) or ""),
      })
    end
    -- 上报之后自己换了层：撤掉还挂着的帮助，并立刻重报，免得别人拿旧层来组
    if not self:SameNwbLayer(prev, raw) then
      local prompt = self.helpPrompt
      if prompt and not self:SameNwbLayer(prompt.raw, raw) then
        self.helpPrompt = nil
        self._inviteExpect = nil
        if not prompt.pig and prompt.replyAs then
          if self:IsForeverClient() then
            self:SendAddon("GSKIP|BUSY", "GUILD")
          else
            self:SendAddon("SKIP|BUSY", "WHISPER", prompt.replyAs)
          end
        end
        if self.UpdateHelpButton then
          self:UpdateHelpButton()
        end
      end
    end
    if not (self.LayerUnreliable and self:LayerUnreliable()) then
      self._layerTipPrev = prev
      self._layerTipRaw = raw
      self:ShowLayerChangeTip("切换")
    end
  end
  if layerAnnounce and self.BroadcastHello then
    self._hzlLayerAnnounce = true
    pcall(function()
      self:BroadcastHello("force")
    end)
  end
  if prev and prev ~= raw then
    if self.poll and self:SameNwbLayer(self.poll.targetRaw, raw) then
      local expected = self.poll.expectedHost
      local targetRaw = self.poll.targetRaw
      self.poll = nil
      self.anchoredHop = true
      -- 若进队问候尚未建会话（少见时序），这里补上；切成败都不影响感谢
      if expected and not self._partyHop then
        local matched = self:GroupHasPlayer(expected)
        if matched then
          self:BeginPartyHopSession(expected, true)
          C_Timer.After(0.4, function()
            pcall(function()
              H:AnnouncePartyGreet()
            end)
          end)
        end
      end
      self:AnnounceHopThanks(expected, targetRaw)
    end
    self:RefreshUI()
  elseif not prev then
    if not (self.LayerUnreliable and self:LayerUnreliable()) then
      self._layerTipPrev = nil
      self._layerTipRaw = raw
      self:ShowLayerChangeTip("进入")
    end
    self:RefreshUI()
  end
end

-- 只取样，不立刻改「当前」——附近怪 zoneUID 可能各不相同，一划就跳号
-- 跟轻歌花一样：只处理眼前这一只。不定时扫姓名板。
-- 已经认出当前面之后，鼠标底下再换怪不再记账，否则达拉然人多会一下一下卡。
function H:ObserveOneUnit(unit)
  if not unit then
    return
  end
  if self.IsInInstance and self:IsInInstance() then
    return
  end
  if self.IsOnTransit and self:IsOnTransit() then
    return
  end
  if not UnitExists(unit) or UnitIsPlayer(unit) then
    return
  end
  local guid = UnitGUID(unit)
  if not self:IsReadableGuid(guid) or guid == self._obsGuid then
    return
  end
  local raw = self:ExtractRawLayer(guid)
  if not raw then
    return
  end
  self._obsGuid = guid
  local cur = tonumber(self.currentRawLayer)
  if cur and tonumber(raw) == cur and not (self.LayerUnreliable and self:LayerUnreliable()) then
    return
  end
  if self.NwbCopySetCurrent then
    self:NwbCopySetCurrent(unit)
  end
  if self.NwbCopyMapLayer then
    self:NwbCopyMapLayer(unit)
  end
  self._needFreshVotes = false
  self._zoneRecognizeAt = 0
  self:RememberDisplayVotes({ [raw] = 1 })
  self:SetCurrentLayer(raw)
end

function H:SampleUnitLayer(unit, _allowCopy)
  if not unit then
    return nil
  end
  local ok, raw = pcall(function()
    if not UnitExists(unit) then
      return nil
    end
    if UnitIsPlayer(unit) then
      return nil
    end
    return H:ExtractRawLayer(UnitGUID(unit))
  end)
  if ok then
    return raw
  end
  return nil
end

function H:ObserveGuid(guid)
  local raw = self:ExtractRawLayer(guid)
  if not raw then
    return false
  end
  -- 兼容旧调用：单次 GUID 只记入票选，由 Resolve 决定是否换线
  self._layerVotes = self._layerVotes or {}
  self._layerVotes[raw] = (self._layerVotes[raw] or 0) + 1
  return true
end

function H:ObserveUnit(unit)
  local raw = self:SampleUnitLayer(unit)
  if not raw then
    return false
  end
  self._layerVotes = self._layerVotes or {}
  self._layerVotes[raw] = (self._layerVotes[raw] or 0) + 1
  return true
end

function H:IsHopConfirming()
  local untilT = tonumber(self._hopConfirmUntil) or 0
  return self._hopConfirmTarget and GetTime() < untilT
end

-- 票选（按「不同 GUID」计票，同一只怪只算 1 票）：
-- · 尚未认线：≥2 同号，或全场仅 1 个样本 → 认
-- · 已认线：只要本轮还能看到当前号（≥1 票）就锁住，不因鼠标扫过别的怪/人改号
-- · 已认线且当前号本轮 0 票（真换线/换区清掉后）：≥2 同号才改
-- · 求切核对中：只认「对上目标位面」的票；绝不改成别的号（否则会出现目标 L5 却先认成 L2）
--   目标票暂时没有时：先不改 current，由 ConfirmHop 多拍继续扫
function H:PickLayerFromVotes(votes)
  if type(votes) ~= "table" then
    return nil
  end
  local best, bestN, total = nil, 0, 0
  local counts = {}
  for raw, n in pairs(votes) do
    raw = tonumber(raw)
    n = tonumber(n) or 0
    if raw and n > 0 then
      counts[raw] = n
      total = total + n
      if n > bestN then
        best, bestN = raw, n
      end
    end
  end
  if not best then
    return nil
  end

  local confirmTo = self:IsHopConfirming() and tonumber(self._hopConfirmTarget) or nil
  if confirmTo then
    local bestT, bestTN = nil, 0
    for raw, n in pairs(counts) do
      if self:SameNwbLayer(raw, confirmTo) and n > bestTN then
        bestT, bestTN = raw, n
      end
    end
    if bestT then
      return bestT
    end
    -- 核对中：看不见目标面就先不动号（禁止把路过的别的位面号写进 current）
    return nil
  end

  local stickyUntil = tonumber(self._hopStickyUntil) or 0
  local sticky = tonumber(self._hopStickyRaw)
  if sticky and GetTime() < stickyUntil then
    local destRaw, destN = nil, 0
    for raw, n in pairs(counts) do
      if self:SameNwbLayer(raw, sticky) and n > destN then
        destRaw, destN = raw, n
      end
    end
    if destRaw then
      self._hopStickyUntil = 0
      return destRaw
    end
    -- 旧姓名板还在出发那一层：不动号，图标保持刚切到的层
    return nil
  end

  local cur = tonumber(self.currentRawLayer)
  if not cur then
    if bestN >= 2 then
      return best
    end
    if total == 1 then
      return best
    end
    return nil
  end
  local curN = counts[cur] or 0
  for raw, n in pairs(counts) do
    if raw ~= cur and self:SameNwbLayer(raw, cur) then
      curN = curN + n
    end
  end
  if curN >= 1 then
    -- 人还在原地、附近仍有当前位面证据：锁住（滑过玩家也会重扫，不能让姓名板抖动改号）
    return cur
  end
  if bestN >= 2 then
    return best
  end
  return nil
end

-- 刚切地图的 3 秒内不改当前层。求切核对中除外，那边仍马上认。
function H:ZoneRecognizeHeld()
  if self:IsHopConfirming() then
    return false
  end
  local untilT = tonumber(self._zoneRecognizeAt) or 0
  return untilT > self:Now()
end

-- 求切进队后 3 秒：图标先问号，不显示旧的「四」；满 3 秒再认新层。
function H:HopRecognizeHeld()
  local untilT = tonumber(self._hopRecognizeUntil) or 0
  return untilT > self:Now()
end

-- 能排成位面一/二才给图标看。野外号还没挂上时不算看清。
function H:LayerMappedForDisplay(raw)
  raw = tonumber(raw)
  if not raw or raw <= 0 then
    return nil
  end
  if self.IsRetailClient and self:IsRetailClient() then
    local n = self.RetailLayerNum and self:RetailLayerNum(raw)
    if n and n > 0 then
      return n
    end
    return nil
  end
  return self:NwbLayerNumDirect(raw)
end

function H:RememberDisplayVotes(votes)
  self._displayVotes = votes
  self._displayVotesAt = self:Now()
end

-- 身边怪已经是别的层，当前号撑不住。刚切成粘住的那一层除外。
function H:NearbyContradictsCurrent()
  local cur = tonumber(self.currentRawLayer)
  if not cur then
    return false
  end
  local stickyUntil = tonumber(self._hopStickyUntil) or 0
  local sticky = tonumber(self._hopStickyRaw)
  if sticky and GetTime() < stickyUntil and self:SameNwbLayer(cur, sticky) then
    return false
  end
  local votes = self._displayVotes
  if type(votes) ~= "table" then
    return false
  end
  if (self:Now() - (tonumber(self._displayVotesAt) or 0)) > 5 then
    return false
  end
  local curN, otherN, total = 0, 0, 0
  for raw, n in pairs(votes) do
    raw = tonumber(raw)
    n = tonumber(n) or 0
    if raw and n > 0 then
      total = total + n
      if self:SameNwbLayer(raw, cur) then
        curN = curN + n
      else
        otherN = otherN + n
      end
    end
  end
  if total == 0 then
    return false
  end
  return curN == 0 and otherN > 0
end

-- 位面不可靠：图标、提示、列表「当前」一律问号，不许挂着旧号。
function H:LayerUnreliable()
  if self.ZoneRecognizeHeld and self:ZoneRecognizeHeld() then
    return true
  end
  if self.HopRecognizeHeld and self:HopRecognizeHeld() then
    return true
  end
  local cur = tonumber(self.currentRawLayer)
  if not cur then
    return true
  end
  -- 除经典60外不排一二。换图后的 3 秒仍问号；过了这 3 秒，有编号就算认出。
  if not (self.UsesNwbLayerRank and self:UsesNwbLayerRank()) then
    return false
  end
  if self._needFreshVotes then
    return true
  end
  if self:NearbyContradictsCurrent() then
    return true
  end
  -- 和旁边黄字同一套号。能写成「位面二」时，角上就不能还是问号。
  local mapped = self.NwbLayerNum and self:NwbLayerNum(cur)
  if not mapped or mapped <= 0 then
    return true
  end
  return false
end

function H:IsMyDisplayedLayer(raw)
  if self:LayerUnreliable() then
    return false
  end
  return self:SameNwbLayer(raw, self.currentRawLayer)
end

function H:ApplyLayerVotes(votes)
  self:RememberDisplayVotes(votes)
  if self:ZoneRecognizeHeld() or self:HopRecognizeHeld() then
    if self.UpdateLayerIcon then
      self:UpdateLayerIcon()
    end
    return false
  end
  local raw = self:PickLayerFromVotes(votes)
  if raw then
    self._needFreshVotes = false
    self:SetCurrentLayer(raw)
    return true
  end
  if self._needFreshVotes then
    local cur = tonumber(self.currentRawLayer)
    local curN = 0
    for r, n in pairs(votes or {}) do
      r = tonumber(r)
      n = tonumber(n) or 0
      if cur and r and n > 0 and self:SameNwbLayer(r, cur) then
        curN = curN + n
      end
    end
    if curN > 0 then
      self._needFreshVotes = false
    end
  end
  if self.UpdateLayerIcon then
    self:UpdateLayerIcon()
  end
  return false
end

function H:NeedsLayerProbe()
  return not self.currentRawLayer
end

-- 正式服：别的地图两小时内占着的号，不拿来改当前层（会抖、会卡）
function H:RetailVoteAllowed(raw)
  if not (self.IsRetailClient and self:IsRetailClient()) then
    return true
  end
  raw = tonumber(raw)
  if not raw or raw <= 0 then
    return false
  end
  if not (self.RetailZoneOwnedElsewhere and self.RetailMapId and self.RetailStamp) then
    return true
  end
  local mapId = self:RetailMapId()
  local now = self:RetailStamp()
  if not mapId or not now then
    return true
  end
  return not self:RetailZoneOwnedElsewhere(mapId, raw, now)
end

function H:TallyUnitLayer(unit, votes, seenGuid)
  if not unit or type(votes) ~= "table" or type(seenGuid) ~= "table" then
    return
  end
  local ok, raw, guid = pcall(function()
    if not UnitExists(unit) then
      return nil, nil
    end
    if UnitIsPlayer(unit) then
      return nil, nil
    end
    local g = UnitGUID(unit)
    if not H:IsReadableGuid(g) then
      return nil, nil
    end
    return H:ExtractRawLayer(g), g
  end)
  if not ok or not raw or not guid then
    return
  end
  if seenGuid[guid] then
    return
  end
  if not self:RetailVoteAllowed(raw) then
    return
  end
  seenGuid[guid] = true
  votes[raw] = (votes[raw] or 0) + 1
  if self._nwbCreateScan and self._nwbCreateNpcs then
    local parts = splitGuid(guid)
    local npcID = parts and tonumber(parts[6])
    if npcID and self._nwbCreateNpcs[npcID] and self.NwbCopyCreateLayer then
      self:NwbCopyCreateLayer(raw)
    end
  end
end

-- 收集附近怪的位面票（不改当前线）
function H:CollectLayerVotes()
  local votes = {}
  local seenGuid = {}
  local function tally(unit)
    self:TallyUnitLayer(unit, votes, seenGuid)
  end
  tally("target")
  tally("mouseover")
  tally("focus")
  tally("pet")
  for i = 1, 40 do
    tally("nameplate" .. i)
  end
  return votes
end

-- 尽量多扫：姓名板 / 目标 / 鼠标指向等；同一 GUID 只计 1 票，再多数决
-- 求切核对仍走这一把。平时认层走 ScanNearbySlice，避免一帧扫 40 块板。
function H:ScanNearby()
  self._nwbCreateScan = false
  self._nwbCreateNpcs = nil
  if self.NwbOwnsLayerNumbers and self:NwbOwnsLayerNumbers() then
    -- 有轻歌花：只认层，不起层
  elseif self.NwbCopyMap and self.MyMapId and self.NwbCopyNpcs
    and self:MyMapId() == self:NwbCopyMap() then
    self._nwbCreateScan = true
    self._nwbCreateNpcs = self:NwbCopyNpcs()
  end
  local votes = self:CollectLayerVotes()
  self._nwbCreateScan = false
  self._nwbCreateNpcs = nil
  self:ApplyLayerVotes(votes)
  return votes
end

-- 每 0.1 秒只扫一小撮姓名板，凑齐一轮再认层
function H:ScanNearbySlice()
  if self.IsHopConfirming and self:IsHopConfirming() then
    return
  end
  if self.ZoneRecognizeHeld and self:ZoneRecognizeHeld() then
    return
  end
  local start = tonumber(self._scanPlateI) or 1
  if start <= 1 and not self._sliceVotes then
    local now = self:Now()
    local gap = tonumber(self.currentRawLayer) and (self.SCAN_TICK or 1.5) or (self.SCAN_TICK_FAST or 0.6)
    if (self._scanRoundAt or 0) + gap > now then
      return
    end
    self._scanRoundAt = now
  end
  local slice = tonumber(self.SCAN_SLICE) or 8
  if start < 1 then
    start = 1
  end
  if start == 1 or not self._sliceVotes then
    self._sliceVotes = {}
    self._sliceSeen = {}
    local votes, seen = self._sliceVotes, self._sliceSeen
    self:TallyUnitLayer("target", votes, seen)
    self:TallyUnitLayer("mouseover", votes, seen)
    self:TallyUnitLayer("focus", votes, seen)
    self:TallyUnitLayer("pet", votes, seen)
    if self.NwbCopyOnUnit then
      pcall(function()
        H:NwbCopyOnUnit("target")
        H:NwbCopyOnUnit("mouseover")
      end)
    end
  end
  local votes = self._sliceVotes
  local seen = self._sliceSeen
  local last = start + slice - 1
  if last > 40 then
    last = 40
  end
  for i = start, last do
    self:TallyUnitLayer("nameplate" .. i, votes, seen)
  end
  if last >= 40 then
    self._scanPlateI = 1
    self:ApplyLayerVotes(votes)
    if self.NoteLayerVotes then
      pcall(function()
        H:NoteLayerVotes(votes)
      end)
    end
    self._sliceVotes = nil
    self._sliceSeen = nil
  else
    self._scanPlateI = last + 1
  end
end

-- 姓名板成批出现时不要每只都整表重扫。换图的 3 秒内先不扫。
function H:ScanNearbyThrottled()
  if self.ZoneRecognizeHeld and self:ZoneRecognizeHeld() and not (self.IsHopConfirming and self:IsHopConfirming()) then
    return
  end
  local now = self:Now()
  local gap = tonumber(self.currentRawLayer) and 4 or 1.2
  if (self._unitScanAt or 0) + gap > now then
    return
  end
  self._unitScanAt = now
  self:ScanNearby()
end

function H:OnCombatLogForLayer()
  local ok, info = pcall(function()
    return { CombatLogGetCurrentEventInfo() }
  end)
  if not ok or type(info) ~= "table" or not info[1] then
    return
  end
  self:ObserveGuid(info[4])
  self:ObserveGuid(info[8])
end

-- 已废弃：用 SetCVar 强开姓名板也会在污染时弹保护窗；改只扫当前已有姓名板
function H:SaveNameplateCVars()
  return {}
end

function H:RestoreNameplateCVars(_saved)
end

function H:ProbeViaNameplates(done)
  -- 与 ScanNearby 同一套：按 GUID 去重 + 粘住当前线
  local votes = {}
  local seenGuid = {}
  for i = 1, 40 do
    local unit = "nameplate" .. i
    local ok, raw, guid = pcall(function()
      if not UnitExists(unit) or UnitIsPlayer(unit) then
        return nil, nil
      end
      local g = UnitGUID(unit)
      if not H:IsReadableGuid(g) then
        return nil, nil
      end
      return H:ExtractRawLayer(g), g
    end)
    if ok and raw and guid and not seenGuid[guid] then
      seenGuid[guid] = true
      votes[raw] = (votes[raw] or 0) + 1
    end
  end
  self:ApplyLayerVotes(votes)
  if done then
    done()
  end
end

-- 已废弃自动「选最近目标」探测：TargetNearest*/ClearTarget 是保护功能
function H:ProbeViaNearestTarget(done)
  if done then
    done()
  end
end

function H:ArmScanTicker(gap)
  if self._scanArmed then
    return
  end
  self._scanArmed = true
  C_Timer.After(tonumber(gap) or 1.5, function()
    H._scanArmed = false
    if H._scanTickFn then
      H._scanTickFn()
    end
  end)
end

function H:EnsureScanTicker()
  -- 平时不扫。只有求切核对那几秒才扫身边怪，确认有没有换面。
  if not (self.IsHopConfirming and self:IsHopConfirming()) then
    return
  end
  if self._scanTickFn then
    if not self._scanArmed then
      self:ArmScanTicker(0.2)
    end
    return
  end
  local function tick()
    if not H.db then
      return
    end
    if not (H.IsHopConfirming and H:IsHopConfirming()) then
      return
    end
    pcall(function()
      H:ScanNearby()
    end)
    H:ArmScanTicker(0.5)
  end
  self._scanTickFn = tick
  self:ArmScanTicker(0.2)
end

function H:EnsureLayerProbe()
  if self.IsOnTransit and self:IsOnTransit() then
    return
  end
  if self.IsInInstance and self:IsInInstance() then
    return
  end
  self._scanPlateI = 1
  self._sliceVotes = nil
  self._sliceSeen = nil
end

function H:OnZoneChangedForLayer()
  self._probeAt = 0
  self._scanPlateI = 1
  self._sliceVotes = nil
  self._mapIdCache = nil
  self._needFreshVotes = true
  -- 换了大图：房间必须跟着走。还停在上一张图的房里，会一直收到那张图的报线。
  if self.RoomsEnabled and self:RoomsEnabled() and self.MaintainRooms then
    C_Timer.After(0.4, function()
      pcall(function()
        H:MaintainRooms(false)
      end)
    end)
  end
  self._hopStickyRaw = nil
  self._hopStickyFrom = nil
  self._hopStickyUntil = 0
  if not (self.IsHopConfirming and self:IsHopConfirming()) then
    self._hopRecognizeUntil = 0
  else
    self._hopRecognizeUntil = self:Now() + 3
  end
  local keep = tonumber(self.currentRawLayer)
  if not keep or keep <= 0 then
    -- 还没有层：图标先出。认层跟轻歌花一样，等你点中或指到一只怪。
    self:UpdateLayerIcon()
    if self.ScheduleRefreshUI then
      self:ScheduleRefreshUI(0.1)
    elseif self.RefreshUI then
      self:RefreshUI()
    end
    C_Timer.After(1.2, function()
      pcall(function()
        H:EnsureLayerProbe()
        if H.ScheduleRefreshUI then
          H:ScheduleRefreshUI(0.1)
        end
      end)
    end)
    C_Timer.After(3.0, function()
      pcall(function()
        if H:NeedsLayerProbe() then
          H:EnsureLayerProbe()
        end
        if H.ScheduleRefreshUI then
          H:ScheduleRefreshUI(0.1)
        end
      end)
    end)
    return
  end
  -- 已经认过层：内部先留着，房间不进没编号的那间。这 3 秒图标只显示问号。
  self._zoneRecognizeAt = self:Now() + 3
  self._zoneRecognizeToken = (self._zoneRecognizeToken or 0) + 1
  local token = self._zoneRecognizeToken
  if self.Trace then
    self:Trace("换了地图，3秒后再认层")
  end
  self:UpdateLayerIcon()
  -- 换图先不整表重画。来回切时每次重数人会卡。停在这张图 3 秒后只刷一次。
  C_Timer.After(3, function()
    if H._zoneRecognizeToken ~= token then
      return
    end
    H._zoneRecognizeAt = 0
    H._scanPlateI = 1
    pcall(function()
      H:EnsureLayerProbe()
      if H.ScheduleRefreshUI then
        H:ScheduleRefreshUI(0.1)
      end
    end)
  end)
end

-- 返回「N分钟之前在该位面」；超过 99 分返回 nil（不显示这句）
function H:PeerAgeOnLayerText(lastSeen)
  lastSeen = tonumber(lastSeen) or 0
  if not self:IsWallStamp(lastSeen) then
    return nil
  end
  local mins = math.floor((self:WallNow() - lastSeen) / 60)
  if mins > 99 then
    return nil
  end
  if mins < 1 then
    mins = 1
  end
  return mins .. "分钟之前在该位面"
end

function H:PlayersOnLayer(raw)
  raw = tonumber(raw)
  local now = self:WallNow()
  local mem = self.PEER_UI_TTL or (99 * 60)
  local list = {}
  local me = self:PlayerFullName()
  if raw and not (self.LayerUnreliable and self:LayerUnreliable())
    and self:SameNwbLayer(raw, self.currentRawLayer) then
    table.insert(list, { name = me, short = "你", mine = true, canHost = false })
  end
  for name, peer in pairs(self.db.peers or {}) do
    -- 列表人数：任何渠道记到的人，按其所在位面显示（不限当前位面/当前大图）。
    -- 点求切：去点的那一行地图问人（GetFairHosts + hopMap）。
    if self:SameNwbLayer(peer.raw, raw) and not self:IsSelfName(name)
      and self:IsWallStamp(peer.last) and (now - (peer.last or 0)) <= mem then
      local showAs = peer.replyAs or name
      table.insert(list, {
        name = name,
        short = self:ShortName(showAs),
        mine = false,
        skip = self:IsSkipped(name),
        canHost = self:PeerCanHost(name, peer),
        ageText = self:PeerAgeOnLayerText(peer.last),
      })
    end
  end
  table.sort(list, function(a, b)
    if a.mine ~= b.mine then
      return a.mine
    end
    return (a.short or "") < (b.short or "")
  end)
  return list
end

-- 可点「求切」：只要还有记得的候选人（真正能不能帮要点下去 PING）
function H:CountLayerCandidates(raw)
  return #(self:ListLayerCandidates(raw) or {})
end

-- 黄字按 1、2、3、4、5 排在最前。没排上号的仍按原来的顺序。
-- 暂停时当前层会先放进去，房间层是后补的，所以必须在整表凑齐后再排一次。
function H:SortKnownLayerList(list, skipMaps)
  if type(list) ~= "table" or #list < 2 then
    return list
  end
  local now = self:WallNow()
  local myMap = self:MyMapId()
  local mapRank = {}
  local function layerMapRank(raw)
    raw = tonumber(raw)
    if not raw then
      return 3
    end
    if mapRank[raw] ~= nil then
      return mapRank[raw]
    end
    local best = 3
    for name, peer in pairs(self.db.peers or {}) do
      if peer and self:SameNwbLayer(peer.raw, raw) and not self:IsSelfName(name)
        and self:IsWallStamp(peer.last) and now - (peer.last or 0) <= (self.PEER_UI_TTL or (99 * 60)) then
        local r = self:MapRelation(myMap, peer.map)
        if r < best then
          best = r
          if best == 0 then
            break
          end
        end
      end
    end
    mapRank[raw] = best
    return best
  end
  local function mappedNum(raw)
    local n = self.NwbLayerNum and self:NwbLayerNum(raw)
    if n and n > 0 then
      return n
    end
    return nil
  end
  table.sort(list, function(a, b)
    local maNum = mappedNum(a.raw)
    local mbNum = mappedNum(b.raw)
    if maNum and mbNum and maNum ~= mbNum then
      return maNum < mbNum
    end
    if maNum and not mbNum then
      return true
    end
    if mbNum and not maNum then
      return false
    end
    if a.mine ~= b.mine then
      return a.mine and true or false
    end
    if skipMaps then
      return (tonumber(a.raw) or 0) < (tonumber(b.raw) or 0)
    end
    local ra = layerMapRank(a.raw)
    local rb = layerMapRank(b.raw)
    if ra ~= rb then
      return ra < rb
    end
    local na = #(a.players or {})
    local nb = #(b.players or {})
    if na ~= nb then
      return na > nb
    end
    local ma = self:MyLayerMinutesAgo(a.raw)
    local mb = self:MyLayerMinutesAgo(b.raw)
    local va = ma or 1000000
    local vb = mb or 1000000
    if va ~= vb then
      return va > vb
    end
    return (tonumber(a.raw) or 0) < (tonumber(b.raw) or 0)
  end)
  return list
end

function H:ListKnownLayers(skipPlayers)
  local now = self:WallNow()
  local seen = {}
  local list = {}

  local function add(raw)
    raw = tonumber(raw)
    if not raw then
      return
    end
    -- 经典60只列出已排成 1/2/3 的层。对不上号的不当成新层（NWB 也不会）。
    -- 其余版本不排号，编号照样列出。
    local rank = self.UsesNwbLayerRank and self:UsesNwbLayerRank()
    if rank then
      local n = self.NwbLayerNum and self:NwbLayerNum(raw)
      if not n or n <= 0 then
        return
      end
    end
    local canon = rank and (self:NwbCanonicalRaw(raw) or raw) or raw
    if seen[canon] then
      return
    end
    seen[canon] = true
    self:EnsureSeenLayer(canon)
    local players = skipPlayers and {} or self:PlayersOnLayer(canon)
    table.insert(list, {
      raw = canon,
      label = self:LabelForRaw(canon),
      players = players,
      mine = self:IsMyDisplayedLayer(canon),
    })
  end

  -- 暂停：只能看到当前位面
  if self:IsPaused() then
    if self.currentRawLayer then
      add(self.currentRawLayer)
    end
    return list
  end

  if self.currentRawLayer then
    add(self.currentRawLayer)
  end
  for rawStr, info in pairs(self.db.seenLayers or {}) do
    if self:IsWallStamp(info.last) and now - (info.last or 0) <= self.LAYER_TTL then
      add(tonumber(rawStr))
    end
  end
  for _, peer in pairs(self.db.peers or {}) do
    if peer.raw and self:IsWallStamp(peer.last) and now - (peer.last or 0) <= self.PEER_UI_TTL then
      add(tonumber(peer.raw))
    end
  end

  self:SortKnownLayerList(list, skipPlayers)
  return list
end

-- 开着名单：同一份人数短时共用。禁止每画一行就把库里的人扫一遍。
function H:BuildPaintPeerBuckets()
  local now = self:WallNow()
  local mem = self.PEER_UI_TTL or (15 * 60)
  local myMap = self:MyMapId()
  local buckets = {}
  local hopSetByCanon = {}
  local function hopSet(canon)
    local s = hopSetByCanon[canon]
    if s == nil then
      s = self:LayerRawsForMap(canon, myMap)
      if not s or not next(s) then
        s = false
      end
      hopSetByCanon[canon] = s
    end
    return s
  end
  for name, peer in pairs(self.db.peers or {}) do
    if peer and not self:IsSelfName(name)
      and self:IsWallStamp(peer.last) and (now - (peer.last or 0)) <= mem then
      -- 名单展示：所有位面的人都计入；同图只影响 sameMap/可求切染色
      local raw = tonumber(peer.raw)
      if raw then
        local canon = self:NwbCanonicalRaw(raw) or raw
        local b = buckets[canon]
        if not b then
          b = { raw = canon, nPeople = 0, nCan = 0, sameMap = false }
          buckets[canon] = b
        end
        b.nPeople = b.nPeople + 1
        local sameMapPeer = self:MapRelation(myMap, peer.map) == 0
        local set = hopSet(canon)
        local onTarget
        if set then
          onTarget = set[raw] == true
        else
          onTarget = self:SameNwbLayer(raw, canon)
        end
        if onTarget and self:PeerCanHost(name, peer) then
          b.nCan = b.nCan + 1
        end
        if not b.sameMap and sameMapPeer and self:PeerCanHost(name, peer) then
          b.sameMap = true
        end
      end
    end
  end
  return buckets
end

function H:AttachPaintStats(layers, buckets)
  buckets = buckets or {}
  for _, item in ipairs(layers or {}) do
    local raw = tonumber(item.raw)
    local canon = raw and (self:NwbCanonicalRaw(raw) or raw) or nil
    local b = (raw and buckets[raw]) or (canon and buckets[canon]) or nil
    local nPeople = b and b.nPeople or 0
    if raw and self:IsMyDisplayedLayer(raw) then
      nPeople = nPeople + 1
    end
    item.nCan = b and b.nCan or 0
    item.sameMap = b and b.sameMap or false
    if self.HeadCountForRaw and self.RoomsEnabled and self:RoomsEnabled() then
      item.headCount = self:HeadCountForRaw(raw, nPeople)
    else
      item.headCount = nPeople
    end
    item.players = nil
  end
end

function H:GetPaintSnapshot()
  local now = self:Now()
  local snap = self._paintSnap
  if snap and (now - (snap.at or 0)) < 0.4 then
    return snap
  end
  local skipNames = not (self.IsForeverClient and self:IsForeverClient())
  local layers = self:ListKnownLayers(skipNames)
  -- 无限 ListForeverRows 已按「各图|各位面」把人凑进行；再 Attach 会按当前大图把别位人数清掉
  if not (self.IsForeverClient and self:IsForeverClient()) then
    local buckets = self:BuildPaintPeerBuckets()
    self:AttachPaintStats(layers, buckets)
  end
  snap = { at = now, layers = layers }
  self._paintSnap = snap
  return snap
end

-- 求切找人（点「求切」专用，与名单展示分开）：
-- 去「那张图」问人：opts.hopMap / _hopAllowMap 指点的那一行地图。
-- 图内优先级：互助 > 时空之门 → 刚报过线 → 更少被问过。
-- opts.live=true 表示刚核实过在线。
function H:GetFairHosts(targetRaw, opts)
  targetRaw = tonumber(targetRaw)
  opts = opts or {}
  if not targetRaw then
    return {}
  end
  local askMap = tonumber(opts.hopMap) or tonumber(self._hopAllowMap) or 0
  local myMap = self:MyMapId()
  if askMap > 0 then
    myMap = askMap
  elseif self.IsForeverClient and self:IsForeverClient() and self.HomeCanonMap then
    local home = self:HomeCanonMap()
    if type(home) == "number" and home > 0 then
      myMap = home
    end
  end
  local sameMap, otherMap = {}, {}
  local mustSame = self.RequiresSameMapForHop and self:RequiresSameMapForHop()
  local hostOpts = opts
  if askMap > 0 and not opts.hopMap then
    hostOpts = {}
    for k, v in pairs(opts) do
      hostOpts[k] = v
    end
    hostOpts.hopMap = askMap
  end
  for name, peer in pairs(self.db.peers or {}) do
    if self:PeerMatchesHopTarget(peer, targetRaw) and self:PeerCanHost(name, peer, hostOpts) then
      local st = self:GetAskStat(name)
      local lastSeen = 0
      if self:IsWallStamp(peer.last) then
        lastSeen = tonumber(peer.last) or 0
      end
      local onAsk
      if self.SameHoppableMap then
        onAsk = self:SameHoppableMap(myMap, peer.map) and true or false
      else
        onAsk = self:MapRelation(myMap, peer.map) == 0
      end
      local row = {
        name = name,
        lastAsk = st.lastAsk or 0,
        lastSeen = lastSeen,
        rel = onAsk and 0 or 1,
        ours = self:PeerIsHzl(peer),
      }
      if onAsk then
        table.insert(sameMap, row)
      elseif not mustSame then
        table.insert(otherMap, row)
      end
    end
  end
  local function byFreshThenAsk(a, b)
    if a.lastSeen ~= b.lastSeen then
      return a.lastSeen > b.lastSeen
    end
    if a.lastAsk ~= b.lastAsk then
      return a.lastAsk < b.lastAsk
    end
    return a.name < b.name
  end
  local function byOursThenFresh(a, b)
    if a.ours ~= b.ours then
      return a.ours
    end
    return byFreshThenAsk(a, b)
  end
  -- 先那张图上的人；图内再按互助→新近→少问过
  table.sort(sameMap, byOursThenFresh)
  table.sort(otherMap, function(a, b)
    if a.ours ~= b.ours then
      return a.ours
    end
    if a.rel ~= b.rel then
      return a.rel < b.rel
    end
    return byFreshThenAsk(a, b)
  end)
  local names = {}
  for _, c in ipairs(sameMap) do
    table.insert(names, c.name)
  end
  for _, c in ipairs(otherMap) do
    table.insert(names, c.name)
  end
  return names
end

-- 求切按钮：这一层有没有人和你在同一张图（只看已经报到的位置）
function H:LayerHasSameMapHost(targetRaw)
  local names = self:GetFairHosts(targetRaw)
  local name = names and names[1]
  if not name or not self.db or not self.db.peers then
    return false
  end
  local peer = self.db.peers[name]
  if not peer then
    return false
  end
  return self:MapRelation(self:MyMapId(), peer.map) == 0
end

local H = HuZhuLayer

-- 认层仍开。2026-11-06 起房间和互助公告去掉，只留最初的互助切位面。
H.HZL_NOTICE = "互助公告"

function H:LayerMeshOn()
  return not self:IsRetailClient()
end

function H:RoomsEnabled()
  return false
end

function H:LayerBookLimits()
  local k = self:ClientKind()
  if k == "classic_era" or k == "forever" or k == "titan" then
    return 10, 10800, true
  end
  return 20, 7200, false
end

function H:CapitalMapIds()
  -- 经典怀旧到巫妖王是暴风城 1453、奥格瑞玛 1454；大地的裂变往后是 84、85。
  -- 两边都认，避免某个版本用错号就永远认不出主城。
  return { [1453] = true, [1454] = true, [84] = true, [85] = true }
end

function H:LayerBook()
  self.db.layerBook = self.db.layerBook or {}
  local realm, fac = "?", "?"
  pcall(function()
    realm = GetRealmName() or "?"
  end)
  pcall(function()
    fac = UnitFactionGroup("player") or "?"
  end)
  local key = tostring(realm) .. "|" .. tostring(fac)
  local book = self.db.layerBook[key]
  if type(book) ~= "table" then
    book = { cap = {}, wild = {}, joined = 0 }
    self.db.layerBook[key] = book
  end
  book.cap = book.cap or {}
  book.wild = book.wild or {}
  return book
end

function H:HasLiveNwb()
  local keys = self:GetNwbLayerCache().keys
  return type(keys) == "table" and #keys > 0
end

-- 全服已经有一份轻歌花对照表（本机或公告听来的）才跟它对齐。
-- 只装着插件、表还是空的：按轻歌花的方法自己画，不停掉。
function H:NwbOwnsLayerNumbers()
  return self:HasLiveNwb() and true or false
end

function H:NameHash(name)
  local h = 0
  local s = tostring(name or "")
  for i = 1, #s do
    h = (h * 33 + string.byte(s, i)) % 1000003
  end
  return h
end

function H:RoomIndexFor(name, _layer, roomCount)
  roomCount = math.max(1, tonumber(roomCount) or 1)
  return (self:NameHash(name) % roomCount) + 1
end

function H:RoomPlanKey(layerNum, canonMap)
  return tostring(layerNum or 0) .. "m" .. tostring(canonMap or 0)
end

function H:HomeCanonMap()
  if self.IsHoppableHere and not self:IsHoppableHere() then
    return 0
  end
  local canon = self.CanonMapId and self:CanonMapId(self:MyMapId()) or 0
  if canon <= 0 then
    return 0
  end
  return canon
end

function H:RoomCountFor(layerNum, canonMap)
  local bag = self.db and self.db.roomPlan
  local key = self:RoomPlanKey(layerNum, canonMap)
  local row = bag and bag[key]
  local n = row and tonumber(row.rooms) or 1
  if n < 1 then
    n = 1
  end
  if n > 30 then
    n = 30
  end
  return n
end

function H:RoomChannelName(layerNum, roomIdx, canonMap)
  canonMap = tonumber(canonMap)
  if not canonMap or canonMap < 0 then
    canonMap = self:HomeCanonMap()
  end
  return "互助房" .. tostring(layerNum or 0) .. "m" .. tostring(canonMap or 0) .. "x" .. tostring(roomIdx or 1)
end

function H:DesiredHome()
  if self.IsForeverClient and self:IsForeverClient() then
    local canon = self:HomeCanonMap()
    if canon > 0 then
      return self:RoomChannelName(0, 1, canon), 0, 1, 1, canon
    end
  end
  local num = 0
  if tonumber(self.currentRawLayer) then
    num = self:NwbLayerNum(self.currentRawLayer) or 0
  end
  local canon = self:HomeCanonMap()
  local rooms = self:RoomCountFor(num, canon)
  local idx = self:RoomIndexFor(self:PlayerFullName(), num, rooms)
  return self:RoomChannelName(num, idx, canon), num, idx, rooms, canon
end

function H:NpcIdFromGuid(guid)
  if not guid or type(guid) ~= "string" then
    return nil
  end
  local ok, npc = pcall(function()
    local parts = { strsplit("-", guid) }
    if parts[1] ~= "Creature" and parts[1] ~= "Vehicle" then
      return nil
    end
    return tonumber(parts[6])
  end)
  if ok then
    return npc
  end
  return nil
end

function H:ExpireBook(book, now)
  local _, expire = self:LayerBookLimits()
  now = now or self:WallNow()
  for id, seen in pairs(book.cap or {}) do
    if now - (tonumber(seen) or 0) > expire then
      book.cap[id] = nil
    end
  end
  for id, w in pairs(book.wild or {}) do
    if type(w) ~= "table" or not book.cap[tostring(w.cap)] or now - (tonumber(w.seen) or 0) > expire then
      book.wild[id] = nil
    end
  end
  for mapId, raws in pairs(book.obs or {}) do
    if type(raws) ~= "table" then
      book.obs[mapId] = nil
    else
      for id, seen in pairs(raws) do
        if now - (tonumber(seen) or 0) > expire then
          raws[id] = nil
        end
      end
      if not next(raws) then
        book.obs[mapId] = nil
      end
    end
  end
end

function H:IsLayerMap(mapId)
  mapId = tonumber(mapId)
  if not mapId or mapId <= 0 then
    return false
  end
  if self:CapitalMapIds()[mapId] then
    return true
  end
  if self:IsDungeonMap(mapId) then
    return false
  end
  if not C_Map or not C_Map.GetMapInfo then
    return true
  end
  local info = C_Map.GetMapInfo(mapId)
  if not info or not info.mapType then
    return true
  end
  local zone = (Enum and Enum.UIMapType and Enum.UIMapType.Zone) or 3
  return info.mapType == zone
end

function H:RememberLayerObs(mapId, raw)
  mapId = tonumber(mapId)
  raw = tonumber(raw)
  if not self:IsLayerMap(mapId) or not raw or raw <= 0 then
    return
  end
  local book = self:LayerBook()
  book.obs = book.obs or {}
  local mk = tostring(mapId)
  book.obs[mk] = book.obs[mk] or {}
  book.obs[mk][tostring(raw)] = self:WallNow()
end

function H:IsRulerMap(mapId)
  mapId = tonumber(mapId)
  local book = self.db and self:LayerBook()
  if not mapId or not book then
    return false
  end
  if book.ruler == "capital" then
    return self:CapitalMapIds()[mapId] and true or false
  end
  return tonumber(book.rulerMap) == mapId
end

function H:CanPublishOwnRuler()
  if self._bookSrc == "N" and self._bookKeys and #self._bookKeys > 0 then
    return false
  end
  if self.MeshAmElect and self:MeshAmElect(false) then
    return true
  end
  local at = tonumber(self._bookRemoteAt) or 0
  if at > 0 and (self:Now() - at) < 180 then
    return false
  end
  return true
end

function H:PublishOwnRuler()
  if not self:CanPublishOwnRuler() then
    return
  end
  local keys, pairsList = self:BookShareParts()
  if not keys or #keys == 0 then
    return
  end
  local payload = self:SharePayload(keys, pairsList)
  if payload == self._rulerPayload and self._bookSrc == "S" then
    return
  end
  self._rulerPayload = payload
  self:ApplySharePayload("S", payload)
end

function H:RebuildLayerRuler()
  if self.NwbCopySyncBook then
    self:NwbCopySyncBook()
  end
end

function H:CurrentCapitalId(book)
  local raw = tonumber(self.currentRawLayer)
  if not raw or not book then
    return nil
  end
  local key = tostring(raw)
  if book.cap[key] then
    return raw
  end
  local w = book.wild[key]
  if type(w) == "table" and book.cap[tostring(w.cap)] then
    return tonumber(w.cap)
  end
  return nil
end

function H:NoteLayerSight(raw, mapId, npcId)
  if not self:LayerMeshOn() or not self.db or self:NwbOwnsLayerNumbers() then
    return
  end
  raw = tonumber(raw)
  mapId = tonumber(mapId)
  if not raw or raw <= 0 or not mapId or mapId <= 0 then
    return
  end
  if self:IsInInstance() then
    return
  end
  if self.IsOnTransit and self:IsOnTransit() then
    return
  end
  self:RememberLayerObs(mapId, raw)
  self:RebuildLayerRuler()
end

function H:NoteLayerVotes(votes)
  if not self:LayerMeshOn() or self:NwbOwnsLayerNumbers() then
    return
  end
  if not self._nwbBookDirty then
    return
  end
  local now = self:Now()
  if (self._nwbCopySyncAt or 0) + 5 > now then
    return
  end
  self._nwbCopySyncAt = now
  self._nwbBookDirty = false
  if self.NwbCopySyncBook then
    self:NwbCopySyncBook()
  end
end

function H:BookShareParts()
  local book = self:LayerBook()
  self:ExpireBook(book, self:WallNow())
  local keys = {}
  for id in pairs(book.cap or {}) do
    local n = tonumber(id)
    if n and n > 0 then
      keys[#keys + 1] = n
    end
  end
  table.sort(keys)
  local index = {}
  for i, id in ipairs(keys) do
    index[id] = i
  end
  local pairsList = {}
  for id, w in pairs(book.wild or {}) do
    local z = tonumber(id)
    local c = type(w) == "table" and tonumber(w.cap) or nil
    if z and c and index[c] and not index[z] then
      pairsList[#pairsList + 1] = tostring(z) .. ":" .. tostring(c)
    end
  end
  table.sort(pairsList)
  return keys, pairsList
end

function H:NwbShareParts()
  local cache = self:GetNwbLayerCache()
  local keys = {}
  for _, id in ipairs(cache.keys or {}) do
    local n = tonumber(id)
    if n and n > 0 then
      keys[#keys + 1] = n
    end
  end
  local pairsList = {}
  local layers = cache.layers
  if type(layers) == "table" then
    for _, cap in ipairs(keys) do
      local row = layers[cap] or layers[tostring(cap)]
      local lm = row and row.layerMap
      if type(lm) == "table" then
        for zid in pairs(lm) do
          local z = tonumber(zid)
          if z and z > 0 and z ~= cap then
            pairsList[#pairsList + 1] = tostring(z) .. ":" .. tostring(cap)
          end
        end
      end
    end
  end
  table.sort(pairsList)
  return keys, pairsList
end

function H:ApplySharePayload(src, payload)
  if type(payload) ~= "string" or payload == "" then
    return
  end
  local slash = payload:find("/", 1, true)
  local capPart = slash and payload:sub(1, slash - 1) or payload
  local wildPart = slash and payload:sub(slash + 1) or ""
  local keys = {}
  if capPart ~= "" then
    for id in string.gmatch(capPart, "[^,]+") do
      local n = tonumber(id)
      if n and n > 0 then
        keys[#keys + 1] = n
      end
    end
  end
  table.sort(keys)
  if #keys == 0 then
    return
  end
  local function keySig(list)
    local parts = {}
    for i, id in ipairs(list or {}) do
      parts[i] = tostring(id)
    end
    return table.concat(parts, ",")
  end
  local prevSig = keySig(self._bookKeys)
  local nextSig = keySig(keys)
  if prevSig ~= "" and prevSig ~= nextSig and self.ClearLayerHopCooldowns then
    -- 黄字 1、2、3 重排之后，原来的冷却对不上新号，全部取消
    self:ClearLayerHopCooldowns()
  end
  local index = {}
  for i, id in ipairs(keys) do
    index[id] = i
  end
  if wildPart ~= "" then
    for pair in string.gmatch(wildPart, "[^,]+") do
      local z, c = pair:match("^(%d+):(%d+)$")
      z, c = tonumber(z), tonumber(c)
      if z and c and index[c] and not index[z] then
        index[z] = index[c]
      end
    end
  end
  self._bookSrc = src
  self._bookKeys = keys
  self._bookMap = index
  self._bookAt = self:Now()
  if self.TraceIfChanged then
    local shown = {}
    for i = 1, math.min(#keys, 6) do
      shown[i] = tostring(keys[i])
    end
    self:TraceIfChanged(
      "book" .. tostring(src),
      string.format(
        "位面表%s %d层：%s%s",
        src == "N" and "跟NWB" or "自己认的",
        #keys,
        table.concat(shown, ","),
        #keys > 6 and "…" or ""
      )
    )
  end
  if self.RefreshUI then
    self:RefreshUI()
  end
end

function H:SharePayload(keys, pairsList)
  local caps = {}
  for i, id in ipairs(keys or {}) do
    caps[i] = tostring(id)
  end
  return table.concat(caps, ",") .. "/" .. table.concat(pairsList or {}, ",")
end

function H:MeshMarkSelf()
  local me = self:PlayerFullName()
  if not me then
    return
  end
  self._meshSeen = self._meshSeen or {}
  self._meshSeen[me] = { at = self:Now(), nwb = self:HasLiveNwb() }
end

function H:MeshAmElect(needNwb)
  local me = self:PlayerFullName()
  if not me then
    return false
  end
  self:MeshMarkSelf()
  local now = self:Now()
  local anyNwb = self:HasLiveNwb()
  for _, info in pairs(self._meshSeen or {}) do
    if info and info.nwb and (now - (info.at or 0)) < 180 then
      anyNwb = true
      break
    end
  end
  if needNwb then
    if not self:HasLiveNwb() then
      return false
    end
    local best = me
    for name, info in pairs(self._meshSeen or {}) do
      if info and info.nwb and (now - (info.at or 0)) < 180 and name < best then
        best = name
      end
    end
    return best == me
  end
  if anyNwb then
    return false
  end
  local best = me
  for name, info in pairs(self._meshSeen or {}) do
    if info and (now - (info.at or 0)) < 180 and name < best then
      best = name
    end
  end
  return best == me
end

function H:SendOnChannelName(name, msg)
  local id = self:JoinSilentChannel(name)
  if id and msg then
    self:SendAddon(msg, "CHANNEL", id)
  end
end

function H:BuildLayerShare()
  local src, keys, pairsList
  if self:NwbOwnsLayerNumbers() then
    if not self:HasLiveNwb() then
      return nil
    end
    keys, pairsList = self:NwbShareParts()
    src = "N"
  elseif self._bookSrc == "N" and self._bookKeys and #self._bookKeys > 0 then
    keys = self._bookKeys
    pairsList = {}
    local capAt = {}
    for i, id in ipairs(keys) do
      capAt[id] = i
    end
    for z, layerIdx in pairs(self._bookMap or {}) do
      z = tonumber(z)
      layerIdx = tonumber(layerIdx)
      local cap = layerIdx and keys[layerIdx]
      if z and cap and not capAt[z] then
        pairsList[#pairsList + 1] = tostring(z) .. ":" .. tostring(cap)
      end
    end
    table.sort(pairsList)
    src = "N"
  else
    if self._nwbBookDirty or not self._bookKeys or #self._bookKeys == 0 then
      self:RebuildLayerRuler()
    end
    keys, pairsList = self:BookShareParts()
    src = "S"
  end
  if not keys or #keys == 0 then
    return nil
  end
  return self:SharePayload(keys, pairsList), src
end

function H:FlushLayerTable()
  if not self:LayerMeshOn() or not self.db then
    return
  end
  local payload, src = self:BuildLayerShare()
  if not payload then
    return
  end
  local now = self:Now()
  if payload == self._lytHeardPayload and (now - (self._lytHeardAt or 0)) < 150 then
    return
  end
  if src == "S" and self._lytHeardSrc == "N" and (now - (self._lytHeardAt or 0)) < 180 then
    return
  end
  if payload == self._lytSentPayload and (now - (self._lytSentAt or 0)) < 150 then
    return
  end
  self:ApplySharePayload(src, payload)
  local size = 160
  local parts = {}
  local i = 1
  while i <= #payload do
    parts[#parts + 1] = payload:sub(i, i + size - 1)
    i = i + size
  end
  if #parts == 0 then
    return
  end
  self._lytGen = (self._lytGen or 0) + 1
  for idx, piece in ipairs(parts) do
    local line = string.format("LYT|%d|%d|%d|%s|%s", self._lytGen, idx, #parts, src, piece)
    self:SendOnChannelName(self.HZL_NOTICE, line)
  end
  self._lytSentPayload = payload
  self._lytSentAt = now
  self._lytSentSrc = src
end

function H:MaybeSendLayerTable()
  if not self:LayerMeshOn() or not self.db then
    return
  end
  if self._lytSending then
    return
  end
  local now = self:Now()
  if self._lytFlushAt and self._lytFlushAt > now then
    return
  end
  -- 名单靠本地这张表。表是空的就先补上，跟这次发不发无关。
  if (self._nwbBookDirty or not self._bookKeys or #self._bookKeys == 0) and not self._lytSending then
    self._lytSending = true
    self:RebuildLayerRuler()
    self._lytSending = false
  end
  -- 从没发过不算「一小时内发过」。时间用墙上的钟，不用进游戏后的秒数。
  local wall = self:WallNow()
  local dirty = self._nwbBookDirty and true or false
  local mapAge = self._lytMapSentAt and (wall - self._lytMapSentAt) or 999999
  local turn = ((self._lytSyncN or 0) % 2) == 1
  self._lytSyncN = (self._lytSyncN or 0) + 1
  if not dirty and mapAge < 3600 and not turn then
    return
  end
  self._lytSending = true
  local payload, src = self:BuildLayerShare()
  self._lytSending = false
  if not payload then
    return
  end
  if payload == self._lytHeardPayload and (now - (self._lytHeardAt or 0)) < 150 then
    return
  end
  if src == "S" and self._lytHeardSrc == "N" and (now - (self._lytHeardAt or 0)) < 180 then
    return
  end
  if payload == self._lytSentPayload and (now - (self._lytSentAt or 0)) < 150 then
    return
  end
  local delay = 0.4 + (self:NameHash(self:PlayerFullName() or "") % 20) * 0.1
  self._lytFlushAt = now + delay
  self._lytMapSentAt = self:WallNow()
  C_Timer.After(delay, function()
    H._lytFlushAt = nil
    pcall(function()
      H:FlushLayerTable()
    end)
  end)
end

function H:OnLytComplete(sender, src, payload)
  self._lytHeardAt = self:Now()
  self._lytHeardPayload = payload
  self._lytHeardSrc = src
  local name = self:NormalizeName(self:ReplyName(sender) or sender)
  local me = self:PlayerFullName()
  if src == "N" then
    if self:HasLiveNwb() and me and name and name > me then
      return
    end
    self:ApplySharePayload("N", payload)
    return
  end
  if self._bookSrc == "N" or self:HasLiveNwb() then
    return
  end
  if me and name and name > me then
    return
  end
  if not (me and name and name == me) then
    self._bookRemoteAt = self:Now()
    self._rulerPayload = payload
  end
  self:ApplySharePayload("S", payload)
end

function H:OnLytMessage(sender, msg)
  local parts = { strsplit("|", msg) }
  local gen = tonumber(parts[2])
  local idx = tonumber(parts[3])
  local n = tonumber(parts[4])
  local src = parts[5]
  local piece = parts[6] or ""
  if not gen or not idx or not n or n < 1 or (src ~= "N" and src ~= "S") then
    return
  end
  if n == 1 then
    self:OnLytComplete(sender, src, piece)
    return
  end
  self._lytIn = self._lytIn or {}
  local key = tostring(sender or "?") .. ":" .. tostring(gen)
  local buf = self._lytIn[key]
  if not buf or buf.n ~= n then
    buf = { n = n, src = src, parts = {} }
    self._lytIn[key] = buf
  end
  buf.parts[idx] = piece
  for i = 1, n do
    if not buf.parts[i] then
      return
    end
  end
  self._lytIn[key] = nil
  self:OnLytComplete(sender, src, table.concat(buf.parts, ""))
end

function H:RoomCensus()
  local now = self:WallNow()
  local names = {}
  local me = self:PlayerFullName()
  if me then
    names[#names + 1] = me
  end
  for name, peer in pairs(self.db.peers or {}) do
    if peer and self:SameNwbLayer(peer.raw, self.currentRawLayer) and not self:IsSelfName(name)
      and self:IsWallStamp(peer.last) and (now - (peer.last or 0)) <= 180 then
      if not (self.SameHoppableMap and self:SameHoppableMap(self:MyMapId(), peer.map)) then
        -- 别的大图不进本房人数
      else
        names[#names + 1] = name
      end
    end
  end
  table.sort(names)
  local elect = (not me) or names[1] == me
  return #names, elect
end

function H:NoteRoomReport(layer, room, count, roomsDeclared, canonMap)
  layer = tonumber(layer)
  room = tonumber(room)
  count = tonumber(count)
  roomsDeclared = tonumber(roomsDeclared)
  canonMap = tonumber(canonMap) or 0
  if not layer or not room or not count or canonMap <= 0 then
    return
  end
  self._reports = self._reports or {}
  local bagKey = self:RoomPlanKey(layer, canonMap)
  self._reports[bagKey] = self._reports[bagKey] or {}
  local prev = self._reports[bagKey][room]
  local streak = 0
  local splitAt = self.ROOM_SPLIT_AT or 500
  if count > splitAt then
    streak = 1
    if prev and (prev.count or 0) > splitAt and (prev.streak or 0) >= 1 then
      streak = prev.streak + 1
    end
  end
  self._reports[bagKey][room] = {
    count = count,
    at = self:WallNow(),
    streak = streak,
    rooms = roomsDeclared,
    map = canonMap,
  }
  self:RecomputeRooms(layer, canonMap)
end

function H:RecomputeRooms(layer, canonMap)
  canonMap = tonumber(canonMap) or 0
  if canonMap <= 0 then
    return
  end
  local bagKey = self:RoomPlanKey(layer, canonMap)
  local reps = self._reports and self._reports[bagKey]
  if not reps or not self.db then
    return
  end
  self.db.roomPlan = self.db.roomPlan or {}
  local key = bagKey
  local cur = self.db.roomPlan[key] or { rooms = 1, at = 0 }
  local rooms = tonumber(cur.rooms) or 1
  local now = self:WallNow()
  local heard, over, under = 0, false, true
  local declared = rooms
  for _, r in pairs(reps) do
    if r and now - (r.at or 0) < 120 then
      heard = heard + 1
      if r.rooms and r.rooms > declared then
        declared = r.rooms
      end
      if (r.streak or 0) >= 2 then
        over = true
      end
      if (r.count or 0) >= (self.ROOM_KEEP_AT or 250) then
        under = false
      end
    end
  end
  if heard < 1 then
    return
  end
  if declared > rooms then
    cur = { rooms = declared, at = cur.at or now }
    self.db.roomPlan[key] = cur
    rooms = declared
  end
  local at = tonumber(cur.at) or 0
  if over and (now - at) > 90 and rooms < 30 then
    self.db.roomPlan[key] = { rooms = rooms + 1, at = now }
  elseif (not over) and under and heard >= rooms and rooms > 1 and (now - at) > 720 then
    self.db.roomPlan[key] = { rooms = rooms - 1, at = now }
  elseif not self.db.roomPlan[key] then
    self.db.roomPlan[key] = { rooms = rooms, at = now }
  end
end

function H:ReportRoomCount()
  if not self:RoomsEnabled() or not self.db or self._lookBusy then
    return
  end
  local _, num, idx, rooms, canon = self:DesiredHome()
  if not num or num < 1 or not canon or canon <= 0 then
    return
  end
  local count, elect = self:RoomCensus()
  if not elect then
    return
  end
  self:SendOnChannelName(self.HZL_NOTICE, string.format("NUM|%d|%d|%d|%d|%d", num, idx, count, rooms, canon))
  self:NoteRoomReport(num, idx, count, rooms, canon)
end

function H:HeadCountForRaw(raw, known)
  if not self:RoomsEnabled() then
    return nil
  end
  -- 已经认得的人（含时空之门报来的）。房间人数还没报上来时，不能拿 0 把他们盖掉。
  local counted = known ~= nil
  if not counted then
    known = #(self:PlayersOnLayer(raw) or {})
  end
  local announced
  local num = self:NwbLayerNum(raw)
  if num then
    local canon = self.HomeCanonMap and self:HomeCanonMap() or 0
    local reps = self._reports and self._reports[self:RoomPlanKey(num, canon)]
    local sum, any = 0, false
    local now = self:WallNow()
    if reps then
      for _, r in pairs(reps) do
        if r and (now - (r.at or 0)) < 120 then
          any = true
          sum = sum + (tonumber(r.count) or 0)
        end
      end
    end
    if any then
      announced = sum
    elseif self:SameNwbLayer(raw, self.currentRawLayer) then
      announced = counted and known or self:RoomCensus()
    end
  elseif self:SameNwbLayer(raw, self.currentRawLayer) then
    announced = counted and known or self:RoomCensus()
  end
  if announced and announced > known then
    return announced
  end
  if known > 0 then
    return known
  end
  if announced then
    return announced
  end
  if num then
    return 0
  end
  return nil
end

function H:HideChannelName(name)
  if not name then
    return
  end
  if self.ChatFrameRemoveBlocked and self:ChatFrameRemoveBlocked() then
    return
  end
  local i = 1
  while _G["ChatFrame" .. i] do
    local cf = _G["ChatFrame" .. i]
    pcall(function()
      if ChatFrame_RemoveChannel then
        ChatFrame_RemoveChannel(cf, name)
      end
    end)
    i = i + 1
  end
end

function H:HideMeshChannels()
  self:HideChannelName(self.HZL_NOTICE)
  if self._homeName then
    self:HideChannelName(self._homeName)
  end
  if self._lookName then
    self:HideChannelName(self._lookName)
  end
  self:HideDiscoveryChannel()
end

function H:JoinSilentChannel(name)
  if not name then
    return nil
  end
  local id = GetChannelName(name)
  if type(id) ~= "number" or id <= 0 then
    if not self:OwnChannelJoinReady() then
      self:ScheduleOwnChannelJoin()
      return nil
    end
    local now = self:Now()
    self._joinAttempt = self._joinAttempt or {}
    if (self._joinAttempt[name] or 0) + 3 <= now then
      self._joinAttempt[name] = now
      pcall(function()
        -- 只用临时频道。永久频道会在每次换层后留下来，几次之后新房间就加不进去。
        -- 三秒内不重复加，避免游戏拒绝连续加频道。
        if JoinTemporaryChannel then
          JoinTemporaryChannel(name)
        elseif JoinChannelByName then
          JoinChannelByName(name)
        end
      end)
    end
    id = GetChannelName(name)
  end
  self:HideChannelName(name)
  if type(id) == "number" and id > 0 then
    if self._traceLast then
      self._traceLast["join-fail-" .. name] = nil
    end
    return id
  end
  if self.TraceIfChanged then
    self:TraceIfChanged("join-fail-" .. name, "加频道没成功 " .. tostring(name))
  end
  return nil
end

function H:ChannelSettleAge()
  local now = self:Now()
  if not self._channelSettleFrom then
    self._channelSettleFrom = now
  end
  return now - self._channelSettleFrom
end

-- 进游戏先等玩家自己的频道排号。时空之门还要进 PIG 时，等它先进，最多 8 秒。
function H:OwnChannelJoinReady()
  if self._ownChannelsReady then
    return true
  end
  local age = self:ChannelSettleAge()
  if age < 3 then
    return false
  end
  local waitPig = self.PigBridgeEnabled and self:PigBridgeEnabled()
    and self.GetPigChannelId and not self:GetPigChannelId()
  if waitPig and age < 8 then
    return false
  end
  self._ownChannelsReady = true
  if self.TraceIfChanged then
    self:TraceIfChanged("ch-late", "晚加入公告和房间")
  end
  return true
end

function H:ScheduleOwnChannelJoin()
  if self._ownJoinScheduled then
    return
  end
  self._ownJoinScheduled = true
  C_Timer.After(1, function()
    H._ownJoinScheduled = false
    if not H.db or not H.RoomsEnabled or not H:RoomsEnabled() then
      return
    end
    pcall(function()
      H:MaintainRooms(true)
    end)
  end)
end

function H:MeshBusy()
  if self.poll or self._lookBusy or self._partyHop then
    return true
  end
  if self.helpPrompt and (self.helpPrompt.expireAt or 0) > self:Now() then
    return true
  end
  return false
end

function H:MeshNameHas(listed, want)
  if type(listed) ~= "string" or type(want) ~= "string" or want == "" then
    return false
  end
  if listed == want then
    return true
  end
  local i, j = listed:find(want, 1, true)
  if not i then
    return false
  end
  -- 「互助房2x1」不能当成「互助房2x10」
  local after = listed:sub(j + 1, j + 1)
  return after == "" or not after:match("%d")
end

function H:MeshChannelJunk(name)
  if type(name) ~= "string" or name == "" then
    return false
  end
  if self:MeshNameHas(name, self._homeName) or self:MeshNameHas(name, self._lookName) or self:MeshNameHas(name, self.HZL_NOTICE) then
    return false
  end
  if self:IsHzlChannelName(name) then
    return true
  end
  if name:find("互助房", 1, true) then
    return true
  end
  return false
end

function H:SweepMeshChannels()
  if not GetChannelList then
    self:LeaveOldBigChannel()
    return
  end
  local function idOf(want)
    if not want or not GetChannelName then
      return 0
    end
    local id = GetChannelName(want)
    if type(id) == "number" and id > 0 then
      return id
    end
    return 0
  end
  local homeId = idOf(self._homeName)
  local lookId = idOf(self._lookName)
  local noticeId = idOf(self.HZL_NOTICE)
  local list = { GetChannelList() }
  for i = 1, #list, 3 do
    local id, name = list[i], list[i + 1]
    if type(id) == "number" and id > 0 and (id == homeId or id == lookId or id == noticeId) then
      -- 自己的房间、正在看的那间、公告，留着
    elseif self:MeshChannelJunk(name) then
      self:RawLeaveChannelByName(name)
      if self.Trace then
        self:Trace("清掉多余频道 " .. tostring(name))
      end
      local bare = type(name) == "string" and name:gsub("^%d+%.%s*", "") or nil
      if bare and bare ~= name then
        self:RawLeaveChannelByName(bare)
      end
    end
  end
end

function H:MeshLogOnce(key, why, gap)
  if not key or not why or not self.HopLog then
    return
  end
  self._meshLogAt = self._meshLogAt or {}
  local now = self:Now()
  if (self._meshLogAt[key] or 0) + (gap or 600) > now then
    return
  end
  self._meshLogAt[key] = now
  self:HopLog("mesh", { why = why, from = tonumber(self.currentRawLayer) })
end

function H:MeshLogClear(key)
  if self._meshLogAt then
    self._meshLogAt[key] = nil
  end
end

function H:TraceRoster()
  if not self:RoomsEnabled() or not self.db or not self.Trace then
    return
  end
  local raw = tonumber(self.currentRawLayer)
  local label = raw and self.LabelForRaw and self:LabelForRaw(raw) or "未认出"
  local known = 0
  if raw and self.PlayersOnLayer then
    known = #(self:PlayersOnLayer(raw) or {})
  end
  local peers = 0
  for _ in pairs(self.db.peers or {}) do
    peers = peers + 1
  end
  local homeIn, noticeIn = false, false
  if GetChannelName then
    if self._homeName then
      local id = GetChannelName(self._homeName)
      homeIn = type(id) == "number" and id > 0
    end
    local nid = GetChannelName(self.HZL_NOTICE)
    noticeIn = type(nid) == "number" and nid > 0
  end
  self:Trace(string.format(
    "快照 %s 号%s 记得%d 同伴%d 房间%s%s 公告%s %s",
    label,
    raw and tostring(raw) or "?",
    known,
    peers,
    tostring(self._homeName or "无"),
    homeIn and "已进" or "未进",
    noticeIn and "已进" or "未进",
    IsInGroup() and "在队" or "独自"
  ))
end

function H:NoteRoomJoinHealth()
  if not self:RoomsEnabled() then
    return
  end
  local function watch(tag, chName, label)
    if not chName or not GetChannelName then
      return
    end
    local id = GetChannelName(chName)
    if type(id) == "number" and id > 0 then
      self._meshMiss = self._meshMiss or {}
      self._meshMiss[tag] = nil
      self:MeshLogClear(tag)
      if self.TraceIfChanged then
        self:TraceIfChanged(tag, (tag == "home" and "已进房间：" or "已进公告：") .. chName)
      end
      return
    end
    self._meshMiss = self._meshMiss or {}
    if not self._meshMiss[tag] then
      self._meshMiss[tag] = self:Now()
      return
    end
    if self:Now() - self._meshMiss[tag] < 15 then
      return
    end
    self:MeshLogOnce(tag, label .. "：" .. chName .. "，游戏还没同意进频道")
  end
  watch("notice", self.HZL_NOTICE, "没进公告")
  if self._homeName then
    watch("home", self._homeName, "没进自己的房间")
  end
end

function H:NoteZeroList(list)
  if not self:RoomsEnabled() or type(list) ~= "table" then
    return
  end
  for _, item in ipairs(list) do
    local shown = tonumber(item.headCount)
    local known = #(item.players or {})
    if item.mine then
      local inRoom = false
      if self._homeName and GetChannelName then
        local id = GetChannelName(self._homeName)
        inRoom = type(id) == "number" and id > 0
      end
      if self.TraceIfChanged then
        self:TraceIfChanged(
          "mine",
          string.format(
            "当前%s 界面%s人 记得%d人 %s",
            tostring(item.label or item.raw),
            tostring(shown or 0),
            known,
            inRoom and "已进房间" or "未进房间"
          )
        )
      end
    end
    if item.mine and shown == 0 then
      local inRoom = false
      if self._homeName and GetChannelName then
        local id = GetChannelName(self._homeName)
        inRoom = type(id) == "number" and id > 0
      end
      self:MeshLogOnce(
        "zero",
        string.format("当前位面显示0人：记得%d人，%s", known, inRoom and "人在房间里" or "没进自己的房间")
      )
    elseif item.mine and shown and shown > 0 then
      self:MeshLogClear("zero")
    elseif shown == 0 and known > 0 then
      self:MeshLogOnce(
        "cover" .. tostring(item.raw),
        string.format("%s显示0人，但记得%d人", tostring(item.label or item.raw), known)
      )
    end
  end
end

function H:LeaveOldBigChannel()
  if self:GetDiscoveryChannelId() then
    self:RawLeaveChannelByName(self.HZL_CHANNEL or "互助切位面")
  end
end

-- 上一版留在互助房、互助公告里。回到主频道时退出，避免占满频道名额。
function H:LeaveRetiredRooms()
  if not GetChannelList or self:RoomsEnabled() then
    return
  end
  local list = { GetChannelList() }
  for i = 1, #list, 3 do
    local name = list[i + 1]
    if type(name) == "string" and name ~= "" then
      if name:find("互助房", 1, true) or name:find("互助公告", 1, true) then
        self:RawLeaveChannelByName(name)
      end
    end
  end
end

function H:DiagWhere()
  local map, x, y, speed = 0, nil, nil, 0
  pcall(function()
    if C_Map and C_Map.GetBestMapForUnit then
      map = C_Map.GetBestMapForUnit("player") or 0
    end
    if map > 0 and C_Map.GetPlayerMapPosition then
      local pos = C_Map.GetPlayerMapPosition(map, "player")
      if pos and pos.GetXY then
        x, y = pos:GetXY()
      end
    end
    speed = GetUnitSpeed("player") or 0
  end)
  return map, x, y, speed
end

function H:DiagChannels()
  local names = {}
  if not GetChannelList then
    return ""
  end
  local list = { GetChannelList() }
  for i = 1, #list, 3 do
    local name = list[i + 1]
    if type(name) == "string" and name ~= "" then
      names[#names + 1] = name
    end
  end
  return table.concat(names, "|")
end

function H:DiagCounts()
  local parts = {}
  local ok, snap = pcall(function()
    return self.GetPaintSnapshot and self:GetPaintSnapshot()
  end)
  local layers = ok and snap and snap.layers
  for _, item in ipairs(layers or {}) do
    local n = item.headCount
    if n == nil then
      n = "?"
    end
    parts[#parts + 1] = tostring(item.label or "?") .. tostring(n)
  end
  return table.concat(parts, " ")
end

function H:DiagLine(tag)
  local map, x, y, speed = self:DiagWhere()
  local why = self.TransitBlockReason and self:TransitBlockReason()
  local peers = 0
  for _ in pairs((self.db and self.db.peers) or {}) do
    peers = peers + 1
  end
  local home = self._homeName or "无"
  local homeIn = false
  if self._homeName and GetChannelName then
    local id = GetChannelName(self._homeName)
    homeIn = type(id) == "number" and id > 0
  end
  local noticeIn = false
  if GetChannelName and self.HZL_NOTICE then
    local id = GetChannelName(self.HZL_NOTICE)
    noticeIn = type(id) == "number" and id > 0
  end
  local raw = tonumber(self.currentRawLayer)
  local label = raw and self.LabelForRaw and self:LabelForRaw(raw) or "未认出"
  return string.format(
    "%s 图%s 坐标%.3f,%.3f 速%.2f %s %s 房间%s%s 公告%s 人数[%s] 同伴%d 频道[%s]",
    tag or "诊断",
    tostring(map),
    tonumber(x) or -1,
    tonumber(y) or -1,
    tonumber(speed) or 0,
    why or "可切",
    label,
    home,
    homeIn and "已进" or "未进",
    noticeIn and "已进" or "未进",
    self:DiagCounts(),
    peers,
    self:DiagChannels()
  )
end

function H:DiagTick()
  if not self.Trace or not self.db then
    return
  end
  local line = self:DiagLine("诊断")
  local sig = line:gsub("坐标[%d%.,%-]+", "坐标"):gsub("速[%d%.]+", "速")
  if self.TraceIfChanged and self._diagSig ~= sig then
    self._diagSig = sig
    self:Trace(line)
    return
  end
  self._diagBeat = (self._diagBeat or 0) + 5
  if self._diagBeat >= 15 then
    self._diagBeat = 0
    self:Trace(line)
  end
end

function H:MaintainRooms(force)
  if not self:RoomsEnabled() or not self.db then
    return
  end
  if not force and self.IsHoppableHere and self:IsHoppableHere() and self._homeName then
    local homeId = GetChannelName and GetChannelName(self._homeName)
    if type(homeId) == "number" and homeId > 0 then
      local name, num, _, _, canon = self:DesiredHome()
      if name == self._homeName and num == self._homeLayer and canon == self._homeCanon then
        return
      end
    end
  end
  self:SweepMeshChannels()
  self:JoinSilentChannel(self.HZL_NOTICE)
  if self.IsHoppableHere and not self:IsHoppableHere() then
    local why = (self.TransitBlockReason and self:TransitBlockReason()) or "不能切"
    if self._homeName then
      self:RawLeaveChannelByName(self._homeName)
      if self.Trace then
        self:Trace("退出并忘掉房间 " .. tostring(self._homeName) .. "：" .. why)
      end
      self._homeName = nil
      self._homeLayer = nil
      self._homeCanon = nil
    elseif self.TraceIfChanged then
      local stable = tostring(why):gsub(" 已钉%d+秒", "")
      self:TraceIfChanged("room-gone", "房间仍然没有：" .. stable)
    end
    self:HideMeshChannels()
    return
  end
  local name, num, _, _, canon = self:DesiredHome()
  local now = self:Now()
  if name == self._homeName then
    if (GetChannelName(name) or 0) <= 0 then
      if self:JoinSilentChannel(name) then
        self:BroadcastHello("force")
      end
    end
    self._moveNotBefore = nil
    self:HideMeshChannels()
    return
  end
  local layerChanged = (num ~= self._homeLayer)
  local mapChanged = (canon ~= self._homeCanon)
  if not layerChanged and not mapChanged and not force and self:MeshBusy() then
    if self.TraceIfChanged then
      self:TraceIfChanged("room-busy", "正忙着，先不换房间")
    end
    return
  end
  if not layerChanged and not mapChanged and not force then
    if not self._moveNotBefore then
      self._moveNotBefore = now + (self:NameHash(self:PlayerFullName()) % 30)
    end
    if now < self._moveNotBefore then
      if self.TraceIfChanged then
        self:TraceIfChanged("room-wait", string.format("先不换房，还要等%.0f秒", self._moveNotBefore - now))
      end
      self:HideMeshChannels()
      return
    end
  end
  if self._traceLast then
    self._traceLast["room-busy"] = nil
    self._traceLast["room-wait"] = nil
  end
  if self._homeName and self._homeName ~= name then
    self:RawLeaveChannelByName(self._homeName)
  end
  if self.Trace and self._homeName ~= name then
    self:Trace(string.format("换房间：%s → %s（层号%s 大图%s）", tostring(self._homeName or "无"), tostring(name), tostring(num), tostring(canon)))
  end
  self._homeName = name
  self._homeLayer = num
  self._homeCanon = canon
  if self._traceLast then
    self._traceLast["room-gone"] = nil
  end
  self._moveNotBefore = nil
  self:JoinSilentChannel(name)
  self:HideMeshChannels()
  self:WakeHomeOnce(name)
end

function H:DropStaleRoomPeers()
  if self._droppedStale or not self.db then
    return
  end
  self._droppedStale = true
  self._meshBoot = self:WallNow()
  -- 先并进长期花名册，再清短期 peers（花名册不删）
  if self.MigratePeersToInstallBook then
    self:MigratePeersToInstallBook()
  end
  local n = 0
  for name, peer in pairs(self.db.peers or {}) do
    if peer and not peer.pig then
      self.db.peers[name] = nil
      n = n + 1
    end
  end
  if n > 0 and self.Trace then
    self:Trace("清掉旧频道留下的 " .. tostring(n) .. " 条同伴")
  end
end

function H:EnsureRoomChannels()
  self:LeaveLegacyDiscoveryChannel()
  self:DropStaleRoomPeers()
  if IsInGroup() then
    local book = self:LayerBook()
    if (tonumber(book.joined) or 0) == 0 then
      book.joined = self:WallNow()
      book.sticky = nil
    end
  end
  self:MaintainRooms(true)
  self:NoteRoomJoinHealth()
  if not self._meshTicker then
    self._meshTicker = C_Timer.NewTicker(5, function()
      if not H.db or not H:RoomsEnabled() then
        return
      end
      H:StallBegin("每5秒查房")
      pcall(function()
        H._meshSec = (H._meshSec or 0) + 5
        H:MaintainRooms(false)
        H:NoteRoomJoinHealth()
        if H.DiagTick then
          H:DiagTick()
        end
        if H._meshSec % 120 == 0 then
          H:ReportRoomCount()
        end
        if H._meshSec % 60 == 0 then
          H:TraceRoster()
        end
      end)
      H:StallEnd()
    end)
    C_Timer.After(8, function()
      pcall(function()
        if H:RoomsEnabled() then
          H:MaybeSendLayerTable()
          H:ReportRoomCount()
        end
      end)
    end)
    if not self._lytYellTicker and C_Timer and C_Timer.NewTicker then
      self._lytYellTicker = C_Timer.NewTicker(1200, function()
        if H.db and H:RoomsEnabled() then
          pcall(function()
            H:MaybeSendLayerTable()
          end)
        end
      end)
    end
  end
end

function H:OnRoomChannelNotice(noticeType, channelName, channelBaseName)
  local t = tostring(noticeType or "")
  if self.Trace then
    self:Trace(string.format(
      "频道通知 %s 名字%s 原名%s",
      t,
      tostring(channelName or ""),
      tostring(channelBaseName or "")
    ))
  end
  self:HideMeshChannels()
  if t ~= "YOU_LEFT" and t ~= "YOU_CHANGED" and t ~= "SUSPENDED" then
    return
  end
  if self:IsHzlChannelName(channelName) or self:IsHzlChannelName(channelBaseName) then
    return
  end
  C_Timer.After(0.3, function()
    H:StallBegin("通知后查房")
    pcall(function()
      H:MaintainRooms(true)
    end)
    H:StallEnd()
  end)
end

function H:IsMutedMeshChannel(channel)
  if not self:RoomsEnabled() then
    return false
  end
  if type(channel) == "number" then
    local home = self._homeName and (GetChannelName(self._homeName) or 0) or 0
    local notice = GetChannelName(self.HZL_NOTICE) or 0
    local look = self._lookName and (GetChannelName(self._lookName) or 0) or 0
    return channel > 0 and (channel == home or channel == notice or channel == look)
  end
  local s = tostring(channel or "")
  if s:find(self.HZL_NOTICE, 1, true) then
    return true
  end
  if self._homeName and s:find(self._homeName, 1, true) then
    return true
  end
  if self._lookName and s:find(self._lookName, 1, true) then
    return true
  end
  if s:find("互助房", 1, true) then
    return true
  end
  return false
end

function H:ChannelLeaveBlocked(nameOrId)
  if not self:RoomsEnabled() then
    if type(nameOrId) == "number" then
      return self:IsOurDiscoveryChannel(nameOrId) and true or false
    end
    return self:IsHzlChannelName(nameOrId) and true or false
  end
  if type(nameOrId) == "number" then
    local home = self._homeName and (GetChannelName(self._homeName) or 0) or 0
    local notice = GetChannelName(self.HZL_NOTICE) or 0
    return nameOrId > 0 and (nameOrId == home or nameOrId == notice)
  end
  local s = tostring(nameOrId or "")
  if self:IsHzlChannelName(s) then
    return false
  end
  if self:MeshNameHas(s, self.HZL_NOTICE) then
    return true
  end
  if self:MeshNameHas(s, self._homeName) then
    return true
  end
  return false
end

function H:WakeWhenJoined(name, stillHere, tokenKey, onDone)
  if not name then
    if onDone then
      onDone(false)
    end
    return
  end
  self[tokenKey] = (self[tokenKey] or 0) + 1
  local token = self[tokenKey]
  local started = self:Now()
  local function attempt()
    if H[tokenKey] ~= token or not stillHere() then
      return
    end
    local id = GetChannelName(name)
    if type(id) ~= "number" or id <= 0 then
      if H:Now() - started > 6 then
        if name ~= H._homeName then
          H:MeshLogOnce("look", "求切没进对方房间：" .. tostring(name))
        end
        if onDone then
          onDone(false)
        end
        return
      end
      H:JoinSilentChannel(name)
      C_Timer.After(0.5, attempt)
      return
    end
    H:SendAddon("WAKE", "CHANNEL", id)
    if name == H._homeName then
      H:BroadcastHello("force")
    end
    if onDone then
      onDone(true)
    end
  end
  C_Timer.After(0.4, attempt)
end

function H:WakeHomeOnce(name)
  if not name or self._wokeHome == name then
    return
  end
  self._wokeHome = name
  self:WakeWhenJoined(name, function()
    return H._homeName == name
  end, "_wakeHomeToken")
end

function H:RoomHostNames(limit)
  limit = tonumber(limit) or 8
  local now = self:WallNow()
  local raw = tonumber(self.currentRawLayer)
  if not raw or raw <= 0 then
    return {}, 0
  end
  local list = {}
  local me = self:PlayerFullName()
  if me then
    list[#list + 1] = { name = me, last = now }
  end
  for name, peer in pairs(self.db.peers or {}) do
    if peer and self:SameNwbLayer(peer.raw, raw) and not self:IsSelfName(name)
      and self:IsWallStamp(peer.last) and (now - (peer.last or 0)) <= 180 then
      if not (self.SameHoppableMap and self:SameHoppableMap(self:MyMapId(), peer.map)) then
        -- 进房名单只带这张大图
      else
        list[#list + 1] = { name = name, last = peer.last or 0 }
      end
    end
  end
  table.sort(list, function(a, b)
    return (a.last or 0) > (b.last or 0)
  end)
  local names = {}
  for i = 1, math.min(limit, #list) do
    names[i] = list[i].name
  end
  return names, raw
end

function H:OnRoomRoster(msg)
  local parts = { strsplit("|", msg) }
  local raw = tonumber(parts[2] or 0) or 0
  local mapOrBlob = parts[3] or ""
  local canon = tonumber(mapOrBlob)
  local blob
  if canon and parts[4] then
    blob = parts[4] or ""
  else
    canon = nil
    blob = mapOrBlob
  end
  if raw <= 0 or blob == "" then
    return
  end
  self._wakeRostAt = self:Now()
  for name in string.gmatch(blob, "[^;]+") do
    if name ~= "" then
      self:UpsertPeer(name, raw, true, canon, nil, nil, nil, nil, nil, name)
      local peer = self.db.peers and self.db.peers[self:NormalizeName(name)]
      if peer then
        peer.hzl = true
      end
    end
  end
  if self.ScheduleRefreshUI then
    self:ScheduleRefreshUI(0.3)
  end
end

function H:SendRoomRoster()
  local names, raw = self:RoomHostNames(8)
  if raw <= 0 or #names == 0 or not self._homeName then
    return
  end
  local id = GetChannelName(self._homeName)
  if type(id) ~= "number" or id <= 0 then
    return
  end
  self._wakeRostAt = self:Now()
  local canon = self.HomeCanonMap and self:HomeCanonMap() or 0
  self:SendAddon("ROST|" .. tostring(raw) .. "|" .. tostring(canon) .. "|" .. table.concat(names, ";"), "CHANNEL", id)
end

function H:ReplyWakeNow()
  local now = self:Now()
  if (self._wakeRostAt or 0) + 8 > now then
    return
  end
  self._wakeReplyAt = now
  self:BroadcastHello("force")
  self:SendRoomRoster()
end

function H:ReplyWake()
  local now = self:Now()
  if (self._wakeReplyAt or 0) + 3 > now then
    return
  end
  if (self._wakeRostAt or 0) + 8 > now then
    return
  end
  self._wakeReplyAt = now
  local _, elect = self:RoomCensus()
  if elect then
    self:ReplyWakeNow()
    return
  end
  local delay = 1.2 + (self:NameHash(self:PlayerFullName() or "") % 8) * 0.12
  C_Timer.After(delay, function()
    pcall(function()
      H:ReplyWakeNow()
    end)
  end)
end

function H:JoinLookRoom(layerNum, roomIdx, canonMap)
  local name = self:RoomChannelName(layerNum, roomIdx, canonMap)
  if self._lookName and self._lookName ~= name then
    self:RawLeaveChannelByName(self._lookName)
  end
  self._lookName = name
  self:JoinSilentChannel(name)
end

function H:LeaveLookRoom()
  if self._lookName then
    self:RawLeaveChannelByName(self._lookName)
    self._lookName = nil
  end
end

function H:FinishLookAttempt()
  if not self._lookBusy then
    return
  end
  local raw = self._lookRaw
  local hosts = self:GetFairHosts(raw) or {}
  local rooms = self._lookRooms or 1
  if #hosts > 0 or (self._lookAttempt or 1) >= 2 or rooms < 2 then
    if self.Trace then
      self:Trace(string.format("查看结束 位面%s 可帮%d人", tostring(raw), #hosts))
    end
    self:LeaveLookRoom()
    self._lookBusy = false
    if self._StartPollCore then
      self:_StartPollCore(raw, { skipLoudPig = true })
    end
    return
  end
  self._lookAttempt = 2
  local idx = ((self._lookIdx or 1) % rooms) + 1
  self._lookIdx = idx
  self:JoinLookRoom(self._lookNum or 0, idx, self._lookCanon)
  local lookName = self._lookName
  self:WakeWhenJoined(lookName, function()
    return H._lookBusy and H._lookName == lookName
  end, "_wakeLookToken", function(sent)
    C_Timer.After(sent and 2.5 or 0.2, function()
      pcall(function()
        H:FinishLookAttempt()
      end)
    end)
  end)
end

function H:BeginLook(targetRaw)
  -- 泰坦：临时加房再定时器里退出会弹窗，且列表会空。燃烧可以加房，但不能在后台喊字、退房。
  if self.NeedsClickForProtected and self:NeedsClickForProtected() then
    if self._StartPollCore then
      return self:_StartPollCore(targetRaw)
    end
    return
  end
  -- 点求切这一下先喊时空之门，后台只听回音，不再喊。
  if self.PigLoudChatProbe and self.PigBridgeEnabled and self:PigBridgeEnabled() then
    pcall(function()
      H:PigLoudChatProbe({ gapSec = 8 })
    end)
  end
  local hopMap = tonumber(self._hopLookMap)
  if self.IsForeverClient and self:IsForeverClient() and hopMap and hopMap > 0 then
    self._lookBusy = true
    self._lookAttempt = 1
    self._lookRooms = 1
    self._lookNum = 0
    self._lookCanon = hopMap
    self._lookRaw = tonumber(targetRaw)
    self:Print("正在找这个位面的人")
    if self.ArmHopCooldown then
      self:ArmHopCooldown(targetRaw)
    end
    self:JoinLookRoom(0, 1, hopMap)
    if self.Trace then
      self:Trace(string.format("去对方地图的房间问 %s", tostring(self._lookName)))
    end
    local lookName = self._lookName
    self:WakeWhenJoined(lookName, function()
      return H._lookBusy and H._lookName == lookName
    end, "_wakeLookToken", function(sent)
      C_Timer.After(sent and 2.5 or 0.2, function()
        pcall(function()
          H:FinishLookAttempt()
        end)
      end)
    end)
    return
  end
  local num = self:NwbLayerNum(targetRaw) or 0
  if num < 1 then
    if self._StartPollCore then
      self:_StartPollCore(targetRaw)
    end
    return
  end
  local canon = self.HomeCanonMap and self:HomeCanonMap() or 0
  if canon <= 0 then
    if self._StartPollCore then
      self:_StartPollCore(targetRaw)
    end
    return
  end
  local rooms = self:RoomCountFor(num, canon)
  local idx = self:RoomIndexFor(self:PlayerFullName(), num, rooms)
  self._lookBusy = true
  self._lookAttempt = 1
  self._lookIdx = idx
  self._lookRooms = rooms
  self._lookNum = num
  self._lookCanon = canon
  self._lookRaw = targetRaw
  self:Print("正在找这个位面的人")
  if self.ArmHopCooldown then
    self:ArmHopCooldown(targetRaw)
  end
  self:JoinLookRoom(num, idx, canon)
  if self.Trace then
    self:Trace(string.format("去查看位面%s 房间%s", tostring(targetRaw), tostring(self._lookName)))
  end
  local lookName = self._lookName
  self:WakeWhenJoined(lookName, function()
    return H._lookBusy and H._lookName == lookName
  end, "_wakeLookToken", function(sent)
    C_Timer.After(sent and 2.5 or 0.2, function()
      pcall(function()
        H:FinishLookAttempt()
      end)
    end)
  end)
end

-- 正式服认层：跟 TitanLayer 同一套（当前地图、小号在前、两小时）。
-- 有 TitanLayer 的人报这张表（T）；没有的人自己认（R）。大家用同一张，列表才是同一个 1、2、3。
-- 不打开分房，心跳仍是原来那一档。
H.RETAIL_LAYER_EXPIRE = 7200

function H:RetailStamp()
  if GetServerTime then
    local now = GetServerTime()
    if issecretvalue and issecretvalue(now) then
      now = nil
    end
    now = tonumber(now)
    if now and now > 1000000000 then
      return now
    end
  end
  return self:WallNow()
end

function H:RetailMapId()
  local mapId = self:MyMapId()
  if issecretvalue and issecretvalue(mapId) then
    return nil
  end
  mapId = tonumber(mapId)
  if not mapId or mapId <= 0 then
    return nil
  end
  return mapId
end

function H:RetailRealm()
  local realm = "?"
  pcall(function()
    realm = GetRealmName() or "?"
  end)
  if realm == "" then
    realm = "?"
  end
  return realm
end

function H:RetailSightBag()
  self.db.retailSight = self.db.retailSight or {}
  local realm = self:RetailRealm()
  local bag = self.db.retailSight[realm]
  if type(bag) ~= "table" then
    bag = {}
    self.db.retailSight[realm] = bag
  end
  return bag
end

function H:TitanLayerMaps()
  local db = _G.TitanLayerDB
  if type(db) ~= "table" or type(db.realms) ~= "table" then
    return nil
  end
  local maps = db.realms[self:RetailRealm()]
  if type(maps) ~= "table" then
    return nil
  end
  return maps
end

function H:RetailSortSet(set)
  local keys = {}
  for id in pairs(set or {}) do
    id = tonumber(id)
    if id and id > 0 then
      keys[#keys + 1] = id
    end
  end
  table.sort(keys)
  return keys
end

function H:RetailKeySig(keys)
  local parts = {}
  for i, id in ipairs(keys or {}) do
    parts[i] = tostring(id)
  end
  return table.concat(parts, ",")
end

function H:TitanLayerZoneIds(mapId)
  mapId = tonumber(mapId)
  local maps = self:TitanLayerMaps()
  if not mapId or not maps then
    return nil
  end
  local ids = maps[mapId] or maps[tostring(mapId)]
  if type(ids) ~= "table" then
    return nil
  end
  local now = self:RetailStamp()
  if not now then
    return nil
  end
  local list = {}
  for zoneId, seen in pairs(ids) do
    zoneId = tonumber(zoneId)
    seen = tonumber(seen)
    if zoneId and zoneId > 0 and seen and (now - seen) < self.RETAIL_LAYER_EXPIRE then
      list[#list + 1] = zoneId
    end
  end
  if #list == 0 then
    return nil
  end
  table.sort(list)
  return list
end

function H:HasTitanLayerTable()
  if not self:IsRetailClient() then
    return false
  end
  local mapId = self:RetailMapId()
  local list = mapId and self:TitanLayerZoneIds(mapId)
  return list ~= nil and #list > 0
end

function H:RetailZoneFresh(ids, zoneId, now)
  if type(ids) ~= "table" or not zoneId or not now then
    return false
  end
  local seen = tonumber(ids[zoneId] or ids[tostring(zoneId)])
  return seen ~= nil and (now - seen) < self.RETAIL_LAYER_EXPIRE
end

function H:RetailZoneOwnedElsewhere(mapId, zoneId, now)
  local bag = self.db and self:RetailSightBag() or nil
  if type(bag) == "table" then
    for mk, ids in pairs(bag) do
      if tonumber(mk) ~= mapId and self:RetailZoneFresh(ids, zoneId, now) then
        return true
      end
    end
  end
  local maps = self:TitanLayerMaps()
  if type(maps) == "table" then
    for mk, ids in pairs(maps) do
      if tonumber(mk) ~= mapId and self:RetailZoneFresh(ids, zoneId, now) then
        return true
      end
    end
  end
  return false
end

function H:RetailObserveUnit(unit, confirmOnly)
  if not self:IsRetailClient() or not self.db or not unit then
    return
  end
  if (self.ZoneRecognizeHeld and self:ZoneRecognizeHeld())
    or (self.HopRecognizeHeld and self:HopRecognizeHeld()) then
    return
  end
  if self.IsOnTransit and self:IsOnTransit() then
    return
  end
  if self:IsInInstance() then
    return
  end
  local raw
  pcall(function()
    local guid = UnitGUID(unit)
    if issecretvalue and issecretvalue(guid) then
      return
    end
    if type(guid) ~= "string" then
      return
    end
    local kind = strsplit("-", guid)
    if kind ~= "Creature" then
      return
    end
    raw = self:ExtractRawLayer(guid)
  end)
  raw = tonumber(raw)
  local mapId = self:RetailMapId()
  local now = self:RetailStamp()
  if not raw or raw <= 0 or not mapId or not now then
    return
  end
  local bag = self:RetailSightBag()
  local row = bag[mapId]
  local maps = self:TitanLayerMaps()
  local titanRow = maps and (maps[mapId] or maps[tostring(mapId)])
  local known = self:RetailZoneFresh(row, raw, now) or self:RetailZoneFresh(titanRow, raw, now)
  if known then
    local prev = type(row) == "table" and tonumber(row[raw] or row[tostring(raw)]) or nil
    if prev and (now - prev) < 30 then
      return
    end
    if type(row) ~= "table" then
      row = {}
      bag[mapId] = row
    end
    row[raw] = now
    return
  end
  if not known then
    if confirmOnly then
      return
    end
    if self:RetailZoneOwnedElsewhere(mapId, raw, now) then
      return
    end
  end
  if type(row) ~= "table" then
    row = {}
    bag[mapId] = row
  end
  row[raw] = now
  for id, seen in pairs(row) do
    seen = tonumber(seen)
    if not seen or (now - seen) >= self.RETAIL_LAYER_EXPIRE then
      row[id] = nil
    end
  end
  self:MaybeSendRetailTable()
end

function H:RetailSelfKeys(mapId)
  local now = self:RetailStamp()
  local set = {}
  local bag = self:RetailSightBag()
  local row = bag[mapId]
  if type(row) == "table" and now then
    for zoneId, seen in pairs(row) do
      zoneId = tonumber(zoneId)
      seen = tonumber(seen)
      if zoneId and seen and (now - seen) < self.RETAIL_LAYER_EXPIRE then
        set[zoneId] = true
      elseif zoneId then
        row[zoneId] = nil
      end
    end
  end
  local wall = self:WallNow()
  local mem = self.PEER_UI_TTL or (15 * 60)
  for _, peer in pairs(self.db.peers or {}) do
    if type(peer) == "table" and tonumber(peer.map) == mapId then
      local id = tonumber(peer.raw)
      local last = tonumber(peer.last)
      if id and id > 0 and last and self:IsWallStamp(last) and (wall - last) <= mem then
        set[id] = true
      end
    end
  end
  return self:RetailSortSet(set)
end

function H:RetailFreshT(mapId)
  local now = self:Now()
  local set = {}
  local any = false
  local function add(list)
    if not list then
      return
    end
    any = true
    for _, id in ipairs(list) do
      id = tonumber(id)
      if id and id > 0 then
        set[id] = true
      end
    end
  end
  add(self:TitanLayerZoneIds(mapId))
  for _, info in pairs(self._retailHeard or {}) do
    if info and info.src == "T" and info.map == mapId and (now - (info.at or 0)) < 180 then
      add(info.keys)
    end
  end
  if not any then
    return nil
  end
  return self:RetailSortSet(set)
end

function H:RetailAdoptedR(mapId)
  local me = self:RetailNameKey(self:PlayerFullName())
  local now = self:Now()
  local bestName, best = nil, nil
  for name, info in pairs(self._retailHeard or {}) do
    if info and info.src == "R" and info.map == mapId and (now - (info.at or 0)) < 180
      and info.keys and #info.keys > 0 then
      if not bestName or name < bestName then
        bestName, best = name, info
      end
    end
  end
  if best and me and bestName < me then
    return best.keys
  end
  return nil
end

function H:RetailRebuild()
  if not self:IsRetailClient() or not self.db then
    return
  end
  local mapId = self:RetailMapId()
  if not mapId then
    return
  end
  local src = "R"
  local keys = self:RetailFreshT(mapId)
  if keys then
    src = "T"
  else
    keys = self:RetailAdoptedR(mapId) or self:RetailSelfKeys(mapId)
  end
  local sig = tostring(mapId) .. ":" .. self:RetailKeySig(keys)
  local prev = self._retailSig
  if prev and prev ~= "" and prev ~= sig and self.ClearLayerHopCooldowns then
    self:ClearLayerHopCooldowns()
  end
  local index = {}
  for i, id in ipairs(keys) do
    index[id] = i
  end
  self._retailMapId = mapId
  self._retailKeys = keys
  self._retailIndex = index
  self._retailSrc = src
  self._retailSig = sig
  if self.TraceIfChanged then
    local shown = {}
    for i = 1, math.min(#keys, 6) do
      shown[i] = tostring(keys[i])
    end
    local label = "自己认的"
    if src == "T" then
      local mine = self:TitanLayerZoneIds(mapId)
      if mine and self:RetailKeySig(mine) == self:RetailKeySig(keys) then
        label = "跟TitanLayer"
      else
        label = "跟TitanLayer合表"
      end
    end
    self:TraceIfChanged(
      "retail" .. tostring(mapId),
      string.format(
        "位面表%s %d层：%s%s",
        label,
        #keys,
        table.concat(shown, ","),
        #keys > 6 and "…" or ""
      )
    )
  end
  if sig ~= prev and not self._retailPainting then
    if self.UpdateLayerIcon then
      self:UpdateLayerIcon()
    end
    if not (self.ZoneRecognizeHeld and self:ZoneRecognizeHeld()) then
      if self.ScheduleRefreshUI then
        self:ScheduleRefreshUI(0.4)
      elseif self.RefreshUI then
        self:RefreshUI()
      end
    end
  end
end

-- 刚认到的号立刻写进当前这张图的表，避免先显示「7」再变成「一」
function H:RetailNoteCurrent(raw)
  if not self:IsRetailClient() or not self.db then
    return
  end
  if (self.ZoneRecognizeHeld and self:ZoneRecognizeHeld())
    or (self.HopRecognizeHeld and self:HopRecognizeHeld()) then
    return
  end
  raw = tonumber(raw)
  local mapId = self:RetailMapId()
  local now = self:RetailStamp()
  if not raw or raw <= 0 or not mapId or not now then
    return
  end
  if self:RetailZoneOwnedElsewhere(mapId, raw, now) then
    return
  end
  local bag = self:RetailSightBag()
  local row = bag[mapId]
  if type(row) ~= "table" then
    row = {}
    bag[mapId] = row
  end
  row[raw] = now
  self:RetailRebuild()
end

function H:RetailLayerNum(raw)
  raw = tonumber(raw)
  if not raw or raw <= 0 or not self:IsRetailClient() then
    return nil
  end
  local mapId = self:RetailMapId()
  if not mapId then
    return nil
  end
  if self._retailMapId ~= mapId or not self._retailIndex then
    self._retailPainting = true
    self:RetailRebuild()
    self._retailPainting = false
  end
  if self._retailMapId ~= mapId then
    return nil
  end
  local n = self._retailIndex and self._retailIndex[raw]
  if n and n > 0 then
    return n
  end
  return nil
end

function H:RetailTitanLive()
  if self:HasTitanLayerTable() then
    return true
  end
  local now = self:Now()
  for _, info in pairs(self._retailSeen or {}) do
    if info and info.titan and (now - (info.at or 0)) < 180 then
      return true
    end
  end
  return false
end

function H:RetailNameKey(name)
  if not name or name == "" or name == "?" then
    return nil
  end
  return self:NormalizeName(self:ReplyName(name) or name)
end

function H:RetailAmElect()
  local me = self:RetailNameKey(self:PlayerFullName())
  if not me then
    return false
  end
  self._retailSeen = self._retailSeen or {}
  self._retailSeen[me] = { at = self:Now(), titan = self:HasTitanLayerTable() and true or false }
  local now = self:Now()
  local best = me
  for name, info in pairs(self._retailSeen) do
    if info and (now - (info.at or 0)) < 180 and name < best then
      best = name
    end
  end
  return best == me
end

function H:SendRetailTable(src, mapId, keys)
  if src ~= "T" and src ~= "R" then
    return
  end
  local ids = {}
  for i, id in ipairs(keys or {}) do
    ids[i] = tostring(id)
  end
  if #ids == 0 or not mapId then
    return
  end
  local payload = tostring(mapId) .. ":" .. table.concat(ids, ",")
  local now = self:Now()
  if self._retailSent == payload and (now - (self._retailSentAt or 0)) < 60 then
    return
  end
  local id = self:GetDiscoveryChannelId()
  if not id then
    return
  end
  self._retailSent = payload
  self._retailSentAt = now
  local size = 160
  local parts = {}
  local i = 1
  while i <= #payload do
    parts[#parts + 1] = payload:sub(i, i + size - 1)
    i = i + size
  end
  self._retailGen = (self._retailGen or 0) + 1
  for idx, piece in ipairs(parts) do
    self:SendAddon(
      string.format("LYT|%d|%d|%d|%s|%s", self._retailGen, idx, #parts, src, piece),
      "CHANNEL",
      id
    )
  end
end

function H:MaybeSendRetailTable()
  if not self:IsRetailClient() or not self.db then
    return
  end
  self:RetailRebuild()
  local mapId = self:RetailMapId()
  if not mapId then
    return
  end
  if self:HasTitanLayerTable() then
    self:SendRetailTable("T", mapId, self:TitanLayerZoneIds(mapId))
    return
  end
  if self:RetailTitanLive() then
    return
  end
  if not self:RetailAmElect() then
    return
  end
  self:SendRetailTable("R", mapId, self:RetailSelfKeys(mapId))
end

function H:ParseRetailPayload(payload)
  if type(payload) ~= "string" then
    return nil
  end
  local mapPart, idPart = payload:match("^(%d+):([%d,]*)$")
  local mapId = tonumber(mapPart)
  if not mapId or mapId <= 0 or not idPart or idPart == "" then
    return nil
  end
  local keys = {}
  for id in string.gmatch(idPart, "[^,]+") do
    local n = tonumber(id)
    if n and n > 0 then
      keys[#keys + 1] = n
    end
  end
  table.sort(keys)
  if #keys == 0 then
    return nil
  end
  return mapId, keys
end

function H:OnRetailLytComplete(sender, src, payload)
  if src ~= "T" and src ~= "R" then
    return
  end
  if src == "R" and self:RetailTitanLive() then
    return
  end
  local mapId, keys = self:ParseRetailPayload(payload)
  if not mapId or not keys then
    return
  end
  local name = self:RetailNameKey(sender)
  if not name then
    return
  end
  self._retailHeard = self._retailHeard or {}
  self._retailHeard[name] = { src = src, map = mapId, keys = keys, at = self:Now() }
  self:RetailRebuild()
end

function H:OnRetailLyt(sender, msg)
  local parts = { strsplit("|", msg) }
  local gen = tonumber(parts[2])
  local idx = tonumber(parts[3])
  local n = tonumber(parts[4])
  local src = parts[5]
  local piece = parts[6] or ""
  if not gen or not idx or not n or n < 1 or (src ~= "T" and src ~= "R") then
    return
  end
  if n == 1 then
    self:OnRetailLytComplete(sender, src, piece)
    return
  end
  self._retailIn = self._retailIn or {}
  local key = tostring(sender or "?") .. ":" .. tostring(gen)
  local buf = self._retailIn[key]
  if not buf or buf.n ~= n or buf.src ~= src then
    buf = { n = n, src = src, parts = {} }
    self._retailIn[key] = buf
  end
  buf.parts[idx] = piece
  for i = 1, n do
    if not buf.parts[i] then
      return
    end
  end
  self._retailIn[key] = nil
  self:OnRetailLytComplete(sender, src, table.concat(buf.parts, ""))
end

function H:OnRetailAddon(msg, sender)
  local cmd = strsplit("|", msg)
  if cmd == "HELLO" then
    local flag = select(11, strsplit("|", msg))
    local name = self:RetailNameKey(sender)
    if name then
      self._retailSeen = self._retailSeen or {}
      self._retailSeen[name] = { at = self:Now(), titan = flag == "T" }
    end
    self:MaybeSendRetailTable()
  elseif cmd == "LYT" then
    self:OnRetailLyt(sender, msg)
  end
end

function H:EnsureRetailLayerTicker()
  if self._retailTicker or not self:IsRetailClient() then
    return
  end
  self._retailTicker = true
  C_Timer.NewTicker(60, function()
    pcall(function()
      if H:IsRetailClient() then
        H:MaybeSendRetailTable()
      end
    end)
  end)
  pcall(function()
    H:MaybeSendRetailTable()
  end)
end

local function meshInstall()
  local coreScan = H.ScanNearby
  function H:ScanNearby(...)
    local votes = coreScan(self, ...)
    self:NoteLayerVotes(votes)
    return votes
  end

  local coreHello = H.HelloPayload
  function H:HelloPayload(...)
    local msg = coreHello(self, ...)
    if self:IsRetailClient() then
      return msg .. "|" .. (self:HasTitanLayerTable() and "T" or "0")
    end
    if not self:LayerMeshOn() then
      return msg
    end
    return msg .. "|" .. (self:HasLiveNwb() and "1" or "0")
  end

  local coreAddon = H.OnAddonMessage
  function H:OnAddonMessage(prefix, msg, channel, sender)
    coreAddon(self, prefix, msg, channel, sender)
    if prefix ~= self.PREFIX or type(msg) ~= "string" then
      return
    end
    if self:IsRetailClient() then
      self:OnRetailAddon(msg, sender)
      return
    end
    if not self:LayerMeshOn() then
      return
    end
    local cmd = strsplit("|", msg)
    if cmd == "HELLO" then
      local nwb = select(11, strsplit("|", msg))
      local name = self:NormalizeName(self:ReplyName(sender) or sender)
      if name then
        self._meshSeen = self._meshSeen or {}
        self._meshSeen[name] = { at = self:Now(), nwb = nwb == "1" }
      end
    elseif cmd == "LYT" then
      self:OnLytMessage(sender, msg)
    elseif cmd == "WAKE" then
      self:ReplyWake()
    elseif cmd == "ROST" then
      self:OnRoomRoster(msg)
    elseif cmd == "NUM" then
      local _, layer, room, count, declared, map = strsplit("|", msg)
      self:NoteRoomReport(layer, room, count, declared, map)
      if self.TraceIfChanged then
        self:TraceIfChanged(
          "num" .. tostring(layer) .. "m" .. tostring(map) .. "x" .. tostring(room),
          string.format("人数通报 位面%s 大图%s 第%s间 %s人 共%s间", tostring(layer), tostring(map), tostring(room), tostring(count), tostring(declared))
        )
      end
      if self.ScheduleRefreshUI then
        self:ScheduleRefreshUI(0.6)
      elseif self.RefreshUI then
        self:RefreshUI()
      end
    end
  end

  local coreBroadcast = H.BroadcastHello
  function H:BroadcastHello(mode)
    if not self:RoomsEnabled() then
      return coreBroadcast(self, mode)
    end
    if not self.db then
      return
    end
    mode = mode or "full"
    local now = self:Now()
    if mode ~= "force" and (self._helloSoftAt or 0) + (self.SOFT_HELLO_GAP or 12) > now then
      return
    end
    self._helloSoftAt = now
    self:MeshMarkSelf()
    local msg = self:HelloPayload()
    local gap = self._channelBackoff or self.CHANNEL_HELLO_GAP or 90
    if mode ~= "force" and (self._channelHelloAt or 0) + gap > now then
      return
    end
    local home = self._homeName
    if not home then
      self:MaintainRooms(true)
      home = self._homeName
    end
    if not home then
      -- 不在可切大图：仍报给公告/公会/队伍，让别人别再拿我当可帮
      self._channelHelloAt = now
      local noticeId = GetChannelName(self.HZL_NOTICE)
      if type(noticeId) == "number" and noticeId > 0 then
        self:SendAddon(msg, "CHANNEL", noticeId)
      end
      if IsInGuild() then
        self:SendAddon(msg, "GUILD")
      end
      if IsInGroup() then
        self:SendAddon(msg, IsInRaid() and "RAID" or "PARTY")
      end
      return
    end
    local id = self:JoinSilentChannel(home)
    if not id then
      -- 房间还没加进去就不要记成「已经报过」，否则要再等一分半
      if self.TraceIfChanged then
        self:TraceIfChanged("hello-noroom", "没进房间，这次没上报 " .. tostring(home))
      end
      return
    end
    if self._traceLast then
      self._traceLast["hello-noroom"] = nil
    end
    self._channelHelloAt = now
    self:SendAddon(msg, "CHANNEL", id)
    if self.Trace then
      local raw = tonumber(self.currentRawLayer)
      local label = raw and self.LabelForRaw and self:LabelForRaw(raw) or ""
      self:Trace(string.format("已上报 %s %s %s", tostring(home), label, tostring(mode)))
    end
  end

  local coreEnsure = H.EnsureDiscoveryChannel
  function H:EnsureDiscoveryChannel()
    if self:RoomsEnabled() then
      self:InstallChatGuards()
      self:EnsureRoomChannels()
      return
    end
    self:LeaveRetiredRooms()
    if self.DropStaleRoomPeers then
      self:DropStaleRoomPeers()
    end
    if not self._retireRoomTicker and C_Timer and C_Timer.NewTicker then
      self._retireRoomTicker = C_Timer.NewTicker(3, function()
        if not H.db or H:RoomsEnabled() then
          return
        end
        H:LeaveRetiredRooms()
      end)
      C_Timer.After(30, function()
        if H._retireRoomTicker then
          H._retireRoomTicker:Cancel()
          H._retireRoomTicker = nil
        end
      end)
    end
    local joined = coreEnsure(self)
    if self:IsRetailClient() then
      self:EnsureRetailLayerTicker()
    end
    return joined
  end

  local coreNotice = H.OnDiscoveryChannelNotice
  function H:OnDiscoveryChannelNotice(noticeType, channelName, channelBaseName, channelIndex)
    if self:RoomsEnabled() then
      return self:OnRoomChannelNotice(noticeType, channelName, channelBaseName, channelIndex)
    end
    return coreNotice(self, noticeType, channelName, channelBaseName, channelIndex)
  end

  -- 正式服名单只列当前这张图排过号的层。别的角色/地图留下的 163、182 不并排。
  function H:ListRetailLayers(skipPlayers)
    if self.RetailRebuild then
      self:RetailRebuild()
    end
    local list = {}
    local seen = {}
    local function add(raw)
      raw = tonumber(raw)
      if not raw or seen[raw] then
        return
      end
      local n = self.RetailLayerNum and self:RetailLayerNum(raw)
      if not n and tonumber(self.currentRawLayer) ~= raw then
        return
      end
      seen[raw] = true
      list[#list + 1] = {
        raw = raw,
        label = self:LabelForRaw(raw),
        players = skipPlayers and {} or self:PlayersOnLayer(raw),
        mine = self:IsMyDisplayedLayer(raw),
      }
    end
    if self:IsPaused() then
      if self.currentRawLayer then
        add(self.currentRawLayer)
      end
      return list
    end
    if self.currentRawLayer then
      add(self.currentRawLayer)
    end
    for _, raw in ipairs(self._retailKeys or {}) do
      add(raw)
    end
    if self.SortKnownLayerList then
      self:SortKnownLayerList(list, skipPlayers)
    end
    return list
  end

  local coreList = H.ListKnownLayers
  function H:ListForeverRows(skipPlayers)
    local myMap = self.HomeCanonMap and self:HomeCanonMap() or 0
    if myMap <= 0 then
      myMap = self:MyMapId()
    end
    local now = self:WallNow()
    local mem = self.PEER_UI_TTL or (99 * 60)
    local groups = {}
    local order = {}
    local function canonOf(mapId)
      mapId = tonumber(mapId) or 0
      if mapId > 0 and self.CanonMapId then
        local c = self:CanonMapId(mapId)
        if c and c > 0 then
          return c
        end
      end
      return mapId
    end
    local function onMine(mapId)
      if self.SameHoppableMap and myMap > 0 and mapId > 0 then
        return self:SameHoppableMap(myMap, mapId) and true or false
      end
      return mapId > 0 and mapId == myMap
    end
    local function group(mapId, raw)
      raw = tonumber(raw) or 0
      if raw <= 0 then
        return nil
      end
      mapId = canonOf(mapId)
      local key = tostring(mapId) .. "|" .. tostring(raw)
      local g = groups[key]
      if not g then
        local onMy = onMine(mapId)
        g = {
          raw = raw,
          mapId = mapId,
          label = self:LabelForRaw(raw),
          players = {},
          onMyMap = onMy,
          -- 按钮绿/白跟本行地图走，不按同号别图宿主染绿
          sameMap = onMy,
          mine = false,
          headCount = 0,
          nCan = 0,
        }
        groups[key] = g
        order[#order + 1] = g
      end
      return g
    end
    local cur = tonumber(self.currentRawLayer)
    if cur and cur > 0 and not (self.LayerUnreliable and self:LayerUnreliable()) then
      local g = group(myMap, cur)
      if g then
        g.mine = true
        g.headCount = g.headCount + 1
        if not skipPlayers then
          g.players[#g.players + 1] = { short = "你", mine = true, canHost = false }
        end
      end
    end
    for name, peer in pairs((self.db and self.db.peers) or {}) do
      if peer and tonumber(peer.raw) and not self:IsSelfName(name)
        and self:IsWallStamp(peer.last) and (now - (peer.last or 0)) <= mem then
        local g = group(peer.map, peer.raw)
        if g then
          g.headCount = g.headCount + 1
          if g.onMyMap then
            g.nCan = nil
          end
          if not skipPlayers then
            local showAs = peer.replyAs or name
            g.players[#g.players + 1] = {
              name = name,
              short = self:ShortName(showAs),
              mine = false,
              canHost = self.PeerCanHost and self:PeerCanHost(name, peer) or false,
            }
          end
        end
      end
    end
    table.sort(order, function(a, b)
      if a.onMyMap ~= b.onMyMap then
        return a.onMyMap
      end
      if a.mine ~= b.mine then
        return a.mine
      end
      return (tonumber(a.raw) or 0) < (tonumber(b.raw) or 0)
    end)
    return order
  end

  function H:ListKnownLayers(skipPlayers)
    if not (self.UsesNwbLayerRank and self:UsesNwbLayerRank()) then
      return self:ListForeverRows(skipPlayers)
    end
    local list = coreList(self, skipPlayers)
    if not self:RoomsEnabled() then
      return list
    end
    local seen = {}
    for _, item in ipairs(list or {}) do
      seen[item.raw] = true
      if not skipPlayers then
        item.headCount = self:HeadCountForRaw(item.raw)
      end
    end
    for _, raw in ipairs(self._bookKeys or {}) do
      if not seen[raw] then
        seen[raw] = true
        list[#list + 1] = {
          raw = raw,
          label = self:LabelForRaw(raw),
          players = skipPlayers and {} or self:PlayersOnLayer(raw),
          mine = self:IsMyDisplayedLayer(raw),
          headCount = skipPlayers and nil or self:HeadCountForRaw(raw),
        }
      end
    end
    if self.SortKnownLayerList then
      self:SortKnownLayerList(list, skipPlayers)
    end
    if not skipPlayers then
      self:NoteZeroList(list)
    end
    return list
  end

  H._StartPollCore = H.StartPoll
  function H:StartPoll(targetRaw, opts)
    if not self:RoomsEnabled() then
      return self:_StartPollCore(targetRaw, opts)
    end
    if self:IsForeverClient() then
      local hopMap = opts and tonumber(opts.hopMap)
      local myMap = self.HomeCanonMap and self:HomeCanonMap() or 0
      if hopMap and hopMap > 0 and myMap > 0
        and not (self.SameHoppableMap and self:SameHoppableMap(myMap, hopMap)) then
        if self._lookBusy then
          self:Print("正在确认该位面玩家是否可帮，请稍候")
          return
        end
        self._hopAllowMap = hopMap
        self._hopLookMap = hopMap
        return self:BeginLook(tonumber(targetRaw))
      end
      self._hopAllowMap = nil
      self._hopLookMap = nil
    end
    if opts and opts.skipLoudPig then
      return self:_StartPollCore(targetRaw, opts)
    end
    if self._lookBusy then
      self:Print("正在确认该位面玩家是否可帮，请稍候")
      return
    end
    local coolLeft = self.MyLayerCooldownLeft and self:MyLayerCooldownLeft(tonumber(targetRaw))
    if coolLeft and coolLeft > 0 then
      self:Print("这个位面还要等 " .. self:FormatHopCooldown(coolLeft))
      return
    end
    local hosts = self:GetFairHosts(tonumber(targetRaw)) or {}
    if #hosts > 0 then
      return self:_StartPollCore(targetRaw, opts)
    end
    self:BeginLook(tonumber(targetRaw))
  end

  local coreZone = H.OnZoneChangedForLayer
  function H:OnZoneChangedForLayer(...)
    self._phaseZone = 0
    self._phaseHold = nil
    if self.NwbCopyZoneChanged then
      self:NwbCopyZoneChanged()
    end
    if coreZone then
      return coreZone(self, ...)
    end
  end
end

meshInstall()

local meshFrame = CreateFrame("Frame")
meshFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
meshFrame:SetScript("OnEvent", function()
  if not H.db or not H:LayerMeshOn() then
    return
  end
  local grouped = IsInGroup() and true or false
  if grouped and not H._meshWasGroup then
    local book = H:LayerBook()
    book.joined = H:WallNow()
    book.sticky = nil
    if H.NwbCopyJoinedGroup then
      H:NwbCopyJoinedGroup()
    end
    if H.Trace then
      H:Trace("进了队伍，忘掉刚才的主城")
    end
  end
  H._meshWasGroup = grouped
end)

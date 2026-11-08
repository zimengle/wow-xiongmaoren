local H = HuZhuLayer

-- 轻歌花认层原样搬过来：人必须在该版本主城地图里、对着指定怪才起层，野外号挂到那一层。
-- 对照 NovaWorldBuffs.lua setCurrentLayerText / mapCurrentLayer / GetLayerNum / joinedGroupLayer。

local function fillSet(t, s)
  for id in string.gmatch(s, "%d+") do
    t[tonumber(id)] = true
  end
end

local ORG = {}
local SW = {}
local SHA = {}
local DAL = {}
local PAN = {}
fillSet(ORG, "3373,3350,7792,9856,8673,8724,5611,4485,7565,11178,3368,3364,14182,3890,5195,7562,5909,15188,5639,7567,14990,5885,15006,12351,5613,6986,3144,15579,5883,3367,13842,15106,9550,4043,6466,5875,5188,3327,3345,5606,3358,3369,13445,15746,3353,15116,11871,3324,5597,5603,3335,2704,3316,3323,6929,3404,8659,11066,3410,3322,5811,3344,3331,3365,14942,3309,5816,13418,5640,7231,4752,3359,3346,8122,3318,3348,3189,3329,3360,5610,11176,14843,5815,3332,3363,3351,3357,6987,3325,3321,3330,3230,3216,3412,15765,15761,3362,11177,3317,3312,3352,3328,16007,7790,14451,14392,7793,13420,5882,15354,14726,3334,9317,11017,13417,3319,3372,5614,3355,11868,14376,14375,14377,5892,12799,3342,3333,7230,3401,7294,5817,3361,3407,3403,2855,1383,3320,3354,3413,15309,3356,14540,14541,14539,3366,3371,6446,2857,5958,7088,12353,3315,14498,3313,5812,10266,3349,6018,3314,3370,7311,14727,10540,10880,15105,11046,6014,8404,10088,3400,9988,3406,3347,3399,3402,5910,5994,5609,3405,3408,3409,3326,7010,4047")
fillSet(SW, "5386,6267,1316,1478,1349,1294,4974,1347,1315,1321,914,1747,1141,1284,2708,1312,4984,16105,5493,5491,8670,8719,15659,1646,6090,4981,1302,11068,5519,4960,1212,7232,5384,5514,5484,1351,12336,5489,1444,7917,1319,1752,297,1291,5494,1307,1477,14722,16002,4078,5081,1433,2285,2198,957,1304,4961,3629,5043,461,7207,2504,1314,6171,1286,5515,483,15562,5503,14981,482,1328,5498,3627,5483,1310,16106,1303,14721,1419,1298,5413,6122,6173,5513,466,1346,1333,1750,1348,1416,13436,1289,7798,1427,6089,1324,376,5694,5480,11916,4996,6740,9584,1413,1305,1325,3626,5497,11069,15310,1318,5565,1311,2457,4959,1301,12481,5512,2330,2879,5492,5509,1257,11828,340,13435,11827,1275,15991,15008,1749,1295,2485,1300,2795,16005,8666,5518,8118,5499,1297,1414,1299,1439,928,1754,13283,1317,331,14394,2439,5506,1287,1313,1292,1755,332,8383,1339,338,12480,1440,3513,1751,279,1472,1405,11397,2456,1721,7208,5042,12805,14439,14423,15766,14438,1395,3520,4969,2455,14450,918,1323,1308,2331,11096,5193,1327,1428,1432,6946,277,10782,5496,5567,1320,3581,7295,2327,5504,14497,6579,5502,5564,1326,5520,11026,17804,6174,5482,3628,6237,4995,68,1976,14496,1756,1415,1431,9977,5566,5500,7410,1350,5505,5511,4982,3518,5517,5510,1285,1429,1402,7766,8856,5516,5495,1719,7386,656,1341,11867,5479,1309,1435,1733")
fillSet(SHA, "18481,18940,19046,19232")
fillSet(DAL, "28675,28676,28677,29254,29255,30604,30605,30607,32689,32690,35607")
fillSet(PAN, "65599,67130")

local CLASSIC_MAPS = {}
fillSet(CLASSIC_MAPS, "1411,1412,1413,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450,1451,1452,1453,1454,1455,1456,1457,1458")
local TBC_MAPS = {}
fillSet(TBC_MAPS, "1453,1454,1944,1946,1948,1949,1951,1952,1953,1955,1957")
local WRATH_MAPS = {}
fillSet(WRATH_MAPS, "114,115,116,117,118,119,120,121,125,127")

function H:NwbCopyIsClassic()
  local k = self:ClientKind()
  if k == "classic_era" or k == "forever" then
    return true
  end
  return false
end

function H:NwbCopyMap()
  local k = self:ClientKind()
  if k == "tbc" then
    return 1955
  end
  if k == "wrath" or k == "titan" then
    return 125
  end
  if k == "mists" then
    return 390
  end
  local fac
  pcall(function()
    fac = UnitFactionGroup("player")
  end)
  if fac == "Horde" then
    return 1454
  end
  return 1453
end

function H:NwbCopyNpcs()
  local k = self:ClientKind()
  if k == "tbc" then
    return SHA
  end
  if k == "wrath" or k == "titan" then
    return DAL
  end
  if k == "mists" then
    return PAN
  end
  local fac
  pcall(function()
    fac = UnitFactionGroup("player")
  end)
  if fac == "Horde" then
    return ORG
  end
  return SW
end

function H:NwbCopyWhitelist()
  local k = self:ClientKind()
  if k == "tbc" then
    return TBC_MAPS
  end
  local t = CLASSIC_MAPS
  if k == "wrath" or k == "titan" then
    local m = {}
    for id in pairs(CLASSIC_MAPS) do
      m[id] = true
    end
    for id in pairs(WRATH_MAPS) do
      m[id] = true
    end
    return m
  end
  return t
end

function H:NwbCopyState()
  self._nwbCopy = self._nwbCopy or {
    lastKnownLayerMapID = 0,
    lastKnownLayerMapID_Mapping = 0,
    lastJoinedGroup = 0,
    lastZoneChange = 0,
    phaseCheck = 0,
  }
  return self._nwbCopy
end

function H:NwbCopyLayers()
  local book = self:LayerBook()
  book.nwbLayers = book.nwbLayers or {}
  return book.nwbLayers
end

local function sortedKeys(layers)
  local keys = {}
  for id in pairs(layers or {}) do
    local n = tonumber(id)
    if n then
      keys[#keys + 1] = n
    end
  end
  table.sort(keys)
  return keys
end

function H:NwbCopyGetLayerNum(zoneID)
  zoneID = tonumber(zoneID)
  if not zoneID or zoneID <= 0 then
    return nil
  end
  local layers = self:NwbCopyLayers()
  local keys = sortedKeys(layers)
  for i, id in ipairs(keys) do
    if id == zoneID then
      return i
    end
  end
  for i, cap in ipairs(keys) do
    local row = layers[cap] or layers[tostring(cap)]
    local lm = row and row.layerMap
    if type(lm) == "table" and (lm[zoneID] or lm[tostring(zoneID)]) then
      return i
    end
  end
  return nil
end

function H:NwbCopyCreateLayer(zoneID, lastSeen)
  zoneID = tonumber(zoneID)
  if not zoneID or zoneID <= 0 then
    return
  end
  local layers = self:NwbCopyLayers()
  if layers[zoneID] or layers[tostring(zoneID)] then
    local row = layers[zoneID] or layers[tostring(zoneID)]
    lastSeen = tonumber(lastSeen)
    if row and lastSeen and lastSeen > (tonumber(row.lastSeenNPC) or 0) then
      row.lastSeenNPC = lastSeen
    end
    return
  end
  local capLimit = self:LayerBookLimits()
  local n = 0
  for _ in pairs(layers) do
    n = n + 1
  end
  if n >= capLimit then
    return
  end
  self._nwbBookDirty = true
  local now = self:WallNow()
  lastSeen = tonumber(lastSeen) or now
  layers[zoneID] = {
    created = now,
    lastSeenNPC = lastSeen,
    layerMap = { created = now },
  }
end

function H:NwbCopyJoinedGroup()
  local st = self:NwbCopyState()
  st.lastKnownLayerMapID = 0
  st.lastKnownLayerMapID_Mapping = 0
  st.phaseCheck = nil
  st.lastJoinedGroup = self:WallNow()
end

function H:NwbCopyZoneChanged()
  local st = self:NwbCopyState()
  st.lastZoneChange = self:WallNow()
  st.phaseCheck = 0
end

function H:NwbCopyParseUnit(unit)
  if not unit or not UnitExists(unit) then
    return nil
  end
  if UnitIsPlayer(unit) then
    return nil
  end
  if self.IsOnTransit and self:IsOnTransit() then
    return nil
  end
  if self.IsInInstance and self:IsInInstance() then
    return nil
  end
  local guid = UnitGUID(unit)
  local parts = guid and { strsplit("-", guid) } or nil
  if not parts or parts[1] ~= "Creature" then
    return nil
  end
  local zoneID = tonumber(parts[5])
  local npcID = tonumber(parts[6])
  if not zoneID or zoneID <= 0 or not npcID then
    return nil
  end
  if UnitPlayerControlled and UnitPlayerControlled(unit) then
    return nil
  end
  return zoneID, npcID
end

function H:NwbCopySetCurrent(unit)
  local zoneID, npcID = self:NwbCopyParseUnit(unit)
  if not zoneID then
    return
  end
  local zone = self:MyMapId()
  local layers = self:NwbCopyLayers()
  local st = self:NwbCopyState()
  local now = self:WallNow()
  local npcs = self:NwbCopyNpcs()
  local capMap = self:NwbCopyMap()
  local row = layers[zoneID] or layers[tostring(zoneID)]
  if row then
    if (now - (st.lastJoinedGroup or 0)) > 180 then
      st.lastKnownLayerMapID = zoneID
    end
    if zone == capMap and npcs[npcID]
      and (now - (st.lastJoinedGroup or 0)) > 600
      and (now - (st.lastZoneChange or 0)) > 30 then
      row.lastSeenNPC = now
      st.lastKnownLayerMapID_Mapping = zoneID
    elseif zone == capMap and (now - (st.lastJoinedGroup or 0)) > 600
      and (now - (st.lastZoneChange or 0)) > 30 then
      st.lastKnownLayerMapID_Mapping = zoneID
    end
    return
  end
  if zone == capMap and npcs[npcID] then
    self:NwbCopyCreateLayer(zoneID)
    st.lastKnownLayerMapID_Mapping = zoneID
    if (now - (st.lastJoinedGroup or 0)) > 180 then
      st.lastKnownLayerMapID = zoneID
    end
  end
end

function H:NwbCopyMapLayer(unit)
  local zoneID, npcID = self:NwbCopyParseUnit(unit)
  if not zoneID then
    return
  end
  local zone = self:MyMapId()
  local capMap = self:NwbCopyMap()
  if zone == capMap then
    return
  end
  local st = self:NwbCopyState()
  local now = self:WallNow()
  local layers = self:NwbCopyLayers()
  if (now - (st.lastJoinedGroup or 0)) < 180 then
    return
  end
  if (st.lastKnownLayerMapID or 0) < 1 then
    local found = false
    for cap, row in pairs(layers) do
      local lm = row and row.layerMap
      if type(lm) == "table" then
        local m = lm[zoneID] or lm[tostring(zoneID)]
        if m and tonumber(m) == zone then
          st.lastKnownLayerMapID = tonumber(cap)
          found = true
          break
        end
      end
    end
    if not found then
      return
    end
  end
  if zoneID == st.lastKnownLayerMapID then
    return
  end
  local fac
  pcall(function()
    fac = UnitFactionGroup("player")
  end)
  if (fac == "Horde" and npcID == 68) or (fac == "Alliance" and npcID == 3296) then
    return
  end
  if self:NwbCopyIsClassic() then
    if (now - (st.lastJoinedGroup or 0)) < 180 then
      return
    end
  else
    if (st.lastJoinedGroup or 0) > 0 then
      return
    end
  end
  if st.phaseCheck ~= 0 and st.phaseCheck ~= nil and st.phaseCheck ~= zoneID then
    self:NwbCopyJoinedGroup()
    return
  end
  st.phaseCheck = zoneID
  local cap = st.lastKnownLayerMapID
  local row = layers[cap] or layers[tostring(cap)]
  if not row then
    return
  end
  row.layerMap = row.layerMap or {}
  if row.layerMap[zoneID] or row.layerMap[tostring(zoneID)] then
    return
  end
  for _, other in pairs(layers) do
    local lm = other.layerMap
    if type(lm) == "table" then
      if lm[zoneID] or lm[tostring(zoneID)] then
        st.lastKnownLayerMapID = 0
        return
      end
    end
  end
  for _, m in pairs(row.layerMap) do
    if tonumber(m) == zone then
      return
    end
  end
  if not self:NwbCopyIsClassic() then
    local offset = math.abs(zoneID - cap)
    if offset > 200 and (st.lastKnownLayerMapID_Mapping or 0) == 0 then
      return
    end
  end
  local white = self:NwbCopyWhitelist()
  if not white[zone] then
    return
  end
  if layers[zoneID] or layers[tostring(zoneID)] then
    return
  end
  row.layerMap[zoneID] = zone
  self._nwbBookDirty = true
end

function H:NwbCopyOnUnit(unit)
  if not self:LayerMeshOn() or not self.db then
    return
  end
  local now = (self.Now and self:Now()) or 0
  if (now - (self._nwbCopyBurstAt or 0)) >= 1 then
    self._nwbCopyBurst = 0
    self._nwbCopyBurstAt = now
  end
  if (self._nwbCopyBurst or 0) >= 4 then
    return
  end
  self._nwbCopyBurst = (self._nwbCopyBurst or 0) + 1
  self:NwbCopySetCurrent(unit)
  self:NwbCopyMapLayer(unit)
end

function H:NwbCopySyncBook()
  if not self:LayerMeshOn() or not self.db then
    return
  end
  -- 全服已有轻歌花表：本地仍记，不当成新的编号源发出去
  if self:NwbOwnsLayerNumbers() or self._bookSrc == "N" then
    return
  end
  local book = self:LayerBook()
  local now = self:WallNow()
  local _, expire = self:LayerBookLimits()
  local layers = self:NwbCopyLayers()
  for id, row in pairs(layers) do
    local seen = tonumber(row.lastSeenNPC) or tonumber(row.created) or 0
    if seen > 0 and (now - seen) > expire then
      layers[id] = nil
    end
  end
  book.ruler = "capital"
  book.rulerMap = 0
  book.cap = {}
  book.wild = {}
  local keys = sortedKeys(layers)
  local index = {}
  for i, id in ipairs(keys) do
    local row = layers[id] or layers[tostring(id)]
    book.cap[tostring(id)] = (row and row.lastSeenNPC) or now
    index[id] = i
    local lm = row and row.layerMap
    if type(lm) == "table" then
      for zid, map in pairs(lm) do
        local z = tonumber(zid)
        if z and z ~= id then
          book.wild[tostring(z)] = { cap = tostring(id), map = tonumber(map) or 0, seen = now }
          index[z] = i
        end
      end
    end
  end
  self._bookKeys = keys
  self._bookMap = index
  self._bookSrc = "S"
  local st = self:NwbCopyState()
  local stick = tonumber(st.lastKnownLayerMapID)
  if stick and stick > 0 and book.cap[tostring(stick)] then
    book.sticky = stick
  end
  if self.PublishOwnRuler then
    self:PublishOwnRuler()
  end
  if self.MaybeSendLayerTable and not self._lytSending then
    self:MaybeSendLayerTable()
  end
end

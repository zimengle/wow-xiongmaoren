local H = HuZhuLayer

-- 求切/换线详细日记：本机 SavedVariables，供复盘位面规则
H.HOP_LOG_MAX = 8000

function H:HopLogZoneText()
  local z = ""
  pcall(function()
    z = (GetRealZoneText and GetRealZoneText()) or (GetZoneText and GetZoneText()) or ""
  end)
  local sub = ""
  pcall(function()
    sub = (GetSubZoneText and GetSubZoneText()) or ""
  end)
  if sub ~= "" and sub ~= z then
    return z .. "/" .. sub
  end
  return z
end

function H:BeginHopLogSession(targetRaw)
  self._hopSessionId = (self._hopSessionId or 0) + 1
  self._hopLogFrom = tonumber(self.currentRawLayer)
  self._hopLogTo = tonumber(targetRaw)
  return self._hopSessionId
end

function H:HopLog(ev, fields)
  if not self.db then
    return
  end
  fields = fields or {}
  self.db.hopLog = self.db.hopLog or {}
  local e = {
    t = self:WallNow(),
    ev = tostring(ev or "?"),
    id = fields.id or self._hopSessionId,
    from = tonumber(fields.from) or self._hopLogFrom or tonumber(self.currentRawLayer),
    to = tonumber(fields.to) or self._hopLogTo,
    who = fields.who and tostring(fields.who) or nil,
    via = fields.via and tostring(fields.via) or nil,
    why = fields.why and tostring(fields.why) or nil,
    ok = fields.ok,
    n = tonumber(fields.n),
    idx = tonumber(fields.idx),
    map = tonumber(fields.map) or (self.MyMapId and tonumber(self:MyMapId())) or nil,
    zone = fields.zone or self:HopLogZoneText(),
    client = fields.client or (self.ClientKind and self:ClientKind()) or nil,
    char = fields.char or (self.MyVisitCharKey and self:MyVisitCharKey()) or nil,
    pig = fields.pig,
    group = fields.group,
    inst = fields.inst,
  }
  if e.group == nil and IsInGroup then
    e.group = IsInGroup() and true or false
  end
  if e.inst == nil and self.IsInInstance then
    e.inst = self:IsInInstance() and true or false
  end
  table.insert(self.db.hopLog, e)
  local maxN = self.HOP_LOG_MAX or 500
  local log = self.db.hopLog
  local n = #log
  if n > maxN then
    local keep = {}
    for i = n - maxN + 1, n do
      keep[#keep + 1] = log[i]
    end
    self.db.hopLog = keep
  end
end

function H:Trace(why, fields)
  if not why then
    return
  end
  fields = fields or {}
  fields.why = why
  self:HopLog("trace", fields)
end

-- 日记用：锁住的字不能打印，只标「锁」。
function H:DiaryBit(v, limit)
  if v == nil then
    return "空"
  end
  if issecretvalue and issecretvalue(v) then
    return "锁"
  end
  limit = tonumber(limit) or 80
  local ok, s = pcall(tostring, v)
  if not ok or type(s) ~= "string" then
    return "读失败"
  end
  if #s > limit then
    return s:sub(1, limit)
  end
  return s
end

function H:TraceIfChanged(key, why)
  if not key or not why then
    return
  end
  self._traceLast = self._traceLast or {}
  if self._traceLast[key] == why then
    return
  end
  self._traceLast[key] = why
  self:Trace(why)
end

function H:HopLogClear()
  if not self.db then
    return
  end
  self.db.hopLog = {}
end

function H:HopLogCount()
  return self.db and self.db.hopLog and #self.db.hopLog or 0
end

local function fmtTime(ts)
  ts = tonumber(ts)
  if not ts or ts < 1000000000 then
    return "?"
  end
  return date("%m-%d %H:%M:%S", ts)
end

function H:HopLogLine(e)
  if not e then
    return ""
  end
  local parts = {
    fmtTime(e.t),
    e.id and ("#" .. tostring(e.id)) or "#-",
    tostring(e.ev or "?"),
  }
  if e.from or e.to then
    table.insert(parts, tostring(e.from or "?") .. "→" .. tostring(e.to or "?"))
  end
  if e.who then
    table.insert(parts, e.who)
  end
  if e.via then
    table.insert(parts, "via=" .. e.via)
  end
  if e.ok == true then
    table.insert(parts, "成功")
  elseif e.ok == false then
    table.insert(parts, "失败")
  end
  if e.n then
    table.insert(parts, "n=" .. tostring(e.n))
  end
  if e.idx then
    table.insert(parts, "第" .. tostring(e.idx) .. "人")
  end
  if e.map then
    table.insert(parts, "图" .. tostring(e.map))
  end
  if e.zone and e.zone ~= "" then
    table.insert(parts, e.zone)
  end
  if e.why and e.why ~= "" then
    table.insert(parts, e.why)
  end
  if e.pig == true then
    table.insert(parts, "含PIG")
  end
  return table.concat(parts, " · ")
end

-- 聊天框打印最近 n 条（默认 20，最多 80）
-- 卡顿对照：只记「这一帧超过 0.1 秒」和「插件自己某段超过 30 毫秒」。平时不写。
function H:StallNote(kind, name, ms, extra)
  if not self.db then
    return
  end
  self.db.stallLog = self.db.stallLog or {}
  local log = self.db.stallLog
  log[#log + 1] = {
    t = self.WallNow and self:WallNow() or (time and time() or 0),
    kind = kind,
    name = name,
    ms = math.floor((tonumber(ms) or 0) + 0.5),
    extra = extra,
  }
  while #log > 200 do
    table.remove(log, 1)
  end
end

function H:StallBegin(name)
  self._stallName = name
  self._stallT0 = debugprofilestop and debugprofilestop() or nil
end

function H:StallEnd()
  local name = self._stallName
  local t0 = self._stallT0
  self._stallName = nil
  self._stallT0 = nil
  if not name or not t0 or not debugprofilestop then
    return
  end
  local dt = debugprofilestop() - t0
  self._stallLast = name
  self._stallLastMs = dt
  self._stallLastAt = GetTime and GetTime() or 0
  if dt >= 30 then
    self:StallNote("动作慢", name, dt, nil)
  end
end

function H:StartStallWatch()
  if self._stallWatch then
    return
  end
  self._stallWatch = true
  local f = CreateFrame("Frame")
  f:SetScript("OnUpdate", function(_, elapsed)
    if not elapsed or elapsed < 0.1 or elapsed >= 2 then
      return
    end
    local now = GetTime and GetTime() or 0
    local age = (H._stallLastAt and now > 0) and (now - H._stallLastAt) or nil
    local extra
    if H._stallLast and age and age >= 0 and age < 2 then
      extra = string.format("上一动作 %s 花了%.0f毫秒 距今%.2f秒", H._stallLast, H._stallLastMs or 0, age)
    else
      extra = "这两秒里没有插件在干活"
    end
    H:StallNote("画面卡", "这一帧", elapsed * 1000, extra)
  end)
end

function H:HopLogPrintRecent(n)
  n = tonumber(n) or 20
  if n < 1 then
    n = 1
  end
  if n > 200 then
    n = 200
  end
  local log = self.db and self.db.hopLog or {}
  local total = #log
  if total == 0 then
    self:Print("求切日志：暂无记录")
    return
  end
  local from = total - n + 1
  if from < 1 then
    from = 1
  end
  self:Print(string.format("求切日志：共 %d 条，显示最近 %d 条（本机存档，/hzl log clear 清空）", total, total - from + 1))
  for i = from, total do
    self:Print(self:HopLogLine(log[i]))
  end
end

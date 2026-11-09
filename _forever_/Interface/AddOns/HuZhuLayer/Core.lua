local ADDON = ...
HuZhuLayer = HuZhuLayer or {}
local H = HuZhuLayer

H.ADDON_NAME = "HuZhuLayer"
H.PREFIX = "HZL"
H.VERSION = "1.1.328"
H.LIST_VISIBLE_ROWS = 10 -- 列表最多同时显示行数，超出可滚动
H.LOAD_TICK = 0.1 -- 所有加载：进入的数据和画界面都按这个间隔摊开
H.LOAD_IN_MAX = 6 -- 每个间隔最多收几条上报
H.SCAN_SLICE = 8 -- 每个间隔最多扫几块姓名板
H.PANEL_OPEN_TICK = 0.1 -- 同 LOAD_TICK（名单泵沿用）
H.PANEL_OPEN_IN_MAX = 6
-- 一包装多客户端：toc 多 Interface；运行时按 tocversion 分支（姓名等）
-- classic_era / tbc / titan / mists / forever / retail(正式服 12.x)
-- 综合不再自动发言。各版本发现都走「互助切位面」。
-- 无限：可见短码报位面（无竖线，避免 Invalid escape）。
-- 各版本：互助切位面保持在频，但不挂进聊天框（不可见、不退出）。
-- 公会和队伍仍走插件消息；花名册认人后密语补位面。
H.HZL_CHANNEL = "互助切位面"
H.HZL_CHANNEL_FOREVER = "大脚世界频道" -- 旧发现频，仅作对照，不再当发现主路
H.HZL_CHANNEL_LEGACY = { "HuZhuLayer", "huzhulayer" }
H.PEER_TTL = 600 -- 软新鲜（剪枝/可帮判断）；真正求切前会再核实
H.PEER_LIVE_TTL = 120 -- 公会心跳约 90 秒，两分钟内报过位面才当在线
H.PEER_UI_TTL = 15 * 60 -- 列表只显示近 15 分钟内报过线的人（勿再拉到 99 分钟）
H.PING_PROBE_WAIT = 2.0 -- 求切前等待 PING 回复
H.LAYER_TTL = 900
H.POLL_WAIT = 5.5 -- 给对方自动发出邀请的时间；邀不出去则继续下一位
H.ACCEPT_WAIT = 12 -- 对方确认邀请后，等进队的秒数
H.BUSY_COOLDOWN = 45 -- 对方 BUSY 后短时不再求
H.HELLO_TICK = 90 -- 公会/队伍 + 专用频道心跳（密语网另有更稀的闸）
H.CHANNEL_HELLO_GAP = 90 -- 专用频道 HELLO 间隔（平时心跳）
H.CHANNEL_SEND_MIN_GAP = 2 -- 发现频道无论何时至少隔 2 秒才发下一条（含刚认出位面的强制重报）
H.ROSTER_CACHE_GAP = 600 -- 互助花名册名单缓存重读间隔（秒）；问人仍每 2 秒一个
H.ROOM_SPLIT_AT = 500 -- 一间超过这些人连报两次就加开
H.ROOM_KEEP_AT = 250 -- 还有房间达到这个人数就不合并（拆房线一半，避免来回拆合）
H.SOFT_HELLO_GAP = 12 -- 软心跳最短间隔，避免进出战斗连发
H.SCAN_TICK = 1.5 -- 已认出时的扫描间隔
H.SCAN_TICK_FAST = 0.6 -- 未认出时更快扫
H.PROBE_GAP = 2.5 -- 未认出时主动探测间隔
H.MESH_WHISPER_MAX = 1 -- 每次完整心跳最多密语刷新 1 个同伴（降「未找到玩家」刷屏）
H.MESH_WHISPER_GAP = 300 -- 同一同伴两次密语网刷新最短间隔（秒）
H.MESH_FAIL_COOLDOWN = 1800 -- 系统提示「未找到」后，该同伴多久内不再密语探测
H.HELP_SHOW = 5.5 -- 与 POLL_WAIT 对齐，等系统确认邀请是否发出
H.MISS_LIMIT = 2
H.SKIP_MINUTES = 10
-- 短暂打开姓名板用的 CVar（探测后还原）
H.PROBE_NAMEPLATE_CVARS = {
  "nameplateShowAll",
  "nameplateShowEnemies",
  "nameplateShowFriends",
  "nameplateShowFriendlyNPCs",
  "nameplateShowEnemyNPCs",
  "nameplateShowFriendlyPets",
  "nameplateShowEnemyPets",
  "nameplateShowFriendlyGuardians",
  "nameplateShowEnemyGuardians",
  "nameplateShowFriendlyTotems",
  "nameplateShowEnemyTotems",
}

local defaults = {
  autoHelp = true, -- 默认帮助他人；无设置开关
  paused = false, -- 旧账号级字段；现以 chars[guid].paused 为准
  chatAlert = false,
  minimap = { hide = false },
  panel = {}, -- 列表面板位置 { x, y }；空则用默认偏下居中
  thanksDay = nil, -- 旧账号级；现以 chars[guid].thanksDay 为准
  partyChat = true, -- 求切进队问候 / 离队前感谢（队伍频道）
  peers = {},
  -- 装过互助的人长期花名册：登录清 peers 也不删；只增不主动清空
  installBook = {},
  seenLayers = {},
  -- [Player-GUID] = { [rawLayer] = 墙钟秒 }：每位角色自己的到访时间，互不共用
  myVisits = {},
  -- [Player-GUID] = { [rawLayer] = 墙钟秒 }：求切离开该层的时间；自己走路换层不写
  hopLeaves = {},
  -- [Player-GUID] = { paused, thanksDay, myMiss={miss,skipUntil} }
  chars = {},
  askStats = {}, -- [name] = { lastAsk=0, miss=0, skipUntil=0 }
  -- 求切/换线详细日记（HopLog.lua）；复盘用，上限见 H.HOP_LOG_MAX
  hopLog = {},
}

function H:CopyDefaults(dst, src)
  for k, v in pairs(src) do
    if type(v) == "table" then
      if type(dst[k]) ~= "table" then
        dst[k] = {}
      end
      self:CopyDefaults(dst[k], v)
    elseif dst[k] == nil then
      dst[k] = v
    end
  end
end

function H:Print(...)
  local parts = { ... }
  for i = 1, #parts do
    parts[i] = tostring(parts[i])
  end
  if DEFAULT_CHAT_FRAME then
    DEFAULT_CHAT_FRAME:AddMessage("|cff66ccff[互助切位面]|r " .. table.concat(parts, " "))
  end
end

function H:Now()
  return GetTime()
end

function H:WallNow()
  return time()
end

-- 墙钟秒（约 1e9+）；旧版误用 GetTime 会话秒写入的值一律视为废
function H:IsWallStamp(ts)
  ts = tonumber(ts) or 0
  return ts >= 1000000000
end

-- 客户端种类（缓存）：决定姓名规则等；认线 GUID 段用 zoneUID（第 5 段）
function H:ClientKind()
  if self._clientKind then
    return self._clientKind
  end
  local toc = 0
  pcall(function()
    toc = select(4, GetBuildInfo()) or 0
  end)
  toc = tonumber(toc) or 0
  local kind = "unknown"
  if toc >= 11400 and toc < 12000 then
    kind = "classic_era"
  elseif toc >= 20000 and toc < 30000 then
    kind = "tbc"
  elseif toc >= 38000 and toc < 39000 then
    kind = "titan"
  elseif toc >= 30000 and toc < 40000 then
    kind = "wrath"
  elseif toc >= 40000 and toc < 50000 then
    kind = "cata"
  elseif toc >= 50000 and toc < 60000 then
    kind = "mists"
  elseif toc >= 100000 then
    kind = "retail"
  elseif toc >= 16000 and toc < 17000 then
    kind = "forever"
  elseif WOW_PROJECT_ID then
    if WOW_PROJECT_MAINLINE and WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
      kind = "retail"
    elseif WOW_PROJECT_BURNING_CRUSADE_CLASSIC and WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
      kind = "tbc"
    elseif WOW_PROJECT_WRATH_CLASSIC and WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
      kind = "wrath"
    elseif WOW_PROJECT_CATACLYSM_CLASSIC and WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC then
      kind = "cata"
    elseif WOW_PROJECT_MISTS_CLASSIC and WOW_PROJECT_ID == WOW_PROJECT_MISTS_CLASSIC then
      kind = "mists"
    elseif WOW_PROJECT_CLASSIC and WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
      kind = "classic_era"
    end
  end
  self._clientKind = kind
  return kind
end

function H:IsClassicEra()
  return self:ClientKind() == "classic_era"
end

-- 装了轻歌花 3.49 的版本，位面一、二跟它当前这个世界的层号走。
-- 经典怀旧没有轻歌花时仍按原来的办法排。无限服不读轻歌花。
function H:UsesNwbLayerRank()
  if self:IsForeverClient() then
    return false
  end
  if self:IsClassicEra() then
    return true
  end
  return type(_G.NWB_GetLayerData) == "function"
end

function H:IsTbcClient()
  return self:ClientKind() == "tbc"
end

function H:IsTitanClient()
  return self:ClientKind() == "titan"
end

function H:IsWrathClient()
  return self:ClientKind() == "wrath"
end

function H:IsMistsClient()
  return self:ClientKind() == "mists"
end

function H:IsRetailClient()
  return self:ClientKind() == "retail"
end

-- 发现频道发看得见的字（无限用无竖线短码；其它版本仍可用 HELLO 串，发送侧已统一短码）。
function H:UsesVisibleChannelHello()
  return true
end

-- 互助切位面已停用，不再挂回聊天窗口。
function H:ShowsDiscoveryChannel()
  return not self:IsForeverClient()
end

-- 发现用的频道短名。各版本都是互助切位面。
function H:GetDiscoveryChannelName()
  return self.HZL_CHANNEL or "互助切位面"
end

-- 同公会即可求切。同一张图的人先问、先显示；别的图排后面，不因此拒绝。
function H:RequiresSameMapForHop()
  return not self:IsForeverClient()
end

-- 怀旧系 + 正式服：裸名/名-服；无限：名 姓
function H:UsesClassicNames()
  local k = self:ClientKind()
  return k == "classic_era"
    or k == "tbc"
    or k == "titan"
    or k == "wrath"
    or k == "cata"
    or k == "mists"
    or k == "retail"
end

function H:IsForeverClient()
  return self:ClientKind() == "forever"
end

function H:ClientKindLabel()
  local k = self:ClientKind()
  if k == "classic_era" then
    return "经典怀旧"
  end
  if k == "tbc" then
    return "燃烧的远征"
  end
  if k == "titan" then
    return "泰坦时光"
  end
  if k == "wrath" then
    return "巫妖王之怒"
  end
  if k == "cata" then
    return "大地的裂变"
  end
  if k == "mists" then
    return "熊猫人之谜"
  end
  if k == "retail" then
    return "正式服"
  end
  if k == "forever" then
    return "无限"
  end
  return "未知客户端"
end

-- Forever：GUID/名字等在受污染执行里可能是 secret，禁止用 == "" / 拼接比较（会报错并连带禁用）
function H:IsReadableValue(v)
  if v == nil then
    return false
  end
  local secret = false
  pcall(function()
    if issecretvalue and issecretvalue(v) then
      secret = true
    end
  end)
  if secret then
    local access = true
    pcall(function()
      if canaccessvalue then
        access = canaccessvalue(v) and true or false
      end
    end)
    return access
  end
  return type(v) == "string" and v ~= ""
end

-- 聊天框事件里的发言人：自己发言常是 string；别人发言在无限上可能不是 string，
-- 但 tostring 能取出和聊天框一样的「名 姓」。认人必须走这里，禁止只认 type==string。
-- 日记已证：DiaryBit 能印「人恶魔 法爷」，旧逻辑却写「不是招呼」——就是只认 string。
function H:CoerceChatPersonName(v)
  if v == nil then
    return nil
  end
  local secret = false
  pcall(function()
    if issecretvalue and issecretvalue(v) then
      secret = true
    end
  end)
  if secret then
    -- 与 IsReadableValue 一致：没有 canaccessvalue 时默认当作可读，禁止误判成空
    local access = true
    pcall(function()
      if canaccessvalue then
        access = canaccessvalue(v) and true or false
      end
    end)
    if not access then
      return nil
    end
  end
  if type(v) == "string" then
    return v ~= "" and v or nil
  end
  local ok, s = pcall(tostring, v)
  if not ok or type(s) ~= "string" or s == "" or s == "nil" then
    return nil
  end
  if s == "userdata" or s == "table" or s == "function" or s == "boolean" or s == "true" or s == "false" then
    return nil
  end
  -- 日记能印出的字（非「空/锁/读失败」）一律当人名；禁止再「看得见却不是招呼」
  if s == "空" or s == "锁" or s == "读失败" then
    return nil
  end
  return s
end

-- 无限：名字是两段（姓、名），中间一个空格，两段都要留下。其它版本仍是一整段。
-- 返回可密语、可进花名册的名字；战利品整句、只剩一段的，返回空。
function H:ChatPersonName(name)
  if name ~= nil and type(name) ~= "string" then
    name = self:CoerceChatPersonName(name)
  end
  if type(name) ~= "string" or name == "" or #name > 48 then
    return nil
  end
  name = name:gsub("^%s+", ""):gsub("%s+$", "")
  if self.StripFakeRealmSuffix then
    name = self:StripFakeRealmSuffix(name) or name
  end
  if self.StripOwnRealm then
    name = self:StripOwnRealm(name) or name
  end
  local forever = self.IsForeverClient and self:IsForeverClient()
  if forever and not name:find(" ", 1, true) and name:find(":", 1, true) then
    local a, b, rest = name:match("^([^:]+):([^:]+):?(.*)$")
    if a and b and a ~= "" and b ~= "" and not b:match("^%d+$") and (rest == nil or rest == "" or rest:match("^%d+$")) then
      name = a .. " " .. b
    end
  end
  if name:find("|", 1, true) or name:find("：", 1, true) then
    return nil
  end
  if name:find("获得", 1, true) or name:find("物品", 1, true) or name:find("cnIQ", 1, true) then
    return nil
  end
  if name:find("[", 1, true) or name:find("]", 1, true) or name:find("。", 1, true) then
    return nil
  end
  if forever then
    name = name:gsub(":%d+$", "")
    local a, b = name:match("^(%S+)%s+(%S+)$")
    if not a or not b or a:find(":", 1, true) or b:find(":", 1, true) then
      return nil
    end
    return a .. " " .. b
  end
  if name:find(":", 1, true) or name:find("  ", 1, true) then
    return nil
  end
  local spaces = 0
  for _ in name:gmatch(" ") do
    spaces = spaces + 1
  end
  if spaces > 1 then
    return nil
  end
  return name
end

function H:IsChatPersonName(name)
  return self:ChatPersonName(name) ~= nil
end

function H:IsReadableGuid(guid)
  return self:IsReadableValue(guid)
end

-- 当前角色私有状态（暂停 / 感谢日 / 帮助 miss）
function H:CharBag()
  local guid = UnitGUID("player")
  if not self:IsReadableGuid(guid) or not self.db then
    return nil
  end
  self.db.chars = self.db.chars or {}
  local c = self.db.chars[guid]
  if not c then
    c = {
      paused = false,
      thanksDay = nil,
      myMiss = { miss = 0, skipUntil = 0 },
    }
    -- 只把旧账号级状态迁给「升级后第一个登录的角色」，其它角色从零开始
    if not self.db._charStateMigrated then
      c.paused = self.db.paused and true or false
      c.thanksDay = self.db.thanksDay
      if type(self.db.myMiss) == "table" then
        c.myMiss = {
          miss = tonumber(self.db.myMiss.miss) or 0,
          skipUntil = tonumber(self.db.myMiss.skipUntil) or 0,
        }
      end
      self.db._charStateMigrated = true
    end
    self.db.chars[guid] = c
  end
  c.myMiss = c.myMiss or { miss = 0, skipUntil = 0 }
  return c
end

function H:GetMyMiss()
  local c = self:CharBag()
  if not c then
    return { miss = 0, skipUntil = 0 }
  end
  c.myMiss = c.myMiss or { miss = 0, skipUntil = 0 }
  return c.myMiss
end

-- 登录/重载：清掉 GetTime 时代的同伴/位面时间戳，避免幽灵在线、假可求切
function H:SanitizeSessionClocks()
  if not self.db then
    return
  end
  for _, peer in pairs(self.db.peers or {}) do
    if peer then
      if not self:IsWallStamp(peer.last) then
        peer.last = 0
      end
      if peer.lastWhisper and not self:IsWallStamp(peer.lastWhisper) then
        peer.lastWhisper = 0
      end
      if peer.busyUntil and not self:IsWallStamp(peer.busyUntil) then
        peer.busyUntil = 0
      end
    end
  end
  for _, info in pairs(self.db.seenLayers or {}) do
    if info then
      if not self:IsWallStamp(info.last) then
        info.last = 0
      end
      if info.first and not self:IsWallStamp(info.first) then
        info.first = info.last or 0
      end
      info.myLast = nil -- 旧账号共用字段废弃
    end
  end
  for _, bag in pairs(self.db.hopLeaves or {}) do
    if type(bag) == "table" then
      for k, ts in pairs(bag) do
        if not self:IsWallStamp(ts) then
          bag[k] = nil
        end
      end
    end
  end
  self.db._meetPing = {}
end

-- 真实服务器名（不要用 UnitFullName 第二段：无限服那常是「姓」）
function H:GetRealRealm()
  local r
  pcall(function()
    if GetNormalizedRealmName then
      r = GetNormalizedRealmName()
    end
  end)
  if type(r) == "string" and r ~= "" then
    return r
  end
  pcall(function()
    if GetRealmName then
      r = GetRealmName()
    end
  end)
  if type(r) == "string" and r ~= "" then
    r = r:gsub("%s+", "")
    return r
  end
  return nil
end

-- 「名 姓-姓」这种把姓当成服务器的坏名 → 去掉错误后缀
function H:StripFakeRealmSuffix(name)
  if not name or not name:find("-", 1, true) then
    return name
  end
  local base, realm = name:match("^(.-)%-(.+)$")
  if not base or not realm or realm == "" then
    return name
  end
  -- 愈合 德鲁伊-德鲁伊 → 愈合 德鲁伊
  local lastWord = base:match("(%S+)$")
  if lastWord and lastWord == realm then
    return base
  end
  -- 后缀根本不是本服真实服务器名，且基名已含空格（名 姓）→ 多半是误拼，去掉
  local real = self:GetRealRealm()
  if base:find(" ", 1, true) and real and realm ~= real and realm:gsub("%s+", "") ~= real then
    return base
  end
  return name
end

-- 同服密语/邀请：去掉 -服务器（带上反而「找不到在线玩家」）
function H:StripOwnRealm(name)
  if not name or not name:find("-", 1, true) then
    return name
  end
  local base, realm = name:match("^(.-)%-(.+)$")
  if not base or not realm then
    return name
  end
  -- Forever「名 姓」带任意 -后缀：密语一律只用名姓
  if base:find(" ", 1, true) then
    return base
  end
  local real = self:GetRealRealm()
  if not real or real == "" then
    return name
  end
  local a = realm:gsub("%s+", ""):lower()
  local b = real:gsub("%s+", ""):lower()
  -- 完全相等，或互相包含（Normalized 与 GetRealmName 写法常不一致）
  if a == b or realm == real or a:find(b, 1, true) or b:find(a, 1, true) then
    return base
  end
  return name
end

-- 登录时把旧同伴键里的坏名洗成可密语的 replyAs
function H:MigratePeerNames()
  if not self.db or not self.db.peers then
    return
  end
  for name, peer in pairs(self.db.peers) do
    if peer then
      local clean = self:ReplyName(peer.replyAs or name)
      if clean and clean ~= "" then
        peer.replyAs = clean
      end
    end
  end
  if self.db.askStats then
    local fix = {}
    for name, st in pairs(self.db.askStats) do
      local clean = self:NormalizeName(name)
      if clean and clean ~= name then
        fix[name] = clean
      end
    end
    for old, new in pairs(fix) do
      if not self.db.askStats[new] then
        self.db.askStats[new] = self.db.askStats[old]
      end
      self.db.askStats[old] = nil
    end
  end
end

function H:PlayerFullName()
  -- 怀旧/TBC/泰坦：UnitFullName 第二段是服务器；密语用裸名
  if self:UsesClassicNames() then
    local name
    pcall(function()
      local n = UnitFullName("player")
      if type(n) == "string" and n ~= "" then
        name = n
      end
    end)
    if not name then
      name = UnitName("player")
    end
    if not name or name == "" then
      return "?"
    end
    return self:StripOwnRealm(name) or name
  end
  -- Forever：密语身份用 UnitName「名 姓」，不要拼 -服务器
  local name = UnitName("player")
  local full, second = UnitFullName("player")
  if type(full) == "string" and full ~= "" then
    if full:find(" ", 1, true) then
      name = full
    elseif type(second) == "string" and second ~= "" then
      local real = self:GetRealRealm()
      if real and (second == real or second:gsub("%s+", "") == real) then
        name = full
      else
        name = full .. " " .. second
      end
    else
      name = full
    end
  end
  if not name or name == "" then
    return "?"
  end
  name = self:StripFakeRealmSuffix(name)
  name = self:StripOwnRealm(name)
  return name
end

-- 内部字典键：可带服务器；密语不要用这个
function H:NormalizeName(name)
  if not name or name == "" then
    return nil
  end
  name = self:StripFakeRealmSuffix(name)
  name = self:StripOwnRealm(name)
  if name:find("-", 1, true) then
    return name
  end
  local real = self:GetRealRealm()
  local lastWord = name:match("(%S+)$")
  if real and real ~= "" and lastWord ~= real then
    return name .. "-" .. real
  end
  return name
end

-- 密语/邀请专用：只要「名 姓」，禁止 Ambiguate("none")（它会强行加 -Realm）
function H:ReplyName(name)
  if not name or name == "" then
    return nil
  end
  name = self:StripFakeRealmSuffix(name)
  name = self:StripOwnRealm(name)
  return name
end

-- 对同伴发密语/邀请时：优先用对方上次消息里的原名，并去掉本服后缀
function H:WhisperTarget(name)
  if not name or name == "" then
    return nil
  end
  local picked = nil
  if self.db and self.db.peers then
    local peer = self.db.peers[name]
    if peer and peer.replyAs and peer.replyAs ~= "" then
      picked = peer.replyAs
    else
      local key = self:NormalizeName(name)
      peer = key and self.db.peers[key]
      if peer and peer.replyAs and peer.replyAs ~= "" then
        picked = peer.replyAs
      else
        for _, p in pairs(self.db.peers) do
          if p and p.replyAs and (p.replyAs == name or self:NormalizeName(p.replyAs) == key) then
            picked = p.replyAs
            break
          end
        end
      end
    end
  end
  return self:ReplyName(picked or name)
end

function H:ShortName(name)
  if not name then
    return "?"
  end
  if self.IsForeverClient and self:IsForeverClient() and self.ChatPersonName then
    return self:ChatPersonName(name) or self:BareCharacterName(name) or name
  end
  name = self:ReplyName(name) or name
  local base = name:match("^([^-]+)") or name
  if Ambiguate then
    return Ambiguate(base, "short") or base
  end
  return base
end

function H:IsInInstance()
  local _, instanceType = IsInInstance()
  return instanceType and instanceType ~= "none"
end

-- 和轻歌花一样：只认游戏说的鸟点飞行。不认飞艇、船，也不靠坐标猜。
function H:IsOnTransit()
  return UnitOnTaxi and UnitOnTaxi("player") and true or false
end

-- 房间被忘掉时用。人眼能看懂的原因，不改原来的判断。
function H:TransitBlockReason()
  if self:IsInInstance() then
    return "在副本"
  end
  if UnitOnTaxi and UnitOnTaxi("player") then
    return "坐鸟"
  end
  local id = self:MyMapId()
  if not id or id <= 0 then
    return "没有地图号"
  end
  if (self:CanonMapId(id) or 0) <= 0 then
    return "这张图不能切 " .. tostring(id)
  end
  return nil
end

function H:IsHoppableHere()
  if self:IsInInstance() then
    return false
  end
  if self:IsOnTransit() then
    return false
  end
  local id = self:MyMapId()
  if not id or id <= 0 then
    return false
  end
  return (self:CanonMapId(id) or 0) > 0
end

function H:MyHoppableMapId()
  if not self:IsHoppableHere() then
    return 0
  end
  return self:MyMapId()
end

function H:RefreshTransitState()
  local before = self._hoppableHere
  if before == nil then
    before = self:IsHoppableHere() and true or false
  end
  local after = self:IsHoppableHere() and true or false
  self._hoppableHere = after
  if before == after then
    return
  end
  self._mapIdCache = nil
  if self.BroadcastHello then
    pcall(function()
      H:BroadcastHello("force")
    end)
  end
  if self.RoomsEnabled and self:RoomsEnabled() and self.MaintainRooms then
    pcall(function()
      H:MaintainRooms(true)
    end)
  end
  if self.ScheduleRefreshUI then
    self:ScheduleRefreshUI(0.1)
  elseif self.RefreshUI then
    self:RefreshUI()
  end
end

function H:EnsureTransitTicker()
  if self._transitTicker then
    pcall(function()
      H._transitTicker:Cancel()
    end)
    self._transitTicker = nil
  end
end

function H:ScheduleTransitCheck(delay)
  self._transitStopToken = (self._transitStopToken or 0) + 1
  local token = self._transitStopToken
  C_Timer.After(tonumber(delay) or 2, function()
    if H._transitStopToken ~= token or not H.db then
      return
    end
    pcall(function()
      if H.RefreshTransitState then
        H:RefreshTransitState()
      end
    end)
  end)
end

-- 排队种类：bg=排战场/竞技场，lfg=排本/预组。系统马上会把人组进去，不能再切位面。
function H:QueueBusyKind()
  if GetBattlefieldStatus then
    local maxN = 4
    pcall(function()
      if GetMaxBattlefieldID then
        maxN = GetMaxBattlefieldID() or maxN
      elseif MAX_BATTLEFIELD_QUEUES then
        maxN = MAX_BATTLEFIELD_QUEUES
      end
    end)
    if maxN < 1 then
      maxN = 4
    end
    if maxN > 10 then
      maxN = 10
    end
    for i = 1, maxN do
      local status
      pcall(function()
        status = GetBattlefieldStatus(i)
      end)
      if status == "queued" or status == "confirm" then
        return "bg"
      end
    end
  end
  if GetWorldPVPQueueStatus then
    for i = 1, 4 do
      local status
      pcall(function()
        status = GetWorldPVPQueueStatus(i)
      end)
      if status == "queued" or status == "confirm" then
        return "bg"
      end
    end
  end
  if C_PvP then
    local brawl
    pcall(function()
      if C_PvP.IsQueuedForBrawl then
        brawl = C_PvP.IsQueuedForBrawl()
      end
    end)
    if brawl then
      return "bg"
    end
  end
  local cats = {}
  local function addCat(c)
    if c ~= nil then
      table.insert(cats, c)
    end
  end
  addCat(_G.LE_LFG_CATEGORY_LFD)
  addCat(_G.LE_LFG_CATEGORY_RF)
  addCat(_G.LE_LFG_CATEGORY_SCENARIO)
  addCat(_G.LE_LFG_CATEGORY_FLEXRAID)
  addCat(_G.LE_LFG_CATEGORY_WORLDPVP)
  addCat(_G.LE_LFG_CATEGORY_BATTLEFIELD)
  if Enum and Enum.LFGCategory then
    for _, c in pairs(Enum.LFGCategory) do
      if type(c) == "number" then
        addCat(c)
      end
    end
  end
  if #cats == 0 then
    cats = { 1, 2, 3, 4, 5, 6 }
  end
  if GetLFGMode then
    for _, cat in ipairs(cats) do
      local ok, mode = pcall(GetLFGMode, cat)
      if ok and mode then
        return "lfg"
      end
    end
  end
  if GetLFGQueueStats then
    for _, cat in ipairs(cats) do
      local ok, hasData = pcall(GetLFGQueueStats, cat)
      if ok and hasData then
        return "lfg"
      end
    end
  end
  if C_LFGList then
    if C_LFGList.HasActiveEntryInfo then
      local ok, active = pcall(C_LFGList.HasActiveEntryInfo)
      if ok and active then
        return "lfg"
      end
    end
    if C_LFGList.GetApplications then
      local ok, apps = pcall(C_LFGList.GetApplications)
      if ok and type(apps) == "table" then
        for i = 1, #apps do
          local id = apps[i]
          if id then
            if C_LFGList.GetApplicationInfo then
              local ok2, _, status = pcall(C_LFGList.GetApplicationInfo, id)
              if ok2 and (status == "applied" or status == "invited") then
                return "lfg"
              end
            else
              return "lfg"
            end
          end
        end
      end
    end
  end
  return nil
end

function H:IsInContentQueue()
  return self:QueueBusyKind() ~= nil
end

-- 别人正在组你：组队邀请框还在。自己求切等帮助方邀请时不走这里。
function H:HasIncomingPartyInvite()
  if self.poll then
    return false
  end
  if not StaticPopup_Visible then
    return false
  end
  local names = { "PARTY_INVITE", "PARTY_INVITE_XREALM", "PARTY_INVITE_LOCATION" }
  for i = 1, #names do
    local ok, shown = pcall(StaticPopup_Visible, names[i])
    if ok and shown then
      return true
    end
  end
  return false
end

-- asHost=true：给帮助方的短原因；否则给自己点求切看的整句
function H:QueueBusySay(asHost)
  local kind = self:QueueBusyKind()
  if kind == "bg" then
    if asHost then
      return "排战场中"
    end
    return "排战场中无法求切位面，请先取消排队"
  end
  if kind == "lfg" then
    if asHost then
      return "排本中"
    end
    return "排本中无法求切位面，请先取消排队"
  end
  if self:HasIncomingPartyInvite() then
    if asHost then
      return "有组队邀请未处理"
    end
    return "请先处理组队邀请"
  end
  return nil
end

function H:MyMapId()
  local now = (self.Now and self:Now()) or 0
  if self._mapIdCache and (now - (self._mapIdAt or 0)) < 0.5 then
    return self._mapIdCache
  end
  local id = 0
  if C_Map and C_Map.GetBestMapForUnit then
    id = C_Map.GetBestMapForUnit("player") or 0
  end
  self._mapIdCache = id
  self._mapIdAt = now
  return id
end

function H:InstanceMapId()
  if not self:IsInInstance() then
    return 0
  end
  if C_Map and C_Map.GetBestMapForUnit then
    return tonumber(C_Map.GetBestMapForUnit("player")) or 0
  end
  return 0
end

-- 可切位面的大地图：客栈/街道收到「地区」（暴风城、艾尔文），不到大陆。
function H:CanonMapId(mapId)
  mapId = tonumber(mapId) or 0
  if mapId <= 0 then
    return 0
  end
  self._canonCache = self._canonCache or {}
  local hit = self._canonCache[mapId]
  if hit ~= nil then
    return hit
  end
  local function remember(v)
    self._canonCache[mapId] = v
    return v
  end
  local forever = self.IsForeverClient and self:IsForeverClient()
  if (self:IsDungeonMap(mapId) or self:IsOrphanMap(mapId)) and not forever then
    return remember(0)
  end
  if self.CapitalMapIds and self:CapitalMapIds()[mapId] then
    return remember(mapId)
  end
  if not C_Map or not C_Map.GetMapInfo then
    return remember(mapId)
  end
  local zone = (Enum and Enum.UIMapType and Enum.UIMapType.Zone) or 3
  local continent = (Enum and Enum.UIMapType and Enum.UIMapType.Continent) or 2
  local seen = {}
  local cur = mapId
  for _ = 1, 8 do
    if not cur or cur <= 0 or seen[cur] then
      break
    end
    seen[cur] = true
    if self.CapitalMapIds and self:CapitalMapIds()[cur] then
      return remember(cur)
    end
    local info = C_Map.GetMapInfo(cur)
    if not info then
      break
    end
    local mt = tonumber(info.mapType)
    if mt == zone then
      return remember(cur)
    end
    if mt and mt <= continent then
      break
    end
    local parent = tonumber(info.parentMapID) or 0
    if self:IsDungeonMap(cur) or self:IsOrphanMap(cur) then
      if not forever then
        return remember(0)
      end
      if parent <= 0 then
        return remember(cur)
      end
      cur = parent
    else
      if parent <= 0 then
        if mt and mt > continent then
          return remember(cur)
        end
        break
      end
      cur = parent
    end
  end
  return remember(0)
end

function H:SameHoppableMap(a, b)
  a = tonumber(a) or 0
  b = tonumber(b) or 0
  if a <= 0 or b <= 0 then
    return false
  end
  if self.IsHoppableHere and not self:IsHoppableHere() then
    local mine = self:MyMapId()
    if a == mine or b == mine then
      return false
    end
  end
  local ca = self:CanonMapId(a)
  if ca <= 0 then
    return false
  end
  return ca == self:CanonMapId(b)
end

function H:IsDungeonMap(mapId)
  mapId = tonumber(mapId) or 0
  if mapId <= 0 or not C_Map or not C_Map.GetMapInfo then
    return false
  end
  local info = C_Map.GetMapInfo(mapId)
  if not info or not info.mapType then
    return false
  end
  local dungeon = (Enum and Enum.UIMapType and Enum.UIMapType.Dungeon) or 4
  return info.mapType == dungeon
end

function H:IsOrphanMap(mapId)
  mapId = tonumber(mapId) or 0
  if mapId <= 0 or not C_Map or not C_Map.GetMapInfo then
    return false
  end
  local info = C_Map.GetMapInfo(mapId)
  if not info or not info.mapType then
    return false
  end
  local orphan = (Enum and Enum.UIMapType and Enum.UIMapType.Orphan) or 6
  return info.mapType == orphan
end

-- 0=同图 1=近图（父子/同区子图） 2=远图 3=未知
function H:MapRelation(myMap, peerMap)
  myMap = tonumber(myMap) or 0
  peerMap = tonumber(peerMap) or 0
  if myMap <= 0 or peerMap <= 0 then
    return 3
  end
  if self.IsHoppableHere and not self:IsHoppableHere() then
    local mine = self:MyMapId()
    if myMap == mine then
      return 3
    end
  end
  if myMap == peerMap then
    return 0
  end
  if self:SameHoppableMap(myMap, peerMap) then
    return 0
  end
  if not C_Map or not C_Map.GetMapInfo then
    return 2
  end
  local myInfo = C_Map.GetMapInfo(myMap)
  local peerInfo = C_Map.GetMapInfo(peerMap)
  if not myInfo or not peerInfo then
    return 2
  end
  if (myInfo.parentMapID or 0) == peerMap or (peerInfo.parentMapID or 0) == myMap then
    return 1
  end
  local parentId = myInfo.parentMapID or 0
  if parentId > 0 and parentId == (peerInfo.parentMapID or 0) then
    local parent = C_Map.GetMapInfo(parentId)
    local continent = (Enum and Enum.UIMapType and Enum.UIMapType.Continent) or 2
    -- 父图不是大陆级 → 当作很近的相邻子图
    if parent and parent.mapType and parent.mapType > continent then
      return 1
    end
  end
  return 2
end

-- 帮助方邀请：必须独自一人（已在队不当 Host）；战斗中也可以邀；排本中不行
function H:CanInvite()
  if self:IsInInstance() then
    return false
  end
  if self.IsHoppableHere and not self:IsHoppableHere() then
    return false
  end
  if IsInGroup() or IsInRaid() then
    return false
  end
  if self:IsInContentQueue() then
    return false
  end
  return true
end

function H:IsPaused()
  local c = self:CharBag()
  if c then
    return c.paused and true or false
  end
  return self.db and self.db.paused and true or false
end

function H:SetPaused(on)
  if not self.db then
    return
  end
  local c = self:CharBag()
  if c then
    c.paused = on and true or false
  else
    self.db.paused = on and true or false
  end
  if self:IsPaused() and self.poll then
    self.poll = nil
  end
  pcall(function()
    H:BroadcastHello("soft")
    H:RefreshUI()
  end)
  self:Print(self:IsPaused() and "已暂停" or "已启用")
end

function H:IsPeerUnavailable(peer)
  if not peer then
    return true
  end
  -- 战斗无所谓，可求可帮；暂停/副本/在队/排本/忙碌仍跳过
  if peer.paused or peer.inst or peer.grouped or peer.queued then
    return true
  end
  if self:IsDungeonMap(peer.map) or self:IsOrphanMap(peer.map) then
    return true
  end
  if not peer.map or tonumber(peer.map) == 0 then
    return true
  end
  if (peer.busyUntil or 0) > self:WallNow() then
    return true
  end
  return false
end

-- 这一行有人、但不能求切时，按钮位置上写的短状态。
function H:PeerBlockLabel(name, peer)
  if not peer then
    return nil
  end
  if peer.paused then
    return "暂停"
  end
  if peer.inst or self:IsDungeonMap(peer.map) or self:IsOrphanMap(peer.map) then
    local placeId = (tonumber(peer.imap) or 0) > 0 and peer.imap or peer.map
    local place = self.MapPlaceName and self:MapPlaceName(placeId)
    if place and place ~= "" and (peer.inst or self:IsDungeonMap(placeId) or self:IsOrphanMap(placeId)) then
      return place
    end
    return "副本"
  end
  if peer.grouped then
    return "在队"
  end
  if peer.queued then
    return "排队"
  end
  if not peer.map or tonumber(peer.map) == 0 then
    return "未知"
  end
  if (peer.busyUntil or 0) > self:WallNow() then
    return "忙碌"
  end
  if name and self:IsSkipped(name) then
    return "跳过"
  end
  if not self:PeerIsFresh(peer) then
    return "离开"
  end
  if peer.pig and not peer.pigAuto then
    return "不接"
  end
  return nil
end

function H:MapPlaceName(mapId)
  mapId = tonumber(mapId) or 0
  if mapId <= 0 or not C_Map or not C_Map.GetMapInfo then
    return nil
  end
  local info = C_Map.GetMapInfo(mapId)
  local name = info and info.name
  if type(name) == "string" and name ~= "" then
    return name
  end
  return nil
end

function H:ClassColorCode(classFile)
  if type(classFile) ~= "string" or classFile == "" or not RAID_CLASS_COLORS then
    return nil
  end
  local c = RAID_CLASS_COLORS[string.upper(classFile)]
  if not c then
    return nil
  end
  if type(c.colorStr) == "string" and #c.colorStr >= 6 then
    local hex = c.colorStr
    if #hex == 8 then
      hex = hex:sub(3)
    end
    return "|cff" .. hex
  end
  if c.r and c.g and c.b then
    return string.format("|cff%02x%02x%02x", c.r * 255, c.g * 255, c.b * 255)
  end
  return nil
end

function H:PeerClassFile(name)
  if not name or name == "" then
    return nil
  end
  local key = self.NormalizeName and self:NormalizeName(name) or name
  local peer = key and self.db and self.db.peers and self.db.peers[key]
  if peer and type(peer.classFile) == "string" and peer.classFile ~= "" then
    return peer.classFile
  end
  local found
  if IsInGuild() and GetNumGuildMembers and GetGuildRosterInfo then
    local n = GetNumGuildMembers() or 0
    for i = 1, n do
      local gname, _, _, _, _, _, _, _, _, _, classFile = GetGuildRosterInfo(i)
      if gname and type(classFile) == "string" and classFile ~= "" and self:IsSamePlayer(gname, name) then
        found = string.upper(classFile)
        break
      end
    end
  end
  if not found then
    local _, mine = UnitClass("player")
    if mine and self:IsSelfName(name) then
      found = string.upper(mine)
    end
  end
  if found and peer then
    peer.classFile = found
  end
  return found
end

-- 软新鲜：近期报过心跳（列表用）
function H:PeerIsFresh(peer)
  if not peer or not self:IsWallStamp(peer.last) then
    return false
  end
  return (self:WallNow() - (peer.last or 0)) <= (self.PEER_TTL or 600)
end

-- 刚核实在线：PING 后短时间内回过 HELLO
function H:PeerIsLive(peer)
  if not peer or not self:IsWallStamp(peer.last) then
    return false
  end
  return (self:WallNow() - (peer.last or 0)) <= (self.PEER_LIVE_TTL or 20)
end

-- 记得曾报在该位面的人（用来发 PING，不要求此刻已核实）
function H:ListLayerCandidates(targetRaw)
  targetRaw = tonumber(targetRaw)
  if not targetRaw then
    return {}
  end
  local now = self:WallNow()
  local mem = self.PEER_UI_TTL or (99 * 60)
  local list = {}
  for name, peer in pairs(self.db.peers or {}) do
    if peer and not self:IsSelfName(name)
      and self:IsWallStamp(peer.last) and (now - (peer.last or 0)) <= mem then
      local onTarget
      if self.PeerMatchesHopTarget then
        onTarget = self:PeerMatchesHopTarget(peer, targetRaw)
      else
        onTarget = self:SameNwbLayer(peer.raw, targetRaw)
      end
      if onTarget then
        table.insert(list, name)
      end
    end
  end
  table.sort(list)
  return list
end

-- opts.live=true：必须刚回过 PING（求切核实后用）
function H:PeerCanHost(name, peer, opts)
  opts = opts or {}
  if not name or not peer or self:IsSelfName(name) then
    return false
  end
  -- 时空之门同伴：未开自动接的只密语、不走插件求切
  if peer.pig and not peer.pigAuto then
    return false
  end
  if opts.live then
    if not self:PeerIsLive(peer) then
      return false
    end
  elseif not self:PeerIsFresh(peer) then
    return false
  end
  if self:IsSkipped(name) then
    return false
  end
  if self:IsPeerUnavailable(peer) then
    return false
  end
  -- 不同地图组队切不过去：不当帮助方。求切带了「那张图」时按那张图认，不按我当前图挡。
  if self:RequiresSameMapForHop() then
    local base = self:MyMapId()
    local allow = tonumber(self._hopAllowMap) or 0
    if allow <= 0 and opts then
      allow = tonumber(opts.hopMap) or 0
    end
    if allow > 0 then
      base = allow
    end
    if self.SameHoppableMap then
      if not self:SameHoppableMap(base, peer.map) then
        return false
      end
    elseif self:MapRelation(base, peer.map) ~= 0 then
      return false
    end
  end
  return true
end

-- 点求切 / PING 核实后仍没人：说明原因
function H:ExplainNoHosts(targetRaw, probed)
  targetRaw = tonumber(targetRaw)
  if not targetRaw then
    return "该位面暂无合适的在线玩家可帮"
  end
  local now = self:WallNow()
  local nAny, nLive, nSkip, nPause, nInst, nGroup, nQueue, nBusy, nDungeon, nFar = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  for name, peer in pairs(self.db.peers or {}) do
    if peer and self:SameNwbLayer(peer.raw, targetRaw) and not self:IsSelfName(name) then
      local mem = self.PEER_UI_TTL or (99 * 60)
      if self:IsWallStamp(peer.last) and (now - (peer.last or 0)) <= mem then
        nAny = nAny + 1
        if self:PeerIsLive(peer) then
          nLive = nLive + 1
          if self:IsSkipped(name) then
            nSkip = nSkip + 1
          elseif peer.paused then
            nPause = nPause + 1
          elseif peer.inst then
            nInst = nInst + 1
          elseif peer.grouped then
            nGroup = nGroup + 1
          elseif peer.queued then
            nQueue = nQueue + 1
          elseif self:IsDungeonMap(peer.map) then
            nDungeon = nDungeon + 1
          elseif (peer.busyUntil or 0) > now then
            nBusy = nBusy + 1
          elseif self:RequiresSameMapForHop() and self:MapRelation(self:MyMapId(), peer.map) ~= 0 then
            nFar = nFar + 1
          end
        end
      end
    end
  end
  if nAny == 0 then
    return "该位面暂无已知插件玩家可问"
  end
  if probed and nLive == 0 then
    return "已询问该位面玩家：均未应答（不在线或收不到插件消息）"
  end
  local bits = {}
  if nGroup > 0 then
    table.insert(bits, "在队" .. nGroup)
  end
  if nQueue > 0 then
    table.insert(bits, "排队" .. nQueue)
  end
  if nBusy > 0 then
    table.insert(bits, "忙碌" .. nBusy)
  end
  if nPause > 0 then
    table.insert(bits, "暂停" .. nPause)
  end
  if nSkip > 0 then
    table.insert(bits, "已跳过" .. nSkip)
  end
  if nInst > 0 or nDungeon > 0 then
    table.insert(bits, "副本中")
  end
  if nFar > 0 then
    table.insert(bits, "不在同一地图" .. nFar)
  end
  if #bits == 0 then
    if probed then
      return "已询问：对方在线但此刻不在该位面或暂不可帮"
    end
    return "该位面暂无合适的在线玩家可帮"
  end
  return "已询问：暂不可求（" .. table.concat(bits, "，") .. "）"
end

function H:ResolvePeerKey(name)
  if not name or not self.db or not self.db.peers then
    return self:NormalizeName(name)
  end
  if self.db.peers[name] then
    return name
  end
  local key = self:NormalizeName(name)
  if key and self.db.peers[key] then
    return key
  end
  local reply = self:ReplyName(name)
  for k, p in pairs(self.db.peers) do
    if p and (p.replyAs == name or p.replyAs == reply or k == reply) then
      return k
    end
  end
  return key
end

function H:MarkPeerBusy(name, seconds)
  local key = self:ResolvePeerKey(name)
  if not key or not self.db or not self.db.peers then
    return
  end
  local peer = self.db.peers[key]
  if not peer then
    return
  end
  peer.busyUntil = self:WallNow() + (seconds or self.BUSY_COOLDOWN)
end

-- Forever 角色展示名：去掉 -服务器，保留「名 姓」（不要 Ambiguate 砍姓）
function H:BareCharacterName(name)
  name = self:ReplyName(name)
  if not name or name == "" then
    return nil
  end
  local base = name:match("^([^-]+)") or name
  base = base:gsub("%s+", " "):match("^%s*(.-)%s*$")
  if not base or base == "" then
    return nil
  end
  return base
end

-- 拆成名/姓词：Forever 界面有时只显示名，有时只显示主要的姓
function H:NameParts(name)
  local bare = self:BareCharacterName(name)
  if not bare then
    return nil, nil
  end
  local parts = {}
  for w in bare:gmatch("%S+") do
    parts[#parts + 1] = w
  end
  if #parts == 0 then
    return nil, nil
  end
  return bare, parts
end

function H:IsSamePlayer(a, b)
  if not a or not b then
    return false
  end
  if a == b then
    return true
  end
  local ar, br = self:ReplyName(a), self:ReplyName(b)
  if ar and br and ar == br then
    return true
  end
  local ba, bb = self:BareCharacterName(a), self:BareCharacterName(b)
  if ba and bb and ba == bb then
    return true
  end
  if ba and bb and ba:gsub("%s+", "") == bb:gsub("%s+", "") then
    return true
  end
  local ak, bk = self:NormalizeName(a), self:NormalizeName(b)
  if ak and bk and ak == bk then
    return true
  end

  -- Forever：一方是完整「名 姓」，另一方只显示名或只显示姓 → 仍视为同一人
  -- 例：「凯恩 玉蹄」↔「凯恩」或「玉蹄」
  local _, pa = self:NameParts(a)
  local _, pb = self:NameParts(b)
  if pa and pb then
    if #pa == 1 and #pb >= 2 then
      for i = 1, #pb do
        if pb[i] == pa[1] then
          return true
        end
      end
    elseif #pb == 1 and #pa >= 2 then
      for i = 1, #pa do
        if pa[i] == pb[1] then
          return true
        end
      end
    end
  end

  return self:ShortName(a) == self:ShortName(b)
end

-- Forever：UnitName 常为「名 姓」；UnitFullName 第二段多半是姓，不是服务器
-- 怀旧/TBC：第二段是服务器，密语/比对只用裸名
function H:GetUnitCharacterName(unit)
  if not unit then
    return nil
  end
  local ok, name = pcall(function()
    if not UnitExists(unit) then
      return nil
    end
    if H:UsesClassicNames() then
      local a, b = UnitFullName(unit)
      if H:IsReadableValue(a) then
        return H:ReplyName(a) or a
      end
      local uname = UnitName(unit)
      if H:IsReadableValue(uname) then
        return H:ReplyName(uname) or uname
      end
      return nil
    end
    local uname = UnitName(unit)
    if H:IsReadableValue(uname) and uname:find(" ", 1, true) then
      return H:ReplyName(uname) or uname
    end
    local a, b = UnitFullName(unit)
    if H:IsReadableValue(a) then
      if a:find(" ", 1, true) then
        return H:ReplyName(a) or a
      end
      if H:IsReadableValue(b) then
        local real = H:GetRealRealm()
        if real and (b == real or b:gsub("%s+", "") == real) then
          return a
        end
        return H:ReplyName(a .. " " .. b) or (a .. " " .. b)
      end
      return a
    end
    if H:IsReadableValue(uname) then
      return H:ReplyName(uname) or uname
    end
    return nil
  end)
  if ok then
    return name
  end
  return nil
end

function H:GroupHasPlayer(fullName)
  if not fullName or not IsInGroup() then
    return false
  end
  local function nameMatches(uname)
    if not uname then
      return false
    end
    if self:IsSamePlayer(uname, fullName) then
      return true
    end
    local peer = self.db.peers and self.db.peers[self:ResolvePeerKey(fullName) or ""]
    if peer and peer.replyAs and self:IsSamePlayer(uname, peer.replyAs) then
      return true
    end
    local reply = self:WhisperTarget(fullName)
    if reply and self:IsSamePlayer(uname, reply) then
      return true
    end
    return false
  end
  -- 小队不要用 GetNumGroupMembers 当 partyN 上限（含自己，且 party 不含自己）
  if IsInRaid and IsInRaid() then
    local n = GetNumGroupMembers() or 0
    for i = 1, n do
      if nameMatches(self:GetUnitCharacterName("raid" .. i)) then
        return true
      end
    end
  else
    for i = 1, 4 do
      if nameMatches(self:GetUnitCharacterName("party" .. i)) then
        return true
      end
    end
  end
  return false
end

-- 求切进队后核对帮助方：名单延迟 / 名姓格式差时，信任已核对过的邀请人
function H:MatchExpectedHost(expected)
  if not IsInGroup() then
    return false
  end
  if expected and self:GroupHasPlayer(expected) then
    return true
  end
  local reply = expected and self:WhisperTarget(expected)
  if reply and self:GroupHasPlayer(reply) then
    return true
  end
  local inv = self._hopInviter
  if inv and self:GroupHasPlayer(inv) then
    return true
  end
  if inv and expected and (self:IsSamePlayer(inv, expected) or (reply and self:IsSamePlayer(inv, reply))) then
    return true
  end
  return false
end

function H:IsSelfName(name)
  if not name then
    return false
  end
  local meUnit = UnitName("player")
  if meUnit and self:IsSamePlayer(name, meUnit) then
    return true
  end
  return self:IsSamePlayer(name, self:PlayerFullName())
end

function H:GetAskStat(name)
  name = self:NormalizeName(name)
  if not name then
    return nil
  end
  self.db.askStats[name] = self.db.askStats[name] or { lastAsk = 0, miss = 0, skipUntil = 0 }
  return self.db.askStats[name]
end

function H:IsSkipped(name)
  local st = self:GetAskStat(name)
  if not st then
    return true
  end
  return (st.skipUntil or 0) > self:WallNow()
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
pcall(function()
  for _, ev in ipairs({
    "PLAYER_CONTROL_LOST",
    "PLAYER_CONTROL_GAINED",
    "UNIT_ENTERED_VEHICLE",
    "UNIT_EXITING_VEHICLE",
    "UNIT_EXITED_VEHICLE",
    "PLAYER_STOPPED_MOVING",
    "ZONE_CHANGED",
    "ZONE_CHANGED_INDOORS",
  }) do
    pcall(function()
      frame:RegisterEvent(ev)
    end)
  end
end)
-- 认层跟轻歌花一样：只处理你点中或鼠标指到的那一只，不定时扫四十块姓名板。
-- 不注册 NAME_PLATE_UNIT_ADDED。不注册 COMBAT_LOG（Forever 会弹保护窗）。
frame:RegisterEvent("CHAT_MSG_SYSTEM")
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:RegisterEvent("CHAT_MSG_CHANNEL")
frame:RegisterEvent("CHAT_MSG_SAY")
frame:RegisterEvent("CHAT_MSG_YELL")
frame:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
pcall(function()
  frame:RegisterEvent("CHANNEL_UI_UPDATE")
  frame:RegisterEvent("CHANNEL_COUNT_UPDATE")
end)
-- 排本状态变化：立刻广播忙闲（事件名因客户端略有差异，能注册就注册）
pcall(function()
  for _, ev in ipairs({
    "LFG_QUEUE_STATUS_UPDATE",
    "LFG_PROPOSAL_SHOW",
    "LFG_PROPOSAL_DONE",
    "LFG_PROPOSAL_FAILED",
    "LFG_ROLE_CHECK_SHOW",
    "LFG_ROLE_CHECK_HIDE",
    "UPDATE_LFG_LIST",
    "LFG_LIST_ACTIVE_ENTRY_UPDATE",
    "LFG_LIST_APPLICATION_STATUS_UPDATED",
    "UPDATE_BATTLEFIELD_STATUS",
    "PVPQUEUE_ANYWHERE_SHOW",
    "PVPQUEUE_ANYWHERE_UPDATE_AVAILABLE",
  }) do
    pcall(function()
      frame:RegisterEvent(ev)
    end)
  end
end)

-- 登录后再挂邀请事件，避开加载期污染窗
function H:RegisterInviteEvents()
  if self._inviteEventsDone then
    return
  end
  self._inviteEventsDone = true
  pcall(function()
    frame:RegisterEvent("PARTY_INVITE_REQUEST")
  end)
end

frame:SetScript("OnEvent", function(_, event, ...)
  if event == "ADDON_LOADED" then
    local name = ...
    if name ~= H.ADDON_NAME then
      return
    end
    HuZhuLayerDB = HuZhuLayerDB or {}
    HuZhuLayerDB.hosting = nil
    H:CopyDefaults(HuZhuLayerDB, defaults)
    H.db = HuZhuLayerDB
    if H.LOG_ON == false then
      H.db.hopLog = nil
      if collectgarbage then
        collectgarbage("collect")
      end
    end
    if H.MigratePeersToInstallBook then
      pcall(function()
        H:MigratePeersToInstallBook()
      end)
    end
    if H.MergeBundledInstallBook then
      pcall(function()
        H:MergeBundledInstallBook()
      end)
    end
    -- 强制：始终帮助其他玩家（去掉设置开关后覆盖旧存档）
    H.db.autoHelp = true
    H:SanitizeSessionClocks()
    -- 旧版把「单个怪的 zoneUID」当位面，列表里掺进一堆假长号；多数决上线后清一次
    if not H.db._layerVote199 then
      H.db.seenLayers = {}
      H.db.myVisits = {}
      H.layerOrder = {}
      H.currentRawLayer = nil
      H.db._layerVote199 = true
    end
    H:InitNet()
    return
  end
  if not H.db then
    return
  end
  if event == "PLAYER_LOGIN" then
    pcall(function()
      H:SanitizeSessionClocks()
      H:CharBag() -- 把旧账号级暂停/感谢迁到当前角色
      H:MigratePeerNames()
      H:PrunePeers()
      H:EnsureMinimap()
      H:RegisterInviteEvents()
      H:HookLeavePartyForThanks() -- 离队前先队聊感谢
      if H.HookNwbLayerUpdated then
        H:HookNwbLayerUpdated()
      end
      -- 登录只报一行版本，不刷操作说明。认层不靠定时扫。
      if H.NwbCopySyncBook then
        H:NwbCopySyncBook()
      end
      if H.EnsureTransitTicker then
        H:EnsureTransitTicker()
      end
      H:Print("v" .. tostring(H.VERSION) .. " · " .. H:ClientKindLabel())
      if H.StartStallWatch then
        H:StartStallWatch()
      end
      if H.Trace then
        local nwb = "无"
        pcall(function()
          local n = 0
          if H.GetNwbLayerCache then
            local keys = H:GetNwbLayerCache().keys
            n = type(keys) == "table" and #keys or 0
          end
          if H.GetNWB and H:GetNWB() then
            nwb = n > 0 and ("插件" .. tostring(n) .. "层") or "插件没表"
          elseif n > 0 then
            nwb = "存档" .. tostring(n) .. "层"
          end
        end)
        H:Trace(string.format(
          "登录 v%s %s NWB%s %s",
          tostring(H.VERSION),
          H:ClientKindLabel(),
          nwb,
          IsInGroup() and "在队" or "独自"
        ))
      end
      if H.PigBridgeEnabled and H:PigBridgeEnabled() then
        if H.StartPigBridgeTicker then
          H:StartPigBridgeTicker()
        end
      end
    end)
    C_Timer.After(1, function()
      pcall(function()
        if H.HookNwbLayerUpdated then
          H:HookNwbLayerUpdated()
        end
        H:EnsureDiscoveryChannel()
        if H.EnsurePigChannel then
          H:EnsurePigChannel()
        end
      end)
    end)
    C_Timer.After(2.5, function()
      pcall(function()
        H:MigratePeerNames()
        H:EnsureDiscoveryChannel()
        if H.EnsurePigChannel then
          H:EnsurePigChannel()
        end
        H:BroadcastHello("full")
      end)
    end)
    -- 不再加入互助切位面，也不再发「试」
    if H.db and H.RunChannelProbe then
      pcall(function()
        H:RunChannelProbe()
      end)
    end
    if not H._rosterTicker then
      H._rosterTicker = C_Timer.NewTicker(2, function()
        if H.db and H.AskChannelMembers then
          pcall(function()
            H:AskChannelMembers()
          end)
        end
      end)
    end
    if not H._helloTicker then
      H._helloTicker = C_Timer.NewTicker(H.HELLO_TICK, function()
        if H.db then
          H:StallBegin("每90秒打招呼")
          pcall(function()
            H:BroadcastHello("full")
            H:PrunePeers()
            if H.PigIdleProbe then
              H:PigIdleProbe()
            end
          end)
          H:StallEnd()
        end
      end)
    end
  elseif event == "PLAYER_ENTERING_WORLD" then
    -- 坐船/鸟点进图当下污染重：先认位面，进频挪到下一帧，避免保护功能弹窗
    -- 换图的重扫和重画只走 OnZoneChanged：已有层号时等 3 秒，不在进图当下再扫一遍
    H._enterWorldAt = H:Now()
    pcall(function()
      H:EnsureMinimap()
      H:OnZoneChangedForLayer()
      if H.RefreshTransitState then
        H:RefreshTransitState()
      end
    end)
    C_Timer.After(0.5, function()
      pcall(function()
        H:EnsureDiscoveryChannel()
        H:BroadcastHello("soft")
      end)
    end)
  elseif event == "ZONE_CHANGED_NEW_AREA" then
    pcall(function()
      H:OnZoneChangedForLayer()
      if H.RefreshTransitState then
        H:RefreshTransitState()
      end
    end)
  elseif event == "PLAYER_CONTROL_LOST"
    or event == "PLAYER_CONTROL_GAINED"
    or event == "UNIT_ENTERED_VEHICLE"
    or event == "UNIT_EXITING_VEHICLE"
    or event == "UNIT_EXITED_VEHICLE"
    or event == "ZONE_CHANGED"
    or event == "ZONE_CHANGED_INDOORS" then
    if event == "UNIT_ENTERED_VEHICLE"
      or event == "UNIT_EXITING_VEHICLE"
      or event == "UNIT_EXITED_VEHICLE" then
      local unit = ...
      if unit and unit ~= "player" then
        return
      end
    end
    pcall(function()
      if H.RefreshTransitState then
        H:RefreshTransitState()
      end
    end)
  elseif event == "PLAYER_STOPPED_MOVING" then
    pcall(function()
      if H.ScheduleTransitCheck then
        H:ScheduleTransitCheck(2)
      end
    end)
  elseif event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_REGEN_ENABLED" then
    pcall(function() H:BroadcastHello("soft") end)
  elseif event == "LFG_QUEUE_STATUS_UPDATE"
    or event == "LFG_PROPOSAL_SHOW"
    or event == "LFG_PROPOSAL_DONE"
    or event == "LFG_PROPOSAL_FAILED"
    or event == "LFG_ROLE_CHECK_SHOW"
    or event == "LFG_ROLE_CHECK_HIDE"
    or event == "UPDATE_LFG_LIST"
    or event == "LFG_LIST_ACTIVE_ENTRY_UPDATE"
    or event == "LFG_LIST_APPLICATION_STATUS_UPDATED"
    or event == "UPDATE_BATTLEFIELD_STATUS"
    or event == "PVPQUEUE_ANYWHERE_SHOW"
    or event == "PVPQUEUE_ANYWHERE_UPDATE_AVAILABLE" then
    pcall(function()
      H:BroadcastHello("soft")
      if H.ScheduleRefreshUI then
        H:ScheduleRefreshUI(0.1)
      end
    end)
  elseif event == "CHAT_MSG_SAY" or event == "CHAT_MSG_YELL" then
    if H._probeUntil and H.Now and H:Now() < H._probeUntil and H.Trace then
      local text = ...
      H:Trace("收试验 " .. event .. " " .. H:DiaryBit(text, 24))
    end
  elseif event == "CHAT_MSG_CHANNEL" then
    -- 参数可能是锁住的字。先整段包进保护里再读，避免一碰就中断、日记也写不出。
    local ok, err = pcall(function(text, playerName, _, channelString, playerName2, _, _, channelIndex, channelBaseName)
      local function locked(v)
        return issecretvalue and issecretvalue(v)
      end
      local function readable(v)
        return type(v) == "string" and not locked(v)
      end
      -- 按频道编号分开记心跳，避免大脚把互助的「有事件」挤掉
      if H.IsForeverClient and H:IsForeverClient() and H.TraceIfChanged then
        local idxKey = "ch-any-" .. H:DiaryBit(channelIndex, 8)
        H:TraceIfChanged(
          idxKey,
          string.format(
            "频道事件有 编号%s 名%s",
            H:DiaryBit(channelIndex, 8),
            H:DiaryBit(channelString or channelBaseName, 24)
          )
        )
      end
      if H._probeUntil and H.Now and H:Now() < H._probeUntil and H.Trace then
        H:Trace(string.format(
          "收试验 频道%s 短名%s 编号%s 正文%s",
          H:DiaryBit(channelString, 30),
          H:DiaryBit(channelBaseName, 24),
          H:DiaryBit(channelIndex, 8),
          H:DiaryBit(text, 24)
        ))
      end
      local handled = false
      if H.HandleDiscoveryChannelChat then
        handled = H:HandleDiscoveryChannelChat(
          text,
          playerName,
          playerName2,
          channelString,
          channelBaseName,
          channelIndex
        )
      end
      if not handled then
        local nameLocked = locked(channelBaseName) or locked(channelString)
        local knownOther = (readable(channelBaseName) and not H:IsHzlChannelName(channelBaseName))
          or (readable(channelString) and not H:IsHzlChannelName(channelString))
        if nameLocked and not knownOther and H.Trace then
          H:Trace(string.format(
            "收互助 频道%s 短名%s 正文%s 人%s 人2%s 认不出",
            H:DiaryBit(channelString, 30),
            H:DiaryBit(channelBaseName, 24),
            H:DiaryBit(text, 48),
            H:DiaryBit(playerName, 24),
            H:DiaryBit(playerName2, 24)
          ))
        end
      end
      if H.OnPigChannelMessage
        and not locked(text) and not locked(playerName)
        and not locked(playerName2) and not locked(channelBaseName) then
        H:OnPigChannelMessage(text, playerName2 or playerName, channelBaseName)
      end
    end, ...)
    if not ok and H.Trace then
      H:Trace("收互助出错 " .. H:DiaryBit(err, 180))
    end
  elseif event == "CHAT_MSG_CHANNEL_NOTICE" then
    local noticeType, _, _, channelName, _, _, _, channelIndex, channelBaseName = ...
    local ok, err = pcall(function()
      H:OnDiscoveryChannelNotice(noticeType, channelName, channelBaseName, channelIndex)
      -- PIG 公开聊天频道：进频后挂回默认聊天框，并立刻探测一次
      if H.PigBridgeEnabled and H:PigBridgeEnabled() then
        local ch = tostring(channelBaseName or channelName or "")
        if ch == H.PIG_CHANNEL or ch:find(H.PIG_CHANNEL, 1, true) then
          if H.ShowPigChannel then
            H:ShowPigChannel()
          end
          local t = tostring(noticeType or "")
          if t == "YOU_JOINED" or t == "YOU_CHANGED" then
            if H.PigScheduleJoinRefresh then
              H:PigScheduleJoinRefresh()
            end
          end
        end
      end
    end)
    if not ok and H.Trace then
      H:Trace("频道通知出错 " .. H:DiaryBit(err, 180))
    end
  elseif event == "CHANNEL_COUNT_UPDATE" then
    local id, count = ...
    pcall(function()
      local mine = H:GetDiscoveryChannelId()
      if mine and id == mine then
        H._rosterCount = tonumber(count) or H._rosterCount
        if H.TraceIfChanged then
          H:TraceIfChanged("roster-count", "频道人数 " .. tostring(count))
        end
      end
    end)
  elseif event == "CHANNEL_UI_UPDATE" then
    -- 互助切位面不再使用。窗口刷新时再摘一次，避免又被勾回去。
    if H.RoomsEnabled and H:RoomsEnabled() then
      return
    end
    if not (H.IsForeverClient and H:IsForeverClient()) then
      return
    end
    local function keepOrHide()
      if H.DropDiscoveryChannel then
        H:DropDiscoveryChannel()
      end
    end
    pcall(keepOrHide)
    C_Timer.After(1.0, function()
      pcall(keepOrHide)
    end)
  elseif event == "GROUP_ROSTER_UPDATE" then
    pcall(function()
      H:OnGroupChanged()
      if H.ScheduleRefreshUI then
        H:ScheduleRefreshUI(0.1)
      end
    end)
  elseif event == "PLAYER_TARGET_CHANGED" then
    pcall(function()
      H:ObserveOneUnit("target")
    end)
  elseif event == "UPDATE_MOUSEOVER_UNIT" then
    pcall(function()
      H:ObserveOneUnit("mouseover")
    end)
  elseif event == "PARTY_INVITE_REQUEST" then
    -- 必须同步处理：AcceptGroup 只有在本事件栈里相对安全，禁止再丢进 C_Timer
    local inviter = ...
    pcall(function() H:OnPartyInviteRequest(inviter) end)
    if not H.poll then
      pcall(function()
        H:BroadcastHello("soft")
      end)
    end
  elseif event == "CHAT_MSG_SYSTEM" then
    local text = ...
    pcall(function() H:OnSystemMessage(text) end)
  elseif event == "CHAT_MSG_ADDON" then
    -- 闭包里不能写 ...，否则整文件加载失败、图标全没
    local prefix, msg, channel, sender = ...
    local ok, err = pcall(function()
      local function take(v)
        if type(v) == "string" and v ~= "" then
          return v
        end
        if H.CoerceChatPersonName then
          local s = H:CoerceChatPersonName(v)
          if type(s) == "string" and s ~= "" then
            return s
          end
        end
        return nil
      end
      local prefixS = take(prefix)
      local msgS = (type(msg) == "string" and msg ~= "") and msg or take(msg)
      local who = take(sender)
      local channelS = (type(channel) == "string" and channel ~= "") and channel or take(channel)
      if not prefixS or not msgS then
        if H.Trace then
          H:Trace(string.format(
            "收插件 前缀%s 正文%s 来路%s 谁%s 锁住",
            H:DiaryBit(prefix, 24),
            H:DiaryBit(msg, 48),
            H:DiaryBit(channel, 16),
            H:DiaryBit(sender, 24)
          ))
        end
        return
      end
      if prefixS == H.PREFIX then
        if not who or (H.IsChatPersonName and not H:IsChatPersonName(who)) then
          if H.Trace then
            H:Trace("收密文位面 人名认不出 " .. H:DiaryBit(who or sender, 40))
          end
          return
        end
        if H.Trace and channelS == "CHANNEL" and type(msgS) == "string" and msgS:sub(1, 6) == "HELLO|" then
          H:Trace(string.format(
            "收密文位面 来路CHANNEL 谁%s 正文%s",
            H:DiaryBit(who, 24),
            H:DiaryBit(msgS, 48)
          ))
        end
        H:OnAddonMessage(prefixS, msgS, channelS or channel, who)
      elseif H.PIG_PREFIX and prefixS == H.PIG_PREFIX and H.OnPigAddonMessage then
        H:OnPigAddonMessage(msgS, channelS or channel, who or sender)
      end
    end)
    if not ok and H.Trace then
      H:Trace("收插件出错 " .. H:DiaryBit(err, 180))
    end
  end
end)

H.frame = frame

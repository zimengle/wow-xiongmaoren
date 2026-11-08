local H = HuZhuLayer

-- PIG 时空之门协议桥：求切必须点名小位面号；没带号的对方求切仍不接
-- 已开：经典怀旧～熊猫人 + 正式服。无限先不管 PIG。
-- 怀旧系（toc<60000）：可见频道字 TARDIS_LAYER；正式服：插件频道包（同时空之门）
H.PIG_PREFIX = "!Pig_Tardis"
H.PIG_CHANNEL = "PIG"
H.PIG_LAYER_GET = "TARDIS_LAYER"
H.PIG_LAYER_TAG = "!L"
H.PIG_LAYER_REQ = "!LSQHWM_"
H.PIG_LAYER_VER = 8.21
H.PIG_PROBE_GAP = 8
H.PIG_IDLE_PROBE_GAP = 90 -- 后台扫 PIG 同伴：多久再探测一次（秒）；点求切仍会立刻探

function H:PigBridgeEnabled()
  return self:IsClassicEra()
    or self:IsTbcClient()
    or self:IsTitanClient()
    or self:IsWrathClient()
    or self:IsMistsClient()
    or self:IsRetailClient()
end

-- 正式服时空之门只听插件频道包；怀旧系要可见频道字才有人回
function H:PigProbeUsesChat()
  return not (self.IsRetailClient and self:IsRetailClient())
end

function H:InitPigBridge()
  if not self:PigBridgeEnabled() then
    return
  end
  pcall(function()
    if C_ChatInfo and C_ChatInfo.RegisterAddonMessagePrefix then
      C_ChatInfo.RegisterAddonMessagePrefix(self.PIG_PREFIX)
    end
  end)
  self:InstallPigChatFilter()
end

function H:InstallPigChatFilter()
  if self._pigChatFilter or not ChatFrame_AddMessageEventFilter or issecretvalue then
    return
  end
  self._pigChatFilter = true
  -- 只挡协议探测字，不挡 PIG 里的正常聊天
  local get = self.PIG_LAYER_GET
  pcall(ChatFrame_AddMessageEventFilter, "CHAT_MSG_CHANNEL", function(_, _, msg)
    if msg == get then
      return true
    end
  end)
end

function H:GetPigChannelId()
  local base = self.PIG_CHANNEL or "PIG"
  local id = self.FindExactChannelId and self:FindExactChannelId(base)
  if id then
    return id
  end
  for n = 1, 5 do
    id = self.FindExactChannelId and self:FindExactChannelId(base .. tostring(n))
    if id then
      return id
    end
  end
  return nil
end

-- PIG 是时空之门的公开聊天频道，禁止从聊天框摘掉（和「互助切位面」专用频道不同）
function H:ShowPigChannel()
  local name = self.PIG_CHANNEL
  local cf = DEFAULT_CHAT_FRAME
  if not cf then
    return
  end
  pcall(function()
    if ChatFrame_AddChannel then
      ChatFrame_AddChannel(cf, name)
    elseif cf.AddChannel then
      cf:AddChannel(name)
    end
  end)
end

function H:EnsurePigChannel()
  if not self:PigBridgeEnabled() then
    return false
  end
  local had = self:GetPigChannelId()
  if had then
    -- 用户已经进过 PIG：保持现有编号，禁止再 Join，避免编号被重排。
    if not self._pigChatShown then
      self:ShowPigChannel()
      self._pigChatShown = true
    end
    -- 已在频里但还没做过「进频刷新」：补排一次
    if not self._pigJoinRefreshDone and self.PigScheduleJoinRefresh then
      self:PigScheduleJoinRefresh()
    end
    return true
  end
  -- 前 3 秒先别自己加 PIG，等游戏或时空之门把原有编号加回来。
  if self.ChannelSettleAge and self:ChannelSettleAge() < 3 then
    if not self._pigJoinLater then
      self._pigJoinLater = true
      C_Timer.After(3.2, function()
        H._pigJoinLater = false
        pcall(function()
          H:EnsurePigChannel()
        end)
      end)
    end
    return false
  end
  pcall(function()
    local chatId = DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME:GetID() or 1
    -- 与时空之门一致：进频并挂到默认聊天框，用户仍可看、可聊
    if JoinTemporaryChannel then
      JoinTemporaryChannel(self.PIG_CHANNEL, nil, chatId, 1)
    elseif JoinChannelByName then
      JoinChannelByName(self.PIG_CHANNEL, nil, chatId, 1)
    end
  end)
  self:ShowPigChannel()
  self._pigChatShown = true
  local ok = self:GetPigChannelId() and true or false
  if ok and not self._pigJoinRefreshDone and self.PigScheduleJoinRefresh then
    self:PigScheduleJoinRefresh()
  end
  return ok
end

-- opts.useChat=true：发可见频道字（同时空之门点刷新）。必须在玩家点击触发的调用栈里，
-- 定时器里喊会「插件导致界面行为失效」且燃烧上经常没人回。
-- 插件频道包可随时发，作补充。
function H:PigSendChannelProbe(opts)
  opts = opts or {}
  local id = self:GetPigChannelId()
  if not id then
    return false
  end
  local msg = self.PIG_LAYER_GET
  local sent = false
  local useChat = opts.useChat
  -- 燃烧、泰坦：定时器里发频道字会弹「插件导致界面行为失效」
  if useChat and not (H.InPlayerClick and H:InPlayerClick()) then
    useChat = false
  end
  if useChat then
    pcall(function()
      local send = H._origSendChatMessage or SendChatMessage
      send(msg, "CHANNEL", nil, id)
      sent = true
    end)
    -- 插件包挪到下一帧，避免和可见频道字叠在同一点击栈里加重卡顿
    C_Timer.After(0, function()
      pcall(function()
        if C_ChatInfo and C_ChatInfo.SendAddonMessage then
          C_ChatInfo.SendAddonMessage(H.PIG_PREFIX, msg, "CHANNEL", id)
        end
      end)
    end)
  else
    pcall(function()
      if C_ChatInfo and C_ChatInfo.SendAddonMessage then
        C_ChatInfo.SendAddonMessage(self.PIG_PREFIX, msg, "CHANNEL", id)
        sent = true
      end
    end)
  end
  return sent
end

-- 玩家点击上下文：怀旧系频道字+插件包；正式服只发插件包（同时空之门）
-- opts.gapSec：距上次喊话最短间隔，默认 30 秒（不是每次点击都喊）
function H:PigLoudChatProbe(opts)
  opts = opts or {}
  if not self:PigBridgeEnabled() then
    return false
  end
  if self:IsPaused() or IsInGroup() or self:IsInInstance() or self:IsInContentQueue() then
    return false
  end
  if self.IsHoppableHere and not self:IsHoppableHere() then
    return false
  end
  -- 已有频道号就别再 Join/挂框
  if not self:GetPigChannelId() then
    self:EnsurePigChannel()
  end
  if not self:GetPigChannelId() then
    return false
  end
  local gap = tonumber(opts.gapSec) or 30
  local now = self:Now()
  if (self._pigLoudAt or 0) + gap > now then
    return false
  end
  local useChat = self:PigProbeUsesChat()
  if not self:PigSendChannelProbe({ useChat = useChat }) then
    return false
  end
  self._pigLoudAt = now
  self._pigProbeAt = now
  self._pigIdleProbeAt = now
  self._pigJoinedOnce = true
  self._pigClickArmed = false
  return true
end

-- 进频后：怀旧系臂一次点击再喊；正式服可直接发插件包
function H:PigArmClickProbe()
  if not self:PigBridgeEnabled() or self._pigClickArmed then
    return
  end
  if not self:PigProbeUsesChat() then
    pcall(function()
      H:PigLoudChatProbe({ gapSec = 3 })
    end)
    return
  end
  self._pigClickArmed = true
  if not self._pigWorldHooked and WorldFrame and WorldFrame.HookScript then
    self._pigWorldHooked = true
    WorldFrame:HookScript("OnMouseDown", function()
      if not H._pigClickArmed then
        return
      end
      H._pigClickArmed = false
      if H.RunPlayerClick then
        H:RunPlayerClick(function()
          H:PigLoudChatProbe({ gapSec = 3 })
        end)
      else
        pcall(function()
          H:PigLoudChatProbe({ gapSec = 3 })
        end)
      end
    end)
  end
end

function H:PigSendAddon(msg, chatType, target)
  if not msg then
    return
  end
  pcall(function()
    if C_ChatInfo and C_ChatInfo.SendAddonMessage then
      C_ChatInfo.SendAddonMessage(self.PIG_PREFIX, msg, chatType or "WHISPER", target)
    end
  end)
end

-- 是否值得回应别人的位面探测（有线、能邀）
function H:PigCanAnnounce()
  if not self:PigBridgeEnabled() or self:IsPaused() then
    return false
  end
  if IsInGroup() or self:IsInInstance() or self:IsInContentQueue() then
    return false
  end
  if self.IsHoppableHere and not self:IsHoppableHere() then
    return false
  end
  if not self:CanInvite() then
    return false
  end
  local raw = self.currentRawLayer
  return raw and raw > 0
end

function H:PigBuildLayerReply()
  if not self:PigCanAnnounce() then
    return nil
  end
  local raw = tonumber(self.currentRawLayer)
  local map = tonumber(self:MyMapId()) or 0
  local rest = (IsResting and IsResting()) and "Y" or "N"
  -- 末段 N：不接对方插件求切（只向对方求切）；对方列表会显示密语而非「请求换位面」
  return self.PIG_LAYER_TAG
    .. tostring(raw)
    .. "^"
    .. tostring(map)
    .. "^"
    .. rest
    .. "^N"
end

function H:PigReplyToProbe(who)
  if not who then
    return
  end
  local replyAs = self:ReplyName(who) or who
  if self:IsSelfName(replyAs) or self:IsSelfName(who) then
    return
  end
  -- 别人刷屏探测时限速回，避免一瞬间发几十条密语卡死客户端
  local now = self:Now()
  if (self._pigReplyBurstAt or 0) + 1 < now then
    self._pigReplyBurstAt = now
    self._pigReplyBurstN = 0
  end
  self._pigReplyBurstN = (self._pigReplyBurstN or 0) + 1
  if self._pigReplyBurstN > 8 then
    return
  end
  local msg = self:PigBuildLayerReply()
  if not msg then
    return
  end
  self:PigSendAddon(msg, "WHISPER", replyAs)
end

-- 定时器路径：只发插件包（不保证燃烧上有人回）；真正刷新靠 PigLoudChatProbe
function H:PigForceRefreshProbe()
  if not self:PigBridgeEnabled() then
    return false
  end
  if self:IsPaused() or IsInGroup() or self:IsInInstance() or self:IsInContentQueue() then
    return false
  end
  if self.IsHoppableHere and not self:IsHoppableHere() then
    return false
  end
  self:EnsurePigChannel()
  if not self:GetPigChannelId() then
    return false
  end
  self._pigProbeAt = 0
  if not self:PigSendChannelProbe({ useChat = false }) then
    return false
  end
  self._pigProbeAt = self:Now()
  self._pigIdleProbeAt = self:Now()
  self._pigJoinedOnce = true
  return true
end

-- 进 PIG 频道后：臂一次点击再喊（与时空之门点刷新同一条可见频道字）
function H:PigScheduleJoinRefresh()
  if not self:PigBridgeEnabled() or self._pigJoinRefreshDone then
    return
  end
  self._pigJoinRefreshDone = true
  C_Timer.After(2, function()
    pcall(function()
      H:EnsurePigChannel()
      if H.PigArmClickProbe then
        H:PigArmClickProbe()
      end
    end)
  end)
end

-- 在 PIG 频道发探测；只有真正发出去才算成功（避免「没进频却当已扫过」）
function H:PigBroadcastProbe()
  if not self:PigBridgeEnabled() then
    return false
  end
  local now = self:Now()
  if (self._pigProbeAt or 0) + (self.PIG_PROBE_GAP or 8) > now then
    return false
  end
  self:EnsurePigChannel()
  if self:PigSendChannelProbe() then
    self._pigProbeAt = now
    self._pigJoinedOnce = true
    return true
  end
  -- 刚进频：短延迟再试，成功才记时间戳
  if not self._pigProbeRetrying then
    self._pigProbeRetrying = true
    C_Timer.After(0.8, function()
      H._pigProbeRetrying = false
      pcall(function()
        H:EnsurePigChannel()
        if H:PigSendChannelProbe() then
          H._pigProbeAt = H:Now()
          H._pigJoinedOnce = true
        end
      end)
    end)
  end
  return false
end

-- 后台探测：有人回 !L 后才会进列表
function H:PigIdleProbe()
  if not self:PigBridgeEnabled() or self:IsPaused() then
    return false
  end
  if IsInGroup() or self:IsInInstance() or self:IsInContentQueue() then
    return false
  end
  if self.IsHoppableHere and not self:IsHoppableHere() then
    return false
  end
  local now = self:Now()
  if (self._pigIdleProbeAt or 0) + (self.PIG_IDLE_PROBE_GAP or 20) > now then
    return false
  end
  if not self:PigBroadcastProbe() then
    -- 没进频/没发出去：不拉长冷却，下次 ticker 再试（不打聊天提示）
    return false
  end
  self._pigIdleProbeAt = now
  return true
end

-- 登录后前几分钟勤扫；之后跟心跳走
function H:StartPigBridgeTicker()
  if not self:PigBridgeEnabled() or self._pigTicker then
    return
  end
  local bursts = { 2, 5, 10, 18, 30, 45, 70 }
  for _, sec in ipairs(bursts) do
    C_Timer.After(sec, function()
      pcall(function()
        if H.PigIdleProbe then
          H:PigIdleProbe()
        end
      end)
    end)
  end
  self._pigTicker = C_Timer.NewTicker(90, function()
    if not H.db then
      return
    end
    pcall(function()
      if H.PigIdleProbe then
        H:PigIdleProbe()
      end
    end)
  end)
end

function H:PigSendLayerRequest(name, smallRaw)
  local to = self:WhisperTarget(name) or self:ReplyName(name) or name
  smallRaw = tonumber(smallRaw)
  if not to or not smallRaw or smallRaw <= 0 then
    return false
  end
  -- 时空之门把前缀去掉后整段拿去当版本号。后面再加 #位面号，版本读出来是空的，邀请发不出去。
  self:PigSendAddon(
    self.PIG_LAYER_REQ .. tostring(self.PIG_LAYER_VER),
    "WHISPER",
    to
  )
  return true
end

function H:PigParseLayerRequest(msg)
  if type(msg) ~= "string" then
    return nil
  end
  local prefix = self.PIG_LAYER_REQ
  if msg:sub(1, #prefix) ~= prefix then
    return nil
  end
  local rest = msg:sub(#prefix + 1) or ""
  local _, rawS = rest:match("^([%d%.]+)#(%d+)$")
  local smallRaw = tonumber(rawS)
  if not smallRaw or smallRaw <= 0 then
    return nil
  end
  return smallRaw
end

function H:UpsertPigPeer(sender, zoneID, mapID, autoinv, replyAs)
  zoneID = tonumber(zoneID)
  if not zoneID or zoneID <= 0 then
    return
  end
  mapID = tonumber(mapID) or 0
  if self.RequiresSameMapForHop and self:RequiresSameMapForHop() then
    if not (self.SameHoppableMap and self:SameHoppableMap(self:MyMapId(), mapID)) then
      return
    end
  end
  replyAs = self:ReplyName(replyAs or sender)
  local key = self:NormalizeName(replyAs or sender)
  if not key then
    return
  end
  self:UpsertPeer(
    key,
    zoneID,
    true,
    tonumber(mapID) or 0,
    false,
    false,
    false,
    false,
    false,
    replyAs
  )
  local peer = self.db.peers[key]
  if peer then
    peer.pig = true
    peer.pigAuto = (autoinv == "Y" or autoinv == "y" or autoinv == true)
  end
end

function H:OnPigAddonMessage(msg, dist, sender)
  if not self:PigBridgeEnabled() or not msg or not sender then
    return
  end
  local replyAs = self:ReplyName(sender)
  local key = self:NormalizeName(replyAs or sender)
  if not key or self:IsSelfName(key) or self:IsSelfName(replyAs) then
    return
  end

  -- 频道里的插件探测（部分客户端走 ADDON CHANNEL）
  if dist == "CHANNEL" and msg == self.PIG_LAYER_GET then
    self:PigReplyToProbe(replyAs or sender)
    return
  end

  if dist ~= "WHISPER" then
    return
  end

  local reqPrefix = self.PIG_LAYER_REQ
  if msg:sub(1, #reqPrefix) == reqPrefix then
    -- 带了小位面号：先认自己现在的层再组。没带号的仍不接（避免进错队）。
    local smallRaw = self:PigParseLayerRequest(msg)
    if smallRaw and self.OnHelpRequest then
      self:OnHelpRequest(key, smallRaw, replyAs, { pig = true })
    end
    return
  end

  if msg:sub(1, 2) == self.PIG_LAYER_TAG then
    local body = msg:sub(3)
    local zoneID, mapID, _rest, autoinv = strsplit("^", body)
    -- 名单开着：时空之门回包排队，每 0.1 秒收一小撮
    if self.EnqueuePanelInbound and self:EnqueuePanelInbound("pig", {
      key = key,
      zoneID = zoneID,
      mapID = mapID,
      autoinv = autoinv,
      replyAs = replyAs,
    }) then
      return
    end
    self:UpsertPigPeer(key, zoneID, mapID, autoinv, replyAs)
    -- 喊话后几十人同时回：合并刷新，别每人刷一整表
    if self.ScheduleRefreshUI then
      self:ScheduleRefreshUI(0.4)
    else
      self:RefreshUI()
    end
  end
end

function H:OnPigChannelMessage(msg, sender, channelBaseName)
  if not self:PigBridgeEnabled() or not msg or not sender then
    return
  end
  if channelBaseName and channelBaseName ~= "" then
    local ch = tostring(channelBaseName)
    if ch ~= self.PIG_CHANNEL and not ch:find(self.PIG_CHANNEL, 1, true) then
      return
    end
  end
  if msg == self.PIG_LAYER_GET then
    self:PigReplyToProbe(sender)
  end
end

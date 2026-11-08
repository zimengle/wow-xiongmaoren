local H = HuZhuLayer

function H:InitNet()
  pcall(function()
    if C_ChatInfo and C_ChatInfo.RegisterAddonMessagePrefix then
      C_ChatInfo.RegisterAddonMessagePrefix(self.PREFIX)
    end
  end)
  self:InstallChatGuards()
  pcall(function()
    self:HookLeavePartyForThanks()
  end)
  pcall(function()
    self:InitPigBridge()
  end)
end

function H:SendAddonPrio(msg, chatType)
  if chatType == "WHISPER" then
    return 1
  end
  if type(msg) == "string" and (msg:sub(1, 4) == "LYT|" or msg:sub(1, 4) == "NUM|") then
    return 3
  end
  return 2
end

function H:EnsureOutPump()
  if self._outPump then
    return
  end
  self._outPump = C_Timer.NewTicker(0.1, function()
    pcall(function()
      H:DrainOutQueue()
    end)
  end)
end

function H:DrainOutQueue()
  local q = self._outQ
  if not q or not q[1] then
    if self._outPump then
      self._outPump:Cancel()
      self._outPump = nil
    end
    return
  end
  local now = self:Now()
  if (self._outPauseUntil or 0) > now then
    return
  end
  local best, bestI = nil, nil
  for i, item in ipairs(q) do
    if not best or item.prio < best.prio then
      best, bestI = item, i
    end
    if best.prio == 1 then
      break
    end
  end
  if not best then
    return
  end
  table.remove(q, bestI)
  if C_ChatInfo and C_ChatInfo.SendAddonMessage then
    local chatType = best.chatType or "WHISPER"
    local target = best.target
    local function attempt(t)
      return pcall(C_ChatInfo.SendAddonMessage, self.PREFIX, best.msg, chatType, t)
    end
    local used = target
    local tries = {}
    local function record(label, t, ok2, result2)
      tries[#tries + 1] = string.format(
        "%s目标%s回%s",
        label,
        tostring(t),
        ok2 and tostring(result2) or "出错"
      )
    end
    local ok, result = attempt(target)
    record("编号", target, ok, result)
    -- 编号被退回时，改用频道名单里的真名，再退回才用短名。
    if chatType == "CHANNEL" and ((not ok) or result == 4 or result == 6 or result == 7) then
      local _, listName = self:FindDiscoveryChannel()
      local shortName = (self.GetDiscoveryChannelName and self:GetDiscoveryChannelName()) or (self.HZL_CHANNEL or "互助切位面")
      local byName = (type(listName) == "string" and listName ~= "") and listName or shortName
      if target ~= byName then
        used = byName
        ok, result = attempt(byName)
        record(byName == shortName and "短名" or "名单名", byName, ok, result)
      end
      if byName ~= shortName and ((not ok) or result == 4 or result == 6 or result == 7) and target ~= shortName then
        used = shortName
        ok, result = attempt(shortName)
        record("短名", shortName, ok, result)
      end
      if type(target) == "number" and ((not ok) or result == 4 or result == 6 or result == 7) then
        used = tostring(target)
        ok, result = attempt(tostring(target))
        record("文字", used, ok, result)
      end
    end
    local accepted = ok and result ~= 3 and result ~= 4 and result ~= 6 and result ~= 7 and result ~= 8
    local retryLater = (not ok) or result == 3 or result == 8
    if chatType == "CHANNEL" and type(best.msg) == "string" and best.msg:sub(1, 6) == "HELLO|" then
      if accepted then
        self._channelHelloOk = true
      else
        self._channelHelloOk = false
        self._channelHelloAt = nil
        if not retryLater and self.ScheduleHelloRetry then
          self:ScheduleHelloRetry()
        end
      end
      if self.Trace then
        local nPeer = self.PeerDiaryCount and self:PeerDiaryCount() or 0
        local shown = "空"
        if self.FindDiscoveryChannel then
          local _, listName = self:FindDiscoveryChannel()
          if type(listName) == "string" and listName ~= "" then
            shown = listName
          end
        end
        if shown == "空" then
          local chId = self.GetDiscoveryChannelId and self:GetDiscoveryChannelId()
          if chId then
            local _, qname = GetChannelName(chId)
            if type(qname) == "string" and qname ~= "" then
              shown = qname
            end
          end
        end
        self:Trace(string.format(
          "招呼 %s 显示名%s 同伴%d",
          table.concat(tries, " "),
          shown,
          nPeer
        ))
      end
    end
    if retryLater then
      table.insert(q, 1, best)
      self._outPauseUntil = now + 1.2
    elseif type(best.msg) == "string" and best.msg:sub(1, 6) == "HELLO|" and chatType ~= "CHANNEL" and self.Trace then
      self:Trace(string.format(
        "插件发出 来路%s 目标%s 回%s %s",
        tostring(chatType),
        self:DiaryBit(used, 32),
        ok and tostring(result) or "出错",
        accepted and "收下" or "没收下"
      ))
    end
  end
end

function H:SendAddon(msg, chatType, target)
  if not msg then
    return
  end
  self._outQ = self._outQ or {}
  local q = self._outQ
  if #q >= 50 then
    for i = #q, 1, -1 do
      if q[i].prio >= 3 then
        table.remove(q, i)
        break
      end
    end
    if #q >= 50 then
      table.remove(q, 1)
    end
  end
  q[#q + 1] = {
    msg = msg,
    chatType = chatType or "WHISPER",
    target = target,
    prio = self:SendAddonPrio(msg, chatType),
  }
  self:EnsureOutPump()
end

function H:Whisper(name, text)
  if not name or not text then
    return
  end
  pcall(function()
    SendChatMessage(text, "WHISPER", nil, name)
  end)
end

function H:IsHzlChannelName(name)
  if not name or name == "" then
    return false
  end
  local want = self.HZL_CHANNEL or "互助切位面"
  if name == want then
    return true
  end
  -- 「7. 互助切位面」或带地区后缀
  if type(name) == "string" and name:find(want, 1, true) then
    return true
  end
  return false
end

-- 当前发现频道名（互助切位面；旧大脚带实例后缀时不再当发现主路）
function H:IsDiscoveryChannelName(name)
  if not name or name == "" then
    return false
  end
  local want = (self.GetDiscoveryChannelName and self:GetDiscoveryChannelName()) or (self.HZL_CHANNEL or "互助切位面")
  if name == want then
    return true
  end
  if type(name) == "string" and name:find(want, 1, true) then
    return true
  end
  return false
end

function H:FindExactChannelId(chname)
  if not chname or chname == "" or not GetChannelList then
    return nil
  end
  local list = { GetChannelList() }
  local i = 1
  while i <= #list do
    local id, name = list[i], list[i + 1]
    if type(id) == "number" and name == chname and id > 0 then
      return id
    end
    if type(id) == "number" and type(name) == "string" then
      if type(list[i + 2]) == "string" then
        i = i + 2
      else
        i = i + 3
      end
    else
      i = i + 1
    end
  end
  return nil
end

function H:FindDiscoveryChannel()
  local want = (self.GetDiscoveryChannelName and self:GetDiscoveryChannelName()) or (self.HZL_CHANNEL or "互助切位面")
  if GetChannelList then
    local list = { GetChannelList() }
    local i = 1
    while i <= #list do
      local id, name = list[i], list[i + 1]
      if type(id) == "number" and type(name) == "string" then
        if self:IsDiscoveryChannelName(name) then
          return id, name
        end
        if type(list[i + 2]) == "string" then
          i = i + 2
        else
          i = i + 3
        end
      else
        i = i + 1
      end
    end
  end
  local id = GetChannelName(want)
  if type(id) == "number" and id > 0 then
    local _, shown = GetChannelName(id)
    if type(shown) == "string" and self:IsDiscoveryChannelName(shown) then
      return id, shown
    end
    -- GetChannelName(短名) 时常只回编号、不回显示名；名单已对上短名则认
    if shown == nil or shown == "" then
      return id, want
    end
  end
  return nil, nil
end

function H:GetDiscoveryChannelId()
  local id = self:FindDiscoveryChannel()
  if type(id) == "number" and id > 0 then
    return id
  end
  return nil
end

function H:PeerDiaryCount()
  local n = 0
  if self.db and self.db.peers then
    for _ in pairs(self.db.peers) do
      n = n + 1
    end
  end
  return n
end

function H:NoteDiscoveryChannel()
  if not self.TraceIfChanged then
    return
  end
  local id, listName = self:FindDiscoveryChannel()
  local nPeer = self:PeerDiaryCount()
  local shown = "空"
  if type(listName) == "string" and listName ~= "" then
    shown = listName
  elseif id then
    local _, qname = GetChannelName(id)
    if type(qname) == "string" and qname ~= "" then
      shown = qname
    end
  end
  local line
  if id then
    line = string.format("频道查询 编号%s 显示名%s 同伴%d", tostring(id), shown, nPeer)
  else
    line = string.format("频道查询 还没进去 同伴%d", nPeer)
  end
  self:TraceIfChanged("disc-ch", line)
end

function H:IsOurDiscoveryChannel(channelTarget)
  local id = self:GetDiscoveryChannelId()
  if type(channelTarget) == "number" then
    return id and channelTarget == id
  end
  if type(channelTarget) == "string" then
    if self:IsDiscoveryChannelName(channelTarget) then
      return true
    end
    local num = tonumber(channelTarget)
    if num and id and num == id then
      return true
    end
  end
  return false
end

-- 真正退出（绕过「不许退」钩子；仅用于丢掉旧英文频道名）
function H:ChannelLeaveNeedsClick()
  if self.NeedsClickForProtected and self:NeedsClickForProtected() then
    return true
  end
  return self.IsTbcClient and self:IsTbcClient()
end

function H:RawLeaveChannelByName(name)
  if not name then
    return
  end
  if self:ChannelLeaveNeedsClick() and not self:InPlayerClick() then
    self._pendingLeaves = self._pendingLeaves or {}
    self._pendingLeaves[name] = true
    return
  end
  if self._pendingLeaves then
    self._pendingLeaves[name] = nil
  end
  pcall(function()
    local fn = self._origLeaveChannelByName or LeaveChannelByName
    if fn then
      fn(name)
      return
    end
    local id = GetChannelName(name)
    local fn2 = self._origLeaveChannelByNumber or LeaveChannelByNumber
    if type(id) == "number" and id > 0 and fn2 then
      fn2(id)
    end
  end)
end

function H:FlushPendingChannelLeaves()
  local pending = self._pendingLeaves
  if not pending then
    return
  end
  self._pendingLeaves = nil
  for name in pairs(pending) do
    self:RawLeaveChannelByName(name)
  end
end

function H:LeaveLegacyDiscoveryChannel()
  for _, name in ipairs(self.HZL_CHANNEL_LEGACY or { "HuZhuLayer" }) do
    self:RawLeaveChannelByName(name)
  end
end

-- 两条线互不串：
--   综合 = 仅「每日首次切面成功」致谢（Thanks.lua）可发可见字
--   互助频 = 只收插件信息，绝对不发可见字
-- 注意：禁止对聊天输入框 SetAttribute——坐船/鸟点换图时常污染，
-- pcall 挡不住「只对暴雪 UI 开放」弹窗。粘性指到互助频时由 SendChatMessage 钩子吞掉并提示即可。
function H:ClearDiscoveryChatSticky()
  local function fixEditBox(eb)
    if not eb then
      return
    end
    local chatType, target
    if eb.GetAttribute then
      local ok1, ct = pcall(function()
        return eb:GetAttribute("chatType")
      end)
      local ok2, tg = pcall(function()
        return eb:GetAttribute("channelTarget")
      end)
      if ok1 then
        chatType = ct
      end
      if ok2 then
        target = tg
      end
    end
    if chatType ~= "CHANNEL" then
      return
    end
    if not self:IsOurDiscoveryChannel(target) then
      return
    end
    -- 只改非安全字段（若客户端认）；绝不 SetAttribute
    local gid = self.FindGeneralChannelId and self:FindGeneralChannelId()
    if type(eb.stickyType) == "string" then
      eb.stickyType = gid and "CHANNEL" or "SAY"
    end
    if type(eb.chatType) == "string" then
      eb.chatType = gid and "CHANNEL" or "SAY"
    end
    if gid then
      eb.channelTarget = gid
    else
      eb.channelTarget = nil
    end
  end
  local i = 1
  while _G["ChatFrame" .. i] do
    local cf = _G["ChatFrame" .. i]
    if cf and cf.editBox then
      pcall(fixEditBox, cf.editBox)
    end
    i = i + 1
  end
  if DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.editBox then
    pcall(fixEditBox, DEFAULT_CHAT_FRAME.editBox)
  end
  if ChatEdit_GetActiveWindow then
    pcall(function()
      fixEditBox(ChatEdit_GetActiveWindow())
    end)
  end
end

-- 从所有聊天框摘掉，避免出现在发言目标 / 聊天标签。
-- 泰坦重铸：这个摘除会被判成「插件导致界面行为失效」，频道字已另有过滤，不再摘。
function H:ChatFrameRemoveBlocked()
  return self.ClientKind and self:ClientKind() == "titan"
end

-- 泰坦：退频道、喊可见字、自动接队，必须在玩家这一下点击里做。
-- 放进定时器会弹「插件导致界面行为失效」。
function H:NeedsClickForProtected()
  return self:ChatFrameRemoveBlocked()
end

function H:InPlayerClick()
  return (self._playerClickDepth or 0) > 0
end

function H:RunPlayerClick(fn)
  self._playerClickDepth = (self._playerClickDepth or 0) + 1
  if self.FlushPendingChannelLeaves then
    self:FlushPendingChannelLeaves()
  end
  if self.FlushPendingGeneralChat then
    self:FlushPendingGeneralChat()
  end
  local ok, err = pcall(fn)
  self._playerClickDepth = math.max(0, (self._playerClickDepth or 1) - 1)
  if not ok and self.Trace then
    self:Trace("点击处理失败 " .. tostring(err))
  end
end

-- 从聊天框摘掉显示，不 LeaveChannel（人仍在互助切位面里）。
function H:HideDiscoveryChannel()
  if self:ChatFrameRemoveBlocked() then
    self:ClearDiscoveryChatSticky()
    return
  end
  local name = self.HZL_CHANNEL or "互助切位面"
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
  if DEFAULT_CHAT_FRAME then
    pcall(function()
      if ChatFrame_RemoveChannel then
        ChatFrame_RemoveChannel(DEFAULT_CHAT_FRAME, name)
      end
    end)
  end
  self:ClearDiscoveryChatSticky()
end

-- 发现频默认不可见：禁止再挂进聊天框（留空实现，避免误 Show）。
function H:ShowDiscoveryChannel()
  self:HideDiscoveryChannel()
end

function H:JoinDiscoveryChannelRaw()
  local name = (self.GetDiscoveryChannelName and self:GetDiscoveryChannelName()) or (self.HZL_CHANNEL or "互助切位面")
  if self.UsesVisibleChannelHello and self:UsesVisibleChannelHello() then
    pcall(function()
      local frameId = 1
      if DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.GetID then
        frameId = DEFAULT_CHAT_FRAME:GetID() or 1
      end
      local kind, returned
      local how = "没调用"
      if JoinTemporaryChannel then
        how = "临时加入"
        kind, returned = JoinTemporaryChannel(name, nil, frameId, 1)
      elseif JoinChannelByName then
        how = "按名加入"
        kind, returned = JoinChannelByName(name, nil, frameId, 1)
      end
      if H.Trace then
        local nameText = "空"
        if type(returned) == "string" and returned ~= "" then
          nameText = returned
        end
        H:Trace(string.format(
          "加入交还 %s 种类%s 名字%s",
          how,
          kind == nil and "空" or tostring(kind),
          nameText
        ))
      end
    end)
    if self.ShowsDiscoveryChannel and self:ShowsDiscoveryChannel() then
      self:ShowDiscoveryChannel()
    else
      self:HideDiscoveryChannel()
    end
    self:ClearDiscoveryChatSticky()
    return
  end
  local function noteJoin(how, kind, returned)
    if not H.Trace then
      return
    end
    local nameText = "空"
    if type(returned) == "string" and returned ~= "" then
      nameText = returned
    end
    H:Trace(string.format(
      "加入交还 %s 种类%s 名字%s",
      how,
      kind == nil and "空" or tostring(kind),
      nameText
    ))
  end
  pcall(function()
    -- 跟最初能用的那版一样：先挂进聊天框；名单里还没有，再临时加一次。
    local frameId = 1
    if DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.GetID then
      frameId = DEFAULT_CHAT_FRAME:GetID() or 1
    end
    if JoinPermanentChannel then
      local kind, returned = JoinPermanentChannel(name, nil, frameId)
      noteJoin("永久加入", kind, returned)
    end
    if not H:GetDiscoveryChannelId() then
      if JoinTemporaryChannel then
        local kind, returned = JoinTemporaryChannel(name)
        noteJoin("临时加入", kind, returned)
      elseif JoinChannelByName then
        local kind, returned = JoinChannelByName(name)
        noteJoin("按名加入", kind, returned)
      end
    end
    H:ClearDiscoveryChatSticky()
  end)
end

-- 登录/掉线后：自动进频、隐藏、上锁；静默不刷屏
function H:EnsureDiscoveryChannel()
  self:InstallChatGuards()
  self:LeaveLegacyDiscoveryChannel()
  if not self:GetDiscoveryChannelId() then
    local want = (self.GetDiscoveryChannelName and self:GetDiscoveryChannelName()) or (self.HZL_CHANNEL or "互助切位面")
    local stale = GetChannelName(want)
    if type(stale) == "number" and stale > 0 and self.TraceIfChanged then
      self:TraceIfChanged("stale-ch", string.format("旧编号%s不在频道名单里，重新加入", tostring(stale)))
    end
    self:JoinDiscoveryChannelRaw()
  end
  if self.ShowsDiscoveryChannel and self:ShowsDiscoveryChannel() then
    self:ShowDiscoveryChannel()
    self:ClearDiscoveryChatSticky()
  else
    -- 无限：进互助但不挂聊天框
    self:HideDiscoveryChannel()
  end
  if not (self.ShowsDiscoveryChannel and self:ShowsDiscoveryChannel()) and not self._hzlHideBurst then
    self._hzlHideBurst = true
    C_Timer.After(0.8, function()
      pcall(function()
        H:HideDiscoveryChannel()
      end)
    end)
    C_Timer.After(2.5, function()
      pcall(function()
        H:HideDiscoveryChannel()
        H._hzlHideBurst = false
      end)
    end)
  end
  self:StartDiscoveryChannelWatch()
  self:NoteDiscoveryChannel()
end

-- 定期确认仍在频道；被踢/异常退出则静默补进
function H:StartDiscoveryChannelWatch()
  if self._hzlChannelWatch then
    return
  end
  self._hzlChannelWatch = C_Timer.NewTicker(20, function()
    if not H.db then
      return
    end
    H:StallBegin("每20秒藏频道")
    pcall(function()
      if not H:GetDiscoveryChannelId() then
        H:JoinDiscoveryChannelRaw()
      end
      if H.ShowsDiscoveryChannel and H:ShowsDiscoveryChannel() then
        H:ShowDiscoveryChannel()
        H:ClearDiscoveryChatSticky()
      else
        H:HideDiscoveryChannel()
      end
      H:NoteDiscoveryChannel()
    end)
    H:StallEnd()
  end)
end

-- 频道通知：被退出则立刻补进；始终再藏一次
function H:OnDiscoveryChannelNotice(noticeType, channelName, channelBaseName, channelIndex)
  local function locked(v)
    return issecretvalue and issecretvalue(v)
  end
  local function readable(v)
    return type(v) == "string" and not locked(v)
  end
  local ours = (readable(channelName) and self:IsDiscoveryChannelName(channelName))
    or (readable(channelBaseName) and self:IsDiscoveryChannelName(channelBaseName))
    or (type(channelIndex) == "number" and self:IsOurDiscoveryChannel(channelIndex))
  local nameLocked = locked(channelName) or locked(channelBaseName) or locked(noticeType)
  local knownOther = (readable(channelName) and not self:IsDiscoveryChannelName(channelName))
    or (readable(channelBaseName) and not self:IsDiscoveryChannelName(channelBaseName))
  if self.Trace and (ours or (nameLocked and not knownOther)) then
    self:Trace(string.format(
      "频道通知 类型%s 名%s 短名%s 序号%s %s",
      self:DiaryBit(noticeType, 40),
      self:DiaryBit(channelName, 40),
      self:DiaryBit(channelBaseName, 40),
      self:DiaryBit(channelIndex, 12),
      ours and "是互助" or "认不出"
    ))
  end
  if not ours then
    return
  end
  if self.ShowsDiscoveryChannel and self:ShowsDiscoveryChannel() then
    self:ShowDiscoveryChannel()
    self:ClearDiscoveryChatSticky()
  else
    self:HideDiscoveryChannel()
  end
  local t = tostring(noticeType or "")
  if t == "YOU_LEFT" or t == "YOU_CHANGED" or t == "SUSPENDED" or t == "WRONG_PASSWORD" then
    C_Timer.After(0.15, function()
      pcall(function()
        H:JoinDiscoveryChannelRaw()
        if not (H.ShowsDiscoveryChannel and H:ShowsDiscoveryChannel()) then
          H:HideDiscoveryChannel()
        end
      end)
    end)
    C_Timer.After(1.0, function()
      pcall(function()
        if not H:GetDiscoveryChannelId() then
          H:JoinDiscoveryChannelRaw()
        end
        if H.ShowsDiscoveryChannel and H:ShowsDiscoveryChannel() then
          H:ShowDiscoveryChannel()
        else
          H:HideDiscoveryChannel()
        end
      end)
    end)
  end
end

-- 禁发言、禁退出 + 压进退/频道聊天显示（一律静默）
function H:InstallChatGuards()
  if self._chatGuards then
    return
  end
  self._chatGuards = true

  if not self._origSendChatMessage then
    self._origSendChatMessage = SendChatMessage
    SendChatMessage = function(msg, chatType, language, channel)
      -- 只禁言玩家往「互助切位面」打字；插件短码走 _origSendChatMessage 不经此钩。
      local muteOurs = false
      if chatType == "CHANNEL" then
        if H.IsMutedMeshChannel and H:IsMutedMeshChannel(channel) then
          muteOurs = true
        elseif type(channel) == "number" then
          local _, shown = GetChannelName(channel)
          muteOurs = H:IsHzlChannelName(shown)
        elseif type(channel) == "string" then
          muteOurs = H:IsHzlChannelName(channel)
        end
      end
      if muteOurs then
        H:ClearDiscoveryChatSticky()
        if type(msg) == "string" and msg ~= "" then
          if not H._stickyMuteTipAt or (H:Now() - (H._stickyMuteTipAt or 0)) > 60 then
            H._stickyMuteTipAt = H:Now()
            H:Print("互助频道只用于发现，不能发言；已把发言目标改开，请点「综合」再发")
          end
        end
        return
      end
      return H._origSendChatMessage(msg, chatType, language, channel)
    end
  end

  if LeaveChannelByName and not self._origLeaveChannelByName then
    self._origLeaveChannelByName = LeaveChannelByName
    LeaveChannelByName = function(name)
      if H.ChannelLeaveBlocked and H:ChannelLeaveBlocked(name) then
        return
      end
      if not H.ChannelLeaveBlocked and H:IsHzlChannelName(name) then
        return -- 不许退出
      end
      return H._origLeaveChannelByName(name)
    end
  end

  if LeaveChannelByNumber and not self._origLeaveChannelByNumber then
    self._origLeaveChannelByNumber = LeaveChannelByNumber
    LeaveChannelByNumber = function(id)
      if H.ChannelLeaveBlocked and H:ChannelLeaveBlocked(id) then
        return
      end
      if not H.ChannelLeaveBlocked and H:IsOurDiscoveryChannel(id) then
        return
      end
      return H._origLeaveChannelByNumber(id)
    end
  end

  if C_ChatInfo and C_ChatInfo.LeaveChannelByName and not self._origCLeaveByName then
    self._origCLeaveByName = C_ChatInfo.LeaveChannelByName
    C_ChatInfo.LeaveChannelByName = function(name)
      if H.ChannelLeaveBlocked and H:ChannelLeaveBlocked(name) then
        return
      end
      if not H.ChannelLeaveBlocked and H:IsHzlChannelName(name) then
        return
      end
      return H._origCLeaveByName(name)
    end
  end

  local function hideHzlNotice(_, _, msg, ...)
    if type(msg) == "string" and H:IsHzlChannelName(msg) then
      return true
    end
    for i = 1, select("#", ...) do
      local a = select(i, ...)
      if type(a) == "string" and H:IsHzlChannelName(a) then
        return true
      end
    end
    return false
  end

  local function hideHzlChannelMsg(_, _, text, player, _lang, channelName, ...)
    local ours = H:IsHzlChannelName(channelName)
    if not ours then
      for i = 1, select("#", ...) do
        local a = select(i, ...)
        if type(a) == "string" and H:IsHzlChannelName(a) then
          ours = true
          break
        end
      end
    end
    if not ours then
      return false
    end
    -- 记人在频道事件里做一次。这里只负责不把协议字画出来，避免同一句记两次。
    return true
  end

  local function hidePlayerNotFound(_, _, text)
    if H:ShouldHidePlayerNotFound(text) then
      return true
    end
    return false
  end

  -- 会锁字的客户端上，过滤会弄脏游戏自己的聊天处理。那种客户端不挂过滤。
  if ChatFrame_AddMessageEventFilter and not issecretvalue then
    pcall(ChatFrame_AddMessageEventFilter, "CHAT_MSG_SYSTEM", hideHzlNotice)
    pcall(ChatFrame_AddMessageEventFilter, "CHAT_MSG_SYSTEM", hidePlayerNotFound)
    pcall(ChatFrame_AddMessageEventFilter, "CHAT_MSG_CHANNEL_NOTICE", hideHzlNotice)
    pcall(ChatFrame_AddMessageEventFilter, "CHAT_MSG_CHANNEL_NOTICE_USER", hideHzlNotice)
    pcall(ChatFrame_AddMessageEventFilter, "CHAT_MSG_CHANNEL", hideHzlChannelMsg)
  end
end

-- 解析「未找到名为…的在线玩家」；命中密语网目标则藏提示并冷却
function H:ParsePlayerNotFoundName(text)
  if type(text) ~= "string" then
    return nil
  end
  return text:match("未找到名为[\"“「](.-)[\"”」]的在线玩家")
    or text:match("No player named ['\"](.-)['\"] is currently playing")
    or text:match("No player named (.-) is currently playing")
end

function H:MarkMeshWhisperFail(name)
  if not name or not self.db or not self.db.peers then
    return
  end
  local untilAt = self:WallNow() + (self.MESH_FAIL_COOLDOWN or 1800)
  for pname, peer in pairs(self.db.peers) do
    if peer and (self:IsSamePlayer(pname, name) or (peer.replyAs and self:IsSamePlayer(peer.replyAs, name))) then
      peer.whisperFailUntil = untilAt
    end
  end
end

function H:NoteMeshWhisperTarget(target)
  if not target then
    return
  end
  self._meshWhisperAt = self._meshWhisperAt or {}
  local now = self:WallNow()
  self._meshWhisperAt[target] = now
  local key = self:NormalizeName(target)
  if key then
    self._meshWhisperAt[key] = now
  end
end

function H:ShouldHidePlayerNotFound(text)
  local name = self:ParsePlayerNotFoundName(text)
  if not name then
    return false
  end
  local now = self:WallNow()
  local recent = false
  if self._meshWhisperAt then
    for k, at in pairs(self._meshWhisperAt) do
      if type(at) == "number" and now - at < 180 then
        if k == name or self:IsSamePlayer(k, name) then
          recent = true
          break
        end
      end
    end
  end
  if not recent and self.db and self.db.peers then
    for pname, peer in pairs(self.db.peers) do
      if peer and (self:IsSamePlayer(pname, name) or (peer.replyAs and self:IsSamePlayer(peer.replyAs, name))) then
        recent = true
        break
      end
    end
  end
  if recent then
    self:MarkMeshWhisperFail(name)
    return true
  end
  return false
end

function H:HelloPayload()
  local raw = self.currentRawLayer or 0
  local map = (self.MyHoppableMapId and self:MyHoppableMapId()) or 0
  local inst = self:IsInInstance() and 1 or 0
  local grouped = IsInGroup() and 1 or 0
  local combat = UnitAffectingCombat("player") and 1 or 0
  local paused = self:IsPaused() and 1 or 0
  local queued = self:IsInContentQueue() and 1 or 0
  -- HELLO|ver|raw|map|hosting|inst|grouped|combat|paused|queued
  return table.concat({
    "HELLO",
    self.VERSION,
    tostring(raw),
    tostring(map),
    "1",
    tostring(inst),
    tostring(grouped),
    tostring(combat),
    tostring(paused),
    tostring(queued),
  }, "|")
end

-- 可见频道短码：无竖线，避免无限 Invalid escape。空格分隔。
-- HZLw verDigits raw map host inst grouped combat paused queued
function H:VisibleHelloText()
  local raw = tonumber(self.currentRawLayer) or 0
  local map = (self.MyHoppableMapId and self:MyHoppableMapId()) or 0
  local inst = self:IsInInstance() and 1 or 0
  local grouped = IsInGroup() and 1 or 0
  local combat = UnitAffectingCombat("player") and 1 or 0
  local paused = self:IsPaused() and 1 or 0
  local queued = self:IsInContentQueue() and 1 or 0
  local ver = tostring(self.VERSION or "0"):gsub("%D", "")
  if ver == "" then
    ver = "0"
  end
  return table.concat({
    "HZLw",
    ver,
    tostring(raw),
    tostring(map),
    "1",
    tostring(inst),
    tostring(grouped),
    tostring(combat),
    tostring(paused),
    tostring(queued),
  }, " ")
end

-- 发现频道可见正文：无限用无竖线短码；其它版本仍用 HELLO|…
function H:ChannelHelloText()
  if self.IsForeverClient and self:IsForeverClient() and self.VisibleHelloText then
    return self:VisibleHelloText()
  end
  return self:HelloPayload()
end

-- 把可见短码还原成 HELLO|… 给 OnAddonMessage 用
function H:VisibleHelloToAddonMsg(text)
  if type(text) ~= "string" or text:sub(1, 5) ~= "HZLw " then
    return nil
  end
  local p = {}
  for w in string.gmatch(text, "%S+") do
    p[#p + 1] = w
  end
  if #p < 4 or p[1] ~= "HZLw" then
    return nil
  end
  return table.concat({
    "HELLO",
    p[2],
    p[3],
    p[4],
    p[5] or "1",
    p[6] or "0",
    p[7] or "0",
    p[8] or "0",
    p[9] or "0",
    p[10] or "0",
  }, "|")
end

-- 把已知同伴名字塞进发现频道，让别人密语桥接（跨后端时频道可能互不可见）
function H:MeetPayload()
  local now = self:WallNow()
  local names = {}
  for name, peer in pairs(self.db.peers or {}) do
    if #names >= 6 then
      break
    end
    if peer and self:IsWallStamp(peer.last) and now - (peer.last or 0) <= self.PEER_TTL then
      local who = self:WhisperTarget(name) or self:ReplyName(peer.replyAs or name)
      if who then
        table.insert(names, who)
      end
    end
  end
  if #names == 0 then
    return nil
  end
  return "MEET|" .. table.concat(names, ";")
end

-- 互助频道里谁说话就记下名字（游戏成员表要不到时也靠这条）。
-- 只记名，不当同伴；密语问到位面 HELLO 后再进列表。
function H:NoteChannelSpeaker(name)
  if not name or type(name) ~= "string" or name == "" then
    return
  end
  local reply = self:ReplyName(name) or name
  if self:IsSelfName(reply) then
    return
  end
  local key = self:NormalizeName(reply)
  if not key then
    return
  end
  self._rosterFromChat = self._rosterFromChat or {}
  self._rosterFromChatOrder = self._rosterFromChatOrder or {}
  if not self._rosterFromChat[key] then
    self._rosterFromChatOrder[#self._rosterFromChatOrder + 1] = reply
    if self.TraceIfChanged then
      self:TraceIfChanged("chat-name-" .. key, "频道说话记名 " .. self:DiaryBit(reply, 40))
    end
  end
  self._rosterFromChat[key] = reply
  -- 已有成员缓存时立刻并进，免得还要等十分钟才问到刚说话的人
  if self._rosterPlain then
    local found = false
    for _, n in ipairs(self._rosterPlain) do
      if self:NormalizeName(n) == key then
        found = true
        break
      end
    end
    if not found then
      self._rosterPlain[#self._rosterPlain + 1] = reply
    end
  end
end

function H:RosterNamesFromChat()
  local out = {}
  for _, name in ipairs(self._rosterFromChatOrder or {}) do
    local key = self:NormalizeName(name)
    local live = key and self._rosterFromChat and self._rosterFromChat[key]
    if live and not self:IsSelfName(live) then
      out[#out + 1] = live
    end
  end
  return out
end

function H:MergeRosterNames(apiPlain)
  local seen = {}
  local out = {}
  local function add(name)
    if not name or type(name) ~= "string" or name == "" then
      return
    end
    if self:IsSelfName(name) then
      return
    end
    local key = self:NormalizeName(name)
    if not key or seen[key] then
      return
    end
    seen[key] = true
    out[#out + 1] = name
  end
  for _, n in ipairs(apiPlain or {}) do
    add(n)
  end
  for _, n in ipairs(self:RosterNamesFromChat()) do
    add(n)
  end
  return out
end

-- 频道当花名册：成员表 + 频道说话记下的名字；不往聊天框印名单。
-- 每 2 秒问一个新名字。成员表缓存 ROSTER_CACHE_GAP（默认 10 分钟）重读一次。同一人十分钟内不再问。
function H:AskOneChannelMember(plain)
  if not plain or not plain[1] then
    return
  end
  local now = self:WallNow()
  self._rosterAsked = self._rosterAsked or {}
  local msg = self:HelloPayload()
  for _, rawName in ipairs(plain) do
    local key = self:NormalizeName(rawName)
    local peer = key and self.db and self.db.peers and self.db.peers[key]
    local fresh = peer and self:IsWallStamp(peer.last) and (now - (peer.last or 0) <= (self.PEER_TTL or 600))
    local asked = key and self._rosterAsked[key] or 0
    if key and not fresh and (now - asked >= 600) then
      local target = self:WhisperTarget(rawName)
      if target then
        self._rosterAsked[key] = now
        self:SendAddon(msg, "WHISPER", target)
        if self.Trace then
          self:Trace("向频道成员问位面 " .. self:DiaryBit(target, 40))
        end
        return
      end
    end
  end
end

function H:AskChannelMembers()
  -- 发现在互助切位面：成员表 + 说话记名，密语问位面（人少；勿再扫大脚）
  local id = self:GetDiscoveryChannelId()
  if not id then
    if self.TraceIfChanged then
      self:TraceIfChanged("roster-none", "频道成员 还没进频道")
    end
    return
  end
  if C_ChatInfo and C_ChatInfo.InChatMessagingLockdown and C_ChatInfo.InChatMessagingLockdown() then
    if self.TraceIfChanged then
      self:TraceIfChanged("roster-lock", "频道成员 这会儿不能发")
    end
    return
  end
  local now = self:WallNow()
  local cacheGap = self.ROSTER_CACHE_GAP or 600
  if self._rosterPlain and (now - (self._rosterReadAt or 0) < cacheGap) then
    -- 缓存期内也并上刚说话的新名字
    self._rosterPlain = self:MergeRosterNames(self._rosterPlain)
    self:AskOneChannelMember(self._rosterPlain)
    return
  end
  local read = (C_ChatInfo and C_ChatInfo.GetChannelRosterInfo) or GetChannelRosterInfo
  local apiPlain, locked, seen = {}, 0, 0
  if type(read) == "function" then
    local cap = tonumber(self._rosterCount) or 0
    if cap <= 0 then
      cap = 400
    elseif cap > 800 then
      cap = 800
    end
    for i = 1, cap do
      local ok, name = pcall(read, id, i)
      if not ok then
        if self.TraceIfChanged then
          self:TraceIfChanged("roster-err", "频道成员 读出错")
        end
        break
      end
      if name == nil or name == "" then
        if not self._rosterCount then
          break
        end
      elseif issecretvalue and issecretvalue(name) then
        locked = locked + 1
        seen = seen + 1
      elseif type(name) == "string" then
        seen = seen + 1
        if not self:IsSelfName(name) then
          apiPlain[#apiPlain + 1] = name
        end
      end
    end
  elseif self.TraceIfChanged then
    self:TraceIfChanged("roster-api", "频道成员 没有成员接口")
  end
  local plain = self:MergeRosterNames(apiPlain)
  self._rosterPlain = plain
  self._rosterReadAt = now
  if #plain == 0 then
    if locked > 0 then
      if self.TraceIfChanged then
        self:TraceIfChanged("roster-secret", "频道成员 名字被锁住")
      end
    elseif self.TraceIfChanged then
      self:TraceIfChanged("roster-empty", "频道成员 要不到")
    end
    return
  end
  if self.TraceIfChanged then
    local viaChat = #(self:RosterNamesFromChat())
    self:TraceIfChanged(
      "roster-n",
      string.format("频道成员 表%d 说话%d 可问%d", seen, viaChat, #plain)
    )
  end
  self:AskOneChannelMember(plain)
end

-- 密语刷新：只碰「刚还活跃」的同伴；进出战斗的 soft 心跳不走这里
function H:WhisperHelloMesh()
  -- 怀旧系/正式服：公会/专用频道够用，不必密语扫人（正式服跨服另说，先关密语网）
  if self.UsesClassicNames and self:UsesClassicNames() then
    return
  end
  local now = self:WallNow()
  local ttl = self.PEER_TTL or 600
  local gap = self.MESH_WHISPER_GAP or 300
  local list = {}
  for name, peer in pairs(self.db.peers or {}) do
    if peer
      and self:IsWallStamp(peer.last)
      and now - (peer.last or 0) <= ttl
      and (not peer.whisperFailUntil or peer.whisperFailUntil <= now)
    then
      table.insert(list, {
        name = name,
        target = self:WhisperTarget(name),
        lastWhisper = peer.lastWhisper or 0,
      })
    end
  end
  if #list == 0 then
    return
  end
  table.sort(list, function(a, b)
    return a.lastWhisper < b.lastWhisper
  end)
  local msg = self:HelloPayload()
  local maxN = self.MESH_WHISPER_MAX or 1
  local n = 0
  for _, c in ipairs(list) do
    if n >= maxN then
      break
    end
    if now - (c.lastWhisper or 0) >= gap and c.target then
      self:NoteMeshWhisperTarget(c.target)
      self:SendAddon(msg, "WHISPER", c.target)
      if self.db.peers[c.name] then
        self.db.peers[c.name].lastWhisper = now
        self.db.peers[c.name].replyAs = c.target
      end
      n = n + 1
    end
  end
end

function H:SendVisibleChannelHello(msg)
  if not msg then
    return false
  end
  self:EnsureDiscoveryChannel()
  local id = self:GetDiscoveryChannelId()
    if not id then
      if self.Trace then
        self:Trace("可见招呼还没进频道")
      end
      return false
    end
  local send = self._origSendChatMessage or SendChatMessage
  local ok, err = pcall(send, msg, "CHANNEL", nil, id)
  if self.Trace then
    self:Trace(string.format(
      "可见招呼 %s 编号%s %s",
      ok and "已交" or "没交",
      tostring(id),
      ok and "" or tostring(err)
    ))
  end
  return ok and true or false
end

-- 旧版曾在登录后第一次点击往说/喊/各频道发可见「试」。已停用，禁止再发。
function H:RunChannelProbe()
  if self.db then
    self.db.channelProbeDone = true
  end
  self._probeRan = true
end

function H:ArmVisibleHelloClick()
  self._visibleHelloArmed = true
  if self._visibleHelloHooked or not WorldFrame or not WorldFrame.HookScript then
    return
  end
  self._visibleHelloHooked = true
  WorldFrame:HookScript("OnMouseDown", function()
    if not H._visibleHelloArmed then
      return
    end
    H._visibleHelloArmed = false
    local function fire()
      local pending = H._pendingVisibleHello
        or (H.ChannelHelloText and H:ChannelHelloText())
        or (H.HelloPayload and H:HelloPayload())
      if H:SendVisibleChannelHello(pending) then
        local t = H:Now()
        H._channelHelloAt = t
        H._discoveryChannelSendAt = t
        H._channelHelloOk = true
        H._pendingVisibleHello = nil
      else
        H._visibleHelloArmed = true
      end
    end
    if H.RunPlayerClick then
      H:RunPlayerClick(fire)
    else
      fire()
    end
  end)
end

-- 看得见的招呼只在玩家点击时发，定时器里发会被游戏拦住。
-- 发现频道硬闸：无论强制重报还是心跳，至少隔 CHANNEL_SEND_MIN_GAP 秒才发下一条。
function H:BroadcastHelloChannel(msg, forceChannel, mode)
  local now = self:Now()
  local gap = self._channelBackoff or self.CHANNEL_HELLO_GAP or 90
  if not forceChannel and (self._channelHelloAt or 0) + gap > now then
    if mode == "full" and self.Trace then
      local left = math.floor((self._channelHelloAt or 0) + gap - now)
      self:Trace(string.format("频道招呼还在间隔里 剩%d秒", left))
    end
    return
  end
  local minGap = self.CHANNEL_SEND_MIN_GAP or 2
  local lastSend = self._discoveryChannelSendAt or 0
  if (now - lastSend) < minGap then
    self._pendingDiscoveryChannelMsg = msg
    self._pendingDiscoveryChannelMode = mode
    if not self._discoveryChannelDelay then
      local wait = minGap - (now - lastSend)
      self._discoveryChannelDelay = C_Timer.After(math.max(0.05, wait), function()
        H._discoveryChannelDelay = nil
        local pending = H._pendingDiscoveryChannelMsg
        local pendingMode = H._pendingDiscoveryChannelMode
        H._pendingDiscoveryChannelMsg = nil
        H._pendingDiscoveryChannelMode = nil
        if pending then
          H:BroadcastHelloChannel(pending, true, pendingMode or "force")
        end
      end)
    end
    if self.TraceIfChanged then
      self:TraceIfChanged("ch-min-gap", "频道发现 2秒一条 稍后发")
    end
    return
  end
  -- 发现频道可见字；公会/队伍/密语仍用带 | 的插件包 msg
  if self.UsesVisibleChannelHello and self:UsesVisibleChannelHello() then
    local vis = (self.ChannelHelloText and self:ChannelHelloText()) or msg
    self._pendingVisibleHello = vis
    self:EnsureDiscoveryChannel()
    if self.InPlayerClick and self:InPlayerClick() and self:SendVisibleChannelHello(vis) then
      self._channelHelloAt = now
      self._discoveryChannelSendAt = now
      self._channelHelloOk = true
      self._pendingVisibleHello = nil
      self._visibleHelloArmed = false
      return
    end
    if self.Trace then
      local chNow = self.GetDiscoveryChannelId and self:GetDiscoveryChannelId()
      self:Trace(string.format("可见招呼等下一次点击 编号%s", tostring(chNow or "无")))
    end
    self:ArmVisibleHelloClick()
    return
  end
  local ch = self:GetDiscoveryChannelId()
  if not ch then
    self:EnsureDiscoveryChannel()
    ch = self:GetDiscoveryChannelId()
  end
  -- 还没拿到编号时，按发现短名发。发不出去不记成「已经打过招呼」。
  local target = ch or ((self.GetDiscoveryChannelName and self:GetDiscoveryChannelName()) or (self.HZL_CHANNEL or "互助切位面"))
  self._channelHelloAt = now
  self._discoveryChannelSendAt = now
  self._lastChannelHelloId = ch
  self:SendAddon(msg, "CHANNEL", target)
  -- 每 2 秒最多一条：不再同一次再附带 MEET
end

-- 进频道后如果第一声招呼被退回，每 5 秒再试，试到发出去为止。平时仍是 90 秒一声。
function H:ScheduleHelloRetry()
  if self._helloRetry or self._channelHelloOk then
    return
  end
  if not C_Timer or not C_Timer.NewTicker then
    return
  end
  self._helloRetryN = 0
  self._helloRetry = C_Timer.NewTicker(5, function()
    if not H.db or H._channelHelloOk then
      if H._helloRetry then
        H._helloRetry:Cancel()
        H._helloRetry = nil
      end
      return
    end
    H._helloRetryN = (H._helloRetryN or 0) + 1
    if H._helloRetryN > 24 then
      if H._helloRetry then
        H._helloRetry:Cancel()
        H._helloRetry = nil
      end
      if H.Trace then
        H:Trace("招呼试了两分钟还是没发出去")
      end
      return
    end
    pcall(function()
      H:EnsureDiscoveryChannel()
      H:BroadcastHelloChannel(H:HelloPayload(), true)
    end)
  end)
end

-- mode:
--   "soft"  = 公会/队伍（进出战斗用；专用频道有自己的间隔闸）
--   "full"  = soft + 密语网；其它版本还会走发现频道
--   "force" = 忽略软间隔与频道间隔
-- 无限：互助可见短码不跟 90 秒心跳；只在 SetCurrentLayer 置 _hzlLayerAnnounce 时发（首次认出/换层）
function H:BroadcastHello(mode)
  if not self.db then
    return
  end
  mode = mode or "full"
  local now = self:Now()
  if mode ~= "force" and (self._helloSoftAt or 0) + (self.SOFT_HELLO_GAP or 12) > now then
    return
  end
  self._helloSoftAt = now
  local msg = self:HelloPayload()
  if IsInGuild() then
    self:SendAddon(msg, "GUILD")
  end
  if IsInGroup() then
    self:SendAddon(msg, IsInRaid() and "RAID" or "PARTY")
  end
  -- soft（进出战斗等）只走公会/队伍，不再密语扫人，避免「未找到玩家」刷屏
  if mode == "full" or mode == "force" then
    self:WhisperHelloMesh()
  end
  local forever = self.IsForeverClient and self:IsForeverClient()
  local layerAnnounce = self._hzlLayerAnnounce and true or false
  self._hzlLayerAnnounce = nil
  if forever then
    if layerAnnounce then
      self:BroadcastHelloChannel(msg, true, "force")
    end
  else
    self:BroadcastHelloChannel(msg, mode == "force", mode)
  end
end

-- 聊天被服务器限流时退避（专用频道也会守）
function H:OnChannelThrottle(text)
  if not text or not self.db then
    return
  end
  local limited = text:find("可发送的信息数量受限", 1, true)
    or text:find("不允许进行该操作", 1, true)
    or text:find("请稍候再发送", 1, true)
  if not limited then
    return
  end
  -- 综合/大脚等公共频的红字：与我们无关时也退避专用频道片刻，避免叠刷
  local now = self:Now()
  self._channelHelloAt = now
  local base = self.CHANNEL_HELLO_GAP or 90
  self._channelBackoff = math.min((self._channelBackoff or base) * 2, 600)
  self._outPauseUntil = now + 2
end

-- 长期花名册：见过装互助的人就记下，清 peers / 过期剪枝都不动这里
function H:RememberInstall(name, replyAs, meta)
  if not self.db then
    return
  end
  local reply = self:ReplyName(replyAs or name)
  local key = self:NormalizeName(reply or name)
  if not key or self:IsSelfName(key) or self:IsSelfName(reply) then
    return
  end
  self.db.installBook = self.db.installBook or {}
  local e = self.db.installBook[key]
  local now = self:WallNow()
  local isNew = e == nil
  if not e then
    e = { first = now, seen = 0 }
  end
  e.last = now
  e.seen = (tonumber(e.seen) or 0) + 1
  if reply and reply ~= "" then
    e.replyAs = reply
  end
  if type(meta) == "table" then
    local raw = tonumber(meta.raw)
    if raw and raw > 0 then
      e.raw = raw
    end
    local map = tonumber(meta.map)
    if map and map > 0 then
      e.map = map
    end
  end
  self.db.installBook[key] = e
  return isNew
end

-- 登录时把当前 peers 并进花名册（赶在清旧同伴之前）
function H:MigratePeersToInstallBook()
  if not self.db then
    return
  end
  local n = 0
  for name, peer in pairs(self.db.peers or {}) do
    if peer and not peer.pig then
      if self:RememberInstall(name, peer.replyAs or name, { raw = peer.raw, map = peer.map }) then
        n = n + 1
      end
    end
  end
  if self.db.installBook then
    local total = 0
    for _ in pairs(self.db.installBook) do
      total = total + 1
    end
    if self.TraceIfChanged then
      self:TraceIfChanged("install-book", string.format("安装花名册 %d人", total))
    end
  end
  return n
end

function H:InstallBookCount()
  local n = 0
  for _ in pairs((self.db and self.db.installBook) or {}) do
    n = n + 1
  end
  return n
end

function H:UpsertPeer(name, raw, hosting, mapId, inst, grouped, combat, paused, queued, replyAs)
  local reply = self:ReplyName(replyAs or name)
  if self:IsSelfName(reply or name) then
    return nil
  end
  name = self:NormalizeName(reply or name)
  if not name or self:IsSelfName(name) then
    return nil
  end
  local isNew = self.db.peers[name] == nil
  local peer = self.db.peers[name] or {}
  local prevRaw = tonumber(peer.raw)
  -- 合并旧坏键（如「愈合 德鲁伊-德鲁伊」）
  if isNew then
    for oldKey, oldPeer in pairs(self.db.peers) do
      if oldKey ~= name and self:NormalizeName(oldKey) == name then
        peer = oldPeer
        prevRaw = tonumber(oldPeer.raw)
        self.db.peers[oldKey] = nil
        isNew = false
        break
      end
    end
  end
  peer.last = self:WallNow()
  if reply and reply ~= "" then
    peer.replyAs = self:ReplyName(reply) or reply
  elseif peer.replyAs then
    -- 清洗旧存档里带 -CAMWOWCN1Realm1PvE 的坏 replyAs
    peer.replyAs = self:ReplyName(peer.replyAs) or peer.replyAs
  end
  if raw and raw > 0 then
    peer.raw = raw
    self:RememberRawLayer(raw)
  end
  if hosting ~= nil then
    peer.hosting = hosting and true or false
  end
  mapId = tonumber(mapId)
  if mapId ~= nil then
    peer.map = mapId
  end
  if inst ~= nil then
    peer.inst = inst and true or false
  end
  if grouped ~= nil then
    peer.grouped = grouped and true or false
  end
  if combat ~= nil then
    peer.combat = combat and true or false
  end
  if paused ~= nil then
    peer.paused = paused and true or false
  end
  if queued ~= nil then
    peer.queued = queued and true or false
  end
  self.db.peers[name] = peer
  self:RememberInstall(name, peer.replyAs or name, { raw = peer.raw, map = peer.map })
  if self.Trace and (isNew or (tonumber(raw) and tonumber(raw) > 0 and prevRaw ~= tonumber(raw))) then
    self:Trace(string.format(
      "听到 %s 位面%s 同伴%d",
      tostring(name),
      tostring((tonumber(raw) and tonumber(raw) > 0) and raw or (peer.raw or 0)),
      self.PeerDiaryCount and self:PeerDiaryCount() or 0
    ))
  end
  return isNew
end

function H:TraceHelloKept(channel, sender, raw, map, isNew)
  if not self.Trace then
    return
  end
  local how = "已在"
  if isNew == nil then
    how = "没记下"
  elseif isNew then
    how = "新"
  end
  self:Trace(string.format(
    "收下 来路%s 谁%s 位面%s 图%s %s",
    self:DiaryBit(channel, 16),
    self:DiaryBit(sender, 32),
    self:DiaryBit(raw, 8),
    self:DiaryBit(map, 8),
    how
  ))
end

function H:PrunePeers()
  local now = self:WallNow()
  local rename = {}
  for name, peer in pairs(self.db.peers) do
    local last = peer and tonumber(peer.last) or 0
    if (not self:IsWallStamp(last)) or (now - last > self.PEER_TTL * 3) then
      self.db.peers[name] = nil
    else
      if peer.replyAs then
        peer.replyAs = self:ReplyName(peer.replyAs) or peer.replyAs
      end
      local fixed = self:NormalizeName(name)
      if fixed and fixed ~= name then
        rename[name] = fixed
      end
    end
  end
  for oldKey, newKey in pairs(rename) do
    if not self.db.peers[newKey] then
      self.db.peers[newKey] = self.db.peers[oldKey]
    end
    self.db.peers[oldKey] = nil
  end
end

local function parseFlag(field)
  if field == nil or field == "" then
    return nil
  end
  return (tonumber(field) or 0) > 0
end

function H:OnAddonMessage(prefix, msg, channel, sender)
  if prefix ~= self.PREFIX or not msg then
    return
  end
  -- replyAs=游戏原名（密语/邀请只用这个）；sender=内部键
  local replyAs = self:ReplyName(sender)
  sender = self:NormalizeName(replyAs or sender)
  local parts = { strsplit("|", msg) }
  local cmd = parts[1]
  if cmd == "HELLO" then
    local raw = tonumber(parts[3] or 0) or 0
    local map = tonumber(parts[4] or 0)
    local inst, grouped, combat, paused, queued =
      parseFlag(parts[6]),
      parseFlag(parts[7]),
      parseFlag(parts[8]),
      parseFlag(parts[9]),
      parseFlag(parts[10]) -- queued（旧版无此字段 → nil 不改）
    -- 名单开着：公会/频道 HELLO 排队，每 0.1 秒收一小撮，避免一帧灌满
    if channel ~= "WHISPER" and self.EnqueuePanelInbound
      and self:EnqueuePanelInbound("hello", {
        sender = sender,
        raw = raw,
        map = map,
        inst = inst,
        grouped = grouped,
        combat = combat,
        paused = paused,
        queued = queued,
        replyAs = replyAs,
        channel = channel,
        key = sender,
      }) then
      return
    end
    local isNew = self:UpsertPeer(
      sender,
      raw,
      true,
      map,
      inst,
      grouped,
      combat,
      paused,
      queued,
      replyAs
    )
    local peer = self.db.peers[sender]
    if peer then
      peer.hzl = true
    end
    self:TraceHelloKept(channel, sender, raw, map, isNew)
    -- 分房之后靠房间频道认人，不再给每个新人密语（一间人多会把密语打满）
    if isNew and channel and channel ~= "WHISPER" and not (self.RoomsEnabled and self:RoomsEnabled()) then
      self:SendAddon(self:HelloPayload(), "WHISPER", replyAs or self:WhisperTarget(sender))
    end
  elseif cmd == "MEET" then
    -- 别人甩来一批同伴名：对还不认识的发 PING（限流）
    local blob = parts[2] or ""
    local n = 0
    for name in string.gmatch(blob, "[^;]+") do
      if n >= 3 then
        break
      end
      local pingAs = self:ReplyName(name)
      local key = self:NormalizeName(pingAs or name)
      if key and not self:IsSelfName(key) and not self:IsSelfName(pingAs)
        and not (self.db.peers[key] and self:IsWallStamp(self.db.peers[key].last)
          and (self:WallNow() - (self.db.peers[key].last or 0) <= self.PEER_TTL)) then
        local lastPing = self.db._meetPing and self.db._meetPing[key] or 0
        if (not self:IsWallStamp(lastPing)) or (self:WallNow() - lastPing >= 120) then
          self.db._meetPing = self.db._meetPing or {}
          self.db._meetPing[key] = self:WallNow()
          self:SendAddon("PING|", "WHISPER", pingAs or key)
          n = n + 1
        end
      end
    end
  elseif cmd == "REQ" then
    local target = tonumber(parts[2] or 0) or 0
    self:OnHelpRequest(sender, target, replyAs)
  elseif cmd == "SKIP" then
    -- MISS=对方看到帮助却没点；BUSY=忙/冷却（只跳过，不计 miss）
    local reason = parts[2] or "MISS"
    if reason == "MISS" or reason == "" then
      local st = self:GetAskStat(sender)
      if st then
        st.miss = (st.miss or 0) + 1
        if st.miss >= self.MISS_LIMIT then
          st.skipUntil = self:WallNow() + self.SKIP_MINUTES * 60
          st.miss = 0
        end
      end
    elseif reason == "BUSY" then
      self:MarkPeerBusy(sender)
    end
    if self.HopLog and self.poll then
      self:HopLog("skip", {
        to = self.poll.targetRaw,
        who = replyAs or sender,
        why = "对方回复SKIP|" .. tostring(reason),
      })
    end
    if self.poll and self.poll.waiting == sender and not IsInGroup() then
      self.poll.waiting = nil
      self:PollNext()
    end
  elseif cmd == "OK" then
    local st = self:GetAskStat(sender)
    if st then
      st.miss = 0
    end
    if self.poll and (self.poll.waiting == sender or self.poll.expectedHost == sender) then
      self.poll.waiting = "ok"
      self.poll.expectedHost = sender
      if self.HopLog then
        self:HopLog("invite_ok", {
          to = self.poll.targetRaw,
          who = replyAs or sender,
          why = "对方已发组队邀请，等待进队",
        })
      end
      local token = self.poll.token
      C_Timer.After(self.ACCEPT_WAIT, function()
        if not H.poll or H.poll.token ~= token then
          return
        end
        if IsInGroup() then
          return
        end
        if H.poll.waiting == "ok" then
          if H.HopLog then
            H:HopLog("accept_timeout", {
              to = H.poll.targetRaw,
              who = H.poll.expectedHost,
              why = "有邀请但未进队，下一位",
            })
          end
          H:PollNext()
        end
      end)
    end
  elseif cmd == "PING" then
    self:SendAddon(self:HelloPayload(), "WHISPER", replyAs or self:WhisperTarget(sender))
  elseif cmd ~= "HELLO" and cmd ~= "MEET" and cmd ~= "REQ" and cmd ~= "SKIP" and cmd ~= "OK" then
    return
  end
  -- 喊话/心跳后会一口气来很多 HELLO：合并刷表，禁止每人重画一整页（会卡）
  if self.ScheduleRefreshUI then
    self:ScheduleRefreshUI(0.4)
  else
    self:RefreshUI()
  end
end

-- 向记得在该位面的人发 PING，让对方立刻回 HELLO（位面/战斗/在队等）
function H:PingLayerCandidates(targetRaw)
  local n = 0
  local maxN = 12
  for _, name in ipairs(self:ListLayerCandidates(targetRaw)) do
    if n >= maxN then
      break
    end
    local peer = self.db.peers and self.db.peers[name]
    -- 时空之门同伴也可能装着互助：PING 一下，回了 HELLO 就按互助求切
    local to = peer and self:WhisperTarget(name)
    if to then
      self:SendAddon("PING|", "WHISPER", to)
      n = n + 1
    end
  end
  return n
end

function H:StartPoll(targetRaw, opts)
  opts = opts or {}
  local function block(why)
    if H.HopLog then
      H:BeginHopLogSession(tonumber(targetRaw))
      H:HopLog("block", { to = tonumber(targetRaw), why = why, ok = false })
    end
    H:Print(why)
    H._hopAllowMap = nil
    H._hopLookMap = nil
  end
  if self:IsPaused() then
    block("已暂停使用，请先点左上角启用插件")
    return
  end
  if self:IsInInstance() then
    block("副本中无法切位面")
    return
  end
  if self.IsHoppableHere and not self:IsHoppableHere() then
    if self.IsOnTransit and self:IsOnTransit() then
      block("飞行途中无法切位面")
    else
      block("当前地图无法切位面")
    end
    return
  end
  if IsInGroup() then
    block("请先离队再求切位面")
    return
  end
  local queueWhy = self.QueueBusySay and self:QueueBusySay(false)
  if queueWhy then
    block(queueWhy)
    return
  end
  if self.helpPrompt and (self.helpPrompt.expireAt or 0) > self:Now() then
    block("正在帮助他人切位面，请稍候")
    return
  end
  if self.poll then
    block("正在求切位面中，请稍候")
    return
  end
  if self._hostProbe then
    block("正在确认该位面玩家是否可帮，请稍候")
    return
  end
  if not targetRaw then
    block("请先选择目标位面")
    return
  end
  targetRaw = tonumber(targetRaw)
  if not self.currentRawLayer then
    self:ScanNearby()
  end
  if self:SameNwbLayer(targetRaw, self.currentRawLayer) then
    local allow = tonumber(self._hopAllowMap)
    local cross = allow and allow > 0 and self.SameHoppableMap
      and not self:SameHoppableMap(self:MyMapId(), allow)
    if not cross then
      block("你已在该位面")
      return
    end
  end
  local coolLeft = self.MyLayerCooldownLeft and self:MyLayerCooldownLeft(targetRaw)
  if coolLeft and coolLeft > 0 then
    block("这个位面还要等 " .. self:FormatHopCooldown(coolLeft))
    return
  end

  local cands = self:ListLayerCandidates(targetRaw)
  local pigOn = self.PigBridgeEnabled and self:PigBridgeEnabled()
  -- 名单空时仍可先扫时空之门；仅互助名单也空才直接放弃
  if #cands == 0 and not pigOn then
    local why = self:ExplainNoHosts(targetRaw, false)
    if self.HopLog then
      self:BeginHopLogSession(targetRaw)
      self:HopLog("no_host", { to = targetRaw, why = why, n = 0, ok = false, pig = false })
    end
    self:Print(why)
    self._hopAllowMap = nil
    self._hopLookMap = nil
    return
  end

  if not (opts and opts.skipLoudPig) then
    self:Print("正在找这个位面的人")
    if self.ArmHopCooldown then
      self:ArmHopCooldown(targetRaw)
    end
  end

  if self.BeginHopLogSession then
    self:BeginHopLogSession(targetRaw)
    self:HopLog("start", {
      to = targetRaw,
      from = self.currentRawLayer,
      n = #cands,
      pig = pigOn and true or false,
      why = "开始探测可帮玩家",
    })
  end

  -- 先问在不在线、满不满足条件，再决定求谁（不靠死记几分钟心跳）
  self._hostProbeToken = (self._hostProbeToken or 0) + 1
  local token = self._hostProbeToken
  self._hostProbe = { raw = targetRaw, token = token }
  local nPig = 0
  -- 可见频道字只能在你点按钮这一下发。后台再喊会弹「界面行为失效」。
  if pigOn then
    if opts.skipLoudPig then
      if self.PigForceRefreshProbe and self:PigForceRefreshProbe() then
        nPig = 1
      end
    elseif self.PigLoudChatProbe and self:PigLoudChatProbe({ gapSec = 8 }) then
      nPig = 1
    elseif self.PigBroadcastProbe and self:PigBroadcastProbe() then
      nPig = 1
    end
  end
  local nPing = self:PingLayerCandidates(targetRaw)
  if self.HopLog then
    self:HopLog("probe", {
      to = targetRaw,
      n = nPing,
      pig = nPig > 0,
      why = string.format("PING%d人%s", nPing, nPig > 0 and "+PIG频道" or ""),
    })
  end
  local wait = self.PING_PROBE_WAIT or 2
  if nPig > 0 and wait < 3 then
    wait = 3
  end
  C_Timer.After(wait, function()
    if not H._hostProbe or H._hostProbe.token ~= token then
      return
    end
    H._hostProbe = nil
    if H:IsPaused() or IsInGroup() or H:IsInInstance() or H:IsInContentQueue() then
      if H.HopLog then
        H:HopLog("abort", { to = targetRaw, why = "探测后状态变化（暂停/在队/副本/排队）", ok = false })
      end
      return
    end
    local names = H:GetFairHosts(targetRaw, { live = true })
    if #names == 0 then
      local why = H:ExplainNoHosts(targetRaw, true)
      if H.HopLog then
        H:HopLog("no_host", { to = targetRaw, why = why, n = 0, ok = false, pig = nPig > 0 })
      end
      H:Print(why)
      H:RefreshUI()
      return
    end
    H.poll = {
      targetRaw = targetRaw,
      names = names,
      index = 1,
      waiting = nil,
      expectedHost = nil,
      token = (H.poll and H.poll.token or 0) + 1,
      hopLogId = H._hopSessionId,
    }
    if H.HopLog then
      H:HopLog("roster", { to = targetRaw, n = #names, why = "可帮名单就绪" })
    end
    H.anchoredHop = false
    H._hopInviter = nil
    H._finishGroupedLock = false
    H:PollNext()
  end)
end

function H:PollNext()
  local poll = self.poll
  if not poll then
    return
  end
  if IsInGroup() then
    self:FinishPollAsGrouped()
    return
  end

  while true do
    local name = poll.names[poll.index]
    poll.index = poll.index + 1
    if not name then
      if self.HopLog then
        self:HopLog("exhaust", {
          to = poll.targetRaw,
          n = #(poll.names or {}),
          why = "已轮询完该位面玩家，暂无人回应",
          ok = false,
        })
      end
      self:Print("已轮询完该位面玩家，暂无人回应")
      self.poll = nil
      self._hopAllowMap = nil
      self._hopLookMap = nil
      self:RefreshUI()
      return
    end

    -- 名单是快照：发出前再核——仍在目标位面这张图的小位面号上，且可邀请
    local peer = self.db.peers[name]
    local onTarget = false
    if peer then
      if self.PeerMatchesHopTarget then
        onTarget = self:PeerMatchesHopTarget(peer, poll.targetRaw)
      else
        onTarget = self:SameNwbLayer(peer.raw, poll.targetRaw)
      end
    end
    if peer and onTarget and self:PeerCanHost(name, peer) then
      local to = self:WhisperTarget(name) or name
      local via = "hzl"
      local sent = false
      local smallRaw = tonumber(peer.raw)
      -- 互助优先：同时装着时空之门也走互助（对方会先认层再组）
      -- 只向时空之门求「这个人报的那个小位面」，不发不带号的「组我」
      if peer.pig and not self:PeerIsHzl(peer) and self.PigSendLayerRequest then
        if smallRaw and smallRaw > 0 and self:PigSendLayerRequest(name, smallRaw) then
          via = "pig"
          sent = true
        end
      else
        local mapped = self.NwbLayerNum and self:NwbLayerNum(poll.targetRaw)
        self:SendAddon(
          "REQ|" .. tostring(poll.targetRaw) .. "|" .. tostring(mapped or poll.targetRaw),
          "WHISPER",
          to
        )
        sent = true
      end
      if not sent then
        -- 没有可点名的小位面号，换下一位，绝不发空口令
      else
        local st = self:GetAskStat(name)
        st.lastAsk = self:WallNow()
        poll.waiting = name
        poll.expectedHost = name
        if self.HopLog then
          self:HopLog("ask", {
            to = poll.targetRaw,
            small = smallRaw,
            who = to,
            via = via,
            idx = (poll.index or 1) - 1,
            why = via == "pig" and ("向时空之门求小位面 " .. tostring(smallRaw)) or "向互助同伴求切",
          })
        end

        local token = poll.token
        local waitName = name
        C_Timer.After(self.POLL_WAIT, function()
          if not H.poll or H.poll.token ~= token then
            return
          end
          if IsInGroup() then
            H:FinishPollAsGrouped()
            return
          end
          -- 仅「无回应」时下一位；OK 后由 ACCEPT_WAIT 接管
          if H.poll.waiting == waitName then
            if H.HopLog then
              H:HopLog("timeout", {
                to = H.poll.targetRaw,
                who = waitName,
                via = via,
                why = "对方无回应，下一位",
              })
            end
            H:PollNext()
          end
        end)
        self:RefreshUI()
        return
      end
    end
  end
end

-- 关掉组队邀请框（接队成功后 Forever 常留着弹窗；进队后也必须关）
function H:DismissPartyInvitePopup()
  pcall(function()
    if StaticPopup_Hide then
      StaticPopup_Hide("PARTY_INVITE")
      StaticPopup_Hide("PARTY_INVITE_XREALM")
    end
  end)
  -- 再扫一遍可见弹窗，避免 which 名不一致时关不掉
  pcall(function()
    local n = STATICPOPUP_NUMDIALOGS or 4
    for i = 1, n do
      local f = _G["StaticPopup" .. i]
      if f and f.IsShown and f:IsShown() then
        local which = f.which
        if which == "PARTY_INVITE" or which == "PARTY_INVITE_XREALM" then
          f:Hide()
        end
      end
    end
  end)
end

-- 求切进行中：自动接受对方邀请（自动进队保留）。
-- 接队后务必关弹窗——只 AcceptGroup 不关框时，会出现「人已在队里、邀请窗还在」。
function H:ForceAcceptInvite()
  local token = self.poll and self.poll.token
  local function tryAccept()
    if not H.poll or (token and H.poll.token ~= token) then
      return
    end
    if H:IsPaused() then
      return
    end
    -- 已经进队：只关残留邀请框，不再 AcceptGroup
    if IsInGroup() then
      H:DismissPartyInvitePopup()
      return
    end
    if AcceptGroup then
      pcall(AcceptGroup)
    end
    H:DismissPartyInvitePopup()
  end
  tryAccept()
  if H.NeedsClickForProtected and H:NeedsClickForProtected() then
    -- 定时器里再接队，泰坦会弹「界面行为失效」
    return
  end
  for i = 1, 6 do
    C_Timer.After(i * 0.15, tryAccept)
  end
end

function H:OnPartyInviteRequest(inviter)
  -- 只有自己点了求切时才自动进队
  if not self.poll or self:IsPaused() then
    return
  end
  local expected = self.poll.expectedHost
  if not expected or not inviter then
    return
  end
  local expReply = self:WhisperTarget(expected) or expected
  local same = self:IsSamePlayer(inviter, expected)
    or self:IsSamePlayer(inviter, expReply)
  if not same then
    return
  end
  -- 记下邀请人展示名（Forever「名 姓」），进队后名单可能短暂对不上 peers 键
  self._hopInviter = inviter
  self.poll.waiting = "ok"
  self:ForceAcceptInvite()
end

-- 系统提示：频道限流退避 + 邀请成败判断
function H:OnSystemMessage(text)
  if not text then
    return
  end
  -- 即便过滤器未挂上，也记冷却，减少后续密语网空打
  local miss = self:ParsePlayerNotFoundName(text)
  if miss then
    self:MarkMeshWhisperFail(miss)
  end
  self:OnChannelThrottle(text)
  -- 求切中：从系统邀请句备份邀请人（防 PARTY_INVITE 事件名格式不一致）
  if self.poll then
    local t = tostring(text)
    local inv = t:match("^%[(.-)%]邀请你加入队伍")
      or t:match("^(.-)邀请你加入队伍")
      or t:match("^%[(.-)%] has invited you")
      or t:match("^(.-) has invited you")
    if inv and inv ~= "" then
      local expected = self.poll.expectedHost
      local expReply = expected and (self:WhisperTarget(expected) or expected)
      if expected
        and (self:IsSamePlayer(inv, expected) or (expReply and self:IsSamePlayer(inv, expReply)))
      then
        self._hopInviter = inv
        self.poll.waiting = "ok"
        -- 有的客户端邀请事件不稳：系统句也对上时同样走自动进队
        self:ForceAcceptInvite()
      end
    end
  end
  if not self._inviteExpect then
    return
  end
  local exp = self._inviteExpect
  if self:Now() - (exp.at or 0) > 4 then
    self._inviteExpect = nil
    return
  end
  local target = exp.name
  local short = self:ShortName(target)
  local t = tostring(text)
  local lower = string.lower(t)
  local aboutTarget = (short and t:find(short, 1, true)) or t:find("邀请", 1, true) or lower:find("invite", 1, true)
  if not aboutTarget then
    return
  end
  local fail = t:find("无法", 1, true)
    or t:find("不能", 1, true)
    or t:find("失败", 1, true)
    or t:find("忽略", 1, true)
    or lower:find("failed", 1, true)
    or lower:find("unable", 1, true)
    or lower:find("ignoring", 1, true)
  local ok = t:find("你邀请了", 1, true)
    or t:find("已邀请", 1, true)
    or lower:find("has been invited", 1, true)
    or lower:find("you have invited", 1, true)
  local function promptMatches(prompt, who)
    if not prompt or not who then
      return false
    end
    return prompt.requester == who
      or prompt.replyAs == who
      or (prompt.replyAs and self:ShortName(prompt.replyAs) == self:ShortName(who))
      or (prompt.requester and self:ShortName(prompt.requester) == self:ShortName(who))
  end
  if fail then
    self._inviteExpect = nil
    local pig = self.helpPrompt and self.helpPrompt.pig
    if promptMatches(self.helpPrompt, target) then
      self.helpPrompt = nil
      if self.UpdateHelpButton then
        self:UpdateHelpButton()
      end
    end
    -- PIG 听不懂 HZL 的 SKIP
    if not pig then
      self:SendAddon("SKIP|BUSY", "WHISPER", self:WhisperTarget(target) or target)
    end
    self:MarkPeerBusy(target, 20)
    return
  end
  if ok then
    self._inviteExpect = nil
    if promptMatches(self.helpPrompt, target) then
      self.helpPrompt.clicked = true
      self:GetMyMiss().miss = 0
    end
    -- PIG 协议无 OK；对方若只装时空之门会忽略此包
    if not (self.helpPrompt and self.helpPrompt.pig) then
      self:SendAddon("OK|", "WHISPER", self:WhisperTarget(target) or target)
    end
  end
end

function H:ConfirmHopAndThanks(helperName, targetRaw)
  targetRaw = tonumber(targetRaw)
  -- 核对窗口：放宽粘票，优先认目标位面（人已换面但旧姓名板残留时旧逻辑会误判失败）
  self._hopConfirmTarget = targetRaw
  self._hopConfirmHelper = helperName
  self._hopConfirmUntil = GetTime() + 12
  self._hopConfirmDone = false
  -- 进队后先问号 3 秒。FinishPoll 可能已经开始倒数，不要再往后加。
  if not (self.HopRecognizeHeld and self:HopRecognizeHeld()) then
    self._hopRecognizeUntil = self:Now() + 3
  end
  if self.UpdateLayerIcon then
    self:UpdateLayerIcon()
  end
  if self.EnsureScanTicker then
    self:EnsureScanTicker()
  end
  local remain = (tonumber(self._hopRecognizeUntil) or (self:Now() + 3)) - self:Now()
  if remain < 0 then
    remain = 0
  end

  local function succeed(matchedRaw)
    if H._hopConfirmDone then
      return true
    end
    local prev = tonumber(H.currentRawLayer)
    if prev and targetRaw and not H:SameNwbLayer(prev, targetRaw) then
      H:MarkHopLeave(prev)
    end
    -- 切成功后身边旧怪 GUID 还停在原层：先粘住刚到的层，避免图标右下角被拉回「四」
    H._hopStickyRaw = tonumber(matchedRaw) or tonumber(targetRaw) or prev
    H._hopStickyFrom = prev
    H._hopStickyUntil = GetTime() + 30
    H._hopRecognizeUntil = 0
    H._needFreshVotes = false
    H._hopConfirmDone = true
    H._hopConfirmTarget = nil
    H._hopConfirmUntil = 0
    if matchedRaw and tonumber(H.currentRawLayer) ~= tonumber(matchedRaw) then
      H:SetCurrentLayer(matchedRaw)
    elseif H.UpdateLayerIcon then
      H:UpdateLayerIcon()
    end
    if H.HopLog then
      H:HopLog("result", {
        to = targetRaw,
        from = H._hopLogFrom,
        who = helperName,
        ok = true,
        why = "已切到目标位面",
      })
    end
    -- 切成功：不刷系统提示（队聊/综合致谢另走）
    H:AnnounceHopThanks(helperName, targetRaw)
    H:RefreshUI()
    return true
  end

  local function check(pass, last)
    if H._hopConfirmDone then
      return true
    end
    if H.HopRecognizeHeld and H:HopRecognizeHeld() then
      if H.UpdateLayerIcon then
        H:UpdateLayerIcon()
      end
      return false
    end
    local votes = H:ScanNearby() or {}
    if targetRaw and H:SameNwbLayer(H.currentRawLayer, targetRaw) then
      return succeed(H.currentRawLayer)
    end
    -- 直接看本轮票：有任一怪 GUID 已是目标位面 → 成功（不依赖粘票是否已改写 current）
    local other, otherN, hitRaw = nil, 0, nil
    for raw, n in pairs(votes) do
      raw = tonumber(raw)
      n = tonumber(n) or 0
      if raw and n > 0 then
        if targetRaw and H:SameNwbLayer(raw, targetRaw) then
          if not hitRaw then
            hitRaw = raw
          end
        elseif n > otherN then
          other, otherN = raw, n
        end
      end
    end
    if hitRaw then
      return succeed(hitRaw)
    end
    -- 进队后认出的是另一层，且不是出发时身边残留的旧层：对方上报过期，别停在错层上
    local fromRaw = tonumber(H._hopLogFrom)
    local foreign = other and otherN >= 2 and fromRaw and not H:SameNwbLayer(other, fromRaw)
    if foreign and (last or pass >= 2) then
      if H._hopConfirmDone then
        return true
      end
      H._hopConfirmDone = true
      H._hopConfirmTarget = nil
      H._hopConfirmUntil = 0
      H._partyHop = nil
      H.anchoredHop = false
      H._leaveThanksPending = false
      if H.HopLog then
        H:HopLog("result", {
          to = targetRaw,
          from = other,
          who = helperName,
          ok = false,
          why = "进队后位面不是所求，对方上报已过期，离队",
        })
      end
      H:Print("对方已经不在你要的这一层了，已离队。请再求一次。")
      if H.LeavePartyAfterThanks then
        H:LeavePartyAfterThanks()
      end
      H:RefreshUI()
      return true
    end
    if last then
      H._hopConfirmTarget = nil
      H._hopConfirmUntil = 0
      if H.HopLog then
        H:HopLog("result", {
          to = targetRaw,
          from = H.currentRawLayer,
          who = helperName,
          ok = false,
          why = "已进队但位面未对上目标",
        })
      end
      H:Print("已进队，但插件尚未认出新位面号（身边人已换也常见），可再点附近怪物认一次")
      H:RefreshUI()
    end
    return false
  end

  -- 问号倒数结束再认。有目标层的怪才算切成；没有就按身边实际层认，不许硬写成所求层。
  C_Timer.After(remain, function()
    if H._hopConfirmDone then
      return
    end
    H._hopRecognizeUntil = 0
    if check(1, false) then
      return
    end
    H._hopConfirmDone = true
    H._hopConfirmTarget = nil
    H._hopConfirmUntil = 0
    if H.UpdateLayerIcon then
      H:UpdateLayerIcon()
    end
    if H.HopLog then
      H:HopLog("result", {
        to = targetRaw,
        from = H.currentRawLayer,
        who = helperName,
        ok = false,
        why = "满3秒身边仍不是所求层，按实际认",
      })
    end
    if H.RefreshUI then
      H:RefreshUI()
    end
  end)
end

function H:FinishPollAsGrouped()
  local poll = self.poll
  if not poll then
    return
  end
  -- 防 GROUP_ROSTER + 定时器重复收尾
  if self._finishGroupedLock then
    return
  end
  self._finishGroupedLock = true

  -- 人已进队：立刻关掉还挂着的「邀请你加入队伍」
  self:DismissPartyInvitePopup()
  C_Timer.After(0.2, function()
    pcall(function()
      H:DismissPartyInvitePopup()
    end)
  end)

  local targetRaw = poll.targetRaw
  local expected = poll.expectedHost
  local inviter = self._hopInviter
  self.poll = nil
  self._hopAllowMap = nil
  self._hopLookMap = nil
  self.anchoredHop = true
  -- 进队当帧先问号，避免 RefreshUI 还画出旧的「二」
  self._hopRecognizeUntil = self:Now() + 3
  self._needFreshVotes = true
  if self.UpdateLayerIcon then
    self:UpdateLayerIcon()
  end
  self:RefreshUI()

  local function finalize(matched)
    self._finishGroupedLock = false
    if self.HopLog then
      self:HopLog("grouped", {
        to = targetRaw,
        who = expected or inviter,
        ok = matched and true or false,
        why = matched and "已进队且对象对上" or "已进队但对象未对上",
      })
    end
    if expected and not matched then
      self:Print("进队了，但队伍里不是刚才求切位面的对象，请自己确认位面")
    end
    -- 问候优先用邀请人展示名（凯恩 玉蹄），peers 键可能带 -服务器
    local helper = expected
    if matched and inviter then
      helper = inviter
    elseif matched and expected then
      helper = self:WhisperTarget(expected) or expected
    end
    -- 队伍问候/离队感谢：不绑位面是否切成功
    if helper and matched then
      self:BeginPartyHopSession(helper, true)
      C_Timer.After(0.6, function()
        pcall(function()
          H:AnnouncePartyGreet()
        end)
      end)
    end
    self:ConfirmHopAndThanks(helper or expected, targetRaw)
  end

  local function attempt(n)
    if not IsInGroup() then
      finalize(false)
      return
    end
    if self:MatchExpectedHost(expected) then
      finalize(true)
      return
    end
    -- 进队瞬间 party 单位名常未就绪，再试几次
    if n >= 5 then
      finalize(false)
      return
    end
    C_Timer.After(0.25, function()
      attempt(n + 1)
    end)
  end
  attempt(1)
end

function H:OnGroupChanged()
  if self.poll and IsInGroup() then
    self:FinishPollAsGrouped()
  end
  if self.anchoredHop and not IsInGroup() then
    self.anchoredHop = false
    self._leaveThanksPending = false
    self._hopInviter = nil
    self._finishGroupedLock = false
    -- 若玩家用未挂钩的方式离队，到这里已发不出队聊；清会话即可
    self:ClearPartyHopSession()
    C_Timer.After(1.2, function()
      pcall(function()
        if H.EnsureLayerProbe then
          H:EnsureLayerProbe()
        end
        if H.ScheduleRefreshUI then
          H:ScheduleRefreshUI(0.1)
        end
      end)
    end)
  end
  -- 进队/离队：只软广播，不刷公共频道
  self:BroadcastHello("soft")
end

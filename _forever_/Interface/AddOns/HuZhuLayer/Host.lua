local H = HuZhuLayer

-- 收到求切：自动邀请。不弹「帮助」按钮。
-- 不以 pcall 成功当作邀出——看系统消息 / 对方是否收到邀请

function H:OnHelpRequest(sender, targetRaw, replyAs, opts)
  opts = opts or {}
  replyAs = self:ReplyName(replyAs or sender)
  sender = self:NormalizeName(replyAs or sender)
  if not sender then
    return
  end
  if replyAs then
    local peer = self.db.peers[sender]
    if peer then
      peer.replyAs = replyAs
    else
      self:UpsertPeer(sender, self.currentRawLayer, true, self:MyMapId(), nil, nil, nil, nil, nil, replyAs)
    end
  end
  local whisperTo = replyAs or self:WhisperTarget(sender) or sender

  local function busy(why)
    if self.HopLog then
      self:HopLog("host_busy", {
        who = whisperTo,
        to = tonumber(targetRaw) or self.currentRawLayer,
        via = opts.pig and "pig" or "hzl",
        why = why or "BUSY",
        ok = false,
      })
    end
    -- PIG 时空之门听不懂 HZL 的 SKIP，别发
    if opts.pig then
      return
    end
    self:SendAddon("SKIP|BUSY", "WHISPER", whisperTo)
  end

  if self:IsPaused() then
    busy("已暂停")
    return
  end

  -- 自己正在求切：不当帮助方
  if self.poll then
    busy("自己正在求切")
    return
  end

  -- 先重认自己现在的层，再决定接不接。上次 HELLO / !L 报出去的号可能已经过期。
  targetRaw = tonumber(targetRaw)
  local myRaw = self:ReadOwnLayerForAccept()
  if not myRaw then
    busy("还没认出自己现在的位面")
    return
  end
  if not targetRaw or targetRaw <= 0 or not self:SameNwbLayer(targetRaw, myRaw) then
    busy("自己位面已变，对不上对方要的线")
    return
  end
  if IsInGroup() then
    busy("已在队伍")
    return
  end
  local queueWhy = self.QueueBusySay and self:QueueBusySay(true)
  if queueWhy then
    busy(queueWhy)
    return
  end
  if self:IsInInstance() then
    busy("副本中或无法邀请")
    return
  end
  if self.IsHoppableHere and not self:IsHoppableHere() then
    if self.IsOnTransit and self:IsOnTransit() then
      busy("飞行途中")
    else
      busy("当前地图无法切位面")
    end
    return
  end
  if not self:CanInvite() then
    busy("副本中或无法邀请")
    return
  end

  -- 对方须在同一地图（否则邀了也切不过去）。同图才接，不按平均分摊到别的图。
  if self.RequiresSameMapForHop and self:RequiresSameMapForHop() then
    local peer = self.db.peers and self.db.peers[sender]
    if self:MapRelation(self:MyMapId(), peer and peer.map) ~= 0 then
      busy("不在同一地图")
      return
    end
  end

  if self.helpPrompt and (self.helpPrompt.expireAt or 0) > self:Now() then
    busy("已有帮助请求处理中")
    return
  end

  -- 战斗中 / 刚进图几秒发不出邀请：立刻忙，让对方换下一位，不等按钮
  if InCombatLockdown and InCombatLockdown() then
    busy("战斗中")
    return
  end
  local grace = 4
  if self._enterWorldAt and (self:Now() - (self._enterWorldAt or 0)) < grace then
    busy("刚进游戏")
    return
  end

  self.helpPrompt = {
    requester = sender,
    replyAs = whisperTo,
    raw = myRaw,
    label = self:LabelForRaw(myRaw),
    num = self:LabelNum(myRaw),
    expireAt = self:Now() + self.HELP_SHOW,
    clicked = false,
    pig = opts.pig and true or false,
  }

  -- 自动邀请。发出去没有，看系统消息，不看 pcall。
  self._inviteExpect = { name = whisperTo, at = self:Now() }
  local invited = self:DoInvite(whisperTo)
  if self.HopLog then
    self:HopLog("host_help", {
      who = whisperTo,
      to = myRaw,
      via = opts.pig and "pig" or "hzl",
      why = invited and "收到求切并自动邀请" or "收到求切但邀请未发出",
    })
  end

  if self.UpdateHelpButton then
    self:UpdateHelpButton()
  end
  self:RefreshUI()

  if not invited then
    self.helpPrompt = nil
    self._inviteExpect = nil
    busy("邀请未发出")
    if self.UpdateHelpButton then
      self:UpdateHelpButton()
    end
    self:RefreshUI()
    return
  end

  local prompt = self.helpPrompt
  C_Timer.After(self.HELP_SHOW + 0.05, function()
    if not H.helpPrompt or H.helpPrompt ~= prompt then
      return
    end
    if not prompt.clicked then
      -- 没邀出去：BUSY 让对方继续轮询。自动帮忙不因没点按钮罚自己冷却。
      if not prompt.pig then
        H:SendAddon("SKIP|BUSY", "WHISPER", prompt.replyAs or H:WhisperTarget(prompt.requester) or prompt.requester)
      end
    end
    -- _inviteExpect.name 存的是原名 replyAs，不是内部键
    if H._inviteExpect and (
      H._inviteExpect.name == prompt.replyAs
      or H._inviteExpect.name == prompt.requester
      or H:IsSamePlayer(H._inviteExpect.name, prompt.requester)
    ) then
      H._inviteExpect = nil
    end
    H.helpPrompt = nil
    if H.UpdateHelpButton then
      H:UpdateHelpButton()
    end
    H:RefreshUI()
  end)
end

function H:DoInvite(name)
  -- 邀请必须用游戏能认的原名，不用我们拼过的键
  name = self:WhisperTarget(name) or self:ReplyName(name)
  if not name or not self:CanInvite() then
    return false
  end
  -- 战斗中 / 刚进图几秒发不出，少弹「只对暴雪 UI」
  if InCombatLockdown and InCombatLockdown() then
    return false
  end
  local grace = 4
  if self._enterWorldAt and (self:Now() - (self._enterWorldAt or 0)) < grace then
    return false
  end
  local ok = pcall(function()
    if C_PartyInfo and C_PartyInfo.InviteUnit then
      C_PartyInfo.InviteUnit(name)
    elseif InviteUnit then
      InviteUnit(name)
    end
  end)
  return ok
end

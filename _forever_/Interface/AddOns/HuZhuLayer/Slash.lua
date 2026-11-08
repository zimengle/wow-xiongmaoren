local H = HuZhuLayer

SLASH_HUZHULAYER1 = "/hzl"
SLASH_HUZHULAYER2 = "/huzhu"
SlashCmdList["HUZHULAYER"] = function(msg)
  msg = (msg or ""):gsub("^%s+", ""):gsub("%s+$", "")
  local cmd, rest = msg:match("^(%S+)%s*(.*)$")
  cmd = cmd and string.lower(cmd) or ""

  if cmd == "" or cmd == "ui" then
    H:TogglePanel()
    return
  end

  if cmd == "req" or cmd == "hop" then
    local n = tonumber(rest)
    if n then
      -- 参数为服务器位面号（与 ICON / 列表一致）
      H:StartPoll(n)
    else
      H:Print("用法：/hzl req 服务器位面号")
    end
    return
  end

  if cmd == "scan" then
    if H.EnsureLayerProbe then
      H:EnsureLayerProbe()
    end
    H:BroadcastHello("force")
    if H.ScheduleRefreshUI then
      H:ScheduleRefreshUI(0.1)
    end
    return
  end

  -- 离队：先队聊感谢再退（求切挂队时）
  if cmd == "leave" or cmd == "lq" or cmd == "离队" then
    if not IsInGroup() then
      H:Print("你不在队伍中")
      return
    end
    H:LeavePartyAfterThanks()
    return
  end

  -- 开关队伍问候/感谢
  if cmd == "partychat" or cmd == "pc" or cmd == "队聊" then
    H.db.partyChat = not (H.db.partyChat ~= false)
    H:Print(H.db.partyChat and "队伍问候/感谢：开" or "队伍问候/感谢：关")
    return
  end

  if cmd == "nwb" or cmd == "nova" then
    if H.NwbDebugPrint then
      H:NwbDebugPrint()
    else
      H:Print("NWB 诊断未加载")
    end
    return
  end

  -- 长期安装花名册：/hzl book
  if cmd == "book" or cmd == "花名册" or cmd == "roster" then
    if H.MigratePeersToInstallBook then
      H:MigratePeersToInstallBook()
    end
    local n = H.InstallBookCount and H:InstallBookCount() or 0
    H:Print(string.format("安装花名册：%d 人（长期保存，清同伴不删）", n))
    local list = {}
    for key, e in pairs((H.db and H.db.installBook) or {}) do
      list[#list + 1] = { key = key, last = tonumber(e.last) or 0, replyAs = e.replyAs or key }
    end
    table.sort(list, function(a, b)
      return a.last > b.last
    end)
    local show = math.min(20, #list)
    for i = 1, show do
      H:Print(string.format("  %s", tostring(list[i].replyAs or list[i].key)))
    end
    if #list > show then
      H:Print(string.format("  …其余 %d 人略", #list - show))
    end
    return
  end

  -- 求切详细日志：/hzl log | /hzl log 40 | /hzl log clear
  if cmd == "log" or cmd == "日志" then
    local sub = (rest or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if sub == "clear" or sub == "清空" then
      if H.HopLogClear then
        H:HopLogClear()
      end
      H:Print("求切日志已清空")
      return
    end
    local n = tonumber(sub)
    if H.HopLogPrintRecent then
      H:HopLogPrintRecent(n)
    else
      H:Print("日志模块未加载")
    end
    return
  end

  if cmd == "btn" or cmd == "mm" then
    H.db.minimap = H.db.minimap or {}
    H.db.minimap.hide = false
    H.db.minimap.x = nil
    H.db.minimap.y = nil
    if H.floatRoot then
      H.floatRoot:Hide()
      H.floatRoot = nil
      H.minimapBtn = nil
      if H.KillHelpButton then
        H:KillHelpButton()
      else
        H.helpBtn = nil
      end
    end
    if _G.HuZhuLayerFloatRoot then
      _G.HuZhuLayerFloatRoot:Hide()
      _G.HuZhuLayerFloatRoot = nil
      _G.HuZhuLayerFloatButton = nil
    end
    if _G.HuZhuLayerHelpButton then
      _G.HuZhuLayerHelpButton:Hide()
      _G.HuZhuLayerHelpButton = nil
    end
    H:EnsureMinimap()
    return
  end

  H:Print("命令：/hzl 面板 | /hzl btn | /hzl scan | /hzl leave | /hzl partychat | /hzl book | /hzl log | /hzl nwb")
end

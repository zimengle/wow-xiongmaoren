local H = HuZhuLayer
-- 已定稿：游戏自带地图 ICON
local ICON = "Interface\\Icons\\INV_Misc_Map_01"

-- 截图式扁平深色：近黑地板、细灰边、白字、白 X
local C = {
  bg = { 0.086, 0.086, 0.086, 0.96 },
  header = { 0.04, 0.04, 0.04, 1 },
  line = { 0.35, 0.35, 0.35, 1 },
  btn = { 0.125, 0.125, 0.125, 1 },
  btnHover = { 0.20, 0.20, 0.20, 1 },
  btnDis = { 0.10, 0.10, 0.10, 1 },
  text = { 0.92, 0.92, 0.92, 1 },
  muted = { 0.55, 0.55, 0.55, 1 },
  gold = { 1.0, 0.82, 0.0, 1 }, -- 同「浏览拍卖」
  green = { 0.40, 0.90, 0.45, 1 },
}

local ROW_W = 378
local ICON_W = 22
local NAME_X = 30
local NAME_W = 158
local STATUS_X = 192
local STATUS_W = 88
local ACTION_W = 88
local ACTION_PAD = 2
local ROW_H = 34
local ROW_GAP = 36

local function Outline(frame)
  local function edge(hOrW, isHoriz, pointA, pointB)
    local t = frame:CreateTexture(nil, "BORDER")
    t:SetColorTexture(C.line[1], C.line[2], C.line[3], C.line[4])
    if isHoriz then
      t:SetHeight(1)
      t:SetPoint(pointA)
      t:SetPoint(pointB)
    else
      t:SetWidth(1)
      t:SetPoint(pointA)
      t:SetPoint(pointB)
    end
  end
  edge(1, true, "TOPLEFT", "TOPRIGHT")
  edge(1, true, "BOTTOMLEFT", "BOTTOMRIGHT")
  edge(1, false, "TOPLEFT", "BOTTOMLEFT")
  edge(1, false, "TOPRIGHT", "BOTTOMRIGHT")
end

local function Fill(frame, color)
  local t = frame:CreateTexture(nil, "BACKGROUND")
  t:SetAllPoints()
  t:SetColorTexture(color[1], color[2], color[3], color[4] or 1)
  return t
end

local function NewCloseX(parent, onClick)
  local b = CreateFrame("Button", nil, parent)
  b:SetSize(28, 28)
  b:SetPoint("TOPRIGHT", -4, -4)
  local fs = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
  fs:SetPoint("CENTER", 0, 1)
  fs:SetText("×")
  fs:SetTextColor(1, 1, 1, 1)
  b:SetScript("OnEnter", function()
    fs:SetTextColor(1, 0.85, 0.4, 1)
  end)
  b:SetScript("OnLeave", function()
    fs:SetTextColor(1, 1, 1, 1)
  end)
  b:SetScript("OnClick", onClick)
  return b
end

-- 关闭 X 左侧的「感谢」等字钮
local function NewHeaderTextBtn(parent, text, onClick)
  local b = CreateFrame("Button", nil, parent)
  b:SetSize(36, 28)
  local fs = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  fs:SetPoint("CENTER", 0, 0)
  fs:SetText(text or "")
  fs:SetTextColor(C.text[1], C.text[2], C.text[3], 1)
  b.text = fs
  b:SetScript("OnEnter", function()
    fs:SetTextColor(C.gold[1], C.gold[2], C.gold[3], 1)
  end)
  b:SetScript("OnLeave", function()
    fs:SetTextColor(C.text[1], C.text[2], C.text[3], 1)
  end)
  b:SetScript("OnClick", onClick)
  return b
end

local function NewButton(parent, text, w, h)
  local b = CreateFrame("Button", nil, parent)
  b:SetSize(w or 90, h or 22)
  b:EnableMouse(true)
  b:RegisterForClicks("LeftButtonUp")
  local bg = Fill(b, C.btn)
  Outline(b)
  local fs = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  fs:SetPoint("CENTER")
  fs:SetText(text or "")
  fs:SetTextColor(C.text[1], C.text[2], C.text[3], 1)
  b.text = fs
  b.bg = bg
  b.SetText = function(self, t)
    self.text:SetText(t or "")
  end
  b:SetScript("OnEnter", function(self)
    if self._disabled then
      return
    end
    self.bg:SetColorTexture(C.btnHover[1], C.btnHover[2], C.btnHover[3], 1)
  end)
  b:SetScript("OnLeave", function(self)
    if self._disabled then
      self.bg:SetColorTexture(C.btnDis[1], C.btnDis[2], C.btnDis[3], 1)
    else
      self.bg:SetColorTexture(C.btn[1], C.btn[2], C.btn[3], 1)
    end
  end)
  b.Disable = function(self)
    self._disabled = true
    self:EnableMouse(false)
    self.bg:SetColorTexture(C.btnDis[1], C.btnDis[2], C.btnDis[3], 1)
    self.text:SetTextColor(C.muted[1], C.muted[2], C.muted[3], 1)
  end
  b.Enable = function(self)
    self._disabled = false
    self:EnableMouse(true)
    self.bg:SetColorTexture(C.btn[1], C.btn[2], C.btn[3], 1)
    self.text:SetTextColor(C.text[1], C.text[2], C.text[3], 1)
  end
  return b
end

local function SkinPanel(frame)
  Fill(frame, C.bg)
  Outline(frame)
end

-- 窄滑动条与列表滚动同步；内容装得下时隐藏
function H:SyncPanelScrollBar()
  local f = self.panel
  if not f or not f.scroll or not f.scrollBar then
    return
  end
  local scroll = f.scroll
  local bar = f.scrollBar
  scroll:UpdateScrollChildRect()
  local maxs = scroll:GetVerticalScrollRange() or 0
  if maxs < 1 then
    bar:Hide()
    scroll:SetVerticalScroll(0)
    return
  end
  bar:Show()
  bar._silent = true
  bar:SetMinMaxValues(0, maxs)
  local cur = scroll:GetVerticalScroll() or 0
  if cur > maxs then
    cur = maxs
    scroll:SetVerticalScroll(cur)
  end
  bar:SetValue(cur)
  bar._silent = false
end

-- 高度按可见行数（最多 LIST_VISIBLE_ROWS）；内容区可滚动
function H:FitPanelHeight(nRows)
  local f = self.panel
  if not f or not f.SetHeight then
    return
  end
  nRows = tonumber(nRows) or 0
  if nRows < 1 then
    nRows = 1
  end
  local vis = self.LIST_VISIBLE_ROWS or 10
  if nRows < vis then
    vis = nRows
  end
  if vis < 1 then
    vis = 1
  end
  local rowH = 36
  local h = 36 + 12 + vis * rowH + 14
  f:SetHeight(h)
  if f.scrollChild then
    f.scrollChild:SetHeight(math.max(nRows * rowH, vis * rowH))
  end
  if f.scroll then
    f.scroll:UpdateScrollChildRect()
  end
  self:SyncPanelScrollBar()
end

-- 默认：紧贴左边 ICON 正上方（可拖动）
function H:PlacePanelDefault()
  local f = self.panel
  if not f then
    return
  end
  f:ClearAllPoints()
  local float = self.floatRoot or _G.HuZhuLayerFloatRoot
  if float and float.GetObjectType then
    f:SetPoint("BOTTOMLEFT", float, "TOPLEFT", 0, 8)
    return
  end
  local dock = _G.GeneralDockManager
  if dock and dock.GetObjectType then
    f:SetPoint("BOTTOM", dock, "TOP", 0, 56)
    f:SetPoint("LEFT", UIParent, "LEFT", 4, 0)
    return
  end
  f:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 220)
end

function H:PlacePanel()
  local f = self.panel
  if not f or not f.ClearAllPoints then
    return
  end
  if self.db and not self.db._panelPlace40 then
    self.db.panel = {}
    self.db._panelPlace40 = true
  end
  local p = self.db and self.db.panel
  if p and p.userMoved and type(p.x) == "number" and type(p.y) == "number" then
    f:ClearAllPoints()
    f:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", p.x, p.y)
  else
    self:PlacePanelDefault()
  end
end

function H:InitUI()
  if self.panel and self.panel.GetObjectType then
    -- settingsStyle198：感谢窗删标题后名单上移（顶距不再留 36）
    if not self.panel.cfgStyle168 or not self.panel.placeStyle45 or not self.panel.settingsStyle198 then
      if self.panel.settings then
        self.panel.settings:Hide()
        self.panel.settings:SetParent(nil)
      end
      self.panel:Hide()
      self.panel:SetParent(nil)
      self.panel = nil
      _G.HuZhuLayerFrame = nil
      _G.HuZhuLayerSettings = nil
    else
      return
    end
  end

  local f = CreateFrame("Frame", "HuZhuLayerFrame", UIParent)
  f:SetSize(420, 140)
  f:SetFrameStrata("FULLSCREEN_DIALOG")
  f:SetFrameLevel(100)
  f:SetMovable(true)
  f:EnableMouse(true)
  f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart", function(self)
    self._hzlDragging = true
    self:StartMoving()
  end)
  f:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    if not self._hzlDragging then
      return
    end
    self._hzlDragging = nil
    local ux, uy = self:GetLeft(), self:GetBottom()
    if ux and uy and H.db then
      H.db.panel = H.db.panel or {}
      H.db.panel.x = ux
      H.db.panel.y = uy
      H.db.panel.userMoved = true
      self:ClearAllPoints()
      self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", ux, uy)
    end
  end)
  f:SetClampedToScreen(true)
  SkinPanel(f)
  f.placeStyle45 = true
  f.cfgStyle168 = true
  f.settingsStyle198 = true
  -- ESC 关闭（与游戏其它界面一致）
  pcall(function()
    if UISpecialFrames then
      local name = f:GetName()
      local exists = false
      for i = 1, #UISpecialFrames do
        if UISpecialFrames[i] == name then
          exists = true
          break
        end
      end
      if not exists and name then
        tinsert(UISpecialFrames, name)
      end
    end
  end)
  self.panel = f
  -- 先确保左下 ICON 在，再贴它上方
  pcall(function()
    H:EnsureMinimap()
  end)
  self:PlacePanel()

  local head = CreateFrame("Frame", nil, f)
  head:SetPoint("TOPLEFT", 1, -1)
  head:SetPoint("TOPRIGHT", -1, -1)
  head:SetHeight(36)
  Fill(head, C.header)
  local rule = head:CreateTexture(nil, "BORDER")
  rule:SetHeight(1)
  rule:SetPoint("BOTTOMLEFT")
  rule:SetPoint("BOTTOMRIGHT")
  rule:SetColorTexture(C.line[1], C.line[2], C.line[3], 1)

  -- 左上角启用/暂停按钮（绿字=已启用，灰字=已暂停）
  local enableBtn = NewButton(f, "已启用", 72, 24)
  enableBtn:SetPoint("TOPLEFT", 8, -6)
  enableBtn:SetScript("OnClick", function()
    H:SetPaused(not H:IsPaused())
    if f.syncEnable then
      f.syncEnable()
    end
  end)
  f.enableBtn = enableBtn
  f.syncEnable = function()
    if H:IsPaused() then
      enableBtn:SetText("已暂停")
      if enableBtn.text then
        enableBtn.text:SetTextColor(C.muted[1], C.muted[2], C.muted[3], 1)
      end
    else
      enableBtn:SetText("已启用")
      if enableBtn.text then
        enableBtn.text:SetTextColor(C.green[1], C.green[2], C.green[3], 1)
      end
    end
  end
  f.syncEnable()
  f.syncPause = f.syncEnable

  local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  title:SetPoint("LEFT", enableBtn, "RIGHT", 8, 0)
  title:SetText("互助切位面")
  title:SetTextColor(C.gold[1], C.gold[2], C.gold[3], 1)

  local closeBtn = NewCloseX(f, function()
    f:Hide()
  end)

  -- 感谢窗：无窗标题，只名单；定高居中可滚轮
  local settings = CreateFrame("Frame", "HuZhuLayerSettings", UIParent)
  local setPad = 22
  local setInnerW = 320
  local setH = 280
  settings:SetSize(setInnerW + setPad * 2, setH)
  settings:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
  settings:SetFrameStrata("FULLSCREEN_DIALOG")
  settings:SetFrameLevel(200)
  SkinPanel(settings)
  settings:EnableMouse(true)
  settings:EnableMouseWheel(true)
  settings:Hide()
  f.settings = settings

  NewCloseX(settings, function()
    settings:Hide()
  end)

  local thanksScroll = CreateFrame("ScrollFrame", nil, settings)
  -- 无窗标题：顶距与左右垫同宽即可（旧 -36 是给已删标题留的空行）
  thanksScroll:SetPoint("TOPLEFT", setPad, -setPad)
  thanksScroll:SetPoint("BOTTOMRIGHT", -setPad, setPad)
  thanksScroll:EnableMouse(true)
  thanksScroll:EnableMouseWheel(true)

  local thanksChild = CreateFrame("Frame", nil, thanksScroll)
  thanksChild:SetWidth(setInnerW)
  thanksScroll:SetScrollChild(thanksChild)

  local thanksBody = thanksChild:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  thanksBody:SetPoint("TOPLEFT", 0, 0)
  thanksBody:SetWidth(setInnerW)
  thanksBody:SetJustifyH("LEFT")
  thanksBody:SetJustifyV("TOP")
  thanksBody:SetSpacing(3)
  thanksBody:SetWordWrap(true)
  thanksBody:SetNonSpaceWrap(false)
  -- 小节标题金色，人名白字
  local thanksGold = "|cffffd100"
  local thanksReset = "|r"
  thanksBody:SetText(table.concat({
    thanksGold .. "参与测试：" .. thanksReset,
    "爱吃小丸子",
    "桀少不单飞",
    "",
    thanksGold .. "优质建议：" .. thanksReset,
    "taofan",
    "丹丹平常心",
    "三重溜得滑",
    "欧阳琪",
    "NB-bd1203fddb88181fed",
    "NB-dc5e8ab5d7af185c4d",
    "NB-6e0fb11ac9f45270c",
    "NB-39b74215602c17d0db",
    "NB-be55d5aa68d17eed7",
  }, "\n"))
  thanksBody:SetTextColor(C.text[1], C.text[2], C.text[3], 1)
  local bodyH = thanksBody:GetStringHeight() or 200
  local viewH = setH - setPad * 2
  thanksChild:SetHeight(math.max(bodyH + 8, viewH))

  local function thanksWheel(_, delta)
    local cur = thanksScroll:GetVerticalScroll() or 0
    local maxs = thanksScroll:GetVerticalScrollRange() or 0
    local nextY = cur - (delta * 28)
    if nextY < 0 then
      nextY = 0
    end
    if nextY > maxs then
      nextY = maxs
    end
    thanksScroll:SetVerticalScroll(nextY)
  end
  thanksScroll:SetScript("OnMouseWheel", thanksWheel)
  settings:SetScript("OnMouseWheel", thanksWheel)
  f.thanksScroll = thanksScroll

  local thanksBtn = NewHeaderTextBtn(f, "感谢", function()
    if settings:IsShown() then
      settings:Hide()
    else
      settings:ClearAllPoints()
      settings:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
      settings:Show()
      settings:Raise()
    end
  end)
  -- 常驻金色（与标题同色）；悬停略亮
  if thanksBtn.text then
    thanksBtn.text:SetTextColor(C.gold[1], C.gold[2], C.gold[3], 1)
    thanksBtn:SetScript("OnEnter", function()
      thanksBtn.text:SetTextColor(1, 0.92, 0.35, 1)
    end)
    thanksBtn:SetScript("OnLeave", function()
      thanksBtn.text:SetTextColor(C.gold[1], C.gold[2], C.gold[3], 1)
    end)
  end
  thanksBtn:SetPoint("TOPRIGHT", closeBtn, "TOPLEFT", -2, 0)
  f.thanksBtn = thanksBtn
  f.setBtn = thanksBtn -- 旧引用兼容

  f:HookScript("OnHide", function()
    if settings then
      settings:Hide()
    end
  end)

  -- 可滚动列表：最多同时看见 10 行；右侧窄滑动条
  local scroll = CreateFrame("ScrollFrame", nil, f)
  scroll:SetPoint("TOPLEFT", 14, -44)
  scroll:SetPoint("BOTTOMRIGHT", -20, 14)
  scroll:EnableMouse(true)
  scroll:EnableMouseWheel(true)
  local child = CreateFrame("Frame", nil, scroll)
  child:SetSize(392, 36)
  scroll:SetScrollChild(child)

  local bar = CreateFrame("Slider", nil, f)
  bar:SetOrientation("VERTICAL")
  bar:SetWidth(5)
  bar:SetPoint("TOPRIGHT", -8, -44)
  bar:SetPoint("BOTTOMRIGHT", -8, 14)
  bar:SetMinMaxValues(0, 1)
  bar:SetValueStep(1)
  bar:EnableMouse(true)
  local track = bar:CreateTexture(nil, "BACKGROUND")
  track:SetAllPoints()
  track:SetColorTexture(0.22, 0.22, 0.22, 0.95)
  local thumb = bar:CreateTexture(nil, "OVERLAY")
  thumb:SetColorTexture(0.62, 0.62, 0.62, 1)
  thumb:SetSize(5, 28)
  bar:SetThumbTexture(thumb)
  bar:SetScript("OnValueChanged", function(self, value)
    if self._silent then
      return
    end
    scroll:SetVerticalScroll(value or 0)
  end)
  bar:Hide()
  f.scrollBar = bar

  local function applyScroll(delta)
    local cur = scroll:GetVerticalScroll() or 0
    local maxs = scroll:GetVerticalScrollRange() or 0
    local nextY = cur - (delta * 36)
    if nextY < 0 then
      nextY = 0
    end
    if nextY > maxs then
      nextY = maxs
    end
    scroll:SetVerticalScroll(nextY)
    H:SyncPanelScrollBar()
  end
  scroll:SetScript("OnMouseWheel", function(_, delta)
    applyScroll(delta)
  end)
  bar:SetScript("OnMouseWheel", function(_, delta)
    applyScroll(delta)
  end)
  f.scroll = scroll
  f.scrollChild = child
  f.list = child
  f.rows = {}

  local cooldownAcc = 0
  f:SetScript("OnUpdate", function(_, elapsed)
    cooldownAcc = cooldownAcc + (elapsed or 0)
    if cooldownAcc < 1 then
      return
    end
    cooldownAcc = cooldownAcc - 1
    if cooldownAcc > 2 then
      cooldownAcc = 0
    end
    if not f:IsShown() then
      return
    end
    if H.SyncOpenPanelActions then
      H:SyncOpenPanelActions()
    end
  end)

  f:Hide()
end

function H:StopPanelAgeTicker()
  if self._panelAgeTicker then
    self._panelAgeTicker:Cancel()
    self._panelAgeTicker = nil
  end
  if self._panelActionTicker then
    self._panelActionTicker:Cancel()
    self._panelActionTicker = nil
  end
end

function H:BindRowHopClick(row, raw, mapId)
  if not row or not row.req then
    return
  end
  if mapId == nil then
    mapId = row.hopMap
  end
  if row.clickRaw == raw and row.hopMap == mapId then
    return
  end
  row.clickRaw = raw
  row.hopMap = mapId
  row.req:SetScript("OnClick", function()
    local opts = { hopMap = row.hopMap }
    if H.RunPlayerClick then
      H:RunPlayerClick(function()
        H:StartPoll(raw, opts)
      end)
    else
      H:StartPoll(raw, opts)
    end
  end)
end

-- 只动正在倒计时的行：改剩余时间，到点换成求切。不每秒重数人头。
function H:ApplyRowAction(row)
  if not row or not row:IsShown() or not row.cooldownRaw or not row.req or not row.curFs then
    return
  end
  if self:IsPaused() then
    return
  end
  local raw = row.layerRaw
  if not raw or self:SameNwbLayer(raw, self.currentRawLayer) then
    return
  end
  local left = self:MyLayerCooldownLeft(raw)
  if left and left > 0 then
    local text = self:FormatHopCooldown(left)
    if row.curFs:GetText() ~= text then
      row.curFs:SetText(text)
    end
    return
  end
  row.cooldownRaw = nil
  if not row.canHop then
    row.curFs:Hide()
    row.req:Hide()
    return
  end
  row.curFs:Hide()
  row.req:Show()
  row.req:Enable()
  row.req:SetText("求切位面")
  local hopCol
  if row.sameMap ~= nil then
    hopCol = row.sameMap and C.green or C.text
  else
    hopCol = (self.LayerHasSameMapHost and self:LayerHasSameMapHost(raw)) and C.green or C.text
  end
  row.req.text:SetTextColor(hopCol[1], hopCol[2], hopCol[3], 1)
  self:BindRowHopClick(row, raw)
end

function H:SyncOpenPanelActions()
  local panel = self.panel
  if not panel or not panel:IsShown() or not panel.rows then
    return
  end
  if self:IsPaused() then
    return
  end
  for _, row in ipairs(panel.rows) do
    if row.cooldownRaw then
      self:ApplyRowAction(row)
    end
  end
end

function H:StartPanelAgeTicker()
  self:StopPanelAgeTicker()
  -- 面板开着时每 30 秒刷新「X分钟前」，避免数字卡住
  self._panelAgeTicker = C_Timer.NewTicker(30, function()
    if not H.panel or not H.panel:IsShown() then
      H:StopPanelAgeTicker()
      return
    end
    pcall(function()
      -- 开着名单时不整表重画，交给 0.1 秒泵一行行刷
      H._paintSnap = nil
      H._uiStepWanted = true
      H._slowPaintDone = false
      H._slowPaintI = 1
      if H.EnsurePanelPump then
        H:EnsurePanelPump()
      end
    end)
  end)
end

function H:PanelSlowOpen()
  return self.panel and self.panel.IsShown and self.panel:IsShown()
end

function H:EnqueuePanelInbound(kind, data)
  if not kind or not data or not self.db then
    return false
  end
  local key = data.key or data.sender
  if not key then
    return false
  end
  local job = { kind = kind, data = data }
  if not self:PanelSlowOpen() then
    pcall(function()
      H:ApplyPanelInbound(job)
    end)
    return true
  end
  self._inQMap = self._inQMap or {}
  self._inQOrder = self._inQOrder or {}
  if not self._inQMap[key] then
    table.insert(self._inQOrder, key)
  end
  self._inQMap[key] = job
  self._uiStepWanted = true
  self:EnsurePanelPump()
  return true
end

function H:ApplyPanelInbound(job)
  if not job or not job.data then
    return
  end
  local d = job.data
  if job.kind == "hello" then
    local isNew = self:UpsertPeer(
      d.sender,
      d.raw,
      true,
      d.map,
      d.inst,
      d.grouped,
      d.combat,
      d.paused,
      d.queued,
      d.replyAs
    )
    local peer = self.db.peers and self.db.peers[d.sender]
    if peer then
      peer.hzl = true
    end
    if self.TraceHelloKept then
      self:TraceHelloKept(d.channel, d.sender, d.raw, d.map, isNew)
    end
    if isNew and d.channel and d.channel ~= "WHISPER" and not (self.RoomsEnabled and self:RoomsEnabled()) then
      self:SendAddon(self:HelloPayload(), "WHISPER", d.replyAs or self:WhisperTarget(d.sender))
    end
  elseif job.kind == "pig" then
    self:UpsertPigPeer(d.key, d.zoneID, d.mapID, d.autoinv, d.replyAs)
  end
end

function H:DrainInboundLimited()
  local n = 0
  local maxN = tonumber(self.LOAD_IN_MAX or self.PANEL_OPEN_IN_MAX) or 6
  self._inQMap = self._inQMap or {}
  self._inQOrder = self._inQOrder or {}
  while n < maxN and self._inQOrder[1] do
    local key = table.remove(self._inQOrder, 1)
    local job = self._inQMap[key]
    self._inQMap[key] = nil
    if job then
      n = n + 1
      pcall(function()
        H:ApplyPanelInbound(job)
      end)
    end
  end
  return n
end

function H:InboundQueueEmpty()
  return not (self._inQOrder and self._inQOrder[1])
end

function H:EnsurePanelPump()
  if self._panelPump then
    return
  end
  local gap = tonumber(self.LOAD_TICK or self.PANEL_OPEN_TICK) or 0.1
  self._panelPump = C_Timer.NewTicker(gap, function()
    pcall(function()
      H:PanelPumpTick()
    end)
  end)
end

function H:StopPanelPump()
  if self._panelPump then
    self._panelPump:Cancel()
    self._panelPump = nil
  end
end

function H:PanelPumpTick()
  local drained = self:DrainInboundLimited()
  local open = self:PanelSlowOpen()
  if open and (drained > 0 or self._uiStepWanted or not self._slowPaintDone) then
    self._uiStepWanted = false
    self:RefreshUIOneRow()
  end
  if not open and self:InboundQueueEmpty() then
    self._panelIdleN = (self._panelIdleN or 0) + 1
    if self._panelIdleN >= 20 then
      self._panelIdleN = 0
      self:StopPanelPump()
    end
  else
    self._panelIdleN = 0
  end
end

function H:EnsureLayerRow(i)
  local panel = self.panel
  if not panel or not panel.list then
    return nil
  end
  panel.rows = panel.rows or {}
  local row = panel.rows[i]
  if row and row.colAlign118 then
    return row
  end
  if row then
    row:Hide()
    row:SetParent(nil)
  end
  row = CreateFrame("Frame", nil, panel.list)
  row:SetSize(ROW_W, ROW_H)
  row.colAlign118 = true

  local icon = row:CreateTexture(nil, "ARTWORK")
  icon:SetSize(ICON_W, ICON_W)
  icon:SetPoint("LEFT", 0, 0)
  icon:SetTexture(ICON)
  row.icon = icon

  local nameFs = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  nameFs:SetPoint("LEFT", NAME_X, 0)
  nameFs:SetWidth(NAME_W)
  nameFs:SetJustifyH("LEFT")
  nameFs:SetWordWrap(false)
  nameFs:SetTextColor(C.text[1], C.text[2], C.text[3], 1)
  row.nameFs = nameFs

  local statusFs = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  statusFs:SetPoint("LEFT", STATUS_X, 0)
  statusFs:SetWidth(STATUS_W)
  statusFs:SetJustifyH("RIGHT")
  statusFs:SetWordWrap(false)
  statusFs:SetTextColor(C.muted[1], C.muted[2], C.muted[3], 1)
  row.statusFs = statusFs
  row.playersFs = statusFs

  local req = NewButton(row, "求切位面", ACTION_W, 22)
  req:SetPoint("RIGHT", -ACTION_PAD, 0)
  row.req = req

  local curFs = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  curFs:SetPoint("RIGHT", -ACTION_PAD, 0)
  curFs:SetWidth(ACTION_W)
  curFs:SetJustifyH("CENTER")
  curFs:Hide()
  row.curFs = curFs

  local div = row:CreateTexture(nil, "BORDER")
  div:SetHeight(1)
  div:SetPoint("BOTTOMLEFT", 0, 0)
  div:SetPoint("BOTTOMRIGHT", 0, 0)
  div:SetColorTexture(C.line[1], C.line[2], C.line[3], 0.6)

  panel.rows[i] = row
  return row
end

function H:FillLayerRow(row, item)
  if not row or not item then
    return
  end
  local people = item.players or {}
  local nPeople = #people
  local nShow = item.headCount
  if nShow == nil then
    nShow = nPeople
  end
  local nCan = item.nCan
  if nCan == nil then
    nCan = H:CountLayerCandidates(item.raw)
  end
  row.nameFs:SetText(item.label .. "（" .. tostring(nShow) .. "人）")
  if item.onMyMap then
    row.nameFs:SetTextColor(1, 0.82, 0, 1)
  else
    local mappedNum = H.NwbLayerNum and H:NwbLayerNum(item.raw)
    if mappedNum and mappedNum > 0 then
      row.nameFs:SetTextColor(1, 0.82, 0, 1)
    else
      row.nameFs:SetTextColor(1, 1, 1, 1)
    end
  end

  local status = H:MyLayerStatusText(item.raw)
  row.layerRaw = item.raw
  row.clickRaw = nil
  row.cooldownRaw = nil
  if item.sameMap ~= nil then
    row.sameMap = item.sameMap and true or false
  else
    row.sameMap = nil
  end
  row.canHop = not (nCan < 1 and (item.headCount or 0) < 1)
  row.statusFs:SetText(status)
  if item.mine or (status and status:find("你在此位面", 1, true)) then
    row.statusFs:SetTextColor(C.green[1], C.green[2], C.green[3], 1)
  else
    row.statusFs:SetTextColor(C.muted[1], C.muted[2], C.muted[3], 1)
  end
  row.statusFs:Show()

  if item.mine then
    row.req:Hide()
    row.curFs:SetText("当前")
    row.curFs:SetTextColor(C.green[1], C.green[2], C.green[3], 1)
    row.curFs:Show()
  elseif H:IsPaused() then
    row.req:Hide()
    row.curFs:SetText("暂停")
    row.curFs:SetTextColor(C.muted[1], C.muted[2], C.muted[3], 1)
    row.curFs:Show()
  else
    local left = H:MyLayerCooldownLeft(item.raw)
    if left and left > 0 then
      row.req:Hide()
      row.curFs:SetText(H:FormatHopCooldown(left))
      row.curFs:SetTextColor(C.text[1], C.text[2], C.text[3], 1)
      row.curFs:Show()
      row.cooldownRaw = item.raw
    elseif nCan < 1 and (item.headCount or 0) < 1 then
      row.req:Hide()
      row.curFs:Hide()
    else
      row.curFs:Hide()
      row.req:Show()
      row.req:Enable()
      row.req:SetText("求切位面")
      local hopCol
      if item.sameMap ~= nil then
        hopCol = item.sameMap and C.green or C.text
      else
        hopCol = (H.LayerHasSameMapHost and H:LayerHasSameMapHost(item.raw)) and C.green or C.text
      end
      row.req.text:SetTextColor(hopCol[1], hopCol[2], hopCol[3], 1)
      self:BindRowHopClick(row, item.raw, item.mapId)
    end
  end
  row:Show()
end

function H:LayoutLayerRows(n)
  n = tonumber(n) or 0
  if self._layoutN == n and self.panel and self.panel.rows and (n == 0 or self.panel.rows[n]) then
    return
  end
  self._layoutN = n
  self:FitPanelHeight(n)
  for i = 1, n do
    local row = self:EnsureLayerRow(i)
    if row then
      row:ClearAllPoints()
      row:SetPoint("TOPLEFT", 0, -((i - 1) * ROW_GAP))
      row:SetHeight(ROW_H)
      row:Show()
    end
  end
  for i = n + 1, #(self.panel.rows or {}) do
    self.panel.rows[i]:Hide()
  end
  if self.panel.scrollChild then
    self.panel.scrollChild:SetWidth(ROW_W)
  end
  if self._panelScrollTop and self.panel.scroll then
    self.panel.scroll:SetVerticalScroll(0)
    self._panelScrollTop = false
  end
  self:SyncPanelScrollBar()
end

function H:PaintLayerSkeleton()
  if not self.panel or not self.panel.list then
    return
  end
  local snap = self.GetPaintSnapshot and self:GetPaintSnapshot() or nil
  local layers = snap and snap.layers or self:ListKnownLayers(true)
  self:LayoutLayerRows(#layers)
  for i, item in ipairs(layers) do
    local row = self.panel.rows[i]
    if row and row.nameFs then
      local cur = row.nameFs:GetText()
      if not cur or cur == "" then
        row.nameFs:SetText((item.label or "位面") .. "（…）")
      end
      row.layerRaw = item.raw
    end
  end
end

function H:RefreshUIOneRow()
  if not self.panel or not self.panel.list or not self.panel:IsShown() then
    return
  end
  pcall(function()
    H:UpdateLayerIcon()
  end)
  local snap = self.GetPaintSnapshot and self:GetPaintSnapshot() or nil
  local layers = snap and snap.layers or self:ListKnownLayers(true)
  local n = #layers
  self:LayoutLayerRows(n)
  if n < 1 then
    self._slowPaintDone = true
    return
  end
  local i = tonumber(self._slowPaintI) or 1
  if i < 1 or i > n then
    i = 1
  end
  local item = layers[i]
  if item.nCan == nil then
    item.players = self:PlayersOnLayer(item.raw)
    if self.HeadCountForRaw and self.RoomsEnabled and self:RoomsEnabled() then
      item.headCount = self:HeadCountForRaw(item.raw, item.players and #item.players)
    end
  end
  local row = self:EnsureLayerRow(i)
  self:FillLayerRow(row, item)
  i = i + 1
  if i > n then
    self._slowPaintI = 1
    self._slowPaintDone = true
  else
    self._slowPaintI = i
    self._slowPaintDone = false
  end
end

function H:TogglePanel()
  if not self.db then
    return
  end
  local ok, err = pcall(function() H:InitUI() end)
  if not ok then
    self:Print("创建面板失败：", err)
    return
  end
  if self.panel:IsShown() then
    self:StopPanelAgeTicker()
    self.panel:Hide()
  else
    -- 每次打开：滚到最上方（当前位面在顶）
    self._panelScrollTop = true
    self.panel:Show()
    self.panel:Raise()
    pcall(function()
      H:PlacePanel()
      -- 点开当帧只摆空壳，数据和每一行按 0.1 秒泵慢慢刷
      H._paintSnap = nil
      H._layoutN = nil
      H._slowPaintI = 1
      H._slowPaintDone = false
      H._uiStepWanted = true
      H:PaintLayerSkeleton()
      H:EnsurePanelPump()
      if H.PigLoudChatProbe and H.PigBridgeEnabled and H:PigBridgeEnabled() then
        H:PigLoudChatProbe({ gapSec = 30 })
      end
    end)
    self:StartPanelAgeTicker()
  end
end

-- 名单开着：不整表重画，标一下让 0.1 秒泵画下一行
function H:ScheduleRefreshUI(delay)
  if self.PanelSlowOpen and self:PanelSlowOpen() then
    self._uiStepWanted = true
    self:EnsurePanelPump()
    return
  end
  self._uiRefreshWanted = true
  if self._uiRefreshScheduled then
    return
  end
  self._uiRefreshScheduled = true
  C_Timer.After(tonumber(delay) or 0.4, function()
    H._uiRefreshScheduled = false
    if not H._uiRefreshWanted then
      return
    end
    H._uiRefreshWanted = false
    pcall(function()
      H:RefreshUI()
    end)
  end)
end

function H:RefreshUI()
  if self.PanelSlowOpen and self:PanelSlowOpen() then
    pcall(function()
      H:UpdateLayerIcon()
    end)
    self._uiStepWanted = true
    self:EnsurePanelPump()
    return
  end
  -- 刷表前预热 NWB 对照缓存，避免每一行反复扫存档
  if self.GetNwbLayerCache then
    pcall(function()
      H:GetNwbLayerCache()
    end)
  end
  pcall(function()
    H:UpdateLayerIcon()
  end)
  if not self.panel or not self.panel.list then
    return
  end
  -- 面板关着只更新小地图图标，别整表重画（喊话后几十条回包会卡死）
  if not self.panel:IsShown() then
    return
  end
  -- 开着时走 0.1 秒泵；这里只给未走泵的兜底整表
  if self.panel.syncEnable then
    self.panel.syncEnable()
  elseif self.panel.syncPause then
    self.panel.syncPause()
  end

  local layers = self:ListKnownLayers()
  self:LayoutLayerRows(#layers)
  for i, item in ipairs(layers) do
    self:FillLayerRow(self:EnsureLayerRow(i), item)
  end
end

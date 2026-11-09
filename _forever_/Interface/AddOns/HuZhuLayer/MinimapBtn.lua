local H = HuZhuLayer
-- 已定稿：游戏自带地图 ICON（勿换成握手自定义图）
local ICON = "Interface\\Icons\\INV_Misc_Map_01"

-- 左下角、聊天框上方浮动按钮（不贴小地图）

function HuZhuLayer_OnAddonCompartmentClick()
  if H and H.TogglePanel then
    H:TogglePanel()
  end
end

function HuZhuLayer_OnAddonCompartmentEnter(_, buttonFrame)
  if not GameTooltip then
    return
  end
  GameTooltip:SetOwner(buttonFrame, "ANCHOR_LEFT")
  GameTooltip:ClearLines()
  GameTooltip:AddLine("互助切位面", 0.4, 0.8, 1)
  GameTooltip:AddLine("点击打开面板", 1, 1, 1)
  GameTooltip:Show()
end

function HuZhuLayer_OnAddonCompartmentLeave()
  if GameTooltip then
    GameTooltip:Hide()
  end
end

function H:RegisterCompartment()
  if self._compartmentDone then
    return
  end
  self._compartmentDone = true
  pcall(function()
    if AddonCompartmentFrame and AddonCompartmentFrame.RegisterAddon then
      AddonCompartmentFrame:RegisterAddon({
        text = "互助切位面",
        icon = ICON,
        notCheckable = true,
        func = function()
          H:TogglePanel()
        end,
        funcOnEnter = function(button)
          HuZhuLayer_OnAddonCompartmentEnter(nil, button)
        end,
        funcOnLeave = function()
          HuZhuLayer_OnAddonCompartmentLeave()
        end,
      })
    end
  end)
end

local function KillLegacyMinimap()
  local old = _G.HuZhuLayerMinimapButton
  if old then
    old:Hide()
    old:SetParent(nil)
    _G.HuZhuLayerMinimapButton = nil
  end
end

function H:RegisterLauncherIcon()
  if self._launcherRegistered then
    return
  end
  local ldb = LibStub and LibStub("LibDataBroker-1.1", true)
  local icon = LibStub and LibStub("LibDBIcon-1.0", true)
  if not ldb or not icon then
    return
  end
  self.db.minimap = self.db.minimap or {}
  if self.db.minimap.minimapPos == nil then
    self.db.minimap.minimapPos = 220
  end
  local obj = ldb:NewDataObject("HuZhuLayer", {
    type = "launcher",
    text = "互助切位面",
    icon = ICON,
    OnClick = function(_, button)
      if button ~= "LeftButton" then
        return
      end
      if H.RunPlayerClick then
        H:RunPlayerClick(function()
          H:TogglePanel()
        end)
      else
        H:TogglePanel()
      end
    end,
    OnTooltipShow = function(tt)
      tt:AddLine("互助切位面", 0.4, 0.8, 1)
      if H.LayerUnreliable and H:LayerUnreliable() then
        tt:AddLine("当前：?", 1, 1, 1)
      elseif H.currentRawLayer and H.LabelForRaw then
        tt:AddLine("当前：" .. H:LabelForRaw(H.currentRawLayer), 0.4, 0.9, 0.5)
      else
        tt:AddLine("当前：?", 1, 1, 1)
      end
      tt:AddLine("点击：打开列表", 1, 1, 1)
    end,
  })
  if icon.IsRegistered and icon:IsRegistered("HuZhuLayer") then
    icon:Refresh("HuZhuLayer", self.db.minimap)
  else
    icon:Register("HuZhuLayer", obj, self.db.minimap)
  end
  if icon.Show then
    icon:Show("HuZhuLayer")
  end
  self._launcherRegistered = true
end

-- 离屏幕左边一点点空隙（别贴死、也别离太远）
local FLOAT_LEFT_GAP = 4

local function PlaceDefault(root)
  root:ClearAllPoints()
  -- 竖直：聊天标签栏上方；水平：相对屏幕左边留 FLOAT_LEFT_GAP
  local dock = _G.GeneralDockManager
  local chat = _G.ChatFrame1
  if dock and dock.GetObjectType then
    root:SetPoint("BOTTOM", dock, "TOP", 0, 48)
    root:SetPoint("LEFT", UIParent, "LEFT", FLOAT_LEFT_GAP, 0)
  elseif chat and chat.GetObjectType then
    root:SetPoint("BOTTOM", chat, "TOP", 0, 72)
    root:SetPoint("LEFT", UIParent, "LEFT", FLOAT_LEFT_GAP, 0)
  else
    root:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", FLOAT_LEFT_GAP, 300)
  end
end

local function PlaceSavedOrDefault(root)
  local mm = H.db.minimap
  if mm and mm.x ~= nil and mm.y ~= nil then
    root:ClearAllPoints()
    root:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", mm.x, mm.y)
  else
    PlaceDefault(root)
  end
end

function H:EnsureMinimap()
  if not self.db then
    return
  end
  self:RegisterCompartment()
  KillLegacyMinimap()
  self:RegisterLauncherIcon()

  self.db.minimap = self.db.minimap or {}

  -- 一次性：默认改为「贴左但留一点缝」
  if not self.db._floatPlace194 then
    self.db.minimap.x = nil
    self.db.minimap.y = nil
    if type(self.db.panel) == "table" then
      self.db.panel.userMoved = nil
      self.db.panel.x = nil
      self.db.panel.y = nil
    end
    self.db._floatPlace194 = true
  end

  if self.db.minimap.hide then
    if self.floatRoot then
      self.floatRoot:Hide()
    end
    return
  end

  if self.floatRoot and self.floatRoot.GetObjectType then
    PlaceSavedOrDefault(self.floatRoot)
    self.floatRoot:Show()
    self:UpdateHelpButton()
    self:UpdateLayerIcon()
    return
  end

  self:InitFloatButton()
end

H.FLOAT_ICON_SIZE = 26 -- ICON 边长（比旧 36 更小）
H.LAYER_TIP_SECONDS = 5 -- ICON 右侧黄字提示停留秒数

function H:ApplyFloatButtonStyle()
  local btn = self.minimapBtn
  local root = self.floatRoot
  if not btn or not btn.GetObjectType then
    return
  end
  local sz = self.FLOAT_ICON_SIZE or 26
  btn:SetSize(sz, sz)
  if root and root.SetSize then
    -- 右侧留给黄字提示
    root:SetSize(sz + 240, sz + 8)
  end
  -- 去掉「位面」二字
  if btn.layerCaption then
    btn.layerCaption:SetText("")
    btn.layerCaption:Hide()
  end
  local numFs = btn.layerNumFs
  if numFs then
    pcall(function()
      numFs:SetFont(numFs:GetFont(), 11, "OUTLINE")
    end)
  end
  self:EnsureLayerTip()
end

-- ICON 右边黄字：进入 / 切换位面
function H:EnsureLayerTip()
  local root = self.floatRoot
  local btn = self.minimapBtn
  if not root or not btn or not root.CreateFontString then
    return nil
  end
  local tip = root.layerTipFs
  if tip and tip.GetObjectType then
    tip:ClearAllPoints()
    tip:SetPoint("LEFT", btn, "RIGHT", 6, 0)
    return tip
  end
  tip = root:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  tip:SetPoint("LEFT", btn, "RIGHT", 6, 0)
  tip:SetJustifyH("LEFT")
  tip:SetTextColor(1, 0.82, 0, 1)
  tip:SetWidth(220)
  tip:SetWordWrap(false)
  pcall(function()
    tip:SetFont(tip:GetFont(), 12, "OUTLINE")
  end)
  tip:Hide()
  root.layerTipFs = tip
  return tip
end

function H:PaintLayerChangeTip()
  local raw = tonumber(self._layerTipRaw)
  local tip = self.floatRoot and self.floatRoot.layerTipFs
  if not raw or not tip or not tip:IsShown() then
    return
  end
  local function piece(id)
    local n = self.NwbLayerNum and self:NwbLayerNum(id)
    local zh = n and n > 0 and self.LayerIndexZh and self:LayerIndexZh(n)
    if zh then
      return zh, true
    end
    return tostring(id), false
  end
  local dest, mapped = piece(raw)
  local prev = tonumber(self._layerTipPrev)
  local text
  if prev and prev ~= raw then
    text = "从位面" .. piece(prev) .. "切换到位面" .. dest
  else
    text = "进入位面" .. dest
  end
  tip:SetText(text)
  if mapped then
    tip:SetTextColor(1, 0.82, 0, 1)
  else
    tip:SetTextColor(1, 1, 1, 1)
  end
end

function H:ShowLayerChangeTip(text)
  if not text or text == "" then
    if not tonumber(self._layerTipRaw) then
      return
    end
  end
  pcall(function()
    H:EnsureMinimap()
  end)
  local tip = self:EnsureLayerTip()
  if not tip then
    return
  end
  local btn = self.minimapBtn
  tip:ClearAllPoints()
  tip:SetPoint("LEFT", btn, "RIGHT", 6, 0)
  tip:Show()
  if tonumber(self._layerTipRaw) then
    self:PaintLayerChangeTip()
  else
    tip:SetText(text)
    tip:SetTextColor(1, 0.82, 0, 1)
  end
  self._layerTipToken = (self._layerTipToken or 0) + 1
  local token = self._layerTipToken
  local hold = self.LAYER_TIP_SECONDS or 5
  C_Timer.After(hold, function()
    if H._layerTipToken ~= token then
      return
    end
    if H.floatRoot and H.floatRoot.layerTipFs then
      H.floatRoot.layerTipFs:Hide()
    end
  end)
end

function H:InitFloatButton()
  if _G.HuZhuLayerFloatRoot and _G.HuZhuLayerFloatRoot.GetObjectType then
    self.floatRoot = _G.HuZhuLayerFloatRoot
    self.minimapBtn = _G.HuZhuLayerFloatButton
    self:KillHelpButton()
    PlaceSavedOrDefault(self.floatRoot)
    self.floatRoot:Show()
    self:ApplyFloatButtonStyle()
    self:UpdateHelpButton()
    self:UpdateLayerIcon()
    return
  end

  local sz = self.FLOAT_ICON_SIZE or 26
  local root = CreateFrame("Frame", "HuZhuLayerFloatRoot", UIParent)
  root:SetSize(sz + 240, sz + 8)
  root:SetFrameStrata("HIGH")
  root:SetFrameLevel(500)
  root:SetClampedToScreen(true)
  root:SetMovable(true)

  local btn = CreateFrame("Button", "HuZhuLayerFloatButton", root)
  btn:SetSize(sz, sz)
  btn:SetPoint("LEFT", 0, 0)
  btn:EnableMouse(true)
  btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  btn:RegisterForDrag("LeftButton")

  local icon = btn:CreateTexture(nil, "ARTWORK")
  icon:SetAllPoints()
  icon:SetTexture(ICON)
  btn.layerIcon = icon

  -- ICON 右下角：当前位面编号（服务器 zoneUID）
  local numFs = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  numFs:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", 1, 0)
  numFs:SetJustifyH("RIGHT")
  numFs:SetTextColor(1, 1, 1, 1)
  pcall(function()
    numFs:SetFont(numFs:GetFont(), 11, "OUTLINE")
  end)
  btn.layerNumFs = numFs

  -- 不再显示「位面」文字
  local label = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  label:Hide()
  btn.layerCaption = label

  -- ICON 右边黄字提示（进入 / 切换）
  local tip = root:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  tip:SetPoint("LEFT", btn, "RIGHT", 6, 0)
  tip:SetJustifyH("LEFT")
  tip:SetTextColor(1, 0.82, 0, 1)
  tip:SetWidth(220)
  tip:SetWordWrap(false)
  pcall(function()
    tip:SetFont(tip:GetFont(), 12, "OUTLINE")
  end)
  tip:Hide()
  root.layerTipFs = tip

  PlaceSavedOrDefault(root)

  btn:SetScript("OnDragStart", function()
    root:StartMoving()
  end)
  btn:SetScript("OnDragStop", function()
    root:StopMovingOrSizing()
    local ux, uy = root:GetLeft(), root:GetBottom()
    if ux and uy then
      H.db.minimap.x = ux
      H.db.minimap.y = uy
      root:ClearAllPoints()
      root:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", ux, uy)
    end
  end)
  btn:SetScript("OnClick", function()
    if H.RunPlayerClick then
      H:RunPlayerClick(function()
        H:TogglePanel()
      end)
    else
      H:TogglePanel()
    end
  end)
  btn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:AddLine("互助切位面", 0.4, 0.8, 1)
    if H.LayerUnreliable and H:LayerUnreliable() then
      GameTooltip:AddLine("当前：?", 1, 1, 1)
    elseif H.currentRawLayer then
      GameTooltip:AddLine("当前：" .. H:LabelForRaw(H.currentRawLayer), 0.4, 0.9, 0.5)
    else
      GameTooltip:AddLine("当前：?", 1, 1, 1)
    end
    GameTooltip:AddLine("点击：打开列表", 1, 1, 1)
    GameTooltip:AddLine("拖动可移动", 0.7, 0.7, 0.7)
    GameTooltip:Show()
  end)
  btn:SetScript("OnLeave", function()
    GameTooltip:Hide()
  end)

  root:Show()
  self.floatRoot = root
  self.minimapBtn = btn
  self:KillHelpButton()
  self:ApplyFloatButtonStyle()
  self:UpdateHelpButton()
  self:UpdateLayerIcon()
end

function H:UpdateLayerIcon()
  local btn = self.minimapBtn
  if not btn or not btn.GetObjectType then
    return
  end
  local paint
  local size = 12
  if self.LayerUnreliable and self:LayerUnreliable() then
    paint = "|cffaaaaaa?|r"
  elseif self.currentRawLayer then
    local mapped = self.NwbLayerNum and self:NwbLayerNum(self.currentRawLayer)
    local zh = mapped and mapped > 0 and self.LayerIndexZh and self:LayerIndexZh(mapped)
    local num = zh or tostring(self.currentRawLayer)
    if mapped and mapped > 0 then
      paint = "|cffffd100" .. num .. "|r"
    else
      paint = "|cffffffff" .. num .. "|r"
    end
    size = (#num >= 5) and 10 or 12
  else
    paint = "|cffaaaaaa?|r"
  end
  if self._layerIconPaint == paint and self._layerIconSize == size then
    return
  end
  self._layerIconPaint = paint
  self._layerIconSize = size
  if not self._layerIconStyled then
    self:ApplyFloatButtonStyle()
    self._layerIconStyled = true
  end
  -- 恢复本色（旧版曾压灰）
  if btn.layerIcon and btn.layerIcon.SetVertexColor then
    btn.layerIcon:SetVertexColor(1, 1, 1, 1)
  else
    local regions = { btn:GetRegions() }
    for _, r in ipairs(regions) do
      if r and r.GetObjectType and r:GetObjectType() == "Texture" and r.SetVertexColor then
        r:SetVertexColor(1, 1, 1, 1)
        btn.layerIcon = r
        break
      end
    end
  end
  local fs = btn.layerNumFs
  if not fs then
    fs = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    fs:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", 1, 0)
    fs:SetJustifyH("RIGHT")
    btn.layerNumFs = fs
  end
  fs:SetText(paint)
  pcall(function()
    fs:SetFont(fs:GetFont(), size, "OUTLINE")
  end)
  if paint == "|cffaaaaaa?|r" then
    local tip = self.floatRoot and self.floatRoot.layerTipFs
    if tip and tip.Hide then
      tip:Hide()
    end
    return
  end
  if self.currentRawLayer then
    self:PaintLayerChangeTip()
  end
end

function H:KillHelpButton()
  local old = _G.HuZhuLayerHelpButton
  if old then
    old:Hide()
    old:SetParent(nil)
    old:SetScript("OnClick", nil)
    _G.HuZhuLayerHelpButton = nil
  end
  self.helpBtn = nil
end

-- 自动帮忙，不显示「帮助」按钮。旧版残留按钮收掉。
function H:UpdateHelpButton()
  self:KillHelpButton()
end

if BG.IsBlackListPlayer then return end
if not BG.IsTitan then return end
local AddonName, ns = ...

local LibBG = ns.LibBG
local L = ns.L

local RR = ns.RR
local NN = ns.NN
local RN = ns.RN
local Size = ns.Size
local RGB = ns.RGB
local RGB_16 = ns.RGB_16
local GetClassRGB = ns.GetClassRGB
local SetClassCFF = ns.SetClassCFF
local GetText_T = ns.GetText_T
local AddTexture = ns.AddTexture
local GetItemID = ns.GetItemID

local Maxb = ns.Maxb

local pt = print
local realmID = GetRealmID()
local player = BG.playerName

BG.Init(function()
    BiaoGe.raidWorldBossCDChoose = BiaoGe.raidWorldBossCDChoose or 1
    local FB = "Worldtitan"
    local dropDownDB = {
        { name = BG.Boss[FB]["boss" .. 1].name2, id = 116 },
        { name = BG.Boss[FB]["boss" .. 2].name2, id = 117 },
        -- { name = BG.Boss[FB]["boss" .. 3].name2, id = 0 },
        -- { name = BG.Boss[FB]["boss" .. 4].name2, id = 0 },
        -- { name = BG.Boss[FB]["boss" .. 5].name2, id = 0 },
        -- { name = BG.Boss[FB]["boss" .. 6].name2, id = 0 },
        -- { name = BG.Boss[FB]["boss" .. 7].name2, id = 0 },
        -- { name = BG.Boss[FB]["boss" .. 8].name2, id = 0 },
    }
    if not dropDownDB[BiaoGe.raidWorldBossCDChoose] then
        BiaoGe.raidWorldBossCDChoose = 1
    end
    local bossInfo = {}
    for _, v in ipairs(dropDownDB) do
        bossInfo[v.id] = 0
    end

    local parent = BG["Frame" .. FB]
    local GetWorldBossCDText, GetBossIDByIndex

    local f = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    do
        f:SetBackdrop({
            bgFile = "Interface/ChatFrame/ChatFrameBackground",
            edgeFile = "Interface/ChatFrame/ChatFrameBackground",
            edgeSize = 1,
        })
        f:SetBackdropColor(0, 0, 0, .3)
        f:SetBackdropBorderColor(.2, .2, .2, .8)
        f:SetSize(395, 340)
        f:SetPoint("BOTTOMRIGHT", BG.MainFrame, "BOTTOMRIGHT", -20, 75)
        f:EnableMouse(true)
        f.buttons = {}
        BG.worldBossCDFrame = f
        f:SetScript("OnMouseDown", function(self)
            BG.MainFrame:GetScript("OnMouseDown")(BG.MainFrame)
        end)
        f:SetScript("OnMouseUp", function(self)
            BG.MainFrame:GetScript("OnMouseUp")(BG.MainFrame)
        end)
        f:SetScript("OnShow", function(self)
            self:UpdateFrame()
        end)

        local text = f:CreateFontString()
        text:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
        text:SetPoint("BOTTOM", f, "TOP", 0, 5)
        text:SetText(L["团员世界BossCD"])
        text:SetTextColor(1, 1, 1)
        f.title = text

        local function AddButton(dropDown, index)
            local info = LibBG:UIDropDownMenu_CreateInfo()
            info.text = dropDownDB[index].name
            info.func = function()
                BiaoGe.raidWorldBossCDChoose = index
                LibBG:UIDropDownMenu_SetText(dropDown, dropDownDB[BiaoGe.raidWorldBossCDChoose].name)
                BG.worldBossCDFrame:UpdateFrame()
            end
            if BiaoGe.raidWorldBossCDChoose == index then
                info.checked = true
            end
            LibBG:UIDropDownMenu_AddButton(info)
        end
        local dropDown = LibBG:Create_UIDropDownMenu(nil, f)
        dropDown:SetScale(.9)
        BG.dropDownToggle(dropDown)
        dropDown:SetPoint("BOTTOMRIGHT", f, "TOPRIGHT", 15, -5)
        LibBG:UIDropDownMenu_SetWidth(dropDown, 100)
        LibBG:UIDropDownMenu_SetAnchor(dropDown, 0, 0, "TOP", dropDown, "BOTTOM")
        LibBG:UIDropDownMenu_SetText(dropDown, dropDownDB[BiaoGe.raidWorldBossCDChoose].name)
        LibBG:UIDropDownMenu_Initialize(dropDown, function(self, level, menuList)
            for i, v in ipairs(dropDownDB) do
                AddButton(dropDown, i)
            end
        end)
    end

    function BG.worldBossCDFrame:CreateRaidButton(i)
        local bt = CreateFrame("Frame", nil, self, "BackdropTemplate")
        do
            bt:SetBackdrop({
                bgFile = "Interface/ChatFrame/ChatFrameBackground",
                edgeFile = "Interface/ChatFrame/ChatFrameBackground",
                edgeSize = 1,
            })
            bt.color1 = { 0, 0, 0, .2 }
            bt.color2 = { 1, 0, 0, .3 }
            bt.color3 = { 0, 1, 0, .3 }
            bt:SetBackdropColor(unpack(bt.color1))
            bt:SetBackdropBorderColor(1, 1, 1, .2)
            bt:SetSize(90, 28)
            if i == 1 then
                bt:SetPoint("TOPLEFT", 10, -20)

                local text = bt:CreateFontString()
                text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
                text:SetPoint("BOTTOM", bt, "TOP", 0, 2)
                text:SetText(1)
                text:SetTextColor(.5, .5, .5)
            elseif i == 21 then
                bt:SetPoint("TOPLEFT", self.buttons[5], "BOTTOMLEFT", 0, -25)

                local text = bt:CreateFontString()
                text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
                text:SetPoint("BOTTOM", bt, "TOP", 0, 2)
                text:SetText((i - 1) / 5 + 1)
                text:SetTextColor(.5, .5, .5)
            elseif (i - 1) % 5 == 0 then
                bt:SetPoint("TOPLEFT", self.buttons[i - 5], "TOPRIGHT", 5, 0)

                local text = bt:CreateFontString()
                text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
                text:SetPoint("BOTTOM", bt, "TOP", 0, 2)
                text:SetText((i - 1) / 5 + 1)
                text:SetTextColor(.5, .5, .5)
            else
                bt:SetPoint("TOPLEFT", self.buttons[i - 1], "BOTTOMLEFT", 0, -1)
            end
            bt.index = i
            tinsert(self.buttons, bt)

            local tex = bt:CreateTexture(nil, "OVERLAY")
            tex:SetPoint("CENTER", bt, "TOPLEFT", 2, -2)
            tex:SetSize(10, 10)
            bt.icon = tex

            local tex = bt:CreateTexture()
            tex:SetPoint("TOPLEFT", 2, -1)
            tex:SetSize(12, 12)
            bt.talent = tex

            local text = bt:CreateFontString()
            text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
            text:SetPoint("LEFT", bt.talent, "RIGHT", 0, 0)
            text:SetWidth(bt:GetWidth() - bt.talent:GetWidth() - 3)
            text:SetJustifyH("LEFT")
            text:SetWordWrap(false)
            bt.nameText = text

            local text = bt:CreateFontString()
            text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
            text:SetPoint("BOTTOMLEFT", 2, 1)
            text:SetWidth(bt:GetWidth() - 5)
            text:SetJustifyH("LEFT")
            text:SetWordWrap(false)
            bt.infoText = text
        end

        function bt:Reset()
            self.name = nil
            self.nameText:SetText("")
            self.infoText:SetText("")
            self.icon:SetTexture(nil)
            self.talent:SetTexture(nil)
            self.talent:SetAtlas(nil)
            self.talent:SetTexCoord(0, 1, 0, 1)
            self:SetBackdropColor(unpack(self.color1))
        end

        function bt:FullUpdate(raidIndex)
            local v = BG.raidRosterInfo[raidIndex]
            if v then
                local name = v.name
                local color = "ffFFFFFF"
                if v.class then
                    color = select(4, GetClassColor(v.class))
                end
                self.name = name
                self.nameText:SetText("|c" .. color .. name)
                if v.rank == 2 then
                    self.icon:SetTexture("interface/groupframe/ui-group-leadericon")
                elseif v.role == "MAINTANK" then
                    self.icon:SetTexture(132064)
                elseif v.role == "MAINASSIST" then
                    self.icon:SetTexture(132063)
                elseif v.rank == 1 then
                    self.icon:SetTexture("interface/groupframe/ui-group-assistanticon")
                end
                if v.combatRole == "TANK" then
                    self.talent:SetAtlas("ui-lfg-roleicon-tank")
                elseif v.combatRole == "HEALER" then
                    self.talent:SetAtlas("ui-lfg-roleicon-healer")
                elseif v.combatRole == "DAMAGER" then
                    self.talent:SetAtlas("ui-lfg-roleicon-dps")
                end
            elseif not IsInRaid(1) then
                self.name = player
                self.nameText:SetText(SetClassCFF(player))
                self.talent:SetAtlas("GarrMission_ClassIcon-" .. select(2, UnitClass("player")))
            end
            self:SubUpdate()
        end

        function bt:SubUpdate()
            local name = self.name
            if name then
                local text = GetWorldBossCDText(name)
                if text == 1 then
                    self.infoText:SetText(L["有CD"])
                    self.infoText:SetTextColor(1, 0, 0)
                    self:SetBackdropColor(unpack(self.color2))
                elseif text == 0 then
                    self.infoText:SetText(L["无CD"])
                    self.infoText:SetTextColor(0, 1, 0)
                    self:SetBackdropColor(unpack(self.color3))
                else
                    self.infoText:SetText(UNKNOWN)
                    self.infoText:SetTextColor(.5, .5, .5)
                    self:SetBackdropColor(unpack(self.color1))
                end
            end
        end
    end

    for i = 1, 40 do
        BG.worldBossCDFrame:CreateRaidButton(i)
    end

    function BG.worldBossCDFrame:UpdateFrame(name)
        if not self:IsVisible() then return end
        if name then
            for _, bt in ipairs(self.buttons) do
                if bt.name == name then
                    bt:SubUpdate()
                end
            end
        else
            for _, bt in ipairs(self.buttons) do
                bt:Reset()
            end
            if IsInRaid(1) then
                for i, v in ipairs(BG.raidRosterInfo) do
                    local team = v.subgroup
                    local num
                    for ii = (team - 1) * 5 + 1, team * 5 do
                        local bt = self.buttons[ii]
                        local text = bt.nameText:GetText()
                        if not text or text == "" then
                            num = ii
                            break
                        end
                    end
                    self.buttons[num]:FullUpdate(i)
                end
            else
                self.buttons[1]:FullUpdate()
            end
        end
    end

    BG.worldBossRaidCD = {}
    local FBCD = "RaidCD"
    function BG.GetWorldBossCDMsg()
        if BiaoGe[FBCD][realmID][player] then
            for k, v in pairs(BiaoGe[FBCD][realmID][player]) do
                if v.isWorldBoss then
                    local bossID = v.fbId
                    bossInfo[bossID] = 1
                end
            end
        end
        local msg = "cd^"
        for bossID, num in pairs(bossInfo) do
            msg = msg .. bossID .. ":" .. num .. ","
        end
        return msg
    end

    function BG.SendMyWorldBossCD()
        ChatThrottleLib:SendAddonMessage("NORMAL", "BiaoGeWorldBoss", BG.GetWorldBossCDMsg(), "RAID")
    end

    function GetBossIDByIndex()
        return dropDownDB[BiaoGe.raidWorldBossCDChoose].id
    end

    function GetWorldBossCDText(name)
        if IsInRaid(1) then
            return BG.raidBiaoGeVersion[name] and BG.worldBossRaidCD[name] and BG.worldBossRaidCD[name][GetBossIDByIndex()] or nil
        else
            return BG.worldBossRaidCD[name] and BG.worldBossRaidCD[name][GetBossIDByIndex()] or nil
        end
    end

    local function UpdateMyWorldBossCD()
        BG.GetWorldBossCDMsg()
        for bossID, cd in pairs(bossInfo) do
            BG.worldBossRaidCD[player] = BG.worldBossRaidCD[player] or {}
            BG.worldBossRaidCD[player][bossID] = cd
        end
    end

    local lastNum = 0
    function BG.CanSend_WorldCD()
        local n
        local canSend = true
        if IsInRaid(1) then
            n = GetNumGroupMembers(1)
            if lastNum >= n then
                canSend = false
            end
        else
            canSend = false
            n = 0
        end
        lastNum = n
        return canSend
    end

    local f = CreateFrame("Frame")
    f:RegisterEvent("GROUP_ROSTER_UPDATE")
    f:RegisterEvent("CHAT_MSG_ADDON")
    f:RegisterEvent("PLAYER_ENTERING_WORLD")
    f:SetScript("OnEvent", function(self, event, ...)
        if event == "GROUP_ROSTER_UPDATE" then
            local canSend = BG.CanSend_WorldCD()
            self.t = 0
            self:SetScript("OnUpdate", function(self, t)
                self.t = self.t + t
                if self.t >= 1 then
                    self:SetScript("OnUpdate", nil)
                    if IsInRaid(1) and canSend then
                        BG.SendMyWorldBossCD()
                    end
                    BG.worldBossCDFrame:UpdateFrame()
                end
            end)
        elseif event == "CHAT_MSG_ADDON" then
            local prefix, msg, distType, _, sender = ...
            if prefix == "BiaoGeWorldBoss" and distType == "RAID" then -- 插件版本
                if msg == "VersionCheck" and sender ~= player then
                    BG.SendMyWorldBossCD()
                elseif msg:find("cd%^") then
                    BG.worldBossRaidCD[sender] = BG.worldBossRaidCD[sender] or {}
                    local _, info = strsplit("^", msg)
                    if info then
                        for _, v in ipairs({ strsplit(",", info) }) do
                            local bossID, cd = strsplit(":", v)
                            bossID = tonumber(bossID)
                            cd = tonumber(cd)
                            if bossID and cd and BG.worldBossRaidCD[sender][bossID] ~= 1 then
                                BG.worldBossRaidCD[sender][bossID] = cd
                            end
                        end
                    end
                    BG.After(.2, function()
                        BG.worldBossCDFrame:UpdateFrame(sender)
                    end)
                end
            end
        elseif event == "PLAYER_ENTERING_WORLD" then
            self:UnregisterEvent("PLAYER_ENTERING_WORLD")
            C_Timer.After(4, function()
                if IsInRaid(1) then
                    C_ChatInfo.SendAddonMessage("BiaoGeWorldBoss", "VersionCheck", "RAID")
                else
                    UpdateMyWorldBossCD()
                    BG.worldBossCDFrame:UpdateFrame()
                end
            end)
        end
    end)

    BG.worldBossCDFrame:UpdateFrame()
end)

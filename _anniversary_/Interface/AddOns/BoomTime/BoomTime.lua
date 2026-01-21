--local DMW = DMW
--local boomTimeSv = DMW.Settings.profile.boomTimeSv

local _EventHandler = CreateFrame("Frame");
local function PLAYER_ENTERING_WORLD()
    _EventHandler:UnregisterEvent("PLAYER_ENTERING_WORLD");
    if not boomTimeSv then        
        boomTimeSv = {
            instance_timer_sv = { on = true, locked = false, },
            target_warn_sv = {  },
        };
    else
        boomTimeSv.instance_timer_sv.on=true;
    end
    
    boomTimeSv.target_warn_sv[UnitGUID('player')] = boomTimeSv.target_warn_sv[UnitGUID('player')] or { on = true, locked = false, };
end

_EventHandler:RegisterEvent("PLAYER_ENTERING_WORLD");
_EventHandler:SetScript("OnEvent", PLAYER_ENTERING_WORLD);

function alam_GetConfig(misc, key)
    if misc == "instance_timer" then
        return boomTimeSv.instance_timer_sv[key];
    elseif misc == "target_warn" then
        return boomTimeSv.target_warn_sv[UnitGUID('player')][key];
    end
end

local function _noop_()
	return true;
end
local instance_reset_failed_pattern = gsub(INSTANCE_RESET_FAILED, "%%s", "(.+)");
local instance_reset_success_pattern = gsub(INSTANCE_RESET_SUCCESS, "%%s", "(.+)");
-- RESET_FAILED_NOTIFY

local func = {  };
local var = {
    prev_area = nil,
    prev_in_instance = nil,
    next_reset_count_in = nil,
    next_reset_out_instance = nil,
};
local instance_timer_sv = nil;


local board = CreateFrame("Frame", nil, UIParent, "BackdropTemplate");
board:SetSize(130, 130);
-- 设置背景
-- board:SetBackdrop({
--     bgFile = "Interface/ChatFrame/ChatFrameBackground",
--     edgeFile = "Interface/ChatFrame/ChatFrameBackground",
--     tile = true,
--     edgeSize = 1,
--     tileSize = 5,
-- });
board:SetPoint("TOP");
board:Show();
board:SetMovable(true);


local title = board:CreateFontString(nil, "OVERLAY");
title:SetFont(GameFontNormal:GetFont(), 16);
title:SetPoint("TOPLEFT", board, "TOPLEFT", 22, 3 );
title:Show();
title:SetText("\124CFFFF0000爆本监控\124r ");

-- local  _title = GetZoneText()
-- local line = board:CreateFontString(nil, "OVERLAY");
-- line:SetFont(GameFontNormal:GetFont(), 16);
-- line:SetPoint("LEFT", title, "RIGHT", 0, 0);
-- line:Show();
-- line:SetText("\124cff00ff00 ".._title.."\124r");


-- 自定义
local bg_board = CreateFrame("Frame", nil, UIParent,"BackdropTemplate");
bg_board.Bg = board:CreateTexture(nil, "BACKGROUND")
bg_board.Bg:SetTexture("Interface\\LevelUp\\MinorTalents")
bg_board.Bg:SetPoint("TOP", board, "TOPLEFT", 65, 8)
bg_board.Bg:SetSize(178, 110)
bg_board.Bg:SetTexCoord(0, 300/320, 341/512, 407/512)
bg_board.Bg:SetVertexColor(1, 1, 1, 0.4)
bg_board:Show();

-- board:EnableMouse(true);
-- board:RegisterForDrag("LeftButton");

function func.lock()
    board:EnableMouse(false);
    board:SetBackdropColor(0.0, 0.0, 0.0, 0.0);
    board:SetBackdropBorderColor(0.0, 0.0, 0.0, 0.0);
    instance_timer_sv.locked = true;
end
function func.unlock()
    board:EnableMouse(true);
    board:SetBackdropColor(0.0, 0.0, 0.0, 0.5);
    board:SetBackdropBorderColor(0.0, 0.0, 0.0, 0.5);
    instance_timer_sv.locked = false;
end
function func.on()
    board:Show();
    instance_timer_sv.on = true;
end
function func.off()
    board:Hide();
    instance_timer_sv.on = false;
end

local drop_menu_table = {
    handler = _noop_,
    elements = {
        {
            handler = func.lock,
            para = {  },
            text = "锁定",
        },
        {
            handler = func.off,
            para = {  },
            text = "关闭",
        }
    },
};

board:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving();
    else
        --ALADROP(board, "BOTTOMLEFT", drop_menu_table);
    end
end);
board:SetScript("OnMouseUp", function(self, button)
    self:StopMovingOrSizing();
    instance_timer_sv.pos = { self:GetPoint(), };
    for i, v in ipairs(instance_timer_sv.pos) do
        if type(v) == 'table' then
            instance_timer_sv.pos[i] = v:GetName();
        end
    end
end);
local lines = {  };
for i = 1, 5 do
    local left = board:CreateFontString(nil, "OVERLAY");
    left:SetFont(GameFontNormal:GetFont(), 16);
    left:SetPoint("TOPLEFT", board, "TOPLEFT", 8, - 16 * (i - 0));

    -- 对齐 小于10 添加空格
    if i < 6 then
        _space = '0'
    else
        _space = ''
    end

    left:Show();
    left:SetText("\124cffffff00".._space.. i .. "\124r :");

    local line = board:CreateFontString(nil, "OVERLAY");
    line:SetFont(GameFontNormal:GetFont(), 16);
    line:SetPoint("LEFT", left, "RIGHT", 12, 0);
    line:Show();
    line:SetText("\124cff00ff00可用\124r");
    line.id = i;
    lines[i] = line;
end

function func.update_table()
    local TIME = time();
    for i = #instance_timer_sv, 1, -1 do
        if instance_timer_sv[i] < TIME then
            tremove(instance_timer_sv, i);
            print("可用重置次数+1， 目前已用：", #instance_timer_sv, "次");
        end
    end
    for i = 1, 5 do
        if instance_timer_sv[i] then
            -- 时间戳开始时间1970-01-01 08:00:00    加上 57600 是为了把时间部分取整 1970-01-02 00:00:00
            -- 减1就是为了

            lines[i]:SetText(date("\124cffff0000[%M:%S]\124r", instance_timer_sv[i] - TIME + 57600 - 1));
        else
            lines[i]:SetText("\124cff00ff00可用\124r");
        end
    end
end

function func.CHAT_MSG_SYSTEM(msg)
    local TIME = time()
    if strfind(msg, instance_reset_failed_pattern) or strfind(msg, instance_reset_success_pattern) then
        tinsert(instance_timer_sv, TIME + 3600)
        -- SendChatMessage("{rt3}当前副本已重置！{rt3}", "PARTY", nil)

        -- 计算可用次数
        local used_count = #instance_timer_sv
        local max_uses = 5  -- 假设最大允许次数是5次
        local available_count = max_uses - used_count

        if available_count > 0 then
            SendChatMessage("{rt3}当前副本已重置！{rt3}请进入副本，当前可用重置次数："..available_count.."次", "PARTY", nil)
        else
            -- 找到最短的剩余时间
            local shortest_time = math.huge
            for _, reset_time in ipairs(instance_timer_sv) do
                local remaining_time = reset_time - TIME
                if remaining_time < shortest_time then
                    shortest_time = remaining_time
                end
            end
            -- 转换为分钟和秒
            local minutes = math.floor(shortest_time / 60)
            local seconds = shortest_time % 60
            SendChatMessage("{rt3}当前副本已重置！{rt3}所有重置次数已用完，最短剩余时间："..minutes.."分钟"..seconds.."秒，请大家稍作休息。", "PARTY", nil)
        end
    elseif msg == RESET_FAILED_NOTIFY then
        var.next_reset_out_instance = true
    end
end


function func.ZONE_CHANGED_NEW_AREA()
    local is_in_instance, instance_type = IsInInstance();
    -- print('func.ZONE_CHANGED_NEW_AREA')
    -- print(is_in_instance);
    -- if var.prev_in_instance and not is_in_instance then
    --     var.next_reset_count_in = true;
    -- else
    --     var.next_reset_count_in = false;
    -- end
    if is_in_instance and (instance_type == 'party' or instance_type == 'raid') then
    --     var.prev_in_instance = true;
    -- else
    --     var.prev_in_instance = false;
        if var.next_reset_out_instance then
            var.next_reset_out_instance = nil;
            tinsert(instance_timer_sv, time() + 3600);
        end
    end
    -- print(GetZoneText(), GetRealZoneText());
    -- print(var.prev_in_instance, is_in_instance, var.next_reset_count_in)
end

-- 初始化插件通讯前缀
local addonPrefix = "BoomTimeReset"
-- 注册插件前缀
C_ChatInfo.RegisterAddonMessagePrefix(addonPrefix)
-- 发送重置时间给其他小队成员
local function SendResetTime(resetTime)
    if IsInGroup() then
        -- 将重置时间发送给所有小队成员
        C_ChatInfo.SendAddonMessage(addonPrefix, tostring(resetTime), "PARTY")
    end
end

-- 处理接收到的插件消息
local function OnAddonMessage(prefix, message, channel, sender)
    if prefix == addonPrefix and sender ~= UnitName("player") then
        local resetTime = tonumber(message)
        if resetTime then
            -- 更新本地实例计时器
            table.insert(instance_timer_sv, resetTime)
            -- 打印确认信息
            print("收到来自 " .. sender .. " 的副本重置时间。计时器已更新。")
        end
    end
end

-- 注册事件以监听插件消息
board:RegisterEvent("CHAT_MSG_ADDON")
function func.OnEvent(self, event, ...)
    if event == "CHAT_MSG_ADDON" then
        OnAddonMessage(...)
    else
        func[event](...)
    end
end

-- 处理聊天消息
local function OnChatMessage(text, sender, ...)
    if sender ~= UnitName("player") then
        if string.find(text, "副本已重置") then
            -- 获取当前时间戳
            local currentTime = time()
            -- 更新本地实例计时器
            table.insert(instance_timer_sv, currentTime + 3600)
            -- 打印确认信息
            print("检测到队长的重置通知，计时器已更新。")
        end
    end
end


function func.init()
    -- board:UnregisterEvent("PLAYER_ENTERING_WORLD");
    func.PLAYER_ENTERING_WORLD = func.ZONE_CHANGED_NEW_AREA;
    func.PLAYER_ENTERING_WORLD();
    instance_timer_sv = boomTimeSv.instance_timer_sv;
    if instance_timer_sv.locked then
        func.lock();
    else
        func.unlock();
    end
    if instance_timer_sv.on then
        func.on();
    else
        func.off();
    end
    if instance_timer_sv.pos then
        board:ClearAllPoints();
        board:SetPoint(instance_timer_sv.pos[1], 
        instance_timer_sv.pos[2], 
        instance_timer_sv.pos[3], 
        instance_timer_sv.pos[4], 
        instance_timer_sv.pos[5]
    );
    end
    -- hooksecurefunc("ResetInstances", function()
    --     if var.next_reset_count_in then
    --         var.next_reset_count_in = false;
    --         tinsert(instance_timer_sv, time() + 3600);
    --     end
    -- end);
    C_Timer.NewTicker(1.0, func.update_table);

    -- 创建一个按钮
    local reportButton = CreateFrame("Button", nil, board, "UIPanelButtonTemplate")
    reportButton:SetSize(120, 30)  -- 调整按钮的大小
    reportButton:SetPoint("BOTTOM", board, "BOTTOM", 0, 0)  -- 将其放置在面板的底部
    reportButton:SetText("发送至队伍")  -- 设置按钮文本
    reportButton:Show()

    -- 定义按钮点击事件
    reportButton:SetScript("OnClick", function()
        local TIME = time()
        local message = "爆本监控信息："
        
        -- 打印调试信息
        print("Debug: instance_timer_sv 内容: ", instance_timer_sv)
        
        for i = 1, 5 do
            if instance_timer_sv[i] then
                local remaining_time = instance_timer_sv[i] - TIME
                if remaining_time > 0 then
                    local minutes = math.floor(remaining_time / 60)
                    local seconds = remaining_time % 60
                    message = message .. "  " .. i .. ": " .. string.format("[%02d:%02d]", minutes, seconds)
                else
                    message = message .. "  " .. i .. ": 已过期"
                end
            else
                message = message .. "  " .. i .. ": 可用"
            end
        end

        -- 打印调试信息
        print("Debug: 发送信息内容: ", message)

        -- 发送信息到队伍频道
        SendChatMessage(message, "PARTY", nil)
    end)

    local resetButton = CreateFrame("Button", nil, board, "UIPanelButtonTemplate")
    resetButton:SetSize(120, 30)  -- 调整按钮的大小
    resetButton:SetPoint("TOPLEFT", reportButton, "BOTTOMLEFT", 0, -5)  -- 设置按钮的位置在 reportButton 下面
    resetButton:SetText("重置副本")  -- 设置按钮文本
    resetButton:Show()
    resetButton:SetScript("OnClick", function()
        -- 检查是否是队长
        local isLeader = UnitIsGroupLeader("player")

        -- 获取当前时间的时间戳
        local currentTime = time()

        if isLeader then
            -- 尝试重置副本
            local success = ResetInstances()
            if success then
                print("副本已成功重置")
                -- 手动更新队长的计时器
                table.insert(instance_timer_sv, currentTime + 3600)
                -- 发送重置时间给其他小队成员
                SendResetTime(currentTime + 3600)
            else 
                print("无法重置副本，请确保您在副本中并具有权限")
            end
        else
            -- 将 currentTime 添加到计时器中
            table.insert(instance_timer_sv, currentTime + 3600)  -- 3600秒代表1小时的倒计时
        end

        
        print("计时器已更新: " .. date("%Y-%m-%d %H:%M:%S", currentTime))
    end)


end

func.PLAYER_ENTERING_WORLD = func.init;

board:RegisterEvent("PLAYER_ENTERING_WORLD");
-- board:RegisterEvent("ZONE_CHANGED_NEW_AREA");
board:RegisterEvent("CHAT_MSG_SYSTEM");
board:RegisterEvent("CHAT_MSG_PARTY")
function func.OnEvent(self, event, ...)
    if event == "CHAT_MSG_ADDON" then
        OnAddonMessage(...)
    elseif event == "CHAT_MSG_PARTY" then
        OnChatMessage(...)
    else
        func[event](...)
    end
end
board:SetScript("OnEvent", func.OnEvent);

SLASH_ALAINSTANCETIMER1 = "/bt";
SlashCmdList["ALAINSTANCETIMER"] = function(msg)
    if strfind(msg, "^lock") then
        func.lock();
    elseif strfind(msg, "^unlock") then
        func.unlock();
    elseif strfind(msg, "^on") then
        func.on();
    elseif strfind(msg, "^off") then
        func.off();
    elseif strfind(msg, "^toggle_lock") then
        if instance_timer_sv.locked then
            func.unlock();
        else
            func.lock();
        end
    else
        if boomTimeSv.instance_timer_sv.on then
            func.off();
        else
            func.on();
        end
    end
end
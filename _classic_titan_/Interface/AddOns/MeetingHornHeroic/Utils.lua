-- Utils.lua
-- 工具函数

---@type MeetingHornHeroicNS
local ns = select(2, ...)

-- 工具函数命名空间
ns.Utils = {}
local Utils = ns.Utils

-- 调试函数 - 使用标记语法进行调试输出
function Utils.DebugLog(category, ...)
--[[@debug@
    print(string.format("[MHH-%s]", category or "DEBUG"), ...)
--@end-debug@]]
end

-- 简化的调试函数
function Utils.Debug(...)
--[[@debug@
    print("[MHH Debug]", ...)
--@end-debug@]]
end

-- 获取NPC的图标纹理
function Utils:GetNPCTexture(npcId)
    if not npcId then
        return "Interface/Icons/Achievement_Boss_Ragnaros"
    end
    
    -- 根据BOSS ID返回对应的图标路径
    local bossIcons = {
        [11502] = "Interface/Icons/Achievement_Boss_Ragnaros", -- 拉格纳罗斯
        [21212] = "Interface/Icons/Achievement_Boss_VashjirBattlemaiden", -- 瓦丝琪女士
        [19622] = "Interface/Icons/Achievement_Boss_Kael'ThasSunstrider_01", -- 凯尔萨斯王子
    }

    -- 如果有对应的图标路径，返回路径；否则返回默认图标
    local iconPath = bossIcons[npcId]
    if iconPath then
        return iconPath
    end

    return "Interface/Icons/Achievement_Boss_Ragnaros"
end

-- 获取团本的BOSS图标
function Utils:GetRaidBossTexture(raidData)
    if not raidData then
        return "Interface/Icons/Achievement_Boss_Ragnaros"
    end
    
    -- 优先使用自定义的团本图片（bossImage）
    if raidData.bossImage then
        return raidData.bossImage
    end

    -- 如果没有自定义图片，则使用基于bossId的图标
    if raidData.bossId then
        return self:GetNPCTexture(raidData.bossId)
    end
    
    -- 默认图标
    return "Interface/Icons/Achievement_Boss_Ragnaros"
end

-- 设置纹理并防止拉伸
function Utils:SetTextureAndPreventStretch(textureObject, texturePath)
    if not textureObject then
        return
    end
    
    textureObject:SetTexture(texturePath)
    
    -- 如果是字符串路径（而不是FileID），则设置纹理坐标防止拉伸
    if type(texturePath) == "string" then
        textureObject:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    end

    -- 设置过滤模式以获得更清晰的图像
    if textureObject.SetTexelSnappingBias then
        textureObject:SetTexelSnappingBias(0)
    end
    if textureObject.SetHorizTile then
        textureObject:SetHorizTile(false)
        textureObject:SetVertTile(false)
    end
end

-- 格式化时间显示
function Utils:FormatTimeAgo(timestamp)
    local now = GetTime()
    local diff = now - timestamp
    
    if diff < 60 then
        return string.format("%.0f秒前", diff)
    elseif diff < 3600 then
        return string.format("%.0f分钟前", diff / 60)
    elseif diff < 86400 then
        return string.format("%.1f小时前", diff / 3600)
    else
        return string.format("%.1f天前", diff / 86400)
    end
end

-- 截断长文本
function Utils:TruncateText(text, maxLength)
    if not text then return "" end
    
    local trimmed = string.gsub(text, "^%s*(.-)%s*$", "%1") -- 去除前后空格
    if string.len(trimmed) <= maxLength then
        return trimmed
    end
    
    return string.sub(trimmed, 1, maxLength - 3) .. "..."
end

-- UTF-8 安全截断：按字符数截断，不会切断多字节字符
function Utils.UTF8Sub(str, maxChars)
    if not str or str == "" then return "" end
    local len = 0
    local i = 1
    while i <= #str and len < maxChars do
        local byte = str:byte(i)
        if byte < 128 then
            i = i + 1
        elseif byte < 224 then
            i = i + 2
        elseif byte < 240 then
            i = i + 3
        else
            i = i + 4
        end
        len = len + 1
    end
    return str:sub(1, i - 1)
end
ns.UTF8Sub = Utils.UTF8Sub

-- 输入清洗：移除协议分隔符 + UTF-8 安全截断
-- blacklist: . @ ~ ; （ToProto/FromProto 的字段/成员分隔符）
function Utils.SanitizeComment(text, maxLen)
    if not text or text == "" then return "" end
    maxLen = maxLen or 50
    -- 移除协议分隔符
    local sanitized = text:gsub("[%.@~;]", "")
    -- UTF-8 安全截断
    return Utils.UTF8Sub(sanitized, maxLen)
end
ns.SanitizeComment = Utils.SanitizeComment

-- 注册工具类
ns.Utils = Utils

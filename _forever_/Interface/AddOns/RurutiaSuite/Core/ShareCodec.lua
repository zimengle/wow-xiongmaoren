local _, ns = ...
local Codec = {}
ns.ShareCodec = Codec

local NATIVE_MARKER = "~RS1~"
local MAX_CODEC_DEPTH = 32
local MAX_CODEC_ITEMS = 100000
local KEY_TYPE_ORDER = { boolean = 1, number = 2, string = 3 }

local function SortCodecKeys(left, right)
    local leftType, rightType = type(left), type(right)
    if leftType ~= rightType then
        return (KEY_TYPE_ORDER[leftType] or 99) < (KEY_TYPE_ORDER[rightType] or 99)
    end
    if leftType == "number" then return left < right end
    return tostring(left) < tostring(right)
end

local function EncodeNativeValue(value, output, seen, depth)
    if depth > MAX_CODEC_DEPTH then return nil, "分享数据嵌套过深" end
    local valueType = type(value)
    if valueType == "string" then
        output[#output + 1] = "s" .. #value .. ":" .. value
        return true
    end
    if valueType == "number" then
        if value ~= value or value == math.huge or value == -math.huge then
            return nil, "分享数据包含无效数字"
        end
        output[#output + 1] = "n" .. tostring(value) .. ";"
        return true
    end
    if valueType == "boolean" then
        output[#output + 1] = value and "b1" or "b0"
        return true
    end
    if valueType ~= "table" then
        return nil, "分享数据包含不支持的类型"
    end
    if seen[value] then return nil, "分享数据包含循环引用" end
    seen[value] = true
    local keys, key = {}, nil
    for key in pairs(value) do
        if not KEY_TYPE_ORDER[type(key)] then
            seen[value] = nil
            return nil, "分享数据包含无效键"
        end
        keys[#keys + 1] = key
        if #keys > MAX_CODEC_ITEMS then
            seen[value] = nil
            return nil, "分享数据项目过多"
        end
    end
    table.sort(keys, SortCodecKeys)
    output[#output + 1] = "t" .. #keys .. ":"
    local index = 1
    while index <= #keys do
        key = keys[index]
        local ok, reason = EncodeNativeValue(key, output, seen, depth + 1)
        if not ok then seen[value] = nil return nil, reason end
        ok, reason = EncodeNativeValue(value[key], output, seen, depth + 1)
        if not ok then seen[value] = nil return nil, reason end
        index = index + 1
    end
    seen[value] = nil
    return true
end

local function EncodeNative(value)
    local output = {}
    local ok, reason = EncodeNativeValue(value, output, {}, 1)
    if not ok then return nil, reason end
    return NATIVE_MARKER .. table.concat(output)
end

local function ReadUnsigned(text, position, delimiter)
    local finish = string.find(text, delimiter, position, true)
    if not finish then return nil, nil, "分享字符串结构损坏" end
    local raw = string.sub(text, position, finish - 1)
    if raw == "" or not string.match(raw, "^%d+$") then
        return nil, nil, "分享字符串长度无效"
    end
    local value = tonumber(raw)
    if not value or value > MAX_CODEC_ITEMS then
        return nil, nil, "分享字符串长度超限"
    end
    return value, finish + 1
end

local function DecodeNativeValue(text, position, depth)
    if depth > MAX_CODEC_DEPTH then return nil, nil, "分享字符串嵌套过深" end
    local tag = string.sub(text, position, position)
    if tag == "s" then
        local length, startAt, reason = ReadUnsigned(text, position + 1, ":")
        if not length then return nil, nil, reason end
        local finish = startAt + length - 1
        if finish > #text then return nil, nil, "分享字符串内容不完整" end
        return string.sub(text, startAt, finish), finish + 1
    end
    if tag == "n" then
        local finish = string.find(text, ";", position + 1, true)
        if not finish then return nil, nil, "分享字符串数字损坏" end
        local value = tonumber(string.sub(text, position + 1, finish - 1))
        if not value or value ~= value or value == math.huge or value == -math.huge then
            return nil, nil, "分享字符串数字无效"
        end
        return value, finish + 1
    end
    if tag == "b" then
        local value = string.sub(text, position + 1, position + 1)
        if value == "1" then return true, position + 2 end
        if value == "0" then return false, position + 2 end
        return nil, nil, "分享字符串布尔值损坏"
    end
    if tag == "t" then
        local count, nextAt, reason = ReadUnsigned(text, position + 1, ":")
        if not count then return nil, nil, reason end
        local result, index = {}, 1
        while index <= count do
            local key
            key, nextAt, reason = DecodeNativeValue(text, nextAt, depth + 1)
            if key == nil then return nil, nil, reason or "分享字符串键无效" end
            local keyType = type(key)
            if not KEY_TYPE_ORDER[keyType] then return nil, nil, "分享字符串键类型无效" end
            local value
            value, nextAt, reason = DecodeNativeValue(text, nextAt, depth + 1)
            if value == nil then return nil, nil, reason or "分享字符串值无效" end
            result[key] = value
            index = index + 1
        end
        return result, nextAt
    end
    return nil, nil, "分享字符串类型标记无效"
end

local function DecodeNative(text)
    if string.sub(text, 1, #NATIVE_MARKER) ~= NATIVE_MARKER then
        return nil, "不是 RS 内置分享字符串"
    end
    local value, nextAt, reason = DecodeNativeValue(text, #NATIVE_MARKER + 1, 1)
    if value == nil then return nil, reason end
    if nextAt ~= #text + 1 then return nil, "分享字符串包含多余内容" end
    return value
end

function Codec:EncodePayload(data, prefix)
    local encoded, reason = EncodeNative(data)
    if not encoded then return nil, reason end
    return tostring(prefix or "") .. encoded
end

function Codec:DecodePayload(text, prefix)
    prefix = tostring(prefix or "")
    if type(text) ~= "string" or #text > 262144 or text:sub(1, #prefix) ~= prefix then
        return nil, "分享字符串格式错误或超过长度限制"
    end
    local payload = string.sub(text, #prefix + 1)
    if string.sub(payload, 1, #NATIVE_MARKER) == NATIVE_MARKER then
        return DecodeNative(payload)
    end
    local transfer = ns.ConfigTransfer
    if not transfer or type(transfer.DecodeLegacyPayload) ~= "function" then
        return nil, "旧版分享解码服务不可用"
    end
    return transfer:DecodeLegacyPayload(text, prefix)
end

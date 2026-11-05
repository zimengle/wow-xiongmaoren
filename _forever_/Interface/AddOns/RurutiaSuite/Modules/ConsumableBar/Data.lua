-- 文件职责：按需展开当前端消耗品目录，提供不展开数据的可用性查询。
local _, ns = ...

local H = ns.ConsumableBarDataHelpers
local dataSets = ns.ConsumableBarDataSets
local loaders = ns.ConsumableBarDataLoaders
if type(H) ~= "table" or type(dataSets) ~= "table" or type(loaders) ~= "table" then
    error("ConsumableBar data parts must load before Data.lua", 2)
end

local keyToExpansion = {
    era = H.EXP_ERA,
    forever = H.EXP_FOREVER,
    tbc = H.EXP_TBC,
    wrath = H.EXP_WLK,
    cata = H.EXP_CATA,
    mists = H.EXP_MOP,
    titan = H.EXP_TITAN,
}

local Data = {
    helpers = H,
    dataSets = dataSets,
    keyToExpansion = keyToExpansion,
}

-- 已编写目录的键；Wrath/Titan 仍是空占位，不能仅凭 loader 存在启用。
local authoredKeys = { forever = true, era = true, tbc = true, cata = true, mists = true }

function Data.IsAvailable(key)
    local expansion = keyToExpansion[key]
    return authoredKeys[key] == true and expansion ~= nil
        and (dataSets[expansion] ~= nil or type(loaders[expansion]) == "function")
end

function Data.LoadByExpansion(expansion)
    if dataSets[expansion] ~= nil then return dataSets[expansion] end
    local loader = loaders[expansion]
    if type(loader) == "function" then
        loaders[expansion] = nil
        loader()
    end
    return dataSets[expansion]
end

function Data.GetByExpansion(expansion)
    return Data.LoadByExpansion(expansion)
end

function Data.GetByKey(key)
    local expansion = keyToExpansion[key]
    return expansion and Data.LoadByExpansion(expansion) or nil, expansion
end

function Data.GetKeys(result)
    result = result or {}
    local key
    for key in pairs(result) do
        result[key] = nil
    end
    for key in pairs(keyToExpansion) do
        result[#result + 1] = key
    end
    table.sort(result)
    return result
end

ns.ConsumableBarDataRegistry = Data

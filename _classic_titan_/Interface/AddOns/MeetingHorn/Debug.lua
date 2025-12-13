-- Debug.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 5/26/2021, 3:43:12 PM
--
---@type ns
local ns = select(2, ...)

function SBK()
    ns.LFG:SendServer('SBK', '卡拉赞', 111, 661, 50, ns.UnitFullName('player'), UnitGUID('player'), nil, nil,
                      ns.ADDON_VERSION, 'master')
end

function SGL()
    ns.GoodLeader:SendServer('SGL', ns.UnitFullName('player'), UnitGUID('player'))
end

function GG()
    for n, v in pairs(ns.INSTANCE_DATA) do
        if v.projectId == WOW_PROJECT_ID then
            ns.Grade.db[n] = {
                raidName = n,
                leader = ns.UnitFullName('player') .. '1',
                leaderGuid = UnitGUID('player'),
                timestamp = time(),
            }
        end
    end
    ns.Grade:GROUP_ROSTER_UPDATE()
end

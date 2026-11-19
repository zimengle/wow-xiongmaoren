local H = HuZhuLayer

-- 只展示公会名。空着的格子不显示。先只填普通部落。
H.GUILD_REC = {
  { key = "PvE|Horde", guild = "情 与 酒" },
}

local function Ruleset()
  if not (C_GameRules and C_GameRules.IsGameRuleActive and Enum and Enum.GameRule) then
    return nil
  end
  local function on(rule)
    if not rule then
      return false
    end
    local ok, v = pcall(C_GameRules.IsGameRuleActive, rule)
    return ok and v and true or false
  end
  if on(Enum.GameRule.HardcoreRuleset) then
    return "HC"
  end
  local pvp = on(Enum.GameRule.PvPRuleset)
  local rp = on(Enum.GameRule.RPRuleset)
  if pvp and rp then
    return "RPPvP"
  end
  if pvp then
    return "PvP"
  end
  if rp then
    return "RP"
  end
  return "PvE"
end

local function Faction()
  local f = UnitFactionGroup and UnitFactionGroup("player")
  if f == "Horde" or f == "Alliance" then
    return f
  end
  return nil
end

function H:GuildRecSlot()
  if not (self.IsForeverClient and self:IsForeverClient()) then
    return nil
  end
  local rs, fac = Ruleset(), Faction()
  if not rs or not fac then
    return nil
  end
  local key = rs .. "|" .. fac
  for _, slot in ipairs(self.GUILD_REC or {}) do
    if slot.key == key and type(slot.guild) == "string" and slot.guild ~= "" then
      return slot
    end
  end
  return nil
end

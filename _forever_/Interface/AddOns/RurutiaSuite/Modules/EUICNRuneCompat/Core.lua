-- 文件职责：持有国服符文兼容的配置与 Runtime 生命周期；第三方行为由 Retail Integration 提供。
local _, ns = ...
if not ns.Build.HasModule("EUICNRuneCompat") then return end
local Adapter = ns.EUICNRuneAdapter
if not Adapter then return end -- 当前 Build 禁用 provider 时不注册依赖它的模块。
local Definition = {
    activationGate = "PluginEnhancements",
    databaseName = "EUICNRuneCompat",
    defaultEnabled = true,
    defaults = { profile = { enabled = true } },
}

function Definition:Initialize()
    local profile = self.db.profile
    if not profile.sourceDefaultsMigrated then
        local version = ns.DB.sourceVersion
        local major, minor, patch
        if type(version) == "string" then major, minor, patch = version:match("^(%d+)%.(%d+)%.(%d+)") end
        -- Released legacy 3.9.69 enabled this by default; an omitted AceDB leaf is not an opt-out.
        if tonumber(major) == 3 and (tonumber(minor) > 9 or (tonumber(minor) == 9 and tonumber(patch) >= 69))
            and rawget(profile, "enabled") == nil then profile.enabled = true end
        profile.sourceDefaultsMigrated = true
    end
    -- Beacon labels stay with the module. The ExtraTools checkbox only gates CN rune replacement.
    if not profile.beaconIndependent then
        ns.Assembly:SetModuleConfigured("EUICNRuneCompat", true)
        profile.beaconIndependent = true
    end
end

Definition.ProfileChanged = Definition.Initialize

function Definition:GetProvider() return Adapter:GetProvider() end

function Definition:TryInstall()
    if not self.compat then return end
    if InCombatLockdown() then self.compat:RequestRefresh(); return end
    if self.compat:Install() then
        self:UnregisterEvent("ADDON_LOADED")
        self:UnregisterEvent("PLAYER_LOGIN")
    end
end

function Definition:AfterLoad()
    if self.startupTimer then return end
    self.startupTimer = self:Schedule(0.01, function(module)
        module.startupTimer = nil
        module:TryInstall()
    end, "EUI CN rune startup")
end

function Definition:OnAddonLoaded(_, name)
    if name == Adapter.addonName or name == "EllesmereUI" then self:AfterLoad() end
end

function Definition:IsRuneCompatEnabled()
    return self.db and self.db.profile.enabled == true
end

function Definition:Enable()
    if not Adapter:IsSupported() then return end
    self.compat = self.compatCache or Adapter:New()
    self.compatCache = self.compat
    self.compat.active = true
    self.compat.owner = self
    self:RegisterEvent("PLAYER_REGEN_ENABLED", self.TryInstall)
    self:RegisterEvent("ADDON_RESTRICTION_STATE_CHANGED", self.TryInstall)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.TryInstall)
    self:RegisterEvent("ADDON_LOADED", self.OnAddonLoaded)
    self:RegisterEvent("PLAYER_LOGIN", self.AfterLoad)
    self:AfterLoad()
end

function Definition:Disable()
    if self.compat then self.compat:Stop(); self.compat = nil end
    self.startupTimer = nil
end

function Definition:SetFeatureEnabled(enabled)
    if InCombatLockdown() or (enabled and not self:GetProvider()) then return false end
    self.db.profile.enabled = enabled and true or false
    if self.compat then self.compat:RequestRefresh() end
    return true
end

ns.EUICNRuneCompat = ns.RegisterModule("EUICNRuneCompat", Definition)

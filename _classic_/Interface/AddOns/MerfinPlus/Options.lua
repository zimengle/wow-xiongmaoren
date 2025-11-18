-- MerfinPlus Options & Media Registration
-- Comments in English as requested.

local _, MerfinPlus = ...

local AceDB             = LibStub("AceDB-3.0")
local AceDBOptions      = LibStub("AceDBOptions-3.0")
local AceConfig         = LibStub("AceConfig-3.0")
local AceConfigDialog   = LibStub("AceConfigDialog-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConsole        = LibStub("AceConsole-3.0")
local LSM               = LibStub("LibSharedMedia-3.0")

local GetAddOnMetadata  = C_AddOns.GetAddOnMetadata

local L = GetLocale()

MerfinPlus.GetDefaultFont = function(type)
    if type == 'bold' then
        return (L == 'zhTW' or L == 'zhCN') and 'CN Merged (SF-Yahee)' or 'SFUIDisplayCondensed-Bold'
    else
        return (L == 'zhTW' or L == 'zhCN') and 'CN Merged (SF-Yahee)' or 'SFUIDisplayCondensed-Semibold'
    end
end

Merfin.GetDefaultFont = MerfinPlus.GetDefaultFont

MerfinPlus.defaults = {
    profile = {
        pullStartTime  = 0,
        pullExpTime    = 0,
        pullTotalTime  = 0,
        pullSenderName = 'Unknown',
        breakStartTime = 0,
        breakExpTime   = 0,
        breakTotalTime = 0,
        breakSenderName= 'Unknown',
        lfgStartTimer  = 0,
        lfgExpTimer    = 0,

        font1 = MerfinPlus.GetDefaultFont(),
        font2 = MerfinPlus.GetDefaultFont('bold'),
        font3 = MerfinPlus.GetDefaultFont(),
        font4 = MerfinPlus.GetDefaultFont('bold'),
        bar1  = "MerfinMainDark",
        bar2  = "MerfinMain",
        bar3  = "MerfinMainDark",

        raid = {
            general = {}, -- shared settings for all raids
            mv  = {},     -- Mogu'shan Vaults
            hof = {},     -- Heart of Fear
            toes= {},     -- Terrace of Endless Spring
        },
    }
}

-- Helper to access the active profile table safely
function MerfinPlus:GetDB()
    return (self.db and self.db.profile) or MerfinPlus.defaults.profile
end

-- Build and register all options (Blizzard panels + standalone window + slash commands)
function MerfinPlus:SetupOptions()
    local version = GetAddOnMetadata("MerfinPlus", "Version") or "?"

    -- ==== Media lists (LSM) ====
    local function GetFontList()
        local fonts = {}
        local excluded = {
            ["Merfin Font 1"] = true,
            ["Merfin Font 2"] = true,
            ["Merfin Raid Font"] = true,
            ["Merfin Raid Font (Bold)"] = true,
        }
        for name in pairs(LSM:HashTable("font")) do
            if not excluded[name] then
                fonts[name] = name
            end
        end
        return fonts
    end

    local function GetStatusBarList()
        local bars = {}
        local excluded = {
            ["Merfin Status Bar 1"] = true,
            ["Merfin Status Bar 2"] = true,
            ["Merfin Raid Status Bar"] = true,
        }
        for name in pairs(LSM:HashTable("statusbar")) do
            if not excluded[name] then
                bars[name] = name
            end
        end
        return bars
    end

    -- ==== UI reload popup ====
    local function ConfirmReload()
        StaticPopupDialogs["MERFINPLUS_RELOAD_UI"] = {
            text = "A reload of the interface is required for this change to take effect.\n\nReload now?",
            button1 = "Yes",
            button2 = "No",
            OnAccept = function() ReloadUI() end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
        StaticPopup_Show("MERFINPLUS_RELOAD_UI")
    end

    -- ==== Root (Blizzard top-level) ====
    local mainOptions = {
        type = "group",
        name = "MerfinPlus v" .. version,
        args = {
            version = {
                type = "description",
                name = "|cff00ccffVersion:|r " .. version,
                fontSize = "medium",
                order = 1
            },
            author = {
                type = "description",
                name = "Author: Merfin",
                fontSize = "medium",
                order = 2
            },
            spacer = { type = "description", name = " ", order = 3 },
            description = {
                type = "description",
                name = "MerfinPlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other Merfin UI components.",
                fontSize = "large",
                order = 4,
            },
            spacer2 = { type = "description", name = " ", order = 5 },
        },
    }

    -- ==== Media ====
    local mediaOptions = {
        type = "group",
        name = "Media",
        args = {
            description = {
                type = "description",
                name = "Change primary fonts and status bar textures used by Merfin features. A UI reload is required.",
                fontSize = "medium",
                order = 0,
            },
        },
    }

    local fontNames = { "Merfin Font 1", "Merfin Font 2", "Merfin Raid Font", "Merfin Raid Font (Bold)"}
    local barNames  = { "Merfin Status Bar 1", "Merfin Status Bar 2", "Merfin Raid Status Bar" }

    for i = 1, #fontNames do
        mediaOptions.args["font" .. i] = {
            type = "select",
            name = fontNames[i],
            desc = "Select font for element " .. i,
            values = GetFontList,
            get = function() return self.db.profile["font" .. i] end,
            set = function(_, v) self.db.profile["font" .. i] = v; ConfirmReload() end,
            dialogControl = "LSM30_Font",
            order = i + 1,
        }
    end
    for i = 1, #barNames do
        mediaOptions.args["bar" .. i] = {
            type = "select",
            name = barNames[i],
            desc = "Select status bar texture for element " .. i,
            values = GetStatusBarList,
            get = function() return self.db.profile["bar" .. i] end,
            set = function(_, v) self.db.profile["bar" .. i] = v; ConfirmReload() end,
            dialogControl = "LSM30_Statusbar",
            order = i + 10,
        }
    end

    -- ==== Raid Configs (tabs) ====
    local raidOptions = {
        type = "group",
        name = "Raid Configs",
        childGroups = "tab",
        args = {
            General = {
                type = "group",
                name = "General",
                order = 1,
                args = {
                    header = { type = "header", name = "Global settings for all raids", order = 1 },
                    note   = {
                        type = "description",
                        name = "Place core options here that apply across all raids. Specific raid tabs can override them.",
                        fontSize = "medium",
                        order = 2,
                    },
                    -- Examples for future:
                    -- enableAll = {
                    --     type = "toggle",
                    --     name = "Enable raid features",
                    --     get = function() return MerfinPlus.db.profile.raid.general.enableAll or false end,
                    --     set = function(_, v) MerfinPlus.db.profile.raid.general.enableAll = v end,
                    --     order = 10,
                    -- },
                },
            },
            MV = {
                type = "group",
                name = "Mogu'shan Vaults",
                order = 10,
                args = {
                    note = { type = "description", name = "Add MV-specific options here.", order = 1 },
                },
            },
            HoF = {
                type = "group",
                name = "Heart of Fear",
                order = 20,
                args = {
                    note = { type = "description", name = "Add HoF-specific options here.", order = 1 },
                },
            },
            ToES = {
                type = "group",
                name = "Terrace of Endless Spring",
                order = 30,
                args = {
                    note = { type = "description", name = "Add ToES-specific options here.", order = 1 },
                },
            },
        },
    }

    -- ==== Profiles (AceDB) ====
    local profilesOptions = AceDBOptions:GetOptionsTable(self.db)
    profilesOptions.name = "Profiles" -- ensure the node has a name

    -- ==== Register Blizzard panels (left AddOns pane) ====
    AceConfigRegistry:RegisterOptionsTable("MerfinPlus", mainOptions)
    self.optionsFrame = AceConfigDialog:AddToBlizOptions("MerfinPlus", "MerfinPlus v" .. version)

    AceConfigRegistry:RegisterOptionsTable("MerfinPlus_Media", mediaOptions)
    AceConfigDialog:AddToBlizOptions("MerfinPlus_Media", "Media", "MerfinPlus v" .. version)

    AceConfigRegistry:RegisterOptionsTable("MerfinPlus_RaidConfigs", raidOptions)
    AceConfigDialog:AddToBlizOptions("MerfinPlus_RaidConfigs", "Raid Configs", "MerfinPlus v" .. version)

    AceConfigRegistry:RegisterOptionsTable("MerfinPlus_Profiles", profilesOptions)
    AceConfigDialog:AddToBlizOptions("MerfinPlus_Profiles", "Profiles", "MerfinPlus v" .. version)

    -- ==== Standalone window (own AceConfigDialog frame) ====
    -- IMPORTANT: include whole profilesOptions object, not just .args, to keep its handler intact.
    local standaloneOptions = {
        type = "group",
        name = "MerfinPlus v" .. version,
        childGroups = "tree",
        args = {
            media = (function()
                mediaOptions.order = 10
                mediaOptions.childGroups = nil
                return mediaOptions
            end)(),
            raid = (function()
                raidOptions.order = 20
                raidOptions.childGroups = "tab"
                return raidOptions
            end)(),
            profiles = (function()
                profilesOptions.order = 100
                return profilesOptions
            end)(),
        },
    }

    AceConfigRegistry:RegisterOptionsTable("MerfinPlus_Standalone", standaloneOptions)

    -- Toggle standalone and optionally preselect section/subtab
    function MerfinPlus:ToggleStandalone(which, sub)
        local ACD = AceConfigDialog
        if ACD.OpenFrames and ACD.OpenFrames["MerfinPlus_Standalone"] then
            ACD:Close("MerfinPlus_Standalone")
        else
            ACD:Open("MerfinPlus_Standalone")
        end
        if which == "media" or which == "raid" or which == "profiles" then
            if which == "raid" and sub then
                ACD:SelectGroup("MerfinPlus_Standalone", "raid", sub)
            else
                ACD:SelectGroup("MerfinPlus_Standalone", which)
            end
        end
    end

    -- ==== Slash commands ====
    local function _norm(msg)
        return strlower(strtrim(msg or ""))
    end

    -- /merfinplus [media|raid [MV|HoF|ToES|General]|profiles]
    AceConsole:RegisterChatCommand("merfinplus", function(msg)
        msg = _norm(msg)
        local which, sub = strmatch(msg, "^(%S+)%s+(%S+)$")
        which = which or msg
        if which == "media" or which == "profiles" then
            MerfinPlus:ToggleStandalone(which)
        elseif which == "raid" then
            if sub == "mv" then sub = "MV"
            elseif sub == "hof" then sub = "HoF"
            elseif sub == "toes" then sub = "ToES"
            elseif sub == "general" then sub = "General"
            else sub = nil end
            MerfinPlus:ToggleStandalone("raid", sub)
        else
            MerfinPlus:ToggleStandalone(nil)
        end
    end)

    AceConsole:RegisterChatCommand("mp", function(msg)
        msg = _norm(msg)
        local which, sub = strmatch(msg, "^(%S+)%s+(%S+)$")
        which = which or msg
        if which == "media" or which == "profiles" then
            MerfinPlus:ToggleStandalone(which)
        elseif which == "raid" then
            if sub == "mv" then sub = "MV"
            elseif sub == "hof" then sub = "HoF"
            elseif sub == "toes" then sub = "ToES"
            elseif sub == "general" then sub = "General"
            else sub = nil end
            MerfinPlus:ToggleStandalone("raid", sub)
        else
            MerfinPlus:ToggleStandalone(nil)
        end
    end)
end

-- ==== Media registration ====
function MerfinPlus:RegisterCustomFonts()
    local db = self:GetDB()
    local fonts = {
        { key = "font1", name = "Merfin Font 1" },
        { key = "font2", name = "Merfin Font 2" },
        { key = "font3", name = "Merfin Raid Font" },
        { key = "font4", name = "Merfin Raid Font (Bold)" },
    }
    for _, f in ipairs(fonts) do
        local path = LSM:Fetch("font", db[f.key], true)
        if path then
            LSM:Register("font", f.name, path,
                LSM.LOCALE_BIT_western + LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_koKR + LSM.LOCALE_BIT_zhCN + LSM.LOCALE_BIT_zhTW)
        else
            -- print(string.format("|cffff0000[MerfinPlus]|r Failed to register %s - invalid font path", f.name))
        end
    end
end

function MerfinPlus:RegisterCustomBars()
    local db = self:GetDB()
    local bars = {
        { key = "bar1", name = "Merfin Status Bar 1" },
        { key = "bar2", name = "Merfin Status Bar 2" },
        { key = "bar3", name = "Merfin Raid Status Bar" },
    }
    for _, b in ipairs(bars) do
        local path = LSM:Fetch("statusbar", db[b.key], true)
        if path then
            LSM:Register("statusbar", b.name, path)
        else
            -- print(string.format("|cffff0000[MerfinPlus]|r Failed to register %s - invalid status bar path", b.name))
        end
    end
end

-- Mirror current selection under alias names for other addons/WA to consume
function MerfinPlus:RegisterMediaAliasesFromCallback()
    local db = self:GetDB()

    local fontMap = {
        { key = db.font1, alias = "Merfin Font 1" },
        { key = db.font2, alias = "Merfin Font 2" },
        { key = db.font3, alias = "Merfin Raid Font" },
        { key = db.font4, alias = "Merfin Raid Font (Bold)" },
    }
    local barMap = {
        { key = db.bar1, alias = "Merfin Status Bar 1" },
        { key = db.bar2, alias = "Merfin Status Bar 2" },
        { key = db.bar3, alias = "Merfin Raid Status Bar" },
    }

    LSM.RegisterCallback(self, "LibSharedMedia_Registered", function(_, mediatype, key)
        if mediatype == "font" then
            for _, e in ipairs(fontMap) do
                if e.key == key then
                    local path = LSM:Fetch("font", e.key)
                    if path then
                        LSM:Register("font", e.alias, path,
                            LSM.LOCALE_BIT_western + LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_koKR + LSM.LOCALE_BIT_zhCN + LSM.LOCALE_BIT_zhTW)
                    end
                end
            end
        elseif mediatype == "statusbar" or mediatype == "statusbar_atlas" then
            for _, e in ipairs(barMap) do
                if e.key == key then
                    local path = LSM:Fetch("statusbar", e.key)
                    if path then
                        LSM:Register("statusbar", e.alias, path)
                    end
                end
            end
        end
    end)
end
--[[
$Id: Compatibility.lua 1 2024-01-30 00:00:00Z compatibility $
]]
--[[
 Compatibility Layer for Classic/WotLK Classic
    This file provides compatibility fixes for libraries and APIs that may not
    exist or work differently in Classic/WotLK Classic versions.
    
    This approach keeps library files clean and makes compatibility fixes
    centralized and maintainable.
]]

-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local pairs = _G.pairs
local type = _G.type

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-- Determine WoW TOC Version
local WoWClassicEra, WoWClassicTBC, WoWWOTLKC
local wowversion = select(4, _G.GetBuildInfo())
if wowversion < 20000 then
    WoWClassicEra = true
elseif wowversion < 30000 then 
    WoWClassicTBC = true
elseif wowversion < 40000 then 
    WoWWOTLKC = true
end

-- Only apply compatibility fixes for Classic versions
if not (WoWClassicEra or WoWClassicTBC or WoWWOTLKC) then
    return
end

-----------------------------------------------------------------------
-- LibDialog-1.0 Compatibility Fix
-----------------------------------------------------------------------
-- StaticPopup_DisplayedFrames may not exist in Classic/WotLK Classic
-- We create a safe wrapper that returns an empty table if it doesn't exist

local function FixLibDialog()
    -- Create a safe StaticPopup_DisplayedFrames if it doesn't exist
    -- This ensures LibDialog won't error when trying to access it
    if not _G.StaticPopup_DisplayedFrames then
        _G.StaticPopup_DisplayedFrames = {}
    end
    
    -- Also ensure it's a table
    if type(_G.StaticPopup_DisplayedFrames) ~= "table" then
        _G.StaticPopup_DisplayedFrames = {}
    end
    
    -- Note: In Lua 5.1 (WoW Classic), # operator on empty table returns 0
    -- So we don't need a metatable for __len
end

-----------------------------------------------------------------------
-- InterfaceOptionsFrame Compatibility Fix
-----------------------------------------------------------------------
-- InterfaceOptionsFrame may not exist in Classic/WotLK Classic
-- The fixes in Config.lua already handle this with _G checks
-- This is just a placeholder for future compatibility fixes if needed

-----------------------------------------------------------------------
-- Initialize Compatibility Layer
-----------------------------------------------------------------------
local function InitializeCompatibility()
    -- Fix LibDialog immediately (before it's used)
    FixLibDialog()
    
    -- InterfaceOptions fixes are handled in Config.lua with _G checks
end

-- Run compatibility fixes as early as possible
-- This needs to run before LibDialog is loaded, so we do it immediately
InitializeCompatibility()


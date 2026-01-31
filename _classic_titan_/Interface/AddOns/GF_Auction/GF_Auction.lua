--[[
    GF_Auction - Main Addon File
    Auction House Enhancement Addon for Titan Reforged
    
    Copyright (c) 2025 GuFeng. All Rights Reserved.
    
    This software is proprietary and confidential. Unauthorized copying, 
    modification, distribution, or use of this software, via any medium, 
    is strictly prohibited without the express written permission of the author.
    
    This addon is independently developed and does not copy code from other addons.
    Similarities with other auction addons are due to:
    1. Standard WoW API usage (GetAuctionItemInfo, etc.)
    2. Common programming patterns for auction house addons
    3. Similar functional requirements (price history, auto-fill, etc.)
    
    Author: GuFeng
    Version: 2.0.0
]]

local addonName = "GF_Auction"
local addonDisplayName = "GF Auction"

-- Create main addon table
GF_Auction = GF_Auction or {}
local Addon = GF_Auction

_G.SlashCmdList = _G.SlashCmdList or {}

-- Addon metadata
Addon.version = "2.0.0"
Addon.name = addonDisplayName
Addon.modules = {}
Addon.initialized = false

-- Local references
local L = nil

-- Print function
local function Print(msg, r, g, b)
    r, g, b = r or 0.0, g or 1.0, b or 1.0
    DEFAULT_CHAT_FRAME:AddMessage(string.format("|cff00ff00[%s]|r %s", Addon.name, tostring(msg)), r, g, b)
end

Addon.Print = Print

-- Register module
function Addon:RegisterModule(name, module)
    if not name or not module then
        return false
    end
    
    if self.modules[name] then
        return false
    end
    
    self.modules[name] = module
    return true
end

-- Get module
function Addon:GetModule(name)
    if not name then
        return nil
    end
    return self.modules[name]
end

function Addon:NotifyFavoritesChanged(itemID)
    local PricePanel = self:GetModule("PricePanel")
    if PricePanel and PricePanel.OnFavoritesChanged then
        pcall(PricePanel.OnFavoritesChanged, PricePanel, itemID)
    end

    local FavoritePanel = self:GetModule("FavoritePanel")
    if FavoritePanel then
        if FavoritePanel.RequestUpdateList then
            pcall(FavoritePanel.RequestUpdateList, FavoritePanel)
        elseif FavoritePanel.UpdateList then
            pcall(FavoritePanel.UpdateList, FavoritePanel)
        end
    end
end

-- Initialize addon
local function Initialize()
    if Addon.initialized then
        return
    end
    
    -- Load locale
    L = GF_Auction_L
    if not L then
        return
    end
    
    -- Load core modules
    local success, err = pcall(function()
        -- Database module
        local Database = Addon:GetModule("Database")
        if not Database then
            error("Database module not found")
        end
        
        if not Database:Initialize() then
            error("Failed to initialize database")
        end
        
        -- EventManager module
        local EventManager = Addon:GetModule("EventManager")
        if EventManager then
            if not EventManager:Initialize() then
                error("Failed to initialize event manager")
            end
        end
        
        -- PriceHistory module
        local PriceHistory = Addon:GetModule("PriceHistory")
        if PriceHistory and not PriceHistory:Initialize() then
            error("Failed to initialize price history")
        end

        -- Skin module
        local Skin = Addon:GetModule("Skin")
        if Skin and Skin.Initialize then
            Skin:Initialize()
        end
        
        -- MainFrame module
        local MainFrame = Addon:GetModule("MainFrame")
        if MainFrame and not MainFrame:Initialize() then
            error("Failed to initialize main frame")
        end
        
        -- PricePanel module
        local PricePanel = Addon:GetModule("PricePanel")
        if PricePanel and not PricePanel:Initialize() then
            error("Failed to initialize price panel")
        end

        -- FavoritePanel module
        local FavoritePanel = Addon:GetModule("FavoritePanel")
        if FavoritePanel and not FavoritePanel:Initialize() then
            error("Failed to initialize favorite panel")
        end
        
        -- ItemSelector module
        local ItemSelector = Addon:GetModule("ItemSelector")
        if ItemSelector and not ItemSelector:Initialize() then
            error("Failed to initialize item selector")
        end
        
        -- Buyer module
        local Buyer = Addon:GetModule("Buyer")
        if Buyer and not Buyer:Initialize() then
            error("Failed to initialize buyer")
        end

        -- Tooltip module
        local Tooltip = Addon:GetModule("Tooltip")
        if Tooltip and not Tooltip:Initialize() then
            error("Failed to initialize tooltip")
        end
        
    end)
    
    if not success then
        -- Only show critical errors
        return
    end
    
    Addon.initialized = true
end

-- Event handler
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")

eventFrame:SetScript("OnEvent", function(self, event, addon)
    if event == "ADDON_LOADED" and addon == addonName then
        C_Timer.After(0.1, Initialize)
        
        self:UnregisterEvent("ADDON_LOADED")
    end
end)



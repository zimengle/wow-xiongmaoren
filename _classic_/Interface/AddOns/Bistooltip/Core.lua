BistooltipAddon = LibStub("AceAddon-3.0"):NewAddon("Bis-Tooltip")
--local AceAddon =

Bistooltip_char_equipment = {}

local function createEquipmentWatcher()
    local frame = CreateFrame("Frame")
    frame:Hide()

    frame:SetScript("OnEvent", frame.Show)
    frame:RegisterEvent("BAG_UPDATE")

    local flag = false

    frame:SetScript("OnUpdate", function(self)
        self:Hide()
        if flag == false then
            flag = true
            local collection = {}
            for bag = 0, NUM_BAG_SLOTS do
                for slot = 1, C_Container.GetContainerNumSlots(bag) do
                    local itemID = C_Container.GetContainerItemID(bag, slot)
                    if itemID ~= nil then
                        collection[itemID] = 1
                    end
                end
            end
            for i=0,18 do
                local itemID = GetInventoryItemID("player", i)
                if itemID ~= nil then
                    collection[itemID] = 2
                end
            end
            Bistooltip_char_equipment = collection
            flag = false
        end
    end)
end

function BistooltipAddon:OnInitialize()
    createEquipmentWatcher()
    BistooltipAddon.AceAddonName = "Bis-Tooltip |cff20FF9E谷|r|cff18FF9B风|r|cff10FF99修|r|cff08FF97复|r|cff00FF96版|r"
    BistooltipAddon.AddonNameAndVersion = "Bis-Tooltip v9.08"
    BistooltipAddon:initConfig()
    BistooltipAddon:addMapIcon()
    BistooltipAddon:initBislists()
    BistooltipAddon:initBisTooltip()
end

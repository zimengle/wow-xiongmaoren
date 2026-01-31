-- GF_Auction Skin Adapter (Blizzard / ElvUI / NDui)

local Skin = {}

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("Skin", Skin)
end

local function GetActiveSkin()
    if _G.ElvUI then
        return "ElvUI"
    end
    if _G.NDui then
        return "NDui"
    end
    return "Blizzard"
end

local function GetElvUI()
    if not _G.ElvUI then return nil end
    local ok, E = pcall(function()
        return (unpack(_G.ElvUI))
    end)
    if not ok or not E then return nil end
    return E
end

local function GetElvUISkins()
    local E = GetElvUI()
    if not E or not E.GetModule then return nil end
    local ok, S = pcall(function()
        return E:GetModule("Skins")
    end)
    if not ok then return nil end
    return S
end

local function GetNDui()
    if not _G.NDui then return nil end
    local ok, B = pcall(function()
        return (unpack(_G.NDui))
    end)
    if not ok or not B then return nil end
    return B
end

function Skin:Initialize()
    return true
end

function Skin:ApplyMainFrame(mainFrame, tabs)
    if not mainFrame or mainFrame.__GFA_Skinned then
        return
    end

    local skin = GetActiveSkin()

    if skin == "ElvUI" then
        local S = GetElvUISkins()
        if S and mainFrame.StripTextures and (mainFrame.CreateBackdrop or mainFrame.SetTemplate) then
            pcall(function()
                S:HandleFrame(mainFrame, true)
            end)
        end

        if mainFrame.closeBtn and S then
            pcall(function()
                S:HandleCloseButton(mainFrame.closeBtn)
            end)
        end

        if tabs and S then
            for _, tab in pairs(tabs) do
                if tab then
                    if tab.bg then tab.bg:Hide() end
                    if tab.border then tab.border:Hide() end
                    pcall(function()
                        S:HandleButton(tab, true)
                    end)
                end
            end
        end

        mainFrame.__GFA_Skinned = true
        mainFrame.__GFA_SkinName = "ElvUI"
        return
    end

    if skin == "NDui" then
        local B = GetNDui()
        if B and mainFrame.SetBackdrop then
            pcall(function()
                mainFrame:SetBackdrop(nil)
                if B.SetBD then
                    B.SetBD(mainFrame)
                elseif B.CreateBD then
                    B.CreateBD(mainFrame)
                end
            end)
        end

        if mainFrame.closeBtn and B then
            pcall(function()
                B.ReskinClose(mainFrame.closeBtn, mainFrame, -6, -6)
            end)
        end

        if tabs and B then
            for _, tab in pairs(tabs) do
                if tab then
                    if tab.bg then tab.bg:Hide() end
                    if tab.border then tab.border:Hide() end
                    pcall(function()
                        B.Reskin(tab)
                    end)
                end
            end
        end

        mainFrame.__GFA_Skinned = true
        mainFrame.__GFA_SkinName = "NDui"
        return
    end

    mainFrame.__GFA_Skinned = true
    mainFrame.__GFA_SkinName = "Blizzard"
end

function Skin:ApplyPricePanel(priceContentFrame)
    if not priceContentFrame or priceContentFrame.__GFA_Skinned then
        return
    end
    local skin = GetActiveSkin()

    if skin == "ElvUI" then
        local S = GetElvUISkins()
        local itemFrame = priceContentFrame.itemFrame
        local listBtn = itemFrame and itemFrame.listBtn
        local buyBtn = itemFrame and itemFrame.buyBtn
        local stackSizeInput = itemFrame and itemFrame.stackSizeInput
        local numStacksInput = itemFrame and itemFrame.numStacksInput
        local stackSizeMaxBtn = itemFrame and itemFrame.stackSizeMaxBtn
        local numStacksMaxBtn = itemFrame and itemFrame.numStacksMaxBtn
        local copyBox = itemFrame and itemFrame.copyBox
        local work = priceContentFrame.auctionWorkFrame
        local historyFrame = priceContentFrame.historyFrame
        local scrollFrame = historyFrame and historyFrame.scrollFrame
        local scrollBar = scrollFrame and scrollFrame.ScrollBar
        local switchBtn = itemFrame and itemFrame.switchBtn
        local inventoryBtn = itemFrame and itemFrame.inventoryBtn
        local browseBtn = itemFrame and itemFrame.browseBtn
        local noDataFavBtn = priceContentFrame and priceContentFrame.noDataFavBtn
        if S and listBtn then
            pcall(function()
                S:HandleButton(listBtn, true)
            end)
        end
        if S and buyBtn then
            pcall(function()
                S:HandleButton(buyBtn, true)
            end)
        end
        if S and stackSizeInput then
            pcall(function()
                S:HandleEditBox(stackSizeInput)
            end)
        end
        if S and numStacksInput then
            pcall(function()
                S:HandleEditBox(numStacksInput)
            end)
        end
        if S and stackSizeMaxBtn then
            pcall(function()
                S:HandleButton(stackSizeMaxBtn, true)
            end)
        end
        if S and numStacksMaxBtn then
            pcall(function()
                S:HandleButton(numStacksMaxBtn, true)
            end)
        end
        if S and copyBox then
            pcall(function()
                S:HandleEditBox(copyBox)
            end)
        end
        if S and work then
            pcall(function()
                if work.unitModeBtn then
                    S:HandleButton(work.unitModeBtn, true)
                end
                if work.undercutBtn then
                    S:HandleButton(work.undercutBtn, true)
                end
                if work.startBtn then
                    S:HandleButton(work.startBtn, true)
                end
                if work.bidRow then
                    if work.bidRow.gold then S:HandleEditBox(work.bidRow.gold) end
                    if work.bidRow.silver then S:HandleEditBox(work.bidRow.silver) end
                    if work.bidRow.copper then S:HandleEditBox(work.bidRow.copper) end
                end
                if work.buyoutRow then
                    if work.buyoutRow.gold then S:HandleEditBox(work.buyoutRow.gold) end
                    if work.buyoutRow.silver then S:HandleEditBox(work.buyoutRow.silver) end
                    if work.buyoutRow.copper then S:HandleEditBox(work.buyoutRow.copper) end
                end
            end)
        end
        if S and scrollBar then
            pcall(function()
                S:HandleScrollBar(scrollBar)
            end)
        end
        if S and switchBtn then
            pcall(function()
                S:HandleButton(switchBtn, true)
            end)
        end
        if S and inventoryBtn then
            pcall(function()
                S:HandleButton(inventoryBtn, true)
            end)
        end
        if S and browseBtn then
            pcall(function()
                S:HandleButton(browseBtn, true)
            end)
        end
        if S and noDataFavBtn then
            pcall(function()
                S:HandleButton(noDataFavBtn, true)
            end)
        end

        priceContentFrame.__GFA_Skinned = true
        priceContentFrame.__GFA_SkinName = "ElvUI"
        return
    end
    if skin == "NDui" then
        local B = GetNDui()
        local itemFrame = priceContentFrame.itemFrame
        local listBtn = itemFrame and itemFrame.listBtn
        local buyBtn = itemFrame and itemFrame.buyBtn
        local stackSizeInput = itemFrame and itemFrame.stackSizeInput
        local numStacksInput = itemFrame and itemFrame.numStacksInput
        local stackSizeMaxBtn = itemFrame and itemFrame.stackSizeMaxBtn
        local numStacksMaxBtn = itemFrame and itemFrame.numStacksMaxBtn
        local copyBox = itemFrame and itemFrame.copyBox
        local work = priceContentFrame.auctionWorkFrame
        local historyFrame = priceContentFrame.historyFrame
        local scrollFrame = historyFrame and historyFrame.scrollFrame
        local scrollBar = scrollFrame and scrollFrame.ScrollBar
        local switchBtn = itemFrame and itemFrame.switchBtn
        local inventoryBtn = itemFrame and itemFrame.inventoryBtn
        local browseBtn = itemFrame and itemFrame.browseBtn
        local noDataFavBtn = priceContentFrame and priceContentFrame.noDataFavBtn
        if B and listBtn and B.Reskin then
            pcall(function()
                B.Reskin(listBtn)
            end)
        end
        if B and buyBtn and B.Reskin then
            pcall(function()
                B.Reskin(buyBtn)
            end)
        end
        if B and stackSizeInput and B.ReskinInput then
            pcall(function()
                B.ReskinInput(stackSizeInput)
            end)
        end
        if B and numStacksInput and B.ReskinInput then
            pcall(function()
                B.ReskinInput(numStacksInput)
            end)
        end
        if B and stackSizeMaxBtn and B.Reskin then
            pcall(function()
                B.Reskin(stackSizeMaxBtn)
            end)
        end
        if B and numStacksMaxBtn and B.Reskin then
            pcall(function()
                B.Reskin(numStacksMaxBtn)
            end)
        end
        if B and copyBox and B.ReskinInput then
            pcall(function()
                B.ReskinInput(copyBox)
            end)
        end
        if B and work then
            pcall(function()
                if work.unitModeBtn and B.Reskin then
                    B.Reskin(work.unitModeBtn)
                end
                if work.undercutBtn and B.Reskin then
                    B.Reskin(work.undercutBtn)
                end
                if work.startBtn and B.Reskin then
                    B.Reskin(work.startBtn)
                end
                if work.bidRow and B.ReskinInput then
                    if work.bidRow.gold then B.ReskinInput(work.bidRow.gold) end
                    if work.bidRow.silver then B.ReskinInput(work.bidRow.silver) end
                    if work.bidRow.copper then B.ReskinInput(work.bidRow.copper) end
                end
                if work.buyoutRow and B.ReskinInput then
                    if work.buyoutRow.gold then B.ReskinInput(work.buyoutRow.gold) end
                    if work.buyoutRow.silver then B.ReskinInput(work.buyoutRow.silver) end
                    if work.buyoutRow.copper then B.ReskinInput(work.buyoutRow.copper) end
                end
            end)
        end
        if B and scrollBar then
            pcall(function()
                B.ReskinScroll(scrollBar)
            end)
        end
        if B and switchBtn and B.Reskin then
            pcall(function()
                if not switchBtn.__bg then
                    B.Reskin(switchBtn)
                end
            end)
        end
        if B and inventoryBtn and B.Reskin then
            pcall(function()
                if not inventoryBtn.__bg then
                    B.Reskin(inventoryBtn)
                end
            end)
        end
        if B and browseBtn and B.Reskin then
            pcall(function()
                if not browseBtn.__bg then
                    B.Reskin(browseBtn)
                end
            end)
        end
        if B and noDataFavBtn and B.Reskin then
            pcall(function()
                if not noDataFavBtn.__bg then
                    B.Reskin(noDataFavBtn)
                end
            end)
        end

        priceContentFrame.__GFA_Skinned = true
        priceContentFrame.__GFA_SkinName = "NDui"
        return
    end

    priceContentFrame.__GFA_Skinned = true
    priceContentFrame.__GFA_SkinName = "Blizzard"
end

function Skin:ApplyDockBar(buttons)
    if not buttons then return end

    local skin = GetActiveSkin()

    if skin == "ElvUI" then
        local S = GetElvUISkins()
        if S then
            for _, btn in pairs(buttons) do
                if btn and not btn.__GFA_Skinned then
                    pcall(function()
                        S:HandleButton(btn, true)
                    end)
                    btn.__GFA_Skinned = true
                end
            end
        end
        return
    end

    if skin == "NDui" then
        local B = GetNDui()
        if B and B.Reskin then
            for _, btn in pairs(buttons) do
                if btn and not btn.__GFA_Skinned then
                    pcall(function()
                        B.Reskin(btn)
                    end)
                    btn.__GFA_Skinned = true
                end
            end
        end
    end
end



function Skin:ApplyBuyQuantityDialog(dialog)
    if not dialog or dialog.__GFA_Skinned then
        return
    end

    local skin = GetActiveSkin()

    if skin == "ElvUI" then
        local S = GetElvUISkins()
        if S then
            pcall(function()
                if dialog.SetBackdrop then
                    dialog:SetBackdrop(nil)
                end
            end)
            pcall(function()
                S:HandleFrame(dialog, true)
            end)

            if dialog.editBox then
                pcall(function()
                    S:HandleEditBox(dialog.editBox)
                end)
            end

            if dialog.acceptBtn then
                pcall(function()
                    S:HandleButton(dialog.acceptBtn, true)
                end)
            end

            if dialog.cancelBtn then
                pcall(function()
                    S:HandleButton(dialog.cancelBtn, true)
                end)
            end

        end

        dialog.__GFA_Skinned = true
        dialog.__GFA_SkinName = "ElvUI"
        return
    end

    if skin == "NDui" then
        local B = GetNDui()
        if B then
            -- Remove Blizzard backdrop first (our dialog may create one).
            pcall(function()
                if dialog.SetBackdrop then
                    dialog:SetBackdrop(nil)
                end
            end)
            pcall(function()
                if B.SetBD then
                    B.SetBD(dialog)
                elseif B.CreateBD then
                    B.CreateBD(dialog)
                end
            end)

            if dialog.editBox and B.ReskinInput then
                pcall(function()
                    B.ReskinInput(dialog.editBox)
                end)
            end

            if dialog.acceptBtn and B.Reskin then
                pcall(function()
                    B.Reskin(dialog.acceptBtn)
                end)
            end

            if dialog.cancelBtn and B.Reskin then
                pcall(function()
                    B.Reskin(dialog.cancelBtn)
                end)
            end

        end

        dialog.__GFA_Skinned = true
        dialog.__GFA_SkinName = "NDui"
        return
    end

    dialog.__GFA_Skinned = true
    dialog.__GFA_SkinName = "Blizzard"
end

function Skin:ApplyFavoritePanel(panel)
    if not panel then return end
    local skin = GetActiveSkin()
    
    local backBtn = panel.backBtn
    local browseBtn = panel.browseBtn
    local listBtn = panel.listBtn
    local inventoryBtn = panel.inventoryBtn
    
    local function SkinButton(btn)
        if not btn then return end
        if skin == "ElvUI" then
            local S = GetElvUISkins()
            if S and S.HandleButton then
                pcall(function() S:HandleButton(btn, true) end)
            end
        elseif skin == "NDui" then
            local B = GetNDui()
            if B and B.Reskin then
                pcall(function()
                     if not btn.__bg then B.Reskin(btn) end
                end)
            end
        end
    end
    
    SkinButton(browseBtn)
    SkinButton(listBtn)
    SkinButton(inventoryBtn)

    local scrollFrame = panel.scrollFrame
    
    if skin == "ElvUI" then
        local S = GetElvUISkins()
        if S and scrollFrame and scrollFrame.ScrollBar and not panel.__GFA_SkinnedScroll then
             pcall(function() S:HandleScrollBar(scrollFrame.ScrollBar) end)
             panel.__GFA_SkinnedScroll = true
        end

        if S and scrollFrame and scrollFrame.GetScrollChild then
            local child = scrollFrame:GetScrollChild()
            if child and child.GetChildren then
                for _, row in ipairs({child:GetChildren()}) do
                    if row and row.copyBox and not row.copyBox.__GFA_Skinned then
                        pcall(function()
                            S:HandleEditBox(row.copyBox)
                        end)
                        row.copyBox.__GFA_Skinned = true
                    end
                end
            end
        end
        return
    end
    
    if skin == "NDui" then
        local B = GetNDui()
        if B and scrollFrame and scrollFrame.ScrollBar and not panel.__GFA_SkinnedScroll then
            if B.ReskinScroll then
                pcall(function() B.ReskinScroll(scrollFrame.ScrollBar) end)
            end
            panel.__GFA_SkinnedScroll = true
        end

        if B and scrollFrame and scrollFrame.GetScrollChild then
            local child = scrollFrame:GetScrollChild()
            if child and child.GetChildren then
                for _, row in ipairs({child:GetChildren()}) do
                    if row and row.copyBox and not row.copyBox.__GFA_Skinned then
                        if B.ReskinInput then
                            pcall(function()
                                B.ReskinInput(row.copyBox)
                            end)
                        end
                        row.copyBox.__GFA_Skinned = true
                    end
                end
            end
        end
        return
    end
end



function Skin:ApplyInventoryFrame(frame)
    if not frame or frame.__GFA_Skinned then return end
    
    local skin = GetActiveSkin()
    local scrollFrame = frame.scrollFrame
    local copyBox = frame.copyBox
    
    if skin == "ElvUI" then
        local S = GetElvUISkins()
        if S and frame.StripTextures and (frame.CreateBackdrop or frame.SetTemplate) then
            pcall(function() S:HandleFrame(frame, true) end)
        end
        if frame.closeBtn and S then
            pcall(function() S:HandleCloseButton(frame.closeBtn) end)
        end
        
        if S and scrollFrame and scrollFrame.ScrollBar then
             pcall(function() S:HandleScrollBar(scrollFrame.ScrollBar) end)
        end

        if S and copyBox and not copyBox.__GFA_Skinned then
            pcall(function() S:HandleEditBox(copyBox) end)
            copyBox.__GFA_Skinned = true
        end
        
        frame.__GFA_Skinned = true
        frame.__GFA_SkinName = "ElvUI"
        return
    end
    
    if skin == "NDui" then
        local B = GetNDui()
        if B and frame.SetBackdrop then
            pcall(function()
                frame:SetBackdrop(nil)
                if B.SetBD then B.SetBD(frame) elseif B.CreateBD then B.CreateBD(frame) end
            end)
        end
        if frame.closeBtn and B then
            pcall(function() B.ReskinClose(frame.closeBtn, frame, -6, -6) end)
        end
        
        if B and scrollFrame and scrollFrame.ScrollBar then
            if B.ReskinScroll then
                pcall(function() B.ReskinScroll(scrollFrame.ScrollBar) end)
            end
        end

        if B and copyBox and B.ReskinInput and not copyBox.__GFA_Skinned then
            pcall(function() B.ReskinInput(copyBox) end)
            copyBox.__GFA_Skinned = true
        end
        
        frame.__GFA_Skinned = true
        frame.__GFA_SkinName = "NDui"
        return
    end
    
    frame.__GFA_Skinned = true
    frame.__GFA_SkinName = "Blizzard"
end

function Skin:ApplyImportExportDialog(dialog)
    if not dialog or dialog.__GFA_Skinned then
        return
    end

    local skin = GetActiveSkin()

    if skin == "ElvUI" then
        local S = GetElvUISkins()
        if S then
            pcall(function()
                if dialog.SetBackdrop then
                    dialog:SetBackdrop(nil)
                end
            end)
            pcall(function()
                S:HandleFrame(dialog, true)
            end)

            if dialog.closeBtn then
                pcall(function()
                    S:HandleCloseButton(dialog.closeBtn)
                end)
            end

            if dialog.exportBtn then
                pcall(function()
                    S:HandleButton(dialog.exportBtn, true)
                end)
            end

            if dialog.importBtn then
                pcall(function()
                    S:HandleButton(dialog.importBtn, true)
                end)
            end

            if dialog.ioBox then
                pcall(function()
                    if dialog.ioBox.SetBackdrop then
                        dialog.ioBox:SetBackdrop(nil)
                    end
                end)
                pcall(function()
                    S:HandleFrame(dialog.ioBox, true)
                end)
            end

            if dialog.editBox then
                pcall(function()
                    S:HandleEditBox(dialog.editBox)
                end)
            end

        end

        dialog.__GFA_Skinned = true
        dialog.__GFA_SkinName = "ElvUI"
        return
    end

    if skin == "NDui" then
        local B = GetNDui()
        if B then
            pcall(function()
                if dialog.SetBackdrop then
                    dialog:SetBackdrop(nil)
                end
            end)
            pcall(function()
                if B.SetBD then
                    B.SetBD(dialog)
                elseif B.CreateBD then
                    B.CreateBD(dialog)
                end
            end)

            if dialog.closeBtn then
                pcall(function()
                    B.ReskinClose(dialog.closeBtn, dialog, -6, -6)
                end)
            end

            if dialog.exportBtn and B.Reskin then
                pcall(function()
                    B.Reskin(dialog.exportBtn)
                end)
            end

            if dialog.importBtn and B.Reskin then
                pcall(function()
                    B.Reskin(dialog.importBtn)
                end)
            end

            if dialog.ioBox then
                pcall(function()
                    if dialog.ioBox.SetBackdrop then
                        dialog.ioBox:SetBackdrop(nil)
                    end
                end)
                pcall(function()
                    if B.SetBD then
                        B.SetBD(dialog.ioBox)
                    elseif B.CreateBD then
                        B.CreateBD(dialog.ioBox)
                    end
                end)
            end

            if dialog.editBox and B.ReskinInput then
                pcall(function()
                    B.ReskinInput(dialog.editBox)
                end)
            end

        end

        dialog.__GFA_Skinned = true
        dialog.__GFA_SkinName = "NDui"
        return
    end

    dialog.__GFA_Skinned = true
    dialog.__GFA_SkinName = "Blizzard"
end

function Skin:ApplyStaticPopupCloseButton(closeBtn, parent)
    if not closeBtn or closeBtn.__GFA_Skinned then
        return
    end

    local skin = GetActiveSkin()

    if skin == "ElvUI" then
        local S = GetElvUISkins()
        if S and S.HandleCloseButton then
            pcall(function()
                S:HandleCloseButton(closeBtn)
            end)
        end
        closeBtn.__GFA_Skinned = true
        closeBtn.__GFA_SkinName = "ElvUI"
        return
    end

    if skin == "NDui" then
        local B = GetNDui()
        if B and B.ReskinClose and parent then
            pcall(function()
                B.ReskinClose(closeBtn, parent, -6, -6)
            end)
        end
        closeBtn.__GFA_Skinned = true
        closeBtn.__GFA_SkinName = "NDui"
        return
    end

    closeBtn.__GFA_Skinned = true
    closeBtn.__GFA_SkinName = "Blizzard"
end

function Skin:ApplyFullScanButton(btn)
    if not btn or btn.__GFA_Skinned then return end
    
    local skin = GetActiveSkin()
    
    if skin == "NDui" then
        local B = GetNDui()
        if B and B.Reskin then
            pcall(function()
                B.Reskin(btn)
            end)
        end
        btn.__GFA_Skinned = true
        btn.__GFA_SkinName = "NDui"
        return
    end
    
    if skin == "ElvUI" then
    end
    
    btn.__GFA_Skinned = true
    btn.__GFA_SkinName = "Blizzard"
end




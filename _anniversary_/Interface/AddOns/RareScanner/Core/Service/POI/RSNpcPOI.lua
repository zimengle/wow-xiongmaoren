-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local ADDON_NAME, private = ...

local RSNpcPOI = private.NewLib("RareScannerNpcPOI")

-- RareScanner database libraries
local RSNpcDB = private.ImportLib("RareScannerNpcDB")
local RSGeneralDB = private.ImportLib("RareScannerGeneralDB")
local RSConfigDB = private.ImportLib("RareScannerConfigDB")
local RSMapDB = private.ImportLib("RareScannerMapDB")

-- RareScanner internal libraries
local RSConstants = private.ImportLib("RareScannerConstants")
local RSLogger = private.ImportLib("RareScannerLogger")
local RSTimeUtils = private.ImportLib("RareScannerTimeUtils")
local RSUtils = private.ImportLib("RareScannerUtils")

-- RareScanner services
local RSRecentlySeenTracker = private.ImportLib("RareScannerRecentlySeenTracker")


---============================================================================
-- NPC Map POIs
---- Manage adding NPC icons to the world map and minimap
---============================================================================

function RSNpcPOI.GetNpcPOI(npcID, mapID, npcInfo, alreadyFoundInfo)
	local POI = {}
	POI.entityID = npcID
	POI.isNpc = true
	POI.grouping = true
	POI.name = RSNpcDB.GetNpcName(npcID)
	POI.mapID = mapID	
	POI.foundTime = alreadyFoundInfo and alreadyFoundInfo.foundTime
	POI.isDiscovered = POI.isDead or alreadyFoundInfo ~= nil
	POI.isFriendly = RSNpcDB.IsInternalNpcFriendly(npcID)
	
	if (npcInfo) then
		POI.worldmap = npcInfo.worldmap
		POI.custom = npcInfo.custom
	end
	
	-- Coordinates
	if (alreadyFoundInfo and alreadyFoundInfo.mapID == mapID) then
		POI.x = alreadyFoundInfo.coordX
		POI.y = alreadyFoundInfo.coordY
  	else
	  	POI.x, POI.y = RSNpcDB.GetInternalNpcCoordinates(npcID, mapID)
	end
	
	-- Textures
	if (RSRecentlySeenTracker.IsRecentlySeen(npcID, POI.x, POI.y)) then
		POI.Texture = RSConstants.PINK_NPC_TEXTURE
	elseif (POI.custom) then
		POI.Texture = RSConstants.PURPLE_NPC_TEXTURE
	elseif (not POI.isDiscovered) then
		POI.Texture = RSConstants.RED_NPC_TEXTURE
	else
		POI.Texture = RSConstants.NORMAL_NPC_TEXTURE
	end
	
	return POI
end

local function IsNpcPOIFiltered(npcID, mapID, npcInfo, onWorldMap, onMinimap)
	local name = RSNpcDB.GetNpcName(npcID)
	
	-- Skip if part of a disabled event
	if (RSNpcDB.IsDisabledEvent(npcID)) then
		RSLogger:PrintDebugMessageEntityID(npcID, string.format("Saltado NPC [%s]: Parte de un evento desactivado.", npcID))
		return true
	end

	-- Skip if the entity is filtered
	if (RSConfigDB.IsNpcFiltered(npcID) or RSConfigDB.IsNpcFilteredOnlyWorldmap(npcID)) then
		RSLogger:PrintDebugMessageEntityID(npcID, string.format("Saltado NPC [%s]: Filtrado en opciones (filtro completo o mapa del mundo).", npcID))
		return true
	end
	
	-- Skip if custom NPC group filtered
	if (npcInfo and npcInfo.group and RSConfigDB.IsCustomNpcGroupFiltered(npcInfo.group)) then
		RSLogger:PrintDebugMessageEntityID(npcID, string.format("Saltado NPC [%s]: Filtrado grupo.", npcID))
		return true
	end

	-- Skip if not showing friendly NPCs and this one is friendly
	if (not RSConfigDB.IsShowingFriendlyNpcs() and RSNpcDB.IsInternalNpcFriendly(npcID)) then
		RSLogger:PrintDebugMessageEntityID(npcID, string.format("Saltado NPC [%s]: Es amistoso.", npcID))
		return true
	end

	-- Skip if the entity appears only while a quest event is going on and it isnt active
	if (npcInfo and npcInfo.zoneQuestId) then
		local active = false
		for _, questID in ipairs(npcInfo.zoneQuestId) do
			if (C_TaskQuest.IsActive(questID) or C_QuestLog.IsQuestFlaggedCompleted(questID)) then
				active = true
				break
			end
		end

		if (not active) then
			RSLogger:PrintDebugMessageEntityID(npcID, string.format("Saltado NPC [%s]: Evento asociado no esta activo.", npcID))
			return true
		end
	end

	-- Skip if for whatever reason we don't have its name (this shouldnt happend)
	local npcName = RSNpcDB.GetNpcName(npcID)
	if (not npcName) then
		RSLogger:PrintDebugMessageEntityID(npcID, string.format("Saltado NPC [%s]: Le falta el nombre!.", npcID))
		return true
	end

	return false
end

function RSNpcPOI.GetMapNpcPOI(npcID, mapID, onWorldMap, onMinimap, recentlySeenInfo)
	-- Skip if not showing NPC icons
	if (not RSConfigDB.IsShowingNpcs()) then
		RSLogger:PrintDebugMessageEntityID(npcID, string.format("Saltado NPC [%s]: Iconos de NPCs deshabilitado.", npcID))
		return
	end
	
	local alreadyFoundInfo = recentlySeenInfo or RSGeneralDB.GetAlreadyFoundEntity(npcID)
	
	-- Skip if not showing not discovered NPC icons
	if (not RSConfigDB.IsShowingNotDiscoveredNpcs() and not alreadyFoundInfo) then
		return
	end

	local npcInfo = RSNpcDB.GetInternalNpcInfo(npcID)
	
	-- Skip if it was a custom NPC and has being deleted (but for whatever reason it remains in the database)
	if (not npcInfo and not alreadyFoundInfo) then
		RSLogger:PrintDebugMessageEntityID(npcID, string.format("Saltado NPC N/D [%s]: Era un NPC personalizado y ya no existe.", npcID))
		return
	end
	
	-- Skip if the entity doesn't have coordinates (for example custom NPCs)
	if (not alreadyFoundInfo) then
		if (not npcInfo.x or not npcInfo.y) then
			local x, y = RSNpcDB.GetInternalNpcCoordinates(npcID, mapID)
			if (not x or not y) then
				RSLogger:PrintDebugMessageEntityID(npcID, string.format("Saltado NPC [%s]: No disponía de coordenadas.", npcID))
				return
			end
		end
	end

	-- Skip if common filters
	if (not IsNpcPOIFiltered(npcID, mapID, npcInfo, onWorldMap, onMinimap)) then
		return RSNpcPOI.GetNpcPOI(npcID, mapID, npcInfo, alreadyFoundInfo)
	end
end

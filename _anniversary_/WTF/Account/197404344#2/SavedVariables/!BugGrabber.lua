
BugGrabberDB = {
["session"] = 2200,
["lastSanitation"] = 3,
["errors"] = {
{
["message"] = "Interface/AddOns/GFW_FeedOMatic/FeedOMatic.lua:1391: attempt to call global 'GetAddOnMetadata' (a nil value)",
["time"] = "2026/01/23 00:28:34",
["locals"] = "",
["stack"] = "[tail call]: ?\n[Interface/AddOns/GFW_FeedOMatic/FeedOMatic.lua]:1391: in function 'SetupOptions'\n[Interface/AddOns/GFW_FeedOMatic/FeedOMatic.lua]:1424: in function <Interface/AddOns/GFW_FeedOMatic/FeedOMatic.lua:1410>\n[C]: ?\n[Interface/AddOns/BlizzMove/Libs/AceAddon-3.0-13/AceAddon-3.0.lua]:66: in function <.../AddOns/BlizzMove/Libs/AceAddon-3.0/AceAddon-3.0.lua:61>\n[Interface/AddOns/BlizzMove/Libs/AceAddon-3.0-13/AceAddon-3.0.lua]:494: in function 'InitializeAddon'\n[Interface/AddOns/BlizzMove/Libs/AceAddon-3.0-13/AceAddon-3.0.lua]:619: in function <.../AddOns/BlizzMove/Libs/AceAddon-3.0/AceAddon-3.0.lua:611>",
["session"] = 2200,
["counter"] = 3,
},
{
["message"] = "Interface/AddOns/MeetingHorn/Api.lua:520: attempt to call global 'IsAddOnLoaded' (a nil value)",
["time"] = "2026/01/23 00:26:41",
["locals"] = "(for state) = nil\n(for control) = \"BigFoot:1\"\nline = \"BigFoot:1\"\nn = \"BigFoot\"\nv = \"1\"\n(*temporary) = nil\n(*temporary) = \"BigFoot\"\n(*temporary) = \"attempt to call global 'IsAddOnLoaded' (a nil value)\"\n",
["stack"] = "[Interface/AddOns/MeetingHorn/Api.lua]:520: in function 'GetAddonSource'\n[Interface/AddOns/MeetingHorn/Core/LFG.lua]:501: in function '?'\n[Interface/AddOns/alaCalendar/libs/CallbackHandler-1.0-8/CallbackHandler-1.0.lua]:109: in function <...dar/libs/CallbackHandler-1.0/CallbackHandler-1.0.lua:109>\n[C]: ?\n[Interface/AddOns/alaCalendar/libs/CallbackHandler-1.0-8/CallbackHandler-1.0.lua]:19: in function <...dar/libs/CallbackHandler-1.0/CallbackHandler-1.0.lua:15>\n[Interface/AddOns/alaCalendar/libs/CallbackHandler-1.0-8/CallbackHandler-1.0.lua]:54: in function 'Fire'\n[Interface/AddOns/MeetingHorn/Libs/LibCommSocket-3.0-4/Socket.lua]:100: in function <...AddOns/MeetingHorn/Libs/LibCommSocket-3.0/Socket.lua:86>\n[tail call]: ?\n[tail call]: ?\n[Interface/AddOns/alaCalendar/libs/CallbackHandler-1.0-8/CallbackHandler-1.0.lua]:109: in function <...dar/libs/CallbackHandler-1.0/CallbackHandler-1.0.lua:109>\n[C]: ?\n[Interface/AddOns/alaCalendar/libs/CallbackHandler-1.0-8/CallbackHandler-1.0.lua]:19: in function <...dar/libs/CallbackHandler-1.0/CallbackHandler-1.0.lua:15>\n[Interface/AddOns/alaCalendar/libs/CallbackHandler-1.0-8/CallbackHandler-1.0.lua]:54: in function 'Fire'\n[Interface/AddOns/AtlasLootClassic/Libs/AceComm-3.0-14/AceComm-3.0.lua]:260: in function <...ns/AtlasLootClassic/Libs/AceComm-3.0/AceComm-3.0.lua:242>",
["session"] = 2200,
["counter"] = 4,
},
{
["message"] = "...ace/AddOns/Blizzard_TrainerUI/Blizzard_TrainerUI.lua:273: attempt to index local 'skillButton' (a nil value)",
["time"] = "2026/01/23 00:34:47",
["locals"] = "numTrainerServices = 0\nskillOffset = 0\n(for index) = 29\n(for limit) = 37\n(for step) = 1\ni = 29\nskillIndex = 29\nskillButton = nil\nserviceName = nil\nserviceSubText = nil\nserviceType = nil\nisExpanded = nil\nmoneyCost = nil\n(*temporary) = nil\n(*temporary) = ClassTrainerListScrollFrameScrollBarScrollUpButton {\n Pushed = Texture {\n }\n Disabled = Texture {\n }\n IsSkinned = true\n Highlight = Texture {\n }\n Normal = Texture {\n }\n}\n(*temporary) = ClassTrainerListScrollFrameScrollBarScrollDownButton {\n Pushed = Texture {\n }\n Disabled = Texture {\n }\n IsSkinned = true\n Highlight = Texture {\n }\n Normal = Texture {\n }\n}\n(*temporary) = nil\n(*temporary) = ClassTrainerSkillHighlightFrame {\n}\n(*temporary) = 316\n(*temporary) = \"attempt to index local 'skillButton' (a nil value)\"\n",
["stack"] = "[Interface/AddOns/Blizzard_TrainerUI/Blizzard_TrainerUI.lua]:273: in function <...ace/AddOns/Blizzard_TrainerUI/Blizzard_TrainerUI.lua:161>\n[C]: in function 'ClassTrainerFrame_Update'\n[Interface/AddOns/Blizzard_TrainerUI/Blizzard_TrainerUI.lua]:60: in function <...ace/AddOns/Blizzard_TrainerUI/Blizzard_TrainerUI.lua:53>\n[C]: ?\n[C]: in function 'Show'\n[Interface/AddOns/Blizzard_UIParentPanelManager/Shared/UIParentPanelManager.lua]:461: in function 'SetUIPanel'\n[Interface/AddOns/Blizzard_UIParentPanelManager/Shared/UIParentPanelManager.lua]:304: in function 'ShowUIPanel'\n[Interface/AddOns/Blizzard_UIParentPanelManager/Shared/UIParentPanelManager.lua]:133: in function <...UIParentPanelManager/Shared/UIParentPanelManager.lua:128>\n[C]: in function 'SetAttribute'\n[Interface/AddOns/Blizzard_UIParentPanelManager/Shared/UIParentPanelManager.lua]:850: in function 'ShowUIPanel'\n[Interface/AddOns/Blizzard_TrainerUI/Blizzard_TrainerUI.lua]:46: in function 'showFunc'\n[Interface/AddOns/Blizzard_UIPanels_Game/Shared/PlayerInteractionFrameManager.lua]:241: in function <...Panels_Game/Shared/PlayerInteractionFrameManager.lua:226>\n[tail call]: ?\n[tail call]: ?\n[tail call]: ?\n[Interface/AddOns/Blizzard_UIPanels_Game/Shared/PlayerInteractionFrameManager.lua]:279: in function <...Panels_Game/Shared/PlayerInteractionFrameManager.lua:276>",
["session"] = 2200,
["counter"] = 8,
},
},
}

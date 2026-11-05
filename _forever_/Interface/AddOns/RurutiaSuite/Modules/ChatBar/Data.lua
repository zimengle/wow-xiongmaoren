local _, ns = ...

local Data = {}

local function Copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    local key
    local child
    for key, child in pairs(value) do result[key] = Copy(child) end
    return result
end

Data.Copy = Copy
Data.defaultChannelName = "大脚世界频道"
Data.channelNames = {
    zhCN = { general = "综合", trade = "交易", lfg = "寻求组队" },
    zhTW = { general = "綜合", trade = "交易", lfg = "尋求組隊" },
    default = { general = "General", trade = "Trade", lfg = "LookingForGroup" },
}

Data.buttons = {
    { key = "say", text = "说", action = "open", command = "/say " },
    { key = "yell", text = "喊", action = "open", command = "/yell " },
    { key = "guild", text = "会", action = "open", command = "/g ", rightCommand = "/o " },
    { key = "party", text = "队", action = "open", command = "/p " },
    { key = "instance", text = "副", action = "open", command = "/i ", showKey = "group_or_raid" },
    { key = "battleground", text = "战", action = "open", command = "/bg ", showKey = "battleground" },
    { key = "raid", text = "团", action = "raid", showKey = "raid" },
    { key = "zong", text = "综", action = "channel", channelKey = "general" },
    { key = "jiao", text = "交", action = "channel", channelKey = "trade" },
    { key = "xun", text = "寻", action = "channel", channelKey = "lfg" },
    { key = "world", text = "世", action = "channel", channelKey = "world" },
    { key = "meeting", text = "集", action = "meeting" },
    { key = "emoji", text = "表", action = "emoji" },
    { key = "roll", text = "骰", action = "run", command = "/roll" },
    { key = "macro", text = "宏", action = "macro" },
    { key = "combat", text = "战", action = "run", command = "/combatlog" },
    { key = "loot", text = "掉", action = "loot" },
    { key = "goldLedger", text = "金", action = "addon" },
    { key = "preset", text = "RS", action = "rs", extraSpacingBefore = 2 },
}

Data.settingsButtonOrder = {
    "say", "yell", "guild", "party", "instance", "battleground", "raid",
    "zong", "jiao", "xun", "world", "meeting", "emoji", "roll", "macro",
    "loot", "goldLedger", "combat", "preset",
}

Data.retailButtons = {
    { key = "say", text = "说", action = "open", command = "/say " },
    { key = "yell", text = "喊", action = "open", command = "/yell " },
    { key = "guild", text = "会", action = "open", command = "/g ", rightCommand = "/o " },
    { key = "party", text = "队", action = "open", command = "/p " },
    { key = "instance", text = "副", action = "open", command = "/i ", showKey = "group_or_raid" },
    { key = "battleground", text = "战", action = "open", command = "/bg ", showKey = "battleground" },
    { key = "raid", text = "团", action = "raid", showKey = "raid" },
    { key = "zong", text = "综", action = "channel", channelKey = "general" },
    { key = "jiao", text = "交", action = "channel", channelKey = "trade" },
    { key = "xun", text = "寻", action = "channel", channelKey = "lfg" },
    { key = "world", text = "世", action = "channel", channelKey = "world" },
    { key = "emoji", text = "表", action = "emoji" },
    { key = "roll", text = "骰", action = "run", command = "/roll" },
    { key = "macro", text = "宏", action = "macro" },
    { key = "combat", text = "战", action = "run", command = "/combatlog" },
    { key = "loot", text = "掉", action = "loot" },
    { key = "mdt", text = "秘", action = "addon" },
    { key = "keystone", text = "钥", action = "addon" },
    { key = "preset", text = "RS", action = "rs", extraSpacingBefore = 2 },
}

Data.retailSettingsButtonOrder = {
    "say", "yell", "guild", "party", "instance", "battleground", "raid",
    "zong", "jiao", "xun", "world", "emoji", "roll", "macro", "loot",
    "mdt", "keystone", "combat", "preset",
}

Data.retailTabChannelKeys = { "general", "trade", "lfg", "world" }

Data.colors = {
    say = { 1.0, 1.0, 1.0 }, yell = { 1.0, 0.0, 0.0 }, guild = { 0.0, 1.0, 0.0 },
    party = { 0.0, 0.8, 1.0 }, instance = { 1.0, 0.55, 0.0 },
    battleground = { 1.0, 0.2, 0.2 }, raid = { 1.0, 0.55, 0.0 },
    zong = { 0.78, 0.61, 0.43 }, jiao = { 0.78, 0.61, 0.43 },
    xun = { 0.0, 1.0, 0.0 }, world = { 0.0, 1.0, 0.0 },
    meeting = { 1.0, 0.55, 0.0 }, emoji = { 1.0, 0.84, 0.0 },
    macro = { 0.45, 0.8, 1.0 }, roll = { 0.639, 0.318, 1.0 },
    loot = { 0.45, 0.8, 1.0 }, combat = { 0.0, 1.0, 0.0 },
    goldLedger = { 1.0, 0.84, 0.0 },
    mdt = { 1.0, 0.55, 0.0 },
    keystone = { 1.0, 0.0, 1.0 },
}

local enabledButtons = {}
local index
for index = 1, #Data.buttons do enabledButtons[Data.buttons[index].key] = true end
enabledButtons.meeting = false

Data.defaults = {
    profile = {
        enabled = true,
        copyChatEnabled = true,
        fontSize = 18,
        buttonsEnabled = enabledButtons,
        offsetX = 0,
        offsetY = 28,
        buttonWidth = 24,
        buttonHeight = 18,
        spacing = -2,
        paddingX = 6,
        paddingY = 3,
        frameStrata = "LOW",
        frameLevel = 5,
    },
}

local retailEnabledButtons = {}
for index = 1, #Data.retailButtons do retailEnabledButtons[Data.retailButtons[index].key] = true end
Data.retailDefaults = {
    profile = {
        enabled = true,
        copyChatEnabled = true,
        tabChannelSwitchEnabled = true,
        fontSize = 18,
        buttonsEnabled = retailEnabledButtons,
        offsetX = 0,
        offsetY = 28,
        buttonWidth = 24,
        buttonHeight = 18,
        spacing = -2,
        paddingX = 6,
        paddingY = 3,
        frameStrata = "LOW",
        frameLevel = 5,
    },
}

Data.layout = {
    fontMin = 15, fontMax = 30,
    spacingMin = -15, spacingMax = 15,
    popupButtonWidth = 125, popupButtonHeight = 30,
    popupPadLeft = 7, popupPadRight = 13, popupPadTop = 0, popupPadBottom = 1,
    emojiIconSize = 22, emojiColumns = 12, emojiGap = 4, emojiPadding = 6,
}

Data.emojiTextureRoot = "Interface\\AddOns\\RurutiaSuite\\Media\\SimpleChatEmojis\\"
Data.emojiMessageIconSize = 18
Data.customEmoteStartIndex = 9
Data.emotes = {
    { text = "{rt1}", texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1" },
    { text = "{rt2}", texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2" },
    { text = "{rt3}", texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3" },
    { text = "{rt4}", texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_4" },
    { text = "{rt5}", texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_5" },
    { text = "{rt6}", texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_6" },
    { text = "{rt7}", texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7" },
    { text = "{rt8}", texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8" },
}

local customEmotes = {
    { "{天使}", "angel.tga" }, { "{生气}", "angry.tga" },
    { "{大笑}", "biglaugh.tga" }, { "{鼓掌}", "clap.tga" },
    { "{酷}", "cool.tga" }, { "{哭}", "cry.tga" }, { "{可爱}", "cutie.tga" },
    { "{鄙视}", "despise.tga" }, { "{美梦}", "dreamsmile.tga" },
    { "{尴尬}", "embarrass.tga" }, { "{邪恶}", "evil.tga" },
    { "{兴奋}", "excited.tga" }, { "{晕}", "faint.tga" },
    { "{打架}", "fight.tga" }, { "{流感}", "flu.tga" },
    { "{呆}", "freeze.tga" }, { "{皱眉}", "frown.tga" },
    { "{致敬}", "greet.tga" }, { "{鬼脸}", "grimace.tga" },
    { "{龇牙}", "growl.tga" }, { "{开心}", "happy.tga" },
    { "{心}", "heart.tga" }, { "{恐惧}", "horror.tga" },
    { "{生病}", "ill.tga" }, { "{无辜}", "Innocent.tga" },
    { "{功夫}", "kongfu.tga" }, { "{花痴}", "love.tga" },
    { "{邮件}", "mail.tga" }, { "{化妆}", "makeup.tga" },
    { "{马里奥}", "Mario.tga" }, { "{沉思}", "meditate.tga" },
    { "{可怜}", "miserable.tga" }, { "{好}", "okay.tga" },
    { "{漂亮}", "pretty.tga" }, { "{吐}", "puke.tga" },
    { "{握手}", "shake.tga" }, { "{喊}", "shout.tga" },
    { "{闭嘴}", "shuuuu.tga" }, { "{害羞}", "shy.tga" },
    { "{睡觉}", "sleep.tga" }, { "{微笑}", "smile.tga" },
    { "{吃惊}", "suprise.tga" }, { "{失败}", "surrender.tga" },
    { "{流汗}", "sweat.tga" }, { "{流泪}", "tear.tga" },
    { "{悲剧}", "tears.tga" }, { "{想}", "think.tga" },
    { "{偷笑}", "Titter.tga" }, { "{猥琐}", "ugly.tga" },
    { "{胜利}", "victory.tga" }, { "{雷锋}", "volunteer.tga" },
    { "{委屈}", "wronged.tga" },
}
for index = 1, #customEmotes do
    Data.emotes[#Data.emotes + 1] = {
        text = customEmotes[index][1],
        texture = Data.emojiTextureRoot .. customEmotes[index][2],
    }
end

Data.emojiEvents = {
    "CHAT_MSG_CHANNEL", "CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_RAID",
    "CHAT_MSG_RAID_LEADER", "CHAT_MSG_RAID_WARNING", "CHAT_MSG_PARTY",
    "CHAT_MSG_PARTY_LEADER", "CHAT_MSG_GUILD", "CHAT_MSG_OFFICER",
    "CHAT_MSG_AFK", "CHAT_MSG_DND", "CHAT_MSG_INSTANCE_CHAT",
    "CHAT_MSG_INSTANCE_CHAT_LEADER", "CHAT_MSG_WHISPER", "CHAT_MSG_WHISPER_INFORM",
    "CHAT_MSG_BN_WHISPER", "CHAT_MSG_BN_WHISPER_INFORM", "CHAT_MSG_COMMUNITIES_CHANNEL",
}

function Data.GetChannels(locale)
    local values = Data.channelNames[locale] or Data.channelNames.default
    return {
        general = values.general,
        trade = values.trade,
        lfg = values.lfg,
        world = Data.defaultChannelName,
    }
end

function Data.GetButton(key, buttons)
    buttons = buttons or Data.buttons
    local i
    for i = 1, #buttons do
        if buttons[i].key == key then return buttons[i] end
    end
    return nil
end

ns.ChatBarData = Data

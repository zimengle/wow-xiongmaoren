local _, addon = ...

if addon.player.class ~= "PRIEST" or addon.game ~= "CATA" then return end

addon.talents.RegisterGuide([[
#name 暗影牧师 10-85
#displayname 暗影牧师 10-85 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#minLevel 10
#maxLevel 85

level -- Improved Shadow Word: Pain
	.talent 3,1,2,1

level -- Improved Shadow Word: Pain
	.talent 3,1,2,2

level -- Darkness
	.talent 3,1,1,1

level -- Darkness
	.talent 3,1,1,2

level -- Darkness
	.talent 3,1,1,3

level -- Twisted Faith
	.talent 3,2,4,1

level -- Twisted Faith
	.talent 3,2,4,2

level -- Improved Mind Blast
	.talent 3,2,2,1

level -- Improved Mind Blast
	.talent 3,2,2,2

level -- Improved Mind Blast
	.talent 3,2,2,3

level -- Shadowform
	.talent 3,3,2,1

level -- Improved Devouring Plague
	.talent 3,2,3,1

level -- Improved Devouring Plague
	.talent 3,2,3,2

level -- Harnessed Shadows
	.talent 3,3,4,1

level -- Harnessed Shadows
	.talent 3,3,4,2

level -- Vampiric Embrace
	.talent 3,4,2,1

level -- Mind Melt
	.talent 3,4,4,1

level -- Mind Melt
	.talent 3,4,4,2

level -- Masochism
	.talent 3,4,3,1

level -- Masochism
	.talent 3,4,3,2

level -- Vampiric Touch
	.talent 3,5,2,1

level -- Pain and Suffering
	.talent 3,5,1,1

level -- Pain and Suffering
	.talent 3,5,1,2

level -- Improved Psychic Scream
	.talent 3,2,1,1

level -- Improved Psychic Scream
	.talent 3,2,1,2

level -- Psychic Horror
	.talent 3,6,1,1

level -- Silence
	.talent 3,4,1,1

level -- Dispersion
	.talent 3,7,2,1

level -- Twin Disciplines
	.talent 1,1,2,1

level -- Twin Disciplines
	.talent 1,1,2,2

level -- Twin Disciplines
	.talent 1,1,2,3

level -- Improved Power Word: Shield
	.talent 1,1,1,1

level -- Improved Power Word: Shield
	.talent 1,1,1,2

level -- Evangelism
	.talent 1,2,1,1

level -- Evangelism
	.talent 1,2,1,2

level -- Archangel
	.talent 1,2,2,1

level -- Veiled Shadows
	.talent 3,1,3,1

level -- Veiled Shadows
	.talent 3,1,3,2
]])

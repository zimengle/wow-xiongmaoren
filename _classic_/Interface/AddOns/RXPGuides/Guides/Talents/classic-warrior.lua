local _, addon = ...

if addon.player.class ~= "WARRIOR" or addon.gameVersion >= 40000 then return end


addon.talents.RegisterGuide([[
#name 硬核战士 10-30
#displayname 硬核战士 10-30 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 硬核战士 30-55
#minLevel 10
#maxLevel 30
#hardcore

level -- Cruelty Rank 1
	.talent 2,1,3,1

level -- Cruelty Rank 2
	.talent 2,1,3,2

level -- Cruelty Rank 3
	.talent 2,1,3,3

level -- Cruelty Rank 4
	.talent 2,1,3,4

level -- Cruelty Rank 5
	.talent 2,1,3,5

level -- Deflection Rank 1
	.talent 1,1,2,1

level -- Deflection Rank 2
	.talent 1,1,2,2

level -- Deflection Rank 3
	.talent 1,1,2,3

level -- Deflection Rank 4
	.talent 1,1,2,4

level -- Deflection Rank 5
	.talent 1,1,2,5

level -- Tactical Mastery Rank 1
	.talent 1,2,2,1

level -- Tactical Mastery Rank 2
	.talent 1,2,2,2

level -- Tactical Mastery Rank 3
	.talent 1,2,2,3

level -- Tactical Mastery Rank 4
	.talent 1,2,2,4

level -- Tactical Mastery Rank 5
	.talent 1,2,2,5

level -- Anger Management
	.talent 1,3,2,1

level -- Improved Overpower Rank 1
	.talent 1,3,1,1

level -- Improved Overpower Rank 2
	.talent 1,3,1,2

level -- Improved Charge Rank 1
	.talent 1,2,1,1

level -- Improved Charge Rank 2
	.talent 1,2,1,2

level -- Two-Handed Weapon Specialization Rank 1
	.talent 1,4,2,1

]])


addon.talents.RegisterGuide([[
#name 硬核战士 30-55
#displayname 硬核战士 30-55 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 硬核战士 55-60
#minLevel 10
#maxLevel 55
#hardcore
#reset

level -- Improved Rend Rank 1
	.talent 1,1,3,1

level -- Improved Rend Rank 2
	.talent 1,1,3,2

level -- Improved Rend Rank 3
	.talent 1,1,3,3

level -- Deflection Rank 1
	.talent 1,1,2,1

level -- Deflection Rank 2
	.talent 1,1,2,2

level -- Tactical Mastery Rank 1
	.talent 1,2,2,1

level -- Tactical Mastery Rank 2
	.talent 1,2,2,2

level -- Tactical Mastery Rank 3
	.talent 1,2,2,3

level -- Tactical Mastery Rank 4
	.talent 1,2,2,4

level -- Tactical Mastery Rank 5
	.talent 1,2,2,5

level -- Anger Management
	.talent 1,3,2,1

level -- Improved Overpower Rank 1
	.talent 1,3,1,1

level -- Improved Overpower Rank 2
	.talent 1,3,1,2

level -- Deep Wounds Rank 1
	.talent 1,3,3,1

level -- Deep Wounds Rank 2
	.talent 1,3,3,2

level -- Two-Handed Weapon Specialization Rank 1
	.talent 1,4,2,1

level -- Two-Handed Weapon Specialization Rank 2
	.talent 1,4,2,2

level -- Two-Handed Weapon Specialization Rank 3
	.talent 1,4,2,3

level -- Two-Handed Weapon Specialization Rank 4
	.talent 1,4,2,4

level -- Two-Handed Weapon Specialization Rank 5
	.talent 1,4,2,5

level -- Sweeping Strikes
	.talent 1,5,2,1

level -- Deep Wounds Rank 3
	.talent 1,3,3,3

level -- Axe Specialization Rank 1
	.talent 1,5,1,1

level -- Axe Specialization Rank 2
	.talent 1,5,1,2

level -- Axe Specialization Rank 3
	.talent 1,5,1,3

level -- Axe Specialization Rank 4
	.talent 1,5,1,4

level -- Axe Specialization Rank 5
	.talent 1,5,1,5

level -- Impale Rank 1
	.talent 1,4,3,1

level -- Impale Rank 2
	.talent 1,4,3,2

level -- Deflection Rank 3
	.talent 1,1,2,3

level -- Mortal Strike
	.talent 1,7,2,1

level -- Cruelty Rank 1
	.talent 2,1,3,1

level -- Cruelty Rank 2
	.talent 2,1,3,2

level -- Cruelty Rank 3
	.talent 2,1,3,3

level -- Cruelty Rank 4
	.talent 2,1,3,4

level -- Cruelty Rank 5
	.talent 2,1,3,5

level -- Deflection Rank 4
	.talent 1,1,2,4

level -- Deflection Rank 5
	.talent 1,1,2,5

level -- Unbridled Wrath Rank 1
	.talent 2,2,3,1

level -- Unbridled Wrath Rank 2
	.talent 2,2,3,2

level -- Unbridled Wrath Rank 3
	.talent 2,2,3,3

level -- Unbridled Wrath Rank 4
	.talent 2,2,3,4

level -- Unbridled Wrath Rank 5
	.talent 2,2,3,5

level -- Piercing Howl
	.talent 2,3,2,1

level -- Blood Craze Rank 1
	.talent 2,3,3,1

level -- Blood Craze Rank 2
	.talent 2,3,3,2

]])


addon.talents.RegisterGuide([[
#name 硬核战士 55-60
#displayname 硬核战士 55-60 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#minLevel 10
#maxLevel 60
#hardcore
#reset

level -- Cruelty Rank 1
	.talent 2,1,3,1

level -- Cruelty Rank 2
	.talent 2,1,3,2

level -- Cruelty Rank 3
	.talent 2,1,3,3

level -- Cruelty Rank 4
	.talent 2,1,3,4

level -- Cruelty Rank 5
	.talent 2,1,3,5

level -- Unbridled Wrath Rank 1
	.talent 2,2,3,1

level -- Unbridled Wrath Rank 2
	.talent 2,2,3,2

level -- Unbridled Wrath Rank 3
	.talent 2,2,3,3

level -- Unbridled Wrath Rank 4
	.talent 2,2,3,4

level -- Unbridled Wrath Rank 5
	.talent 2,2,3,5

level -- Piercing Howl
	.talent 2,3,2,1

level -- Blood Craze Rank 1
	.talent 2,3,3,1

level -- Blood Craze Rank 2
	.talent 2,3,3,2

level -- Blood Craze Rank 3
	.talent 2,3,3,3

level -- Improved Battle Shout Rank 1
	.talent 2,3,4,1

level -- Dual Wield Specialization Rank 1
	.talent 2,4,1,1

level -- Dual Wield Specialization Rank 2
	.talent 2,4,1,2

level -- Dual Wield Specialization Rank 3
	.talent 2,4,1,3

level -- Dual Wield Specialization Rank 4
	.talent 2,4,1,4

level -- Dual Wield Specialization Rank 5
	.talent 2,4,1,5

level -- Death Wish
	.talent 2,5,2,1

level -- Enrage Rank 1
	.talent 2,4,3,1

level -- Enrage Rank 2
	.talent 2,4,3,2

level -- Enrage Rank 3
	.talent 2,4,3,3

level -- Enrage Rank 4
	.talent 2,4,3,4

level -- Enrage Rank 5
	.talent 2,4,3,5

level -- Flurry Rank 1
	.talent 2,6,3,1

level -- Flurry Rank 2
	.talent 2,6,3,2

level -- Flurry Rank 3
	.talent 2,6,3,3

level -- Flurry Rank 4
	.talent 2,6,3,4

level -- Bloodthirst
	.talent 2,7,2,1

level -- Flurry Rank 5
	.talent 2,6,3,5

level -- Deflection Rank 1
	.talent 1,1,2,1

level -- Deflection Rank 2
	.talent 1,1,2,2

level -- Deflection Rank 3
	.talent 1,1,2,3

level -- Deflection Rank 4
	.talent 1,1,2,4

level -- Deflection Rank 5
	.talent 1,1,2,5

level -- Tactical Mastery Rank 1
	.talent 1,2,2,1

level -- Tactical Mastery Rank 2
	.talent 1,2,2,2

level -- Tactical Mastery Rank 3
	.talent 1,2,2,3

level -- Tactical Mastery Rank 4
	.talent 1,2,2,4

level -- Tactical Mastery Rank 5
	.talent 1,2,2,5

level -- Anger Management
	.talent 1,3,2,1

level -- Improved Berserker Rage Rank 1
	.talent 2,6,1,1

level -- Improved Berserker Rage Rank 2
	.talent 2,6,1,2

level -- Improved Battle Shout Rank 2
	.talent 2,3,4,2

level -- Improved Battle Shout Rank 3
	.talent 2,3,4,3

level -- Improved Battle Shout Rank 4
	.talent 2,3,4,4

level -- Improved Battle Shout Rank 5
	.talent 2,3,4,5

level -- Improved Intercept Rank 1
	.talent 2,5,4,1

level -- Improved Intercept Rank 2
	.talent 2,5,4,2

]])

addon.talents.RegisterGuide([[
#name 软核战士 10-30
#displayname 软核战士 10-30 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 软核战士 30-55级
#minLevel 10
#maxLevel 30

level -- Cruelty Rank 1
	.talent 2,1,3,1

level -- Cruelty Rank 2
	.talent 2,1,3,2

level -- Cruelty Rank 3
	.talent 2,1,3,3

level -- Cruelty Rank 4
	.talent 2,1,3,4

level -- Cruelty Rank 5
	.talent 2,1,3,5

level -- Improved Rend Rank 1
	.talent 1,1,3,1

level -- Improved Rend Rank 2
	.talent 1,1,3,2

level -- Improved Rend Rank 3
	.talent 1,1,3,3

level -- Deflection Rank 1
	.talent 1,1,2,1

level -- Deflection Rank 2
	.talent 1,1,2,2

level -- Tactical Mastery Rank 1
	.talent 1,2,2,1

level -- Tactical Mastery Rank 2
	.talent 1,2,2,2

level -- Tactical Mastery Rank 3
	.talent 1,2,2,3

level -- Tactical Mastery Rank 4
	.talent 1,2,2,4

level -- Tactical Mastery Rank 5
	.talent 1,2,2,5

level -- Anger Management
	.talent 1,3,2,1

level -- Improved Overpower Rank 1
	.talent 1,3,1,1

level -- Improved Overpower Rank 2
	.talent 1,3,1,2

level -- Deep Wounds Rank 1
	.talent 1,3,3,1

level -- Deep Wounds Rank 2
	.talent 1,3,3,2

level -- Two-Handed Weapon Specialization Rank 1
	.talent 1,4,2,1

]])

addon.talents.RegisterGuide([[
#name 软核战士 30-55级
#displayname 软核战士 30-55级 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 低强度模式战士 55-60
#minLevel 10
#maxLevel 55
#reset

level -- Improved Rend Rank 1
	.talent 1,1,3,1

level -- Improved Rend Rank 2
	.talent 1,1,3,2

level -- Improved Rend Rank 3
	.talent 1,1,3,3

level -- Deflection Rank 1
	.talent 1,1,2,1

level -- Deflection Rank 2
	.talent 1,1,2,2

level -- Tactical Mastery Rank 1
	.talent 1,2,2,1

level -- Tactical Mastery Rank 2
	.talent 1,2,2,2

level -- Tactical Mastery Rank 3
	.talent 1,2,2,3

level -- Tactical Mastery Rank 4
	.talent 1,2,2,4

level -- Tactical Mastery Rank 5
	.talent 1,2,2,5

level -- Anger Management
	.talent 1,3,2,1

level -- Improved Overpower Rank 1
	.talent 1,3,1,1

level -- Improved Overpower Rank 2
	.talent 1,3,1,2

level -- Deep Wounds Rank 1
	.talent 1,3,3,1

level -- Deep Wounds Rank 2
	.talent 1,3,3,2

level -- Two-Handed Weapon Specialization Rank 1
	.talent 1,4,2,1

level -- Two-Handed Weapon Specialization Rank 2
	.talent 1,4,2,2

level -- Two-Handed Weapon Specialization Rank 3
	.talent 1,4,2,3

level -- Two-Handed Weapon Specialization Rank 4
	.talent 1,4,2,4

level -- Two-Handed Weapon Specialization Rank 5
	.talent 1,4,2,5

level -- Sweeping Strikes
	.talent 1,5,2,1

level -- Deep Wounds Rank 3
	.talent 1,3,3,3

level -- Axe Specialization Rank 1
	.talent 1,5,1,1

level -- Axe Specialization Rank 2
	.talent 1,5,1,2

level -- Axe Specialization Rank 3
	.talent 1,5,1,3

level -- Axe Specialization Rank 4
	.talent 1,5,1,4

level -- Axe Specialization Rank 5
	.talent 1,5,1,5

level -- Impale Rank 1
	.talent 1,4,3,1

level -- Impale Rank 2
	.talent 1,4,3,2

level -- Deflection Rank 3
	.talent 1,1,2,3

level -- Mortal Strike
	.talent 1,7,2,1

level -- Cruelty Rank 1
	.talent 2,1,3,1

level -- Cruelty Rank 2
	.talent 2,1,3,2

level -- Cruelty Rank 3
	.talent 2,1,3,3

level -- Cruelty Rank 4
	.talent 2,1,3,4

level -- Cruelty Rank 5
	.talent 2,1,3,5

level -- Deflection Rank 4
	.talent 1,1,2,4

level -- Deflection Rank 5
	.talent 1,1,2,5

level -- Unbridled Wrath Rank 1
	.talent 2,2,3,1

level -- Unbridled Wrath Rank 2
	.talent 2,2,3,2

level -- Unbridled Wrath Rank 3
	.talent 2,2,3,3

level -- Unbridled Wrath Rank 4
	.talent 2,2,3,4

level -- Unbridled Wrath Rank 5
	.talent 2,2,3,5

level -- Blood Craze Rank 1
	.talent 2,3,3,1

level -- Blood Craze Rank 2
	.talent 2,3,3,2

level -- Blood Craze Rank 3
	.talent 2,3,3,3

]])

addon.talents.RegisterGuide([[
#name 低强度模式战士 55-60
#displayname 低强度模式战士 55-60 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#minLevel 10
#maxLevel 60
#reset

level -- Cruelty Rank 1
	.talent 2,1,3,1

level -- Cruelty Rank 2
	.talent 2,1,3,2

level -- Cruelty Rank 3
	.talent 2,1,3,3

level -- Cruelty Rank 4
	.talent 2,1,3,4

level -- Cruelty Rank 5
	.talent 2,1,3,5

level -- Unbridled Wrath Rank 1
	.talent 2,2,3,1

level -- Unbridled Wrath Rank 2
	.talent 2,2,3,2

level -- Unbridled Wrath Rank 3
	.talent 2,2,3,3

level -- Unbridled Wrath Rank 4
	.talent 2,2,3,4

level -- Unbridled Wrath Rank 5
	.talent 2,2,3,5

level -- Blood Craze Rank 1
	.talent 2,3,3,1

level -- Blood Craze Rank 2
	.talent 2,3,3,2

level -- Blood Craze Rank 3
	.talent 2,3,3,3

level -- Improved Battle Shout Rank 1
	.talent 2,3,4,1

level -- Improved Battle Shout Rank 2
	.talent 2,3,4,2

level -- Dual Wield Specialization Rank 1
	.talent 2,4,1,1

level -- Dual Wield Specialization Rank 2
	.talent 2,4,1,2

level -- Dual Wield Specialization Rank 3
	.talent 2,4,1,3

level -- Dual Wield Specialization Rank 4
	.talent 2,4,1,4

level -- Dual Wield Specialization Rank 5
	.talent 2,4,1,5

level -- Death Wish
	.talent 2,5,2,1

level -- Enrage Rank 1
	.talent 2,4,3,1

level -- Enrage Rank 2
	.talent 2,4,3,2

level -- Enrage Rank 3
	.talent 2,4,3,3

level -- Enrage Rank 4
	.talent 2,4,3,4

level -- Enrage Rank 5
	.talent 2,4,3,5

level -- Flurry Rank 1
	.talent 2,6,3,1

level -- Flurry Rank 2
	.talent 2,6,3,2

level -- Flurry Rank 3
	.talent 2,6,3,3

level -- Flurry Rank 4
	.talent 2,6,3,4

level -- Bloodthirst
	.talent 2,7,2,1

level -- Flurry Rank 5
	.talent 2,6,3,5

level -- Improved Rend Rank 1
	.talent 1,1,3,1

level -- Improved Rend Rank 2
	.talent 1,1,3,2

level -- Improved Rend Rank 3
	.talent 1,1,3,3

level -- Deflection Rank 1
	.talent 1,1,2,1

level -- Deflection Rank 2
	.talent 1,1,2,2

level -- Tactical Mastery Rank 1
	.talent 1,2,2,1

level -- Tactical Mastery Rank 2
	.talent 1,2,2,2

level -- Tactical Mastery Rank 3
	.talent 1,2,2,3

level -- Tactical Mastery Rank 4
	.talent 1,2,2,4

level -- Tactical Mastery Rank 5
	.talent 1,2,2,5

level -- Anger Management
	.talent 1,3,2,1

level -- Deep Wounds Rank 1
	.talent 1,3,3,1

level -- Deep Wounds Rank 2
	.talent 1,3,3,2

level -- Deep Wounds Rank 3
	.talent 1,3,3,3

level -- Deflection Rank 3
	.talent 1,1,2,3

level -- Impale Rank 1
	.talent 1,4,3,1

level -- Impale Rank 2
	.talent 1,4,3,2

level -- Improved Berserker Rage Rank 1
	.talent 2,6,1,1

level -- Improved Berserker Rage Rank 2
	.talent 2,6,1,2

]])

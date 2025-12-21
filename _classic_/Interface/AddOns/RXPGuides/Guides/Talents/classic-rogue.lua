local _, addon = ...

if addon.player.class ~= "ROGUE" or addon.gameVersion >= 40000 then return end


addon.talents.RegisterGuide([[
#name 硬核潜行者10-60
#displayname 硬核潜行者10-60 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#minLevel 10
#maxLevel 60
#hardcore

level -- Remorseless Attacks Rank 1
	.talent 1,1,2,1

level -- Remorseless Attacks Rank 2
	.talent 1,1,2,2

level -- Improved Gouge Rank 1
	.talent 2,1,1,1

level -- Improved Gouge Rank 2
	.talent 2,1,1,2

level -- Improved Gouge Rank 3
	.talent 2,1,1,3

level -- Improved Sinister Strike Rank 1
	.talent 2,1,2,1

level -- Improved Sinister Strike Rank 2
	.talent 2,1,2,2

level -- Deflection Rank 1
	.talent 2,2,2,1

level -- Deflection Rank 2
	.talent 2,2,2,2

level -- Deflection Rank 3
	.talent 2,2,2,3

level -- Deflection Rank 4
	.talent 2,2,2,4

level -- Deflection Rank 5
	.talent 2,2,2,5

level -- Riposte
	.talent 2,3,2,1

level -- Precision Rank 1
	.talent 2,2,3,1

level -- Precision Rank 2
	.talent 2,2,3,2

level -- Precision Rank 3
	.talent 2,2,3,3

level -- Precision Rank 4
	.talent 2,2,3,4

level -- Precision Rank 5
	.talent 2,2,3,5

level -- Improved Sprint Rank 1
	.talent 2,3,4,1

level -- Improved Sprint Rank 2
	.talent 2,3,4,2

level -- Dual Wield Specialization Rank 1
	.talent 2,4,3,1

level -- Dual Wield Specialization Rank 2
	.talent 2,4,3,2

level -- Dual Wield Specialization Rank 3
	.talent 2,4,3,3

level -- Dual Wield Specialization Rank 4
	.talent 2,4,3,4

level -- Dual Wield Specialization Rank 5
	.talent 2,4,3,5

level -- Blade Flurry
	.talent 2,5,2,1

level -- Endurance Rank 1
	.talent 2,3,1,1

level -- Weapon Expertise Rank 1
	.talent 2,6,2,1

level -- Weapon Expertise Rank 2
	.talent 2,6,2,2

level -- Endurance Rank 2
	.talent 2,3,1,2

level -- Aggression Rank 1
	.talent 2,6,3,1

level -- Aggression Rank 2
	.talent 2,6,3,2

level -- Malice Rank 1
	.talent 1,1,3,1

level -- Malice Rank 2
	.talent 1,1,3,2

level -- Malice Rank 3
	.talent 1,1,3,3

level -- Improved Slice & Dice Rank 1
	.talent 1,2,4,1

level -- Improved Slice & Dice Rank 2
	.talent 1,2,4,2

level -- Improved Slice & Dice Rank 3
	.talent 1,2,4,3

level -- Malice Rank 4
	.talent 1,1,3,4

level -- Malice Rank 5
	.talent 1,1,3,5

level -- Relentless Strikes
	.talent 1,3,1,1

level -- Murder Rank 1
	.talent 1,2,2,1

level -- Murder Rank 2
	.talent 1,2,2,2

level -- Lethality Rank 1
	.talent 1,3,3,1

level -- Lethality Rank 2
	.talent 1,3,3,2

level -- Lethality Rank 3
	.talent 1,3,3,3

level -- Improved Poisons Rank 1
	.talent 1,4,3,1

level -- Improved Poisons Rank 2
	.talent 1,4,3,2

level -- Improved Poisons Rank 3
	.talent 1,4,3,3

level -- Improved Poisons Rank 4
	.talent 1,4,3,4

]])

addon.talents.RegisterGuide([[
#name 软核潜行者10-60
#displayname 软核潜行者10-60 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#minLevel 10
#maxLevel 60

level -- Remorseless Attacks Rank 1
	.talent 1,1,2,1

level -- Remorseless Attacks Rank 2
	.talent 1,1,2,2

level -- Improved Sinister Strike Rank 1
	.talent 2,1,2,1

level -- Improved Sinister Strike Rank 2
	.talent 2,1,2,2

level -- Improved Gouge Rank 1
	.talent 2,1,1,1

level -- Improved Gouge Rank 2
	.talent 2,1,1,2

level -- Improved Gouge Rank 3
	.talent 2,1,1,3

level -- Deflection Rank 1
	.talent 2,2,2,1

level -- Deflection Rank 2
	.talent 2,2,2,2

level -- Deflection Rank 3
	.talent 2,2,2,3

level -- Deflection Rank 4
	.talent 2,2,2,4

level -- Deflection Rank 5
	.talent 2,2,2,5

level -- Riposte
	.talent 2,3,2,1

level -- Precision Rank 1
	.talent 2,2,3,1

level -- Precision Rank 2
	.talent 2,2,3,2

level -- Precision Rank 3
	.talent 2,2,3,3

level -- Precision Rank 4
	.talent 2,2,3,4

level -- Precision Rank 5
	.talent 2,2,3,5

level -- Dual Wield Specialization Rank 1
	.talent 2,4,3,1

level -- Dual Wield Specialization Rank 2
	.talent 2,4,3,2

level -- Dual Wield Specialization Rank 3
	.talent 2,4,3,3

level -- Dual Wield Specialization Rank 4
	.talent 2,4,3,4

level -- Dual Wield Specialization Rank 5
	.talent 2,4,3,5

level -- Blade Flurry
	.talent 2,5,2,1

level -- Sword Specialization Rank 1
	.talent 2,5,3,1

level -- Sword Specialization Rank 2
	.talent 2,5,3,2

level -- Sword Specialization Rank 3
	.talent 2,5,3,3

level -- Weapon Expertise Rank 1
	.talent 2,6,2,1

level -- Weapon Expertise Rank 2
	.talent 2,6,2,2

level -- Aggression Rank 1
	.talent 2,6,3,1

level -- Aggression Rank 2
	.talent 2,6,3,2

level -- Aggression Rank 3
	.talent 2,6,3,3

level -- Adrenaline Rush
	.talent 2,7,2,1

level -- Malice Rank 1
	.talent 1,1,3,1

level -- Malice Rank 2
	.talent 1,1,3,2

level -- Malice Rank 3
	.talent 1,1,3,3

level -- Improved Slice & Dice Rank 1
	.talent 1,2,4,1

level -- Improved Slice & Dice Rank 2
	.talent 1,2,4,2

level -- Improved Slice & Dice Rank 3
	.talent 1,2,4,3

level -- Malice Rank 4
	.talent 1,1,3,4

level -- Malice Rank 5
	.talent 1,1,3,5

level -- Relentless Strikes
	.talent 1,3,1,1

level -- Murder Rank 1
	.talent 1,2,2,1

level -- Murder Rank 2
	.talent 1,2,2,2

level -- Lethality Rank 1
	.talent 1,3,3,1

level -- Lethality Rank 2
	.talent 1,3,3,2

level -- Lethality Rank 3
	.talent 1,3,3,3

level -- Lethality Rank 4
	.talent 1,3,3,4

level -- Lethality Rank 5
	.talent 1,3,3,5

level -- Improved Poisons Rank 1
	.talent 1,4,3,1

level -- Improved Poisons Rank 2
	.talent 1,4,3,2

]])

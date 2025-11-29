
HekiliDB = {
["namespaces"] = {
},
["profileKeys"] = {
["京东刘强东 - 时光IV"] = "Default",
["哔站陈睿 - 时光IV"] = "Default",
["美团王兴 - 时光IV"] = "Default",
["小米军儿 - 时光IV"] = "Default",
},
["profiles"] = {
["Default"] = {
["displays"] = {
["Interrupts"] = {
["delays"] = {
["fontSize"] = 23,
},
["rel"] = "CENTER",
["targets"] = {
["fontSize"] = 23,
},
["captions"] = {
["fontSize"] = 23,
},
["y"] = -99.18775177001953,
["x"] = -26.28247833251953,
["keybindings"] = {
["fontSize"] = 23,
},
},
["Cooldowns"] = {
["delays"] = {
["fontSize"] = 23,
},
["rel"] = "CENTER",
["targets"] = {
["fontSize"] = 23,
},
["captions"] = {
["fontSize"] = 23,
},
["keybindings"] = {
["fontSize"] = 23,
},
["x"] = 97.777099609375,
["y"] = -99.48690795898438,
},
["Primary"] = {
["primaryWidth"] = 30,
["rel"] = "CENTER",
["captions"] = {
["fontSize"] = 23,
},
["zoom"] = 0,
["queue"] = {
["width"] = 30,
["elvuiCooldown"] = true,
["height"] = 30,
},
["keybindings"] = {
["fontSize"] = 23,
},
["x"] = -20.50122451782227,
["primaryHeight"] = 30,
["targets"] = {
["fontSize"] = 23,
},
["delays"] = {
["fontSize"] = 23,
},
["visibility"] = {
["pve"] = {
["alpha"] = 0.45,
},
},
["y"] = -266.3392333984375,
},
["AOE"] = {
["primaryWidth"] = 30,
["rel"] = "CENTER",
["zoom"] = 0,
["captions"] = {
["fontSize"] = 23,
},
["queue"] = {
["width"] = 30,
["elvuiCooldown"] = true,
["height"] = 30,
},
["keybindings"] = {
["fontSize"] = 23,
},
["x"] = -16.4341983795166,
["primaryHeight"] = 30,
["targets"] = {
["fontSize"] = 23,
},
["y"] = -303.8196411132813,
["visibility"] = {
["pve"] = {
["alpha"] = 0.45,
},
},
["delays"] = {
["fontSize"] = 23,
},
},
["Defensives"] = {
["delays"] = {
["fontSize"] = 23,
},
["rel"] = "CENTER",
["targets"] = {
["fontSize"] = 23,
},
["captions"] = {
["fontSize"] = 23,
},
["y"] = -99.87171936035156,
["x"] = -86.7520980834961,
["keybindings"] = {
["fontSize"] = 23,
},
},
},
["runOnce"] = {
["forceReloadAllDefaultPriorities_20220228"] = true,
["forceEnableAllClassesOnceDueToBug_20220225"] = true,
["updateMaxRefreshToNewSpecOptions_20220222"] = true,
["forceReloadClassDefaultOptions_20220306_6"] = true,
["forceReloadClassDefaultOptions_20220306_2"] = true,
["forceEnableEnhancedRecheckBoomkin_20210712"] = true,
["forceReloadClassDefaultOptions_20220306_7"] = true,
["forceReloadClassDefaultOptions_20220306_1"] = true,
["resetAberrantPackageDates_20190728_1"] = true,
},
["notifications"] = {
["y"] = 26.6666259765625,
["x"] = 17.093994140625,
},
["specs"] = {
{
["settings"] = {
["rend_refresh_time"] = 0,
["execute_whirlwind_enabled"] = true,
["execute_bloodthirst_enabled"] = true,
["weave_cooldown_threshold"] = 1.5,
["weave_rage_threshold"] = 100,
["execute_slam_prio"] = true,
["arms"] = "武器",
["debuff_demoshout_enabled"] = false,
["queueing_threshold"] = 60,
["predict_tfb"] = true,
["shout_spell"] = "commanding_shout",
["optimize_overpower"] = false,
["debuff_sunder_enabled"] = true,
["protection"] = "防御 (wowtbc.gg)",
["weaving_enabled"] = false,
["weave_health_threshold"] = 20,
["main_gcd_spell"] = "slam",
["fury"] = "狂怒",
["execute_queueing_enabled"] = true,
},
["package"] = "防御",
},
{
["settings"] = {
["protection"] = "守护 96",
["min_six_delay"] = 4,
["hor_macros"] = false,
["squeeze_hw_in_bl"] = true,
["assigned_aura"] = "retribution_aura",
["maintain_blessing"] = true,
["holy"] = "神圣 (wowtbc.gg)",
["max_wait_for_six"] = 0.3,
["maintain_aura"] = true,
["retribution"] = "Retribution",
["fol_on_aow"] = false,
["judgement_of_wisdom_threshold"] = 70,
["holy_wrath_threshold"] = 2,
["divine_plea_threshold"] = 75,
["assigned_blessing"] = "blessing_of_kings",
["primary_slack"] = 0.5,
["highroll"] = false,
},
},
[6] = {
["settings"] = {
["blood_frost"] = "血冰(黑科研)",
["frost"] = "Frost DK (IV)",
["dual_auras"] = "双光环(黑科研)",
["unholy"] = "Unholy (IV)",
["unholy_frost"] = "邪冰(黑科研)",
["blood"] = "Blood (IV)",
},
["autoPacks"] = {
["blood_frost"] = "血冰(黑科研)",
["frost"] = "Frost DK (IV)",
["dual_auras"] = "双光环(黑科研)",
["unholy"] = "Unholy (IV)",
["unholy_frost"] = "邪冰(黑科研)",
["blood"] = "Blood (IV)",
},
},
[7] = {
["settings"] = {
["enhancement"] = "增强(IV)",
["shaman_rage_threshold"] = 60,
["restoration"] = "元素/恢复DPS(IV)",
["st_fn_mana_threshold"] = 3000,
["st_cl_mana_threshold"] = 80,
["elemental"] = "元素/恢复DPS(IV)",
},
["package"] = "元素/恢复DPS(IV)",
},
},
["packs"] = {
["惩戒 (LightClub)"] = {
["source"] = "https://discord.gg/lightclubclassic",
["builtIn"] = true,
["date"] = 20231114.1,
["spec"] = 2,
["desc"] = "Retribution Paladin rotation for Hekili based on LightClub-Discord recommendations",
["lists"] = {
["single"] = {
{
["enabled"] = true,
["criteria"] = "buff.seal.down",
["action"] = "seal_of_vengeance",
},
{
["enabled"] = true,
["criteria"] = "( ( variable.time_to_die * 0.9 - 20 ) > action.avenging_wrath.cooldown ) & ( ! buff.seal_of_vengeance.up || dot.holy_vengeance.stack > 4 )",
["action"] = "avenging_wrath",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.judgement_of_wisdom_threshold",
["action"] = "judgement_of_wisdom",
},
{
["action"] = "judgement_of_light",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "set_bonus.libram_of_three_truths & buff.formidable.count < 5",
["action"] = "crusader_strike",
},
{
["enabled"] = true,
["criteria"] = "set_bonus.tier10ret_2pc = 1 & settings.highroll",
["action"] = "divine_storm",
},
{
["action"] = "crusader_strike",
["enabled"] = true,
},
{
["action"] = "divine_storm",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.divine_plea_threshold",
["action"] = "divine_plea",
},
{
["enabled"] = true,
["criteria"] = "( target.is_demon || target.is_undead ) & buff.the_art_of_war.up & next_primary_at > settings.primary_slack & mana.percent > ( settings.judgement_of_wisdom_threshold / 4 )",
["action"] = "exorcism",
},
{
["enabled"] = true,
["criteria"] = "! buff.active_consecration.up & next_primary_at > settings.primary_slack & mana.percent > ( settings.judgement_of_wisdom_threshold / 3 )",
["action"] = "consecration",
},
{
["enabled"] = true,
["criteria"] = "buff.the_art_of_war.up & next_primary_at > settings.primary_slack & mana.percent > ( settings.judgement_of_wisdom_threshold / 3.5 )",
["action"] = "exorcism",
},
{
["enabled"] = true,
["criteria"] = "( target.is_demon || target.is_undead ) & next_primary_at > settings.primary_slack & mana.percent > ( settings.judgement_of_wisdom_threshold / 1.4 )",
["action"] = "holy_wrath",
},
{
["enabled"] = true,
["criteria"] = "settings.fol_on_aow & buff.the_art_of_war.up & next_primary_at > primary_slack & ! buff.divine_plea.up & cooldown.exorcism.remains > 6",
["action"] = "flash_of_light",
},
},
["default"] = {
{
["enabled"] = true,
["action"] = "call_action_list",
["list_name"] = "init",
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["action"] = "potion",
["enabled"] = true,
},
{
["use_off_gcd"] = 1,
["action"] = "hyperspeed_acceleration",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! settings.hor_macros & glyph.reckoning.enabled & ( debuff.training_dummy.up || ! aggro )",
["action"] = "hand_of_reckoning",
["use_off_gcd"] = 1,
},
{
["enabled"] = true,
["criteria"] = "buff.formidable.up & buff.formidable.remains < 2",
["action"] = "crusader_strike",
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1",
["action"] = "run_action_list",
["list_name"] = "cleave",
},
{
["enabled"] = true,
["criteria"] = "active_enemies = 1 & variable.execute_phase",
["action"] = "run_action_list",
["list_name"] = "execute",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["list_name"] = "single",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.retribution_aura",
["action"] = "retribution_aura",
["description"] = "November 2023",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.concentration_aura",
["action"] = "concentration_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.crusader_aura",
["action"] = "crusader_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.devotion_aura",
["action"] = "devotion_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.fire_resistance_aura",
["action"] = "fire_resistance_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.frost_resistance_aura",
["action"] = "frost_resistance_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.shadow_resistance_aura",
["action"] = "shadow_resistance_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_blessing & assigned_blessing.blessing_of_kings",
["action"] = "blessing_of_kings",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_blessing & assigned_blessing.blessing_of_might",
["action"] = "blessing_of_might",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_blessing & assigned_blessing.blessing_of_sanctuary",
["action"] = "blessing_of_sanctuary",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_blessing & assigned_blessing.blessing_of_wisdom",
["action"] = "blessing_of_wisdom",
},
{
["enabled"] = true,
["criteria"] = "buff.seal.remains < 360",
["action"] = "seal_of_vengeance",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.divine_plea_threshold",
["action"] = "divine_plea",
},
},
["execute"] = {
{
["enabled"] = true,
["criteria"] = "buff.seal.down",
["action"] = "seal_of_vengeance",
},
{
["enabled"] = true,
["criteria"] = "( ! buff.seal_of_vengeance.up || dot.holy_vengeance.stack > 4 )",
["action"] = "avenging_wrath",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.judgement_of_wisdom_threshold / 2.5",
["action"] = "judgement_of_wisdom",
},
{
["enabled"] = true,
["criteria"] = "set_bonus.tier10ret_2pc = 0 || ! settings.highroll",
["action"] = "hammer_of_wrath",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.judgement_of_wisdom_threshold",
["action"] = "judgement_of_wisdom",
},
{
["action"] = "judgement_of_light",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "set_bonus.tier10ret_2pc = 1 & settings.highroll",
["action"] = "divine_storm",
},
{
["action"] = "crusader_strike",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "set_bonus.tier10ret_2pc = 1",
["action"] = "divine_storm",
},
{
["enabled"] = true,
["criteria"] = "set_bonus.tier10ret_2pc = 1 & settings.highroll",
["action"] = "hammer_of_wrath",
},
{
["enabled"] = true,
["criteria"] = "! buff.active_consecration.up & variable.time_to_die > 4",
["action"] = "consecration",
},
{
["action"] = "divine_storm",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "mana.percent < ( settings.divine_plea_threshold / 2 )",
["action"] = "divine_plea",
},
{
["enabled"] = true,
["criteria"] = "buff.the_art_of_war.up & ( next_primary_at <? cooldown.hammer_of_wrath.remains ) > settings.primary_slack",
["action"] = "exorcism",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.divine_plea_threshold & ( next_primary_at <? cooldown.hammer_of_wrath.remains ) > settings.primary_slack",
["action"] = "divine_plea",
},
{
["enabled"] = true,
["criteria"] = "( target.is_demon || target.is_undead ) & ( next_primary_at <? cooldown.hammer_of_wrath.remains ) > settings.primary_slack & mana.percent > ( settings.judgement_of_wisdom_threshold / 1.4 )",
["action"] = "holy_wrath",
},
},
["init"] = {
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "( debuff.training_dummy.up & 300 ) || target.time_to_die",
["var_name"] = "time_to_die",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "target.health.pct < 20",
["var_name"] = "execute_phase",
},
},
["cleave"] = {
{
["enabled"] = true,
["criteria"] = "buff.seal.down",
["action"] = "seal_of_command",
},
{
["enabled"] = true,
["criteria"] = "( ( ( ( variable.time_to_die * 0.9 ) - 20 ) > action.avenging_wrath.cooldown ) || ( target.health.pct <= 20 ) ) & ( ! buff.seal_of_vengeance.up || dot.holy_vengeance.stack > 4 )",
["action"] = "avenging_wrath",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < ( settings.judgement_of_wisdom_threshold / 3 )",
["action"] = "judgement_of_wisdom",
},
{
["enabled"] = true,
["criteria"] = "set_bonus.tier10ret_2pc = 1",
["action"] = "divine_storm",
},
{
["enabled"] = true,
["criteria"] = "! moving & ! buff.active_consecration.up & active_enemies > 2",
["action"] = "consecration",
},
{
["action"] = "crusader_strike",
["enabled"] = true,
},
{
["action"] = "divine_storm",
["enabled"] = true,
},
{
["action"] = "hammer_of_wrath",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! moving & ! buff.active_consecration.up & mana.percent > ( settings.judgement_of_wisdom_threshold / 4 )",
["action"] = "consecration",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < ( settings.judgement_of_wisdom_threshold / 2 )",
["action"] = "judgement_of_wisdom",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < ( settings.divine_plea_threshold / 2 )",
["action"] = "divine_plea",
},
{
["enabled"] = true,
["criteria"] = "( target.is_demon || target.is_undead ) & active_enemies > 2 & mana.percent > ( settings.judgement_of_wisdom_threshold / 1.8 )",
["action"] = "holy_wrath",
},
{
["enabled"] = true,
["criteria"] = "buff.the_art_of_war.up & ( cooldown.crusader_strike.remains <? cooldown.divine_storm.remains ) > settings.primary_slack & mana.percent > ( settings.judgement_of_wisdom_threshold / 1.7 )",
["action"] = "exorcism",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.judgement_of_wisdom_threshold",
["action"] = "judgement_of_wisdom",
},
{
["action"] = "judgement_of_light",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.divine_plea_threshold",
["action"] = "divine_plea",
},
{
["enabled"] = true,
["criteria"] = "( target.is_demon || target.is_undead ) & mana.percent > ( settings.judgement_of_wisdom_threshold / 1.7 )",
["action"] = "holy_wrath",
},
},
},
["version"] = 20231114.1,
["warnings"] = "Imported 6 action lists.\n",
["profile"] = "# Paladin: Retribution\n# LightClub-Discord - https://discord.gg/lightclubclassic\n# November 2023\n\n## Precombat\nactions.precombat+=/retribution_aura,if=!up&settings.maintain_aura&assigned_aura.retribution_aura\nactions.precombat+=/concentration_aura,if=!up&settings.maintain_aura&assigned_aura.concentration_aura\nactions.precombat+=/crusader_aura,if=!up&settings.maintain_aura&assigned_aura.crusader_aura\nactions.precombat+=/devotion_aura,if=!up&settings.maintain_aura&assigned_aura.devotion_aura\nactions.precombat+=/fire_resistance_aura,if=!up&settings.maintain_aura&assigned_aura.fire_resistance_aura\nactions.precombat+=/frost_resistance_aura,if=!up&settings.maintain_aura&assigned_aura.frost_resistance_aura\nactions.precombat+=/shadow_resistance_aura,if=!up&settings.maintain_aura&assigned_aura.shadow_resistance_aura\nactions.precombat+=/blessing_of_kings,if=!up&settings.maintain_blessing&assigned_blessing.blessing_of_kings\nactions.precombat+=/blessing_of_might,if=!up&settings.maintain_blessing&assigned_blessing.blessing_of_might\nactions.precombat+=/blessing_of_sanctuary,if=!up&settings.maintain_blessing&assigned_blessing.blessing_of_sanctuary\nactions.precombat+=/blessing_of_wisdom,if=!up&settings.maintain_blessing&assigned_blessing.blessing_of_wisdom\nactions.precombat+=/seal_of_vengeance,if=buff.seal.remains<360\nactions.precombat+=/divine_plea,if=mana.percent<settings.divine_plea_threshold\n\n## Default\nactions+=/call_action_list,name=init\nactions+=/use_items\nactions+=/potion\nactions+=/hyperspeed_acceleration,use_off_gcd=1\nactions+=/hand_of_reckoning,use_off_gcd=1,if=!settings.hor_macros&glyph.reckoning.enabled&(debuff.training_dummy.up||!aggro)\nactions+=/crusader_strike,if=buff.formidable.up&buff.formidable.remains<2\nactions+=/run_action_list,name=cleave,if=active_enemies>1\nactions+=/run_action_list,name=execute,if=active_enemies=1&variable.execute_phase\nactions+=/run_action_list,name=single\n\n## Init Parameters\nactions.init+=/variable,name=time_to_die,value=(debuff.training_dummy.up&300)||target.time_to_die\nactions.init+=/variable,name=execute_phase,value=target.health.pct<20\n\n## Cleave\nactions.cleave+=/seal_of_command,if=buff.seal.down\nactions.cleave+=/avenging_wrath,if=((((variable.time_to_die*0.9)-20)>action.avenging_wrath.cooldown)||(target.health.pct<=20))&(!buff.seal_of_vengeance.up||dot.holy_vengeance.stack>4)\nactions.cleave+=/judgement_of_wisdom,if=mana.percent<(settings.judgement_of_wisdom_threshold/3)\nactions.cleave+=/divine_storm,if=set_bonus.tier10ret_2pc=1\nactions.cleave+=/consecration,if=!moving&!buff.active_consecration.up&active_enemies>2\nactions.cleave+=/crusader_strike\nactions.cleave+=/divine_storm\nactions.cleave+=/hammer_of_wrath\nactions.cleave+=/consecration,if=!moving&!buff.active_consecration.up&mana.percent>(settings.judgement_of_wisdom_threshold/4)\nactions.cleave+=/judgement_of_wisdom,if=mana.percent<(settings.judgement_of_wisdom_threshold/2)\nactions.cleave+=/divine_plea,if=mana.percent<(settings.divine_plea_threshold/2)\nactions.cleave+=/holy_wrath,if=(target.is_demon||target.is_undead)&active_enemies>2&mana.percent>(settings.judgement_of_wisdom_threshold/1.8)\nactions.cleave+=/exorcism,if=buff.the_art_of_war.up&(cooldown.crusader_strike.remains<?cooldown.divine_storm.remains)>settings.primary_slack&mana.percent>(settings.judgement_of_wisdom_threshold/1.7)\nactions.cleave+=/judgement_of_wisdom,if=mana.percent<settings.judgement_of_wisdom_threshold\nactions.cleave+=/judgement_of_light\nactions.cleave+=/divine_plea,if=mana.percent<settings.divine_plea_threshold\nactions.cleave+=/holy_wrath,if=(target.is_demon||target.is_undead)&mana.percent>(settings.judgement_of_wisdom_threshold/1.7)\n\n## Execute\nactions.execute+=/seal_of_vengeance,if=buff.seal.down\nactions.execute+=/avenging_wrath,if=(!buff.seal_of_vengeance.up||dot.holy_vengeance.stack>4)\nactions.execute+=/judgement_of_wisdom,if=mana.percent<settings.judgement_of_wisdom_threshold/2.5\nactions.execute+=/hammer_of_wrath,if=set_bonus.tier10ret_2pc=0||!settings.highroll\nactions.execute+=/judgement_of_wisdom,if=mana.percent<settings.judgement_of_wisdom_threshold\nactions.execute+=/judgement_of_light\nactions.execute+=/divine_storm,if=set_bonus.tier10ret_2pc=1&settings.highroll\nactions.execute+=/crusader_strike\nactions.execute+=/divine_storm,if=set_bonus.tier10ret_2pc=1\nactions.execute+=/hammer_of_wrath,if=set_bonus.tier10ret_2pc=1&settings.highroll\nactions.execute+=/consecration,if=!buff.active_consecration.up&variable.time_to_die>4\nactions.execute+=/divine_storm\nactions.execute+=/divine_plea,if=mana.percent<(settings.divine_plea_threshold/2)\nactions.execute+=/exorcism,if=buff.the_art_of_war.up&(next_primary_at<?cooldown.hammer_of_wrath.remains)>settings.primary_slack\nactions.execute+=/divine_plea,if=mana.percent<settings.divine_plea_threshold&(next_primary_at<?cooldown.hammer_of_wrath.remains)>settings.primary_slack\nactions.execute+=/holy_wrath,if=(target.is_demon||target.is_undead)&(next_primary_at<?cooldown.hammer_of_wrath.remains)>settings.primary_slack&mana.percent>(settings.judgement_of_wisdom_threshold/1.4)\n\n## Single\nactions.single+=/seal_of_vengeance,if=buff.seal.down\nactions.single+=/avenging_wrath,if=((variable.time_to_die*0.9-20)>action.avenging_wrath.cooldown)&(!buff.seal_of_vengeance.up||dot.holy_vengeance.stack>4)\nactions.single+=/judgement_of_wisdom,if=mana.percent<settings.judgement_of_wisdom_threshold\nactions.single+=/judgement_of_light\nactions.single+=/crusader_strike,if=set_bonus.libram_of_three_truths&buff.formidable.count<5\nactions.single+=/divine_storm,if=set_bonus.tier10ret_2pc=1&settings.highroll\nactions.single+=/crusader_strike\nactions.single+=/divine_storm\nactions.single+=/divine_plea,if=mana.percent<settings.divine_plea_threshold\nactions.single+=/exorcism,if=(target.is_demon||target.is_undead)&buff.the_art_of_war.up&next_primary_at>settings.primary_slack&mana.percent>(settings.judgement_of_wisdom_threshold/4)\nactions.single+=/consecration,if=!buff.active_consecration.up&next_primary_at>settings.primary_slack&mana.percent>(settings.judgement_of_wisdom_threshold/3)\nactions.single+=/exorcism,if=buff.the_art_of_war.up&next_primary_at>settings.primary_slack&mana.percent>(settings.judgement_of_wisdom_threshold/3.5)\nactions.single+=/holy_wrath,if=(target.is_demon||target.is_undead)&next_primary_at>settings.primary_slack&mana.percent>(settings.judgement_of_wisdom_threshold/1.4)\nactions.single+=/flash_of_light,if=settings.fol_on_aow&buff.the_art_of_war.up&next_primary_at>primary_slack&!buff.divine_plea.up&cooldown.exorcism.remains>6",
["basedOn"] = "Retribution",
["author"] = "Supernuss",
},
["增强"] = {
["builtIn"] = true,
["date"] = 20240413,
["author"] = "Supernuss",
["desc"] = "WotLK enhancement shaman rotation for Hekili",
["profile"] = "actions.precombat+=/windfury_weapon,if=!mainhand_imbued&!mainhand_has_spellpower\nactions.precombat+=/flametongue_weapon,rank=action.flametongue_weapon.max_rank-1,if=!mainhand_imbued&mainhand_has_spellpower\nactions.precombat+=/flametongue_weapon,if=!offhand_imbued\nactions.precombat+=/lightning_shield,if=buff.shield.down\nactions.precombat+=/call_of_the_elements,if=buff.earth_totem.down||buff.fire_totem.down||buff.water_totem.down||buff.air_totem.down\nactions.precombat+=/potion\n\nactions+=/wind_shear\nactions+=/windfury_weapon,if=!mainhand_imbued&!mainhand_has_spellpower\nactions+=/flametongue_weapon,rank=action.flametongue_weapon.max_rank-1,if=!mainhand_imbued&mainhand_has_spellpower\nactions+=/flametongue_weapon,if=!offhand_imbued\nactions+=/shamanistic_rage,if=set_bonus.tier10enhancement_2pc=1\nactions+=/use_items\nactions+=/potion\nactions+=/fire_elemental_totem\nactions+=/feral_spirit\nactions+=/use_items\n\nactions+=/fire_nova,if=active_enemies>1\nactions+=/chain_lightning,if=buff.maelstrom_weapon.stack=5&active_enemies>1\nactions+=/wait,if=active_enemies>1&cooldown.fire_nova.remains<=0.7&buff.fire_totem.remains>cooldown.fire_nova.remains,sec=cooldown.fire_nova.remains\nactions+=/lightning_bolt,if=buff.maelstrom_weapon.stack=5\nactions+=/flame_shock,cycle_targets=1,max_cycle_targets=2,if=!ticking&target.time_to_die>=9\nactions+=/call_of_the_elements,if=buff.fire_totem.down&buff.water_totem.remains<20\nactions+=/fire_nova\nactions+=/stormstrike,if=buff.stormstrike.down\nactions+=/magma_totem,if=buff.fire_totem.remains<=latency & buff.fire_elemental_totem.down\nactions+=/earth_shock\nactions+=/lightning_shield,if=talent.static_shock.enabled&buff.shield.down\nactions+=/stormstrike\nactions+=/lava_lash\nactions+=/magma_totem,if=buff.magma_totem.up&buff.magma_totem.remains<3\nactions+=/lightning_shield,if=talent.static_shock.enabled&buff.shield.stack<buff.shield.max_stack*0.33\nactions+=/shamanistic_rage,if=target.within10&mana.pct<settings.shaman_rage_threshold",
["version"] = 20240413,
["warnings"] = "Imported 2 action lists.\n",
["lists"] = {
["default"] = {
{
["action"] = "wind_shear",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! mainhand_imbued & ! mainhand_has_spellpower",
["action"] = "windfury_weapon",
},
{
["enabled"] = true,
["criteria"] = "! mainhand_imbued & mainhand_has_spellpower",
["action"] = "flametongue_weapon",
["rank"] = "action.flametongue_weapon.max_rank-1",
},
{
["enabled"] = true,
["criteria"] = "! offhand_imbued",
["action"] = "flametongue_weapon",
},
{
["enabled"] = true,
["criteria"] = "set_bonus.tier10enhancement_2pc = 1",
["action"] = "shamanistic_rage",
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["action"] = "potion",
["enabled"] = true,
},
{
["action"] = "fire_elemental_totem",
["enabled"] = true,
},
{
["action"] = "feral_spirit",
["enabled"] = true,
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1",
["action"] = "fire_nova",
},
{
["enabled"] = true,
["criteria"] = "buff.maelstrom_weapon.stack = 5 & active_enemies > 1",
["action"] = "chain_lightning",
},
{
["enabled"] = true,
["sec"] = "cooldown.fire_nova.remains",
["criteria"] = "active_enemies > 1 & cooldown.fire_nova.remains <= 0.7 & buff.fire_totem.remains > cooldown.fire_nova.remains",
["action"] = "wait",
},
{
["enabled"] = true,
["criteria"] = "buff.maelstrom_weapon.stack = 5",
["action"] = "lightning_bolt",
},
{
["enabled"] = true,
["action"] = "flame_shock",
["cycle_targets"] = 1,
["max_cycle_targets"] = "2",
["criteria"] = "! ticking & target.time_to_die >= 9",
},
{
["enabled"] = true,
["criteria"] = "buff.fire_totem.down & buff.water_totem.remains < 20",
["action"] = "call_of_the_elements",
},
{
["action"] = "fire_nova",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.stormstrike.down",
["action"] = "stormstrike",
},
{
["enabled"] = true,
["criteria"] = "buff.fire_totem.remains <= latency & buff.fire_elemental_totem.down",
["action"] = "magma_totem",
},
{
["action"] = "earth_shock",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "talent.static_shock.enabled & buff.shield.down",
["action"] = "lightning_shield",
},
{
["action"] = "stormstrike",
["enabled"] = true,
},
{
["action"] = "lava_lash",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.magma_totem.up & buff.magma_totem.remains < 3",
["action"] = "magma_totem",
},
{
["enabled"] = true,
["criteria"] = "talent.static_shock.enabled & buff.shield.stack < buff.shield.max_stack * 0.33",
["action"] = "lightning_shield",
},
{
["enabled"] = true,
["criteria"] = "target.within10 & mana.pct < settings.shaman_rage_threshold",
["action"] = "shamanistic_rage",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "! mainhand_imbued & ! mainhand_has_spellpower",
["action"] = "windfury_weapon",
},
{
["enabled"] = true,
["criteria"] = "! mainhand_imbued & mainhand_has_spellpower",
["action"] = "flametongue_weapon",
["rank"] = "action.flametongue_weapon.max_rank-1",
},
{
["enabled"] = true,
["criteria"] = "! offhand_imbued",
["action"] = "flametongue_weapon",
},
{
["enabled"] = true,
["criteria"] = "buff.shield.down",
["action"] = "lightning_shield",
},
{
["enabled"] = true,
["criteria"] = "buff.earth_totem.down || buff.fire_totem.down || buff.water_totem.down || buff.air_totem.down",
["action"] = "call_of_the_elements",
},
{
["action"] = "potion",
["enabled"] = true,
},
},
},
["basedOn"] = "Enhancement (IV) (2)",
["spec"] = 7,
},
["冰霜DK(wowtbc.gg)"] = {
["source"] = "https://wowtbc.gg/wotlk/class-guides/frost-death-knight/",
["builtIn"] = true,
["date"] = 20221003,
["spec"] = 6,
["desc"] = "This priority is based upon the wowtbc.gg Wrath guide.",
["lists"] = {
["default"] = {
{
["action"] = "mind_freeze",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! dot.frost_fever.ticking",
["action"] = "icy_touch",
},
{
["enabled"] = true,
["criteria"] = "! dot.blood_plague.ticking",
["action"] = "plague_strike",
},
{
["action"] = "unbreakable_armor",
["enabled"] = true,
},
{
["action"] = "potion",
["enabled"] = true,
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "blood_runes.current < 2",
["action"] = "blood_tap",
},
{
["action"] = "obliterate",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.ticking & dot.blood_plague.ticking & ( active_dot.frost_fever < active_enemies || active_dot.blood_plague < active_enemies || glyph.disease.enabled & ( dot.frost_fever.remains < 5 || dot.blood_plague.remains < 5 ) )",
["action"] = "pestilence",
},
{
["enabled"] = true,
["criteria"] = "blood_runes.current + frost_runes.current + unholy_runes.current < 3",
["action"] = "empower_rune_weapon",
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1 & buff.killing_machine.up",
["action"] = "howling_blast",
},
{
["enabled"] = true,
["criteria"] = "active_enemies = 1 & buff.killing_machine.up",
["action"] = "frost_strike",
},
{
["enabled"] = true,
["criteria"] = "buff.rime.up",
["action"] = "howling_blast",
},
{
["action"] = "frost_strike",
["enabled"] = true,
},
{
["action"] = "horn_of_winter",
["enabled"] = true,
},
},
["precombat"] = {
{
["enabled"] = true,
["potion"] = "indestructible_potion",
["action"] = "potion",
},
{
["enabled"] = true,
["criteria"] = "buff.presence.down",
["action"] = "blood_presence",
},
{
["action"] = "raise_dead",
["enabled"] = true,
},
{
["action"] = "death_and_decay",
["enabled"] = true,
},
{
["action"] = "army_of_the_dead",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "runic_power.deficit > 10",
["action"] = "horn_of_winter",
},
{
["action"] = "potion",
["enabled"] = true,
},
},
},
["version"] = 20221003,
["warnings"] = "Imported 2 action lists.\n",
["profile"] = "## Frost Death Knight (wowtbc.gg)\n## 3 October 2022\n\nactions.precombat+=/potion,name=indestructible_potion\nactions.precombat+=/blood_presence,if=buff.presence.down\nactions.precombat+=/raise_dead\nactions.precombat+=/death_and_decay\nactions.precombat+=/army_of_the_dead\nactions.precombat+=/horn_of_winter,if=runic_power.deficit>10\nactions.precombat+=/potion\n\nactions+=/mind_freeze\nactions+=/icy_touch,if=!dot.frost_fever.ticking\nactions+=/plague_strike,if=!dot.blood_plague.ticking\nactions+=/unbreakable_armor\nactions+=/potion\nactions+=/use_items\nactions+=/blood_tap,if=blood_runes.current<2\nactions+=/obliterate\nactions+=/pestilence,if=dot.frost_fever.ticking&dot.blood_plague.ticking&(active_dot.frost_fever<active_enemies||active_dot.blood_plague<active_enemies||glyph.disease.enabled&(dot.frost_fever.remains<5||dot.blood_plague.remains<5))\nactions+=/empower_rune_weapon,if=blood_runes.current+frost_runes.current+unholy_runes.current<3\nactions+=/howling_blast,if=active_enemies>1&buff.killing_machine.up\nactions+=/frost_strike,if=active_enemies=1&buff.killing_machine.up\nactions+=/howling_blast,if=buff.rime.up\nactions+=/frost_strike\nactions+=/horn_of_winter",
["author"] = "wowtbc.gg",
},
["冰霜DK(IV)"] = {
["source"] = "https://www.icy-veins.com/wotlk-classic/frost-death-knight-dps-pve-rotation-cooldowns-abilities",
["builtIn"] = true,
["date"] = 20221001,
["spec"] = 6,
["desc"] = "Frost DK priority based on Icy Veins' guide.",
["profile"] = "## Frost Death Knight (Icy Veins)\n## 2022-10-01\n\nactions.precombat+=/blood_presence\nactions.precombat+=/horn_of_winter,if=buff.horn_of_winter.down\n\nactions+=/mind_freeze\nactions+=/icy_touch,if=!dot.frost_fever.ticking\nactions+=/howling_blast,if=glyph.howling_blast.enabled&!dot.frost_fever.ticking\nactions+=/plague_strike,if=!dot.blood_plague.ticking\nactions+=/pestilence,if=dot.frost_fever.ticking&dot.blood_plague.ticking&active_dot.frost_fever+active_dot.blood_plague<2*true_active_enemies\nactions+=/unbreakable_armor\nactions+=/blood_tap,if=blood_runes.current<2\nactions+=/obliterate\nactions+=/pestilence,if=glyph.disease.enabled&dot.frost_fever.ticking&dot.blood_plague.ticking&(dot.frost_fever.refreshable||dot.blood_plague.refreshable)\nactions+=/empower_rune_weapon,if=blood_runes.current+frost_runes.current+unholy_runes.current<3\nactions+=/use_items\nactions+=/call_action_list,name=aoe,strict=1,if=active_enemies>1\nactions+=/frost_strike,if=buff.killing_machine.up\nactions+=/howling_blast,if=buff.freezing_fog.up\nactions+=/blood_strike\nactions+=/frost_strike\n\nactions.aoe+=/howling_blast\nactions.aoe+=/death_and_decay,if=!moving&fight_remains>8",
["version"] = 20221001,
["warnings"] = "Imported 3 action lists.\n",
["author"] = "Icy-Veins",
["lists"] = {
["aoe"] = {
{
["action"] = "howling_blast",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! moving & fight_remains > 8",
["action"] = "death_and_decay",
},
},
["default"] = {
{
["action"] = "mind_freeze",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! dot.frost_fever.ticking",
["action"] = "icy_touch",
},
{
["enabled"] = true,
["criteria"] = "glyph.howling_blast.enabled & ! dot.frost_fever.ticking",
["action"] = "howling_blast",
},
{
["enabled"] = true,
["criteria"] = "! dot.blood_plague.ticking",
["action"] = "plague_strike",
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.ticking & dot.blood_plague.ticking & active_dot.frost_fever + active_dot.blood_plague < 2 * true_active_enemies",
["action"] = "pestilence",
},
{
["action"] = "unbreakable_armor",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "blood_runes.current < 2",
["action"] = "blood_tap",
},
{
["action"] = "obliterate",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "glyph.disease.enabled & dot.frost_fever.ticking & dot.blood_plague.ticking & ( dot.frost_fever.refreshable || dot.blood_plague.refreshable )",
["action"] = "pestilence",
},
{
["enabled"] = true,
["criteria"] = "blood_runes.current + frost_runes.current + unholy_runes.current < 3",
["action"] = "empower_rune_weapon",
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["enabled"] = true,
["action"] = "call_action_list",
["strict"] = 1,
["criteria"] = "active_enemies > 1",
["list_name"] = "aoe",
},
{
["enabled"] = true,
["criteria"] = "buff.killing_machine.up",
["action"] = "frost_strike",
},
{
["enabled"] = true,
["criteria"] = "buff.freezing_fog.up",
["action"] = "howling_blast",
},
{
["action"] = "blood_strike",
["enabled"] = true,
},
{
["action"] = "frost_strike",
["enabled"] = true,
},
},
["precombat"] = {
{
["action"] = "blood_presence",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.horn_of_winter.down",
["action"] = "horn_of_winter",
},
},
},
},
["元素/恢复DPS(IV)"] = {
["source"] = "https://www.icy-veins.com/wotlk-classic/elemental-shaman-dps-pve-rotation-cooldowns-abilities",
["builtIn"] = true,
["date"] = 20220925,
["spec"] = 7,
["desc"] = "This priority pack, designed for Elemental (but recommended for Resto DPS as well) is based upon Icy-Veins' Elemental Shaman guide for Wrath.",
["lists"] = {
["aoe"] = {
{
["enabled"] = true,
["criteria"] = "buff.fire_totem.down",
["action"] = "magma_totem",
},
{
["action"] = "fire_nova",
["enabled"] = true,
},
{
["action"] = "elemental_mastery",
["enabled"] = true,
},
{
["action"] = "chain_lightning",
["enabled"] = true,
},
{
["enabled"] = true,
["description"] = "actions.aoe+=/thunderstorm,if=mana.pct<90||target.distance<10&glyph.glyph_of_thunderstorm.enabled",
["criteria"] = "target.distance <= 10 & mana.pct < 90 || mana.pct < settings.st_cl_mana_threshold",
["action"] = "thunderstorm",
},
},
["default"] = {
{
["action"] = "wind_shear",
["enabled"] = true,
},
{
["action"] = "fire_elemental_totem",
["enabled"] = true,
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["enabled"] = true,
["action"] = "call_action_list",
["criteria"] = "active_enemies > 1",
["list_name"] = "aoe",
},
{
["action"] = "elemental_mastery",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! ticking",
["action"] = "flame_shock",
},
{
["enabled"] = true,
["criteria"] = "dot.flame_shock.remains > cast_time",
["action"] = "lava_burst",
},
{
["enabled"] = true,
["criteria"] = "moving & dot.flame_shock.ticking",
["action"] = "earth_shock",
},
{
["enabled"] = true,
["description"] = "Need to create this specialization option.",
["criteria"] = "mana.pct > settings.st_cl_mana_threshold",
["action"] = "chain_lightning",
},
{
["enabled"] = true,
["criteria"] = "target.distance <= 10 & mana.pct < 90 || mana.pct < settings.st_cl_mana_threshold",
["action"] = "thunderstorm",
},
{
["action"] = "lightning_bolt",
["enabled"] = true,
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "! mainhand_imbued",
["action"] = "flametongue_weapon",
},
{
["enabled"] = true,
["description"] = "Place your totems if they're not already up, don't want to use it if we've used a major CD totem.",
["criteria"] = "buff.earth_totem.down & buff.fire_totem.down & buff.water_totem.down & buff.air_totem.down",
["action"] = "call_of_the_elements",
},
{
["enabled"] = true,
["criteria"] = "buff.fire_totem.down",
["action"] = "totem_of_wrath",
},
{
["enabled"] = true,
["description"] = "Need to find a way to verify that the snapshot has taken place.",
["criteria"] = "buff.totem_of_wrath.up & buff.demonic_pact.up",
["action"] = "searing_totem",
},
},
},
["version"] = 20220925,
["warnings"] = "Imported 3 action lists.\n",
["author"] = "Icy-Veins",
["profile"] = "## Elemental Shaman (Icy Veins)\n## 2022-09-25\n\nactions.precombat+=/flametongue_weapon,if=!mainhand_imbued\n# Place your totems if they're not already up; don't want to use it if we've used a major CD totem.\nactions.precombat+=/call_of_the_elements,if=buff.earth_totem.down&buff.fire_totem.down&buff.water_totem.down&buff.air_totem.down\nactions.precombat+=/totem_of_wrath,if=buff.fire_totem.down\n# Need to find a way to verify that the snapshot has taken place.\nactions.precombat+=/searing_totem,if=buff.totem_of_wrath.up&buff.demonic_pact.up\n\nactions+=/wind_shear\nactions+=/fire_elemental_totem\nactions+=/use_items\nactions+=/call_action_list,name=aoe,if=active_enemies>1\nactions+=/elemental_mastery\nactions+=/flame_shock,if=!ticking\nactions+=/lava_burst,if=dot.flame_shock.remains>cast_time\nactions+=/earth_shock,if=moving&dot.flame_shock.ticking\n# Need to create this specialization option.\nactions+=/chain_lightning,if=mana.pct>settings.st_cl_mana_threshold\nactions+=/thunderstorm,if=target.distance<=10&mana.pct<90||mana.pct<settings.st_cl_mana_threshold\nactions+=/lightning_bolt\n\nactions.aoe+=/magma_totem,if=buff.fire_totem.down\nactions.aoe+=/fire_nova\nactions.aoe+=/elemental_mastery\nactions.aoe+=/chain_lightning\n## Need to enable glyphs for this to work.\n# actions.aoe+=/thunderstorm,if=mana.pct<90||target.distance<10&glyph.glyph_of_thunderstorm.enabled\nactions.aoe+=/thunderstorm,if=target.distance<=10&mana.pct<90||mana.pct<settings.st_cl_mana_threshold",
},
["邪恶(IV)"] = {
["source"] = "https://www.icy-veins.com/wotlk-classic/unholy-death-knight-dps-pve-rotation-cooldowns-abilities",
["builtIn"] = true,
["date"] = 20220926.3,
["spec"] = 6,
["desc"] = "This priority is based on the Icy Veins guide.",
["lists"] = {
["default"] = {
{
["action"] = "mind_freeze",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! dot.blood_plague.ticking & target.time_to_die >= 10 & fight_remains >= 10",
["action"] = "plague_strike",
},
{
["enabled"] = true,
["criteria"] = "! dot.frost_fever.ticking & target.time_to_die >= 10 & fight_remains >= 10",
["action"] = "icy_touch",
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.ticking & dot.blood_plague.ticking & ( active_dot.frost_fever < active_enemies || active_dot.blood_plague < active_enemies )",
["action"] = "pestilence",
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1 & ! moving & fight_remains > 8",
["action"] = "death_and_decay",
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.ticking & dot.blood_plague.ticking || fight_remains < 8",
["action"] = "blood_strike",
},
{
["action"] = "scourge_strike",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "blood_runes.current = 0",
["action"] = "blood_tap",
},
{
["action"] = "summon_gargoyle",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "pet.ghoul.up",
["action"] = "ghoul_frenzy",
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "runic_power.deficit <= 15",
["action"] = "death_coil",
},
{
["enabled"] = true,
["criteria"] = "buff.horn_of_winter.down",
["action"] = "horn_of_winter",
},
{
["enabled"] = true,
["criteria"] = "! buff.blood_presence.up & action.summon_gargoyle.time_since < gcd * 2 & cooldown.blood_tap.remains",
["action"] = "blood_presence",
},
{
["enabled"] = true,
["buff_name"] = "blood_tap",
["action"] = "cancel_buff",
["criteria"] = "cooldown.empower_rune_weapon.ready & blood_runes.current = 0 & frost_runes.current = 0 & unholy_runes.current = 0",
},
{
["enabled"] = true,
["criteria"] = "buff.blood_tap.down & ( blood_runes.current + frost_runes.current + unholy_runes.current < 3 )",
["action"] = "empower_rune_weapon",
},
{
["enabled"] = true,
["criteria"] = "runic_power.current > 60",
["action"] = "death_coil",
},
{
["action"] = "icy_touch",
["enabled"] = true,
},
{
["action"] = "plague_strike",
["enabled"] = true,
},
{
["action"] = "blood_strike",
["enabled"] = true,
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "buff.presence.down & cooldown.summon_gargoyle.ready",
["action"] = "unholy_presence",
},
{
["enabled"] = true,
["criteria"] = "buff.presence.down & ! cooldown.summon_gargoyle.ready",
["action"] = "blood_presence",
},
{
["enabled"] = true,
["criteria"] = "talent.master_of_ghouls.enabled",
["action"] = "raise_dead",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "dot.frost_fever.ticking & dot.blood_plague.ticking || target.time_to_die < 10 || fight_remains < 10",
["var_name"] = "diseases_ok",
},
},
},
["version"] = 20220926.3,
["warnings"] = "Imported 2 action lists.\n",
["author"] = "Icy Veins",
["profile"] = "## Unholy Death Knight (Icy Veins)\n## 2022-09-26\n\nactions.precombat+=/unholy_presence,if=buff.presence.down&cooldown.summon_gargoyle.ready\nactions.precombat+=/blood_presence,if=buff.presence.down&!cooldown.summon_gargoyle.ready\nactions.precombat+=/raise_dead,if=talent.master_of_ghouls.enabled\nactions.precombat+=/variable,name=diseases_ok,value=dot.frost_fever.ticking&dot.blood_plague.ticking||target.time_to_die<10||fight_remains<10\n\nactions+=/mind_freeze\nactions+=/plague_strike,if=!dot.blood_plague.ticking&target.time_to_die>=10&fight_remains>=10\nactions+=/icy_touch,if=!dot.frost_fever.ticking&target.time_to_die>=10&fight_remains>=10\nactions+=/pestilence,if=dot.frost_fever.ticking&dot.blood_plague.ticking&(active_dot.frost_fever<active_enemies||active_dot.blood_plague<active_enemies)\nactions+=/death_and_decay,if=active_enemies>1&!moving&fight_remains>8\nactions+=/blood_strike,if=dot.frost_fever.ticking&dot.blood_plague.ticking||fight_remains<8\nactions+=/scourge_strike\nactions+=/blood_tap,if=blood_runes.current=0\nactions+=/summon_gargoyle\nactions+=/ghoul_frenzy,if=pet.ghoul.up\nactions+=/use_items\nactions+=/death_coil,if=runic_power.deficit<=15\nactions+=/horn_of_winter,if=buff.horn_of_winter.down\nactions+=/blood_presence,if=!buff.blood_presence.up&action.summon_gargoyle.time_since<gcd*2&cooldown.blood_tap.remains\nactions+=/cancel_buff,name=blood_tap,if=cooldown.empower_rune_weapon.ready&blood_runes.current=0&frost_runes.current=0&unholy_runes.current=0\nactions+=/empower_rune_weapon,if=buff.blood_tap.down&(blood_runes.current+frost_runes.current+unholy_runes.current<3)\nactions+=/death_coil,if=runic_power.current>60\nactions+=/icy_touch\nactions+=/plague_strike\nactions+=/blood_strike",
},
["神圣 (wowtbc.gg)"] = {
["source"] = "https://wowtbc.gg/wotlk/class-guides/holy-paladin/",
["builtIn"] = true,
["date"] = 20221002.1,
["spec"] = 2,
["desc"] = "This priority is based on the wowtbc.gg Wrath guide.",
["lists"] = {
["default"] = {
{
["enabled"] = true,
["criteria"] = "active_dot.beacon_of_light = 0",
["action"] = "beacon_of_light",
},
{
["enabled"] = true,
["criteria"] = "buff.seal.down",
["action"] = "seal_of_wisdom",
},
{
["enabled"] = true,
["criteria"] = "target.distance < 10 & mana.percent < 70",
["action"] = "judgement_of_wisdom",
},
{
["action"] = "judgement_of_light",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "active_dot.sacred_shield = 0",
["action"] = "sacred_shield",
},
{
["action"] = "avenging_wrath",
["enabled"] = true,
},
{
["action"] = "divine_illumination",
["enabled"] = true,
},
{
["action"] = "divine_plea",
["enabled"] = true,
},
{
["action"] = "potion",
["enabled"] = true,
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["action"] = "divine_favor",
["enabled"] = true,
},
{
["action"] = "holy_shock",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "target.distance < 10",
["action"] = "shield_of_righteousness",
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1 & target.distance < 10",
["action"] = "consecration",
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1 & ( target.is_demon || target.is_undead )",
["action"] = "holy_wrath",
},
{
["action"] = "exorcism",
["enabled"] = true,
},
},
["precombat"] = {
{
["action"] = "retribution_aura",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.blessing.down",
["action"] = "blessing_of_kings",
},
{
["enabled"] = true,
["criteria"] = "buff.blessing.down",
["action"] = "blessing_of_wisdom",
},
},
},
["version"] = 20221002.1,
["warnings"] = "Imported 2 action lists.\n",
["profile"] = "## Holy Paladin\n## 2 October 2022\n\nactions.precombat+=/assigned_aura\nactions.precombat+=/blessing_of_kings,if=buff.blessing.down\nactions.precombat+=/blessing_of_wisdom,if=buff.blessing.down\n\nactions+=/beacon_of_light,if=active_dot.beacon_of_light=0\nactions+=/seal_of_wisdom,if=buff.seal.down\nactions+=/judgement_of_wisdom,if=target.distance<10&mana.percent<70\nactions+=/judgement_of_light\nactions+=/sacred_shield,if=active_dot.sacred_shield=0\nactions+=/avenging_wrath\nactions+=/divine_illumination\nactions+=/divine_plea\nactions+=/potion\nactions+=/use_items\nactions+=/divine_favor\nactions+=/holy_shock\nactions+=/shield_of_righteousness,if=target.distance<10\nactions+=/consecration,if=active_enemies>1&target.distance<10\nactions+=/holy_wrath,if=active_enemies>1&(target.is_demon||target.is_undead)\nactions+=/exorcism",
["author"] = "wowtbc.gg",
},
["守护 96"] = {
["source"] = "https://github.com/wowsims/wotlk/blob/master/sim/paladin/protection/rotation.go",
["builtIn"] = true,
["date"] = 20231129.1,
["spec"] = 2,
["desc"] = "Protection Paladin rotation for Hekili. Based on wowsims logic, refactored for 9696 rotation",
["lists"] = {
["six"] = {
{
["enabled"] = true,
["criteria"] = "active_enemies > 1 & cooldown.shield_of_righteousness.remains <= settings.min_six_delay + settings.max_wait_for_six",
["action"] = "hammer_of_the_righteous",
},
{
["enabled"] = true,
["criteria"] = "cooldown.hammer_of_the_righteous.remains <= settings.min_six_delay + settings.max_wait_for_six",
["action"] = "shield_of_righteousness",
},
{
["enabled"] = true,
["criteria"] = "cooldown.shield_of_righteousness.remains <= settings.min_six_delay + settings.max_wait_for_six",
["action"] = "hammer_of_the_righteous",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "talent.improved_righteous_fury.enabled",
["action"] = "righteous_fury",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.retribution_aura",
["action"] = "retribution_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.concentration_aura",
["action"] = "concentration_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.crusader_aura",
["action"] = "crusader_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.devotion_aura",
["action"] = "devotion_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.fire_resistance_aura",
["action"] = "fire_resistance_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.frost_resistance_aura",
["action"] = "frost_resistance_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_aura & assigned_aura.shadow_resistance_aura",
["action"] = "shadow_resistance_aura",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_blessing & assigned_blessing.blessing_of_kings",
["action"] = "blessing_of_kings",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_blessing & assigned_blessing.blessing_of_might",
["action"] = "blessing_of_might",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_blessing & assigned_blessing.blessing_of_sanctuary",
["action"] = "blessing_of_sanctuary",
},
{
["enabled"] = true,
["criteria"] = "! up & settings.maintain_blessing & assigned_blessing.blessing_of_wisdom",
["action"] = "blessing_of_wisdom",
},
{
["enabled"] = true,
["criteria"] = "buff.seal.remains < 360",
["action"] = "seal_of_vengeance",
},
{
["enabled"] = true,
["criteria"] = "buff.sacred_shield.remains <= 0",
["action"] = "sacred_shield",
},
{
["action"] = "holy_shield",
["enabled"] = true,
},
{
["action"] = "potion",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.judgement_of_wisdom_threshold",
["action"] = "judgement_of_wisdom",
},
{
["action"] = "judgement_of_light",
["enabled"] = true,
},
},
["default"] = {
{
["enabled"] = true,
["criteria"] = "buff.seal.down & active_enemies > 1",
["action"] = "seal_of_command",
},
{
["enabled"] = true,
["criteria"] = "buff.seal.down & active_enemies = 1",
["action"] = "seal_of_vengeance",
},
{
["action"] = "avenging_wrath",
["enabled"] = true,
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["action"] = "potion",
["enabled"] = true,
},
{
["use_off_gcd"] = 1,
["action"] = "hyperspeed_acceleration",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "target.health.pct <= 20 & ( action.shield_of_righteousness.time_since <? action.hammer_of_the_righteous.time_since ) < settings.min_six_delay",
["action"] = "hammer_of_wrath",
},
{
["enabled"] = true,
["criteria"] = "( action.shield_of_righteousness.time_since <? action.hammer_of_the_righteous.time_since ) < settings.min_six_delay - settings.max_wait_for_six & ! ( cooldown.hammer_of_the_righteous.up & cooldown.shield_of_righteousness.up )",
["action"] = "run_action_list",
["list_name"] = "nine",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["list_name"] = "six",
},
},
["nine"] = {
{
["enabled"] = true,
["criteria"] = "! buff.active_consecration.up & active_enemies > 3",
["action"] = "consecration",
},
{
["enabled"] = true,
["criteria"] = "aggro || debuff.training_dummy.up",
["action"] = "holy_shield",
},
{
["enabled"] = true,
["criteria"] = "! buff.devine_plea.up & ( glyph.divine_plea.enabled || ( mana.percent < settings.divine_plea_threshold ) )",
["action"] = "divine_plea",
},
{
["enabled"] = true,
["criteria"] = "! buff.active_consecration.up & active_enemies > 1",
["action"] = "consecration",
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1",
["action"] = "avengers_shield",
},
{
["enabled"] = true,
["criteria"] = "! debuff.judgement.up",
["action"] = "judgement_of_wisdom",
},
{
["enabled"] = true,
["criteria"] = "glyph.avengers_shield.enabled",
["action"] = "avengers_shield",
},
{
["enabled"] = true,
["criteria"] = "! buff.active_consecration.up & ttd > 4 & mana.percent > ( settings.judgement_of_wisdom_threshold / 4 )",
["action"] = "consecration",
},
{
["enabled"] = true,
["criteria"] = "( target.is_demon || target.is_undead ) & ( ( settings.squeezeHolyWrath & ( cooldown.consecration.remains > 6.85 ) ) || active_enemies >= settings.holy_wrath_threshold )",
["action"] = "holy_wrath",
},
{
["enabled"] = true,
["criteria"] = "mana.percent < settings.judgement_of_wisdom_threshold",
["action"] = "judgement_of_wisdom",
},
{
["action"] = "judgement_of_light",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "active_dot.sacred_shield = 0",
["action"] = "sacred_shield",
},
},
},
["version"] = 20231129.1,
["warnings"] = "WARNING:  The import for 'nine' required some automated changes.\nThe following auras were used in the action list but were not found in the addon database:\n - devine_plea\n\nImported 4 action lists.\n",
["author"] = "Supernuss",
["basedOn"] = "Protection 69",
["profile"] = "## Protection Paladin\n## 2023.11.29\n\nactions.precombat+=/righteous_fury,if=talent.improved_righteous_fury.enabled\nactions.precombat+=/retribution_aura,if=!up&settings.maintain_aura&assigned_aura.retribution_aura\nactions.precombat+=/concentration_aura,if=!up&settings.maintain_aura&assigned_aura.concentration_aura\nactions.precombat+=/crusader_aura,if=!up&settings.maintain_aura&assigned_aura.crusader_aura\nactions.precombat+=/devotion_aura,if=!up&settings.maintain_aura&assigned_aura.devotion_aura\nactions.precombat+=/fire_resistance_aura,if=!up&settings.maintain_aura&assigned_aura.fire_resistance_aura\nactions.precombat+=/frost_resistance_aura,if=!up&settings.maintain_aura&assigned_aura.frost_resistance_aura\nactions.precombat+=/shadow_resistance_aura,if=!up&settings.maintain_aura&assigned_aura.shadow_resistance_aura\nactions.precombat+=/blessing_of_kings,if=!up&settings.maintain_blessing&assigned_blessing.blessing_of_kings\nactions.precombat+=/blessing_of_might,if=!up&settings.maintain_blessing&assigned_blessing.blessing_of_might\nactions.precombat+=/blessing_of_sanctuary,if=!up&settings.maintain_blessing&assigned_blessing.blessing_of_sanctuary\nactions.precombat+=/blessing_of_wisdom,if=!up&settings.maintain_blessing&assigned_blessing.blessing_of_wisdom\nactions.precombat+=/seal_of_vengeance,if=buff.seal.remains<360\nactions.precombat+=/sacred_shield,if=buff.sacred_shield.remains<=0\nactions.precombat+=/holy_shield\nactions.precombat+=/potion\nactions.precombat+=/judgement_of_wisdom,if=mana.percent<settings.judgement_of_wisdom_threshold\nactions.precombat+=/judgement_of_light\n\n\nactions+=/seal_of_command,if=buff.seal.down&active_enemies>1\nactions+=/seal_of_vengeance,if=buff.seal.down&active_enemies=1\nactions+=/avenging_wrath\nactions+=/use_items\nactions+=/potion\nactions+=/hyperspeed_acceleration,use_off_gcd=1\n\nactions+=/hammer_of_wrath,if=target.health.pct<=20&(action.shield_of_righteousness.time_since<?action.hammer_of_the_righteous.time_since)<settings.min_six_delay\nactions+=/run_action_list,name=nine,if=(action.shield_of_righteousness.time_since<?action.hammer_of_the_righteous.time_since)<settings.min_six_delay-settings.max_wait_for_six&!(cooldown.hammer_of_the_righteous.up&cooldown.shield_of_righteousness.up)\nactions+=/run_action_list,name=six\n\n\n## Action-List for 6 Second-Spells (HotR/ShoR)\nactions.six+=/hammer_of_the_righteous,if=active_enemies>1&cooldown.shield_of_righteousness.remains<=settings.min_six_delay+settings.max_wait_for_six\nactions.six+=/shield_of_righteousness,if=cooldown.hammer_of_the_righteous.remains<=settings.min_six_delay+settings.max_wait_for_six\nactions.six+=/hammer_of_the_righteous,if=cooldown.shield_of_righteousness.remains<=settings.min_six_delay+settings.max_wait_for_six\n\n## Action-List for 9 Second-Spells (and what's left)\nactions.nine+=/consecration,if=!buff.active_consecration.up&active_enemies>3\nactions.nine+=/holy_shield,if=aggro||debuff.training_dummy.up\nactions.nine+=/divine_plea,if=!buff.devine_plea.up&(glyph.divine_plea.enabled||(mana.percent<settings.divine_plea_threshold))\nactions.nine+=/consecration,if=!buff.active_consecration.up&active_enemies>1\nactions.nine+=/avengers_shield,if=active_enemies>1\nactions.nine+=/judgement_of_wisdom,if=!debuff.judgement.up\nactions.nine+=/avengers_shield,if=glyph.avengers_shield.enabled\nactions.nine+=/consecration,if=!buff.active_consecration.up&ttd>4&mana.percent>(settings.judgement_of_wisdom_threshold/4)\nactions.nine+=/holy_wrath,if=(target.is_demon||target.is_undead)&((settings.squeezeHolyWrath&(cooldown.consecration.remains>6.85))||active_enemies>=settings.holy_wrath_threshold)\nactions.nine+=/judgement_of_wisdom,if=mana.percent<settings.judgement_of_wisdom_threshold\nactions.nine+=/judgement_of_light\nactions.nine+=/sacred_shield,if=active_dot.sacred_shield=0",
},
["防御"] = {
["source"] = "https://www.wowhead.com/wotlk/guide/classes/warrior/protection/tank-rotation-cooldowns-abilities-pve",
["builtIn"] = true,
["date"] = 20231124,
["spec"] = 1,
["desc"] = "This priority is based on the wowhead guide.",
["lists"] = {
["single"] = {
{
["enabled"] = true,
["criteria"] = "buff.bloodlust.up & debuff.shattering_throw.down",
["action"] = "shattering_throw",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "defensive_stance",
["criteria"] = "buff.defensive_stance.down",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "heroic_strike",
["criteria"] = "rage.current >= settings.queueing_threshold & rage.current > action.heroic_strike.spend + variable.build_sunder_cost + ( variable.maintain_sunder * action.devastate.spend ) + ( ( cooldown.shield_slam.remains < 2 ) * action.shield_slam.spend )",
},
{
["enabled"] = true,
["criteria"] = "( aggro || debuff.training_dummy.up ) & cooldown.shield_slam.up & rage.current >= action.shield_slam.spend",
["action"] = "shield_block",
},
{
["action"] = "shield_slam",
["enabled"] = true,
},
{
["action"] = "revenge",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.commanding_shout & buff.shout.remains <= 4 & buff.commanding_shout.remains <= 4",
["action"] = "commanding_shout",
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.battle_shout & buff.shout.remains <= 4 & buff.battle_shout.remains <= 4",
["action"] = "battle_shout",
},
{
["enabled"] = true,
["criteria"] = "variable.build_sunder || variable.maintain_sunder",
["action"] = "devastate",
},
{
["enabled"] = true,
["criteria"] = "settings.debuff_demoshout_enabled & ( ! debuff.ap_reduction.up || ( debuff.demoralizing_shout.up & debuff.demoralizing_shout.remains < 3 ) )",
["action"] = "demoralizing_shout",
},
{
["enabled"] = true,
["criteria"] = "! debuff.attack_speed_reduction.up || ( debuff.thunder_clap.up & debuff.attack_speed_reduction.remains < 3 )",
["action"] = "thunder_clap",
},
{
["action"] = "shockwave",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "cooldown.shield_slam.remains & ! buff.revenge_usable.up & ( action.shield_slam.spend <= rage.current - action.devastate.spend + rage_gain * gcd )",
["action"] = "devastate",
},
},
["default"] = {
{
["enabled"] = true,
["action"] = "call_action_list",
["list_name"] = "init",
},
{
["action"] = "charge",
["enabled"] = true,
},
{
["action"] = "shield_bash",
["enabled"] = true,
},
{
["action"] = "spell_reflection",
["enabled"] = true,
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "bloodrage",
["criteria"] = "rage.deficit > 30 & ! set_bonus.tier10prot_4pc",
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "variable.emergency_sunder",
["action"] = "devastate",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["criteria"] = "active_enemies > 1",
["list_name"] = "aoe",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["list_name"] = "single",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "group & active_dot.vigilance = 0",
["action"] = "vigilance",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "bloodrage",
["criteria"] = "rage.current < action.commanding_shout.spend & buff.shout.remains <= 60",
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.commanding_shout & buff.shout.remains <= 60",
["action"] = "commanding_shout",
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.battle_shout & buff.shout.remains <= 60",
["action"] = "battle_shout",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "berserker_stance",
["criteria"] = "cooldown.recklessness.up",
},
{
["action"] = "recklessness",
["enabled"] = true,
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "defensive_stance",
["criteria"] = "buff.defensive_stance.down & ! cooldown.recklessness.up",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "bloodrage",
["criteria"] = "rage.deficit > 30 & ! set_bonus.tier10prot_4pc",
},
{
["action"] = "charge",
["enabled"] = true,
},
},
["aoe"] = {
{
["enabled"] = true,
["criteria"] = "boss & buff.bloodlust.up & debuff.shattering_throw.down",
["action"] = "shattering_throw",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "defensive_stance",
["criteria"] = "buff.defensive_stance.down",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "cleave",
["criteria"] = "rage.current >= settings.queueing_threshold & rage.current > action.cleave.spend + ( variable.maintain_sunder * action.devastate.spend ) + ( ( cooldown.shield_slam.remains < 2 ) * action.shield_slam.spend )",
},
{
["action"] = "thunder_clap",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 3",
["action"] = "shockwave",
},
{
["action"] = "revenge",
["enabled"] = true,
},
{
["action"] = "shockwave",
["enabled"] = true,
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "shield_block",
["criteria"] = "( aggro || debuff.training_dummy.up ) & cooldown.thunder_clap.remains & ! buff.revenge_usable.up & cooldown.thunder_clap.remains & cooldown.shield_slam.up & rage >= action.shield_slam.spend",
},
{
["action"] = "shield_slam",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.commanding_shout & buff.shout.remains <= 4 & buff.commanding_shout.remains <= 4",
["action"] = "commanding_shout",
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.battle_shout & buff.shout.remains <= 4 & buff.battle_shout.remains <= 4",
["action"] = "battle_shout",
},
{
["enabled"] = true,
["criteria"] = "settings.debuff_demoshout_enabled & ( ! debuff.major_ap_reduction.up || ( debuff.demoralizing_shout.up & debuff.demoralizing_shout.remains < 3 ) )",
["action"] = "demoralizing_shout",
},
{
["enabled"] = true,
["criteria"] = "cooldown.shield_slam.remains & ! buff.revenge_usable.up & ( action.shield_slam.spend <= rage.current - action.devastate.spend + rage_gain * gcd )",
["action"] = "devastate",
},
},
["init"] = {
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "( debuff.training_dummy.up & 300 ) || target.time_to_die",
["var_name"] = "time_to_die",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "settings.debuff_sunder_enabled & variable.time_to_die > ( ( 5 - debuff.sunder_armor.stack ) * ( 1.5 + latency ) ) + 3",
["var_name"] = "should_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "should_sunder & ! debuff.major_armor_reduction.up || ( debuff.sunder_armor.up & debuff.sunder_armor.stack < 5 )",
["var_name"] = "build_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "should_sunder & ! variable.build_sunder & debuff.sunder_armor.stack = 5 & debuff.sunder_armor.remains < 5",
["var_name"] = "maintain_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "should_sunder & debuff.sunder_armor.up & debuff.sunder_armor.remains < 2",
["var_name"] = "emergency_sunder",
},
{
["enabled"] = true,
["op"] = "setif",
["action"] = "variable",
["var_name"] = "build_sunder_cost",
["value"] = "action.devastate.spend * ( 5 - debuff.sunder_armor.stack )",
["value_else"] = "0",
["criteria"] = "variable.build_sunder",
},
},
},
["version"] = 20231124,
["warnings"] = "WARNING:  The import for 'aoe' required some automated changes.\nThe following auras were used in the action list but were not found in the addon database:\n - major_ap_reduction\n\nImported 5 action lists.\n",
["profile"] = "## Warrior: Protection\n## https://www.wowhead.com/wotlk/guide/classes/warrior/protection/tank-rotation-cooldowns-abilities-pve\n## November 2023\n\n## Precombat\nactions.precombat+=/vigilance,if=group&active_dot.vigilance=0 \nactions.precombat+=/bloodrage,use_off_gcd=1,if=rage.current<action.commanding_shout.spend&buff.shout.remains<=60\nactions.precombat+=/commanding_shout,if=assigned_shout.commanding_shout&buff.shout.remains<=60\nactions.precombat+=/battle_shout,if=assigned_shout.battle_shout&buff.shout.remains<=60\nactions.precombat+=/berserker_stance,use_off_gcd=1,if=cooldown.recklessness.up\nactions.precombat+=/recklessness\nactions.precombat+=/defensive_stance,use_off_gcd=1,if=buff.defensive_stance.down&!cooldown.recklessness.up\nactions.precombat+=/bloodrage,use_off_gcd=1,if=rage.deficit>30&!set_bonus.tier10prot_4pc\nactions.precombat+=/charge\n\n## Default\nactions+=/call_action_list,name=init\nactions+=/charge\nactions+=/shield_bash\nactions+=/spell_reflection\nactions+=/bloodrage,use_off_gcd=1,if=rage.deficit>30&!set_bonus.tier10prot_4pc\nactions+=/use_items\nactions+=/devastate,if=variable.emergency_sunder\nactions+=/run_action_list,name=aoe,if=active_enemies>1\nactions+=/run_action_list,name=single\n\n## Init Vars\nactions.init+=/variable,name=time_to_die,value=(debuff.training_dummy.up&300)||target.time_to_die\nactions.init+=/variable,name=should_sunder,value=settings.debuff_sunder_enabled&variable.time_to_die>((5-debuff.sunder_armor.stack)*(1.5+latency))+3\nactions.init+=/variable,name=build_sunder,value=should_sunder&!debuff.major_armor_reduction.up||(debuff.sunder_armor.up&debuff.sunder_armor.stack<5)\nactions.init+=/variable,name=maintain_sunder,value=should_sunder&!variable.build_sunder&debuff.sunder_armor.stack=5&debuff.sunder_armor.remains<5\nactions.init+=/variable,name=emergency_sunder,value=should_sunder&debuff.sunder_armor.up&debuff.sunder_armor.remains<2\nactions.init+=/variable,name=build_sunder_cost,op=setif,if=variable.build_sunder,value=action.devastate.spend*(5-debuff.sunder_armor.stack),value_else=0\n\n## Single\nactions.single+=/shattering_throw,if=buff.bloodlust.up&debuff.shattering_throw.down\nactions.single+=/defensive_stance,use_off_gcd=1,if=buff.defensive_stance.down\nactions.single+=/heroic_strike,use_off_gcd=1,if=rage.current>=settings.queueing_threshold&rage.current>action.heroic_strike.spend+variable.build_sunder_cost+(variable.maintain_sunder*action.devastate.spend)+((cooldown.shield_slam.remains<2)*action.shield_slam.spend)\nactions.single+=/shield_block,if=(aggro||debuff.training_dummy.up)&cooldown.shield_slam.up&rage.current>=action.shield_slam.spend\nactions.single+=/shield_slam\nactions.single+=/revenge\nactions.single+=/commanding_shout,if=assigned_shout.commanding_shout&buff.shout.remains<=4&buff.commanding_shout.remains<=4\nactions.single+=/battle_shout,if=assigned_shout.battle_shout&buff.shout.remains<=4&buff.battle_shout.remains<=4\nactions.single+=/devastate,if=variable.build_sunder||variable.maintain_sunder\nactions.single+=/demoralizing_shout,if=settings.debuff_demoshout_enabled&(!debuff.ap_reduction.up||(debuff.demoralizing_shout.up&debuff.demoralizing_shout.remains<3))\nactions.single+=/thunder_clap,if=!debuff.attack_speed_reduction.up||(debuff.thunder_clap.up&debuff.attack_speed_reduction.remains<3)\nactions.single+=/shockwave\nactions.single+=/devastate,if=cooldown.shield_slam.remains&!buff.revenge_usable.up&(action.shield_slam.spend<=rage.current-action.devastate.spend+rage_gain*gcd)\n\n## Cleave\nactions.aoe+=/shattering_throw,if=boss&buff.bloodlust.up&debuff.shattering_throw.down\nactions.aoe+=/defensive_stance,use_off_gcd=1,if=buff.defensive_stance.down\nactions.aoe+=/cleave,use_off_gcd=1,if=rage.current>=settings.queueing_threshold&rage.current>action.cleave.spend+(variable.maintain_sunder*action.devastate.spend)+((cooldown.shield_slam.remains<2)*action.shield_slam.spend)\nactions.aoe+=/thunder_clap\nactions.aoe+=/shockwave,if=active_enemies>3\nactions.aoe+=/revenge\nactions.aoe+=/shockwave\nactions.aoe+=/shield_block,use_off_gcd=1,if=(aggro||debuff.training_dummy.up)&cooldown.thunder_clap.remains&!buff.revenge_usable.up&cooldown.thunder_clap.remains&cooldown.shield_slam.up&rage>=action.shield_slam.spend\nactions.aoe+=/shield_slam\nactions.aoe+=/commanding_shout,if=assigned_shout.commanding_shout&buff.shout.remains<=4&buff.commanding_shout.remains<=4\nactions.aoe+=/battle_shout,if=assigned_shout.battle_shout&buff.shout.remains<=4&buff.battle_shout.remains<=4\nactions.aoe+=/demoralizing_shout,if=settings.debuff_demoshout_enabled&(!debuff.major_ap_reduction.up||(debuff.demoralizing_shout.up&debuff.demoralizing_shout.remains<3))\nactions.aoe+=/devastate,if=cooldown.shield_slam.remains&!buff.revenge_usable.up&(action.shield_slam.spend<=rage.current-action.devastate.spend+rage_gain*gcd)",
["basedOn"] = "Protection Warrior (IV)",
["author"] = "Supernuss",
},
["武器"] = {
["builtIn"] = true,
["date"] = 20230226,
["spec"] = 1,
["desc"] = "Arms Warrior priority for Hekili",
["profile"] = "actions.precombat+=/berserker_stance,if=buff.stance.down\nactions.precombat+=/commanding_shout,if=assigned_shout.commanding_shout&buff.my_battle_shout.down&buff.my_commanding_shout.down\nactions.precombat+=/battle_shout,if=assigned_shout.battle_shout&buff.my_battle_shout.down&buff.my_commanding_shout.down\n\nactions+=/call_action_list,name=init\nactions+=/sunder_armor,if=variable.should_sunder&variable.emergency_sunder\nactions+=/pummel\nactions+=/run_action_list,name=berserker_stance,if=buff.berserker_stance.up\nactions+=/run_action_list,name=battle_stance,if=buff.battle_stance.up\nactions+=/run_action_list,name=defensive_stance,if=buff.defensive_stance.up\n\nactions.init+=/variable,name=time_to_die,value=(debuff.training_dummy.up&300)||target.time_to_die\nactions.init+=/variable,name=execute_phase,value=target.health.pct<20\nactions.init+=/variable,name=should_sunder,value=settings.debuff_sunder_enabled&variable.time_to_die>((5-debuff.sunder_armor.stack)*(1.5+latency))+3\nactions.init+=/variable,name=build_sunder,value=!debuff.major_armor_reduction.up||(debuff.sunder_armor.up&debuff.sunder_armor.stack<5)\nactions.init+=/variable,name=maintain_sunder,value=!variable.build_sunder&debuff.sunder_armor.stack=5&debuff.sunder_armor.remains<7&cooldown.bloodthirst.remains&cooldown.whirlwind.remains&!buff.bloodsurge.up\nactions.init+=/variable,name=emergency_sunder,value=debuff.sunder_armor.up&debuff.sunder_armor.remains<1.5\n\nactions.battle_stance+=/charge,if=target.outside8\nactions.battle_stance+=/bloodrage,use_off_gcd=1,if=rage.deficit>20\nactions.battle_stance+=/heroic_strike,use_off_gcd=1,if=rage.current>=settings.queueing_threshold&active_enemies=1&!buff.recklessness.up&(!variable.execute_phase||settings.execute_queueing_enabled)\nactions.battle_stance+=/cleave,use_off_gcd=1,if=rage.current>=settings.queueing_threshold&active_enemies>1&!buff.recklessness.up&(!variable.execute_phase||settings.execute_queueing_enabled)\nactions.battle_stance+=/sunder_armor,if=variable.should_sunder&(variable.build_sunder||variable.maintain_sunder)\nactions.battle_stance+=/shattering_throw,if=buff.bloodlust.up&debuff.shattering_throw.down\nactions.battle_stance+=/potion\nactions.battle_stance+=/use_items\nactions.battle_stance+=/hyperspeed_acceleration\nactions.battle_stance+=/rend,if=debuff.rend.remains<=settings.rend_refresh_time\nactions.battle_stance+=/overpower,if=(buff.overpower_ready.up&!buff.taste_for_blood.up)||(buff.taste_for_blood.up&(!settings.optimize_overpower||buff.taste_for_blood.remains<1.5))\nactions.battle_stance+=/victory_rush\nactions.battle_stance+=/berserker_stance,if=debuff.rend.remains>12&cooldown.bladestorm.up&cooldown.recklessness.up\nactions.battle_stance+=/sweeping_strikes,use_off_gcd=1,if=active_enemies>1\nactions.battle_stance+=/bladestorm,if=debuff.rend.remains>=action.bladestorm.duration+action.overpower.gcd&(!variable.execute_phase||active_enemies>3)\nactions.battle_stance+=/execute\nactions.battle_stance+=/bladestorm,if=debuff.rend.remains>=action.bladestorm.duration+action.overpower.gcd\nactions.battle_stance+=/mortal_strike\nactions.battle_stance+=/demoralizing_shout,if=settings.debuff_demoshout_enabled&!debuff.demoralizing_shout.up\nactions.battle_stance+=/overpower,if=optimize_overpower&buff.taste_for_blood.up\nactions.battle_stance+=/slam,if=!moving\n\nactions.berserker_stance+=/recklessness,if=cooldown.bladestorm.remains<1.5||debuff.shattering_throw.up\nactions.berserker_stance+=/battle_stance\n\nactions.defensive_stance+=/berserker_stance",
["version"] = 20230226,
["warnings"] = "Imported 6 action lists.\n",
["author"] = "Defox",
["lists"] = {
["default"] = {
{
["enabled"] = true,
["action"] = "call_action_list",
["list_name"] = "init",
},
{
["enabled"] = true,
["criteria"] = "variable.should_sunder & variable.emergency_sunder",
["action"] = "sunder_armor",
},
{
["action"] = "pummel",
["enabled"] = true,
},
{
["enabled"] = true,
["action"] = "run_action_list",
["criteria"] = "buff.berserker_stance.up",
["list_name"] = "berserker_stance",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["criteria"] = "buff.battle_stance.up",
["list_name"] = "battle_stance",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["criteria"] = "buff.defensive_stance.up",
["list_name"] = "defensive_stance",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "buff.stance.down",
["action"] = "berserker_stance",
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.commanding_shout & buff.my_battle_shout.down & buff.my_commanding_shout.down",
["action"] = "commanding_shout",
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.battle_shout & buff.my_battle_shout.down & buff.my_commanding_shout.down",
["action"] = "battle_shout",
},
},
["init"] = {
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "( debuff.training_dummy.up & 300 ) || target.time_to_die",
["var_name"] = "time_to_die",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "target.health.pct < 20",
["var_name"] = "execute_phase",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "settings.debuff_sunder_enabled & variable.time_to_die > ( ( 5 - debuff.sunder_armor.stack ) * ( 1.5 + latency ) ) + 3",
["var_name"] = "should_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "! debuff.major_armor_reduction.up || ( debuff.sunder_armor.up & debuff.sunder_armor.stack < 5 )",
["var_name"] = "build_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "! variable.build_sunder & debuff.sunder_armor.stack = 5 & debuff.sunder_armor.remains < 7 & cooldown.bloodthirst.remains & cooldown.whirlwind.remains & ! buff.bloodsurge.up",
["var_name"] = "maintain_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "debuff.sunder_armor.up & debuff.sunder_armor.remains < 1.5",
["var_name"] = "emergency_sunder",
},
},
["battle_stance"] = {
{
["enabled"] = true,
["criteria"] = "target.outside8",
["action"] = "charge",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "bloodrage",
["criteria"] = "rage.deficit > 20",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "heroic_strike",
["criteria"] = "rage.current >= settings.queueing_threshold & active_enemies = 1 & ! buff.recklessness.up & ( ! variable.execute_phase || settings.execute_queueing_enabled )",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "cleave",
["criteria"] = "rage.current >= settings.queueing_threshold & active_enemies > 1 & ! buff.recklessness.up & ( ! variable.execute_phase || settings.execute_queueing_enabled )",
},
{
["enabled"] = true,
["criteria"] = "variable.should_sunder & ( variable.build_sunder || variable.maintain_sunder )",
["action"] = "sunder_armor",
},
{
["enabled"] = true,
["criteria"] = "buff.bloodlust.up & debuff.shattering_throw.down",
["action"] = "shattering_throw",
},
{
["action"] = "potion",
["enabled"] = true,
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["action"] = "hyperspeed_acceleration",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "debuff.rend.remains <= settings.rend_refresh_time",
["action"] = "rend",
},
{
["enabled"] = true,
["criteria"] = "( buff.overpower_ready.up & ! buff.taste_for_blood.up ) || ( buff.taste_for_blood.up & ( ! settings.optimize_overpower || buff.taste_for_blood.remains < 1.5 ) )",
["action"] = "overpower",
},
{
["action"] = "victory_rush",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "debuff.rend.remains > 12 & cooldown.bladestorm.up & cooldown.recklessness.up",
["action"] = "berserker_stance",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "sweeping_strikes",
["criteria"] = "active_enemies > 1",
},
{
["enabled"] = true,
["criteria"] = "debuff.rend.remains >= action.bladestorm.duration + action.overpower.gcd & ( ! variable.execute_phase || active_enemies > 3 )",
["action"] = "bladestorm",
},
{
["action"] = "execute",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "debuff.rend.remains >= action.bladestorm.duration + action.overpower.gcd",
["action"] = "bladestorm",
},
{
["action"] = "mortal_strike",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "settings.debuff_demoshout_enabled & ! debuff.demoralizing_shout.up",
["action"] = "demoralizing_shout",
},
{
["enabled"] = true,
["criteria"] = "optimize_overpower & buff.taste_for_blood.up",
["action"] = "overpower",
},
{
["enabled"] = true,
["criteria"] = "! moving",
["action"] = "slam",
},
},
["berserker_stance"] = {
{
["enabled"] = true,
["criteria"] = "cooldown.bladestorm.remains < 1.5 || debuff.shattering_throw.up",
["action"] = "recklessness",
},
{
["action"] = "battle_stance",
["enabled"] = true,
},
},
["defensive_stance"] = {
{
["action"] = "berserker_stance",
["enabled"] = true,
},
},
},
},
["鲜血(IV)"] = {
["source"] = "https://www.icy-veins.com/wotlk-classic/blood-death-knight-tank-pve-rotation-cooldowns-abilities",
["builtIn"] = true,
["date"] = 20230411,
["spec"] = 6,
["desc"] = "This priority is based on the Icy Veins guide.",
["lists"] = {
["aoe"] = {
{
["action"] = "death_and_decay",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.ticking & dot.blood_plague.ticking & ( active_dot.frost_fever + active_dot.blood_plague < true_active_enemies * 2 )",
["action"] = "pestilence",
},
{
["enabled"] = true,
["criteria"] = "! dot.frost_fever.ticking",
["action"] = "icy_touch",
["cycle_targets"] = 1,
},
{
["enabled"] = true,
["criteria"] = "! dot.blood_plague.ticking",
["action"] = "plague_strike",
["cycle_targets"] = 1,
},
{
["enabled"] = true,
["criteria"] = "health.pct > 60 & ( active_enemies > 2 || ! talent.heart_strike.enabled )",
["action"] = "blood_boil",
},
{
["enabled"] = true,
["criteria"] = "active_enemies < 3",
["action"] = "heart_strike",
},
{
["enabled"] = true,
["criteria"] = "runic_power.deficit < 20",
["action"] = "death_coil",
},
},
["default"] = {
{
["action"] = "mind_freeze",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "down",
["action"] = "horn_of_winter",
},
{
["enabled"] = true,
["criteria"] = "time < 2",
["action"] = "death_grip",
},
{
["enabled"] = true,
["criteria"] = "health.pct <= 60",
["action"] = "death_strike",
},
{
["action"] = "use_items",
["enabled"] = true,
},
{
["action"] = "unholy_frenzy",
["enabled"] = true,
},
{
["enabled"] = true,
["action"] = "run_action_list",
["strict"] = 1,
["criteria"] = "active_enemies > 1",
["list_name"] = "aoe",
},
{
["enabled"] = true,
["criteria"] = "dot.blood_plague.ticking & dot.blood_plague.refreshable || dot.frost_fever.ticking & dot.frost_fever.refreshable",
["action"] = "pestilence",
},
{
["enabled"] = true,
["criteria"] = "! dot.frost_fever.ticking || frost_runes.time_to_max < gcd",
["action"] = "icy_touch",
},
{
["enabled"] = true,
["criteria"] = "! dot.blood_plague.ticking",
["action"] = "plague_strike",
},
{
["enabled"] = true,
["criteria"] = "blood_runes.time_to_max < gcd",
["action"] = "blood_strike",
},
{
["enabled"] = true,
["criteria"] = "health.current + action.death_strike.healing < health.max & dot.frost_fever.ticking & dot.blood_plague.ticking",
["action"] = "death_strike",
},
{
["enabled"] = true,
["criteria"] = "( glyph.blood_tap.enabled || health.pct > 60 ) & blood_runes.current = 0",
["action"] = "blood_tap",
},
{
["action"] = "rune_strike",
["enabled"] = true,
},
{
["action"] = "heart_strike",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "runic_power.deficit < 20",
["action"] = "death_coil",
},
{
["action"] = "blood_strike",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "( blood_runes.current + frost_runes.current + unholy_runes.current ) < 2",
["action"] = "empower_rune_weapon",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "buff.presence.down",
["action"] = "frost_presence",
},
},
},
["version"] = 20230411,
["warnings"] = "WARNING:  The import for 'aoe' required some automated changes.\nLine 5: Converted 'talent.X' to 'talent.X.enabled' (1x).\n\nImported 3 action lists.\n",
["profile"] = "## Blood Death Knight (Icy Veins)\n## 2023-04-11\n\nactions.precombat+=/frost_presence,if=buff.presence.down\n\nactions+=/mind_freeze\nactions+=/horn_of_winter,if=down\nactions+=/death_grip,if=time<2\nactions+=/death_strike,if=health.pct<=60\nactions+=/use_items\nactions+=/unholy_frenzy\nactions+=/run_action_list,name=aoe,strict=1,if=active_enemies>1\nactions+=/pestilence,if=dot.blood_plague.ticking&dot.blood_plague.refreshable||dot.frost_fever.ticking&dot.frost_fever.refreshable\nactions+=/icy_touch,if=!dot.frost_fever.ticking||frost_runes.time_to_max<gcd\nactions+=/plague_strike,if=!dot.blood_plague.ticking\nactions+=/blood_strike,if=blood_runes.time_to_max<gcd\nactions+=/death_strike,if=health.current+action.death_strike.healing<health.max&dot.frost_fever.ticking&dot.blood_plague.ticking\nactions+=/blood_tap,if=(glyph.blood_tap.enabled||health.pct>60)&blood_runes.current=0\nactions+=/rune_strike\nactions+=/heart_strike\nactions+=/death_coil,if=runic_power.deficit<20\nactions+=/blood_strike\n## TODO: Determine Death Rune situation.\n## actions+=/icy_touch,if=???\nactions+=/empower_rune_weapon,if=(blood_runes.current+frost_runes.current+unholy_runes.current)<2\n\nactions.aoe+=/death_and_decay\nactions.aoe+=/pestilence,if=dot.frost_fever.ticking&dot.blood_plague.ticking&(active_dot.frost_fever+active_dot.blood_plague<true_active_enemies*2)\nactions.aoe+=/icy_touch,cycle_targets=1,if=!dot.frost_fever.ticking\nactions.aoe+=/plague_strike,cycle_targets=1,if=!dot.blood_plague.ticking\nactions.aoe+=/blood_boil,if=health.pct>60&(active_enemies>2||!talent.heart_strike)\nactions.aoe+=/heart_strike,if=active_enemies<3\nactions.aoe+=/death_coil,if=runic_power.deficit<20",
["author"] = "Icy Veins",
},
["双火增强萨(新手盒子)"] = {
["source"] = "https://www.wclbox.com",
["builtIn"] = true,
["date"] = 20241230,
["author"] = "新手盒子",
["desc"] = "该模块由新手盒子维护更新\n更多最新Hekili配置，下载“新手盒子”更新插件。",
["profile"] = "actions.precombat+=/windfury_weapon,if=!mainhand_imbued&!mainhand_has_spellpower\nactions.precombat+=/flametongue_weapon,rank=action.flametongue_weapon.max_rank-1,if=!mainhand_imbued&mainhand_has_spellpower\nactions.precombat+=/flametongue_weapon,if=!offhand_imbued\nactions.precombat+=/lightning_shield,if=buff.shield.down\nactions.precombat+=/call_of_the_elements,if=buff.earth_totem.down||buff.fire_totem.down||buff.water_totem.down||buff.air_totem.down\nactions.precombat+=/potion\nactions+=/wind_shear\nactions+=/flametongue_weapon,rank=action.flametongue_weapon.max_rank-1,if=!mainhand_imbued&mainhand_has_spellpower\nactions+=/flametongue_weapon,if=!offhand_imbued\nactions+=/fire_nova,if=active_enemies>1\nactions+=/chain_lightning,if=buff.maelstrom_weapon.stack=5&active_enemies>1\nactions+=/wait,if=active_enemies>1&cooldown.fire_nova.remains<=0.7&buff.fire_totem.remains>cooldown.fire_nova.remains,sec=cooldown.fire_nova.remains\nactions+=/lightning_bolt,if=buff.maelstrom_weapon.stack=5\nactions+=/flame_shock,cycle_targets=1,max_cycle_targets=2,if=!ticking&target.time_to_die>=9\nactions+=/call_of_the_elements,if=buff.fire_totem.down&buff.water_totem.remains<20\nactions+=/stormstrike,if=buff.stormstrike.down\nactions+=/fire_nova\nactions+=/magma_totem,if=buff.fire_totem.remains<=latency & buff.fire_elemental_totem.down\nactions+=/earth_shock\nactions+=/lightning_shield,if=talent.static_shock.enabled&buff.shield.down\nactions+=/stormstrike\nactions+=/lava_lash\nactions+=/magma_totem,if=buff.magma_totem.up&buff.magma_totem.remains<3\nactions+=/lightning_shield,if=talent.static_shock.enabled&buff.shield.stack<buff.shield.max_stack*0.33",
["version"] = 20241230,
["warnings"] = "此配置文件缺少对通用饰品的支持。建议每个优先级都需要包括：\n - [使用物品]，包含任何没有包含在优先级中的饰品，或者\n - [饰品1]和[饰品2]，这样做将推荐对应饰品装备栏中的饰品。\n成功导入了2个技能列表。\n",
["spec"] = 7,
["basedOn"] = "增强",
["lists"] = {
["default"] = {
{
["action"] = "wind_shear",
["enabled"] = true,
},
{
["enabled"] = true,
["action"] = "flametongue_weapon",
["criteria"] = "! mainhand_imbued & mainhand_has_spellpower",
["rank"] = "action.flametongue_weapon.max_rank-1",
},
{
["enabled"] = true,
["criteria"] = "! offhand_imbued",
["action"] = "flametongue_weapon",
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1",
["action"] = "fire_nova",
},
{
["enabled"] = true,
["criteria"] = "buff.maelstrom_weapon.stack = 5 & active_enemies > 1",
["action"] = "chain_lightning",
},
{
["enabled"] = true,
["sec"] = "cooldown.fire_nova.remains",
["criteria"] = "active_enemies > 1 & cooldown.fire_nova.remains <= 0.7 & buff.fire_totem.remains > cooldown.fire_nova.remains",
["action"] = "wait",
},
{
["enabled"] = true,
["criteria"] = "buff.maelstrom_weapon.stack = 5",
["action"] = "lightning_bolt",
},
{
["enabled"] = true,
["action"] = "flame_shock",
["cycle_targets"] = 1,
["max_cycle_targets"] = "2",
["criteria"] = "! ticking & target.time_to_die >= 9",
},
{
["enabled"] = true,
["criteria"] = "buff.fire_totem.down & buff.water_totem.remains < 20",
["action"] = "call_of_the_elements",
},
{
["enabled"] = true,
["criteria"] = "buff.stormstrike.down",
["action"] = "stormstrike",
},
{
["action"] = "fire_nova",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.fire_totem.remains <= latency & buff.fire_elemental_totem.down",
["action"] = "magma_totem",
},
{
["action"] = "earth_shock",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "talent.static_shock.enabled & buff.shield.down",
["action"] = "lightning_shield",
},
{
["action"] = "stormstrike",
["enabled"] = true,
},
{
["action"] = "lava_lash",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.magma_totem.up & buff.magma_totem.remains < 3",
["action"] = "magma_totem",
},
{
["enabled"] = true,
["criteria"] = "talent.static_shock.enabled & buff.shield.stack < buff.shield.max_stack * 0.33",
["action"] = "lightning_shield",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "! mainhand_imbued & ! mainhand_has_spellpower",
["action"] = "windfury_weapon",
},
{
["enabled"] = true,
["action"] = "flametongue_weapon",
["criteria"] = "! mainhand_imbued & mainhand_has_spellpower",
["rank"] = "action.flametongue_weapon.max_rank-1",
},
{
["enabled"] = true,
["criteria"] = "! offhand_imbued",
["action"] = "flametongue_weapon",
},
{
["enabled"] = true,
["criteria"] = "buff.shield.down",
["action"] = "lightning_shield",
},
{
["enabled"] = true,
["criteria"] = "buff.earth_totem.down || buff.fire_totem.down || buff.water_totem.down || buff.air_totem.down",
["action"] = "call_of_the_elements",
},
{
["action"] = "potion",
["enabled"] = true,
},
},
},
},
["双持邪(新手盒子)"] = {
["builtIn"] = true,
["date"] = 20241209,
["spec"] = 6,
["desc"] = "这个技能优先级配置基于Hekili汉化版制作。\n双持邪（由新手盒子wclbox.com）完善更新\n更新最新的Hekili怀旧汉化版，请到新手盒子",
["lists"] = {
["life"] = {
{
["action"] = "icebound_fortitude",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! pet.alive",
["action"] = "raise_dead",
},
{
["enabled"] = true,
["criteria"] = "pet.alive",
["action"] = "death_pact",
},
},
["default"] = {
{
["action"] = "mind_freeze",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! buff.unholy_presence.up & action.summon_gargoyle.time_since < 30",
["action"] = "unholy_presence",
},
{
["enabled"] = true,
["criteria"] = "! buff.blood_presence.up & ! talent.improved_unholy_presence.enabled & action.summon_gargoyle.time_since > 30",
["action"] = "blood_presence",
},
{
["enabled"] = true,
["criteria"] = "buff.horn_of_winter.down",
["action"] = "horn_of_winter",
},
{
["enabled"] = true,
["criteria"] = "buff.bone_shield.down",
["action"] = "bone_shield",
},
{
["enabled"] = true,
["criteria"] = "! pet.alive",
["action"] = "raise_dead",
},
{
["enabled"] = true,
["action"] = "call_action_list",
["criteria"] = "health.pct < 40",
["list_name"] = "life",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["criteria"] = "active_enemies = 1",
["list_name"] = "st",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["criteria"] = "active_enemies > 1",
["list_name"] = "aoe",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "! buff.blood_presence.up & ! talent.improved_unholy_presence.enabled",
["action"] = "blood_presence",
},
{
["enabled"] = true,
["criteria"] = "buff.horn_of_winter.down",
["action"] = "horn_of_winter",
},
{
["enabled"] = true,
["criteria"] = "talent.master_of_ghouls.enabled",
["action"] = "raise_dead",
},
{
["enabled"] = true,
["criteria"] = "buff.bone_shield.down",
["action"] = "bone_shield",
},
{
["enabled"] = true,
["criteria"] = "! pet.alive",
["action"] = "raise_dead",
},
{
["action"] = "potion",
["enabled"] = true,
},
},
["aoe"] = {
{
["action"] = "use_items",
["enabled"] = true,
},
{
["action"] = "potion",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "! dot.blood_plague.ticking & ( unholy_runes.time_to_max <= cooldown.death_and_decay.remains )",
["action"] = "plague_strike",
},
{
["enabled"] = true,
["criteria"] = "! dot.frost_fever.ticking & ( frost_runes.time_to_max <= cooldown.death_and_decay.remains )",
["action"] = "icy_touch",
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.ticking & dot.blood_plague.ticking & ( action.pestilence.time_since >= 14 ) & ( blood_runes.time_to_max <= cooldown.death_and_decay.remains )",
["action"] = "pestilence",
},
{
["enabled"] = true,
["criteria"] = "( glyph.blood_tap.enabled || health.pct > 60 ) & blood_runes.current <= 1 & ( cooldown.death_and_decay.ready || cooldown.death_and_decay.remains >= 10 )",
["action"] = "blood_tap",
},
{
["enabled"] = true,
["criteria"] = "! moving & target.distance <= 1",
["action"] = "death_and_decay",
},
{
["enabled"] = true,
["criteria"] = "( buff.desolation.down || buff.desolation.remains <= 3 || fight_remains < 8 ) & ( blood_runes.time_to_max <= cooldown.death_and_decay.remains )",
["action"] = "blood_strike",
},
{
["enabled"] = true,
["criteria"] = "blood_runes.current + frost_runes.current + unholy_runes.current < 3",
["action"] = "empower_rune_weapon",
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.ticking & dot.blood_plague.ticking & ( blood_runes.time_to_max <= cooldown.death_and_decay.remains ) & cooldown.death_and_decay.remains >= 1.5",
["action"] = "blood_boil",
},
{
["action"] = "hyperspeed_acceleration",
["enabled"] = true,
},
{
["action"] = "summon_gargoyle",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "( ! toggle.cooldowns & runic_power.current > 100 ) || ( toggle.cooldowns & cooldown.summon_gargoyle.ready & runic_power.current > 110 ) || ( toggle.cooldowns & ! cooldown.summon_gargoyle.ready & runic_power.current > 100 ) & cooldown.death_and_decay.remains >= 1.5",
["action"] = "death_coil",
},
{
["enabled"] = true,
["criteria"] = "( frost_runes.time_to_max < dot.frost_fever.remains ) & ( frost_runes.time_to_max <= cooldown.death_and_decay.remains ) & ( unholy_runes.time_to_max < dot.blood_plague.remains ) & ( unholy_runes.time_to_max <= cooldown.death_and_decay.remains ) & cooldown.death_and_decay.remains >= 1.5",
["action"] = "scourge_strike",
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.remains <= 8 & ( frost_runes.time_to_max < cooldown.death_and_decay.remains ) & cooldown.death_and_decay.remains >= 1.5",
["action"] = "icy_touch",
},
{
["enabled"] = true,
["criteria"] = "dot.blood_plague.remains <= 8 & unholy_runes.time_to_max < cooldown.death_and_decay.remains & unholy_runes.time_to_max < buff.ghoul_frenzy.remains & cooldown.death_and_decay.remains >= 1.5",
["action"] = "plague_strike",
},
{
["enabled"] = true,
["criteria"] = "cooldown.horn_of_winter.ready & cooldown.death_and_decay.remains >= 1.5 & cooldown.death_and_decay.remains >= 1.5",
["action"] = "horn_of_winter",
},
{
["enabled"] = true,
["criteria"] = "! toggle.cooldowns & cooldown.death_and_decay.remains <= 3 & cooldown.death_and_decay.remains >= 1.5",
["action"] = "death_coil",
},
},
["st"] = {
{
["action"] = "use_items",
["enabled"] = true,
},
{
["action"] = "potion",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "( ! dot.blood_plague.ticking || dot.blood_plague.remains <= 3 ) & ( unholy_runes.time_to_max <= cooldown.death_and_decay.remains )",
["action"] = "plague_strike",
},
{
["enabled"] = true,
["criteria"] = "( ! dot.frost_fever.ticking || dot.frost_fever.remains <= 3 ) & ( frost_runes.time_to_max <= cooldown.death_and_decay.remains )",
["action"] = "icy_touch",
},
{
["enabled"] = true,
["criteria"] = "( buff.desolation.down || buff.desolation.remains <= 3 ) & ( blood_runes.time_to_max <= cooldown.death_and_decay.remains ) & cooldown.death_and_decay.remains >= 1.5",
["action"] = "blood_strike",
},
{
["enabled"] = true,
["criteria"] = "( glyph.blood_tap.enabled || health.pct > 60 ) & blood_runes.current <= 1 & ( cooldown.death_and_decay.ready )",
["action"] = "blood_tap",
},
{
["enabled"] = true,
["criteria"] = "! moving & target.distance <= 1",
["action"] = "death_and_decay",
},
{
["action"] = "summon_gargoyle",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "( blood_runes.current + frost_runes.current + unholy_runes.current ) < 3",
["action"] = "empower_rune_weapon",
},
{
["enabled"] = true,
["criteria"] = "cooldown.army_of_the_dead.ready || cooldown.army_of_the_dead.remains > 60",
["action"] = "hyperspeed_acceleration",
},
{
["action"] = "army_of_the_dead",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.ghoul_frenzy.down & ( unholy_runes.time_to_max <= cooldown.death_and_decay.remains ) & cooldown.death_and_decay.remains >= 1.5",
["action"] = "ghoul_frenzy",
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.ticking & dot.blood_plague.ticking & blood_runes.time_to_max < buff.desolation.remains & buff.desolation.remains >= 6 & blood_runes.time_to_max < cooldown.death_and_decay.remains & cooldown.death_and_decay.remains >= 1.5",
["action"] = "blood_boil",
},
{
["enabled"] = true,
["criteria"] = "( ! toggle.cooldowns & runic_power.current > 100 ) || ( toggle.cooldowns & cooldown.summon_gargoyle.ready & runic_power.current > 110 ) || ( toggle.cooldowns & ! cooldown.summon_gargoyle.ready & runic_power.current > 100 ) & cooldown.death_and_decay.remains >= 1.5",
["action"] = "death_coil",
},
{
["enabled"] = true,
["criteria"] = "( frost_runes.time_to_max < dot.frost_fever.remains ) & ( frost_runes.time_to_max < cooldown.death_and_decay.remains ) & ( unholy_runes.time_to_max < dot.blood_plague.remains ) & ( unholy_runes.time_to_max < cooldown.death_and_decay.remains ) & cooldown.death_and_decay.remains >= 1.5",
["action"] = "scourge_strike",
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.remains <= 8 & ( frost_runes.time_to_max < cooldown.death_and_decay.remains ) & cooldown.death_and_decay.remains >= 1.5",
["action"] = "icy_touch",
},
{
["enabled"] = true,
["criteria"] = "dot.blood_plague.remains <= 8 & unholy_runes.time_to_max < cooldown.death_and_decay.remains & unholy_runes.time_to_max < buff.ghoul_frenzy.remains & cooldown.death_and_decay.remains >= 1.5",
["action"] = "plague_strike",
},
{
["enabled"] = true,
["criteria"] = "cooldown.horn_of_winter.ready & cooldown.death_and_decay.remains >= 1.5",
["action"] = "horn_of_winter",
},
{
["enabled"] = true,
["criteria"] = "! toggle.cooldowns & cooldown.death_and_decay.remains <= 3 & cooldown.death_and_decay.remains >= 1.5",
["action"] = "death_coil",
},
{
["enabled"] = true,
["criteria"] = "buff.ghoul_frenzy.down & talent.ghoul_frenzy.enabled & ( unholy_runes.time_to_max <= cooldown.death_and_decay.remains ) & cooldown.death_and_decay.remains >= 1.5 & buff.ghoul_frenzy.remains <= 10",
["action"] = "ghoul_frenzy",
},
},
},
["version"] = 20241209,
["warnings"] = "成功导入了5个技能列表。\n",
["author"] = "新手盒子wcl",
["profile"] = "actions.precombat+=/blood_presence,if=!buff.blood_presence.up&!talent.improved_unholy_presence.enabled\nactions.precombat+=/horn_of_winter,if=buff.horn_of_winter.down\nactions.precombat+=/raise_dead,if=talent.master_of_ghouls.enabled\nactions.precombat+=/bone_shield,if=buff.bone_shield.down\nactions.precombat+=/raise_dead,if=!pet.alive\nactions.precombat+=/potion\n\nactions+=/mind_freeze\nactions+=/unholy_presence,if=!buff.unholy_presence.up&action.summon_gargoyle.time_since<30\nactions+=/blood_presence,if=!buff.blood_presence.up&!talent.improved_unholy_presence.enabled&action.summon_gargoyle.time_since>30\nactions+=/horn_of_winter,if=buff.horn_of_winter.down\nactions+=/bone_shield,if=buff.bone_shield.down\nactions+=/raise_dead,if=!pet.alive\nactions+=/call_action_list,name=life,if=health.pct<40\nactions+=/run_action_list,name=st,if=active_enemies=1\nactions+=/run_action_list,name=aoe,if=active_enemies>1\n\nactions.st+=/use_items\nactions.st+=/potion\nactions.st+=/plague_strike,if=(!dot.blood_plague.ticking||dot.blood_plague.remains<=3)&(unholy_runes.time_to_max<=cooldown.death_and_decay.remains)\nactions.st+=/icy_touch,if=(!dot.frost_fever.ticking||dot.frost_fever.remains<=3)&(frost_runes.time_to_max<=cooldown.death_and_decay.remains)\nactions.st+=/blood_strike,if=(buff.desolation.down||buff.desolation.remains<=3)&(blood_runes.time_to_max<=cooldown.death_and_decay.remains)&cooldown.death_and_decay.remains>=1.5\nactions.st+=/blood_tap,if=(glyph.blood_tap.enabled||health.pct>60)&blood_runes.current<=1&(cooldown.death_and_decay.ready)\nactions.st+=/death_and_decay,if=!moving&target.distance<=1\nactions.st+=/summon_gargoyle\nactions.st+=/empower_rune_weapon,if=(blood_runes.current+frost_runes.current+unholy_runes.current)<3\nactions.st+=/hyperspeed_acceleration,if=cooldown.army_of_the_dead.ready||cooldown.army_of_the_dead.remains>60\nactions.st+=/army_of_the_dead\nactions.st+=/ghoul_frenzy,if=buff.ghoul_frenzy.down&(unholy_runes.time_to_max<=cooldown.death_and_decay.remains)&cooldown.death_and_decay.remains>=1.5\n## actions.st+=/blood_strike,if=dot.frost_fever.ticking&dot.blood_plague.ticking&(blood_runes.time_to_max<buff.desolation.remains&blood_runes.time_to_max<=cooldown.death_and_decay.remains)&cooldown.death_and_decay.remains>=1.5\nactions.st+=/blood_boil,if=dot.frost_fever.ticking&dot.blood_plague.ticking&blood_runes.time_to_max<buff.desolation.remains&buff.desolation.remains>=6&blood_runes.time_to_max<cooldown.death_and_decay.remains&cooldown.death_and_decay.remains>=1.5\nactions.st+=/death_coil,if=(!toggle.cooldowns & runic_power.current>100) || (toggle.cooldowns & cooldown.summon_gargoyle.ready & runic_power.current>110) || (toggle.cooldowns & !cooldown.summon_gargoyle.ready & runic_power.current>100)&cooldown.death_and_decay.remains>=1.5\nactions.st+=/scourge_strike,if=(frost_runes.time_to_max<dot.frost_fever.remains)&(frost_runes.time_to_max<cooldown.death_and_decay.remains)&(unholy_runes.time_to_max<dot.blood_plague.remains)&(unholy_runes.time_to_max<cooldown.death_and_decay.remains)&cooldown.death_and_decay.remains>=1.5\nactions.st+=/icy_touch,if=dot.frost_fever.remains<=8&(frost_runes.time_to_max<cooldown.death_and_decay.remains)&cooldown.death_and_decay.remains>=1.5\nactions.st+=/plague_strike,if=dot.blood_plague.remains<=8&unholy_runes.time_to_max<cooldown.death_and_decay.remains&unholy_runes.time_to_max<buff.ghoul_frenzy.remains&cooldown.death_and_decay.remains>=1.5\nactions.st+=/horn_of_winter,if=cooldown.horn_of_winter.ready&cooldown.death_and_decay.remains>=1.5\nactions.st+=/death_coil,if=!toggle.cooldowns&cooldown.death_and_decay.remains<=3&cooldown.death_and_decay.remains>=1.5\n\nactions.aoe+=/use_items\nactions.aoe+=/potion\nactions.aoe+=/plague_strike,if=!dot.blood_plague.ticking&(unholy_runes.time_to_max<=cooldown.death_and_decay.remains)\nactions.aoe+=/icy_touch,if=!dot.frost_fever.ticking&(frost_runes.time_to_max<=cooldown.death_and_decay.remains)\nactions.aoe+=/pestilence,if=dot.frost_fever.ticking&dot.blood_plague.ticking&(action.pestilence.time_since>=14)&(blood_runes.time_to_max<=cooldown.death_and_decay.remains)\nactions.aoe+=/blood_tap,if=(glyph.blood_tap.enabled||health.pct>60)&blood_runes.current<=1&(cooldown.death_and_decay.ready||cooldown.death_and_decay.remains>=10)\nactions.aoe+=/death_and_decay,if=!moving&target.distance<=1\nactions.st+=/ghoul_frenzy,if=buff.ghoul_frenzy.down&talent.ghoul_frenzy.enabled&(unholy_runes.time_to_max<=cooldown.death_and_decay.remains)&cooldown.death_and_decay.remains>=1.5&buff.ghoul_frenzy.remains<=10\nactions.aoe+=/blood_strike,if=(buff.desolation.down||buff.desolation.remains<=3||fight_remains<8)&(blood_runes.time_to_max<=cooldown.death_and_decay.remains)\nactions.aoe+=/empower_rune_weapon,if=blood_runes.current+frost_runes.current+unholy_runes.current<3\nactions.aoe+=/blood_boil,if=dot.frost_fever.ticking&dot.blood_plague.ticking&(blood_runes.time_to_max<=cooldown.death_and_decay.remains)&cooldown.death_and_decay.remains>=1.5\nactions.aoe+=/hyperspeed_acceleration\nactions.aoe+=/summon_gargoyle\nactions.aoe+=/death_coil,if=(!toggle.cooldowns & runic_power.current>100) || (toggle.cooldowns & cooldown.summon_gargoyle.ready & runic_power.current>110) || (toggle.cooldowns & !cooldown.summon_gargoyle.ready & runic_power.current>100)&cooldown.death_and_decay.remains>=1.5\nactions.aoe+=/scourge_strike,if=(frost_runes.time_to_max<dot.frost_fever.remains)&(frost_runes.time_to_max<=cooldown.death_and_decay.remains)&(unholy_runes.time_to_max<dot.blood_plague.remains)&(unholy_runes.time_to_max<=cooldown.death_and_decay.remains)&cooldown.death_and_decay.remains>=1.5\nactions.aoe+=/icy_touch,if=dot.frost_fever.remains<=8&(frost_runes.time_to_max<cooldown.death_and_decay.remains)&cooldown.death_and_decay.remains>=1.5\nactions.aoe+=/plague_strike,if=dot.blood_plague.remains<=8&unholy_runes.time_to_max<cooldown.death_and_decay.remains&unholy_runes.time_to_max<buff.ghoul_frenzy.remains&cooldown.death_and_decay.remains>=1.5\nactions.aoe+=/horn_of_winter,if=cooldown.horn_of_winter.ready&cooldown.death_and_decay.remains>=1.5&cooldown.death_and_decay.remains>=1.5\nactions.aoe+=/death_coil,if=!toggle.cooldowns&cooldown.death_and_decay.remains<=3&cooldown.death_and_decay.remains>=1.5\n\nactions.life+=/icebound_fortitude\nactions.life+=/raise_dead,if=!pet.alive\nactions.life+=/death_pact,if=pet.alive",
},
["血冰(黑科研)"] = {
["builtIn"] = true,
["date"] = 20250820,
["author"] = "Feiyun",
["desc"] = "冰DK，基于血冰天赋（15/56/0），药剂和手套加速自己控制（无提醒）\n\n作者：葱油拌面\n完善：黑科力研究所[风雪]",
["lists"] = {
["default"] = {
{
{
},
["enabled"] = true,
["use_while_casting"] = 1,
["action"] = "nitro_boosts",
["use_off_gcd"] = 1,
["criteria"] = "defile_target_is_me",
},
{
["enabled"] = true,
["criteria"] = "glyph.disease.enabled & dot.frost_fever.ticking & dot.blood_plague.ticking & ( dot.frost_fever.remains < 4 || dot.blood_plague.remains < 4 )",
["action"] = "pestilence",
},
{
["enabled"] = true,
["criteria"] = "buff.freezing_fog.up & active_enemies > 1",
["action"] = "howling_blast",
},
{
["enabled"] = true,
["criteria"] = "! dot.frost_fever.ticking",
["action"] = "icy_touch",
},
{
["enabled"] = true,
["criteria"] = "! dot.blood_plague.ticking",
["action"] = "plague_strike",
},
{
["enabled"] = true,
["criteria"] = "(group_members > 5 & target.level = (-1) ) or (group_members <= 5 & boss)",
["action"] = "raise_dead",
},
{
["enabled"] = true,
["criteria"] = "( dot.frost_fever.ticking & dot.blood_plague.ticking ) & ( ( true_active_enemies > 1 & active_dot.frost_fever < true_active_enemies ) || ( true_active_enemies > 1 & active_dot.blood_plague < true_active_enemies ) )",
["action"] = "pestilence",
},
{
["enabled"] = true,
["criteria"] = "(group_members > 5 & target.level = (-1) ) or (group_members <= 5 & boss)",
["action"] = "unbreakable_armor",
},
{
["enabled"] = true,
["criteria"] = "((frost_runes.current + unholy_runes.current >= 1) || (dot.frost_fever.remains >= 6 & dot.blood_plague.remains >= 6)) & active_enemies = 1",
["action"] = "obliterate",
},
{
["enabled"] = true,
["criteria"] = "( blood_runes.current + frost_runes.current + unholy_runes.current < 3 ) & ((group_members > 5 & target.level = (-1) ) or (group_members <= 5 & boss))",
["action"] = "empower_rune_weapon",
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1",
["action"] = "howling_blast",
},
{
["enabled"] = true,
["criteria"] = "( dot.frost_fever.ticking || dot.blood_plague.ticking ) & active_enemies > 1",
["action"] = "blood_boil",
},
{
["enabled"] = true,
["criteria"] = "buff.killing_machine.up & buff.freezing_fog.up",
["action"] = "howling_blast",
},
{
["enabled"] = true,
["criteria"] = "buff.killing_machine.up",
["action"] = "frost_strike",
},
{
["enabled"] = true,
["criteria"] = "buff.freezing_fog.up",
["action"] = "howling_blast",
},
{
["enabled"] = true,
["criteria"] = "cooldown.horn_of_winter.ready & buff.horn_of_winter.remains < 5",
["action"] = "horn_of_winter",
},
{
["enabled"] = true,
["criteria"] = "runic_power.current > 40",
["action"] = "frost_strike",
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.remains > 7 & dot.blood_plague.remains > 7",
["action"] = "blood_strike",
},
{
["enabled"] = true,
["criteria"] = "runic_power.current < 80",
["action"] = "horn_of_winter",
},
},
["precombat"] = {
{
["action"] = "blood_presence",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.horn_of_winter.down",
["action"] = "horn_of_winter",
},
},
},
["version"] = 20250820,
["warnings"] = "此配置文件缺少对通用饰品的支持。建议每个优先级都需要包括：\n - [使用物品]，包含任何没有包含在优先级中的饰品，或者\n - [饰品1]和[饰品2]，这样做将推荐对应饰品装备栏中的饰品。\n成功导入了2个技能列表。\n",
["spec"] = 6,
["profile"] = "",
},
["双光环(黑科研)"] = {
["builtIn"] = true,
["date"] = 20250820,
["spec"] = 6,
["desc"] = "(实验)双光环DKT\n\n作者：黑科力研究所[惬喜]\n完善：黑科力研究所[风雪]",
["lists"] = {
["aoe"] = {
{
["action"] = "death_and_decay",
["enabled"] = true,
},
{
["enabled"] = true,
["action"] = "icy_touch",
["criteria"] = "! dot.frost_fever.ticking",
["cycle_targets"] = 1,
},
{
["enabled"] = true,
["action"] = "plague_strike",
["criteria"] = "! dot.blood_plague.ticking",
["cycle_targets"] = 1,
},
{
["enabled"] = true,
["criteria"] = "dot.frost_fever.ticking & dot.blood_plague.ticking & ( active_dot.frost_fever + active_dot.blood_plague < true_active_enemies * 2 )",
["action"] = "pestilence",
},
{
["enabled"] = true,
["criteria"] = "health.pct > 60 & ( active_enemies > 2 || ! talent.heart_strike.enabled )",
["action"] = "blood_boil",
},
},
["default"] = {
{
{
},
["enabled"] = true,
["use_while_casting"] = 1,
["action"] = "nitro_boosts",
["use_off_gcd"] = 1,
["criteria"] = "defile_target_is_me",
},
{
["action"] = "mind_freeze",
["enabled"] = true,
},
{
{
},
["enabled"] = true,
["action"] = "death_strike",
["criteria"] = "health.pct <= 20",
},
{
{
},
["enabled"] = true,
["action"] = "rune_tap",
["criteria"] = "health.pct <= 40",
},
{
{
},
["enabled"] = true,
["action"] = "frost_presence",
["criteria"] = "buff.frost_presence.down",
},
{
["enabled"] = true,
["criteria"] = "down",
["action"] = "horn_of_winter",
},
{
["enabled"] = true,
["criteria"] = "active_enemies > 1",
["strict"] = 1,
["action"] = "run_action_list",
["list_name"] = "aoe",
},
{
["enabled"] = true,
["action"] = "rune_strike",
["criteria"] = "runic_power.current > 50",
},
{
["enabled"] = true,
["action"] = "death_strike",
["criteria"] = "death_runes < 2 & dot.blood_plague.up",
},
{
{
},
["enabled"] = true,
["action"] = "icy_touch",
["criteria"] = "",
},
{
["enabled"] = false,
["criteria"] = "",
["action"] = "blood_tap",
},
{
["enabled"] = true,
["criteria"] = "frost_runes.current = 0",
["action"] = "empower_rune_weapon",
},
{
["action"] = "unholy_frenzy",
["enabled"] = false,
},
{
["enabled"] = true,
["criteria"] = "! dot.blood_plague.ticking",
["action"] = "plague_strike",
},
{
["enabled"] = true,
["criteria"] = "dot.blood_plague.ticking & dot.blood_plague.refreshable || dot.frost_fever.ticking & dot.frost_fever.refreshable",
["action"] = "pestilence",
},
{
["action"] = "blood_strike",
["enabled"] = true,
},
{
{
},
["enabled"] = true,
["criteria"] = "runic_power.current >= 70",
["action"] = "death_coil",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "buff.presence.down",
["action"] = "frost_presence",
},
},
},
["version"] = 20250820,
["warnings"] = "WARNING:  The import for 'aoe' required some automated changes.\nLine 5: Converted 'talent.X' to 'talent.X.enabled' (1x).\n\nImported 3 action lists.\n",
["author"] = "",
["basedOn"] = "鲜血(IV)",
["profile"] = "",
},
["狂怒"] = {
["builtIn"] = true,
["date"] = 20230416,
["spec"] = 1,
["desc"] = "Fury Warrior priority for Hekili",
["profile"] = "actions.precombat+=/berserker_stance,if=buff.stance.down\nactions.precombat+=/commanding_shout,if=assigned_shout.commanding_shout&buff.my_battle_shout.down&buff.my_commanding_shout.down\nactions.precombat+=/battle_shout,if=assigned_shout.battle_shout&buff.my_battle_shout.down&buff.my_commanding_shout.down\n\nactions+=/call_action_list,name=init\nactions+=/sunder_armor,if=variable.should_sunder&variable.emergency_sunder\nactions+=/pummel\nactions+=/run_action_list,name=berserker_stance,if=buff.berserker_stance.up\nactions+=/run_action_list,name=battle_stance,if=buff.battle_stance.up\nactions+=/run_action_list,name=defensive_stance,if=buff.defensive_stance.up\n\nactions.init+=/variable,name=time_to_die,value=(debuff.training_dummy.up&300)||target.time_to_die\nactions.init+=/variable,name=execute_phase,value=target.health.pct<20\nactions.init+=/variable,name=should_slam_over_execute,value=!variable.execute_phase||settings.execute_slam_prio\nactions.init+=/variable,name=should_bloodthirst,value=!variable.execute_phase||settings.execute_bloodthirst_enabled\nactions.init+=/variable,name=should_whirlwind,value=!variable.execute_phase||settings.execute_whirlwind_enabled\nactions.init+=/variable,name=should_sunder,value=settings.debuff_sunder_enabled&variable.time_to_die>((5-debuff.sunder_armor.stack)*(1.5+latency))+3\nactions.init+=/variable,name=build_sunder,value=!debuff.major_armor_reduction.up||(debuff.sunder_armor.up&debuff.sunder_armor.stack<5)\nactions.init+=/variable,name=maintain_sunder,value=!variable.build_sunder&debuff.sunder_armor.stack=5&debuff.sunder_armor.remains<7&cooldown.bloodthirst.remains&cooldown.whirlwind.remains&!buff.bloodsurge.up\nactions.init+=/variable,name=emergency_sunder,value=debuff.sunder_armor.up&debuff.sunder_armor.remains<1.5\nactions.init+=/variable,name=should_weave,value=cooldown.bloodthirst.remains>=settings.weave_cooldown_threshold&cooldown.whirlwind.remains>=settings.weave_cooldown_threshold&cooldown.recklessness.remains>1.5&cooldown.death_wish.remains>1.5&!buff.bloodsurge.up&!buff.recklessness.up&!buff.death_wish.up&rage.current<=weave_rage_threshold&target.health.pct>=settings.weave_health_threshold\nactions.init+=/variable,name=should_rend,value=variable.should_weave&rage.current>=10&debuff.rend.remains<=settings.rend_refresh_time\nactions.init+=/variable,name=should_overpower,value=variable.should_weave&rage.current>=20&(buff.overpower_ready.up||buff.taste_for_blood.up)\nactions.init+=/variable,name=weave_now,value=settings.weaving_enabled&(variable.should_rend||variable.should_overpower)\n\nactions.berserker_stance+=/bloodrage,use_off_gcd=1,if=rage.deficit>20\nactions.berserker_stance+=/heroic_strike,use_off_gcd=1,if=rage.current>=settings.queueing_threshold&active_enemies=1&!buff.recklessness.up&(!variable.execute_phase||settings.execute_queueing_enabled)\nactions.berserker_stance+=/cleave,use_off_gcd=1,if=rage.current>=settings.queueing_threshold&active_enemies>1&!buff.recklessness.up&(!variable.execute_phase||settings.execute_queueing_enabled)\nactions.berserker_stance+=/sunder_armor,if=variable.should_sunder&(variable.build_sunder||variable.maintain_sunder)\nactions.berserker_stance+=/death_wish,if=debuff.major_armor_reduction.up&!debuff.sunder_armor.up||debuff.sunder_armor.stack=5\nactions.berserker_stance+=/use_items,use_off_gcd=1\nactions.berserker_stance+=/hyperspeed_acceleration,use_off_gcd=1\nactions.berserker_stance+=/slam,if=buff.bloodsurge.up&main_gcd_spell_slam&variable.should_slam_over_execute\nactions.berserker_stance+=/bloodthirst,if=variable.should_bloodthirst&main_gcd_spell_bt\nactions.berserker_stance+=/whirlwind,if=variable.should_whirlwind&main_gcd_spell_ww\nactions.berserker_stance+=/slam,if=buff.bloodsurge.up&variable.should_slam_over_execute\nactions.berserker_stance+=/bloodthirst,if=variable.should_bloodthirst\nactions.berserker_stance+=/whirlwind,if=variable.should_whirlwind\nactions.berserker_stance+=/recklessness,if=(buff.death_wish.up||debuff.shattering_throw.up)\nactions.berserker_stance+=/execute\nactions.berserker_stance+=/slam,if=buff.bloodsurge.up\nactions.berserker_stance+=/demoralizing_shout,if=settings.debuff_demoshout_enabled&!debuff.demoralizing_shout.up\nactions.berserker_stance+=/battle_stance,use_off_gcd=1,if=variable.weave_now\n\nactions.battle_stance+=/shattering_throw,if=buff.bloodlust.up&debuff.shattering_throw.down\nactions.battle_stance+=/berserker_stance,use_off_gcd=1,if=(cooldown.bloodthirst.up||cooldown.whirlwind.up||rage.current<10)&(debuff.shattering_throw.up||!buff.bloodlust.up)\nactions.battle_stance+=/rend,if=!up||debuff.rend.remains<=settings.rend_refresh_time\nactions.battle_stance+=/overpower,if=talent.improved_overpower.rank>0\n\nactions.defensive_stance+=/berserker_stance,use_off_gcd=1",
["version"] = 20230416,
["warnings"] = "Imported 6 action lists.\n",
["author"] = "Defox",
["lists"] = {
["default"] = {
{
["enabled"] = true,
["action"] = "call_action_list",
["list_name"] = "init",
},
{
["enabled"] = true,
["criteria"] = "variable.should_sunder & variable.emergency_sunder",
["action"] = "sunder_armor",
},
{
["action"] = "pummel",
["enabled"] = true,
},
{
["enabled"] = true,
["action"] = "run_action_list",
["criteria"] = "buff.berserker_stance.up",
["list_name"] = "berserker_stance",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["criteria"] = "buff.battle_stance.up",
["list_name"] = "battle_stance",
},
{
["enabled"] = true,
["action"] = "run_action_list",
["criteria"] = "buff.defensive_stance.up",
["list_name"] = "defensive_stance",
},
},
["precombat"] = {
{
["enabled"] = true,
["criteria"] = "buff.stance.down",
["action"] = "berserker_stance",
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.commanding_shout & buff.my_battle_shout.down & buff.my_commanding_shout.down",
["action"] = "commanding_shout",
},
{
["enabled"] = true,
["criteria"] = "assigned_shout.battle_shout & buff.my_battle_shout.down & buff.my_commanding_shout.down",
["action"] = "battle_shout",
},
},
["defensive_stance"] = {
{
["use_off_gcd"] = 1,
["action"] = "berserker_stance",
["enabled"] = true,
},
},
["battle_stance"] = {
{
["enabled"] = true,
["criteria"] = "buff.bloodlust.up & debuff.shattering_throw.down",
["action"] = "shattering_throw",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "berserker_stance",
["criteria"] = "( cooldown.bloodthirst.up || cooldown.whirlwind.up || rage.current < 10 ) & ( debuff.shattering_throw.up || ! buff.bloodlust.up )",
},
{
["enabled"] = true,
["criteria"] = "! up || debuff.rend.remains <= settings.rend_refresh_time",
["action"] = "rend",
},
{
["enabled"] = true,
["criteria"] = "talent.improved_overpower.rank > 0",
["action"] = "overpower",
},
},
["berserker_stance"] = {
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "bloodrage",
["criteria"] = "rage.deficit > 20",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "heroic_strike",
["criteria"] = "rage.current >= settings.queueing_threshold & active_enemies = 1 & ! buff.recklessness.up & ( ! variable.execute_phase || settings.execute_queueing_enabled )",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "cleave",
["criteria"] = "rage.current >= settings.queueing_threshold & active_enemies > 1 & ! buff.recklessness.up & ( ! variable.execute_phase || settings.execute_queueing_enabled )",
},
{
["enabled"] = true,
["criteria"] = "variable.should_sunder & ( variable.build_sunder || variable.maintain_sunder )",
["action"] = "sunder_armor",
},
{
["enabled"] = true,
["criteria"] = "debuff.major_armor_reduction.up & ! debuff.sunder_armor.up || debuff.sunder_armor.stack = 5",
["action"] = "death_wish",
},
{
["use_off_gcd"] = 1,
["action"] = "use_items",
["enabled"] = true,
},
{
["use_off_gcd"] = 1,
["action"] = "hyperspeed_acceleration",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.bloodsurge.up & main_gcd_spell_slam & variable.should_slam_over_execute",
["action"] = "slam",
},
{
["enabled"] = true,
["criteria"] = "variable.should_bloodthirst & main_gcd_spell_bt",
["action"] = "bloodthirst",
},
{
["enabled"] = true,
["criteria"] = "variable.should_whirlwind & main_gcd_spell_ww",
["action"] = "whirlwind",
},
{
["enabled"] = true,
["criteria"] = "buff.bloodsurge.up & variable.should_slam_over_execute",
["action"] = "slam",
},
{
["enabled"] = true,
["criteria"] = "variable.should_bloodthirst",
["action"] = "bloodthirst",
},
{
["enabled"] = true,
["criteria"] = "variable.should_whirlwind",
["action"] = "whirlwind",
},
{
["enabled"] = true,
["criteria"] = "( buff.death_wish.up || debuff.shattering_throw.up )",
["action"] = "recklessness",
},
{
["action"] = "execute",
["enabled"] = true,
},
{
["enabled"] = true,
["criteria"] = "buff.bloodsurge.up",
["action"] = "slam",
},
{
["enabled"] = true,
["criteria"] = "settings.debuff_demoshout_enabled & ! debuff.demoralizing_shout.up",
["action"] = "demoralizing_shout",
},
{
["enabled"] = true,
["use_off_gcd"] = 1,
["action"] = "battle_stance",
["criteria"] = "variable.weave_now",
},
},
["init"] = {
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "( debuff.training_dummy.up & 300 ) || target.time_to_die",
["var_name"] = "time_to_die",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "target.health.pct < 20",
["var_name"] = "execute_phase",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "! variable.execute_phase || settings.execute_slam_prio",
["var_name"] = "should_slam_over_execute",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "! variable.execute_phase || settings.execute_bloodthirst_enabled",
["var_name"] = "should_bloodthirst",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "! variable.execute_phase || settings.execute_whirlwind_enabled",
["var_name"] = "should_whirlwind",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "settings.debuff_sunder_enabled & variable.time_to_die > ( ( 5 - debuff.sunder_armor.stack ) * ( 1.5 + latency ) ) + 3",
["var_name"] = "should_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "! debuff.major_armor_reduction.up || ( debuff.sunder_armor.up & debuff.sunder_armor.stack < 5 )",
["var_name"] = "build_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "! variable.build_sunder & debuff.sunder_armor.stack = 5 & debuff.sunder_armor.remains < 7 & cooldown.bloodthirst.remains & cooldown.whirlwind.remains & ! buff.bloodsurge.up",
["var_name"] = "maintain_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "debuff.sunder_armor.up & debuff.sunder_armor.remains < 1.5",
["var_name"] = "emergency_sunder",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "cooldown.bloodthirst.remains >= settings.weave_cooldown_threshold & cooldown.whirlwind.remains >= settings.weave_cooldown_threshold & cooldown.recklessness.remains > 1.5 & cooldown.death_wish.remains > 1.5 & ! buff.bloodsurge.up & ! buff.recklessness.up & ! buff.death_wish.up & rage.current <= weave_rage_threshold & target.health.pct >= settings.weave_health_threshold",
["var_name"] = "should_weave",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "variable.should_weave & rage.current >= 10 & debuff.rend.remains <= settings.rend_refresh_time",
["var_name"] = "should_rend",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "variable.should_weave & rage.current >= 20 & ( buff.overpower_ready.up || buff.taste_for_blood.up )",
["var_name"] = "should_overpower",
},
{
["enabled"] = true,
["op"] = "set",
["action"] = "variable",
["value"] = "settings.weaving_enabled & ( variable.should_rend || variable.should_overpower )",
["var_name"] = "weave_now",
},
},
},
},
},
},
},
}

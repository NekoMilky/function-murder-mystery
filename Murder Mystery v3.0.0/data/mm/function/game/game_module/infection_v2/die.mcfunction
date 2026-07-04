#重生
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 if score @s mm_res_second matches 1 run title @s subtitle {"translate":"mm.title.respawning.subtitle.single","color":"yellow","with":[{"score":{"objective":"mm_res_second","name":"@s"},"color":"red"}]}
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 unless score @s mm_res_second matches 1 run title @s subtitle {"translate":"mm.title.respawning.subtitle.plural","color":"yellow","with":[{"score":{"objective":"mm_res_second","name":"@s"},"color":"red"}]}
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 run title @s title {"translate":"mm.title.you_died","color":"red"}

execute as @a[tag=mm_will_respawn] run scoreboard players remove @s mm_res_tick 1
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 0 run scoreboard players remove @s mm_res_second 1
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 0 run scoreboard players set @s mm_res_tick 20

execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 if score @s mm_res_second matches 0 run tag @s add mm_respawn

execute as @a[tag=mm_infected,tag=mm_respawn] run title @s subtitle {"translate":"mm.title.infected.subtitle","color":"yellow"}
execute as @a[tag=mm_infected,tag=mm_respawn] run title @s title {"translate":"mm.title.infected","color":"red"}
execute as @a[tag=mm_alpha,tag=mm_respawn] run title @s subtitle {"translate":"mm.title.respawned.subtitle","color":"green"}
execute as @a[tag=mm_alpha,tag=mm_respawn] run title @s title ""
execute as @a[tag=mm_respawn] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}

execute as @a[tag=mm_respawn] run tag @s remove mm_will_respawn
execute as @a[tag=mm_respawn] run tag @s remove mm_respawn

#死亡
function mm:game/game_module/die/main

##若母体还未选出则阻止本次死亡
execute if score game_second mm_main > get_weapon mm_main as @a[tag=mm_victim] run tellraw @s {"translate":"mm.text.alpha_not_selected","color":"green"}
execute if score game_second mm_main > get_weapon mm_main as @a[tag=mm_victim] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}
execute if score game_second mm_main > get_weapon mm_main as @a[tag=mm_victim] run function mm:game/game_module/projectile/remove
execute if score game_second mm_main > get_weapon mm_main as @a[tag=mm_victim] run tag @s remove mm_victim

execute as @a[tag=mm_victim] run clear @s minecraft:arrow

##数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main

##死亡
###感染者
execute as @a[tag=mm_victim,tag=mm_infected] run tag @s add mm_infected_died

execute as @a[tag=mm_victim,tag=mm_infected_died] if entity @a[tag=mm_alpha,tag=!mm_dead] run tag @s add mm_will_respawn
execute as @a[tag=mm_victim,tag=mm_infected_died] if entity @a[tag=mm_alpha,tag=!mm_dead] run scoreboard players set @s mm_res_tick 20
execute as @a[tag=mm_victim,tag=mm_infected_died] if entity @a[tag=mm_alpha,tag=!mm_dead] run scoreboard players set @s mm_res_second 5

execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run tellraw @a[tag=mm_survivor,scores={mm_death_type=..-1}] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"10"},{"translate":"mm.text.kill.infected"}]}
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run scoreboard players add @a[tag=mm_survivor,scores={mm_death_type=..-1}] mm_stats_14 10
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run tag @s add mm_dead
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run function mm:scoreboard/calculate_data/main

execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] at @s run tellraw @a[tag=mm_playing,tag=!mm_infected_died] {"translate":"mm.text.infected_die","color":"yellow","with":[{"selector":"@s","color":"gray"},{"score":{"objective":"mm_data","name":"infected_real_left"},"color":"red"}]}

execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] if entity @a[tag=mm_infected,tag=!mm_dead] if score infected_tick mm_main matches -1 if score infected_real_left mm_data matches 1 run tellraw @a[tag=mm_survivor] {"translate":"mm.text.infected_expose.others","color":"green"}
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] if entity @a[tag=mm_infected,tag=!mm_dead] if score infected_tick mm_main matches -1 if score infected_real_left mm_data matches 1 run tellraw @a[tag=mm_infected,tag=!mm_dead] {"translate":"mm.text.infected_expose.self","color":"green"}
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run function mm:game/game_module/death_cause_display/main
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run effect give @s blindness 3 1 true
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run scoreboard players add @s mm_stats_8 1
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run function mm:game/game_module/lastwords
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run function mm:game/game_module/death_cry
execute as @a[tag=mm_victim,tag=mm_infected_died] unless entity @a[tag=mm_alpha,tag=!mm_dead] run function mm:game/game_module/dead_body/main

execute as @a[tag=mm_victim,tag=mm_infected_died] run scoreboard players set @s mm_API_p 55
execute as @a[tag=mm_victim,tag=mm_infected_died] run tag @s remove mm_infected_died

###母体
execute as @a[tag=mm_victim,tag=mm_alpha,tag=mm_exposed] run tag @s add mm_alpha_died
execute as @a[tag=mm_victim,tag=mm_alpha,tag=!mm_exposed,tag=!mm_invincible] run tag @s add mm_alpha_exposed

execute as @a[tag=mm_victim,tag=mm_alpha_died,scores={mm_death_type=1..100}] run tellraw @a[tag=mm_survivor,scores={mm_death_type=..-1}] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"15"},{"translate":"mm.text.kill.alpha.kill"}]} 
execute as @a[tag=mm_victim,tag=mm_alpha_died,scores={mm_death_type=1..100}] run scoreboard players add @a[tag=mm_survivor,scores={mm_death_type=..-1}] mm_stats_14 15 

execute as @a[tag=mm_victim,tag=mm_alpha_died,scores={mm_death_type=1..100}] as @a[tag=mm_survivor,scores={mm_death_type=..-1}] run tellraw @a[tag=mm_playing] {"translate":"mm.text.alpha_killed.kill","color":"yellow","with":[{"selector":"@s","color":"gray"}]}

execute as @a[tag=mm_victim,tag=mm_alpha_died,scores={mm_death_type=101..}] run tellraw @a[tag=mm_playing] {"translate":"mm.text.alpha_killed.natural","color":"yellow"}
execute as @a[tag=mm_victim,tag=mm_alpha_died] as @a[tag=mm_playing] at @s run playsound minecraft:entity.lightning_bolt.thunder player @s ~ ~ ~ 1 1
execute as @a[tag=mm_victim,tag=mm_alpha_died] as @a[tag=mm_survivor] run title @s subtitle {"translate":"mm.title.alpha_killed.subtitle.survivor","color":"yellow"}
execute as @a[tag=mm_victim,tag=mm_alpha_died] as @a[tag=mm_survivor] run title @s title {"translate":"mm.title.alpha_killed","color":"red"}
execute as @a[tag=mm_victim,tag=mm_alpha_died] as @a[tag=mm_infected] run title @s subtitle {"translate":"mm.title.alpha_killed.subtitle.infected","color":"yellow"}
execute as @a[tag=mm_victim,tag=mm_alpha_died] as @a[tag=mm_infected] run title @s title {"translate":"mm.title.alpha_killed","color":"red"}

execute as @a[tag=mm_victim,tag=mm_alpha_died] run tag @s add mm_dead
execute as @a[tag=mm_victim,tag=mm_alpha_died] run function mm:scoreboard/calculate_data/main
execute as @a[tag=mm_victim,tag=mm_alpha_died] if entity @a[tag=mm_infected,tag=!mm_dead] if score infected_tick mm_main matches -1 if score infected_real_left mm_data matches ..1 run tellraw @a[tag=mm_survivor] {"translate":"mm.text.infected_expose.others","color":"green"}
execute as @a[tag=mm_victim,tag=mm_alpha_died] if entity @a[tag=mm_infected,tag=!mm_dead] if score infected_tick mm_main matches -1 if score infected_real_left mm_data matches ..1 run tellraw @a[tag=mm_infected,tag=!mm_dead] {"translate":"mm.text.infected_expose.self","color":"green"}
execute as @a[tag=mm_victim,tag=mm_alpha_died] if score infected_tick mm_main matches -1 unless score infected_real_left mm_data matches ..1 run tellraw @a[tag=mm_playing] {"translate":"mm.text.alpha_hide","color":"green"}
execute as @a[tag=mm_victim,tag=mm_alpha_died] run function mm:game/game_module/death_cause_display/main
execute as @a[tag=mm_victim,tag=mm_alpha_died] run effect give @s blindness 3 1 true
execute as @a[tag=mm_victim,tag=mm_alpha_died] run scoreboard players add @s mm_stats_8 1
execute as @a[tag=mm_victim,tag=mm_alpha_died] run function mm:game/game_module/lastwords
execute as @a[tag=mm_victim,tag=mm_alpha_died] run function mm:game/game_module/death_cry
execute as @a[tag=mm_victim,tag=mm_alpha_died] run function mm:game/game_module/dead_body/main
execute as @a[tag=mm_victim,tag=mm_alpha_died] run scoreboard players set @s mm_API_p 60

execute as @a[tag=mm_victim,tag=mm_alpha_exposed,scores={mm_death_type=1..100}] run tellraw @a[tag=mm_survivor,scores={mm_death_type=..-1}] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"15"},{"translate":"mm.text.kill.alpha.reveal"}]} 
execute as @a[tag=mm_victim,tag=mm_alpha_exposed,scores={mm_death_type=1..100}] run scoreboard players add @a[tag=mm_survivor,scores={mm_death_type=..-1}] mm_stats_14 15

execute as @a[tag=mm_victim,tag=mm_alpha_exposed,scores={mm_death_type=1..100}] if entity @a[tag=mm_survivor,scores={mm_death_type=..-1}] run tellraw @a[tag=mm_playing] {"translate":"mm.text.alpha_revealed.kill","color":"yellow","with":[{"selector":"@s","color":"gray"},{"selector":"@a[tag=mm_survivor,scores={mm_death_type=..-1}]","color":"gray"}]}
execute as @a[tag=mm_victim,tag=mm_alpha_exposed,scores={mm_death_type=101..}] run tellraw @a[tag=mm_playing] {"translate":"mm.text.alpha_revealed.natural","color":"yellow","with":[{"selector":"@s","color":"gray"}]}

execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run tag @s add mm_exposed
execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run tag @s add mm_will_respawn
execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run clear @s bow
execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run clear @s iron_chestplate
execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run team join mm_infected @s
execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run team modify mm_survivor friendlyFire false
execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run scoreboard players set @s mm_res_tick 20
execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run scoreboard players set @s mm_res_second 5
execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run scoreboard players set @s mm_API_p 59

execute as @a[tag=mm_victim,tag=mm_alpha_died] run tag @s remove mm_alpha_died
execute as @a[tag=mm_victim,tag=mm_alpha_exposed] run tag @s remove mm_alpha_exposed

###幸存者
execute as @a[tag=mm_victim,tag=mm_survivor] run tag @s add mm_survivor_died

execute as @a[tag=mm_victim,tag=mm_survivor_died,scores={mm_death_type=1..100}] if entity @a[tag=mm_infected,scores={mm_death_type=..-1}] run tellraw @a[tag=mm_playing] {"translate":"mm.text.infect.kill","color":"gray","with":[{"selector":"@a[tag=mm_infected,scores={mm_death_type=..-1}]","color":"gray"},{"selector":"@s","color":"gray"}]}
execute as @a[tag=mm_victim,tag=mm_survivor_died,scores={mm_death_type=1..100}] if entity @a[tag=mm_alpha,tag=mm_exposed,scores={mm_death_type=..-1}] run tellraw @a[tag=mm_playing] {"translate":"mm.text.infect.kill","color":"gray","with":[{"selector":"@a[tag=mm_alpha,tag=mm_exposed,scores={mm_death_type=..-1}]","color":"gray"},{"selector":"@s","color":"gray"}]}
execute as @a[tag=mm_victim,tag=mm_survivor_died,scores={mm_death_type=1..100}] if entity @a[tag=mm_alpha,tag=!mm_exposed,scores={mm_death_type=..-1}] run tellraw @a[tag=mm_playing] {"translate":"mm.text.infect.kill","color":"gray","with":[{"translate":"mm.text.alpha_select.self.alpha","color":"yellow"},{"selector":"@s","color":"gray"}]}
execute as @a[tag=mm_victim,tag=mm_survivor_died,scores={mm_death_type=100..}] run tellraw @a[tag=mm_playing] {"translate":"mm.text.infect.natural","color":"gray","with":[{"selector":"@s","color":"gray"}]}

execute as @a[tag=mm_victim,tag=mm_survivor_died] at @s run playsound minecraft:entity.zombie.attack_iron_door player @s ~ ~ ~ 0.7 1
execute as @a[tag=mm_victim,tag=mm_survivor_died] if score infected_tick mm_main matches -1 if entity @a[tag=mm_alpha,tag=!mm_dead] run scoreboard players set #ALL mm_API 17
execute as @a[tag=mm_victim,tag=mm_survivor_died] if score infected_tick mm_main matches -1 if entity @a[tag=mm_alpha,tag=!mm_dead] run tellraw @a[tag=mm_playing] {"translate":"mm.text.alpha_hide","color":"green"}
execute as @a[tag=mm_victim,tag=mm_survivor_died] if score infected_tick mm_main matches -1 unless entity @a[tag=mm_alpha,tag=!mm_dead] if score infected_real_left mm_data matches ..1 run scoreboard players set #ALL mm_API 17
execute as @a[tag=mm_victim,tag=mm_survivor_died] if score infected_tick mm_main matches -1 unless entity @a[tag=mm_alpha,tag=!mm_dead] if score infected_real_left mm_data matches ..1 run tellraw @a[tag=mm_playing] {"translate":"mm.text.infected_hide","color":"green"}
execute as @a[tag=mm_victim,tag=mm_survivor_died] run scoreboard players set infected_tick mm_main 600
execute as @a[tag=mm_victim,tag=mm_survivor_died] run scoreboard players operation @s mm_survive_time = game_time mm_settings
execute as @a[tag=mm_victim,tag=mm_survivor_died] run scoreboard players operation @s mm_survive_time -= game_second mm_main
execute as @a[tag=mm_victim,tag=mm_survivor_died] run tag @s remove mm_survivor
execute as @a[tag=mm_victim,tag=mm_survivor_died] run tag @s add mm_infected
execute as @a[tag=mm_victim,tag=mm_survivor_died] run team join mm_infected @s
execute as @a[tag=mm_victim,tag=mm_survivor_died] run tag @s add mm_will_respawn
execute as @a[tag=mm_victim,tag=mm_survivor_died] run clear @s bow
execute as @a[tag=mm_victim,tag=mm_survivor_died] run clear @s iron_chestplate
execute as @a[tag=mm_victim,tag=mm_survivor_died] run loot replace entity @s hotbar.0 loot mm:knife
execute as @a[tag=mm_victim,tag=mm_survivor_died] run scoreboard players set @s mm_res_tick 20
execute as @a[tag=mm_victim,tag=mm_survivor_died] run scoreboard players set @s mm_res_second 5
execute as @a[tag=mm_victim,tag=mm_survivor_died] run scoreboard players set @s mm_API_p 50

execute as @a[tag=mm_victim,tag=mm_survivor_died] run tag @s remove mm_survivor_died

##数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main
execute as @a[tag=mm_victim] run function mm:game/game_module/projectile/remove

execute as @a[tag=mm_victim] run tag @s remove mm_victim

execute as @a[scores={mm_death_type=1..}] run scoreboard players set @s mm_death_type 0
execute as @a[scores={mm_death_type=..-1}] run scoreboard players set @s mm_death_type 0
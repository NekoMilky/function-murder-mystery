#重生
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 if score @s mm_res_second matches 1 run title @s subtitle {"translate":"mm.title.respawning.subtitle.single","color":"yellow","with":[{"score":{"objective":"mm_res_second","name":"@s"},"color":"red"}]}
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 unless score @s mm_res_second matches 1 run title @s subtitle {"translate":"mm.title.respawning.subtitle.plural","color":"yellow","with":[{"score":{"objective":"mm_res_second","name":"@s"},"color":"red"}]}
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 run title @s title {"translate":"mm.title.you_died","color":"red"}

execute as @a[tag=mm_will_respawn] run scoreboard players remove @s mm_res_tick 1
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 0 run scoreboard players remove @s mm_res_second 1
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 0 run scoreboard players set @s mm_res_tick 20

execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 if score @s mm_res_second matches 0 run tag @s add mm_respawn

execute as @a[tag=mm_respawn] run title @s subtitle {"translate":"mm.title.infected.subtitle","color":"yellow"}
execute as @a[tag=mm_respawn] run title @s title {"translate":"mm.title.infected","color":"red"}
execute as @a[tag=mm_respawn] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}

execute as @a[tag=mm_respawn] run tag @s remove mm_will_respawn
execute as @a[tag=mm_respawn] run tag @s remove mm_respawn

#死亡
function mm:game/game_module/die/main

##若感染者还未选出则阻止本次死亡
execute if score game_second mm_main > get_weapon mm_main as @a[tag=mm_victim] run tellraw @s {"translate":"mm.text.infected_not_selected","color":"green"}
execute if score game_second mm_main > get_weapon mm_main as @a[tag=mm_victim] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}
execute if score game_second mm_main > get_weapon mm_main as @a[tag=mm_victim] run function mm:game/game_module/projectile/remove
execute if score game_second mm_main > get_weapon mm_main as @a[tag=mm_victim] run tag @s remove mm_victim

execute as @a[tag=mm_victim] run clear @s minecraft:arrow

##数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main

##死亡
execute as @a[tag=mm_victim,scores={mm_death_type=1..100}] if entity @a[tag=mm_infected,scores={mm_death_type=..-1}] at @s run tellraw @a[tag=mm_playing] {"translate":"mm.text.infect.kill","color":"gray","with":[{"selector":"@p[tag=mm_infected,scores={mm_death_type=..-1}]","color":"gray"},{"selector":"@s","color":"gray"}]}
execute as @a[tag=mm_victim,scores={mm_death_type=100..}] run tellraw @a[tag=mm_playing] {"translate":"mm.text.infect.natural","color":"gray","with":[{"selector":"@s","color":"gray"}]}

execute as @a[tag=mm_victim,tag=mm_survivor] run scoreboard players operation @s mm_survive_time = game_time mm_settings
execute as @a[tag=mm_victim,tag=mm_survivor] run scoreboard players operation @s mm_survive_time -= game_second mm_main

execute as @a[tag=mm_victim,tag=mm_survivor] at @s run playsound minecraft:entity.zombie.attack_iron_door player @s ~ ~ ~ 0.7 1
execute as @a[tag=mm_victim,tag=mm_survivor] run clear @s bow
execute as @a[tag=mm_victim,tag=mm_survivor] run clear @s iron_chestplate
execute as @a[tag=mm_victim,tag=mm_survivor] run loot replace entity @s hotbar.0 loot mm:knife
execute as @a[tag=mm_victim,tag=mm_survivor] run scoreboard players set @s mm_API_p 50

execute as @a[tag=mm_victim,tag=mm_infected] run scoreboard players set @s mm_API_p 55

execute as @a[tag=mm_victim] run scoreboard players set @s mm_res_tick 20
execute as @a[tag=mm_victim] run scoreboard players set @s mm_res_second 5

execute as @a[tag=mm_victim] run tag @s add mm_will_respawn
execute as @a[tag=mm_victim] run tag @s remove mm_survivor
execute as @a[tag=mm_victim] run tag @s add mm_infected
execute as @a[tag=mm_victim] run team join mm_infected @s

##数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main
execute as @a[tag=mm_victim] run function mm:game/game_module/projectile/remove

execute as @a[tag=mm_victim] run tag @s remove mm_victim

execute as @a[scores={mm_death_type=1..}] run scoreboard players set @s mm_death_type 0
execute as @a[scores={mm_death_type=..-1}] run scoreboard players set @s mm_death_type 0
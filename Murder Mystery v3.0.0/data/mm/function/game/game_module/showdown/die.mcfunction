#重生
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 if score @s mm_res_second matches 1 run title @s subtitle {"translate":"mm.title.respawning.subtitle.single","color":"yellow","with":[{"score":{"objective":"mm_res_second","name":"@s"},"color":"red"}]}
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 unless score @s mm_res_second matches 1 run title @s subtitle {"translate":"mm.title.respawning.subtitle.plural","color":"yellow","with":[{"score":{"objective":"mm_res_second","name":"@s"},"color":"red"}]}
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 run title @s title {"translate":"mm.title.you_died","color":"red"}

execute as @a[tag=mm_will_respawn] run scoreboard players remove @s mm_res_tick 1
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 0 run scoreboard players remove @s mm_res_second 1
execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 0 run scoreboard players set @s mm_res_tick 20

execute as @a[tag=mm_will_respawn] if score @s mm_res_tick matches 20 if score @s mm_res_second matches 0 run tag @s add mm_respawn

execute as @a[tag=mm_respawn] run title @s subtitle {"translate":"mm.title.respawned.subtitle","color":"green"}
execute as @a[tag=mm_respawn] run title @s title ""
execute as @a[tag=mm_respawn] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}

execute as @a[tag=mm_respawn] run tag @s remove mm_will_respawn
execute as @a[tag=mm_respawn] run tag @s remove mm_respawn

#死亡
function mm:game/game_module/die/main

##数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main

##死亡
execute as @a[tag=mm_victim] if entity @a[scores={mm_death_type=..-1}] run tellraw @s {"translate":"mm.text.showdown_kill.others","color":"gray","with":[{"selector":"@a[scores={mm_death_type=..-1}]","color":"gray"}]}
execute as @a[tag=mm_victim] if entity @a[scores={mm_death_type=..-1}] run tellraw @a[scores={mm_death_type=..-1}] {"translate":"mm.text.showdown_kill.self","color":"gray","with":[{"selector":"@s","color":"gray"}]}

execute as @a[tag=mm_victim] run scoreboard players add @s mm_death_count 1

execute as @a[tag=mm_victim] run scoreboard players set @s mm_res_tick 20
execute as @a[tag=mm_victim] run scoreboard players set @s mm_res_second 5
execute as @a[tag=mm_victim] run scoreboard players set @s mm_API_p 63

##遗言
execute as @a[tag=mm_victim] run function mm:game/game_module/lastwords

##亡语
execute as @a[tag=mm_victim] run function mm:game/game_module/death_cry

##遗体
execute as @a[tag=mm_victim] run function mm:game/game_module/dead_body/main

execute as @a[tag=mm_victim] run tag @s add mm_will_respawn

##数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main
execute as @a[tag=mm_victim] run function mm:game/game_module/projectile/remove

execute as @a[tag=mm_victim] run tag @s remove mm_victim

execute as @a[scores={mm_death_type=1..}] run scoreboard players set @s mm_death_type 0
execute as @a[scores={mm_death_type=..-1}] run scoreboard players set @s mm_death_type 0
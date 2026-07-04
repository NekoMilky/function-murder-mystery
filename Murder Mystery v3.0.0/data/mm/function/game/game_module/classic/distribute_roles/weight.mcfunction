$scoreboard players set this_index mm_main $(index)
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main

#按概率给予特殊身份
function mm:game/game_module/distribute_roles/weight {type:"m",filter:"tag=!mm_murderer,tag=!mm_detective",tag:"mm_murderer"}
function mm:game/game_module/distribute_roles/weight {type:"d",filter:"tag=!mm_murderer,tag=!mm_detective",tag:"mm_detective"}

scoreboard players operation @a[limit=1,tag=mm_murderer,scores={mm_spe_id=0}] mm_spe_id = this_index mm_main
scoreboard players operation @a[limit=1,tag=mm_detective,scores={mm_spe_id=0}] mm_spe_id = this_index mm_main

#递归
execute if score this_index mm_main < murderer_count mm_settings run function mm:game/game_module/classic/distribute_roles/random with storage mm:main temporary
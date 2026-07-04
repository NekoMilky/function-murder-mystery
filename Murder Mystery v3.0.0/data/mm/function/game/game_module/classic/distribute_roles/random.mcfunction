$scoreboard players set this_index mm_main $(index)
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main

#给随机玩家特殊身份
execute unless score game_mode mm_main matches 9 run tag @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_murderer,tag=!mm_detective,limit=1] add mm_murderer
tag @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_murderer,tag=!mm_detective,limit=1] add mm_detective

scoreboard players operation @a[limit=1,tag=mm_murderer,scores={mm_spe_id=0}] mm_spe_id = this_index mm_main
scoreboard players operation @a[limit=1,tag=mm_detective,scores={mm_spe_id=0}] mm_spe_id = this_index mm_main

#递归
execute if score this_index mm_main < murderer_count mm_settings run function mm:game/game_module/classic/distribute_roles/random with storage mm:main temporary
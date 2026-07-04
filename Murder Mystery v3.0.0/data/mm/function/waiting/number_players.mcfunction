$scoreboard players set this_id mm_main $(id)

#给随机玩家编号
execute unless entity @a[tag=mm_playing,tag=!mm_choose_spectator,scores={mm_players_id=0}] as @a[tag=mm_playing,limit=1,scores={mm_players_id=0}] run scoreboard players operation @s mm_players_id = this_id mm_main
execute as @a[tag=mm_playing,tag=!mm_choose_spectator,limit=1,scores={mm_players_id=0}] run scoreboard players operation @s mm_players_id = this_id mm_main

#递归
scoreboard players add this_id mm_main 1
execute store result storage mm:main temporary.id int 1 run scoreboard players get this_id mm_main

execute if entity @a[tag=mm_playing,scores={mm_players_id=0}] run function mm:waiting/number_players with storage mm:main temporary
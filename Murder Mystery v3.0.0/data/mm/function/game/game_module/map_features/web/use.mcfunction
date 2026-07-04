#蛛网放置
execute at @s anchored eyes run summon minecraft:marker ^ ^ ^ {Tags:["mm_web_start"]}

execute at @s run data modify entity @n[tag=mm_web_start] Rotation set from entity @s Rotation
execute at @s as @n[tag=mm_web_start] at @s run function mm:game/game_module/map_features/common/teleport_first {name:"web",distance:0}

execute as @e[tag=mm_web,tag=mm_new] at @s run setblock ~ ~ ~ cobweb
execute as @e[tag=mm_web,tag=mm_new] at @s run scoreboard players set @s mm_cd_tick 200
execute as @e[tag=mm_web,tag=mm_new] at @s run tag @s remove mm_new
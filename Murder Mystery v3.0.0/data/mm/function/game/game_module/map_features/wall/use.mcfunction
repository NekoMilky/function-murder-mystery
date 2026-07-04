#筑墙器放置
execute as @s[y_rotation=-135..-46] at @s anchored eyes run summon minecraft:marker ^ ^ ^ {Tags:["mm_wall_start","mm_east_west"]}
execute as @s[y_rotation=-45..44] at @s anchored eyes run summon minecraft:marker ^ ^ ^ {Tags:["mm_wall_start","mm_south_north"]}
execute as @s[y_rotation=45..134] at @s anchored eyes run summon minecraft:marker ^ ^ ^ {Tags:["mm_wall_start","mm_east_west"]}
execute as @s[y_rotation=135..180] at @s anchored eyes run summon minecraft:marker ^ ^ ^ {Tags:["mm_wall_start","mm_south_north"]}
execute as @s[y_rotation=-180..-136] at @s anchored eyes run summon minecraft:marker ^ ^ ^ {Tags:["mm_wall_start","mm_south_north"]}

execute at @s run data modify entity @n[tag=mm_wall_start] Rotation set from entity @s Rotation
execute at @s as @n[tag=mm_wall_start] at @s run function mm:game/game_module/map_features/common/teleport_first {name:"wall",distance:0}

execute as @e[tag=mm_wall,tag=mm_new] at @s run setblock ~ ~ ~ light_blue_stained_glass
execute as @e[tag=mm_wall,tag=mm_new] at @s run scoreboard players set @s mm_cd_tick 200
execute as @e[tag=mm_wall,tag=mm_new] at @s run tag @s remove mm_new
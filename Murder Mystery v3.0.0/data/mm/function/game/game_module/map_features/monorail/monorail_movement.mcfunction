#矿车运动
team join mm_innocent_1

execute at @s if block ~ ~ ~ minecraft:activator_rail run scoreboard players set @p[tag=!mm_dead,tag=!mm_spectator,tag=mm_using_features] mm_API_p 74
execute at @s if block ~ ~ ~ minecraft:activator_rail run tellraw @p[tag=!mm_dead,tag=!mm_spectator,tag=mm_using_features] {"translate":"mm.text.map_features.monorail.end","color":"green"}
execute at @s if block ~ ~ ~ minecraft:activator_rail run tag @p[tag=!mm_dead,tag=!mm_spectator,tag=mm_using_features] remove mm_using_features
execute at @s if block ~ ~ ~ minecraft:activator_rail run kill @s
#状态更新
$execute as @e[tag=mm_$(name)_spawner,tag=mm_special_element,tag=!mm_pressed] at @s if block ~1 ~ ~ #minecraft:buttons[powered=true] run tag @s add mm_new_pressed
$execute as @e[tag=mm_$(name)_spawner,tag=mm_special_element,tag=!mm_pressed] at @s if block ~-1 ~ ~ #minecraft:buttons[powered=true] run tag @s add mm_new_pressed
$execute as @e[tag=mm_$(name)_spawner,tag=mm_special_element,tag=!mm_pressed] at @s if block ~ ~ ~1 #minecraft:buttons[powered=true] run tag @s add mm_new_pressed
$execute as @e[tag=mm_$(name)_spawner,tag=mm_special_element,tag=!mm_pressed] at @s if block ~ ~ ~-1 #minecraft:buttons[powered=true] run tag @s add mm_new_pressed
$execute as @e[tag=mm_$(name)_spawner,tag=mm_special_element,tag=!mm_pressed] at @s if block ~ ~1 ~ #minecraft:buttons[powered=true] run tag @s add mm_new_pressed
$execute as @e[tag=mm_$(name)_spawner,tag=mm_special_element,tag=!mm_pressed] at @s if block ~ ~-1 ~ #minecraft:buttons[powered=true] run tag @s add mm_new_pressed

$execute as @e[tag=mm_$(name)_spawner,tag=mm_special_element,tag=mm_pressed] at @s unless block ~1 ~ ~ #minecraft:buttons[powered=true] unless block ~-1 ~ ~ #minecraft:buttons[powered=true] unless block ~ ~ ~1 #minecraft:buttons[powered=true] unless block ~ ~ ~-1 #minecraft:buttons[powered=true] unless block ~ ~1 ~ #minecraft:buttons[powered=true] unless block ~ ~-1 ~ #minecraft:buttons[powered=true] run tag @s remove mm_pressed

#破坏
$execute as @e[tag=!mm_npc,tag=mm_$(name)_spawner,tag=mm_special_element] at @s run function mm:game/game_module/map_features/$(name)/destroy
$execute as @e[tag=!mm_npc,tag=mm_$(name)_spawner,tag=mm_special_element] at @s unless block ~1 ~ ~ #minecraft:buttons unless block ~-1 ~ ~ #minecraft:buttons unless block ~ ~ ~1 #minecraft:buttons unless block ~ ~ ~-1 #minecraft:buttons unless block ~ ~1 ~ #minecraft:buttons unless block ~ ~-1 ~ #minecraft:buttons run tag @s add mm_destroyed

$execute as @e[tag=mm_destroyed] run function mm:game/game_module/map_features/common/broken_message {name:$(name)}
$execute as @e[tag=mm_destroyed] at @s run kill @n[tag=mm_$(name)_title,tag=mm_special_element,distance=..3]
execute as @e[tag=mm_destroyed] run kill @s
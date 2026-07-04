#传送
execute at @s run tp ^ ^ ^0.4
$scoreboard players set current_distance mm_main $(distance)
scoreboard players add current_distance mm_main 4

#递归
$data modify storage mm:main temporary.name set value "$(name)"
execute store result storage mm:main temporary.distance int 1 run scoreboard players get current_distance mm_main
execute at @s if score current_distance mm_main matches ..35 if block ~ ~ ~ #minecraft:air run function mm:game/game_module/map_features/common/teleport_first with storage mm:main temporary

execute at @s unless score current_distance mm_main matches ..35 run kill @s

$execute at @s unless block ~ ~ ~ #minecraft:air run function mm:game/game_module/map_features/common/teleport_second {name:$(name)}
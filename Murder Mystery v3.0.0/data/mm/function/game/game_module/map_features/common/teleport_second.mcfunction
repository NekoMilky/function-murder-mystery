#传送
execute at @s run tp ~ ~0.2 ~

#递归
$execute at @s if block ~ ~ ~ #minecraft:air run function mm:game/game_module/map_features/$(name)/summon
execute at @s if block ~ ~ ~ #minecraft:air run kill @s

$execute at @s unless block ~ ~ ~ #minecraft:air run function mm:game/game_module/map_features/common/teleport_second {name:$(name)}
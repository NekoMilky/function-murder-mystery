#传送
execute at @s run tp ~ ~0.2 ~

#递归
execute at @s if block ~ ~ ~ #minecraft:air if block ~ ~-1 ~ #mm:combustible_block run function mm:game/game_module/map_features/torch/summon
execute at @s if block ~ ~ ~ #minecraft:air run kill @s

execute at @s unless block ~ ~ ~ #minecraft:air run function mm:game/game_module/map_features/torch/teleport_second
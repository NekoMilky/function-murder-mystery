#向下移动
execute at @s if block ~ ~-0.1 ~ #mm:incomplete_block run tp ~ ~-0.1 ~

#递归
execute at @s if block ~ ~-0.1 ~ #mm:incomplete_block run function mm:game/game_module/dead_body/teleport
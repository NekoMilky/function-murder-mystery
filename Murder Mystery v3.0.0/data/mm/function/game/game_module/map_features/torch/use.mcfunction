#火把放置
execute at @s anchored eyes run summon minecraft:marker ^ ^ ^ {Tags:["mm_torch_start"]}

execute at @s run data modify entity @n[tag=mm_torch_start] Rotation set from entity @s Rotation
execute at @s as @n[tag=mm_torch_start] at @s run function mm:game/game_module/map_features/torch/teleport_first {distance:0}
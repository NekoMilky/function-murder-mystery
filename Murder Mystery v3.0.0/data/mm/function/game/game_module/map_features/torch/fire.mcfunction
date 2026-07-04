#生成火
execute at @s positioned ~1 ~ ~ if block ~ ~ ~ #mm:combustible_block if block ~ ~1 ~ air unless entity @e[tag=mm_torch,distance=..0.6] run summon armor_stand ~ ~ ~ {Small:1,Invisible:1,NoGravity:1,Tags:["mm_torch","mm_new"]}
execute at @s positioned ~-1 ~ ~ if block ~ ~ ~ #mm:combustible_block if block ~ ~1 ~ air unless entity @e[tag=mm_torch,distance=..0.6] run summon armor_stand ~ ~ ~ {Small:1,Invisible:1,NoGravity:1,Tags:["mm_torch","mm_new"]}
execute at @s positioned ~ ~ ~1 if block ~ ~ ~ #mm:combustible_block if block ~ ~1 ~ air unless entity @e[tag=mm_torch,distance=..0.6] run summon armor_stand ~ ~ ~ {Small:1,Invisible:1,NoGravity:1,Tags:["mm_torch","mm_new"]}
execute at @s positioned ~ ~ ~-1 if block ~ ~ ~ #mm:combustible_block if block ~ ~1 ~ air unless entity @e[tag=mm_torch,distance=..0.6] run summon armor_stand ~ ~ ~ {Small:1,Invisible:1,NoGravity:1,Tags:["mm_torch","mm_new"]}

execute at @s run setblock ~ ~1 ~ fire
execute at @s run scoreboard players set @s mm_cd_tick 200
execute at @s run scoreboard players operation @s mm_players_id = @p[scores={mm_torch_tick=0,mm_torch=1..}] mm_players_id
execute at @s run tag @s remove mm_new

execute at @s as @e[tag=mm_torch,tag=mm_new,limit=1] at @s run function mm:game/game_module/map_features/torch/fire
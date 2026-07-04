$scoreboard players set this_index mm_main $(index)

#生成一个道具
function mm:utils/run_command_at_spawn/main {callback:"summon armor_stand ~ ~ ~ {Tags:[\\\"mm_spawn_marker\\\"],Invisible:1b,Marker:1b,Small:1b,Invulnerable:1b,NoGravity:1b}"}

execute as @e[tag=mm_spawn_marker] at @s unless entity @e[tag=mm_prop,distance=..1] run scoreboard players add this_index mm_main 1
execute as @e[tag=mm_spawn_marker] at @s unless entity @e[tag=mm_prop,distance=..1] run summon minecraft:armor_stand ~ ~ ~ {CustomNameVisible:1,Invisible:1,ShowArms:1,NoGravity:1,DisabledSlots:7967,Tags:["mm_prop"],Small:1,equipment:{head:{id:"minecraft:bedrock",count:1}}}

kill @e[tag=mm_spawn_marker]

#递归
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main

execute if score this_index mm_main < spawn_prop_rate mm_settings run function mm:game/game_module/prop/prop_spawn_call with storage mm:main temporary
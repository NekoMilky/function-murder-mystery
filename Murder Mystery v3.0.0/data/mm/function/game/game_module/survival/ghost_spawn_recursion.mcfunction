#在随机位置生成恶灵
function mm:utils/run_command_at_spawn/main {callback:"summon armor_stand ~ ~ ~ {Tags:[\\\"mm_spawn_marker\\\"],Invisible:1b,Marker:1b,Small:1b,Invulnerable:1b,NoGravity:1b}"}

execute as @e[tag=mm_spawn_marker] at @s run summon minecraft:zombie ~ ~ ~ {Silent:1b,attributes:[{id:"follow_range",base:128.0}],PersistenceRequired:1b,Health:0.1f,Tags:["mm_ghost"],equipment:{head:{id:"minecraft:wither_skeleton_skull"}}}
execute as @e[tag=mm_spawn_marker] at @s run loot replace entity @n[tag=mm_ghost,tag=mm_player_ghost] armor.chest loot mm:chestplate

kill @e[tag=mm_spawn_marker]

#递归
$scoreboard players set this_index mm_main $(index)
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main

execute if score this_index mm_main < spawn_ghost_count mm_main run function mm:game/game_module/survival/ghost_spawn_recursion with storage mm:main temporary
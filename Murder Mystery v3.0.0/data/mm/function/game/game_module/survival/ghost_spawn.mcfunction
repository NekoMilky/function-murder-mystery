#计时
execute if score ghost_spawn_tick mm_main matches 0.. run scoreboard players remove ghost_spawn_tick mm_main 1
execute unless score ghost_spawn_tick mm_main matches 0 run return 0

#生成恶灵
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
function mm:game/game_module/survival/ghost_spawn_resolve with storage mm:main temporary

#提示信息
tellraw @a[tag=mm_playing] {"translate":"mm.text.ghost_spawn","color":"yellow","with":[{"score":{"objective":"mm_main","name":"spawn_ghost_count"},"color":"red"}]}
execute as @a[tag=mm_playing] at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1
function mm:game/game_module/survival/ghost_spawn_recursion {index:0}
scoreboard players set ghost_spawn_tick mm_main 600
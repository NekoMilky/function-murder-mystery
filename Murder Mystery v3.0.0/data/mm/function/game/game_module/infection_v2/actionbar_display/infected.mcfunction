execute as @s[scores={mm_cd_tick=0..}] run function mm:game/game_module/actionbar_display/bar {type:"charging",name:"mm_cd_tick",full:"infection_cooldown_normal"}
execute as @s[scores={mm_cd_tick=0..}] run return 0

execute as @s[scores={mm_throw_tick=0..}] run function mm:game/game_module/actionbar_display/bar {type:"throwing",name:"mm_throw_tick",full:"infection_cooldown_throw"}
execute as @s[scores={mm_throw_tick=0..}] run return 0

execute as @s[tag=mm_dead] run title @s actionbar {"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.dead","color":"gray"}]},{"translate":"mm.title.murderer.actionbar.classic","color":"white","with":[{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"}]}]}
execute as @s[tag=mm_dead] run return 0

execute as @s[scores={mm_thrown_knife=1..}] run title @s actionbar {"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.infected","color":"red"}]},{"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.murderer.actionbar.classic","color":"white","with":[{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"}]},{"translate":"mm.title.infected.actionbar","color":"green","with":[{"keybind":"key.use","color":"yellow"},{"score":{"name":"@s","objective":"mm_thrown_knife"},"color":"gold"}]}]}]}
execute as @s[scores={mm_thrown_knife=1..}] run return 0

execute store result score gold_require_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}
scoreboard players operation gold_require_count mm_main *= -1 mm_main
scoreboard players add gold_require_count mm_main 5
title @s actionbar {"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.infected","color":"red"}]},{"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.murderer.actionbar.classic","color":"white","with":[{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"}]},{"translate":"mm.title.collecting_thrown_knife.actionbar","color":"red","with":[{"score":{"name":"gold_require_count","objective":"mm_main"}}]}]}]}
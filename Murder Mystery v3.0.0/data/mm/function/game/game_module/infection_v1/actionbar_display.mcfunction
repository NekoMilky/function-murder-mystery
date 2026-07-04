execute store result score this_result mm_main run function mm:game/game_module/actionbar_display/main
execute if score this_result mm_main matches 0 run return 0

#冷却
execute as @s[tag=mm_survivor,scores={mm_sc_tick=0..}] run function mm:game/game_module/actionbar_display/bar {type:"charging",name:"mm_sc_tick",full:"shoot_cooldown_normal"}
execute as @s[tag=mm_survivor,scores={mm_sc_tick=0..}] run return 0

#幸存者
execute as @s[tag=mm_survivor] run title @s actionbar {"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.survivor","color":"green"}]},{"translate":"mm.title.murderer.actionbar.classic","color":"white","with":[{"score":{"objective":"mm_kill_count_s","name":"@s"},"color":"green"}]}]}
execute as @s[tag=mm_survivor] run return 0

#感染者
execute as @s[tag=mm_infected] run title @s actionbar {"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.infected","color":"red"}]},{"translate":"mm.title.murderer.actionbar.classic","color":"white","with":[{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"}]}]}
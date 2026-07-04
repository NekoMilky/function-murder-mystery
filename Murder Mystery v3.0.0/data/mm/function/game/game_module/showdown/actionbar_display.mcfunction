execute store result score this_result mm_main run function mm:game/game_module/actionbar_display/main
execute if score this_result mm_main matches 0 run return 0

#逃犯
execute as @s[tag=mm_outlaw] run title @s actionbar {"translate":"mm.title.pvp.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.outlaw","color":"red"},{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"},{"score":{"objective":"mm_death_count","name":"@s"},"color":"green"}]}
execute as @s[tag=mm_outlaw] run return 0

#警长
execute as @s[tag=mm_sheriff] run title @s actionbar {"translate":"mm.title.pvp.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.sheriff","color":"aqua"},{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"},{"score":{"objective":"mm_death_count","name":"@s"},"color":"green"}]}
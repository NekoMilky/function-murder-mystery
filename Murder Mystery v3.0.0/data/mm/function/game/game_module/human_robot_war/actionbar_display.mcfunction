execute store result score this_result mm_main run function mm:game/game_module/actionbar_display/main
execute if score this_result mm_main matches 0 run return 0

#人类
execute as @s[tag=mm_human] run title @s actionbar {"translate":"mm.title.pvp.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.human","color":"green"},{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"},{"score":{"objective":"mm_death_count","name":"@s"},"color":"green"}]}
execute as @s[tag=mm_human] run return 0

#机器人
execute as @s[tag=mm_robot] run title @s actionbar {"translate":"mm.title.pvp.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.robot","color":"gold"},{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"},{"score":{"objective":"mm_death_count","name":"@s"},"color":"green"}]}
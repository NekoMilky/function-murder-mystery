execute store result score this_result mm_main run function mm:game/game_module/actionbar_display/main
execute if score this_result mm_main matches 0 run return 0

#死亡
execute as @s[tag=mm_dead,tag=!mm_murderer] run title @s actionbar {"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.dead","color":"gray"}]}
execute as @s[tag=mm_dead,tag=!mm_murderer] run return 0

#平民
execute as @s[tag=mm_innocent,tag=!mm_detective] run title @s actionbar {"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.innocent","color":"green"}]}
execute as @s[tag=mm_innocent,tag=!mm_detective] run return 0

#侦探
execute as @s[tag=mm_detective] run function mm:game/game_module/classic/actionbar_display/detective
execute as @s[tag=mm_detective] run return 0

#杀手
execute as @s[tag=mm_murderer] run function mm:game/game_module/classic/actionbar_display/murderer
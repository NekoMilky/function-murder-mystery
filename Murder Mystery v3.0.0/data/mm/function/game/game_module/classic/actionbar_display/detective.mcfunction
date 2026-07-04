execute as @s[scores={mm_cd_tick=0..}] run function mm:game/game_module/actionbar_display/bar {type:"charging",name:"mm_cd_tick",full:"cooldown_det"}
execute as @s[scores={mm_cd_tick=0..}] run return 0

execute if score game_mode mm_main matches 9 run title @s actionbar {"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.detective","color":"aqua"}]},{"translate":"mm.title.murderer.actionbar.classic","color":"white","with":[{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"}]}]}
execute if score game_mode mm_main matches 9 run return 0

title @s actionbar {"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.detective","color":"aqua"}]}
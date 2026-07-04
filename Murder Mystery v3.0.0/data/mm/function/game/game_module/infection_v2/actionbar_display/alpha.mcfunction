execute as @s[scores={mm_cd_tick=0..}] run function mm:game/game_module/actionbar_display/bar {type:"charging",name:"mm_cd_tick",full:"infection_cooldown_normal"}
execute as @s[scores={mm_cd_tick=0..}] run return 0

execute as @s[scores={mm_throw_tick=0..}] run function mm:game/game_module/actionbar_display/bar {type:"throwing",name:"mm_throw_tick",full:"infection_cooldown_throw"}
execute as @s[scores={mm_throw_tick=0..}] run return 0

execute as @s[tag=mm_dead] run title @s actionbar {"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.dead","color":"gray"}]},{"translate":"mm.title.murderer.actionbar.classic","color":"white","with":[{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"}]}]}
execute as @s[tag=mm_dead] run return 0

title @s actionbar {"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.alpha","color":"red"}]},{"translate":"mm.title.connection.actionbar","color":"white","with":[{"translate":"mm.title.murderer.actionbar.classic","color":"white","with":[{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"}]},{"translate":"mm.title.alpha.actionbar","color":"green","with":[{"keybind":"key.use","color":"yellow"}]}]}]}
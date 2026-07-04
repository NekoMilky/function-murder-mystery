#旁观者
execute as @s[tag=mm_spectator] run title @s actionbar {"translate":"mm.title.normal.actionbar","color":"white","with":[{"translate":"mm.title.role.actionbar.spectator","color":"gray"}]}
execute as @s[tag=mm_spectator] run return 0

execute as @s[scores={mm_health_l=0..}] run function mm:game/game_module/actionbar_display/health {type:"l",full:"lava_health"}
execute as @s[scores={mm_health_l=0..}] run return 0

execute as @s[scores={mm_health_w=0..}] run function mm:game/game_module/actionbar_display/health {type:"w",full:"water_health"}
execute as @s[scores={mm_health_w=0..}] run return 0

execute as @s[scores={mm_health_f=0..}] run function mm:game/game_module/actionbar_display/health {type:"f",full:"fire_health"}
execute as @s[scores={mm_health_f=0..}] run return 0

return 1
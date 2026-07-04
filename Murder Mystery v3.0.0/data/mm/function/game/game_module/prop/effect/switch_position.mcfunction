execute at @s run tag @a[tag=!mm_using_features,scores={mm_safe_tick=-1},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,limit=1,distance=0.01..] add mm_swap_position
execute as @a[tag=mm_swap_position] at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:1,Tags:["mm_swap_position_marker"]}

execute at @s run kill @e[tag=mm_prop,dy=0]

tp @a[tag=mm_swap_position] @s
tp @e[tag=mm_swap_position_marker,limit=1]
kill @e[tag=mm_swap_position_marker]

tellraw @s {"translate":"mm.text.prop.active.self","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.5","color":"blue","bold":true},{"translate":"mm.text.prop.5.active.self","color":"green"}]}
tellraw @a[tag=mm_swap_position] {"translate":"mm.text.prop.5.active.others","color":"green"}

execute as @a[tag=mm_swap_position] run tag @s remove mm_swap_position
tag @a[tag=mm_dead,limit=1] add mm_revive

execute as @a[tag=mm_revive] run tellraw @a[tag=mm_playing] {"translate":"mm.text.prop.active.others","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.12","color":"gold","bold":true},{"translate":"mm.text.prop.12.active.others","color":"green"}]}
execute as @a[tag=mm_revive] run tellraw @s {"translate":"mm.text.prop.12.active.self","color":"green"}
execute as @a[tag=mm_revive] run effect clear @s
execute as @a[tag=mm_revive] run tag @s remove mm_dead
execute as @a[tag=mm_revive,tag=mm_detective] run tag @s remove mm_detective
execute as @a[tag=mm_revive] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}

execute as @a[tag=mm_revive] run tag @s remove mm_revive
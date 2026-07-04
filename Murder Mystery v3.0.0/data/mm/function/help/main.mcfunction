execute as @a run scoreboard players enable @s mm_help


#检测触发
execute as @a[scores={mm_help=1}] run tag @s add mm_triggered_help_menu

execute as @a[tag=mm_triggered_help_menu] run function mm:dialog/help/main

execute as @a[tag=mm_triggered_help_menu] run scoreboard players reset @s mm_help
execute as @a[tag=mm_triggered_help_menu] run tag @s remove mm_triggered_help_menu
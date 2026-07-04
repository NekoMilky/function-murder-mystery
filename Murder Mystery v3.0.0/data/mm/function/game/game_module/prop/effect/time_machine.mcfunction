execute store result score random_count mm_main run function mm:utils/random_count {max:61}
scoreboard players remove random_count mm_main 30

scoreboard players operation time_absolute mm_main = random_count mm_main
execute if score time_absolute mm_main matches ..-1 run scoreboard players operation time_absolute mm_main *= -1 mm_main

execute if score random_count mm_main matches 0.. run tellraw @a[tag=mm_playing] {"translate":"mm.text.prop.active.others","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.3","color":"blue","bold":true},{"translate":"mm.text.prop.3.active.add","color":"green","with":[{"score":{"objective":"mm_main","name":"time_absolute"},"color":"green"}]}]}
execute if score random_count mm_main matches ..-1 run tellraw @a[tag=mm_playing] {"translate":"mm.text.prop.active.others","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.3","color":"blue","bold":true},{"translate":"mm.text.prop.3.active.remove","color":"green","with":[{"score":{"objective":"mm_main","name":"time_absolute"},"color":"green"}]}]}

scoreboard players operation get_weapon mm_main = game_time mm_settings
scoreboard players remove get_weapon mm_main 15
execute if score game_second mm_main < get_weapon mm_main as @s run tag @s add mm_changed_time

execute as @s[tag=mm_changed_time] run scoreboard players operation game_second mm_main += random_count mm_main
execute as @s[tag=mm_changed_time] if score game_second mm_main matches ..0 run scoreboard players set game_second mm_main 0
execute as @s[tag=mm_changed_time] if score game_second mm_main > get_weapon mm_main run scoreboard players operation game_second mm_main = get_weapon mm_main
execute as @s[tag=mm_changed_time] if score game_second mm_main = get_weapon mm_main run scoreboard players operation game_second mm_main -= 1 mm_main

execute as @s[tag=mm_changed_time] run tag @s remove mm_changed_time
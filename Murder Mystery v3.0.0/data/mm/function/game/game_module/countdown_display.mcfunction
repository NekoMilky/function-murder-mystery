execute unless score game_tick mm_main matches 20 run return 0

scoreboard players operation this_offset_0 mm_main = game_time mm_settings
$scoreboard players remove this_offset_0 mm_main $(offset)

scoreboard players operation this_offset_1 mm_main = this_offset_0 mm_main
scoreboard players add this_offset_1 mm_main 1
scoreboard players operation this_offset_5 mm_main = this_offset_0 mm_main
scoreboard players add this_offset_5 mm_main 5

execute if score game_second mm_main < this_offset_0 mm_main run return 0
execute if score game_second mm_main > this_offset_5 mm_main run return 0

execute at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1

$execute if score game_second mm_main = this_offset_0 mm_main run tellraw @s {"translate":"$(translate_key)","color":"yellow"}
execute if score game_second mm_main = this_offset_0 mm_main run return 0

scoreboard players operation this_offset mm_main = game_second mm_main
scoreboard players operation this_offset mm_main -= this_offset_0 mm_main
$execute if score this_offset mm_main matches 1 run tellraw @s {"translate":"$(translate_key).single","color":"yellow","with":[{"score":{"name":"this_offset","objective":"mm_main"},"color":"red"}]}
$execute unless score this_offset mm_main matches 1 run tellraw @s {"translate":"$(translate_key).plural","color":"yellow","with":[{"score":{"name":"this_offset","objective":"mm_main"},"color":"red"}]}
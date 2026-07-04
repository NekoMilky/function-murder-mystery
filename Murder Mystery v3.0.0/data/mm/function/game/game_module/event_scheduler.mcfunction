execute unless score game_tick mm_main matches 20 run return 0

$scoreboard players set this_offset mm_main $(offset)
execute if score this_offset mm_main matches ..-1 run scoreboard players operation negative_game_second mm_main = game_second mm_main
execute if score this_offset mm_main matches ..-1 run scoreboard players operation negative_game_second mm_main *= -1 mm_main
$execute if score this_offset mm_main matches ..-1 if score this_offset mm_main = negative_game_second mm_main run function $(callback)
execute if score this_offset mm_main matches ..-1 run return 0

$scoreboard players set this_offset mm_main $(offset)
scoreboard players operation this_offset mm_main *= -1 mm_main
scoreboard players operation this_offset mm_main += game_time mm_settings
$execute if score game_second mm_main = this_offset mm_main run function $(callback)
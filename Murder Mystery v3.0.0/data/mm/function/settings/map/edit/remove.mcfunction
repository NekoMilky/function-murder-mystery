execute if score game_start mm_main matches 2 run tellraw @s {"translate":"mm.feedback.wait_for_game_ending","color":"red"}
execute if score game_start mm_main matches 2 run return 0

$execute unless data storage mm:main map.maps[{Name:"$(map_name)"}] run tellraw @s {"translate":"mm.feedback.map.edit.remove.fail","color":"red","with":[{"text":"$(map_name)"}]}
$execute unless data storage mm:main map.maps[{Name:"$(map_name)"}] run return 0

execute if score map_count mm_main matches 1.. run scoreboard players remove map_count mm_main 1
execute if score selected_map mm_main >= map_count mm_main run scoreboard players operation selected_map mm_main = map_count mm_main
execute if score selected_map mm_main >= map_count mm_main run scoreboard players operation selected_map mm_main -= 1 mm_main

$data remove storage mm:main map.maps[{Name:"$(map_name)"}]

$tellraw @s {"translate":"mm.feedback.map.edit.remove.success","color":"yellow","with":[{"text":"$(map_name)"},{"score":{"objective":"mm_main","name":"map_count"},"color":"gold"}]}
execute if score selected_map mm_main matches -1 run return 0

execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.map_name"
data modify storage mm:main temporary.source_path set value "Name"
function mm:utils/get_map_data_to_storage with storage mm:main temporary
function mm:settings/map/edit/select with storage mm:main temporary
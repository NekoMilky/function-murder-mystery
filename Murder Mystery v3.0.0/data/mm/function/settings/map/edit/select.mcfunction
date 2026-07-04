execute if score game_start mm_main matches 2 run tellraw @s {"translate":"mm.feedback.wait_for_game_ending","color":"red"}
execute if score game_start mm_main matches 2 run return 0

$execute unless data storage mm:main map.maps[{Name:"$(map_name)"}] run tellraw @s {"translate":"mm.feedback.map.edit.select.fail","color":"red","with":[{"text":"$(map_name)"}]}
$execute unless data storage mm:main map.maps[{Name:"$(map_name)"}] run return 0

$execute store result score selected_map mm_main run function mm:utils/get_map_index {map_name:"$(map_name)",index:0}
execute if score selected_map mm_main matches -1 run return 0

$tellraw @s {"translate":"mm.feedback.map.edit.select.success","color":"yellow","with":[{"text":"$(map_name)"}]}

function mm:common/map_correction/main
function mm:utils/teleport_to_spawn_waiting/main
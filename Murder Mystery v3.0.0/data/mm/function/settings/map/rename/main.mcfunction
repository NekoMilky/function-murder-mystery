execute if score game_start mm_main matches 2 run tellraw @s {"translate":"mm.feedback.wait_for_game_ending","color":"red"}
execute if score game_start mm_main matches 2 run return 0

$execute if data storage mm:main map.maps[{Name:"$(map_name)"}] run tellraw @s {"translate":"mm.feedback.map.edit.add.fail","color":"red","with":[{"text":"$(map_name)"}]}
$execute if data storage mm:main map.maps[{Name:"$(map_name)"}] run return 0

execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
$data modify storage mm:main temporary.map_name set value "$(map_name)"
function mm:settings/map/rename/resolve with storage mm:main temporary

$tellraw @s {"translate":"mm.feedback.map.rename.success","color":"yellow","with":[{"text":"$(map_name)"}]}
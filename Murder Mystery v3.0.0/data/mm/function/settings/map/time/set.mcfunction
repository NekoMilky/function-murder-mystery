execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.map_name"
data modify storage mm:main temporary.source_path set value "Name"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

$data modify storage mm:main temporary.time set value $(time)
execute store success score success_count mm_main run function mm:settings/map/time/resolve with storage mm:main temporary

execute if score success_count mm_main matches 0 run tellraw @s {"translate":"mm.feedback.value_check.float","color":"red"}
execute if score success_count mm_main matches 0 run return 0

function mm:common/map_correction/main
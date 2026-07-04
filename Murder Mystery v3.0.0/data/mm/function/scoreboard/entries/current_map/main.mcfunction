data modify storage mm:main temporary.path set value "temporary.map_name"
data modify storage mm:main temporary.source_path set value "Name"
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
function mm:utils/get_map_data_to_storage with storage mm:main temporary

$data modify storage mm:main temporary.objective set value $(objective)
$data modify storage mm:main temporary.line set value $(line)
function mm:scoreboard/entries/current_map/display with storage mm:main temporary
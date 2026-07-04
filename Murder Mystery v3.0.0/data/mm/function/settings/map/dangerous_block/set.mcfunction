execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.map_name"
data modify storage mm:main temporary.source_path set value "Name"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

$data modify storage mm:main temporary.path set value "Deadly$(danger)"
$data modify storage mm:main temporary.value set value $(lethality)
function mm:utils/set_map_data with storage mm:main temporary

$scoreboard players set current_lethality mm_main $(lethality)
execute if score current_lethality mm_main matches 1 run data modify storage mm:main temporary.color set value "green"
execute if score current_lethality mm_main matches 2 run data modify storage mm:main temporary.color set value "red"
execute if score current_lethality mm_main matches 3 run data modify storage mm:main temporary.color set value "blue"
execute if score current_lethality mm_main matches 4 run data modify storage mm:main temporary.color set value "gold"

$data modify storage mm:main temporary.danger_type set value "$(danger_type)"
$data modify storage mm:main temporary.lethality_type set value "$(lethality_type)"
function mm:settings/map/dangerous_block/message with storage mm:main temporary
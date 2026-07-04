execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.map_name"
data modify storage mm:main temporary.source_path set value "Name"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

function mm:utils/get_aligned_position_to_storage {path:"temporary"}

function mm:settings/map/spawn_center/set/resolve with storage mm:main temporary
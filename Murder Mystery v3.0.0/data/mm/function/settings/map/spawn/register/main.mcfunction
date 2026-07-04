execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.map_name"
data modify storage mm:main temporary.source_path set value "Name"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

scoreboard players set spawn_count mm_main 0
execute as @e[tag=mm_spawn] run scoreboard players add spawn_count mm_main 1
execute store result storage mm:main temporary.spawn_count int 1 run scoreboard players get spawn_count mm_main

execute as @e[tag=mm_spawn] run function mm:settings/map/spawn/register/add_to_list

function mm:settings/map/spawn/register/message with storage mm:main temporary
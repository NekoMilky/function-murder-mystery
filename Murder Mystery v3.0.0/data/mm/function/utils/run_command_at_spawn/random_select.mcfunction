$execute store result storage mm:main temporary.max int 1 run function mm:utils/get_list_length_in_storage {path:"map.maps[$(index)].Spawn",index:0}
execute store result storage mm:main temporary.random_spawn int 1 run function mm:utils/random_count with storage mm:main temporary

$data modify storage mm:main temporary.index set value $(index)
function mm:utils/run_command_at_spawn/resolve with storage mm:main temporary
function mm:utils/get_aligned_position_to_storage {path:"temporary"}

data modify storage mm:main temporary.path set value "Spawn"
data modify storage mm:main temporary.value set from storage mm:main temporary.pos
function mm:utils/append_map_data with storage mm:main temporary

kill @s
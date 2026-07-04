$execute unless data storage mm:main map.maps[$(index)].Spawn[$(spawn_index)] run data remove storage mm:main map.maps[$(index)].Spawn
$execute unless data storage mm:main map.maps[$(index)].Spawn[$(spawn_index)] run return 0

$data modify storage mm:main temporary.x set from storage mm:main map.maps[$(index)].Spawn[$(spawn_index)][0]
$data modify storage mm:main temporary.y set from storage mm:main map.maps[$(index)].Spawn[$(spawn_index)][1]
$data modify storage mm:main temporary.z set from storage mm:main map.maps[$(index)].Spawn[$(spawn_index)][2]
$data modify storage mm:main temporary.rotation set from storage mm:main map.maps[$(index)].Spawn[$(spawn_index)][3]
function mm:settings/map/spawn/unregister/spawn_armor_stand with storage mm:main temporary

$scoreboard players set this_index mm_main $(spawn_index)
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.spawn_index int 1 run scoreboard players get this_index mm_main
function mm:settings/map/spawn/unregister/remove_from_list with storage mm:main temporary
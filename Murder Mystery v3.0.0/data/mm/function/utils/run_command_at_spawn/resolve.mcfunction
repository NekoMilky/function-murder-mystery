$execute unless data storage mm:main map.maps[$(index)].Spawn run return 0

$data modify storage mm:main temporary.x set from storage mm:main map.maps[$(index)].Spawn[$(random_spawn)][0]
$data modify storage mm:main temporary.y set from storage mm:main map.maps[$(index)].Spawn[$(random_spawn)][1]
$data modify storage mm:main temporary.z set from storage mm:main map.maps[$(index)].Spawn[$(random_spawn)][2]
$data modify storage mm:main temporary.rotation set from storage mm:main map.maps[$(index)].Spawn[$(random_spawn)][3]

function mm:utils/run_command_with_position with storage mm:main temporary
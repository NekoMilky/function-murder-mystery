$execute unless data storage mm:main map.maps[$(index)].SpawnCenter run return 0

$data modify storage mm:main temporary.x set from storage mm:main map.maps[$(index)].SpawnCenter[0]
$data modify storage mm:main temporary.y set from storage mm:main map.maps[$(index)].SpawnCenter[1]
$data modify storage mm:main temporary.z set from storage mm:main map.maps[$(index)].SpawnCenter[2]
$data modify storage mm:main temporary.rotation set from storage mm:main map.maps[$(index)].SpawnCenter[3]

function mm:utils/teleport with storage mm:main temporary
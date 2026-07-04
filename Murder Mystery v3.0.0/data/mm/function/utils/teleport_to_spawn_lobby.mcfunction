execute unless data storage mm:main map.SpawnLobby run return 0

data modify storage mm:main temporary.x set from storage mm:main map.SpawnLobby[0]
data modify storage mm:main temporary.y set from storage mm:main map.SpawnLobby[1]
data modify storage mm:main temporary.z set from storage mm:main map.SpawnLobby[2]
data modify storage mm:main temporary.rotation set from storage mm:main map.SpawnLobby[3]

function mm:utils/teleport with storage mm:main temporary
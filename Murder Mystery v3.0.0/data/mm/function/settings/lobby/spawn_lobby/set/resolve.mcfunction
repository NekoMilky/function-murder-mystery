$data modify storage mm:main map.SpawnLobby set value $(pos)

$tellraw @s {"translate":"mm.feedback.lobby.spawn_lobby.set.success","color":"yellow","with":[{"text":"$(x)","color":"green"},{"text":"$(y)","color":"green"},{"text":"$(z)","color":"green"},{"text":"$(rotation)","color":"gold"}]}
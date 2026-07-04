$function mm:utils/set_map_data {index:$(index),path:"SpawnWaiting",value:$(pos)}

$tellraw @s {"translate":"mm.feedback.map.spawn_waiting.set.success","color":"yellow","with":[{"text":"$(map_name)"},{"text":"$(x)","color":"green"},{"text":"$(y)","color":"green"},{"text":"$(z)","color":"green"},{"text":"$(rotation)","color":"gold"}]}
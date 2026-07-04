$scoreboard players set this_slot mm_main $(slot)
$scoreboard players set this_index mm_main $(index)
$scoreboard players set this_end mm_main $(end)

#监听条目
$data modify storage mm:main temporary.map_name set from storage mm:main map.maps[$(index)].Name
function mm:lobby/menu/game/map_select/entry with storage mm:main temporary

#递归
scoreboard players add this_slot mm_main 1
execute store result storage mm:main temporary.slot int 1 run scoreboard players get this_slot mm_main

scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main

execute if score this_index mm_main < map_count mm_main if score this_index mm_main < this_end mm_main run function mm:lobby/menu/game/map_select/map with storage mm:main temporary
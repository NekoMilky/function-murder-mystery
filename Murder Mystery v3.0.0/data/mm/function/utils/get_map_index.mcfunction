$execute unless data storage mm:main map.maps[{Name:"$(map_name)"}] run return -1
$execute unless data storage mm:main map.maps[$(index)] run return -1

$data modify storage mm:main temporary.name set value "$(map_name)"
$execute store success score success_count mm_main run data modify storage mm:main temporary.name set from storage mm:main map.maps[$(index)].Name

$execute if score success_count mm_main matches 0 run return $(index)

$scoreboard players set this_index mm_main $(index)
scoreboard players add this_index mm_main 1
$data modify storage mm:main temporary.map_name set value "$(map_name)"
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main
return run function mm:utils/get_map_index with storage mm:main temporary
$execute unless data storage mm:main map.maps[$(index)] run return 0

$data modify storage mm:main temporary.callback set value "$(callback)"
$data modify storage mm:main temporary.map_name set from storage mm:main map.maps[$(index)].Name
function mm:dialog/settings/map/edit/add_map_to_dialog with storage mm:main temporary

$scoreboard players set this_index mm_main $(index)
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main
function mm:dialog/settings/map/edit/add_maps_to_dialog with storage mm:main temporary
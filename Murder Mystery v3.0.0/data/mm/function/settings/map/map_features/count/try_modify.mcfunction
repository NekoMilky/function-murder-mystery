$execute store result score check_type mm_main run function mm:settings/map/map_features/check_position {name:$(name),predicate:$(predicate)}

execute if score check_type mm_main matches -1 run function mm:settings/map/map_features/limit_feedback
execute if score check_type mm_main matches -1 run return 0

$execute if score check_type mm_main matches 0 run function mm:settings/map/map_features/not_found_feedback {name:$(name)}
execute if score check_type mm_main matches 0 run return 0

$data modify storage mm:main temporary.name set value "$(name)"
$data modify storage mm:main temporary.predicate set value "$(predicate)"
$execute at @s store result storage mm:main temporary.current_count int 1 run data get entity @n[tag=mm_$(name)_spawner,tag=mm_special_element] equipment.feet.components."minecraft:custom_data".Count
function mm:dialog/settings/map/map_features/entry/count with storage mm:main temporary
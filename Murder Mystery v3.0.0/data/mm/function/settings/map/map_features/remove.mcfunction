$execute store result score check_type mm_main run function mm:settings/map/map_features/check_position {name:$(name),predicate:$(predicate)}

execute if score check_type mm_main matches -1 run function mm:settings/map/map_features/limit_feedback
execute if score check_type mm_main matches -1 run return 0

$execute if score check_type mm_main matches 0 run function mm:settings/map/map_features/not_found_feedback {name:$(name)}
execute if score check_type mm_main matches 0 run return 0

$execute at @s positioned ~ ~-1 ~ run kill @n[tag=mm_$(name)_spawner,tag=mm_special_element]
$execute at @s positioned ~ ~-1 ~ run kill @n[tag=mm_$(name)_title,tag=mm_special_element,distance=..3]
$execute at @s positioned ~ ~-1 ~ run kill @n[tag=mm_$(name)_interaction,tag=mm_special_element,distance=..3]

$tellraw @s {"translate":"mm.feedback.map.map_features.remove.success","color":"green","with":[{"translate":"mm.text_settings.map.map_features.$(name)","color":"aqua"}]}
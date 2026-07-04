$execute store result score check_type mm_main run function mm:settings/map/map_features/check_position {name:$(name),predicate:$(predicate)}

execute if score check_type mm_main matches -1 run function mm:settings/map/map_features/limit_feedback
execute if score check_type mm_main matches -1 run return 0

$execute if score check_type mm_main matches 0 run function mm:settings/map/map_features/not_found_feedback {name:$(name)}
execute if score check_type mm_main matches 0 run return 0

$execute store success score success_count mm_main run function mm:settings/map/map_features/cooldown/resolve {name:$(name),cooldown:$(cooldown)}

execute if score success_count mm_main matches 0 run tellraw @s {"translate":"mm.feedback.value_check.integer.range","color":"red","with":[{"text":"0"},{"text":"3600"}]}
execute if score success_count mm_main matches 0 run return 0

$tellraw @s {"translate":"mm.feedback.map.map_features.cooldown.set.success","color":"green","with":[{"translate":"mm.text_settings.map.map_features.$(name)","color":"aqua"},{"text":"$(cooldown)","color":"gold"}]}
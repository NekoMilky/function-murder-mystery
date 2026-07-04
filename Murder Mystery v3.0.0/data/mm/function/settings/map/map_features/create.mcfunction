$execute store result score check_type mm_main run function mm:settings/map/map_features/check_position {name:$(name),predicate:$(predicate)}

execute if score check_type mm_main matches -1 run function mm:settings/map/map_features/limit_feedback
execute if score check_type mm_main matches -1 run return 0

$execute if score check_type mm_main matches 1 run function mm:settings/map/map_features/found_feedback {name:$(name)}
execute if score check_type mm_main matches 1 run return 0

$execute at @s positioned ~ ~-1 ~ run summon armor_stand ~ ~ ~ {Small:1,Invisible:1,NoGravity:1,Tags:["mm_$(name)_spawner","mm_special_element"],equipment:{feet:{id:"minecraft:paper",count:1,components:{"minecraft:custom_data":{Cost:$(cost),Count:$(count),Cooldown:$(cooldown)}}}}}
$execute at @s positioned ~ ~-1 ~ if block ~1 ~ ~ #minecraft:buttons run summon armor_stand ~1 ~1 ~ {CustomNameVisible:1,Small:1,Invisible:1,NoGravity:1,Tags:["mm_$(name)_title","mm_special_element"]}
$execute at @s positioned ~ ~-1 ~ if block ~-1 ~ ~ #minecraft:buttons run summon armor_stand ~-1 ~1 ~ {CustomNameVisible:1,Small:1,Invisible:1,NoGravity:1,Tags:["mm_$(name)_title","mm_special_element"]}
$execute at @s positioned ~ ~-1 ~ if block ~ ~ ~1 #minecraft:buttons run summon armor_stand ~ ~1 ~1 {CustomNameVisible:1,Small:1,Invisible:1,NoGravity:1,Tags:["mm_$(name)_title","mm_special_element"]}
$execute at @s positioned ~ ~-1 ~ if block ~ ~ ~-1 #minecraft:buttons run summon armor_stand ~ ~1 ~-1 {CustomNameVisible:1,Small:1,Invisible:1,NoGravity:1,Tags:["mm_$(name)_title","mm_special_element"]}
$execute at @s positioned ~ ~-1 ~ if block ~ ~1 ~ #minecraft:buttons run summon armor_stand ~ ~2 ~ {CustomNameVisible:1,Small:1,Invisible:1,NoGravity:1,Tags:["mm_$(name)_title","mm_special_element"]}
$execute at @s positioned ~ ~-1 ~ if block ~ ~-1 ~ #minecraft:buttons run summon armor_stand ~ ~ ~ {CustomNameVisible:1,Small:1,Invisible:1,NoGravity:1,Tags:["mm_$(name)_title","mm_special_element"]}

$execute at @s positioned ~ ~-1 ~ as @n[tag=mm_$(name)_spawner,tag=mm_special_element] run function mm:settings/map/map_features/display_correction {name:$(name)}

$tellraw @s {"translate":"mm.feedback.map.map_features.create.success","color":"green","with":[{"translate":"mm.text_settings.map.map_features.$(name)","color":"aqua"}]}
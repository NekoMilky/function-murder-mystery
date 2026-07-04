$execute store result score check_type mm_main run function mm:settings/map/map_features/check_position {name:$(name),predicate:$(predicate)}

$execute if score check_type mm_main matches 1 run function mm:settings/map/map_features/found_feedback {name:$(name)}
execute if score check_type mm_main matches 1 run return 0

$execute at @s align x align y align z positioned ~0.5 ~ ~0.5 run summon minecraft:mannequin ~ ~ ~ {hide_description:1b,immovable:1b,Invulnerable:1b,NoGravity:1b,CustomNameVisible:1b,Tags:["mm_npc","mm_$(name)_spawner","mm_special_element"],equipment:{feet:{id:"minecraft:paper",count:1,components:{"minecraft:custom_data":{Cost:$(cost),Count:$(count),Cooldown:$(cooldown)}}}}}
$execute at @s align x align y align z positioned ~0.5 ~ ~0.5 run summon minecraft:interaction ~ ~ ~ {response:1b,width:0.7f,height:1.9f,Tags:["mm_$(name)_interaction","mm_special_element"]}
$execute at @s align x align y align z positioned ~0.5 ~ ~0.5 run data modify entity @n[tag=mm_npc,tag=mm_$(name)_spawner,tag=mm_special_element] profile.name set value "$(profile_name)"

$execute at @s as @n[tag=mm_$(name)_spawner,tag=mm_special_element] run function mm:settings/map/map_features/display_correction {name:$(name)}

$tellraw @s {"translate":"mm.feedback.map.map_features.create.success","color":"green","with":[{"translate":"mm.text_settings.map.map_features.$(name)","color":"aqua"}]}
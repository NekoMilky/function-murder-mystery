$scoreboard players set this_cooldown mm_main $(cooldown)

execute unless score this_cooldown mm_main matches 0..3600 run return fail

$execute at @s positioned ~ ~-1 ~ run data modify entity @n[tag=mm_$(name)_spawner,tag=mm_special_element] equipment.feet.components."minecraft:custom_data".Cooldown set value $(cooldown)
$execute at @s positioned ~ ~-1 ~ as @n[tag=mm_$(name)_spawner,tag=mm_special_element] run function mm:settings/map/map_features/display_correction {name:$(name)}

return 1
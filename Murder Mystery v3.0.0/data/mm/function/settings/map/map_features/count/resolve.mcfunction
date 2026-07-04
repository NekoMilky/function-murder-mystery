$scoreboard players set this_count mm_main $(count)

execute unless score this_count mm_main matches 0..64 run return fail

$execute at @s positioned ~ ~-1 ~ run data modify entity @n[tag=mm_$(name)_spawner,tag=mm_special_element] equipment.feet.components."minecraft:custom_data".Count set value $(count)
$execute at @s positioned ~ ~-1 ~ as @n[tag=mm_$(name)_spawner,tag=mm_special_element] run function mm:settings/map/map_features/display_correction {name:$(name)}

return 1
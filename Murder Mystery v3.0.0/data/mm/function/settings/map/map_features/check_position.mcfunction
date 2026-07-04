$execute at @s if entity @e[tag=mm_npc,tag=mm_$(name)_spawner,tag=mm_special_element,distance=..2] run return 1

$execute at @s unless predicate mm:map_features_check_position/$(predicate) run return -1

$execute at @s unless entity @e[tag=mm_$(name)_spawner,tag=mm_special_element,distance=..2] run return 0

return 1
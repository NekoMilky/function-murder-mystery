$scoreboard players set slot_number mm_main $(slot)

execute as @s[tag=mm_not_allowed] run tag @s remove mm_not_allowed 

#跳过这些槽位
execute as @s[tag=!mm_not_allowed] if score slot_number mm_main matches 0..2 run tag @s add mm_not_allowed
execute as @s[tag=!mm_not_allowed] if score slot_number mm_main matches 4 run tag @s add mm_not_allowed
execute as @s[tag=!mm_not_allowed] if score slot_number mm_main matches 8..9 run tag @s add mm_not_allowed

$execute as @s[tag=!mm_not_allowed] if data entity @s Inventory[{Slot:$(slot)b}] run tag @s add mm_not_allowed

#放入物品
$execute as @s[tag=!mm_not_allowed] at @s run loot spawn ~ ~ ~ loot mm:map_features/$(name)
$execute as @s[tag=!mm_not_allowed] at @s run tag @n[type=item,distance=..3,nbt={Item:{components:{"minecraft:custom_data":{$(item_tag):1}}}}] add mm_$(name)_item

$execute as @s[tag=!mm_not_allowed] at @s if score cooldown_value mm_main matches 1.. store result entity @n[tag=mm_$(name)_item] Item.components."minecraft:custom_data".Cooldown int 20 run scoreboard players get cooldown_value mm_main
$execute as @s[tag=!mm_not_allowed] at @s run item replace entity @s container.$(slot) from entity @n[tag=mm_$(name)_item] contents

$execute as @s[tag=!mm_not_allowed] run kill @e[tag=mm_$(name)_item]

#否则继续查找
scoreboard players add slot_number mm_main 1
$data modify storage mm:main temporary.name set value "$(name)"
$data modify storage mm:main temporary.item_tag set value "$(item_tag)"
execute store result storage mm:main temporary.slot int 1 run scoreboard players get slot_number mm_main
execute as @s[tag=mm_not_allowed] if score slot_number mm_main matches ..35 run function mm:game/game_module/map_features/common/search_empty_slot with storage mm:main temporary
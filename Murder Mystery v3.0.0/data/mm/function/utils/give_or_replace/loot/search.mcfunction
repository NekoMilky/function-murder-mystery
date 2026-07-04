#查找指定tag物品
$execute if items entity @s container.$(slot) *[minecraft:custom_data~{$(item_tag):1}] store result score this_count mm_main run data get entity @s Inventory[{Slot:$(slot)b}].count
$execute if items entity @s container.$(slot) *[minecraft:custom_data~{$(item_tag):1}] run scoreboard players operation count_value mm_main += this_count mm_main
$execute if items entity @s container.$(slot) *[minecraft:custom_data~{$(item_tag):1}] run item modify entity @s container.$(slot) mm:set_count

$execute if items entity @s container.$(slot) *[minecraft:custom_data~{$(item_tag):1}] run return 0

#递归
$scoreboard players set this_slot mm_main $(slot)
scoreboard players add this_slot mm_main 1

$data modify storage mm:main temporary.item_tag set value "$(item_tag)"
$data modify storage mm:main temporary.loot_table set value "$(loot_table)"
execute store result storage mm:main temporary.slot int 1 run scoreboard players get this_slot mm_main

execute if score this_slot mm_main matches ..35 run function mm:utils/give_or_replace/loot/search with storage mm:main temporary
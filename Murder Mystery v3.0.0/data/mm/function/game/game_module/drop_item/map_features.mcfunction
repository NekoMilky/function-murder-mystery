data modify storage mm:main temporary.slot set value 3
data modify storage mm:main temporary.item_tag set from entity @s Item.components."minecraft:custom_data".ItemTag
data modify storage mm:main temporary.loot_table set from entity @s Item.components."minecraft:custom_data".LootTable
execute store result storage mm:main temporary.count int 1 run data get entity @s Item.count

execute on origin run function mm:utils/give_or_replace/loot/main with storage mm:main temporary

kill @s
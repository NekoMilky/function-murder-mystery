data modify storage mm:main temporary.slot set value 1
data modify storage mm:main temporary.item_tag set value "DisabledArrow"
data modify storage mm:main temporary.loot_table set value "mm:disabled_arrow"
execute store result storage mm:main temporary.count int 1 run data get entity @s Item.count

execute on origin run function mm:utils/give_or_replace/loot/main with storage mm:main temporary

kill @s
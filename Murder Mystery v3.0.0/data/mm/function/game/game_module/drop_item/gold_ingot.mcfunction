data modify storage mm:main temporary.id set value "gold_ingot"
data modify storage mm:main temporary.slot set value 8
execute store result storage mm:main temporary.count int 1 run data get entity @s Item.count
execute on origin run function mm:utils/give_or_replace/main with storage mm:main temporary

kill @s
execute at @s run tag @n[type=item,distance=..1.5,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}}] add mm_has_been_picked_up

execute at @s run playsound minecraft:entity.item.pickup player @s
execute at @s store result score gold_ingot_count mm_main run data get entity @n[tag=mm_has_been_picked_up] Item.count
execute store result score this_gold_ingot_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}
scoreboard players operation this_gold_ingot_count mm_main += gold_ingot_count mm_main

execute unless score this_gold_ingot_count mm_main matches 1..64 run return 0

data modify storage mm:main temporary.id set value "gold_ingot"
data modify storage mm:main temporary.slot set value 8
execute store result storage mm:main temporary.count int 1 run scoreboard players get gold_ingot_count mm_main
function mm:utils/give_or_replace/main with storage mm:main temporary

tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"score":{"objective":"mm_main","name":"gold_ingot_count"}},{"translate":"mm.text.picked_up_gold","with":[{"score":{"objective":"mm_main","name":"gold_ingot_count"}}]}]}

scoreboard players operation @s mm_stats_13 += gold_ingot_count mm_main
scoreboard players operation @s mm_stats_14 += gold_ingot_count mm_main

kill @e[tag=mm_has_been_picked_up,type=item]
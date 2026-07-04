execute store result score random_count mm_main run function mm:utils/random_count {max:4}

execute store result score this_gold_ingot_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}
scoreboard players operation this_gold_ingot_count mm_main += random_count mm_main

execute if score this_gold_ingot_count mm_main matches 65.. run scoreboard players set random_count mm_main 0

tellraw @s {"translate":"mm.text.prop.active.self","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.2","color":"green","bold":true},{"translate":"mm.text.prop.2.active","color":"green","with":[{"score":{"objective":"mm_main","name":"random_count"},"color":"green"}]}]}
execute if score random_count mm_main matches 0 run return 0

data modify storage mm:main temporary.id set value "gold_ingot"
data modify storage mm:main temporary.slot set value 8
execute store result storage mm:main temporary.count int 1 run scoreboard players get random_count mm_main
function mm:utils/give_or_replace/main with storage mm:main temporary
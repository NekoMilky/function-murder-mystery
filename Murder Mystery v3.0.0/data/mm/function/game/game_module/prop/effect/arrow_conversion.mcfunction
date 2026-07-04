execute store result score this_gold_ingot_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}

tellraw @s {"translate":"mm.text.prop.active.self","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.7","color":"dark_purple","bold":true},{"translate":"mm.text.prop.7.active","color":"green","with":[{"score":{"objective":"mm_main","name":"this_gold_ingot_count"},"color":"green"}]}]}
execute if score this_gold_ingot_count mm_main matches 0 run return 0

title @s subtitle {"translate":"mm.title.collected_shot.subtitle","color":"green","with":[{"score":{"objective":"mm_main","name":"this_gold_ingot_count"}}]}
title @s title ""

execute unless items entity @s container.* *[minecraft:custom_data~{Bow:1}] run loot replace entity @s container.0 loot mm:bow

data modify storage mm:main temporary.id set value "arrow"
execute as @s[tag=mm_murderer] run data modify storage mm:main temporary.slot set value 2
execute as @s[tag=mm_innocent,tag=!mm_detective] run data modify storage mm:main temporary.slot set value 1
execute store result storage mm:main temporary.count int 1 run scoreboard players get this_gold_ingot_count mm_main
function mm:utils/give_or_replace/main with storage mm:main temporary

clear @s minecraft:gold_ingot
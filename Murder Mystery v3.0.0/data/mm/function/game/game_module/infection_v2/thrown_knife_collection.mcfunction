#5金换飞刀
execute store result score this_gold_ingot_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}
execute unless score this_gold_ingot_count mm_main matches 5.. run return 0

tellraw @s {"translate":"mm.text.collected_knife_throw","color":"yellow","with":[{"text":"5"},{"text":"1"}]}
title @s subtitle {"translate":"mm.title.collected_knife_throw.subtitle","color":"green","with":[{"text":"1"}]}
title @s title ""

scoreboard players add @s mm_thrown_knife 1
clear @s minecraft:gold_ingot 5
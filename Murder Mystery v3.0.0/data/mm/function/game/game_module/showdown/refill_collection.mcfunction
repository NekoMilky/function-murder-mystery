#填充弹药
execute store result score this_gold_ingot_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}
execute unless score this_gold_ingot_count mm_main matches 6.. run return 0

tellraw @s {"translate":"mm.text.collected_refill","color":"yellow","with":[{"text":"6"}]}
title @s subtitle {"translate":"mm.title.collected_refill.subtitle","color":"green"}
title @s title ""

function mm:gun/replace {slot:1,type:"pistol"}
function mm:gun/replace {slot:2,type:"rifle"}
clear @s minecraft:gold_ingot 6
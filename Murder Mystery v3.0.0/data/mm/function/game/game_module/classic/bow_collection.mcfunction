#杀手/平民换弓
execute store result score this_gold_ingot_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}
execute unless score this_gold_ingot_count mm_main matches 10.. run return 0

tellraw @s {"translate":"mm.text.collected_shot","color":"yellow","with":[{"text":"10"},{"text":"1"}]}
title @s subtitle {"translate":"mm.title.collected_shot.subtitle","color":"green","with":[{"text":"1"}]}
title @s title ""

execute unless items entity @s container.* *[minecraft:custom_data~{Bow:1}] run loot replace entity @s container.0 loot mm:bow
execute as @s[tag=mm_murderer] run function mm:utils/give_or_replace/main {id:"arrow",count:1,slot:2}
execute as @s[tag=mm_innocent] run function mm:utils/give_or_replace/main {id:"arrow",count:1,slot:1}
clear @s minecraft:gold_ingot 10
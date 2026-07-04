#射箭并触发
execute as @s[scores={mm_shoot_det=1}] run tag @s add mm_shoot

execute as @s[tag=mm_shoot] run scoreboard players operation @s mm_sc_tick = shoot_cooldown_normal mm_settings

execute as @s[tag=mm_shoot] store result score this_arrow_count mm_main run function mm:utils/get_count_in_inventory {id:"arrow"}
execute as @s[tag=mm_shoot] run clear @s arrow
execute as @s[tag=mm_shoot] run loot replace entity @s hotbar.1 loot mm:disabled_arrow

execute as @s[tag=mm_shoot] run tag @s remove mm_shoot

#冷却计时完毕后填充箭
execute as @s[scores={mm_sc_tick=0}] run tag @s add mm_refilled

execute as @s[tag=mm_refilled] store result score this_arrow_count mm_main run function mm:utils/get_count_in_inventory_with_tag {item_tag:"DisabledArrow"}
execute as @s[tag=mm_refilled] run function mm:utils/clear_with_tag {item_tag:"DisabledArrow",max_count:64}
execute as @s[tag=mm_refilled] run loot replace entity @s hotbar.1 loot mm:arrow

execute as @s[tag=mm_refilled] run tag @s remove mm_refilled

#冷却计时
execute as @s[scores={mm_sc_tick=0..}] run scoreboard players remove @s mm_sc_tick 1

#6金换箭
execute as @s store result score this_gold_ingot_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}
execute as @s unless score this_gold_ingot_count mm_main matches 6.. run return 0

tellraw @s {"translate":"mm.text.collected_shot","color":"yellow","with":[{"text":"6"},{"text":"12"}]}
title @s subtitle {"translate":"mm.title.collected_shot.subtitle","color":"green","with":[{"text":"12"}]}
title @s title ""

function mm:utils/give_or_replace/main {id:"arrow",count:12,slot:1}
clear @s minecraft:gold_ingot 6
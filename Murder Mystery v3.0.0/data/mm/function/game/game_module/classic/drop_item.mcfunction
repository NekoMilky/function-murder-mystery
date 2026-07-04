#刀
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Knife:1}}}}] on origin run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"Knife",slot:1,loot_table:"mm:knife"}
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Knife:1}}}}] run kill @s

#弓
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Bow:1}}}}] on origin as @s[tag=mm_murderer] run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"Bow",slot:0,loot_table:"mm:bow"}
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Bow:1}}}}] on origin as @s[tag=mm_detective] run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"Bow",slot:1,loot_table:"mm:bow"}
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Bow:1}}}}] on origin as @s[tag=mm_innocent,tag=!mm_detective] run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"Bow",slot:0,loot_table:"mm:bow"}
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Bow:1}}}}] run kill @s

#弓追踪器
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{BowTracker:1}}}}] on origin run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"BowTracker",slot:4,loot_table:"mm:tracker/bow"}
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{BowTracker:1}}}}] run kill @s

#平民追踪器
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{InnocentTracker:1}}}}] on origin run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"InnocentTracker",slot:4,loot_table:"mm:tracker/innocent"}
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{InnocentTracker:1}}}}] run kill @s
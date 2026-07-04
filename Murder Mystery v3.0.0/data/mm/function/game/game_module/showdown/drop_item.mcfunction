#刀
execute unless score game_mode mm_main matches 10 as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Knife:1}}}}] on origin run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"Knife",slot:1,loot_table:"mm:knife"}
execute if score game_mode mm_main matches 10 as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Knife:1}}}}] on origin run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"Knife",slot:0,loot_table:"mm:knife"}
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Knife:1}}}}] run kill @s

#弓
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Bow:1}}}}] on origin run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"Bow",slot:0,loot_table:"mm:bow"}
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Bow:1}}}}] run kill @s

#胸甲
execute as @a[tag=mm_playing] if items entity @s container.* *[minecraft:custom_data~{Chestplate:1}] run tag @s add mm_dislocate_chestplate
execute as @a[tag=mm_dislocate_chestplate] run clear @s leather_chestplate
execute as @a[tag=mm_dislocate_chestplate] run loot replace entity @s armor.chest loot mm:chestplate
execute as @a[tag=mm_dislocate_chestplate] run tag @s remove mm_dislocate_chestplate

execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Chestplate:1}}}},distance=..2] on origin run tag @s add mm_drop_chestplate
execute as @a[tag=mm_drop_chestplate] run kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Chestplate:1}}}}]
execute as @a[tag=mm_drop_chestplate] run loot replace entity @s armor.chest loot mm:chestplate
execute as @a[tag=mm_drop_chestplate] run tag @s remove mm_drop_chestplate
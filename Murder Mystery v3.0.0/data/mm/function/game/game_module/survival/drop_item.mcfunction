#弓
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Bow:1}}}}] on origin run function mm:utils/give_or_replace/loot/main {count:1,item_tag:"Bow",slot:0,loot_table:"mm:bow"}
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Bow:1}}}}] run kill @s

#铁胸甲
execute as @a[tag=mm_survivor] if items entity @s container.* *[minecraft:custom_data~{Chestplate:1}] run tag @s add mm_dislocate_chestplate
execute as @a[tag=mm_dislocate_iron_chestplate] run clear @s iron_chestplate
execute as @a[tag=mm_dislocate_iron_chestplate] run loot replace entity @s armor.chest loot mm:chestplate
execute as @a[tag=mm_dislocate_iron_chestplate] run tag @s remove mm_dislocate_iron_chestplate

execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Chestplate:1}}}}] on origin run tag @s add mm_drop_iron_chestplate
execute as @a[tag=mm_drop_iron_chestplate] run kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Chestplate:1}}}}]
execute as @a[tag=mm_drop_iron_chestplate] run loot replace entity @s armor.chest loot mm:chestplate
execute as @a[tag=mm_drop_iron_chestplate] run tag @s remove mm_drop_iron_chestplate
#重置位置
$execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{$(item_tag):1}}}}] on origin run function mm:utils/give_or_replace/loot/main {count:1,item_tag:$(item_tag),slot:$(slot),loot_table:"$(loot_table)"}
$execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{$(item_tag):1}}}}] run kill @s

$execute as @a[tag=mm_playing] unless items entity @s container.* *[minecraft:custom_data~{$(item_tag):1}] run function mm:utils/give_or_replace/loot/main {count:1,item_tag:$(item_tag),slot:$(slot),loot_table:"$(loot_table)"}

#执行
$execute as @a[tag=mm_playing,tag=mm_right_click] if items entity @s weapon.mainhand *[minecraft:custom_data~{$(item_tag):1}] run $(callback)
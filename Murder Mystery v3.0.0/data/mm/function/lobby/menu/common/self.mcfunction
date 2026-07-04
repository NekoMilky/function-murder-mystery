$execute if items entity @s container.$(slot) *[minecraft:custom_data~{$(item_tag):1}] run return 0

#错位检测
$execute if items entity @s container.* *[minecraft:custom_data~{$(item_tag):1}] run data remove entity @s Items[{components:{"minecraft:custom_data":{$(item_tag):1}}}]

#丢弃检测
$execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{$(item_tag):1}}}}] run kill @s

#点击检测
scoreboard players set total_success_count mm_main 0
$execute at @s as @a[distance=..5] run function mm:lobby/menu/common/click_detect {item_tag:$(item_tag),callback:"tag @s[tag=mm_empty] remove mm_empty"}

execute if score total_success_count mm_main matches 1.. run tag @s add mm_new_menu
$execute if score total_success_count mm_main matches 1.. run scoreboard players set @s mm_menu $(menu)

$loot replace entity @s container.$(slot) loot $(loot_table)
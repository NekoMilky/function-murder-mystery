$execute if items entity @s container.$(slot) *[minecraft:custom_data~{Map$(index):1}] run return 0

#错位检测
$execute if items entity @s container.* *[minecraft:custom_data~{Map$(index):1}] run data remove entity @s Items[{components:{"minecraft:custom_data":{Map$(index):1}}}]

#丢弃检测
$execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Map$(index):1}}}}] run kill @s

#点击检测
scoreboard players set total_success_count mm_main 0
$execute at @s as @a[distance=..5] run function mm:lobby/menu/common/click_detect {item_tag:"Map$(index)",callback:"function mm:lobby/play_game/select {index:$(index)}"}

execute if score total_success_count mm_main matches 1.. run function mm:lobby/menu/common/close_menu {tag:"mm_npc_game"}

$loot replace entity @s container.$(slot) loot mm:menu/game/map_select/map
$data modify entity @s Items[{Slot:$(slot)b}].components."minecraft:custom_name" set value {"text":"$(map_name)","color":"green","italic": false}
$data modify entity @s Items[{Slot:$(slot)b}].components."minecraft:custom_data".Map$(index) set value 1
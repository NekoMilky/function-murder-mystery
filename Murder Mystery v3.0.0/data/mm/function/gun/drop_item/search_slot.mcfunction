#查找空槽位
$scoreboard players set this_empty mm_main $(empty)
scoreboard players set find_slot mm_main 0

$execute if score this_empty mm_main matches 0 if items entity @s container.$(slot) *[minecraft:custom_data~{Gun:1,type:"$(type)"}] run tag @s add mm_replace
$execute if score this_empty mm_main matches 1 unless items entity @s container.$(slot) * run tag @s add mm_replace

$execute as @s[tag=mm_replace] at @s run item replace entity @s container.$(slot) from entity @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{Gun:1,type:"$(type)"}}}}] contents
execute as @s[tag=mm_replace] run function mm:gun/update_status/main
execute as @s[tag=mm_replace] run scoreboard players set find_slot mm_main 1

execute as @s[tag=mm_replace] run tag @s remove mm_replace
execute if score find_slot mm_main matches 1 run return 0

#递归
$scoreboard players set this_slot mm_main $(slot)
scoreboard players add this_slot mm_main 1

$data modify storage mm:main temporary.empty set value $(empty)
$data modify storage mm:main temporary.type set value "$(type)"
execute store result storage mm:main temporary.slot int 1 run scoreboard players get this_slot mm_main

execute if score this_slot mm_main matches ..35 run function mm:gun/drop_item/search_slot with storage mm:main temporary
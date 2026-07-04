#丢枪
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Gun:1}}}}] run function mm:gun/drop_item/main

#状态更新
execute as @a[tag=!mm_gun_update_passed] run function mm:gun/update_status/main

#经验条
execute as @a unless items entity @s weapon.mainhand *[minecraft:custom_data~{Gun:1}] run function mm:gun/experience_bar/set {ammo:0,progress:0}
execute as @a if items entity @s weapon.mainhand *[minecraft:custom_data~{Gun:1}] run function mm:gun/experience_bar/main with entity @s SelectedItem.components."minecraft:custom_data"

#射击
execute as @a[tag=mm_right_click] if items entity @s weapon.mainhand *[minecraft:custom_data~{Gun:1}] run function mm:gun/shoot/main
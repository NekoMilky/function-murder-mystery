tag @s add mm_gun_update_passed

#每把枪更新
execute if items entity @s container.* *[minecraft:custom_data~{Gun:1,type:"pistol"}] run function mm:gun/update_status/every_gun/main with entity @s Inventory[{components:{"minecraft:custom_data":{Gun:1,type:"pistol"}}}].components."minecraft:custom_data"
execute if items entity @s container.* *[minecraft:custom_data~{Gun:1,type:"rifle"}] run function mm:gun/update_status/every_gun/main with entity @s Inventory[{components:{"minecraft:custom_data":{Gun:1,type:"rifle"}}}].components."minecraft:custom_data"
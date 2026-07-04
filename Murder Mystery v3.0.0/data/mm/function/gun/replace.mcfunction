loot replace entity @s container.35 loot mm:name

$execute unless items entity @s container.* *[minecraft:custom_data~{Gun:1,type:"$(type)"}] run loot replace entity @s container.$(slot) loot mm:gun/$(type)

$execute if items entity @s container.$(slot) *[minecraft:custom_data~{Gun:1,type:"$(type)"}] run item modify entity @s container.$(slot) mm:gun/set_owner

$execute if items entity @s container.* *[minecraft:custom_data~{Gun:1,type:"$(type)"}] run function mm:gun/init_gun_data with entity @s Inventory[{components:{"minecraft:custom_data":{Gun:1,type:"$(type)"}}}].components."minecraft:custom_data"

clear @s *[minecraft:custom_data={Name:1}]

function mm:gun/update_status/main
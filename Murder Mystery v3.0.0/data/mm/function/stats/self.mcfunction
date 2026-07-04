loot replace entity @s container.35 loot mm:name
data modify storage mm:main temporary.player_name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name".insertion
clear @s *[minecraft:custom_data={Name:1}]

function mm:stats/check with storage mm:main temporary
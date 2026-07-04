loot replace entity @s container.35 loot mm:name
data modify storage mm:main server_players append from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name".insertion
clear @s *[minecraft:custom_data={Name:1}]

scoreboard players set @s mm_joined 1
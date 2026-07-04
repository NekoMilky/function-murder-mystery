$execute if items entity @s container.* minecraft:$(id) run return run data get entity @s Inventory[{id:"minecraft:$(id)"}].count
return 0
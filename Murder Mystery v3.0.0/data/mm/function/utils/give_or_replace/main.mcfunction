$execute if items entity @s container.* minecraft:$(id) run give @s minecraft:$(id) $(count)

$execute unless items entity @s container.* minecraft:$(id) if items entity @s container.$(slot) * run give @s minecraft:$(id) $(count)

$execute unless items entity @s container.* minecraft:$(id) run item replace entity @s container.$(slot) with minecraft:$(id) $(count)
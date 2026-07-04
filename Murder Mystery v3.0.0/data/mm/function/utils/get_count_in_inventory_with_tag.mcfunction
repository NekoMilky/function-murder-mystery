$execute if items entity @s container.* *[minecraft:custom_data~{$(item_tag):1}] run return run data get entity @s Inventory[{components:{"minecraft:custom_data":{$(item_tag):1}}}].count
return 0
$scoreboard players set count_value mm_main $(count)

$execute if items entity @s container.* *[minecraft:custom_data~{$(item_tag):1}] run function mm:utils/give_or_replace/loot/search {item_tag:"$(item_tag)",loot_table:"$(loot_table)",slot:0}
$execute if items entity @s container.* *[minecraft:custom_data~{$(item_tag):1}] run return 0

$execute unless items entity @s container.* *[minecraft:custom_data~{$(item_tag):1}] if items entity @s container.$(slot) * run loot give @s loot $(loot_table)

$execute unless items entity @s container.* *[minecraft:custom_data~{$(item_tag):1}] run loot replace entity @s container.$(slot) loot $(loot_table)
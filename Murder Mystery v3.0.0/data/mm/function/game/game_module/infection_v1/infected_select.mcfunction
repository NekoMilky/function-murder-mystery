scoreboard players set #ALL mm_API 11

tag @a[limit=1,tag=mm_survivor] add mm_infected
execute as @a[tag=mm_infected] run tag @s add mm_origin
execute as @a[tag=mm_infected] run tag @s remove mm_survivor
execute as @a[tag=mm_infected] run scoreboard players set @s mm_API_p 52

title @a[tag=mm_infected] subtitle {"translate":"mm.title.infected.subtitle","color":"yellow"}
title @a[tag=mm_infected] title {"translate":"mm.title.infected","color":"red"}
execute as @a[tag=mm_infected] at @s run playsound minecraft:entity.zombie.ambient player @s ~ ~ ~ 1 1

title @a[tag=mm_survivor] subtitle {"translate":"mm.title.survivor.subtitle.infection","color":"yellow"}
title @a[tag=mm_survivor] title {"translate":"mm.title.survivor","color":"green"}
execute as @a[tag=mm_survivor] at @s run playsound minecraft:item.armor.equip_iron player @s ~ ~ ~ 1 1

execute as @a[tag=mm_infected] run loot replace entity @s hotbar.0 loot mm:knife
execute as @a[tag=mm_infected] run function mm:utils/clear_with_tag {item_tag:"SurvivorChestplate",max_count:1}
team join mm_infected @a[tag=mm_infected]
effect give @a[tag=mm_infected] blindness 3 1 true

execute as @a[tag=mm_survivor] run loot replace entity @s hotbar.0 loot mm:bow
execute as @a[tag=mm_survivor] run item replace entity @s hotbar.1 with minecraft:arrow 64 
execute as @a[tag=mm_survivor] run scoreboard players set @s mm_API_p 47
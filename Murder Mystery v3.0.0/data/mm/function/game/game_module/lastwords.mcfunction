#生成遗言
execute as @s[scores={mm_lastwords=1}] run return 0

execute at @s run loot spawn ~ ~ ~ loot mm:lastwords/title
execute at @s run loot spawn ~ ~ ~ loot mm:lastwords/text

execute at @s run summon minecraft:armor_stand ~ ~0.7 ~ {Small:1,Invisible:1,NoGravity:1,CustomNameVisible:1,Tags:["mm_lastwords","mm_title"]}
execute at @s run summon minecraft:armor_stand ~ ~0.4 ~ {Small:1,Invisible:1,NoGravity:1,CustomNameVisible:1,Tags:["mm_lastwords","mm_text"]}

execute at @s run data modify entity @n[tag=!mm_lastword_modified,tag=mm_title,tag=mm_lastwords] CustomName set from entity @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{Lastwords:1,LastwordsTitle:1}}}}] Item.components."minecraft:custom_name"
execute at @s run data modify entity @n[tag=!mm_lastword_modified,tag=mm_text,tag=mm_lastwords] CustomName set from entity @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{Lastwords:1,LastwordsText:1}}}}] Item.components."minecraft:custom_name"

execute if score customize_lastwords_display_time mm_settings matches 0 at @s run scoreboard players set @n[tag=!mm_lastword_modified,tag=mm_title,tag=mm_lastwords] mm_cd_tick 100
execute if score customize_lastwords_display_time mm_settings matches 1 at @s run scoreboard players operation @n[tag=!mm_lastword_modified,tag=mm_title,tag=mm_lastwords] mm_cd_tick = lastwords_display_time mm_settings

execute if score customize_lastwords_display_time mm_settings matches 0 at @s run scoreboard players set @n[tag=!mm_lastword_modified,tag=mm_text,tag=mm_lastwords] mm_cd_tick 100
execute if score customize_lastwords_display_time mm_settings matches 1 at @s run scoreboard players operation @n[tag=!mm_lastword_modified,tag=mm_text,tag=mm_lastwords] mm_cd_tick = lastwords_display_time mm_settings

execute at @s run tag @n[tag=!mm_lastword_modified,tag=mm_title,tag=mm_lastwords] add mm_lastword_modified
execute at @s run tag @n[tag=!mm_lastword_modified,tag=mm_text,tag=mm_lastwords] add mm_lastword_modified

execute at @s run kill @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{Lastwords:1,LastwordsTitle:1}}}}]
execute at @s run kill @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{Lastwords:1,LastwordsText:1}}}}]
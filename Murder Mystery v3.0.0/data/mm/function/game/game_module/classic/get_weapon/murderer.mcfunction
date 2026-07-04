title @a[tag=mm_murderer] subtitle {"translate":"mm.title.murderer.subtitle.throw_knife","color":"yellow","with":[{"keybind":"key.use","color":"gold"}]}
title @a[tag=mm_murderer] title ""

execute as @a[tag=mm_murderer] run loot replace entity @s hotbar.1 loot mm:knife
scoreboard players set #ALL mm_API 9

execute unless score game_mode mm_main matches 9 as @a[tag=mm_murderer] run scoreboard players set @s mm_m_chance 1
execute unless score game_mode mm_main matches 9 as @a[tag=mm_innocent,tag=!mm_detective] run scoreboard players operation @s mm_m_chance += @s mm_chance_amp
execute unless score game_mode mm_main matches 9 as @a[tag=mm_innocent,tag=!mm_detective] run scoreboard players operation @s mm_d_chance += @s mm_chance_amp
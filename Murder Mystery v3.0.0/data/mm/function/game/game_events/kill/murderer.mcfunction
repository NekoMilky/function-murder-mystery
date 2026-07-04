execute if entity @s[tag=mm_innocent] run scoreboard players set @s mm_death_type -2
execute if entity @s[tag=mm_murderer] unless score game_mode mm_main matches 9 if score murderer_friendly_fire mm_settings matches 1 run scoreboard players set @s mm_death_type 107
execute if entity @s[tag=mm_murderer] unless score game_mode mm_main matches 9 if score murderer_friendly_fire mm_settings matches 1 run scoreboard players set @s mm_API_p 97
execute if entity @s[tag=mm_murderer] unless score game_mode mm_main matches 9 if score murderer_friendly_fire mm_settings matches 2 run tag @s add mm_be_stunned
execute if entity @s[tag=mm_murderer] unless score game_mode mm_main matches 9 if score murderer_friendly_fire mm_settings matches 2 run scoreboard players set @s mm_API_p 98
execute if entity @s[tag=mm_murderer] if score game_mode mm_main matches 9 run scoreboard players set @s mm_death_type 107
execute if entity @s[tag=mm_murderer] if score game_mode mm_main matches 9 run scoreboard players set @s mm_API_p 97
advancement revoke @s only mm:kill/murderer
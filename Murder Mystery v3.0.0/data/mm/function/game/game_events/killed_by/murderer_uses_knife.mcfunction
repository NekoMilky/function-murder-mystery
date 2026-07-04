execute if entity @s[tag=mm_murderer] if score game_mode mm_main matches 9 run scoreboard players set @s mm_death_type 1
execute if entity @s[tag=mm_murderer] if score murderer_friendly_fire mm_settings matches 1 run scoreboard players set @s mm_death_type 1
execute if entity @s[tag=mm_innocent] run scoreboard players set @s mm_death_type 1
advancement revoke @s only mm:killed_by/murderer_uses_knife
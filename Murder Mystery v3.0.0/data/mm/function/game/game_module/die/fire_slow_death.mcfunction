execute as @s[tag=mm_innocent] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[tag=mm_murderer] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_death_type -1
execute as @s[tag=mm_innocent] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[tag=mm_murderer] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_API_p 84

execute as @s[tag=mm_murderer] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[tag=mm_innocent] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_death_type -2
execute as @s[tag=mm_murderer] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[tag=mm_innocent] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_API_p 84

execute as @s[tag=mm_survivor] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[predicate=mm:infected_and_alpha] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_death_type -3
execute as @s[tag=mm_survivor] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[predicate=mm:infected_and_alpha] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_API_p 84

execute as @s[predicate=mm:infected_and_alpha] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[tag=mm_survivor] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_death_type -4
execute as @s[predicate=mm:infected_and_alpha] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[tag=mm_survivor] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_API_p 84

execute as @s[predicate=mm:pvp] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[predicate=mm:pvp] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_death_type -5
execute as @s[predicate=mm:pvp] at @s if entity @e[tag=mm_torch,distance=..3] at @n[tag=mm_torch] as @a[predicate=mm:pvp] if score @s mm_players_id = @n[tag=mm_torch] mm_players_id run scoreboard players set @s mm_API_p 84

execute at @s if entity @e[tag=mm_torch,distance=..3] run scoreboard players set @s mm_death_type 14
execute at @s unless entity @e[tag=mm_torch,distance=..3] run scoreboard players set @s mm_death_type 109
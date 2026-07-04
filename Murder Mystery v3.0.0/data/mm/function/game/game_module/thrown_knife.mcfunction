#飞行
execute as @e[tag=mm_thrown_knife] at @s positioned ^0.2 ^ ^ unless block ~ ~1.3 ~ #mm:incomplete_block run kill @s
execute as @e[tag=mm_thrown_knife] at @s run tp ^ ^ ^0.3

#击中平民
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=mm_innocent] unless score @s mm_death_type matches 1.. at @s if entity @e[tag=mm_thrown_knife,dy=0] as @a[tag=mm_murderer,tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run tag @p[tag=!mm_dead,tag=!mm_will_respawn,tag=mm_innocent,dy=0] add mm_be_hit_by_thrown_knife
execute if score murderer_friendly_fire mm_settings matches 1..2 as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=mm_murderer] unless score @s mm_death_type matches 1.. at @s if entity @e[tag=mm_thrown_knife,dy=0] as @a[tag=mm_murderer,tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run tag @p[tag=!mm_dead,tag=!mm_will_respawn,tag=mm_murderer,dy=0] add mm_be_hit_by_thrown_knife

execute as @a[tag=mm_innocent,tag=mm_be_hit_by_thrown_knife] run scoreboard players set @s mm_death_type 5
execute as @a[tag=mm_innocent,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_kill_count 1
execute as @a[tag=mm_innocent,tag=mm_be_hit_by_thrown_knife] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_death_type -9
execute unless score murderer_count mm_settings matches 2.. as @a[tag=mm_detective,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"15"},{"translate":"mm.text.kill.detective.classic"}]}
execute if score murderer_count mm_settings matches 2.. as @a[tag=mm_detective,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"15"},{"translate":"mm.text.kill.detective.double_up"}]}
execute as @a[tag=mm_detective,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_stats_14 15
execute as @a[tag=mm_detective,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_API_p 95
execute as @a[tag=mm_innocent,tag=!mm_detective,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"10"},{"translate":"mm.text.kill.innocent"}]}
execute as @a[tag=mm_innocent,tag=!mm_detective,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_stats_14 10
execute as @a[tag=mm_innocent,tag=!mm_detective,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_API_p 35
execute as @a[tag=mm_innocent,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_stats_2 1
execute as @a[tag=mm_innocent,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_stats_3 1
execute as @a[tag=mm_innocent,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_stats_5 1

#击中杀手同伙
execute as @a[tag=mm_murderer,tag=mm_be_hit_by_thrown_knife] at @s unless score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run tag @s add mm_be_hit_by_fellow_murderer

##友伤启用
execute unless score game_mode mm_main matches 9 if score murderer_friendly_fire mm_settings matches 1 as @a[tag=mm_murderer,tag=mm_be_hit_by_thrown_knife,tag=mm_be_hit_by_fellow_murderer] run scoreboard players set @s mm_death_type 5
execute unless score game_mode mm_main matches 9 if score murderer_friendly_fire mm_settings matches 1 as @a[tag=mm_murderer,tag=mm_be_hit_by_thrown_knife,tag=mm_be_hit_by_fellow_murderer] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_death_type 107
execute unless score game_mode mm_main matches 9 if score murderer_friendly_fire mm_settings matches 1 as @a[tag=mm_murderer,tag=mm_be_hit_by_thrown_knife,tag=mm_be_hit_by_fellow_murderer] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_API_p 97
execute if score game_mode mm_main matches 9 as @a[tag=mm_murderer,tag=mm_be_hit_by_thrown_knife,tag=mm_be_hit_by_fellow_murderer] run scoreboard players set @s mm_death_type 5
execute if score game_mode mm_main matches 9 as @a[tag=mm_murderer,tag=mm_be_hit_by_thrown_knife,tag=mm_be_hit_by_fellow_murderer] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_death_type 107
execute if score game_mode mm_main matches 9 as @a[tag=mm_murderer,tag=mm_be_hit_by_thrown_knife,tag=mm_be_hit_by_fellow_murderer] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_API_p 97

##击晕启用
execute unless score game_mode mm_main matches 9 if score murderer_friendly_fire mm_settings matches 2 as @a[tag=mm_murderer,tag=mm_be_hit_by_thrown_knife,tag=mm_be_hit_by_fellow_murderer] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run tag @s[scores={mm_stun_tick=-1}] add mm_be_stunned
execute unless score game_mode mm_main matches 9 if score murderer_friendly_fire mm_settings matches 2 as @a[tag=mm_murderer,tag=mm_be_hit_by_thrown_knife,tag=mm_be_hit_by_fellow_murderer] at @s as @a[tag=mm_murderer] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s[scores={mm_stun_tick=-1}] mm_API_p 98

execute as @a[tag=mm_be_hit_by_thrown_knife] run tag @s remove mm_be_hit_by_fellow_murderer

#击中幸存者
execute if score game_mode mm_main matches 6 as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=mm_survivor] unless score @s mm_death_type matches 1.. at @s if entity @e[tag=mm_thrown_knife,dy=0] run tag @s add mm_be_hit_by_thrown_knife
execute unless score game_mode mm_main matches 6 as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=mm_survivor] unless score @s mm_death_type matches 1.. at @s if entity @e[tag=mm_thrown_knife,dy=0] as @a[predicate=mm:infected_and_alpha,tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run tag @p[tag=!mm_dead,tag=!mm_will_respawn,tag=mm_survivor,dy=0] add mm_be_hit_by_thrown_knife

execute as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife] run scoreboard players set @s mm_death_type 7
execute unless score game_mode mm_main matches 6 as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife] at @s run playsound minecraft:entity.zombie.attack_iron_door player @s ~ ~ ~ 0.7 1
execute as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[predicate=mm:infected_and_alpha] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_kill_count 1
execute as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife] at @s as @a[predicate=mm:infected_and_alpha] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_death_type -9
execute as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[predicate=mm:infected_and_alpha] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"10"},{"translate":"mm.text.kill.survivor"}]}
execute as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[predicate=mm:infected_and_alpha] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_stats_10 1
execute as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[predicate=mm:infected_and_alpha] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_stats_14 10
execute as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[predicate=mm:infected_and_alpha] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id at @s run playsound minecraft:entity.zombie.attack_iron_door player @s ~ ~ ~ 0.7 1
execute as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_alpha] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_API_p 58
execute as @a[tag=mm_survivor,tag=mm_be_hit_by_thrown_knife,scores={mm_life=0}] at @s as @a[tag=mm_infected] if score @n[tag=mm_thrown_knife,dy=0] mm_players_id = @s mm_players_id run scoreboard players add @s mm_API_p 53

execute as @a[tag=mm_be_hit_by_thrown_knife] run tag @s remove mm_be_hit_by_thrown_knife
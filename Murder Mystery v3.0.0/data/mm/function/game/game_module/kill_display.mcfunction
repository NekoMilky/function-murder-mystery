#死亡契约重置
execute as @s[scores={mm_de_con_tick=0..}] run tag @s add mm_complete_de_con

#击杀
execute unless score murderer_count mm_settings matches 2.. as @s[scores={mm_death_type=-1}] if entity @a[tag=mm_detective,scores={mm_death_type=1..}] run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"15"},{"translate":"mm.text.kill.detective.classic"}]}
execute if score murderer_count mm_settings matches 2.. as @s[scores={mm_death_type=-1}] if entity @a[tag=mm_detective,scores={mm_death_type=1..}] run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"15"},{"translate":"mm.text.kill.detective.double_up"}]}
execute as @s[scores={mm_death_type=-1}] if entity @a[tag=mm_detective,scores={mm_death_type=1..}] run scoreboard players add @s mm_stats_14 15
execute as @s[scores={mm_death_type=-1}] if entity @a[tag=mm_detective,scores={mm_death_type=1..}] run scoreboard players set @s mm_API_p 95
execute as @s[scores={mm_death_type=-1}] unless entity @a[tag=mm_detective,scores={mm_death_type=1..}] run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"10"},{"translate":"mm.text.kill.innocent"}]}
execute as @s[scores={mm_death_type=-1}] unless entity @a[tag=mm_detective,scores={mm_death_type=1..}] run scoreboard players add @s mm_stats_14 10
execute as @s[scores={mm_death_type=-1}] unless entity @a[tag=mm_detective,scores={mm_death_type=1..}] run scoreboard players add @s mm_API_p 35
execute as @s[scores={mm_death_type=-1}] run scoreboard players add @s mm_kill_count 1
execute as @s[scores={mm_death_type=-1}] run scoreboard players add @s mm_stats_2 1
execute as @s[scores={mm_death_type=-1}] run scoreboard players add @s mm_stats_3 1
execute as @s[scores={mm_death_type=-1}] run scoreboard players add @s mm_stats_4 1

execute unless score murderer_count mm_settings matches 2.. as @s[scores={mm_death_type=-2}] run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"15"},{"translate":"mm.text.kill.murderer.classic"}]}
execute if score murderer_count mm_settings matches 2.. as @s[scores={mm_death_type=-2}] run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"15"},{"translate":"mm.text.kill.murderer.double_up"}]}
execute as @s[scores={mm_death_type=-2}] run scoreboard players add @s mm_kill_count 1
execute as @s[scores={mm_death_type=-2}] run scoreboard players add @s mm_stats_2 1
execute as @s[scores={mm_death_type=-2}] run scoreboard players add @s mm_stats_12 1
execute as @s[scores={mm_death_type=-2}] run scoreboard players add @s mm_stats_14 15
execute as @s[tag=mm_detective,scores={mm_death_type=-2}] run scoreboard players set @s mm_API_p 40
execute as @s[tag=!mm_detective,scores={mm_death_type=-2}] run scoreboard players set @s mm_API_p 43
execute as @s[scores={mm_death_type=-2},tag=!mm_origin,tag=!mm_hero] run tag @s add mm_new_hero
execute as @s[scores={mm_death_type=-2},tag=mm_new_hero] run loot replace entity @s container.35 loot mm:name
execute as @s[scores={mm_death_type=-2},tag=mm_new_hero] if entity @a[tag=mm_murderer,tag=mm_victim,scores={mm_death_type=1..}] at @s run scoreboard players operation @s mm_hero_id = @p[tag=mm_murderer,tag=mm_victim,scores={mm_death_type=1..}] mm_spe_id
execute as @s[scores={mm_death_type=-2,mm_hero_id=1},tag=mm_new_hero] run data modify storage mm:main game.Hero1 set value {Name:'',Checked:1}
execute as @s[scores={mm_death_type=-2,mm_hero_id=1},tag=mm_new_hero] run data modify storage mm:main game.Hero1.Name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name"
execute as @s[scores={mm_death_type=-2,mm_hero_id=2},tag=mm_new_hero] run data modify storage mm:main game.Hero2 set value {Name:'',Checked:1}
execute as @s[scores={mm_death_type=-2,mm_hero_id=2},tag=mm_new_hero] run data modify storage mm:main game.Hero2.Name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name"
execute as @s[scores={mm_death_type=-2},tag=mm_new_hero] run clear @s barrier[minecraft:custom_data={Name:1}]
execute as @s[scores={mm_death_type=-2},tag=mm_new_hero] run tag @s add mm_hero
execute as @s[scores={mm_death_type=-2},tag=mm_new_hero] run tag @s remove mm_new_hero

execute as @s[scores={mm_death_type=-3}] run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"10"},{"translate":"mm.text.kill.survivor"}]}
execute unless score game_mode mm_main matches 6 as @s[scores={mm_death_type=-3}] at @s run playsound minecraft:entity.zombie.attack_iron_door player @s ~ ~ ~ 0.7 1
execute as @s[scores={mm_death_type=-3}] run scoreboard players add @s mm_kill_count 1
execute as @s[scores={mm_death_type=-3}] run scoreboard players add @s mm_stats_10 1
execute as @s[scores={mm_death_type=-3}] run scoreboard players add @s mm_stats_14 10
execute as @s[tag=mm_alpha,scores={mm_death_type=-3}] run scoreboard players set @s mm_API_p 58
execute as @s[tag=mm_infected,scores={mm_death_type=-3}] run scoreboard players set @s mm_API_p 53

execute as @s[scores={mm_death_type=-4}] at @s run playsound minecraft:entity.zombie.death player @s
execute as @s[scores={mm_death_type=-4}] run scoreboard players add @s mm_kill_count_s 1
execute as @s[scores={mm_death_type=-4}] run scoreboard players add @s mm_stats_11 1
execute as @s[scores={mm_death_type=-4}] run scoreboard players set @s mm_API_p 48

execute as @s[scores={mm_death_type=-5}] run scoreboard players add @s mm_kill_count 1
execute as @s[scores={mm_death_type=-5}] run scoreboard players set @s mm_API_p 62

execute as @s[scores={mm_death_type=-6}] run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"5"},{"translate":"mm.text.kill.ghost"}]}
execute as @s[scores={mm_death_type=-6}] run scoreboard players add @s mm_kill_count_s 1
execute as @s[scores={mm_death_type=-6}] run scoreboard players add @s mm_stats_11 1
execute as @s[scores={mm_death_type=-6}] run scoreboard players add @s mm_stats_14 5
execute as @s[scores={mm_death_type=-6}] run scoreboard players set @s mm_API_p 48
execute as @s[scores={mm_death_type=-6}] at @s run playsound minecraft:entity.ghast.hurt player @s

execute as @s[scores={mm_death_type=-7}] run tellraw @s {"translate":"mm.text.add_point","color":"gold","with":[{"text":"10"},{"translate":"mm.text.kill.player_ghost","with":[{"score":{"objective":"mm_life","name":"@s"},"color":"yellow"}]}]}
execute as @s[scores={mm_death_type=-7}] run scoreboard players add @s mm_kill_count_s 1
execute as @s[scores={mm_death_type=-7}] run scoreboard players add @s mm_stats_11 1
execute as @s[scores={mm_death_type=-7}] run scoreboard players add @s mm_stats_14 10
execute as @s[scores={mm_death_type=-7}] run scoreboard players set @s mm_API_p 48
execute as @s[scores={mm_death_type=-7}] at @s run playsound minecraft:entity.ghast.hurt player @s
execute as @s[scores={mm_death_type=-7}] run scoreboard players add @s mm_life 1

execute as @s[scores={mm_death_type=-8}] run scoreboard players add @s mm_kill_count 1
execute as @s[scores={mm_death_type=-8}] run scoreboard players set @s mm_API_p 66
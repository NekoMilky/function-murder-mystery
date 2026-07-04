#死亡
function mm:game/game_module/die/main

execute as @a[tag=mm_victim] run scoreboard players add @s mm_stats_8 1

#数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main

#杀手
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_murderer,scores={mm_death_type=1..100}] at @s run tellraw @a[tag=mm_playing,tag=!mm_murderer] {"translate":"mm.text.murderer_die.killed.public","color":"yellow","with":[{"translate":"mm.text.murderer_die.role","color":"red","bold":true},{"selector":"@s","color":"gray"}]}
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_murderer,scores={mm_death_type=1..100}] as @a[tag=mm_murderer] unless score @s mm_players_id = @a[limit=1,tag=mm_murderer,scores={mm_death_type=1..100}] mm_players_id run tellraw @s {"translate":"mm.text.murderer_die.killed.group","color":"yellow","with":[{"selector":"@s","color":"gray"}]}

execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_murderer,scores={mm_death_type=101..}] at @s run tellraw @a[tag=mm_playing,tag=!mm_murderer] {"translate":"mm.text.murderer_die.accident.public","color":"yellow","with":[{"translate":"mm.text.murderer_die.role","color":"red","bold":true},{"selector":"@s","color":"gray"}]}
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_murderer,scores={mm_death_type=101..}] as @a[tag=mm_murderer] unless score @s mm_players_id = @a[limit=1,tag=mm_murderer,scores={mm_death_type=101..}] mm_players_id run tellraw @s {"translate":"mm.text.murderer_die.accident.group","color":"yellow","with":[{"selector":"@s","color":"gray"}]}

execute if score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_murderer,scores={mm_death_type=1..}] as @a[tag=mm_murderer] unless score @s mm_players_id = @a[limit=1,tag=mm_murderer,scores={mm_death_type=1..}] mm_players_id run scoreboard players set @s mm_API_p 71

#侦探
execute unless score game_mode mm_main matches 9 unless score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_detective,tag=mm_origin] at @s run tellraw @a[tag=mm_playing,tag=!mm_victim] {"translate":"mm.text.detective_killed.classic","color":"gold"}
execute unless score game_mode mm_main matches 9 unless score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_detective,tag=mm_origin] at @s run title @a[tag=mm_playing,tag=!mm_victim] subtitle {"translate":"mm.title.detective_killed.subtitle.classic","color":"gold"}
execute unless score game_mode mm_main matches 9 unless score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_detective,tag=!mm_origin] at @s run tellraw @a[tag=mm_playing,tag=!mm_victim] {"translate":"mm.text.bow_dropped.classic","color":"gold"}
execute unless score game_mode mm_main matches 9 unless score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_detective,tag=!mm_origin] at @s run title @a[tag=mm_playing,tag=!mm_victim] subtitle {"translate":"mm.title.bow_dropped.subtitle.classic","color":"gold"}

execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_detective,tag=mm_origin] at @s run tellraw @a[tag=mm_playing,tag=!mm_victim] {"translate":"mm.text.detective_killed.double_up","color":"gold"}
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_detective,tag=mm_origin] at @s run title @a[tag=mm_playing,tag=!mm_victim] subtitle {"translate":"mm.title.detective_killed.subtitle.double_up","color":"gold"}
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_detective,tag=!mm_origin] at @s run tellraw @a[tag=mm_playing,tag=!mm_victim] {"translate":"mm.text.bow_dropped.double_up","color":"gold"}
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. as @a[tag=mm_victim,tag=mm_detective,tag=!mm_origin] at @s run title @a[tag=mm_playing,tag=!mm_victim] subtitle {"translate":"mm.title.bow_dropped.subtitle.double_up","color":"gold"}

execute unless score game_mode mm_main matches 9 as @a[tag=mm_victim,tag=mm_detective] at @s run title @a[tag=mm_playing,tag=!mm_victim] title ""

execute unless score game_mode mm_main matches 9 as @a[tag=mm_victim,tag=mm_detective] run tag @s add mm_dangerous_death
execute unless score game_mode mm_main matches 9 as @a[tag=mm_victim,tag=mm_detective] unless score @s mm_death_type matches 101.. unless entity @s[tag=mm_using_features] unless entity @s[scores={mm_safe_tick=0..}] run tag @s remove mm_dangerous_death

execute unless score game_mode mm_main matches 9 as @a[tag=mm_victim,tag=mm_detective] at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,ShowArms:1,NoGravity:1,equipment:{mainhand:{id:"minecraft:bow",count:1}},Pose:{RightArm:[225f,-90f,0f]},DisabledSlots:7967,Tags:["mm_dropped_bow","mm_new"]}
execute unless score game_mode mm_main matches 9 as @a[tag=mm_victim,tag=mm_detective] at @s run scoreboard players operation @n[tag=mm_dropped_bow,tag=mm_new] mm_spe_id = @s mm_spe_id
execute unless score game_mode mm_main matches 9 as @a[tag=mm_victim,tag=mm_detective,tag=mm_dangerous_death] at @s as @n[tag=mm_dropped_bow,tag=mm_new] run function mm:utils/teleport_to_spawn_center/main
execute unless score game_mode mm_main matches 9 as @a[tag=mm_victim,tag=mm_detective] at @s run tag @n[tag=mm_dropped_bow,tag=mm_new] remove mm_new

execute unless score game_mode mm_main matches 9 as @a[tag=mm_victim,tag=mm_detective,tag=mm_dangerous_death] run tag @s remove mm_dangerous_death

#遗言
execute as @a[tag=mm_victim] run function mm:game/game_module/lastwords

#亡语
execute as @a[tag=mm_victim] run function mm:game/game_module/death_cry

#遗体
execute as @a[tag=mm_victim] run function mm:game/game_module/dead_body/main

execute as @a[tag=mm_victim] run effect give @s blindness 3 1 true
execute as @a[tag=mm_victim] run tag @s add mm_dead

#接口
execute as @a[tag=mm_victim,tag=mm_murderer] run scoreboard players set @s mm_API_p 37
execute as @a[tag=mm_victim,tag=mm_detective] run scoreboard players set @s mm_API_p 41
execute as @a[tag=mm_victim,tag=mm_innocent,tag=!mm_detective] run scoreboard players set @s mm_API_p 45

#数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main
execute as @a[tag=mm_victim] run function mm:game/game_module/projectile/remove

#死亡音效
execute as @a[tag=mm_victim,scores={mm_death_type=1..100}] as @a[tag=mm_playing] at @s run playsound minecraft:entity.player.death player @s ~ ~ ~ 1 1
execute as @a[tag=mm_victim,scores={mm_death_type=101..}] as @a[tag=mm_playing] at @s run playsound minecraft:entity.skeleton.death player @s ~ ~ ~ 1 1
execute unless score game_mode mm_main matches 9 if score murderer_left mm_data matches 1.. as @a[tag=mm_murderer,tag=mm_victim,scores={mm_death_type=1..}] as @a[tag=mm_playing] at @s run playsound minecraft:entity.zombie.attack_iron_door player @s ~ ~ ~ 0.7 0
execute as @a[tag=mm_innocent,tag=mm_victim,scores={mm_death_type=4}] as @a[tag=mm_playing] at @s run playsound minecraft:entity.villager.death player @s ~ ~ ~ 1 1

execute as @a[tag=mm_victim] run tag @s remove mm_victim

execute as @a[scores={mm_death_type=1..}] run scoreboard players set @s mm_death_type 0
execute as @a[scores={mm_death_type=..-1}] run scoreboard players set @s mm_death_type 0
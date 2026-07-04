#死亡
function mm:game/game_module/die/main
execute as @a[tag=mm_victim] run scoreboard players set @s mm_API_p 50

execute as @a[tag=mm_victim] run scoreboard players add @s mm_stats_8 1

##数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main

##三分之一概率生成玩家恶灵
execute as @a[tag=mm_victim] store result score random_count mm_main run function mm:utils/random_count {max:3}
execute as @a[tag=mm_victim] at @s if score random_count mm_main matches 0 run tag @s add mm_spawn_player_ghost

execute as @a[tag=mm_spawn_player_ghost] at @s run summon minecraft:skeleton ~ ~ ~ {equipment:{mainhand:{id:"minecraft:bow"}},attributes:[{id:"follow_range",base:64.0}],PersistenceRequired:1b,Health:0.1f,Tags:["mm_ghost","mm_player_ghost"]}
execute as @a[tag=mm_spawn_player_ghost] at @s run loot replace entity @n[tag=mm_ghost,tag=mm_player_ghost] armor.head loot mm:player_head
execute as @a[tag=mm_spawn_player_ghost] at @s run loot replace entity @n[tag=mm_ghost,tag=mm_player_ghost] armor.chest loot mm:chestplate

execute as @a[tag=mm_spawn_player_ghost] run tag @s remove mm_spawn_player_ghost

##计算生存时间
execute as @a[tag=mm_victim] run scoreboard players operation @s mm_survive_time = game_time mm_settings
execute as @a[tag=mm_victim] run scoreboard players operation @s mm_survive_time -= game_second mm_main

##遗言
execute as @a[tag=mm_victim] run function mm:game/game_module/lastwords

##亡语
execute as @a[tag=mm_victim] run function mm:game/game_module/death_cry

##遗体
execute as @a[tag=mm_victim] run function mm:game/game_module/dead_body/main

execute as @a[tag=mm_victim] run effect give @s blindness 3 1 true
execute as @a[tag=mm_victim] run tag @s add mm_dead
execute as @a[tag=mm_victim,scores={mm_death_type=1..100}] as @a[tag=mm_playing] at @s run playsound minecraft:entity.player.death player @s ~ ~ ~ 1 1
execute as @a[tag=mm_victim,scores={mm_death_type=101..}] as @a[tag=mm_playing] at @s run playsound minecraft:entity.skeleton.death player @s ~ ~ ~ 1 1

##数据运算
execute if entity @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main
execute as @a[tag=mm_victim] run function mm:game/game_module/projectile/remove

execute as @a[tag=mm_victim] run tag @s remove mm_victim

execute as @a[scores={mm_death_type=1..}] run scoreboard players set @s mm_death_type 0
execute as @a[scores={mm_death_type=..-1}] run scoreboard players set @s mm_death_type 0
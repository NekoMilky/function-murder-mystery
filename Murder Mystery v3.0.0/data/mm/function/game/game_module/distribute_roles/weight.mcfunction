#计算总权重
scoreboard players set total_chance mm_main 0
$scoreboard players operation total_chance mm_main += @a[tag=mm_playing,tag=!mm_spectator,$(filter)] mm_$(type)_chance

#为每位玩家分配权重域
scoreboard objectives add mm_chance_lower dummy
scoreboard objectives add mm_chance_higher dummy

scoreboard players set current_lower mm_main 1
$execute as @a[tag=mm_playing,tag=!mm_spectator,$(filter)] run function mm:game/game_module/distribute_roles/weight_range {type:$(type)}

#随机点数
execute store result storage mm:main temporary.max int 1 run scoreboard players get total_chance mm_main
execute store result score random_count mm_main run function mm:utils/random_count with storage mm:main temporary
scoreboard players add random_count mm_main 1

$execute as @a[tag=mm_playing,tag=!mm_spectator,$(filter)] if score random_count mm_main >= @s mm_chance_lower if score random_count mm_main <= @s mm_chance_higher run tag @s add $(tag)

#移除权重域计分板
scoreboard objectives remove mm_chance_lower
scoreboard objectives remove mm_chance_higher
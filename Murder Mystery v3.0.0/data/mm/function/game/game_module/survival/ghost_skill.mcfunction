#随机装饰品
execute as @e[tag=mm_ghost,tag=!mm_cosmetics,tag=!mm_player_ghost] store result storage mm:main temporary.max int 1 run scoreboard players get cosmetics_knife_skin_count mm_main
execute as @e[tag=mm_ghost,tag=!mm_cosmetics,tag=!mm_player_ghost] store result score @s mm_knife_skin run function mm:utils/random_count with storage mm:main temporary
execute as @e[tag=mm_ghost,tag=!mm_cosmetics,tag=!mm_player_ghost] run scoreboard players add @s mm_knife_skin 1

execute as @e[tag=mm_ghost,tag=!mm_cosmetics] store result storage mm:main temporary.max int 1 run scoreboard players get cosmetics_projectile_count mm_main
execute as @e[tag=mm_ghost,tag=!mm_cosmetics] store result score @s mm_projectile run function mm:utils/random_count with storage mm:main temporary
execute as @e[tag=mm_ghost,tag=!mm_cosmetics] run scoreboard players add @s mm_projectile 1

execute as @e[tag=mm_ghost,tag=!mm_cosmetics,tag=!mm_player_ghost] run loot replace entity @s weapon.mainhand loot mm:knife
execute as @e[tag=mm_ghost,tag=!mm_cosmetics] run tag @s add mm_cosmetics

#状态效果
execute if score timer mm_main matches 0 run effect give @e[tag=mm_ghost] invisibility 1 0 true
execute if score timer mm_main matches 0 if score game_second mm_main matches 61.. run effect give @e[tag=mm_ghost] speed 1 1 true
execute if score timer mm_main matches 0 if score game_second mm_main matches ..60 run effect give @e[tag=mm_ghost] speed 1 2 true

#投掷飞刀
execute as @e[tag=mm_ghost,tag=!mm_player_ghost] unless score @s mm_cd_tick matches -1.. run scoreboard players set @s mm_cd_tick 100
execute as @e[tag=mm_ghost,tag=!mm_player_ghost,predicate=mm:targeted_player,scores={mm_cd_tick=0..}] run scoreboard players remove @s mm_cd_tick 1

execute as @e[tag=mm_ghost,scores={mm_cd_tick=0}] run tag @s add mm_throwing

execute as @e[tag=mm_throwing] at @s run tp @s ~ ~ ~ facing entity @p[tag=mm_survivor,tag=!mm_dead]
execute as @e[tag=mm_throwing] run function mm:game/game_module/throw_knife/summon
execute as @e[tag=mm_throwing] run scoreboard players set @s mm_cd_tick 100

execute as @e[tag=mm_throwing] run tag @s remove mm_throwing
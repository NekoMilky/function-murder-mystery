#计时
execute unless score gold_ingot_spawn_tick mm_main matches 1..100 run scoreboard players set gold_ingot_spawn_tick mm_main 100
execute if score gold_ingot_spawn_tick mm_main matches 1..100 run scoreboard players remove gold_ingot_spawn_tick mm_main 1

#生成金锭
execute if score gold_ingot_spawn_tick mm_main matches 0 run function mm:game/game_module/gold_ingot/spawn {index:0}

#捡起金锭
execute as @a[tag=mm_playing,tag=!mm_dead,tag=!mm_spectator] at @s if entity @e[type=item,distance=..1.5,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}}] run function mm:game/game_module/gold_ingot/pick_up
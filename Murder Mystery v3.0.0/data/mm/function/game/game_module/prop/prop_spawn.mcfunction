#计时与状态效果
##道具生成计时
execute unless score prop_spawn_tick mm_main matches 1..300 run scoreboard players set prop_spawn_tick mm_main 300
execute if score prop_spawn_tick mm_main matches 1..300 run scoreboard players remove prop_spawn_tick mm_main 1

##冻结全场
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_froze_tick=0..}] at @s run tp @n[tag=mm_froze_teleporter]
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_froze_tick=0}] run tellraw @s {"translate":"mm.text.prop.expired","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.6","color":"blue","bold":true}]}
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_froze_tick=0}] at @s run kill @n[tag=mm_froze_teleporter]
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_froze_tick=0..}] run scoreboard players remove @s mm_froze_tick 1

##死亡契约
execute as @a[tag=!mm_dead,tag=!mm_spectator,tag=mm_complete_de_con] run tellraw @s {"translate":"mm.text.prop.10.complete","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.10","color":"dark_purple","bold":true}]}
execute as @a[tag=!mm_dead,tag=!mm_spectator,tag=mm_complete_de_con] run effect give @s speed 10 2 true
execute as @a[tag=!mm_dead,tag=!mm_spectator,tag=mm_complete_de_con] run scoreboard players set @s mm_de_con_tick -1
execute as @a[tag=!mm_dead,tag=!mm_spectator,tag=mm_complete_de_con] run tag @s remove mm_complete_de_con
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_de_con_tick=0}] run tellraw @s {"translate":"mm.text.prop.10.failed","color":"red","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.10","color":"dark_purple","bold":true}]}
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_de_con_tick=0}] run scoreboard players set @s mm_death_type 108
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_de_con_tick=0..}] run scoreboard players remove @s mm_de_con_tick 1

##安全之地
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_safe_tick=0}] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_safe_tick=0}] run tellraw @s {"translate":"mm.text.prop.expired","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.9","color":"dark_purple","bold":true}]}
execute as @a[tag=!mm_dead,tag=!mm_spectator,scores={mm_safe_tick=0..}] run scoreboard players remove @s mm_safe_tick 1

#道具旋转
execute as @e[tag=mm_prop] at @s run tp @s ~ ~ ~ ~4 ~

#生成道具
execute if score prop_spawn_tick mm_main matches 0 run function mm:game/game_module/prop/prop_spawn_call {index:0}

#随机道具功能
execute as @e[tag=mm_prop,tag=!mm_typed] run function mm:game/game_module/prop/type/main {weights:[10,10,5,5,5,5,3,3,3,3,1,1]}

#触发道具
execute as @a[tag=mm_playing,tag=!mm_dead,tag=!mm_spectator] at @s if entity @e[tag=mm_prop,dy=0] run tag @s add mm_triggered_prop

execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=1}] run function mm:game/game_module/prop/effect/die
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=2}] run function mm:game/game_module/prop/effect/gold_ingot
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=3}] run function mm:game/game_module/prop/effect/time_machine
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=4}] run function mm:game/game_module/prop/effect/random_effect/main
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=5}] run function mm:game/game_module/prop/effect/switch_position
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=6}] run function mm:game/game_module/prop/effect/froze_everyone
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=7}] run function mm:game/game_module/prop/effect/arrow_conversion
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=8}] run function mm:game/game_module/prop/effect/random_teleport
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=9}] run function mm:game/game_module/prop/effect/safe_place
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=10}] run function mm:game/game_module/prop/effect/death_contract
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=11}] run function mm:game/game_module/prop/effect/random_prop
execute as @a[tag=mm_triggered_prop] at @s if entity @e[tag=mm_prop,dy=0,scores={mm_players_id=12}] run function mm:game/game_module/prop/effect/revive_player

execute as @a[tag=mm_triggered_prop] at @s run kill @e[tag=mm_prop,dy=0]
execute as @a[tag=mm_triggered_prop] run scoreboard players set @s mm_API_p 68
execute as @a[tag=mm_triggered_prop] run tag @s remove mm_triggered_prop
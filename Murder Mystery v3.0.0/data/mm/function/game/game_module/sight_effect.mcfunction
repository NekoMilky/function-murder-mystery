#杀手同伙绿色光效
execute unless score game_mode mm_main matches 9 as @a[tag=!mm_dead,tag=mm_murderer] at @s run particle dust{color:[0.0,1.0,0.0],scale:1.0} ~ ~1 ~ 0.2 0.5 0.2 0 30 normal @a[tag=mm_murderer,distance=0.01..]

#感染者绿色光效
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=mm_infected] at @s run particle dust{color:[0.0,1.0,0.0],scale:1.0} ~ ~1 ~ 0.2 0.5 0.2 0 30 normal @a[tag=mm_playing,distance=0.01..]
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=mm_alpha,tag=mm_exposed] at @s run particle dust{color:[0.0,1.0,0.0],scale:1.0} ~ ~1 ~ 0.2 0.5 0.2 0 30 normal @a[tag=mm_playing,distance=0.01..]

#恶灵红色光效
execute as @e[tag=mm_ghost,tag=!mm_hidden_ghost,predicate=mm:targeted_player] at @s run particle dust{color:[1.0,0.1,0.0],scale:1.0} ~ ~1 ~ 0.2 0.5 0.2 0 30 normal @a[tag=mm_playing,distance=0.01..]

#弹射物轨迹
execute as @e[predicate=mm:projectiles] unless score @s mm_projectile matches 1.. at @s run scoreboard players operation @s mm_projectile = @p[scores={mm_projectile=1..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn] mm_projectile
execute as @e[predicate=mm:projectiles,scores={mm_projectile=2..}] run scoreboard players set @s mm_API_p 1002
execute as @e[predicate=mm:projectiles,scores={mm_projectile=2..}] run function mm:game/game_module/projectile/main

execute as @e[tag=mm_projectile_l] unless entity @s[scores={mm_cd_tick=0..}] run scoreboard players set @s mm_cd_tick 10
execute as @e[tag=mm_projectile_l,scores={mm_cd_tick=1..}] run scoreboard players remove @s mm_cd_tick 1
execute as @e[tag=mm_projectile_l,scores={mm_cd_tick=0}] run tp ~ -128 ~
execute as @e[tag=mm_projectile_l,scores={mm_cd_tick=0}] run kill @s

#npc看向最近的玩家
execute as @e[tag=mm_npc] at @s if entity @a[tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn,distance=..16] run tp @s ~ ~ ~ facing entity @p[tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn]

#矫正动态头饰位置
execute if score timer mm_main matches 0 as @a[scores={mm_head=2..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator] run clear @s *[minecraft:custom_data~{Head:1}]
execute if score timer mm_main matches 0 as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Head:1}}}}] run kill @s

execute as @a[scores={mm_head=2..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] if score timer_short mm_main matches 0 if score sight_effect_phase mm_main matches 1 run loot replace entity @s armor.head loot mm:head/1
execute as @a[scores={mm_head=2..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] if score timer_short mm_main matches 0 if score sight_effect_phase mm_main matches 2 run loot replace entity @s armor.head loot mm:head/2
execute as @a[scores={mm_head=2..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] if score timer_short mm_main matches 0 if score sight_effect_phase mm_main matches 3 run loot replace entity @s armor.head loot mm:head/3
execute as @a[scores={mm_head=2..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] if score timer_short mm_main matches 0 if score sight_effect_phase mm_main matches 4 run loot replace entity @s armor.head loot mm:head/4
execute as @a[scores={mm_head=2..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] if score timer_short mm_main matches 0 if score sight_effect_phase mm_main matches 5 run loot replace entity @s armor.head loot mm:head/5
execute as @a[scores={mm_head=2..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] if score timer_short mm_main matches 0 if score sight_effect_phase mm_main matches 6 run loot replace entity @s armor.head loot mm:head/6
execute as @a[scores={mm_head=2..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] if score timer_short mm_main matches 0 if score sight_effect_phase mm_main matches 7 run loot replace entity @s armor.head loot mm:head/7
execute as @a[scores={mm_head=2..},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] if score timer_short mm_main matches 0 if score sight_effect_phase mm_main matches 8 run loot replace entity @s armor.head loot mm:head/8
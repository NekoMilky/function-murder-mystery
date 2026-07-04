#杀手无限飞刀
execute as @a[tag=mm_murderer,tag=!mm_dead,scores={mm_thrown_knife=0}] run scoreboard players set @s mm_thrown_knife 99999

execute unless score game_mode mm_main matches 9 run function mm:game/game_module/throw_knife/main {filter:"tag=mm_murderer",cooldown:"cooldown_normal mm_settings",cooldown_throw:"cooldown_throw mm_settings"}
execute if score game_mode mm_main matches 9 run function mm:game/game_module/throw_knife/main {filter:"tag=mm_murderer",cooldown:"boss_murderer_tick mm_settings",cooldown_throw:"boss_murderer_throw_tick mm_settings"}

#牵引遗体
execute as @a[tag=mm_murderer,tag=!mm_dead,predicate=mm:player_sneaking] at @s if entity @e[tag=mm_dead_body,distance=..0.8] if score murderer_pull_dead_body mm_settings matches 1 run tp @n[tag=mm_dead_body,distance=..0.8] @s
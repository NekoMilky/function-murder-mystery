#击杀效果
execute if entity @a[scores={mm_death_type=..-1,mm_kill_effect=2..}] run function mm:game/game_module/kill_effect

#生成遗体
execute at @s run summon mannequin ~ ~ ~ {Tags:["mm_dead_body","mm_new"],NoGravity:1,Invulnerable:true,pose:"sleeping"}
execute at @s run data modify entity @n[tag=mm_dead_body,tag=mm_new,distance=..2] Rotation[0] set from entity @s Rotation[0]
execute at @s run data modify entity @n[tag=mm_dead_body,tag=mm_new,distance=..2] profile.id set from entity @s UUID

#遗体显示时间
execute if score customize_dead_body_display_time mm_settings matches 0 at @s run scoreboard players set @n[tag=mm_dead_body,tag=mm_new,distance=..2] mm_cd_tick 100
execute if score customize_dead_body_display_time mm_settings matches 1 at @s run scoreboard players operation @n[tag=mm_dead_body,tag=mm_new,distance=..2] mm_cd_tick = dead_body_display_time mm_settings

#遗体传送
execute at @s as @n[tag=mm_dead_body,tag=mm_new,distance=..2] at @s if block ~ ~-0.1 ~ #mm:incomplete_block run function mm:game/game_module/dead_body/teleport
execute at @s run tag @n[tag=mm_dead_body,tag=mm_new,distance=..2] remove mm_new
#状态更新
function mm:game/game_module/map_features/common/main {name:"toygun",item_tag:"Toygun",fail_api:85,success_api:86}

#箭枪抵消
execute as @e[type=arrow] at @s positioned ^ ^ ^1 if entity @e[tag=mm_toygun,distance=..1.8] run tag @s add mm_toygun_offset
execute as @e[tag=mm_toygun_offset] as @a[tag=mm_playing] at @s run playsound minecraft:entity.item.break player @s ~ ~ ~ 1.25
execute as @e[tag=mm_toygun_offset] at @s positioned ^ ^ ^1 run kill @n[tag=mm_toygun]
execute as @e[tag=mm_toygun_offset] at @s run particle dust{color:[1.0,1.0,1.0],scale:1.0} ~ ~1.3 ~ 0.15 0.15 0.15 0 10 normal @a[tag=mm_playing]
execute as @e[tag=mm_toygun_offset] run kill @s

#枪剑抵消
execute as @e[tag=mm_toygun] at @s if entity @e[tag=mm_thrown_knife,distance=..1.8] run tag @s add mm_toygun_offset
execute as @e[tag=mm_toygun_offset] as @a[tag=mm_playing] at @s run playsound minecraft:entity.item.break player @s ~ ~ ~ 1.25
execute as @e[tag=mm_toygun_offset] at @s positioned ^ ^ ^1 run kill @n[tag=mm_thrown_knife]
execute as @e[tag=mm_toygun_offset] at @s run particle dust{color:[1.0,1.0,1.0],scale:1.0} ~ ~1.3 ~ 0.15 0.15 0.15 0 10 normal @a[tag=mm_playing]
execute as @e[tag=mm_toygun_offset] run kill @s

#玩具枪飞行
function mm:game/game_module/map_features/toygun/fly
function mm:game/game_module/map_features/toygun/fly

#击晕
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=0..}] run scoreboard players remove @s mm_tstun_tick 1
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=0..}] run title @s subtitle {"translate":"mm.title.toygun.stun_2","color":"yellow"}
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=0..}] run title @s title {"translate":"mm.title.toygun.stun_1","color":"red"}
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=0..}] at @s run tp @n[tag=mm_toygun_teleporter]
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=0..}] at @s run particle crit ~ ~1 ~ 0.2 0.5 0.2 0 5 force @a[tag=mm_playing]

execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=0}] run title @s subtitle ""
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=0}] run title @s title ""
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=0}] at @s run kill @n[tag=mm_toygun_teleporter]
execute as @a[tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=0}] run effect clear @s slowness
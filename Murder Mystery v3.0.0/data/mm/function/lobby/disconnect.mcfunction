#检测断线重连玩家
execute as @a unless score @s mm_online matches 1 run tag @s add mm_disconnected

execute as @a[tag=mm_disconnected,tag=mm_playing] run tag @s remove mm_playing
execute as @a[tag=mm_disconnected] unless score @s mm_joined matches 1 run function mm:lobby/first_join 
execute as @a[tag=mm_disconnected] run function mm:lobby/reset_status_player
execute as @a[tag=mm_disconnected] run function mm:utils/teleport_to_spawn_lobby

execute as @a[tag=mm_disconnected] run tag @s remove mm_disconnected

scoreboard players reset * mm_online
execute as @a run scoreboard players set @s mm_online 1
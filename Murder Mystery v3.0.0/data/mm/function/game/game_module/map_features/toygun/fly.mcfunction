#飞行
execute as @e[tag=mm_toygun] at @s positioned ^0.3 ^ ^ unless block ~ ~1.3 ~ #mm:incomplete_block run kill @s
execute as @e[tag=mm_toygun] at @s run tp ^ ^ ^0.3
execute as @e[tag=mm_toygun] run scoreboard players add @s mm_cd_tick 3
execute as @e[tag=mm_toygun,scores={mm_cd_tick=100..}] run kill @s

#击中玩家
execute as @a[tag=mm_playing,tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,scores={mm_tstun_tick=-1}] at @s if entity @e[tag=mm_toygun,dy=0] run tag @s add mm_be_hit_by_toygun

execute as @a[tag=mm_be_hit_by_toygun] at @s unless score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_API_p 99
execute as @a[tag=mm_be_hit_by_toygun] at @s unless score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id as @a[tag=mm_playing,tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator] if score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_API_p 88
execute as @a[tag=mm_be_hit_by_toygun] at @s unless score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id as @a[tag=mm_playing,tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator] if score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id at @s run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 1
execute as @a[tag=mm_be_hit_by_toygun] at @s unless score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id at @s run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 1
execute as @a[tag=mm_be_hit_by_toygun] at @s unless score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id run scoreboard players set @s mm_tstun_tick 100
execute as @a[tag=mm_be_hit_by_toygun] at @s unless score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:1,DisabledSlots:7967,Tags:["mm_toygun_teleporter"],Small:1}
execute as @a[tag=mm_be_hit_by_toygun] at @s unless score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id run data modify entity @n[tag=mm_toygun_teleporter] Rotation set from entity @s Rotation
execute as @a[tag=mm_be_hit_by_toygun] at @s unless score @n[tag=mm_toygun,dy=0] mm_players_id = @s mm_players_id run kill @n[tag=mm_toygun,dy=0]

execute as @a[tag=mm_be_hit_by_toygun] run tag @s remove mm_be_hit_by_toygun
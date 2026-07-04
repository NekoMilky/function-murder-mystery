$execute if score special_role_random mm_settings matches 1 as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players set @s mm_$(type)_chance_ds 1000
$execute if score special_role_random mm_settings matches 1 as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_ds /= playing_player_real_count mm_data
$execute if score special_role_random mm_settings matches 1 as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_ds %= 10 mm_main
$execute if score special_role_random mm_settings matches 1 as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players set @s mm_$(type)_chance_d 100
$execute if score special_role_random mm_settings matches 1 as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_d /= playing_player_real_count mm_data
execute if score special_role_random mm_settings matches 1 run return 0

$scoreboard players set total_$(type)_chance mm_data 0
$scoreboard players operation total_$(type)_chance mm_data += @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] mm_$(type)_chance
$execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_ds = @s mm_$(type)_chance
$execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_ds *= 1000 mm_main
$execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_ds /= total_$(type)_chance mm_data
$execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_ds %= 10 mm_main
$execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_d = @s mm_$(type)_chance
$execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_d *= 100 mm_main
$execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players operation @s mm_$(type)_chance_d /= total_$(type)_chance mm_data
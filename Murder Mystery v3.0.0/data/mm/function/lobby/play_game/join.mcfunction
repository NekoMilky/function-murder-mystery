execute if score game_start mm_main matches -1 run return 0

tag @s add mm_playing
function mm:scoreboard/calculate_data/main

execute if score game_start mm_main matches 0..1 run tellraw @a[tag=mm_playing] {"translate":"mm.text.player_joined","color":"yellow","with":[{"selector":"@s","color":"gray"},{"score":{"objective":"mm_data","name":"playing_player_count"},"color":"aqua"}]}
execute if score game_start mm_main matches 0..1 run function mm:utils/teleport_to_spawn_waiting/main

execute if score game_start mm_main matches 2..3 run tag @s add mm_spectator
execute if score game_start mm_main matches 2..3 run tp @a[sort=random,limit=1,tag=mm_playing,tag=!mm_dead,tag=!mm_spectator]
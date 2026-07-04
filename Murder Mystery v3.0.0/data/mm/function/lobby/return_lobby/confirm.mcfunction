tag @s remove mm_playing
function mm:lobby/reset_status_player

execute if score game_start mm_main matches 0..1 run tellraw @a[tag=mm_playing] {"translate":"mm.text.player_quit","color":"yellow","with":[{"selector":"@s","color":"gray"}]}

function mm:utils/teleport_to_spawn_lobby
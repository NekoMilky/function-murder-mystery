#计算当前最大值
$data modify storage mm:main temporary.name set from storage mm:main server_players[$(index)]
function mm:lobby/leaderboard/update_data/rank/entry with storage mm:main temporary

#递归
$scoreboard players set this_index mm_main $(index)
scoreboard players add this_index mm_main 1
$scoreboard players set player_count mm_main $(player_count)

execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main
execute if score this_index mm_main < player_count mm_main run function mm:lobby/leaderboard/update_data/rank/check_players with storage mm:main temporary
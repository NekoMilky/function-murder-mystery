#当前名次统计
$scoreboard players set this_rank mm_main $(rank)

#找出最大值玩家
scoreboard players set max_value mm_main 0
scoreboard players operation max_value mm_main > * mm_temporary

execute if score max_value mm_main matches 0 run function mm:lobby/leaderboard/update_data/rank/fill_rest with storage mm:main temporary

data modify storage mm:main temporary.index set value 0
execute unless score max_value mm_main matches 0 run function mm:lobby/leaderboard/update_data/rank/check_players with storage mm:main temporary

#递归
execute if score this_rank mm_main matches 11.. run return 0

execute store result storage mm:main temporary.rank int 1 run scoreboard players get this_rank mm_main
function mm:lobby/leaderboard/update_data/rank/main with storage mm:main temporary
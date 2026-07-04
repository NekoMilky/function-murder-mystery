#计时并更新
execute unless score leaderboard_update mm_main matches 1.. run scoreboard players set leaderboard_update mm_main 1200
scoreboard players remove leaderboard_update mm_main 1
execute if score leaderboard_update mm_main matches 0 as @e[tag=mm_leaderboard,tag=mm_body] run function mm:lobby/leaderboard/update_data/main
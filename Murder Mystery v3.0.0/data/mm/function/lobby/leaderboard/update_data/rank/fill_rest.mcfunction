data modify storage mm:main temporary.name set value "N/A"
data modify storage mm:main temporary.name_color set value "red"
data modify storage mm:main temporary.entry_value set value 0

execute if score this_rank mm_main matches 1 at @s positioned ~ ~4.2 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary
execute if score this_rank mm_main matches 2 at @s positioned ~ ~3.9 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary
execute if score this_rank mm_main matches 3 at @s positioned ~ ~3.6 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary
execute if score this_rank mm_main matches 4 at @s positioned ~ ~3.3 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary
execute if score this_rank mm_main matches 5 at @s positioned ~ ~3 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary
execute if score this_rank mm_main matches 6 at @s positioned ~ ~2.7 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary
execute if score this_rank mm_main matches 7 at @s positioned ~ ~2.4 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary
execute if score this_rank mm_main matches 8 at @s positioned ~ ~2.1 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary
execute if score this_rank mm_main matches 9 at @s positioned ~ ~1.8 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary
execute if score this_rank mm_main matches 10 at @s positioned ~ ~1.5 ~ run function mm:lobby/leaderboard/update_data/rank/modify with storage mm:main temporary

scoreboard players add this_rank mm_main 1
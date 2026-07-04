#临时计分板
scoreboard objectives add mm_temporary dummy

#数据
data modify storage mm:main temporary.handler set value "common_value"
execute as @s[scores={mm_menu=9}] run data modify storage mm:main temporary.handler set value "time"

execute store result storage mm:main temporary.player_count int 1 run function mm:utils/get_list_length_in_storage {path:"server_players",index:0}
execute store result storage mm:main temporary.stats_index int 1 run scoreboard players get @s mm_menu

#分数赋值
data modify storage mm:main temporary.index set value 0
function mm:lobby/leaderboard/update_data/set_score/main with storage mm:main temporary

#排名
data modify storage mm:main temporary.rank set value 1
function mm:lobby/leaderboard/update_data/rank/main with storage mm:main temporary

#移除临时计分板
scoreboard objectives remove mm_temporary

#修改标题
function mm:lobby/leaderboard/update_data/modify_title with storage mm:main temporary
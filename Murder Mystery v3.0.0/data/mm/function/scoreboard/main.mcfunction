#数据运算
function mm:scoreboard/calculate_data/main

#清空计分板内容
scoreboard players reset * mm_scoreboard
scoreboard players reset * mm_scoreboard_l

#大厅
function mm:scoreboard/lobby

#等待
execute if score game_start mm_main matches 0..1 run function mm:scoreboard/waiting

#经典模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 0 run function mm:scoreboard/game_mode/classic
#双倍模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 1 run function mm:scoreboard/game_mode/double_up
#感染v1模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 2 run function mm:scoreboard/game_mode/infection_v1
#对决模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 3 run function mm:scoreboard/game_mode/showdown
#人机大战模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 4 run function mm:scoreboard/game_mode/human_robot_war
#道具模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 5 run function mm:scoreboard/game_mode/classic
#生存模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 6 run function mm:scoreboard/game_mode/survival
#感染v2模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 7 run function mm:scoreboard/game_mode/infection_v2
#道具双倍模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 8 run function mm:scoreboard/game_mode/double_up
#大爹模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 9 run function mm:scoreboard/game_mode/classic
#枪械对决模式
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 10 run function mm:scoreboard/game_mode/showdown
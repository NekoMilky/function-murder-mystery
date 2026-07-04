#工具
function mm:waiting/waiting_tools/main

#无碰撞
team join mm_waiting @a[team=!mm_waiting,tag=mm_playing]

#底部标题
execute if score timer mm_main matches 0 as @a[tag=mm_playing] run function mm:waiting/actionbar_display/main

#触发前重置计时
execute if score game_start mm_main matches 0 unless score game_start_time_tick mm_main matches 20 run scoreboard players set game_start_time_tick mm_main 20
execute if score game_start mm_main matches 0 unless score game_start_time_second mm_main = game_start_wait_time mm_settings run scoreboard players operation game_start_time_second mm_main = game_start_wait_time mm_settings

#触发开始条件
execute if score game_mode mm_main matches 0 run function mm:waiting/trigger/main {min:2,max:16}
execute if score game_mode mm_main matches 1 run function mm:waiting/trigger/main {min:4,max:24}
execute if score game_mode mm_main matches 2..5 run function mm:waiting/trigger/main {min:2,max:16}
execute if score game_mode mm_main matches 6 run function mm:waiting/trigger/main {min:1,max:16}
execute if score game_mode mm_main matches 7 run function mm:waiting/trigger/main {min:2,max:16}
execute if score game_mode mm_main matches 8 run function mm:waiting/trigger/main {min:4,max:24}
execute if score game_mode mm_main matches 9 run function mm:waiting/trigger/main {min:3,max:16}
execute if score game_mode mm_main matches 10 run function mm:waiting/trigger/main {min:2,max:16}
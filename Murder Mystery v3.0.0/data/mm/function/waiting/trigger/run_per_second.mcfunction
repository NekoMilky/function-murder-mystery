#消息提示
execute if score game_start_time_second mm_main matches 30 run function mm:waiting/trigger/message {type:"plural",second:30,color:"green"}
execute if score game_start_time_second mm_main matches 20 run function mm:waiting/trigger/message {type:"plural",second:20,color:"yellow"}
execute if score game_start_time_second mm_main matches 10 run function mm:waiting/trigger/message {type:"plural",second:10,color:"gold"}
execute if score game_start_time_second mm_main matches 5 run function mm:waiting/trigger/message {type:"plural",second:5,color:"red"}
execute if score game_start_time_second mm_main matches 4 run function mm:waiting/trigger/message {type:"plural",second:4,color:"red"}
execute if score game_start_time_second mm_main matches 3 run function mm:waiting/trigger/message {type:"plural",second:3,color:"red"}
execute if score game_start_time_second mm_main matches 2 run function mm:waiting/trigger/message {type:"plural",second:2,color:"red"}
execute if score game_start_time_second mm_main matches 1 run function mm:waiting/trigger/message {type:"single",second:1,color:"red"}

#刷新计分板
function mm:scoreboard/main
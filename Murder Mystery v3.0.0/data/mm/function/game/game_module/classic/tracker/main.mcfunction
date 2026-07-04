#未追踪清除
execute as @a[tag=!mm_tracking] if items entity @s container.* *[minecraft:custom_data~{Tracker:1}] run clear @s *[minecraft:custom_data~{Tracker:1}]

execute as @a[tag=mm_tracking] run tag @s remove mm_tracking

#追踪弓
execute if score innocent_left mm_data matches ..2 if entity @e[tag=mm_dropped_bow] run function mm:game/game_module/tracker/main {type:"bow",tracker_filter:"tag=mm_innocent",target_filter:"tag=mm_dropped_bow"}
execute if score innocent_left mm_data matches 3.. if score game_second mm_main matches ..30 if entity @e[tag=mm_dropped_bow] run function mm:game/game_module/tracker/main {type:"bow",tracker_filter:"tag=mm_innocent",target_filter:"tag=mm_dropped_bow"}
execute if score innocent_left mm_data matches 3.. if score game_second mm_main matches 31.. if entity @e[tag=mm_dropped_bow] run function mm:game/game_module/tracker/main {type:"bow",tracker_filter:"tag=mm_playing",target_filter:"tag=mm_dropped_bow"}

#追踪平民
execute if score innocent_left mm_data matches 1 run effect give @a[tag=mm_murderer,tag=!mm_dead] speed infinite 0 true

execute if score track_message mm_main matches 0 if score innocent_left mm_data matches ..2 run function mm:game/game_module/classic/tracker/message
execute if score track_message mm_main matches 0 if score game_second mm_main matches ..30 run function mm:game/game_module/classic/tracker/message

execute if score innocent_left mm_data matches ..2 run function mm:game/game_module/tracker/main {type:"innocent",tracker_filter:"tag=mm_murderer",target_filter:"tag=mm_innocent"}
execute if score innocent_left mm_data matches 3.. if score game_second mm_main matches ..30 run function mm:game/game_module/tracker/main {type:"innocent",tracker_filter:"tag=mm_murderer",target_filter:"tag=mm_innocent"}
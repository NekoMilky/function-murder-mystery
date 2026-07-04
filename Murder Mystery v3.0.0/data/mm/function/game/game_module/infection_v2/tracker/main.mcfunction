#未追踪清除
execute as @a[tag=!mm_tracking] if items entity @s container.* *[minecraft:custom_data~{Tracker:1}] run clear @s *[minecraft:custom_data~{Tracker:1}]

execute as @a[tag=mm_tracking] run tag @s remove mm_tracking

#追踪幸存者
execute as @a[tag=mm_infected] run effect give @s speed infinite 0 true
execute as @a[tag=mm_infected] run effect give @s jump_boost infinite 0 true
execute as @a[tag=mm_alpha,tag=mm_exposed,tag=!mm_dead] run effect give @s speed 1 0 true
execute as @a[tag=mm_alpha,tag=mm_exposed,tag=!mm_dead] run effect give @s jump_boost 1 0 true

execute if score track_message mm_main matches 0 if score survivor_left mm_data matches ..1 run function mm:game/game_module/infection_v2/tracker/message
execute if score track_message mm_main matches 0 if score game_second mm_main matches ..30 run function mm:game/game_module/infection_v2/tracker/message

execute if score survivor_left mm_data matches ..1 run function mm:game/game_module/tracker/main {type:"survivor",tracker_filter:"predicate=mm:infected_and_alpha",target_filter:"tag=mm_survivor"}
execute if score survivor_left mm_data matches 2.. if score game_second mm_main matches ..30 run function mm:game/game_module/tracker/main {type:"survivor",tracker_filter:"predicate=mm:infected_and_alpha",target_filter:"tag=mm_survivor"}

#追踪母体/感染者
execute if score infected_tick mm_main matches 0 run function mm:game/game_module/infection_v2/tracker/expose

execute if score infected_tick mm_main matches -1 if entity @a[tag=mm_alpha,tag=!mm_dead] run function mm:game/game_module/tracker/main {type:"alpha",tracker_filter:"tag=mm_survivor",target_filter:"tag=mm_alpha"}
execute if score infected_tick mm_main matches -1 unless entity @a[tag=mm_alpha,tag=!mm_dead] if entity @a[tag=mm_infected,tag=!mm_dead] if score infected_real_left mm_data matches ..1 run function mm:game/game_module/tracker/main {type:"infected",tracker_filter:"tag=mm_survivor",target_filter:"tag=mm_infected"}
#启用
execute as @a run scoreboard players enable @s mm_game_mode

#游戏开始后拦截触发
execute if score game_start mm_main matches 2 as @a[scores={mm_game_mode=1..}] run tellraw @s {"translate":"mm.feedback.wait_for_game_ending","color":"red"}
execute if score game_start mm_main matches 2 as @a[scores={mm_game_mode=1..}] run scoreboard players reset @s mm_game_mode

#主菜单
execute as @a[scores={mm_game_mode=1}] run function mm:dialog/game_mode/main

#游戏模式
execute as @a[scores={mm_game_mode=10}] run function mm:game_mode/set {mode:0,murderer_count:1,customize_lastwords_display_time:1,customize_dead_body_display_time:1,death_cause_display:1,name:"classic",color:"green"}
execute as @a[scores={mm_game_mode=11}] run function mm:game_mode/set {mode:1,murderer_count:2,customize_lastwords_display_time:1,customize_dead_body_display_time:1,death_cause_display:1,name:"double_up",color:"green"}
execute as @a[scores={mm_game_mode=12}] run function mm:game_mode/set {mode:2,murderer_count:1,customize_lastwords_display_time:1,customize_dead_body_display_time:1,death_cause_display:0,name:"infection_v1",color:"green"}
execute as @a[scores={mm_game_mode=13}] run function mm:game_mode/set {mode:3,murderer_count:1,customize_lastwords_display_time:0,customize_dead_body_display_time:0,death_cause_display:0,name:"showdown",color:"green"}
execute as @a[scores={mm_game_mode=14}] run function mm:game_mode/set {mode:4,murderer_count:1,customize_lastwords_display_time:0,customize_dead_body_display_time:0,death_cause_display:0,name:"human_robot_war",color:"gold"}
execute as @a[scores={mm_game_mode=15}] run function mm:game_mode/set {mode:5,murderer_count:1,customize_lastwords_display_time:1,customize_dead_body_display_time:1,death_cause_display:1,name:"prop",color:"light_purple"}
execute as @a[scores={mm_game_mode=16}] run function mm:game_mode/set {mode:6,murderer_count:1,customize_lastwords_display_time:1,customize_dead_body_display_time:1,death_cause_display:1,name:"survival",color:"light_purple"}
execute as @a[scores={mm_game_mode=17}] run function mm:game_mode/set {mode:7,murderer_count:1,customize_lastwords_display_time:1,customize_dead_body_display_time:1,death_cause_display:0,name:"infection_v2",color:"green"}
execute as @a[scores={mm_game_mode=18}] run function mm:game_mode/set {mode:8,murderer_count:2,customize_lastwords_display_time:1,customize_dead_body_display_time:1,death_cause_display:1,name:"prop_double_up",color:"light_purple"}
execute as @a[scores={mm_game_mode=19}] run function mm:game_mode/set {mode:9,murderer_count:2,customize_lastwords_display_time:1,customize_dead_body_display_time:1,death_cause_display:1,name:"boss",color:"gold"}
execute as @a[scores={mm_game_mode=20}] run function mm:game_mode/set {mode:10,murderer_count:1,customize_lastwords_display_time:0,customize_dead_body_display_time:0,death_cause_display:0,name:"showdown_armed",color:"light_purple"}

#重置
execute as @a[scores={mm_game_mode=1..}] run scoreboard players reset @s mm_game_mode
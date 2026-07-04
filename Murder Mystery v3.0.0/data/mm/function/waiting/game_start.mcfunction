#传送玩家
execute as @a[tag=mm_playing] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}

#重置状态和队伍
function mm:waiting/reset_status/start

#计分项
scoreboard players set game_start mm_main 2
scoreboard players set #ALL mm_API 7

#初始化游戏时间
scoreboard players set game_tick mm_main 20
scoreboard players operation game_second mm_main = game_time mm_settings

#旁观者玩家
execute as @a[tag=mm_playing,tag=mm_choose_spectator] run tag @s add mm_spectator

#开始游戏
execute if score game_mode mm_main matches 0..1 run function mm:game/game_mode/classic/start
execute if score game_mode mm_main matches 2 run function mm:game/game_mode/infection_v1/start
execute if score game_mode mm_main matches 3 run function mm:game/game_mode/showdown/start
execute if score game_mode mm_main matches 4 run function mm:game/game_mode/human_robot_war/start
execute if score game_mode mm_main matches 5 run function mm:game/game_mode/classic/start
execute if score game_mode mm_main matches 6 run function mm:game/game_mode/survival/start
execute if score game_mode mm_main matches 7 run function mm:game/game_mode/infection_v2/start
execute if score game_mode mm_main matches 8..9 run function mm:game/game_mode/classic/start
execute if score game_mode mm_main matches 10 run function mm:game/game_mode/showdown/start
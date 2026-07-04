#菜单
function mm:lobby/menu/main

#排行榜
function mm:lobby/leaderboard/main

#断线重连
execute if score timer mm_main matches 0 run function mm:lobby/disconnect

#游戏模式
execute as @a run function mm:lobby/gamemode

#无碰撞
team join mm_lobby @e[team=!mm_lobby,tag=mm_npc_lobby]
team join mm_lobby @e[team=!mm_lobby,type=chest_minecart,tag=mm_menu]

team join mm_lobby_p @a[team=!mm_lobby_p,tag=!mm_playing]

#返回大厅触发
scoreboard players enable @a mm_quit
execute as @a[tag=!mm_playing,scores={mm_quit=1..}] run function mm:utils/teleport_to_spawn_lobby
execute as @a[tag=mm_playing,scores={mm_quit=1..}] run function mm:lobby/return_lobby/confirm
execute as @a[scores={mm_quit=1..}] run scoreboard players reset @s mm_quit

execute as @a[tag=mm_playing,scores={mm_menu=1..}] run scoreboard players remove @s mm_menu 1
execute as @a[tag=mm_playing,scores={mm_menu=0}] run function mm:lobby/return_lobby/confirm
execute as @a[scores={mm_menu=..0}] run scoreboard players reset @s mm_menu

#游戏结束切换地图
execute if score return_lobby mm_main matches 0.. run scoreboard players remove return_lobby mm_main 1
execute if score return_lobby mm_main matches 0 run function mm:waiting/reset_status/end
execute if score return_lobby mm_main matches 0 run scoreboard players set game_start mm_main 0

execute if score return_lobby mm_main matches 0 store result storage mm:main temporary.max int 1 run scoreboard players get map_count mm_main
execute if score return_lobby mm_main matches 0 store result score selected_map mm_main run function mm:utils/random_count with storage mm:main temporary
execute if score return_lobby mm_main matches 0 run function mm:common/map_correction/main
execute if score return_lobby mm_main matches 0 as @a[tag=mm_playing] run function mm:utils/teleport_to_spawn_waiting/main

#无人正在游玩
execute if score game_start mm_main matches 0.. unless entity @a[tag=mm_playing] run scoreboard players set game_start mm_main -1

#掉入虚空传回大厅传送点
execute as @a[tag=!mm_playing] at @s unless entity @s[y=-64,dy=384] run function mm:utils/teleport_to_spawn_lobby

#NPC看向玩家
execute as @e[tag=mm_npc_lobby] at @s if entity @a[tag=!mm_playing,distance=..16] run tp @s ~ ~ ~ facing entity @p[tag=!mm_playing,distance=..16]

#菜单矿车隐藏
execute as @e[type=chest_minecart,tag=mm_menu] run data modify entity @s Rotation set value [24f,24f]

#游戏NPC更新正在游玩玩家数
execute if score timer mm_main matches 0 as @e[tag=mm_npc_game,tag=mm_current_playing] run function mm:lobby/update_current_playing/main {path:"CustomName",resolve_path:"CustomName"}
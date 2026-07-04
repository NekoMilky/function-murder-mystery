execute unless score game_pause mm_main matches 0 run tellraw @a[tag=mm_playing] {"translate":"mm.text.game_pause","color":"red"}
execute unless score game_pause mm_main matches 0 run scoreboard players set game_start mm_main 0

execute unless data storage mm:main map.SpawnLobby run scoreboard players set #ALL mm_API 4
execute unless data storage mm:main map.SpawnLobby run tellraw @a[tag=mm_playing] {"translate":"mm.text.game_cancelled.spawn_lobby_loss","color":"red"}
execute unless data storage mm:main map.SpawnLobby run scoreboard players set game_start mm_main 0
execute unless data storage mm:main map.SpawnLobby run return 0

execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"SpawnWaiting"}
execute if score check_type mm_main matches 0 run scoreboard players set #ALL mm_API 4
execute if score check_type mm_main matches 0 run tellraw @a[tag=mm_playing] {"translate":"mm.text.game_cancelled.spawn_waiting_loss","color":"red"}
execute if score check_type mm_main matches 0 run scoreboard players set game_start mm_main 0
execute if score check_type mm_main matches 0 run return 0

execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"SpawnCenter"}
execute if score check_type mm_main matches 0 run scoreboard players set #ALL mm_API 4
execute if score check_type mm_main matches 0 run tellraw @a[tag=mm_playing] {"translate":"mm.text.game_cancelled.spawn_center_loss","color":"red"}
execute if score check_type mm_main matches 0 run scoreboard players set game_start mm_main 0
execute if score check_type mm_main matches 0 run return 0

execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"Spawn"}
execute if score check_type mm_main matches 0 run scoreboard players set #ALL mm_API 4
execute if score check_type mm_main matches 0 run tellraw @a[tag=mm_playing] {"translate":"mm.text.game_cancelled.spawn_loss","color":"red"}
execute if score check_type mm_main matches 0 run scoreboard players set game_start mm_main 0
execute if score check_type mm_main matches 0 run return 0

$execute unless score playing_player_real_count mm_data matches $(min)..$(max) run scoreboard players set #ALL mm_API 4
$execute unless score playing_player_real_count mm_data matches $(min)..$(max) run tellraw @a[tag=mm_playing] {"translate":"mm.text.game_cancelled.player_required","color":"red"}
$execute unless score playing_player_real_count mm_data matches $(min)..$(max) run scoreboard players set game_start mm_main 0
$execute unless score playing_player_real_count mm_data matches $(min)..$(max) run return 0

#秒函数
execute if score game_start_time_tick mm_main matches 20 run function mm:waiting/trigger/run_per_second

#计时
scoreboard players remove game_start_time_tick mm_main 1
execute if score game_start_time_tick mm_main matches 0 run scoreboard players remove game_start_time_second mm_main 1
execute if score game_start_time_tick mm_main matches 0 run scoreboard players set game_start_time_tick mm_main 20

#开始游戏
execute if score game_start_time_second mm_main matches 0 run tellraw @a[tag=mm_playing] {"translate":"mm.text.game_start","color":"yellow"}
execute if score game_start_time_second mm_main matches 0 as @a[tag=mm_playing] at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1
execute if score game_start_time_second mm_main matches 0 run function mm:waiting/game_start
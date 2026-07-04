#管理员暂停
$execute if score game_pause mm_main matches 1 run scoreboard players display name .$(line) $(objective) {"translate":"mm.title.game_paused.actionbar","color":"red"}
execute if score game_pause mm_main matches 1 run return 0

#缺失大厅传送点
$execute unless data storage mm:main map.SpawnLobby run scoreboard players display name .$(line) $(objective) {"translate":"mm.title.spawn_lobby_loss.actionbar","color":"red"}
execute unless data storage mm:main map.SpawnLobby run return 0

#缺失等待传送点
execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"SpawnWaiting"}
$execute if score check_type mm_main matches 0 run scoreboard players display name .$(line) $(objective) {"translate":"mm.title.spawn_waiting_loss.actionbar","color":"red"}
execute if score check_type mm_main matches 0 run return 0

#缺失中心传送点
execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"SpawnCenter"}
$execute if score check_type mm_main matches 0 run scoreboard players display name .$(line) $(objective) {"translate":"mm.title.spawn_center_loss.actionbar","color":"red"}
execute if score check_type mm_main matches 0 run return 0

#缺失玩家出生点/金锭生成点
execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"Spawn"}
$execute if score check_type mm_main matches 0 run scoreboard players display name .$(line) $(objective) {"translate":"mm.title.spawn_loss.actionbar","color":"red"}
execute if score check_type mm_main matches 0 run return 0

#玩家需求未满足
$execute if score game_start mm_main matches 0 run scoreboard players display name .$(line) $(objective) {"translate":"mm.scoreboard.value.waiting","color":"white"}
execute if score game_start mm_main matches 0 run return 0

#开始于
$scoreboard players display name .$(line) $(objective) {"translate":"mm.scoreboard.key.start_in","color":"white","with":[[{"score":{"name":"game_start_time_second","objective":"mm_main"},"color":"green"},{"text":"s","color":"green"}]]}
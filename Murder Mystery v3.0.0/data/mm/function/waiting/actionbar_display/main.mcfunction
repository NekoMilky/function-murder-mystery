#管理员暂停
execute if score game_pause mm_main matches 1 run title @s actionbar {"translate":"mm.title.game_paused.actionbar","color":"red"}
execute if score game_pause mm_main matches 1 run return 0

#缺失大厅传送点
execute unless data storage mm:main map.SpawnLobby run title @s actionbar {"translate":"mm.title.spawn_lobby_loss.actionbar","color":"red"}
execute unless data storage mm:main map.SpawnLobby run return 0

#缺失等待传送点
execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"SpawnWaiting"}
execute if score check_type mm_main matches 0 run title @s actionbar {"translate":"mm.title.spawn_waiting_loss.actionbar","color":"red"}
execute if score check_type mm_main matches 0 run return 0

#缺失中心传送点
execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"SpawnCenter"}
execute if score check_type mm_main matches 0 run title @s actionbar {"translate":"mm.title.spawn_center_loss.actionbar","color":"red"}
execute if score check_type mm_main matches 0 run return 0

#缺失玩家出生点/金锭生成点
execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"Spawn"}
execute if score check_type mm_main matches 0 run title @s actionbar {"translate":"mm.title.spawn_loss.actionbar","color":"red"}
execute if score check_type mm_main matches 0 run return 0

#旁观者
execute as @s[tag=mm_choose_spectator] run title @s actionbar {"translate":"mm.title.choose_spectator.actionbar","color":"gray"}
execute as @s[tag=mm_choose_spectator] run return 0

#身份几率显示
execute if score game_mode mm_main matches 0..1 run function mm:waiting/actionbar_display/murderer_and_detective
execute if score game_mode mm_main matches 5 run function mm:waiting/actionbar_display/murderer_and_detective
execute if score game_mode mm_main matches 7 run function mm:waiting/actionbar_display/alpha
execute if score game_mode mm_main matches 8 run function mm:waiting/actionbar_display/murderer_and_detective
execute if score game_mode mm_main matches 9 run function mm:waiting/actionbar_display/detective